uint64_t previewImage(category:description:file:line:)(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t result;
  unsigned __int8 v11;

  v8 = *a1;
  if (sub_22BDB0A68())
  {
    if (qword_268483C60 != -1) {
      swift_once();
    }
    v11 = v8;
    swift_retain();
    v9 = sub_22BDAC3FC(&v11, a7);
    swift_release();
    return v9;
  }
  else
  {
    result = sub_22BDC0000();
    __break(1u);
  }
  return result;
}

uint64_t sub_22BDAC3FC(unsigned __int8 *a1, unint64_t a2)
{
  uint64_t v47 = *v2;
  uint64_t v53 = sub_22BDBFD30();
  uint64_t v5 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268483CA8);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v51 = (uint64_t)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)&v46 - v11;
  uint64_t v13 = type metadata accessor for PreviewImageProvider.State.Entry();
  v52 = *(uint64_t ***)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  v50 = (id *)((char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v14);
  v17 = (id *)((char *)&v46 - v16);
  int v48 = *a1;
  char v57 = v48;
  unint64_t v49 = a2;
  uint64_t v18 = sub_22BDB1BB8();
  uint64_t v20 = v19;
  sub_22BDBFD20();
  v46 = v2;
  uint64_t v21 = v2[2];
  uint64_t v54 = v18;
  uint64_t v55 = v20;
  v56 = v7;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v21 + 24));
  sub_22BDB2C5C((uint64_t *)(v21 + 16), (uint64_t)v12);
  os_unfair_lock_unlock((os_unfair_lock_t)(v21 + 24));
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v53);
  uint64_t v22 = v13;
  v23 = v52;
  swift_bridgeObjectRelease();
  v24 = v23[6];
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v24)(v12, 1, v22) != 1)
  {
    uint64_t v38 = (uint64_t)v12;
LABEL_14:
    sub_22BDB1CF0(v38, (uint64_t)v17);
    id v42 = *v17;
    sub_22BDB1D54((uint64_t)v17);
    return (uint64_t)v42;
  }
  sub_22BDB1DB0((uint64_t)v12, &qword_268483CA8);
  char v25 = v48;
  char v57 = v48;
  unint64_t v26 = v49;
  uint64_t v27 = sub_22BDB1BB8();
  v29 = v28;
  if (v25)
  {
    v30 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
    if (!v30) {
      goto LABEL_8;
    }
    v31 = v30;
    v32 = CGBitmapContextCreate(0, 0x7D0uLL, 0x3E8uLL, 8uLL, 0x1F40uLL, v30, 0x2002u);

    if (!v32) {
      goto LABEL_8;
    }
    v33 = sub_22BDB1F40(v26);
    if (v33)
    {
      v34 = v33;
      v59.x = 2000.0;
      v59.y = 1000.0;
      v58.x = 0.0;
      v58.y = 0.0;
      CGContextDrawLinearGradient(v32, v33, v58, v59, 0);
    }
    CGImageRef Image = CGBitmapContextCreateImage(v32);

    if (!Image) {
      goto LABEL_8;
    }
  }
  else
  {
    CGImageRef v36 = sub_22BDB2100(v26);
    CGImageRef Image = v36;
    if (!v36)
    {
LABEL_8:
      uint64_t v37 = v51;
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v23[7])(v51, 1, 1, v22);
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
  }
  v52 = &v46;
  uint64_t v53 = v22;
  v39 = (os_unfair_lock_s *)v46[2];
  MEMORY[0x270FA5388](v36);
  *((unsigned char *)&v46 - 48) = 0;
  *(&v46 - 5) = (uint64_t *)Image;
  *(&v46 - 4) = (uint64_t *)v27;
  uint64_t v40 = v47;
  *(&v46 - 3) = v29;
  uint64_t v44 = v40;
  swift_retain();
  os_unfair_lock_lock(v39 + 6);
  uint64_t v41 = v51;
  sub_22BDB20E8((uint64_t)&v39[4], v51);
  uint64_t v37 = v41;
  os_unfair_lock_unlock(v39 + 6);
  swift_bridgeObjectRelease();

  uint64_t v22 = v53;
  swift_release();
LABEL_12:
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v24)(v37, 1, v22) != 1)
  {
    uint64_t v38 = v37;
    v17 = v50;
    goto LABEL_14;
  }
  sub_22BDB1DB0(v37, &qword_268483CA8);
  int v45 = 0;
  uint64_t v44 = 164;
  uint64_t result = sub_22BDC0000();
  __break(1u);
  return result;
}

uint64_t previewImage(category:description:file:line:)@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X6>, uint64_t a3@<X8>)
{
  unsigned __int8 v5 = *a1;
  if (sub_22BDB0A68())
  {
    if (qword_268483C60 != -1) {
      swift_once();
    }
    unsigned __int8 v7 = v5;
    swift_retain();
    sub_22BDACA08(&v7, a2, a3);
    return swift_release();
  }
  else
  {
    uint64_t result = sub_22BDC0000();
    __break(1u);
  }
  return result;
}

uint64_t sub_22BDACA08@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v74 = a3;
  uint64_t v63 = *v3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268483C80);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v70 = (uint64_t)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v64 = (uint64_t)&v63 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v67 = (uint64_t)&v63 - v11;
  uint64_t v12 = sub_22BDBFD30();
  v71 = *(uint64_t **)(v12 - 8);
  uint64_t v72 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268483CA8);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v69 = (uint64_t)&v63 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v63 - v18;
  uint64_t v20 = type metadata accessor for PreviewImageProvider.State.Entry();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v68 = (uint64_t)&v63 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v66 = (uint64_t)&v63 - v24;
  unsigned __int8 v25 = *a1;
  v78[0] = *a1;
  v73 = a2;
  uint64_t v26 = sub_22BDB1BB8();
  uint64_t v28 = v27;
  sub_22BDBFD20();
  v65 = v3;
  uint64_t v29 = v3[2];
  uint64_t v75 = v26;
  uint64_t v76 = v28;
  v77 = v14;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v29 + 24));
  sub_22BDB1CD0((uint64_t *)(v29 + 16), (uint64_t)v19);
  os_unfair_lock_unlock((os_unfair_lock_t)(v29 + 24));
  uint64_t v30 = v20;
  swift_release();
  ((void (*)(char *, uint64_t))v71[1])(v14, v72);
  swift_bridgeObjectRelease();
  uint64_t v31 = v21;
  v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
  if (v32(v19, 1, v20) != 1)
  {
    int v45 = v73;
    uint64_t v46 = v66;
    sub_22BDB1CF0((uint64_t)v19, v66);
    uint64_t v47 = v46 + *(int *)(v20 + 20);
    uint64_t v48 = v67;
    sub_22BDB2B74(v47, v67, &qword_268483C80);
    uint64_t v49 = sub_22BDBFCB0();
    uint64_t v50 = *(void *)(v49 - 8);
    uint64_t v51 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v50 + 48);
    if (v51(v48, 1, v49) != 1
      || (sub_22BDB1DB0(v48, &qword_268483C80),
          v78[0] = v25,
          uint64_t v48 = v64,
          sub_22BDADB44(v78, v45, v64),
          v51(v48, 1, v49) != 1))
    {
      sub_22BDB1D54(v46);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v50 + 32))(v74, v48, v49);
    }
    sub_22BDB1DB0(v48, &qword_268483C80);
    int v62 = 0;
    uint64_t v60 = 150;
    goto LABEL_22;
  }
  uint64_t v72 = 0;
  sub_22BDB1DB0((uint64_t)v19, &qword_268483CA8);
  v78[0] = v25;
  unint64_t v33 = (unint64_t)v73;
  uint64_t v34 = sub_22BDB1BB8();
  uint64_t v36 = v35;
  if (v25)
  {
    uint64_t v37 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
    if (!v37) {
      goto LABEL_8;
    }
    uint64_t v38 = v37;
    v39 = CGBitmapContextCreate(0, 0x7D0uLL, 0x3E8uLL, 8uLL, 0x1F40uLL, v37, 0x2002u);

    if (!v39) {
      goto LABEL_8;
    }
    uint64_t v40 = sub_22BDB1F40(v33);
    if (v40)
    {
      uint64_t v41 = v40;
      v80.x = 2000.0;
      v80.y = 1000.0;
      v79.x = 0.0;
      v79.y = 0.0;
      CGContextDrawLinearGradient(v39, v40, v79, v80, 0);
    }
    CGImageRef Image = CGBitmapContextCreateImage(v39);

    if (!Image) {
      goto LABEL_8;
    }
  }
  else
  {
    CGImageRef v43 = sub_22BDB2100(v33);
    CGImageRef Image = v43;
    if (!v43)
    {
LABEL_8:
      uint64_t v44 = v69;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 56))(v69, 1, 1, v30);
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
  }
  v71 = &v63;
  v73 = (unsigned char *)v30;
  uint64_t v53 = (os_unfair_lock_s *)v65[2];
  MEMORY[0x270FA5388](v43);
  *((unsigned char *)&v63 - 48) = 1;
  *(&v63 - 5) = (uint64_t)Image;
  *(&v63 - 4) = v34;
  uint64_t v54 = v63;
  *(&v63 - 3) = v36;
  uint64_t v61 = v54;
  swift_retain();
  os_unfair_lock_lock(v53 + 6);
  uint64_t v44 = v69;
  sub_22BDB20E8((uint64_t)&v53[4], v69);
  os_unfair_lock_unlock(v53 + 6);
  swift_bridgeObjectRelease();

  uint64_t v30 = (uint64_t)v73;
  swift_release();
LABEL_14:
  if (v32((char *)v44, 1, v30) == 1)
  {
    v56 = &qword_268483CA8;
LABEL_20:
    sub_22BDB1DB0(v69, v56);
    int v62 = 0;
    uint64_t v60 = 142;
LABEL_22:
    uint64_t v61 = v60;
    uint64_t result = sub_22BDC0000();
    __break(1u);
    return result;
  }
  uint64_t v55 = v68;
  sub_22BDB1CF0(v44, v68);
  v56 = &qword_268483C80;
  uint64_t v57 = v70;
  sub_22BDB2B74(v55 + *(int *)(v30 + 20), v70, &qword_268483C80);
  sub_22BDB1D54(v55);
  uint64_t v58 = sub_22BDBFCB0();
  uint64_t v59 = *(void *)(v58 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v59 + 48))(v57, 1, v58) == 1)
  {
    uint64_t v69 = v57;
    goto LABEL_20;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v59 + 32))(v74, v57, v58);
}

uint64_t sub_22BDAD174()
{
  return sub_22BDC0100();
}

uint64_t sub_22BDAD1F0()
{
  sub_22BDBFDA0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_22BDAD258()
{
  return sub_22BDC0100();
}

uint64_t sub_22BDAD2D0@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_22BDC0040();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_22BDAD330(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x726174617661;
  if (*v1) {
    uint64_t v2 = 0x6F746F6870;
  }
  unint64_t v3 = 0xE600000000000000;
  if (*v1) {
    unint64_t v3 = 0xE500000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_22BDAD368(char *a1, char *a2)
{
  return sub_22BDAD374(*a1, *a2);
}

uint64_t sub_22BDAD374(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6F746F6870;
  }
  else {
    uint64_t v3 = 0x726174617661;
  }
  if (v2) {
    unint64_t v4 = 0xE600000000000000;
  }
  else {
    unint64_t v4 = 0xE500000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x6F746F6870;
  }
  else {
    uint64_t v5 = 0x726174617661;
  }
  if (a2) {
    unint64_t v6 = 0xE500000000000000;
  }
  else {
    unint64_t v6 = 0xE600000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_22BDC0070();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void static PreviewImageCategory.avatar.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

void static PreviewImageCategory.photo.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

unint64_t sub_22BDAD428(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268483CD0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (void *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    char v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268483CB0);
  uint64_t v6 = sub_22BDC0030();
  char v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (uint64_t)v5 + *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_22BDB2B74(v12, (uint64_t)v5, &qword_268483CD0);
    uint64_t v14 = *v5;
    uint64_t v15 = v5[1];
    unint64_t result = sub_22BDAF9DC(*v5, v15);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v19 = (uint64_t *)(v7[6] + 16 * result);
    *uint64_t v19 = v14;
    v19[1] = v15;
    uint64_t v20 = v7[7];
    uint64_t v21 = type metadata accessor for PreviewImageProvider.State.Entry();
    unint64_t result = sub_22BDB1CF0(v9, v20 + *(void *)(*(void *)(v21 - 8) + 72) * v18);
    uint64_t v22 = v7[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_11;
    }
    v7[2] = v24;
    v12 += v13;
    if (!--v8)
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

void sub_22BDAD610()
{
  swift_beginAccess();
  v1 = *(void **)(v0 + 40);
  if (*(void *)(*(void *)(v0 + 16) + 16))
  {
    if (v1) {
      return;
    }
    uint64_t v2 = self;
    uint64_t v3 = swift_allocObject();
    swift_weakInit();
    aBlock[4] = sub_22BDB25C0;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22BDAD7E4;
    aBlock[3] = &block_descriptor;
    uint64_t v4 = _Block_copy(aBlock);
    swift_release();
    id v5 = objc_msgSend(v2, sel_scheduledTimerWithTimeInterval_repeats_block_, 1, v4, 180.0);
    _Block_release(v4);
    uint64_t v6 = *(void **)(v0 + 40);
    *(void *)(v0 + 40) = v5;
  }
  else
  {
    if (v1)
    {
      objc_msgSend(v1, sel_invalidate);
      uint64_t v6 = *(void **)(v0 + 40);
    }
    else
    {
      uint64_t v6 = 0;
    }
    *(void *)(v0 + 40) = 0;
  }
}

uint64_t sub_22BDAD76C()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    v1 = *(void (**)(uint64_t))(result + 24);
    swift_retain();
    uint64_t v2 = swift_release();
    v1(v2);
    return swift_release();
  }
  return result;
}

void sub_22BDAD7E4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_22BDAD84C()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t sub_22BDAD894()
{
  type metadata accessor for PreviewImageProvider();
  swift_allocObject();
  uint64_t result = sub_22BDAD8D4();
  qword_268483C68 = result;
  return result;
}

uint64_t sub_22BDAD8D4()
{
  type metadata accessor for PreviewImageProvider.State();
  v1 = (void *)swift_allocObject();
  uint64_t v2 = MEMORY[0x263F8EE78];
  v1[2] = sub_22BDAD428(MEMORY[0x263F8EE78]);
  v1[5] = 0;
  unint64_t v3 = sub_22BDAD428(v2);
  swift_beginAccess();
  v1[2] = v3;
  swift_bridgeObjectRelease();
  id v4 = (void *)v1[5];
  v1[5] = 0;

  v1[3] = nullsub_1;
  v1[4] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268483CC8);
  uint64_t v5 = swift_allocObject();
  *(_DWORD *)(v5 + 24) = 0;
  uint64_t v6 = (os_unfair_lock_s *)(v5 + 24);
  *(void *)(v5 + 16) = v1;
  char v7 = (uint64_t *)(v5 + 16);
  *(void *)(v0 + 16) = v5;
  swift_retain();
  os_unfair_lock_lock(v6);
  sub_22BDB2734(v7);
  os_unfair_lock_unlock(v6);
  swift_release();
  return v0;
}

uint64_t sub_22BDAD9E8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = swift_allocObject();
  swift_weakInit();
  *(void *)(v1 + 24) = sub_22BDB2750;
  *(void *)(v1 + 32) = v2;
  return swift_release();
}

uint64_t sub_22BDADA5C()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_22BDADAB4();
    return swift_release();
  }
  return result;
}

uint64_t sub_22BDADAB4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
  sub_22BDB2758((uint64_t *)(v1 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));
  return swift_release();
}

uint64_t sub_22BDADB44@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X1>, uint64_t a3@<X8>)
{
  id v4 = v3;
  uint64_t v58 = a3;
  uint64_t v56 = *v4;
  uint64_t v59 = sub_22BDBFD30();
  uint64_t v7 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v9 = &v49[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268483CA8);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v55 = &v49[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v54 = &v49[-v14];
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = &v49[-v15];
  uint64_t v17 = type metadata accessor for PreviewImageProvider.State.Entry();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  v52 = &v49[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v53 = a2;
  int v50 = *a1;
  char v63 = v50;
  uint64_t v20 = sub_22BDB1BB8();
  uint64_t v22 = v21;
  sub_22BDBFD20();
  uint64_t v23 = v4[2];
  uint64_t v51 = v20;
  uint64_t v60 = v20;
  uint64_t v61 = v22;
  uint64_t v57 = v22;
  int v62 = v9;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v23 + 24));
  sub_22BDB2C5C((uint64_t *)(v23 + 16), (uint64_t)v16);
  os_unfair_lock_unlock((os_unfair_lock_t)(v23 + 24));
  uint64_t v24 = v17;
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v59);
  unsigned __int8 v25 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v18 + 48);
  if (v25(v16, 1, v17) != 1)
  {
    uint64_t v38 = v52;
    uint64_t v39 = sub_22BDB1CF0((uint64_t)v16, (uint64_t)v52);
    uint64_t v40 = v4[2];
    MEMORY[0x270FA5388](v39);
    uint64_t v41 = v51;
    *(void *)&v49[-32] = v38;
    *(void *)&v49[-24] = v41;
    uint64_t v42 = v56;
    *(void *)&v49[-16] = v57;
    *(void *)&v49[-8] = v42;
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v40 + 24));
    sub_22BDB24A8((void (**)(void, void, void))(v40 + 16), v58);
    os_unfair_lock_unlock((os_unfair_lock_t)(v40 + 24));
    swift_release();
    sub_22BDB1D54((uint64_t)v38);
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  sub_22BDB1DB0((uint64_t)v16, &qword_268483CA8);
  char v26 = v50;
  char v63 = v50;
  unint64_t v27 = (unint64_t)v53;
  uint64_t v28 = sub_22BDB1BB8();
  uint64_t v59 = v29;
  if (v26)
  {
    uint64_t v30 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
    if (!v30) {
      goto LABEL_8;
    }
    uint64_t v31 = v30;
    v32 = CGBitmapContextCreate(0, 0x7D0uLL, 0x3E8uLL, 8uLL, 0x1F40uLL, v30, 0x2002u);

    if (!v32) {
      goto LABEL_8;
    }
    unint64_t v33 = sub_22BDB1F40(v27);
    if (v33)
    {
      uint64_t v34 = v33;
      v65.x = 2000.0;
      v65.y = 1000.0;
      v64.x = 0.0;
      v64.y = 0.0;
      CGContextDrawLinearGradient(v32, v33, v64, v65, 0);
    }
    CGImageRef Image = CGBitmapContextCreateImage(v32);

    if (!Image) {
      goto LABEL_8;
    }
  }
  else
  {
    CGImageRef v36 = sub_22BDB2100(v27);
    CGImageRef Image = v36;
    if (!v36)
    {
LABEL_8:
      uint64_t v37 = v54;
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v54, 1, 1, v24);
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
  }
  uint64_t v53 = v49;
  uint64_t v44 = (os_unfair_lock_s *)v4[2];
  MEMORY[0x270FA5388](v36);
  v49[-48] = 1;
  *(void *)&v49[-40] = Image;
  *(void *)&v49[-32] = v28;
  uint64_t v57 = v24;
  uint64_t v45 = v56;
  *(void *)&v49[-24] = v59;
  *(void *)&v49[-16] = v45;
  swift_retain();
  os_unfair_lock_lock(v44 + 6);
  uint64_t v37 = v54;
  sub_22BDB20E8((uint64_t)&v44[4], (uint64_t)v54);
  uint64_t v24 = v57;
  os_unfair_lock_unlock(v44 + 6);
  swift_bridgeObjectRelease();

  swift_release();
LABEL_12:
  uint64_t v46 = v58;
  uint64_t v47 = v55;
  sub_22BDB2440((uint64_t)v37, (uint64_t)v55);
  if (v25(v47, 1, v24) == 1)
  {
    sub_22BDB1DB0((uint64_t)v47, &qword_268483CA8);
    uint64_t v48 = sub_22BDBFCB0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v46, 1, 1, v48);
  }
  else
  {
    sub_22BDB2B74((uint64_t)&v47[*(int *)(v24 + 20)], v46, &qword_268483C80);
    return sub_22BDB1D54((uint64_t)v47);
  }
}

uint64_t sub_22BDAE0EC(uint64_t *a1)
{
  uint64_t v2 = sub_22BDBFD30();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v12 - v5;
  if (qword_268483C70 != -1) {
    swift_once();
  }
  sub_22BDBFD10();
  sub_22BDBFCE0();
  uint64_t v7 = *a1;
  uint64_t v8 = swift_beginAccess();
  MEMORY[0x270FA5388](v8);
  *(&v12 - 2) = (uint64_t)v6;
  uint64_t v9 = swift_bridgeObjectRetain();
  uint64_t v10 = sub_22BDB29FC(v9, (uint64_t (*)(uint64_t, uint64_t, char *))sub_22BDB2774, (uint64_t)(&v12 - 4));
  swift_bridgeObjectRelease();
  *(void *)(v7 + 16) = v10;
  swift_bridgeObjectRelease();
  sub_22BDAD610();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_22BDAE2D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v21[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268483C80);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_22BDBFCB0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = type metadata accessor for PreviewImageProvider.State.Entry();
  char v12 = sub_22BDBFCF0();
  if ((v12 & 1) == 0)
  {
    sub_22BDB2B74(a3 + *(int *)(v11 + 20), (uint64_t)v6, &qword_268483C80);
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    {
      sub_22BDB1DB0((uint64_t)v6, &qword_268483C80);
    }
    else
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32))(v10, v6, v7);
      id v13 = objc_msgSend(self, sel_defaultManager);
      uint64_t v14 = (void *)sub_22BDBFC80();
      v21[0] = 0;
      unsigned int v15 = objc_msgSend(v13, sel_removeItemAtURL_error_, v14, v21);

      if (v15)
      {
        id v16 = v21[0];
      }
      else
      {
        id v17 = v21[0];
        uint64_t v18 = (void *)sub_22BDBFC70();

        swift_willThrow();
      }
      (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
    }
  }
  return v12 & 1;
}

void sub_22BDAE540()
{
  qword_268483C78 = 0x405E000000000000;
}

__CFData *sub_22BDAE550()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22BDBFD70();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (__CFData *)objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF990]), sel_init);
  sub_22BDBFD60();
  sub_22BDBFD50();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v7 = (__CFString *)sub_22BDBFD90();
  swift_bridgeObjectRelease();
  CGImageDestinationRef v8 = CGImageDestinationCreateWithData(v6, v7, 1uLL, 0);

  if (!v8)
  {
    sub_22BDB26A8();
    swift_allocError();
    swift_willThrow();
    CGImageDestinationRef v8 = v6;
LABEL_6:

    return v6;
  }
  CGImageDestinationAddImage(v8, v1, 0);
  if (!CGImageDestinationFinalize(v8))
  {
    sub_22BDB26A8();
    swift_allocError();
    swift_willThrow();

    goto LABEL_6;
  }
  uint64_t v9 = v6;
  uint64_t v6 = (__CFData *)sub_22BDBFCC0();

  return v6;
}

uint64_t sub_22BDAE740@<X0>(uint64_t a1@<X0>, char a2@<W1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v73 = a4;
  uint64_t v71 = a6;
  id v72 = a3;
  uint64_t v68 = a1;
  v75[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268483CA8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v69 = (uint64_t)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_22BDBFCB0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  int v62 = (char *)&v59 - v15;
  uint64_t v67 = sub_22BDBFD30();
  uint64_t v65 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  id v17 = (char *)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268483C80);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  char v63 = (char *)&v59 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v59 - v21;
  uint64_t v23 = type metadata accessor for PreviewImageProvider.State.Entry();
  uint64_t v66 = *(void *)(v23 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v23);
  char v26 = (char *)&v59 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v64 = (uint64_t)&v59 - v27;
  uint64_t v70 = a5;
  if (a2)
  {
    uint64_t v61 = v17;
    id v33 = objc_msgSend(self, sel_defaultManager);
    v75[0] = 0;
    id v34 = objc_msgSend(v33, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 13, 1, 0, 1, v75);

    id v35 = v75[0];
    if (v34)
    {
      sub_22BDBFCA0();
      id v36 = v35;

      uint64_t v37 = v62;
      sub_22BDBFC90();
      uint64_t v38 = v10;
      uint64_t v39 = *(void (**)(char *, uint64_t))(v11 + 8);
      v39(v14, v38);
      uint64_t v40 = v74;
      uint64_t v41 = sub_22BDAE550();
      if (!v40)
      {
        uint64_t v46 = (uint64_t)v41;
        uint64_t v74 = v39;
        unint64_t v60 = v42;
        sub_22BDBFCD0();
        CGImageRef v43 = v63;
        uint64_t v74 = 0;
        (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v63, v37, v38);
        sub_22BDB24C8(v46, v60);
        uint64_t v58 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
        v58(v43, 0, 1, v38);
LABEL_9:
        id v47 = v72;
        uint64_t v48 = (uint64_t)v43;
        uint64_t v49 = v38;
        id v17 = v61;
        sub_22BDBFD20();
        int v50 = &v26[*(int *)(v23 + 20)];
        v58(v50, 1, 1, v49);
        *(void *)char v26 = v47;
        id v51 = v47;
        uint64_t v31 = v48;
        uint64_t v32 = (uint64_t)v50;
        goto LABEL_10;
      }
      v39(v37, v38);

      uint64_t v74 = 0;
      CGImageRef v43 = v63;
    }
    else
    {
      id v44 = v75[0];
      uint64_t v45 = (void *)sub_22BDBFC70();

      swift_willThrow();
      uint64_t v74 = 0;
      uint64_t v38 = v10;
      CGImageRef v43 = v63;
    }
    uint64_t v58 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    v58(v43, 1, 1, v38);
    goto LABEL_9;
  }
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v28(v22, 1, 1, v10);
  id v29 = v72;
  sub_22BDBFD20();
  uint64_t v30 = &v26[*(int *)(v23 + 20)];
  v28(v30, 1, 1, v10);
  *(void *)char v26 = v29;
  uint64_t v31 = (uint64_t)v22;
  uint64_t v32 = (uint64_t)v30;
LABEL_10:
  sub_22BDB2520(v31, v32);
  (*(void (**)(char *, char *, uint64_t))(v65 + 32))(&v26[*(int *)(v23 + 24)], v17, v67);
  uint64_t v52 = v64;
  sub_22BDB1CF0((uint64_t)v26, v64);
  uint64_t v53 = v71;
  sub_22BDB1CF0(v52, v71);
  uint64_t v54 = v69;
  sub_22BDB2644(v53, v69);
  uint64_t v55 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v66 + 56);
  v55(v54, 0, 1, v23);
  swift_beginAccess();
  uint64_t v56 = v70;
  swift_bridgeObjectRetain();
  sub_22BDAEDC4(v54, v73, v56);
  swift_endAccess();
  sub_22BDAD610();
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v55)(v53, 0, 1, v23);
}

uint64_t sub_22BDAEDC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268483CA8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for PreviewImageProvider.State.Entry();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 48))(a1, 1) == 1)
  {
    sub_22BDB1DB0(a1, &qword_268483CA8);
    sub_22BDB0260(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_22BDB1DB0((uint64_t)v10, &qword_268483CA8);
  }
  else
  {
    sub_22BDB1CF0(a1, (uint64_t)v13);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_22BDB0600((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_22BDAEF80@<X0>(void (**a1)(void, void, void)@<X0>, void **a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v59 = a3;
  uint64_t v60 = a4;
  uint64_t v48 = a1;
  v61[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v7 = type metadata accessor for PreviewImageProvider.State.Entry();
  uint64_t v55 = *(void *)(v7 - 8);
  uint64_t v56 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v54 = (void ***)((char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v53 = sub_22BDBFD30();
  uint64_t v51 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  int v50 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268483CA8);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v52 = (uint64_t)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_22BDBFCB0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v47 - v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268483C80);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  id v47 = (char *)&v47 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v47 - v22;
  uint64_t v49 = a2;
  id v24 = objc_msgSend(self, sel_defaultManager);
  v61[0] = 0;
  id v25 = objc_msgSend(v24, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 13, 1, 0, 1, v61);

  id v26 = v61[0];
  if (!v25)
  {
    id v32 = v61[0];
    id v33 = (void *)sub_22BDBFC70();

    swift_willThrow();
    goto LABEL_6;
  }
  uint64_t v57 = a5;
  sub_22BDBFCA0();
  id v27 = v26;

  sub_22BDBFC90();
  uint64_t v28 = *(void (**)(char *, uint64_t))(v13 + 8);
  v28(v16, v12);
  id v29 = v58;
  uint64_t v30 = sub_22BDAE550();
  if (v29)
  {
    v28(v18, v12);

    a5 = v57;
LABEL_6:
    uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
    v37(v23, 1, 1, v12);
    goto LABEL_7;
  }
  uint64_t v34 = (uint64_t)v30;
  unint64_t v35 = v31;
  sub_22BDBFCD0();
  uint64_t v58 = *(void (**)(void, void, void))(v13 + 32);
  v58(v23, v18, v12);
  sub_22BDB24C8(v34, v35);
  uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v37(v23, 0, 1, v12);
  int v38 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v23, 1, v12);
  if (v38 != 1)
  {
    uint64_t v39 = v57;
    v58(v57, v23, v12);
    uint64_t v40 = (uint64_t)v47;
    uint64_t v58 = *v48;
    uint64_t v41 = *v49;
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v47, v39, v12);
    v37((char *)v40, 0, 1, v12);
    swift_bridgeObjectRetain();
    uint64_t v49 = v41;
    unint64_t v42 = v50;
    sub_22BDBFD20();
    uint64_t v43 = v56;
    id v44 = v54;
    uint64_t v45 = (uint64_t)v54 + *(int *)(v56 + 20);
    v37((char *)v45, 1, 1, v12);
    *id v44 = v49;
    sub_22BDB2520(v40, v45);
    (*(void (**)(char *, char *, uint64_t))(v51 + 32))((char *)v44 + *(int *)(v43 + 24), v42, v53);
    uint64_t v46 = v52;
    sub_22BDB1CF0((uint64_t)v44, v52);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v55 + 56))(v46, 0, 1, v43);
    swift_beginAccess();
    sub_22BDAEDC4(v46, v59, v60);
    swift_endAccess();
    sub_22BDAD610();
    return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v37)(v57, 0, 1, v12);
  }
  a5 = v57;
LABEL_7:
  sub_22BDB1DB0((uint64_t)v23, &qword_268483C80);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v37)(a5, 1, 1, v12);
}

uint64_t sub_22BDAF5F4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v29 = a4;
  uint64_t v30 = a5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268483CA8);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v28 - v12;
  uint64_t v14 = type metadata accessor for PreviewImageProvider.State.Entry();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *a1;
  swift_beginAccess();
  uint64_t v19 = *(void *)(v18 + 16);
  if (!*(void *)(v19 + 16))
  {
    uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
    v22(v13, 1, 1, v14);
LABEL_7:
    sub_22BDB1DB0((uint64_t)v13, &qword_268483CA8);
    swift_endAccess();
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v22)(v30, 1, 1, v14);
  }
  swift_bridgeObjectRetain();
  uint64_t v28 = a2;
  unint64_t v20 = sub_22BDAF9DC(a2, a3);
  if (v21)
  {
    sub_22BDB2644(*(void *)(v19 + 56) + *(void *)(v15 + 72) * v20, (uint64_t)v13);
    uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
    v22(v13, 0, 1, v14);
  }
  else
  {
    uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
    v22(v13, 1, 1, v14);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1) {
    goto LABEL_7;
  }
  sub_22BDB1CF0((uint64_t)v13, (uint64_t)v17);
  swift_endAccess();
  id v24 = &v17[*(int *)(v14 + 24)];
  uint64_t v25 = v29;
  if (sub_22BDBFD00())
  {
    uint64_t v26 = sub_22BDBFD30();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 24))(v24, v25, v26);
    sub_22BDB2644((uint64_t)v17, (uint64_t)v11);
    v22(v11, 0, 1, v14);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_22BDAEDC4((uint64_t)v11, v28, a3);
    swift_endAccess();
    sub_22BDAD610();
  }
  uint64_t v27 = v30;
  sub_22BDB2644((uint64_t)v17, v30);
  v22((char *)v27, 0, 1, v14);
  return sub_22BDB1D54((uint64_t)v17);
}

uint64_t sub_22BDAF994()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

unint64_t sub_22BDAF9DC(uint64_t a1, uint64_t a2)
{
  sub_22BDC00D0();
  sub_22BDBFDA0();
  uint64_t v4 = sub_22BDC0100();

  return sub_22BDAFA54(a1, a2, v4);
}

unint64_t sub_22BDAFA54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_22BDC0070() & 1) == 0)
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
      while (!v14 && (sub_22BDC0070() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_22BDAFB38(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for PreviewImageProvider.State.Entry();
  uint64_t v42 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268483CB0);
  int v43 = a2;
  uint64_t v9 = sub_22BDC0020();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  uint64_t v41 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v40) {
      break;
    }
    uint64_t v23 = v41;
    unint64_t v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v24 = v41[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v43 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v40) {
              goto LABEL_34;
            }
            unint64_t v24 = v41[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v14 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void *)(v42 + 72);
    uint64_t v30 = *(void *)(v8 + 56) + v29 * v21;
    if (v43)
    {
      sub_22BDB1CF0(v30, (uint64_t)v7);
    }
    else
    {
      sub_22BDB2644(v30, (uint64_t)v7);
      swift_bridgeObjectRetain();
    }
    sub_22BDC00D0();
    sub_22BDBFDA0();
    uint64_t result = sub_22BDC0100();
    uint64_t v31 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v10 + 48) + 16 * v18);
    *uint64_t v19 = v28;
    v19[1] = v27;
    uint64_t result = sub_22BDB1CF0((uint64_t)v7, *(void *)(v10 + 56) + v29 * v18);
    ++*(void *)(v10 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v23 = v41;
  if ((v43 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v8 + 32);
  if (v38 >= 64) {
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v38;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v10;
  return result;
}

uint64_t sub_22BDAFEDC(unint64_t *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v42 = a1;
  uint64_t v7 = type metadata accessor for PreviewImageProvider.State.Entry();
  uint64_t v45 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  MEMORY[0x270FA5388](v8);
  id v44 = (char *)&v40 - v10;
  if (!a3) {
    return MEMORY[0x263F8EE80];
  }
  if (a4[2] == a3)
  {
    swift_retain();
    return (uint64_t)a4;
  }
  uint64_t v43 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268483CB0);
  uint64_t result = sub_22BDC0030();
  uint64_t v12 = result;
  uint64_t v41 = a2;
  if (a2 < 1) {
    unint64_t v13 = 0;
  }
  else {
    unint64_t v13 = *v42;
  }
  uint64_t v14 = 0;
  uint64_t v15 = result + 64;
  uint64_t v16 = v43;
  uint64_t v17 = (uint64_t)v44;
  while (1)
  {
    if (v13)
    {
      unint64_t v18 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      uint64_t v46 = v14;
      unint64_t v19 = v18 | (v14 << 6);
    }
    else
    {
      uint64_t v20 = v14 + 1;
      if (__OFADD__(v14, 1)) {
        goto LABEL_40;
      }
      if (v20 >= v41) {
        return v12;
      }
      unint64_t v21 = v42[v20];
      uint64_t v22 = v14 + 1;
      if (!v21)
      {
        uint64_t v22 = v14 + 2;
        if (v14 + 2 >= v41) {
          return v12;
        }
        unint64_t v21 = v42[v22];
        if (!v21)
        {
          uint64_t v22 = v14 + 3;
          if (v14 + 3 >= v41) {
            return v12;
          }
          unint64_t v21 = v42[v22];
          if (!v21)
          {
            uint64_t v23 = v14 + 4;
            if (v14 + 4 >= v41) {
              return v12;
            }
            unint64_t v21 = v42[v23];
            if (!v21)
            {
              while (1)
              {
                uint64_t v22 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v22 >= v41) {
                  return v12;
                }
                unint64_t v21 = v42[v22];
                ++v23;
                if (v21) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v22 = v14 + 4;
          }
        }
      }
LABEL_24:
      unint64_t v13 = (v21 - 1) & v21;
      uint64_t v46 = v22;
      unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
    }
    uint64_t v24 = a4[7];
    int64_t v25 = a4;
    uint64_t v26 = (uint64_t *)(a4[6] + 16 * v19);
    uint64_t v27 = *v26;
    uint64_t v28 = v26[1];
    uint64_t v29 = *(void *)(v45 + 72);
    sub_22BDB2644(v24 + v29 * v19, v17);
    sub_22BDB1CF0(v17, v16);
    sub_22BDC00D0();
    swift_bridgeObjectRetain();
    sub_22BDBFDA0();
    uint64_t result = sub_22BDC0100();
    uint64_t v30 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v31 = result & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v15 + 8 * (v31 >> 6))) != 0)
    {
      unint64_t v33 = __clz(__rbit64((-1 << v31) & ~*(void *)(v15 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v16 = v43;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v30) >> 6;
      uint64_t v16 = v43;
      do
      {
        if (++v32 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v36 = v32 == v35;
        if (v32 == v35) {
          unint64_t v32 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v15 + 8 * v32);
      }
      while (v37 == -1);
      unint64_t v33 = __clz(__rbit64(~v37)) + (v32 << 6);
    }
    *(void *)(v15 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v33;
    uint64_t v38 = (void *)(*(void *)(v12 + 48) + 16 * v33);
    *uint64_t v38 = v27;
    v38[1] = v28;
    uint64_t result = sub_22BDB1CF0(v16, *(void *)(v12 + 56) + v33 * v29);
    ++*(void *)(v12 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    a4 = v25;
    uint64_t v14 = v46;
    if (!a3) {
      return v12;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_22BDB0260@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_22BDAF9DC(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_22BDB07FC();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = type metadata accessor for PreviewImageProvider.State.Entry();
    uint64_t v20 = *(void *)(v13 - 8);
    sub_22BDB1CF0(v12 + *(void *)(v20 + 72) * v8, a3);
    sub_22BDB03F0(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for PreviewImageProvider.State.Entry();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

unint64_t sub_22BDB03F0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_22BDBFF90();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_22BDC00D0();
        swift_bridgeObjectRetain();
        sub_22BDBFDA0();
        uint64_t v9 = sub_22BDC0100();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          _OWORD *v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(type metadata accessor for PreviewImageProvider.State.Entry() - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    uint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *uint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_22BDB0600(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_22BDAF9DC(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_22BDB07FC();
      goto LABEL_7;
    }
    sub_22BDAFB38(v15, a4 & 1);
    unint64_t v22 = sub_22BDAF9DC(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      unint64_t v12 = v22;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_22BDC0080();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = v19 + *(void *)(*(void *)(type metadata accessor for PreviewImageProvider.State.Entry() - 8) + 72) * v12;
    return sub_22BDB25E0(a1, v20);
  }
LABEL_13:
  sub_22BDB0764(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

uint64_t sub_22BDB0764(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v8 = (void *)(a5[6] + 16 * a1);
  *unint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for PreviewImageProvider.State.Entry();
  uint64_t result = sub_22BDB1CF0(a4, v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

void *sub_22BDB07FC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for PreviewImageProvider.State.Entry();
  uint64_t v29 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268483CB0);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_22BDC0010();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    uint64_t *v1 = v7;
    return result;
  }
  uint64_t v27 = v1;
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v28 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v23 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_23;
      }
      unint64_t v24 = *(void *)(v28 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    unint64_t v18 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v29 + 72) * v16;
    sub_22BDB2644(*(void *)(v5 + 56) + v21, (uint64_t)v4);
    unint64_t v22 = (void *)(*(void *)(v7 + 48) + v17);
    *unint64_t v22 = v19;
    v22[1] = v20;
    sub_22BDB1CF0((uint64_t)v4, *(void *)(v7 + 56) + v21);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v27;
    goto LABEL_25;
  }
  unint64_t v24 = *(void *)(v28 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_22BDB0A68()
{
  id v0 = objc_msgSend(self, sel_processInfo);
  id v1 = objc_msgSend(v0, sel_environment);

  uint64_t v2 = sub_22BDBFD80();
  if (*(void *)(v2 + 16) && (unint64_t v3 = sub_22BDAF9DC(0xD00000000000001ALL, 0x800000022BDC18B0), (v4 & 1) != 0))
  {
    uint64_t v5 = (uint64_t *)(*(void *)(v2 + 56) + 16 * v3);
    uint64_t v7 = *v5;
    uint64_t v6 = v5[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (v7 == 49 && v6 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      char v9 = sub_22BDC0070();
      swift_bridgeObjectRelease();
      return v9 & 1;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for PreviewImageCategory()
{
  return &type metadata for PreviewImageCategory;
}

uint64_t type metadata accessor for PreviewImageProvider()
{
  return self;
}

uint64_t type metadata accessor for PreviewImageProvider.State()
{
  return self;
}

void **sub_22BDB0BFC(void **a1, void **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  char v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = *(int *)(a3 + 20);
    char v9 = (char *)a1 + v8;
    int64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_22BDBFCB0();
    uint64_t v12 = *(void *)(v11 - 8);
    unint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    int64_t v14 = v4;
    if (v13(v10, 1, v11))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268483C80);
      memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v16 = *(int *)(a3 + 24);
    uint64_t v17 = (char *)v7 + v16;
    unint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = sub_22BDBFD30();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  }
  return v7;
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

uint64_t sub_22BDB0E18(id *a1, uint64_t a2)
{
  char v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_22BDBFCB0();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v7 = (char *)a1 + *(int *)(a2 + 24);
  uint64_t v8 = sub_22BDBFD30();
  char v9 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);

  return v9(v7, v8);
}

void **sub_22BDB0F1C(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  char v9 = (char *)a2 + v7;
  uint64_t v10 = sub_22BDBFCB0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  id v13 = v6;
  if (v12(v9, 1, v10))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268483C80);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_22BDBFD30();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  return a1;
}

void **sub_22BDB1094(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_22BDBFCB0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268483C80);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  uint64_t v18 = *(int *)(a3 + 24);
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = sub_22BDBFD30();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 24))(v19, v20, v21);
  return a1;
}

void *sub_22BDB1270(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22BDBFCB0();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268483C80);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_22BDBFD30();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  return a1;
}

void **sub_22BDB13DC(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = *(int *)(a3 + 20);
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_22BDBFCB0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268483C80);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = sub_22BDBFD30();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t sub_22BDB15B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22BDB15C8);
}

uint64_t sub_22BDB15C8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268483C80);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_22BDBFD30();
      int v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)a1 + *(int *)(a3 + 24);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_22BDB16F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22BDB170C);
}

void *sub_22BDB170C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268483C80);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_22BDBFD30();
      int v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 24);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata accessor for PreviewImageProvider.State.Entry()
{
  uint64_t result = qword_268483C88;
  if (!qword_268483C88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_22BDB1888()
{
  sub_22BDB1960();
  if (v0 <= 0x3F)
  {
    sub_22BDBFD30();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_22BDB1960()
{
  if (!qword_268483C98)
  {
    sub_22BDBFCB0();
    unint64_t v0 = sub_22BDBFF60();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268483C98);
    }
  }
}

uint64_t _s21DeveloperToolsSupport20PreviewImageCategoryV4KindOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s21DeveloperToolsSupport20PreviewImageCategoryV4KindOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x22BDB1B14);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_22BDB1B3C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_22BDB1B44(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewImageCategory.Kind()
{
  return &type metadata for PreviewImageCategory.Kind;
}

unint64_t sub_22BDB1B64()
{
  unint64_t result = qword_268483CA0;
  if (!qword_268483CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268483CA0);
  }
  return result;
}

uint64_t sub_22BDB1BB8()
{
  return 0;
}

uint64_t sub_22BDB1CD0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22BDAF5F4(a1, v2[2], v2[3], v2[4], a2);
}

uint64_t sub_22BDB1CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviewImageProvider.State.Entry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BDB1D54(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PreviewImageProvider.State.Entry();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22BDB1DB0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_22BDB1E0C(double a1)
{
  double v1 = a1 / 60.0;
  fmod(a1 / 60.0, 2.0);
  double v2 = floor(v1);
  if ((~*(void *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v2 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v2 >= 9.22337204e18)
  {
LABEL_7:
    __break(1u);
    JUMPOUT(0x22BDB1F2CLL);
  }
}

CGGradientRef sub_22BDB1F40(unint64_t a1)
{
  double v1 = fmod((double)(a1 % 0x24) * 15.0, 360.0);
  sub_22BDB1E0C(v1);
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  sub_22BDB1E0C(v1);
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGColorRef SRGB = CGColorCreateSRGB(v3, v5, v7, 1.0);
  CGColorRef v15 = CGColorCreateSRGB(v9, v11, v13, 1.0);
  uint64_t v16 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268483CC0);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_22BDC07B0;
  *(void *)(v17 + 32) = SRGB;
  *(void *)(v17 + 40) = v15;
  sub_22BDBFE30();
  type metadata accessor for CGColor(0);
  uint64_t v18 = SRGB;
  uint64_t v19 = v15;
  CFArrayRef v20 = (const __CFArray *)sub_22BDBFE20();
  swift_bridgeObjectRelease();
  CGGradientRef v21 = CGGradientCreateWithColors(v16, v20, 0);

  return v21;
}

uint64_t sub_22BDB20E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22BDB2710(a1, a2);
}

CGImageRef sub_22BDB2100(unint64_t a1)
{
  uint64_t v2 = sub_22BDBFD40();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  CGFloat v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v6 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
  if (!v6) {
    return 0;
  }
  CGFloat v7 = v6;
  double v8 = CGBitmapContextCreate(0, 0xC8uLL, 0xC8uLL, 8uLL, 0x320uLL, v6, 0x2002u);

  if (!v8) {
    return 0;
  }
  CGFloat v9 = sub_22BDB1F40(a1);
  if (v9)
  {
    double v10 = v9;
    v18.x = 200.0;
    v17.x = 0.0;
    v17.y = 0.0;
    v18.y = 200.0;
    CGContextDrawLinearGradient(v8, v9, v17, v18, 0);
  }
  CGColorRef SRGB = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
  CGContextSetFillColorWithColor(v8, SRGB);

  v16[1] = 0x4044000000000000;
  v19.origin.x = 80.0;
  v19.origin.y = 95.0;
  v19.size.width = 40.0;
  v19.size.height = 50.0;
  CGContextFillEllipseInRect(v8, v19);
  v20.origin.x = 80.0;
  v20.origin.y = 95.0;
  v20.size.width = 40.0;
  v20.size.height = 50.0;
  double MidX = CGRectGetMidX(v20);
  v21.origin.x = 80.0;
  v21.origin.y = 95.0;
  v21.size.width = 40.0;
  v21.size.height = 50.0;
  CGFloat v13 = CGRectGetMinY(v21) + -40.0 + -6.25;
  atan2(v13 + 5.71428571 - (v13 + 5.0), MidX + -39.5897327 - (MidX + -34.6410162));
  v16[0] = atan2(v13 - (v13 + 5.0), MidX + -34.6410162 - (MidX + -34.6410162));
  atan2(v13 + 5.71428571 - (v13 + 5.0), MidX + 39.5897327 - (MidX + 34.6410162));
  atan2(v13 - (v13 + 5.0), MidX + 34.6410162 - (MidX + 34.6410162));
  sub_22BDBFF20();
  sub_22BDBFF20();
  sub_22BDBFF20();
  CGContextClosePath(v8);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F00040], v2);
  sub_22BDBFF30();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  CGImageRef Image = CGBitmapContextCreateImage(v8);

  return Image;
}

uint64_t sub_22BDB2440(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268483CA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BDB24A8@<X0>(void (**a1)(void, void, void)@<X0>, uint64_t a2@<X8>)
{
  return sub_22BDAEF80(a1, *(void ***)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), a2);
}

uint64_t sub_22BDB24C8(uint64_t a1, unint64_t a2)
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

uint64_t sub_22BDB2520(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268483C80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BDB2588()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22BDB25C0()
{
  return sub_22BDAD76C();
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

uint64_t sub_22BDB25E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviewImageProvider.State.Entry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_22BDB2644(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviewImageProvider.State.Entry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_22BDB26A8()
{
  unint64_t result = qword_268483CB8;
  if (!qword_268483CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268483CB8);
  }
  return result;
}

void type metadata accessor for CGColor(uint64_t a1)
{
}

uint64_t sub_22BDB2710@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22BDAE740(a1, *(unsigned char *)(v2 + 16), *(void **)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), a2);
}

uint64_t sub_22BDB2734(uint64_t *a1)
{
  return sub_22BDAD9E8(a1);
}

uint64_t sub_22BDB2750()
{
  return sub_22BDADA5C();
}

uint64_t sub_22BDB2758(uint64_t *a1)
{
  return sub_22BDAE0EC(a1);
}

uint64_t sub_22BDB2774(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22BDAE2D0(a1, a2, a3);
}

uint64_t sub_22BDB277C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, char *))
{
  uint64_t v24 = a2;
  uint64_t v29 = a4;
  int64_t v25 = a1;
  uint64_t v5 = type metadata accessor for PreviewImageProvider.State.Entry();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = MEMORY[0x270FA5388](v5 - 8);
  CGFloat v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v10 = 0;
  uint64_t v11 = *(void *)(a3 + 64);
  uint64_t v26 = 0;
  uint64_t v27 = a3 + 64;
  uint64_t v12 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & v11;
  int64_t v28 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_5;
    }
    int64_t v20 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v20 >= v28) {
      return sub_22BDAFEDC(v25, v24, v26, (void *)a3);
    }
    unint64_t v21 = *(void *)(v27 + 8 * v20);
    ++v10;
    if (!v21)
    {
      int64_t v10 = v20 + 1;
      if (v20 + 1 >= v28) {
        return sub_22BDAFEDC(v25, v24, v26, (void *)a3);
      }
      unint64_t v21 = *(void *)(v27 + 8 * v10);
      if (!v21)
      {
        int64_t v10 = v20 + 2;
        if (v20 + 2 >= v28) {
          return sub_22BDAFEDC(v25, v24, v26, (void *)a3);
        }
        unint64_t v21 = *(void *)(v27 + 8 * v10);
        if (!v21) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v14 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v10 << 6);
LABEL_5:
    CGPoint v17 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v16);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_22BDB2644(*(void *)(a3 + 56) + *(void *)(v6 + 72) * v16, (uint64_t)v9);
    swift_bridgeObjectRetain();
    LOBYTE(v18) = v29(v18, v19, v9);
    sub_22BDB1D54((uint64_t)v9);
    uint64_t result = swift_bridgeObjectRelease();
    if (v18)
    {
      *(unint64_t *)((char *)v25 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      if (__OFADD__(v26++, 1))
      {
        __break(1u);
        return sub_22BDAFEDC(v25, v24, v26, (void *)a3);
      }
    }
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v28) {
    return sub_22BDAFEDC(v25, v24, v26, (void *)a3);
  }
  unint64_t v21 = *(void *)(v27 + 8 * v22);
  if (v21)
  {
    int64_t v10 = v22;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v10 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v10 >= v28) {
      return sub_22BDAFEDC(v25, v24, v26, (void *)a3);
    }
    unint64_t v21 = *(void *)(v27 + 8 * v10);
    ++v22;
    if (v21) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_22BDB29FC(uint64_t isStackAllocationSafe, uint64_t (*a2)(uint64_t, uint64_t, char *), uint64_t a3)
{
  uint64_t v6 = isStackAllocationSafe;
  v13[1] = *MEMORY[0x263EF8340];
  char v7 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v8 = (unint64_t)((1 << v7) + 63) >> 6;
  size_t v9 = 8 * v8;
  if ((v7 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    uint64_t v10 = sub_22BDB277C((void *)((char *)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0)), v8, v6, a2);
    if (v3) {
      swift_willThrow();
    }
    else {
      return v10;
    }
  }
  else
  {
    uint64_t v11 = (void *)swift_slowAlloc();
    bzero(v11, v9);
    a3 = sub_22BDB277C((unint64_t *)v11, v8, v6, a2);
    MEMORY[0x230F544A0](v11, -1, -1);
  }
  return a3;
}

uint64_t sub_22BDB2B74(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

ValueMetadata *_s31ImageDataGenerationFailureErrorVMa()
{
  return &_s31ImageDataGenerationFailureErrorVN;
}

void type metadata accessor for CGImage(uint64_t a1)
{
}

void sub_22BDB2C10(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_22BDB2C5C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22BDB1CD0(a1, a2);
}

uint64_t PreviewTrait.init(_:)@<X0>(long long *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268483CF0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22BDC09F0;
  uint64_t result = sub_22BDB2CD8(a1, v4 + 32);
  *a2 = v4;
  return result;
}

uint64_t sub_22BDB2CD8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t PreviewTrait.init(_:)@<X0>(uint64_t *a1@<X8>)
{
  swift_getKeyPath();
  type metadata accessor for PreviewTrait();
  sub_22BDBFE90();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268483CF8);
  swift_getWitnessTable();
  sub_22BDB2E80();
  uint64_t v2 = sub_22BDBFE10();
  swift_bridgeObjectRelease();
  uint64_t result = swift_release();
  *a1 = v2;
  return result;
}

uint64_t sub_22BDB2DF0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_22BDB2E4C()
{
  return sub_22BDB2DF0();
}

uint64_t type metadata accessor for PreviewTrait()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_22BDB2E80()
{
  unint64_t result = qword_268483D00[0];
  if (!qword_268483D00[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268483CF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268483D00);
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

__n128 PreviewLayoutTrait.value.getter@<Q0>(__n128 *a1@<X8>)
{
  unint64_t v2 = v1[1].n128_u64[0];
  unsigned __int8 v3 = v1[1].n128_u8[8];
  __n128 result = *v1;
  *a1 = *v1;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u8[8] = v3;
  return result;
}

void static PreviewLayoutTrait.defaultValue.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = 2;
}

__n128 static PreviewLayoutTrait.combine(_:_:)@<Q0>(__n128 *a1@<X1>, __n128 *a2@<X8>)
{
  unint64_t v2 = a1[1].n128_u64[0];
  unsigned __int8 v3 = a1[1].n128_u8[8];
  __n128 result = *a1;
  *a2 = *a1;
  a2[1].n128_u64[0] = v2;
  a2[1].n128_u8[8] = v3;
  return result;
}

__n128 sub_22BDB2F70@<Q0>(__n128 *a1@<X8>)
{
  unint64_t v2 = v1[1].n128_u64[0];
  unsigned __int8 v3 = v1[1].n128_u8[8];
  __n128 result = *v1;
  *a1 = *v1;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u8[8] = v3;
  return result;
}

void sub_22BDB2F8C(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = 2;
}

__n128 sub_22BDB2FA0@<Q0>(__n128 *a1@<X1>, __n128 *a2@<X8>)
{
  unint64_t v2 = a1[1].n128_u64[0];
  unsigned __int8 v3 = a1[1].n128_u8[8];
  __n128 result = *a1;
  *a2 = *a1;
  a2[1].n128_u64[0] = v2;
  a2[1].n128_u8[8] = v3;
  return result;
}

void PreviewInterfaceOrientationTrait.value.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

void static PreviewInterfaceOrientationTrait.defaultValue.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

void static PreviewInterfaceOrientationTrait.combine(_:_:)(unsigned char *a1@<X1>, unsigned char *a2@<X8>)
{
  *a2 = *a1;
}

void sub_22BDB2FDC(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

void sub_22BDB2FE8(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

void sub_22BDB2FF0(unsigned char *a1@<X1>, unsigned char *a2@<X8>)
{
  *a2 = *a1;
}

uint64_t sub_22BDB2FFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t dispatch thunk of PreviewTraitProtocol.value.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static PreviewTraitProtocol.defaultValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static PreviewTraitProtocol.combine(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t initializeBufferWithCopyOfBuffer for PreviewLayout(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for PreviewLayout(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewLayout(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewLayoutTrait()
{
  return &type metadata for PreviewLayoutTrait;
}

uint64_t getEnumTagSinglePayload for PreviewInterfaceOrientation(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PreviewInterfaceOrientationTrait(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22BDB3284);
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

ValueMetadata *type metadata accessor for PreviewInterfaceOrientationTrait()
{
  return &type metadata for PreviewInterfaceOrientationTrait;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void sub_22BDB32EC()
{
}

void static PreviewRegistry.preview.getter()
{
}

uint64_t dispatch thunk of static PreviewRegistry.fileID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static PreviewRegistry.line.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static PreviewRegistry.column.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static PreviewRegistry.makePreview()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of static PreviewRegistry.preview.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

ValueMetadata *type metadata accessor for PreviewUnavailable()
{
  return &type metadata for PreviewUnavailable;
}

uint64_t NamedResource.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

id NamedResource.bundle.getter()
{
  return *(id *)(v0 + 16);
}

void NamedResource.hash(into:)()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_bridgeObjectRetain();
  sub_22BDBFDA0();
  swift_bridgeObjectRelease();
  id v2 = v1;
  sub_22BDBFF50();
}

uint64_t static NamedResource.== infix(_:_:)(void *a1, void *a2)
{
  BOOL v2 = *a1 == *a2 && a1[1] == a2[1];
  if (!v2 && (sub_22BDC0070() & 1) == 0) {
    return 0;
  }
  sub_22BDB3504();
  return sub_22BDBFF40() & 1;
}

unint64_t sub_22BDB3504()
{
  unint64_t result = qword_268483D88;
  if (!qword_268483D88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268483D88);
  }
  return result;
}

uint64_t NamedResource.hashValue.getter()
{
  return sub_22BDC0100();
}

uint64_t sub_22BDB35A4()
{
  return sub_22BDC0100();
}

uint64_t sub_22BDB3604()
{
  return sub_22BDBFF50();
}

uint64_t sub_22BDB3638()
{
  return sub_22BDC0100();
}

uint64_t sub_22BDB3694(void *a1, void *a2)
{
  BOOL v2 = *a1 == *a2 && a1[1] == a2[1];
  if (!v2 && (sub_22BDC0070() & 1) == 0) {
    return 0;
  }
  sub_22BDB3504();
  return sub_22BDBFF40() & 1;
}

uint64_t ResourceReference.hash(into:)()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_22BDC00E0();
  swift_bridgeObjectRetain();
  id v2 = v1;
  sub_22BDBFDA0();
  sub_22BDBFF50();

  return swift_bridgeObjectRelease();
}

uint64_t ResourceReference.hashValue.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_22BDC00D0();
  sub_22BDC00E0();
  swift_bridgeObjectRetain();
  id v2 = v1;
  sub_22BDBFDA0();
  sub_22BDBFF50();

  swift_bridgeObjectRelease();
  return sub_22BDC0100();
}

uint64_t _s21DeveloperToolsSupport13ColorResourceV9hashValueSivg_0()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_22BDC00D0();
  sub_22BDC00E0();
  swift_bridgeObjectRetain();
  id v2 = v1;
  sub_22BDBFDA0();
  sub_22BDBFF50();

  swift_bridgeObjectRelease();
  return sub_22BDC0100();
}

uint64_t _s21DeveloperToolsSupport13ColorResourceV4hash4intoys6HasherVz_tF_0()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_22BDC00E0();
  swift_bridgeObjectRetain();
  id v2 = v1;
  sub_22BDBFDA0();
  sub_22BDBFF50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_22BDB3924()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_22BDC00D0();
  sub_22BDC00E0();
  swift_bridgeObjectRetain();
  id v2 = v1;
  sub_22BDBFDA0();
  sub_22BDBFF50();

  swift_bridgeObjectRelease();
  return sub_22BDC0100();
}

uint64_t (*ColorResource.reference.modify())()
{
  return nullsub_1;
}

uint64_t ColorResource.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ColorResource.init(name:bundle:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

BOOL static ColorResource.== infix(_:_:)(void *a1, void *a2)
{
  return _s21DeveloperToolsSupport17ResourceReferenceO2eeoiySbAC_ACtFZ_0(a1, a2);
}

BOOL sub_22BDB3A40(void *a1, void *a2)
{
  return _s21DeveloperToolsSupport17ResourceReferenceO2eeoiySbAC_ACtFZ_0(a1, a2);
}

id _s21DeveloperToolsSupport13ColorResourceV9referenceAA0E9ReferenceOvg_0@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  id v4 = (id)v1[2];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v4;
  swift_bridgeObjectRetain();

  return v4;
}

__n128 _s21DeveloperToolsSupport13ColorResourceV9referenceAA0E9ReferenceOvs_0(uint64_t *a1)
{
  uint64_t v3 = *a1;

  swift_bridgeObjectRelease();
  *(void *)uint64_t v1 = v3;
  __n128 result = *(__n128 *)(a1 + 1);
  *(__n128 *)(v1 + 8) = result;
  return result;
}

uint64_t (*ImageResource.reference.modify())()
{
  return nullsub_1;
}

BOOL static ImageResource.== infix(_:_:)(void *a1, void *a2)
{
  return _s21DeveloperToolsSupport17ResourceReferenceO2eeoiySbAC_ACtFZ_0(a1, a2);
}

BOOL _s21DeveloperToolsSupport17ResourceReferenceO2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = (void *)a1[2];
  uint64_t v3 = (void *)a2[2];
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_22BDC0070() & 1) == 0) {
    return 0;
  }
  sub_22BDB3504();
  swift_bridgeObjectRetain();
  id v5 = v2;
  swift_bridgeObjectRetain();
  id v6 = v3;
  char v7 = sub_22BDBFF40();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v7 & 1) != 0;
}

unint64_t sub_22BDB3C00()
{
  unint64_t result = qword_268483D90;
  if (!qword_268483D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268483D90);
  }
  return result;
}

unint64_t sub_22BDB3C58()
{
  unint64_t result = qword_268483D98;
  if (!qword_268483D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268483D98);
  }
  return result;
}

unint64_t sub_22BDB3CB0()
{
  unint64_t result = qword_268483DA0;
  if (!qword_268483DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268483DA0);
  }
  return result;
}

unint64_t sub_22BDB3D08()
{
  unint64_t result = qword_268483DA8;
  if (!qword_268483DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268483DA8);
  }
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for NamedResource()
{
  return &type metadata for NamedResource;
}

uint64_t sub_22BDB3D94()
{
  return 0;
}

ValueMetadata *type metadata accessor for ResourceReference()
{
  return &type metadata for ResourceReference;
}

void destroy for ColorResource(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 16);
}

ValueMetadata *type metadata accessor for ColorResource()
{
  return &type metadata for ColorResource;
}

void *_s21DeveloperToolsSupport13NamedResourceVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  BOOL v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

void *_s21DeveloperToolsSupport13NamedResourceVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  BOOL v4 = (void *)a2[2];
  id v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  return a1;
}

uint64_t _s21DeveloperToolsSupport13NamedResourceVwta_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  BOOL v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t _s21DeveloperToolsSupport13NamedResourceVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_22BDB3F28(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ImageResource()
{
  return &type metadata for ImageResource;
}

BOOL static PreviewInterfaceOrientation.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PreviewInterfaceOrientation.hash(into:)()
{
  return sub_22BDC00E0();
}

uint64_t PreviewInterfaceOrientation.hashValue.getter()
{
  return sub_22BDC0100();
}

BOOL sub_22BDB400C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22BDB4020()
{
  return sub_22BDC0100();
}

uint64_t sub_22BDB4068()
{
  return sub_22BDC00E0();
}

uint64_t sub_22BDB4094()
{
  return sub_22BDC0100();
}

unint64_t sub_22BDB40DC()
{
  unint64_t result = qword_268483DB0;
  if (!qword_268483DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268483DB0);
  }
  return result;
}

uint64_t sub_22BDB4130(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 1u) {
    return *(unsigned __int8 *)(a1 + 24);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_22BDB4148(uint64_t result, unsigned int a2)
{
  uint64_t v2 = a2 - 2;
  if (a2 >= 2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    LOBYTE(a2) = 2;
    *(void *)unint64_t result = v2;
  }
  *(unsigned char *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for PreviewLayout()
{
  return &type metadata for PreviewLayout;
}

unsigned char *storeEnumTagSinglePayload for PreviewInterfaceOrientation(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x22BDB4240);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

unsigned char *sub_22BDB4268(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PreviewInterfaceOrientation()
{
  return &type metadata for PreviewInterfaceOrientation;
}

uint64_t _Playground.displayName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t _Playground.displayName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*_Playground.displayName.modify())()
{
  return nullsub_1;
}

uint64_t sub_22BDB4308(uint64_t a1, int *a2)
{
  uint64_t v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  int v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v3;
  void *v3 = v2;
  v3[1] = sub_22BDB43D4;
  return v5();
}

uint64_t sub_22BDB43D4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_22BDB44C8(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 16) = &unk_268483DC0;
  *(void *)(a2 + 24) = v5;
  return result;
}

uint64_t sub_22BDB4538(int *a1)
{
  uint64_t v4 = (uint64_t (*)(void))((char *)a1 + *a1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_22BDB4B00;
  return v4();
}

uint64_t _Playground.body.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t _Playground.body.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*_Playground.body.modify())()
{
  return nullsub_1;
}

uint64_t _Playground.init(_:body:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t sub_22BDB469C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = &unk_268483DD0;
  a2[1] = v5;

  return swift_retain();
}

uint64_t destroy for _Playground()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for _Playground(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for _Playground(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for _Playground(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _Playground(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _Playground(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _Playground()
{
  return &type metadata for _Playground;
}

uint64_t dispatch thunk of static _PlaygroundRegistry.fileID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static _PlaygroundRegistry.line.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static _PlaygroundRegistry.column.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static _PlaygroundRegistry.makePlayground()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

ValueMetadata *type metadata accessor for _PlaygroundUnavailable()
{
  return &type metadata for _PlaygroundUnavailable;
}

uint64_t sub_22BDB4964()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22BDB499C()
{
  unint64_t v2 = *(int **)(v0 + 16);
  long long v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_22BDB4B00;
  uint64_t v4 = (uint64_t (*)(int *))((char *)&dword_268483DB8 + dword_268483DB8);
  return v4(v2);
}

uint64_t sub_22BDB4A48(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_22BDB43D4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268483DC8 + dword_268483DC8);
  return v6(a1, v4);
}

uint64_t static PreviewBodyBuilder.buildBlock(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

void static PreviewBodyBuilder.buildBlock(_:)()
{
}

void static PreviewBodyBuilder.buildOptional(_:)()
{
}

void static PreviewBodyBuilder.buildEither(first:)()
{
}

void static PreviewBodyBuilder.buildEither(second:)()
{
}

void static PreviewBodyBuilder.buildLimitedAvailability(_:)()
{
}

void static PreviewMacroBodyBuilder.buildBlock(_:)()
{
}

{
  sub_22BDC0000();
  __break(1u);
}

void static PreviewMacroBodyBuilder.buildOptional(_:)()
{
}

void static PreviewMacroBodyBuilder.buildEither(first:)()
{
}

void static PreviewMacroBodyBuilder.buildEither(second:)()
{
}

void static PreviewMacroBodyBuilder.buildLimitedAvailability(_:)()
{
}

uint64_t sub_22BDB4E94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 8);
}

uint64_t type metadata accessor for PreviewBodyBuilder()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for PreviewMacroBodyBuilder()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22BDB4ECC()
{
  return 1;
}

uint64_t PreviewSource.supportsOnDevicePreviews.getter()
{
  return 1;
}

uint64_t PreviewSource.supportsInteractivePreviews.getter()
{
  return 1;
}

void DefaultPreviewSource.contentDomain.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *DefaultPreviewSource.contentDomain.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*DefaultPreviewSource.contentDomain.modify())()
{
  return nullsub_1;
}

uint64_t DefaultPreviewSource.contentCategory.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 16);
  *a1 = *(void *)(v1 + 8);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t DefaultPreviewSource.contentCategory.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = v2;
  *(void *)(v1 + 16) = v3;
  return result;
}

uint64_t (*DefaultPreviewSource.contentCategory.modify())()
{
  return nullsub_1;
}

uint64_t DefaultPreviewSource.supportsOnDevicePreviews.getter()
{
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t DefaultPreviewSource.supportsOnDevicePreviews.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 24) = result;
  return result;
}

uint64_t (*DefaultPreviewSource.supportsOnDevicePreviews.modify())()
{
  return nullsub_1;
}

uint64_t DefaultPreviewSource.supportsInteractivePreviews.getter()
{
  return *(unsigned __int8 *)(v0 + 25);
}

uint64_t DefaultPreviewSource.supportsInteractivePreviews.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 25) = result;
  return result;
}

uint64_t (*DefaultPreviewSource.supportsInteractivePreviews.modify())()
{
  return nullsub_1;
}

uint64_t DefaultPreviewSource.structure.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 32);
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v4 = *(void *)(v1 + 48);
  uint64_t v5 = *(void *)(v1 + 56);
  uint64_t v6 = *(void *)(v1 + 64);
  uint64_t v7 = *(void *)(v1 + 72);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  char v8 = *(unsigned char *)(v1 + 80);
  *(unsigned char *)(a1 + 48) = v8;
  return sub_22BDB5000(v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_22BDB5000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7)
  {
    if (a7 != 1) {
      return result;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }

  return swift_retain();
}

__n128 DefaultPreviewSource.structure.setter(long long *a1)
{
  __n128 v6 = (__n128)a1[1];
  long long v7 = *a1;
  uint64_t v2 = *((void *)a1 + 4);
  uint64_t v3 = *((void *)a1 + 5);
  char v4 = *((unsigned char *)a1 + 48);
  sub_22BDB50D4(*(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(void *)(v1 + 72), *(unsigned char *)(v1 + 80));
  __n128 result = v6;
  *(_OWORD *)(v1 + 32) = v7;
  *(__n128 *)(v1 + 48) = v6;
  *(void *)(v1 + 64) = v2;
  *(void *)(v1 + 72) = v3;
  *(unsigned char *)(v1 + 80) = v4;
  return result;
}

uint64_t sub_22BDB50D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7 == 1)
  {
    swift_bridgeObjectRelease();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else if (!a7)
  {
    return swift_release();
  }
  return result;
}

uint64_t (*DefaultPreviewSource.structure.modify())()
{
  return nullsub_1;
}

double DefaultPreviewSource.init(contentDomain:contentCategory:supportsOnDevicePreviews:supportsInteractivePreviews:body:)@<D0>(unsigned char *a1@<X0>, uint64_t *a2@<X1>, char a3@<W2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  *(unsigned char *)a7 = *a1;
  *(void *)(a7 + 8) = v7;
  *(void *)(a7 + 16) = v8;
  *(unsigned char *)(a7 + 24) = a3;
  *(unsigned char *)(a7 + 25) = a4;
  *(void *)(a7 + 32) = a5;
  *(void *)(a7 + 40) = a6;
  double result = 0.0;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(unsigned char *)(a7 + 80) = 0;
  return result;
}

uint64_t DefaultPreviewSource.init<A>(contentDomain:contentCategory:supportsOnDevicePreviews:supportsInteractivePreviews:arguments:body:)@<X0>(unsigned __int8 *a1@<X0>, unsigned __int8 **a2@<X1>, int a3@<W2>, unsigned __int32 a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, __n128 *a9@<X8>, uint64_t a10)
{
  uint64_t v42 = a8;
  uint64_t v43 = a6;
  uint64_t v49 = a1;
  uint64_t v50 = a7;
  v45.n128_u32[0] = a4;
  LODWORD(v44) = a3;
  uint64_t v48 = a10;
  uint64_t v13 = type metadata accessor for PreviewArguments.InhabitedSections();
  uint64_t v14 = sub_22BDBFF60();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v41 - v17;
  uint64_t v19 = *(void *)(v13 - 8);
  uint64_t v20 = *(void *)(v19 + 64);
  uint64_t v21 = MEMORY[0x270FA5388](v16);
  uint64_t v41 = (char *)&v41 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  int64_t v23 = (char *)&v41 - v22;
  int v47 = *v49;
  uint64_t v49 = *a2;
  uint64_t v46 = a2[1];
  unsigned __int8 v55 = v44;
  unsigned __int8 v54 = v45.n128_u8[0];
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, a5, v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v13) == 1)
  {
    swift_release();
    uint64_t v24 = type metadata accessor for PreviewArguments();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(a5, v24);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    unint64_t v26 = 0;
    unint64_t v27 = 0;
    int64_t v28 = 0;
    uint64_t v29 = 0;
    __n128 v30 = 0uLL;
    char v31 = 2;
  }
  else
  {
    unint64_t v32 = *(void (**)(char *, char *, uint64_t))(v19 + 32);
    v32(v23, v18, v13);
    sub_22BDB5554(&v51);
    uint64_t v33 = v48;
    uint64_t v34 = type metadata accessor for PreviewArguments();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v34 - 8) + 8))(a5, v34);
    __n128 v45 = v51;
    unint64_t v26 = v52;
    unint64_t v44 = v53;
    unint64_t v35 = v41;
    v32(v41, v23, v13);
    unint64_t v36 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = v42;
    *(void *)(v29 + 24) = v33;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v32)(v29 + v36, v35, v13);
    __n128 v30 = v45;
    unint64_t v27 = v44;
    uint64_t v37 = (void *)(v29 + ((v20 + v36 + 7) & 0xFFFFFFFFFFFFFFF8));
    uint64_t v38 = v50;
    *uint64_t v37 = v43;
    v37[1] = v38;
    char v31 = 1;
    int64_t v28 = sub_22BDB58DC;
  }
  unsigned __int8 v39 = v55;
  unsigned __int8 v40 = v54;
  a9->n128_u8[0] = v47;
  a9->n128_u64[1] = (unint64_t)v49;
  a9[1].n128_u64[0] = (unint64_t)v46;
  a9[1].n128_u8[8] = v39;
  a9[1].n128_u8[9] = v40;
  a9[2] = v30;
  a9[3].n128_u64[0] = v26;
  a9[3].n128_u64[1] = v27;
  a9[4].n128_u64[0] = (unint64_t)v28;
  a9[4].n128_u64[1] = v29;
  a9[5].n128_u8[0] = v31;
  return result;
}

__n128 sub_22BDB5554@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for PreviewSection();
  sub_22BDB5E10(v2, &v11);
  __n128 v10 = v11;
  unint64_t v3 = v12;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v5 = sub_22BDBFE90();
  swift_bridgeObjectRetain();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v8 = sub_22BDB5ECC((void (*)(char *, char *))sub_22BDB7D4C, KeyPath, v5, (uint64_t)&type metadata for PreviewGroupMetadata.Section, MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v7);
  swift_release();
  swift_bridgeObjectRelease();
  __n128 result = v10;
  *a1 = v10;
  a1[1].n128_u64[0] = v3;
  a1[1].n128_u64[1] = v8;
  return result;
}

uint64_t sub_22BDB5678(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(char *), uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a8 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v12) = *((unsigned char *)v14 + 16);
  long long v19 = *v14;
  char v20 = v12;
  uint64_t v15 = type metadata accessor for PreviewArguments.InhabitedSections();
  sub_22BDB59AC((uint64_t)v13, v21, (uint64_t)&v19, v15);
  uint64_t v16 = v21[0];
  uint64_t v17 = v21[1];
  a5(v13);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, a8);
  *a2 = v16;
  a2[1] = v17;
  return result;
}

uint64_t sub_22BDB57A4()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(type metadata accessor for PreviewArguments.InhabitedSections() - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  uint64_t v7 = v0 + v4;
  swift_bridgeObjectRelease();
  uint64_t v8 = type metadata accessor for PreviewSection();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v7 + *(int *)(v8 + 28), v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_22BDB58DC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(v3 + 16);
  uint64_t v8 = *(void *)(v3 + 24);
  uint64_t v9 = *(void *)(type metadata accessor for PreviewArguments.InhabitedSections() - 8);
  unint64_t v10 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = v3 + v10;
  uint64_t v12 = v3 + ((*(void *)(v9 + 64) + v10 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = *(void (**)(char *))v12;
  uint64_t v14 = *(void *)(v12 + 8);

  return sub_22BDB5678(a1, a2, a3, v11, v13, v14, v7, v8);
}

uint64_t sub_22BDB59AC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v31 = a4;
  uint64_t v8 = *(void *)(a4 + 16);
  uint64_t v9 = sub_22BDBFF60();
  uint64_t v28 = *(void *)(v9 - 8);
  uint64_t v29 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v30 = (uint64_t)&v26 - v10;
  uint64_t v11 = type metadata accessor for PreviewSection();
  uint64_t v12 = sub_22BDBFF60();
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v26 - v14;
  uint64_t v16 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v13);
  long long v19 = (char *)&v26 - v18;
  if (*(unsigned char *)(a3 + 16)) {
    goto LABEL_4;
  }
  uint64_t v26 = v17;
  uint64_t v27 = a1;
  uint64_t v21 = *(void *)a3;
  uint64_t v20 = *(void *)(a3 + 8);
  sub_22BDB9E0C(v21, v31, (uint64_t)v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v15, 1, v11) == 1)
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v15, v12);
    a1 = v27;
LABEL_4:
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(a1, v4 + *(int *)(v11 + 28), v8);
    *a2 = 0;
    a2[1] = 0;
    return result;
  }
  uint64_t v23 = v21;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v19, v15, v11);
  uint64_t v24 = v30;
  sub_22BDB9F38(v20, v11, v30);
  uint64_t v25 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v24, 1, v8) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v24, v29);
    (*(void (**)(uint64_t, char *, uint64_t))(v25 + 16))(v27, &v19[*(int *)(v11 + 28)], v8);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v19, v11);
    *a2 = v23;
    a2[1] = 0;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v11);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 32))(v27, v24, v8);
    *a2 = v23;
    a2[1] = v20;
  }
  return result;
}

BOOL static PreviewSourceContentDomain.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PreviewSourceContentDomain.hash(into:)()
{
  return sub_22BDC00E0();
}

uint64_t PreviewSourceContentDomain.hashValue.getter()
{
  return sub_22BDC0100();
}

uint64_t PreviewSourceContentCategory.rawValue.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

DeveloperToolsSupport::PreviewSourceContentCategory __swiftcall PreviewSourceContentCategory.init(stringLiteral:)(DeveloperToolsSupport::PreviewSourceContentCategory stringLiteral)
{
  DeveloperToolsSupport::PreviewSourceContentCategory *v1 = stringLiteral;
  return stringLiteral;
}

void *sub_22BDB5E04@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t sub_22BDB5E10@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *v2;
  uint64_t v4 = v2[1];
  uint64_t v6 = *(uint64_t *)((char *)v2 + *(int *)(a1 + 32));
  uint64_t v7 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t result = MEMORY[0x230F53C90](v6, v7);
  if (__OFADD__(result, 1))
  {
    __break(1u);
  }
  else
  {
    *a2 = v5;
    a2[1] = v4;
    a2[2] = result + 1;
  }
  return result;
}

double sub_22BDB5E78@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for PreviewSection();
  sub_22BDB5E10(v2, &v5);
  uint64_t v3 = v6;
  double result = *(double *)&v5;
  *(_OWORD *)a1 = v5;
  *(void *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_22BDB5ECC(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v28 = a5;
  uint64_t v29 = a8;
  uint64_t v38 = a1;
  uint64_t v39 = a2;
  uint64_t v27 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  unsigned __int8 v40 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v33 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v12 = (char *)&v26 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v30 = *(void *)(v15 - 8);
  uint64_t v31 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v26 - v16;
  uint64_t v18 = sub_22BDBFED0();
  if (!v18) {
    return sub_22BDBFE50();
  }
  uint64_t v19 = v18;
  uint64_t v43 = sub_22BDBFFD0();
  uint64_t v32 = sub_22BDBFFE0();
  sub_22BDBFFB0();
  uint64_t v36 = v8;
  uint64_t result = sub_22BDBFEC0();
  if (v19 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v34 = (void (**)(char *))(v33 + 2);
    unint64_t v35 = v14;
    ++v33;
    while (1)
    {
      uint64_t v21 = (void (*)(char *, void))sub_22BDBFF10();
      uint64_t v22 = v12;
      uint64_t v23 = v12;
      uint64_t v24 = AssociatedTypeWitness;
      (*v34)(v22);
      v21(v42, 0);
      uint64_t v25 = v41;
      v38(v23, v40);
      if (v25) {
        break;
      }
      uint64_t v41 = 0;
      (*v33)(v23, v24);
      sub_22BDBFFC0();
      sub_22BDBFEE0();
      --v19;
      uint64_t v12 = v23;
      if (!v19)
      {
        (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
        return v43;
      }
    }
    (*v33)(v23, v24);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v27 + 32))(v29, v40, v28);
  }
  return result;
}

DeveloperToolsSupport::PreviewGroupMetadata __swiftcall PreviewGroupMetadata.init(firstSection:moreSections:)(DeveloperToolsSupport::PreviewGroupMetadata::Section firstSection, Swift::OpaquePointer moreSections)
{
  uint64_t v3 = *(void *)(firstSection.title.value._countAndFlagsBits + 16);
  *(_OWORD *)uint64_t v2 = *(_OWORD *)firstSection.title.value._countAndFlagsBits;
  *(void *)(v2 + 16) = v3;
  *(void *)(v2 + 24) = firstSection.title.value._object;
  result.firstSection = firstSection;
  result.moreSections = moreSections;
  return result;
}

DeveloperToolsSupport::PreviewGroupIndex __swiftcall PreviewGroupIndex.init(section:preview:)(Swift::Int section, Swift::Int preview)
{
  Swift::Int *v2 = section;
  v2[1] = preview;
  result.preview = preview;
  result.section = section;
  return result;
}

DeveloperToolsSupport::PreviewGroupMetadata::Section __swiftcall PreviewGroupMetadata.Section.init(title:previewCount:)(Swift::String_optional title, Swift::Int previewCount)
{
  Swift::String_optional *v2 = title;
  v2[1].value._countAndFlagsBits = previewCount;
  result.title = title;
  result.previewCount = previewCount;
  return result;
}

uint64_t PreviewGroupMetadata.Section.title.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviewGroupMetadata.Section.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*PreviewGroupMetadata.Section.title.modify())()
{
  return nullsub_1;
}

uint64_t PreviewGroupMetadata.Section.previewCount.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t PreviewGroupMetadata.Section.previewCount.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*PreviewGroupMetadata.Section.previewCount.modify())()
{
  return nullsub_1;
}

uint64_t PreviewGroupMetadata.Section.hash(into:)()
{
  if (*(void *)(v0 + 8))
  {
    sub_22BDC00F0();
    swift_bridgeObjectRetain();
    sub_22BDBFDA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_22BDC00F0();
  }
  return sub_22BDC00E0();
}

uint64_t PreviewGroupMetadata.Section.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_22BDC00D0();
  sub_22BDC00F0();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_22BDBFDA0();
    swift_bridgeObjectRelease();
  }
  sub_22BDC00E0();
  return sub_22BDC0100();
}

uint64_t sub_22BDB64B4()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_22BDC00D0();
  sub_22BDC00F0();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_22BDBFDA0();
    swift_bridgeObjectRelease();
  }
  sub_22BDC00E0();
  return sub_22BDC0100();
}

uint64_t sub_22BDB6544()
{
  if (*(void *)(v0 + 8))
  {
    sub_22BDC00F0();
    swift_bridgeObjectRetain();
    sub_22BDBFDA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_22BDC00F0();
  }
  return sub_22BDC00E0();
}

uint64_t sub_22BDB65B8()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_22BDC00D0();
  sub_22BDC00F0();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_22BDBFDA0();
    swift_bridgeObjectRelease();
  }
  sub_22BDC00E0();
  return sub_22BDC0100();
}

uint64_t PreviewGroupMetadata.firstSection.getter@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = *(void *)v1;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
  return swift_bridgeObjectRetain();
}

__n128 PreviewGroupMetadata.firstSection.setter(__n128 *a1)
{
  __n128 v4 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  swift_bridgeObjectRelease();
  __n128 result = v4;
  __n128 *v1 = v4;
  v1[1].n128_u64[0] = v2;
  return result;
}

uint64_t (*PreviewGroupMetadata.firstSection.modify())()
{
  return nullsub_1;
}

uint64_t PreviewGroupMetadata.moreSections.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PreviewGroupMetadata.moreSections.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*PreviewGroupMetadata.moreSections.modify())()
{
  return nullsub_1;
}

uint64_t PreviewGroupMetadata.hash(into:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  if (*(void *)(v1 + 8))
  {
    sub_22BDC00F0();
    swift_bridgeObjectRetain();
    sub_22BDBFDA0();
  }
  else
  {
    sub_22BDC00F0();
  }
  sub_22BDC00E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22BDB6CC8(a1, v3);

  return swift_bridgeObjectRelease();
}

uint64_t sub_22BDB67CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = (uint64_t *)(a2 + 48);
    __n128 v4 = (uint64_t *)(a1 + 48);
    do
    {
      uint64_t v6 = *(v4 - 1);
      uint64_t v7 = *v4;
      uint64_t v8 = *(v3 - 1);
      uint64_t v9 = *v3;
      if (v6)
      {
        if (!v8) {
          return 0;
        }
        if (*(v4 - 2) == *(v3 - 2) && v6 == v8)
        {
          if (v7 != v9) {
            return 0;
          }
        }
        else
        {
          char v11 = sub_22BDC0070();
          uint64_t result = 0;
          if ((v11 & 1) == 0 || v7 != v9) {
            return result;
          }
        }
      }
      else
      {
        if (v8) {
          BOOL v5 = 0;
        }
        else {
          BOOL v5 = v7 == v9;
        }
        if (!v5) {
          return 0;
        }
      }
      v3 += 3;
      v4 += 3;
      --v2;
    }
    while (v2);
  }
  return 1;
}

uint64_t PreviewGroupMetadata.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 24);
  sub_22BDC00D0();
  sub_22BDC00F0();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_22BDBFDA0();
  }
  sub_22BDC00E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22BDB6CC8((uint64_t)v4, v2);
  swift_bridgeObjectRelease();
  return sub_22BDC0100();
}

uint64_t sub_22BDB694C(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  if (*(void *)(v1 + 8))
  {
    sub_22BDC00F0();
    swift_bridgeObjectRetain();
    sub_22BDBFDA0();
  }
  else
  {
    sub_22BDC00F0();
  }
  sub_22BDC00E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22BDB6CC8(a1, v3);

  return swift_bridgeObjectRelease();
}

uint64_t sub_22BDB69FC()
{
  uint64_t v1 = *(void *)(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 24);
  sub_22BDC00D0();
  sub_22BDC00F0();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_22BDBFDA0();
  }
  sub_22BDC00E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22BDB6CC8((uint64_t)v4, v2);
  swift_bridgeObjectRelease();
  return sub_22BDC0100();
}

uint64_t PreviewGroupIndex.section.getter()
{
  return *(void *)v0;
}

uint64_t PreviewGroupIndex.section.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*PreviewGroupIndex.section.modify())()
{
  return nullsub_1;
}

uint64_t PreviewGroupIndex.preview.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t PreviewGroupIndex.preview.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*PreviewGroupIndex.preview.modify())()
{
  return nullsub_1;
}

uint64_t PreviewGroupIndex.hash(into:)()
{
  return sub_22BDC00E0();
}

BOOL static PreviewGroupIndex.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

uint64_t PreviewGroupIndex.hashValue.getter()
{
  return sub_22BDC0100();
}

uint64_t sub_22BDB6BC0()
{
  return sub_22BDC0100();
}

uint64_t sub_22BDB6C1C()
{
  return sub_22BDC00E0();
}

uint64_t sub_22BDB6C58()
{
  return sub_22BDC0100();
}

BOOL sub_22BDB6CB0(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

uint64_t sub_22BDB6CC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_22BDC00E0();
  if (v3)
  {
    uint64_t v5 = a2 + 48;
    do
    {
      if (*(void *)(v5 - 8))
      {
        sub_22BDC00F0();
        swift_bridgeObjectRetain();
        sub_22BDBFDA0();
      }
      else
      {
        sub_22BDC00F0();
      }
      v5 += 24;
      sub_22BDC00E0();
      uint64_t result = swift_bridgeObjectRelease();
      --v3;
    }
    while (v3);
  }
  return result;
}

BOOL _s21DeveloperToolsSupport20PreviewGroupMetadataV7SectionV2eeoiySbAE_AEtFZ_0(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = a2[1];
  uint64_t v6 = a2[2];
  if (!v3)
  {
    if (!v5) {
      return v4 == v6;
    }
    return 0;
  }
  if (!v5) {
    return 0;
  }
  if (*a1 == *a2 && v3 == v5) {
    return v4 == v6;
  }
  char v8 = sub_22BDC0070();
  BOOL result = 0;
  if (v8) {
    return v4 == v6;
  }
  return result;
}

uint64_t _s21DeveloperToolsSupport20PreviewGroupMetadataV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v6 = a2[1];
  uint64_t v7 = a2[2];
  uint64_t v8 = a2[3];
  if (!v3)
  {
    if (v6) {
      BOOL v11 = 0;
    }
    else {
      BOOL v11 = v4 == v7;
    }
    if (v11) {
      goto LABEL_9;
    }
    return 0;
  }
  if (!v6) {
    return 0;
  }
  BOOL v9 = *a1 == *a2 && v3 == v6;
  if (!v9 && (sub_22BDC0070() & 1) == 0 || v4 != v7) {
    return 0;
  }
LABEL_9:

  return sub_22BDB67CC(v5, v8);
}

unint64_t sub_22BDB6E7C()
{
  unint64_t result = qword_268483ED8;
  if (!qword_268483ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268483ED8);
  }
  return result;
}

unint64_t sub_22BDB6ED4()
{
  unint64_t result = qword_268483EE0;
  if (!qword_268483EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268483EE0);
  }
  return result;
}

uint64_t sub_22BDB6F28()
{
  return MEMORY[0x263F8D388];
}

unint64_t sub_22BDB6F38()
{
  unint64_t result = qword_268483EE8;
  if (!qword_268483EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268483EE8);
  }
  return result;
}

uint64_t sub_22BDB6F8C()
{
  return MEMORY[0x263F8D398];
}

uint64_t sub_22BDB6F98()
{
  return MEMORY[0x263F8D390];
}

unint64_t sub_22BDB6FA8()
{
  unint64_t result = qword_268483EF0;
  if (!qword_268483EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268483EF0);
  }
  return result;
}

unint64_t sub_22BDB7000()
{
  unint64_t result = qword_268483EF8;
  if (!qword_268483EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268483EF8);
  }
  return result;
}

unint64_t sub_22BDB7058()
{
  unint64_t result = qword_268483F00[0];
  if (!qword_268483F00[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268483F00);
  }
  return result;
}

uint64_t dispatch thunk of PreviewSource.contentDomain.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PreviewSource.contentCategory.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PreviewSource.supportsOnDevicePreviews.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PreviewSource.supportsInteractivePreviews.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_22BDB70FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_22BDB7104(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  char v8 = *(unsigned char *)(a1 + 80);

  return sub_22BDB50D4(v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_22BDB714C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  uint64_t v6 = *(void *)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 56);
  uint64_t v8 = *(void *)(a2 + 64);
  uint64_t v9 = *(void *)(a2 + 72);
  char v10 = *(unsigned char *)(a2 + 80);
  swift_bridgeObjectRetain();
  sub_22BDB5000(v4, v5, v6, v7, v8, v9, v10);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 64) = v8;
  *(void *)(a1 + 72) = v9;
  *(unsigned char *)(a1 + 80) = v10;
  return a1;
}

uint64_t sub_22BDB71E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(v2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(v2 + 25);
  uint64_t v4 = *(void *)(v2 + 32);
  uint64_t v5 = *(void *)(v2 + 40);
  uint64_t v6 = *(void *)(v2 + 48);
  uint64_t v7 = *(void *)(v2 + 56);
  uint64_t v8 = *(void *)(v2 + 64);
  uint64_t v9 = *(void *)(v2 + 72);
  LOBYTE(v2) = *(unsigned char *)(v2 + 80);
  sub_22BDB5000(v4, v5, v6, v7, v8, v9, v2);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 64);
  uint64_t v15 = *(void *)(a1 + 72);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 64) = v8;
  *(void *)(a1 + 72) = v9;
  char v16 = *(unsigned char *)(a1 + 80);
  *(unsigned char *)(a1 + 80) = v2;
  sub_22BDB50D4(v10, v11, v12, v13, v14, v15, v16);
  return a1;
}

__n128 __swift_memcpy81_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t sub_22BDB72D4(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  char v5 = *(unsigned char *)(a2 + 80);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 72);
  long long v12 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v12;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  char v13 = *(unsigned char *)(a1 + 80);
  *(unsigned char *)(a1 + 80) = v5;
  sub_22BDB50D4(v6, v7, v8, v9, v10, v11, v13);
  return a1;
}

uint64_t sub_22BDB7350(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 81)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_22BDB7398(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 80) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 81) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 81) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for DefaultPreviewSource()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22BDB7408(uint64_t a1)
{
  return sub_22BDB50D4(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned char *)(a1 + 48));
}

uint64_t sub_22BDB7420(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(unsigned char *)(a2 + 48);
  sub_22BDB5000(*(void *)a2, v4, v5, v6, v7, v8, v9);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(unsigned char *)(a1 + 48) = v9;
  return a1;
}

uint64_t sub_22BDB749C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(unsigned char *)(a2 + 48);
  sub_22BDB5000(*(void *)a2, v4, v5, v6, v7, v8, v9);
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
  sub_22BDB50D4(v10, v11, v12, v13, v14, v15, v16);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_22BDB7548(uint64_t a1, uint64_t a2)
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
  sub_22BDB50D4(v4, v6, v5, v7, v8, v9, v11);
  return a1;
}

uint64_t sub_22BDB75A0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 49)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t sub_22BDB75E8(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 49) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 49) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 48) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_22BDB763C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 48) <= 1u) {
    return *(unsigned __int8 *)(a1 + 48);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_22BDB7654(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)(result + 40) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 48) = a2;
  return result;
}

uint64_t type metadata accessor for DefaultPreviewSource.Structure()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t getEnumTagSinglePayload for PreviewSourceContentDomain(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PreviewSourceContentDomain(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22BDB77F0);
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

ValueMetadata *type metadata accessor for PreviewSourceContentDomain()
{
  return &type metadata for PreviewSourceContentDomain;
}

void *initializeBufferWithCopyOfBuffer for PreviewSourceContentCategory(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PreviewSourceContentCategory(void *a1, void *a2)
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

void *assignWithTake for PreviewSourceContentCategory(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewSourceContentCategory(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PreviewSourceContentCategory(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PreviewSourceContentCategory()
{
  return &type metadata for PreviewSourceContentCategory;
}

uint64_t destroy for PreviewGroupMetadata()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for PreviewGroupMetadata(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PreviewGroupMetadata(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for PreviewGroupMetadata(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewGroupMetadata(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewGroupMetadata(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewGroupMetadata()
{
  return &type metadata for PreviewGroupMetadata;
}

uint64_t destroy for PreviewGroupMetadata.Section()
{
  return swift_bridgeObjectRelease();
}

void *_s21DeveloperToolsSupport20PreviewGroupMetadataV7SectionVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PreviewGroupMetadata.Section(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

void *assignWithTake for PreviewGroupMetadata.Section(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewGroupMetadata.Section(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewGroupMetadata.Section(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewGroupMetadata.Section()
{
  return &type metadata for PreviewGroupMetadata.Section;
}

uint64_t getEnumTagSinglePayload for PreviewGroupIndex(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PreviewGroupIndex(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for PreviewGroupIndex()
{
  return &type metadata for PreviewGroupIndex;
}

uint64_t sub_22BDB7D34()
{
  return 8;
}

void *sub_22BDB7D40(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_22BDB7D4C()
{
  return swift_getAtKeyPath();
}

float PreviewCamera.Point.x.getter()
{
  return *(float *)v0;
}

float PreviewCamera.Point.y.getter()
{
  return *(float *)(v0 + 4);
}

float PreviewCamera.Point.z.getter()
{
  return *(float *)(v0 + 8);
}

DeveloperToolsSupport::PreviewCamera::Point __swiftcall PreviewCamera.Point.init(x:y:z:)(Swift::Float x, Swift::Float y, Swift::Float z)
{
  Swift::Float *v3 = x;
  v3[1] = y;
  v3[2] = z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

uint64_t PreviewCamera.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(v1 + 32);
  char v6 = *(unsigned char *)(v1 + 40);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  return sub_22BDB7DD0();
}

uint64_t sub_22BDB7DD0()
{
  return swift_bridgeObjectRetain();
}

__n128 PreviewCamera.init(_:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(a1 + 40);
  __n128 result = *(__n128 *)a1;
  long long v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v5;
  *(void *)(a2 + 32) = v2;
  *(unsigned char *)(a2 + 40) = v3;
  return result;
}

uint64_t static PreviewCameraBuilder.buildExpression(_:)(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[4];
  char v6 = *((unsigned char *)a1 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268484008);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_22BDC09F0;
  *(void *)(v7 + 32) = v1;
  *(void *)(v7 + 40) = v2;
  *(void *)(v7 + 48) = v3;
  *(void *)(v7 + 56) = v4;
  *(void *)(v7 + 64) = v5;
  *(unsigned char *)(v7 + 72) = v6;
  sub_22BDB7DD0();
  return v7;
}

char *static PreviewCameraBuilder.buildArray(_:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)MEMORY[0x263F8EE78];
  }
  __n128 result = (char *)swift_bridgeObjectRetain();
  uint64_t v4 = 0;
  uint64_t v5 = (char *)MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v6 = *(void *)(a1 + 8 * v4 + 32);
    uint64_t v7 = *(void *)(v6 + 16);
    int64_t v8 = *((void *)v5 + 2);
    int64_t v9 = v8 + v7;
    if (__OFADD__(v8, v7)) {
      break;
    }
    swift_bridgeObjectRetain();
    __n128 result = (char *)swift_isUniquelyReferenced_nonNull_native();
    if (result && v9 <= *((void *)v5 + 3) >> 1)
    {
      if (*(void *)(v6 + 16)) {
        goto LABEL_14;
      }
    }
    else
    {
      if (v8 <= v9) {
        int64_t v10 = v8 + v7;
      }
      else {
        int64_t v10 = v8;
      }
      __n128 result = sub_22BDB8298(result, v10, 1, v5);
      uint64_t v5 = result;
      if (*(void *)(v6 + 16))
      {
LABEL_14:
        if ((*((void *)v5 + 3) >> 1) - *((void *)v5 + 2) < v7) {
          goto LABEL_23;
        }
        __n128 result = (char *)swift_arrayInitWithCopy();
        if (v7)
        {
          uint64_t v11 = *((void *)v5 + 2);
          BOOL v12 = __OFADD__(v11, v7);
          uint64_t v13 = v11 + v7;
          if (v12) {
            goto LABEL_24;
          }
          *((void *)v5 + 2) = v13;
        }
        goto LABEL_4;
      }
    }
    if (v7) {
      goto LABEL_22;
    }
LABEL_4:
    __n128 result = (char *)swift_bridgeObjectRelease();
    if (v1 == ++v4)
    {
      swift_bridgeObjectRelease();
      return v5;
    }
  }
  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t PreviewCameraTrait.value.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t static PreviewCameraTrait.defaultValue.getter()
{
  return MEMORY[0x263F8EE78];
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _s21DeveloperToolsSupport20PreviewCameraBuilderV17buildPartialBlock11accumulated4nextSayAA0dE0VGAI_AItFZ_0()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = swift_bridgeObjectRetain();
  sub_22BDB81A8(v0);
}

uint64_t sub_22BDB8044@<X0>(void *a1@<X8>)
{
  *a1 = *v1;
  return swift_bridgeObjectRetain();
}

void sub_22BDB8050(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE78];
}

uint64_t sub_22BDB8060@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *a1;
  swift_bridgeObjectRetain();
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t result = sub_22BDB81A8(v3);
  *a2 = v5;
  return result;
}

uint64_t static PreviewTrait<A>.camera(_:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  char v8 = *((unsigned char *)a1 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268484008);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_22BDC09F0;
  *(void *)(v9 + 32) = v3;
  *(void *)(v9 + 40) = v4;
  *(void *)(v9 + 48) = v5;
  *(void *)(v9 + 56) = v6;
  *(void *)(v9 + 64) = v7;
  *(unsigned char *)(v9 + 72) = v8;
  uint64_t v13 = &type metadata for PreviewCameraTrait;
  uint64_t v14 = &protocol witness table for PreviewCameraTrait;
  *(void *)&long long v12 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268483CF0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_22BDC09F0;
  sub_22BDB2CD8(&v12, v10 + 32);
  *a2 = v10;
  return sub_22BDB7DD0();
}

uint64_t sub_22BDB81A8(uint64_t result)
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
    int64_t v10 = v4 + v2;
  }
  else {
    int64_t v10 = v4;
  }
  uint64_t result = (uint64_t)sub_22BDB8298((char *)result, v10, 1, (char *)v3);
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
  if ((*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t *v1 = v3;
    return result;
  }
  uint64_t v7 = *(void *)(v3 + 16);
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    *(void *)(v3 + 16) = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

char *sub_22BDB8298(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268484008);
    int64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  long long v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
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

uint64_t sub_22BDB83B4()
{
  return swift_bridgeObjectRelease();
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

ValueMetadata *type metadata accessor for PreviewCamera()
{
  return &type metadata for PreviewCamera;
}

uint64_t __swift_memcpy12_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for PreviewCamera.Point(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 12)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PreviewCamera.Point(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PreviewCamera.Point()
{
  return &type metadata for PreviewCamera.Point;
}

uint64_t _s21DeveloperToolsSupport13PreviewCameraV5ValueOwxx_0()
{
  return sub_22BDB83B4();
}

uint64_t _s21DeveloperToolsSupport13PreviewCameraV5ValueOwcp_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  char v8 = *((unsigned char *)a2 + 40);
  sub_22BDB7DD0();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  return a1;
}

uint64_t _s21DeveloperToolsSupport13PreviewCameraV5ValueOwca_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  char v8 = *((unsigned char *)a2 + 40);
  sub_22BDB7DD0();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  sub_22BDB83B4();
  return a1;
}

uint64_t _s21DeveloperToolsSupport13PreviewCameraV5ValueOwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  char v4 = *(unsigned char *)(a2 + 40);
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  *(void *)(a1 + 32) = v3;
  *(unsigned char *)(a1 + 40) = v4;
  sub_22BDB83B4();
  return a1;
}

uint64_t _s21DeveloperToolsSupport13PreviewCameraV5ValueOwet_0(uint64_t a1, unsigned int a2)
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

uint64_t _s21DeveloperToolsSupport13PreviewCameraV5ValueOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_22BDB866C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_22BDB8674(uint64_t result, char a2)
{
  *(unsigned char *)(result + 40) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewCamera.Value()
{
  return &type metadata for PreviewCamera.Value;
}

ValueMetadata *type metadata accessor for PreviewCameraBuilder()
{
  return &type metadata for PreviewCameraBuilder;
}

ValueMetadata *type metadata accessor for PreviewCameraTrait()
{
  return &type metadata for PreviewCameraTrait;
}

void static LibraryItem.Category.effect.getter(void *a1@<X8>)
{
  *a1 = 0x746365666665;
  a1[1] = 0xE600000000000000;
}

void static LibraryItem.Category.layout.getter(void *a1@<X8>)
{
  *a1 = 0x74756F79616CLL;
  a1[1] = 0xE600000000000000;
}

void static LibraryItem.Category.control.getter(void *a1@<X8>)
{
  *a1 = 0x6C6F72746E6F63;
  a1[1] = 0xE700000000000000;
}

void static LibraryItem.Category.other.getter(void *a1@<X8>)
{
  *a1 = 0x726568746FLL;
  a1[1] = 0xE500000000000000;
}

uint64_t LibraryItem.init<A>(_:visible:title:category:matchingSignature:)()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t static LibraryContentBuilder.buildBlock(_:)()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_22BDB87FC(v0);
  swift_bridgeObjectRelease();
  return v1;
}

double static LibraryContentBuilder.buildExpression(_:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268484010);
  uint64_t v0 = swift_allocObject();
  *(void *)&double result = 1;
  *(_OWORD *)(v0 + 16) = xmmword_22BDC09F0;
  return result;
}

uint64_t sub_22BDB87D8()
{
  return MEMORY[0x263F8EE78];
}

uint64_t LibraryContentProvider.views.getter()
{
  return MEMORY[0x263F8EE78];
}

uint64_t LibraryContentProvider.modifiers(base:)()
{
  return MEMORY[0x263F8EE78];
}

uint64_t sub_22BDB87FC(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  uint64_t result = swift_bridgeObjectRetain();
  size_t v4 = 0;
  unint64_t v5 = 0;
  uint64_t v6 = (char *)MEMORY[0x263F8EE78];
LABEL_3:
  unint64_t v8 = *(void *)(a1 + 16);
  if (v5 != v8)
  {
    if (v5 >= v8)
    {
LABEL_29:
      __break(1u);
    }
    else
    {
      while (1)
      {
        uint64_t v9 = *(void *)(v2 + 8 * v5);
        swift_bridgeObjectRetain();
        uint64_t result = swift_bridgeObjectRelease();
        if (v9)
        {
          unint64_t v7 = *(void *)(v9 + 16);
          if (v7) {
            break;
          }
        }
        ++v5;
        unint64_t v10 = *(void *)(a1 + 16);
        if (v5 == v10) {
          goto LABEL_25;
        }
        if (v5 >= v10) {
          goto LABEL_29;
        }
      }
      unint64_t v11 = 0;
      ++v5;
      while (v11 < v7)
      {
        if (!v4)
        {
          unint64_t v12 = *((void *)v6 + 3);
          if ((uint64_t)((v12 >> 1) + 0x4000000000000000) < 0) {
            goto LABEL_32;
          }
          int64_t v13 = v12 & 0xFFFFFFFFFFFFFFFELL;
          if (v13 <= 1) {
            uint64_t v14 = 1;
          }
          else {
            uint64_t v14 = v13;
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_268484010);
          uint64_t v15 = (char *)swift_allocObject();
          size_t v16 = 2 * _swift_stdlib_malloc_size(v15) - 64;
          *((void *)v15 + 2) = v14;
          *((void *)v15 + 3) = v16;
          size_t v17 = *((void *)v6 + 3) >> 1;
          if (*((void *)v6 + 2))
          {
            uint64_t v18 = v15 + 32;
            uint64_t v19 = v6 + 32;
            if (v15 != v6 || v18 >= &v19[v17]) {
              memmove(v18, v19, v17);
            }
            *((void *)v6 + 2) = 0;
          }
          size_t v4 = (v16 >> 1) - v17;
          uint64_t result = swift_release();
          uint64_t v6 = v15;
        }
        BOOL v20 = __OFSUB__(v4--, 1);
        if (v20) {
          goto LABEL_31;
        }
        ++v11;
        unint64_t v7 = *(void *)(v9 + 16);
        if (v11 == v7) {
          goto LABEL_3;
        }
      }
    }
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
LABEL_25:
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v21 = *((void *)v6 + 3);
  if (v21 < 2) {
    return (uint64_t)v6;
  }
  unint64_t v22 = v21 >> 1;
  BOOL v20 = __OFSUB__(v22, v4);
  unint64_t v23 = v22 - v4;
  if (!v20)
  {
    *((void *)v6 + 2) = v23;
    return (uint64_t)v6;
  }
LABEL_33:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for LibraryItem()
{
  return &type metadata for LibraryItem;
}

ValueMetadata *type metadata accessor for LibraryItem.Category()
{
  return &type metadata for LibraryItem.Category;
}

ValueMetadata *type metadata accessor for LibraryContentBuilder()
{
  return &type metadata for LibraryContentBuilder;
}

uint64_t dispatch thunk of LibraryContentProvider.views.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of LibraryContentProvider.modifiers(base:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t Preview.displayName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Preview.source.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22BDB9900(v1 + 16, a1);
}

uint64_t Preview.init<A, B>(displayName:source:traits:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X5>, uint64_t a5@<X6>, void *a6@<X8>)
{
  *a6 = a1;
  a6[1] = a2;
  a6[5] = a4;
  a6[6] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a6 + 2);
  uint64_t v10 = *(void *)(a4 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v10 + 16))(boxed_opaque_existential_1, a3, a4);
  swift_getKeyPath();
  type metadata accessor for PreviewTrait();
  sub_22BDBFE90();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268483CF8);
  swift_getWitnessTable();
  sub_22BDB2E80();
  uint64_t v11 = sub_22BDBFE10();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a3, a4);
  swift_bridgeObjectRelease();
  uint64_t result = swift_release();
  a6[7] = v11;
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_22BDB8C58()
{
  return swift_bridgeObjectRelease();
}

uint64_t Preview.init<A>(displayName:source:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = a1;
  a6[1] = a2;
  a6[5] = a4;
  a6[6] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a6 + 2);
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_1, a3, a4);
  a6[7] = MEMORY[0x263F8EE78];
  return result;
}

uint64_t Preview.value<A>(for:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v24 = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = sub_22BDBFF60();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  unint64_t v23 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  int64_t v13 = (char *)&v21 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v21 - v14;
  uint64_t v29 = *(void *)(v3 + 56);
  uint64_t v27 = a1;
  uint64_t v28 = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268483CF8);
  sub_22BDB2E80();
  uint64_t v16 = sub_22BDBFDE0();
  swift_bridgeObjectRelease();
  uint64_t v29 = v16;
  uint64_t v17 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v13, 1, 1, AssociatedTypeWitness);
  uint64_t v25 = a1;
  uint64_t v26 = a2;
  uint64_t v22 = a2;
  sub_22BDBFE90();
  swift_getWitnessTable();
  sub_22BDBFE00();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v8 + 8);
  v18(v13, v7);
  swift_bridgeObjectRelease();
  uint64_t v19 = v23;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v23, v15, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v19, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(uint64_t))(v22 + 24))(a1);
    v18(v15, v7);
    return ((uint64_t (*)(char *, uint64_t))v18)(v19, v7);
  }
  else
  {
    v18(v15, v7);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32))(v24, v19, AssociatedTypeWitness);
  }
}

uint64_t sub_22BDB9070@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_22BDB9900(a1, (uint64_t)v7);
  __swift_instantiateConcreteTypeFromMangledName(qword_268484018);
  int v5 = swift_dynamicCast();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56))(a3, v5 ^ 1u, 1, a2);
}

uint64_t sub_22BDB9110@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22BDB9070(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_22BDB912C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  v23[1] = a2;
  uint64_t v25 = a5;
  uint64_t v24 = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = sub_22BDBFF60();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v23 - v11;
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v10);
  uint64_t v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v23 - v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    uint64_t v19 = v25;
    (*(void (**)(uint64_t, uint64_t))(a4 + 16))(v24, a4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v12, AssociatedTypeWitness);
    uint64_t v20 = v24;
    (*(void (**)(uint64_t, uint64_t))(a4 + 16))(v24, a4);
    uint64_t v19 = v25;
    (*(void (**)(char *, char *, uint64_t, uint64_t))(a4 + 32))(v18, v16, v20, a4);
    uint64_t v21 = *(void (**)(char *, uint64_t))(v13 + 8);
    v21(v16, AssociatedTypeWitness);
    v21(v18, AssociatedTypeWitness);
  }
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56))(v19, 0, 1, AssociatedTypeWitness);
}

uint64_t sub_22BDB93F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_22BDB912C(a1, a2, *(void *)(v3 + 16), *(void *)(v3 + 24), a3);
}

uint64_t destroy for Preview(uint64_t a1)
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);

  return swift_bridgeObjectRelease();
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

uint64_t initializeWithCopy for Preview(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = a2 + 16;
  long long v6 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v6;
  uint64_t v7 = v6;
  uint64_t v8 = **(void (***)(uint64_t, uint64_t, uint64_t))(v6 - 8);
  swift_bridgeObjectRetain();
  v8(a1 + 16, v5, v7);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Preview(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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
        uint64_t *v3 = v12;
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
          uint64_t *v3 = *a2;
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

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Preview(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Preview(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Preview(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Preview()
{
  return &type metadata for Preview;
}

uint64_t sub_22BDB9900(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t static PreviewTrait<A>.defaultLayout.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v6 = &type metadata for PreviewLayoutTrait;
  uint64_t v7 = &protocol witness table for PreviewLayoutTrait;
  uint64_t v2 = swift_allocObject();
  *(void *)&long long v5 = v2;
  *(void *)(v2 + 24) = 0;
  *(void *)(v2 + 32) = 0;
  *(void *)(v2 + 16) = 0;
  *(unsigned char *)(v2 + 40) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268483CF0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22BDC09F0;
  uint64_t result = sub_22BDB2CD8(&v5, v3 + 32);
  *a1 = v3;
  return result;
}

uint64_t sub_22BDB9A00()
{
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t static PreviewTrait<A>.sizeThatFitsLayout.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v6 = &type metadata for PreviewLayoutTrait;
  uint64_t v7 = &protocol witness table for PreviewLayoutTrait;
  uint64_t v2 = swift_allocObject();
  *(void *)&long long v5 = v2;
  *(void *)(v2 + 24) = 0;
  *(void *)(v2 + 32) = 0;
  *(void *)(v2 + 16) = 1;
  *(unsigned char *)(v2 + 40) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268483CF0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22BDC09F0;
  uint64_t result = sub_22BDB2CD8(&v5, v3 + 32);
  *a1 = v3;
  return result;
}

uint64_t static PreviewTrait<A>.fixedLayout(width:height:)@<X0>(uint64_t *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  uint64_t v10 = &type metadata for PreviewLayoutTrait;
  uint64_t v11 = &protocol witness table for PreviewLayoutTrait;
  uint64_t v6 = swift_allocObject();
  *(void *)&long long v9 = v6;
  *(double *)(v6 + 16) = a2;
  *(double *)(v6 + 24) = a3;
  *(void *)(v6 + 32) = 0;
  *(unsigned char *)(v6 + 40) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268483CF0);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_22BDC09F0;
  uint64_t result = sub_22BDB2CD8(&v9, v7 + 32);
  *a1 = v7;
  return result;
}

uint64_t static PreviewTrait<A>.fixedLayout(width:height:depth:)@<X0>(uint64_t *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>)
{
  uint64_t v12 = &type metadata for PreviewLayoutTrait;
  uint64_t v13 = &protocol witness table for PreviewLayoutTrait;
  uint64_t v8 = swift_allocObject();
  *(void *)&long long v11 = v8;
  *(double *)(v8 + 16) = a2;
  *(double *)(v8 + 24) = a3;
  *(double *)(v8 + 32) = a4;
  *(unsigned char *)(v8 + 40) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268483CF0);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_22BDC09F0;
  uint64_t result = sub_22BDB2CD8(&v11, v9 + 32);
  *a1 = v9;
  return result;
}

uint64_t static PreviewTrait<A>.portrait.getter@<X0>(uint64_t *a1@<X8>)
{
  long long v5 = &type metadata for PreviewInterfaceOrientationTrait;
  uint64_t v6 = &protocol witness table for PreviewInterfaceOrientationTrait;
  LOBYTE(v4) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268483CF0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_22BDC09F0;
  uint64_t result = sub_22BDB2CD8(&v4, v2 + 32);
  *a1 = v2;
  return result;
}

uint64_t static PreviewTrait<A>.landscapeLeft.getter@<X0>(uint64_t *a1@<X8>)
{
  long long v5 = &type metadata for PreviewInterfaceOrientationTrait;
  uint64_t v6 = &protocol witness table for PreviewInterfaceOrientationTrait;
  LOBYTE(v4) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268483CF0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_22BDC09F0;
  uint64_t result = sub_22BDB2CD8(&v4, v2 + 32);
  *a1 = v2;
  return result;
}

uint64_t static PreviewTrait<A>.landscapeRight.getter@<X0>(uint64_t *a1@<X8>)
{
  long long v5 = &type metadata for PreviewInterfaceOrientationTrait;
  uint64_t v6 = &protocol witness table for PreviewInterfaceOrientationTrait;
  LOBYTE(v4) = 3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268483CF0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_22BDC09F0;
  uint64_t result = sub_22BDB2CD8(&v4, v2 + 32);
  *a1 = v2;
  return result;
}

uint64_t static PreviewTrait<A>.portraitUpsideDown.getter@<X0>(uint64_t *a1@<X8>)
{
  long long v5 = &type metadata for PreviewInterfaceOrientationTrait;
  uint64_t v6 = &protocol witness table for PreviewInterfaceOrientationTrait;
  LOBYTE(v4) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268483CF0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_22BDC09F0;
  uint64_t result = sub_22BDB2CD8(&v4, v2 + 32);
  *a1 = v2;
  return result;
}

ValueMetadata *type metadata accessor for Preview.ViewTraits()
{
  return &type metadata for Preview.ViewTraits;
}

uint64_t sub_22BDB9E0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *(void *)(v3 + *(int *)(a2 + 28));
  uint64_t v7 = type metadata accessor for PreviewSection();
  if (MEMORY[0x230F53C90](v6, v7) >= a1)
  {
    if (a1)
    {
      uint64_t result = a1 - 1;
      if (__OFSUB__(a1, 1))
      {
        __break(1u);
        return result;
      }
      sub_22BDBFEB0();
      uint64_t v12 = *(void *)(v7 - 8);
    }
    else
    {
      uint64_t v12 = *(void *)(v7 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(a3, v3, v7);
    }
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
    uint64_t v9 = a3;
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = a3;
    uint64_t v10 = 1;
  }

  return v8(v9, v10, 1, v7);
}

uint64_t sub_22BDB9F38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void *)(a2 + 16);
  if (MEMORY[0x230F53C90](*(void *)(v3 + *(int *)(a2 + 32)), v7) >= a1)
  {
    if (a1)
    {
      uint64_t result = a1 - 1;
      if (__OFSUB__(a1, 1))
      {
        __break(1u);
        return result;
      }
      sub_22BDBFEB0();
      uint64_t v12 = *(void *)(v7 - 8);
    }
    else
    {
      uint64_t v12 = *(void *)(v7 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(a3, v3 + *(int *)(a2 + 28), v7);
    }
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
    uint64_t v9 = a3;
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = a3;
    uint64_t v10 = 1;
  }

  return v8(v9, v10, 1, v7);
}

uint64_t sub_22BDBA064@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for PreviewSection();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a3, a1, v6);
  uint64_t result = type metadata accessor for PreviewArguments.InhabitedSections();
  *(void *)(a3 + *(int *)(result + 28)) = a2;
  return result;
}

uint64_t sub_22BDBA0EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for PreviewArguments.InhabitedSections();
  uint64_t v7 = sub_22BDBFF60();
  uint64_t v34 = *(void *)(v7 - 8);
  uint64_t v35 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v29 = (uint64_t)&v27 - v8;
  uint64_t v30 = a2;
  uint64_t v9 = type metadata accessor for PreviewSection();
  uint64_t v10 = sub_22BDBFF60();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v27 - v13;
  uint64_t v15 = *(void *)(v9 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v12);
  uint64_t v28 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v27 - v18;
  uint64_t v20 = *(void *)(v6 - 8);
  uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
  uint64_t v36 = a3;
  uint64_t v32 = v21;
  uint64_t v33 = v6;
  uint64_t v31 = v20 + 56;
  v21(a3, 1, 1, v6);
  *(void *)&long long v39 = a1;
  sub_22BDBFE90();
  swift_getWitnessTable();
  sub_22BDBFEF0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v14, 1, v9) == 1)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    uint64_t v22 = v36;
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v36, v35);
    return v32(v22, 1, 1, v33);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v19, v14, v9);
    uint64_t v24 = (uint64_t)v28;
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v28, v19, v9);
    *(void *)&long long v37 = a1;
    sub_22BDBFF00();
    long long v37 = v39;
    long long v38 = v40;
    sub_22BDBFF80();
    swift_getWitnessTable();
    uint64_t v25 = sub_22BDBFEA0();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v19, v9);
    uint64_t v26 = v29;
    sub_22BDBA064(v24, v25, v29);
    v32(v26, 0, 1, v33);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 40))(v36, v26, v35);
  }
}

uint64_t PreviewSection.init(_:arguments:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t)@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v10 = type metadata accessor for PreviewSection();
  uint64_t v11 = sub_22BDBFF60();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v20 - v14;
  uint64_t v16 = a3(v13);
  sub_22BDBA6CC(a1, a2, v16, a4, (uint64_t)v15);
  uint64_t v17 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v10))
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    uint64_t v18 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(a5, v15, v10);
    uint64_t v18 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56))(a5, v18, 1, v10);
}

uint64_t type metadata accessor for PreviewSection()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22BDBA6CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v25 = a2;
  uint64_t v27 = a5;
  uint64_t v7 = sub_22BDBFF60();
  uint64_t v22 = *(void *)(v7 - 8);
  uint64_t v23 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for PreviewSection();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v22 - v16;
  *(void *)uint64_t v17 = 0;
  *((void *)v17 + 1) = 0;
  uint64_t v26 = a3;
  *(void *)&long long v30 = a3;
  sub_22BDBFE90();
  swift_getWitnessTable();
  sub_22BDBFEF0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, a4) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v10, v23);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v27, 1, 1, v14);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v10, a4);
    uint64_t v19 = v25;
    *(void *)uint64_t v17 = v24;
    *((void *)v17 + 1) = v19;
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(&v17[*(int *)(v14 + 28)], v13, a4);
    *(void *)&long long v28 = v26;
    sub_22BDBFF00();
    long long v28 = v30;
    long long v29 = v31;
    sub_22BDBFF80();
    swift_getWitnessTable();
    uint64_t v20 = sub_22BDBFEA0();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, a4);
    *(void *)&v17[*(int *)(v14 + 32)] = v20;
    uint64_t v21 = v27;
    (*(void (**)(uint64_t, char *, uint64_t))(v15 + 16))(v27, v17, v14);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(v21, 0, 1, v14);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
}

uint64_t _s21DeveloperToolsSupport23PreviewArgumentsBuilderV15buildExpressionyAC9ComponentVyx_GxFZ_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  type metadata accessor for PreviewArgumentsBuilder.Component.Item();
  sub_22BDC0060();
  swift_allocObject();
  uint64_t v6 = sub_22BDBFE40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(v7, a1, a2);
  swift_storeEnumTagMultiPayload();
  uint64_t result = sub_22BDBFE90();
  *a3 = v6;
  return result;
}

uint64_t sub_22BDBAB94@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  type metadata accessor for PreviewArgumentsBuilder.Component.Item();
  sub_22BDC0060();
  swift_allocObject();
  uint64_t v4 = sub_22BDBFE40();
  uint64_t v6 = v5;
  uint64_t v7 = type metadata accessor for PreviewSection();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(v6, a1, v7);
  swift_storeEnumTagMultiPayload();
  uint64_t result = sub_22BDBFE90();
  *a2 = v4;
  return result;
}

uint64_t _s21DeveloperToolsSupport23PreviewArgumentsBuilderV10buildArrayyAC9ComponentVyx_GSayAGGFZ_0@<X0>(uint64_t *a1@<X8>)
{
  swift_getKeyPath();
  type metadata accessor for PreviewArgumentsBuilder.Component();
  sub_22BDBFE90();
  type metadata accessor for PreviewArgumentsBuilder.Component.Item();
  sub_22BDBFE90();
  swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v2 = sub_22BDBFE10();
  uint64_t result = swift_release();
  *a1 = v2;
  return result;
}

uint64_t static PreviewArgumentsBuilder.buildExpression<A>(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  v10[2] = a1;
  v10[3] = a2;
  v10[4] = a3;
  uint64_t v7 = (char *)type metadata accessor for PreviewArgumentsBuilder.Component();
  sub_22BDBAE94((void (*)(char *, char *))sub_22BDBAE68, (uint64_t)v10, a2, v7, MEMORY[0x263F8E628], a3, MEMORY[0x263F8E658], v8);
  _s21DeveloperToolsSupport23PreviewArgumentsBuilderV10buildArrayyAC9ComponentVyx_GSayAGGFZ_0(a4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22BDBAE68@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return _s21DeveloperToolsSupport23PreviewArgumentsBuilderV15buildExpressionyAC9ComponentVyx_GxFZ_0(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_22BDBAE94(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v43 = a8;
  uint64_t v44 = a5;
  uint64_t v9 = v8;
  uint64_t v58 = a2;
  uint64_t v59 = a4;
  uint64_t v57 = a1;
  uint64_t v42 = *(void *)(a5 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  unsigned __int8 v55 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unint64_t v53 = (char *)&v40 - v13;
  uint64_t v15 = v14;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v54 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v41 = (char *)&v40 - v17;
  uint64_t v18 = sub_22BDBFF60();
  uint64_t v45 = *(void *)(v18 - 8);
  uint64_t v46 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  __n128 v51 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v40 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  long long v40 = (char *)&v40 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v50 = *((void *)v15 - 1);
  MEMORY[0x270FA5388](v26);
  long long v28 = (char *)&v40 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = a6;
  unint64_t v52 = v15;
  uint64_t v60 = swift_getAssociatedTypeWitness();
  uint64_t v47 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  long long v30 = (char *)&v40 - v29;
  uint64_t v31 = sub_22BDBFDD0();
  uint64_t v61 = sub_22BDBFFD0();
  uint64_t v56 = sub_22BDBFFE0();
  sub_22BDBFFB0();
  (*(void (**)(char *, uint64_t, void))(v50 + 16))(v28, v48, v52);
  uint64_t v59 = v30;
  uint64_t result = sub_22BDBFDC0();
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
      sub_22BDBFF70();
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
      sub_22BDBFFC0();
      if (!--v31)
      {
        uint64_t v35 = v54;
        uint64_t v36 = v51;
        goto LABEL_9;
      }
    }
  }
  swift_getAssociatedConformanceWitness();
  uint64_t v35 = v54;
  uint64_t v36 = v51;
LABEL_9:
  sub_22BDBFF70();
  unsigned __int8 v55 = *(char **)(v35 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v55)(v36, 1, AssociatedTypeWitness) == 1)
  {
    long long v37 = v51;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v60);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v37, v46);
    return v61;
  }
  else
  {
    unint64_t v52 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
    uint64_t v54 = v35 + 32;
    long long v38 = (void (**)(char *, uint64_t))(v35 + 8);
    long long v39 = v41;
    long long v37 = v51;
    while (1)
    {
      v52(v39, v37, AssociatedTypeWitness);
      v57(v39, v53);
      if (v9) {
        break;
      }
      uint64_t v9 = 0;
      (*v38)(v39, AssociatedTypeWitness);
      sub_22BDBFFC0();
      sub_22BDBFF70();
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

uint64_t type metadata accessor for PreviewArgumentsBuilder.Component()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t static PreviewArgumentsBuilder.buildExpression(_:)@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  v6[2] = a1;
  type metadata accessor for PreviewSection();
  sub_22BDBFF60();
  uint64_t v3 = type metadata accessor for PreviewArgumentsBuilder.Component();
  sub_22BDBB690((void (*)(char *, char *))sub_22BDBB664, (uint64_t)v6, MEMORY[0x263F8E628], v3, v4, (uint64_t)&v7);
  uint64_t result = v7;
  if (!v7)
  {
    type metadata accessor for PreviewArgumentsBuilder.Component.Item();
    uint64_t result = sub_22BDBFE50();
  }
  *a2 = result;
  return result;
}

uint64_t sub_22BDBB664@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_22BDBAB94(a1, a2);
}

uint64_t sub_22BDBB690@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v25 = a5;
  uint64_t v26 = a2;
  uint64_t v28 = a4;
  uint64_t v27 = a1;
  uint64_t v24 = *(void *)(a3 - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v13 + 16);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v10);
  uint64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v6);
  uint64_t v22 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1, v14) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
    v27(v18, v12);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    if (v7) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v24 + 32))(v25, v12, a3);
    }
    uint64_t v22 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(a6, v22, 1);
}

uint64_t static PreviewArgumentsBuilder.buildOptional(_:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  if (v3)
  {
    uint64_t v4 = v3;
  }
  else
  {
    type metadata accessor for PreviewArgumentsBuilder.Component.Item();
    uint64_t v4 = sub_22BDBFE50();
  }
  *a2 = v4;

  return swift_bridgeObjectRetain();
}

uint64_t static PreviewArgumentsBuilder.buildEither(first:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_bridgeObjectRetain();
}

uint64_t static PreviewArgumentsBuilder.buildFinalResult(_:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v20 = a3;
  uint64_t v5 = type metadata accessor for PreviewSection();
  uint64_t v19 = sub_22BDBFF60();
  uint64_t v6 = *(void *)(v19 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v19);
  uint64_t v9 = (char *)&v19 - v8;
  uint64_t v10 = *(void *)(v5 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v7);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v19 - v14;
  uint64_t v16 = *a1;
  uint64_t v26 = sub_22BDBFE50();
  uint64_t v24 = v16;
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_22BDBFE50();
  uint64_t v21 = a2;
  uint64_t v22 = &v26;
  type metadata accessor for PreviewArgumentsBuilder.Component.Item();
  sub_22BDBFE90();
  sub_22BDBFE90();
  swift_getWitnessTable();
  sub_22BDBFDF0();
  swift_bridgeObjectRelease();
  uint64_t v17 = v26;
  swift_bridgeObjectRetain();
  sub_22BDBA6CC(0, 0, v17, a2, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v9, 1, v5) == 1)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v19);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v9, v5);
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v5);
    sub_22BDBFE70();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v5);
  }
  sub_22BDBA0EC(v25, a2, v20);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22BDBBCAC(uint64_t a1, char *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v43 = a2;
  uint64_t v45 = a3;
  uint64_t v41 = a1;
  uint64_t v5 = type metadata accessor for PreviewSection();
  uint64_t v38 = sub_22BDBFF60();
  uint64_t v40 = *(void *)(v38 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v38);
  uint64_t v44 = (char *)v37 - v7;
  uint64_t v42 = *(void *)(v5 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)v37 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  long long v39 = (char *)v37 - v15;
  uint64_t v16 = *(void *)(a4 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)v37 - v20;
  uint64_t v22 = type metadata accessor for PreviewArgumentsBuilder.Component.Item();
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)v37 - v23;
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))((char *)v37 - v23, v43, v22);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v37[0] = v13;
    uint64_t v27 = v39;
    uint64_t v26 = v40;
    uint64_t v43 = v10;
    uint64_t v28 = v42;
    uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v42 + 32);
    v29(v39, v24, v5);
    uint64_t v30 = *v45;
    swift_bridgeObjectRetain();
    uint64_t v31 = (uint64_t)v44;
    v37[1] = a4;
    sub_22BDBA6CC(0, 0, v30, a4, (uint64_t)v44);
    uint64_t v32 = v27;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v31, 1, v5) == 1)
    {
      (*(void (**)(char *, uint64_t))(v26 + 8))(v44, v38);
      (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v43, v27, v5);
    }
    else
    {
      uint64_t v34 = v37[0];
      v29((char *)v37[0], v44, v5);
      uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v28 + 16);
      uint64_t v36 = v43;
      v35(v43, v34, v5);
      sub_22BDBFE90();
      sub_22BDBFE70();
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v34, v5);
      v35(v36, (uint64_t)v32, v5);
    }
    sub_22BDBFE90();
    sub_22BDBFE70();
    sub_22BDBFE90();
    sub_22BDBFE80();
    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v32, v5);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v24, a4);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, a4);
    sub_22BDBFE90();
    sub_22BDBFE70();
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v21, a4);
  }
}

uint64_t static PreviewSectionArgumentsBuilder.buildExpression(_:)(uint64_t a1, uint64_t a2)
{
  sub_22BDBC3FC(a2, a2);
  uint64_t v4 = *(void *)(a2 - 8);
  swift_allocObject();
  uint64_t v5 = sub_22BDBFE40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  sub_22BDBFE90();
  return v5;
}

uint64_t static PreviewSectionArgumentsBuilder.buildExpression<A>(_:)(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  return sub_22BDBFEA0();
}

uint64_t static PreviewSectionArgumentsBuilder.buildArray(_:)()
{
  return sub_22BDBFE10();
}

uint64_t sub_22BDBC3C8(uint64_t a1, char *a2)
{
  return sub_22BDBBCAC(a1, a2, *(uint64_t **)(v2 + 24), *(void *)(v2 + 16));
}

uint64_t type metadata accessor for PreviewArgumentsBuilder.Component.Item()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22BDBC3FC(uint64_t a1, uint64_t a2)
{
  if (swift_isClassType()) {
    uint64_t v3 = a2;
  }
  else {
    uint64_t v3 = 0;
  }
  if (v3)
  {
    return __swift_instantiateConcreteTypeFromMangledName(&qword_268483CC0);
  }
  else
  {
    return sub_22BDC0060();
  }
}

uint64_t sub_22BDBC46C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22BDBC48C()
{
  type metadata accessor for PreviewArguments.InhabitedSections();
  uint64_t result = sub_22BDBFF60();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_22BDBC528(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = v6;
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  uint64_t v9 = *(void *)(v6 + 64) + 7;
  unint64_t v10 = (v9 + ((v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFFFF8;
  if (v8 <= 7
    && (*(_DWORD *)(v6 + 80) & 0x100000) == 0
    && ((v10 + 15) & 0xFFFFFFFFFFFFFFF8) + 8 <= 0x18)
  {
    uint64_t v14 = ((unint64_t)a2 + v8 + 16) & ~v8;
    if (*(_DWORD *)(v6 + 84) < 0x7FFFFFFFu)
    {
      unint64_t v15 = *(void *)((v9 + v14) & 0xFFFFFFFFFFFFFFF8);
      if (v15 >= 0xFFFFFFFF) {
        LODWORD(v15) = -1;
      }
      if (v15 != -1) {
        goto LABEL_12;
      }
    }
    else if ((*(unsigned int (**)(unint64_t))(v6 + 48))(((unint64_t)a2 + v8 + 16) & ~v8))
    {
LABEL_12:
      memcpy(a1, a2, ((v10 + 15) & 0xFFFFFFFFFFFFFFF8) + 8);
      return a1;
    }
    uint64_t v16 = a2[1];
    *a1 = *a2;
    a1[1] = v16;
    uint64_t v17 = ((unint64_t)a1 + v8 + 16) & ~v8;
    uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    swift_bridgeObjectRetain();
    v18(v17, v14, v5);
    *(void *)((v9 + v17) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v9 + v14) & 0xFFFFFFFFFFFFFFF8);
    *(void *)(((unint64_t)a1 + v10 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v10 + 15) & 0xFFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return a1;
  }
  uint64_t v13 = *a2;
  *a1 = *a2;
  a1 = (void *)(v13 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
  swift_retain();
  return a1;
}

uint64_t sub_22BDBC700(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16 + a1) & ~v4;
  if (*(_DWORD *)(v3 + 84) >= 0x7FFFFFFFu)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(v3 + 48))((v4 + 16 + a1) & ~v4);
    if (result) {
      return result;
    }
    goto LABEL_7;
  }
  unint64_t v7 = *(void *)((*(void *)(v3 + 64) + 7 + v5) & 0xFFFFFFFFFFFFFFF8);
  if (v7 >= 0xFFFFFFFF) {
    LODWORD(v7) = -1;
  }
  uint64_t result = (v7 + 1);
  if (v7 == -1)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v2);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_22BDBC858(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64) + 7;
  unint64_t v9 = (v8 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = ((unint64_t)a2 + v7 + 16) & ~v7;
  if (*(_DWORD *)(v6 + 84) < 0x7FFFFFFFu)
  {
    unint64_t v12 = *(void *)((v8 + v10) & 0xFFFFFFFFFFFFFFF8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    unint64_t v11 = v9 + 15;
    if (v12 != -1) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v13 = a2[1];
    *a1 = *a2;
    a1[1] = v13;
    uint64_t v14 = ((unint64_t)a1 + v7 + 16) & ~v7;
    unint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    swift_bridgeObjectRetain();
    v15(v14, v10, v5);
    *(void *)((v8 + v14) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + v10) & 0xFFFFFFFFFFFFFFF8);
    *(void *)(((unint64_t)a1 + v9 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v11) & 0xFFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return a1;
  }
  unint64_t v11 = v9 + 15;
  if (!(*(unsigned int (**)(unint64_t))(v6 + 48))(((unint64_t)a2 + v7 + 16) & ~v7)) {
    goto LABEL_7;
  }
LABEL_3:
  memcpy(a1, a2, (v11 & 0xFFFFFFFFFFFFFFF8) + 8);
  return a1;
}

void *sub_22BDBC9F0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = ~v7;
  uint64_t v9 = *(void *)(v5 + 64) + 7;
  unint64_t v10 = ((v9 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 15;
  size_t v11 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
  uint64_t v12 = ((unint64_t)a1 + v7 + 16) & ~v7;
  uint64_t v27 = *(void *)(a3 + 16);
  if (v6 >= 0x7FFFFFFF)
  {
    unint64_t v25 = ((v9 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 15;
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    uint64_t v24 = *(void *)(v5 + 64) + 7;
    size_t v14 = v11;
    uint64_t v15 = ((unint64_t)a1 + v7 + 16) & ~v7;
    uint64_t v16 = *(void *)(a3 + 16);
    int v23 = v13(v15, v6, v16);
    uint64_t v17 = ((unint64_t)a2 + v7 + 16) & v8;
    uint64_t v18 = v16;
    uint64_t v12 = v15;
    size_t v11 = v14;
    uint64_t v9 = v24;
    int v19 = v13(v17, v6, v18);
    unint64_t v10 = v25;
    uint64_t v4 = a1;
    if (v23) {
      goto LABEL_3;
    }
LABEL_8:
    if (!v19)
    {
      *uint64_t v4 = *a2;
      v4[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24))(v12, v17, v27);
      *(void *)((v9 + v12) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v9 + v17) & 0xFFFFFFFFFFFFFFF8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(((unint64_t)v4 + v10) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v10) & 0xFFFFFFFFFFFFFFF8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return v4;
    }
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v12, v27);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  uint64_t v17 = ((unint64_t)a2 + v7 + 16) & v8;
  unint64_t v21 = *(void *)((v9 + v17) & 0xFFFFFFFFFFFFFFF8);
  if (v21 >= 0xFFFFFFFF) {
    LODWORD(v21) = -1;
  }
  int v19 = v21 + 1;
  if (*(void *)((v9 + v12) & 0xFFFFFFFFFFFFFFF8) >= 0xFFFFFFFFuLL) {
    goto LABEL_8;
  }
LABEL_3:
  if (v19)
  {
LABEL_10:
    memcpy(v4, a2, v11);
    return v4;
  }
  *uint64_t v4 = *a2;
  v4[1] = a2[1];
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  swift_bridgeObjectRetain();
  v20(v12, v17, v27);
  *(void *)((v9 + v12) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v9 + v17) & 0xFFFFFFFFFFFFFFF8);
  *(void *)(((unint64_t)v4 + v10) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v10) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v4;
}

_OWORD *sub_22BDBCCD8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64) + 7;
  unint64_t v9 = (v8 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = ((unint64_t)a2 + v7 + 16) & ~v7;
  if (*(_DWORD *)(v6 + 84) < 0x7FFFFFFFu)
  {
    unint64_t v12 = *(void *)((v8 + v10) & 0xFFFFFFFFFFFFFFF8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    unint64_t v11 = v9 + 15;
    if (v12 != -1) {
      goto LABEL_3;
    }
LABEL_7:
    *a1 = *a2;
    uint64_t v13 = ((unint64_t)a1 + v7 + 16) & ~v7;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v13, v10, v5);
    *(void *)((v8 + v13) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + v10) & 0xFFFFFFFFFFFFFFF8);
    *(void *)(((unint64_t)a1 + v9 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v11) & 0xFFFFFFFFFFFFFFF8);
    return a1;
  }
  unint64_t v11 = v9 + 15;
  if (!(*(unsigned int (**)(unint64_t))(v6 + 48))(((unint64_t)a2 + v7 + 16) & ~v7)) {
    goto LABEL_7;
  }
LABEL_3:
  memcpy(a1, a2, (v11 & 0xFFFFFFFFFFFFFFF8) + 8);
  return a1;
}

void *sub_22BDBCE60(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = ~v7;
  uint64_t v9 = *(void *)(v5 + 64) + 7;
  unint64_t v10 = ((v9 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 15;
  size_t v11 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
  uint64_t v12 = ((unint64_t)a1 + v7 + 16) & ~v7;
  uint64_t v24 = *(void *)(a3 + 16);
  if (v6 >= 0x7FFFFFFF)
  {
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    uint64_t v14 = ((unint64_t)a1 + v7 + 16) & ~v7;
    uint64_t v15 = *(void *)(a3 + 16);
    int v22 = v13(v14, v6, v15);
    uint64_t v16 = ((unint64_t)a2 + v7 + 16) & v8;
    uint64_t v17 = v15;
    uint64_t v12 = v14;
    size_t v11 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    int v18 = v13(v16, v6, v17);
    unint64_t v10 = ((v9 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 15;
    uint64_t v4 = a1;
    if (v22) {
      goto LABEL_3;
    }
LABEL_8:
    if (!v18)
    {
      uint64_t v20 = a2[1];
      *uint64_t v4 = *a2;
      v4[1] = v20;
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(v12, v16, v24);
      *(void *)((v9 + v12) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v9 + v16) & 0xFFFFFFFFFFFFFFF8);
      swift_bridgeObjectRelease();
      *(void *)(((unint64_t)v4 + v10) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v10) & 0xFFFFFFFFFFFFFFF8);
      swift_bridgeObjectRelease();
      return v4;
    }
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v12, v24);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  uint64_t v16 = ((unint64_t)a2 + v7 + 16) & v8;
  unint64_t v19 = *(void *)((v9 + v16) & 0xFFFFFFFFFFFFFFF8);
  if (v19 >= 0xFFFFFFFF) {
    LODWORD(v19) = -1;
  }
  int v18 = v19 + 1;
  if (*(void *)((v9 + v12) & 0xFFFFFFFFFFFFFFF8) >= 0xFFFFFFFFuLL) {
    goto LABEL_8;
  }
LABEL_3:
  if (v18)
  {
LABEL_10:
    memcpy(v4, a2, v11);
    return v4;
  }
  *(_OWORD *)uint64_t v4 = *(_OWORD *)a2;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v12, v16, v24);
  *(void *)((v9 + v12) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v9 + v16) & 0xFFFFFFFFFFFFFFF8);
  *(void *)(((unint64_t)v4 + v10) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v10) & 0xFFFFFFFFFFFFFFF8);
  return v4;
}

uint64_t sub_22BDBD104(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    int v7 = 0x7FFFFFFF;
  }
  else {
    int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + 7;
  if (v7 - 1 < a2)
  {
    unint64_t v9 = ((((v8 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v10 = a2 - v7;
    uint64_t v11 = v9 & 0xFFFFFFF8;
    unsigned int v12 = v10 + 2;
    if ((v9 & 0xFFFFFFF8) != 0) {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      unsigned int v13 = 4;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v12 < 0x100) {
      unsigned int v13 = 1;
    }
    if (v12 >= 2) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    switch(v14)
    {
      case 1:
        int v15 = *((unsigned __int8 *)a1 + v9);
        if (!v15) {
          break;
        }
        goto LABEL_21;
      case 2:
        int v15 = *(unsigned __int16 *)((char *)a1 + v9);
        if (v15) {
          goto LABEL_21;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x22BDBD2A0);
      case 4:
        int v15 = *(_DWORD *)((char *)a1 + v9);
        if (!v15) {
          break;
        }
LABEL_21:
        int v17 = v15 - 1;
        if (v11)
        {
          int v17 = 0;
          LODWORD(v11) = *a1;
        }
        return (v11 | v17) + v7;
      default:
        break;
    }
  }
  uint64_t v18 = ((unint64_t)a1 + v6 + 16) & ~v6;
  if (v5 < 0x7FFFFFFF)
  {
    unint64_t v20 = *(void *)((v8 + v18) & 0xFFFFFFFFFFFFFFF8);
    if (v20 >= 0xFFFFFFFF) {
      LODWORD(v20) = -1;
    }
    unsigned int v19 = v20 + 1;
  }
  else
  {
    unsigned int v19 = (*(uint64_t (**)(uint64_t))(v4 + 48))(v18);
  }
  if (v19 >= 2) {
    return v19 - 1;
  }
  else {
    return 0;
  }
}

void sub_22BDBD2B4(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  unsigned int v9 = v8 - 1;
  uint64_t v10 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + 7;
  unint64_t v12 = ((((v11 + ((v10 + 16) & ~v10)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v8 - 1 >= a3)
  {
    int v15 = 0;
    if (v9 >= a2)
    {
LABEL_16:
      switch(v15)
      {
        case 1:
          a1[v12] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_29;
        case 2:
          *(_WORD *)&a1[v12] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_29;
        case 3:
          goto LABEL_46;
        case 4:
          *(_DWORD *)&a1[v12] = 0;
          goto LABEL_28;
        default:
LABEL_28:
          if (a2)
          {
LABEL_29:
            if (a2 + 1 <= v8)
            {
              if (a2 != -1)
              {
                unint64_t v19 = (unint64_t)&a1[v10 + 16] & ~v10;
                if (v7 < 0x7FFFFFFF)
                {
                  int v22 = (void *)((v11 + v19) & 0xFFFFFFFFFFFFFFF8);
                  if (((a2 + 1) & 0x80000000) != 0) {
                    uint64_t v23 = a2 - 0x7FFFFFFF;
                  }
                  else {
                    uint64_t v23 = a2;
                  }
                  *int v22 = v23;
                }
                else
                {
                  unint64_t v20 = *(void (**)(unint64_t, uint64_t))(v6 + 56);
                  uint64_t v21 = a2 + 1;
                  v20(v19, v21);
                }
              }
            }
            else if (((((v11 + ((v10 + 16) & ~v10)) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF8)
            {
              unsigned int v18 = a2 - v8;
              bzero(a1, ((((v11 + ((v10 + 16) & ~v10)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8);
              *(_DWORD *)a1 = v18;
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v13 = a3 - v8 + 2;
    if (((((v11 + ((v10 + 16) & ~v10)) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF8) {
      unsigned int v13 = 2;
    }
    if (v13 >= 0x10000) {
      int v14 = 4;
    }
    else {
      int v14 = 2;
    }
    if (v13 < 0x100) {
      int v14 = 1;
    }
    if (v13 >= 2) {
      int v15 = v14;
    }
    else {
      int v15 = 0;
    }
    if (v9 >= a2) {
      goto LABEL_16;
    }
  }
  unsigned int v16 = a2 - v8;
  if (((((v11 + ((v10 + 16) & ~v10)) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    int v17 = v16 + 1;
  }
  else {
    int v17 = 1;
  }
  if (((((v11 + ((v10 + 16) & ~v10)) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    bzero(a1, ((((v11 + ((v10 + 16) & ~v10)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8);
    *(_DWORD *)a1 = v16;
  }
  switch(v15)
  {
    case 1:
      a1[v12] = v17;
      break;
    case 2:
      *(_WORD *)&a1[v12] = v17;
      break;
    case 3:
LABEL_46:
      __break(1u);
      JUMPOUT(0x22BDBD4F8);
    case 4:
      *(_DWORD *)&a1[v12] = v17;
      break;
    default:
      return;
  }
}

uint64_t type metadata accessor for PreviewArguments()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for PreviewArguments.InhabitedSections()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22BDBD550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_22BDBD558()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_22BDBD600(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64) + 7;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v11 = a2[1];
    *a1 = *a2;
    a1[1] = v11;
    uint64_t v12 = ((unint64_t)a1 + v6 + 16) & ~v6;
    uint64_t v13 = ((unint64_t)a2 + v6 + 16) & ~v6;
    int v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v14(v12, v13, v4);
    *(void *)((v7 + v12) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v7 + v13) & 0xFFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_22BDBD738(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8))((a1
                                                                                            + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80)
                                                                                            + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80));

  return swift_bridgeObjectRelease();
}

void *sub_22BDBD7D0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(void *)(v5 - 8) + 16;
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  swift_bridgeObjectRetain();
  v6(v9, v10, v5);
  *(void *)((*(void *)(v7 + 48) + 7 + v9) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v7 + 48) + 7 + v10) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_22BDBD884(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 24;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 24))(v9, v10);
  *(void *)((*(void *)(v7 + 40) + 7 + v9) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v7 + 40) + 7 + v10) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_22BDBD954(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 32;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = ((unint64_t)a1 + v6 + 16) & ~v6;
  uint64_t v8 = ((unint64_t)a2 + v6 + 16) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v7, v8);
  *(void *)((*(void *)(v5 + 32) + 7 + v7) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 32) + 7 + v8) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_22BDBD9F4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 16) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 16) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v10, v11);
  *(void *)((*(void *)(v8 + 24) + 7 + v10) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v8 + 24) + 7 + v11) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22BDBDAAC(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + 7;
  if (v7 < a2)
  {
    unint64_t v9 = ((v8 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v10 = a2 - v7;
    uint64_t v11 = v9 & 0xFFFFFFF8;
    if ((v9 & 0xFFFFFFF8) != 0) {
      unsigned int v12 = 2;
    }
    else {
      unsigned int v12 = v10 + 1;
    }
    if (v12 >= 0x10000) {
      unsigned int v13 = 4;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v12 < 0x100) {
      unsigned int v13 = 1;
    }
    if (v12 >= 2) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    switch(v14)
    {
      case 1:
        int v15 = *((unsigned __int8 *)a1 + v9);
        if (!v15) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v15 = *(unsigned __int16 *)((char *)a1 + v9);
        if (v15) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x22BDBDC14);
      case 4:
        int v15 = *(_DWORD *)((char *)a1 + v9);
        if (!v15) {
          break;
        }
LABEL_22:
        int v17 = v15 - 1;
        if (v11)
        {
          int v17 = 0;
          LODWORD(v11) = *a1;
        }
        return v7 + (v11 | v17) + 1;
      default:
        break;
    }
  }
  uint64_t v18 = ((unint64_t)a1 + v6 + 16) & ~v6;
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(uint64_t))(v4 + 48))(v18);
  }
  unint64_t v19 = *(void *)((v8 + v18) & 0xFFFFFFFFFFFFFFF8);
  if (v19 >= 0xFFFFFFFF) {
    LODWORD(v19) = -1;
  }
  return (v19 + 1);
}

void sub_22BDBDC28(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + 7;
  unint64_t v11 = ((v10 + ((v9 + 16) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v8 >= a3)
  {
    int v15 = 0;
    int v16 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v15)
      {
        case 1:
          a1[v11] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v11] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_43;
        case 4:
          *(_DWORD *)&a1[v11] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            unint64_t v19 = (unint64_t)&a1[v9 + 16] & ~v9;
            if (v7 < 0x7FFFFFFF)
            {
              uint64_t v21 = (void *)((v10 + v19) & 0xFFFFFFFFFFFFFFF8);
              if ((a2 & 0x80000000) != 0) {
                uint64_t v22 = a2 ^ 0x80000000;
              }
              else {
                uint64_t v22 = a2 - 1;
              }
              *uint64_t v21 = v22;
            }
            else
            {
              unint64_t v20 = *(void (**)(unint64_t))(v6 + 56);
              v20(v19);
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v12 = a3 - v8;
    if (((v10 + ((v9 + 16) & ~v9)) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v13 = v12 + 1;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v13 >= 0x10000) {
      int v14 = 4;
    }
    else {
      int v14 = 2;
    }
    if (v13 < 0x100) {
      int v14 = 1;
    }
    if (v13 >= 2) {
      int v15 = v14;
    }
    else {
      int v15 = 0;
    }
    int v16 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (((v10 + ((v9 + 16) & ~v9)) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    int v17 = v16;
  }
  else {
    int v17 = 1;
  }
  if (((v10 + ((v9 + 16) & ~v9)) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    int v18 = ~v8 + a2;
    bzero(a1, ((v10 + ((v9 + 16) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 8);
    *(_DWORD *)a1 = v18;
  }
  switch(v15)
  {
    case 1:
      a1[v11] = v17;
      break;
    case 2:
      *(_WORD *)&a1[v11] = v17;
      break;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x22BDBDE28);
    case 4:
      *(_DWORD *)&a1[v11] = v17;
      break;
    default:
      return;
  }
}

uint64_t type metadata accessor for PreviewArgumentsBuilder()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for PreviewSectionArgumentsBuilder()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22BDBDE80()
{
  uint64_t v0 = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t v0 = type metadata accessor for PreviewSection();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return v0;
}

void *sub_22BDBDF5C(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  uint64_t v8 = v7;
  int v9 = v7 + 16;
  unint64_t v10 = v6 + 7;
  if (((v6 + 7 + ((v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 8 <= v6) {
    unint64_t v11 = *(void *)(v5 + 64);
  }
  else {
    unint64_t v11 = ((v6 + 7 + ((v7 + 16) & ~(unint64_t)v7)) & 0xFFFFFFFFFFFFFFF8)
  }
        + 8;
  int v12 = v7 & 0x100000;
  if (v8 > 7 || v12 != 0 || v11 + 1 > 0x18)
  {
    uint64_t v15 = *(void *)a2;
    void *v3 = *(void *)a2;
    uint64_t v3 = (void *)(v15 + ((v8 & 0xF8 ^ 0x1F8) & v9));
    swift_retain();
  }
  else
  {
    unsigned int v16 = a2[v11];
    unsigned int v17 = v16 - 2;
    if (v16 >= 2)
    {
      if (v11 <= 3) {
        uint64_t v18 = v11;
      }
      else {
        uint64_t v18 = 4;
      }
      switch(v18)
      {
        case 1:
          int v19 = *a2;
          goto LABEL_22;
        case 2:
          int v19 = *(unsigned __int16 *)a2;
          goto LABEL_22;
        case 3:
          int v19 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_22;
        case 4:
          int v19 = *(_DWORD *)a2;
LABEL_22:
          int v20 = (v19 | (v17 << (8 * v11))) + 2;
          unsigned int v16 = v19 + 2;
          if (v11 < 4) {
            unsigned int v16 = v20;
          }
          break;
        default:
          break;
      }
    }
    if (v16 == 1)
    {
      uint64_t v21 = *((void *)a2 + 1);
      void *v3 = *(void *)a2;
      v3[1] = v21;
      uint64_t v22 = ((unint64_t)v3 + v8 + 16) & ~v8;
      uint64_t v23 = (unint64_t)&a2[v8 + 16] & ~v8;
      uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
      swift_bridgeObjectRetain();
      v24(v22, v23, v4);
      *(void *)((v10 + v22) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v10 + v23) & 0xFFFFFFFFFFFFFFF8);
      *((unsigned char *)v3 + v11) = 1;
      swift_bridgeObjectRetain();
    }
    else
    {
      (*(void (**)(void *))(v5 + 16))(a1);
      *((unsigned char *)v3 + v11) = 0;
    }
  }
  return v3;
}

uint64_t sub_22BDBE15C(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  unint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (((v5 + 7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 8 > v5) {
    unint64_t v5 = ((v5 + 7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 8;
  }
  unsigned int v7 = a1[v5];
  unsigned int v8 = v7 - 2;
  if (v7 >= 2)
  {
    if (v5 <= 3) {
      uint64_t v9 = v5;
    }
    else {
      uint64_t v9 = 4;
    }
    switch(v9)
    {
      case 1:
        int v10 = *a1;
        goto LABEL_12;
      case 2:
        int v10 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v10 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v10 = *(_DWORD *)a1;
LABEL_12:
        int v11 = (v10 | (v8 << (8 * v5))) + 2;
        unsigned int v7 = v10 + 2;
        if (v5 < 4) {
          unsigned int v7 = v11;
        }
        break;
      default:
        break;
    }
  }
  if (v7 == 1)
  {
    uint64_t v14 = *(void *)(*(void *)(a2 + 16) - 8);
    swift_bridgeObjectRelease();
    (*(void (**)(unint64_t, uint64_t))(v14 + 8))((unint64_t)&a1[v6 + 16] & ~v6, v3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    unsigned int v13 = *(uint64_t (**)(void))(v4 + 8);
    return v13();
  }
}

void *sub_22BDBE324(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  unint64_t v8 = v6 + 7;
  if (((v6 + 7 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 8 <= v6) {
    unint64_t v9 = *(void *)(v5 + 64);
  }
  else {
    unint64_t v9 = ((v6 + 7 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 8;
  }
  unsigned int v10 = a2[v9];
  unsigned int v11 = v10 - 2;
  if (v10 >= 2)
  {
    if (v9 <= 3) {
      uint64_t v12 = v9;
    }
    else {
      uint64_t v12 = 4;
    }
    switch(v12)
    {
      case 1:
        int v13 = *a2;
        goto LABEL_13;
      case 2:
        int v13 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v13 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v13 = *(_DWORD *)a2;
LABEL_13:
        int v14 = (v13 | (v11 << (8 * v9))) + 2;
        unsigned int v10 = v13 + 2;
        if (v9 < 4) {
          unsigned int v10 = v14;
        }
        break;
      default:
        break;
    }
  }
  if (v10 == 1)
  {
    uint64_t v15 = *((void *)a2 + 1);
    *a1 = *(void *)a2;
    a1[1] = v15;
    uint64_t v16 = ((unint64_t)a1 + v7 + 16) & ~v7;
    uint64_t v17 = (unint64_t)&a2[v7 + 16] & ~v7;
    uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v18(v16, v17, v4);
    *(void *)((v8 + v16) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + v17) & 0xFFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
    char v19 = 1;
  }
  else
  {
    (*(void (**)(void *))(v5 + 16))(a1);
    char v19 = 0;
  }
  *((unsigned char *)a1 + v9) = v19;
  return a1;
}

unsigned __int8 *sub_22BDBE4E8(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    unint64_t v7 = *(void *)(v6 + 64);
    uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
    unint64_t v9 = v7 + 7;
    if (((v7 + 7 + ((v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 8 <= v7) {
      unint64_t v10 = *(void *)(v6 + 64);
    }
    else {
      unint64_t v10 = ((v7 + 7 + ((v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 8;
    }
    unsigned int v11 = a1[v10];
    unsigned int v12 = v11 - 2;
    if (v11 >= 2)
    {
      if (v10 <= 3) {
        uint64_t v13 = v10;
      }
      else {
        uint64_t v13 = 4;
      }
      switch(v13)
      {
        case 1:
          int v14 = *a1;
          goto LABEL_14;
        case 2:
          int v14 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v14 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v14 = *(_DWORD *)a1;
LABEL_14:
          int v15 = (v14 | (v12 << (8 * v10))) + 2;
          unsigned int v11 = v14 + 2;
          if (v10 < 4) {
            unsigned int v11 = v15;
          }
          break;
        default:
          break;
      }
    }
    uint64_t v16 = ~v8;
    if (v11 == 1)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(unint64_t, uint64_t))(v6 + 8))((unint64_t)&a1[v8 + 16] & v16, v5);
      swift_bridgeObjectRelease();
    }
    else
    {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v17 = a2[v10];
    unsigned int v18 = v17 - 2;
    if (v17 >= 2)
    {
      if (v10 <= 3) {
        uint64_t v19 = v10;
      }
      else {
        uint64_t v19 = 4;
      }
      switch(v19)
      {
        case 1:
          int v20 = *a2;
          goto LABEL_28;
        case 2:
          int v20 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v20 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v20 = *(_DWORD *)a2;
LABEL_28:
          int v21 = (v20 | (v18 << (8 * v10))) + 2;
          unsigned int v17 = v20 + 2;
          if (v10 < 4) {
            unsigned int v17 = v21;
          }
          break;
        default:
          break;
      }
    }
    if (v17 == 1)
    {
      *(void *)a1 = *(void *)a2;
      *((void *)a1 + 1) = *((void *)a2 + 1);
      uint64_t v22 = &a2[v8];
      uint64_t v23 = (unint64_t)&a1[v8 + 16] & v16;
      uint64_t v24 = (unint64_t)(v22 + 16) & v16;
      unint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
      swift_bridgeObjectRetain();
      v25(v23, v24, v5);
      *(void *)((v9 + v23) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v9 + v24) & 0xFFFFFFFFFFFFFFF8);
      a1[v10] = 1;
      swift_bridgeObjectRetain();
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      a1[v10] = 0;
    }
  }
  return a1;
}

_OWORD *sub_22BDBE7C0(_OWORD *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  unint64_t v7 = v5 + 7;
  if (((v5 + 7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 8 <= v5) {
    unint64_t v8 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  else {
    unint64_t v8 = ((v5 + 7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 8;
  }
  unsigned int v9 = a2[v8];
  unsigned int v10 = v9 - 2;
  if (v9 >= 2)
  {
    if (v8 <= 3) {
      uint64_t v11 = v8;
    }
    else {
      uint64_t v11 = 4;
    }
    switch(v11)
    {
      case 1:
        int v12 = *a2;
        goto LABEL_13;
      case 2:
        int v12 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v12 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v12 = *(_DWORD *)a2;
LABEL_13:
        int v13 = (v12 | (v10 << (8 * v8))) + 2;
        unsigned int v9 = v12 + 2;
        if (v8 < 4) {
          unsigned int v9 = v13;
        }
        break;
      default:
        break;
    }
  }
  if (v9 == 1)
  {
    *a1 = *(_OWORD *)a2;
    uint64_t v14 = ((unint64_t)a1 + v6 + 16) & ~v6;
    uint64_t v15 = (unint64_t)&a2[v6 + 16] & ~v6;
    (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v14, v15);
    *(void *)((v7 + v14) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v7 + v15) & 0xFFFFFFFFFFFFFFF8);
    char v16 = 1;
  }
  else
  {
    (*(void (**)(_OWORD *))(v4 + 32))(a1);
    char v16 = 0;
  }
  *((unsigned char *)a1 + v8) = v16;
  return a1;
}

unsigned __int8 *sub_22BDBE96C(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    unint64_t v7 = *(void *)(v6 + 64);
    uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
    unint64_t v9 = v7 + 7;
    if (((v7 + 7 + ((v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 8 <= v7) {
      unint64_t v10 = *(void *)(v6 + 64);
    }
    else {
      unint64_t v10 = ((v7 + 7 + ((v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 8;
    }
    unsigned int v11 = a1[v10];
    unsigned int v12 = v11 - 2;
    if (v11 >= 2)
    {
      if (v10 <= 3) {
        uint64_t v13 = v10;
      }
      else {
        uint64_t v13 = 4;
      }
      switch(v13)
      {
        case 1:
          int v14 = *a1;
          goto LABEL_14;
        case 2:
          int v14 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v14 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v14 = *(_DWORD *)a1;
LABEL_14:
          int v15 = (v14 | (v12 << (8 * v10))) + 2;
          unsigned int v11 = v14 + 2;
          if (v10 < 4) {
            unsigned int v11 = v15;
          }
          break;
        default:
          break;
      }
    }
    uint64_t v16 = ~v8;
    if (v11 == 1)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(unint64_t, uint64_t))(v6 + 8))((unint64_t)&a1[v8 + 16] & v16, v5);
      swift_bridgeObjectRelease();
    }
    else
    {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v17 = a2[v10];
    unsigned int v18 = v17 - 2;
    if (v17 >= 2)
    {
      if (v10 <= 3) {
        uint64_t v19 = v10;
      }
      else {
        uint64_t v19 = 4;
      }
      switch(v19)
      {
        case 1:
          int v20 = *a2;
          goto LABEL_28;
        case 2:
          int v20 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v20 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v20 = *(_DWORD *)a2;
LABEL_28:
          int v21 = (v20 | (v18 << (8 * v10))) + 2;
          unsigned int v17 = v20 + 2;
          if (v10 < 4) {
            unsigned int v17 = v21;
          }
          break;
        default:
          break;
      }
    }
    if (v17 == 1)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 32))((unint64_t)&a1[v8 + 16] & v16, (unint64_t)&a2[v8 + 16] & v16, v5);
      *(void *)((v9 + ((unint64_t)&a1[v8 + 16] & v16)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v9 + ((unint64_t)&a2[v8 + 16] & v16)) & 0xFFFFFFFFFFFFFFF8);
      char v22 = 1;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
      char v22 = 0;
    }
    a1[v10] = v22;
  }
  return a1;
}

uint64_t sub_22BDBEC34(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  unint64_t v4 = *(void *)(v3 + 64);
  unint64_t v5 = ((v4 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8)
     + 8;
  if (v5 <= v4) {
    unint64_t v5 = v4;
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_22;
  }
  unint64_t v6 = v5 + 1;
  char v7 = 8 * (v5 + 1);
  if ((v5 + 1) <= 3)
  {
    unsigned int v10 = ((a2 + ~(-1 << v7) - 254) >> v7) + 1;
    if (HIWORD(v10))
    {
      int v8 = *(_DWORD *)((char *)a1 + v6);
      if (!v8) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v10 > 0xFF)
    {
      int v8 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v10 < 2)
    {
LABEL_22:
      unsigned int v12 = *((unsigned __int8 *)a1 + v5);
      if (v12 >= 2) {
        return (v12 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v8 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_22;
  }
LABEL_14:
  int v11 = (v8 - 1) << v7;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v6 | v11) + 255;
}

void sub_22BDBEDAC(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(a4 + 16) - 8);
  unint64_t v6 = *(void *)(v5 + 64);
  unint64_t v7 = ((v6 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8)
     + 8;
  if (v7 > v6) {
    unint64_t v6 = v7;
  }
  size_t v8 = v6 + 1;
  if (a3 < 0xFF)
  {
    int v9 = 0;
  }
  else if (v8 <= 3)
  {
    unsigned int v12 = ((a3 + ~(-1 << (8 * v8)) - 254) >> (8 * v8)) + 1;
    if (HIWORD(v12))
    {
      int v9 = 4;
    }
    else if (v12 >= 0x100)
    {
      int v9 = 2;
    }
    else
    {
      int v9 = v12 > 1;
    }
  }
  else
  {
    int v9 = 1;
  }
  if (a2 > 0xFE)
  {
    unsigned int v10 = a2 - 255;
    if (v8 < 4)
    {
      int v11 = (v10 >> (8 * v8)) + 1;
      if (v6 != -1)
      {
        int v13 = v10 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v13;
          a1[2] = BYTE2(v13);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v13;
        }
        else
        {
          *a1 = v13;
        }
      }
    }
    else
    {
      bzero(a1, v6 + 1);
      *(_DWORD *)a1 = v10;
      int v11 = 1;
    }
    switch(v9)
    {
      case 1:
        a1[v8] = v11;
        break;
      case 2:
        *(_WORD *)&a1[v8] = v11;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x22BDBEFB8);
      case 4:
        *(_DWORD *)&a1[v8] = v11;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v9)
    {
      case 1:
        a1[v8] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v8] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v6] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_22BDBEFE0(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  unint64_t v3 = *(void *)(v2 + 64);
  unint64_t v4 = ((v3 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8)
     + 8;
  if (v4 <= v3) {
    unint64_t v4 = v3;
  }
  uint64_t v5 = a1[v4];
  int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a1;
        goto LABEL_12;
      case 2:
        int v8 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v8 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v8 = *(_DWORD *)a1;
LABEL_12:
        unsigned int v9 = (v8 | (v6 << (8 * v4))) + 2;
        LODWORD(v5) = v8 + 2;
        if (v4 >= 4) {
          uint64_t v5 = v5;
        }
        else {
          uint64_t v5 = v9;
        }
        break;
      default:
        return v5;
    }
  }
  return v5;
}

void sub_22BDBF0DC(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  if (a2 > 1)
  {
    unint64_t v7 = *(void *)(v4 + 64);
    if (((v7 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8)
       + 8 <= v7)
      size_t v8 = *(void *)(v4 + 64);
    else {
      size_t v8 = ((v7 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8)
    }
         + 8;
    unsigned int v9 = a2 - 2;
    if (v8 < 4)
    {
      unsigned int v10 = v9 >> (8 * v8);
      int v11 = v9 & ~(-1 << (8 * v8));
      a1[v8] = v10 + 2;
      bzero(a1, v8);
      if (v8 == 3)
      {
        *(_WORD *)a1 = v11;
        a1[2] = BYTE2(v11);
      }
      else if (v8 == 2)
      {
        *(_WORD *)a1 = v11;
      }
      else
      {
        *a1 = v11;
      }
    }
    else
    {
      a1[v8] = 2;
      bzero(a1, v8);
      *(_DWORD *)a1 = v9;
    }
  }
  else
  {
    unint64_t v5 = *(void *)(v4 + 64);
    unint64_t v6 = ((v5 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8)
       + 8;
    if (v6 <= v5) {
      unint64_t v6 = *(void *)(v4 + 64);
    }
    a1[v6] = a2;
  }
}

uint64_t sub_22BDBF208()
{
  uint64_t result = type metadata accessor for PreviewSection();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_22BDBF2A4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64) + 7;
  unint64_t v9 = ((v8 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 15;
  if (v7 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || (v9 & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v13 = a2[1];
    *a1 = *a2;
    a1[1] = v13;
    uint64_t v14 = ((unint64_t)a1 + v7 + 16) & ~v7;
    uint64_t v15 = ((unint64_t)a2 + v7 + 16) & ~v7;
    uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    swift_bridgeObjectRetain();
    v16(v14, v15, v5);
    *(void *)((v8 + v14) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + v15) & 0xFFFFFFFFFFFFFFF8);
    *(void *)(((unint64_t)a1 + v9) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v9) & 0xFFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_22BDBF410(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8))((*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80)
                                                                                            + 16
                                                                                            + a1) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80));
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_22BDBF4D0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  uint64_t v8 = *(void *)(v6 - 8) + 16;
  uint64_t v9 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v10 = ((unint64_t)a2 + v9 + 16) & ~v9;
  swift_bridgeObjectRetain();
  v7(((unint64_t)a1 + v9 + 16) & ~v9, v10, v6);
  uint64_t v11 = *(void *)(v8 + 48) + 7;
  *(void *)((v11 + (((unint64_t)a1 + v9 + 16) & ~v9)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v11 + v10) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v12 = ((v11 + ((v9 + 16) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 15;
  *(void *)(((unint64_t)a1 + v12) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v12) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_22BDBF5C8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 24;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + v8 + 16) & ~v8, ((unint64_t)a2 + v8 + 16) & ~v8);
  uint64_t v9 = *(void *)(v7 + 40) + 7;
  *(void *)((v9 + (((unint64_t)a1 + v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v9 + (((unint64_t)a2 + v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v10 = ((v9 + ((v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 15;
  *(void *)(((unint64_t)a1 + v10) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v10) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_22BDBF6E0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = v5 + 32;
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  uint64_t v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(v8, v9);
  uint64_t v10 = *(void *)(v6 + 32) + 7;
  *(void *)((v10 + v8) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v10 + v9) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v11 = ((v10 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 15;
  *(void *)(((unint64_t)a1 + v11) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v11) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_22BDBF7BC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))(((unint64_t)a1 + v9 + 16) & ~v9, ((unint64_t)a2 + v9 + 16) & ~v9);
  uint64_t v10 = *(void *)(v8 + 24) + 7;
  *(void *)((v10 + (((unint64_t)a1 + v9 + 16) & ~v9)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v10 + (((unint64_t)a2 + v9 + 16) & ~v9)) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  unint64_t v11 = ((v10 + ((v9 + 16) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 15;
  *(void *)(((unint64_t)a1 + v11) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v11) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22BDBF8B4(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + 7;
  if (v7 < a2)
  {
    unint64_t v9 = ((((v8 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v10 = a2 - v7;
    uint64_t v11 = v9 & 0xFFFFFFF8;
    if ((v9 & 0xFFFFFFF8) != 0) {
      unsigned int v12 = 2;
    }
    else {
      unsigned int v12 = v10 + 1;
    }
    if (v12 >= 0x10000) {
      unsigned int v13 = 4;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v12 < 0x100) {
      unsigned int v13 = 1;
    }
    if (v12 >= 2) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    switch(v14)
    {
      case 1:
        int v15 = *((unsigned __int8 *)a1 + v9);
        if (!v15) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v15 = *(unsigned __int16 *)((char *)a1 + v9);
        if (v15) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x22BDBFA24);
      case 4:
        int v15 = *(_DWORD *)((char *)a1 + v9);
        if (!v15) {
          break;
        }
LABEL_22:
        int v17 = v15 - 1;
        if (v11)
        {
          int v17 = 0;
          LODWORD(v11) = *a1;
        }
        return v7 + (v11 | v17) + 1;
      default:
        break;
    }
  }
  uint64_t v18 = ((unint64_t)a1 + v6 + 16) & ~v6;
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(uint64_t))(v4 + 48))(v18);
  }
  unint64_t v19 = *(void *)((v8 + v18) & 0xFFFFFFFFFFFFFFF8);
  if (v19 >= 0xFFFFFFFF) {
    LODWORD(v19) = -1;
  }
  return (v19 + 1);
}

void sub_22BDBFA38(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + 7;
  unint64_t v11 = ((((v10 + ((v9 + 16) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v8 >= a3)
  {
    int v15 = 0;
    int v16 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v15)
      {
        case 1:
          a1[v11] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v11] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_43;
        case 4:
          *(_DWORD *)&a1[v11] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            unint64_t v19 = (unint64_t)&a1[v9 + 16] & ~v9;
            if (v7 < 0x7FFFFFFF)
            {
              int v21 = (void *)((v10 + v19) & 0xFFFFFFFFFFFFFFF8);
              if ((a2 & 0x80000000) != 0) {
                uint64_t v22 = a2 ^ 0x80000000;
              }
              else {
                uint64_t v22 = a2 - 1;
              }
              *int v21 = v22;
            }
            else
            {
              int v20 = *(void (**)(unint64_t))(v6 + 56);
              v20(v19);
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v12 = a3 - v8;
    if (((((v10 + ((v9 + 16) & ~v9)) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v13 = v12 + 1;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v13 >= 0x10000) {
      int v14 = 4;
    }
    else {
      int v14 = 2;
    }
    if (v13 < 0x100) {
      int v14 = 1;
    }
    if (v13 >= 2) {
      int v15 = v14;
    }
    else {
      int v15 = 0;
    }
    int v16 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (((((v10 + ((v9 + 16) & ~v9)) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    int v17 = v16;
  }
  else {
    int v17 = 1;
  }
  if (((((v10 + ((v9 + 16) & ~v9)) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    int v18 = ~v8 + a2;
    bzero(a1, ((((v10 + ((v9 + 16) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8);
    *(_DWORD *)a1 = v18;
  }
  switch(v15)
  {
    case 1:
      a1[v11] = v17;
      break;
    case 2:
      *(_WORD *)&a1[v11] = v17;
      break;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x22BDBFC40);
    case 4:
      *(_DWORD *)&a1[v11] = v17;
      break;
    default:
      return;
  }
}

uint64_t sub_22BDBFC70()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_22BDBFC80()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_22BDBFC90()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t sub_22BDBFCA0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_22BDBFCB0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_22BDBFCC0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_22BDBFCD0()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_22BDBFCE0()
{
  return MEMORY[0x270EF0780]();
}

uint64_t sub_22BDBFCF0()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_22BDBFD00()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_22BDBFD10()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_22BDBFD20()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_22BDBFD30()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_22BDBFD40()
{
  return MEMORY[0x270EE57F8]();
}

uint64_t sub_22BDBFD50()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_22BDBFD60()
{
  return MEMORY[0x270FA17C0]();
}

uint64_t sub_22BDBFD70()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_22BDBFD80()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_22BDBFD90()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22BDBFDA0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22BDBFDB0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22BDBFDC0()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_22BDBFDD0()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_22BDBFDE0()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_22BDBFDF0()
{
  return MEMORY[0x270F9D9A0]();
}

uint64_t sub_22BDBFE00()
{
  return MEMORY[0x270F9D9A8]();
}

uint64_t sub_22BDBFE10()
{
  return MEMORY[0x270F9D9C0]();
}

uint64_t sub_22BDBFE20()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_22BDBFE30()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_22BDBFE40()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_22BDBFE50()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_22BDBFE60()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_22BDBFE70()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_22BDBFE80()
{
  return MEMORY[0x270F9DCC8]();
}

uint64_t sub_22BDBFE90()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_22BDBFEA0()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_22BDBFEB0()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_22BDBFEC0()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_22BDBFED0()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_22BDBFEE0()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_22BDBFEF0()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_22BDBFF00()
{
  return MEMORY[0x270F9E190]();
}

uint64_t sub_22BDBFF10()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_22BDBFF20()
{
  return MEMORY[0x270EE5870]();
}

uint64_t sub_22BDBFF30()
{
  return MEMORY[0x270EE5888]();
}

uint64_t sub_22BDBFF40()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_22BDBFF50()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_22BDBFF60()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_22BDBFF70()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_22BDBFF80()
{
  return MEMORY[0x270F9E708]();
}

uint64_t sub_22BDBFF90()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_22BDBFFA0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_22BDBFFB0()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_22BDBFFC0()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_22BDBFFD0()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_22BDBFFE0()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_22BDBFFF0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_22BDC0000()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_22BDC0010()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_22BDC0020()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_22BDC0030()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_22BDC0040()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_22BDC0050()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_22BDC0060()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_22BDC0070()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22BDC0080()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_22BDC0090()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_22BDC00A0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_22BDC00B0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_22BDC00C0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_22BDC00D0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22BDC00E0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_22BDC00F0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_22BDC0100()
{
  return MEMORY[0x270F9FC90]();
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B88](red, green, blue, alpha);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x270EE6690](space, colors, locations);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
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