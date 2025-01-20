void sub_24A596394(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  __n128 *v3;
  uint64_t v7;
  uint64_t v8;
  long long v9;
  long long v10;
  long long v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __n128 v17;
  long long v18;
  long long v19;
  long long v20;
  long long v21;
  long long v22;
  __n128 v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  __n128 v29;
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  uint64_t v34;
  uint64_t v35;

  sub_24A561324(v3, &v23);
  v19 = v25;
  v20 = v26;
  v21 = v27;
  v22 = v28;
  v17 = v23;
  v18 = v24;
  if (!a2)
  {
    v9 = v26;
    *(_OWORD *)(a1 + 32) = v25;
    *(_OWORD *)(a1 + 48) = v9;
    v10 = v28;
    *(_OWORD *)(a1 + 64) = v27;
    *(_OWORD *)(a1 + 80) = v10;
    v11 = v24;
    *(__n128 *)a1 = v23;
    *(_OWORD *)(a1 + 16) = v11;
    return;
  }
  if (!a3)
  {
LABEL_13:
    *(__n128 *)a1 = v17;
    *(_OWORD *)(a1 + 16) = v18;
    *(_OWORD *)(a1 + 32) = v19;
    *(_OWORD *)(a1 + 48) = v20;
    *(_OWORD *)(a1 + 64) = v21;
    *(_OWORD *)(a1 + 80) = v22;
    return;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v8 = *((void *)&v28 + 1);
    v7 = v28;
    if ((*((void *)&v28 + 1) ^ (unint64_t)v28) < 0x4000)
    {
LABEL_12:
      *(__n128 *)a1 = v17;
      *(_OWORD *)(a1 + 16) = v18;
      *(_OWORD *)(a1 + 32) = v19;
      *(_OWORD *)(a1 + 48) = v20;
      *(_OWORD *)(a1 + 64) = v21;
      *(void *)(a1 + 80) = v7;
      *(void *)(a1 + 88) = v8;
      return;
    }
    v12 = 0;
    while (1)
    {
      v29 = v17;
      v30 = v18;
      v31 = v19;
      v32 = v20;
      v33 = v21;
      v34 = v7;
      v35 = v8;
      sub_24A495168();
      v14 = v13;
      v16 = v15;
      if ((sub_24A495704(v13, v15) & 1) == 0) {
        *(void *)&v22 = *((void *)&v22 + 1);
      }
      *a2 = v14;
      a2[1] = v16;
      if (a3 - 1 == v12) {
        goto LABEL_13;
      }
      v8 = *((void *)&v22 + 1);
      v7 = v22;
      ++v12;
      a2 += 2;
      if ((*((void *)&v22 + 1) ^ (unint64_t)v22) < 0x4000) {
        goto LABEL_12;
      }
    }
  }
  __break(1u);
}

uint64_t sub_24A5964FC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  long long v29 = *(_OWORD *)(v3 + 16);
  long long v30 = *(_OWORD *)(v3 + 32);
  v31[0] = *(_OWORD *)v3;
  uint64_t v26 = *(void *)(v3 + 8);
  uint64_t v27 = *(void *)v3;
  uint64_t v7 = *(void *)(v3 + 24);
  uint64_t v25 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 32);
  uint64_t v8 = *(void *)(v3 + 40);
  v31[1] = v29;
  v31[2] = v30;
  sub_24A4974C4((uint64_t)v31, (uint64_t)v32);
  sub_24A497498((uint64_t)v32);
  unint64_t v10 = sub_24A489E5C(0x300uLL, 0, 0, 1);
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t result = sub_24A496BE8(v4);
  uint64_t v19 = v25;
  uint64_t v18 = v26;
  uint64_t v20 = v27;
  uint64_t v28 = v14;
  if (!a2)
  {
    uint64_t v21 = 0;
    goto LABEL_11;
  }
  uint64_t v21 = a3;
  if (!a3)
  {
LABEL_11:
    *a1 = v20;
    a1[1] = v18;
    a1[2] = v19;
    a1[3] = v7;
    a1[4] = v9;
    a1[5] = v8;
    a1[6] = v10;
    a1[7] = v12;
    a1[8] = v14;
    a1[9] = v16;
    return v21;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    Swift::UInt8_optional v22 = BigString.UTF8View.Iterator.next()();
    uint64_t v23 = 0;
    if ((*(_WORD *)&v22 & 0x100) != 0)
    {
LABEL_7:
      uint64_t v20 = v27;
      uint64_t v18 = v26;
      uint64_t v19 = v25;
      uint64_t v21 = v23;
    }
    else
    {
      while (1)
      {
        *(unsigned char *)(a2 + v23) = v22.value;
        if (a3 - 1 == v23) {
          break;
        }
        Swift::UInt8_optional v22 = BigString.UTF8View.Iterator.next()();
        ++v23;
        if ((*(_WORD *)&v22 & 0x100) != 0) {
          goto LABEL_7;
        }
      }
      uint64_t v20 = v27;
      uint64_t v18 = v26;
      uint64_t v19 = v25;
    }
    uint64_t v14 = v28;
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_24A596668(unint64_t *a1, uint64_t *a2, unint64_t *a3)
{
  long long v6 = *(_OWORD *)(v3 + 16);
  v52[0] = *(_OWORD *)v3;
  v52[1] = v6;
  v52[2] = *(_OWORD *)(v3 + 32);
  unint64_t v42 = *(void *)(v3 + 88);
  unint64_t v43 = *(void *)(v3 + 80);
  unint64_t v40 = *(void *)(v3 + 104);
  int64_t v41 = *(void *)(v3 + 96);
  sub_24A493804(v52, *(void *)(v3 + 48), *(void *)(v3 + 56), *(void *)(v3 + 64), *(void *)(v3 + 72), v51);
  unint64_t v38 = v51[0];
  unint64_t v39 = v51[2];
  unint64_t v36 = v51[1];
  unint64_t v37 = v51[3];
  uint64_t v7 = v51[5];
  unint64_t v35 = v51[4];
  uint64_t v9 = v51[6];
  uint64_t v8 = (unint64_t *)v51[7];
  unint64_t v10 = (unint64_t *)v51[8];
  uint64_t v11 = (unint64_t *)v51[9];
  int64_t v13 = v51[10];
  uint64_t v12 = (long long *)v51[11];
  uint64_t result = sub_24A496BE8(v3);
  unint64_t v16 = v35;
  unint64_t v15 = v36;
  unint64_t v17 = v37;
  unint64_t v18 = v38;
  unint64_t v20 = v39;
  unint64_t v19 = v40;
  int64_t v22 = v41;
  unint64_t v21 = v42;
  unint64_t v23 = v43;
  *(void *)&long long v44 = v43;
  *((void *)&v44 + 1) = v42;
  *(void *)&long long v45 = v41;
  *((void *)&v45 + 1) = v40;
  *(void *)&long long v46 = v38;
  *((void *)&v46 + 1) = v36;
  *(void *)&long long v47 = v39;
  *((void *)&v47 + 1) = v37;
  *(void *)&long long v48 = v35;
  *((void *)&v48 + 1) = v7;
  *(void *)v49 = v9;
  *(void *)&v49[8] = v8;
  *(void *)&v49[16] = v10;
  *(void *)&v49[24] = v11;
  *(void *)&long long v50 = v13;
  *((void *)&v50 + 1) = v12;
  if (!a2) {
    goto LABEL_14;
  }
  unint64_t v10 = a3;
  uint64_t v8 = a1;
  if (!a3)
  {
LABEL_15:
    long long v28 = *(_OWORD *)v49;
    *((_OWORD *)v8 + 4) = v48;
    *((_OWORD *)v8 + 5) = v28;
    long long v29 = v50;
    *((_OWORD *)v8 + 6) = *(_OWORD *)&v49[16];
    *((_OWORD *)v8 + 7) = v29;
    *(_OWORD *)uint64_t v8 = v44;
    *((_OWORD *)v8 + 1) = v45;
    long long v30 = v46;
    long long v31 = v47;
LABEL_17:
    *((_OWORD *)v8 + 2) = v30;
    *((_OWORD *)v8 + 3) = v31;
    return (uint64_t)v10;
  }
  if (((unint64_t)a3 & 0x8000000000000000) == 0)
  {
    unint64_t v21 = *(void *)v49;
    unint64_t v24 = v50;
    int64_t v22 = *(void *)v49 + ((unint64_t)v50 >> 16);
    if (!__OFADD__(*(void *)v49, (unint64_t)v50 >> 16))
    {
      uint64_t v11 = 0;
      uint64_t v12 = &v46;
      int64_t v13 = v43 >> 11;
      a1 = (unint64_t *)((char *)a3 - 1);
      while (v22 < v13 && (*((void *)&v50 + 1) ^ v24) >= 0x4000)
      {
        v52[3] = v46;
        v52[4] = v47;
        v52[5] = v48;
        unint64_t v53 = v21;
        long long v54 = *(_OWORD *)&v49[8];
        uint64_t v55 = *(void *)&v49[24];
        unint64_t v56 = v24;
        uint64_t v57 = *((void *)&v50 + 1);
        sub_24A495168();
        uint64_t v7 = v25;
        uint64_t v9 = v26;
        if ((sub_24A495704(v25, v26) & 1) == 0) {
          *(void *)&long long v50 = *((void *)&v50 + 1);
        }
        *a2 = v7;
        a2[1] = v9;
        if (a1 == v11) {
          goto LABEL_15;
        }
        unint64_t v21 = *(void *)v49;
        unint64_t v24 = v50;
        int64_t v22 = *(void *)v49 + ((unint64_t)v50 >> 16);
        uint64_t v11 = (unint64_t *)((char *)v11 + 1);
        a2 += 2;
        if (__OFADD__(*(void *)v49, (unint64_t)v50 >> 16)) {
          goto LABEL_13;
        }
      }
      long long v32 = *(_OWORD *)v49;
      *((_OWORD *)v8 + 4) = v48;
      *((_OWORD *)v8 + 5) = v32;
      long long v33 = v50;
      *((_OWORD *)v8 + 6) = *(_OWORD *)&v49[16];
      *((_OWORD *)v8 + 7) = v33;
      *(_OWORD *)uint64_t v8 = v44;
      *((_OWORD *)v8 + 1) = v45;
      long long v30 = v46;
      long long v31 = v47;
      unint64_t v10 = v11;
      goto LABEL_17;
    }
LABEL_13:
    __break(1u);
LABEL_14:
    uint64_t v27 = v10;
    unint64_t v10 = 0;
    *a1 = v23;
    a1[1] = v21;
    a1[2] = v22;
    a1[3] = v19;
    a1[4] = v18;
    a1[5] = v15;
    a1[6] = v20;
    a1[7] = v17;
    a1[8] = v16;
    a1[9] = v7;
    a1[10] = v9;
    a1[11] = (unint64_t)v8;
    a1[12] = (unint64_t)v27;
    a1[13] = (unint64_t)v11;
    a1[14] = v13;
    a1[15] = (unint64_t)v12;
    return (uint64_t)v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24A596898(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v5 = *(_OWORD *)(v3 + 16);
  v42[0] = *(_OWORD *)v3;
  v42[1] = v5;
  v42[2] = *(_OWORD *)(v3 + 32);
  uint64_t v6 = *(void *)(v3 + 96);
  uint64_t v28 = *(void *)(v3 + 88);
  unint64_t v29 = *(void *)(v3 + 80);
  uint64_t v7 = *(void *)(v3 + 104);
  sub_24A4DFE00(v42, *(void *)(v3 + 48), *(void *)(v3 + 56), *(void *)(v3 + 64), *(void *)(v3 + 72), (uint64_t)v35);
  long long v26 = v35[0];
  long long v27 = v35[1];
  uint64_t v8 = v36;
  uint64_t v9 = v37;
  unint64_t v10 = v38;
  uint64_t v11 = v39;
  uint64_t v12 = v40;
  uint64_t v13 = v41;
  uint64_t result = sub_24A496BE8(v3);
  long long v16 = v26;
  long long v15 = v27;
  uint64_t v17 = v6;
  unint64_t v18 = v29;
  uint64_t v19 = v28;
  *(void *)&long long v31 = v8;
  *((void *)&v31 + 1) = v9;
  unint64_t v32 = v10;
  *(void *)&long long v33 = v11;
  *((void *)&v33 + 1) = v12;
  uint64_t v34 = v7;
  *(void *)&long long v20 = v8;
  *((void *)&v20 + 1) = v9;
  *(void *)&long long v21 = v11;
  *((void *)&v21 + 1) = v12;
  if (!a2)
  {
    uint64_t v22 = 0;
    goto LABEL_15;
  }
  uint64_t v22 = a3;
  if (!a3)
  {
LABEL_15:
    *(_OWORD *)a1 = v16;
    *(_OWORD *)(a1 + 16) = v15;
    *(_OWORD *)(a1 + 32) = v20;
    *(void *)(a1 + 48) = v10;
    *(_OWORD *)(a1 + 56) = v21;
    *(void *)(a1 + 72) = v13;
    *(void *)(a1 + 80) = v18;
    *(void *)(a1 + 88) = v19;
    *(void *)(a1 + 96) = v17;
    *(void *)(a1 + 104) = v7;
    return v22;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (v29 >> 10 <= v10 >> 10)
    {
      uint64_t v23 = 0;
LABEL_13:
      long long v16 = v26;
      long long v15 = v27;
      long long v20 = v31;
      long long v21 = v33;
      unint64_t v18 = v29;
      uint64_t v19 = v28;
      uint64_t v17 = v6;
      uint64_t v22 = v23;
    }
    else
    {
      uint64_t v23 = 0;
      while (1)
      {
        *(Swift::UInt16_optional *)&int v24 = BigString.UTF16View.Iterator.next()();
        if ((v24 & 0x10000) != 0)
        {
          unint64_t v10 = v32;
          goto LABEL_13;
        }
        *(_WORD *)(a2 + 2 * v23) = v24;
        unint64_t v10 = v32;
        if (a3 - 1 == v23) {
          break;
        }
        ++v23;
        if (v29 >> 10 <= v32 >> 10) {
          goto LABEL_13;
        }
      }
      long long v16 = v26;
      long long v15 = v27;
      long long v20 = v31;
      long long v21 = v33;
      unint64_t v18 = v29;
      uint64_t v19 = v28;
      uint64_t v17 = v6;
    }
    uint64_t v7 = v34;
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t sub_24A596A34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  long long v33 = *(_OWORD *)(v3 + 16);
  long long v34 = *(_OWORD *)v3;
  uint64_t v6 = *(void *)(v3 + 32);
  uint64_t v35 = *(void *)(v3 + 40);
  unint64_t v7 = *(void *)(v3 + 48);
  uint64_t v8 = *(void *)(v3 + 56);
  unint64_t v9 = *(void *)(v3 + 64);
  uint64_t v10 = *(void *)(v3 + 72);
  unint64_t v12 = *(void *)(v3 + 80);
  uint64_t v11 = *(void *)(v3 + 88);
  uint64_t v31 = *(void *)(v3 + 104);
  uint64_t v32 = *(void *)(v3 + 96);
  sub_24A497498(v3);
  unint64_t v13 = sub_24A489E5C(v7, v8, v9, v10);
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t result = sub_24A496BE8(v4);
  uint64_t v22 = v31;
  uint64_t v21 = v32;
  long long v23 = v33;
  long long v24 = v34;
  *(void *)&long long v37 = v6;
  *((void *)&v37 + 1) = v35;
  unint64_t v38 = v13;
  *(void *)&long long v39 = v12;
  *((void *)&v39 + 1) = v11;
  *(void *)&long long v25 = v6;
  *((void *)&v25 + 1) = v35;
  *(void *)&long long v26 = v12;
  *((void *)&v26 + 1) = v11;
  if (!a2)
  {
    uint64_t v27 = 0;
    goto LABEL_15;
  }
  uint64_t v27 = a3;
  if (!a3)
  {
LABEL_15:
    *(_OWORD *)a1 = v24;
    *(_OWORD *)(a1 + 16) = v23;
    *(_OWORD *)(a1 + 32) = v25;
    *(void *)(a1 + 48) = v13;
    *(void *)(a1 + 56) = v15;
    *(void *)(a1 + 64) = v17;
    *(void *)(a1 + 72) = v19;
    *(_OWORD *)(a1 + 80) = v26;
    *(void *)(a1 + 96) = v21;
    *(void *)(a1 + 104) = v22;
    return v27;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (v12 >> 10 <= v13 >> 10)
    {
      uint64_t v28 = 0;
LABEL_13:
      long long v24 = v34;
      long long v23 = v33;
      long long v25 = v37;
      long long v26 = v39;
      uint64_t v27 = v28;
    }
    else
    {
      uint64_t v28 = 0;
      while (1)
      {
        Swift::UInt8_optional v29 = BigString.UTF8View.Iterator.next()();
        if ((*(_WORD *)&v29 & 0x100) != 0)
        {
          unint64_t v13 = v38;
          goto LABEL_13;
        }
        *(unsigned char *)(a2 + v28) = v29.value;
        unint64_t v13 = v38;
        if (a3 - 1 == v28) {
          break;
        }
        ++v28;
        if (v12 >> 10 <= v38 >> 10) {
          goto LABEL_13;
        }
      }
      long long v24 = v34;
      long long v23 = v33;
      long long v25 = v37;
      long long v26 = v39;
    }
    uint64_t v21 = v32;
    uint64_t v22 = v31;
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t sub_24A596BE8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t)v3;
  uint64_t v46 = *v3;
  uint64_t v44 = v3[2];
  uint64_t v45 = v3[1];
  uint64_t v42 = v3[4];
  uint64_t v43 = v3[3];
  unint64_t v6 = v3[6];
  uint64_t v7 = v3[7];
  unint64_t v8 = v3[8];
  uint64_t v9 = v3[9];
  unint64_t v40 = v3[10];
  uint64_t v41 = v3[5];
  uint64_t v11 = v3[11];
  unint64_t v10 = v3[12];
  uint64_t v12 = v3[13];
  sub_24A497498((uint64_t)v3);
  sub_24A497498((uint64_t)v3);
  unint64_t v13 = sub_24A4965FC(v6, v7, v8, v9);
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  sub_24A497498((uint64_t)v3);
  unint64_t v20 = sub_24A496820(v40, v11, v10, v12, 1);
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  sub_24A496BE8(v4);
  sub_24A496BE8(v4);
  uint64_t result = sub_24A496BE8(v4);
  uint64_t v28 = v22;
  uint64_t v29 = v19;
  uint64_t v31 = v41;
  uint64_t v30 = v42;
  uint64_t v33 = v43;
  uint64_t v32 = v44;
  uint64_t v35 = v45;
  uint64_t v34 = v46;
  unint64_t v48 = v13;
  uint64_t v49 = v19;
  uint64_t v50 = v22;
  if (!a2)
  {
    uint64_t v36 = 0;
    goto LABEL_14;
  }
  uint64_t v36 = a3;
  if (!a3)
  {
LABEL_14:
    *a1 = v34;
    a1[1] = v35;
    a1[2] = v32;
    a1[3] = v33;
    a1[4] = v30;
    a1[5] = v31;
    a1[6] = v13;
    a1[7] = v15;
    a1[8] = v17;
    a1[9] = v29;
    a1[10] = v20;
    a1[11] = v28;
    a1[12] = v24;
    a1[13] = v26;
    return v36;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (v20 >> 10 <= v13 >> 10)
    {
      uint64_t v37 = 0;
LABEL_13:
      uint64_t v34 = v46;
      uint64_t v35 = v45;
      uint64_t v32 = v44;
      uint64_t v33 = v43;
      uint64_t v30 = v42;
      uint64_t v31 = v41;
      uint64_t v29 = v49;
      uint64_t v28 = v50;
      uint64_t v36 = v37;
    }
    else
    {
      uint64_t v37 = 0;
      while (1)
      {
        BigString.UnicodeScalarView.Iterator.next()();
        if ((v38 & 0x100000000) != 0)
        {
          unint64_t v13 = v48;
          goto LABEL_13;
        }
        *(_DWORD *)(a2 + 4 * v37) = v38;
        if (a3 - 1 == v37) {
          break;
        }
        unint64_t v13 = v48;
        ++v37;
        if (v20 >> 10 <= v48 >> 10) {
          goto LABEL_13;
        }
      }
      uint64_t v34 = v46;
      uint64_t v35 = v45;
      uint64_t v32 = v44;
      uint64_t v33 = v43;
      uint64_t v30 = v42;
      uint64_t v31 = v41;
      unint64_t v13 = v48;
      uint64_t v29 = v49;
      uint64_t v28 = v50;
    }
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t *sub_24A596E08(uint64_t *result, unint64_t *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = 0;
    goto LABEL_23;
  }
  if (!a3)
  {
LABEL_22:
    uint64_t v5 = a3;
    goto LABEL_23;
  }
  if (a3 < 0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v5 = a4;
  if (!a4)
  {
LABEL_23:
    *uint64_t result = a4;
    result[1] = a5;
    result[2] = v5;
    return (uint64_t *)v5;
  }
  unint64_t v6 = a4 - 1;
  if (a4 >= 1)
  {
    *a2 = a5;
    if (a3 != 1)
    {
      if (a3 - 2 < v6) {
        unint64_t v6 = a3 - 2;
      }
      if (v6 >= a3 - 1) {
        unint64_t v6 = a3 - 1;
      }
      unint64_t v7 = v6 + 1;
      if (v7 > 4)
      {
        uint64_t v10 = v7 & 3;
        if ((v7 & 3) == 0) {
          uint64_t v10 = 4;
        }
        unint64_t v11 = v7 - v10;
        uint64_t v8 = v7 - v10 + 1;
        uint64_t v9 = &a2[v11];
        int64x2_t v12 = vdupq_n_s64(a5);
        unint64_t v13 = (int64x2_t *)(a2 + 3);
        do
        {
          v13[-1] = v12;
          *unint64_t v13 = v12;
          v13 += 2;
          v11 -= 4;
        }
        while (v11);
      }
      else
      {
        uint64_t v8 = 1;
        uint64_t v9 = a2;
      }
      uint64_t v14 = v9 + 1;
      while (a3 != v8)
      {
        if (a4 == v8)
        {
          uint64_t v5 = a4;
          goto LABEL_23;
        }
        ++v8;
        *v14++ = a5;
        if (a3 == v8) {
          goto LABEL_22;
        }
      }
      __break(1u);
      goto LABEL_26;
    }
    goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

unint64_t sub_24A596EE4()
{
  unint64_t result = qword_26979C3D8;
  if (!qword_26979C3D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26979C3D8);
  }
  return result;
}

unint64_t sub_24A596F3C()
{
  unint64_t result = qword_26979C3E0;
  if (!qword_26979C3E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26979C3E0);
  }
  return result;
}

unint64_t sub_24A596F94()
{
  unint64_t result = qword_26979C3E8;
  if (!qword_26979C3E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26979C3F0);
    sub_24A55E954();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26979C3E8);
  }
  return result;
}

unint64_t sub_24A59700C()
{
  unint64_t result = qword_26979C3F8;
  if (!qword_26979C3F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26979C3F8);
  }
  return result;
}

unint64_t sub_24A597064()
{
  unint64_t result = qword_26979C400;
  if (!qword_26979C400)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26979C3F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26979C400);
  }
  return result;
}

ValueMetadata *type metadata accessor for BigSubstring.UTF8View()
{
  return &type metadata for BigSubstring.UTF8View;
}

ValueMetadata *type metadata accessor for BigSubstring.UTF8View.Iterator()
{
  return &type metadata for BigSubstring.UTF8View.Iterator;
}

uint64_t Rope.remove(at:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return Rope._remove(at:)(a5, a1, a2, a3, a4);
}

uint64_t Rope._remove(at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6 = v5;
  uint64_t v7 = a5;
  v124 = (char *)a4;
  v122 = (char *)a3;
  uint64_t v110 = a1;
  uint64_t v9 = *(void **)(a5 + 16);
  uint64_t v10 = *(int **)(a5 + 24);
  uint64_t v11 = type metadata accessor for Rope._Node();
  uint64_t v111 = sub_24A5BBD20();
  v114 = *(unsigned __int16 **)(v111 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v111);
  v92 = (char *)&AssociatedTypeWitness - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v96 = (char *)&AssociatedTypeWitness - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v98 = (char *)&AssociatedTypeWitness - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v119 = (char *)&AssociatedTypeWitness - v19;
  uint64_t v20 = *(void *)(v11 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  v93 = (char **)((char *)&AssociatedTypeWitness - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v94 = (uint64_t)&AssociatedTypeWitness - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  v95 = (char *)&AssociatedTypeWitness - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  v97 = (char *)&AssociatedTypeWitness - v28;
  MEMORY[0x270FA5388](v27);
  uint64_t v30 = (char *)&AssociatedTypeWitness - v29;
  strcpy(v125, "removed delta needsFixing pathIsAtEnd ");
  v126[0] = type metadata accessor for Rope._Item();
  v117 = v10;
  v118 = v9;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v126[1] = AssociatedTypeWitness;
  v126[2] = MEMORY[0x263F8D4F8];
  v126[3] = MEMORY[0x263F8D4F8];
  TupleTypeMetadata = (int *)swift_getTupleTypeMetadata();
  uint64_t v116 = *((void *)TupleTypeMetadata - 1);
  uint64_t v32 = MEMORY[0x270FA5388](TupleTypeMetadata);
  v109 = (char *)&AssociatedTypeWitness - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  v115 = (char *)&AssociatedTypeWitness - v35;
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  uint64_t v38 = (char *)&AssociatedTypeWitness - v37;
  uint64_t v39 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v36);
  uint64_t v41 = (char *)&AssociatedTypeWitness - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = *(void (**)(char *, char *, uint64_t))(v39 + 16);
  uint64_t v101 = v39 + 16;
  v100 = v42;
  v42(v41, v6, v7);
  uint64_t v43 = a2;
  unint64_t v44 = (unint64_t)v122;
  Rope.validate(_:)(v43, (uint64_t)v122, (uint64_t)v124, v7);
  uint64_t v45 = *(void (**)(char *, uint64_t))(v39 + 8);
  v102 = v41;
  uint64_t v113 = v7;
  uint64_t v103 = v39 + 8;
  v99 = v45;
  v45(v41, v7);
  v126[0] = v44;
  uint64_t v112 = v20;
  uint64_t v46 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
  long long v47 = v6;
  if (v46(v6, 1, v11) == 1)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v48 = TupleTypeMetadata[16];
  v122 = &v38[TupleTypeMetadata[12]];
  v123 = TupleTypeMetadata;
  uint64_t v49 = TupleTypeMetadata[20];
  int v50 = Rope._Node.remove(at:)((uint64_t)v38, (uint64_t)v122, v126, v11);
  LODWORD(v108) = v50;
  int v121 = v50 & 1;
  v38[v48] = v50 & 1;
  v124 = v38;
  BOOL v120 = (unsigned __int16)v50 > 0xFFu;
  v38[v49] = v120;
  uint64_t v7 = (uint64_t)v119;
  v51 = v47;
  TupleTypeMetadata = (int *)v111;
  v107 = (void (*)(char *, char *))*((void *)v114 + 2);
  v107(v119, v47);
  v105 = v46;
  if (v46((char *)v7, 1, v11) == 1)
  {
LABEL_18:
    (*((void (**)(char *, int *))v114 + 1))(v119, TupleTypeMetadata);
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v52 = v112;
  v106 = *(void (**)(char *, char *, uint64_t))(v112 + 32);
  v106(v30, v119, v11);
  BOOL v53 = Rope._Node.isEmpty.getter();
  v119 = *(char **)(v52 + 8);
  ((void (*)(char *, uint64_t))v119)(v30, v11);
  v104 = v51;
  if (!v53)
  {
    long long v47 = v98;
    uint64_t v7 = (uint64_t)TupleTypeMetadata;
    ((void (*)(char *, char *, int *))v107)(v98, v51, TupleTypeMetadata);
    v61 = v105;
    if (v105(v47, 1, v11) == 1) {
      goto LABEL_19;
    }
    v62 = v97;
    v106(v97, v47, v11);
    int v63 = (unsigned __int16)Rope._Node.header.getter();
    ((void (*)(char *, uint64_t))v119)(v62, v11);
    if (v63 != 1) {
      goto LABEL_12;
    }
    long long v47 = v96;
    ((void (*)(char *, char *, uint64_t))v107)(v96, v51, v7);
    if (v61(v47, 1, v11) == 1) {
      goto LABEL_19;
    }
    v64 = v95;
    v106(v95, v47, v11);
    int v65 = Rope._Node.header.getter();
    ((void (*)(char *, uint64_t))v119)(v64, v11);
    if ((v65 & 0xFF0000) == 0) {
      goto LABEL_12;
    }
    long long v47 = v92;
    ((void (*)(char *, char *, uint64_t))v107)(v92, v51, v7);
    if (v61(v47, 1, v11) == 1)
    {
LABEL_19:
      uint64_t result = (*((uint64_t (**)(char *, uint64_t))v114 + 1))(v47, v7);
      __break(1u);
      return result;
    }
    v66 = v93;
    v106((char *)v93, v47, v11);
    long long v47 = *v66;
    uint64_t v67 = (uint64_t)(*v66 + 16);
    uint64_t v7 = v112;
    unint64_t v68 = (unint64_t)&(*v66)[(*(unsigned __int8 *)(v112 + 80) + 19) & ~(unint64_t)*(unsigned __int8 *)(v112 + 80)];
    swift_getWitnessTable();
    uint64_t v69 = v67;
    TupleTypeMetadata = v117;
    uint64_t v70 = (uint64_t)v118;
    v114 = (unsigned __int16 *)nullsub_1(v69, v68, v118, v11, v117);
    uint64_t v72 = v71;
    swift_unknownObjectRetain();
    uint64_t v73 = v94;
    sub_24A598A98(v114, v72, v70, (uint64_t)TupleTypeMetadata, v94);
    swift_unknownObjectRelease();
    ((void (*)(char **, uint64_t))v119)(v66, v11);
    v74 = v104;
    if (v105(v104, 1, v11) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 40))(v74, v73, v11);
      swift_getAssociatedConformanceWitness();
      type metadata accessor for _RopePath();
      _RopePath.popRoot()();
      goto LABEL_12;
    }
    goto LABEL_17;
  }
  (*((void (**)(char *, int *))v114 + 1))(v51, TupleTypeMetadata);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v52 + 56))(v51, 1, 1, v11);
  long long v54 = v123;
  uint64_t v55 = v115;
  unint64_t v56 = &v115[v123[12]];
  uint64_t v57 = v123[16];
  uint64_t v58 = v123[20];
  uint64_t v59 = type metadata accessor for Rope._Item();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v59 - 8) + 16))(v55, v124, v59);
  uint64_t v60 = swift_getAssociatedTypeWitness();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 16))(v56, v122, v60);
  v55[v57] = v121;
  v55[v58] = v120;
  (*(void (**)(char *, int *))(v116 + 8))(v55, v54);
LABEL_12:
  LODWORD(v114) = (unsigned __int16)v108;
  Rope._invalidateIndices()();
  v75 = v123;
  v76 = v109;
  v119 = &v109[v123[12]];
  uint64_t v111 = v123[16];
  uint64_t v108 = v123[20];
  v77 = v118;
  uint64_t v78 = type metadata accessor for Rope._Item();
  uint64_t v79 = *(void *)(v78 - 8);
  uint64_t v112 = *(void *)(v79 + 16);
  ((void (*)(char *, char *, uint64_t))v112)(v76, v124, v78);
  uint64_t v80 = swift_getAssociatedTypeWitness();
  uint64_t v81 = *(void *)(v80 - 8);
  v117 = *(int **)(v81 + 16);
  ((void (*)(char *, char *, uint64_t))v117)(v119, v122, v80);
  v76[v111] = v121;
  v76[v108] = v120;
  (*(void (**)(uint64_t, char *, void *))(*(v77 - 1) + 16))(v110, v76, v77);
  v118 = *(void **)(v79 + 8);
  ((void (*)(char *, uint64_t))v118)(v76, v78);
  v82 = v115;
  v83 = &v115[v75[12]];
  uint64_t v84 = v75[16];
  uint64_t v85 = v75[20];
  ((void (*)(char *, char *, uint64_t))v112)(v115, v124, v78);
  ((void (*)(char *, char *, uint64_t))v117)(v83, v122, v80);
  v82[v84] = v121;
  v82[v85] = v120;
  v86 = *(void (**)(char *, uint64_t))(v81 + 8);
  v86(v83, v80);
  ((void (*)(char *, uint64_t))v118)(v82, v78);
  if (v114 < 0x100)
  {
    (*(void (**)(char *, int *))(v116 + 8))(v124, v123);
    uint64_t v89 = v126[0];
  }
  else
  {
    v87 = v102;
    uint64_t v88 = v113;
    v100(v102, v104, v113);
    uint64_t v89 = Rope._endPath.getter();
    v99(v87, v88);
    (*(void (**)(char *, int *))(v116 + 8))(v124, v123);
  }
  v86(v119, v80);
  return v89;
}

uint64_t Rope.remove(at:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v6 = Rope._remove(at:)(a3, *a1, a1[1], a1[2], a2);
  uint64_t v7 = *(void *)(v3 + *(int *)(a2 + 36));
  uint64_t v8 = Rope._unmanagedLeaf(at:)(v6);
  uint64_t result = Rope.Index.init(version:path:leaf:)(v7, v6, v8, *(void *)(a2 + 16), *(void *)(a2 + 24));
  *a1 = result;
  a1[1] = v10;
  a1[2] = v11;
  return result;
}

uint64_t Rope._Node.remove(at:)(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v111 = a2;
  uint64_t v110 = a1;
  uint64_t v8 = *(void *)(a4 + 16);
  uint64_t v9 = *(void (**)(unsigned char *, uint64_t, uint64_t))(a4 + 24);
  uint64_t v10 = type metadata accessor for Rope._Item();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v106 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v116 = &v93[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v105 = &v93[-v15];
  MEMORY[0x270FA5388](v14);
  BOOL v120 = &v93[-v16];
  strcpy(v122, "removed delta needsFixing pathIsAtEnd ");
  uint64_t v118 = v10;
  uint64_t v123 = v10;
  uint64_t v124 = AssociatedTypeWitness;
  uint64_t v125 = MEMORY[0x263F8D4F8];
  uint64_t v126 = MEMORY[0x263F8D4F8];
  uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  uint64_t v104 = *(void *)(TupleTypeMetadata - 8);
  uint64_t v17 = MEMORY[0x270FA5388](TupleTypeMetadata);
  uint64_t v103 = &v93[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = &v93[-v20];
  MEMORY[0x270FA5388](v19);
  v114 = &v93[-v22];
  Rope._Node.ensureUnique()();
  unsigned int v23 = Rope._Node.header.getter();
  char v24 = BYTE2(v23);
  unsigned int v25 = HIWORD(v23);
  v115 = a3;
  unint64_t v26 = *a3;
  v107 = v9;
  AssociatedConformanceWitness = (unsigned char *)swift_getAssociatedConformanceWitness();
  uint64_t v27 = _RopePath.subscript.getter(v25, v26, AssociatedTypeWitness, (uint64_t)AssociatedConformanceWitness);
  uint64_t v121 = a4;
  uint64_t result = Rope._Node.header.getter();
  if (v27 >= (unsigned __int16)result)
  {
    __break(1u);
    goto LABEL_19;
  }
  v119 = v5;
  uint64_t v109 = v27;
  if (v24)
  {
    unsigned int v94 = v25;
    uint64_t v29 = (int *)TupleTypeMetadata;
    BOOL v120 = &v114[*(int *)(TupleTypeMetadata + 48)];
    v102 = v21;
    uint64_t v30 = (uint64_t)v114;
    uint64_t v31 = *(int *)(TupleTypeMetadata + 80);
    uint64_t v116 = (unsigned char *)*(int *)(TupleTypeMetadata + 64);
    TupleTypeMetadata2 = v31;
    uint64_t v32 = *v5 + 16;
    uint64_t v33 = v121;
    unint64_t v34 = *v5
        + ((*(unsigned __int8 *)(*(void *)(v121 - 8) + 80) + 19) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v121 - 8) + 80));
    swift_getWitnessTable();
    uint64_t v35 = (uint64_t)v107;
    uint64_t v36 = (unsigned __int16 *)nullsub_1(v32, v34, v8, v33, v107);
    uint64_t v38 = v37;
    swift_unknownObjectRetain();
    sub_24A598C30(v36, v38, (uint64_t)v115, v8, v35, v30);
    swift_unknownObjectRelease();
    uint64_t v39 = v120;
    (*((void (**)(unsigned char *, uint64_t))AssociatedConformanceWitness + 7))(v120, AssociatedTypeWitness);
    uint64_t v40 = v102;
    uint64_t v41 = &v102[v29[12]];
    v105 = (unsigned char *)v29[16];
    uint64_t v109 = v29[20];
    uint64_t v42 = v118;
    uint64_t v43 = *(void *)(v118 - 8);
    uint64_t v44 = AssociatedTypeWitness;
    uint64_t v45 = (unsigned char *)(v43 + 16);
    v107 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v43 + 16);
    v107(v102, v30, v118);
    uint64_t v46 = v44;
    uint64_t v47 = *(void *)(v44 - 8);
    uint64_t v106 = *(void *)(v47 + 16);
    uint64_t v48 = v39;
    uint64_t v49 = v46;
    uint64_t v112 = v46;
    ((void (*)(unsigned char *, unsigned char *))v106)(v41, v48);
    v105[(void)v40] = v116[v30];
    int v101 = *(unsigned __int8 *)(v30 + TupleTypeMetadata2);
    v40[v109] = v101;
    uint64_t v98 = v47;
    uint64_t v109 = *(void *)(v47 + 8);
    ((void (*)(unsigned char *, uint64_t))v109)(v41, v49);
    uint64_t v95 = v43;
    uint64_t v51 = v43 + 8;
    int v50 = *(void (**)(unsigned char *, uint64_t))(v43 + 8);
    v50(v40, v42);
    uint64_t v52 = &v40[v29[12]];
    uint64_t v99 = v29[16];
    uint64_t v100 = v29[20];
    v105 = v45;
    v107(v40, v30, v42);
    uint64_t v53 = v112;
    uint64_t v96 = v47 + 16;
    ((void (*)(unsigned char *, unsigned char *, uint64_t))v106)(v52, v120, v112);
    LODWORD(v29) = v116[v30];
    v40[v99] = (_BYTE)v29;
    v40[v100] = *(unsigned char *)(v30 + TupleTypeMetadata2);
    uint64_t v100 = v47 + 8;
    ((void (*)(unsigned char *, uint64_t))v109)(v52, v53);
    uint64_t v99 = v51;
    v97 = v50;
    v50(v40, v42);
    if (v29 == 1)
    {
      long long v54 = v115;
      int v55 = Rope._Node.fixDeficiency(on:)(v115, v121);
      if ((v101 & v55 & 1) == 0) {
        goto LABEL_11;
      }
    }
    else
    {
      long long v54 = v115;
      if (!v101)
      {
LABEL_11:
        LODWORD(v115) = 0;
LABEL_13:
        uint64_t v78 = (int *)TupleTypeMetadata;
        AssociatedConformanceWitness = &v40[*(int *)(TupleTypeMetadata + 48)];
        uint64_t v79 = (uint64_t)AssociatedConformanceWitness;
        uint64_t v80 = *(int *)(TupleTypeMetadata + 64);
        uint64_t v81 = *(int *)(TupleTypeMetadata + 80);
        v82 = v40;
        v83 = v114;
        uint64_t v84 = v40;
        uint64_t v85 = (void (*)(unsigned char *, unsigned char *, uint64_t))v107;
        v107(v82, (uint64_t)v114, v42);
        uint64_t v86 = v79;
        uint64_t v87 = v112;
        uint64_t v88 = (void (*)(unsigned char *, unsigned char *, uint64_t))v106;
        ((void (*)(uint64_t, unsigned char *, uint64_t))v106)(v86, v120, v112);
        LODWORD(v116) = v116[(void)v83];
        v84[v80] = (_BYTE)v116;
        char v89 = v83[TupleTypeMetadata2];
        v84[v81] = v89;
        (*(void (**)(uint64_t, unsigned char *))(v95 + 32))(v110, v84);
        v90 = v103;
        v91 = &v103[v78[12]];
        TupleTypeMetadata2 = v78[16];
        uint64_t v110 = v78[20];
        v85(v103, v83, v42);
        v88(v91, v120, v87);
        v90[TupleTypeMetadata2] = (_BYTE)v116;
        v90[v110] = v89;
        (*(void (**)(uint64_t, unsigned char *, uint64_t))(v98 + 32))(v111, v91, v87);
        char v68 = Rope._Node.isUndersized.getter();
        (*(void (**)(unsigned char *, int *))(v104 + 8))(v83, v78);
        v97(v90, v42);
        ((void (*)(unsigned char *, uint64_t))v109)(AssociatedConformanceWitness, v87);
        int v70 = (int)v115;
        goto LABEL_14;
      }
    }
    unint64_t v71 = *v54;
    unsigned __int8 v72 = v94;
    uint64_t v73 = v112;
    uint64_t v74 = (uint64_t)AssociatedConformanceWitness;
    uint64_t v75 = _RopePath.subscript.getter(v94, *v54, v112, (uint64_t)AssociatedConformanceWitness);
    if (v75 >= (unsigned __int16)Rope._Node.header.getter() - 1)
    {
      LODWORD(v115) = 1;
      goto LABEL_13;
    }
    uint64_t result = _RopePath.subscript.getter(v72, v71, v73, v74);
    uint64_t v76 = result + 1;
    if (!__OFADD__(result, 1))
    {
      uint64_t v77 = type metadata accessor for _RopePath();
      _RopePath.subscript.setter(v76, v72, v77);
      _RopePath.clear(below:)(v72);
      goto LABEL_11;
    }
LABEL_19:
    __break(1u);
    return result;
  }
  uint64_t v56 = TupleTypeMetadata2;
  uint64_t v57 = v120;
  v114 = &v120[*(int *)(TupleTypeMetadata2 + 48)];
  Rope._Node._removeItem(at:)((uint64_t)v120, (uint64_t)v114, v27, v121);
  uint64_t v58 = v105;
  v115 = (unint64_t *)&v105[*(int *)(v56 + 48)];
  uint64_t v59 = v115;
  uint64_t v60 = *(void *)(v118 - 8);
  uint64_t TupleTypeMetadata = *(void *)(v60 + 16);
  ((void (*)(unsigned char *, unsigned char *, uint64_t))TupleTypeMetadata)(v105, v57, v118);
  uint64_t v61 = *(void *)(AssociatedTypeWitness - 8);
  v62 = *(void (**)(unint64_t *, unsigned char *, uint64_t))(v61 + 16);
  int v63 = v114;
  v62(v59, v114, AssociatedTypeWitness);
  uint64_t v64 = v118;
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v60 + 32))(v110, v58, v118);
  uint64_t v65 = *(int *)(v56 + 48);
  v66 = v116;
  uint64_t v67 = (unint64_t *)&v116[v65];
  ((void (*)(unsigned char *, unsigned char *, uint64_t))TupleTypeMetadata)(v116, v120, v64);
  v62(v67, v63, AssociatedTypeWitness);
  (*(void (**)(uint64_t, unint64_t *, uint64_t))(v61 + 32))(v111, v67, AssociatedTypeWitness);
  char v68 = Rope._Node.isUndersized.getter();
  uint64_t v69 = (unsigned __int16)Rope._Node.header.getter();
  (*(void (**)(unsigned char *, uint64_t))(v106 + 8))(v120, TupleTypeMetadata2);
  int v70 = v109 == v69;
  (*(void (**)(unsigned char *, uint64_t))(v60 + 8))(v66, v118);
  (*(void (**)(unint64_t *, uint64_t))(v61 + 8))(v115, AssociatedTypeWitness);
LABEL_14:
  if (v70) {
    int v92 = 256;
  }
  else {
    int v92 = 0;
  }
  return v92 & 0xFFFFFFFE | v68 & 1;
}

uint64_t sub_24A598A98@<X0>(unsigned __int16 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = type metadata accessor for Rope._Node();
  uint64_t v11 = sub_24A5BBD20();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v18 - v12;
  uint64_t WitnessTable = swift_getWitnessTable();
  v18[0] = Rope._UnsafeHandle.children.getter(a1, a2, a3, v10, a4, WitnessTable);
  v18[1] = v15;
  sub_24A5BB580();
  swift_getWitnessTable();
  sub_24A5BBBA0();
  uint64_t v16 = *(void *)(v10 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v13, 1, v10);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v16 + 32))(a5, v13, v10);
  }
  __break(1u);
  return result;
}

uint64_t sub_24A598C30@<X0>(unsigned __int16 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  type metadata accessor for Rope._Item();
  swift_getAssociatedTypeWitness();
  uint64_t TupleTypeMetadata = (int *)swift_getTupleTypeMetadata();
  uint64_t v12 = a6 + TupleTypeMetadata[12];
  uint64_t v13 = TupleTypeMetadata[16];
  uint64_t v14 = TupleTypeMetadata[20];
  uint64_t v15 = type metadata accessor for Rope._Node();
  uint64_t WitnessTable = swift_getWitnessTable();
  Rope._UnsafeHandle.mutableChildren.getter(a1, a2, a4, v15, a5, WitnessTable);
  uint64_t result = Rope._Node.remove(at:)(a6, v12, a3, v15);
  *(unsigned char *)(a6 + v13) = result & 1;
  *(unsigned char *)(a6 + v14) = (unsigned __int16)result > 0xFFu;
  return result;
}

uint64_t Rope._Node.fixDeficiency(on:)(unint64_t *a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = v5
     + ((*(unsigned __int8 *)(*(void *)(a2 - 8) + 80) + 19) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(a2 - 8) + 80));
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  swift_getWitnessTable();
  uint64_t v9 = nullsub_1(v5 + 16, v6, v7, a2, v8);
  uint64_t v11 = v10;
  swift_unknownObjectRetain();
  sub_24A59AE8C(v9, v11, a1, v7, v8, (char *)&v13);
  swift_unknownObjectRelease();
  return v13;
}

uint64_t Rope.remove<A>(at:in:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5, void (*a6)(char *, char *, uint64_t))
{
  v114 = a6;
  uint64_t v113 = a5;
  uint64_t v7 = a4;
  uint64_t v118 = a2;
  uint64_t v119 = a3;
  uint64_t v109 = a1;
  uint64_t v9 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(a4 + 24);
  uint64_t v10 = type metadata accessor for Rope._Node();
  uint64_t v110 = v10;
  uint64_t v123 = sub_24A5BBD20();
  uint64_t v116 = *(void *)(v123 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v123);
  uint64_t v88 = (unsigned __int16 *)((char *)&v88 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  int v92 = (char *)&v88 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  unsigned int v94 = (char *)&v88 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v108 = (char *)&v88 - v18;
  v115 = *(char **)(v10 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  char v89 = (char **)((char *)&v88 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v90 = (uint64_t)&v88 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v91 = (char *)&v88 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  v93 = (unsigned __int16 *)((char *)&v88 - v26);
  MEMORY[0x270FA5388](v25);
  v107 = (unsigned __int16 *)((char *)&v88 - v27);
  strcpy(v125, "removed delta needsFixing pathIsAtEnd ");
  v126[0] = type metadata accessor for Rope._Item();
  v126[1] = swift_getAssociatedTypeWitness();
  v126[2] = MEMORY[0x263F8D4F8];
  v126[3] = MEMORY[0x263F8D4F8];
  uint64_t TupleTypeMetadata = (int *)swift_getTupleTypeMetadata();
  uint64_t v100 = *((void *)TupleTypeMetadata - 1);
  uint64_t v29 = MEMORY[0x270FA5388](TupleTypeMetadata);
  uint64_t v106 = (char *)&v88 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v33 = (char *)&v88 - v32;
  uint64_t v34 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v36 = (char *)&v88 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  Rope._invalidateIndices()();
  uint64_t v37 = *(void (**)(char *, unsigned __int16 *, uint64_t))(v34 + 16);
  uint64_t v38 = v6;
  uint64_t v96 = v34 + 16;
  uint64_t v95 = v37;
  v37(v36, v6, v7);
  uint64_t v39 = (unsigned __int16 *)Rope._height.getter();
  uint64_t v40 = *(void (**)(char *, uint64_t))(v34 + 8);
  uint64_t v98 = v36;
  uint64_t v41 = v36;
  uint64_t v42 = v115;
  uint64_t v99 = v34 + 8;
  v97 = v40;
  v40(v41, v7);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v117 = v8;
  uint64_t v122 = v9;
  uint64_t v44 = v38;
  uint64_t v45 = v110;
  swift_getAssociatedConformanceWitness();
  uint64_t v121 = AssociatedTypeWitness;
  v126[0] = _RopePath.init(height:)((uint64_t)v39);
  uint64_t v46 = (unsigned int (*)(unsigned __int16 *, uint64_t, uint64_t))*((void *)v42 + 6);
  if (v46(v44, 1, v45) == 1)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v105 = v7;
  uint64_t v47 = (uint64_t)&v33[TupleTypeMetadata[12]];
  uint64_t v48 = TupleTypeMetadata[16];
  uint64_t v104 = TupleTypeMetadata;
  uint64_t v49 = TupleTypeMetadata[20];
  uint64_t v120 = v47;
  uint64_t v39 = v44;
  int v50 = Rope._Node.remove<A>(at:in:initializing:)((uint64_t)v33, v47, v118, v119, v126, v45, v113, (uint64_t)v114);
  int v103 = v50;
  LODWORD(v118) = v50 & 1;
  v33[v48] = v50 & 1;
  LODWORD(v119) = (unsigned __int16)v50 > 0xFFu;
  v33[v49] = v119;
  uint64_t v7 = (uint64_t)v108;
  v102 = *(void (**)(char *, unsigned __int16 *, uint64_t))(v116 + 16);
  v102(v108, v44, v123);
  uint64_t v111 = (unsigned int (*)(char *, uint64_t, uint64_t))v46;
  if (v46((unsigned __int16 *)v7, 1, v45) == 1)
  {
LABEL_18:
    (*(void (**)(uint64_t, uint64_t))(v116 + 8))(v7, v123);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v39 = v107;
  int v101 = (void (*)(unsigned __int16 *, uint64_t, uint64_t))*((void *)v42 + 4);
  v101(v107, v7, v45);
  BOOL v51 = Rope._Node.isEmpty.getter();
  uint64_t v108 = (char *)*((void *)v42 + 1);
  ((void (*)(unsigned __int16 *, uint64_t))v108)(v39, v45);
  uint64_t v112 = v44;
  uint64_t v124 = v33;
  if (!v51)
  {
    uint64_t v42 = v94;
    v102(v94, v44, v123);
    if (v111(v42, 1, v45) == 1) {
      goto LABEL_19;
    }
    uint64_t v39 = v93;
    v101(v93, (uint64_t)v42, v45);
    int v52 = (unsigned __int16)Rope._Node.header.getter();
    ((void (*)(unsigned __int16 *, uint64_t))v108)(v39, v45);
    uint64_t v53 = v111;
    if (v52 != 1) {
      goto LABEL_12;
    }
    uint64_t v42 = v92;
    v102(v92, v44, v123);
    if (v53(v42, 1, v45) == 1)
    {
LABEL_19:
      (*(void (**)(char *, uint64_t))(v116 + 8))(v42, v123);
      goto LABEL_20;
    }
    long long v54 = v91;
    v101((unsigned __int16 *)v91, (uint64_t)v42, v45);
    int v55 = Rope._Node.header.getter();
    ((void (*)(char *, uint64_t))v108)(v54, v45);
    if ((v55 & 0xFF0000) == 0) {
      goto LABEL_12;
    }
    uint64_t v39 = v88;
    uint64_t v42 = (char *)v123;
    v102((char *)v88, v44, v123);
    if (v53((char *)v39, 1, v45) == 1)
    {
LABEL_21:
      uint64_t result = (*(uint64_t (**)(unsigned __int16 *, char *))(v116 + 8))(v39, v42);
      __break(1u);
      return result;
    }
    uint64_t v56 = v89;
    v101((unsigned __int16 *)v89, (uint64_t)v39, v45);
    uint64_t v42 = *v56;
    uint64_t v57 = (uint64_t)(*v56 + 16);
    uint64_t v58 = v115;
    unint64_t v59 = (unint64_t)&(*v56)[(v115[80] + 19) & ~(unint64_t)v115[80]];
    swift_getWitnessTable();
    uint64_t v60 = v122;
    uint64_t v39 = (unsigned __int16 *)nullsub_1(v57, v59, v122, v45, v117);
    uint64_t v62 = v61;
    swift_unknownObjectRetain();
    uint64_t v7 = v90;
    sub_24A59A978(v39, v62, v60, v90);
    swift_unknownObjectRelease();
    ((void (*)(char **, uint64_t))v108)(v56, v45);
    int v63 = v112;
    if (v111((char *)v112, 1, v45) != 1)
    {
      (*((void (**)(unsigned __int16 *, uint64_t, uint64_t))v58 + 5))(v63, v7, v45);
      goto LABEL_12;
    }
    goto LABEL_17;
  }
  (*(void (**)(unsigned __int16 *, uint64_t))(v116 + 8))(v44, v123);
  (*((void (**)(unsigned __int16 *, uint64_t, uint64_t, uint64_t))v42 + 7))(v44, 1, 1, v45);
LABEL_12:
  LODWORD(v123) = (unsigned __int16)v103;
  uint64_t v64 = v104;
  uint64_t v65 = v106;
  v66 = &v106[v104[12]];
  uint64_t v67 = v104[16];
  uint64_t v116 = v104[20];
  uint64_t v68 = type metadata accessor for Rope._Item();
  uint64_t v69 = *(void *)(v68 - 8);
  v114 = *(void (**)(char *, char *, uint64_t))(v69 + 16);
  v114(v65, v124, v68);
  uint64_t v70 = v121;
  uint64_t v71 = *(void *)(v121 - 8);
  uint64_t v113 = *(char **)(v71 + 16);
  ((void (*)(char *, uint64_t, uint64_t))v113)(v66, v120, v121);
  v65[v67] = v118;
  v65[v116] = v119;
  uint64_t v116 = *(void *)(v71 + 8);
  ((void (*)(char *, uint64_t))v116)(v66, v70);
  v115 = *(char **)(v69 + 8);
  ((void (*)(char *, uint64_t))v115)(v65, v68);
  if (v123 < 0x100)
  {
    uint64_t v80 = v122;
    uint64_t v123 = Rope.Index.init(version:path:leaf:)(*(void *)((char *)v112 + *(int *)(v105 + 36)), v126[0], 0, v122, v117);
    uint64_t v117 = v81;
    v114 = v82;
    v83 = &v65[v64[12]];
    uint64_t v113 = (char *)v64[16];
    uint64_t v84 = v64[20];
    (*(void (**)(char *, char *, uint64_t))(v69 + 32))(v65, v124, v68);
    uint64_t v77 = v121;
    (*(void (**)(char *, uint64_t, uint64_t))(v71 + 32))(v83, v120, v121);
    v113[(void)v65] = v118;
    v65[v84] = v119;
    uint64_t v85 = *(void (**)(uint64_t, char *, uint64_t))(*(void *)(v80 - 8) + 16);
    uint64_t v86 = v80;
    uint64_t v75 = v83;
    v85(v109, v65, v86);
    ((void (*)(char *, uint64_t))v115)(v65, v68);
  }
  else
  {
    unsigned __int8 v72 = &v65[v64[12]];
    uint64_t v73 = v64[16];
    uint64_t v74 = v64[20];
    v114(v65, v124, v68);
    uint64_t v75 = v72;
    uint64_t v76 = v72;
    uint64_t v77 = v121;
    ((void (*)(char *, uint64_t, uint64_t))v113)(v76, v120, v121);
    v65[v73] = v118;
    v65[v74] = v119;
    (*(void (**)(uint64_t, char *))(*(void *)(v122 - 8) + 16))(v109, v65);
    ((void (*)(char *, uint64_t))v115)(v65, v68);
    uint64_t v78 = v98;
    uint64_t v79 = v105;
    v95(v98, v112, v105);
    uint64_t v123 = Rope.endIndex.getter(v79);
    v97(v78, v79);
    (*(void (**)(char *, int *))(v100 + 8))(v124, v64);
  }
  ((void (*)(char *, uint64_t))v116)(v75, v77);
  return v123;
}

uint64_t Rope._Node.remove<A>(at:in:initializing:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5, uint64_t a6, char *a7, uint64_t a8)
{
  v133 = (int *)a8;
  v134 = a7;
  v139 = a5;
  uint64_t v132 = a4;
  uint64_t v131 = a3;
  uint64_t v129 = a2;
  uint64_t v128 = a1;
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(a6 + 16);
  uint64_t v10 = *(void (**)(char *, uint64_t))(a6 + 24);
  uint64_t v12 = type metadata accessor for Rope._Item();
  v135 = v11;
  v136 = v10;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v137 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  v140 = (char *)&v118 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v118 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (void (**)(char *, int *))((char *)&v118 - v21);
  uint64_t v130 = *(void *)(a6 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (uint64_t *)((char *)&v118 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  strcpy(v145, "removed delta needsFixing pathIsAtEnd ");
  uint64_t v143 = v12;
  uint64_t v146 = v12;
  uint64_t v147 = AssociatedTypeWitness;
  uint64_t v148 = MEMORY[0x263F8D4F8];
  uint64_t v149 = MEMORY[0x263F8D4F8];
  uint64_t TupleTypeMetadata = (int *)swift_getTupleTypeMetadata();
  v127 = (void (**)(char *, int *))*((void *)TupleTypeMetadata - 1);
  uint64_t v26 = MEMORY[0x270FA5388](TupleTypeMetadata);
  uint64_t v126 = (char *)&v118 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v118 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)&v118 - v31;
  Rope._Node.ensureUnique()();
  uint64_t v142 = a6;
  uint64_t v33 = v8;
  unsigned int v34 = Rope._Node.header.getter();
  v141 = v8;
  if (BYTE2(v34))
  {
    LODWORD(v125) = HIWORD(v34);
    v140 = &v32[TupleTypeMetadata[12]];
    uint64_t v35 = TupleTypeMetadata[20];
    uint64_t v137 = TupleTypeMetadata[16];
    uint64_t v138 = v35;
    uint64_t v36 = *v8;
    uint64_t v37 = *v33 + 16;
    unint64_t v38 = (*(unsigned __int8 *)(v130 + 80) + 19) & ~(unint64_t)*(unsigned __int8 *)(v130 + 80);
    uint64_t v144 = AssociatedTypeWitness;
    uint64_t v39 = v36 + v38;
    uint64_t v40 = v142;
    swift_getWitnessTable();
    uint64_t v41 = (uint64_t)v135;
    uint64_t v42 = (unsigned __int16 *)nullsub_1(v37, v39, v135, v40, v136);
    uint64_t v44 = v43;
    swift_unknownObjectRetain();
    sub_24A59AC04(v42, v44, v131, v132, (uint64_t)v139, v125, v41, (uint64_t)v134, (uint64_t)v32, (uint64_t)v133);
    swift_unknownObjectRelease();
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    uint64_t v46 = *(void (**)(char *, uint64_t))(AssociatedConformanceWitness + 56);
    uint64_t v47 = v140;
    uint64_t v118 = AssociatedConformanceWitness;
    v46(v140, v144);
    uint64_t v48 = &v30[TupleTypeMetadata[12]];
    uint64_t v49 = (void (*)(char *, uint64_t))TupleTypeMetadata[16];
    uint64_t v50 = TupleTypeMetadata[20];
    uint64_t v51 = *(void *)(v143 - 8);
    uint64_t v52 = v51 + 16;
    v135 = *(void (**)(char *, char *, uint64_t))(v51 + 16);
    v136 = v49;
    v135(v30, v32, v143);
    uint64_t v53 = *(void *)(v144 - 8);
    v134 = *(char **)(v53 + 16);
    ((void (*)(char *, char *, uint64_t))v134)(v48, v47, v144);
    *((unsigned char *)v136 + (void)v30) = v32[v137];
    LODWORD(v132) = v32[v138];
    v30[v50] = v132;
    long long v54 = TupleTypeMetadata;
    uint64_t v124 = v53;
    uint64_t v55 = v53 + 8;
    v136 = *(void (**)(char *, uint64_t))(v53 + 8);
    v136(v48, v144);
    uint64_t v120 = v51;
    uint64_t v57 = v51 + 8;
    uint64_t v56 = *(void (**)(char *, uint64_t))(v51 + 8);
    v56(v30, v143);
    uint64_t v58 = &v30[v54[12]];
    uint64_t v130 = v54[16];
    v133 = v54;
    uint64_t v131 = v54[20];
    uint64_t v122 = v52;
    v135(v30, v32, v143);
    uint64_t v121 = v53 + 16;
    ((void (*)(char *, char *, uint64_t))v134)(v58, v140, v144);
    LODWORD(v54) = v32[v137];
    v30[v130] = (char)v54;
    uint64_t v119 = v32;
    v30[v131] = v32[v138];
    uint64_t v59 = v143;
    uint64_t v60 = v144;
    uint64_t v131 = v55;
    ((void (*)(char *))v136)(v58);
    uint64_t v61 = v59;
    uint64_t v130 = v57;
    uint64_t v123 = v56;
    v56(v30, v59);
    if (v54 == 1)
    {
      uint64_t v62 = v139;
      int v63 = Rope._Node.fixDeficiency(on:)(v139, v142);
      uint64_t v64 = v133;
      if ((v132 & v63 & 1) == 0) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v62 = v139;
      uint64_t v64 = v133;
      if (!v132)
      {
LABEL_11:
        LODWORD(v139) = 0;
LABEL_13:
        v133 = (int *)&v30[v64[12]];
        uint64_t v107 = (uint64_t)v133;
        uint64_t v108 = v64[16];
        uint64_t v109 = v64[20];
        uint64_t v110 = v119;
        uint64_t v111 = v135;
        v135(v30, v119, v61);
        uint64_t v112 = v60;
        uint64_t v113 = v134;
        ((void (*)(uint64_t, char *, uint64_t))v134)(v107, v140, v112);
        LODWORD(v137) = v110[v137];
        v30[v108] = v137;
        LOBYTE(v108) = v110[v138];
        v30[v109] = v108;
        (*(void (**)(uint64_t, char *, uint64_t))(v120 + 32))(v128, v30, v61);
        v114 = v126;
        v115 = &v126[v64[12]];
        uint64_t v138 = v64[16];
        uint64_t v132 = v64[20];
        v111(v126, v110, v61);
        uint64_t v116 = v144;
        ((void (*)(char *, char *, uint64_t))v113)(v115, v140, v144);
        v114[v138] = v137;
        v114[v132] = v108;
        (*(void (**)(uint64_t, char *, uint64_t))(v124 + 32))(v129, v115, v116);
        char v97 = Rope._Node.isUndersized.getter();
        v127[1](v110, v64);
        v123(v114, v61);
        v136((char *)v133, v116);
        int v99 = (int)v139;
        goto LABEL_14;
      }
    }
    unint64_t v100 = *v62;
    unsigned __int8 v101 = v125;
    uint64_t v102 = v60;
    uint64_t v103 = v118;
    uint64_t v104 = _RopePath.subscript.getter(v125, *v62, v60, v118);
    if (v104 >= (unsigned __int16)Rope._Node.header.getter() - 1)
    {
      LODWORD(v139) = 1;
      uint64_t v60 = v102;
      goto LABEL_13;
    }
    uint64_t result = _RopePath.subscript.getter(v101, v100, v102, v103);
    uint64_t v105 = result + 1;
    if (!__OFADD__(result, 1))
    {
      uint64_t v60 = v102;
      uint64_t v106 = type metadata accessor for _RopePath();
      _RopePath.subscript.setter(v105, v101, v106);
      _RopePath.clear(below:)(v101);
      goto LABEL_11;
    }
LABEL_19:
    __break(1u);
    return result;
  }
  uint64_t v126 = v19;
  uint64_t v65 = TupleTypeMetadata2;
  uint64_t v66 = AssociatedTypeWitness;
  v127 = v22;
  uint64_t v138 = v65;
  uint64_t v67 = v130;
  uint64_t v68 = v142;
  (*(void (**)(uint64_t *, void *, uint64_t))(v130 + 16))(v24, v8, v142);
  uint64_t v69 = *v24;
  uint64_t v70 = *v24 + 16;
  uint64_t v71 = v143;
  uint64_t v125 = *(void *)(v143 - 8);
  uint64_t v72 = v69 + ((*(unsigned __int8 *)(v125 + 80) + 19) & ~(unint64_t)*(unsigned __int8 *)(v125 + 80));
  swift_getWitnessTable();
  uint64_t v73 = (uint64_t)v135;
  uint64_t v74 = (unsigned __int16 *)nullsub_1(v70, v72, v135, v71, v136);
  uint64_t v76 = v75;
  swift_unknownObjectRetain();
  uint64_t v77 = sub_24A59AB34(v74, v76, v131, v132, v73, (uint64_t)v134, (uint64_t)v133);
  uint64_t v79 = v78;
  swift_unknownObjectRelease();
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(v67 + 8))(v24, v68);
  if (v79)
  {
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v81 = v68;
  uint64_t v82 = v66;
  swift_getAssociatedConformanceWitness();
  uint64_t v83 = type metadata accessor for _RopePath();
  _RopePath.subscript.setter(v77, 0, v83);
  uint64_t v84 = v138;
  uint64_t v85 = (uint64_t)v127;
  v134 = (char *)v127 + *(int *)(v138 + 48);
  Rope._Node._removeItem(at:)((uint64_t)v127, (uint64_t)v134, v77, v81);
  uint64_t v86 = v126;
  uint64_t v87 = (unint64_t *)&v126[*(int *)(v84 + 48)];
  v139 = v87;
  uint64_t v88 = v125;
  v135 = *(void (**)(char *, char *, uint64_t))(v125 + 16);
  v135(v126, (char *)v85, v71);
  uint64_t v89 = *(void *)(v66 - 8);
  uint64_t v90 = v71;
  uint64_t v91 = v89;
  v136 = (void (*)(char *, uint64_t))v77;
  int v92 = *(void (**)(unint64_t *, char *, uint64_t))(v89 + 16);
  v93 = v87;
  unsigned int v94 = v134;
  v92(v93, v134, v82);
  (*(void (**)(uint64_t, char *, uint64_t))(v88 + 32))(v128, v86, v90);
  uint64_t v95 = &v140[*(int *)(v138 + 48)];
  ((void (*)(void))v135)();
  v92((unint64_t *)v95, v94, v82);
  uint64_t v96 = v82;
  (*(void (**)(uint64_t, char *, uint64_t))(v91 + 32))(v129, v95, v82);
  char v97 = Rope._Node.isUndersized.getter();
  unint64_t v98 = (unsigned __int16)Rope._Node.header.getter();
  (*(void (**)(uint64_t, uint64_t))(v137 + 8))(v85, v138);
  int v99 = v136 == (void (*)(char *, uint64_t))v98;
  (*(void (**)(char *, uint64_t))(v88 + 8))(v140, v90);
  (*(void (**)(unint64_t *, uint64_t))(v91 + 8))(v139, v96);
LABEL_14:
  if (v99) {
    int v117 = 256;
  }
  else {
    int v117 = 0;
  }
  return v117 & 0xFFFFFFFE | v97 & 1;
}

uint64_t sub_24A59A978@<X0>(unsigned __int16 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v9 = type metadata accessor for Rope._Node();
  uint64_t v10 = sub_24A5BBD20();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v17 - v11;
  uint64_t WitnessTable = swift_getWitnessTable();
  v17[0] = Rope._UnsafeHandle.children.getter(a1, a2, a3, v9, AssociatedConformanceWitness, WitnessTable);
  v17[1] = v14;
  sub_24A5BB580();
  swift_getWitnessTable();
  sub_24A5BBBA0();
  uint64_t v15 = *(void *)(v9 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v9);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(a4, v12, v9);
  }
  __break(1u);
  return result;
}

uint64_t sub_24A59AB34(unsigned __int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  swift_getAssociatedConformanceWitness();
  uint64_t v14 = type metadata accessor for Rope._Item();
  uint64_t WitnessTable = swift_getWitnessTable();
  return Rope._UnsafeHandle.findSlot<A>(at:in:preferEnd:)(a3, a4, 0, a1, a2, a5, v14, a6, WitnessTable, a7);
}

uint64_t sub_24A59AC04@<X0>(unsigned __int16 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unsigned __int8 a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v17 = type metadata accessor for Rope._Node();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v18 = a2;
  uint64_t v19 = a8;
  uint64_t v20 = Rope._UnsafeHandle.findSlot<A>(at:in:preferEnd:)(a3, a4, 0, a1, v18, a7, v17, a8, WitnessTable, a10);
  uint64_t v32 = v21;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v22 = type metadata accessor for _RopePath();
  _RopePath.subscript.setter(v20, a6, v22);
  type metadata accessor for Rope._Item();
  uint64_t TupleTypeMetadata = (int *)swift_getTupleTypeMetadata();
  uint64_t v24 = a9 + TupleTypeMetadata[12];
  uint64_t v25 = TupleTypeMetadata[16];
  uint64_t v26 = TupleTypeMetadata[20];
  Rope._UnsafeHandle.mutableChildren.getter(a1, a2, a7, v17, AssociatedConformanceWitness, WitnessTable);
  uint64_t result = Rope._Node.remove<A>(at:in:initializing:)(a9, v24, v32, a4, a5, v17, v19, a10);
  *(unsigned char *)(a9 + v25) = result & 1;
  *(unsigned char *)(a9 + v26) = (unsigned __int16)result > 0xFFu;
  return result;
}

void sub_24A59AE8C(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  uint64_t v84 = a6;
  uint64_t v11 = type metadata accessor for Rope._Node();
  uint64_t v83 = *(void **)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v64 - v12;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v78 = a2;
  uint64_t v76 = WitnessTable;
  uint64_t v82 = Rope._UnsafeHandle.mutableChildren.getter((unsigned __int16 *)a1, a2, a4, v11, a5, WitnessTable);
  uint64_t v16 = v15;
  uint64_t v77 = (_WORD *)a1;
  int v17 = *(unsigned __int8 *)(a1 + 2);
  unint64_t v18 = *a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  int v79 = v17;
  uint64_t v80 = AssociatedConformanceWitness;
  uint64_t v81 = AssociatedTypeWitness;
  uint64_t v21 = _RopePath.subscript.getter(v17, v18, AssociatedTypeWitness, AssociatedConformanceWitness);
  if (v16 < 2) {
    goto LABEL_21;
  }
  unint64_t v22 = v21;
  uint64_t v23 = v21 - 1;
  if (__OFSUB__(v21, 1))
  {
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v74 = v21 - 1;
  uint64_t v75 = a4;
  uint64_t v72 = a3;
  uint64_t v73 = a5;
  if (v23 < 0)
  {
    uint64_t v32 = 0;
LABEL_7:
    uint64_t v35 = v22 + 1;
    if (!__OFADD__(v22, 1))
    {
      if (v35 >= v16)
      {
        uint64_t v44 = v83[9];
        if ((v23 & 0x8000000000000000) == 0)
        {
          unint64_t v71 = v32;
          unint64_t v38 = (void (*)(char *, unint64_t, uint64_t))v83[2];
          unint64_t v40 = v44 * v22;
          uint64_t v43 = v44;
LABEL_14:
          uint64_t v45 = v82;
          unint64_t v46 = v82 + v40;
          v38(v13, v82 + v40, v11);
          LODWORD(v78) = Rope._Node.header.getter();
          uint64_t v47 = (void (*)(char *, uint64_t))v83[1];
          v47(v13, v11);
          static Rope._Node.redistributeChildren(_:_:to:)((uint64_t *)(v45 + v43 * v74), (uint64_t *)(v45 + v40), v71 >> 1);
          unsigned __int8 v48 = v79 - 1;
          if (((v79 - 1) & 0xFFFFFF00) == 0)
          {
            v38(v13, v46, v11);
            unsigned __int16 v49 = Rope._Node.header.getter();
            v47(v13, v11);
            unint64_t v50 = v49 - (unint64_t)(unsigned __int16)v78;
            uint64_t v51 = _RopePath.subscript.getter(v48, *v72, v81, v80);
            BOOL v52 = __OFADD__(v51, v50);
            uint64_t v53 = v51 + v50;
            if (!v52)
            {
              uint64_t v54 = type metadata accessor for _RopePath();
              uint64_t v55 = v53;
              unsigned __int8 v56 = v48;
LABEL_20:
              _RopePath.subscript.setter(v55, v56, v54);
LABEL_21:
              char v62 = 1;
LABEL_22:
              *uint64_t v84 = v62;
              return;
            }
            goto LABEL_30;
          }
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
          goto LABEL_31;
        }
        uint64_t v42 = 0;
        unint64_t v40 = v44 * v22;
        uint64_t v63 = v44 * v35;
      }
      else
      {
        unint64_t v71 = v32;
        uint64_t v36 = v83;
        uint64_t v37 = v83[9];
        uint64_t v64 = v37 * v35;
        unint64_t v38 = (void (*)(char *, unint64_t, uint64_t))v83[2];
        uint64_t v68 = (uint64_t *)(v82 + v37 * v35);
        unint64_t v69 = v22 + 1;
        ((void (*)(char *))v38)(v13);
        LODWORD(v70) = Rope._Node.header.getter();
        uint64_t v39 = (void (*)(char *, uint64_t))v36[1];
        v39(v13, v11);
        uint64_t v65 = v37;
        unint64_t v40 = v37 * v22;
        uint64_t v66 = (uint64_t *)(v82 + v40);
        ((void (*)(char *))v38)(v13);
        int v41 = (unsigned __int16)Rope._Node.header.getter();
        uint64_t v67 = v39;
        v39(v13, v11);
        uint64_t v42 = v41 + (unsigned __int16)v70;
        if ((*(uint64_t (**)(void))(v80 + 16))() >= v42)
        {
          static Rope._Node.redistributeChildren(_:_:to:)(v66, v68, v42);
          Rope._UnsafeHandle._removeChild(at:)(v69, v77);
          v67(v13, v11);
          char v62 = 0;
          goto LABEL_22;
        }
        if ((v74 & 0x8000000000000000) == 0)
        {
          uint64_t v43 = v65;
          goto LABEL_14;
        }
        uint64_t v63 = v64;
      }
      static Rope._Node.redistributeChildren(_:_:to:)((uint64_t *)(v82 + v40), (uint64_t *)(v82 + v63), (unint64_t)v42 >> 1);
      char v62 = 0;
      goto LABEL_22;
    }
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v24 = v82;
  uint64_t v25 = v83;
  uint64_t v26 = v83[9];
  uint64_t v27 = (void (*)(char *))v83[2];
  uint64_t v68 = (uint64_t *)(v82 + v26 * v23);
  unint64_t v69 = v16;
  v27(v13);
  unint64_t v28 = v22;
  unint64_t v29 = (unsigned __int16)Rope._Node.header.getter();
  uint64_t v30 = (void (*)(char *, uint64_t))v25[1];
  v30(v13, v11);
  unint64_t v71 = v28;
  uint64_t v31 = (uint64_t *)(v24 + v26 * v28);
  ((void (*)(char *, uint64_t *, uint64_t))v27)(v13, v31, v11);
  LOWORD(v28) = Rope._Node.header.getter();
  uint64_t v70 = v30;
  v30(v13, v11);
  uint64_t v67 = (void (*)(char *, uint64_t))v29;
  uint64_t v32 = v29 + (unsigned __int16)v28;
  uint64_t v33 = v80;
  uint64_t v34 = v81;
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v80 + 16))(v81, v80) < v32)
  {
    uint64_t v23 = v74;
    unint64_t v22 = v71;
    uint64_t v16 = v69;
    goto LABEL_7;
  }
  static Rope._Node.redistributeChildren(_:_:to:)(v68, v31, v32);
  Rope._UnsafeHandle._removeChild(at:)(v71, v77);
  v70(v13, v11);
  uint64_t v57 = type metadata accessor for _RopePath();
  int v58 = v79;
  uint64_t v59 = v72;
  _RopePath.subscript.setter(v74, v79, v57);
  int v60 = v58 - 1;
  if ((v60 & 0xFFFFFF00) != 0)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v61 = _RopePath.subscript.getter(v60, *v59, v34, v33);
  BOOL v52 = __OFADD__(v61, v67);
  uint64_t v55 = (uint64_t)v67 + v61;
  if (!v52)
  {
    unsigned __int8 v56 = v60;
    uint64_t v54 = v57;
    goto LABEL_20;
  }
LABEL_32:
  __break(1u);
}

uint64_t _HashNode.isSubset<A>(_:of:)(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t result = 1;
  if (a5 >= 1 && a4 != a2)
  {
    if (a3 < a5) {
      return 0;
    }
    BOOL v18 = _HashNode.isCollisionNode.getter(a4, a5, a6, a7, a9);
    uint64_t v29 = a8;
    BOOL v19 = _HashNode.isCollisionNode.getter(a2, a3, a6, a8, a9);
    if (v18)
    {
      unint64_t v20 = _HashNode.collisionHash.getter(a4, a5, a6, a7, a9);
      if (!v19)
      {
        uint64_t v25 = nullsub_1(a2 + 16, a2 + 32, a6, v29, a9);
        sub_24A59BC0C(v25, v26, (v20 >> a1) & 0x1F, a4, a5, a1, a6, a7, &v31, v27, v29, a9);
        return v31;
      }
      if (v20 == _HashNode.collisionHash.getter(a2, a3, a6, v29, a9))
      {
        nullsub_1(a4 + 16, a4 + 32, a6, a7, a9);
        nullsub_1(a2 + 16, a2 + 32, a6, v29, a9);
        sub_24A59B704((char *)&v30);
        return v30;
      }
      return 0;
    }
    uint64_t v21 = a4 + 16;
    uint64_t v22 = a4 + 32;
    if (v19)
    {
      uint64_t v23 = nullsub_1(v21, v22, a6, a7, a9);
      sub_24A59BD0C(v23, v24, a1, a2, a6, a7, v29, &v32, a9);
      return v32;
    }
    else
    {
      nullsub_1(v21, v22, a6, a7, a9);
      sub_24A59BF98(v28, a2, a6, a7, v29, (char *)&v33, a9);
      return v33;
    }
  }
  return result;
}

uint64_t sub_24A59B704@<X0>(char *a1@<X8>)
{
  _HashNode.UnsafeHandle.reverseItems.getter();
  _HashNode.UnsafeHandle.reverseItems.getter();
  uint64_t v1 = _HashNode.UnsafeHandle.reverseItems.getter();
  uint64_t v3 = v2;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t result = MEMORY[0x24C5C7090](v1, v3, TupleTypeMetadata2);
  if (result == v6)
  {
LABEL_6:
    char v9 = 1;
LABEL_8:
    *a1 = v9;
  }
  else
  {
    uint64_t v7 = result;
    uint64_t v8 = v6;
    if (v6 >= result)
    {
      while (v7 < v8)
      {
        uint64_t result = sub_24A59B87C();
        if ((result & 1) == 0)
        {
          char v9 = 0;
          goto LABEL_8;
        }
        if (v8 == ++v7) {
          goto LABEL_6;
        }
      }
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_24A59B87C()
{
  return sub_24A5BB900() & 1;
}

uint64_t sub_24A59B940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v38 = a1;
  uint64_t v39 = a8;
  uint64_t v35 = a6;
  uint64_t v11 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v37 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v36 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  BOOL v19 = (char *)&v32 - v18;
  uint64_t v21 = v20;
  uint64_t v22 = *(int *)(v17 + 48);
  uint64_t v23 = (char *)&v32 + v22 - v18;
  unsigned __int8 v33 = v23;
  uint64_t v24 = a2 + *(void *)(v21 + 72) * a4 + v22;
  uint64_t v25 = v11;
  uint64_t v34 = *(void (**)(char *))(v11 + 16);
  v34((char *)&v32 - v18);
  uint64_t v26 = *(void *)(v35 - 8);
  int8x8_t v27 = v23;
  uint64_t v28 = v35;
  (*(void (**)(char *, uint64_t))(v26 + 16))(v27, v24);
  uint64_t v29 = &v16[*(int *)(TupleTypeMetadata2 + 48)];
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v16, v19, a5);
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v29, v33, v28);
  unsigned __int8 v30 = v37;
  ((void (*)(char *, char *, uint64_t))v34)(v37, v16, a5);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v16, TupleTypeMetadata2);
  LOBYTE(v29) = sub_24A5BB530();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v30, a5);
  return v29 & 1;
}

uint64_t sub_24A59BC0C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, unsigned char *a9@<X8>, int8x8_t a10@<D0>, uint64_t a11, uint64_t a12)
{
  int v13 = *(_DWORD *)(result + 4);
  if ((v13 & (1 << a3)) != 0)
  {
    a10.i32[0] = v13 & ((1 << a3) - 1);
    uint8x8_t v15 = (uint8x8_t)vcnt_s8(a10);
    v15.i16[0] = vaddlv_u8(v15);
    uint64_t v16 = (a6 + 5);
    uint64_t v20 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v15.u32[0], result, a2, a7, a11, a12);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    swift_retain();
    LOBYTE(a8) = _HashNode.isSubset<A>(_:of:)(v16, v21, v22, a4, a5, a7, a8, a11, a12);
    uint64_t result = swift_release();
    char v23 = a8 & 1;
  }
  else
  {
    char v23 = 0;
  }
  *a9 = v23;
  return result;
}

uint64_t sub_24A59BD0C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, BOOL *a8@<X8>, uint64_t a9)
{
  if (a3 || (uint64_t v15 = result, result = _HashNode.UnsafeHandle.hasSingletonItem.getter((int *)result), (result & 1) == 0))
  {
    *a8 = 0;
  }
  else
  {
    uint64_t v16 = nullsub_1(a4 + 16, a4 + 32, a5, a7, a9);
    return sub_24A59BDDC(v16, v17, v15, a2, 0, a5, a6, a7, a8, a9);
  }
  return result;
}

uint64_t sub_24A59BDDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unsigned int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, BOOL *a9@<X8>, uint64_t a10)
{
  uint64_t v30 = a2;
  uint64_t v31 = a8;
  uint64_t v26 = a4;
  uint64_t v27 = a7;
  unsigned int v29 = a5;
  uint64_t v28 = a1;
  uint64_t v32 = a9;
  uint64_t v12 = *(void *)(a6 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(0, v15, v16, v17, v18, a10);
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v20(v14, v19, a6);
  uint64_t v21 = sub_24A5B85E4();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v12 + 8);
  v22(v14, a6);
  uint64_t v23 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(0, a3, v26, a6, v27, a10);
  v20(v14, v23, a6);
  LOBYTE(v20) = _HashNode.UnsafeHandle.find(_:_:_:)(v29, (uint64_t)v14, v21, v28, v30, a6, v31, a10);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v22)(v14, a6);
  *uint64_t v32 = v20 != 2;
  return result;
}

uint64_t sub_24A59BF98@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X5>, uint64_t a4@<X6>, uint64_t a5@<X7>, char *a6@<X8>, uint64_t a7)
{
  uint64_t v11 = (_DWORD *)nullsub_1(a2 + 16, a2 + 32, a3, a5, a7);
  return sub_24A59C040(v11, a1, a3, a4, a6, a7);
}

uint64_t sub_24A59C040@<X0>(_DWORD *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X5>, uint64_t a4@<X6>, char *a5@<X8>, uint64_t a6)
{
  uint64_t v68 = a5;
  uint64_t v75 = a2;
  uint64_t v8 = a1;
  uint64_t v9 = MEMORY[0x270FA5388](a1);
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v18 = (char *)&v60 - v17;
  uint64_t v76 = v19;
  unsigned int v20 = v19[1];
  int v21 = *(_DWORD *)(result + 4);
  if ((v20 & ~v21) == 0)
  {
    unsigned int v22 = *v76;
    if ((*v76 & ~(*v8 | v21)) == 0)
    {
      uint64_t v73 = v13;
      uint64_t v74 = a4;
      uint64_t v70 = v8;
      uint64_t v71 = a6;
      uint64_t v72 = v11;
      if (v22)
      {
        uint64_t v63 = v15;
        uint64_t v24 = 0;
        unint64_t v69 = (void (**)(char *, uint64_t, uint64_t))(v14 + 16);
        uint64_t v67 = (void (**)(char *, uint64_t))(v14 + 8);
        int v61 = v12;
        unsigned int v62 = v12 + 5;
        do
        {
          int v36 = 1 << __clz(__rbit32(v22));
          if ((v36 & *v8) != 0)
          {
            v16.i32[0] = (v36 - 1) & *v8;
            uint8x8_t v37 = (uint8x8_t)vcnt_s8(v16);
            v37.i16[0] = vaddlv_u8(v37);
            uint64_t v38 = v37.u32[0];
            uint64_t v39 = v71;
            uint64_t v40 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(v24, v76, v75, a3, a4, v71);
            int v41 = v8;
            uint64_t v42 = *v69;
            (*v69)(v18, v40, a3);
            uint64_t v43 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(v38, v41, v72, a3, v73, v39);
            uint64_t v44 = v63;
            v42(v63, v43, a3);
            LOBYTE(v38) = sub_24A5BB530();
            uint64_t v45 = *v67;
            unint64_t v46 = v44;
            a4 = v74;
            (*v67)(v46, a3);
            uint64_t result = ((uint64_t (*)(char *, uint64_t))v45)(v18, a3);
            if ((v38 & 1) == 0) {
              goto LABEL_3;
            }
          }
          else
          {
            uint64_t v25 = v71;
            uint64_t v26 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(v24, v76, v75, a3, a4, v71);
            uint64_t v64 = *v69;
            v64(v18, v26, a3);
            uint64_t v27 = sub_24A5B85E4();
            uint64_t v28 = *v67;
            uint64_t v65 = v27;
            uint64_t v66 = v28;
            __n128 v29 = ((__n128 (*)(char *, uint64_t))v28)(v18, a3);
            v29.n128_u32[0] = v8[1] & (v36 - 1);
            v29.n128_u64[0] = (unint64_t)vcnt_s8((int8x8_t)v29.n128_u64[0]);
            v29.n128_u16[0] = vaddlv_u8((uint8x8_t)v29.n128_u64[0]);
            uint64_t v30 = v73;
            uint64_t v31 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v29.n128_u32[0], v8, v72, a3, v73, v25);
            uint64_t v33 = *v31;
            uint64_t v32 = v31[1];
            uint64_t v34 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(v24, v76, v75, a3, v74, v25);
            v64(v18, v34, a3);
            swift_retain();
            uint64_t v35 = v30;
            a4 = v74;
            LOBYTE(v32) = _HashNode.containsKey(_:_:_:)(v62, (uint64_t)v18, v65, v33, v32, a3, v35, v25);
            swift_release();
            uint64_t result = ((uint64_t (*)(char *, uint64_t))v66)(v18, a3);
            if ((v32 & 1) == 0) {
              goto LABEL_3;
            }
          }
          uint64_t v24 = (v24 + 1);
          v22 &= v22 - 1;
          uint64_t v8 = v70;
        }
        while (v22);
        unsigned int v20 = v76[1];
        int v12 = v61;
      }
      if (!v20)
      {
        char v23 = 1;
        goto LABEL_4;
      }
      uint64_t v47 = 0;
      LODWORD(v69) = v12 + 5;
      uint64_t v48 = v73;
      uint64_t v49 = v74;
      uint64_t v50 = v71;
      while (1)
      {
        v16.i32[0] = v8[1] & ~(-1 << __clz(__rbit32(v20)));
        uint8x8_t v51 = (uint8x8_t)vcnt_s8(v16);
        v51.i16[0] = vaddlv_u8(v51);
        uint64_t v52 = v51.u32[0];
        uint64_t v53 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v47, v76, v75, a3, v49, v50);
        uint64_t v54 = v8;
        uint64_t v55 = *v53;
        uint64_t v56 = v53[1];
        uint64_t v57 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v52, v54, v72, a3, v48, v50);
        uint64_t v59 = *v57;
        uint64_t v58 = v57[1];
        swift_retain();
        swift_retain();
        LOBYTE(v56) = _HashNode.isSubset<A>(_:of:)(v69, v59, v58, v55, v56, a3, v49, v48, v50);
        swift_release();
        uint64_t result = swift_release();
        if ((v56 & 1) == 0) {
          break;
        }
        uint64_t v47 = (v47 + 1);
        char v23 = 1;
        v20 &= v20 - 1;
        uint64_t v8 = v70;
        if (!v20) {
          goto LABEL_4;
        }
      }
    }
  }
LABEL_3:
  char v23 = 0;
LABEL_4:
  *uint64_t v68 = v23;
  return result;
}

uint64_t sub_24A59C4E8(uint64_t a1)
{
  return sub_24A59B940(a1, v1[6], v1[7], v1[8], v1[2], v1[3], v1[4], v1[5]) & 1;
}

unsigned char *BitSet.formSymmetricDifference(_:)(int8x16_t *a1)
{
  unint64_t v4 = a1[1].u64[0];
  if (v4 << 6 >= 0xFFFFFFFFFFFFFFC0)
  {
    __break(1u);
LABEL_24:
    uint64_t v1 = sub_24A499D60((uint64_t)v1);
LABEL_6:
    unint64_t v8 = *((void *)v1 + 2);
    if (v4 < v8) {
      unint64_t v8 = v4;
    }
    if (!v8) {
      goto LABEL_22;
    }
    if (v8 >= 6
      && ((uint64_t v9 = 8 * v8 + 32, v1 + 32 < &v3->i8[v9]) ? (v10 = &v3[2] >= (int8x16_t *)&v1[v9]) : (v10 = 1), v10))
    {
      uint64_t v11 = v8 & 0x7FFFFFFFFFFFFFFCLL;
      int v12 = v3 + 3;
      uint64_t v13 = (int8x16_t *)(v1 + 48);
      uint64_t v14 = v8 & 0x7FFFFFFFFFFFFFFCLL;
      do
      {
        int8x16_t v15 = veorq_s8(*v13, *v12);
        v13[-1] = veorq_s8(v13[-1], v12[-1]);
        *uint64_t v13 = v15;
        v12 += 2;
        v13 += 2;
        v14 -= 4;
      }
      while (v14);
      if (v8 == v11) {
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    unint64_t v16 = v8 - v11;
    uint64_t v17 = 8 * v11 + 32;
    uint64_t v18 = &v1[v17];
    uint64_t v19 = (uint64_t *)((char *)v3->i64 + v17);
    do
    {
      uint64_t v20 = *v19++;
      *(void *)v18 ^= v20;
      v18 += 8;
      --v16;
    }
    while (v16);
LABEL_22:
    uint64_t *v2 = (uint64_t)v1;
    return sub_24A54A3A0(&v21, v2);
  }
  uint64_t v3 = a1;
  unint64_t v5 = ((v4 << 6) + 63) >> 6;
  uint64_t v1 = (char *)*v2;
  unint64_t v6 = *(void *)(*v2 + 16);
  uint64_t result = (unsigned char *)(v5 - v6);
  if (v5 <= v6)
  {
LABEL_5:
    char v21 = 1;
    if (swift_isUniquelyReferenced_nonNull_native()) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
  if ((uint64_t)(v5 - v6) >= 0)
  {
    sub_24A4D5F98((uint64_t)result, 0);
    uint64_t v1 = (char *)*v2;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t BitSet.formSymmetricDifference(_:)(uint64_t result, unint64_t a2)
{
  if (((a2 | result) & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_10:
    unint64_t v6 = sub_24A499D60((uint64_t)v6);
    goto LABEL_7;
  }
  unint64_t v4 = a2;
  unint64_t v5 = result;
  if (result == a2) {
    return result;
  }
  uint64_t v2 = v3;
  unint64_t v7 = (a2 + 63) >> 6;
  unint64_t v6 = (char *)*v3;
  unint64_t v8 = *(void *)(*v3 + 16);
  uint64_t result = v7 - v8;
  if (v7 > v8)
  {
    if ((uint64_t)(v7 - v8) < 0)
    {
      __break(1u);
      return result;
    }
    sub_24A4D5F98(result, 0);
    unint64_t v6 = (char *)*v3;
  }
  char v9 = 1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  _UnsafeBitSet.formSymmetricDifference(_:)(v5, v4);
  uint64_t *v2 = (uint64_t)v6;
  return (uint64_t)sub_24A54A3A0(&v9, v2);
}

uint64_t BitSet.formSymmetricDifference<A>(_:)(uint64_t a1, ValueMetadata *a2)
{
  Description = (void (**)(char *, void, ValueMetadata *))a2[-1].Description;
  MEMORY[0x270FA5388](a1);
  unint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26979AEC0);
  Description[2](v6, a1, a2);
  if ((ValueMetadata *)v7 == a2)
  {
    swift_dynamicCast();
    BitSet.formSymmetricDifference(_:)(v10[0], v10[1]);
  }
  else
  {
    unint64_t v8 = (int8x16_t *)BitSet.init<A>(_:)((uint64_t)v6, a2);
    BitSet.formSymmetricDifference(_:)(v8);
    swift_bridgeObjectRelease();
  }
  return ((uint64_t (*)(uint64_t, ValueMetadata *))Description[1])(a1, a2);
}

uint64_t OrderedSet.isEqualSet<A>(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v51 = a2;
  uint64_t v44 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v47 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24A5BBD20();
  MEMORY[0x270FA5388](v14 - 8);
  unint64_t v16 = (char *)&v42 - v15;
  uint64_t AssociatedConformanceWitness = a7;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v17 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v18 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v49 = (char *)&v42 - v19;
  uint64_t v20 = *(void *)(a5 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  char v23 = (char *)&v42 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v42 - v24;
  if (type metadata accessor for OrderedSet() == a5)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v25, a1, a5);
    swift_dynamicCast();
    char v28 = OrderedSet.isEqualSet(to:)(v52[0], v52[1], v51, a3, a4, a6);
    swift_release();
    swift_release();
    return v28 & 1;
  }
  uint64_t v43 = v17;
  uint64_t v48 = a6;
  uint64_t v46 = a3;
  v52[0] = a3;
  sub_24A5BC210();
  swift_getWitnessTable();
  uint64_t v26 = sub_24A5BBBC0();
  if (v26)
  {
    MEMORY[0x270FA5388](v26);
    *(&v42 - 4) = a4;
    *(&v42 - 3) = a5;
    uint64_t v27 = AssociatedConformanceWitness;
    *(&v42 - 2) = v48;
    *(&v42 - 1) = v27;
    char v28 = sub_24A5BB890();
    return v28 & 1;
  }
  __n128 v29 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  v29(v23, a1, a5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26979B020);
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
    uint64_t v30 = sub_24A5BB860();
    if (_s19CollectionsInternal4HeapV5countSivg_0() >= v30)
    {
      v29(v25, a1, a5);
      sub_24A5BB840();
      uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
      sub_24A5BBEE0();
      uint64_t v31 = v44;
      uint64_t v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48);
      if (v32(v16, 1, a4) == 1)
      {
        uint64_t v33 = 0;
LABEL_15:
        (*(void (**)(char *, uint64_t))(v43 + 8))(v49, AssociatedTypeWitness);
        uint64_t result = _s19CollectionsInternal4HeapV5countSivg_0();
        if (result >= v33)
        {
          char v28 = v33 == _s19CollectionsInternal4HeapV5countSivg_0();
          return v28 & 1;
        }
        goto LABEL_21;
      }
      uint64_t v33 = 0;
      uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v31 + 32);
      uint64_t v40 = v47;
      while (1)
      {
        v39(v40, v16, a4);
        BOOL v41 = OrderedSet.contains(_:)();
        (*(void (**)(char *, uint64_t))(v31 + 8))(v40, a4);
        if (!v41) {
          break;
        }
        ++v33;
        sub_24A5BBEE0();
        if (v32(v16, 1, a4) == 1) {
          goto LABEL_15;
        }
      }
      (*(void (**)(char *, uint64_t))(v43 + 8))(v49, AssociatedTypeWitness);
    }
    char v28 = 0;
    return v28 & 1;
  }
  uint64_t v34 = v46;
  uint64_t v35 = _s19CollectionsInternal4HeapV5countSivg_0();
  uint64_t result = MEMORY[0x270FA5388](v35);
  *(&v42 - 8) = a4;
  *(&v42 - 7) = a5;
  uint64_t v37 = AssociatedConformanceWitness;
  *(&v42 - 6) = v48;
  *(&v42 - 5) = v37;
  uint64_t v38 = v51;
  *(&v42 - 4) = a1;
  *(&v42 - 3) = v38;
  *(&v42 - 2) = v34;
  if (result < 0)
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  LOBYTE(v52[0]) = 2;
  uint64_t result = (uint64_t)sub_24A5813C8((unint64_t)(result + 63) >> 6, v52, (void *(*)(char *__return_ptr, unsigned char **))sub_24A59D3C0);
  if (LOBYTE(v52[0]) != 2)
  {
    char v28 = v52[0] & 1;
    return v28 & 1;
  }
LABEL_22:
  __break(1u);
  return result;
}

uint64_t OrderedSet.isEqualSet(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  LOBYTE(a6) = static OrderedSet.UnorderedView.== infix(_:_:)(a3, a4, a1, a2, a5, a6);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a6 & 1;
}

{
  swift_retain();
  swift_retain();
  LOBYTE(a6) = static OrderedSet.UnorderedView.== infix(_:_:)(a3, a4, a1, a2, a5, a6);
  swift_release();
  swift_release();
  return a6 & 1;
}

unint64_t sub_24A59CFD8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, BOOL *a8@<X8>)
{
  uint64_t v34 = a8;
  uint64_t v39 = a3;
  uint64_t v40 = a7;
  uint64_t v43 = a4;
  uint64_t v42 = a2;
  uint64_t v38 = a1;
  uint64_t v35 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24A5BBD20();
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&v32 - v14;
  uint64_t v16 = *(void *)(a6 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v33 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v21 = (char *)&v32 - v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v42, a6);
  sub_24A5BB840();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  BOOL v41 = v21;
  uint64_t v42 = AssociatedTypeWitness;
  uint64_t v37 = AssociatedConformanceWitness;
  sub_24A5BBEE0();
  uint64_t v23 = v35;
  int v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48);
  uint64_t v24 = 0;
  if (v36(v15, 1, a5) == 1)
  {
LABEL_6:
    (*(void (**)(char *, uint64_t))(v33 + 8))(v41, v42);
    unint64_t result = _s19CollectionsInternal4HeapV5countSivg_0();
    BOOL v31 = v24 == result;
LABEL_8:
    *uint64_t v34 = v31;
  }
  else
  {
    uint64_t v24 = 0;
    uint64_t v35 = *(void *)(v23 + 32);
    uint64_t v25 = (void (**)(char *, uint64_t))(v23 + 8);
    while (1)
    {
      ((void (*)(char *, char *, uint64_t))v35)(v11, v15, a5);
      unint64_t result = OrderedSet._find(_:)();
      if (v27)
      {
        (*v25)(v11, a5);
        unint64_t result = (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v41, v42);
        BOOL v31 = 0;
        goto LABEL_8;
      }
      char v28 = result;
      if ((result & 0x8000000000000000) != 0) {
        break;
      }
      uint64_t v29 = (result >> 3) & 0x1FFFFFFFFFFFFFF8;
      uint64_t v30 = *(void *)(*v38 + v29);
      *(void *)(*v38 + v29) = v30 | (1 << result);
      (*v25)(v11, a5);
      v24 += ((unint64_t)~v30 >> v28) & 1;
      sub_24A5BBEE0();
      if (v36(v15, 1, a5) == 1) {
        goto LABEL_6;
      }
    }
    __break(1u);
  }
  return result;
}

unint64_t sub_24A59D3C0@<X0>(void *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_24A59CFD8(a1, v2[6], v2[7], v2[8], v2[2], v2[3], v2[4], a2);
}

uint64_t Deque<A>.encode(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v23 = a4;
  uint64_t v7 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  char v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24A5BBD20();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v19 - v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24A5BC710();
  uint64_t v25 = Deque.makeIterator()(a2, a3);
  uint64_t v26 = v13;
  uint64_t v27 = v14;
  uint64_t v15 = type metadata accessor for Deque.Iterator();
  Deque.Iterator.next()(v15, (uint64_t)v12);
  uint64_t v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v16(v12, 1, a3) != 1)
  {
    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    uint64_t v22 = v9;
    uint64_t v20 = (void (**)(char *, uint64_t))(v7 + 8);
    do
    {
      v21(v9, v12, a3);
      uint64_t v24 = v30;
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v28, v29);
      uint64_t v17 = v31;
      sub_24A5BC4B0();
      (*v20)(v9, a3);
      if (v17) {
        break;
      }
      uint64_t v31 = 0;
      Deque.Iterator.next()(v15, (uint64_t)v12);
    }
    while (v16(v12, 1, a3) != 1);
  }
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
}

uint64_t sub_24A59D66C(void *a1, uint64_t a2, uint64_t a3)
{
  return Deque<A>.encode(to:)(a1, *v3, *(void *)(a2 + 16), *(void *)(a3 - 8));
}

void *Deque<A>.init(from:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v16 = a3;
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v17[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = Deque.init()(v9);
  uint64_t v10 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24A5BC6E0();
  if (v3)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v17, v18);
    uint64_t v11 = sub_24A5BC460();
    if ((v12 & 1) == 0)
    {
      Swift::Int v13 = v11;
      type metadata accessor for Deque();
      Deque.reserveCapacity(_:)(v13);
    }
    __swift_project_boxed_opaque_existential_1(v17, v18);
    while ((sub_24A5BC490() & 1) == 0)
    {
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v17, v18);
      sub_24A5BC470();
      uint64_t v14 = type metadata accessor for Deque();
      Deque.append(_:)((uint64_t)v8, v14);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, a2);
      __swift_project_boxed_opaque_existential_1(v17, v18);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
    uint64_t v10 = (void *)v19;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v10;
}

void *sub_24A59D8DC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  unint64_t result = Deque<A>.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a3 - 8));
  if (!v4) {
    *a4 = result;
  }
  return result;
}

void sub_24A59D910()
{
  uint64_t v1 = *(void *)(v0 + 64);
  if (!v1) {
    return;
  }
  uint64_t v2 = (void *)v0;
  uint64_t v3 = *(void *)(v0 + 48);
  unint64_t v4 = *(void *)(v0 + 56);
  long long v5 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v0;
  *(_OWORD *)&v15[16] = v5;
  *(_OWORD *)&v15[32] = *(_OWORD *)(v0 + 32);
  if (v3 != *(void *)&v15[40])
  {
    __break(1u);
    goto LABEL_11;
  }
  long long v13 = *(_OWORD *)&v15[8];
  long long v14 = *(_OWORD *)&v15[24];
  uint64_t v6 = *(void *)v15;
  swift_unknownObjectRetain();
  sub_24A497498((uint64_t)v15);
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_24A498214();
  sub_24A496BE8((uint64_t)v15);
  if (v4 >= v7)
  {
LABEL_11:
    __break(1u);
    return;
  }
  unint64_t v8 = v2[7];
  char v9 = (4 * *(unsigned char *)(v1 + 18) + 8) & 0x3C;
  unint64_t v10 = ((v8 >> v9) & 0xF) + 1;
  if (v10 < *(unsigned __int16 *)(v1 + 16))
  {
    v2[7] = (v10 << v9) | ((-15 << v9) - 1) & v8;
LABEL_8:
    sub_24A496BE8((uint64_t)v15);
    return;
  }
  uint64_t v16 = v6;
  long long v17 = v13;
  long long v18 = v14;
  swift_unknownObjectRetain();
  char v11 = sub_24A498278((uint64_t)(v2 + 6));
  sub_24A496BE8((uint64_t)v15);
  if (v11) {
    goto LABEL_8;
  }
  unint64_t v12 = sub_24A498214();
  sub_24A496BE8((uint64_t)v15);
  v2[6] = v3;
  v2[7] = v12;
  v2[8] = 0;
}

void sub_24A59DA94(void *a1@<X8>)
{
  sub_24A59D910();
  *a1 = v2;
  a1[1] = v3;
}

uint64_t _s13ChunkIteratorVwcp(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_unknownObjectRetain();
  return a1;
}

void *_s13ChunkIteratorVwca(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t _s13ChunkIteratorVwta(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_unknownObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  return a1;
}

uint64_t _s13ChunkIteratorVwet(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 72)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t _s13ChunkIteratorVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 72) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 72) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *_s13ChunkIteratorVMa()
{
  return &_s13ChunkIteratorVN;
}

uint64_t sub_24A59DCE8()
{
  return 11050466;
}

uint64_t sub_24A59DE60()
{
  return sub_24A59DCE8();
}

uint64_t sub_24A59DE6C()
{
  return 15;
}

uint64_t sub_24A59DE74()
{
  return 4;
}

double sub_24A59DE7C@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

BOOL sub_24A59DE88()
{
  return *(void *)(v0 + 24) == 0;
}

void *sub_24A59DE98(void *result)
{
  if (__OFADD__(*v1, *result))
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v3 = result[2];
  uint64_t v2 = result[3];
  uint64_t v4 = result[1];
  *v1 += *result;
  uint64_t v5 = v1[1];
  BOOL v6 = __OFADD__(v5, v4);
  uint64_t v7 = v5 + v4;
  if (v6)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v1[1] = v7;
  uint64_t v8 = v1[2];
  BOOL v6 = __OFADD__(v8, v3);
  uint64_t v9 = v8 + v3;
  if (v6)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v1[2] = v9;
  uint64_t v10 = v1[3];
  BOOL v6 = __OFADD__(v10, v2);
  uint64_t v11 = v10 + v2;
  if (!v6)
  {
    v1[3] = v11;
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

void *sub_24A59DEF8(void *result)
{
  if (__OFSUB__(*v1, *result))
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v3 = result[2];
  uint64_t v2 = result[3];
  uint64_t v4 = result[1];
  *v1 -= *result;
  uint64_t v5 = v1[1];
  BOOL v6 = __OFSUB__(v5, v4);
  uint64_t v7 = v5 - v4;
  if (v6)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v1[1] = v7;
  uint64_t v8 = v1[2];
  BOOL v6 = __OFSUB__(v8, v3);
  uint64_t v9 = v8 - v3;
  if (v6)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v1[2] = v9;
  uint64_t v10 = v1[3];
  BOOL v6 = __OFSUB__(v10, v2);
  uint64_t v11 = v10 - v2;
  if (!v6)
  {
    v1[3] = v11;
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

BOOL sub_24A59DF58(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

unint64_t sub_24A59DF94(uint64_t a1)
{
  unint64_t result = sub_24A59DFBC();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24A59DFBC()
{
  unint64_t result = qword_26979C430[0];
  if (!qword_26979C430[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26979C430);
  }
  return result;
}

uint64_t OrderedSet.formIntersection(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_24A53A724(a1, a2, *v3, v3[1], *(void *)(a3 + 16));
  uint64_t v6 = v5;
  swift_release();
  uint64_t result = swift_release();
  *uint64_t v3 = v4;
  v3[1] = v6;
  return result;
}

uint64_t OrderedSet.formIntersection<A>(_:)()
{
  uint64_t v1 = sub_24A53A8E8();
  uint64_t v3 = v2;
  swift_release();
  uint64_t result = swift_release();
  *uint64_t v0 = v1;
  v0[1] = v3;
  return result;
}

uint64_t sub_24A59E0D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v8 = *(void *)(v4 + 8);
  long long v9 = *(_OWORD *)(v4 + 16);
  long long v10 = *(_OWORD *)(v4 + 32);
  *(_OWORD *)(v4 + 8) = 0u;
  *(_OWORD *)(v4 + 24) = 0u;
  *(void *)(v4 + 40) = 0;
  if (v8)
  {
    unint64_t v17 = v8;
    long long v18 = v9;
    long long v19 = v10;
  }
  else
  {
    sub_24A4919E4((uint64_t)&v17);
  }
  uint64_t result = sub_24A4918AC(a1, a2, a3 & 0xFFFFFFFFFFFFLL);
  long long v15 = v18;
  long long v16 = v19;
  if (*(_WORD *)(v17 + 16) == 15)
  {
    unint64_t v20 = v17;
    long long v21 = v18;
    long long v22 = v19;
    return sub_24A59E198(&v20, v12, v13, v14);
  }
  else
  {
    *(void *)(v4 + 8) = v17;
    *(_OWORD *)(v4 + 16) = v15;
    *(_OWORD *)(v4 + 32) = v16;
  }
  return result;
}

uint64_t sub_24A59E198(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  unint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  int64_t v10 = a1[2];
  uint64_t v9 = a1[3];
  uint64_t v11 = a1[4];
  long long v12 = *((_OWORD *)a1 + 1);
  long long v99 = *(_OWORD *)a1;
  long long v100 = v12;
  unsigned __int8 v101 = (uint64_t *)a1[4];
  uint64_t v13 = *v4;
  if (!v13[2])
  {
LABEL_65:
    uint64_t v73 = v11;
    uint64_t v74 = v9;
    v92[0] = 0;
    unint64_t v75 = v7;
    swift_unknownObjectRetain();
    MEMORY[0x24C5C7E90](v92, 8);
    uint64_t v76 = v92[0];
    if (swift_isUniquelyReferenced_nonNull_native()) {
      uint64_t v77 = v13;
    }
    else {
      uint64_t v77 = sub_24A499D74(0, v13[2] + 1, 1, v13);
    }
    unint64_t v79 = v77[2];
    unint64_t v78 = v77[3];
    if (v79 >= v78 >> 1) {
      uint64_t v77 = sub_24A499D74((void *)(v78 > 1), v79 + 1, 1, v77);
    }
    v77[2] = v79 + 1;
    uint64_t v80 = &v77[6 * v79];
    v80[4] = v75;
    v80[5] = v8;
    v80[6] = v10;
    v80[7] = v74;
    v80[8] = v73;
    v80[9] = v76;
    uint64_t v71 = v77;
LABEL_70:
    uint64_t result = swift_unknownObjectRelease();
    *uint64_t v88 = v71;
    return result;
  }
  while (2)
  {
    v121[0] = v7;
    v121[1] = v8;
    v121[2] = v10;
    v121[3] = v9;
    v121[4] = v11;
    unint64_t v14 = v13[2];
    if (!v14)
    {
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
LABEL_76:
      __break(1u);
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
LABEL_79:
      __break(1u);
LABEL_80:
      __break(1u);
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      a4 = sub_24A499D74((void *)(v14 > 1), (int64_t)v13, 1, a4);
LABEL_62:
      a4[2] = (uint64_t)v13;
      uint64_t v68 = &a4[6 * v7];
      long long v69 = v102;
      long long v70 = v104;
      *((_OWORD *)v68 + 3) = v103;
      *((_OWORD *)v68 + 4) = v70;
      *((_OWORD *)v68 + 2) = v69;
      uint64_t v71 = a4;
      sub_24A496BE8((uint64_t)&v102);
      goto LABEL_70;
    }
    uint64_t v86 = v11;
    uint64_t v87 = v9;
    uint64_t v91 = (uint64_t *)v7;
    unint64_t v7 = (unint64_t)v13;
    if (swift_isUniquelyReferenced_nonNull_native()) {
      uint64_t result = (uint64_t)v13;
    }
    else {
      uint64_t result = (uint64_t)sub_24A499D4C(v13);
    }
    unint64_t v14 = *(void *)(result + 16);
    uint64_t v16 = (uint64_t)v91;
    if (!v14) {
      goto LABEL_72;
    }
    uint64_t v84 = v10;
    uint64_t v85 = v8;
    unint64_t v17 = v14 - 1;
    uint64_t v18 = result + 32;
    long long v19 = (int64_t *)(result + 32 + 48 * v17);
    int64_t v21 = *v19;
    uint64_t v20 = v19[1];
    int64_t v22 = v19[2];
    uint64_t v23 = v19[3];
    unint64_t v24 = v19[4];
    uint64_t v25 = v19[5];
    *(void *)(result + 16) = v17;
    int64_t v94 = v21;
    uint64_t v95 = v20;
    int64_t v96 = v22;
    uint64_t v97 = v23;
    unint64_t v98 = v24;
    uint64_t v89 = result + 32;
    uint64_t v90 = (uint64_t *)result;
    while (1)
    {
      unint64_t v26 = v24;
      uint64_t v27 = v23;
      char v28 = (uint64_t *)v22;
      uint64_t v29 = v20;
      int64_t v10 = v21;
      uint64_t v30 = v25;
      unsigned int v31 = v21 ? *(unsigned __int8 *)(v21 + 18) : 0;
      if (v31 >= *(unsigned __int8 *)(v16 + 18)) {
        break;
      }
      uint64_t v32 = *(void *)(result + 16);
      if (!v32)
      {
        int64_t v94 = v21;
        uint64_t v95 = v20;
        int64_t v96 = v22;
        uint64_t v97 = v23;
        unint64_t v98 = v24;
        v92[0] = 0;
        uint64_t v63 = v16;
        int64_t v64 = v22;
        uint64_t v65 = v20;
        uint64_t v66 = v30;
        swift_unknownObjectRetain();
        MEMORY[0x24C5C7E90](v92, 8);
        uint64_t v67 = v92[0];
        v92[0] = v63;
        v92[1] = v85;
        v92[2] = v84;
        v92[3] = v87;
        v92[4] = v86;
        v93[0] = v67;
        uint64_t v111 = v21;
        uint64_t v112 = (uint64_t *)v65;
        uint64_t v113 = (uint64_t *)v64;
        v114 = (uint64_t *)v23;
        unint64_t v115 = v24;
        uint64_t v116 = v66;
        sub_24A5B2704((uint64_t)&v111, v92, (uint64_t *)&v102);
        sub_24A4974C4((uint64_t)&v102, (uint64_t)&v106);
        sub_24A497498((uint64_t)&v106);
        a4 = v90;
        unint64_t v7 = v90[2];
        unint64_t v14 = v90[3];
        uint64_t v13 = (uint64_t *)(v7 + 1);
        if (v7 >= v14 >> 1) {
          goto LABEL_83;
        }
        goto LABEL_62;
      }
      uint64_t v33 = v32 - 1;
      uint64_t v34 = (uint64_t *)(v18 + 48 * v33);
      uint64_t v6 = *v34;
      uint64_t v35 = v34[1];
      uint64_t v8 = v34[2];
      unint64_t v7 = v34[3];
      int64_t v21 = *v34;
      unint64_t v5 = v34[4];
      uint64_t v25 = v34[5];
      *(void *)(result + 16) = v33;
      uint64_t v20 = v35;
      int64_t v22 = v8;
      uint64_t v23 = v7;
      unint64_t v24 = v5;
      if (v10)
      {
        if (*(_WORD *)(v10 + 16))
        {
          uint64_t v25 = v30;
          int64_t v21 = v10;
          uint64_t v20 = v29;
          int64_t v22 = (int64_t)v28;
          uint64_t v23 = v27;
          unint64_t v24 = v26;
          if (v6)
          {
            if (*(_WORD *)(v6 + 16))
            {
              uint64_t v111 = v6;
              uint64_t v112 = (uint64_t *)v35;
              uint64_t v113 = (uint64_t *)v8;
              v114 = (uint64_t *)v7;
              unint64_t v115 = v5;
              *(void *)&long long v102 = v10;
              *((void *)&v102 + 1) = v29;
              *(void *)&long long v103 = v28;
              *((void *)&v103 + 1) = v27;
              *(void *)&long long v104 = v26;
              if (*(unsigned __int8 *)(v6 + 18) >= *(unsigned __int8 *)(v10 + 18))
              {
                uint64_t v13 = &v111;
                sub_24A5B2A4C(v93, (uint64_t *)&v102, &v106);
                if (v106)
                {
                  uint64_t v45 = v111;
                  unsigned int v46 = *(unsigned __int8 *)(v111 + 18) + 1;
                  unint64_t v14 = v46 >> 8;
                  if ((v46 & 0x100) != 0) {
                    goto LABEL_74;
                  }
                  uint64_t v83 = v106;
                  uint64_t v13 = v107;
                  unint64_t v47 = v108;
                  uint64_t v48 = v109;
                  uint64_t v49 = v110;
                  uint64_t v8 = (uint64_t)v112;
                  unint64_t v7 = (unint64_t)v113;
                  uint64_t v51 = v114;
                  unint64_t v50 = v115;
                  __swift_instantiateConcreteTypeFromMangledName(&qword_26B177928);
                  uint64_t v52 = swift_allocObject();
                  uint64_t v53 = v13;
                  *(_WORD *)(v52 + 16) = 0;
                  *(unsigned char *)(v52 + 18) = v46;
                  uint64_t v54 = (uint64_t *)((char *)v13 + v8);
                  if (__OFADD__(v8, v13)) {
                    goto LABEL_76;
                  }
                  uint64_t v55 = (char *)(v7 + v47);
                  if (__OFADD__(v7, v47)) {
                    goto LABEL_78;
                  }
                  unint64_t v14 = v47;
                  uint64_t v23 = (uint64_t)v51 + v48;
                  if (__OFADD__(v51, v48)) {
                    goto LABEL_80;
                  }
                  unint64_t v24 = v50 + v49;
                  if (__OFADD__(v50, v49)) {
                    goto LABEL_82;
                  }
                  int64_t v21 = v52;
                  *(void *)(v52 + 24) = v45;
                  *(void *)(v52 + 32) = v8;
                  *(void *)(v52 + 40) = v7;
                  *(void *)(v52 + 48) = v51;
                  *(void *)(v52 + 56) = v50;
                  *(void *)(v52 + 64) = v83;
                  *(void *)(v52 + 72) = v53;
                  *(void *)(v52 + 80) = v14;
                  *(void *)(v52 + 88) = v48;
                  *(void *)(v52 + 96) = v49;
                  *(_WORD *)(v52 + 16) = 2;
                  uint64_t v106 = 0;
                  unint64_t v7 = (unint64_t)v54;
                  unint64_t v5 = (unint64_t)v55;
                  swift_unknownObjectRetain();
                  MEMORY[0x24C5C7E90](&v106, 8);
                  uint64_t v25 = v106;
                  uint64_t v6 = v102;
                  swift_unknownObjectRelease();
                }
                else
                {
                  int64_t v21 = v111;
                  unint64_t v7 = (unint64_t)v112;
                  unint64_t v5 = (unint64_t)v113;
                  uint64_t v23 = (uint64_t)v114;
                  unint64_t v24 = v115;
                  uint64_t v106 = 0;
                  swift_unknownObjectRetain();
                  MEMORY[0x24C5C7E90](&v106, 8);
                  uint64_t v25 = v106;
                  swift_unknownObjectRelease();
                }
              }
              else
              {
                uint64_t v13 = (uint64_t *)&v102;
                sub_24A5B2DB0(v93, &v111, &v106);
                if (v106)
                {
                  unsigned int v36 = *(unsigned __int8 *)(v106 + 18) + 1;
                  unint64_t v14 = v36 >> 8;
                  if ((v36 & 0x100) != 0) {
                    goto LABEL_73;
                  }
                  uint64_t v37 = v107;
                  unint64_t v38 = v108;
                  uint64_t v6 = v109;
                  uint64_t v39 = v110;
                  uint64_t v8 = *((void *)&v102 + 1);
                  uint64_t v81 = v102;
                  uint64_t v82 = v106;
                  unint64_t v40 = *((void *)&v103 + 1);
                  unint64_t v7 = v103;
                  uint64_t v41 = v104;
                  __swift_instantiateConcreteTypeFromMangledName(&qword_26B177928);
                  uint64_t v42 = swift_allocObject();
                  *(_WORD *)(v42 + 16) = 0;
                  *(unsigned char *)(v42 + 18) = v36;
                  if (__OFADD__(v37, v8)) {
                    goto LABEL_75;
                  }
                  uint64_t v43 = (char *)(v38 + v7);
                  if (__OFADD__(v38, v7)) {
                    goto LABEL_77;
                  }
                  unint64_t v14 = v40;
                  BOOL v44 = __OFADD__(v6, v40);
                  uint64_t v23 = v6 + v40;
                  if (v44) {
                    goto LABEL_79;
                  }
                  unint64_t v24 = v39 + v41;
                  if (__OFADD__(v39, v41)) {
                    goto LABEL_81;
                  }
                  int64_t v21 = v42;
                  *(void *)(v42 + 24) = v82;
                  *(void *)(v42 + 32) = v37;
                  *(void *)(v42 + 40) = v38;
                  *(void *)(v42 + 48) = v6;
                  *(void *)(v42 + 56) = v39;
                  *(void *)(v42 + 64) = v81;
                  *(void *)(v42 + 72) = v8;
                  *(void *)(v42 + 80) = v7;
                  *(void *)(v42 + 88) = v14;
                  *(void *)(v42 + 96) = v41;
                  *(_WORD *)(v42 + 16) = 2;
                  uint64_t v106 = 0;
                  unint64_t v7 = (unint64_t)v37 + v8;
                  unint64_t v5 = (unint64_t)v43;
                }
                else
                {
                  unint64_t v7 = *((void *)&v102 + 1);
                  int64_t v21 = v102;
                  uint64_t v23 = *((void *)&v103 + 1);
                  unint64_t v5 = v103;
                  unint64_t v24 = v104;
                  uint64_t v106 = 0;
                }
                MEMORY[0x24C5C7E90](&v106, 8);
                uint64_t v25 = v106;
              }
              swift_unknownObjectRelease();
              int64_t v22 = v5;
              uint64_t v20 = v7;
              uint64_t result = (uint64_t)v90;
              uint64_t v16 = (uint64_t)v91;
              uint64_t v18 = v89;
            }
            else
            {
              unint64_t v24 = v26;
              uint64_t v23 = v27;
              unint64_t v7 = (unint64_t)v28;
              unint64_t v5 = v29;
              uint64_t v25 = v30;
              swift_unknownObjectRelease();
              uint64_t v18 = v89;
              uint64_t result = (uint64_t)v90;
              uint64_t v16 = (uint64_t)v91;
              int64_t v21 = v10;
              uint64_t v20 = v5;
              int64_t v22 = v7;
            }
          }
        }
        else
        {
          swift_unknownObjectRelease();
          uint64_t v18 = v89;
          uint64_t result = (uint64_t)v90;
          uint64_t v16 = (uint64_t)v91;
          int64_t v21 = v6;
          uint64_t v20 = v35;
          int64_t v22 = v8;
          uint64_t v23 = v7;
          unint64_t v24 = v5;
        }
      }
    }
    int64_t v94 = v21;
    uint64_t v95 = v20;
    int64_t v96 = v22;
    uint64_t v97 = v23;
    unint64_t v98 = v24;
    if (v21)
    {
      int v56 = *(unsigned __int8 *)(v16 + 18);
      if (*(unsigned __int8 *)(v21 + 18) == v56)
      {
        int64_t v21 = (int64_t)&v94;
        BOOL v57 = sub_24A5B3160((uint64_t *)&v99);
        uint64_t v8 = v95;
        int64_t v10 = v96;
        if (v57)
        {
          unint64_t v7 = v94;
          uint64_t v58 = v97;
          unint64_t v59 = v98;
          swift_unknownObjectRelease();
          uint64_t v11 = v59;
          uint64_t v9 = v58;
LABEL_51:
          *(void *)&long long v99 = v7;
          goto LABEL_52;
        }
        v117[0] = v94;
        v117[1] = v95;
        v117[2] = v96;
        v117[3] = v97;
        v117[4] = v98;
        unint64_t v7 = (unint64_t)v101;
        uint64_t v120 = v101;
        long long v118 = v99;
        long long v119 = v100;
        unint64_t v5 = v94;
        unsigned int v62 = *(unsigned __int8 *)(v94 + 18) + 1;
        if (((v62 >> 8) & 1) == 0)
        {
          uint64_t v6 = v97;
          uint64_t v23 = v98;
          int64_t v21 = *((void *)&v119 + 1);
          unint64_t v24 = v119;
          uint64_t v25 = *((void *)&v118 + 1);
          sub_24A5B41DC(v62, (uint64_t)v105);
          BOOL v44 = __OFADD__(v8, v25);
          v8 += v25;
          if (!v44)
          {
            BOOL v44 = __OFADD__(v10, v24);
            v10 += v24;
            if (!v44)
            {
              BOOL v44 = __OFADD__(v6, v21);
              v6 += v21;
              if (!v44)
              {
                unint64_t v24 = v23 + v7;
                if (!__OFADD__(v23, v7))
                {
                  unint64_t v7 = v105[0];
                  sub_24A5B4230((_WORD *)(v105[0] + 16), v105[0] + 24, (uint64_t)v117, (uint64_t)&v118);
                  swift_unknownObjectRelease();
                  sub_24A496BE8((uint64_t)&v118);
                  *(void *)&long long v99 = v7;
                  uint64_t v9 = v6;
                  uint64_t v11 = v24;
LABEL_52:
                  *((void *)&v99 + 1) = v8;
                  *(void *)&long long v100 = v10;
                  *((void *)&v100 + 1) = v9;
                  unsigned __int8 v101 = (uint64_t *)v11;
                  uint64_t v13 = v90;
                  if (v90[2]) {
                    continue;
                  }
                  goto LABEL_65;
                }
                goto LABEL_90;
              }
LABEL_89:
              __break(1u);
LABEL_90:
              __break(1u);
              goto LABEL_91;
            }
LABEL_88:
            __break(1u);
            goto LABEL_89;
          }
LABEL_87:
          __break(1u);
          goto LABEL_88;
        }
LABEL_86:
        __break(1u);
        goto LABEL_87;
      }
    }
    else
    {
      int v56 = *(unsigned __int8 *)(v16 + 18);
      if (!*(unsigned char *)(v16 + 18)) {
        goto LABEL_93;
      }
    }
    break;
  }
  if (*(_WORD *)(v16 + 16) != 15 || *(_WORD *)(v21 + 16) == 15) {
    goto LABEL_63;
  }
  if (v21)
  {
    int v60 = *(unsigned __int8 *)(v21 + 18);
    int v56 = *(unsigned __int8 *)(v16 + 18);
  }
  else
  {
    int v60 = 0;
  }
  unsigned int v61 = v56 + 1;
  if ((v61 >> 8))
  {
    __break(1u);
    goto LABEL_86;
  }
  if (v60 != v61)
  {
LABEL_63:
    uint64_t v23 = v25;
    uint64_t v6 = v20;
    uint64_t v8 = v22;
    unint64_t v5 = v27;
    uint64_t v25 = v24;
    unint64_t v7 = *(void *)(result + 16);
    unint64_t v24 = *(void *)(result + 24);
    int64_t v21 = v7 + 1;
    swift_unknownObjectRetain();
    if (v7 < v24 >> 1)
    {
LABEL_64:
      v90[2] = v21;
      uint64_t v72 = &v90[6 * v7];
      v72[4] = v10;
      v72[5] = v6;
      v72[6] = v8;
      v72[7] = v5;
      v72[8] = v25;
      v72[9] = v23;
      swift_unknownObjectRelease();
      uint64_t v13 = v90;
      unint64_t v7 = (unint64_t)v91;
      int64_t v10 = v84;
      uint64_t v8 = v85;
      uint64_t v11 = v86;
      uint64_t v9 = v87;
      goto LABEL_65;
    }
LABEL_91:
    uint64_t v90 = sub_24A499D74((void *)(v24 > 1), v21, 1, v90);
    goto LABEL_64;
  }
  if (v21)
  {
    sub_24A5B3208((uint64_t)v121);
    unint64_t v7 = v94;
    uint64_t v8 = v95;
    int64_t v10 = v96;
    uint64_t v9 = v97;
    uint64_t v11 = v98;
    goto LABEL_51;
  }
  __break(1u);
LABEL_93:
  __break(1u);
  return result;
}

uint64_t String.init(_:)(_OWORD *a1)
{
  long long v1 = a1[1];
  v3[0] = *a1;
  v3[1] = v1;
  v3[2] = a1[2];
  return _sSS19CollectionsInternalEySSAA9BigStringVcfC_0(v3);
}

uint64_t _sSS19CollectionsInternalEySSAA12BigSubstringVcfC_0(_OWORD *a1)
{
  long long v1 = a1[1];
  v8[0] = *a1;
  v8[1] = v1;
  long long v2 = a1[3];
  v8[2] = a1[2];
  long long v3 = a1[4];
  long long v4 = a1[5];
  v7[0] = v2;
  v7[1] = v3;
  long long v5 = a1[6];
  v7[2] = v4;
  v7[3] = v5;
  return sub_24A59EA58((uint64_t)v8, (uint64_t)v7);
}

uint64_t sub_24A59EA58(uint64_t a1, uint64_t a2)
{
  uint64_t v117 = 0;
  unint64_t v118 = 0xE000000000000000;
  unint64_t v4 = sub_24A4965FC(*(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), *(void *)(a2 + 24));
  unint64_t v8 = sub_24A496820(v4, v5, v6, v7, 0);
  uint64_t v10 = v9;
  unint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v15 = a1;
  unint64_t v16 = sub_24A4965FC(*(void *)(a2 + 32), *(void *)(a2 + 40), *(void *)(a2 + 48), *(void *)(a2 + 56));
  unint64_t v22 = sub_24A496820(v16, v17, v18, v19, 1);
  unint64_t v112 = v23;
  if ((uint64_t)((v22 >> 11) - (v8 >> 11)) < 1)
  {
    sub_24A496BE8(a1);
    return v117;
  }
  uint64_t v24 = v20;
  uint64_t v25 = v21;
  uint64_t result = MEMORY[0x24C5C68D0]();
  if (v14 == 1) {
    goto LABEL_81;
  }
  if (v25 != 1)
  {
    if (v12 == v112)
    {
      if (v10 != *(void *)(a1 + 40)) {
        goto LABEL_74;
      }
      if (v14)
      {
        uint64_t result = swift_bridgeObjectRetain();
      }
      else
      {
        long long v32 = *(_OWORD *)(a1 + 8);
        long long v33 = *(_OWORD *)(a1 + 24);
        *(void *)long long v119 = *(void *)a1;
        *(_OWORD *)&v119[8] = v32;
        *(_OWORD *)&v119[24] = v33;
        swift_unknownObjectRetain();
        sub_24A4895D4(v12, (uint64_t)&v132);
        uint64_t result = sub_24A496BE8(a1);
      }
      if (((16 * (int)v22) & 0x4000 | ((unint64_t)v22 << 16)) < ((16 * (int)v8) & 0x4000 | ((unint64_t)v8 << 16))) {
        goto LABEL_76;
      }
      uint64_t v34 = sub_24A5BB830();
      uint64_t v36 = v35;
      uint64_t v38 = v37;
      uint64_t v40 = v39;
      swift_bridgeObjectRelease();
      *(void *)&long long v132 = v34;
      *((void *)&v132 + 1) = v36;
      *(void *)&long long v133 = v38;
      *((void *)&v133 + 1) = v40;
      sub_24A491D60();
LABEL_71:
      sub_24A5BB6D0();
      sub_24A496BE8(v15);
      swift_bridgeObjectRelease();
      return v117;
    }
    long long v27 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)long long v119 = *(_OWORD *)a1;
    *(_OWORD *)&v119[16] = v27;
    *(_OWORD *)&v119[32] = *(_OWORD *)(a1 + 32);
    if (v10 != *(void *)&v119[40]) {
      goto LABEL_75;
    }
    uint64_t v100 = v24;
    uint64_t v99 = v25;
    uint64_t v28 = *(void *)v119;
    uint64_t v108 = *(void *)&v119[16];
    uint64_t v109 = *(void *)&v119[8];
    uint64_t v106 = *(void *)&v119[32];
    uint64_t v107 = *(void *)&v119[24];
    if (v14)
    {
      unint64_t v29 = v14 + 24 * ((v12 >> ((4 * *(unsigned char *)(v14 + 18) + 8) & 0x3C)) & 0xF);
      uint64_t v31 = *(void *)(v29 + 24);
      unint64_t v30 = *(void *)(v29 + 32);
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v132 = *(_OWORD *)v119;
      long long v133 = *(_OWORD *)&v119[16];
      uint64_t v134 = *(void *)&v119[32];
      swift_unknownObjectRetain();
      sub_24A4895D4(v12, (uint64_t)&v127);
      sub_24A496BE8(a1);
      uint64_t v31 = v127;
      unint64_t v30 = v128;
    }
    unint64_t v41 = sub_24A494C00((16 * (int)v8) & 0x4000 | ((unint64_t)v8 << 16) | (v8 >> 8) & 3 | 4, v31, v30);
    unint64_t v43 = v42;
    uint64_t v45 = v44;
    uint64_t v47 = v46;
    swift_bridgeObjectRelease();
    uint64_t v127 = v41;
    unint64_t v128 = v43;
    uint64_t v129 = v45;
    uint64_t v130 = v47;
    sub_24A491D60();
    sub_24A5BB6D0();
    swift_bridgeObjectRelease();
    swift_unknownObjectRetain();
    uint64_t v48 = sub_24A4980DC(v10, v12, v14);
    unint64_t v50 = v49;
    uint64_t v52 = v51;
    uint64_t result = sub_24A496BE8(v15);
    uint64_t v114 = v48;
    uint64_t v115 = v50;
    uint64_t v116 = v52;
    uint64_t v53 = v15;
    if (v50 < v112)
    {
      if (v48 == v10)
      {
        uint64_t v111 = *(void *)v119 + 24;
        uint64_t v101 = v15;
        uint64_t v105 = v10;
        while (1)
        {
          if (v52)
          {
            swift_bridgeObjectRetain();
          }
          else
          {
            uint64_t v127 = v28;
            unint64_t v128 = v109;
            uint64_t v129 = v108;
            uint64_t v130 = v107;
            uint64_t v131 = v106;
            swift_unknownObjectRetain();
            sub_24A4895D4(v50, (uint64_t)v120);
            sub_24A496BE8(v53);
          }
          sub_24A5BB6F0();
          uint64_t result = swift_bridgeObjectRelease();
          if (!v28
            || (int v54 = *(unsigned __int8 *)(v28 + 18),
                uint64_t v55 = *(unsigned __int16 *)(v28 + 16),
                swift_unknownObjectRetain_n(),
                sub_24A496BE8(v53),
                uint64_t result = sub_24A496BE8(v53),
                v50 >= (((-15 << ((4 * v54 + 8) & 0x3C)) - 1) & v54 | (unint64_t)(v55 << ((4 * v54 + 8) & 0x3C)))))
          {
            __break(1u);
LABEL_74:
            __break(1u);
LABEL_75:
            __break(1u);
LABEL_76:
            __break(1u);
LABEL_77:
            __break(1u);
LABEL_78:
            __break(1u);
LABEL_79:
            __break(1u);
LABEL_80:
            __break(1u);
LABEL_81:
            __break(1u);
            goto LABEL_82;
          }
          if (v52)
          {
            char v56 = (4 * *(unsigned char *)(v52 + 18) + 8) & 0x3C;
            unint64_t v57 = ((v50 >> v56) & 0xF) + 1;
            if (v57 < *(unsigned __int16 *)(v52 + 16)) {
              break;
            }
          }
          char v58 = (4 * *(unsigned char *)(v28 + 18) + 8) & 0x3C;
          uint64_t v59 = (v50 >> v58) & 0xF;
          if (*(unsigned char *)(v28 + 18))
          {
            uint64_t v60 = *(void *)(v111 + 40 * ((v50 >> v58) & 0xF));
            char v61 = (4 * *(unsigned char *)(v60 + 18) + 8) & 0x3C;
            uint64_t v62 = (v50 >> v61) & 0xF;
            if (*(unsigned char *)(v60 + 18))
            {
              uint64_t v63 = *(void *)(v60 + 24 + 40 * ((v50 >> v61) & 0xF));
              char v64 = (4 * *(unsigned char *)(v63 + 18) + 8) & 0x3C;
              uint64_t v65 = (v50 >> v64) & 0xF;
              if (*(unsigned char *)(v63 + 18))
              {
                uint64_t v104 = v60 + 24;
                uint64_t v110 = *(void *)(v111 + 40 * ((v50 >> v58) & 0xF));
                uint64_t v66 = *(void *)(v63 + 24 + 40 * ((v50 >> v64) & 0xF));
                int v67 = *(unsigned __int8 *)(v66 + 18);
                char v68 = (4 * v67 + 8) & 0x3C;
                v120[0] = (v50 >> v68) & 0xF;
                if (v67)
                {
                  uint64_t v69 = v63 + 24;
                  char v102 = v64;
                  char v103 = v61;
                  sub_24A497498(v53);
                  swift_unknownObjectRetain();
                  swift_unknownObjectRetain();
                  swift_unknownObjectRetain();
                  char v70 = sub_24A538E54(v66 + 24, v120, (uint64_t)&v114, v66, v67);
                  swift_unknownObjectRelease();
                  if (v70)
                  {
                    unint64_t v50 = v115;
                    uint64_t v53 = v101;
                    goto LABEL_49;
                  }
LABEL_46:
                  uint64_t v72 = v65 + 1;
                  if (v65 + 1 < (unint64_t)*(unsigned __int16 *)(v63 + 16))
                  {
                    uint64_t v73 = (long long *)(v69 + 40 * v72);
                    long long v75 = *v73;
                    long long v74 = v73[1];
                    uint64_t v126 = *((void *)v73 + 4);
                    v125[0] = v75;
                    v125[1] = v74;
                    uint64_t result = v75;
                    unsigned int v76 = *(unsigned __int8 *)(v75 + 18) + 1;
                    uint64_t v53 = v101;
                    if ((v76 >> 8)) {
                      goto LABEL_80;
                    }
                    uint64_t v115 = ((-256 << (4 * (v76 & 0xF))) | 0xFF) & (v115 & ((-15 << v102) - 1) | (v72 << v102));
                    unint64_t v50 = v115;
                    swift_unknownObjectRetain();
                    uint64_t v77 = sub_24A53852C(v50);
                    sub_24A496BE8((uint64_t)v125);
                    uint64_t v116 = v77;
                    goto LABEL_49;
                  }
                  swift_unknownObjectRelease();
                  uint64_t v53 = v101;
                  uint64_t v60 = v110;
LABEL_51:
                  uint64_t v78 = v62 + 1;
                  if (v62 + 1 < (unint64_t)*(unsigned __int16 *)(v60 + 16))
                  {
                    uint64_t v10 = v105;
                    unint64_t v79 = (long long *)(v104 + 40 * v78);
                    long long v81 = *v79;
                    long long v80 = v79[1];
                    uint64_t v124 = *((void *)v79 + 4);
                    v123[0] = v81;
                    v123[1] = v80;
                    uint64_t result = v81;
                    unsigned int v82 = *(unsigned __int8 *)(v81 + 18) + 1;
                    if ((v82 >> 8)) {
                      goto LABEL_79;
                    }
                    uint64_t v115 = ((-256 << (4 * (v82 & 0xF))) | 0xFF) & (v115 & ((-15 << v103) - 1) | (v78 << v103));
                    unint64_t v50 = v115;
                    swift_unknownObjectRetain();
                    uint64_t v83 = sub_24A53852C(v50);
                    sub_24A496BE8((uint64_t)v123);
                    uint64_t v116 = v83;
                    goto LABEL_54;
                  }
                  swift_unknownObjectRelease();
                  uint64_t v10 = v105;
LABEL_56:
                  uint64_t v84 = v59 + 1;
                  if (v59 + 1 >= (unint64_t)*(unsigned __int16 *)(v28 + 16))
                  {
                    sub_24A496BE8(v53);
LABEL_62:
                    int v90 = *(unsigned __int8 *)(v28 + 18);
                    uint64_t v91 = *(unsigned __int16 *)(v28 + 16);
                    swift_unknownObjectRetain();
                    sub_24A496BE8(v53);
                    uint64_t result = sub_24A496BE8(v53);
                    unint64_t v50 = ((-15 << ((4 * v90 + 8) & 0x3C)) - 1) & v90 | (unint64_t)(v91 << ((4 * v90 + 8) & 0x3C));
                    uint64_t v114 = v10;
                    uint64_t v115 = v50;
                    uint64_t v116 = 0;
                    goto LABEL_63;
                  }
                  uint64_t v85 = v111 + 40 * v84;
                  long long v87 = *(_OWORD *)v85;
                  long long v86 = *(_OWORD *)(v85 + 16);
                  uint64_t v122 = *(void *)(v85 + 32);
                  v121[0] = v87;
                  v121[1] = v86;
                  uint64_t result = v87;
                  unsigned int v88 = *(unsigned __int8 *)(v87 + 18) + 1;
                  if ((v88 >> 8)) {
                    goto LABEL_78;
                  }
                  uint64_t v115 = ((-256 << (4 * (v88 & 0xF))) | 0xFF) & (v115 & ((-15 << v58) - 1) | (v84 << v58));
                  unint64_t v50 = v115;
                  swift_unknownObjectRetain();
                  uint64_t v89 = sub_24A53852C(v50);
                  sub_24A496BE8((uint64_t)v121);
                  uint64_t v116 = v89;
                  goto LABEL_59;
                }
                unint64_t v71 = ((v50 >> v68) & 0xF) + 1;
                if (v71 >= *(unsigned __int16 *)(v66 + 16))
                {
                  uint64_t v69 = v63 + 24;
                  char v102 = v64;
                  char v103 = v61;
                  sub_24A497498(v53);
                  swift_unknownObjectRetain();
                  swift_unknownObjectRetain();
                  goto LABEL_46;
                }
                unint64_t v50 = (v71 << v68) | ((-15 << v68) - 1) & v50;
                uint64_t v115 = v50;
                uint64_t v116 = v66;
                sub_24A497498(v53);
                swift_unknownObjectRetain();
                swift_unknownObjectRetain();
LABEL_49:
                swift_unknownObjectRelease();
                uint64_t v10 = v105;
              }
              else
              {
                if (v65 + 1 >= (unint64_t)*(unsigned __int16 *)(v63 + 16))
                {
                  char v103 = (4 * *(unsigned char *)(v60 + 18) + 8) & 0x3C;
                  uint64_t v104 = v60 + 24;
                  sub_24A497498(v53);
                  swift_unknownObjectRetain();
                  goto LABEL_51;
                }
                unint64_t v50 = ((v65 + 1) << v64) | ((-15 << v64) - 1) & v50;
                uint64_t v115 = v50;
                uint64_t v116 = v63;
                sub_24A497498(v53);
                swift_unknownObjectRetain();
                uint64_t v10 = v105;
              }
LABEL_54:
              swift_unknownObjectRelease();
              goto LABEL_59;
            }
            if (v62 + 1 >= (unint64_t)*(unsigned __int16 *)(v60 + 16))
            {
              swift_unknownObjectRetain();
              uint64_t v10 = v105;
              goto LABEL_56;
            }
            unint64_t v50 = ((v62 + 1) << v61) | ((-15 << v61) - 1) & v50;
            uint64_t v115 = v50;
            uint64_t v116 = v60;
            swift_unknownObjectRetain();
            uint64_t v10 = v105;
LABEL_59:
            sub_24A496BE8(v53);
LABEL_60:
            uint64_t result = sub_24A496BE8(v53);
            goto LABEL_63;
          }
          if (v59 + 1 >= (unint64_t)*(unsigned __int16 *)(v28 + 16)) {
            goto LABEL_62;
          }
          unint64_t v50 = ((v59 + 1) << v58) | ((-15 << v58) - 1) & v50;
          uint64_t v115 = v50;
          uint64_t result = sub_24A496BE8(v53);
          uint64_t v116 = v28;
LABEL_63:
          if (v50 >= v112) {
            goto LABEL_66;
          }
          uint64_t v52 = v116;
          if (v114 != v10) {
            goto LABEL_65;
          }
        }
        unint64_t v50 = (v57 << v56) | ((-15 << v56) - 1) & v50;
        uint64_t v115 = v50;
        goto LABEL_60;
      }
LABEL_65:
      __break(1u);
    }
LABEL_66:
    if (v100 != v10) {
      goto LABEL_77;
    }
    if (v99)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      v120[0] = v28;
      v120[1] = v109;
      v120[2] = v108;
      v120[3] = v107;
      v120[4] = v106;
      swift_unknownObjectRetain();
      sub_24A4895D4(v112, (uint64_t)v113);
      sub_24A496BE8(v53);
    }
    uint64_t v15 = v53;
    uint64_t v92 = sub_24A5BB830();
    uint64_t v94 = v93;
    uint64_t v96 = v95;
    uint64_t v98 = v97;
    swift_bridgeObjectRelease();
    v113[0] = v92;
    v113[1] = v94;
    v113[2] = v96;
    v113[3] = v98;
    goto LABEL_71;
  }
LABEL_82:
  __break(1u);
  return result;
}

__n128 sub_24A59F504@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __n128 *a3@<X8>)
{
  unint64_t v30 = a3;
  uint64_t v5 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v29.n128_u64[0] = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v10 = (char *)&v28 - v9;
  uint64_t v11 = _s7BuilderVMa();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x263F8EE78];
  *(void *)uint64_t v13 = MEMORY[0x263F8EE78];
  *(_OWORD *)(v13 + 8) = 0u;
  *(_OWORD *)(v13 + 24) = 0u;
  *(_OWORD *)(v13 + 40) = 0u;
  *(_OWORD *)(v13 + 54) = 0u;
  *((void *)v13 + 9) = 0;
  *((void *)v13 + 10) = 0;
  *(void *)(v13 + 86) = 0;
  *((void *)v13 + 12) = v14;
  sub_24A5BC770();
  sub_24A5BC770();
  uint64_t v31 = 0;
  unint64_t v32 = 0xE000000000000000;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, a2);
  sub_24A5BB840();
  swift_getAssociatedConformanceWitness();
  sub_24A5BBEE0();
  uint64_t v15 = *((void *)&v33[0] + 1);
  if (*((void *)&v33[0] + 1))
  {
    uint64_t v16 = *(void *)&v33[0];
    do
    {
      MEMORY[0x24C5C6A00](v16, v15);
      swift_bridgeObjectRelease();
      if ((v32 & 0x1000000000000000) != 0)
      {
        if (sub_24A5BB710() < 124) {
          goto LABEL_3;
        }
      }
      else if ((v32 & 0x2000000000000000) != 0 || (v31 & 0xFFFFFFFFFFFFuLL) < 0x7C)
      {
        goto LABEL_3;
      }
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_24A5BB830();
      uint64_t v19 = v18;
      uint64_t v21 = v20;
      unint64_t v23 = v22;
      swift_bridgeObjectRelease();
      sub_24A56F284(v17, v19, v21, v23);
      swift_bridgeObjectRelease();
      uint64_t v31 = 0;
      unint64_t v32 = 0xE000000000000000;
LABEL_3:
      sub_24A5BBEE0();
      uint64_t v15 = *((void *)&v33[0] + 1);
      uint64_t v16 = *(void *)&v33[0];
    }
    while (*((void *)&v33[0] + 1));
  }
  (*(void (**)(char *, uint64_t))(v29.n128_u64[0] + 8))(v10, AssociatedTypeWitness);
  swift_bridgeObjectRetain();
  sub_24A56F8C8();
  sub_24A4EF384((uint64_t)v13, (uint64_t)v13);
  sub_24A491510((uint64_t *)v33);
  __n128 v28 = (__n128)v33[1];
  __n128 v29 = (__n128)v33[0];
  unint64_t v24 = v34;
  unint64_t v25 = v35;
  sub_24A491C88((uint64_t)v13, (uint64_t (*)(void))_s7BuilderVMa);
  swift_bridgeObjectRelease();
  unint64_t v26 = v30;
  __n128 result = v28;
  *unint64_t v30 = v29;
  v26[1] = result;
  v26[2].n128_u64[0] = v24;
  v26[2].n128_u64[1] = v25;
  return result;
}

__n128 sub_24A59F8DC@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __n128 *a3@<X8>)
{
  uint64_t v37 = a3;
  uint64_t v5 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v36.n128_u64[0] = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v10 = (char *)&v35 - v9;
  uint64_t v11 = _s7BuilderVMa();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x263F8EE78];
  *(void *)uint64_t v13 = MEMORY[0x263F8EE78];
  *(_OWORD *)(v13 + 8) = 0u;
  *(_OWORD *)(v13 + 24) = 0u;
  *(_OWORD *)(v13 + 40) = 0u;
  *(_OWORD *)(v13 + 54) = 0u;
  *((void *)v13 + 9) = 0;
  *((void *)v13 + 10) = 0;
  *(void *)(v13 + 86) = 0;
  *((void *)v13 + 12) = v14;
  sub_24A5BC770();
  sub_24A5BC770();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, a2);
  sub_24A5BB840();
  swift_getAssociatedConformanceWitness();
  sub_24A5BBEE0();
  if ((BYTE4(v38[0]) & 1) == 0)
  {
    uint64_t v26 = 0;
    unint64_t v27 = 0xE000000000000000;
    do
    {
      *(void *)&v38[0] = v26;
      *((void *)&v38[0] + 1) = v27;
      sub_24A5BB610();
      unint64_t v27 = *((void *)&v38[0] + 1);
      uint64_t v26 = *(void *)&v38[0];
      if ((*((void *)&v38[0] + 1) & 0x1000000000000000) != 0)
      {
        if (sub_24A5BB710() < 124) {
          goto LABEL_4;
        }
      }
      else if ((*((void *)&v38[0] + 1) & 0x2000000000000000) != 0 {
             || (*(void *)&v38[0] & 0xFFFFFFFFFFFFuLL) < 0x7C)
      }
      {
        goto LABEL_4;
      }
      swift_bridgeObjectRetain();
      uint64_t v28 = sub_24A5BB830();
      uint64_t v30 = v29;
      uint64_t v32 = v31;
      unint64_t v34 = v33;
      swift_bridgeObjectRelease();
      sub_24A56F284(v28, v30, v32, v34);
      swift_bridgeObjectRelease();
      uint64_t v26 = 0;
      unint64_t v27 = 0xE000000000000000;
LABEL_4:
      sub_24A5BBEE0();
    }
    while ((BYTE4(v38[0]) & 1) == 0);
  }
  (*(void (**)(char *, uint64_t))(v36.n128_u64[0] + 8))(v10, AssociatedTypeWitness);
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_24A5BB830();
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  unint64_t v21 = v20;
  swift_bridgeObjectRelease();
  sub_24A56F284(v15, v17, v19, v21);
  sub_24A4EF384((uint64_t)v13, (uint64_t)v13);
  sub_24A491510((uint64_t *)v38);
  __n128 v35 = (__n128)v38[1];
  __n128 v36 = (__n128)v38[0];
  unint64_t v22 = v39;
  unint64_t v23 = v40;
  sub_24A491C88((uint64_t)v13, (uint64_t (*)(void))_s7BuilderVMa);
  swift_bridgeObjectRelease();
  unint64_t v24 = v37;
  __n128 result = v35;
  *uint64_t v37 = v36;
  v24[1] = result;
  v24[2].n128_u64[0] = v22;
  v24[2].n128_u64[1] = v23;
  return result;
}

unint64_t sub_24A59FD14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v112 = a3;
  uint64_t v5 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v111 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = _s9_IngesterVMa();
  MEMORY[0x270FA5388](v118);
  uint64_t v9 = (uint64_t *)((char *)&v111 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v134 = MEMORY[0x263F8EE78];
  long long v135 = 0u;
  long long v136 = 0u;
  memset(v137, 0, 30);
  uint64_t v138 = 0;
  memset(v139, 0, 14);
  v139[2] = MEMORY[0x263F8EE78];
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, a2);
  sub_24A547644((uint64_t)v7, a2, v9);
  uint64_t v10 = 0;
  uint64_t v115 = v9;
  while (1)
  {
    uint64_t v11 = *v9;
    unint64_t v12 = v9[1];
    unint64_t v13 = v9[2];
    unint64_t v14 = v9[3];
    unint64_t v15 = v9[4];
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_24A5BBE80();
    swift_bridgeObjectRelease();
    uint64_t v17 = v16 - 124;
    if (v16 >= 379) {
      uint64_t v17 = 255;
    }
    if (v16 <= 255) {
      uint64_t v18 = v16;
    }
    else {
      uint64_t v18 = v17;
    }
    unint64_t v19 = sub_24A497C80(v15, v12, v18, v13, v14);
    if ((v21 & 1) != 0 || (v19 ^ v20) < 0x4000)
    {
      sub_24A491510((uint64_t *)v140);
      long long v132 = v140[0];
      long long v131 = v140[1];
      uint64_t v106 = (uint64_t)v9;
      uint64_t v107 = v141;
      uint64_t v108 = v142;
      sub_24A491C88(v106, (uint64_t (*)(void))_s9_IngesterVMa);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t result = swift_bridgeObjectRelease();
      uint64_t v109 = v112;
      long long v110 = v131;
      *unint64_t v112 = v132;
      v109[1] = v110;
      *((void *)v109 + 4) = v107;
      *((void *)v109 + 5) = v108;
      return result;
    }
    v9[4] = v20;
    unint64_t v122 = v19;
    uint64_t v121 = v20;
    unint64_t v124 = v13;
    unint64_t v123 = v14;
    unint64_t v22 = sub_24A5BBEC0();
    unint64_t v24 = v23;
    unint64_t v26 = v25;
    unint64_t v28 = v27;
    unint64_t v29 = sub_24A4913AC(v22, v23, v25, v27);
    *(void *)&long long v131 = v26;
    unint64_t result = sub_24A498004(v22, v24, v26, v28);
    *(void *)&long long v132 = v10;
    if ((v31 & 0x100) != 0) {
      break;
    }
    if ((v31 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      unint64_t v32 = sub_24A5BBE70();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      unint64_t v33 = sub_24A5BBE70();
      unint64_t result = swift_bridgeObjectRelease();
      unint64_t v34 = v33 >> 14;
      if (v33 >> 14 < v32 >> 14) {
        goto LABEL_164;
      }
      unint64_t v35 = v24 >> 14;
LABEL_68:
      if (v35 >= v34)
      {
        unint64_t v116 = v12;
        uint64_t v117 = v11;
        unint64_t v54 = sub_24A5BBEC0();
        unint64_t v56 = v55;
        uint64_t v58 = v57;
        unint64_t v60 = v59;
        unint64_t result = swift_bridgeObjectRelease();
        *(void *)&long long v131 = v32;
        uint64_t v90 = 1;
        while (1)
        {
          if ((v60 & 0x1000000000000000) != 0)
          {
            unint64_t v74 = v56 >> 14;
            if (v54 >> 14 >= v56 >> 14) {
              goto LABEL_129;
            }
            unint64_t v81 = v54 >> 14;
            uint64_t v82 = 4 << ((v58 & 0x800000000000000) != 0);
            uint64_t v83 = HIBYTE(v60) & 0xF;
            if ((v60 & 0x2000000000000000) == 0) {
              uint64_t v83 = v58 & 0xFFFFFFFFFFFFLL;
            }
            unint64_t v129 = v83;
            unint64_t v84 = v54;
            uint64_t v128 = v54 >> 14;
            uint64_t v130 = 4 << ((v58 & 0x800000000000000) != 0);
            while (1)
            {
              unint64_t v85 = v84 & 0xC;
              BOOL v86 = v85 == v82 || (v84 & 1) == 0;
              unint64_t v127 = v81;
              if (v86)
              {
                unint64_t v87 = v84;
                if (v85 == v82)
                {
                  unint64_t result = sub_24A4DFD84(v84, v58, v60);
                  unint64_t v85 = v84 & 0xC;
                  unint64_t v87 = result;
                }
                if (v129 <= v87 >> 16) {
                  goto LABEL_166;
                }
                uint64_t v126 = v85;
                if ((v87 & 1) == 0) {
                  sub_24A4971A8(v87, v58, v60);
                }
                unint64_t v88 = sub_24A5BB5D0();
                unint64_t result = v84;
                if (v126 == v130) {
                  unint64_t result = sub_24A4DFD84(v84, v58, v60);
                }
                if (result >> 14 < v128 || result >> 14 >= v74) {
                  goto LABEL_167;
                }
                if ((result & 1) == 0) {
                  sub_24A4971A8(result, v58, v60);
                }
              }
              else
              {
                if (v129 <= v84 >> 16) {
                  goto LABEL_168;
                }
                unint64_t result = sub_24A5BB5D0();
                if (v84 >> 14 < v128) {
                  goto LABEL_169;
                }
                unint64_t v88 = result;
                unint64_t result = v84;
                if (v84 >> 14 >= v74) {
                  goto LABEL_169;
                }
              }
              sub_24A5BC060();
              unint64_t result = sub_24A5BC760();
              unint64_t v75 = v88 >> 14;
              if (result) {
                break;
              }
              unint64_t v84 = v88;
              unint64_t v81 = v88 >> 14;
              uint64_t v82 = v130;
              if (v75 >= v74) {
                goto LABEL_129;
              }
            }
            if (v75 < v127) {
              goto LABEL_170;
            }
          }
          else
          {
            if ((v60 & 0x2000000000000000) != 0)
            {
              *(void *)&v140[0] = v58;
              *((void *)&v140[0] + 1) = v60 & 0xFFFFFFFFFFFFFFLL;
              uint64_t v62 = v140;
              unint64_t v63 = v54;
              unint64_t v64 = v56;
              unint64_t v65 = v58;
              unint64_t v66 = v60;
              uint64_t v61 = v132;
            }
            else
            {
              uint64_t v61 = v132;
              if ((v58 & 0x1000000000000000) != 0) {
                uint64_t v62 = (_OWORD *)((v60 & 0xFFFFFFFFFFFFFFFLL) + 32);
              }
              else {
                uint64_t v62 = (_OWORD *)sub_24A5BC120();
              }
              unint64_t v63 = v54;
              unint64_t v64 = v56;
              unint64_t v65 = v58;
              unint64_t v66 = v60;
            }
            uint64_t v67 = sub_24A497AA0((uint64_t)v62, v63, v64, v65, v66);
            uint64_t v69 = v68;
            char v133 = v70 & 1;
            *(void *)&long long v132 = v61;
            if (v70)
            {
LABEL_129:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRetain();
              unint64_t v29 = sub_24A5BBE80();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRetain();
              uint64_t v130 = sub_24A5BBE80();
              swift_bridgeObjectRelease();
              unint64_t v22 = sub_24A5BBEC0();
              unint64_t v28 = v89;
              goto LABEL_130;
            }
            unint64_t result = v54;
            if ((v54 & 0xC) == 8)
            {
              unint64_t result = sub_24A4DFD84(v54, v58, v60);
              unint64_t v71 = v67 + (result >> 16);
              if (__OFADD__(v67, result >> 16))
              {
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
LABEL_154:
                __break(1u);
LABEL_155:
                __break(1u);
                goto LABEL_156;
              }
            }
            else
            {
              unint64_t v71 = v67 + (v54 >> 16);
              if (__OFADD__(v67, v54 >> 16)) {
                goto LABEL_142;
              }
            }
            if ((v71 & 0x8000000000000000) != 0) {
              goto LABEL_143;
            }
            if ((v60 & 0x2000000000000000) != 0) {
              unint64_t v72 = HIBYTE(v60) & 0xF;
            }
            else {
              unint64_t v72 = v58 & 0xFFFFFFFFFFFFLL;
            }
            if (v72 < v71) {
              goto LABEL_144;
            }
            unint64_t result = v54;
            if ((v54 & 0xC) == 8)
            {
              unint64_t result = sub_24A4DFD84(v54, v58, v60);
              unint64_t v73 = v69 + (result >> 16);
              if (__OFADD__(v69, result >> 16)) {
                goto LABEL_145;
              }
            }
            else
            {
              unint64_t v73 = v69 + (v54 >> 16);
              if (__OFADD__(v69, v54 >> 16)) {
                goto LABEL_145;
              }
            }
            if ((v73 & 0x8000000000000000) != 0) {
              goto LABEL_146;
            }
            if (v72 < v73) {
              goto LABEL_147;
            }
            if (v73 < v71) {
              goto LABEL_148;
            }
            unint64_t v74 = v56 >> 14;
            unint64_t v75 = 4 * v73;
          }
          if (v74 < v75) {
            goto LABEL_149;
          }
          unint64_t v54 = sub_24A5BBEC0();
          unint64_t v56 = v76;
          uint64_t v58 = v77;
          unint64_t v79 = v78;
          unint64_t result = swift_bridgeObjectRelease();
          unint64_t v60 = v79;
          if (__OFADD__(v90++, 1)) {
            goto LABEL_150;
          }
        }
      }
      goto LABEL_163;
    }
    uint64_t v90 = 0;
    uint64_t v130 = v29;
    unint64_t v37 = v24;
LABEL_65:
    uint64_t v38 = v131;
LABEL_130:
    uint64_t v91 = MEMORY[0x24C5C68C0](v22, v37, v38, v28);
    unint64_t v93 = v92;
    uint64_t v128 = v29;
    if ((v92 & 0x1000000000000000) != 0)
    {
      uint64_t v91 = sub_24A49279C();
      unint64_t v105 = v104;
      swift_bridgeObjectRelease();
      unint64_t v93 = v105;
    }
    swift_bridgeObjectRetain();
    unint64_t v94 = sub_24A5BB830();
    unint64_t v96 = v95;
    unint64_t v98 = v97;
    unint64_t v100 = v99;
    swift_bridgeObjectRelease();
    unint64_t result = sub_24A4913AC(v94, v96, v98, v100);
    if ((uint64_t)result > 255) {
      goto LABEL_155;
    }
    int64_t v101 = sub_24A4913AC(v94, v96, v98, v100);
    uint64_t v102 = sub_24A5BB7C0();
    int64_t v103 = sub_24A491A60(v94, v96, v98, v100);
    swift_bridgeObjectRelease();
    unint64_t result = swift_bridgeObjectRelease();
    if (v101 > 255)
    {
LABEL_156:
      __break(1u);
LABEL_157:
      __break(1u);
LABEL_158:
      __break(1u);
LABEL_159:
      __break(1u);
LABEL_160:
      __break(1u);
LABEL_161:
      __break(1u);
LABEL_162:
      __break(1u);
LABEL_163:
      __break(1u);
LABEL_164:
      __break(1u);
      goto LABEL_165;
    }
    if (v102 > 255) {
      goto LABEL_157;
    }
    if (v103 > 255) {
      goto LABEL_158;
    }
    if (v90 > 255) {
      goto LABEL_159;
    }
    if (v128 > 255) {
      goto LABEL_160;
    }
    if ((v128 | v90 | v130 | v101 | v102 | v103) < 0) {
      goto LABEL_161;
    }
    if (v130 > 255) {
      goto LABEL_162;
    }
    unint64_t v125 = (v90 << 24) | v125 & 0xFFFF000000000000 | ((unint64_t)v128 << 32) & 0xFFFF00FFFFFF0000 | ((unint64_t)v130 << 40) | v101 | ((unint64_t)v102 << 8) | ((unint64_t)v103 << 16);
    sub_24A494F18(v91, v93, v125);
    uint64_t v9 = v115;
    uint64_t v10 = v132;
  }
  unint64_t v36 = v22 >> 14;
  unint64_t v35 = v24 >> 14;
  unint64_t v37 = v24;
  if (v22 >> 14 >= v24 >> 14)
  {
    uint64_t v90 = 0;
    uint64_t v130 = v29;
    goto LABEL_65;
  }
  unint64_t v113 = v24;
  uint64_t v128 = v29;
  unint64_t v116 = v12;
  uint64_t v117 = v11;
  uint64_t v38 = v131;
  unint64_t v39 = ((unint64_t)v131 >> 59) & 1;
  if ((v28 & 0x1000000000000000) == 0) {
    LOBYTE(v39) = 1;
  }
  uint64_t v40 = 4 << v39;
  uint64_t v41 = HIBYTE(v28) & 0xF;
  uint64_t v120 = v41;
  uint64_t v119 = v131 & 0xFFFFFFFFFFFFLL;
  if ((v28 & 0x2000000000000000) == 0) {
    uint64_t v41 = v131 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v130 = v41;
  unint64_t v127 = v28 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v126 = (v28 & 0xFFFFFFFFFFFFFFFLL) + 32;
  unint64_t v114 = v22;
  unint64_t v42 = v22;
  unint64_t v129 = v22 >> 14;
  while (1)
  {
    unint64_t v43 = v42 & 0xC;
    BOOL v44 = (v42 & 1) == 0 || v43 == v40;
    BOOL v45 = v44;
    unint64_t v46 = v42;
    if (v44)
    {
      if (v43 == v40)
      {
        unint64_t result = sub_24A4DFD84(v42, v38, v28);
        uint64_t v38 = v131;
        unint64_t v42 = result;
      }
      if (v130 <= v42 >> 16) {
        goto LABEL_151;
      }
      if ((v42 & 1) == 0)
      {
        unint64_t result = sub_24A4971A8(v42, v38, v28);
        uint64_t v38 = v131;
        unint64_t v42 = v42 & 0xC | result & 0xFFFFFFFFFFFFFFF3 | 1;
      }
    }
    else if (v130 <= v42 >> 16)
    {
      goto LABEL_152;
    }
    if ((v28 & 0x1000000000000000) != 0)
    {
      unint64_t result = sub_24A5BB5D0();
      unint64_t v42 = result;
    }
    else
    {
      unint64_t v47 = v42 >> 16;
      if ((v28 & 0x2000000000000000) != 0)
      {
        *(void *)&v140[0] = v38;
        *((void *)&v140[0] + 1) = v127;
        int v48 = *((unsigned __int8 *)v140 + v47);
      }
      else
      {
        unint64_t result = v126;
        if ((v38 & 0x1000000000000000) == 0) {
          unint64_t result = sub_24A5BC120();
        }
        int v48 = *(unsigned __int8 *)(result + v47);
      }
      int v49 = (char)v48;
      unsigned int v50 = __clz(v48 ^ 0xFF) - 24;
      if (v49 >= 0) {
        LOBYTE(v50) = 1;
      }
      unint64_t v42 = ((v47 + v50) << 16) | 5;
    }
    unint64_t v51 = v129;
    if (v45)
    {
      unint64_t result = v46;
      uint64_t v52 = v131;
      if (v43 == v40)
      {
        unint64_t result = sub_24A4DFD84(v46, v131, v28);
        uint64_t v52 = v131;
      }
      if (result >> 14 < v51 || result >> 14 >= v35) {
        goto LABEL_153;
      }
      if ((result & 1) == 0)
      {
        sub_24A4971A8(result, v52, v28);
        uint64_t v52 = v131;
      }
    }
    else
    {
      uint64_t v52 = v131;
      if (v46 >> 14 < v129) {
        goto LABEL_154;
      }
      unint64_t result = v46;
      if (v46 >> 14 >= v35) {
        goto LABEL_154;
      }
    }
    if ((v28 & 0x1000000000000000) != 0)
    {
      sub_24A5BC060();
    }
    else
    {
      if ((v28 & 0x2000000000000000) != 0)
      {
        *(void *)&v140[0] = v52;
        *((void *)&v140[0] + 1) = v127;
        swift_bridgeObjectRetain();
      }
      else
      {
        if ((v52 & 0x1000000000000000) == 0) {
          sub_24A5BC120();
        }
        swift_bridgeObjectRetain();
      }
      sub_24A5BC130();
      swift_bridgeObjectRelease();
    }
    unint64_t result = sub_24A5BC760();
    unint64_t v34 = v42 >> 14;
    if (result) {
      break;
    }
    unint64_t v36 = v42 >> 14;
    uint64_t v38 = v131;
    if (v34 >= v35)
    {
      uint64_t v90 = 0;
      unint64_t v29 = v128;
      uint64_t v130 = v128;
      unint64_t v22 = v114;
      unint64_t v37 = v113;
      goto LABEL_130;
    }
  }
  BOOL v53 = v34 >= v36;
  uint64_t v11 = v117;
  unint64_t v12 = v116;
  unint64_t v32 = v46;
  if (v53) {
    goto LABEL_68;
  }
LABEL_165:
  __break(1u);
LABEL_166:
  __break(1u);
LABEL_167:
  __break(1u);
LABEL_168:
  __break(1u);
LABEL_169:
  __break(1u);
LABEL_170:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for BigString()
{
  return &type metadata for BigString;
}

uint64_t _HashNode.subtracting<A>(_:_:)(unsigned int a1, uint64_t a2, void (*a3)(uint64_t, unsigned char *, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v34 = a5;
  uint64_t v35 = a8;
  unint64_t v32 = a3;
  uint64_t v33 = a4;
  uint64_t v31 = a2;
  unsigned int v30 = a1;
  uint64_t v11 = type metadata accessor for _HashNode.Builder();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  unint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  unint64_t v29 = (char *)&v28 - v16;
  uint64_t v17 = sub_24A5BBD20();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  char v21 = (char *)&v28 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  unint64_t v23 = (char *)&v28 - v22;
  _HashNode._subtracting<A>(_:_:)(v30, v31, v32, v33, v34, a6, a7, v35, (unsigned char *)&v28 - v22, a9);
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v21, v23, v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v21, 1, v11) == 1)
  {
    unint64_t v24 = *(void (**)(char *, uint64_t))(v18 + 8);
    v24(v23, v17);
    v24(v21, v17);
    return 0;
  }
  else
  {
    unint64_t v26 = v29;
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v29, v21, v11);
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v26, v11);
    uint64_t v25 = sub_24A5566C8(v11);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v26, v11);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v23, v17);
  }
  return v25;
}

uint64_t _HashNode._subtracting<A>(_:_:)@<X0>(unsigned int a1@<W0>, uint64_t a2@<X1>, void (*a3)(uint64_t, unsigned char *, uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, unsigned char *a9@<X8>, uint64_t a10)
{
  uint64_t v30 = a8;
  uint64_t v18 = type metadata accessor for _HashNode.Builder.Kind();
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v28 - v19;
  if (a4 == a2)
  {
    swift_storeEnumTagMultiPayload();
    _HashNode.Builder.init(_:_:)(a1, (uint64_t)v20, a9);
    uint64_t v25 = type metadata accessor for _HashNode.Builder();
    return (*(uint64_t (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(a9, 0, 1, v25);
  }
  else
  {
    uint64_t v29 = a5;
    BOOL v21 = _HashNode.isCollisionNode.getter(a4, a5, a6, a7, a10);
    uint64_t v22 = v30;
    if (v21 || _HashNode.isCollisionNode.getter(a2, (uint64_t)a3, a6, v30, a10))
    {
      uint64_t v23 = v29;
      return _HashNode._subtracting_slow<A>(_:_:)(a1, a2, a3, a4, v23, a6, a7, v22, (uint64_t)a9, a10);
    }
    else
    {
      unint64_t v26 = (unsigned int *)nullsub_1(a4 + 16, a4 + 32, a6, a7, a10);
      return sub_24A5A1190(v26, v27, a2, a1, a6, (uint64_t)a9, a7, v22, a10);
    }
  }
}

uint64_t _HashNode._subtracting_slow<A>(_:_:)@<X0>(unsigned int a1@<W0>, uint64_t a2@<X1>, void (*a3)(uint64_t, unsigned char *, uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  BOOL v17 = _HashNode.isCollisionNode.getter(a4, a5, a6, a7, a10);
  BOOL v18 = _HashNode.isCollisionNode.getter(a2, (uint64_t)a3, a6, a8, a10);
  uint64_t v19 = (int *)nullsub_1(a4 + 16, a4 + 32, a6, a7, a10);
  if (!v17) {
    return sub_24A5A2EC8(v19, (uint64_t)v20, a2, a3, a1, a4, a5, a6, a9, a7, a8, a10);
  }
  if (!v18) {
    return sub_24A5A2894((uint64_t)v19, v20, a2, a1, a4, a5, a6, a9, a7, a8, a10);
  }
  BOOL v21 = v19;
  uint64_t v22 = v20;
  uint64_t v23 = nullsub_1(a2 + 16, a2 + 32, a6, a8, a10);
  return sub_24A5A228C(v23, v24, v21, v22, a1, a6, a9, a7, a8, a10);
}

uint64_t sub_24A5A1190@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned int a4@<W4>, uint64_t a5@<X7>, uint64_t a6@<X8>, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v14 = (_DWORD *)nullsub_1(a3 + 16, a3 + 32, a5, a8, a9);
  return sub_24A5A123C(v14, v15, a4, a1, a2, a5, a6, a7, a8, a9);
}

uint64_t sub_24A5A123C@<X0>(_DWORD *a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, unsigned int *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v184 = a5;
  unsigned int v173 = a3;
  uint64_t v181 = a2;
  uint64_t v143 = a7;
  uint64_t v13 = a10;
  uint64_t v180 = a9;
  uint64_t v14 = a8;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v16 = type metadata accessor for _HashNode.Builder();
  uint64_t v162 = swift_getTupleTypeMetadata2();
  uint64_t v151 = sub_24A5BBD20();
  v157 = *(void (***)(void, void))(v151 - 8);
  MEMORY[0x270FA5388](v151);
  uint64_t v175 = (uint64_t)&v142 - v17;
  uint64_t v167 = sub_24A5BBD20();
  uint64_t v156 = *(void *)(v167 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v167 - 8);
  uint64_t v147 = (char *)&v142 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v146 = (char *)&v142 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v161 = (char *)&v142 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v160 = (char *)&v142 - v25;
  uint64_t v155 = TupleTypeMetadata2;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  v159 = (void (**)(char *, uint64_t, uint64_t, uint64_t))((char *)&v142 - v27);
  uint64_t v28 = *(void *)(a6 - 8);
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  v170 = (char *)&v142 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  v174 = (char *)&v142 - v31;
  uint64_t v32 = type metadata accessor for _HashNode.Builder.Kind();
  uint64_t v33 = MEMORY[0x270FA5388](v32);
  uint64_t v35 = (char *)&v142 - v34;
  uint64_t v144 = *(void *)(v16 - 8);
  uint64_t v36 = MEMORY[0x270FA5388](v33);
  v145 = (char *)&v142 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  v154 = (char *)&v142 - v39;
  uint64_t v40 = MEMORY[0x270FA5388](v38);
  v150 = (char *)&v142 - v41;
  MEMORY[0x270FA5388](v40);
  unint64_t v43 = (char *)&v142 - v42;
  swift_storeEnumTagMultiPayload();
  v172 = v43;
  uint64_t v186 = a6;
  _HashNode.Builder.init(_:_:)(v173, (uint64_t)v35, v43);
  unsigned int v45 = *a4;
  uint64_t v169 = v16;
  v185 = a4;
  v179 = a1;
  uint64_t v182 = a10;
  uint64_t v183 = a8;
  if (v45)
  {
    int v46 = 0;
    unsigned int v47 = 0;
    v176 = (void (**)(char *, uint64_t, uint64_t))(v28 + 16);
    v153 = (void (**)(char *, char *, uint64_t))v28;
    v171 = (unsigned int (***)(char *, uint64_t, uint64_t))(v28 + 8);
    unsigned int v168 = v173 + 5;
    v158 = (void (**)(char *, uint64_t, uint64_t))(a8 - 8);
    while (1)
    {
      unsigned int v48 = __clz(__rbit32(v45));
      v45 &= v45 - 1;
      uint64_t v49 = _HashNode.UnsafeHandle.itemPtr(at:)(v47, (uint64_t)v185, v184);
      int v50 = *a1;
      int v51 = 1 << v48;
      LODWORD(v178) = v48;
      uint64_t v177 = v49;
      if (((1 << v48) & v50) != 0) {
        break;
      }
      int v63 = a1[1];
      if ((v63 & v51) != 0)
      {
        HIDWORD(v178) = v47;
        v44.i32[0] = v63 & (v51 - 1);
        uint8x8_t v64 = (uint8x8_t)vcnt_s8(v44);
        v64.i16[0] = vaddlv_u8(v64);
        uint64_t v65 = v64.u32[0];
        unint64_t v66 = a1;
        LODWORD(v166) = v46;
        unint64_t v55 = *v176;
        uint64_t v67 = (uint64_t)v174;
        uint64_t v68 = v49;
        uint64_t v69 = v186;
        (*v176)(v174, v49, v186);
        uint64_t v70 = v182;
        v164 = (void (**)(char *, uint64_t))sub_24A5B85E4();
        v165 = *v171;
        ((void (*)(uint64_t, uint64_t))v165)(v67, v69);
        uint64_t v71 = v65;
        uint64_t v72 = v180;
        unint64_t v73 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v71, v66, v181, v69, v180, v70);
        uint64_t v74 = *v73;
        v163 = (void (**)(char *, uint64_t, uint64_t))v73[1];
        v55((char *)v67, v68, v69);
        char v56 = (char)v166;
        swift_retain();
        LOBYTE(v72) = _HashNode.containsKey(_:_:_:)(v168, v67, (uint64_t)v164, v74, (uint64_t)v163, v69, v72, v70);
        swift_release();
        ((void (*)(uint64_t, uint64_t))v165)(v67, v69);
        if ((v72 & 1) == 0) {
          goto LABEL_12;
        }
LABEL_7:
        if (v56)
        {
          if (!v45) {
            goto LABEL_23;
          }
        }
        else
        {
          _HashNode.Builder.copyItems(_:from:upTo:)(v173, v185, v184, v178, v169);
          if (!v45) {
            goto LABEL_23;
          }
        }
        int v46 = 1;
        a1 = v179;
        uint64_t v13 = v182;
        unsigned int v47 = HIDWORD(v178) + 1;
      }
      else
      {
        if (v46)
        {
          unint64_t v55 = *v176;
          goto LABEL_17;
        }
        if (!v45)
        {
          unsigned int v79 = v185[1];
          uint64_t v16 = v169;
LABEL_29:
          uint64_t v13 = v182;
          uint64_t v14 = v183;
          unint64_t v81 = v157;
          if (v79)
          {
            int v80 = 0;
LABEL_31:
            uint64_t v82 = v156;
            uint64_t v83 = v153;
LABEL_32:
            uint64_t v84 = 0;
            v158 = (void (**)(char *, uint64_t, uint64_t))(v83 + 2);
            v157 = (void (**)(void, void))(v83 + 1);
            uint64_t v156 = v162 - 8;
            v163 = (void (**)(char *, uint64_t, uint64_t))(v144 + 32);
            v159 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v144 + 56);
            uint64_t v149 = v14 - 8;
            uint64_t v148 = v81 + 1;
            v165 = (unsigned int (**)(char *, uint64_t, uint64_t))(v144 + 48);
            v166 = (void (**)(char *, char *, uint64_t))(v82 + 16);
            v153 = (void (**)(char *, char *, uint64_t))(v144 + 16);
            v152 = (void (**)(char *, uint64_t))(v144 + 8);
            v164 = (void (**)(char *, uint64_t))(v82 + 8);
            while (2)
            {
              while (2)
              {
                unsigned int v88 = __clz(__rbit32(v79));
                v79 &= v79 - 1;
                int v89 = *a1;
                int v90 = 1 << v88;
                LODWORD(v176) = v88;
                if (((1 << v88) & v89) != 0)
                {
                  HIDWORD(v178) = v79;
                  LODWORD(v177) = v80;
                  v44.i32[0] = (v90 - 1) & v89;
                  uint8x8_t v91 = (uint8x8_t)vcnt_s8(v44);
                  v91.i16[0] = vaddlv_u8(v91);
                  uint64_t v92 = v186;
                  uint64_t v93 = _HashNode.UnsafeHandle.itemPtr(at:)(v91.u32[0], (uint64_t)a1, v181);
                  unint64_t v94 = *v158;
                  uint64_t v95 = (uint64_t)v174;
                  (*v158)(v174, v93, v92);
                  v170 = (char *)sub_24A5B85E4();
                  v171 = (unsigned int (***)(char *, uint64_t, uint64_t))*v157;
                  ((void (*)(uint64_t, uint64_t))v171)(v95, v92);
                  LODWORD(v178) = v84;
                  uint64_t v96 = v84;
                  uint64_t v97 = v183;
                  unint64_t v98 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v96, v185, v184, v92, v183, v13);
                  uint64_t v99 = *v98;
                  unint64_t v100 = (char *)v98[1];
                  v94((char *)v95, v93, v92);
                  swift_retain();
                  uint64_t v101 = v175;
                  uint64_t v102 = v100;
                  uint64_t v13 = v182;
                  _HashNode.removing(_:_:_:)(v168, v95, (uint64_t)v170, v99, v102, v92, v97, v182, v175);
                  swift_release();
                  uint64_t v103 = v92;
                  unint64_t v104 = v171;
                  ((void (*)(uint64_t, uint64_t))v171)(v95, v103);
                  uint64_t v105 = v162;
                  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v162 - 8) + 48))(v101, 1, v162) == 1)
                  {
                    (*v148)(v101, v151);
                    uint64_t v106 = v160;
                    uint64_t v16 = v169;
                    (*v159)(v160, 1, 1, v169);
                  }
                  else
                  {
                    uint64_t v127 = v175 + *(int *)(v155 + 48);
                    uint64_t v128 = v175 + *(int *)(v105 + 48);
                    unint64_t v129 = v160;
                    uint64_t v16 = v169;
                    (*v163)(v160, v128, v169);
                    (*v159)(v129, 0, 1, v16);
                    (*(void (**)(uint64_t, uint64_t))(*(void *)(v97 - 8) + 8))(v127, v97);
                    ((void (*)(uint64_t, uint64_t))v104)(v175, v186);
                    uint64_t v106 = v129;
                  }
                  uint64_t v84 = v167;
                  uint64_t v130 = v161;
                  (*v166)(v161, v106, v167);
                  if ((*v165)(v130, 1, v16) != 1)
                  {
                    long long v132 = v150;
                    (*v163)(v150, (uint64_t)v130, v16);
LABEL_51:
                    uint64_t v133 = v173;
                    int v134 = (int)v176;
                    if ((v177 & 1) == 0) {
                      _HashNode.Builder.copyItemsAndChildren(_:from:upTo:)(v173, v185, v184, v176, v16);
                    }
                    uint64_t v135 = v16;
                    long long v136 = v154;
                    (*v153)(v154, v132, v135);
                    uint64_t v137 = (uint64_t)v136;
                    uint64_t v16 = v135;
                    _HashNode.Builder.addNewChildBranch(_:_:at:)(v133, v137, v134, v135);
                    (*v152)(v132, v135);
                    (*v164)(v106, v84);
                    a1 = v179;
                    uint64_t v13 = v182;
                    LODWORD(v84) = v178;
                    unsigned int v79 = HIDWORD(v178);
                    if (!HIDWORD(v178)) {
                      goto LABEL_54;
                    }
LABEL_34:
                    int v80 = 1;
                    uint64_t v84 = (v84 + 1);
                    continue;
                  }
                  long long v131 = *v164;
                  (*v164)(v106, v84);
                  v131(v130, v84);
                  a1 = v179;
LABEL_44:
                  uint64_t v84 = v178;
                  unsigned int v79 = HIDWORD(v178);
                  if (v177) {
                    goto LABEL_33;
                  }
                }
                else
                {
                  int v107 = a1[1];
                  if ((v107 & v90) != 0)
                  {
                    LODWORD(v177) = v80;
                    unint64_t v178 = __PAIR64__(v79, v84);
                    v44.i32[0] = v107 & (v90 - 1);
                    uint8x8_t v108 = (uint8x8_t)vcnt_s8(v44);
                    v108.i16[0] = vaddlv_u8(v108);
                    uint64_t v109 = v108.u32[0];
                    uint64_t v110 = v84;
                    uint64_t v111 = v186;
                    uint64_t v112 = v183;
                    unint64_t v113 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v110, v185, v184, v186, v183, v13);
                    uint64_t v114 = *v113;
                    uint64_t v115 = v113[1];
                    uint64_t v116 = v16;
                    uint64_t v117 = v180;
                    uint64_t v118 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v109, a1, v181, v111, v180, v13);
                    uint64_t v119 = *v118;
                    uint64_t v120 = v118[1];
                    swift_retain();
                    swift_retain();
                    uint64_t v121 = v115;
                    unint64_t v122 = v146;
                    uint64_t v123 = v112;
                    uint64_t v84 = v167;
                    uint64_t v124 = v117;
                    uint64_t v16 = v116;
                    _HashNode._subtracting<A>(_:_:)(v168, v119, v120, v114, v121, v111, v123, v124, v13);
                    swift_release();
                    swift_release();
                    unint64_t v125 = v147;
                    (*v166)(v147, v122, v84);
                    if ((*v165)(v125, 1, v116) != 1)
                    {
                      long long v132 = v145;
                      (*v163)(v145, (uint64_t)v125, v116);
                      uint64_t v106 = v122;
                      goto LABEL_51;
                    }
                    uint64_t v126 = *v164;
                    (*v164)(v122, v84);
                    v126(v125, v84);
                    goto LABEL_44;
                  }
                  if (v80)
                  {
LABEL_33:
                    unint64_t v85 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v84, v185, v184, v186, v183, v13);
                    uint64_t v87 = *v85;
                    uint64_t v86 = v85[1];
                    swift_retain();
                    _HashNode.Builder.addNewChildNode(_:_:at:)(v173, v87, v86, (int)v176, v16);
                    if (!v79) {
                      goto LABEL_54;
                    }
                    goto LABEL_34;
                  }
                }
                break;
              }
              if (!v79) {
                goto LABEL_55;
              }
              int v80 = 0;
              uint64_t v84 = (v84 + 1);
              continue;
            }
          }
          goto LABEL_55;
        }
        int v46 = 0;
LABEL_20:
        uint64_t v13 = v182;
        ++v47;
      }
    }
    HIDWORD(v178) = v47;
    v44.i32[0] = (v51 - 1) & v50;
    uint8x8_t v52 = (uint8x8_t)vcnt_s8(v44);
    v52.i16[0] = vaddlv_u8(v52);
    uint64_t v53 = v52.u32[0];
    unint64_t v54 = a1;
    unint64_t v55 = *v176;
    char v56 = v46;
    uint64_t v57 = v174;
    uint64_t v58 = v186;
    (*v176)(v174, v49, v186);
    uint64_t v59 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(v53, v54, v181, v58, v180, v13);
    uint64_t v60 = (uint64_t)v170;
    v55(v170, v59, v58);
    char v61 = sub_24A5BB530();
    uint64_t v62 = *v171;
    ((void (*)(uint64_t, uint64_t))*v171)(v60, v58);
    ((void (*)(char *, uint64_t))v62)(v57, v58);
    if (v61) {
      goto LABEL_7;
    }
LABEL_12:
    unsigned int v47 = HIDWORD(v178);
    if (v56)
    {
LABEL_17:
      uint64_t v75 = *(int *)(v155 + 48);
      uint64_t v76 = (uint64_t)v159;
      uint64_t v77 = (uint64_t)v159 + v75;
      uint64_t v78 = v177 + v75;
      ((void (*)(void (**)(char *, uint64_t, uint64_t, uint64_t)))v55)(v159);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v183 - 8) + 16))(v77, v78);
      _HashNode.Builder.addNewItem(_:_:at:)(v173, v76, v77, v178, v169);
      if (!v45)
      {
LABEL_23:
        unsigned int v79 = v185[1];
        uint64_t v16 = v169;
        a1 = v179;
        uint64_t v13 = v182;
        uint64_t v14 = v183;
        if (v79)
        {
          int v80 = 1;
          unint64_t v81 = v157;
          goto LABEL_31;
        }
LABEL_54:
        uint64_t v138 = v144;
        uint64_t v139 = v143;
        (*(void (**)(uint64_t, unsigned char *, uint64_t))(v144 + 32))(v143, v172, v16);
        uint64_t v140 = 0;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v138 + 56))(v139, v140, 1, v16);
      }
      int v46 = 1;
    }
    else
    {
      if (!v45)
      {
        unsigned int v79 = v185[1];
        uint64_t v16 = v169;
        a1 = v179;
        goto LABEL_29;
      }
      int v46 = 0;
    }
    a1 = v179;
    goto LABEL_20;
  }
  unsigned int v79 = v185[1];
  unint64_t v81 = v157;
  if (v79)
  {
    int v80 = 0;
    unsigned int v168 = v173 + 5;
    uint64_t v82 = v156;
    uint64_t v83 = (void (**)(char *, char *, uint64_t))v28;
    goto LABEL_32;
  }
LABEL_55:
  uint64_t v138 = v144;
  (*(void (**)(unsigned char *, uint64_t))(v144 + 8))(v172, v16);
  uint64_t v140 = 1;
  uint64_t v139 = v143;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v138 + 56))(v139, v140, 1, v16);
}

uint64_t sub_24A5A228C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, __int32 *a3@<X2>, unint64_t *a4@<X3>, unsigned int a5@<W4>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10)
{
  unsigned int v52 = a5;
  uint64_t v62 = a1;
  uint64_t v47 = a7;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x270FA5388](TupleTypeMetadata2);
  int v50 = (char *)&v45 - v14;
  uint64_t v15 = type metadata accessor for _HashNode.Builder.Kind();
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v45 - v16;
  uint64_t v18 = type metadata accessor for _HashNode.Builder();
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v45 - v21;
  int v63 = a4;
  unint64_t v23 = *a4;
  unint64_t v66 = a2;
  if (v23 != *a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 56))(v47, 1, 1);
  }
  uint64_t v46 = v20;
  uint64_t v54 = v19;
  uint64_t v24 = v22;
  swift_storeEnumTagMultiPayload();
  uint64_t v53 = v24;
  _HashNode.Builder.init(_:_:)(v52, (uint64_t)v17, v24);
  uint64_t v60 = a9;
  uint64_t v25 = _HashNode.UnsafeHandle.reverseItems.getter();
  uint64_t v58 = v26;
  uint64_t v59 = v25;
  __int32 v27 = *a3;
  uint8x8_t v28 = (uint8x8_t)vcnt_s8((int8x8_t)*a3);
  v28.i16[0] = vaddlv_u8(v28);
  if (*a3 != a3[1]) {
    __int32 v27 = v28.i32[0];
  }
  unsigned int v57 = v27;
  if (!v27)
  {
LABEL_18:
    uint64_t v40 = v54;
    uint64_t v41 = v46;
    (*(void (**)(unsigned char *, uint64_t))(v46 + 8))(v53, v54);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 56))(v47, 1, 1, v40);
  }
  unint64_t v55 = (unsigned int *)a3;
  uint64_t v56 = a10;
  LODWORD(v66) = 0;
  uint64_t v61 = a8;
  uint64_t v62 = a6;
  uint64_t v48 = a8 - 8;
  uint64_t v49 = a6 - 8;
  for (unsigned int i = 1; ; ++i)
  {
    while (1)
    {
      uint64_t v30 = v62;
      uint64_t v31 = v61;
      uint64_t v32 = v56;
      uint64_t v33 = _HashNode.UnsafeHandle.itemPtr(at:)(i - 1, (uint64_t)a3, (uint64_t)v63);
      uint64_t v64 = v59;
      uint64_t v65 = v58;
      uint64_t v34 = MEMORY[0x270FA5388](v33);
      *(&v45 - 6) = v30;
      *(&v45 - 5) = v31;
      *(&v45 - 4) = v60;
      *(&v45 - 3) = v32;
      *(&v45 - 2) = v34;
      swift_getTupleTypeMetadata2();
      sub_24A5BBDB0();
      swift_getWitnessTable();
      if ((sub_24A5BB900() & 1) == 0) {
        break;
      }
      if (v66) {
        goto LABEL_13;
      }
      a3 = (__int32 *)v55;
      _HashNode.Builder.copyCollisions(from:upTo:)((uint64_t)v55, v63, i - 1, v54);
      if (i >= v57) {
        goto LABEL_19;
      }
LABEL_7:
      LODWORD(v66) = 1;
      ++i;
    }
    if (v66) {
      break;
    }
    if (i >= v57) {
      goto LABEL_18;
    }
    LODWORD(v66) = 0;
    a3 = (__int32 *)v55;
  }
  uint64_t v35 = (uint64_t)v50;
  uint64_t v36 = *(int *)(TupleTypeMetadata2 + 48);
  uint64_t v37 = (uint64_t)&v50[v36];
  uint64_t v38 = v33 + v36;
  (*(void (**)(char *, uint64_t))(*(void *)(v62 - 8) + 16))(v50, v33);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v61 - 8) + 16))(v37, v38);
  _HashNode.Builder.addNewCollision(_:_:_:)((char *)v52, v35, v37, *v63, v54);
LABEL_13:
  a3 = (__int32 *)v55;
  if (i < v57) {
    goto LABEL_7;
  }
LABEL_19:
  uint64_t v43 = v46;
  uint64_t v42 = v47;
  uint64_t v44 = v54;
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v46 + 32))(v47, v53, v54);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v43 + 56))(v42, 0, 1, v44);
}

uint64_t sub_24A5A2794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  char v7 = sub_24A5BB530();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a3);
  return v7 & 1;
}

uint64_t sub_24A5A2894@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v17 = (int *)nullsub_1(a3 + 16, a3 + 32, a7, a10, a11);
  return sub_24A5A2940(v17, v18, a1, a2, a4, a5, a6, a7, a8, a9, a10, a11);
}

uint64_t sub_24A5A2940@<X0>(int *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v79 = a9;
  uint64_t v74 = a6;
  uint64_t v75 = a7;
  uint64_t v76 = a3;
  uint64_t v80 = a11;
  uint64_t v81 = a2;
  uint64_t v16 = type metadata accessor for _HashNode.Builder();
  uint64_t v17 = sub_24A5BBD20();
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v20 = *(void *)(a10 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v22 = *(void *)(a8 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v31 = (char *)&v69 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = a4;
  unint64_t v32 = *a4;
  uint64_t v82 = a5;
  unint64_t v33 = v32 >> a5;
  int v34 = v33 & 0x1F;
  int v35 = *a1;
  int v36 = 1 << v33;
  if ((v36 & *a1) != 0)
  {
    uint64_t v69 = v24;
    uint64_t v70 = v20;
    uint64_t v71 = v27;
    uint64_t v72 = v25;
    int v73 = v34;
    uint64_t v78 = v16;
    v29.i32[0] = (v36 - 1) & v35;
    uint8x8_t v37 = (uint8x8_t)vcnt_s8(v29);
    v37.i16[0] = vaddlv_u8(v37);
    uint64_t v38 = _HashNode.UnsafeHandle.itemPtr(at:)(v37.u32[0], (uint64_t)a1, v81);
    uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 16);
    v39(v31, v38, a8);
    uint64_t v81 = sub_24A5B85E4();
    uint64_t v40 = *(void (**)(char *, uint64_t))(v22 + 8);
    v40(v31, a8);
    v39(v31, v38, a8);
    uint64_t v41 = v82;
    unint64_t v42 = _HashNode.UnsafeHandle.find(_:_:_:)(v82, (uint64_t)v31, v81, v76, (uint64_t)v77, a8, a10, a12);
    v40(v31, a8);
    if (v42 == 2)
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v72 + 56))(v79, 1, 1, v78);
    }
    else
    {
      uint64_t v57 = v41;
      unint64_t v58 = HIDWORD(v42);
      uint64_t v59 = v69;
      uint64_t v60 = v71;
      _HashNode._removingItemFromLeaf(_:at:_:)((uint64_t)v31, v69, v71, v57, v73, v58, v74, v75, a8, a10, a12);
      (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v59, a10);
      v40(v31, a8);
      uint64_t v61 = v72;
      uint64_t v62 = v79;
      uint64_t v63 = v60;
      uint64_t v64 = v78;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v72 + 32))(v79, v63, v78);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v61 + 56))(v62, 0, 1, v64);
    }
  }
  else
  {
    uint64_t v44 = v80;
    uint64_t v77 = (void *)a10;
    int v45 = v82;
    int v46 = a1[1];
    if ((v46 & v36) != 0)
    {
      v29.i32[0] = v46 & (v36 - 1);
      uint8x8_t v47 = (uint8x8_t)vcnt_s8(v29);
      v47.i16[0] = vaddlv_u8(v47);
      uint64_t v76 = v23;
      uint64_t v78 = v16;
      int v73 = v34;
      uint64_t v48 = v26;
      uint64_t v49 = v28;
      int v50 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v47.u32[0], a1, v81, a8, v80, a12);
      uint64_t v52 = *v50;
      uint64_t v51 = v50[1];
      swift_retain();
      uint64_t v53 = (uint64_t)v77;
      _HashNode._subtracting<A>(_:_:)((v45 + 5), v52, v51, v74, v75, a8, v77, v44, a12);
      uint64_t v54 = swift_release();
      MEMORY[0x270FA5388](v54);
      *(&v69 - 6) = a8;
      *(&v69 - 5) = v53;
      uint64_t v65 = v44;
      uint64_t v66 = a12;
      char v67 = v45;
      char v68 = v73;
      uint64_t v55 = v76;
      sub_24A4C10F8((void (*)(char *, char *))sub_24A5159FC, (uint64_t)(&v69 - 8), MEMORY[0x263F8E628], v78, v56, v79);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v48 + 8))(v49, v55);
    }
    else
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 56))(v79, 1, 1, v16);
    }
  }
}

uint64_t sub_24A5A2EC8@<X0>(int *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t, unsigned char *, uint64_t)@<X3>, unsigned int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v18 = nullsub_1(a3 + 16, a3 + 32, a8, a11, a12);
  return sub_24A5A2F78(v18, v19, a5, a1, a2, a6, a7, a3, a9, a4, a8, a10, a11, a12);
}

uint64_t sub_24A5A2F78@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, int *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, void (*a10)(uint64_t, unsigned char *, uint64_t), uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v99 = a5;
  uint64_t v89 = a8;
  uint64_t v92 = a6;
  uint64_t v93 = a7;
  uint64_t v94 = a1;
  uint64_t v101 = a9;
  uint64_t v96 = a13;
  uint64_t v17 = type metadata accessor for _HashNode.Builder();
  uint64_t v18 = sub_24A5BBD20();
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v85 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  uint64_t v98 = v17;
  uint64_t v97 = *(void *)(v17 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v85 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = (char *)&v85 - v27;
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  uint64_t v30 = MEMORY[0x270FA5388](v29);
  uint64_t v31 = *(void *)(a11 - 8);
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  uint64_t v41 = (char *)&v85 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = (void (*)(uint64_t, unsigned char *, uint64_t))a2;
  unint64_t v42 = *a2;
  uint64_t v100 = a3;
  unint64_t v43 = v42 >> a3;
  int v44 = v43 & 0x1F;
  int v45 = *a4;
  int v46 = 1 << v43;
  if ((v46 & *a4) != 0)
  {
    uint64_t v88 = v34;
    uint64_t v89 = v33;
    int v90 = v44;
    uint8x8_t v91 = v35;
    v39.i32[0] = (v46 - 1) & v45;
    uint8x8_t v47 = (uint8x8_t)vcnt_s8(v39);
    v47.i16[0] = vaddlv_u8(v47);
    LODWORD(v87) = v47.i32[0];
    uint64_t v48 = v99;
    uint64_t v99 = v36;
    uint64_t v49 = _HashNode.UnsafeHandle.itemPtr(at:)(v47.u32[0], (uint64_t)a4, v48);
    int v50 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
    v50(v41, v49, a11);
    uint64_t v51 = sub_24A5B85E4();
    uint64_t v52 = *(void (**)(char *, uint64_t))(v31 + 8);
    v52(v41, a11);
    v50(v41, v49, a11);
    uint64_t v53 = v100;
    LOBYTE(v49) = _HashNode.UnsafeHandle.find(_:_:_:)(v100, (uint64_t)v41, v51, v94, (uint64_t)v95, a11, v96, a14);
    v52(v41, a11);
    if (v49 == 2)
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v97 + 56))(v101, 1, 1, v98);
    }
    else
    {
      uint64_t v71 = v53;
      uint64_t v72 = v99;
      uint64_t v73 = v88;
      uint64_t v74 = v91;
      _HashNode._removingItemFromLeaf(_:at:_:)((uint64_t)v41, v88, (uint64_t)v91, v71, v90, (int)v87, v92, v93, a11, v99, a14);
      (*(void (**)(uint64_t, uint64_t))(v89 + 8))(v73, v72);
      v52(v41, a11);
      uint64_t v75 = v97;
      uint64_t v76 = v101;
      uint64_t v77 = v74;
      uint64_t v78 = v98;
      (*(void (**)(uint64_t, unsigned char *, uint64_t))(v97 + 32))(v101, v77, v98);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v75 + 56))(v76, 0, 1, v78);
    }
  }
  else
  {
    int v55 = v100;
    int v56 = a4[1];
    if ((v56 & v46) != 0)
    {
      uint64_t v87 = v25;
      uint64_t v88 = v37;
      int v90 = v44;
      uint8x8_t v91 = v35;
      uint64_t v94 = v32;
      uint64_t v95 = a10;
      v39.i32[0] = v56 & (v46 - 1);
      uint8x8_t v57 = (uint8x8_t)vcnt_s8(v39);
      v57.i16[0] = vaddlv_u8(v57);
      int v86 = v57.i32[0];
      uint64_t v58 = v38;
      uint64_t v59 = v36;
      uint64_t v60 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v57.u32[0], a4, v99, a11, v36, a14);
      uint64_t v61 = *v60;
      uint64_t v62 = v60[1];
      swift_retain();
      uint64_t v85 = a14;
      uint64_t v63 = (v55 + 5);
      uint64_t v64 = v94;
      uint64_t v99 = v59;
      uint64_t v65 = v59;
      uint64_t v66 = v88;
      _HashNode._subtracting<A>(_:_:)(v63, v89, v95, v61, v62, a11, v65, v96, a14);
      swift_release();
      char v67 = *(void (**)(char *, uint64_t, uint64_t))(v66 + 16);
      uint64_t v96 = v58;
      v67(v21, v58, v64);
      uint64_t v68 = v97;
      uint64_t v69 = v98;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v97 + 48))(v21, 1, v98) == 1)
      {
        uint64_t v70 = *(void (**)(uint64_t, uint64_t))(v66 + 8);
        v70(v96, v64);
        v70((uint64_t)v21, v64);
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v68 + 56))(v101, 1, 1, v69);
      }
      else
      {
        uint64_t v79 = *(void (**)(uint64_t, unsigned char *, uint64_t))(v68 + 32);
        uint64_t v89 = v68 + 32;
        uint64_t v95 = v79;
        v79((uint64_t)v28, v21, v69);
        uint64_t v80 = v91;
        uint64_t v81 = v100;
        int v82 = v90;
        _HashNode._removingChild(_:at:_:)(v100, v90, v86, v92, v93, a11, v99, v85, v91);
        uint64_t v83 = (uint64_t)v87;
        (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v87, v28, v69);
        _HashNode.Builder.addNewChildBranch(_:_:at:)(v81, v83, v82, v69);
        (*(void (**)(char *, uint64_t))(v68 + 8))(v28, v69);
        (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v96, v64);
        uint64_t v84 = v101;
        v95(v101, v80, v69);
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v68 + 56))(v84, 0, 1, v69);
      }
    }
    else
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v97 + 56))(v101, 1, 1, v98);
    }
  }
}

uint64_t sub_24A5A3688(uint64_t a1)
{
  return sub_24A5A2794(a1, *(void *)(v1 + 48), *(void *)(v1 + 16)) & 1;
}

uint64_t Heap.init(arrayLiteral:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a1;
  uint64_t v3 = sub_24A5BB9F0();
  swift_getWitnessTable();
  return Heap.init<A>(_:)((uint64_t)&v5, a2, v3);
}

uint64_t sub_24A5A3728@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = Heap.init(arrayLiteral:)(a1, *(void *)(a2 + 16));
  *a3 = result;
  return result;
}

BOOL OrderedSet.isStrictSuperset(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = _s19CollectionsInternal4HeapV5countSivg_0();
  if (_s19CollectionsInternal4HeapV5countSivg_0() >= v10) {
    return 0;
  }
  return OrderedSet.isSubset(of:)(a3, a4, a1, a2, a5);
}

uint64_t OrderedSet.isStrictSuperset(of:)()
{
  uint64_t v0 = _s19CollectionsInternal4HeapV5countSivg_0();
  if (sub_24A5BBA40() >= v0)
  {
    char v1 = 0;
  }
  else
  {
    type metadata accessor for OrderedSet();
    swift_getWitnessTable();
    char v1 = sub_24A5BBA80();
  }
  return v1 & 1;
}

uint64_t OrderedSet.isStrictSuperset<A>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v50 = a7;
  uint64_t v52 = *(void *)(a4 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](a1);
  uint64_t v49 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v51 = (char *)&v43 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v43 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v43 - v21;
  uint64_t v24 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v26 = (char *)&v43 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (type metadata accessor for OrderedSet() == a5)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v26, a1, a5);
    swift_dynamicCast();
    char v35 = OrderedSet.isStrictSuperset(of:)(v54[0], v54[1], a2, a3, a4);
    swift_release();
    goto LABEL_9;
  }
  uint64_t v53 = a1;
  if (sub_24A5BBA90() == a5)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v26, v53, a5);
    swift_dynamicCast();
    char v35 = OrderedSet.isStrictSuperset(of:)();
    swift_bridgeObjectRelease();
    return v35 & 1;
  }
  uint64_t v48 = *(void *)(a3 + 16);
  if (!v48)
  {
LABEL_22:
    char v35 = 0;
    return v35 & 1;
  }
  uint64_t v27 = a2;
  swift_retain();
  swift_retain();
  sub_24A5BC260();
  uint8x8_t v47 = *(void (**)(char *, char *, uint64_t))(v52 + 32);
  v47(v22, v19, a4);
  int v44 = v22;
  uint64_t v28 = (uint64_t *)a3;
  uint64_t v29 = v53;
  uint64_t v30 = v50;
  uint64_t v31 = sub_24A5BB870();
  if (v31 != 2)
  {
    char v36 = v31;
    int v46 = &v43;
    MEMORY[0x270FA5388](v31);
    *(&v43 - 6) = a4;
    *(&v43 - 5) = a5;
    *(&v43 - 4) = a6;
    *(&v43 - 3) = v30;
    *(&v43 - 2) = v27;
    *(&v43 - 1) = (uint64_t)v28;
    if (sub_24A5BB890())
    {
      int v46 = v28;
      uint64_t v43 = v27;
      if ((v36 & 1) == 0)
      {
        (*(void (**)(char *, uint64_t))(v52 + 8))(v44, a4);
LABEL_19:
        swift_release();
        swift_release();
        char v35 = 1;
        return v35 & 1;
      }
      uint64_t v45 = a6;
      uint64_t v37 = v51;
      uint64_t v38 = (void (**)(char *, uint64_t))(v52 + 8);
      uint64_t v39 = 1;
      uint64_t v40 = v49;
      while (v48 != v39)
      {
        sub_24A5BC260();
        ++v39;
        v47(v37, v40, a4);
        char v41 = sub_24A5BB920();
        unint64_t v42 = *v38;
        (*v38)(v37, a4);
        if ((v41 & 1) == 0)
        {
          v42(v44, a4);
          goto LABEL_19;
        }
      }
      (*v38)(v44, a4);
      swift_release();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v52 + 8))(v44, a4);
      swift_release();
    }
    swift_release();
    goto LABEL_22;
  }
  uint64_t v32 = _s19CollectionsInternal4HeapV5countSivg_0();
  uint64_t result = MEMORY[0x270FA5388](v32);
  *(&v43 - 8) = a4;
  *(&v43 - 7) = a5;
  *(&v43 - 6) = a6;
  *(&v43 - 5) = v34;
  *(&v43 - 4) = v29;
  *(&v43 - 3) = v27;
  *(&v43 - 2) = (uint64_t)v28;
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    LOBYTE(v54[0]) = 2;
    uint64_t result = (uint64_t)sub_24A5813E4((unint64_t)(result + 63) >> 6, v54, (void *(*)(char *__return_ptr, unsigned char **))sub_24A5A427C);
    if (LOBYTE(v54[0]) != 2)
    {
      char v35 = v54[0] & 1;
      (*(void (**)(char *, uint64_t))(v52 + 8))(v44, a4);
      swift_release();
LABEL_9:
      swift_release();
      return v35 & 1;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24A5A3E6C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, BOOL *a8@<X8>)
{
  char v35 = a8;
  uint64_t v40 = a3;
  uint64_t v41 = a7;
  uint64_t v44 = a4;
  uint64_t v43 = a2;
  uint64_t v39 = a1;
  uint64_t v36 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24A5BBD20();
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&v33 - v14;
  uint64_t v16 = *(void *)(a6 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v34 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v21 = (char *)&v33 - v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v43, a6);
  sub_24A5BB840();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  unint64_t v42 = v21;
  uint64_t v43 = AssociatedTypeWitness;
  uint64_t v38 = AssociatedConformanceWitness;
  sub_24A5BBEE0();
  uint64_t v23 = v36;
  uint64_t v37 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48);
  uint64_t v24 = 0;
  if (v37(v15, 1, a5) == 1)
  {
LABEL_2:
    (*(void (**)(char *, uint64_t))(v34 + 8))(v42, v43);
    uint64_t result = _s19CollectionsInternal4HeapV5countSivg_0();
    BOOL v26 = v24 < result;
LABEL_14:
    *char v35 = v26;
  }
  else
  {
    uint64_t v24 = 0;
    uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
    uint64_t v28 = (void (**)(char *, uint64_t))(v23 + 8);
    v27(v11, v15, a5);
    while (1)
    {
      uint64_t result = OrderedSet._find(_:)();
      if (v29)
      {
        (*v28)(v11, a5);
LABEL_13:
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v42, v43);
        BOOL v26 = 0;
        goto LABEL_14;
      }
      if (result < 0) {
        break;
      }
      uint64_t v30 = ((unint64_t)result >> 3) & 0x1FFFFFFFFFFFFFF8;
      uint64_t v31 = *(void *)(*v39 + v30);
      *(void *)(*v39 + v30) = v31 | (1 << result);
      if ((v31 & (1 << result)) != 0)
      {
        (*v28)(v11, a5);
      }
      else
      {
        ++v24;
        uint64_t v32 = _s19CollectionsInternal4HeapV5countSivg_0();
        (*v28)(v11, a5);
        if (v24 == v32) {
          goto LABEL_13;
        }
      }
      sub_24A5BBEE0();
      if (v37(v15, 1, a5) == 1) {
        goto LABEL_2;
      }
      v27(v11, v15, a5);
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_24A5A427C@<X0>(void *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_24A5A3E6C(a1, v2[6], v2[7], v2[8], v2[2], v2[3], v2[4], a2);
}

uint64_t BitSet.encode(to:)(void *a1, uint64_t a2)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24A5BC710();
  uint64_t v4 = *(void *)(a2 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v4; ++i)
    {
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v7, v8);
      sub_24A5BC4C0();
      if (v2) {
        break;
      }
    }
    swift_bridgeObjectRelease();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

int64_t BitSet.init(from:)(void *a1)
{
  int64_t v3 = (int64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24A5BC6E0();
  if (!v1)
  {
    __swift_project_boxed_opaque_existential_1(v8, v8[3]);
    uint64_t v4 = sub_24A5BC460();
    uint64_t v6 = sub_24A50A470(v8, v4, v5 & 1);
    int64_t v3 = _s19CollectionsInternal6BitSetV6_wordsACSayAA07_UnsafecD0V5_WordVG_tcfC_0((int64_t)v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t sub_24A5A4454@<X0>(void *a1@<X0>, int64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24A5BC6E0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  uint64_t v5 = sub_24A5BC460();
  char v7 = sub_24A50A470(v10, v5, v6 & 1);
  int64_t v8 = _s19CollectionsInternal6BitSetV6_wordsACSayAA07_UnsafecD0V5_WordVG_tcfC_0((int64_t)v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  *a2 = v8;
  return result;
}

uint64_t sub_24A5A4534(void *a1)
{
  return BitSet.encode(to:)(a1, *v1);
}

uint64_t static OrderedSet._UnstableInternals.isConsistencyCheckingEnabled.getter()
{
  return 0;
}

char *OrderedSet._UnstableInternals.hashTableContents.getter(uint64_t a1)
{
  if (!a1) {
    return (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v1 = (void *)(a1 + 16);
  uint64_t v2 = a1 + 32;
  swift_retain();
  int64_t v3 = sub_24A4F9DEC(v1, v2);
  swift_release();
  return v3;
}

int64_t OrderedSet.init<A>(_scale:bias:contents:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v14, v15);
  uint64_t v16 = sub_24A5BBA00();
  int64_t v17 = _s19CollectionsInternal4HeapV5countSivg_0();
  int64_t result = _s19CollectionsInternal10_HashTableV5scale11forCapacityS2i_tFZ_0(v17);
  if ((a2 & 0x8000000000000000) != 0 || a1 > 56 || result > a1)
  {
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v19 = 1;
  if (a1)
  {
    unint64_t v19 = (1 << a1) - 1;
    if (__OFSUB__(1 << a1, 1)) {
      goto LABEL_24;
    }
  }
  if (v19 <= a2) {
    goto LABEL_20;
  }
  if (a1 <= 4 && a2) {
    goto LABEL_25;
  }
  uint64_t v24 = a3;
  if (a1 <= 5) {
    uint64_t v20 = 5;
  }
  else {
    uint64_t v20 = a1;
  }
  uint64_t v21 = _s19CollectionsInternal10_HashTableV5scale13reservedScaleACSi_SitcfC_0(v20, 0);
  swift_beginAccess();
  _HashTable.Header.bias.setter(a2);
  int64_t result = sub_24A5A4828((void *)(v21 + 16), v21 + 32, v16, a4, a5, a6);
  if ((result & 1) == 0) {
    goto LABEL_21;
  }
  if (a1 >= 5)
  {
    swift_retain();
    uint64_t v22 = v21;
  }
  else
  {
    uint64_t v22 = 0;
  }
  uint64_t v23 = OrderedSet.init(_uniqueElements:_:)(v16, v22);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v24, a5);
  int64_t result = OrderedSet._scale.getter(v23);
  if (result == a1)
  {
    int64_t result = OrderedSet._bias.getter(v23);
    if (result == a2) {
      return v23;
    }
    goto LABEL_23;
  }
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_24A5A4828(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = a3;
  uint64_t v9 = sub_24A5BC210();
  uint64_t WitnessTable = swift_getWitnessTable();
  return _HashTable.UnsafeHandle.fill<A>(untilFirstDuplicateIn:)((char *)&v13, (uint64_t)&v12, a1, a2, v9, WitnessTable, a6) & 1;
}

uint64_t TreeSet.description.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5[0] = a1;
  v5[1] = a2;
  v5[2] = a3;
  uint64_t v3 = type metadata accessor for TreeSet();
  swift_getWitnessTable();
  return _arrayDescription<A>(for:debug:typeName:)((uint64_t)v5, 0, 0, 0, v3);
}

uint64_t sub_24A5A4930(uint64_t a1, uint64_t a2)
{
  return sub_24A5A4A14(a1, a2, (uint64_t (*)(void, void, void, void, void))TreeSet.description.getter);
}

uint64_t TreeSet.debugDescription.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v9[0] = a1;
  v9[1] = a2;
  v9[2] = a3;
  uint64_t v3 = sub_24A5A4A30();
  uint64_t v5 = v4;
  uint64_t v6 = type metadata accessor for TreeSet();
  swift_getWitnessTable();
  uint64_t v7 = _arrayDescription<A>(for:debug:typeName:)((uint64_t)v9, 1, v3, v5, v6);
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_24A5A49FC(uint64_t a1, uint64_t a2)
{
  return sub_24A5A4A14(a1, a2, (uint64_t (*)(void, void, void, void, void))TreeSet.debugDescription.getter);
}

uint64_t sub_24A5A4A14(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, void, void, void, void))
{
  return a3(*v3, v3[1], v3[2], *(void *)(a1 + 16), *(void *)(a1 + 24));
}

uint64_t sub_24A5A4A30()
{
  return 0x3C74655365657254;
}

uint64_t TreeDictionary.Values._base.getter()
{
  return swift_retain();
}

uint64_t TreeDictionary.Values._base.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = swift_release();
  *uint64_t v3 = a1;
  v3[1] = a2;
  v3[2] = a3;
  return result;
}

uint64_t (*TreeDictionary.Values._base.modify())(void, void, void, void, void)
{
  return nullsub_1;
}

uint64_t TreeDictionary.values.getter()
{
  return swift_retain();
}

uint64_t TreeDictionary.Values.description.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5[0] = a1;
  v5[1] = a2;
  v5[2] = a3;
  uint64_t v3 = type metadata accessor for TreeDictionary.Values();
  swift_getWitnessTable();
  return _arrayDescription<A>(for:debug:typeName:)((uint64_t)v5, 0, 0, 0, v3);
}

uint64_t type metadata accessor for TreeDictionary.Values()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24A5A4BF4(void *a1, uint64_t a2)
{
  return sub_24A5A4D08(a1, a2, (uint64_t (*)(void, void, void, void, void, void))TreeDictionary.Values.description.getter);
}

uint64_t TreeDictionary.Values.debugDescription.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v9[0] = a1;
  v9[1] = a2;
  v9[2] = a3;
  uint64_t v7 = sub_24A5681FC();
  uint64_t v8 = v3;
  sub_24A5BB6F0();
  uint64_t v4 = type metadata accessor for TreeDictionary.Values();
  swift_getWitnessTable();
  uint64_t v5 = _arrayDescription<A>(for:debug:typeName:)((uint64_t)v9, 1, v7, v8, v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24A5A4CF0(void *a1, uint64_t a2)
{
  return sub_24A5A4D08(a1, a2, (uint64_t (*)(void, void, void, void, void, void))TreeDictionary.Values.debugDescription.getter);
}

uint64_t sub_24A5A4D08(void *a1, uint64_t a2, uint64_t (*a3)(void, void, void, void, void, void))
{
  return a3(*v3, v3[1], v3[2], a1[2], a1[3], a1[4]);
}

uint64_t TreeDictionary.Values.Iterator._base.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for TreeDictionary.Iterator();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

__n128 TreeDictionary.Values.Iterator._base.setter(uint64_t a1)
{
  long long v3 = v1[7];
  v11[6] = v1[6];
  v12[0] = v3;
  *(_OWORD *)((char *)v12 + 11) = *(_OWORD *)((char *)v1 + 123);
  long long v4 = v1[3];
  v11[2] = v1[2];
  v11[3] = v4;
  long long v5 = v1[5];
  v11[4] = v1[4];
  v11[5] = v5;
  long long v6 = v1[1];
  v11[0] = *v1;
  v11[1] = v6;
  sub_24A4A2BC4((uint64_t)v11);
  long long v7 = *(_OWORD *)(a1 + 112);
  v1[6] = *(_OWORD *)(a1 + 96);
  v1[7] = v7;
  *(_OWORD *)((char *)v1 + 123) = *(_OWORD *)(a1 + 123);
  long long v8 = *(_OWORD *)(a1 + 48);
  v1[2] = *(_OWORD *)(a1 + 32);
  v1[3] = v8;
  long long v9 = *(_OWORD *)(a1 + 80);
  v1[4] = *(_OWORD *)(a1 + 64);
  v1[5] = v9;
  __n128 result = *(__n128 *)(a1 + 16);
  *uint64_t v1 = *(_OWORD *)a1;
  v1[1] = result;
  return result;
}

uint64_t (*TreeDictionary.Values.Iterator._base.modify())(void, void, void, void, void)
{
  return nullsub_1;
}

__n128 TreeDictionary.Values.Iterator.init(_base:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v2 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 112) = v2;
  *(_OWORD *)(a2 + 123) = *(_OWORD *)(a1 + 123);
  long long v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v3;
  long long v4 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v4;
  __n128 result = *(__n128 *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t TreeDictionary.Values.Iterator.next()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v6 = sub_24A5BBD20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  long long v9 = (char *)&v13 - v8;
  uint64_t v10 = (void *)type metadata accessor for TreeDictionary.Iterator();
  TreeDictionary.Iterator.next()(v10, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 48))(v9, 1, TupleTypeMetadata2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(a2, 1, 1, v3);
  }
  else
  {
    uint64_t v12 = *(void *)(v3 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(a2, &v9[*(int *)(TupleTypeMetadata2 + 48)], v3);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(a2, 0, 1, v3);
    return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v9, v4);
  }
}

uint64_t TreeDictionary.Values.makeIterator()@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  TreeDictionary.makeIterator()(a1, (uint64_t)v8);
  long long v3 = v9[0];
  a2[6] = v8[6];
  a2[7] = v3;
  *(_OWORD *)((char *)a2 + 123) = *(_OWORD *)((char *)v9 + 11);
  long long v4 = v8[3];
  a2[2] = v8[2];
  a2[3] = v4;
  long long v5 = v8[5];
  a2[4] = v8[4];
  a2[5] = v5;
  long long v6 = v8[1];
  *a2 = v8[0];
  a2[1] = v6;
  return swift_retain();
}

__n128 sub_24A5A511C@<Q0>(uint64_t a1@<X8>)
{
  TreeDictionary.Values.makeIterator()(*v1, v7);
  swift_release();
  long long v3 = v8[0];
  *(_OWORD *)(a1 + 96) = v7[6];
  *(_OWORD *)(a1 + 112) = v3;
  *(_OWORD *)(a1 + 123) = *(_OWORD *)((char *)v8 + 11);
  long long v4 = v7[3];
  *(_OWORD *)(a1 + 32) = v7[2];
  *(_OWORD *)(a1 + 48) = v4;
  long long v5 = v7[5];
  *(_OWORD *)(a1 + 64) = v7[4];
  *(_OWORD *)(a1 + 80) = v5;
  __n128 result = (__n128)v7[1];
  *(_OWORD *)a1 = v7[0];
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t sub_24A5A5198(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_24A5A51EC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9E128](a1, WitnessTable);
}

double TreeDictionary.Values.startIndex.getter@<D0>(uint64_t a1@<X8>)
{
  return sub_24A51999C((void (*)(long long *__return_ptr))TreeDictionary.startIndex.getter, a1);
}

double TreeDictionary.Values.endIndex.getter@<D0>(uint64_t a1@<X8>)
{
  return sub_24A51999C((void (*)(long long *__return_ptr))TreeDictionary.endIndex.getter, a1);
}

uint64_t TreeDictionary.Values.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  TreeDictionary.subscript.getter((uint64_t)v8, v9, v10, v11, v12, v13, a5, v15, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a5);
}

__n128 TreeDictionary.Values.index(after:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  long long v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)a1;
  *(_OWORD *)&v12[16] = v6;
  *(void *)&v12[30] = *(void *)(a1 + 30);
  TreeDictionary.formIndex(after:)((uint64_t)v12, a2, a3, a4);
  uint64_t v7 = *(void *)&v12[24];
  int v8 = *(_DWORD *)&v12[32];
  char v9 = v12[36];
  char v10 = v12[37];
  __n128 result = *(__n128 *)&v12[8];
  *(void *)a5 = *(void *)v12;
  *(__n128 *)(a5 + 8) = result;
  *(void *)(a5 + 24) = v7;
  *(_DWORD *)(a5 + 32) = v8;
  *(unsigned char *)(a5 + 36) = v9;
  *(unsigned char *)(a5 + 37) = v10;
  return result;
}

double TreeDictionary.Values.index(_:offsetBy:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  TreeDictionary.index(_:offsetBy:)(a1, a2, a3, a4, (uint64_t)&v8);
  double result = *(double *)&v8;
  long long v7 = *(_OWORD *)v9;
  *(_OWORD *)a5 = v8;
  *(_OWORD *)(a5 + 16) = v7;
  *(void *)(a5 + 30) = *(void *)&v9[14];
  return result;
}

uint64_t TreeDictionary.Values.index(_:offsetBy:limitedBy:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  TreeDictionary.index(_:offsetBy:limitedBy:)(a1, a2, a3, a4, a5, (uint64_t)v9);
  type metadata accessor for TreeDictionary.Index();
  uint64_t v7 = sub_24A5BBD20();
  return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(a6, v9, v7);
}

uint64_t sub_24A5A54AC()
{
  return swift_getWitnessTable();
}

uint64_t sub_24A5A54C8()
{
  return swift_getWitnessTable();
}

double sub_24A5A54E4@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24A5A5514(a1, (void (*)(long long *__return_ptr, void, void, void, void, void, void))TreeDictionary.Values.startIndex.getter, a2);
}

double sub_24A5A54FC@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24A5A5514(a1, (void (*)(long long *__return_ptr, void, void, void, void, void, void))TreeDictionary.Values.endIndex.getter, a2);
}

double sub_24A5A5514@<D0>(void *a1@<X0>, void (*a2)(long long *__return_ptr, void, void, void, void, void, void)@<X2>, uint64_t a3@<X8>)
{
  a2(&v7, *v3, v3[1], v3[2], a1[2], a1[3], a1[4]);
  double result = *(double *)&v7;
  long long v6 = *(_OWORD *)v8;
  *(_OWORD *)a3 = v7;
  *(_OWORD *)(a3 + 16) = v6;
  *(void *)(a3 + 30) = *(void *)&v8[14];
  return result;
}

void (*sub_24A5A5574(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  long long v7 = (char *)malloc(0x50uLL);
  *a1 = v7;
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)long long v7 = *(_OWORD *)a2;
  *((_OWORD *)v7 + 1) = v8;
  *(void *)(v7 + 30) = *(void *)(a2 + 30);
  *((void *)v7 + 9) = sub_24A5A5604((void *)v7 + 5, (uint64_t)v7, *v3, v3[1], v3[2], *(void *)(a3 + 16), *(void *)(a3 + 24));
  return sub_24A50EE74;
}

void (*sub_24A5A5604(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(void *a1)
{
  uint64_t v12 = *(void *)(a7 - 8);
  *a1 = a7;
  a1[1] = v12;
  a1[2] = malloc(*(void *)(v12 + 64));
  TreeDictionary.Values.subscript.getter(a2, a3, a4, a5, a6);
  return sub_24A50EF90;
}

uint64_t sub_24A5A56F0(void *a1)
{
  return TreeDictionary.Values.isEmpty.getter(*v1, v1[1], v1[2], a1[2], a1[3], a1[4]);
}

uint64_t sub_24A5A5708(void *a1)
{
  return TreeDictionary.Values.count.getter(*v1, v1[1], v1[2], a1[2], a1[3], a1[4]);
}

double sub_24A5A5720@<D0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  long long v5 = a1[1];
  long long v10 = *a1;
  v11[0] = v5;
  *(void *)((char *)v11 + 14) = *(void *)((char *)a1 + 30);
  TreeDictionary.Values.index(_:offsetBy:)((uint64_t)&v10, a2, *v3, v3[2], (uint64_t)&v8);
  double result = *(double *)&v8;
  long long v7 = *(_OWORD *)v9;
  *(_OWORD *)a3 = v8;
  *(_OWORD *)(a3 + 16) = v7;
  *(void *)(a3 + 30) = *(void *)&v9[14];
  return result;
}

uint64_t sub_24A5A578C@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, uint64_t a4@<X8>)
{
  long long v6 = a1[1];
  long long v11 = *a1;
  v12[0] = v6;
  *(void *)((char *)v12 + 14) = *(void *)((char *)a1 + 30);
  long long v7 = a3[1];
  long long v13 = *a3;
  v14[0] = v7;
  *(void *)((char *)v14 + 14) = *(void *)((char *)a3 + 30);
  TreeDictionary.Values.index(_:offsetBy:limitedBy:)((uint64_t)&v11, a2, (uint64_t)&v13, *v4, v4[2], (uint64_t)v10);
  type metadata accessor for TreeDictionary.Index();
  uint64_t v8 = sub_24A5BBD20();
  return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(*(void *)(v8 - 8) + 32))(a4, v10, v8);
}

uint64_t sub_24A5A5860(long long *a1, long long *a2, void *a3)
{
  long long v4 = a1[1];
  long long v7 = *a1;
  v8[0] = v4;
  *(void *)((char *)v8 + 14) = *(void *)((char *)a1 + 30);
  long long v5 = a2[1];
  long long v9 = *a2;
  v10[0] = v5;
  *(void *)((char *)v10 + 14) = *(void *)((char *)a2 + 30);
  return ((uint64_t (*)(long long *, long long *, void, void, void, void, void, void))TreeDictionary.Values.distance(from:to:))(&v7, &v9, *v3, v3[1], v3[2], a3[2], a3[3], a3[4]);
}

double sub_24A5A58BC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  TreeDictionary.Values.index(after:)(a1, *v2, v2[1], v2[2], (uint64_t)&v6);
  double result = *(double *)&v6;
  long long v5 = *(_OWORD *)v7;
  *(_OWORD *)a2 = v6;
  *(_OWORD *)(a2 + 16) = v5;
  *(void *)(a2 + 30) = *(void *)&v7[14];
  return result;
}

uint64_t sub_24A5A5914(uint64_t a1, void *a2)
{
  return TreeDictionary.Values.formIndex(after:)(a1, *v2, v2[1], v2[2], a2[2], a2[3], a2[4]);
}

uint64_t type metadata accessor for TreeDictionary.Values.Iterator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24A5A5944(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v5 = sub_24A5BBCC0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  long long v9 = (char *)&v16 - v8;
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v16 - v11;
  char v13 = sub_24A5BB440();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, a2, v5);
  if ((v13 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, AssociatedTypeWitness);
    goto LABEL_5;
  }
  char v14 = sub_24A5BB420();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, AssociatedTypeWitness);
  if ((v14 & 1) == 0) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t sub_24A5A5B9C(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v5 = sub_24A5BBCC0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  long long v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v17 - v10;
  v17[1] = AssociatedConformanceWitness;
  LOBYTE(AssociatedConformanceWitness) = sub_24A5BB440();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v12(v11, a1, v5);
  v12(v9, a2, v5);
  if ((AssociatedConformanceWitness & 1) == 0)
  {
    uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
    v16(v9, v5);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v16)(v11, v5);
    goto LABEL_5;
  }
  char v13 = sub_24A5BB440();
  char v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v9, v5);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v14)(v11, v5);
  if ((v13 & 1) == 0) {
LABEL_5:
  }
    __break(1u);
  return result;
}

BOOL BitSet.isSubset(of:)(void *a1, void *a2)
{
  unint64_t v2 = a2[2];
  if (a1[2] < v2) {
    return 0;
  }
  if (!v2) {
    return 1;
  }
  if ((a2[4] & ~a1[4]) != 0) {
    return 0;
  }
  long long v4 = a2 + 5;
  uint64_t v5 = a1 + 5;
  unint64_t v6 = v2 - 1;
  do
  {
    BOOL result = v6 == 0;
    if (!v6) {
      break;
    }
    uint64_t v8 = *v4++;
    uint64_t v7 = v8;
    uint64_t v9 = *v5++;
    --v6;
  }
  while ((v7 & ~v9) == 0);
  return result;
}

unint64_t BitSet.isSubset(of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 <= 0) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = a1 & ~(a1 >> 63);
  }
  return _UnsafeBitSet.isSubset(of:)(v3, a2 & ~(a2 >> 63), (void *)(a3 + 32), *(void *)(a3 + 16));
}

uint64_t BitSet.isSubset<A>(of:)(uint64_t a1, char *a2, ValueMetadata *a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v10 = (char *)&v53 - v9;
  Description = (void (**)(char *, void, ValueMetadata *))a3[-1].Description;
  uint64_t v12 = MEMORY[0x270FA5388](v8);
  char v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v53 - v15;
  if (a3 == &type metadata for BitSet)
  {
    Description[2]((char *)&v53 - v15, a1, &type metadata for BitSet);
LABEL_45:
    swift_dynamicCast();
    char v41 = BitSet.isSubset(of:)((void *)v55, a2);
    swift_bridgeObjectRelease();
    return v41 & 1;
  }
  if (a3 == &type metadata for BitSet.Counted)
  {
    Description[2]((char *)&v53 - v15, a1, &type metadata for BitSet.Counted);
    goto LABEL_45;
  }
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26979AEC0);
  if ((ValueMetadata *)result == a3)
  {
    Description[2](v14, a1, a3);
    swift_dynamicCast();
    if (v56 <= 0) {
      unint64_t v42 = 0;
    }
    else {
      unint64_t v42 = v55 & ~(v55 >> 63);
    }
    char v41 = _UnsafeBitSet.isSubset(of:)(v42, v56 & ~(v56 >> 63), (void *)a2 + 4, *((void *)a2 + 2));
    return v41 & 1;
  }
  unint64_t v18 = *((void *)a2 + 2);
  if (!v18) {
    goto LABEL_77;
  }
  uint64_t v54 = a2 + 32;
  unint64_t v19 = *((void *)a2 + 4);
  if (!v19)
  {
    if (v18 > 1)
    {
      unint64_t v49 = *((void *)a2 + 5);
      if (v49)
      {
        uint64_t v53 = v7;
        uint64_t v20 = 1;
        uint64_t v50 = 64;
      }
      else
      {
        uint64_t v51 = 0;
        unint64_t v52 = v18 - 2;
        uint64_t v50 = 64;
        do
        {
          if (v52 == v51) {
            goto LABEL_77;
          }
          unint64_t v49 = *(void *)&a2[8 * v51++ + 48];
          v50 += 64;
        }
        while (!v49);
        uint64_t v53 = v7;
        if (v50 < 0) {
          goto LABEL_85;
        }
        uint64_t v20 = v51 + 1;
      }
      unint64_t v22 = (v49 - 1) & v49;
      uint64_t v21 = (void *)(__clz(__rbit64(v49)) + v50);
      goto LABEL_7;
    }
LABEL_77:
    char v41 = 1;
    return v41 & 1;
  }
  uint64_t v53 = v7;
  uint64_t v20 = 0;
  uint64_t v21 = (void *)__clz(__rbit64(v19));
  unint64_t v22 = (v19 - 1) & v19;
LABEL_7:
  uint64_t v55 = (uint64_t)v21;
  swift_bridgeObjectRetain();
  uint64_t result = sub_24A5BB870();
  if (result != 2)
  {
    if ((result & 1) == 0)
    {
LABEL_70:
      swift_bridgeObjectRelease();
      char v41 = 0;
      return v41 & 1;
    }
    uint64_t v43 = v54;
    while (1)
    {
      if (v22)
      {
        if (v20 << 6 < 0) {
          goto LABEL_81;
        }
        unint64_t v44 = __rbit64(v22);
        v22 &= v22 - 1;
        uint64_t v45 = (void *)((v20 << 6) | __clz(v44));
      }
      else
      {
        uint64_t v46 = v20 + 1;
        if (__OFADD__(v20, 1)) {
          goto LABEL_82;
        }
        uint64_t v47 = *((void *)a2 + 2);
        if (v46 >= v47) {
          goto LABEL_79;
        }
        unint64_t v48 = *(void *)&v43[8 * v46];
        if (!v48)
        {
          while (1)
          {
            uint64_t v20 = v46 + 1;
            if (__OFADD__(v46, 1)) {
              break;
            }
            if (v20 >= v47) {
              goto LABEL_79;
            }
            unint64_t v48 = *(void *)&v43[8 * v20];
            ++v46;
            if (v48) {
              goto LABEL_64;
            }
          }
          __break(1u);
LABEL_81:
          __break(1u);
LABEL_82:
          __break(1u);
LABEL_83:
          __break(1u);
LABEL_84:
          __break(1u);
LABEL_85:
          __break(1u);
LABEL_86:
          __break(1u);
LABEL_87:
          __break(1u);
LABEL_88:
          __break(1u);
LABEL_89:
          __break(1u);
          return result;
        }
        ++v20;
LABEL_64:
        if (v20 << 6 < 0) {
          goto LABEL_84;
        }
        unint64_t v22 = (v48 - 1) & v48;
        uint64_t v45 = (void *)(__clz(__rbit64(v48)) + (v20 << 6));
      }
      uint64_t v55 = (uint64_t)v45;
      uint64_t result = sub_24A5BB920();
      if ((result & 1) == 0) {
        goto LABEL_70;
      }
    }
  }
  swift_bridgeObjectRelease();
  Description[2](v16, a1, a3);
  swift_bridgeObjectRetain();
  sub_24A5BB840();
  swift_getAssociatedConformanceWitness();
  uint64_t v23 = v53;
  while (1)
  {
    while (1)
    {
      sub_24A5BBEE0();
      if (v56)
      {
        (*(void (**)(char *, uint64_t))(v23 + 8))(v10, AssociatedTypeWitness);
        goto LABEL_70;
      }
      unint64_t v24 = v55;
      if ((v55 & 0x8000000000000000) == 0)
      {
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_24A499D60((uint64_t)a2);
          a2 = (char *)result;
        }
        int64_t v25 = *((void *)a2 + 2);
        if (v24 >> 6 < v25)
        {
          BOOL v26 = a2 + 32;
          uint64_t v27 = 8 * (v24 >> 6);
          uint64_t v28 = *(void *)&a2[v27 + 32];
          *(void *)&a2[v27 + 32] = v28 & ~(1 << v24);
          if ((v28 & (1 << v24)) != 0) {
            break;
          }
        }
      }
    }
    int64_t v29 = v25 - 1;
    uint64_t v30 = v25 - 1;
    if (!*(void *)&v26[8 * v25 - 8])
    {
      uint64_t v30 = v25 - 2;
      if ((unint64_t)v25 < 2) {
        goto LABEL_17;
      }
      if (!*(void *)&v26[8 * v30])
      {
        int64_t v31 = v25;
        while (v31 - 2 >= 1)
        {
          if (*(void *)&a2[8 * v31-- + 8])
          {
            uint64_t v30 = v31 - 2;
            goto LABEL_23;
          }
        }
LABEL_17:
        uint64_t v30 = -1;
      }
    }
LABEL_23:
    int64_t v33 = v29 - v30;
    if (v29 - v30 >= 1)
    {
      int64_t v34 = v25 - v33;
      if (v25 < v33) {
        goto LABEL_86;
      }
      if (v25 < v34) {
        goto LABEL_87;
      }
      if (v34 < 0) {
        goto LABEL_88;
      }
      uint64_t v35 = v23;
      int64_t v36 = v25 - v33;
      if (__OFADD__(v25, v30 - v29)) {
        goto LABEL_89;
      }
      isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v36 > *((void *)a2 + 3) >> 1)
      {
        if (v25 <= v36) {
          int64_t v38 = v25 - v33;
        }
        else {
          int64_t v38 = v25;
        }
        a2 = sub_24A499EB0(isUniquelyReferenced_nonNull_native, v38, 1, a2);
      }
      uint64_t v23 = v35;
      uint64_t result = (uint64_t)memmove(&a2[8 * v34 + 32], &a2[8 * v25 + 32], 8 * (*((void *)a2 + 2) - v25));
      int64_t v25 = *((void *)a2 + 2) - v33;
      *((void *)a2 + 2) = v25;
    }
    if (!v25) {
      break;
    }
    if (!*((void *)a2 + 4))
    {
      if (v25 == 1) {
        break;
      }
      uint64_t v39 = 5;
      while (!*(void *)&a2[8 * v39])
      {
        uint64_t v40 = v39 - 3;
        if (__OFADD__(v39 - 4, 1)) {
          goto LABEL_83;
        }
        ++v39;
        if (v40 == v25) {
          goto LABEL_78;
        }
      }
    }
  }
LABEL_78:
  (*(void (**)(char *, uint64_t))(v23 + 8))(v10, AssociatedTypeWitness);
LABEL_79:
  swift_bridgeObjectRelease();
  char v41 = 1;
  return v41 & 1;
}

BOOL BitSet.isSubset(of:)(void *a1, uint64_t a2, void *a3)
{
  return BitSet.isSubset(of:)(a1, a3);
}

BOOL BitSet.isEqualSet(to:)(void *a1, void *a2)
{
  return _s19CollectionsInternal6BitSetV2eeoiySbAC_ACtFZ_0(a2, a1);
}

unint64_t BitSet.isEqualSet(to:)(unint64_t a1, unint64_t a2, uint64_t a3)
{
  if ((a1 & 0x8000000000000000) != 0 || (a2 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return _UnsafeBitSet.isEqualSet(to:)(a1, a2, (void *)(a3 + 32), *(void *)(a3 + 16));
  }
}

uint64_t BitSet.isEqualSet<A>(to:)(uint64_t a1, int8x8_t *a2, ValueMetadata *a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v66 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v67 = AssociatedTypeWitness;
  uint64_t v7 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v9 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v66 - v11;
  Description = (void (**)(char *, void, ValueMetadata *))a3[-1].Description;
  uint64_t v14 = MEMORY[0x270FA5388](v10);
  uint64_t v16 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  unint64_t v19 = (char *)&v66 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v66 - v20;
  if (a3 == &type metadata for BitSet)
  {
    Description[2]((char *)&v66 - v20, a1, &type metadata for BitSet);
    swift_dynamicCast();
    uint64_t v23 = (void *)v70;
    unint64_t v24 = a2;
LABEL_8:
    char v22 = _s19CollectionsInternal6BitSetV2eeoiySbAC_ACtFZ_0(v24, v23);
    swift_bridgeObjectRelease();
    return v22 & 1;
  }
  uint64_t v68 = a2;
  if (a3 == &type metadata for BitSet.Counted)
  {
    Description[2]((char *)&v66 - v20, a1, &type metadata for BitSet.Counted);
    swift_dynamicCast();
    uint64_t v23 = (void *)v70;
    unint64_t v24 = v68;
    goto LABEL_8;
  }
  if ((ValueMetadata *)__swift_instantiateConcreteTypeFromMangledName(&qword_26979AEC0) == a3)
  {
    Description[2](v19, a1, a3);
    swift_dynamicCast();
    char v22 = 0;
    if ((v70 & 0x8000000000000000) == 0 && (v71 & 0x8000000000000000) == 0) {
      char v22 = _UnsafeBitSet.isEqualSet(to:)(v70, v71, &v68[4], *(void *)&v68[2]);
    }
    return v22 & 1;
  }
  if (BitSet.isEmpty.getter((uint64_t)v68))
  {
    char v22 = sub_24A5BB890();
    return v22 & 1;
  }
  BOOL v26 = Description[2];
  v26(v16, a1, a3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26979B020);
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v70);
    uint64_t result = sub_24A5BB860();
    uint64_t v27 = v68 + 4;
    int8x8_t v28 = v68[2];
    if (v28)
    {
      uint64_t v29 = 0;
      uint64_t v30 = 8 * *(void *)&v28;
      int64_t v31 = v68 + 4;
      while (1)
      {
        uint8x8_t v32 = (uint8x8_t)vcnt_s8(*v31);
        v32.i16[0] = vaddlv_u8(v32);
        BOOL v33 = __OFADD__(v29, v32.u32[0]);
        v29 += v32.u32[0];
        if (v33) {
          break;
        }
        ++v31;
        v30 -= 8;
        if (!v30)
        {
          if (v29 < result) {
            goto LABEL_51;
          }
          goto LABEL_52;
        }
      }
LABEL_82:
      __break(1u);
      goto LABEL_83;
    }
    if (result <= 0)
    {
LABEL_52:
      v26(v21, a1, a3);
      sub_24A5BB840();
      uint64_t v54 = v67;
      swift_getAssociatedConformanceWitness();
      sub_24A5BBEE0();
      if ((v71 & 1) == 0)
      {
        uint64_t v55 = 0;
        unint64_t v65 = v70;
        uint64_t v56 = v68;
        while ((v65 & 0x8000000000000000) == 0
             && v65 >> 6 < *(void *)&v56[2]
             && ((*(void *)&v27[v65 >> 6] >> v65) & 1) != 0)
        {
          ++v55;
          sub_24A5BBEE0();
          unint64_t v65 = v70;
          if (v71) {
            goto LABEL_54;
          }
        }
        (*(void (**)(char *, uint64_t))(v66 + 8))(v12, v54);
        char v22 = 0;
        return v22 & 1;
      }
      uint64_t v55 = 0;
      uint64_t v56 = v68;
LABEL_54:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v66 + 8))(v12, v54);
      int8x8_t v57 = v56[2];
      if (!*(void *)&v57)
      {
        if (v55 <= 0)
        {
          uint64_t v63 = 0;
LABEL_78:
          char v22 = v55 == v63;
          return v22 & 1;
        }
        goto LABEL_87;
      }
      uint64_t v58 = 0;
      uint64_t v59 = 8 * *(void *)&v57;
      uint64_t v60 = v59;
      uint64_t v61 = v27;
      while (1)
      {
        uint8x8_t v62 = (uint8x8_t)vcnt_s8(*v61);
        v62.i16[0] = vaddlv_u8(v62);
        BOOL v33 = __OFADD__(v58, v62.u32[0]);
        v58 += v62.u32[0];
        if (v33) {
          break;
        }
        ++v61;
        v60 -= 8;
        if (!v60)
        {
          if (v58 < v55) {
            goto LABEL_86;
          }
          uint64_t v63 = 0;
          while (1)
          {
            uint8x8_t v64 = (uint8x8_t)vcnt_s8(*v27);
            v64.i16[0] = vaddlv_u8(v64);
            BOOL v33 = __OFADD__(v63, v64.u32[0]);
            v63 += v64.u32[0];
            if (v33) {
              goto LABEL_84;
            }
            ++v27;
            v59 -= 8;
            if (!v59) {
              goto LABEL_78;
            }
          }
        }
      }
LABEL_83:
      __break(1u);
LABEL_84:
      __break(1u);
LABEL_85:
      __break(1u);
LABEL_86:
      __break(1u);
LABEL_87:
      __break(1u);
LABEL_88:
      __break(1u);
      goto LABEL_89;
    }
LABEL_51:
    char v22 = 0;
    return v22 & 1;
  }
  uint64_t result = (uint64_t)sub_24A49889C(v68);
  if ((v34 & 1) == 0)
  {
    uint64_t v35 = sub_24A499EB0(0, ((result & (unint64_t)~(result >> 63)) + 64) >> 6, 0, MEMORY[0x263F8EE78]);
    uint64_t v69 = v35;
    v26(v21, a1, a3);
    sub_24A5BB840();
    uint64_t v36 = v67;
    swift_getAssociatedConformanceWitness();
    uint64_t result = sub_24A5BBEE0();
    uint64_t v37 = v68;
    if (v71)
    {
LABEL_22:
      if (!v35) {
        goto LABEL_71;
      }
    }
    else
    {
      int64_t v38 = v68 + 4;
      while ((v70 & 0x8000000000000000) == 0)
      {
        unint64_t v39 = v70 >> 6;
        if (v70 >> 6 >= *(void *)&v37[2]) {
          break;
        }
        uint64_t v40 = 1 << v70;
        if ((*(void *)&v38[v39] & (1 << v70)) == 0) {
          break;
        }
        if (!v35) {
          goto LABEL_88;
        }
        uint64_t v35 = v69;
        unint64_t v41 = *((void *)v69 + 2);
        BOOL v42 = v39 >= v41;
        uint64_t v43 = v39 - v41;
        if (v42)
        {
          if (v43 < -1) {
            goto LABEL_85;
          }
          sub_24A4D5F98(v43 + 1, 0);
          uint64_t v35 = v69;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_24A499D60((uint64_t)v35);
          uint64_t v35 = (char *)result;
        }
        unint64_t v44 = (int8x8_t *)(v35 + 32);
        *(void *)&v35[8 * v39 + 32] |= v40;
        uint64_t v69 = v35;
        uint64_t v45 = *((void *)v35 + 2);
        if (v45)
        {
          uint64_t v46 = 0;
          uint64_t v47 = 8 * v45;
          do
          {
            uint8x8_t v48 = (uint8x8_t)vcnt_s8(*v44);
            v48.i16[0] = vaddlv_u8(v48);
            BOOL v33 = __OFADD__(v46, v48.u32[0]);
            v46 += v48.u32[0];
            if (v33)
            {
LABEL_81:
              __break(1u);
              goto LABEL_82;
            }
            ++v44;
            v47 -= 8;
          }
          while (v47);
          int8x8_t v49 = v37[2];
          if (v49) {
            goto LABEL_44;
          }
          if (!v46)
          {
LABEL_70:
            swift_bridgeObjectRelease();
            uint64_t v69 = 0;
LABEL_71:
            while (1)
            {
              sub_24A5BBEE0();
              if (v71) {
                break;
              }
              if ((v70 & 0x8000000000000000) != 0
                || v70 >> 6 >= *(void *)&v37[2]
                || ((*(void *)&v37[(v70 >> 6) + 4] >> v70) & 1) == 0)
              {
                goto LABEL_23;
              }
            }
            (*(void (**)(char *, uint64_t))(v66 + 8))(v9, v36);
            swift_bridgeObjectRelease();
            char v22 = 1;
            return v22 & 1;
          }
        }
        else
        {
          int8x8_t v49 = v37[2];
          if (!*(void *)&v49) {
            goto LABEL_70;
          }
          uint64_t v46 = 0;
LABEL_44:
          uint64_t v50 = 0;
          uint64_t v51 = 8 * *(void *)&v49;
          unint64_t v52 = v37 + 4;
          do
          {
            uint8x8_t v53 = (uint8x8_t)vcnt_s8(*v52);
            v53.i16[0] = vaddlv_u8(v53);
            BOOL v33 = __OFADD__(v50, v53.u32[0]);
            v50 += v53.u32[0];
            if (v33)
            {
              __break(1u);
              goto LABEL_81;
            }
            ++v52;
            v51 -= 8;
          }
          while (v51);
          if (v46 == v50) {
            goto LABEL_70;
          }
        }
        uint64_t result = sub_24A5BBEE0();
        if (v71) {
          goto LABEL_22;
        }
      }
    }
LABEL_23:
    (*(void (**)(char *, uint64_t))(v66 + 8))(v9, v36);
    swift_bridgeObjectRelease();
    goto LABEL_51;
  }
LABEL_89:
  __break(1u);
  return result;
}

BOOL BitSet.isEqualSet(to:)(void *a1, uint64_t a2, void *a3)
{
  return _s19CollectionsInternal6BitSetV2eeoiySbAC_ACtFZ_0(a3, a1);
}

uint64_t _HashNode.mapValuesToVoid(copy:extraBytes:)(uint64_t a1, Swift::Int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12 = MEMORY[0x263F8EE60];
  uint64_t v13 = MEMORY[0x263F8EE60] + 8;
  if (a6 != MEMORY[0x263F8EE60] + 8)
  {
    MEMORY[0x270FA5388](a1);
    v19[2] = a5;
    v19[3] = v14;
    v19[4] = a7;
    _HashNode.mapValues<A>(_:)((void (*)(char *, char *))sub_24A5A7B98, (uint64_t)v19, a3, a4, a5, v14, v13, a7);
    a3 = v15;
    a4 = v16;
    if (_HashNode.hasFreeSpace(_:)(a2)) {
      return a3;
    }
    goto LABEL_8;
  }
  if ((a1 & 1) != 0 || !_HashNode.hasFreeSpace(_:)(a2))
  {
    swift_retain();
LABEL_8:
    uint64_t v17 = _HashNode.copy(withFreeSpace:)(a2, a3, a4, a5, v12 + 8, a7);
    swift_release();
    return v17;
  }
  swift_retain();
  return a3;
}

void _HashNode.mapValues<A>(_:)(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = nullsub_1(a3 + 16, a3 + 32, a5, a6, a8);
  sub_24A5A6EFC(v16, v17, a3, a4, a4, a1, a2, a5, &v18, a6, a7, a8);
}

void sub_24A5A6EFC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int64_t a5@<X4>, void (*a6)(char *, char *)@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int64_t v38 = a6;
  uint64_t v39 = a7;
  BOOL v18 = _HashNode.isCollisionNode.getter(a3, a4, a8, a10, a12);
  uint64_t v37 = a9;
  if (v18)
  {
    uint64_t v19 = MEMORY[0x270FA5388](v18);
    uint64_t v33 = a8;
    uint64_t v34 = a10;
    uint64_t v35 = a11;
    uint64_t v36 = a12;
    uint64_t v21 = static _HashNode.allocateCollision<A>(count:_:extraBytes:initializingWith:)(v19, a5, v20, 0, (uint64_t (*)(uint64_t))nullsub_1, (uint64_t)v32, a8, a11, MEMORY[0x263F8EE60] + 8, a12);
  }
  else
  {
    uint64_t v23 = MEMORY[0x270FA5388](v18);
    uint64_t v33 = a8;
    uint64_t v34 = a10;
    uint64_t v35 = a11;
    uint64_t v36 = a12;
    uint64_t v21 = static _HashNode.allocate<A>(itemMap:childMap:count:extraBytes:initializingWith:)(v26, v23, v24, v25, a5, 0, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))nullsub_1, (uint64_t)v32, a8, a11, MEMORY[0x263F8EE60] + 8, a12);
  }
  uint64_t v27 = v21;
  uint64_t v28 = v22;
  uint64_t v29 = nullsub_1(v21 + 16, v21 + 32, a8, a11, a12);
  sub_24A5A70CC(v29, v30, a1, a2, v38, v39, a8, a10, a11, a12);
  if (v12)
  {
    swift_release();
  }
  else
  {
    int64_t v31 = v37;
    *uint64_t v37 = v27;
    v31[1] = v28;
  }
}

void sub_24A5A70CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *), uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v95 = a5;
  uint64_t v96 = a6;
  uint64_t v73 = a2;
  uint64_t v74 = a1;
  uint64_t v12 = a9;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v13 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  int v86 = (char *)&v70 - v14;
  uint64_t v98 = *(char **)(a9 - 8);
  MEMORY[0x270FA5388](v13);
  uint8x8_t v91 = (char *)&v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = a8;
  uint64_t v16 = a7;
  uint64_t v89 = swift_getTupleTypeMetadata2();
  uint64_t v97 = *(void *)(v89 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v89);
  int v90 = (char *)&v70 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v88 = (char *)&v70 - v20;
  uint64_t v94 = *(void *)(a7 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v70 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = _HashNode.UnsafeHandle.reverseItems.getter();
  uint64_t v92 = _HashNode.UnsafeHandle.reverseItems.getter();
  uint64_t v24 = v23;
  uint64_t v25 = v101;
  uint64_t v72 = _HashNode.UnsafeHandle.children.getter();
  uint64_t v75 = _HashNode.UnsafeHandle.children.getter();
  uint64_t v76 = v26;
  uint64_t v106 = 0;
  uint64_t v105 = 0;
  char v104 = 0;
  uint64_t v93 = v24;
  if (v24 < 1)
  {
    uint64_t v29 = v25;
    uint64_t v54 = a10;
    uint64_t v52 = v16;
    uint64_t v53 = 0;
LABEL_8:
    if (v53 >= v76)
    {
LABEL_12:
      char v104 = 1;
    }
    else
    {
      uint64_t v55 = (uint64_t *)(v72 + 16 * v53 + 8);
      uint64_t v56 = v54;
      while (1)
      {
        uint64_t v58 = *(v55 - 1);
        uint64_t v57 = *v55;
        swift_retain();
        uint64_t v59 = v57;
        uint64_t v60 = v52;
        uint64_t v61 = v102;
        uint64_t v62 = _HashNode.mapValues<A>(_:)(v95, v96, v58, v59, v52, v29, v12, v56);
        uint64_t v102 = v61;
        if (v61) {
          break;
        }
        uint64_t v64 = v62;
        uint64_t v65 = v63;
        swift_release();
        v103[0] = v64;
        v103[1] = v65;
        uint64_t v52 = v60;
        uint64_t v66 = type metadata accessor for _HashNode();
        uint64_t v67 = v76;
        sub_24A562CA0(v53++, (uint64_t)v103, v75, v76, v66);
        uint64_t v105 = v53;
        v55 += 2;
        uint64_t v29 = v101;
        if (v67 == v53) {
          goto LABEL_12;
        }
      }
      swift_release();
    }
LABEL_15:
    sub_24A5A78D0(&v104);
  }
  else
  {
    uint64_t v71 = a10;
    uint64_t v27 = 0;
    uint64_t v28 = *(void (**)(void))(v94 + 16);
    uint64_t v29 = v25;
    uint64_t v83 = v25 - 8;
    uint64_t v99 = *(void *)(v97 + 72);
    int v82 = (void (**)(char *, uint64_t))(v97 + 8);
    v94 += 16;
    uint64_t v84 = (char **)(v94 - 8);
    uint64_t v79 = (void (**)(char *, char *, uint64_t))(v98 + 16);
    uint64_t v78 = (void (**)(char *, uint64_t))(v98 + 8);
    uint64_t v85 = a9;
    uint64_t v81 = v16;
    uint64_t v80 = v22;
    uint64_t v77 = v28;
    while (1)
    {
      int64_t v31 = v88;
      uint64_t v30 = v89;
      uint64_t v32 = *(int *)(v89 + 48);
      uint64_t v33 = &v88[v32];
      uint64_t v97 = v100 + v99 * v27 + v32;
      v28(v88);
      uint64_t v34 = *(void *)(v29 - 8);
      uint64_t v98 = *(char **)(v34 + 16);
      ((void (*)(char *, uint64_t, uint64_t))v98)(v33, v97, v29);
      ((void (*)(char *, char *, uint64_t))v28)(v22, v31, v16);
      (*v82)(v31, v30);
      uint64_t v35 = *(int *)(v30 + 48);
      uint64_t v36 = v90;
      uint64_t v37 = &v90[v35];
      uint64_t v97 = v106;
      uint64_t v38 = v100 + v106 * v99 + v35;
      v28(v90);
      uint64_t v39 = v101;
      ((void (*)(char *, uint64_t))v98)(v37, v38);
      uint64_t v40 = v36;
      unint64_t v41 = v91;
      uint64_t v42 = v102;
      v95(v36, v37);
      uint64_t v102 = v42;
      if (v42)
      {
        uint64_t v68 = *v84;
        uint64_t v69 = v81;
        ((void (*)(char *, uint64_t))*v84)(v80, v81);
        (*(void (**)(char *, uint64_t))(v34 + 8))(v37, v39);
        ((void (*)(char *, uint64_t))v68)(v40, v69);
        goto LABEL_15;
      }
      (*(void (**)(char *, uint64_t))(v34 + 8))(v37, v39);
      uint64_t v98 = *v84;
      uint64_t v43 = v81;
      ((void (*)(char *, uint64_t))v98)(v36, v81);
      unint64_t v44 = v86;
      uint64_t v45 = TupleTypeMetadata2;
      uint64_t v46 = &v86[*(int *)(TupleTypeMetadata2 + 48)];
      uint64_t v47 = v80;
      uint8x8_t v48 = v77;
      ((void (*)(char *, char *, uint64_t))v77)(v86, v80, v43);
      int8x8_t v49 = v46;
      uint64_t v12 = v85;
      (*v79)(v49, v41, v85);
      uint64_t v50 = (uint64_t)v44;
      uint64_t v51 = v93;
      sub_24A562CA0(v97, v50, v92, v93, v45);
      (*v78)(v41, v12);
      ((void (*)(char *, uint64_t))v98)(v47, v43);
      uint64_t v27 = v106 + 1;
      uint64_t v16 = v43;
      uint64_t v29 = v101;
      if (__OFADD__(v106, 1)) {
        break;
      }
      uint64_t v22 = v47;
      uint64_t v28 = v48;
      ++v106;
      if (v27 >= v51)
      {
        uint64_t v52 = v16;
        uint64_t v53 = v105;
        uint64_t v54 = v71;
        goto LABEL_8;
      }
    }
    __break(1u);
  }
}

void sub_24A5A78D0(unsigned char *a1)
{
  if ((*a1 & 1) == 0)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    sub_24A5BBDB0();
    swift_getWitnessTable();
    sub_24A5BBBB0();
    sub_24A5A7BB8(v3, v4, v5, v6, TupleTypeMetadata2);
    uint64_t v2 = type metadata accessor for _HashNode();
    sub_24A5BBDB0();
    swift_getWitnessTable();
    sub_24A5BBBB0();
    sub_24A5A7BB8(v3, v4, v5, v6, v2);
    _HashNode.UnsafeHandle.clear()();
  }
}

uint64_t sub_24A5A7A3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v9 = *(void *)(TupleTypeMetadata2 - 8);
  MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v11 = (char *)&v13 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v13 - v10, a1, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(&v11[*(int *)(TupleTypeMetadata2 + 48)], a2, a4);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, TupleTypeMetadata2);
}

uint64_t sub_24A5A7B98(uint64_t a1, uint64_t a2)
{
  return sub_24A5A7A3C(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_24A5A7BB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a3) {
    return 0;
  }
  uint64_t v5 = *(void *)(*(void *)(a5 - 8) + 72);
  uint64_t v6 = a3 + v5 * a1;
  uint64_t v7 = a2 - a1;
  uint64_t result = swift_arrayDestroy();
  if ((unsigned __int128)(v7 * (__int128)v5) >> 64 == (v7 * v5) >> 63) {
    return v6;
  }
  __break(1u);
  return result;
}

uint64_t TreeDictionary.init(dictionaryLiteral:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = a1;
  swift_getTupleTypeMetadata2();
  uint64_t v7 = sub_24A5BB9F0();
  swift_getWitnessTable();
  uint64_t v8 = sub_24A4DDFBC((void (*)(char *, char *, uint64_t))&v10, a2, a3, v7, a4);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_24A5A7CF8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v15 = a1;
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  swift_getTupleTypeMetadata2();
  uint64_t v7 = sub_24A5BB9F0();
  uint64_t v8 = a2[4];
  swift_getWitnessTable();
  uint64_t v9 = sub_24A4DDFBC((void (*)(char *, char *, uint64_t))&v15, v5, v6, v7, v8);
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v9;
  a3[1] = v11;
  a3[2] = v13;
  return result;
}

uint64_t TreeDictionary<>.hash(into:)(long long *a1, uint64_t a2, void (**a3)(char *, uint64_t, uint64_t), void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v47 = a8;
  int8x8_t v49 = a3;
  uint64_t v50 = a4;
  uint64_t v39 = *(void (***)(char *, uint64_t))(a6 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](a1);
  uint64_t v43 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v42 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v52 = sub_24A5BBD20();
  uint64_t v19 = *(void *)(v52 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v52);
  uint64_t v51 = (uint64_t)&v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v37 - v22;
  TreeDictionary.makeIterator()(a2, (uint64_t)v61);
  uint64_t v44 = a5;
  uint64_t v45 = a6;
  uint64_t v46 = a7;
  uint64_t v24 = (void *)type metadata accessor for TreeDictionary.Iterator();
  int8x8_t v49 = (void (**)(char *, uint64_t, uint64_t))(v19 + 32);
  uint64_t v50 = v24;
  uint64_t v48 = TupleTypeMetadata2 - 8;
  uint64_t v40 = (void (**)(char *, char *, uint64_t))(v39 + 4);
  unint64_t v41 = (void (**)(char *, char *, uint64_t))(v16 + 32);
  uint64_t v38 = (void (**)(char *, uint64_t))(v16 + 8);
  ++v39;
  swift_retain();
  uint64_t v25 = 0;
  uint64_t v27 = v43;
  uint64_t v26 = v44;
  uint64_t v28 = v45;
  while (1)
  {
    uint64_t v29 = v51;
    TreeDictionary.Iterator.next()(v50, v51);
    (*v49)(v23, v29, v52);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 48))(v23, 1, TupleTypeMetadata2) == 1)break; {
    uint64_t v30 = &v23[*(int *)(TupleTypeMetadata2 + 48)];
    }
    int64_t v31 = v42;
    (*v41)(v42, v23, v26);
    (*v40)(v27, v30, v28);
    uint64_t v32 = *((void *)a1 + 8);
    long long v33 = a1[1];
    long long v53 = *a1;
    long long v54 = v33;
    long long v34 = a1[3];
    long long v55 = a1[2];
    long long v56 = v34;
    *(void *)&long long v57 = v32;
    sub_24A5BB380();
    sub_24A5BB380();
    v62[4] = v55;
    v62[5] = v56;
    uint64_t v63 = v57;
    v62[2] = v53;
    v62[3] = v54;
    uint64_t v35 = sub_24A5BC680();
    (*v39)(v27, v28);
    (*v38)(v31, v26);
    v25 ^= v35;
  }
  long long v59 = v61[6];
  v60[0] = v62[0];
  *(_OWORD *)((char *)v60 + 11) = *(_OWORD *)((char *)v62 + 11);
  long long v55 = v61[2];
  long long v56 = v61[3];
  long long v57 = v61[4];
  long long v58 = v61[5];
  long long v53 = v61[0];
  long long v54 = v61[1];
  sub_24A4A2BC4((uint64_t)&v53);
  return sub_24A5BC630();
}

uint64_t TreeDictionary<>.hashValue.getter(uint64_t a1, void (**a2)(char *, uint64_t, uint64_t), void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  sub_24A5BC610();
  TreeDictionary<>.hash(into:)(v15, a1, a2, a3, a4, a5, a6, a7);
  return sub_24A5BC690();
}

uint64_t sub_24A5A8264(uint64_t *a1, uint64_t a2)
{
  return TreeDictionary<>.hashValue.getter(*(void *)v2, *(void (***)(char *, uint64_t, uint64_t))(v2 + 8), *(void **)(v2 + 16), a1[2], a1[3], a1[4], *(void *)(a2 - 8));
}

uint64_t sub_24A5A8280(long long *a1, uint64_t *a2, uint64_t a3)
{
  return TreeDictionary<>.hash(into:)(a1, *(void *)v3, *(void (***)(char *, uint64_t, uint64_t))(v3 + 8), *(void **)(v3 + 16), a2[2], a2[3], a2[4], *(void *)(a3 - 8));
}

uint64_t sub_24A5A829C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  sub_24A5BC610();
  TreeDictionary<>.hash(into:)(v7, *(void *)v3, *(void (***)(char *, uint64_t, uint64_t))(v3 + 8), *(void **)(v3 + 16), a2[2], a2[3], a2[4], v5);
  return sub_24A5BC690();
}

uint64_t sub_24A5A82FC()
{
  return swift_getWitnessTable();
}

BOOL _HashNode.containsKey(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  while (1)
  {
    uint64_t v14 = a4 + 32;
    uint64_t v15 = nullsub_1(a4 + 16, a4 + 32, a6, a7, a8);
    unint64_t v17 = _HashNode.UnsafeHandle.find(_:_:_:)(a1, a2, a3, v15, v16, a6, a7, a8);
    if ((v17 & 1) == 0) {
      break;
    }
    a4 = *(void *)(v14 + ((v17 >> 28) & 0xFFFFFFFF0));
    a1 = (a1 + 5);
  }
  return v17 != 2;
}

uint64_t _HashNode.findForInsertion(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_24A5A8804(a1, a2, a3, a4, a5, a6, a7, a8, _HashNode.UnsafeHandle.findForInsertion(_:_:_:));
}

uint64_t _HashNode.get(_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  while (1)
  {
    uint64_t v15 = a4 + 32;
    uint64_t v16 = nullsub_1(a4 + 16, a4 + 32, a5, a6, a7);
    uint64_t v18 = v17;
    unint64_t v19 = _HashNode.UnsafeHandle.find(_:_:_:)(a1, a2, a3, v16, v17, a5, a6, a7);
    if (v19 == 2)
    {
      uint64_t v20 = 1;
      goto LABEL_6;
    }
    if ((v19 & 1) == 0) {
      break;
    }
    a4 = *(void *)(v15 + ((v19 >> 28) & 0xFFFFFFFF0));
    a1 = (a1 + 5);
  }
  sub_24A5A8C20(v16, v18, v19 & 0xFFFFFFFF00000000, a5, a6, a7, a8);
  uint64_t v20 = 0;
LABEL_6:
  uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 - 8) + 56);
  return v21(a8, v20, 1, a6);
}

uint64_t _HashNode.lookup(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  while (1)
  {
    uint64_t v15 = nullsub_1(a4 + 16, a4 + 32, a6, a7, a8);
    unint64_t v17 = _HashNode.UnsafeHandle.find(_:_:_:)(a1, a2, a3, v15, v16, a6, a7, a8);
    if (v17 == 2) {
      break;
    }
    if ((v17 & 1) == 0) {
      return a4;
    }
    a4 = *(void *)(a4 + 32 + 16 * HIDWORD(v17));
    a1 = (a1 + 5);
  }
  return 0;
}

unint64_t _HashNode.UnsafeHandle.find(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a6 - 8);
  unsigned __int8 v12 = MEMORY[0x270FA5388](a1);
  unint64_t v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v20 = *v14;
  int v21 = v14[1];
  if ((v21 & *v14) != 0)
  {
    if (_HashNode.UnsafeHandle._findInCollision(_:_:_:)(v12, a2, v13, (uint64_t)v14, v15)) {
      return 2;
    }
    else {
      return v22 << 32;
    }
  }
  else
  {
    int v24 = 1 << (v13 >> v12);
    if ((v20 & v24) != 0)
    {
      v17.i32[0] = v20 & (v24 - 1);
      uint8x8_t v25 = (uint8x8_t)vcnt_s8(v17);
      v25.i16[0] = vaddlv_u8(v25);
      uint64_t v26 = v25.u32[0];
      uint64_t v27 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(v25.u32[0], v14, v15, a6, v16, a8);
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v19, v27, a6);
      char v28 = sub_24A5BB530();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v19, a6);
      if (v28) {
        return v26 << 32;
      }
    }
    else if ((v21 & v24) != 0)
    {
      v17.i32[0] = v21 & (v24 - 1);
      uint8x8_t v29 = (uint8x8_t)vcnt_s8(v17);
      v29.i16[0] = vaddlv_u8(v29);
      return ((unint64_t)v29.u32[0] << 32) | 1;
    }
    return 2;
  }
}

uint64_t _HashNode.find(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_24A5A8804(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_HashNode.UnsafeHandle.find(_:_:_:));
}

uint64_t sub_24A5A8804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v16 = nullsub_1(a4 + 16, a4 + 32, a6, a7, a8);
  return a9(a1, a2, a3, v16, v15, a6, a7, a8);
}

uint64_t _HashNode.UnsafeHandle._findInCollision(_:_:_:)(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a1 <= 0x3Fu && *a5 != a3) {
    return 2;
  }
  uint64_t v6 = _HashNode.UnsafeHandle.reverseItems.getter();
  MEMORY[0x270FA5388](v6);
  swift_getTupleTypeMetadata2();
  sub_24A5BBDB0();
  swift_getWitnessTable();
  sub_24A5BBB60();
  return (v7 & 1) != 0;
}

uint64_t _HashNode.UnsafeHandle.findForInsertion(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a6 - 8);
  unsigned __int8 v12 = MEMORY[0x270FA5388](a1);
  unint64_t v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v20 = *v14;
  int v21 = v14[1];
  if ((v21 & *v14) != 0)
  {
    uint64_t v22 = _HashNode.UnsafeHandle._findInCollision(_:_:_:)(v12, a2, v13, (uint64_t)v14, v15);
    uint64_t v24 = 2147483649;
    if (!v22) {
      uint64_t v24 = (v23 << 32) | 0xFF;
    }
    if (v22 == 1) {
      return 0x80000000;
    }
    else {
      return v24;
    }
  }
  else
  {
    uint64_t v26 = (v13 >> v12) & 0x1F;
    int v27 = 1 << (v13 >> v12);
    if ((v20 & v27) != 0)
    {
      v17.i32[0] = v20 & (v27 - 1);
      uint8x8_t v28 = (uint8x8_t)vcnt_s8(v17);
      v28.i16[0] = vaddlv_u8(v28);
      uint64_t v29 = v28.u32[0];
      uint64_t v30 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(v28.u32[0], v14, v15, a6, v16, a8);
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v19, v30, a6);
      char v31 = sub_24A5BB530();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v19, a6);
      if (v31) {
        return v26 | (v29 << 32);
      }
      else {
        return v26 | (v29 << 32) | 0x40000000;
      }
    }
    else
    {
      int v32 = v27 - 1;
      if ((v21 & v27) != 0)
      {
        v17.i32[0] = v21 & v32;
        uint8x8_t v33 = (uint8x8_t)vcnt_s8(v17);
        v33.i16[0] = vaddlv_u8(v33);
        return v26 | ((unint64_t)v33.u32[0] << 32) | 0x60000000;
      }
      else
      {
        v17.i32[0] = v20 & v32;
        uint8x8_t v34 = (uint8x8_t)vcnt_s8(v17);
        v34.i16[0] = vaddlv_u8(v34);
        return v26 | ((unint64_t)v34.u32[0] << 32) | 0x20000000;
      }
    }
  }
}

uint64_t sub_24A5A8C20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v9 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(HIDWORD(a3), a1, a2, a4, a5, a6);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16))(a7, v9 + *(int *)(TupleTypeMetadata2 + 48), a5);
}

unint64_t _HashNode.position(forKey:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = a4 + 16;
  uint64_t v15 = a4 + 32;
  uint64_t v16 = nullsub_1(a4 + 16, a4 + 32, a6, a7, a8);
  unint64_t v18 = _HashNode.UnsafeHandle.find(_:_:_:)(a2, a1, a3, v16, v17, a6, a7, a8);
  if (v18 == 2) {
    return 0;
  }
  unint64_t v20 = v18;
  if ((v18 & 1) == 0) {
    return HIDWORD(v18);
  }
  nullsub_1(v14, v15, a6, a7, a8);
  sub_24A5A8DE4(v20 & 0xFFFFFFFF00000000 | 1, a1, a2, a3, (uint64_t)&v21);
  return v21;
}

uint64_t sub_24A5A8DE4@<X0>(unint64_t a1@<X2>, uint64_t a2@<X3>, int a3@<W4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v14 = HIDWORD(a1);
  uint64_t v8 = *(void *)(_HashNode.UnsafeHandle.children.getter() + 16 * HIDWORD(a1));
  swift_retain();
  uint64_t v9 = _HashNode.position(forKey:_:_:)(a2, (a3 + 5), a4, v8);
  char v11 = v10;
  uint64_t result = swift_release();
  if ((v11 & 1) == 0)
  {
    type metadata accessor for _HashNode();
    sub_24A5BBDB0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26979BB10);
    swift_getWitnessTable();
    sub_24A5225DC();
    uint64_t v13 = sub_24A5BB4C0();
    MEMORY[0x270FA5388](v13);
    swift_getWitnessTable();
    sub_24A5BC5E0();
    swift_getWitnessTable();
    uint64_t result = sub_24A5BB8E0();
    uint64_t v9 = v14;
  }
  *(void *)a5 = v9;
  *(unsigned char *)(a5 + 8) = v11 & 1;
  return result;
}

uint64_t _HashNode.item(position:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v16 = TupleTypeMetadata2 - 8;
  MEMORY[0x270FA5388](TupleTypeMetadata2);
  unint64_t v18 = (char *)&v23 - v17;
  unint64_t v19 = (unsigned int *)nullsub_1(a4 + 16, a4 + 32, a6, a7, a8);
  sub_24A5A91AC(v19, v20, a3, a6, a7, a8, (uint64_t)v18);
  uint64_t v21 = &v18[*(int *)(v16 + 56)];
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(a6 - 8) + 32))(a1, v18, a6);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(a7 - 8) + 32))(a2, v21, a7);
}

uint64_t sub_24A5A91AC@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v7 = a7;
  LODWORD(a7) = *a1;
  uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)*a1);
  v8.i16[0] = vaddlv_u8(v8);
  if (*a1 == a1[1]) {
    a7 = a7;
  }
  else {
    a7 = v8.u32[0];
  }
  uint64_t v9 = a3 - a7;
  if (a3 < a7)
  {
    uint64_t v10 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(a3, a1, a2, a4, a5, a6);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 16))(v7, v10, TupleTypeMetadata2);
  }
  uint64_t v13 = _HashNode.UnsafeHandle.children.getter();
  uint64_t v15 = v14;
  uint64_t v16 = type metadata accessor for _HashNode();
  uint64_t v17 = MEMORY[0x24C5C7090](v13, v15, v16);
  if (v17 == v18) {
    goto LABEL_22;
  }
  if (v18 < v17) {
    goto LABEL_20;
  }
  if (v17 >= v18)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    uint64_t result = sub_24A5BC340();
    __break(1u);
    return result;
  }
  uint64_t v19 = v13 + 16 * v17;
  uint64_t v20 = *(void *)(v19 + 8);
  if (v9 >= v20)
  {
    uint64_t v22 = (uint64_t *)(v19 + 24);
    uint64_t v21 = v17;
    while (1)
    {
      BOOL v23 = __OFSUB__(v9, v20);
      v9 -= v20;
      if (v23) {
        break;
      }
      if (v18 - 1 == v21) {
        goto LABEL_22;
      }
      if (++v21 < v17 || v21 >= v18) {
        goto LABEL_19;
      }
      uint64_t v24 = *v22;
      v22 += 2;
      uint64_t v20 = v24;
      if (v9 < v24) {
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v21 = v17;
LABEL_17:
  uint64_t v25 = v7 + *(int *)(swift_getTupleTypeMetadata2() + 48);
  uint64_t v26 = *(void *)(v13 + 16 * v21);
  swift_retain();
  _HashNode.item(position:)(v7, v25, v9, v26);
  return swift_release();
}

uint64_t sub_24A5A9404()
{
  return sub_24A5BB530() & 1;
}

uint64_t getEnumTagSinglePayload for _FindResult(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0xFFFFFB && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 16777212);
  }
  if ((((*(_DWORD *)a1 >> 5) & 0xFFFFF8 | (*(_DWORD *)a1 >> 29)) ^ 0xFFFFFFu) >= 0xFFFFFB) {
    int v3 = -1;
  }
  else {
    int v3 = ((*(_DWORD *)a1 >> 5) & 0xFFFFF8 | (*(_DWORD *)a1 >> 29)) ^ 0xFFFFFF;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for _FindResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFFFFFB)
  {
    *(void *)uint64_t result = a2 - 16777212;
    if (a3 >= 0xFFFFFC) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFFFFFC) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = (((-a2 >> 3) & 0x1FFFFF) << 8) - (a2 << 29);
    }
  }
  return result;
}

uint64_t sub_24A5A9500(void *a1)
{
  if ((int)*a1 >= 0) {
    return *a1 >> 29;
  }
  else {
    return ((*a1 >> 24) & 0xFFFFFF00 | *a1) + 4;
  }
}

void *sub_24A5A9520(void *result)
{
  *result &= 0xFFFFFFFF1FFFFFFFLL;
  return result;
}

unint64_t *sub_24A5A9530(unint64_t *result, unsigned int a2)
{
  if (a2 < 4) {
    *uint64_t result = *result & 0xFFFFFFFF000000FFLL | (a2 << 29);
  }
  else {
    *uint64_t result = ((a2 - 4) | ((unint64_t)(a2 - 4) << 24)) & 0xFFFFFFFF000000FFLL | 0x80000000;
  }
  return result;
}

ValueMetadata *type metadata accessor for _FindResult()
{
  return &type metadata for _FindResult;
}

void *sub_24A5A9574(void *result, uint64_t a2)
{
  *result += *(void *)(a2 + 8);
  return result;
}

uint64_t OrderedSet.description.getter(uint64_t a1, uint64_t a2)
{
  v4[0] = a1;
  v4[1] = a2;
  uint64_t v2 = type metadata accessor for OrderedSet();
  swift_getWitnessTable();
  return _arrayDescription<A>(for:debug:typeName:)((uint64_t)v4, 0, 0, 0, v2);
}

uint64_t sub_24A5A95FC()
{
  return 0x536465726564724FLL;
}

uint64_t sub_24A5A9670()
{
  return OrderedSet.description.getter(*v0, v0[1]);
}

uint64_t OrderedSet.debugDescription.getter(uint64_t a1, uint64_t a2)
{
  v8[0] = a1;
  v8[1] = a2;
  uint64_t v2 = sub_24A5A95FC();
  uint64_t v4 = v3;
  uint64_t v5 = type metadata accessor for OrderedSet();
  swift_getWitnessTable();
  uint64_t v6 = _arrayDescription<A>(for:debug:typeName:)((uint64_t)v8, 1, v2, v4, v5);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_24A5A972C()
{
  return OrderedSet.debugDescription.getter(*v0, v0[1]);
}

uint64_t sub_24A5A973C(uint64_t result, void *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v13 = result;
  if (qword_26979ACF0 != -1) {
    uint64_t result = swift_once();
  }
  if ((char *)_emptySingleton != a3)
  {
    uint64_t v14 = nullsub_1(a3 + 16, a3 + 32, a5, a6, a7);
    return sub_24A5A9990(v14, v15, a2, a3, a4, v13, a5, a6, a7);
  }
  return result;
}

uint64_t _HashTreeStatistics.nodeCount.getter()
{
  return *(void *)v0;
}

uint64_t _HashTreeStatistics.collisionNodeCount.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t _HashTreeStatistics.itemCount.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t _HashTreeStatistics.collisionCount.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t _HashTreeStatistics._collisionChainCount.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t _HashTreeStatistics.maxItemDepth.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t _HashTreeStatistics.capacityBytes.getter()
{
  return *(void *)(v0 + 56);
}

uint64_t _HashTreeStatistics.itemBytes.getter()
{
  return *(void *)(v0 + 64);
}

uint64_t _HashTreeStatistics.childBytes.getter()
{
  return *(void *)(v0 + 72);
}

uint64_t _HashTreeStatistics.freeBytes.getter()
{
  return *(void *)(v0 + 80);
}

uint64_t _HashTreeStatistics.grossBytes.getter()
{
  return *(void *)(v0 + 88);
}

double _HashTreeStatistics.averageItemDepth.getter()
{
  if (*v0 < 1) {
    return 0.0;
  }
  else {
    return (double)v0[6] / (double)v0[2];
  }
}

double _HashTreeStatistics.memoryEfficiency.getter()
{
  uint64_t v1 = *(void *)(v0 + 88);
  if (v1 < 1) {
    return 1.0;
  }
  else {
    return (double)*(uint64_t *)(v0 + 64) / (double)v1;
  }
}

double _HashTreeStatistics.averageNodeSize.getter()
{
  if (*v0 < 1) {
    return 0.0;
  }
  else {
    return (double)v0[7] / (double)*v0;
  }
}

void _HashTreeStatistics.averageLookupChainLength.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  if (v1 >= 1 && __OFADD__(v1, *(void *)(v0 + 32))) {
    __break(1u);
  }
}

uint64_t getEnumTagSinglePayload for _HashTreeStatistics(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 96)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for _HashTreeStatistics(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 96) = v3;
  return result;
}

ValueMetadata *type metadata accessor for _HashTreeStatistics()
{
  return &type metadata for _HashTreeStatistics;
}

uint64_t sub_24A5A9990(uint64_t result, uint64_t a2, void *a3, const void *a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (__OFADD__(*a3, 1))
  {
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v10 = result;
  ++*a3;
  unsigned int v11 = *(_DWORD *)result;
  __int32 v12 = *(_DWORD *)(result + 4);
  uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)*(unsigned int *)result);
  v13.i16[0] = vaddlv_u8(v13);
  if (*(_DWORD *)result == v12) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = v13.u32[0];
  }
  uint64_t v15 = a3[2];
  BOOL v16 = __OFADD__(v15, v14);
  uint64_t v17 = v15 + v14;
  if (v16) {
    goto LABEL_33;
  }
  a3[2] = v17;
  uint64_t result = _HashNode.isCollisionNode.getter((uint64_t)a4, a5, a7, a8, a9);
  if (result)
  {
    uint64_t v22 = a3[1];
    BOOL v16 = __OFADD__(v22, 1);
    uint64_t v23 = v22 + 1;
    if (v16)
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    a3[1] = v23;
    uint64_t v24 = a3[3];
    BOOL v16 = __OFADD__(v24, v14);
    uint64_t v25 = v24 + v14;
    if (v16)
    {
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    a3[3] = v25;
    uint64_t v26 = v14 * (v14 - 1);
    if ((unsigned __int128)(v14 * (__int128)(v14 - 1)) >> 64 != v26 >> 63)
    {
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
    uint64_t v27 = a3[4];
    BOOL v16 = __OFADD__(v27, v26 / 2);
    uint64_t v28 = v27 + v26 / 2;
    if (v16)
    {
LABEL_46:
      __break(1u);
      return result;
    }
    a3[4] = v28;
  }
  uint64_t v29 = *(void *)(*(void *)(a7 - 8) + 72);
  uint64_t v30 = *(void *)(*(void *)(a8 - 8) + 72);
  uint64_t v31 = (13108 * a6 + 52432) >> 16;
  uint64_t v32 = a3[5];
  uint64_t v33 = a3[6];
  if (v31 > v32) {
    uint64_t v32 = (13108 * a6 + 52432) >> 16;
  }
  a3[5] = v32;
  uint64_t v34 = v14 + v14 * (unint64_t)v31;
  BOOL v16 = __OFADD__(v33, v34);
  uint64_t v35 = v33 + v34;
  if (v16) {
    goto LABEL_34;
  }
  a3[6] = v35;
  uint64_t v36 = *(unsigned int *)(v10 + 8);
  uint64_t v37 = a3[7];
  BOOL v16 = __OFADD__(v37, v36);
  uint64_t v38 = v37 + v36;
  if (v16)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  a3[7] = v38;
  uint64_t v39 = *(unsigned int *)(v10 + 12);
  uint64_t v40 = a3[10];
  BOOL v16 = __OFADD__(v40, v39);
  uint64_t v41 = v40 + v39;
  if (v16)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  a3[10] = v41;
  BOOL v16 = __OFADD__(v29, v30);
  uint64_t v42 = v29 + v30;
  if (v16)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  uint64_t v43 = v14 * v42;
  if ((unsigned __int128)(v14 * (__int128)v42) >> 64 != (v14 * v42) >> 63)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v44 = a3[8];
  BOOL v16 = __OFADD__(v44, v43);
  uint64_t v45 = v44 + v43;
  if (v16)
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  a3[8] = v45;
  if (v11 == v12)
  {
    uint64_t v46 = 0;
  }
  else
  {
    v21.i32[0] = v12;
    uint8x8_t v47 = (uint8x8_t)vcnt_s8(v21);
    v47.i16[0] = vaddlv_u8(v47);
    uint64_t v46 = (16 * v47.i32[0]);
  }
  uint64_t v48 = a3[9];
  BOOL v16 = __OFADD__(v48, v46);
  uint64_t v49 = v48 + v46;
  if (v16) {
    goto LABEL_40;
  }
  a3[9] = v49;
  uint64_t result = _swift_stdlib_malloc_size(a4);
  uint64_t v50 = result - 32;
  if (result < 32) {
    uint64_t v50 = result - 17;
  }
  unint64_t v51 = a2 + (v50 & 0xFFFFFFFFFFFFFFF0) - (void)a4 - 16;
  BOOL v16 = __OFADD__(v51, 16);
  unint64_t v52 = v51 + 16;
  if (v16) {
    goto LABEL_41;
  }
  uint64_t v53 = a3[11];
  BOOL v16 = __OFADD__(v53, v52);
  uint64_t v54 = v53 + v52;
  if (v16)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  a3[11] = v54;
  uint64_t v55 = _HashNode.UnsafeHandle.children.getter();
  uint64_t v57 = v56;
  uint64_t v58 = type metadata accessor for _HashNode();
  MEMORY[0x24C5C7060](v55, v57, v58);
  sub_24A5BB570();
  uint64_t result = sub_24A5BB560();
  uint64_t v59 = v62;
  if (v62)
  {
    for (uint64_t i = v63; ; uint64_t i = v63)
    {
      sub_24A5A973C((a6 + 5), a3, v59, i, a7, a8, a9);
      swift_release();
      sub_24A5BB560();
      uint64_t v59 = v62;
    }
  }
  return result;
}

char *Range<>._toUInt()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(*(void *)(v3 + 24) + 16);
  uint64_t v72 = a1;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v77 = (char *)v67 - v8;
  uint64_t v9 = *(void *)(v5 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v69 = (char *)v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v74 = (char *)v67 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v78 = (char *)v67 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v75 = (char *)v67 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v70 = (char *)v67 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v76 = (char *)v67 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v79 = (char *)v67 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)v67 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)v67 - v27;
  uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v73 = v2;
  v29((char *)v67 - v27, v2, v5);
  uint64_t v82 = v3;
  char v30 = sub_24A5BBF70();
  uint64_t v80 = (void (*)(char *, char *, uint64_t))v29;
  uint64_t v81 = v9 + 16;
  v29(v26, (uint64_t)v28, v5);
  uint64_t v71 = v4;
  if ((v30 & 1) == 0)
  {
    uint64_t v33 = *(void (**)(char *, uint64_t))(v9 + 8);
    v33(v26, v5);
LABEL_5:
    uint64_t v34 = v78;
    uint64_t v35 = v28;
    uint64_t v36 = v76;
    uint64_t v37 = sub_24A5BBF60();
    v80(v36, v28, v5);
    uint64_t v68 = v9;
    if (v37 <= 63)
    {
      v33(v36, v5);
      goto LABEL_18;
    }
    unint64_t v83 = -1;
    char v38 = sub_24A5BBF70();
    uint64_t v39 = sub_24A5BBF60();
    if (v38)
    {
      if (v39 <= 64)
      {
        swift_getAssociatedConformanceWitness();
        sub_24A5BC580();
        uint64_t v40 = v79;
        sub_24A5BC500();
        LODWORD(v76) = sub_24A5BB410();
        v33(v40, v5);
        unint64_t v41 = v83;
        uint64_t v42 = v70;
        (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v70, v36, v5);
        if ((v76 & 1) == 0)
        {
          v33(v42, v5);
          uint64_t v34 = v78;
          goto LABEL_18;
        }
        unint64_t v43 = sub_24A5BBF50();
        v33(v42, v5);
        uint64_t v34 = v78;
        if (v41 >= v43)
        {
LABEL_18:
          uint64_t v78 = (char *)sub_24A5BBF50();
          v33(v35, v5);
          uint64_t v48 = v75;
          uint64_t v49 = v80;
          v80(v75, (char *)(v73 + *(int *)(v72 + 36)), v5);
          char v50 = sub_24A5BBF70();
          v49(v34, v48, v5);
          v67[1] = AssociatedTypeWitness;
          if (v50)
          {
            swift_getAssociatedConformanceWitness();
            sub_24A5BC580();
            unint64_t v51 = v79;
            sub_24A5BC500();
            char v52 = sub_24A5BB420();
            v33(v51, v5);
            v33(v34, v5);
            uint64_t v53 = v74;
            if (v52) {
              goto LABEL_35;
            }
          }
          else
          {
            v33(v34, v5);
            uint64_t v53 = v74;
          }
          uint64_t v54 = sub_24A5BBF60();
          v80(v53, v48, v5);
          if (v54 <= 63)
          {
            uint64_t v55 = v53;
LABEL_24:
            v33(v55, v5);
            goto LABEL_25;
          }
          unint64_t v83 = -1;
          char v57 = sub_24A5BBF70();
          uint64_t v58 = sub_24A5BBF60();
          if (v57)
          {
            if (v58 <= 64)
            {
              swift_getAssociatedConformanceWitness();
              sub_24A5BC580();
              uint64_t v59 = v79;
              sub_24A5BC500();
              char v60 = sub_24A5BB410();
              v33(v59, v5);
              unint64_t v61 = v83;
              uint64_t v62 = v69;
              (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v69, v53, v5);
              if ((v60 & 1) == 0)
              {
                uint64_t v55 = v62;
                goto LABEL_24;
              }
              unint64_t v63 = sub_24A5BBF50();
              v33(v62, v5);
              if (v61 < v63) {
                goto LABEL_35;
              }
LABEL_25:
              sub_24A5BBF50();
              v33(v48, v5);
              return v78;
            }
          }
          else if (v58 < 65)
          {
            unint64_t v66 = sub_24A5BBF50();
            v33(v53, v5);
            if (v83 < v66)
            {
LABEL_35:
              uint8x8_t v47 = v48;
              goto LABEL_36;
            }
            goto LABEL_25;
          }
          sub_24A49A24C();
          uint64_t v64 = v79;
          sub_24A5BBEF0();
          char v65 = sub_24A5BB420();
          v33(v64, v5);
          v33(v53, v5);
          if (v65) {
            goto LABEL_35;
          }
          goto LABEL_25;
        }
LABEL_16:
        uint8x8_t v47 = v35;
LABEL_36:
        v33(v47, v5);
        return 0;
      }
    }
    else if (v39 < 65)
    {
      unint64_t v46 = sub_24A5BBF50();
      v33(v36, v5);
      uint64_t v34 = v78;
      if (v83 >= v46) {
        goto LABEL_18;
      }
      goto LABEL_16;
    }
    sub_24A49A24C();
    uint64_t v44 = v79;
    sub_24A5BBEF0();
    char v45 = sub_24A5BB420();
    v33(v44, v5);
    v33(v36, v5);
    uint64_t v34 = v78;
    if ((v45 & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  swift_getAssociatedConformanceWitness();
  sub_24A5BC580();
  uint64_t v31 = v79;
  sub_24A5BC500();
  char v32 = sub_24A5BB420();
  uint64_t v33 = *(void (**)(char *, uint64_t))(v9 + 8);
  v33(v31, v5);
  v33(v26, v5);
  if ((v32 & 1) == 0) {
    goto LABEL_5;
  }
  v33(v28, v5);
  return 0;
}

uint64_t Range<>._clampedToUInt()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v118 = *(void *)(*(void *)(*(void *)(a2 + 8) + 24) + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v116 = (char *)&v106 - v6;
  uint64_t v7 = *(void *)(v4 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  int v107 = (char *)&v106 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v111 = (void (*)(char *, uint64_t))((char *)&v106 - v11);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v112 = (char *)&v106 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v106 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  unint64_t v113 = (char *)&v106 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v106 = (char *)&v106 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v110 = (char *)&v106 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v114 = (char *)&v106 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint8x8_t v108 = (char *)&v106 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v115 = (char *)&v106 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)&v106 - v30;
  uint64_t v32 = MEMORY[0x270FA5388](v29);
  uint64_t v34 = (char *)&v106 - v33;
  uint64_t v35 = MEMORY[0x270FA5388](v32);
  uint64_t v120 = (char *)&v106 - v36;
  MEMORY[0x270FA5388](v35);
  char v38 = (char *)&v106 - v37;
  uint64_t v39 = v2;
  uint64_t v40 = v2 + *(int *)(v3 + 36);
  uint64_t v123 = v7;
  unint64_t v41 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v119 = v40;
  uint64_t v121 = v41;
  uint64_t v122 = v7 + 16;
  ((void (*)(char *))v41)((char *)&v106 - v37);
  LOBYTE(v3) = sub_24A5BBF70();
  uint64_t v42 = sub_24A5BBF60();
  uint64_t v109 = v16;
  if (v3)
  {
    if (v42 <= 64) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v124 = 0;
    sub_24A499FC8();
    uint8x8_t v47 = v120;
    sub_24A5BBEF0();
    char v48 = sub_24A5BB420();
    uint64_t v49 = *(void (**)(char *, uint64_t))(v123 + 8);
    v49(v47, v4);
    uint64_t v44 = v49;
    v49(v38, v4);
    uint64_t v46 = 0;
    uint64_t v45 = v39;
    if ((v48 & 1) == 0) {
      return v46;
    }
    goto LABEL_7;
  }
  if (v42 > 63) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v43 = sub_24A5BBF50();
  uint64_t v44 = *(void (**)(char *, uint64_t))(v123 + 8);
  v44(v38, v4);
  uint64_t v45 = v39;
  if (v43 <= 0) {
    return 0;
  }
LABEL_7:
  v121(v34, v45, v4);
  if ((sub_24A5BBF70() & 1) == 0)
  {
    if (sub_24A5BBF60() >= 64) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  char v50 = sub_24A5BBF70();
  uint64_t v51 = sub_24A5BBF60();
  if ((v50 & 1) == 0)
  {
    if (v51 >= 64)
    {
LABEL_16:
      uint64_t v46 = -1;
      unint64_t v124 = -1;
      sub_24A49A24C();
      uint64_t v55 = v120;
      sub_24A5BBEF0();
      char v56 = sub_24A5BB420();
      v44(v55, v4);
      v44(v34, v4);
      if ((v56 & 1) == 0) {
        return v46;
      }
      goto LABEL_17;
    }
LABEL_13:
    uint64_t v54 = sub_24A5BBF50();
    v44(v34, v4);
    if (v54 == -1) {
      return -1;
    }
    goto LABEL_17;
  }
  if (v51 > 64) {
    goto LABEL_16;
  }
  swift_getAssociatedConformanceWitness();
  sub_24A5BC580();
  char v52 = v120;
  sub_24A5BC500();
  char v53 = sub_24A5BB420();
  v44(v52, v4);
  v121(v31, (uint64_t)v34, v4);
  if (v53)
  {
    v44(v31, v4);
    v44(v34, v4);
    goto LABEL_17;
  }
  uint64_t v73 = sub_24A5BBF50();
  v44(v31, v4);
  v44(v34, v4);
  if (v73 == -1) {
    return -1;
  }
LABEL_17:
  char v57 = v115;
  v121(v115, v45, v4);
  if (sub_24A5BBF70())
  {
    uint64_t v58 = sub_24A5BBF60();
    uint64_t v59 = v44;
    char v60 = v114;
    if (v58 < 64)
    {
      uint64_t v61 = sub_24A5BBF50();
      v44(v57, v4);
      uint64_t v62 = v113;
      if (v61 < 0) {
        goto LABEL_44;
      }
      goto LABEL_36;
    }
    unint64_t v124 = 0;
    sub_24A499FC8();
    uint64_t v67 = v120;
    sub_24A5BBEF0();
    char v68 = sub_24A5BB420();
    v44(v67, v4);
    v44(v57, v4);
    uint64_t v46 = 0;
    uint64_t v62 = v113;
    if ((v68 & 1) == 0) {
      goto LABEL_36;
    }
  }
  else
  {
    char v63 = sub_24A5BBF70();
    uint64_t v64 = sub_24A5BBF60();
    uint64_t v59 = v44;
    char v60 = v114;
    if ((v63 & 1) == 0)
    {
      uint64_t v62 = v113;
      if (v64 < 64)
      {
        uint64_t v69 = sub_24A5BBF50();
        v59(v57, v4);
        if (v69 < 0) {
          goto LABEL_44;
        }
      }
      else
      {
        v59(v57, v4);
      }
      goto LABEL_36;
    }
    uint64_t v62 = v113;
    if (v64 <= 64)
    {
      swift_getAssociatedConformanceWitness();
      sub_24A5BC580();
      uint64_t v70 = v120;
      sub_24A5BC500();
      uint64_t v71 = v115;
      char v72 = sub_24A5BB420();
      v59(v70, v4);
      char v57 = v108;
      v121(v108, (uint64_t)v71, v4);
      if (v72)
      {
        v59(v57, v4);
        v59(v71, v4);
      }
      else
      {
        uint64_t v74 = sub_24A5BBF50();
        v59(v57, v4);
        v59(v71, v4);
        if ((v74 & 0x8000000000000000) == 0) {
          goto LABEL_36;
        }
      }
LABEL_44:
      uint64_t v46 = 0;
      goto LABEL_52;
    }
    unint64_t v124 = 0;
    sub_24A499FC8();
    char v65 = v120;
    sub_24A5BBEF0();
    char v57 = v115;
    char v66 = sub_24A5BB420();
    v59(v65, v4);
    v59(v57, v4);
    uint64_t v46 = 0;
    if ((v66 & 1) == 0)
    {
LABEL_36:
      v121(v60, v45, v4);
      if (sub_24A5BBF70())
      {
        swift_getAssociatedConformanceWitness();
        sub_24A5BC580();
        char v57 = v120;
        sub_24A5BC500();
        char v75 = sub_24A5BB430();
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v59)(v57, v4);
        if ((v75 & 1) == 0) {
          goto LABEL_79;
        }
      }
      if (sub_24A5BBF60() < 64) {
        goto LABEL_51;
      }
      uint64_t v77 = v110;
      v121(v110, (uint64_t)v60, v4);
      unint64_t v124 = -1;
      char v78 = sub_24A5BBF70();
      uint64_t v79 = sub_24A5BBF60();
      if (v78)
      {
        if (v79 <= 64)
        {
          swift_getAssociatedConformanceWitness();
          sub_24A5BC580();
          char v57 = v120;
          sub_24A5BC500();
          char v80 = sub_24A5BB410();
          uint64_t v81 = v123;
          v59(v57, v4);
          unint64_t v82 = v124;
          unint64_t v83 = *(void (**)(char *, char *, uint64_t))(v81 + 32);
          char v60 = v106;
          v83(v106, v77, v4);
          if ((v80 & 1) == 0)
          {
LABEL_50:
            v59(v60, v4);
            char v60 = v114;
            goto LABEL_51;
          }
          unint64_t v84 = sub_24A5BBF50();
          v59(v60, v4);
          char v60 = v114;
          if (v82 < v84)
          {
LABEL_49:
            __break(1u);
            goto LABEL_50;
          }
LABEL_51:
          uint64_t v46 = sub_24A5BBF50();
          v59(v60, v4);
          goto LABEL_52;
        }
      }
      else if (v79 < 65)
      {
        unint64_t v86 = sub_24A5BBF50();
        v59(v77, v4);
        if (v124 < v86) {
          goto LABEL_49;
        }
        goto LABEL_51;
      }
      sub_24A49A24C();
      char v57 = v120;
      sub_24A5BBEF0();
      char v85 = sub_24A5BB420();
      v59(v57, v4);
      v59(v77, v4);
      if (v85) {
        goto LABEL_49;
      }
      goto LABEL_51;
    }
  }
LABEL_52:
  v121(v62, v119, v4);
  char v87 = sub_24A5BBF70();
  uint64_t v88 = sub_24A5BBF60();
  if (v87)
  {
    if (v88 <= 64)
    {
      swift_getAssociatedConformanceWitness();
      sub_24A5BC580();
      char v57 = v120;
      sub_24A5BC500();
      char v89 = sub_24A5BB410();
      v59(v57, v4);
      int v90 = v109;
      v121(v109, (uint64_t)v62, v4);
      if (v89) {
        sub_24A5BBF50();
      }
      v59(v90, v4);
      goto LABEL_61;
    }
LABEL_58:
    unint64_t v124 = -1;
    sub_24A49A24C();
    char v57 = v120;
    sub_24A5BBEF0();
    char v91 = sub_24A5BB420();
    v59(v57, v4);
    v59(v62, v4);
    if (v91) {
      return v46;
    }
    goto LABEL_62;
  }
  if (v88 >= 65) {
    goto LABEL_58;
  }
  sub_24A5BBF50();
LABEL_61:
  v59(v62, v4);
LABEL_62:
  uint64_t v92 = v112;
  v121(v112, v119, v4);
  if ((sub_24A5BBF70() & 1) == 0
    || (swift_getAssociatedConformanceWitness(),
        sub_24A5BC580(),
        char v57 = v120,
        sub_24A5BC500(),
        char v93 = sub_24A5BB430(),
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v59)(v57, v4),
        (v93 & 1) != 0))
  {
    if (sub_24A5BBF60() < 64) {
      goto LABEL_76;
    }
    uint64_t v94 = v111;
    v121((char *)v111, (uint64_t)v92, v4);
    unint64_t v124 = -1;
    char v95 = sub_24A5BBF70();
    uint64_t v96 = sub_24A5BBF60();
    if (v95)
    {
      if (v96 <= 64)
      {
        swift_getAssociatedConformanceWitness();
        sub_24A5BC580();
        uint64_t v97 = v120;
        sub_24A5BC500();
        uint64_t v94 = v59;
        uint64_t v98 = (char *)v111;
        char v99 = sub_24A5BB410();
        uint64_t v100 = v123;
        v94(v97, v4);
        unint64_t v101 = v124;
        char v57 = v107;
        (*(void (**)(char *, char *, uint64_t))(v100 + 32))(v107, v98, v4);
        if ((v99 & 1) == 0)
        {
LABEL_75:
          v94(v57, v4);
          uint64_t v59 = v94;
          uint64_t v92 = v112;
          goto LABEL_76;
        }
        unint64_t v102 = sub_24A5BBF50();
        v94(v57, v4);
        uint64_t v59 = v94;
        uint64_t v92 = v112;
        if (v101 < v102)
        {
LABEL_74:
          __break(1u);
          goto LABEL_75;
        }
LABEL_76:
        sub_24A5BBF50();
        v59(v92, v4);
        return v46;
      }
    }
    else if (v96 < 65)
    {
      char v104 = (char *)v111;
      unint64_t v105 = sub_24A5BBF50();
      v59(v104, v4);
      if (v124 < v105) {
        goto LABEL_74;
      }
      goto LABEL_76;
    }
    sub_24A49A24C();
    char v57 = v120;
    sub_24A5BBEF0();
    uint64_t v94 = v111;
    char v103 = sub_24A5BB420();
    v59(v57, v4);
    v59((char *)v94, v4);
    if (v103) {
      goto LABEL_74;
    }
    goto LABEL_76;
  }
  __break(1u);
LABEL_79:
  __break(1u);
  return result;
}

uint64_t BitSet.intersection(_:)(int8x16_t *a1, int8x16_t *a2)
{
  if (a1[1].i64[0] >= (unint64_t)a2[1].i64[0]) {
    unint64_t v2 = a2[1].u64[0];
  }
  else {
    unint64_t v2 = a1[1].u64[0];
  }
  if (!v2)
  {
    int64_t v7 = 0;
    uint64_t result = MEMORY[0x263F8EE78];
    goto LABEL_23;
  }
  uint64_t result = sub_24A5BB990();
  *(void *)(result + 16) = v2;
  if (v2 < 0xA)
  {
    uint64_t v6 = 0;
LABEL_13:
    unint64_t v13 = v2 - v6;
    uint64_t v14 = 8 * v6 + 32;
    uint64_t v15 = (uint64_t *)(result + v14);
    uint64_t v16 = (uint64_t *)((char *)a1->i64 + v14);
    uint64_t v17 = (uint64_t *)((char *)a2->i64 + v14);
    do
    {
      uint64_t v19 = *v17++;
      uint64_t v18 = v19;
      uint64_t v20 = *v16++;
      *v15++ = v20 & v18;
      --v13;
    }
    while (v13);
    goto LABEL_15;
  }
  uint64_t v6 = 0;
  if ((unint64_t)(result - (void)a2) < 0x20) {
    goto LABEL_13;
  }
  if ((unint64_t)(result - (void)a1) < 0x20) {
    goto LABEL_13;
  }
  uint64_t v6 = v2 & 0x7FFFFFFFFFFFFFFCLL;
  uint64_t v8 = a2 + 3;
  uint64_t v9 = a1 + 3;
  uint64_t v10 = (int8x16_t *)(result + 48);
  uint64_t v11 = v2 & 0x7FFFFFFFFFFFFFFCLL;
  do
  {
    int8x16_t v12 = vandq_s8(*v9, *v8);
    v10[-1] = vandq_s8(v9[-1], v8[-1]);
    *uint64_t v10 = v12;
    v8 += 2;
    v9 += 2;
    v10 += 2;
    v11 -= 4;
  }
  while (v11);
  if (v2 != v6) {
    goto LABEL_13;
  }
LABEL_15:
  if (*(void *)(result + 32 + 8 * v2 - 8))
  {
    int64_t v7 = v2;
  }
  else
  {
    unint64_t v21 = v2;
    while (1)
    {
      int64_t v7 = v21 - 1;
      if ((uint64_t)(v21 - 1) < 1) {
        break;
      }
      if (*(void *)(result + 8 * v21-- + 16))
      {
        if ((uint64_t)v2 >= v7) {
          goto LABEL_23;
        }
        __break(1u);
        break;
      }
    }
    int64_t v7 = 0;
  }
LABEL_23:
  *(void *)(result + 16) = v7;
  return result;
}

uint64_t BitSet.intersection(_:)(int8x16_t *a1, uint64_t a2, int8x16_t *a3)
{
  return BitSet.intersection(_:)(a1, a3);
}

uint64_t BitSet.intersection(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t BitSet.intersection<A>(_:)(uint64_t a1, int8x16_t *a2, ValueMetadata *a3)
{
  Description = (void (**)(char *, void, ValueMetadata *))a3[-1].Description;
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26979AEC0);
  Description[2](v8, a1, a3);
  if ((ValueMetadata *)v9 == a3)
  {
    swift_dynamicCast();
    uint64_t v12 = v17;
    uint64_t v13 = v18;
    uint64_t v16 = a2;
    swift_bridgeObjectRetain();
    BitSet.formIntersection(_:)(v12, v13);
    uint64_t v11 = (uint64_t)v16;
  }
  else
  {
    uint64_t v10 = (int8x16_t *)BitSet.init<A>(_validMembersOf:)((uint64_t)v8, a3);
    uint64_t v11 = BitSet.intersection(_:)(v10, a2);
    swift_bridgeObjectRelease();
  }
  ((void (*)(uint64_t, ValueMetadata *))Description[1])(a1, a3);
  return v11;
}

BOOL BitSet.isStrictSubset(of:)(void *a1, void *a2)
{
  unint64_t v2 = a2[2];
  unint64_t v3 = a1[2];
  if (v3 >= v2)
  {
    BOOL result = v2 < v3;
    if (!v2) {
      return result;
    }
    uint64_t v6 = a2[4];
    uint64_t v7 = a1[4];
    if ((v6 & ~v7) == 0)
    {
      unint64_t v8 = v2 - 1;
      uint64_t v9 = a2 + 5;
      uint64_t v10 = a1 + 5;
      do
      {
        if (result)
        {
          BOOL result = 1;
          if (!v8) {
            return result;
          }
        }
        else
        {
          BOOL result = v6 != v7;
          if (!v8) {
            return result;
          }
        }
        uint64_t v11 = *v9++;
        uint64_t v6 = v11;
        uint64_t v12 = *v10++;
        uint64_t v7 = v12;
        --v8;
      }
      while ((v6 & ~v12) == 0);
    }
  }
  return 0;
}

uint64_t BitSet.isStrictSubset(of:)(uint64_t a1, int64_t a2, uint64_t a3)
{
  uint64_t v6 = a3 + 32;
  if (a2 <= 0) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = a1 & ~(a1 >> 63);
  }
  char v8 = _UnsafeBitSet.isSubset(of:)(v7, a2 & ~(a2 >> 63), (void *)(a3 + 32), *(void *)(a3 + 16));
  char v9 = 0;
  if ((v8 & 1) != 0 && a1 != a2)
  {
    if ((a2 | a1) < 0) {
      char v9 = 1;
    }
    else {
      char v9 = _UnsafeBitSet.isSuperset(of:)(a1, a2, v6, *(void *)(a3 + 16)) ^ 1;
    }
  }
  return v9 & 1;
}

unint64_t BitSet.isStrictSubset<A>(of:)(uint64_t a1, int8x8_t *a2, ValueMetadata *a3, uint64_t a4)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v12 = (char *)&v25 - v11;
  Description = (void (**)(char *, void, ValueMetadata *))a3[-1].Description;
  MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3 == &type metadata for BitSet)
  {
    Description[2](v15, a1, &type metadata for BitSet);
LABEL_8:
    swift_dynamicCast();
    char v16 = BitSet.isStrictSubset(of:)(v26, a2);
    swift_bridgeObjectRelease();
    return v16 & 1;
  }
  if (a3 == &type metadata for BitSet.Counted)
  {
    Description[2](v15, a1, &type metadata for BitSet.Counted);
    goto LABEL_8;
  }
  if ((ValueMetadata *)__swift_instantiateConcreteTypeFromMangledName(&qword_26979AEC0) == a3)
  {
    Description[2](v15, a1, a3);
    swift_dynamicCast();
    char v16 = BitSet.isStrictSubset(of:)((uint64_t)v26, v27, (uint64_t)a2);
    return v16 & 1;
  }
  if (BitSet.isEmpty.getter((uint64_t)a2))
  {
    Description[2](v15, a1, a3);
    sub_24A5BB840();
    swift_getAssociatedConformanceWitness();
    sub_24A5BBEE0();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, AssociatedTypeWitness);
    char v16 = v27 ^ 1;
    return v16 & 1;
  }
  unint64_t result = (unint64_t)a2[2];
  if (result)
  {
    uint64_t v18 = 0;
    uint64_t v19 = a2 + 4;
    uint64_t v20 = 8 * result;
    while (1)
    {
      uint8x8_t v21 = (uint8x8_t)vcnt_s8(*v19);
      v21.i16[0] = vaddlv_u8(v21);
      BOOL v22 = __OFADD__(v18, v21.u32[0]);
      v18 += v21.u32[0];
      if (v22) {
        break;
      }
      ++v19;
      v20 -= 8;
      if (!v20) {
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    uint64_t v23 = MEMORY[0x270FA5388](result);
    *(&v25 - 6) = (uint64_t)a3;
    *(&v25 - 5) = a4;
    *(&v25 - 4) = a1;
    *(&v25 - 3) = (uint64_t)a2;
    *(&v25 - 2) = v24;
    LOBYTE(v26) = 2;
    unint64_t result = (unint64_t)sub_24A5813E4(v23, &v26, (void *(*)(char *__return_ptr, unsigned char **))sub_24A5AC448);
    if (v26 != 2)
    {
      char v16 = v26 & 1;
      return v16 & 1;
    }
  }
  __break(1u);
  return result;
}

BOOL BitSet.isStrictSubset(of:)(void *a1, uint64_t a2, void *a3)
{
  return BitSet.isStrictSubset(of:)(a1, a3);
}

uint64_t sub_24A5AC11C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  uint64_t v25 = a4;
  uint64_t v26 = a1;
  uint64_t v28 = a6;
  uint64_t v9 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v27 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v14 = (char *)&v25 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, a5);
  sub_24A5BB840();
  swift_getAssociatedConformanceWitness();
  sub_24A5BBEE0();
  if ((v30 & 1) == 0)
  {
    char v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = a3 + 32;
    while (1)
    {
      if ((v29 & 0x8000000000000000) != 0 || (unint64_t v20 = v29 >> 6, v29 >> 6 >= *(void *)(a3 + 16)))
      {
LABEL_9:
        while (1)
        {
          sub_24A5BBEE0();
          if (v30) {
            goto LABEL_2;
          }
          if ((v29 & 0x8000000000000000) == 0)
          {
            unint64_t v20 = v29 >> 6;
            if (v29 >> 6 < *(void *)(a3 + 16))
            {
              uint64_t v21 = *(void *)(v19 + 8 * v20);
              char v17 = 1;
              uint64_t v22 = 1 << v29;
              goto LABEL_8;
            }
          }
        }
      }
      uint64_t v21 = *(void *)(v19 + 8 * v20);
      uint64_t v22 = 1 << v29;
LABEL_8:
      if ((v21 & v22) == 0) {
        goto LABEL_9;
      }
      uint64_t v23 = 8 * v20;
      uint64_t v24 = *(void *)(*v26 + v23);
      *(void *)(*v26 + v23) = v24 | v22;
      if ((v24 & v22) == 0 && ++v18 == v25) {
        break;
      }
      sub_24A5BBEE0();
      if (v30 == 1) {
        goto LABEL_2;
      }
    }
    if (v17)
    {
LABEL_22:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v14, AssociatedTypeWitness);
      char v16 = 1;
      goto LABEL_3;
    }
    while (1)
    {
      sub_24A5BBEE0();
      if (v30 == 1) {
        break;
      }
      if ((v29 & 0x8000000000000000) != 0
        || v29 >> 6 >= *(void *)(a3 + 16)
        || ((*(void *)(v19 + 8 * (v29 >> 6)) >> v29) & 1) == 0)
      {
        goto LABEL_22;
      }
    }
  }
LABEL_2:
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v14, AssociatedTypeWitness);
  char v16 = 0;
LABEL_3:
  *uint64_t v28 = v16;
  return result;
}

uint64_t sub_24A5AC448@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  return sub_24A5AC11C(a1, v2[4], v2[5], v2[6], v2[2], a2);
}

uint64_t sub_24A5AC474(uint64_t result, unint64_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = *(void *)(*v2 + 8 * (a2 >> 6));
    uint64_t v4 = v3 & ((-1 << (a2 & 0x3F)) - 1);
    uint64_t v5 = v3 | (1 << (a2 & 0x3F));
    if ((result & 1) == 0) {
      uint64_t v5 = v4;
    }
    *(void *)(*v2 + 8 * (a2 >> 6)) = v5;
  }
  return result;
}

unint64_t sub_24A5AC4B8(unint64_t result, unint64_t a2)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  int64_t v3 = v2[2];
  if (v3 < 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (v3 < (uint64_t)a2)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (__OFSUB__(a2, result))
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if ((uint64_t)(a2 - result) < 1) {
    return result;
  }
  if ((a2 & 0x8000000000000000) != 0) {
    goto LABEL_28;
  }
  int64_t v4 = result >> 6;
  char v5 = result & 0x3F;
  BOOL v6 = a2 > 0x3F;
  BOOL v7 = (a2 & 0x3F) == 0;
  uint64_t v8 = v6 & v7;
  if (v6 && v7) {
    char v9 = 64;
  }
  else {
    char v9 = a2 & 0x3F;
  }
  int64_t v10 = (a2 >> 6) - v8;
  uint64_t v11 = *v2;
  if (v4 == v10)
  {
    if (a2 > 0x3F && v7) {
      uint64_t v12 = -1;
    }
    else {
      uint64_t v12 = ~(-1 << v9);
    }
    uint64_t v13 = (-1 << v5) ^ ~v12;
    int64_t v10 = result >> 6;
    goto LABEL_22;
  }
  *(void *)(v11 + 8 * v4) |= -1 << v5;
  if (v10 <= v4) {
    goto LABEL_29;
  }
  if (v4 + 1 == v10) {
    goto LABEL_19;
  }
  if (v4 + 1 >= v10)
  {
LABEL_30:
    __break(1u);
    return result;
  }
  uint64_t result = (unint64_t)memset((void *)(v11 + 8 * v4 + 8), 255, 8 * (v10 + ~v4));
LABEL_19:
  if (v8) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = ~(-1 << v9);
  }
LABEL_22:
  *(void *)(v11 + 8 * v10) |= v13;
  return result;
}

void sub_24A5AC5E8(unint64_t a1, unint64_t a2)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  int64_t v3 = v2[2];
  if (v3 < 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (v3 < (uint64_t)a2)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (__OFSUB__(a2, a1))
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if ((uint64_t)(a2 - a1) < 1) {
    return;
  }
  if ((a2 & 0x8000000000000000) != 0) {
    goto LABEL_28;
  }
  int64_t v4 = a1 >> 6;
  char v5 = a1 & 0x3F;
  unint64_t v6 = a2 >> 6;
  BOOL v7 = a2 > 0x3F;
  BOOL v8 = (a2 & 0x3F) == 0;
  uint64_t v9 = v7 & v8;
  if (v7 && v8) {
    char v10 = 64;
  }
  else {
    char v10 = a2 & 0x3F;
  }
  int64_t v11 = v6 - v9;
  uint64_t v12 = *v2;
  if (v4 == v6 - v9)
  {
    if (a2 > 0x3F && v8) {
      uint64_t v13 = -1;
    }
    else {
      uint64_t v13 = ~(-1 << v10);
    }
    uint64_t v14 = v13 ^ (-1 << v5);
    int64_t v11 = a1 >> 6;
    goto LABEL_22;
  }
  *(void *)(v12 + 8 * v4) &= ~(-1 << v5);
  if (v11 <= v4) {
    goto LABEL_29;
  }
  if (v4 + 1 == v11) {
    goto LABEL_19;
  }
  if (v4 + 1 >= v11)
  {
LABEL_30:
    __break(1u);
    return;
  }
  bzero((void *)(v12 + 8 * v4 + 8), 8 * (v11 + ~v4));
LABEL_19:
  if (v9) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = -1 << v10;
  }
LABEL_22:
  *(void *)(v12 + 8 * v11) &= v14;
}

uint64_t BitArray._UnsafeHandle._count.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t BitArray._UnsafeHandle._count.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*BitArray._UnsafeHandle._count.modify())(void, void, void, void, void)
{
  return nullsub_1;
}

ValueMetadata *type metadata accessor for BitArray._UnsafeHandle()
{
  return &type metadata for BitArray._UnsafeHandle;
}

uint64_t _HashTable.UnsafeHandle.bucketCount.getter(void *a1)
{
  return 1 << *a1;
}

uint64_t _HashTable.UnsafeHandle._find<A>(_:in:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v44 = a2;
  uint64_t v46 = a6;
  uint64_t v12 = *(void *)(*(void *)(a6 + 8) + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v14 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v40 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v39 = (char *)&v37 - v16;
  uint64_t v42 = v12;
  uint64_t v45 = a5;
  uint64_t v17 = swift_getAssociatedTypeWitness();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  unint64_t v20 = (char *)&v37 - v19;
  uint64_t v43 = a1;
  uint64_t v47 = a7;
  uint64_t result = sub_24A5BB370();
  uint64_t v22 = 1 << *a3;
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    _HashTable.UnsafeHandle.startFind(_:)(v24 & result, a3, a4, (uint64_t)&v49);
    unint64_t v25 = v51;
    if ((v52 & 1) == 0)
    {
      uint64_t v26 = (void (**)(char *, uint64_t))(v13 + 8);
      char v38 = (void (**)(char *))(v18 + 16);
      uint64_t v37 = (void (**)(char *, uint64_t))(v18 + 8);
      uint64_t v27 = v39;
      while (1)
      {
        uint64_t v28 = v40;
        sub_24A5BBAD0();
        sub_24A5BBAA0();
        unint64_t v29 = v25;
        char v30 = *v26;
        uint64_t v31 = v28;
        uint64_t v32 = AssociatedTypeWitness;
        (*v26)(v31, AssociatedTypeWitness);
        uint64_t v33 = sub_24A5BBC20();
        (*v38)(v20);
        ((void (*)(char *, void))v33)(v48, 0);
        v30(v27, v32);
        LOBYTE(v33) = sub_24A5BB530();
        (*v37)(v20, v17);
        if (v33) {
          return v29;
        }
        _HashTable.BucketIterator.advance()();
        if (!*((void *)&v50 + 1)) {
          break;
        }
        uint64_t v34 = -1 << *(void *)v49;
        unint64_t v35 = (v34 ^ ~*((void *)&v50 + 1)) + (*(uint64_t *)(v49 + 8) >> 6);
        if (v35 >= ~v34) {
          uint64_t v36 = ~v34;
        }
        else {
          uint64_t v36 = 0;
        }
        unint64_t v25 = v35 - v36;
      }
      return 0;
    }
    return v25;
  }
  return result;
}

uint64_t _HashTable.UnsafeHandle.scale.getter(void *a1)
{
  return *a1 & 0x3FLL;
}

uint64_t _HashTable.UnsafeHandle.seed.getter(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t _HashTable.UnsafeHandle.position(of:)(uint64_t a1, void *a2)
{
  return ((*a2 & 0x3FLL) * a1) >> 6;
}

uint64_t _HashTable.UnsafeHandle.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(void *)(a3 + 8 * a1);
}

uint64_t _HashTable.UnsafeHandle.bucketMask.getter(void *a1)
{
  return ~(-1 << *a1);
}

void *_HashTable.UnsafeHandle.wordCount.getter(void *result)
{
  uint64_t v1 = (*result & 0x3FLL) << *result;
  BOOL v2 = __OFADD__(v1, 64);
  uint64_t v3 = v1 + 64;
  if (v2)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = v3 - 1;
    BOOL v4 = v3 < 1;
    uint64_t v6 = v3 + 62;
    if (!v4) {
      uint64_t v6 = v5;
    }
    return (void *)(v6 >> 6);
  }
  return result;
}

Swift::Int __swiftcall _HashTable.UnsafeHandle.word(after:)(Swift::Int after)
{
  if (__OFADD__(after, 1))
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v2 = (*v1 & 0x3FLL) << *v1;
  BOOL v3 = __OFADD__(v2, 64);
  uint64_t v4 = v2 + 64;
  if (v3)
  {
LABEL_9:
    __break(1u);
    return after;
  }
  uint64_t v6 = v4 - 1;
  BOOL v5 = v4 < 1;
  uint64_t v7 = v4 + 62;
  if (!v5) {
    uint64_t v7 = v6;
  }
  if (after + 1 == v7 >> 6) {
    return 0;
  }
  return ++after;
}

Swift::Int_optional __swiftcall _HashTable.UnsafeHandle._value(forBucketContents:)(Swift::UInt64 forBucketContents)
{
  if (forBucketContents)
  {
    uint64_t v2 = -1 << *v1;
    Swift::UInt64 v3 = (v2 ^ ~forBucketContents) + ((uint64_t)v1[1] >> 6);
    if (v3 >= ~v2) {
      uint64_t v4 = ~v2;
    }
    else {
      uint64_t v4 = 0;
    }
    Swift::Int v5 = v3 - v4;
  }
  else
  {
    Swift::Int v5 = 0;
  }
  Swift::Bool v6 = forBucketContents == 0;
  Swift::Int v7 = v5;
  result.value = v7;
  result.is_nil = v6;
  return result;
}

Swift::UInt64 __swiftcall _HashTable.UnsafeHandle._bucketContents(for:)(Swift::Int_optional a1)
{
  if (a1.is_nil) {
    return 0;
  }
  else {
    return (-1 << *v1) ^ ~((((a1.value - ((uint64_t)v1[1] >> 6)) >> 63) & ~(-1 << *v1))
  }
                           + a1.value
                           - ((uint64_t)v1[1] >> 6));
}

uint64_t _HashTable.UnsafeHandle.subscript.setter(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(a4 + 8 * a2) = result;
  return result;
}

uint64_t _HashTable.UnsafeHandle.fill<A>(uncheckedUniqueElements:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v72 = a6;
  uint64_t v77 = a2;
  uint64_t v75 = a1;
  uint64_t v8 = *(void *)(*(void *)(a5 + 8) + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  char v60 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  char v68 = (char *)&v58 - v9;
  uint64_t v10 = swift_getAssociatedTypeWitness();
  uint64_t v76 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v67 = (char *)&v58 - v11;
  uint64_t v12 = sub_24A5BBD20();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v59 = (char *)&v58 - v13;
  uint64_t v14 = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](v14);
  swift_getAssociatedConformanceWitness();
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v58 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v58 - v16;
  uint64_t v70 = v8;
  uint64_t v71 = a4;
  sub_24A5BBB20();
  sub_24A5BB840();
  uint64_t v18 = v59;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v73 = v17;
  uint64_t v74 = v15;
  uint64_t v66 = AssociatedConformanceWitness;
  sub_24A5BBEE0();
  uint64_t v20 = v76;
  uint64_t v64 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v76 + 48);
  uint64_t v65 = v76 + 48;
  if (v64(v18, 1, v10) == 1) {
    return (*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v73, v74);
  }
  uint64_t v21 = 0;
  char v63 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
  uint64_t v62 = (void (**)(char *))(v60 + 2);
  uint64_t v76 = v20 + 32;
  uint64_t v61 = (void (**)(char *, uint64_t))(v20 + 8);
  ++v60;
  while (1)
  {
    uint64_t v22 = v67;
    BOOL v23 = v18;
    v63(v67, v18, v10);
    uint64_t v24 = (void (*)(void *, void))sub_24A5BBC20();
    uint64_t v26 = v68;
    uint64_t v25 = AssociatedTypeWitness;
    (*v62)(v68);
    v24(v78, 0);
    (*v61)(v22, v10);
    uint64_t v27 = v77;
    uint64_t v28 = sub_24A5BB370();
    uint64_t v29 = 1 << *v27;
    BOOL v30 = __OFSUB__(v29, 1);
    uint64_t v31 = v29 - 1;
    if (v30) {
      goto LABEL_40;
    }
    uint64_t v32 = v10;
    uint64_t v33 = v31 & v28;
    uint64_t v34 = _HashTable.UnsafeHandle._startIterator(bucket:)(v31 & v28, v77, a3);
    uint64_t v35 = v25;
    unint64_t v37 = v36;
    char v38 = v26;
    uint64_t v40 = v39;
    (*v60)(v38, v35);
    v78[0] = v77;
    v78[1] = a3;
    uint64_t v79 = v33;
    uint64_t v80 = v34;
    unint64_t v81 = v37;
    uint64_t v82 = v40;
    char v83 = 0;
    if (v34) {
      break;
    }
LABEL_33:
    _HashTable.BucketIterator.currentValue.setter(v21, 0);
    BOOL v30 = __OFADD__(v21++, 1);
    if (v30) {
      goto LABEL_41;
    }
    uint64_t v18 = v23;
    sub_24A5BBEE0();
    uint64_t v10 = v32;
    if (v64(v23, 1, v32) == 1) {
      return (*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v73, v74);
    }
  }
  char v41 = 0;
  uint64_t v42 = *v77 & 0x3FLL;
  uint64_t v43 = v42 << *v77;
  uint64_t v44 = v43 + 64;
  BOOL v45 = __OFADD__(v43, 64);
  uint64_t v47 = v44 - 1;
  BOOL v46 = v44 < 1;
  uint64_t v48 = v44 + 62;
  if (!v46) {
    uint64_t v48 = v47;
  }
  uint64_t v49 = v48 >> 6;
  while (1)
  {
    if (++v33 == 1 << *v77)
    {
      if (v41) {
        goto LABEL_42;
      }
      uint64_t v33 = 0;
      char v41 = 1;
    }
    if (v40 >= v42) {
      break;
    }
    uint64_t v50 = (v33 * v42) >> 6;
    if (v40)
    {
      if (v45) {
        goto LABEL_39;
      }
      if (v50 + 1 == v49) {
        uint64_t v50 = 0;
      }
      else {
        ++v50;
      }
    }
    uint64_t v51 = v42 - v40;
    if (__OFSUB__(v42, v40)) {
      goto LABEL_37;
    }
    if (v50 == 2 && v42 == 5) {
      uint64_t v53 = 32;
    }
    else {
      uint64_t v53 = 64;
    }
    BOOL v30 = __OFSUB__(v53, v51);
    uint64_t v54 = v53 - v51;
    if (v30) {
      goto LABEL_38;
    }
    unint64_t v55 = *(void *)(a3 + 8 * v50);
    uint64_t v56 = (v55 << v40) | v37;
    unint64_t v37 = v55 >> v51;
    uint64_t v40 = v54;
LABEL_11:
    if ((v56 & ((1 << *v77) - 1)) == 0)
    {
      char v83 = v41;
      unint64_t v81 = v37;
      uint64_t v82 = v40;
      uint64_t v79 = v33;
      uint64_t v80 = 0;
      goto LABEL_33;
    }
  }
  BOOL v30 = __OFSUB__(v40, v42);
  v40 -= v42;
  if (!v30)
  {
    uint64_t v56 = v37;
    v37 >>= v42;
    goto LABEL_11;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  uint64_t result = sub_24A5BC340();
  __break(1u);
  return result;
}

uint64_t _HashTable.UnsafeHandle.fill<A>(untilFirstDuplicateIn:)(char *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v84 = a7;
  uint64_t v66 = a4;
  uint64_t v71 = a3;
  uint64_t v87 = a2;
  uint64_t v61 = a1;
  uint64_t v77 = a6;
  uint64_t v8 = *(void *)(*(void *)(a6 + 8) + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v88 = *(char **)(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v76 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  char v89 = (char *)&v59 - v12;
  uint64_t v13 = swift_getAssociatedTypeWitness();
  uint64_t v72 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v75 = (char *)&v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v74 = (char *)&v59 - v17;
  MEMORY[0x270FA5388](v16);
  unint64_t v86 = (char *)&v59 - v18;
  uint64_t v19 = sub_24A5BBD20();
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v70 = (char *)&v59 - v20;
  uint64_t v21 = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](v21);
  swift_getAssociatedConformanceWitness();
  uint64_t v22 = swift_getAssociatedTypeWitness();
  uint64_t v60 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v59 - v23;
  uint64_t v85 = a5;
  uint64_t v25 = v72;
  uint64_t v90 = v8;
  uint64_t v26 = v70;
  sub_24A5BBB20();
  uint64_t v27 = v89;
  sub_24A5BB840();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  char v68 = v24;
  uint64_t v29 = v71;
  uint64_t v69 = v22;
  uint64_t v64 = AssociatedConformanceWitness;
  sub_24A5BBEE0();
  BOOL v30 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48);
  uint64_t v63 = v25 + 48;
  uint64_t v62 = v30;
  if (v30(v26, 1, v13) == 1)
  {
LABEL_2:
    (*(void (**)(char *, uint64_t))(v60 + 8))(v68, v69);
    sub_24A5BBB40();
    return 1;
  }
  else
  {
    uint64_t v32 = 0;
    uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v25 + 32);
    uint64_t v33 = v25 + 32;
    uint64_t v65 = v34;
    char v83 = (void (**)(char *))(v88 + 16);
    unint64_t v81 = (void (**)(char *, uint64_t))(v88 + 8);
    uint64_t v80 = (uint64_t (**)(char *, uint64_t))(v33 - 24);
    uint64_t v73 = (void (**)(char *, char *, uint64_t))(v33 - 16);
    uint64_t v82 = v13;
    uint64_t v72 = v33;
    while (1)
    {
      v65(v86, v26, v13);
      uint64_t v35 = (void (*)(char *, void))sub_24A5BBC20();
      uint64_t v79 = *v83;
      v79(v27);
      v35(v91, 0);
      uint64_t result = sub_24A5BB370();
      uint64_t v36 = 1 << *v29;
      BOOL v37 = __OFSUB__(v36, 1);
      uint64_t v38 = v36 - 1;
      if (v37)
      {
        __break(1u);
LABEL_13:
        __break(1u);
        return result;
      }
      uint64_t v67 = v32;
      uint64_t v39 = v38 & result;
      uint64_t v40 = v66;
      uint64_t v41 = _HashTable.UnsafeHandle._startIterator(bucket:)(v38 & result, v29, v66);
      uint64_t v43 = v42;
      uint64_t v45 = v44;
      char v78 = *v81;
      v78(v27, AssociatedTypeWitness);
      uint64_t v92 = v29;
      uint64_t v93 = v40;
      uint64_t v94 = v39;
      uint64_t v95 = v41;
      uint64_t v96 = v43;
      uint64_t v97 = v45;
      char v98 = 0;
      if (v41) {
        break;
      }
LABEL_8:
      uint64_t v57 = v67;
      _HashTable.BucketIterator.currentValue.setter(v67, 0);
      uint64_t v13 = v82;
      uint64_t result = (*v80)(v86, v82);
      BOOL v37 = __OFADD__(v57, 1);
      uint64_t v32 = v57 + 1;
      if (v37) {
        goto LABEL_13;
      }
      uint64_t v26 = v70;
      sub_24A5BBEE0();
      int v58 = v62(v26, 1, v13);
      uint64_t v29 = v71;
      uint64_t v27 = v89;
      if (v58 == 1) {
        goto LABEL_2;
      }
    }
    while (1)
    {
      BOOL v46 = v75;
      sub_24A5BBAD0();
      uint64_t v47 = v74;
      sub_24A5BBAA0();
      uint64_t v48 = (char *)*v80;
      uint64_t v49 = v82;
      (*v80)(v46, v82);
      uint64_t v88 = v48;
      uint64_t v50 = (void (*)(char *, void))sub_24A5BBC20();
      uint64_t v51 = v79;
      v79(v89);
      v50(v91, 0);
      ((void (*)(char *, uint64_t))v48)(v47, v49);
      (*v73)(v47, v86, v49);
      uint64_t v52 = sub_24A5BBC20();
      uint64_t v53 = v76;
      v51(v76);
      ((void (*)(char *, void))v52)(v91, 0);
      ((void (*)(char *, uint64_t))v88)(v47, v49);
      uint64_t v54 = v89;
      LOBYTE(v52) = sub_24A5BB530();
      unint64_t v55 = v53;
      uint64_t v56 = v78;
      v78(v55, AssociatedTypeWitness);
      v56(v54, AssociatedTypeWitness);
      if (v52) {
        break;
      }
      _HashTable.BucketIterator.advance()();
      if (!v95) {
        goto LABEL_8;
      }
    }
    (*(void (**)(char *, uint64_t))(v60 + 8))(v68, v69);
    v65(v61, v86, v82);
    return 0;
  }
}

BOOL _HashTable.UnsafeHandle.isOccupied(_:)(uint64_t a1, void *a2, uint64_t a3)
{
  return _HashTable.UnsafeHandle.subscript.getter(a1, a2, a3) != 0;
}

unint64_t _HashTable.UnsafeHandle.subscript.setter(uint64_t a1, char a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (a2) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = (-1 << *a4) ^ ~((((a1 - ((uint64_t)a4[1] >> 6)) >> 63) & ~(-1 << *a4)) + a1 - ((uint64_t)a4[1] >> 6));
  }
  return _HashTable.UnsafeHandle.subscript.setter(v5, a3, a4, a5);
}

uint64_t _HashTable.UnsafeHandle.adjustContents<A>(preparingForInsertionOfElementAtOffset:in:)(uint64_t a1, char *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v201 = a7;
  uint64_t v194 = a6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v180 = sub_24A5BC290();
  uint64_t v179 = *(void *)(v180 - 8);
  MEMORY[0x270FA5388](v180);
  unint64_t v178 = (char *)&v178 - v13;
  uint64_t v14 = swift_getAssociatedTypeWitness();
  uint64_t v203 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  v199 = (char *)&v178 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  v200 = (char *)&v178 - v17;
  uint64_t v185 = v18;
  uint64_t v19 = sub_24A5BBD20();
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  v195 = (unsigned int (*)(char *, uint64_t, uint64_t))((char *)&v178 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v20);
  v196 = (char *)&v178 - v22;
  uint64_t v23 = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](v23);
  v187 = (char *)&v178 - v24;
  uint64_t v192 = AssociatedTypeWitness;
  v193 = (void (**)(char *, uint64_t))AssociatedConformanceWitness;
  uint64_t v183 = sub_24A5BC2A0();
  uint64_t v182 = *(void *)(v183 - 8);
  MEMORY[0x270FA5388](v183);
  uint64_t v181 = (char *)&v178 - v25;
  uint64_t v186 = *(void *)(swift_getAssociatedConformanceWitness() + 8);
  uint64_t v188 = v23;
  uint64_t v202 = swift_getAssociatedTypeWitness();
  uint64_t v184 = *(void *)(v202 - 8);
  uint64_t v26 = MEMORY[0x270FA5388](v202);
  v197 = (char *)&v178 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  v198 = (char *)&v178 - v29;
  uint64_t v30 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v31 = MEMORY[0x270FA5388](v28);
  uint64_t v33 = (char *)&v178 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v31);
  uint64_t v35 = (char *)&v178 - v34;
  sub_24A5BBAD0();
  v191 = v35;
  sub_24A5BBAA0();
  uint64_t v194 = v30;
  uint64_t v36 = v192;
  v189 = *(void (**)(char *, uint64_t))(v30 + 8);
  v189(v33, v192);
  uint64_t v37 = sub_24A5BBAF0();
  if (v37 >= 0) {
    uint64_t v38 = v37;
  }
  else {
    uint64_t v38 = v37 + 1;
  }
  uint64_t v190 = v30 + 8;
  if (a1 < v38 >> 1)
  {
    uint64_t v39 = 1 << *a3;
    BOOL v40 = __OFSUB__(v39, 1);
    uint64_t v41 = v39 - 1;
    if (v40) {
      goto LABEL_169;
    }
    uint64_t v42 = *a3 & 0x3FLL;
    uint64_t v43 = a3[1];
    if (v43 >= -64) {
      uint64_t v44 = 0;
    }
    else {
      uint64_t v44 = v41;
    }
    uint64_t v45 = v44 + (v43 >> 6) + 1;
    if (v45 < v41) {
      uint64_t v41 = 0;
    }
    a3[1] = a3[1] & 0x3FLL | ((v45 - v41) << 6);
    if (_s19CollectionsInternal10_HashTableV15maximumCapacity8forScaleS2i_tFZ_0(v42) / 3 < a1)
    {
      uint64_t v46 = _HashTable.UnsafeHandle._startIterator(bucket:)(0, a3, a4);
      uint64_t v47 = 0;
      v204 = a3;
      uint64_t v205 = a4;
      uint64_t v206 = 0;
      uint64_t v207 = v46;
      unint64_t v208 = v48;
      uint64_t v209 = v49;
      char v210 = 0;
      uint64_t v50 = v191;
      while (1)
      {
        if (v207)
        {
          uint64_t v51 = v204;
          unint64_t v52 = ~(-1 << *v204);
          uint64_t v53 = (uint64_t)v204[1] >> 6;
          unint64_t v54 = v53 + (v207 ^ v52);
          uint64_t v55 = v54 >= v52 ? ~(-1 << *v204) : 0;
          uint64_t v56 = v54 - v55;
          if (v56 <= a1)
          {
            BOOL v40 = __OFSUB__(v56, 1);
            uint64_t v57 = v56 - 1;
            if (v40) {
              goto LABEL_166;
            }
            uint64_t v58 = *v204 & 0x3FLL;
            uint64_t v59 = ((v52 & ((v57 - v53) >> 63)) + v57 - v53) ^ v52;
            unint64_t v60 = v59 ^ v207;
            char v61 = v58 * v47;
            uint64_t v62 = (v58 * v47) >> 6;
            uint64_t v63 = (v58 * v47) & 0x3F;
            uint64_t v64 = v205;
            *(void *)(v205 + 8 * v62) ^= (v59 ^ v207) << v61;
            unint64_t v65 = *v51 & 0x3FLL;
            if (64 - v63 < v65)
            {
              unint64_t v66 = v65 << v65;
              BOOL v40 = __OFADD__(v66, 64);
              uint64_t v67 = v66 + 64;
              if (v40) {
                goto LABEL_168;
              }
              uint64_t v69 = v67 - 1;
              BOOL v68 = v67 < 1;
              uint64_t v70 = v67 + 62;
              if (!v68) {
                uint64_t v70 = v69;
              }
              if (v62 + 1 == v70 >> 6) {
                uint64_t v71 = 0;
              }
              else {
                uint64_t v71 = v62 + 1;
              }
              *(void *)(v64 + 8 * v71) ^= v60 >> (64 - v63);
            }
            uint64_t v207 = v59;
          }
        }
        _HashTable.BucketIterator.advance()();
        uint64_t v47 = v206;
        if (!v206) {
          goto LABEL_51;
        }
      }
    }
    uint64_t v100 = v191;
    if (sub_24A5BB530())
    {
      unint64_t v101 = v181;
      (*(void (**)(char *, char *, uint64_t))(v194 + 16))(v181, v100, v36);
      uint64_t v102 = v183;
      swift_getWitnessTable();
      sub_24A5BBBE0();
      (*(void (**)(char *, uint64_t))(v182 + 8))(v101, v102);
      sub_24A5BB840();
      uint64_t v103 = swift_getAssociatedConformanceWitness();
      char v104 = v196;
      v199 = (char *)v103;
      sub_24A5BBEE0();
      unint64_t v105 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v203 + 48);
      uint64_t v106 = v185;
      v197 = (char *)(v203 + 48);
      v195 = v105;
      if (v105(v104, 1, v185) == 1)
      {
LABEL_100:
        (*(void (**)(char *, uint64_t))(v184 + 8))(v198, v202);
LABEL_150:
        char v98 = v191;
        uint64_t v99 = v192;
        return ((uint64_t (*)(char *, uint64_t))v189)(v98, v99);
      }
      uint64_t v107 = *(void *)(v203 + 32);
      v203 += 32;
      v193 = (void (**)(char *, uint64_t))(v203 - 24);
      uint64_t v194 = v107;
      uint64_t v108 = 1;
      while (1)
      {
        ((void (*)(char *, char *, uint64_t))v194)(v200, v104, v106);
        uint64_t v109 = sub_24A5BB370();
        uint64_t v110 = *a3;
        uint64_t v111 = 1 << *a3;
        unint64_t v112 = v111 - 1;
        if (__OFSUB__(v111, 1)) {
          goto LABEL_160;
        }
        uint64_t v113 = v112 & v109;
        uint64_t v114 = _HashTable.UnsafeHandle._startIterator(bucket:)(v112 & v109, a3, a4);
        v204 = a3;
        uint64_t v205 = a4;
        if (!v114) {
          goto LABEL_174;
        }
        uint64_t v117 = -1 << *a3;
        unint64_t v118 = ~v117;
        uint64_t v119 = (uint64_t)a3[1] >> 6;
        unint64_t v120 = (v117 ^ ~v114) + v119;
        if (v120 >= ~v117) {
          uint64_t v121 = ~v117;
        }
        else {
          uint64_t v121 = 0;
        }
        if (v120 - v121 != v108)
        {
          char v122 = 0;
          uint64_t v123 = v110 & 0x3F;
          BOOL v124 = __OFADD__(v123 << v123, 64);
          uint64_t v125 = (v123 << v123) + 126;
          if ((v123 << v123) + 64 >= 1) {
            uint64_t v125 = (v123 << v123) + 63;
          }
          uint64_t v126 = v125 >> 6;
          while (1)
          {
            if (++v113 == v111)
            {
              if (v122) {
                goto LABEL_176;
              }
              uint64_t v113 = 0;
              char v122 = 1;
            }
            if (v116 >= v123)
            {
              BOOL v40 = __OFSUB__(v116, v123);
              v116 -= v123;
              if (v40)
              {
                __break(1u);
LABEL_153:
                __break(1u);
LABEL_154:
                __break(1u);
LABEL_155:
                __break(1u);
LABEL_156:
                __break(1u);
                goto LABEL_157;
              }
              unint64_t v133 = v115 >> v123;
            }
            else
            {
              uint64_t v127 = (v113 * v123) >> 6;
              if (v116)
              {
                if (v124) {
                  goto LABEL_158;
                }
                if (v127 + 1 == v126) {
                  uint64_t v127 = 0;
                }
                else {
                  ++v127;
                }
              }
              uint64_t v128 = v123 - v116;
              if (__OFSUB__(v123, v116)) {
                goto LABEL_153;
              }
              if (v127 == 2 && v123 == 5) {
                uint64_t v130 = 32;
              }
              else {
                uint64_t v130 = 64;
              }
              BOOL v40 = __OFSUB__(v130, v128);
              uint64_t v131 = v130 - v128;
              if (v40) {
                goto LABEL_155;
              }
              unint64_t v132 = *(void *)(a4 + 8 * v127);
              v115 |= v132 << v116;
              unint64_t v133 = v132 >> v128;
              uint64_t v116 = v131;
            }
            uint64_t v114 = v115 & v112;
            if ((v115 & v112) == 0) {
              goto LABEL_174;
            }
            unint64_t v134 = (v114 ^ v118) + v119;
            if (v134 >= v118) {
              unint64_t v135 = v118;
            }
            else {
              unint64_t v135 = 0;
            }
            unint64_t v115 = v133;
            if (v134 - v135 == v108)
            {
              unint64_t v115 = v133;
              goto LABEL_94;
            }
          }
        }
        char v122 = 0;
LABEL_94:
        char v210 = v122;
        uint64_t v206 = v113;
        uint64_t v207 = v114;
        unint64_t v208 = v115;
        uint64_t v209 = v116;
        unint64_t v136 = v119 + (v114 ^ v112);
        if (v136 >= v112) {
          uint64_t v137 = v111 - 1;
        }
        else {
          uint64_t v137 = 0;
        }
        unint64_t v138 = v136 - v137;
        if (__OFSUB__(v138, 1)) {
          goto LABEL_162;
        }
        _HashTable.BucketIterator.currentValue.setter(v138 - 1, 0);
        (*v193)(v200, v106);
        BOOL v40 = __OFADD__(v108++, 1);
        if (v40) {
          goto LABEL_163;
        }
        char v104 = v196;
        sub_24A5BBEE0();
        if (v195(v104, 1, v106) == 1) {
          goto LABEL_100;
        }
      }
    }
    goto LABEL_172;
  }
  uint64_t v72 = sub_24A5BBAF0();
  uint64_t v73 = v72 - a1;
  if (__OFSUB__(v72, a1)) {
    goto LABEL_170;
  }
  if (__OFSUB__(v73, 1))
  {
LABEL_171:
    __break(1u);
LABEL_172:
    __break(1u);
    goto LABEL_173;
  }
  if (_s19CollectionsInternal10_HashTableV15maximumCapacity8forScaleS2i_tFZ_0(*a3 & 0x3FLL) / 3 >= v73 - 1)
  {
    v200 = a2;
    uint64_t v139 = v191;
    if (sub_24A5BB530())
    {
      uint64_t v140 = v178;
      (*(void (**)(char *, char *, uint64_t))(v194 + 16))(v178, v139, v36);
      uint64_t v141 = v180;
      swift_getWitnessTable();
      sub_24A5BBBE0();
      (*(void (**)(char *, uint64_t))(v179 + 8))(v140, v141);
      sub_24A5BB840();
      uint64_t v142 = swift_getAssociatedConformanceWitness();
      uint64_t v143 = v195;
      v200 = (char *)v142;
      sub_24A5BBEE0();
      uint64_t v144 = *(char **)(v203 + 48);
      uint64_t v145 = v185;
      v198 = (char *)(v203 + 48);
      v196 = v144;
      if (((unsigned int (*)(void, uint64_t, uint64_t))v144)(v143, 1, v185) == 1) {
        goto LABEL_149;
      }
      uint64_t v146 = *(void *)(v203 + 32);
      v203 += 32;
      v193 = (void (**)(char *, uint64_t))(v203 - 24);
      uint64_t v194 = v146;
      while (1)
      {
        ((void (*)(char *, unsigned int (*)(char *, uint64_t, uint64_t), uint64_t))v194)(v199, v143, v145);
        uint64_t v147 = sub_24A5BB370();
        uint64_t v148 = *a3;
        uint64_t v149 = 1 << *a3;
        unint64_t v150 = v149 - 1;
        if (__OFSUB__(v149, 1)) {
          goto LABEL_161;
        }
        uint64_t v151 = v150 & v147;
        uint64_t v152 = _HashTable.UnsafeHandle._startIterator(bucket:)(v150 & v147, a3, a4);
        v204 = a3;
        uint64_t v205 = a4;
        if (!v152) {
          goto LABEL_175;
        }
        uint64_t v155 = -1 << *a3;
        unint64_t v156 = ~v155;
        uint64_t v157 = (uint64_t)a3[1] >> 6;
        unint64_t v158 = (v155 ^ ~v152) + v157;
        if (v158 >= ~v155) {
          uint64_t v159 = ~v155;
        }
        else {
          uint64_t v159 = 0;
        }
        if (v158 - v159 == a1)
        {
          char v160 = 0;
          goto LABEL_143;
        }
        char v160 = 0;
        uint64_t v161 = v148 & 0x3F;
        BOOL v162 = __OFADD__(v161 << v161, 64);
        uint64_t v163 = (v161 << v161) + 126;
        if ((v161 << v161) + 64 >= 1) {
          uint64_t v163 = (v161 << v161) + 63;
        }
        uint64_t v164 = v163 >> 6;
        do
        {
          if (++v151 == v149)
          {
            if (v160) {
              goto LABEL_176;
            }
            uint64_t v151 = 0;
            char v160 = 1;
          }
          if (v154 >= v161)
          {
            BOOL v40 = __OFSUB__(v154, v161);
            v154 -= v161;
            if (v40) {
              goto LABEL_154;
            }
            unint64_t v171 = v153 >> v161;
          }
          else
          {
            uint64_t v165 = (v151 * v161) >> 6;
            if (v154)
            {
              if (v162) {
                goto LABEL_159;
              }
              if (v165 + 1 == v164) {
                uint64_t v165 = 0;
              }
              else {
                ++v165;
              }
            }
            uint64_t v166 = v161 - v154;
            if (__OFSUB__(v161, v154)) {
              goto LABEL_156;
            }
            if (v165 == 2 && v161 == 5) {
              uint64_t v168 = 32;
            }
            else {
              uint64_t v168 = 64;
            }
            BOOL v40 = __OFSUB__(v168, v166);
            uint64_t v169 = v168 - v166;
            if (v40)
            {
LABEL_157:
              __break(1u);
LABEL_158:
              __break(1u);
LABEL_159:
              __break(1u);
LABEL_160:
              __break(1u);
LABEL_161:
              __break(1u);
LABEL_162:
              __break(1u);
LABEL_163:
              __break(1u);
LABEL_164:
              __break(1u);
LABEL_165:
              __break(1u);
LABEL_166:
              __break(1u);
LABEL_167:
              __break(1u);
LABEL_168:
              __break(1u);
LABEL_169:
              __break(1u);
LABEL_170:
              __break(1u);
              goto LABEL_171;
            }
            unint64_t v170 = *(void *)(a4 + 8 * v165);
            v153 |= v170 << v154;
            unint64_t v171 = v170 >> v166;
            uint64_t v154 = v169;
          }
          uint64_t v152 = v153 & v150;
          if ((v153 & v150) == 0) {
            goto LABEL_175;
          }
          unint64_t v172 = (v152 ^ v156) + v157;
          if (v172 >= v156) {
            unint64_t v173 = v156;
          }
          else {
            unint64_t v173 = 0;
          }
          unint64_t v153 = v171;
        }
        while (v172 - v173 != a1);
        unint64_t v153 = v171;
LABEL_143:
        char v210 = v160;
        uint64_t v206 = v151;
        uint64_t v207 = v152;
        unint64_t v208 = v153;
        uint64_t v209 = v154;
        unint64_t v174 = v157 + (v152 ^ v150);
        if (v174 >= v150) {
          uint64_t v175 = v149 - 1;
        }
        else {
          uint64_t v175 = 0;
        }
        unint64_t v176 = v174 - v175;
        if (__OFADD__(v176, 1)) {
          goto LABEL_164;
        }
        _HashTable.BucketIterator.currentValue.setter(v176 + 1, 0);
        (*v193)(v199, v145);
        BOOL v40 = __OFADD__(a1++, 1);
        if (v40) {
          goto LABEL_165;
        }
        uint64_t v143 = v195;
        sub_24A5BBEE0();
        if (((unsigned int (*)(void, uint64_t, uint64_t))v196)(v143, 1, v145) == 1)
        {
LABEL_149:
          (*(void (**)(char *, uint64_t))(v184 + 8))(v197, v202);
          goto LABEL_150;
        }
      }
    }
LABEL_173:
    __break(1u);
LABEL_174:
    __break(1u);
LABEL_175:
    __break(1u);
LABEL_176:
    uint64_t result = sub_24A5BC340();
    __break(1u);
    return result;
  }
  uint64_t v74 = _HashTable.UnsafeHandle._startIterator(bucket:)(0, a3, a4);
  uint64_t v75 = 0;
  v204 = a3;
  uint64_t v205 = a4;
  uint64_t v206 = 0;
  uint64_t v207 = v74;
  unint64_t v208 = v76;
  uint64_t v209 = v77;
  char v210 = 0;
  uint64_t v50 = v191;
  while (1)
  {
    if (!v207) {
      goto LABEL_40;
    }
    unint64_t v81 = v204;
    unint64_t v82 = ~(-1 << *v204);
    uint64_t v83 = (uint64_t)v204[1] >> 6;
    unint64_t v84 = v83 + (v207 ^ v82);
    uint64_t v85 = v84 >= v82 ? ~(-1 << *v204) : 0;
    uint64_t v86 = v84 - v85;
    if (v86 < a1) {
      goto LABEL_40;
    }
    BOOL v40 = __OFADD__(v86, 1);
    uint64_t v87 = v86 + 1;
    if (v40) {
      goto LABEL_167;
    }
    uint64_t v88 = *v204 & 0x3FLL;
    uint64_t v89 = ((v82 & ((v87 - v83) >> 63)) + v87 - v83) ^ v82;
    unint64_t v90 = v89 ^ v207;
    char v91 = v88 * v75;
    uint64_t v92 = (v88 * v75) >> 6;
    uint64_t v93 = (v88 * v75) & 0x3F;
    uint64_t v94 = v205;
    *(void *)(v205 + 8 * v92) ^= (v89 ^ v207) << v91;
    unint64_t v95 = *v81 & 0x3FLL;
    if (64 - v93 < v95) {
      break;
    }
LABEL_39:
    uint64_t v207 = v89;
LABEL_40:
    _HashTable.BucketIterator.advance()();
    uint64_t v75 = v206;
    if (!v206) {
      goto LABEL_51;
    }
  }
  unint64_t v96 = v95 << v95;
  BOOL v40 = __OFADD__(v96, 64);
  uint64_t v97 = v96 + 64;
  if (!v40)
  {
    uint64_t v78 = v97 - 1;
    BOOL v68 = v97 < 1;
    uint64_t v79 = v97 + 62;
    if (!v68) {
      uint64_t v79 = v78;
    }
    if (v92 + 1 == v79 >> 6) {
      uint64_t v80 = 0;
    }
    else {
      uint64_t v80 = v92 + 1;
    }
    *(void *)(v94 + 8 * v80) ^= v90 >> (64 - v93);
    goto LABEL_39;
  }
  __break(1u);
LABEL_51:
  char v98 = v50;
  uint64_t v99 = v36;
  return ((uint64_t (*)(char *, uint64_t))v189)(v98, v99);
}

Swift::Void __swiftcall _HashTable.UnsafeHandle.clear()()
{
  uint64_t v2 = (*v0 & 0x3FLL) << *v0;
  BOOL v3 = __OFADD__(v2, 64);
  uint64_t v4 = v2 + 64;
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return;
  }
  uint64_t v5 = v4 - 1;
  if (v4 < 1) {
    uint64_t v5 = v4 + 62;
  }
  if (v4 < -62) {
    goto LABEL_8;
  }
  if ((unint64_t)(v4 + 62) >= 0x7F) {
    bzero(v1, 8 * (v5 >> 6));
  }
}

unint64_t _HashTable.UnsafeHandle.delete(bucket:hashValueGenerator:)(uint64_t a1, uint64_t (*a2)(unint64_t, void), uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v8 = a1;
  uint64_t v29 = _HashTable.UnsafeHandle._startIterator(bucket:)(a1, a4, a5);
  _HashTable.BucketIterator.advance()();
  uint64_t v9 = v29;
  if (v29)
  {
    uint64_t v26 = a5;
    uint64_t v10 = _HashTable.UnsafeHandle.firstOccupiedBucketInChain(with:)(v8, a4, a5);
    uint64_t v11 = a1;
    while (1)
    {
      uint64_t v16 = -1 << *a4;
      unint64_t v17 = (v16 ^ ~v9) + ((uint64_t)a4[1] >> 6);
      if (v17 >= ~v16) {
        uint64_t v18 = ~v16;
      }
      else {
        uint64_t v18 = 0;
      }
      unint64_t result = a2(v17 - v18, *a4);
      uint64_t v20 = 1 << *a4;
      BOOL v21 = __OFSUB__(v20, 1);
      uint64_t v22 = v20 - 1;
      if (v21)
      {
        __break(1u);
        return result;
      }
      int64_t v23 = v22 & result;
      if (v8 >= v10)
      {
        if (v23 >= v10 && v8 >= v23)
        {
LABEL_3:
          uint64_t v12 = -1 << *a4;
          unint64_t v13 = (v12 ^ ~v9) + ((uint64_t)a4[1] >> 6);
          if (v13 >= ~v12) {
            uint64_t v14 = v12 + 1;
          }
          else {
            uint64_t v14 = 0;
          }
          uint64_t v15 = v13 - ((uint64_t)a4[1] >> 6) + v14;
          _HashTable.UnsafeHandle.subscript.setter(((v22 & (v15 >> 63)) + v15) ^ v22, v8, a4, v26);
          uint64_t v8 = v11;
        }
      }
      else if (v23 >= v10 || v8 >= v23)
      {
        goto LABEL_3;
      }
      _HashTable.BucketIterator.advance()();
      uint64_t v11 = a1;
      uint64_t v9 = v29;
    }
  }
  return _HashTable.UnsafeHandle.subscript.setter(0, v8, a4, a5);
}

uint64_t _HashTable.UnsafeHandle.adjustContents<A>(preparingForRemovalOf:in:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v48 = a7;
  unint64_t v52 = a3;
  uint64_t v53 = a4;
  uint64_t v44 = a6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v11 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v46 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v40 - v13;
  swift_getAssociatedConformanceWitness();
  uint64_t v15 = sub_24A5BBCC0();
  uint64_t v49 = *(void *)(v15 - 8);
  uint64_t v50 = v15;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v45 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v40 - v19;
  uint64_t v21 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v18);
  int64_t v23 = (char *)&v40 - v22;
  uint64_t v51 = a2;
  uint64_t v43 = a5;
  uint64_t v24 = a1;
  sub_24A5BBB00();
  uint64_t v25 = v23;
  uint64_t result = sub_24A5BB440();
  if (result)
  {
    uint64_t v41 = v20;
    uint64_t v27 = TupleTypeMetadata2;
    uint64_t v28 = &v14[*(int *)(TupleTypeMetadata2 + 48)];
    uint64_t v29 = v21;
    uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
    v30(v14, v24, AssociatedTypeWitness);
    BOOL v40 = v28;
    uint64_t v42 = v25;
    v30(v28, (uint64_t)v25, AssociatedTypeWitness);
    uint64_t v31 = v46;
    uint64_t v32 = &v46[*(int *)(v27 + 48)];
    v30(v46, (uint64_t)v14, AssociatedTypeWitness);
    v30(v32, (uint64_t)v28, AssociatedTypeWitness);
    uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v29 + 32);
    uint64_t v34 = v45;
    v33(v45, v31, AssociatedTypeWitness);
    uint64_t v35 = *(void (**)(char *, uint64_t))(v29 + 8);
    v35(v32, AssociatedTypeWitness);
    uint64_t v36 = &v31[*(int *)(v27 + 48)];
    v33(v31, v14, AssociatedTypeWitness);
    v33(v36, v40, AssociatedTypeWitness);
    uint64_t v37 = v50;
    v33(&v34[*(int *)(v50 + 36)], v36, AssociatedTypeWitness);
    v35(v31, AssociatedTypeWitness);
    uint64_t v38 = v49;
    uint64_t v39 = (uint64_t)v41;
    (*(void (**)(char *, char *, uint64_t))(v49 + 32))(v41, v34, v37);
    _HashTable.UnsafeHandle.adjustContents<A>(preparingForRemovalOf:in:)(v39, v51, v52, v53, v43, v44, v48);
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v39, v37);
    return ((uint64_t (*)(char *, uint64_t))v35)(v42, AssociatedTypeWitness);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void _HashTable.UnsafeHandle.adjustContents<A>(preparingForRemovalOf:in:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v190 = a7;
  uint64_t v181 = a3;
  uint64_t v182 = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = (void (*)(char *, char *, uint64_t))swift_getAssociatedConformanceWitness();
  uint64_t v173 = sub_24A5BC2A0();
  uint64_t v172 = *(void *)(v173 - 8);
  MEMORY[0x270FA5388](v173);
  unint64_t v174 = (char *)&v168 - v9;
  uint64_t v10 = swift_getAssociatedTypeWitness();
  uint64_t v193 = *(void *)(v10 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  v189 = (char *)&v168 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v188 = (char *)&v168 - v13;
  uint64_t v191 = v14;
  uint64_t v15 = sub_24A5BBD20();
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v185 = (char *)&v168 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v184 = (unsigned int (*)(char *, uint64_t, uint64_t))((char *)&v168 - v18);
  uint64_t v19 = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](v19);
  unint64_t v178 = (char *)&v168 - v20;
  uint64_t v169 = sub_24A5BC290();
  uint64_t v168 = *(void *)(v169 - 8);
  MEMORY[0x270FA5388](v169);
  unint64_t v171 = (char *)&v168 - v21;
  uint64_t v177 = *(void *)(swift_getAssociatedConformanceWitness() + 8);
  uint64_t v179 = v19;
  uint64_t v192 = swift_getAssociatedTypeWitness();
  uint64_t v176 = *(void *)(v192 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v192);
  v187 = (char *)&v168 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v186 = (char *)&v168 - v25;
  uint64_t v26 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v168 - v27;
  sub_24A5BBAD0();
  uint64_t v29 = sub_24A5BBAB0();
  uint64_t v180 = v26;
  uint64_t v30 = *(void (**)(char *, uint64_t))(v26 + 8);
  v30(v28, AssociatedTypeWitness);
  uint64_t v31 = *(int *)(sub_24A5BBCC0() + 36);
  uint64_t v175 = a1;
  uint64_t v32 = a1 + v31;
  sub_24A5BBAD0();
  uint64_t v170 = v32;
  uint64_t v33 = sub_24A5BBAB0();
  v30(v28, AssociatedTypeWitness);
  uint64_t v34 = v33 - v29;
  if (__OFSUB__(v33, v29)) {
    goto LABEL_160;
  }
  if (v34 < 1) {
    return;
  }
  uint64_t v35 = sub_24A5BBAF0();
  if (__OFSUB__(v35, v34)) {
    goto LABEL_162;
  }
  if (v29 < (v35 - v34) / 2)
  {
    uint64_t v36 = v181;
    uint64_t v37 = _s19CollectionsInternal10_HashTableV15maximumCapacity8forScaleS2i_tFZ_0(*v181 & 0x3FLL);
    uint64_t v38 = v182;
    if (v29 >= v37 / 3)
    {
      uint64_t v119 = _HashTable.UnsafeHandle._startIterator(bucket:)(0, v36, v182);
      uint64_t v120 = 0;
      uint64_t v194 = v36;
      uint64_t v195 = v38;
      uint64_t v196 = 0;
      uint64_t v197 = v119;
      unint64_t v198 = v121;
      uint64_t v199 = v122;
      uint64_t v33 = -1;
      uint64_t v81 = 64;
      char v200 = 0;
      while (1)
      {
        if (v197)
        {
          uint64_t v127 = v194;
          unint64_t v128 = ~(-1 << *v194);
          uint64_t v129 = (uint64_t)v194[1] >> 6;
          unint64_t v130 = v129 + (v197 ^ v128);
          uint64_t v131 = v130 >= v128 ? ~(-1 << *v194) : 0;
          int64_t v132 = v130 - v131;
          if (v132 < v29)
          {
            BOOL v71 = __OFADD__(v132, v34);
            int64_t v133 = v132 + v34;
            if (v71) {
              goto LABEL_158;
            }
            uint64_t v134 = *v194 & 0x3FLL;
            uint64_t v135 = ((v128 & ((v133 - v129) >> 63)) + v133 - v129) ^ v128;
            unint64_t v136 = v135 ^ v197;
            char v137 = v134 * v120;
            uint64_t v138 = (v134 * v120) >> 6;
            uint64_t v139 = (v134 * v120) & 0x3F;
            uint64_t v140 = v195;
            *(void *)(v195 + 8 * v138) ^= (v135 ^ v197) << v137;
            unint64_t v141 = *v127 & 0x3FLL;
            if (64 - v139 < v141)
            {
              unint64_t v142 = v141 << v141;
              BOOL v71 = __OFADD__(v142, 64);
              uint64_t v143 = v142 + 64;
              if (v71)
              {
                __break(1u);
                goto LABEL_127;
              }
              uint64_t v124 = v143 - 1;
              BOOL v123 = v143 < 1;
              uint64_t v125 = v143 + 62;
              if (!v123) {
                uint64_t v125 = v124;
              }
              if (v138 + 1 == v125 >> 6) {
                uint64_t v126 = 0;
              }
              else {
                uint64_t v126 = v138 + 1;
              }
              *(void *)(v140 + 8 * v126) ^= v136 >> (64 - v139);
            }
            uint64_t v197 = v135;
          }
        }
        _HashTable.BucketIterator.advance()();
        uint64_t v120 = v196;
        if (!v196) {
          goto LABEL_53;
        }
      }
    }
    uint64_t v39 = v174;
    (*(void (**)(char *, uint64_t, uint64_t))(v180 + 16))(v174, v175, AssociatedTypeWitness);
    if ((sub_24A5BB530() & 1) == 0) {
      goto LABEL_166;
    }
    uint64_t v40 = v173;
    swift_getWitnessTable();
    sub_24A5BBBE0();
    (*(void (**)(char *, uint64_t))(v172 + 8))(v39, v40);
    sub_24A5BB840();
    uint64_t v41 = swift_getAssociatedConformanceWitness();
    uint64_t v42 = v185;
    uint64_t v188 = (char *)v41;
    sub_24A5BBEE0();
    uint64_t v43 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v193 + 48);
    uint64_t v44 = v191;
    uint64_t v186 = (char *)(v193 + 48);
    uint64_t v184 = v43;
    if (v43(v42, 1, v191) != 1)
    {
      uint64_t v45 = 0;
      uint64_t AssociatedConformanceWitness = *(void (**)(char *, char *, uint64_t))(v193 + 32);
      v193 += 32;
      uint64_t v46 = (void (**)(char *, uint64_t))(v193 - 24);
      do
      {
        AssociatedConformanceWitness(v189, v42, v44);
        uint64_t v47 = sub_24A5BB370();
        uint64_t v48 = *v36;
        uint64_t v49 = 1 << *v36;
        uint64_t v50 = v49 - 1;
        if (__OFSUB__(v49, 1)) {
          goto LABEL_152;
        }
        uint64_t v51 = v50 & v47;
        uint64_t v52 = _HashTable.UnsafeHandle._startIterator(bucket:)(v50 & v47, v36, v38);
        uint64_t v194 = v36;
        uint64_t v195 = v38;
        uint64_t v196 = v51;
        uint64_t v197 = v52;
        unint64_t v198 = v53;
        uint64_t v199 = v54;
        char v200 = 0;
        if (v52)
        {
          uint64_t v55 = -1 << *v36;
          unint64_t v56 = ~v55;
          uint64_t v57 = (uint64_t)v36[1] >> 6;
          unint64_t v58 = (v55 ^ ~v52) + v57;
          if (v58 >= ~v55) {
            uint64_t v59 = ~v55;
          }
          else {
            uint64_t v59 = 0;
          }
          if (v58 - v59 != v45)
          {
            char v60 = 0;
            uint64_t v61 = v48 & 0x3F;
            BOOL v62 = __OFADD__(v61 << v61, 64);
            uint64_t v63 = (v61 << v61) + 126;
            if ((v61 << v61) + 64 >= 1) {
              uint64_t v63 = (v61 << v61) + 63;
            }
            uint64_t v64 = v63 >> 6;
            while (1)
            {
              if (++v51 == v49)
              {
                if (v60) {
                  goto LABEL_168;
                }
                uint64_t v51 = 0;
                char v60 = 1;
              }
              if (v54 >= v61)
              {
                BOOL v71 = __OFSUB__(v54, v61);
                v54 -= v61;
                if (v71)
                {
                  __break(1u);
LABEL_145:
                  __break(1u);
LABEL_146:
                  __break(1u);
LABEL_147:
                  __break(1u);
LABEL_148:
                  __break(1u);
                  goto LABEL_149;
                }
                unint64_t v75 = v53 >> v61;
                uint64_t v52 = v53 & v50;
                if ((v53 & v50) == 0) {
                  goto LABEL_47;
                }
              }
              else
              {
                uint64_t v67 = (v51 * v61) >> 6;
                if (v54)
                {
                  if (v62) {
                    goto LABEL_150;
                  }
                  if (v67 + 1 == v64) {
                    uint64_t v67 = 0;
                  }
                  else {
                    ++v67;
                  }
                }
                uint64_t v68 = v61 - v54;
                if (__OFSUB__(v61, v54)) {
                  goto LABEL_145;
                }
                if (v67 == 2 && v61 == 5) {
                  uint64_t v70 = 32;
                }
                else {
                  uint64_t v70 = 64;
                }
                BOOL v71 = __OFSUB__(v70, v68);
                uint64_t v72 = v70 - v68;
                if (v71) {
                  goto LABEL_147;
                }
                unint64_t v73 = *(void *)(v38 + 8 * v67);
                uint64_t v74 = (v73 << v54) | v53;
                unint64_t v75 = v73 >> v68;
                uint64_t v54 = v72;
                uint64_t v52 = v74 & v50;
                if ((v74 & v50) == 0)
                {
LABEL_47:
                  unint64_t v53 = v75;
                  goto LABEL_48;
                }
              }
              unint64_t v65 = (v52 ^ v56) + v57;
              if (v65 >= v56) {
                unint64_t v66 = v56;
              }
              else {
                unint64_t v66 = 0;
              }
              unint64_t v53 = v75;
              if (v65 - v66 == v45) {
                goto LABEL_47;
              }
            }
          }
          char v60 = 0;
LABEL_48:
          char v200 = v60;
          uint64_t v196 = v51;
          uint64_t v197 = v52;
          unint64_t v198 = v53;
          uint64_t v199 = v54;
        }
        if (__OFADD__(v45, v34)) {
          goto LABEL_154;
        }
        _HashTable.BucketIterator.currentValue.setter(v45 + v34, 0);
        uint64_t v44 = v191;
        (*v46)(v189, v191);
        BOOL v71 = __OFADD__(v45++, 1);
        if (v71) {
          goto LABEL_155;
        }
        uint64_t v42 = v185;
        sub_24A5BBEE0();
      }
      while (v184(v42, 1, v44) != 1);
    }
    (*(void (**)(char *, uint64_t))(v176 + 8))(v187, v192);
LABEL_53:
    uint64_t v76 = v36[1];
    if (__OFSUB__(v76 >> 6, v34)) {
      goto LABEL_164;
    }
    uint64_t v77 = 1 << *v36;
    BOOL v71 = __OFSUB__(v77, 1);
    uint64_t v78 = v77 - 1;
    if (v71) {
      goto LABEL_165;
    }
    uint64_t v79 = (v78 & (((v76 >> 6) - v34) >> 63)) + (v76 >> 6) - v34;
    if (v79 < v78) {
      uint64_t v78 = 0;
    }
    v36[1] = v36[1] & 0x3FLL | ((v79 - v78) << 6);
    return;
  }
  uint64_t v80 = sub_24A5BBAF0();
  uint64_t v36 = v181;
  uint64_t v81 = v182;
  if (__OFSUB__(v80, v33)) {
    goto LABEL_163;
  }
  if (v80 - v33 >= _s19CollectionsInternal10_HashTableV15maximumCapacity8forScaleS2i_tFZ_0(*v181 & 0x3FLL) / 3)
  {
LABEL_127:
    uint64_t v144 = _HashTable.UnsafeHandle._startIterator(bucket:)(0, v36, v81);
    uint64_t v145 = 0;
    uint64_t v194 = v36;
    uint64_t v195 = v81;
    uint64_t v196 = 0;
    uint64_t v197 = v144;
    unint64_t v198 = v146;
    uint64_t v199 = v147;
    char v200 = 0;
    while (1)
    {
      if (v197)
      {
        uint64_t v148 = v194;
        unint64_t v149 = ~(-1 << *v194);
        uint64_t v150 = (uint64_t)v194[1] >> 6;
        unint64_t v151 = v150 + (v197 ^ v149);
        uint64_t v152 = v151 >= v149 ? ~(-1 << *v194) : 0;
        int64_t v153 = v151 - v152;
        if (v153 >= v33)
        {
          BOOL v71 = __OFSUB__(v153, v34);
          int64_t v154 = v153 - v34;
          if (v71) {
            goto LABEL_159;
          }
          uint64_t v155 = *v194 & 0x3FLL;
          uint64_t v156 = ((v149 & ((v154 - v150) >> 63)) + v154 - v150) ^ v149;
          unint64_t v157 = v156 ^ v197;
          char v158 = v155 * v145;
          uint64_t v159 = (v155 * v145) >> 6;
          uint64_t v160 = (v155 * v145) & 0x3F;
          uint64_t v161 = v195;
          *(void *)(v195 + 8 * v159) ^= (v156 ^ v197) << v158;
          unint64_t v162 = *v148 & 0x3FLL;
          if (64 - v160 < v162)
          {
            unint64_t v163 = v162 << v162;
            BOOL v71 = __OFADD__(v163, 64);
            uint64_t v164 = v163 + 64;
            if (v71) {
              goto LABEL_161;
            }
            uint64_t v165 = v164 - 1;
            BOOL v123 = v164 < 1;
            uint64_t v166 = v164 + 62;
            if (!v123) {
              uint64_t v166 = v165;
            }
            if (v159 + 1 == v166 >> 6) {
              uint64_t v167 = 0;
            }
            else {
              uint64_t v167 = v159 + 1;
            }
            *(void *)(v161 + 8 * v167) ^= v157 >> (64 - v160);
          }
          uint64_t v197 = v156;
        }
      }
      _HashTable.BucketIterator.advance()();
      uint64_t v145 = v196;
      if (!v196) {
        return;
      }
    }
  }
  uint64_t v175 = v33 - v29;
  unint64_t v82 = v171;
  (*(void (**)(char *, uint64_t, uint64_t))(v180 + 16))(v171, v170, AssociatedTypeWitness);
  if ((sub_24A5BB530() & 1) == 0) {
    goto LABEL_167;
  }
  uint64_t v83 = v169;
  swift_getWitnessTable();
  sub_24A5BBBE0();
  (*(void (**)(char *, uint64_t))(v168 + 8))(v82, v83);
  sub_24A5BB840();
  uint64_t v84 = swift_getAssociatedConformanceWitness();
  uint64_t v85 = (char *)v184;
  v189 = (char *)v84;
  sub_24A5BBEE0();
  uint64_t v86 = *(char **)(v193 + 48);
  uint64_t v87 = v191;
  v187 = (char *)(v193 + 48);
  uint64_t v185 = v86;
  int v88 = ((uint64_t (*)(char *, uint64_t, uint64_t))v86)(v85, 1, v191);
  uint64_t v89 = v175;
  if (v88 == 1)
  {
LABEL_106:
    (*(void (**)(char *, uint64_t))(v176 + 8))(v186, v192);
    return;
  }
  uint64_t AssociatedConformanceWitness = *(void (**)(char *, char *, uint64_t))(v193 + 32);
  v193 += 32;
  unint64_t v90 = (void (**)(char *, uint64_t))(v193 - 24);
  while (1)
  {
    AssociatedConformanceWitness(v188, v85, v87);
    uint64_t v91 = sub_24A5BB370();
    uint64_t v92 = *v36;
    uint64_t v93 = 1 << *v36;
    uint64_t v94 = v93 - 1;
    if (__OFSUB__(v93, 1)) {
      goto LABEL_153;
    }
    uint64_t v95 = v94 & v91;
    uint64_t v96 = _HashTable.UnsafeHandle._startIterator(bucket:)(v94 & v91, v36, v81);
    uint64_t v194 = v36;
    uint64_t v195 = v81;
    uint64_t v196 = v95;
    uint64_t v197 = v96;
    unint64_t v198 = v97;
    uint64_t v199 = v98;
    char v200 = 0;
    if (!v96) {
      goto LABEL_103;
    }
    uint64_t v99 = -1 << *v36;
    unint64_t v100 = ~v99;
    uint64_t v101 = (uint64_t)v36[1] >> 6;
    unint64_t v102 = (v99 ^ ~v96) + v101;
    uint64_t v103 = v102 >= ~v99 ? ~v99 : 0;
    if (v102 - v103 != v33) {
      break;
    }
    char v104 = 0;
LABEL_102:
    char v200 = v104;
    uint64_t v196 = v95;
    uint64_t v197 = v96;
    unint64_t v198 = v97;
    uint64_t v199 = v98;
LABEL_103:
    if (__OFSUB__(v33, v89)) {
      goto LABEL_156;
    }
    _HashTable.BucketIterator.currentValue.setter(v33 - v89, 0);
    uint64_t v87 = v191;
    (*v90)(v188, v191);
    BOOL v71 = __OFADD__(v33++, 1);
    if (v71) {
      goto LABEL_157;
    }
    uint64_t v85 = (char *)v184;
    sub_24A5BBEE0();
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v185)(v85, 1, v87) == 1) {
      goto LABEL_106;
    }
  }
  char v104 = 0;
  uint64_t v105 = v92 & 0x3F;
  BOOL v106 = __OFADD__(v105 << v105, 64);
  uint64_t v107 = (v105 << v105) + 126;
  if ((v105 << v105) + 64 >= 1) {
    uint64_t v107 = (v105 << v105) + 63;
  }
  uint64_t v108 = v107 >> 6;
  while (1)
  {
    if (++v95 == v93)
    {
      if (v104) {
        goto LABEL_168;
      }
      uint64_t v95 = 0;
      char v104 = 1;
    }
    if (v98 < v105) {
      break;
    }
    BOOL v71 = __OFSUB__(v98, v105);
    v98 -= v105;
    if (v71) {
      goto LABEL_146;
    }
    unint64_t v118 = v97 >> v105;
    uint64_t v96 = v97 & v94;
    if ((v97 & v94) == 0)
    {
LABEL_101:
      unint64_t v97 = v118;
      goto LABEL_102;
    }
LABEL_76:
    unint64_t v109 = (v96 ^ v100) + v101;
    if (v109 >= v100) {
      unint64_t v110 = v100;
    }
    else {
      unint64_t v110 = 0;
    }
    unint64_t v97 = v118;
    if (v109 - v110 == v33) {
      goto LABEL_101;
    }
  }
  uint64_t v111 = (v95 * v105) >> 6;
  if (v98)
  {
    if (v106) {
      goto LABEL_151;
    }
    if (v111 + 1 == v108) {
      uint64_t v111 = 0;
    }
    else {
      ++v111;
    }
  }
  uint64_t v112 = v105 - v98;
  if (__OFSUB__(v105, v98)) {
    goto LABEL_148;
  }
  if (v111 == 2 && v105 == 5) {
    uint64_t v114 = 32;
  }
  else {
    uint64_t v114 = 64;
  }
  BOOL v71 = __OFSUB__(v114, v112);
  uint64_t v115 = v114 - v112;
  if (!v71)
  {
    unint64_t v116 = *(void *)(v81 + 8 * v111);
    uint64_t v117 = (v116 << v98) | v97;
    unint64_t v118 = v116 >> v112;
    uint64_t v98 = v115;
    uint64_t v96 = v117 & v94;
    if ((v117 & v94) == 0) {
      goto LABEL_101;
    }
    goto LABEL_76;
  }
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
  __break(1u);
LABEL_161:
  __break(1u);
LABEL_162:
  __break(1u);
LABEL_163:
  __break(1u);
LABEL_164:
  __break(1u);
LABEL_165:
  __break(1u);
LABEL_166:
  __break(1u);
LABEL_167:
  __break(1u);
LABEL_168:
  sub_24A5BC340();
  __break(1u);
}

uint64_t _HashTable.UnsafeHandle.bias.setter(uint64_t result, void *a2)
{
  uint64_t v2 = 1 << *a2;
  BOOL v3 = __OFSUB__(v2, 1);
  uint64_t v4 = v2 - 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = (v4 & (result >> 63)) + result;
    if (v5 < v4) {
      uint64_t v4 = 0;
    }
    a2[1] = a2[1] & 0x3FLL | ((v5 - v4) << 6);
  }
  return result;
}

uint64_t _HashTable.UnsafeHandle._header.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*_HashTable.UnsafeHandle._header.modify())(void, void, void, void, void)
{
  return nullsub_1;
}

uint64_t _HashTable.UnsafeHandle._buckets.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t _HashTable.UnsafeHandle._buckets.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*_HashTable.UnsafeHandle._buckets.modify())(void, void, void, void, void)
{
  return nullsub_1;
}

uint64_t _HashTable.UnsafeHandle.reservedScale.getter(uint64_t a1)
{
  return *(void *)(a1 + 8) & 0x3FLL;
}

uint64_t _HashTable.UnsafeHandle.bias.getter(uint64_t a1)
{
  return *(uint64_t *)(a1 + 8) >> 6;
}

uint64_t *(*_HashTable.UnsafeHandle.bias.modify(uint64_t *a1, uint64_t a2))(uint64_t *result, char a2)
{
  *a1 = *(uint64_t *)(a2 + 8) >> 6;
  a1[1] = a2;
  return sub_24A5B03B0;
}

uint64_t *sub_24A5B03B0(uint64_t *result, char a2)
{
  uint64_t v2 = (void *)result[1];
  uint64_t v3 = 1 << *v2;
  BOOL v4 = __OFSUB__(v3, 1);
  uint64_t v5 = v3 - 1;
  char v6 = v4;
  if (a2)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_8;
    }
    __break(1u);
  }
  if (v6)
  {
    __break(1u);
    return result;
  }
LABEL_8:
  uint64_t v7 = (v5 & (*result >> 63)) + *result;
  if (v7 < v5) {
    uint64_t v5 = 0;
  }
  v2[1] = v2[1] & 0x3FLL | ((v7 - v5) << 6);
  return result;
}

uint64_t _HashTable.UnsafeHandle.bitCount.getter(void *a1)
{
  return (*a1 & 0x3FLL) << *a1;
}

uint64_t _HashTable.UnsafeHandle.capacity.getter(uint64_t result)
{
  unint64_t v1 = *(void *)result & 0x3FLL;
  if (v1 < 5) {
    return 15;
  }
  double v2 = (double)(1 << v1) * 0.75;
  if ((~*(void *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v2 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v2 < 9.22337204e18) {
    return (uint64_t)v2;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t _HashTable.UnsafeHandle.bucket(after:)(uint64_t result, void *a2)
{
  if (__OFADD__(result, 1))
  {
    __break(1u);
  }
  else if (result + 1 == 1 << *a2)
  {
    return 0;
  }
  else
  {
    ++result;
  }
  return result;
}

uint64_t _HashTable.UnsafeHandle.bucket(before:)(uint64_t a1, void *a2)
{
  if (!a1) {
    a1 = 1 << *a2;
  }
  BOOL v2 = __OFSUB__(a1, 1);
  uint64_t result = a1 - 1;
  if (v2) {
    __break(1u);
  }
  return result;
}

Swift::Int __swiftcall _HashTable.UnsafeHandle.word(before:)(Swift::Int before)
{
  if (before)
  {
    BOOL v2 = __OFSUB__(before--, 1);
    if (!v2) {
      return before;
    }
    __break(1u);
LABEL_9:
    __break(1u);
    return before;
  }
  uint64_t v3 = (*v1 & 0x3FLL) << *v1;
  BOOL v2 = __OFADD__(v3, 64);
  uint64_t v4 = v3 + 64;
  if (v2) {
    goto LABEL_9;
  }
  uint64_t v6 = v4 - 1;
  BOOL v5 = v4 < 1;
  uint64_t v7 = v4 + 62;
  if (!v5) {
    uint64_t v7 = v6;
  }
  return (v7 >> 6) - 1;
}

void *(*_HashTable.UnsafeHandle.subscript.modify(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))(void *result)
{
  a1[1] = a2;
  a1[2] = a4;
  *a1 = *(void *)(a4 + 8 * a2);
  return sub_24A5B0540;
}

void *sub_24A5B0540(void *result)
{
  *(void *)(result[2] + 8 * result[1]) = *result;
  return result;
}

uint64_t _HashTable.UnsafeHandle.subscript.getter(uint64_t result, void *a2, uint64_t a3)
{
  unint64_t v3 = *a2 & 0x3FLL;
  uint64_t v4 = (uint64_t)(v3 * result) >> 6;
  uint64_t v5 = *(void *)(a3 + 8 * v4) >> (v3 * result);
  unint64_t v6 = 64 - ((v3 * result) & 0x3F);
  if (v6 >= v3) {
    return v5 & ~(-1 << v3);
  }
  if (!__OFADD__(v3 << v3, 64))
  {
    uint64_t v7 = (v3 << v3) + 126;
    if ((uint64_t)((v3 << v3) + 64) >= 1) {
      uint64_t v7 = (v3 << v3) + 63;
    }
    if (v4 + 1 == v7 >> 6) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v4 + 1;
    }
    uint64_t v5 = (*(void *)(a3 + 8 * v8) << v6) | v5 & ~(-1 << v6);
    return v5 & ~(-1 << v3);
  }
  __break(1u);
  return result;
}

unint64_t _HashTable.UnsafeHandle.subscript.setter(unint64_t result, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4 = (*a3 & 0x3FLL) * a2;
  uint64_t v5 = v4 >> 6;
  *(void *)(a4 + 8 * (v4 >> 6)) = ((((-1 << *a3) + 1) << v4) - 1) & *(void *)(a4 + 8 * (v4 >> 6)) | (result << v4);
  unint64_t v6 = 64 - (v4 & 0x3F);
  unint64_t v7 = *a3 & 0x3FLL;
  if (v6 < v7)
  {
    unint64_t v8 = v7 << v7;
    BOOL v9 = __OFADD__(v8, 64);
    uint64_t v10 = v8 + 64;
    if (v9)
    {
      __break(1u);
    }
    else
    {
      uint64_t v12 = v10 - 1;
      BOOL v11 = v10 < 1;
      uint64_t v13 = v10 + 62;
      if (!v11) {
        uint64_t v13 = v12;
      }
      if (v5 + 1 == v13 >> 6) {
        uint64_t v14 = 0;
      }
      else {
        uint64_t v14 = v5 + 1;
      }
      *(void *)(a4 + 8 * v14) = *(void *)(a4 + 8 * v14) & (-1 << (*a3 - v6)) | (result >> v6);
    }
  }
  return result;
}

unint64_t (*_HashTable.UnsafeHandle.subscript.modify(uint64_t *a1, uint64_t a2, void *a3, uint64_t a4))(uint64_t a1)
{
  a1[2] = (uint64_t)a3;
  a1[3] = a4;
  a1[1] = a2;
  *a1 = _HashTable.UnsafeHandle.subscript.getter(a2, a3, a4);
  return sub_24A5B06CC;
}

unint64_t sub_24A5B06CC(uint64_t a1)
{
  return _HashTable.UnsafeHandle.subscript.setter(*(void *)a1, *(void *)(a1 + 8), *(void **)(a1 + 16), *(void *)(a1 + 24));
}

unint64_t _HashTable.UnsafeHandle.subscript.getter(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = _HashTable.UnsafeHandle.subscript.getter(a1, a2, a3);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = -1 << *a2;
  unint64_t v6 = (v5 ^ ~v4) + ((uint64_t)a2[1] >> 6);
  if (v6 >= ~v5) {
    uint64_t v7 = ~v5;
  }
  else {
    uint64_t v7 = 0;
  }
  return v6 - v7;
}

void (*_HashTable.UnsafeHandle.subscript.modify(void *a1, uint64_t a2, void *a3, uint64_t a4))(uint64_t a1)
{
  unint64_t v8 = malloc(0x28uLL);
  *a1 = v8;
  _OWORD v8[3] = a3;
  void v8[4] = a4;
  void v8[2] = a2;
  uint64_t v9 = _HashTable.UnsafeHandle.subscript.getter(a2, a3, a4);
  if (v9)
  {
    uint64_t v10 = -1 << *a3;
    unint64_t v11 = (v10 ^ ~v9) + ((uint64_t)a3[1] >> 6);
    if (v11 >= ~v10) {
      uint64_t v12 = ~v10;
    }
    else {
      uint64_t v12 = 0;
    }
    unint64_t v13 = v11 - v12;
  }
  else
  {
    unint64_t v13 = 0;
  }
  *unint64_t v8 = v13;
  *((unsigned char *)v8 + 8) = v9 == 0;
  return sub_24A5B07F8;
}

void sub_24A5B07F8(uint64_t a1)
{
  unint64_t v1 = *(void **)a1;
  BOOL v2 = *(void **)(*(void *)a1 + 24);
  if (*(unsigned char *)(*(void *)a1 + 8))
  {
    unint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = *v1 - ((uint64_t)v2[1] >> 6);
    unint64_t v3 = (-1 << *v2) ^ ~(((v4 >> 63) & ~(-1 << *v2)) + v4);
  }
  _HashTable.UnsafeHandle.subscript.setter(v3, v1[2], v2, v1[4]);
  free(v1);
}

uint64_t _HashTable.UnsafeHandle.firstOccupiedBucketInChain(with:)(uint64_t result, void *a2, uint64_t a3)
{
  unint64_t v3 = *a2 & 0x3FLL;
  uint64_t v4 = 1 << *a2;
  unint64_t v5 = v3 << *a2;
  uint64_t v6 = v5 + 64;
  BOOL v7 = __OFADD__(v5, 64);
  uint64_t v9 = v6 - 1;
  BOOL v8 = v6 < 1;
  uint64_t v10 = v6 + 62;
  if (!v8) {
    uint64_t v10 = v9;
  }
  uint64_t v11 = v10 >> 6;
  while (1)
  {
    if (result) {
      uint64_t v14 = result;
    }
    else {
      uint64_t v14 = 1 << *a2;
    }
    uint64_t result = v14 - 1;
    if (__OFSUB__(v14, 1))
    {
      __break(1u);
      goto LABEL_24;
    }
    uint64_t v15 = (uint64_t)(result * v3) >> 6;
    uint64_t v13 = *(void *)(a3 + 8 * v15) >> (result * v3);
    unint64_t v16 = 64 - ((result * v3) & 0x3F);
    if (v16 < v3) {
      break;
    }
LABEL_11:
    if ((v13 & (v4 - 1)) == 0) {
      goto LABEL_19;
    }
  }
  if (!v7)
  {
    if (v15 + 1 == v11) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = v15 + 1;
    }
    uint64_t v13 = (*(void *)(a3 + 8 * v12) << v16) | v13 & ~(-1 << v16);
    goto LABEL_11;
  }
  __break(1u);
LABEL_19:
  if (__OFADD__(result, 1))
  {
LABEL_24:
    __break(1u);
    return result;
  }
  if (result + 1 == v4) {
    return 0;
  }
  return ++result;
}

ValueMetadata *type metadata accessor for _HashTable.UnsafeHandle()
{
  return &type metadata for _HashTable.UnsafeHandle;
}

CollectionsInternal::_RopeVersion __swiftcall _RopeVersion.init()()
{
  v1._value = 0;
  MEMORY[0x24C5C7E90](&v1, 8);
  return v1;
}

BOOL static _RopeVersion.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

Swift::Void __swiftcall _RopeVersion.bump()()
{
  ++*v0;
}

uint64_t _RopeVersion._value.setter(uint64_t result)
{
  *CollectionsInternal::_RopeVersion v1 = result;
  return result;
}

uint64_t (*_RopeVersion._value.modify())(void, void, void, void, void)
{
  return nullsub_1;
}

Swift::Void __swiftcall _RopeVersion.reset()()
{
  uint64_t v1 = 0;
  MEMORY[0x24C5C7E90](&v1, 8);
  *uint64_t v0 = v1;
}

ValueMetadata *type metadata accessor for _RopeVersion()
{
  return &type metadata for _RopeVersion;
}

uint64_t Rope.find<A>(at:in:preferEnd:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v93 = a5;
  uint64_t v94 = a6;
  int v95 = a3;
  uint64_t v91 = (char *)a2;
  uint64_t v89 = a1;
  uint64_t v9 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(a4 + 24);
  uint64_t v85 = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v80 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v81 = (char *)&v74 - v10;
  uint64_t v78 = v9;
  uint64_t v90 = v8;
  uint64_t v11 = type metadata accessor for Rope._Node();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v74 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v96 = (char *)&v74 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v74 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v79 = (char *)&v74 - v21;
  uint64_t v22 = sub_24A5BBD20();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v77 = (char *)&v74 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v74 - v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v74 - v29;
  uint64_t v31 = *(void (**)(char *, uint64_t, void))(v23 + 16);
  uint64_t v87 = v7;
  uint64_t v83 = v31;
  uint64_t AssociatedConformanceWitness = v23 + 16;
  v31((char *)&v74 - v29, v7, v22);
  uint64_t v92 = v12;
  unint64_t v82 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  LODWORD(v12) = v82(v30, 1, v11);
  unint64_t v75 = *(void (**)(char *, uint64_t))(v23 + 8);
  int v88 = (void (*)(void, void, void))v22;
  uint64_t v76 = v23 + 8;
  v75(v30, v22);
  uint64_t v32 = 0;
  if (v12 != 1)
  {
    v83(v28, v87, v88);
    if (v82(v28, 1, v11) == 1)
    {
LABEL_14:
      uint64_t v72 = v28;
      unint64_t v73 = v88;
LABEL_16:
      uint64_t result = ((uint64_t (*)(char *, void (*)(void, void, void)))v75)(v72, v73);
      __break(1u);
      return result;
    }
    uint64_t v33 = v92;
    uint64_t v34 = v79;
    (*(void (**)(char *, char *, uint64_t))(v92 + 32))(v79, v28, v11);
    uint64_t v35 = v80;
    uint64_t v36 = v81;
    uint64_t v37 = AssociatedTypeWitness;
    (*(void (**)(char *, char *, uint64_t))(v80 + 16))(v81, &v34[*(int *)(v11 + 36)], AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v11);
    uint64_t v28 = v91;
    uint64_t v32 = (*(uint64_t (**)(char *, uint64_t))(v94 + 24))(v36, v93);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v37);
  }
  if (v89 < 0 || v32 < v89)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v38 = v85;
  if ((Rope.isEmpty.getter() & 1) != 0 || !(v95 & 1 | (v32 > v89))) {
    return Rope.endIndex.getter(v38);
  }
  v99[0] = v89;
  uint64_t v39 = v77;
  uint64_t v40 = v88;
  v83(v77, v87, v88);
  if (v82(v39, 1, v11) == 1)
  {
    uint64_t v72 = v39;
    unint64_t v73 = v40;
    goto LABEL_16;
  }
  uint64_t v41 = v92;
  int v88 = *(void (**)(void, void, void))(v92 + 32);
  uint64_t v89 = v92 + 32;
  v88(v20, v39, v11);
  uint64_t v42 = Rope._Node.header.getter() >> 16;
  uint64_t v43 = v78;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v98 = _RopePath.init(height:)(v42);
  uint64_t v44 = Rope._Node.header.getter();
  uint64_t v45 = *(void (**)(void *, char *, uint64_t))(v41 + 16);
  uint64_t v46 = v96;
  if ((v44 & 0xFF0000) != 0)
  {
    do
    {
      v45(v15, v20, v11);
      uint64_t v47 = *(void *)v15 + 16;
      unint64_t v48 = *(void *)v15
          + ((*(unsigned __int8 *)(v41 + 80) + 19) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80));
      swift_getWitnessTable();
      uint64_t v49 = nullsub_1(v47, v48, v43, v11, v90);
      uint64_t v51 = v50;
      swift_unknownObjectRetain();
      uint64_t v52 = v49;
      uint64_t v46 = v96;
      uint64_t v53 = v51;
      uint64_t v41 = v92;
      sub_24A5B18A8(v52, v53, v99, (uint64_t)v91, v95 & 1, v43, v93, (uint64_t)v96, v94);
      swift_unknownObjectRelease();
      uint64_t v54 = *(void (**)(char *, uint64_t))(v41 + 8);
      v54(v15, v11);
      v54(v20, v11);
      v88(v20, v46, v11);
    }
    while ((Rope._Node.header.getter() & 0xFF0000) != 0);
  }
  v45(v46, v20, v11);
  uint64_t v55 = *(void *)v46;
  unint64_t v56 = v46;
  uint64_t v57 = *(void *)v46 + 16;
  uint64_t v58 = v90;
  uint64_t v59 = type metadata accessor for Rope._Item();
  uint64_t v60 = v41;
  uint64_t v61 = v55
      + ((*(unsigned __int8 *)(*(void *)(v59 - 8) + 80) + 19) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v59 - 8) + 80));
  swift_getWitnessTable();
  BOOL v62 = (unsigned __int16 *)nullsub_1(v57, v61, v43, v59, v58);
  uint64_t v64 = v63;
  swift_unknownObjectRetain();
  sub_24A5B1A6C(v62, v64, v99, (uint64_t)v91, v95 & 1, v43, v93, v94, &v97);
  swift_unknownObjectRelease();
  unint64_t v65 = *(void (**)(char *, uint64_t))(v60 + 8);
  v65(v56, v11);
  uint64_t v66 = v97;
  uint64_t v67 = type metadata accessor for _RopePath();
  _RopePath.subscript.setter(v66, 0, v67);
  uint64_t v68 = *(void *)(v87 + *(int *)(v85 + 36));
  uint64_t v69 = v98;
  uint64_t v70 = Rope._Node.asUnmanagedLeaf.getter();
  v65(v20, v11);
  return Rope.Index.init(version:path:leaf:)(v68, v69, v70, v43, v58);
}

uint64_t Rope._UnsafeHandle.findSlot<A>(at:in:preferEnd:)(uint64_t a1, uint64_t a2, int a3, unsigned __int16 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  int v32 = a3;
  uint64_t v41 = a2;
  uint64_t v42 = a8;
  uint64_t v43 = a10;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v33 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v16 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v18 = &v31[-v17];
  uint64_t v19 = *(void *)(a7 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v21 = &v31[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v45 = a4;
  uint64_t v46 = a5;
  uint64_t v47 = a6;
  uint64_t v44 = AssociatedConformanceWitness;
  uint64_t result = Rope._UnsafeHandle.childCount.getter(a4);
  if (result < 0)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v23 = result;
  if (result)
  {
    uint64_t v24 = 0;
    uint64_t v38 = *(void (**)(uint64_t, uint64_t))(a9 + 24);
    uint64_t v39 = a9 + 24;
    uint64_t v36 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v43 + 24);
    uint64_t v37 = v43 + 24;
    uint64_t v34 = v19 + 8;
    uint64_t v35 = v19 + 16;
    uint64_t v25 = (uint64_t (**)(unsigned char *, uint64_t))(v33 + 8);
    uint64_t v33 = (v32 & 1) == 0;
    while (v23 != v24)
    {
      uint64_t v26 = Rope._UnsafeHandle.children.getter(v45, v46, v47, a7, v44, a9);
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v19 + 16))(v21, v26 + *(void *)(v19 + 72) * v24, a7);
      v38(a7, a9);
      (*(void (**)(unsigned char *, uint64_t))(v19 + 8))(v21, a7);
      uint64_t v27 = v36(v18, v42, v43);
      uint64_t result = (*v25)(v18, AssociatedTypeWitness);
      uint64_t v28 = a1 - v27;
      if (__OFSUB__(a1, v27)) {
        goto LABEL_17;
      }
      if (__OFADD__(v28, v33)) {
        goto LABEL_18;
      }
      if (v28 + v33 < 1) {
        return v24;
      }
      ++v24;
      a1 -= v27;
      if (v23 == v24)
      {
        a1 = v28;
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
LABEL_10:
  char v29 = v32;
  if (a1)
  {
LABEL_20:
    __break(1u);
    return result;
  }
  uint64_t v30 = Rope._UnsafeHandle.childCount.getter(v45);
  uint64_t v24 = v30;
  if (v29)
  {
    uint64_t v24 = v30 - 1;
    if (__OFSUB__(v30, 1)) {
      __break(1u);
    }
  }
  return v24;
}

uint64_t Rope._UnsafeHandle.findSlot<A>(from:offsetBy:in:preferEnd:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, unsigned __int16 *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v40 = a6;
  uint64_t v52 = a4;
  uint64_t v56 = a12;
  uint64_t v51 = a10;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v19 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v20 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v49 = (char *)&v40 - v21;
  uint64_t v55 = *(void *)(a9 - 8);
  uint64_t result = MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v40 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v25 = __OFADD__(a2, a3);
  uint64_t v26 = a2 + a3;
  if (!v25)
  {
    uint64_t v53 = a7;
    uint64_t v54 = a8;
    if (Rope._UnsafeHandle.childCount.getter(v40) <= a1) {
      return a1;
    }
    uint64_t v27 = *(void (**)(uint64_t, uint64_t))(a11 + 24);
    uint64_t v47 = a11 + 24;
    BOOL v48 = (a5 & 1) == 0;
    uint64_t v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v56 + 24);
    uint64_t v45 = v56 + 24;
    uint64_t v46 = v27;
    uint64_t v29 = v54;
    uint64_t v43 = v55 + 16;
    uint64_t v44 = v28;
    uint64_t v41 = (uint64_t (**)(char *, uint64_t))(v19 + 8);
    uint64_t v42 = v55 + 8;
    uint64_t v30 = v40;
    uint64_t v31 = v53;
    while (1)
    {
      uint64_t v32 = AssociatedConformanceWitness;
      uint64_t v33 = v30;
      uint64_t v34 = v32;
      uint64_t v35 = Rope._UnsafeHandle.children.getter(v30, v31, v29, a9, v32, a11);
      uint64_t v36 = v55;
      (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))(v24, v35 + *(void *)(v55 + 72) * a1, a9);
      uint64_t v37 = v49;
      v46(a9, a11);
      (*(void (**)(char *, uint64_t))(v36 + 8))(v24, a9);
      uint64_t v38 = v44(v37, v51, v56);
      uint64_t result = (*v41)(v37, AssociatedTypeWitness);
      if (__OFADD__(v26, v48)) {
        break;
      }
      if (v38 >= v26 + v48) {
        return a1;
      }
      BOOL v25 = __OFSUB__(v26, v38);
      v26 -= v38;
      if (v25) {
        goto LABEL_10;
      }
      ++a1;
      uint64_t v30 = v33;
      uint64_t v39 = v33;
      uint64_t v31 = v53;
      uint64_t v29 = v54;
      uint64_t AssociatedConformanceWitness = v34;
      if (a1 >= Rope._UnsafeHandle.childCount.getter(v39)) {
        return a1;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24A5B18A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9)
{
  uint64_t v11 = a3;
  uint64_t v14 = *a3;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v16 = type metadata accessor for Rope._Node();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v18 = v14;
  uint64_t v19 = a2;
  uint64_t v20 = Rope._UnsafeHandle.findSlot<A>(at:in:preferEnd:)(v18, a4, a5, (unsigned __int16 *)a1, a2, a6, v16, a7, WitnessTable, a9);
  *uint64_t v11 = v21;
  LOBYTE(v11) = *(unsigned char *)(a1 + 2);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v22 = type metadata accessor for _RopePath();
  _RopePath.subscript.setter(v20, v11, v22);
  uint64_t v23 = Rope._UnsafeHandle.children.getter((unsigned __int16 *)a1, v19, a6, v16, AssociatedConformanceWitness, WitnessTable);
  uint64_t v24 = *(void *)(v16 - 8);
  BOOL v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 16);
  uint64_t v26 = v23 + *(void *)(v24 + 72) * v20;
  return v25(a8, v26, v16);
}

uint64_t sub_24A5B1A6C@<X0>(unsigned __int16 *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>)
{
  uint64_t v17 = *a3;
  swift_getAssociatedConformanceWitness();
  uint64_t v18 = type metadata accessor for Rope._Item();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t result = Rope._UnsafeHandle.findSlot<A>(at:in:preferEnd:)(v17, a4, a5, a1, a2, a6, v18, a7, WitnessTable, a8);
  *a9 = result;
  a9[1] = v21;
  return result;
}

uint64_t static BitArray.|= infix(_:_:)(uint64_t *a1, int8x16_t *a2, uint64_t a3)
{
  uint64_t v6 = a1[1];
  if ((v6 | a3) < 0)
  {
    __break(1u);
    goto LABEL_20;
  }
  if (v6 != a3)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    uint64_t result = (uint64_t)sub_24A499D60(v4);
    uint64_t v4 = result;
    *unint64_t v3 = result;
    unint64_t v8 = *(void *)(result + 16);
    if (!v8) {
      goto LABEL_18;
    }
    goto LABEL_5;
  }
  unint64_t v5 = a2;
  unint64_t v3 = a1;
  uint64_t v4 = *a1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *unint64_t v3 = v4;
  if ((result & 1) == 0) {
    goto LABEL_21;
  }
  unint64_t v8 = *(void *)(v4 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  if (v8 < 6
    || ((uint64_t v9 = 8 * v8 + 32, v4 + 32 < (unint64_t)v5->u64 + v9)
      ? (BOOL v10 = (unint64_t)&v5[2] >= v4 + v9)
      : (BOOL v10 = 1),
        !v10))
  {
    uint64_t v11 = 0;
LABEL_16:
    unint64_t v16 = v8 - v11;
    uint64_t v17 = 8 * v11 + 32;
    uint64_t v18 = (void *)(v4 + v17);
    uint64_t v19 = (uint64_t *)((char *)v5->i64 + v17);
    do
    {
      uint64_t v20 = *v19++;
      *v18++ |= v20;
      --v16;
    }
    while (v16);
    goto LABEL_18;
  }
  uint64_t v11 = v8 & 0x7FFFFFFFFFFFFFFCLL;
  uint64_t v12 = v5 + 3;
  uint64_t v13 = (int8x16_t *)(v4 + 48);
  uint64_t v14 = v8 & 0x7FFFFFFFFFFFFFFCLL;
  do
  {
    int8x16_t v15 = vorrq_s8(*v13, *v12);
    v13[-1] = vorrq_s8(v13[-1], v12[-1]);
    *uint64_t v13 = v15;
    v12 += 2;
    v13 += 2;
    v14 -= 4;
  }
  while (v14);
  if (v8 != v11) {
    goto LABEL_16;
  }
LABEL_18:
  *unint64_t v3 = v4;
  return result;
}

char *static BitArray.| infix(_:_:)(char *a1, uint64_t a2, int8x16_t *a3, uint64_t a4)
{
  if ((a4 | a2) < 0)
  {
    __break(1u);
    goto LABEL_20;
  }
  if (a2 != a4)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    uint64_t v4 = sub_24A499D60((uint64_t)v4);
    unint64_t v6 = *((void *)v4 + 2);
    if (!v6) {
      return v4;
    }
    goto LABEL_5;
  }
  unint64_t v5 = a3;
  uint64_t v4 = a1;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_21;
  }
  unint64_t v6 = *((void *)v4 + 2);
  if (!v6) {
    return v4;
  }
LABEL_5:
  if (v6 < 6 || ((uint64_t v7 = 8 * v6 + 32, v4 + 32 < &v5->i8[v7]) ? (v8 = &v5[2] >= (int8x16_t *)&v4[v7]) : (v8 = 1), !v8))
  {
    uint64_t v9 = 0;
LABEL_16:
    unint64_t v14 = v6 - v9;
    uint64_t v15 = 8 * v9 + 32;
    unint64_t v16 = &v4[v15];
    uint64_t v17 = (uint64_t *)((char *)v5->i64 + v15);
    do
    {
      uint64_t v18 = *v17++;
      *(void *)v16 |= v18;
      v16 += 8;
      --v14;
    }
    while (v14);
    return v4;
  }
  uint64_t v9 = v6 & 0x7FFFFFFFFFFFFFFCLL;
  BOOL v10 = v5 + 3;
  uint64_t v11 = (int8x16_t *)(v4 + 48);
  uint64_t v12 = v6 & 0x7FFFFFFFFFFFFFFCLL;
  do
  {
    int8x16_t v13 = vorrq_s8(*v11, *v10);
    v11[-1] = vorrq_s8(v11[-1], v10[-1]);
    *uint64_t v11 = v13;
    v10 += 2;
    v11 += 2;
    v12 -= 4;
  }
  while (v12);
  if (v6 != v9) {
    goto LABEL_16;
  }
  return v4;
}

uint64_t static BitArray.&= infix(_:_:)(uint64_t *a1, int8x16_t *a2, uint64_t a3)
{
  uint64_t v6 = a1[1];
  if ((v6 | a3) < 0)
  {
    __break(1u);
    goto LABEL_20;
  }
  if (v6 != a3)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    uint64_t result = (uint64_t)sub_24A499D60(v4);
    uint64_t v4 = result;
    *unint64_t v3 = result;
    unint64_t v8 = *(void *)(result + 16);
    if (!v8) {
      goto LABEL_18;
    }
    goto LABEL_5;
  }
  unint64_t v5 = a2;
  unint64_t v3 = a1;
  uint64_t v4 = *a1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *unint64_t v3 = v4;
  if ((result & 1) == 0) {
    goto LABEL_21;
  }
  unint64_t v8 = *(void *)(v4 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  if (v8 < 6
    || ((uint64_t v9 = 8 * v8 + 32, v4 + 32 < (unint64_t)v5->u64 + v9)
      ? (BOOL v10 = (unint64_t)&v5[2] >= v4 + v9)
      : (BOOL v10 = 1),
        !v10))
  {
    uint64_t v11 = 0;
LABEL_16:
    unint64_t v16 = v8 - v11;
    uint64_t v17 = 8 * v11 + 32;
    uint64_t v18 = (void *)(v4 + v17);
    uint64_t v19 = (uint64_t *)((char *)v5->i64 + v17);
    do
    {
      uint64_t v20 = *v19++;
      *v18++ &= v20;
      --v16;
    }
    while (v16);
    goto LABEL_18;
  }
  uint64_t v11 = v8 & 0x7FFFFFFFFFFFFFFCLL;
  uint64_t v12 = v5 + 3;
  int8x16_t v13 = (int8x16_t *)(v4 + 48);
  uint64_t v14 = v8 & 0x7FFFFFFFFFFFFFFCLL;
  do
  {
    int8x16_t v15 = vandq_s8(*v13, *v12);
    v13[-1] = vandq_s8(v13[-1], v12[-1]);
    *int8x16_t v13 = v15;
    v12 += 2;
    v13 += 2;
    v14 -= 4;
  }
  while (v14);
  if (v8 != v11) {
    goto LABEL_16;
  }
LABEL_18:
  *unint64_t v3 = v4;
  return result;
}

char *static BitArray.& infix(_:_:)(char *a1, uint64_t a2, int8x16_t *a3, uint64_t a4)
{
  if ((a4 | a2) < 0)
  {
    __break(1u);
    goto LABEL_20;
  }
  if (a2 != a4)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    uint64_t v4 = sub_24A499D60((uint64_t)v4);
    unint64_t v6 = *((void *)v4 + 2);
    if (!v6) {
      return v4;
    }
    goto LABEL_5;
  }
  unint64_t v5 = a3;
  uint64_t v4 = a1;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_21;
  }
  unint64_t v6 = *((void *)v4 + 2);
  if (!v6) {
    return v4;
  }
LABEL_5:
  if (v6 < 6 || ((uint64_t v7 = 8 * v6 + 32, v4 + 32 < &v5->i8[v7]) ? (v8 = &v5[2] >= (int8x16_t *)&v4[v7]) : (v8 = 1), !v8))
  {
    uint64_t v9 = 0;
LABEL_16:
    unint64_t v14 = v6 - v9;
    uint64_t v15 = 8 * v9 + 32;
    unint64_t v16 = &v4[v15];
    uint64_t v17 = (uint64_t *)((char *)v5->i64 + v15);
    do
    {
      uint64_t v18 = *v17++;
      *(void *)v16 &= v18;
      v16 += 8;
      --v14;
    }
    while (v14);
    return v4;
  }
  uint64_t v9 = v6 & 0x7FFFFFFFFFFFFFFCLL;
  BOOL v10 = v5 + 3;
  uint64_t v11 = (int8x16_t *)(v4 + 48);
  uint64_t v12 = v6 & 0x7FFFFFFFFFFFFFFCLL;
  do
  {
    int8x16_t v13 = vandq_s8(*v11, *v10);
    v11[-1] = vandq_s8(v11[-1], v10[-1]);
    *uint64_t v11 = v13;
    v10 += 2;
    v11 += 2;
    v12 -= 4;
  }
  while (v12);
  if (v6 != v9) {
    goto LABEL_16;
  }
  return v4;
}

uint64_t static BitArray.^= infix(_:_:)(uint64_t *a1, int8x16_t *a2, uint64_t a3)
{
  uint64_t v6 = a1[1];
  if ((v6 | a3) < 0)
  {
    __break(1u);
    goto LABEL_20;
  }
  if (v6 != a3)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    uint64_t result = (uint64_t)sub_24A499D60(v4);
    uint64_t v4 = result;
    *unint64_t v3 = result;
    unint64_t v8 = *(void *)(result + 16);
    if (!v8) {
      goto LABEL_18;
    }
    goto LABEL_5;
  }
  unint64_t v5 = a2;
  unint64_t v3 = a1;
  uint64_t v4 = *a1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *unint64_t v3 = v4;
  if ((result & 1) == 0) {
    goto LABEL_21;
  }
  unint64_t v8 = *(void *)(v4 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  if (v8 < 6
    || ((uint64_t v9 = 8 * v8 + 32, v4 + 32 < (unint64_t)v5->u64 + v9)
      ? (BOOL v10 = (unint64_t)&v5[2] >= v4 + v9)
      : (BOOL v10 = 1),
        !v10))
  {
    uint64_t v11 = 0;
LABEL_16:
    unint64_t v16 = v8 - v11;
    uint64_t v17 = 8 * v11 + 32;
    uint64_t v18 = (void *)(v4 + v17);
    uint64_t v19 = (uint64_t *)((char *)v5->i64 + v17);
    do
    {
      uint64_t v20 = *v19++;
      *v18++ ^= v20;
      --v16;
    }
    while (v16);
    goto LABEL_18;
  }
  uint64_t v11 = v8 & 0x7FFFFFFFFFFFFFFCLL;
  uint64_t v12 = v5 + 3;
  int8x16_t v13 = (int8x16_t *)(v4 + 48);
  uint64_t v14 = v8 & 0x7FFFFFFFFFFFFFFCLL;
  do
  {
    int8x16_t v15 = veorq_s8(*v13, *v12);
    v13[-1] = veorq_s8(v13[-1], v12[-1]);
    *int8x16_t v13 = v15;
    v12 += 2;
    v13 += 2;
    v14 -= 4;
  }
  while (v14);
  if (v8 != v11) {
    goto LABEL_16;
  }
LABEL_18:
  *unint64_t v3 = v4;
  return result;
}

char *static BitArray.^ infix(_:_:)(char *a1, uint64_t a2, int8x16_t *a3, uint64_t a4)
{
  if ((a4 | a2) < 0)
  {
    __break(1u);
    goto LABEL_20;
  }
  if (a2 != a4)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    uint64_t v4 = sub_24A499D60((uint64_t)v4);
    unint64_t v6 = *((void *)v4 + 2);
    if (!v6) {
      return v4;
    }
    goto LABEL_5;
  }
  unint64_t v5 = a3;
  uint64_t v4 = a1;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_21;
  }
  unint64_t v6 = *((void *)v4 + 2);
  if (!v6) {
    return v4;
  }
LABEL_5:
  if (v6 < 6 || ((uint64_t v7 = 8 * v6 + 32, v4 + 32 < &v5->i8[v7]) ? (v8 = &v5[2] >= (int8x16_t *)&v4[v7]) : (v8 = 1), !v8))
  {
    uint64_t v9 = 0;
LABEL_16:
    unint64_t v14 = v6 - v9;
    uint64_t v15 = 8 * v9 + 32;
    unint64_t v16 = &v4[v15];
    uint64_t v17 = (uint64_t *)((char *)v5->i64 + v15);
    do
    {
      uint64_t v18 = *v17++;
      *(void *)v16 ^= v18;
      v16 += 8;
      --v14;
    }
    while (v14);
    return v4;
  }
  uint64_t v9 = v6 & 0x7FFFFFFFFFFFFFFCLL;
  BOOL v10 = v5 + 3;
  uint64_t v11 = (int8x16_t *)(v4 + 48);
  uint64_t v12 = v6 & 0x7FFFFFFFFFFFFFFCLL;
  do
  {
    int8x16_t v13 = veorq_s8(*v11, *v10);
    v11[-1] = veorq_s8(v11[-1], v10[-1]);
    *uint64_t v11 = v13;
    v10 += 2;
    v11 += 2;
    v12 -= 4;
  }
  while (v12);
  if (v6 != v9) {
    goto LABEL_16;
  }
  return v4;
}

int8x16_t *static BitArray.~ prefix(_:)(int8x16_t *a1, int8x16_t *a2)
{
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    a1 = (int8x16_t *)sub_24A499D60((uint64_t)a1);
  }
  uint64_t v4 = (int8x16_t *)a1[1].i64[0];
  v6[0] = a1 + 2;
  v6[1] = v4;
  v6[2] = a2;
  sub_24A5B22E4(v6);
  return a1;
}

Swift::Void __swiftcall BitArray.toggleAll()()
{
  uint64_t v1 = *v0;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v1;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v1 = (int8x16_t *)sub_24A499D60((uint64_t)v1);
    *uint64_t v0 = v1;
  }
  unint64_t v3 = (int8x16_t *)v1[1].i64[0];
  uint64_t v4 = v0[1];
  v5[0] = v1 + 2;
  v5[1] = v3;
  v5[2] = v4;
  sub_24A5B22E4(v5);
  *uint64_t v0 = v1;
}

int8x16_t **sub_24A5B22E4(int8x16_t **result)
{
  unint64_t v1 = (unint64_t)result[1];
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    return result;
  }
  BOOL v2 = *result;
  if (v1)
  {
    if (v1 >= 4)
    {
      unint64_t v3 = v1 & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t v4 = v2 + 1;
      unint64_t v5 = v1 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        int8x16_t v6 = vmvnq_s8(*v4);
        v4[-1] = vmvnq_s8(v4[-1]);
        *uint64_t v4 = v6;
        v4 += 2;
        v5 -= 4;
      }
      while (v5);
      if (v1 == v3) {
        goto LABEL_10;
      }
    }
    else
    {
      unint64_t v3 = 0;
    }
    unint64_t v7 = v1 - v3;
    BOOL v8 = &v2->i64[v3];
    do
    {
      *BOOL v8 = ~*v8;
      ++v8;
      --v7;
    }
    while (v7);
  }
LABEL_10:
  unint64_t v9 = (unint64_t)result[2];
  if ((v9 & 0x3F) != 0) {
    *(uint64_t *)((char *)v2->i64 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(-1 << (v9 & 0x3F));
  }
  return result;
}

uint64_t *BitArray.toggleAll(in:)(unint64_t a1, int64_t a2)
{
  uint64_t v6 = *(void *)(v3 + 8);
  if (v6 < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  unint64_t v2 = a2;
  if (v6 < a2)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  unint64_t v4 = a1;
  unint64_t v5 = *(char **)v3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)uint64_t v3 = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_7:
    unint64_t v5 = sub_24A499D60((uint64_t)v5);
    *(void *)uint64_t v3 = v5;
  }
  uint64_t v8 = *((void *)v5 + 2);
  v10[0] = (uint64_t)(v5 + 32);
  v10[1] = v8;
  _OWORD v10[2] = v6;
  uint64_t result = sub_24A5B2424(v10, v4, v2);
  *(void *)uint64_t v3 = v5;
  return result;
}

uint64_t *sub_24A5B2424(uint64_t *result, unint64_t a2, unint64_t a3)
{
  if (((a3 | a2) & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = *result;
    unint64_t v4 = a2 >> 6;
    unint64_t v5 = a3 >> 6;
    char v6 = a2 & 0x3F;
    if (a2 >> 6 == a3 >> 6)
    {
      *(void *)(v3 + 8 * v4) ^= (-1 << a3) ^ (-1 << v6);
    }
    else
    {
      *(void *)(v3 + 8 * v4) ^= -1 << v6;
      unint64_t v7 = v4 + 1;
      if (v4 + 1 < v5)
      {
        unint64_t v8 = v5 + ~v4;
        if (v8 < 4) {
          goto LABEL_9;
        }
        v7 += v8 & 0xFFFFFFFFFFFFFFFCLL;
        unint64_t v9 = (int8x16_t *)(v3 + 8 * v4 + 24);
        unint64_t v10 = v8 & 0xFFFFFFFFFFFFFFFCLL;
        do
        {
          int8x16_t v11 = vmvnq_s8(*v9);
          v9[-1] = vmvnq_s8(v9[-1]);
          *unint64_t v9 = v11;
          v9 += 2;
          v10 -= 4;
        }
        while (v10);
        if (v8 != (v8 & 0xFFFFFFFFFFFFFFFCLL))
        {
LABEL_9:
          unint64_t v12 = v5 - v7;
          int8x16_t v13 = (void *)(v3 + 8 * v7);
          do
          {
            *int8x16_t v13 = ~*v13;
            ++v13;
            --v12;
          }
          while (v12);
        }
      }
      if ((a3 & 0x3F) != 0) {
        *(void *)(v3 + 8 * v5) = (-1 << (a3 & 0x3F)) ^ ~*(void *)(v3 + 8 * v5);
      }
    }
  }
  return result;
}

uint64_t *BitArray.toggleAll<A>(in:)()
{
  sub_24A50D0D0();
  sub_24A5BB930();
  return BitArray.toggleAll(in:)(v1, v2);
}

uint64_t sub_24A5B258C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  char v7 = *(unsigned char *)(v6 + 18);
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B177928);
    uint64_t result = swift_allocObject();
    *(_WORD *)(result + 16) = 0;
    *(unsigned char *)(result + 18) = v7;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B177EE8);
    uint64_t result = swift_allocObject();
    *(_WORD *)(result + 16) = 0;
    *(unsigned char *)(result + 18) = 0;
  }
  uint64_t v13 = result;
  long long v9 = 0uLL;
  if (*(unsigned __int16 *)(v6 + 16) <= a1)
  {
    uint64_t v6 = result;
    long long v12 = 0uLL;
  }
  else if (a1 < 1)
  {
    long long v9 = *(_OWORD *)(v3 + 1);
    long long v12 = *(_OWORD *)(v3 + 3);
    *uint64_t v3 = result;
    *(_OWORD *)(v3 + 1) = 0u;
    *(_OWORD *)(v3 + 3) = 0u;
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull() & 1) == 0)
    {
      long long v10 = *((_OWORD *)v3 + 1);
      long long v16 = *(_OWORD *)v3;
      long long v17 = v10;
      uint64_t v18 = v3[4];
      sub_24A4CBC1C((uint64_t)v14);
      swift_unknownObjectRelease();
      long long v11 = v14[1];
      *(_OWORD *)uint64_t v3 = v14[0];
      *((_OWORD *)v3 + 1) = v11;
      v3[4] = v15;
    }
    uint64_t result = sub_24A5B4390(v3, *(unsigned __int16 *)(*v3 + 16) - a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A5B47F8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A5B4700);
    uint64_t v6 = v13;
    long long v9 = 0u;
    long long v12 = 0u;
  }
  *(void *)a2 = v6;
  *(_OWORD *)(a2 + 8) = v9;
  *(_OWORD *)(a2 + 24) = v12;
  return result;
}

uint64_t sub_24A5B2704@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3 = (uint64_t *)result;
  uint64_t v5 = *a2;
  if (!*a2) {
    goto LABEL_14;
  }
  if (!*(_WORD *)(v5 + 16))
  {
    uint64_t result = sub_24A496BE8((uint64_t)a2);
LABEL_14:
    uint64_t v5 = *v3;
    uint64_t v7 = v3[1];
    uint64_t v8 = v3[2];
    uint64_t v9 = v3[3];
    uint64_t v10 = v3[4];
    uint64_t v22 = v3[5];
LABEL_27:
    *a3 = v5;
    a3[1] = v7;
    a3[2] = v8;
    a3[3] = v9;
    a3[4] = v10;
    a3[5] = v22;
    return result;
  }
  uint64_t v7 = a2[1];
  uint64_t v8 = a2[2];
  uint64_t v9 = a2[3];
  uint64_t v10 = a2[4];
  uint64_t v11 = *(void *)result;
  if (!*(void *)result)
  {
LABEL_16:
    uint64_t v22 = a2[5];
    goto LABEL_27;
  }
  if (!*(_WORD *)(v11 + 16))
  {
    uint64_t result = sub_24A496BE8(result);
    goto LABEL_16;
  }
  long long v12 = *(_OWORD *)(result + 8);
  long long v13 = *(_OWORD *)(result + 24);
  uint64_t v35 = a2[4];
  *(void *)uint64_t v36 = v11;
  *(_OWORD *)&v36[8] = v12;
  *(_OWORD *)&v36[24] = v13;
  *(void *)&long long v33 = v5;
  *((void *)&v33 + 1) = v7;
  *(void *)&long long v34 = v8;
  *((void *)&v34 + 1) = v9;
  if (*(unsigned __int8 *)(v11 + 18) < *(unsigned __int8 *)(v5 + 18))
  {
    uint64_t result = sub_24A5B2DB0(v32, (uint64_t *)v36, (uint64_t *)&v40);
    uint64_t v14 = v40;
    if (!(void)v40)
    {
      uint64_t v7 = *((void *)&v33 + 1);
      uint64_t v5 = v33;
      uint64_t v9 = *((void *)&v34 + 1);
      uint64_t v8 = v34;
      uint64_t v10 = v35;
      *(void *)&long long v40 = 0;
      MEMORY[0x24C5C7E90](&v40, 8);
      uint64_t v22 = v40;
      goto LABEL_26;
    }
    uint64_t v15 = *((void *)&v40 + 1);
    long long v16 = v41;
    long long v37 = v40;
    long long v38 = v41;
    uint64_t v29 = v42;
    uint64_t v39 = v42;
    uint64_t v17 = v35;
    uint64_t v42 = v35;
    long long v40 = v33;
    long long v41 = v34;
    unsigned int v18 = *(unsigned __int8 *)(v14 + 18) + 1;
    if ((v18 >> 8))
    {
      __break(1u);
    }
    else
    {
      long long v19 = v41;
      uint64_t v20 = *((void *)&v40 + 1);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B177928);
      uint64_t v5 = swift_allocObject();
      *(_WORD *)(v5 + 16) = 0;
      uint64_t result = v5 + 16;
      *(unsigned char *)(v5 + 18) = v18;
      BOOL v21 = __OFADD__(v15, v20);
      uint64_t v7 = v15 + v20;
      if (!v21)
      {
        uint64_t v8 = v16 + v19;
        if (!__OFADD__((void)v16, (void)v19))
        {
          uint64_t v9 = *((void *)&v16 + 1) + *((void *)&v19 + 1);
          if (!__OFADD__(*((void *)&v16 + 1), *((void *)&v19 + 1)))
          {
            BOOL v21 = __OFADD__(v29, v17);
            uint64_t v10 = v29 + v17;
            if (!v21)
            {
              sub_24A5B4230((_WORD *)result, v5 + 24, (uint64_t)&v37, (uint64_t)&v40);
              uint64_t v31 = 0;
              MEMORY[0x24C5C7E90](&v31, 8);
              swift_unknownObjectRelease();
              sub_24A496BE8((uint64_t)&v40);
              uint64_t v22 = v31;
LABEL_26:
              uint64_t result = swift_unknownObjectRelease();
              goto LABEL_27;
            }
            goto LABEL_36;
          }
          goto LABEL_31;
        }
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
    }
    __break(1u);
    goto LABEL_30;
  }
  uint64_t result = sub_24A5B2A4C(v32, (uint64_t *)&v33, (uint64_t *)&v40);
  if (!(void)v40)
  {
    uint64_t v7 = *(void *)&v36[8];
    uint64_t v5 = *(void *)v36;
    uint64_t v8 = *(void *)&v36[16];
    uint64_t v9 = *(void *)&v36[24];
    uint64_t v10 = *(void *)&v36[32];
    *(void *)&long long v40 = 0;
    swift_unknownObjectRetain();
    MEMORY[0x24C5C7E90](&v40, 8);
    uint64_t v22 = v40;
    swift_unknownObjectRelease();
    goto LABEL_26;
  }
  uint64_t v23 = *((void *)&v40 + 1);
  long long v24 = v41;
  uint64_t v30 = v42;
  long long v37 = *(_OWORD *)v36;
  long long v38 = *(_OWORD *)&v36[16];
  uint64_t v25 = *(void *)&v36[32];
  uint64_t v39 = *(void *)&v36[32];
  unsigned int v26 = *(unsigned __int8 *)(*(void *)v36 + 18) + 1;
  if ((v26 >> 8)) {
    goto LABEL_32;
  }
  long long v27 = v38;
  uint64_t v28 = *((void *)&v37 + 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B177928);
  uint64_t v5 = swift_allocObject();
  *(_WORD *)(v5 + 16) = 0;
  uint64_t result = v5 + 16;
  *(unsigned char *)(v5 + 18) = v26;
  BOOL v21 = __OFADD__(v28, v23);
  uint64_t v7 = v28 + v23;
  if (v21)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v8 = v27 + v24;
  if (__OFADD__((void)v27, (void)v24))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v9 = *((void *)&v27 + 1) + *((void *)&v24 + 1);
  if (__OFADD__(*((void *)&v27 + 1), *((void *)&v24 + 1)))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  BOOL v21 = __OFADD__(v25, v30);
  uint64_t v10 = v25 + v30;
  if (!v21)
  {
    sub_24A5B4230((_WORD *)result, v5 + 24, (uint64_t)&v37, (uint64_t)&v40);
    uint64_t v31 = 0;
    MEMORY[0x24C5C7E90](&v31, 8);
    swift_unknownObjectRelease();
    uint64_t v22 = v31;
    swift_unknownObjectRelease();
    uint64_t result = sub_24A496BE8((uint64_t)&v37);
    goto LABEL_27;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24A5B2A4C@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v4 = v3;
  if ((swift_isUniquelyReferenced_nonNull() & 1) == 0)
  {
    long long v8 = v3[1];
    long long v69 = *v3;
    long long v70 = v8;
    uint64_t v71 = *((void *)v3 + 4);
    sub_24A4CBC1C((uint64_t)v59);
    swift_unknownObjectRelease();
    long long v9 = v59[1];
    *uint64_t v3 = v59[0];
    v3[1] = v9;
    *((void *)v3 + 4) = v60;
  }
  if ((swift_isUniquelyReferenced_nonNull() & 1) == 0)
  {
    long long v10 = *((_OWORD *)a2 + 1);
    long long v66 = *(_OWORD *)a2;
    long long v67 = v10;
    uint64_t v68 = a2[4];
    sub_24A4CBC1C((uint64_t)v61);
    swift_unknownObjectRelease();
    long long v11 = v61[1];
    *(_OWORD *)a2 = v61[0];
    *((_OWORD *)a2 + 1) = v11;
    a2[4] = v62;
  }
  if (*(unsigned __int8 *)(*a2 + 18) >= *(unsigned __int8 *)(*(void *)v3 + 18))
  {
    uint64_t v36 = *((void *)v3 + 1);
    uint64_t v35 = *((void *)v3 + 2);
    uint64_t v50 = *((void *)v3 + 4);
    uint64_t v52 = *((void *)v3 + 3);
    if (sub_24A5B3160(a2))
    {
      uint64_t result = 0;
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v12 = a2[1];
      uint64_t v13 = a2[2];
      uint64_t v14 = a2[3];
      uint64_t v15 = a2[4];
      uint64_t result = swift_unknownObjectRetain();
    }
    uint64_t v37 = v4[1];
    BOOL v19 = __OFSUB__(v37, v36);
    uint64_t v38 = v37 - v36;
    if (!v19)
    {
      uint64_t v39 = v4[2];
      BOOL v19 = __OFSUB__(v39, v35);
      uint64_t v40 = v39 - v35;
      if (!v19)
      {
        uint64_t v41 = v4[3];
        BOOL v19 = __OFSUB__(v41, v52);
        uint64_t v42 = v41 - v52;
        if (!v19)
        {
          uint64_t v43 = v4[4];
          BOOL v19 = __OFSUB__(v43, v50);
          uint64_t v44 = v43 - v50;
          if (!v19)
          {
            *a1 = v38;
            a1[1] = v40;
            a1[2] = v42;
            a1[3] = v44;
            goto LABEL_31;
          }
          goto LABEL_39;
        }
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        goto LABEL_40;
      }
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  swift_unknownObjectRetain();
  sub_24A5B2A4C(&v63, v58, a2);
  uint64_t v12 = *((void *)&v63 + 1);
  uint64_t v51 = v63;
  uint64_t v14 = *((void *)&v64 + 1);
  uint64_t v13 = v64;
  uint64_t v15 = v65;
  uint64_t result = swift_unknownObjectRelease();
  uint64_t v17 = v58[0];
  uint64_t v18 = v4[1];
  BOOL v19 = __OFADD__(v18, v58[0]);
  uint64_t v20 = v18 + v58[0];
  if (v19)
  {
    __break(1u);
    goto LABEL_33;
  }
  uint64_t v21 = v58[1];
  uint64_t v22 = v58[2];
  uint64_t v23 = v58[3];
  v4[1] = v20;
  uint64_t v24 = v4[2];
  BOOL v19 = __OFADD__(v24, v21);
  uint64_t v25 = v24 + v21;
  if (v19)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  void v4[2] = v25;
  uint64_t v26 = v4[3];
  BOOL v19 = __OFADD__(v26, v22);
  uint64_t v27 = v26 + v22;
  if (v19)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v4[3] = v27;
  uint64_t v28 = v4[4];
  BOOL v19 = __OFADD__(v28, v23);
  uint64_t v29 = v28 + v23;
  if (v19)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v4[4] = v29;
  uint64_t result = v51;
  if (!v51)
  {
    *a1 = v17;
    a1[1] = v21;
    a1[2] = v22;
    a1[3] = v23;
    goto LABEL_31;
  }
  v57[0] = v51;
  v57[1] = v12;
  v57[2] = v13;
  v57[3] = v14;
  v57[4] = v15;
  if (*(_WORD *)(*v4 + 16) == 15)
  {
    uint64_t v30 = v23;
    swift_unknownObjectRetain();
    uint64_t result = sub_24A5B258C(7, (uint64_t)&v63);
    long long v54 = v63;
    long long v55 = v64;
    uint64_t v56 = v65;
    uint64_t v31 = v17 - *((void *)&v63 + 1);
    if (!__OFSUB__(v17, *((void *)&v63 + 1)))
    {
      uint64_t v32 = v21 - v64;
      if (!__OFSUB__(v21, (void)v64))
      {
        uint64_t v33 = v22 - *((void *)&v64 + 1);
        if (!__OFSUB__(v22, *((void *)&v64 + 1)))
        {
          uint64_t v34 = v30 - v65;
          if (!__OFSUB__(v30, v65))
          {
            sub_24A5B3208((uint64_t)v57);
            swift_unknownObjectRelease();
            uint64_t v12 = *((void *)&v54 + 1);
            uint64_t result = v54;
            uint64_t v14 = *((void *)&v55 + 1);
            uint64_t v13 = v55;
            uint64_t v15 = v56;
            *a1 = v31;
            a1[1] = v32;
            a1[2] = v33;
            a1[3] = v34;
LABEL_31:
            *a3 = result;
            a3[1] = v12;
            a3[2] = v13;
            a3[3] = v14;
            a3[4] = v15;
            return result;
          }
          goto LABEL_43;
        }
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
        goto LABEL_44;
      }
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v45 = v17 + v12;
  if (__OFADD__(v17, v12))
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  uint64_t v46 = v21 + v13;
  if (__OFADD__(v21, v13))
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  uint64_t v47 = v22 + v14;
  if (__OFADD__(v22, v14))
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  uint64_t v48 = v45;
  uint64_t v53 = v23 + v15;
  if (!__OFADD__(v23, v15))
  {
    uint64_t v49 = v46;
    sub_24A5B3208((uint64_t)v57);
    uint64_t result = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    *a1 = v48;
    a1[1] = v49;
    a1[2] = v47;
    a1[3] = v53;
    goto LABEL_31;
  }
LABEL_47:
  __break(1u);
  return result;
}

uint64_t sub_24A5B2DB0@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v4 = (uint64_t *)v3;
  if ((swift_isUniquelyReferenced_nonNull() & 1) == 0)
  {
    long long v8 = v3[1];
    long long v77 = *v3;
    long long v78 = v8;
    uint64_t v79 = *((void *)v3 + 4);
    sub_24A4CBC1C((uint64_t)v67);
    swift_unknownObjectRelease();
    long long v9 = v67[1];
    *uint64_t v3 = v67[0];
    v3[1] = v9;
    *((void *)v3 + 4) = v68;
  }
  if ((swift_isUniquelyReferenced_nonNull() & 1) == 0)
  {
    long long v10 = *((_OWORD *)a2 + 1);
    long long v74 = *(_OWORD *)a2;
    long long v75 = v10;
    uint64_t v76 = a2[4];
    sub_24A4CBC1C((uint64_t)v69);
    swift_unknownObjectRelease();
    long long v11 = v69[1];
    *(_OWORD *)a2 = v69[0];
    *((_OWORD *)a2 + 1) = v11;
    a2[4] = v70;
  }
  if (*(unsigned __int8 *)(*a2 + 18) >= *(unsigned __int8 *)(*(void *)v3 + 18))
  {
    uint64_t v59 = a1;
    uint64_t v41 = a2[1];
    uint64_t v42 = a2[2];
    uint64_t v44 = a2[3];
    uint64_t v43 = a2[4];
    uint64_t result = sub_24A5B3160((uint64_t *)v3);
    if (result)
    {
      uint64_t result = 0;
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v45 = v43;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v46 = *v4;
      long long v47 = *(_OWORD *)(a2 + 1);
      long long v48 = *(_OWORD *)(a2 + 3);
      *unint64_t v4 = *a2;
      long long v49 = *(_OWORD *)(v4 + 1);
      *(_OWORD *)(v4 + 1) = v47;
      long long v50 = *(_OWORD *)(v4 + 3);
      *(_OWORD *)(v4 + 3) = v48;
      *a2 = v46;
      *(_OWORD *)(a2 + 1) = v49;
      *(_OWORD *)(a2 + 3) = v50;
      *uint64_t v59 = v41;
      v59[1] = v42;
      _OWORD v59[2] = v44;
      v59[3] = v45;
      goto LABEL_30;
    }
    uint64_t v12 = a2[1];
    if (!__OFSUB__(v41, v12))
    {
      uint64_t v13 = a2[2];
      if (!__OFSUB__(v42, v13))
      {
        uint64_t v51 = v43;
        uint64_t v14 = a2[3];
        if (!__OFSUB__(v44, v14))
        {
          uint64_t v15 = a2[4];
          BOOL v19 = __OFSUB__(v51, v15);
          uint64_t v52 = v51 - v15;
          if (!v19)
          {
            *uint64_t v59 = v41 - v12;
            v59[1] = v42 - v13;
            _OWORD v59[2] = v44 - v14;
            v59[3] = v52;
            uint64_t result = swift_unknownObjectRetain();
            goto LABEL_30;
          }
          goto LABEL_38;
        }
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
        goto LABEL_39;
      }
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  swift_unknownObjectRetain();
  sub_24A5B2DB0(&v71, v66, a2);
  uint64_t v12 = *((void *)&v71 + 1);
  uint64_t v58 = v71;
  uint64_t v14 = *((void *)&v72 + 1);
  uint64_t v13 = v72;
  uint64_t v15 = v73;
  uint64_t result = swift_unknownObjectRelease();
  uint64_t v17 = v66[0];
  uint64_t v18 = v4[1];
  BOOL v19 = __OFADD__(v18, v66[0]);
  uint64_t v20 = v18 + v66[0];
  if (v19)
  {
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v21 = v66[1];
  uint64_t v22 = v66[2];
  uint64_t v23 = v66[3];
  v4[1] = v20;
  uint64_t v24 = v4[2];
  BOOL v19 = __OFADD__(v24, v21);
  uint64_t v25 = v24 + v21;
  if (v19)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  void v4[2] = v25;
  uint64_t v26 = v4[3];
  BOOL v19 = __OFADD__(v26, v22);
  uint64_t v27 = v26 + v22;
  if (v19)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v4[3] = v27;
  uint64_t v28 = v4[4];
  BOOL v19 = __OFADD__(v28, v23);
  uint64_t v29 = v28 + v23;
  if (v19)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v4[4] = v29;
  uint64_t result = v58;
  if (!v58)
  {
    *a1 = v17;
    a1[1] = v21;
    a1[2] = v22;
    a1[3] = v23;
    goto LABEL_30;
  }
  v65[0] = v58;
  v65[1] = v12;
  v65[2] = v13;
  v65[3] = v14;
  v65[4] = v15;
  if (*(_WORD *)(*v4 + 16) == 15)
  {
    uint64_t v30 = v23;
    swift_unknownObjectRetain();
    uint64_t result = sub_24A5B258C(7, (uint64_t)&v71);
    uint64_t v31 = *v4;
    uint64_t v32 = v4[1];
    uint64_t v34 = v4[2];
    uint64_t v33 = v4[3];
    uint64_t v35 = v4[4];
    long long v36 = v72;
    *(_OWORD *)unint64_t v4 = v71;
    *((_OWORD *)v4 + 1) = v36;
    v4[4] = v73;
    uint64_t v60 = v31;
    uint64_t v61 = v32;
    uint64_t v62 = v34;
    uint64_t v63 = v33;
    uint64_t v64 = v35;
    uint64_t v37 = v17 - v32;
    if (!__OFSUB__(v17, v32))
    {
      BOOL v19 = __OFSUB__(v21, v34);
      uint64_t v38 = v21 - v34;
      if (!v19)
      {
        uint64_t v39 = v22 - v33;
        if (!__OFSUB__(v22, v33))
        {
          uint64_t v40 = v30 - v35;
          if (!__OFSUB__(v30, v35))
          {
            sub_24A5B637C((uint64_t)v65, 0);
            swift_unknownObjectRelease_n();
            uint64_t result = v60;
            uint64_t v12 = v61;
            uint64_t v13 = v62;
            uint64_t v14 = v63;
            uint64_t v15 = v64;
            *a1 = v37;
            a1[1] = v38;
            a1[2] = v39;
            a1[3] = v40;
LABEL_30:
            *a3 = result;
            a3[1] = v12;
            a3[2] = v13;
            a3[3] = v14;
            a3[4] = v15;
            return result;
          }
          goto LABEL_42;
        }
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        goto LABEL_43;
      }
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  uint64_t v53 = v17 + v12;
  if (__OFADD__(v17, v12))
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  uint64_t v54 = v21 + v13;
  if (__OFADD__(v21, v13))
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  BOOL v19 = __OFADD__(v22, v14);
  uint64_t v55 = v22 + v14;
  if (v19)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  uint64_t v56 = v53;
  uint64_t v57 = v23 + v15;
  if (!__OFADD__(v23, v15))
  {
    sub_24A5B637C((uint64_t)v65, 0);
    swift_unknownObjectRelease();
    uint64_t result = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    *a1 = v56;
    a1[1] = v54;
    a1[2] = v55;
    a1[3] = v57;
    goto LABEL_30;
  }
LABEL_46:
  __break(1u);
  return result;
}

BOOL sub_24A5B3160(uint64_t *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(unsigned __int16 *)(*v1 + 16);
  if (*(_WORD *)(*v1 + 16))
  {
    uint64_t v5 = *(unsigned __int16 *)(*a1 + 16);
    if (v4 >= 8 && v5 >= 8)
    {
      return 0;
    }
    else
    {
      sub_24A5B3A4C(v1, a1, (unint64_t)(v5 + v4) >> ((unint64_t)(v5 + v4) > 0xF));
      return *(_WORD *)(*a1 + 16) == 0;
    }
  }
  else
  {
    long long v8 = *(_OWORD *)(a1 + 1);
    long long v9 = *(_OWORD *)(a1 + 3);
    *unint64_t v1 = *a1;
    long long v10 = *(_OWORD *)(v1 + 1);
    *(_OWORD *)(v1 + 1) = v8;
    long long v11 = *(_OWORD *)(v1 + 3);
    *(_OWORD *)(v1 + 3) = v9;
    *a1 = v3;
    *(_OWORD *)(a1 + 1) = v10;
    BOOL result = 1;
    *(_OWORD *)(a1 + 3) = v11;
  }
  return result;
}

uint64_t sub_24A5B3208(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t result = swift_isUniquelyReferenced_nonNull();
  if ((result & 1) == 0)
  {
    long long v8 = v1[1];
    long long v25 = *v1;
    long long v26 = v8;
    uint64_t v27 = *((void *)v1 + 4);
    sub_24A4CBC1C((uint64_t)v23);
    uint64_t result = swift_unknownObjectRelease();
    long long v9 = v23[1];
    *unint64_t v1 = v23[0];
    v1[1] = v9;
    *((void *)v1 + 4) = v24;
  }
  uint64_t v10 = *((void *)v1 + 1);
  BOOL v11 = __OFADD__(v10, v4);
  uint64_t v12 = v10 + v4;
  if (v11)
  {
    __break(1u);
    goto LABEL_10;
  }
  *((void *)v1 + 1) = v12;
  uint64_t v13 = *((void *)v1 + 2);
  BOOL v11 = __OFADD__(v13, v3);
  uint64_t v14 = v13 + v3;
  if (v11)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  *((void *)v1 + 2) = v14;
  uint64_t v15 = *((void *)v1 + 3);
  BOOL v11 = __OFADD__(v15, v6);
  uint64_t v16 = v15 + v6;
  if (v11)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  *((void *)v1 + 3) = v16;
  uint64_t v17 = *((void *)v1 + 4);
  BOOL v11 = __OFADD__(v17, v5);
  uint64_t v18 = v17 + v5;
  if (v11)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  *((void *)v1 + 4) = v18;
  uint64_t v19 = *(void *)v1;
  int v20 = *(unsigned __int16 *)(*(void *)v1 + 16);
  uint64_t v21 = *(void *)v1 + 40 * *(unsigned __int16 *)(*(void *)v1 + 16);
  long long v22 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v21 + 24) = *(_OWORD *)a1;
  *(_OWORD *)(v21 + 40) = v22;
  *(void *)(v21 + 56) = *(void *)(a1 + 32);
  if (v20 != 0xFFFF)
  {
    *(_WORD *)(v19 + 16) = v20 + 1;
    return result;
  }
LABEL_13:
  __break(1u);
  return result;
}

_WORD *sub_24A5B3324(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  ++v4[5];
  if (!*v4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B177EE8);
    uint64_t v25 = swift_allocObject();
    *(_WORD *)(v25 + 16) = 0;
    *(unsigned char *)(v25 + 18) = 0;
    v31[0] = v25;
    uint64_t result = (_WORD *)sub_24A4918AC(a1, a2, a3 & 0xFFFFFFFFFFFFLL);
    uint64_t v19 = v31[0];
    uint64_t v22 = 0;
    uint64_t v21 = 0;
    uint64_t v24 = 0;
    uint64_t v23 = 0;
    goto LABEL_10;
  }
  sub_24A5B34E4(a1, a2, a3 & 0xFFFFFFFFFFFFLL, (uint64_t)v28);
  uint64_t v8 = v28[0];
  uint64_t v9 = v28[1];
  uint64_t v11 = v28[2];
  uint64_t v10 = v28[3];
  uint64_t v12 = v28[4];
  uint64_t result = (_WORD *)sub_24A4974C4((uint64_t)v28, (uint64_t)v29);
  if (!v29[0]) {
    return result;
  }
  v31[0] = v8;
  v31[1] = v9;
  v31[2] = v11;
  _OWORD v31[3] = v10;
  uint64_t v27 = v10;
  unsigned char v31[4] = v12;
  uint64_t v14 = v4[1];
  uint64_t v16 = v4[2];
  uint64_t v15 = v4[3];
  uint64_t v17 = v4[4];
  v30[0] = *v4;
  v30[1] = v14;
  v30[2] = v16;
  v30[3] = v15;
  v30[4] = v17;
  unsigned int v18 = *(unsigned __int8 *)(v30[0] + 18) + 1;
  if ((v18 >> 8))
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v26 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B177928);
  uint64_t v19 = swift_allocObject();
  *(_WORD *)(v19 + 16) = 0;
  uint64_t result = (_WORD *)(v19 + 16);
  *(unsigned char *)(v19 + 18) = v18;
  BOOL v20 = __OFADD__(v14, v9);
  uint64_t v21 = v14 + v9;
  if (v20)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  BOOL v20 = __OFADD__(v16, v11);
  uint64_t v22 = v16 + v11;
  if (v20)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v23 = v15 + v27;
  if (__OFADD__(v15, v27))
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v24 = v17 + v26;
  if (__OFADD__(v17, v26))
  {
LABEL_16:
    __break(1u);
    return result;
  }
  sub_24A5B4230(result, v19 + 24, (uint64_t)v30, (uint64_t)v31);
  sub_24A496BE8((uint64_t)v28);
  uint64_t result = (_WORD *)swift_unknownObjectRelease();
LABEL_10:
  *uint64_t v4 = v19;
  v4[1] = v21;
  void v4[2] = v22;
  v4[3] = v23;
  v4[4] = v24;
  return result;
}

double sub_24A5B34E4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v35 = a1;
  uint64_t v36 = a2;
  LOWORD(v37) = a3;
  BYTE2(v37) = BYTE2(a3);
  HIBYTE(v37) = BYTE3(a3);
  unsigned __int8 v38 = BYTE4(a3);
  unsigned __int8 v39 = BYTE5(a3);
  uint64_t v7 = *v4;
  if ((a3 & 0xFCu) <= 0x7BuLL
    && *(_WORD *)(v7 + 16)
    && (v45[0] = *(unsigned __int8 *)(v7 + 18),
        sub_24A5B4B98(v45, (uint64_t)v28),
        char v8 = sub_24A4DB184((uint64_t)&v35),
        sub_24A48FC0C((uint64_t)v45, (uint64_t)v28, v9),
        swift_bridgeObjectRelease(),
        (v8 & 1) != 0))
  {
    memset(v40, 0, 40);
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull() & 1) == 0)
    {
      long long v10 = *((_OWORD *)v4 + 1);
      v28[0] = *(_OWORD *)v4;
      v28[1] = v10;
      uint64_t v29 = v4[4];
      sub_24A4CBC1C((uint64_t)v41);
      swift_unknownObjectRelease();
      long long v11 = v41[1];
      *(_OWORD *)uint64_t v4 = v41[0];
      *((_OWORD *)v4 + 1) = v11;
      v4[4] = v42;
    }
    uint64_t v12 = *v4;
    if (*(unsigned char *)(*v5 + 18))
    {
      long long v13 = *(_OWORD *)(v5 + 3);
      long long v33 = *(_OWORD *)(v5 + 1);
      long long v34 = v13;
      swift_unknownObjectRetain();
      sub_24A5B3860((unsigned __int16 *)(v12 + 16), v12 + 24, &v33, &v35, (uint64_t)v43);
      uint64_t v14 = v43[0];
      uint64_t v15 = v43[1];
      uint64_t v16 = v43[2];
      uint64_t v17 = v43[3];
      uint64_t v18 = v43[4];
      swift_unknownObjectRelease();
      long long v19 = v34;
      *(_OWORD *)(v5 + 1) = v33;
      *(_OWORD *)(v5 + 3) = v19;
      sub_24A4974C4((uint64_t)v43, (uint64_t)v44);
      if (v44[0])
      {
        v45[0] = v14;
        v45[1] = v15;
        v45[2] = v16;
        v45[3] = v17;
        v45[4] = v18;
        BOOL v20 = (_WORD *)(*v5 + 16);
        uint64_t v21 = *v5 + 24;
        sub_24A497498((uint64_t)v43);
        swift_unknownObjectRetain();
        sub_24A5B39C8(v20, v21);
        swift_unknownObjectRelease();
        if (*(_WORD *)(*v5 + 16) == 15)
        {
          sub_24A5B258C(8, (uint64_t)&v30);
          sub_24A5B3208((uint64_t)v45);
          sub_24A496BE8((uint64_t)v43);
          *(void *)&v40[0] = v30;
          *(_OWORD *)((char *)v40 + 8) = v31;
          *(_OWORD *)((char *)&v40[1] + 8) = v32;
        }
        else
        {
          sub_24A5B3208((uint64_t)v45);
          sub_24A496BE8((uint64_t)v43);
          memset(v40, 0, 40);
        }
      }
      else
      {
        sub_24A4974C4((uint64_t)v43, (uint64_t)v40);
      }
    }
    else
    {
      if (*(_WORD *)(v12 + 16) != 15)
      {
        sub_24A4918AC(v35, v36, v37 | ((unint64_t)v38 << 32) | ((unint64_t)v39 << 40));
        memset(v40, 0, 40);
        goto LABEL_16;
      }
      sub_24A5B258C(8, (uint64_t)v40);
      uint64_t v22 = v35;
      uint64_t v23 = v36;
      unint64_t v24 = v37 | ((unint64_t)v38 << 32) | ((unint64_t)v39 << 40);
      swift_bridgeObjectRetain();
      sub_24A4918AC(v22, v23, v24);
    }
  }
  swift_bridgeObjectRelease();
LABEL_16:
  uint64_t v25 = *(void *)&v40[2];
  double result = *(double *)v40;
  long long v27 = v40[1];
  *(_OWORD *)a4 = v40[0];
  *(_OWORD *)(a4 + 16) = v27;
  *(void *)(a4 + 32) = v25;
  return result;
}

uint64_t (*sub_24A5B37E4(void *a1))()
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  v3[8] = v1;
  uint64_t v5 = *(unsigned __int8 *)(*(void *)v1 + 18);
  sub_24A5B4B98(&v5, (uint64_t)v3);
  return sub_24A5B385C;
}

unsigned __int16 *sub_24A5B3860@<X0>(unsigned __int16 *result@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6 = a2 + 40 * *result;
  uint64_t v9 = *(void *)(v6 - 16);
  char v8 = (uint64_t *)(v6 - 16);
  uint64_t v7 = v9;
  long long v11 = v8 - 2;
  uint64_t v10 = *(v8 - 2);
  uint64_t v12 = *a3 - v10;
  if (__OFSUB__(*a3, v10))
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v14 = v8[1];
  uint64_t v15 = *(v8 - 1);
  *a3 = v12;
  uint64_t v16 = a3[1];
  BOOL v17 = __OFSUB__(v16, v15);
  uint64_t v18 = v16 - v15;
  if (v17)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  a3[1] = v18;
  uint64_t v19 = a3[2];
  BOOL v17 = __OFSUB__(v19, v7);
  uint64_t v20 = v19 - v7;
  if (v17)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  a3[2] = v20;
  uint64_t v21 = a3[3];
  BOOL v17 = __OFSUB__(v21, v14);
  uint64_t v22 = v21 - v14;
  if (v17)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  a3[3] = v22;
  uint64_t v23 = *a4;
  uint64_t v24 = a4[1];
  unint64_t v25 = *((unsigned int *)a4 + 4) | ((unint64_t)*((unsigned __int8 *)a4 + 20) << 32) | ((unint64_t)*((unsigned __int8 *)a4 + 21) << 40);
  swift_bridgeObjectRetain();
  double result = (unsigned __int16 *)sub_24A5B34E4(v35, v23, v24, v25);
  if (__OFADD__(*a3, *v11))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v26 = *v8;
  uint64_t v27 = v8[1];
  uint64_t v28 = *(v8 - 1);
  *a3 += *v11;
  uint64_t v29 = a3[1];
  BOOL v17 = __OFADD__(v29, v28);
  uint64_t v30 = v29 + v28;
  if (v17)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  a3[1] = v30;
  uint64_t v31 = a3[2];
  BOOL v17 = __OFADD__(v31, v26);
  uint64_t v32 = v31 + v26;
  if (v17)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  a3[2] = v32;
  uint64_t v33 = a3[3];
  BOOL v17 = __OFADD__(v33, v27);
  uint64_t v34 = v33 + v27;
  if (!v17)
  {
    a3[3] = v34;
    return (unsigned __int16 *)sub_24A4974C4((uint64_t)v35, a5);
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t *sub_24A5B39C8(_WORD *a1, uint64_t a2)
{
  uint64_t v4 = (unsigned __int16)*a1;
  uint64_t v5 = a2 + 40 * v4;
  uint64_t v7 = *(void *)(v5 - 40);
  uint64_t v6 = (uint64_t *)(v5 - 40);
  double result = v6 - 5;
  unint64_t v9 = *(unsigned __int16 *)(v7 + 16) + (unint64_t)*(unsigned __int16 *)(*(v6 - 5) + 16);
  if (v9 <= 0xF)
  {
    uint64_t v10 = (void *)(v4 - 1);
    sub_24A5B3A4C(result, v6, v9);
    sub_24A5B3BB0(v10, a1, a2, (uint64_t)v11);
    return (uint64_t *)sub_24A496BE8((uint64_t)v11);
  }
  return result;
}

uint64_t sub_24A5B3A4C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if ((swift_isUniquelyReferenced_nonNull() & 1) == 0)
  {
    long long v6 = *((_OWORD *)a1 + 1);
    long long v25 = *(_OWORD *)a1;
    long long v26 = v6;
    uint64_t v27 = a1[4];
    sub_24A4CBC1C((uint64_t)v18);
    swift_unknownObjectRelease();
    long long v7 = v18[1];
    *(_OWORD *)a1 = v18[0];
    *((_OWORD *)a1 + 1) = v7;
    a1[4] = v19;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull();
  if ((result & 1) == 0)
  {
    long long v9 = *((_OWORD *)a2 + 1);
    long long v22 = *(_OWORD *)a2;
    long long v23 = v9;
    uint64_t v24 = a2[4];
    sub_24A4CBC1C((uint64_t)v20);
    uint64_t result = swift_unknownObjectRelease();
    long long v10 = v20[1];
    *(_OWORD *)a2 = v20[0];
    *((_OWORD *)a2 + 1) = v10;
    a2[4] = v21;
  }
  uint64_t v11 = *(unsigned __int16 *)(*a1 + 16);
  uint64_t v12 = *(unsigned __int16 *)(*a2 + 16) + v11;
  if (v12 >= a3) {
    uint64_t v12 = a3;
  }
  uint64_t v13 = v12 - v11;
  if (__OFSUB__(v12, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  if (!v13) {
    return result;
  }
  if (v13 <= 0)
  {
    BOOL v17 = __OFSUB__(0, v13);
    uint64_t v13 = v11 - v12;
    if (!v17)
    {
      uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A5B47F8;
      uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A5B4700;
      uint64_t v16 = a1;
      return sub_24A5B4390(v16, v13, v14, v15);
    }
LABEL_16:
    __break(1u);
    return result;
  }
  uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A5B45E4;
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A5B44EC;
  uint64_t v16 = a2;
  return sub_24A5B4390(v16, v13, v14, v15);
}

void *sub_24A5B3BB0@<X0>(void *result@<X0>, _WORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = (unsigned __int16)*a2;
  BOOL v6 = __OFSUB__(v5, result);
  uint64_t v7 = v5 - (void)result;
  if (v6)
  {
    __break(1u);
    goto LABEL_6;
  }
  BOOL v6 = __OFSUB__(v7, 1);
  uint64_t v8 = v7 - 1;
  if (v6)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  long long v10 = (uint64_t *)(a3 + 40 * (void)result);
  uint64_t v11 = *v10;
  long long v12 = *(_OWORD *)(v10 + 3);
  long long v13 = *(_OWORD *)(v10 + 1);
  uint64_t result = memmove(v10, v10 + 5, 40 * v8);
  if (*a2)
  {
    --*a2;
    *(void *)a4 = v11;
    *(_OWORD *)(a4 + 8) = v13;
    *(_OWORD *)(a4 + 24) = v12;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

void *sub_24A5B3C50@<X0>(uint64_t a1@<X0>, _WORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = (void *)(a3 + 24 * a1);
  uint64_t v6 = result[1];
  __int16 v7 = *((_WORD *)result + 10);
  *(void *)a4 = *result;
  *(void *)(a4 + 8) = v6;
  *(_DWORD *)(a4 + 16) = *((_DWORD *)result + 4);
  *(_WORD *)(a4 + 20) = v7;
  uint64_t v8 = (unsigned __int16)*a2;
  BOOL v9 = __OFSUB__(v8, a1);
  uint64_t v10 = v8 - a1;
  if (v9)
  {
    __break(1u);
    goto LABEL_6;
  }
  BOOL v9 = __OFSUB__(v10, 1);
  uint64_t v11 = v10 - 1;
  if (v9)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t result = memmove(result, result + 3, 24 * v11);
  if (*a2)
  {
    --*a2;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_24A5B3CD4(_OWORD *a1)
{
  uint64_t v3 = sub_24A5BC780();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  __int16 v7 = (char *)&v21[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v21[-1] - v9;
  long long v11 = a1[2];
  v22[1] = a1[1];
  long long v23 = v11;
  v22[0] = *a1;
  if (*(void *)&v22[0])
  {
    uint64_t v12 = v23;
    if ((void)v23)
    {
      uint64_t v13 = *v1;
      if (*v1)
      {
        uint64_t v15 = v1[3];
        uint64_t v14 = v1[4];
        uint64_t v24 = *v1;
        long long v25 = *(_OWORD *)(v1 + 1);
        uint64_t v26 = v15;
        uint64_t v27 = v14;
        if (v14)
        {
          unint64_t v16 = *(unsigned __int8 *)(v13 + 18);
          swift_unknownObjectRetain();
          sub_24A4895D4(v16, (uint64_t)v21);
          swift_unknownObjectRelease();
          unint64_t v17 = sub_24A586D60(v21[0], v21[1]);
          uint64_t result = swift_bridgeObjectRelease();
          if ((v17 & 0x100000000) != 0)
          {
            __break(1u);
          }
          else
          {
            sub_24A5BC770();
            LOBYTE(v21[0]) = 0;
            sub_24A48D2C8((v12 << 11) | 0x300, 0, 0, 1uLL, (uint64_t *)v17, (uint64_t)v7);
            sub_24A4C7A08((uint64_t)v10);
            sub_24A5B5C68((uint64_t *)v22);
            uint64_t v18 = *(void (**)(char *, uint64_t))(v4 + 8);
            v18(v7, v3);
            return ((uint64_t (*)(char *, uint64_t))v18)(v10, v3);
          }
          return result;
        }
        uint64_t result = swift_unknownObjectRelease();
      }
      long long v19 = a1[1];
      *(_OWORD *)uint64_t v1 = *a1;
      *((_OWORD *)v1 + 1) = v19;
      *((_OWORD *)v1 + 2) = a1[2];
      return result;
    }
    return sub_24A496BE8((uint64_t)a1);
  }
  return result;
}

uint64_t sub_24A5B3F08(long long *a1, unint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_24A5BC780();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v23[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v23[-v11];
  if ((a2[4] ^ *a2) < 0x800)
  {
    return sub_24A496BE8((uint64_t)a1);
  }
  long long v14 = a1[1];
  v29[0] = *a1;
  v29[1] = v14;
  v29[2] = a1[2];
  sub_24A4974C4((uint64_t)v29, (uint64_t)v30);
  sub_24A497498((uint64_t)v30);
  sub_24A48D050(a1, a2, &v24);
  uint64_t v15 = *v3;
  if (!*v3)
  {
    uint64_t result = sub_24A496BE8((uint64_t)a1);
LABEL_14:
    long long v22 = v25;
    *(_OWORD *)uint64_t v3 = v24;
    *((_OWORD *)v3 + 1) = v22;
    *((_OWORD *)v3 + 2) = v26;
    return result;
  }
  uint64_t v17 = v3[3];
  uint64_t v16 = v3[4];
  uint64_t v31 = *v3;
  long long v32 = *(_OWORD *)(v3 + 1);
  uint64_t v33 = v17;
  uint64_t v34 = v16;
  if (!v16)
  {
    sub_24A496BE8((uint64_t)a1);
    uint64_t result = swift_unknownObjectRelease();
    goto LABEL_14;
  }
  unint64_t v18 = *(unsigned __int8 *)(v15 + 18);
  swift_unknownObjectRetain();
  sub_24A4895D4(v18, (uint64_t)v27);
  swift_unknownObjectRelease();
  unint64_t v19 = sub_24A586D60(*(unint64_t *)&v27[0], *((unint64_t *)&v27[0] + 1));
  uint64_t result = swift_bridgeObjectRelease();
  if ((v19 & 0x100000000) != 0)
  {
    __break(1u);
  }
  else
  {
    sub_24A5BC770();
    v27[0] = v24;
    v27[1] = v25;
    long long v28 = v26;
    if ((void)v24) {
      unint64_t v20 = ((void)v28 << 11) | 0x300;
    }
    else {
      unint64_t v20 = 768;
    }
    v23[12] = 0;
    sub_24A48D2C8(v20, 0, 0, 1uLL, (uint64_t *)v19, (uint64_t)v10);
    sub_24A4C7A08((uint64_t)v12);
    swift_unknownObjectRetain();
    sub_24A5B5C68((uint64_t *)v27);
    sub_24A496BE8((uint64_t)a1);
    sub_24A496BE8((uint64_t)&v24);
    uint64_t v21 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
    v21(v10, v6);
    return ((uint64_t (*)(unsigned char *, uint64_t))v21)(v12, v6);
  }
  return result;
}

double sub_24A5B41DC@<D0>(char a1@<W0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B177928);
  uint64_t v4 = swift_allocObject();
  *(_WORD *)(v4 + 16) = 0;
  *(unsigned char *)(v4 + 18) = a1;
  *(void *)a2 = v4;
  double result = 0.0;
  *(_OWORD *)(a2 + 8) = 0u;
  *(_OWORD *)(a2 + 24) = 0u;
  return result;
}

_WORD *sub_24A5B4230(_WORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4 = (unsigned __int16)*result;
  uint64_t v5 = a2 + 40 * (unsigned __int16)*result;
  long long v6 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a3;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a3 + 32);
  if (v4 == 0xFFFF)
  {
    __break(1u);
    goto LABEL_7;
  }
  *double result = v4 + 1;
  uint64_t v8 = a2 + 40 * (v4 + 1);
  long long v9 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)a4;
  *(_OWORD *)(v8 + 16) = v9;
  *(void *)(v8 + 32) = *(void *)(a4 + 32);
  if (v4 == 65534)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  *double result = v4 + 2;
  sub_24A497498(a3);
  return (_WORD *)sub_24A497498(a4);
}

void *sub_24A5B42CC(void *result, uint64_t a2, unint64_t a3, uint64_t a4, _WORD *a5, uint64_t a6)
{
  uint64_t v6 = (unsigned __int16)*a5;
  BOOL v7 = __OFSUB__(v6, a4);
  uint64_t v8 = v6 - a4;
  if (v7)
  {
    __break(1u);
  }
  else
  {
    char v10 = a3;
    uint64_t v12 = result;
    unint64_t v13 = a3 >> 40;
    unint64_t v14 = HIDWORD(a3);
    uint64_t v15 = (void *)(a6 + 24 * a4);
    unint64_t v16 = a3 >> 24;
    unint64_t v17 = a3 >> 16;
    unint64_t v18 = a3 >> 8;
    double result = memmove(v15 + 3, v15, 24 * v8);
    *uint64_t v15 = v12;
    v15[1] = a2;
    *((unsigned char *)v15 + 16) = v10;
    *((unsigned char *)v15 + 17) = v18;
    *((unsigned char *)v15 + 18) = v17;
    *((unsigned char *)v15 + 19) = v16;
    *((unsigned char *)v15 + 20) = v14;
    *((unsigned char *)v15 + 21) = v13;
    int v19 = (unsigned __int16)*a5;
    if (v19 != 0xFFFF)
    {
      *a5 = v19 + 1;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24A5B4390(uint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v9 = *v4;
  int v10 = *(unsigned __int8 *)(*v4 + 18);
  uint64_t v11 = *v4 + 24;
  uint64_t v12 = *a1;
  uint64_t v13 = *a1 + 24;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v14 = v9 + 16;
  uint64_t v15 = v12 + 16;
  if (v10) {
    uint64_t v16 = a4(v15, v13, a2, v14, v11);
  }
  else {
    uint64_t v16 = a3(v15, v13, a2, v14, v11);
  }
  uint64_t v20 = v16;
  uint64_t v21 = v17;
  uint64_t v22 = v18;
  uint64_t v23 = v19;
  swift_unknownObjectRelease();
  uint64_t result = swift_unknownObjectRelease();
  uint64_t v25 = v4[1];
  BOOL v26 = __OFADD__(v25, v20);
  uint64_t v27 = v25 + v20;
  if (v26)
  {
    __break(1u);
    goto LABEL_14;
  }
  v4[1] = v27;
  uint64_t v28 = v4[2];
  BOOL v26 = __OFADD__(v28, v21);
  uint64_t v29 = v28 + v21;
  if (v26)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  void v4[2] = v29;
  uint64_t v30 = v4[3];
  BOOL v26 = __OFADD__(v30, v22);
  uint64_t v31 = v30 + v22;
  if (v26)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v4[3] = v31;
  uint64_t v32 = v4[4];
  BOOL v26 = __OFADD__(v32, v23);
  uint64_t v33 = v32 + v23;
  if (v26)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v4[4] = v33;
  uint64_t v34 = a1[1];
  BOOL v26 = __OFSUB__(v34, v20);
  uint64_t v35 = v34 - v20;
  if (v26)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  a1[1] = v35;
  uint64_t v36 = a1[2];
  BOOL v26 = __OFSUB__(v36, v21);
  uint64_t v37 = v36 - v21;
  if (v26)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  a1[2] = v37;
  uint64_t v38 = a1[3];
  BOOL v26 = __OFSUB__(v38, v22);
  uint64_t v39 = v38 - v22;
  if (v26)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  a1[3] = v39;
  uint64_t v40 = a1[4];
  BOOL v26 = __OFSUB__(v40, v23);
  uint64_t v41 = v40 - v23;
  if (!v26)
  {
    a1[4] = v41;
    return result;
  }
LABEL_20:
  __break(1u);
  return result;
}

void *sub_24A5B44EC(_WORD *a1, char *__dst, uint64_t a3, _WORD *a4, uint64_t a5)
{
  if (a3 < 1) {
    return 0;
  }
  int v10 = (char *)(a5 + 40 * (unsigned __int16)*a4);
  uint64_t v11 = &__dst[40 * a3];
  if (v10 != __dst || v10 >= v11) {
    memmove(v10, __dst, 40 * a3);
  }
  uint64_t result = memmove(__dst, v11, 40 * ((unsigned __int16)*a1 - a3));
  uint64_t v14 = (unsigned __int16)*a4;
  BOOL v15 = __OFADD__(v14, a3);
  unint64_t v16 = v14 + a3;
  if (v15)
  {
    __break(1u);
    goto LABEL_18;
  }
  if ((v16 & 0x8000000000000000) != 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v16 >> 16)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  *a4 = v16;
  uint64_t v17 = (unsigned __int16)*a1 - a3;
  if (v17 < 0)
  {
LABEL_20:
    __break(1u);
    return result;
  }
  *a1 = v17;
  unint64_t v18 = (unsigned __int16)*a4;
  if (v18 >= a3) {
    uint64_t v19 = v18 - a3;
  }
  else {
    uint64_t v19 = 0;
  }
  return (void *)sub_24A5B4CF8(v19, v18, a5);
}

char *sub_24A5B45E4(_WORD *a1, char *__dst, uint64_t a3, _WORD *a4, uint64_t a5)
{
  if (a3 < 1) {
    return 0;
  }
  uint64_t result = (char *)(a5 + 24 * (unsigned __int16)*a4);
  uint64_t v11 = 24 * a3;
  uint64_t v12 = &__dst[24 * a3];
  if (result != __dst || result >= v12) {
    uint64_t result = (char *)memmove(result, __dst, 24 * a3);
  }
  size_t v14 = 24 * ((unsigned __int16)*a1 - a3);
  if (v11 > 0 || &v12[v14] <= __dst || v11) {
    uint64_t result = (char *)memmove(__dst, v12, v14);
  }
  uint64_t v15 = (unsigned __int16)*a4;
  BOOL v16 = __OFADD__(v15, a3);
  unint64_t v17 = v15 + a3;
  if (v16)
  {
    __break(1u);
    goto LABEL_22;
  }
  if ((v17 & 0x8000000000000000) != 0)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v17 >> 16)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  *a4 = v17;
  uint64_t v18 = (unsigned __int16)*a1 - a3;
  if (v18 < 0)
  {
LABEL_24:
    __break(1u);
    return result;
  }
  *a1 = v18;
  unint64_t v19 = (unsigned __int16)*a4;
  if (v19 >= a3) {
    uint64_t v20 = v19 - a3;
  }
  else {
    uint64_t v20 = 0;
  }
  return (char *)sub_24A5B4D88(v20, v19, a5);
}

void *sub_24A5B4700(_WORD *a1, uint64_t a2, uint64_t a3, _WORD *a4, char *__src)
{
  if (a3 < 1) {
    return 0;
  }
  uint64_t result = memmove(&__src[40 * a3], __src, 40 * (unsigned __int16)*a4);
  unint64_t v11 = a2 + 40 * (unsigned __int16)*a1;
  uint64_t v12 = (char *)(v11 - 40 * a3);
  if (v11 <= (unint64_t)__src || v12 != __src) {
    uint64_t result = memmove(__src, v12, 40 * a3);
  }
  uint64_t v14 = (unsigned __int16)*a4;
  BOOL v15 = __OFADD__(v14, a3);
  unint64_t v16 = v14 + a3;
  if (v15)
  {
    __break(1u);
    goto LABEL_17;
  }
  if ((v16 & 0x8000000000000000) != 0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v16 >> 16)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  *a4 = v16;
  uint64_t v17 = (unsigned __int16)*a1 - a3;
  if (v17 < 0)
  {
LABEL_19:
    __break(1u);
    return result;
  }
  *a1 = v17;
  if ((unsigned __int16)*a4 >= a3) {
    uint64_t v18 = a3;
  }
  else {
    uint64_t v18 = (unsigned __int16)*a4;
  }
  return (void *)sub_24A5B4CF8(0, v18, (uint64_t)__src);
}

void *sub_24A5B47F8(_WORD *a1, uint64_t a2, uint64_t a3, _WORD *a4, char *__src)
{
  if (a3 < 1) {
    return 0;
  }
  size_t v10 = 24 * a3;
  uint64_t result = memmove(&__src[24 * a3], __src, 24 * (unsigned __int16)*a4);
  uint64_t v12 = (char *)(a2 + 24 * (unsigned __int16)*a1 - 24 * a3);
  if (v12 != __src || &v12[v10] <= __src) {
    uint64_t result = memmove(__src, v12, v10);
  }
  uint64_t v14 = (unsigned __int16)*a4;
  BOOL v15 = __OFADD__(v14, a3);
  unint64_t v16 = v14 + a3;
  if (v15)
  {
    __break(1u);
    goto LABEL_17;
  }
  if ((v16 & 0x8000000000000000) != 0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v16 >> 16)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  *a4 = v16;
  uint64_t v17 = (unsigned __int16)*a1 - a3;
  if (v17 < 0)
  {
LABEL_19:
    __break(1u);
    return result;
  }
  *a1 = v17;
  if ((unsigned __int16)*a4 >= a3) {
    uint64_t v18 = a3;
  }
  else {
    uint64_t v18 = (unsigned __int16)*a4;
  }
  return (void *)sub_24A5B4D88(0, v18, (uint64_t)__src);
}

uint64_t *sub_24A5B48F8(uint64_t *result)
{
  uint64_t v2 = (uint64_t)v1;
  uint64_t v3 = *v1;
  if (*(_WORD *)(v3 + 16))
  {
    int v4 = result;
    uint64_t v5 = *(unsigned __int16 *)(v3 + 16) - 1;
    int v6 = *(unsigned __int8 *)(v3 + 18);
    *uint64_t result = ((-15 << ((4 * v6 + 8) & 0x3C)) - 1) & *result | (v5 << ((4 * v6 + 8) & 0x3C));
    if (v6)
    {
      uint64_t v7 = v3 + 40 * (int)v5;
      long long v8 = *(_OWORD *)(v7 + 24);
      long long v9 = *(_OWORD *)(v7 + 40);
      uint64_t v11 = *(void *)(v7 + 56);
      v10[0] = v8;
      v10[1] = v9;
      sub_24A497498(v2);
      sub_24A497498((uint64_t)v10);
      uint64_t v3 = sub_24A5B48F8(v4);
      sub_24A496BE8((uint64_t)v10);
      sub_24A496BE8(v2);
    }
    return (uint64_t *)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24A5B49C4(unsigned __int16 *a1, uint64_t a2, uint64_t *a3, uint64_t a4, char a5)
{
  uint64_t v9 = *a3;
  if (*a3 < *a1)
  {
    uint64_t v10 = a2 + 40 * v9;
    long long v11 = *(_OWORD *)(v10 + 16);
    v23[0] = *(_OWORD *)v10;
    v23[1] = v11;
    uint64_t v24 = *(void *)(v10 + 32);
    swift_unknownObjectRetain();
    char v12 = sub_24A48FB44(a4);
    sub_24A496BE8((uint64_t)v23);
    if (v12) {
      return 1;
    }
    uint64_t v9 = *a3;
  }
  BOOL v13 = v9 < 1;
  uint64_t v14 = v9 - 1;
  if (!v13)
  {
    *a3 = v14;
    uint64_t v16 = *(void *)(a4 + 8);
    BOOL v15 = (uint64_t *)(a4 + 8);
    *BOOL v15 = v16 & ((-15 << ((4 * a5 + 8) & 0x3C)) - 1) | (v14 << ((4 * a5 + 8) & 0x3C));
    uint64_t v17 = a2 + 40 * *a3;
    long long v18 = *(_OWORD *)(v17 + 16);
    v21[0] = *(_OWORD *)v17;
    v21[1] = v18;
    uint64_t v22 = *(void *)(v17 + 32);
    swift_unknownObjectRetain();
    unint64_t v19 = sub_24A5B48F8(v15);
    sub_24A496BE8((uint64_t)v21);
    v15[1] = (uint64_t)v19;
    return 1;
  }
  return 0;
}

uint64_t (*sub_24A5B4ADC(void *a1, unint64_t a2))()
{
  uint64_t v5 = malloc(0x48uLL);
  *a1 = v5;
  v5[8] = v2;
  sub_24A48FDE4(a2, (uint64_t)v5);
  return sub_24A5B385C;
}

void sub_24A5B4B44(uint64_t *a1, uint8x8_t a2)
{
  uint64_t v2 = (void *)*a1;
  sub_24A48FC0C((uint64_t)&v3, *a1, a2);
  swift_bridgeObjectRelease();
  free(v2);
}

uint64_t sub_24A5B4B98@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = swift_isUniquelyReferenced_nonNull();
  if ((result & 1) == 0)
  {
    long long v7 = v2[1];
    long long v23 = *v2;
    long long v24 = v7;
    uint64_t v25 = *((void *)v2 + 4);
    sub_24A4CBC1C((uint64_t)v21);
    uint64_t result = swift_unknownObjectRelease();
    v6.i32[1] = DWORD1(v21[0]);
    long long v8 = v21[1];
    long long *v2 = v21[0];
    v2[1] = v8;
    *((void *)v2 + 4) = v22;
  }
  uint64_t v9 = *(void *)v2;
  uint64_t v10 = *(unsigned __int16 *)(*(void *)v2 + 16);
  if (*(_WORD *)(*(void *)v2 + 16))
  {
    int v11 = v10 - 1;
    int v12 = *(unsigned __int8 *)(v9 + 18);
    uint64_t v13 = ((-15 << ((4 * v12 + 8) & 0x3C)) - 1) & *a1 | ((v10 - 1) << ((4 * v12 + 8) & 0x3C));
    *a1 = v13;
    if (v12)
    {
      swift_unknownObjectRetain();
      sub_24A5B4B98(a1);
      return swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v14 = v9 + 24 + 24 * v11;
      uint64_t v15 = *(void *)(v14 + 8);
      uint64_t v16 = *(unsigned __int8 *)(v14 + 16);
      uint64_t v17 = *(unsigned __int8 *)(v14 + 17);
      *(void *)(a2 + 8) = *(void *)v14;
      *(void *)(a2 + 16) = v15;
      *(unsigned char *)(a2 + 24) = v16;
      *(unsigned char *)(a2 + 25) = v17;
      v6.i32[0] = *(_DWORD *)(v14 + 18);
      unsigned __int32 v18 = vmovl_u8(v6).u32[0];
      *(_DWORD *)(a2 + 26) = v6.i32[0];
      v19.i64[0] = HIWORD(v18);
      v19.i64[1] = (unsigned __int16)v18;
      v20.i64[0] = 255;
      v20.i64[1] = 255;
      *(int8x16_t *)(a2 + 32) = vandq_s8(v19, v20);
      *(void *)(a2 + 48) = v17;
      *(void *)(a2 + 56) = v16;
      *(void *)a2 = v13;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24A5B4CF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2 - a1;
  if (a2 == a1) {
    return 0;
  }
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t result = 0;
  for (uint64_t i = (void *)(a3 + 40 * a1 + 16); ; i += 5)
  {
    uint64_t v11 = *(i - 1);
    BOOL v12 = __OFADD__(result, v11);
    result += v11;
    if (v12) {
      break;
    }
    BOOL v12 = __OFADD__(v9, *i);
    v9 += *i;
    if (v12) {
      goto LABEL_11;
    }
    uint64_t v13 = i[1];
    BOOL v12 = __OFADD__(v8, v13);
    v8 += v13;
    if (v12) {
      goto LABEL_12;
    }
    uint64_t v14 = i[2];
    BOOL v12 = __OFADD__(v7, v14);
    v7 += v14;
    if (v12) {
      goto LABEL_13;
    }
    if (!--v3) {
      return result;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_24A5B4D88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2 - a1;
  if (a2 == a1) {
    return 0;
  }
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t result = 0;
  for (uint64_t i = (unsigned __int8 *)(a3 + 24 * a1 + 19); ; i += 24)
  {
    uint64_t v11 = *i;
    BOOL v12 = __OFADD__(result, v11);
    result += v11;
    if (v12) {
      break;
    }
    uint64_t v13 = *(i - 1);
    BOOL v12 = __OFADD__(v9, v13);
    v9 += v13;
    if (v12) {
      goto LABEL_11;
    }
    uint64_t v14 = *(i - 2);
    BOOL v12 = __OFADD__(v8, v14);
    v8 += v14;
    if (v12) {
      goto LABEL_12;
    }
    uint64_t v15 = *(i - 3);
    BOOL v12 = __OFADD__(v7, v15);
    v7 += v15;
    if (v12) {
      goto LABEL_13;
    }
    if (!--v3) {
      return result;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
LABEL_13:
  __break(1u);
  return result;
}

uint64_t _s19CollectionsInternal9BigStringV6append10contentsOfyACn_tF_0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24A5BC780();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v5);
  uint64_t v11 = (char *)&v24 - v10;
  uint64_t v12 = *(void *)a1;
  if (*(void *)a1)
  {
    uint64_t v14 = *(void *)(a1 + 8);
    uint64_t v13 = *(void *)(a1 + 16);
    uint64_t v15 = *(void *)(a1 + 24);
    long long v16 = *(_OWORD *)(a1 + 32);
    uint64_t v43 = *(void *)a1;
    uint64_t v44 = v14;
    uint64_t v45 = v13;
    uint64_t v46 = v15;
    uint64_t v47 = v16;
    if ((void)v16)
    {
      unint64_t v17 = *v1;
      if (*v1)
      {
        uint64_t v18 = v1[4];
        if (v18)
        {
          long long v28 = v16;
          unint64_t v29 = v17;
          uint64_t v30 = v18;
          uint64_t v31 = v9;
          uint64_t v32 = result;
          unint64_t v27 = v1[1];
          uint64_t v26 = v1[2];
          uint64_t v25 = v1[3];
          sub_24A4895D4(*(unsigned __int8 *)(v12 + 18), (uint64_t)&v37);
          unint64_t v19 = sub_24A586D60(v37, v38);
          uint64_t result = swift_bridgeObjectRelease();
          if ((v19 & 0x100000000) != 0)
          {
            __break(1u);
          }
          else
          {
            *(void *)&long long v33 = v12;
            *((void *)&v33 + 1) = v14;
            *(void *)&long long v34 = v13;
            *((void *)&v34 + 1) = v15;
            long long v35 = v28;
            swift_unknownObjectRetain();
            sub_24A5BC770();
            uint64_t v20 = v2[5];
            unint64_t v37 = v29;
            unint64_t v38 = v27;
            uint64_t v39 = v26;
            uint64_t v40 = v25;
            uint64_t v41 = v30;
            uint64_t v42 = v20;
            LOBYTE(v36[0]) = 0;
            sub_24A48D2C8((v30 << 11) | 0x300, 0, 0, 1uLL, (uint64_t *)v19, (uint64_t)v7);
            sub_24A4C7A08((uint64_t)v11);
            v36[0] = v33;
            v36[1] = v34;
            v36[2] = v35;
            sub_24A4974C4((uint64_t)v36, (uint64_t)v48);
            sub_24A497498((uint64_t)v48);
            sub_24A5B5A34((uint64_t *)v36);
            sub_24A496BE8(a1);
            uint64_t v21 = *(void (**)(char *, uint64_t))(v31 + 8);
            uint64_t v22 = v32;
            v21(v7, v32);
            v21(v11, v22);
            return swift_unknownObjectRelease();
          }
          return result;
        }
        uint64_t result = swift_unknownObjectRelease();
      }
      long long v23 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)uint64_t v1 = *(_OWORD *)a1;
      *((_OWORD *)v1 + 1) = v23;
      *((_OWORD *)v1 + 2) = *(_OWORD *)(a1 + 32);
      return result;
    }
    return sub_24A496BE8(a1);
  }
  return result;
}

_WORD *sub_24A5B514C(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = v4;
  long long v10 = *((_OWORD *)v4 + 1);
  v32[0] = *(_OWORD *)v4;
  v32[1] = v10;
  long long v33 = *((_OWORD *)v4 + 2);
  sub_24A4974C4((uint64_t)v32, (uint64_t)v34);
  sub_24A497498((uint64_t)v34);
  unint64_t v11 = sub_24A498214();
  sub_24A496BE8((uint64_t)v32);
  if (v11 == a4) {
    return sub_24A5B3324((uint64_t)a1, a2, a3 & 0xFFFFFFFFFFFFLL);
  }
  uint64_t result = (_WORD *)sub_24A4974C4((uint64_t)v34, (uint64_t)v35);
  if (!v35[0]) {
    goto LABEL_18;
  }
  sub_24A5B5324(a1, a2, a3 & 0xFFFFFFFFFFFFLL, a4, v28);
  uint64_t v13 = v28[0];
  uint64_t v14 = v28[1];
  uint64_t v16 = v28[2];
  uint64_t v15 = v28[3];
  uint64_t v17 = v28[4];
  uint64_t result = (_WORD *)sub_24A4974C4((uint64_t)v28, (uint64_t)v29);
  if (v29[0])
  {
    v31[0] = v13;
    v31[1] = v14;
    v31[2] = v16;
    _OWORD v31[3] = v15;
    uint64_t v27 = v15;
    unsigned char v31[4] = v17;
    uint64_t v18 = v5[1];
    uint64_t v20 = v5[2];
    uint64_t v19 = v5[3];
    uint64_t v21 = v5[4];
    v30[0] = *v5;
    v30[1] = v18;
    v30[2] = v20;
    v30[3] = v19;
    v30[4] = v21;
    unsigned int v22 = *(unsigned __int8 *)(v30[0] + 18) + 1;
    if ((v22 >> 8))
    {
      __break(1u);
    }
    else
    {
      uint64_t v26 = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B177928);
      uint64_t v23 = swift_allocObject();
      *(_WORD *)(v23 + 16) = 0;
      uint64_t result = (_WORD *)(v23 + 16);
      *(unsigned char *)(v23 + 18) = v22;
      BOOL v24 = __OFADD__(v18, v14);
      uint64_t v25 = v18 + v14;
      if (!v24)
      {
        if (!__OFADD__(v20, v16))
        {
          if (!__OFADD__(v19, v27))
          {
            if (!__OFADD__(v21, v26))
            {
              sub_24A5B4230(result, v23 + 24, (uint64_t)v30, (uint64_t)v31);
              sub_24A496BE8((uint64_t)v28);
              uint64_t result = (_WORD *)swift_unknownObjectRelease();
              *uint64_t v5 = v23;
              v5[1] = v25;
              v5[2] = v20 + v16;
              void v5[3] = v19 + v27;
              v5[4] = v21 + v26;
              goto LABEL_11;
            }
            goto LABEL_17;
          }
LABEL_16:
          __break(1u);
LABEL_17:
          __break(1u);
LABEL_18:
          __break(1u);
          return result;
        }
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_11:
  v5[5] = *((void *)&v33 + 1) + 1;
  return result;
}

uint64_t sub_24A5B5324@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v6 = v5;
  unint64_t v29 = a1;
  uint64_t v30 = a2;
  LOWORD(v31) = a3;
  BYTE2(v31) = BYTE2(a3);
  HIBYTE(v31) = BYTE3(a3);
  char v32 = BYTE4(a3);
  char v33 = BYTE5(a3);
  uint64_t result = swift_isUniquelyReferenced_nonNull();
  if ((result & 1) == 0)
  {
    long long v13 = v5[1];
    long long v44 = *v5;
    long long v45 = v13;
    uint64_t v46 = *((void *)v5 + 4);
    sub_24A4CBC1C((uint64_t)v34);
    uint64_t result = swift_unknownObjectRelease();
    long long v14 = v34[1];
    *uint64_t v5 = v34[0];
    v5[1] = v14;
    *((void *)v5 + 4) = v35;
  }
  unint64_t v15 = a4 >> ((4 * *(unsigned char *)(*(void *)v5 + 18) + 8) & 0x3C);
  uint64_t v16 = v15 & 0xF;
  unint64_t v17 = *(unsigned __int16 *)(*(void *)v6 + 16);
  if (*(unsigned char *)(*(void *)v6 + 18))
  {
    if ((v15 & 0xF) < v17)
    {
      v26[1] = v26;
      MEMORY[0x270FA5388](result);
      long long v18 = *(long long *)((char *)v6 + 24);
      long long v27 = *(long long *)((char *)v6 + 8);
      long long v28 = v18;
      uint64_t v19 = *(void *)v6 + 24;
      swift_unknownObjectRetain();
      sub_24A5B6240(v19, v16, &v27, (void *(*)(_OWORD *__return_ptr))sub_24A5B6238, (uint64_t)v36);
      uint64_t v20 = v36[0];
      uint64_t v21 = v36[1];
      uint64_t v22 = v36[2];
      uint64_t v23 = v36[3];
      uint64_t v24 = v36[4];
      swift_unknownObjectRelease();
      long long v25 = v28;
      *(long long *)((char *)v6 + 8) = v27;
      *(long long *)((char *)v6 + 24) = v25;
      sub_24A4974C4((uint64_t)v36, (uint64_t)v38);
      if (v38[0])
      {
        uint64_t v39 = v20;
        uint64_t v40 = v21;
        uint64_t v41 = v22;
        uint64_t v42 = v23;
        uint64_t v43 = v24;
        sub_24A5B5704((uint64_t)&v39, v16, v37);
        uint64_t v20 = v37[0];
        uint64_t v21 = v37[1];
        uint64_t v22 = v37[2];
        uint64_t v23 = v37[3];
        uint64_t v24 = v37[4];
      }
      uint64_t result = swift_bridgeObjectRelease();
      goto LABEL_10;
    }
    __break(1u);
  }
  else if ((v15 & 0xF) <= v17)
  {
    uint64_t result = sub_24A5B5558(a1, a2, a3 & 0xFFFF00000000 | v31, v15 & 0xF, &v39);
    uint64_t v20 = v39;
    uint64_t v21 = v40;
    uint64_t v22 = v41;
    uint64_t v23 = v42;
    uint64_t v24 = v43;
LABEL_10:
    *a5 = v20;
    a5[1] = v21;
    a5[2] = v22;
    a5[3] = v23;
    a5[4] = v24;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_24A5B5558@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  unint64_t v15 = a1;
  uint64_t v16 = a2;
  LOWORD(v17) = a3;
  BYTE2(v17) = BYTE2(a3);
  HIBYTE(v17) = BYTE3(a3);
  unsigned __int8 v18 = BYTE4(a3);
  unsigned __int8 v19 = BYTE5(a3);
  uint64_t v8 = *v5;
  if ((a3 & 0xFCu) <= 0x7BuLL && *(_WORD *)(v8 + 16))
  {
    if (sub_24A5B5964((uint64_t)&v15, a4))
    {
LABEL_9:
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      goto LABEL_11;
    }
    uint64_t v8 = *v5;
  }
  if (*(_WORD *)(v8 + 16) != 15)
  {
    sub_24A5B65C0(v15, v16, v17 | ((unint64_t)v18 << 32) | ((unint64_t)v19 << 40), a4);
    goto LABEL_9;
  }
  if (a4 >= 8)
  {
    sub_24A5B258C(8, (uint64_t)&v20);
    sub_24A5B65C0(v15, v16, ((unint64_t)v19 << 40) | ((unint64_t)v18 << 32) | v17, a4 - *(unsigned __int16 *)(*v5 + 16));
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v9 = v20;
    uint64_t v10 = v21;
    uint64_t v11 = v22;
    uint64_t v12 = v23;
    uint64_t v13 = v24;
  }
  else
  {
    sub_24A5B258C(7, (uint64_t)&v20);
    uint64_t v9 = v20;
    uint64_t v10 = v21;
    uint64_t v11 = v22;
    uint64_t v12 = v23;
    uint64_t v13 = v24;
    sub_24A5B65C0(v15, v16, v17 | ((unint64_t)v18 << 32) | ((unint64_t)v19 << 40), a4);
    uint64_t result = swift_bridgeObjectRelease();
  }
LABEL_11:
  *a5 = v9;
  a5[1] = v10;
  a5[2] = v11;
  a5[3] = v12;
  a5[4] = v13;
  return result;
}

uint64_t sub_24A5B5704@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  long long v5 = *(_OWORD *)(result + 16);
  v37[0] = *(_OWORD *)result;
  v37[1] = v5;
  uint64_t v38 = *(void *)(result + 32);
  uint64_t v6 = a2 + 1;
  if (__OFADD__(a2, 1))
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v8 = (void *)result;
  if (a2 >= 1)
  {
    uint64_t v9 = *v3;
    uint64_t v10 = *v3 + 24;
    uint64_t v11 = v10 + 40 * a2;
    uint64_t v13 = *(void *)(v11 - 40);
    uint64_t v12 = (uint64_t *)(v11 - 40);
    unint64_t v14 = *(unsigned __int16 *)(*(void *)(v10 + 40 * a2) + 16) + (unint64_t)*(unsigned __int16 *)(v13 + 16);
    if (v14 >= 0x10)
    {
      swift_unknownObjectRetain();
LABEL_6:
      swift_unknownObjectRelease();
      goto LABEL_7;
    }
    swift_unknownObjectRetain();
    sub_24A5B3A4C(v12, (uint64_t *)(v10 + 40 * a2), v14);
    sub_24A5B3BB0((void *)a2, (_WORD *)(v9 + 16), v10, (uint64_t)v39);
    uint64_t result = sub_24A496BE8((uint64_t)v39);
    BOOL v15 = __OFSUB__(v6--, 1);
    if (!v15) {
      goto LABEL_6;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
LABEL_7:
  uint64_t v16 = *(unsigned __int16 *)(*v3 + 16);
  if (v6 >= v16
    || (uint64_t v17 = *v3 + 40 * v6,
        uint64_t v19 = *(void *)(v17 + 24),
        unsigned __int8 v18 = (uint64_t *)(v17 + 24),
        *(unsigned __int16 *)(v19 + 16) + (unint64_t)*(unsigned __int16 *)(*v8 + 16) > 0xF))
  {
    if (v16 == 15)
    {
      sub_24A5B258C(7, (uint64_t)&v40);
      if (v6 >= 8)
      {
        sub_24A5B637C((uint64_t)v8, v6 - *(unsigned __int16 *)(*v3 + 16));
        uint64_t result = sub_24A496BE8((uint64_t)v8);
        uint64_t v20 = v40;
        uint64_t v21 = v41;
        uint64_t v22 = v42;
        uint64_t v23 = v43;
        uint64_t v24 = v44;
      }
      else
      {
        uint64_t v20 = v40;
        uint64_t v21 = v41;
        uint64_t v22 = v42;
        uint64_t v23 = v43;
        uint64_t v24 = v44;
        sub_24A5B637C((uint64_t)v8, v6);
        uint64_t result = sub_24A496BE8((uint64_t)v8);
      }
      goto LABEL_20;
    }
    sub_24A5B637C((uint64_t)v8, v6);
    uint64_t result = sub_24A496BE8((uint64_t)v8);
LABEL_18:
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
LABEL_20:
    *a3 = v20;
    a3[1] = v21;
    a3[2] = v22;
    a3[3] = v23;
    a3[4] = v24;
    return result;
  }
  uint64_t v26 = v8[1];
  uint64_t v25 = v8[2];
  uint64_t v28 = v8[3];
  uint64_t v27 = v8[4];
  swift_unknownObjectRetain();
  sub_24A5B3A4C((uint64_t *)v37, v18, 0);
  uint64_t result = swift_unknownObjectRelease();
  uint64_t v29 = v3[1];
  BOOL v15 = __OFADD__(v29, v26);
  uint64_t v30 = v29 + v26;
  if (v15) {
    goto LABEL_23;
  }
  v3[1] = v30;
  uint64_t v31 = v3[2];
  BOOL v15 = __OFADD__(v31, v25);
  uint64_t v32 = v31 + v25;
  if (v15)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v3[2] = v32;
  uint64_t v33 = v3[3];
  BOOL v15 = __OFADD__(v33, v28);
  uint64_t v34 = v33 + v28;
  if (v15)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  _OWORD v3[3] = v34;
  uint64_t v35 = v3[4];
  BOOL v15 = __OFADD__(v35, v27);
  uint64_t v36 = v35 + v27;
  if (!v15)
  {
    v3[4] = v36;
    uint64_t result = swift_unknownObjectRelease();
    goto LABEL_18;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_24A5B5964(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2 + 24;
  swift_unknownObjectRetain();
  sub_24A5B64E4(v5, a2, a1, (uint64_t)v21);
  uint64_t v6 = v21[0];
  uint64_t v8 = v22;
  uint64_t v7 = v23;
  uint64_t v10 = v24;
  uint64_t v9 = v25;
  uint64_t result = swift_unknownObjectRelease();
  uint64_t v12 = v2[1];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (v13)
  {
    __break(1u);
    goto LABEL_7;
  }
  v2[1] = v14;
  uint64_t v15 = v2[2];
  BOOL v13 = __OFADD__(v15, v7);
  uint64_t v16 = v15 + v7;
  if (v13)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v2[2] = v16;
  uint64_t v17 = v2[3];
  BOOL v13 = __OFADD__(v17, v10);
  uint64_t v18 = v17 + v10;
  if (v13)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v2[3] = v18;
  uint64_t v19 = v2[4];
  BOOL v13 = __OFADD__(v19, v9);
  uint64_t v20 = v19 + v9;
  if (!v13)
  {
    v2[4] = v20;
    return v6;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t *sub_24A5B5A34(uint64_t *result)
{
  uint64_t v2 = *result;
  if (!*result) {
    return result;
  }
  uint64_t v3 = (uint64_t)result;
  uint64_t v4 = result[1];
  uint64_t v5 = result[2];
  uint64_t v7 = result[3];
  uint64_t v6 = result[4];
  uint64_t v8 = result[5];
  uint64_t v27 = *result;
  uint64_t v28 = v4;
  uint64_t v29 = v5;
  uint64_t v30 = v7;
  uint64_t v31 = v6;
  int v9 = *(unsigned __int16 *)(v2 + 16);
  if (*(_WORD *)(v2 + 16))
  {
    uint64_t v10 = v1;
    uint64_t v11 = *v1;
    if (*v1)
    {
      uint64_t v13 = v1[1];
      uint64_t v12 = v1[2];
      uint64_t v15 = v1[3];
      uint64_t v14 = v1[4];
      uint64_t v32 = *v1;
      uint64_t v33 = v13;
      uint64_t v34 = v12;
      uint64_t v35 = v15;
      uint64_t v36 = v14;
      if (*(_WORD *)(v11 + 16))
      {
        if (v9 != 1 || *(unsigned char *)(v2 + 18))
        {
          uint64_t v16 = v1[5];
          if (v14 > 123)
          {
            uint64_t v37 = v11;
            uint64_t v38 = v13;
            uint64_t v39 = v12;
            uint64_t v40 = v15;
            uint64_t v41 = v14;
            uint64_t v42 = v16;
            uint64_t result = (uint64_t *)sub_24A5B2704((uint64_t)&v37, result, (uint64_t *)&v24);
            long long v18 = v25;
            *(_OWORD *)uint64_t v1 = v24;
            *((_OWORD *)v1 + 1) = v18;
            *((_OWORD *)v1 + 2) = v26;
            return result;
          }
          uint64_t v37 = v11;
          uint64_t v38 = v13;
          uint64_t v39 = v12;
          uint64_t v40 = v15;
          uint64_t v41 = v14;
          uint64_t v42 = v16;
          unint64_t v22 = *(unsigned __int8 *)(v11 + 18);
          swift_unknownObjectRetain();
          if (sub_24A498214() != v22)
          {
            swift_unknownObjectRetain();
            sub_24A4895D4(v22, (uint64_t)&v24);
            swift_unknownObjectRelease_n();
            uint64_t v21 = *((void *)&v24 + 1);
            uint64_t v23 = (void *)v24;
            uint64_t v20 = v25;
            uint64_t v19 = BYTE4(v25);
            uint64_t v17 = BYTE5(v25);
            sub_24A497498(v3);
            swift_unknownObjectRelease();
            *uint64_t v10 = v2;
            v10[1] = v4;
            _OWORD v10[2] = v5;
            uint64_t v10[3] = v7;
            void v10[4] = v6;
            v10[5] = v8;
            sub_24A5B604C(v23, v21, v20 | (v19 << 32) | (v17 << 40));
            goto LABEL_15;
          }
        }
        else
        {
          if (sub_24A498214())
          {
            swift_unknownObjectRetain();
            sub_24A4895D4(0, (uint64_t)&v37);
            sub_24A496BE8(v3);
            sub_24A5B5E98(v37, v38, v39 | ((unint64_t)BYTE4(v39) << 32) | ((unint64_t)BYTE5(v39) << 40));
            goto LABEL_15;
          }
          __break(1u);
        }
        uint64_t result = (uint64_t *)swift_unknownObjectRelease();
        __break(1u);
        return result;
      }
      uint64_t result = (uint64_t *)swift_unknownObjectRelease();
    }
    *uint64_t v1 = v2;
    v1[1] = v4;
    v1[2] = v5;
    v1[3] = v7;
    v1[4] = v6;
    v1[5] = v8;
    return result;
  }
LABEL_15:
  return (uint64_t *)sub_24A496BE8(v3);
}

uint64_t *sub_24A5B5C68(uint64_t *result)
{
  uint64_t v2 = *result;
  if (!*result) {
    return result;
  }
  uint64_t v3 = (uint64_t)result;
  uint64_t v4 = result[1];
  uint64_t v5 = result[2];
  uint64_t v7 = result[3];
  uint64_t v6 = result[4];
  uint64_t v8 = result[5];
  uint64_t v27 = *result;
  uint64_t v28 = v4;
  uint64_t v29 = v5;
  uint64_t v30 = v7;
  uint64_t v31 = v6;
  int v9 = *(unsigned __int16 *)(v2 + 16);
  if (*(_WORD *)(v2 + 16))
  {
    uint64_t v10 = v1;
    uint64_t v11 = (unsigned __int8 *)*v1;
    if (*v1)
    {
      uint64_t v13 = v1[1];
      uint64_t v12 = v1[2];
      uint64_t v15 = v1[3];
      uint64_t v14 = v1[4];
      uint64_t v32 = *v1;
      uint64_t v33 = v13;
      uint64_t v34 = v12;
      uint64_t v35 = v15;
      uint64_t v36 = v14;
      if (v14)
      {
        if (v9 != 1 || *(unsigned char *)(v2 + 18))
        {
          uint64_t v16 = v1[5];
          if (v14 > 123)
          {
            uint64_t v37 = v11;
            uint64_t v38 = v13;
            uint64_t v39 = v12;
            uint64_t v40 = v15;
            uint64_t v41 = v14;
            uint64_t v42 = v16;
            uint64_t result = (uint64_t *)sub_24A5B2704((uint64_t)result, (uint64_t *)&v37, (uint64_t *)&v24);
            long long v18 = v25;
            *(_OWORD *)uint64_t v1 = v24;
            *((_OWORD *)v1 + 1) = v18;
            *((_OWORD *)v1 + 2) = v26;
            return result;
          }
          uint64_t v37 = v11;
          uint64_t v38 = v13;
          uint64_t v39 = v12;
          uint64_t v40 = v15;
          uint64_t v41 = v14;
          uint64_t v42 = v16;
          unint64_t v22 = v11[18];
          swift_unknownObjectRetain();
          if (sub_24A498214() != v22)
          {
            swift_unknownObjectRetain();
            sub_24A4895D4(v22, (uint64_t)&v24);
            swift_unknownObjectRelease_n();
            uint64_t v21 = *((void *)&v24 + 1);
            uint64_t v23 = v24;
            uint64_t v20 = v25;
            uint64_t v19 = BYTE4(v25);
            uint64_t v17 = BYTE5(v25);
            sub_24A497498(v3);
            swift_unknownObjectRelease();
            *uint64_t v10 = v2;
            v10[1] = v4;
            _OWORD v10[2] = v5;
            uint64_t v10[3] = v7;
            void v10[4] = v6;
            v10[5] = v8;
            sub_24A5B5E98(v23, v21, v20 | (v19 << 32) | (v17 << 40));
            goto LABEL_15;
          }
        }
        else
        {
          if (sub_24A498214())
          {
            swift_unknownObjectRetain();
            sub_24A4895D4(0, (uint64_t)&v37);
            sub_24A496BE8(v3);
            sub_24A5B604C(v37, v38, v39 | ((unint64_t)BYTE4(v39) << 32) | ((unint64_t)BYTE5(v39) << 40));
            goto LABEL_15;
          }
          __break(1u);
        }
        uint64_t result = (uint64_t *)swift_unknownObjectRelease();
        __break(1u);
        return result;
      }
      uint64_t result = (uint64_t *)swift_unknownObjectRelease();
    }
    *uint64_t v1 = v2;
    v1[1] = v4;
    v1[2] = v5;
    v1[3] = v7;
    v1[4] = v6;
    v1[5] = v8;
    return result;
  }
LABEL_15:
  return (uint64_t *)sub_24A496BE8(v3);
}

_WORD *sub_24A5B5E98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v5 = *v3;
  if (!*v3) {
    goto LABEL_5;
  }
  uint64_t v6 = v3[1];
  uint64_t v7 = v3[2];
  uint64_t v9 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v25 = *v3;
  uint64_t v26 = v6;
  uint64_t v27 = v7;
  uint64_t v28 = v9;
  uint64_t v29 = v8;
  if (!v8 || v8 >= 124 && (a3 & 0xFCu) > 0x7BuLL)
  {
LABEL_5:
    uint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
LABEL_6:
    return sub_24A5B3324(a1, a2, v10);
  }
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  LOWORD(v22) = a3;
  BYTE2(v22) = BYTE2(a3);
  HIBYTE(v22) = BYTE3(a3);
  unsigned __int8 v23 = BYTE4(a3);
  unsigned __int8 v24 = BYTE5(a3);
  uint64_t v12 = v3[5];
  uint64_t v30 = v5;
  uint64_t v31 = v6;
  uint64_t v32 = v7;
  uint64_t v33 = v9;
  uint64_t v34 = v8;
  uint64_t v35 = v12;
  swift_unknownObjectRetain();
  uint64_t result = (_WORD *)sub_24A498214();
  uint64_t v17 = v12;
  long long v18 = result;
  uint64_t v19 = 0;
  if ((unint64_t)result <= *(unsigned __int8 *)(v5 + 18))
  {
    __break(1u);
    goto LABEL_18;
  }
  swift_unknownObjectRetain();
  char v13 = sub_24A48FB44((uint64_t)&v17);
  uint64_t result = (_WORD *)swift_unknownObjectRelease_n();
  if ((v13 & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v17 != v12)
  {
LABEL_19:
    __break(1u);
    return result;
  }
  sub_24A48FDE4((unint64_t)v18, (uint64_t)&v17);
  char v14 = sub_24A4DB184((uint64_t)&v20);
  sub_24A48FC0C((uint64_t)&v16, (uint64_t)&v17, v15);
  swift_bridgeObjectRelease();
  v4[5] = v12 + 1;
  if ((v14 & 1) == 0)
  {
    a1 = v20;
    a2 = v21;
    uint64_t v10 = v22 | ((unint64_t)v23 << 32) | ((unint64_t)v24 << 40);
    goto LABEL_6;
  }
  return (_WORD *)swift_bridgeObjectRelease();
}

_WORD *sub_24A5B604C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *v3;
  if (!*v3)
  {
    unint64_t v6 = 0;
    ++v3[5];
    goto LABEL_7;
  }
  uint64_t v5 = v3[4];
  if (!v5 || v5 >= 124 && (a3 & 0xFCu) > 0x7BuLL)
  {
    ++v3[5];
    unint64_t v6 = *(unsigned __int8 *)(v4 + 18);
LABEL_7:
    uint64_t v7 = a3 & 0xFFFFFFFFFFFFLL;
LABEL_8:
    return sub_24A5B514C(a1, a2, v7, v6);
  }
  uint64_t v17 = a1;
  uint64_t v18 = a2;
  LOWORD(v19) = a3;
  BYTE2(v19) = BYTE2(a3);
  HIBYTE(v19) = BYTE3(a3);
  unsigned __int8 v20 = BYTE4(a3);
  unsigned __int8 v21 = BYTE5(a3);
  uint64_t v9 = v3[5];
  sub_24A48FDE4(*(unsigned __int8 *)(v4 + 18), (uint64_t)v16);
  BOOL v10 = sub_24A4DB330((uint64_t)&v17);
  sub_24A48FC0C((uint64_t)v15, (uint64_t)v16, v11);
  swift_bridgeObjectRelease();
  v3[5] = v9 + 1;
  if (!v10)
  {
    a1 = v17;
    a2 = v18;
    uint64_t v12 = v19;
    uint64_t v13 = v20;
    uint64_t v14 = v21;
    v3[5] = v9 + 2;
    if (*v3) {
      unint64_t v6 = *(unsigned __int8 *)(*v3 + 18);
    }
    else {
      unint64_t v6 = 0;
    }
    uint64_t v7 = v12 | (v13 << 32) | (v14 << 40);
    goto LABEL_8;
  }
  return (_WORD *)swift_bridgeObjectRelease();
}

uint64_t sub_24A5B61B4@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  unint64_t v7 = *((unsigned int *)a1 + 4) | ((unint64_t)*((unsigned __int8 *)a1 + 20) << 32) | ((unint64_t)*((unsigned __int8 *)a1 + 21) << 40);
  swift_bridgeObjectRetain();
  sub_24A5B5324(v9, v5, v6, v7, a2);
  return sub_24A4974C4((uint64_t)v9, a3);
}

uint64_t sub_24A5B6238@<X0>(uint64_t a1@<X8>)
{
  return sub_24A5B61B4(*(uint64_t **)(v1 + 16), *(void *)(v1 + 24), a1);
}

void *sub_24A5B6240@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *(*a4)(_OWORD *__return_ptr)@<X3>, uint64_t a5@<X8>)
{
  uint64_t result = (void *)(a1 + 40 * a2);
  uint64_t v8 = result + 1;
  uint64_t v7 = result[1];
  uint64_t v9 = *a3 - v7;
  if (__OFSUB__(*a3, v7))
  {
    __break(1u);
    goto LABEL_11;
  }
  uint8x8_t v11 = result + 2;
  uint64_t v13 = result + 3;
  uint64_t v12 = result[3];
  uint8x8_t v15 = result + 4;
  uint64_t v14 = result[4];
  uint64_t v16 = result[2];
  *a3 = v9;
  uint64_t v17 = a3[1];
  BOOL v18 = __OFSUB__(v17, v16);
  uint64_t v19 = v17 - v16;
  if (v18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  a3[1] = v19;
  uint64_t v20 = a3[2];
  BOOL v18 = __OFSUB__(v20, v12);
  uint64_t v21 = v20 - v12;
  if (v18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  a3[2] = v21;
  uint64_t v22 = a3[3];
  BOOL v18 = __OFSUB__(v22, v14);
  uint64_t v23 = v22 - v14;
  if (v18)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  a3[3] = v23;
  uint64_t result = a4(v35);
  if (__OFADD__(*a3, *v8))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v24 = *v13;
  uint64_t v25 = *v15;
  uint64_t v26 = *v11;
  *a3 += *v8;
  uint64_t v27 = a3[1];
  BOOL v18 = __OFADD__(v27, v26);
  uint64_t v28 = v27 + v26;
  if (v18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  a3[1] = v28;
  uint64_t v29 = a3[2];
  BOOL v18 = __OFADD__(v29, v24);
  uint64_t v30 = v29 + v24;
  if (v18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  a3[2] = v30;
  uint64_t v31 = a3[3];
  BOOL v18 = __OFADD__(v31, v25);
  uint64_t v32 = v31 + v25;
  if (!v18)
  {
    a3[3] = v32;
    uint64_t v33 = v36;
    long long v34 = v35[1];
    *(_OWORD *)a5 = v35[0];
    *(_OWORD *)(a5 + 16) = v34;
    *(void *)(a5 + 32) = v33;
    return result;
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_24A5B637C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t result = swift_isUniquelyReferenced_nonNull();
  if ((result & 1) == 0)
  {
    long long v10 = v2[1];
    long long v30 = *v2;
    long long v31 = v10;
    uint64_t v32 = *((void *)v2 + 4);
    sub_24A4CBC1C((uint64_t)v28);
    uint64_t result = swift_unknownObjectRelease();
    long long v11 = v28[1];
    long long *v2 = v28[0];
    v2[1] = v11;
    *((void *)v2 + 4) = v29;
  }
  uint64_t v12 = *((void *)v2 + 1);
  BOOL v13 = __OFADD__(v12, v6);
  uint64_t v14 = v12 + v6;
  if (v13)
  {
    __break(1u);
    goto LABEL_13;
  }
  *((void *)v2 + 1) = v14;
  uint64_t v15 = *((void *)v2 + 2);
  BOOL v13 = __OFADD__(v15, v5);
  uint64_t v16 = v15 + v5;
  if (v13)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  *((void *)v2 + 2) = v16;
  uint64_t v17 = *((void *)v2 + 3);
  BOOL v13 = __OFADD__(v17, v8);
  uint64_t v18 = v17 + v8;
  if (v13)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  *((void *)v2 + 3) = v18;
  uint64_t v19 = *((void *)v2 + 4);
  BOOL v13 = __OFADD__(v19, v7);
  uint64_t v20 = v19 + v7;
  if (v13)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  *((void *)v2 + 4) = v20;
  uint64_t v21 = *(void *)v2;
  swift_unknownObjectRetain();
  uint64_t result = sub_24A497498(a1);
  uint64_t v22 = *(unsigned __int16 *)(v21 + 16);
  BOOL v13 = __OFSUB__(v22, a2);
  uint64_t v23 = v22 - a2;
  if (v13)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v24 = v21 + 40 * a2;
  uint64_t result = (uint64_t)memmove((void *)(v24 + 64), (const void *)(v24 + 24), 40 * v23);
  long long v26 = *(_OWORD *)a1;
  long long v25 = *(_OWORD *)(a1 + 16);
  *(void *)(v24 + 56) = *(void *)(a1 + 32);
  *(_OWORD *)(v24 + 24) = v26;
  *(_OWORD *)(v24 + 40) = v25;
  int v27 = *(unsigned __int16 *)(v21 + 16);
  if (v27 == 0xFFFF)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  *(_WORD *)(v21 + 16) = v27 + 1;
  return swift_unknownObjectRelease();
}

uint64_t sub_24A5B64E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = 24 * a2;
  if (a2 < 1)
  {
    uint64_t v9 = (unsigned __int8 *)(a1 + v5 + 16);
    unsigned int v8 = *v9;
    uint64_t v7 = (unsigned __int8 *)(a1 + v5 + 17);
    unsigned int v6 = *v7;
    long long v10 = (unsigned __int8 *)(a1 + v5 + 18);
    unsigned int v11 = *v10;
    uint64_t v12 = (unsigned __int8 *)(a1 + v5 + 19);
    unsigned int v13 = *v12;
    uint64_t result = sub_24A4DB330(a3);
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)(v5 + a1 - 7);
    unsigned int v6 = *v7;
    uint64_t v9 = (unsigned __int8 *)(v5 + a1 - 8);
    unsigned int v8 = *v9;
    long long v10 = (unsigned __int8 *)(v5 + a1 - 6);
    unsigned int v11 = *v10;
    uint64_t v12 = (unsigned __int8 *)(v5 + a1 - 5);
    unsigned int v13 = *v12;
    uint64_t result = sub_24A4DB184(a3);
  }
  uint64_t v15 = *v9;
  unint64_t v16 = *v12 - (unint64_t)v13;
  unint64_t v17 = *v10 - (unint64_t)v11;
  unint64_t v18 = *v7 - (unint64_t)v6;
  *(unsigned char *)a4 = result & 1;
  *(void *)(a4 + 8) = v16;
  *(void *)(a4 + 16) = v17;
  *(void *)(a4 + 24) = v18;
  *(void *)(a4 + 32) = v15 - v8;
  return result;
}

uint64_t sub_24A5B65C0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t result = swift_isUniquelyReferenced_nonNull();
  if ((result & 1) == 0)
  {
    long long v11 = v4[1];
    long long v23 = *v4;
    long long v24 = v11;
    uint64_t v25 = *((void *)v4 + 4);
    sub_24A4CBC1C((uint64_t)v21);
    uint64_t result = swift_unknownObjectRelease();
    long long v12 = v21[1];
    *uint64_t v4 = v21[0];
    v4[1] = v12;
    *((void *)v4 + 4) = v22;
  }
  uint64_t v13 = *((void *)v4 + 1);
  if (__OFADD__(v13, BYTE3(a3)))
  {
    __break(1u);
    goto LABEL_11;
  }
  *((void *)v4 + 1) = v13 + BYTE3(a3);
  uint64_t v14 = *((void *)v4 + 2);
  if (__OFADD__(v14, BYTE2(a3)))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  *((void *)v4 + 2) = v14 + BYTE2(a3);
  uint64_t v15 = *((void *)v4 + 3);
  if (__OFADD__(v15, BYTE1(a3)))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  *((void *)v4 + 3) = v15 + BYTE1(a3);
  uint64_t v16 = *((void *)v4 + 4);
  BOOL v17 = __OFADD__(v16, a3);
  uint64_t v18 = v16 + a3;
  if (v17)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  *((void *)v4 + 4) = v18;
  uint64_t v19 = *(void *)v4;
  uint64_t v20 = (_WORD *)(*v5 + 16);
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  sub_24A5B42CC(a1, a2, ((unint64_t)BYTE2(a3) << 16) | ((unint64_t)BYTE1(a3) << 8) | ((unint64_t)BYTE3(a3) << 24) | a3 & 0xFFFF000000FFLL, a4, v20, v19 + 24);
  return swift_unknownObjectRelease();
}

BOOL _HeapNode.isRoot.getter(uint64_t a1)
{
  return a1 == 0;
}

CollectionsInternal::_HeapNode __swiftcall _HeapNode.parent()()
{
  uint64_t v2 = v0 - 1;
  if (v0 - 1 < 0) {
    uint64_t v2 = v0;
  }
  Swift::Int v3 = v2 >> 1;
  Swift::Int v4 = v1 - 1;
  result.level = v4;
  result.offset = v3;
  return result;
}

BOOL _HeapNode.isMinLevel.getter(uint64_t a1, char a2)
{
  return (a2 & 1) == 0;
}

CollectionsInternal::_HeapNode_optional __swiftcall _HeapNode.grandParent()()
{
  BOOL v3 = __OFSUB__(v0, 3);
  BOOL v2 = v0 - 3 < 0;
  Swift::Bool v4 = v0 < 3;
  if (v0 >= 3) {
    Swift::Int v5 = (unint64_t)(v0 - 3) >> 2;
  }
  else {
    Swift::Int v5 = 0;
  }
  if (v2 != v3) {
    Swift::Int v6 = 0;
  }
  else {
    Swift::Int v6 = v1 - 2;
  }
  result.value.level = v6;
  result.value.offset = v5;
  result.is_nil = v4;
  return result;
}

CollectionsInternal::_HeapNode __swiftcall _HeapNode.firstGrandchild()()
{
  Swift::Int v2 = (4 * v0) | 3;
  Swift::Int v3 = v1 + 2;
  result.level = v3;
  result.offset = v2;
  return result;
}

CollectionsInternal::_HeapNode __swiftcall _HeapNode.leftChild()()
{
  Swift::Int v2 = (2 * v0) | 1;
  Swift::Int v3 = v1 + 1;
  result.level = v3;
  result.offset = v2;
  return result;
}

BOOL static _HeapNode.< infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 < a3;
}

unint64_t static _HeapNode.level(forOffset:)(unint64_t result)
{
  if (result <= 0x7FFFFFFFFFFFFFFELL) {
    return __clz(result + 1) ^ 0x3F;
  }
  __break(1u);
  return result;
}

uint64_t static _HeapNode.allNodes(onLevel:limit:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = ~(-1 << result);
  uint64_t v4 = (1 << (result + 1)) - 2;
  if (v4 >= a2) {
    uint64_t v4 = a2 - 1;
  }
  BOOL v5 = v3 < a2;
  if (v3 < a2) {
    uint64_t v6 = ~(-1 << result);
  }
  else {
    uint64_t v6 = 0;
  }
  if (v3 < a2) {
    uint64_t v7 = result;
  }
  else {
    uint64_t v7 = 0;
  }
  if (!v5) {
    uint64_t v4 = 0;
  }
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v7;
  char v8 = !v5;
  *(void *)(a3 + 16) = v4;
  *(void *)(a3 + 24) = v7;
  *(unsigned char *)(a3 + 32) = v8;
  return result;
}

BOOL static _HeapNode.isMinLevel(_:)(char a1)
{
  return (a1 & 1) == 0;
}

uint64_t ClosedRange<>._forEach(_:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5 >= a3)
  {
    uint64_t v7 = a3;
    char v8 = (uint64_t (*)(uint64_t, uint64_t))result;
    do
      CollectionsInternal::_HeapNode result = v8(v7++, a4);
    while (v7 <= a5);
  }
  return result;
}

CollectionsInternal::_HeapNode __swiftcall _HeapNode.init(offset:)(Swift::Int offset)
{
  if ((unint64_t)offset > 0x7FFFFFFFFFFFFFFELL) {
    __break(1u);
  }
  else {
    Swift::Int v1 = __clz(offset + 1) ^ 0x3F;
  }
  result.level = v1;
  result.offset = offset;
  return result;
}

uint64_t static _HeapNode.root.getter()
{
  return 0;
}

uint64_t static _HeapNode.leftMax.getter()
{
  return 1;
}

uint64_t static _HeapNode.rightMax.getter()
{
  return 2;
}

uint64_t _HeapNode.offset.setter(uint64_t result)
{
  *Swift::Int v1 = result;
  return result;
}

uint64_t (*_HeapNode.offset.modify())(void, void, void, void, void)
{
  return nullsub_1;
}

uint64_t _HeapNode.level.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t _HeapNode.level.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*_HeapNode.level.modify())(void, void, void, void, void)
{
  return nullsub_1;
}

BOOL static _HeapNode.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 == a3;
}

uint64_t _HeapNode.description.getter()
{
  return 0x3A74657366666F28;
}

uint64_t sub_24A5B6A28()
{
  return _HeapNode.description.getter();
}

uint64_t static _HeapNode.firstNode(onLevel:)(char a1)
{
  return ~(-1 << a1);
}

uint64_t static _HeapNode.lastNode(onLevel:)(char a1)
{
  return (1 << (a1 + 1)) - 2;
}

CollectionsInternal::_HeapNode __swiftcall _HeapNode.rightChild()()
{
  Swift::Int v2 = 2 * v0 + 2;
  Swift::Int v3 = v1 + 1;
  result.level = v3;
  result.offset = v2;
  return result;
}

CollectionsInternal::_HeapNode __swiftcall _HeapNode.lastGrandchild()()
{
  Swift::Int v2 = 4 * v0 + 6;
  Swift::Int v3 = v1 + 2;
  result.level = v3;
  result.offset = v2;
  return result;
}

unint64_t sub_24A5B6A80()
{
  unint64_t result = qword_26979C538;
  if (!qword_26979C538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26979C538);
  }
  return result;
}

ValueMetadata *type metadata accessor for _HeapNode()
{
  return &type metadata for _HeapNode;
}

uint64_t OrderedSet<>.encode(to:)(void *a1, uint64_t a2, uint64_t a3)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24A5BC720();
  uint64_t v7 = a3;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v5, v6);
  sub_24A5BC210();
  swift_getWitnessTable();
  sub_24A5BC540();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

uint64_t sub_24A5B6BC8(void *a1, uint64_t a2)
{
  return OrderedSet<>.encode(to:)(a1, a2, *(void *)(v2 + 8));
}

uint64_t OrderedSet<>.init(from:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v29 = a3;
  uint64_t v30 = a2;
  uint64_t v7 = sub_24A5BC0D0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  long long v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24A5BC6F0();
  if (v4) {
    goto LABEL_8;
  }
  long long v26 = v10;
  uint64_t v27 = v8;
  uint64_t v28 = v7;
  __swift_project_boxed_opaque_existential_1(v33, v34);
  uint64_t v12 = sub_24A5BC210();
  uint64_t v35 = v29;
  swift_getWitnessTable();
  sub_24A5BC530();
  uint64_t v13 = v31[0];
  uint64_t v32 = v31[0];
  uint64_t v14 = sub_24A48AB90();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v16 = static _HashTable.create<A>(untilFirstDuplicateIn:scale:reservedScale:)((char *)v31, (uint64_t)&v32, 0, 1, v14, v12, WitnessTable, a4);
  uint64_t v17 = v31[0];
  if (v31[0] != *(void *)(v13 + 16))
  {
    swift_release();
    __swift_project_boxed_opaque_existential_1(v33, v34);
    sub_24A5BC520();
    v31[0] = 0;
    v31[1] = 0xE000000000000000;
    sub_24A5BC070();
    sub_24A5BB6F0();
    uint64_t v32 = v17;
    sub_24A5BC4E0();
    sub_24A5BB6F0();
    uint64_t v19 = v26;
    sub_24A5BC0C0();
    uint64_t v11 = sub_24A5BC0E0();
    swift_allocError();
    uint64_t v21 = v20;
    uint64_t v23 = v27;
    uint64_t v22 = v28;
    (*(void (**)(uint64_t, char *, uint64_t))(v27 + 16))(v20, v19, v28);
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v11 - 8) + 104))(v21, *MEMORY[0x263F8DCB8], v11);
    swift_willThrow();
    swift_release();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v19, v22);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
LABEL_8:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v11;
  }
  if (_s19CollectionsInternal4HeapV5countSivg_0() < 16)
  {
    uint64_t v18 = 0;
  }
  else
  {
    swift_retain();
    uint64_t v18 = v16;
  }
  uint64_t v11 = OrderedSet.init(_uniqueElements:_:)(v13, v18);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v11;
}

uint64_t sub_24A5B6F98@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result = OrderedSet<>.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a3 - 8), *(void *)(a2 + 24));
  if (!v4)
  {
    *a4 = result;
    a4[1] = v7;
  }
  return result;
}

uint64_t _HashTable.Header._description.getter()
{
  return 0x203A656C61637328;
}

unint64_t _HashTable.Header.description.getter()
{
  return 0xD000000000000011;
}

unint64_t sub_24A5B7204()
{
  return _HashTable.Header.description.getter();
}

uint64_t sub_24A5B720C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  sub_24A5BC070();
  sub_24A5BB6F0();
  _HashTable.Header._description.getter();
  sub_24A5BB6F0();
  swift_bridgeObjectRelease();
  sub_24A5BB6F0();
  sub_24A4F9D54(a3, a4);
  sub_24A5BBA30();
  uint64_t result = 0;
  if (1 << *a3 <= 127)
  {
    sub_24A5BB6F0();
    sub_24A4F9DEC(a3, a4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26979C540);
    sub_24A5B7560();
    sub_24A5BB400();
    swift_bridgeObjectRelease();
    sub_24A5BB6F0();
    swift_bridgeObjectRelease();
    return 0;
  }
  return result;
}

uint64_t sub_24A5B738C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  if (*(unsigned char *)(a1 + 8))
  {
    unint64_t v3 = 0xE100000000000000;
    uint64_t result = 95;
  }
  else
  {
    uint64_t result = sub_24A5BC430();
  }
  *a2 = result;
  a2[1] = v3;
  return result;
}

uint64_t _HashTable.UnsafeHandle.description.getter(void *a1, uint64_t a2)
{
  return sub_24A5B720C(0xD000000000000017, 0x800000024A5C44D0, a1, a2);
}

uint64_t sub_24A5B7410()
{
  return sub_24A5B720C(0xD000000000000017, 0x800000024A5C44D0, *(void **)v0, *(void *)(v0 + 8));
}

uint64_t _HashTable.description.getter(uint64_t a1)
{
  return sub_24A5B720C(0x626154687361485FLL, 0xEA0000000000656CLL, (void *)(a1 + 16), a1 + 32);
}

uint64_t sub_24A5B7454()
{
  return sub_24A5B720C(0x626154687361485FLL, 0xEA0000000000656CLL, (void *)(*(void *)v0 + 16), *(void *)v0 + 32);
}

uint64_t _HashTable.Storage.description.getter()
{
  swift_retain();
  uint64_t v1 = sub_24A5B720C(0xD000000000000012, 0x800000024A5C44F0, (void *)(v0 + 16), v0 + 32);
  swift_release();
  return v1;
}

uint64_t sub_24A5B74EC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = (void *)(*v0 + 16);
  swift_retain();
  uint64_t v3 = sub_24A5B720C(0xD000000000000012, 0x800000024A5C44F0, v2, v1 + 32);
  swift_release();
  return v3;
}

unint64_t sub_24A5B7560()
{
  unint64_t result = qword_26979C548;
  if (!qword_26979C548)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26979C540);
    sub_24A5B75D4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26979C548);
  }
  return result;
}

unint64_t sub_24A5B75D4()
{
  unint64_t result = qword_26979C550;
  if (!qword_26979C550)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26979C558);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26979C550);
  }
  return result;
}

uint64_t TreeSet.isSuperset(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _HashNode.isSubset<A>(_:of:)(0, a4, a5, a1, a2, a7, MEMORY[0x263F8EE60] + 8, MEMORY[0x263F8EE60] + 8, a8) & 1;
}

uint64_t TreeSet.isSuperset<A>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _HashNode.isSubset<A>(_:of:)(0, a4, a5, a1, a2, a7, a8, MEMORY[0x263F8EE60] + 8, a9);
}

uint64_t TreeSet.isSuperset<A>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = *(void *)(a6 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v18 = (char *)v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for TreeSet();
  if (v19 == a6)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, a6);
    swift_dynamicCast();
    char v20 = _HashNode.isSubset<A>(_:of:)(0, a2, a3, v23[0], v23[1], a5, MEMORY[0x263F8EE60] + 8, MEMORY[0x263F8EE60] + 8, a7);
    swift_release();
  }
  else
  {
    MEMORY[0x270FA5388](v19);
    v23[-8] = a5;
    v23[-7] = a6;
    v23[-6] = a7;
    v23[-5] = a8;
    v23[-4] = a2;
    v23[-3] = a3;
    uint64_t v22 = a4;
    char v20 = sub_24A5BB890();
  }
  return v20 & 1;
}

void TreeDictionary.mapValues<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _OWORD v14[2] = a6;
  v14[3] = a7;
  v14[4] = a8;
  v14[5] = a9;
  v14[6] = a1;
  v14[7] = a2;
  _HashNode.mapValues<A>(_:)((void (*)(char *, char *))sub_24A5B7AAC, (uint64_t)v14, a3, a4, a6, a7, a8, a9);
  if (!v9) {
    TreeDictionary.init(_new:)(v12, v13, a6, a8, a9);
  }
}

uint64_t sub_24A5B7918(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = a3;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v11 = *(void *)(TupleTypeMetadata2 - 8);
  MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v13 = (char *)&v16 - v12;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16))((char *)&v16 - v12, a1, a5);
  uint64_t v14 = &v13[*(int *)(TupleTypeMetadata2 + 48)];
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 16))(v14, a2, a6);
  v17(v14);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, TupleTypeMetadata2);
}

uint64_t sub_24A5B7AAC(uint64_t a1, uint64_t a2)
{
  return sub_24A5B7918(a1, a2, *(void (**)(char *))(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t TreeDictionary.compactMapValues<A>(_:)(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v28 = a4;
  uint64_t v29 = a7;
  uint64_t v14 = type metadata accessor for _HashNode.Builder();
  uint64_t v27 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v26 - v18;
  uint64_t v20 = v30;
  uint64_t result = _HashNode.compactMapValues<A>(_:_:)(0, a1, a2, a3, v28, a6, v29, a8, (uint64_t)&v26 - v18, a9);
  if (!v20)
  {
    uint64_t v22 = v27;
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v17, v19, v14);
    uint64_t v23 = sub_24A5566C8(v14);
    uint64_t v25 = v24;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v19, v14);
    return TreeDictionary.init(_new:)(v23, v25, a6, a8, a9);
  }
  return result;
}

uint64_t sub_24A5B7C80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_WORD *)(a1 + 20) = *(_WORD *)(a2 + 20);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s6_ChunkVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  *(unsigned char *)(a1 + 19) = *(unsigned char *)(a2 + 19);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(unsigned char *)(a1 + 21) = *(unsigned char *)(a2 + 21);
  return a1;
}

uint64_t _s6_ChunkVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_WORD *)(a1 + 20) = *(_WORD *)(a2 + 20);
  return a1;
}

unint64_t sub_24A5B7D88(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v4 = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v9 = sub_24A499D60((uint64_t)v9);
    *uint64_t v4 = v9;
  }
  unint64_t result = sub_24A5B805C(a1, a2, a3, a4);
  *uint64_t v4 = v9;
  return result;
}

unint64_t sub_24A5B7E38(unint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v4 = a3 + a2;
  if (__CFADD__(a3, a2))
  {
    __break(1u);
  }
  else
  {
    unint64_t v5 = a3 >> 6;
    char v6 = a3 & 0x3F;
    unint64_t v7 = v4 >> 6;
    BOOL v8 = v4 > 0x3F;
    unint64_t v9 = v4 & 0x3F;
    uint64_t v10 = v8 & (v9 == 0);
    char v11 = 64;
    if (!v10) {
      char v11 = v9;
    }
    uint64_t v12 = v7 - v10;
    uint64_t v13 = *v3;
    if (v5 == v12)
    {
      uint64_t v14 = -1 << v11;
      if (v10) {
        uint64_t v15 = -1;
      }
      else {
        uint64_t v15 = ~v14;
      }
      *(void *)(v13 + 8 * v5) = *(void *)(v13 + 8 * v5) & (v15 ^ (-1 << v6)) | (result << v6);
    }
    else
    {
      *(void *)(v13 + 8 * v5) = *(void *)(v13 + 8 * v5) & ~(-1 << v6) | (result << v6);
      uint64_t v16 = -1 << v11;
      if (v10) {
        uint64_t v16 = 0;
      }
      *(void *)(v13 + 8 * v12) = *(void *)(v13 + 8 * v12) & v16 | (result >> -(char)a3);
    }
  }
  return result;
}

unint64_t sub_24A5B7EFC(unint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t v6 = a2 - result;
  if (a2 == result) {
    return result;
  }
  unint64_t v7 = a5;
  unint64_t v10 = result;
  unint64_t result = sub_24A5B82F0(a5, result, a2, v5, a3);
  unint64_t v11 = a2 | v10;
  if (result)
  {
    if (((v11 | v7) & 0x8000000000000000) == 0)
    {
      if (a2 <= v10) {
        return result;
      }
      unint64_t v12 = a2 >> 6;
      unint64_t v13 = a2 & 0x3F;
      while (1)
      {
        unint64_t v14 = v10 >> 6;
        unint64_t v15 = v10 & 0x3F;
        if (v10 >> 6 == v12)
        {
          uint64_t v16 = v13 - v15;
          if (v13 < v15) {
            goto LABEL_23;
          }
          unint64_t v17 = *(void *)(a3 + 8 * v12) & ~(-1 << a2);
          unint64_t v10 = a2;
        }
        else
        {
          uint64_t v16 = 64 - v15;
          v10 += 64 - v15;
          unint64_t v17 = *(void *)(a3 + 8 * v14);
        }
        unint64_t result = sub_24A5B7E38(v17 >> v15, v16, v7);
        BOOL v18 = __CFADD__(v7, v16);
        v7 += v16;
        if (v18) {
          break;
        }
        if (v10 >= a2) {
          return result;
        }
      }
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
    }
    __break(1u);
    goto LABEL_25;
  }
  if ((v11 & 0x8000000000000000) != 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  BOOL v19 = __OFADD__(v7, v6);
  unint64_t v20 = v7 + v6;
  if (v19)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if ((v20 & 0x8000000000000000) != 0)
  {
LABEL_27:
    __break(1u);
    return result;
  }
  while (1)
  {
    unint64_t result = sub_24A4E0DB4();
    if (v22) {
      return result;
    }
    BOOL v18 = v20 >= v21;
    v20 -= v21;
    if (!v18) {
      goto LABEL_22;
    }
    sub_24A5B7E38(result, v21, v20);
  }
}

unint64_t sub_24A5B805C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = a3;
  uint64_t v7 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  unint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  unint64_t result = MEMORY[0x270FA5388](AssociatedTypeWitness);
  unint64_t v14 = (char *)&v23 - v13;
  if ((a2 & 0x8000000000000000) != 0)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return result;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a4);
  sub_24A5BB840();
  if ((a2 & 0x3F) == 0) {
    goto LABEL_6;
  }
  swift_getAssociatedConformanceWitness();
  unint64_t v15 = sub_24A4E0E68(64 - (a2 & 0x3F));
  uint64_t v17 = v16;
  sub_24A5B7E38(v15, v16, a2);
  BOOL v18 = __CFADD__(a2, v17);
  a2 += v17;
  if (v18)
  {
    __break(1u);
LABEL_6:
    swift_getAssociatedConformanceWitness();
  }
  unint64_t v19 = sub_24A4E0E68(64);
  if (v20)
  {
    uint64_t v21 = v20;
    while (1)
    {
      unint64_t result = sub_24A5B7E38(v19, v21, a2);
      BOOL v18 = __CFADD__(a2, v21);
      a2 += v21;
      if (v18) {
        break;
      }
      unint64_t v19 = sub_24A4E0E68(64);
      uint64_t v21 = v22;
      if (!v22) {
        goto LABEL_11;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_11:
  unint64_t result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, AssociatedTypeWitness);
  if (v24 < 0 || a2 != v24) {
    goto LABEL_16;
  }
  return result;
}

unint64_t sub_24A5B82F0(unint64_t result, unint64_t a2, unint64_t a3, void *a4, uint64_t a5)
{
  if (((a2 | result | a3) & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    BOOL v5 = (a3 & 0x3F) == 0 && a3 > 0x3F;
    unint64_t v6 = *a4 + 8 * (result >> 6);
    unint64_t v7 = a5 + 8 * (a2 >> 6);
    uint64_t v8 = 1;
    if (v6 >= v7)
    {
      unint64_t v9 = a5 + 8 * ((a3 >> 6) - v5);
      if (v9 >= v6)
      {
        if ((result & 0x3F) < (a2 & 0x3F) && v6 == v7) {
          return 1;
        }
        LODWORD(v8) = ((a3 & 0x3F) <= (result & 0x3F)) ^ v5;
        if (v6 == v9) {
          return v8;
        }
        else {
          return 0;
        }
      }
    }
    return v8;
  }
  return result;
}

uint64_t _Hash.init<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A5B85E4();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  return v4;
}

BOOL static _Hash.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _Hash.subscript.getter(char a1, unint64_t a2)
{
  return (a2 >> a1) & 0x1F;
}

BOOL _Hash.isEqual(to:upTo:)(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  return a2 < 0x40u || a3 == a1;
}

uint64_t _Hash.description.getter()
{
  sub_24A49A24C();
  sub_24A5BB7F0();
  uint64_t result = sub_24A5BB660();
  if (__OFSUB__(13, result))
  {
    __break(1u);
  }
  else
  {
    MEMORY[0x24C5C6AF0](48, 0xE100000000000000, (13 - result) & ~((13 - result) >> 63));
    swift_bridgeObjectRetain();
    sub_24A5BB6F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26979B178);
    sub_24A4CD1E8();
    return sub_24A5BB810();
  }
  return result;
}

uint64_t static _Hash.emptyPath.getter()
{
  return 0;
}

uint64_t static _Hash.bitWidth.getter()
{
  return 64;
}

uint64_t _Hash.value.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*_Hash.value.modify())(void, void, void, void, void)
{
  return nullsub_1;
}

uint64_t sub_24A5B852C()
{
  return _Hash.description.getter();
}

uint64_t _Hash.subscript.setter(uint64_t result, char a2)
{
  unint64_t *v2 = *v2 & ((-31 << a2) - 1) | ((unint64_t)result << a2);
  return result;
}

uint64_t (*_Hash.subscript.modify(uint64_t a1, char a2))(uint64_t result)
{
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 9) = a2;
  *(unsigned char *)(a1 + 8) = (*v2 >> a2) & 0x1F;
  return sub_24A5B8594;
}

uint64_t sub_24A5B8594(uint64_t result)
{
  **(void **)uint64_t result = ((-31 << *(unsigned char *)(result + 9)) - 1) & **(void **)result | ((unint64_t)*(unsigned __int8 *)(result + 8) << *(unsigned char *)(result + 9));
  return result;
}

unint64_t _Hash.appending(_:at:)(unsigned __int8 a1, char a2, uint64_t a3)
{
  return ((-31 << a2) - 1) & a3 | ((unint64_t)a1 << a2);
}

uint64_t sub_24A5B85E4()
{
  return sub_24A5BB370();
}

ValueMetadata *type metadata accessor for _Hash()
{
  return &type metadata for _Hash;
}

uint64_t static Deque._isConsistencyCheckingEnabled.getter()
{
  return 0;
}

uint64_t Deque._capacity.getter(uint64_t a1, uint64_t a2)
{
  sub_24A4AFC5C((uint64_t)sub_24A498BC4, 0, a1, (uint64_t)&type metadata for _DequeBufferHeader, a2, MEMORY[0x263F8E628], MEMORY[0x263F8D6C8], MEMORY[0x263F8E658], v3);
  return v4;
}

uint64_t Deque._startSlot.getter(uint64_t a1, uint64_t a2)
{
  sub_24A4AFC5C((uint64_t)sub_24A4AFE54, 0, a1, (uint64_t)&type metadata for _DequeBufferHeader, a2, MEMORY[0x263F8E628], (uint64_t)&type metadata for _DequeSlot, MEMORY[0x263F8E658], v3);
  return v4;
}

uint64_t Deque.init<A>(_capacity:startSlot:contents:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v12 + 16))(&v21[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)], v14, v15);
  uint64_t result = sub_24A5BBA00();
  if ((a2 | a1) < 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v17 = result;
  if (a2 >= a1 && a2 | a1) {
    goto LABEL_10;
  }
  uint64_t result = _s19CollectionsInternal4HeapV5countSivg_0();
  if (result > a1)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v18 = type metadata accessor for _DequeBuffer();
  MEMORY[0x270FA5388](v18);
  *(void *)&v21[-48] = a5;
  *(void *)&v21[-40] = a6;
  *(void *)&v21[-32] = a1;
  *(void *)&v21[-24] = v17;
  *(void *)&v21[-16] = a2;
  sub_24A5BC0F0();
  swift_retain();
  uint64_t v19 = Deque._Storage.init(_:)();
  uint64_t v20 = _s19CollectionsInternal4HeapV5countSivg_0();
  if (v20 >= 1)
  {
    MEMORY[0x270FA5388](v20);
    *(void *)&v21[-32] = a4;
    *(void *)&v21[-24] = a5;
    *(void *)&v21[-16] = a6;
    *(void *)&v21[-8] = v19;
    sub_24A5BC1A0();
  }
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a3, a5);
  return Deque.init(_storage:)(v19, a4);
}

uint64_t sub_24A5B8970@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 48);
  uint64_t result = _s19CollectionsInternal4HeapV5countSivg_0();
  *a1 = v3;
  a1[1] = result;
  a1[2] = v4;
  return result;
}

uint64_t sub_24A5B89F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v15 = a4;
  uint64_t v16 = a5;
  uint64_t v17 = a6;
  uint64_t v18 = a1;
  uint64_t v19 = a2;
  uint64_t v11 = a4;
  uint64_t v12 = sub_24A5B8D14;
  uint64_t v13 = &v14;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_26979ABD8);
  return sub_24A4AFEA4((uint64_t)sub_24A521D30, (uint64_t)v10, a3, (uint64_t)&type metadata for _DequeBufferHeader, a4, v8, MEMORY[0x263F8EE60] + 8, MEMORY[0x263F8E4E0], (uint64_t)v20);
}

uint64_t sub_24A5B8AB4(uint64_t a1, uint64_t a2)
{
  return sub_24A5B89F0(a1, a2, v2[5], v2[2], v2[3], v2[4]);
}

uint64_t sub_24A5B8AD4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  Deque._UnsafeHandle.segments()(a1, (uint64_t)&v27);
  uint64_t v30 = sub_24A5BBD90();
  uint64_t v20 = v8;
  sub_24A5BB580();
  uint64_t v9 = sub_24A5BBD20();
  unint64_t v10 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v29, &v28, v9);
  v10((uint64_t *)&v23, v29, v9);
  uint64_t v22 = a5;
  uint64_t v11 = sub_24A5BBDB0();
  sub_24A4C10F8((void (*)(char *, char *))sub_24A541B50, (uint64_t)v21, MEMORY[0x263F8E628], v11, v12, (uint64_t)&v25);
  uint64_t v18 = v25;
  *(void *)&long long v19 = a3;
  char v13 = v26;
  *(void *)&long long v23 = a3;
  *((void *)&v23 + 1) = a4;
  *((void *)&v19 + 1) = a4;
  uint64_t v14 = *((void *)&v25 + 1);
  swift_getWitnessTable();
  sub_24A5BBBB0();
  long long v23 = v25;
  long long v24 = v26;
  uint64_t v15 = sub_24A5BC5E0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t result = UnsafeMutableBufferPointer.initialize<A>(fromContentsOf:)((uint64_t)&v23, v30, v20, a5, v15, WitnessTable);
  if ((v13 & 1) == 0)
  {
    if (v14)
    {
      long long v23 = v19;
      sub_24A5BBBD0();
      long long v23 = v25;
      long long v24 = v26;
      return UnsafeMutableBufferPointer.initialize<A>(fromContentsOf:)((uint64_t)&v23, v18, v14, a5, v15, WitnessTable);
    }
  }
  return result;
}

uint64_t sub_24A5B8D14(void *a1, uint64_t a2)
{
  return sub_24A5B8AD4(a1, a2, v2[5], v2[6], v2[2]);
}

unint64_t UInt._reversed.getter(unint64_t a1)
{
  return __rbit64(a1);
}

char *BitArray.init(arrayLiteral:)(unint64_t a1)
{
  uint64_t v3 = sub_24A499EB0(0, (unint64_t)(*(void *)(a1 + 16) + 63) >> 6, 0, MEMORY[0x263F8EE78]);
  sub_24A5B8E28(a1);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_24A5B8DB0@<X0>(unint64_t a1@<X0>, char **a2@<X8>)
{
  BOOL v5 = sub_24A499EB0(0, (unint64_t)(*(void *)(a1 + 16) + 63) >> 6, 0, MEMORY[0x263F8EE78]);
  sub_24A5B8E28(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5;
  a2[1] = 0;
  return result;
}

unint64_t sub_24A5B8E28(unint64_t result)
{
  uint64_t v3 = v1;
  uint64_t v4 = result;
  unint64_t v5 = (unint64_t)v1[1];
  unint64_t v6 = v5 & 0x3F;
  if ((v5 & 0x3F) != 0)
  {
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    uint64_t v9 = (char *)(64 - v6);
    unint64_t v10 = *(void *)(result + 16);
    unint64_t v11 = v6 ^ 0x3F;
    if (v10 >= v11) {
      uint64_t v12 = (char *)v11;
    }
    else {
      uint64_t v12 = *(char **)(result + 16);
    }
    while ((char *)v10 != v7)
    {
      char v13 = v7 + 1;
      if (v7[result + 32]) {
        uint64_t v14 = 1 << (char)v7;
      }
      else {
        uint64_t v14 = 0;
      }
      v8 |= v14;
      unint64_t v7 = v13;
      if (v9 == v13)
      {
        uint64_t v12 = v9;
        goto LABEL_13;
      }
    }
    if (!v12) {
      return result;
    }
LABEL_13:
    unint64_t v15 = (unint64_t)&v12[v5];
    if (__CFADD__(v5, v12))
    {
LABEL_47:
      __break(1u);
    }
    else
    {
      v1[1] = (char *)v15;
      uint64_t v2 = *v1;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v1 = v2;
      if (isUniquelyReferenced_nonNull_native)
      {
LABEL_15:
        uint64_t result = sub_24A5B7E38(v8, (uint64_t)v12, v5);
        *uint64_t v3 = v2;
        goto LABEL_16;
      }
    }
    uint64_t v2 = sub_24A499D60((uint64_t)v2);
    *uint64_t v3 = v2;
    goto LABEL_15;
  }
  uint64_t v12 = 0;
  unint64_t v15 = (unint64_t)v1[1];
LABEL_16:
  unint64_t v8 = 0;
  unint64_t v5 = 0;
  uint64_t v2 = *(char **)(v4 + 16);
  int64_t v17 = v2 - v12;
  if (v2 < v12) {
    int64_t v17 = 0;
  }
  while (v12 - v2 + v8)
  {
    if (v17 == v8) {
      goto LABEL_46;
    }
    unint64_t v18 = v8 + 1;
    if (v12[v4 + 32 + v8]) {
      uint64_t v19 = 1 << v8;
    }
    else {
      uint64_t v19 = 0;
    }
    v5 |= v19;
    ++v8;
    if (v18 == 64)
    {
      uint64_t v20 = v12 + 64;
      goto LABEL_26;
    }
  }
  uint64_t v20 = *(char **)(v4 + 16);
  if (!v8) {
    return result;
  }
LABEL_26:
  uint64_t v12 = *v3;
  long long v26 = v3;
  uint64_t v27 = v4 + 32;
  uint64_t v4 = 1;
LABEL_28:
  while (2)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v12 = sub_24A499EB0(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v22 = *((void *)v12 + 2);
    unint64_t v21 = *((void *)v12 + 3);
    if (v22 >= v21 >> 1) {
      uint64_t v12 = sub_24A499EB0((char *)(v21 > 1), v22 + 1, 1, v12);
    }
    *((void *)v12 + 2) = v22 + 1;
    *(void *)&v12[8 * v22 + 32] = 0;
    uint64_t v3 = (char **)(v15 + v8);
    if (__CFADD__(v15, v8))
    {
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
      goto LABEL_47;
    }
    uint64_t result = sub_24A5B7E38(v5, v8, v15);
    unint64_t v8 = 0;
    unint64_t v5 = 0;
    long long v23 = (char *)(v2 - v20);
    if (v2 < v20) {
      long long v23 = 0;
    }
    while (v20 - v2 + v8)
    {
      if (v23 == (char *)v8)
      {
        __break(1u);
        goto LABEL_45;
      }
      unint64_t v24 = v8 + 1;
      if (v20[v27 + v8]) {
        uint64_t v25 = 1 << v8;
      }
      else {
        uint64_t v25 = 0;
      }
      v5 |= v25;
      ++v8;
      if (v24 == 64)
      {
        v20 += 64;
        unint64_t v15 = (unint64_t)v3;
        goto LABEL_28;
      }
    }
    uint64_t v20 = v2;
    unint64_t v15 = (unint64_t)v3;
    if (v8) {
      continue;
    }
    break;
  }
  *long long v26 = v12;
  v26[1] = (char *)v3;
  return result;
}

unint64_t UInt._lastSetBit.getter(unint64_t a1)
{
  return __clz(__rbit64(a1)) & 0x3F;
}

unint64_t UInt._firstSetBit.getter(unint64_t a1)
{
  unint64_t v1 = __clz(a1) ^ 0x3F;
  if (a1) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t _HashNode.insertChild(_:_:)(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  sub_24A5B9AB0(a1, a2, a3, a4);
  return swift_release();
}

uint64_t _HashNode.UnsafeHandle._makeRoomForNewItem(at:_:)(unsigned int a1, char a2, int *a3, uint64_t a4)
{
  int v8 = ~a2;
  uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)*a3);
  v9.i16[0] = vaddlv_u8(v9);
  if (*a3 == a3[1]) {
    uint64_t v10 = *a3;
  }
  else {
    uint64_t v10 = v9.u32[0];
  }
  uint64_t v11 = *(void *)(*(void *)(swift_getTupleTypeMetadata2() - 8) + 72);
  uint64_t v12 = a3[2];
  a3[3] -= v11;
  uint64_t v13 = a4 + v12 + v11 * ~v10;
  uint64_t v14 = v10 - a1;
  sub_24A5BBD00();
  int v15 = *a3;
  if (v8)
  {
    int v16 = v15 | (1 << a2);
  }
  else
  {
    int v16 = v15 + 1;
    a3[1] = v16;
  }
  *a3 = v16;
  return v13 + v11 * v14;
}

uint64_t _HashNode.insertItem(_:at:)(char *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v63 = a3;
  uint64_t v51 = a2;
  uint64_t v6 = a4[2];
  uint64_t v7 = a4[3];
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v55 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v54 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v53 = (char *)&v46 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v58 = (char *)&v46 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v57 = (char *)&v46 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v46 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  unint64_t v22 = (char *)&v46 - v21;
  long long v48 = (char *)&v46 + *(int *)(v20 + 48) - v21;
  long long v23 = v48;
  uint64_t v24 = *(void *)(v6 - 8);
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
  uint64_t v61 = v24 + 32;
  uint64_t v62 = v25;
  uint64_t v52 = (char *)&v46 - v21;
  v25((char *)&v46 - v21, a1, v6);
  uint64_t v26 = *(void *)(v7 - 8);
  uint64_t v56 = *(void (**)(char *, uint64_t, uint64_t))(v26 + 32);
  uint64_t v59 = v26 + 32;
  v56(v23, v51, v7);
  long long v50 = (int *)nullsub_1(*v60 + 16, *v60 + 32, v6, v7, a4[4]);
  uint64_t v51 = v27;
  v28.i32[0] = *v50 & ~(-1 << v63);
  uint8x8_t v29 = (uint8x8_t)vcnt_s8(v28);
  v29.i16[0] = vaddlv_u8(v29);
  unsigned int v49 = v29.i32[0];
  uint64_t v30 = &v19[*(int *)(TupleTypeMetadata2 + 48)];
  uint64_t v32 = v24 + 16;
  long long v31 = *(void (**)(void))(v24 + 16);
  ((void (*)(char *, char *, uint64_t))v31)(v19, v22, v6);
  uint64_t v33 = v31;
  uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
  uint64_t v46 = v32;
  uint64_t v47 = v34;
  v34(v30, v48, v7);
  uint64_t v35 = &v57[*(int *)(TupleTypeMetadata2 + 48)];
  v62(v57, v19, v6);
  v56(v35, (uint64_t)v30, v7);
  ++v60[1];
  uint64_t v36 = &v58[*(int *)(TupleTypeMetadata2 + 48)];
  v33();
  uint64_t v37 = v35;
  uint64_t v38 = v47;
  v47(v36, v37, v7);
  uint64_t v63 = _HashNode.UnsafeHandle._makeRoomForNewItem(at:_:)(v49, v63, v50, v51);
  uint64_t v39 = v53;
  uint64_t v40 = &v53[*(int *)(TupleTypeMetadata2 + 48)];
  uint64_t v41 = v58;
  ((void (*)(char *, char *, uint64_t))v33)(v53, v58, v6);
  v38(v40, v36, v7);
  uint64_t v42 = (uint64_t)v54;
  uint64_t v43 = &v54[*(int *)(TupleTypeMetadata2 + 48)];
  v62(v54, v39, v6);
  v56(v43, (uint64_t)v40, v7);
  sub_24A544CAC(v42, v63, TupleTypeMetadata2);
  uint64_t v44 = *(void (**)(char *, uint64_t))(v55 + 8);
  v44(v57, TupleTypeMetadata2);
  v44(v41, TupleTypeMetadata2);
  return ((uint64_t (*)(char *, uint64_t))v44)(v52, TupleTypeMetadata2);
}

uint64_t _HashNode.UnsafeHandle._insertChild(_:at:)(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  *(_DWORD *)(a4 + 12) -= 16;
  uint64_t v7 = a5 + 16 * a3;
  uint64_t v8 = type metadata accessor for _HashNode();
  sub_24A5BBD00();
  v10[0] = a1;
  v10[1] = a2;
  return sub_24A544CAC((uint64_t)v10, v7, v8);
}

uint64_t _HashNode.insertItem(_:at:_:)(char *a1, void (*a2)(char *, char *, uint64_t), unsigned int a3, int a4, uint64_t a5)
{
  unsigned int v45 = a3;
  LODWORD(v46) = a4;
  uint64_t v39 = a2;
  uint64_t v43 = a5;
  uint64_t v6 = *(void *)(a5 + 16);
  uint64_t v7 = *(void *)(a5 + 24);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v47 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v44 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v42 = (char *)&v35 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v35 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v35 - v17;
  uint64_t v35 = (char *)&v35 + *(int *)(v16 + 48) - v17;
  uint64_t v19 = v35;
  uint64_t v20 = *(void *)(v6 - 8);
  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
  uint64_t v40 = v20 + 32;
  uint64_t v41 = v21;
  uint64_t v38 = (char *)&v35 - v17;
  v21((char *)&v35 - v17, a1, v6);
  uint64_t v22 = *(void *)(v7 - 8);
  uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v22 + 32);
  v37(v19, (char *)v39, v7);
  long long v23 = v36;
  ++v36[1];
  uint64_t v24 = *(int *)(TupleTypeMetadata2 + 48);
  long long v48 = v15;
  uint64_t v25 = &v15[v24];
  uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
  v39(v15, v18, v6);
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
  v26(v25, v35, v7);
  uint64_t v27 = (int *)nullsub_1(*v23 + 16, *v23 + 32, v6, v7, *(void *)(v43 + 32));
  uint64_t v46 = _HashNode.UnsafeHandle._makeRoomForNewItem(at:_:)(v45, v46, v27, v28);
  uint8x8_t v29 = v42;
  uint64_t v30 = &v42[*(int *)(TupleTypeMetadata2 + 48)];
  v39(v42, v48, v6);
  v26(v30, v25, v7);
  uint64_t v31 = (uint64_t)v44;
  uint64_t v32 = &v44[*(int *)(TupleTypeMetadata2 + 48)];
  v41(v44, v29, v6);
  v37(v32, v30, v7);
  sub_24A544CAC(v31, v46, TupleTypeMetadata2);
  uint64_t v33 = *(void (**)(char *, uint64_t))(v47 + 8);
  v33(v38, TupleTypeMetadata2);
  return ((uint64_t (*)(char *, uint64_t))v33)(v48, TupleTypeMetadata2);
}

uint64_t sub_24A5B9AB0(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v7 = *v4;
  v4[1] += a2;
  uint64_t v8 = nullsub_1(v7 + 16, v7 + 32, a4[2], a4[3], a4[4]);
  uint64_t v10 = v9;
  int v11 = 1 << a3;
  v12.i32[0] = *(_DWORD *)(v8 + 4) & ((1 << a3) - 1);
  uint8x8_t v13 = (uint8x8_t)vcnt_s8(v12);
  v13.i16[0] = vaddlv_u8(v13);
  unsigned int v14 = v13.i32[0];
  uint64_t v15 = swift_retain();
  uint64_t result = _HashNode.UnsafeHandle._insertChild(_:at:)(v15, a2, v14, v8, v10);
  *(_DWORD *)(v8 + 4) |= v11;
  return result;
}

unsigned char *BitSet.formIntersection(_:)(int8x16_t *a1)
{
  unint64_t v3 = a1[1].u64[0];
  uint64_t v4 = (char *)*v1;
  unint64_t v5 = *(void *)(*v1 + 16);
  if (v5 > v3)
  {
    sub_24A5B9CB0(v5 - v3);
    uint64_t v4 = (char *)*v1;
  }
  char v20 = 1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v4 = sub_24A499D60((uint64_t)v4);
  }
  unint64_t v6 = *((void *)v4 + 2);
  if (v3 < v6) {
    unint64_t v6 = v3;
  }
  if (v6)
  {
    if (v6 < 6 || ((uint64_t v7 = 8 * v6 + 32, v4 + 32 < &a1->i8[v7]) ? (v8 = &a1[2] >= (int8x16_t *)&v4[v7]) : (v8 = 1), !v8))
    {
      uint64_t v9 = 0;
LABEL_19:
      unint64_t v14 = v6 - v9;
      uint64_t v15 = 8 * v9 + 32;
      uint64_t v16 = &v4[v15];
      uint64_t v17 = (uint64_t *)((char *)a1->i64 + v15);
      do
      {
        uint64_t v18 = *v17++;
        *(void *)v16 &= v18;
        v16 += 8;
        --v14;
      }
      while (v14);
      goto LABEL_21;
    }
    uint64_t v9 = v6 & 0x7FFFFFFFFFFFFFFCLL;
    uint64_t v10 = a1 + 3;
    int v11 = (int8x16_t *)(v4 + 48);
    uint64_t v12 = v6 & 0x7FFFFFFFFFFFFFFCLL;
    do
    {
      int8x16_t v13 = vandq_s8(*v11, *v10);
      v11[-1] = vandq_s8(v11[-1], v10[-1]);
      *int v11 = v13;
      v10 += 2;
      v11 += 2;
      v12 -= 4;
    }
    while (v12);
    if (v6 != v9) {
      goto LABEL_19;
    }
  }
LABEL_21:
  *unint64_t v1 = (uint64_t)v4;
  return sub_24A54A3A0(&v20, v1);
}

unint64_t sub_24A5B9CB0(unint64_t result)
{
  if (result)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      unint64_t v2 = *(void *)(*(void *)v1 + 16);
      BOOL v3 = v2 >= result;
      uint64_t result = v2 - result;
      if (v3) {
        return sub_24A52AC38(result, v2);
      }
    }
    __break(1u);
  }
  return result;
}

unsigned char *BitSet.formIntersection(_:)(uint64_t a1, uint64_t a2)
{
  if (a2 <= 0) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = a1 & ~(a1 >> 63);
  }
  unint64_t v5 = a2 & ~(a2 >> 63);
  if (v4 == v5)
  {
    uint64_t result = (unsigned char *)swift_bridgeObjectRelease();
    uint64_t *v2 = MEMORY[0x263F8EE78];
    return result;
  }
  if (v4 >= v5)
  {
    __break(1u);
  }
  else
  {
    BOOL v3 = (char *)*v2;
    int64_t v7 = *(void *)(*v2 + 16) + ~((v5 - 1) >> 6);
    if (v7 >= 1)
    {
      sub_24A5B9CB0(v7);
      BOOL v3 = (char *)*v2;
    }
    char v8 = 1;
    if (swift_isUniquelyReferenced_nonNull_native()) {
      goto LABEL_10;
    }
  }
  BOOL v3 = sub_24A499D60((uint64_t)v3);
LABEL_10:
  _UnsafeBitSet.formIntersection(_:)(v4, v5);
  uint64_t *v2 = (uint64_t)v3;
  return sub_24A54A3A0(&v8, v2);
}

uint64_t BitSet.formIntersection<A>(_:)(uint64_t a1, ValueMetadata *a2)
{
  Description = (void (**)(char *, void, ValueMetadata *))a2[-1].Description;
  MEMORY[0x270FA5388](a1);
  unint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26979AEC0);
  Description[2](v6, a1, a2);
  if ((ValueMetadata *)v7 == a2)
  {
    swift_dynamicCast();
    BitSet.formIntersection(_:)(v10[0], v10[1]);
  }
  else
  {
    char v8 = (int8x16_t *)BitSet.init<A>(_validMembersOf:)((uint64_t)v6, a2);
    BitSet.formIntersection(_:)(v8);
    swift_bridgeObjectRelease();
  }
  return ((uint64_t (*)(uint64_t, ValueMetadata *))Description[1])(a1, a2);
}

uint64_t TreeDictionary.merge<A>(_:uniquingKeysWith:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_24A5BA2D8(a1, a2, a3, a4, a5, a6, (void (*)(void))sub_24A5BA7B4);
}

{
  return sub_24A5BA2D8(a1, a2, a3, a4, a5, a6, (void (*)(void))sub_24A5BAEA4);
}

uint64_t *TreeDictionary.merge(_:uniquingKeysWith:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, char *), void (*a5)(uint64_t, uint64_t, uint64_t))
{
  ++*(void *)(v5 + 16);
  uint64_t v10 = (void *)type metadata accessor for _HashNode();
  return _HashNode.merge(_:_:_:)(0, a1, a2, a4, a5, v10);
}

uint64_t sub_24A5B9FB8(uint64_t a1, void (*a2)(char *, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v23 = a3;
  uint64_t v24 = a2;
  uint64_t v9 = sub_24A5BBD20();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  int8x16_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v23 - v15;
  uint64_t v17 = *(void *)(a6 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v16, a1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v16, 1, a6) == 1)
  {
    char v20 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v20(a1, v9);
    v20((uint64_t)v16, v9);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(a1, a4, a6);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v17 + 56))(a1, 0, 1, a6);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v16, a6);
    uint64_t v22 = v25;
    v24(v19, a4);
    if (v22)
    {
      return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, a6);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
      (*(void (**)(char *, uint64_t))(v17 + 8))(v19, a6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v13, 0, 1, a6);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a1, v13, v9);
    }
  }
}

uint64_t sub_24A5BA2D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(void))
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a5 - 8) + 8))(a1, a5);
}

uint64_t sub_24A5BA344@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v28 = a4;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v9 = TupleTypeMetadata2 - 8;
  uint64_t v10 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v31 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  int8x16_t v13 = (char *)&v24 - v12;
  uint64_t v30 = a4 + *(int *)(swift_getTupleTypeMetadata2() + 48);
  uint64_t v14 = *(int *)(v9 + 56);
  uint64_t v15 = &v13[v14];
  uint8x8_t v29 = &v13[v14];
  uint64_t v16 = a1 + v14;
  uint64_t v25 = a1 + v14;
  uint64_t v17 = *(void *)(a2 - 8);
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  uint64_t v27 = a1;
  v26(v13, a1, a2);
  uint64_t v18 = *(void *)(a3 - 8);
  uint64_t v19 = *(void (**)(char *, uint64_t))(v18 + 16);
  v19(v15, v16);
  (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(v28, v13, a2);
  uint64_t v20 = *(int *)(v9 + 56);
  uint64_t v21 = v31;
  uint64_t v22 = &v31[v20];
  v26(v31, v27, a2);
  ((void (*)(char *, uint64_t, uint64_t))v19)(v22, v25, a3);
  (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(v30, v22, a3);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v21, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v29, a3);
}

uint64_t TreeDictionary.merging(_:uniquingKeysWith:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, char *), void (*a5)(uint64_t, uint64_t, uint64_t), uint64_t a6)
{
  type metadata accessor for TreeDictionary();
  swift_retain();
  TreeDictionary.merge(_:uniquingKeysWith:)(a1, a2, v11, a4, a5);
  uint64_t result = a6;
  if (v6) {
    return swift_release();
  }
  return result;
}

uint64_t TreeDictionary.merging<A>(_:uniquingKeysWith:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return sub_24A5BA6C4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A5BA7B4);
}

{
  return sub_24A5BA6C4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A5BAEA4);
}

uint64_t sub_24A5BA6C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void (*a12)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v13 = v12;
  uint64_t v17 = type metadata accessor for TreeDictionary();
  swift_retain();
  a12(a1, a2, a3, v17, a9, a11);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a9 - 8) + 8))(a1, a9);
  uint64_t result = a4;
  if (v13) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24A5BA7B4(char *a1, void (*a2)(char *, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  long long v67 = a1;
  uint64_t v68 = a6;
  uint64_t v61 = a2;
  uint64_t v62 = a3;
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(a4 + 24);
  uint64_t updated = type metadata accessor for _HashNode.ValueUpdateState();
  uint64_t v60 = *(void (***)(char *, uint64_t))(updated - 8);
  uint64_t v10 = MEMORY[0x270FA5388](updated);
  uint64_t v12 = (char *)&v48 - v11;
  uint64_t v48 = *(void *)(v8 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  long long v72 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = *(void *)(v7 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  long long v71 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v64 = (char *)&v48 - v17;
  uint64_t v49 = v7;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v18 = sub_24A5BBD20();
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v21 = (char *)&v48 - v20;
  uint64_t v22 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v24 = (char *)&v48 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = v25;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v50 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v28 = (char *)&v48 - v27;
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v24, v67, v26);
  uint8x8_t v29 = v21;
  sub_24A5BB840();
  uint64_t v63 = v26;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  long long v67 = v28;
  uint64_t v31 = AssociatedConformanceWitness;
  sub_24A5BBEE0();
  uint64_t v32 = TupleTypeMetadata2;
  uint64_t v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 48);
  uint64_t v34 = *(void *)(TupleTypeMetadata2 - 8) + 48;
  if (v33(v29, 1, TupleTypeMetadata2) == 1) {
    return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v67, AssociatedTypeWitness);
  }
  uint64_t v51 = v34;
  uint64_t v52 = v33;
  uint64_t v35 = v64;
  uint64_t v57 = *(void (**)(char *, char *, uint64_t))(v65 + 32);
  uint64_t v55 = (void (**)(char *, char *, uint64_t))(v65 + 16);
  uint64_t v56 = (void (**)(char *, char *, uint64_t))(v48 + 32);
  uint64_t v58 = (void (**)(uint64_t, uint64_t))(v60 + 1);
  uint64_t v59 = (void (**)(char *, uint64_t))(v65 + 8);
  uint64_t v60 = (void (**)(char *, uint64_t))(v48 + 8);
  uint64_t v36 = v49;
  v65 += 32;
  uint64_t v53 = v31;
  uint64_t v54 = updated;
  while (1)
  {
    uint64_t v37 = &v29[*(int *)(v32 + 48)];
    v57(v35, v29, v36);
    uint64_t v38 = (uint64_t)v72;
    (*v56)(v72, v37, v8);
    uint64_t v39 = (uint64_t)v12;
    uint64_t v40 = (uint64_t)v71;
    (*v55)(v71, v35, v36);
    ++*(void *)(v70 + 16);
    uint64_t v41 = sub_24A5B85E4();
    uint64_t v42 = (void *)type metadata accessor for _HashNode();
    _HashNode.prepareValueUpdate(_:_:)(v40, v41, v42, v39);
    uint64_t v43 = v54;
    uint64_t v44 = v73;
    sub_24A5B9FB8(v39 + *(int *)(v54 + 44), v61, v62, v38, v36, v8);
    uint64_t v73 = v44;
    if (v44) {
      break;
    }
    sub_24A4D95AC(v70, v39);
    (*v58)(v39, v43);
    uint64_t v12 = (char *)v39;
    unsigned int v45 = *v59;
    (*v59)(v71, v36);
    uint64_t v35 = v64;
    v45(v64, v36);
    (*v60)(v72, v8);
    sub_24A5BBEE0();
    uint64_t v32 = TupleTypeMetadata2;
    if (v52(v29, 1, TupleTypeMetadata2) == 1) {
      return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v67, AssociatedTypeWitness);
    }
  }
  sub_24A4D95AC(v70, v39);
  (*v58)(v39, v43);
  uint64_t v47 = *v59;
  (*v59)(v71, v36);
  v47(v64, v36);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v67, AssociatedTypeWitness);
  return ((uint64_t (*)(char *, uint64_t))*v60)(v72, v8);
}

uint64_t sub_24A5BAEA4(uint64_t a1, void (*a2)(char *, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v27 = a3;
  uint64_t v26 = a2;
  uint64_t v9 = sub_24A5BC080();
  uint64_t v24 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v21 - v10;
  uint64_t v12 = *(void *)(a4 + 24);
  uint64_t v21 = *(void *)(a4 + 16);
  uint64_t v22 = a4;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v13 = sub_24A5BC270();
  uint64_t v25 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v21 - v14;
  MEMORY[0x24C5C6BF0](a5, a6);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v21;
  v16[3] = v12;
  uint64_t v17 = v22;
  uint64_t v18 = *(void *)(v22 + 32);
  v16[4] = a5;
  v16[5] = v18;
  v16[6] = a6;
  swift_getWitnessTable();
  sub_24A5BC390();
  swift_release();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v9);
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_24A5BA7B4(v15, v26, v27, v17, v13, WitnessTable);
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v15, v13);
}

uint64_t sub_24A5BB130()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24A5BB140@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24A5BA344(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t Deque.customMirror.getter(uint64_t a1)
{
  uint64_t v2 = sub_24A5BC6B0();
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26979AE30);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = a1;
  v12[1] = a1;
  uint64_t v8 = *MEMORY[0x263F8E7E8];
  uint64_t v9 = sub_24A5BC6A0();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 104))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  type metadata accessor for Deque();
  swift_getWitnessTable();
  sub_24A4D1B3C((uint64_t)v4);
  swift_retain_n();
  return sub_24A5BC6C0();
}

uint64_t sub_24A5BB320()
{
  return Deque.customMirror.getter(*v0);
}

uint64_t sub_24A5BB330()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_24A5BB340()
{
  return MEMORY[0x270F9D0E8]();
}

uint64_t sub_24A5BB350()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_24A5BB360()
{
  return MEMORY[0x270F9D310]();
}

uint64_t sub_24A5BB370()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24A5BB380()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24A5BB390()
{
  return MEMORY[0x270F9D410]();
}

uint64_t sub_24A5BB3A0()
{
  return MEMORY[0x270F9D428]();
}

uint64_t sub_24A5BB3B0()
{
  return MEMORY[0x270F9D430]();
}

uint64_t sub_24A5BB3C0()
{
  return MEMORY[0x270F9D438]();
}

uint64_t sub_24A5BB3D0()
{
  return MEMORY[0x270F9D440]();
}

uint64_t sub_24A5BB3E0()
{
  return MEMORY[0x270F9D448]();
}

uint64_t sub_24A5BB3F0()
{
  return MEMORY[0x270F9D458]();
}

uint64_t sub_24A5BB400()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_24A5BB410()
{
  return MEMORY[0x270F9D480]();
}

uint64_t sub_24A5BB420()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_24A5BB430()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_24A5BB440()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_24A5BB450()
{
  return MEMORY[0x270F9D4A0]();
}

uint64_t sub_24A5BB460()
{
  return MEMORY[0x270F9D4A8]();
}

uint64_t sub_24A5BB470()
{
  return MEMORY[0x270F9D4B0]();
}

uint64_t sub_24A5BB480()
{
  return MEMORY[0x270F9D4B8]();
}

uint64_t sub_24A5BB490()
{
  return MEMORY[0x270F9D4C8]();
}

uint64_t sub_24A5BB4A0()
{
  return MEMORY[0x270F9D4D0]();
}

uint64_t sub_24A5BB4B0()
{
  return MEMORY[0x270F9D4D8]();
}

uint64_t sub_24A5BB4C0()
{
  return MEMORY[0x270F9D4E8]();
}

uint64_t sub_24A5BB4D0()
{
  return MEMORY[0x270F9D4F8]();
}

uint64_t sub_24A5BB4E0()
{
  return MEMORY[0x270F9D500]();
}

uint64_t sub_24A5BB4F0()
{
  return MEMORY[0x270F9D508]();
}

uint64_t sub_24A5BB500()
{
  return MEMORY[0x270F9D510]();
}

uint64_t sub_24A5BB510()
{
  return MEMORY[0x270F9D518]();
}

uint64_t sub_24A5BB520()
{
  return MEMORY[0x270F9D550]();
}

uint64_t sub_24A5BB530()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24A5BB540()
{
  return MEMORY[0x270F9D5A0]();
}

uint64_t sub_24A5BB550()
{
  return MEMORY[0x270F9D5A8]();
}

uint64_t sub_24A5BB560()
{
  return MEMORY[0x270F9D5B0]();
}

uint64_t sub_24A5BB570()
{
  return MEMORY[0x270F9D5B8]();
}

uint64_t sub_24A5BB580()
{
  return MEMORY[0x270F9D5C0]();
}

uint64_t sub_24A5BB590()
{
  return MEMORY[0x270F9D5D0]();
}

uint64_t sub_24A5BB5A0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_24A5BB5B0()
{
  return MEMORY[0x270F9D668]();
}

uint64_t sub_24A5BB5C0()
{
  return MEMORY[0x270F9D670]();
}

uint64_t sub_24A5BB5D0()
{
  return MEMORY[0x270F9D678]();
}

uint64_t sub_24A5BB5E0()
{
  return MEMORY[0x270F9D680]();
}

uint64_t sub_24A5BB5F0()
{
  return MEMORY[0x270F9D688]();
}

uint64_t sub_24A5BB600()
{
  return MEMORY[0x270F9D690]();
}

uint64_t sub_24A5BB610()
{
  return MEMORY[0x270F9D698]();
}

uint64_t sub_24A5BB630()
{
  return MEMORY[0x270F9D6A8]();
}

uint64_t sub_24A5BB640()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_24A5BB650()
{
  return MEMORY[0x270F9D6E0]();
}

uint64_t sub_24A5BB660()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_24A5BB670()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_24A5BB680()
{
  return MEMORY[0x270F9D750]();
}

uint64_t sub_24A5BB690()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_24A5BB6A0()
{
  return MEMORY[0x270F9D768]();
}

uint64_t sub_24A5BB6B0()
{
  return MEMORY[0x270F9D770]();
}

uint64_t sub_24A5BB6C0()
{
  return MEMORY[0x270F9D780]();
}

uint64_t sub_24A5BB6D0()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_24A5BB6E0()
{
  return MEMORY[0x270F9D790]();
}

uint64_t sub_24A5BB6F0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24A5BB700()
{
  return MEMORY[0x270F9D7A8]();
}

uint64_t sub_24A5BB710()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24A5BB720()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_24A5BB730()
{
  return MEMORY[0x270F9D7F8]();
}

uint64_t sub_24A5BB740()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_24A5BB750()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_24A5BB760()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_24A5BB770()
{
  return MEMORY[0x270F9D820]();
}

uint64_t sub_24A5BB780()
{
  return MEMORY[0x270F9D838]();
}

uint64_t sub_24A5BB790()
{
  return MEMORY[0x270F9D848]();
}

uint64_t sub_24A5BB7A0()
{
  return MEMORY[0x270F9D858]();
}

uint64_t sub_24A5BB7B0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_24A5BB7C0()
{
  return MEMORY[0x270F9D868]();
}

uint64_t sub_24A5BB7D0()
{
  return MEMORY[0x270F9D898]();
}

uint64_t sub_24A5BB7E0()
{
  return MEMORY[0x270F9D8A0]();
}

uint64_t sub_24A5BB7F0()
{
  return MEMORY[0x270F9D8A8]();
}

uint64_t sub_24A5BB800()
{
  return MEMORY[0x270F9D8C8]();
}

uint64_t sub_24A5BB810()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_24A5BB820()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_24A5BB830()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_24A5BB840()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_24A5BB850()
{
  return MEMORY[0x270F9D900]();
}

uint64_t sub_24A5BB860()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_24A5BB870()
{
  return MEMORY[0x270F9D918]();
}

uint64_t sub_24A5BB880()
{
  return MEMORY[0x270F9D920]();
}

uint64_t sub_24A5BB890()
{
  return MEMORY[0x270F9D930]();
}

uint64_t sub_24A5BB8A0()
{
  return MEMORY[0x270F9D948]();
}

uint64_t sub_24A5BB8B0()
{
  return MEMORY[0x270F9D950]();
}

uint64_t sub_24A5BB8C0()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_24A5BB8D0()
{
  return MEMORY[0x270F9D980]();
}

uint64_t sub_24A5BB8E0()
{
  return MEMORY[0x270F9D9A0]();
}

uint64_t sub_24A5BB8F0()
{
  return MEMORY[0x270F9D9B0]();
}

uint64_t sub_24A5BB900()
{
  return MEMORY[0x270F9D9D8]();
}

uint64_t sub_24A5BB910()
{
  return MEMORY[0x270F9DA08]();
}

uint64_t sub_24A5BB920()
{
  return MEMORY[0x270F9DA18]();
}

uint64_t sub_24A5BB930()
{
  return MEMORY[0x270F9DA60]();
}

uint64_t sub_24A5BB940()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_24A5BB950()
{
  return MEMORY[0x270F9DBE0]();
}

uint64_t sub_24A5BB960()
{
  return MEMORY[0x270F9DC08]();
}

uint64_t sub_24A5BB970()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_24A5BB980()
{
  return MEMORY[0x270F9DC18]();
}

uint64_t sub_24A5BB990()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24A5BB9A0()
{
  return MEMORY[0x270F9DC28]();
}

uint64_t sub_24A5BB9B0()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_24A5BB9C0()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_24A5BB9D0()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_24A5BB9E0()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_24A5BB9F0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24A5BBA00()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_24A5BBA10()
{
  return MEMORY[0x270F9DD20]();
}

uint64_t sub_24A5BBA20()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_24A5BBA30()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_24A5BBA40()
{
  return MEMORY[0x270F9DF38]();
}

uint64_t sub_24A5BBA50()
{
  return MEMORY[0x270F9DF70]();
}

uint64_t sub_24A5BBA60()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_24A5BBA70()
{
  return MEMORY[0x270F9DF90]();
}

uint64_t sub_24A5BBA80()
{
  return MEMORY[0x270F9DFA0]();
}

uint64_t sub_24A5BBA90()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_24A5BBAA0()
{
  return MEMORY[0x270F9E040]();
}

uint64_t sub_24A5BBAB0()
{
  return MEMORY[0x270F9E048]();
}

uint64_t sub_24A5BBAC0()
{
  return MEMORY[0x270F9E070]();
}

uint64_t sub_24A5BBAD0()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_24A5BBAE0()
{
  return MEMORY[0x270F9E090]();
}

uint64_t sub_24A5BBAF0()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_24A5BBB00()
{
  return MEMORY[0x270F9E0A8]();
}

uint64_t sub_24A5BBB10()
{
  return MEMORY[0x270F9E0B8]();
}

uint64_t sub_24A5BBB20()
{
  return MEMORY[0x270F9E0C0]();
}

uint64_t sub_24A5BBB30()
{
  return MEMORY[0x270F9E0C8]();
}

uint64_t sub_24A5BBB40()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_24A5BBB50()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_24A5BBB60()
{
  return MEMORY[0x270F9E0F0]();
}

uint64_t sub_24A5BBB90()
{
  return MEMORY[0x270F9E138]();
}

uint64_t sub_24A5BBBA0()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_24A5BBBB0()
{
  return MEMORY[0x270F9E168]();
}

uint64_t sub_24A5BBBC0()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_24A5BBBD0()
{
  return MEMORY[0x270F9E190]();
}

uint64_t sub_24A5BBBE0()
{
  return MEMORY[0x270F9E1A8]();
}

uint64_t sub_24A5BBBF0()
{
  return MEMORY[0x270F9E1B8]();
}

uint64_t sub_24A5BBC00()
{
  return MEMORY[0x270F9E1C0]();
}

uint64_t sub_24A5BBC10()
{
  return MEMORY[0x270F9E1D0]();
}

uint64_t sub_24A5BBC20()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_24A5BBC30()
{
  return MEMORY[0x270F9E218]();
}

uint64_t sub_24A5BBC40()
{
  return MEMORY[0x270F9E248]();
}

uint64_t sub_24A5BBC50()
{
  return MEMORY[0x270F9E250]();
}

uint64_t sub_24A5BBC60()
{
  return MEMORY[0x270F9E2B8]();
}

uint64_t sub_24A5BBC70()
{
  return MEMORY[0x270F9E2D8]();
}

uint64_t sub_24A5BBC80()
{
  return MEMORY[0x270F9E2E0]();
}

uint64_t sub_24A5BBC90()
{
  return MEMORY[0x270F9E2E8]();
}

uint64_t sub_24A5BBCA0()
{
  return MEMORY[0x270F9E2F0]();
}

uint64_t sub_24A5BBCB0()
{
  return MEMORY[0x270F9E2F8]();
}

uint64_t sub_24A5BBCC0()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_24A5BBCD0()
{
  return MEMORY[0x270F9E360]();
}

uint64_t sub_24A5BBCE0()
{
  return MEMORY[0x270F9E368]();
}

uint64_t sub_24A5BBCF0()
{
  return MEMORY[0x270F9E378]();
}

uint64_t sub_24A5BBD00()
{
  return MEMORY[0x270F9E380]();
}

uint64_t sub_24A5BBD10()
{
  return MEMORY[0x270F9E388]();
}

uint64_t sub_24A5BBD20()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24A5BBD30()
{
  return MEMORY[0x270F9E400]();
}

uint64_t sub_24A5BBD40()
{
  return MEMORY[0x270F9E408]();
}

uint64_t sub_24A5BBD50()
{
  return MEMORY[0x270F9E418]();
}

uint64_t sub_24A5BBD60()
{
  return MEMORY[0x270F9E420]();
}

uint64_t sub_24A5BBD70()
{
  return MEMORY[0x270F9E428]();
}

uint64_t sub_24A5BBD80()
{
  return MEMORY[0x270F9E438]();
}

uint64_t sub_24A5BBD90()
{
  return MEMORY[0x270F9E440]();
}

uint64_t sub_24A5BBDA0()
{
  return MEMORY[0x270F9E448]();
}

uint64_t sub_24A5BBDB0()
{
  return MEMORY[0x270F9E450]();
}

uint64_t sub_24A5BBDC0()
{
  return MEMORY[0x270F9E458]();
}

uint64_t sub_24A5BBDD0()
{
  return MEMORY[0x270F9E460]();
}

uint64_t sub_24A5BBDE0()
{
  return MEMORY[0x270F9E480]();
}

uint64_t sub_24A5BBDF0()
{
  return MEMORY[0x270F9E488]();
}

uint64_t sub_24A5BBE00()
{
  return MEMORY[0x270F9E490]();
}

uint64_t sub_24A5BBE10()
{
  return MEMORY[0x270F9E498]();
}

uint64_t sub_24A5BBE20()
{
  return MEMORY[0x270F9E4A0]();
}

uint64_t sub_24A5BBE30()
{
  return MEMORY[0x270F9E4A8]();
}

uint64_t sub_24A5BBE40()
{
  return MEMORY[0x270F9E4B0]();
}

uint64_t sub_24A5BBE50()
{
  return MEMORY[0x270F9E4B8]();
}

uint64_t sub_24A5BBE60()
{
  return MEMORY[0x270F9E4C0]();
}

uint64_t sub_24A5BBE70()
{
  return MEMORY[0x270F9E4D0]();
}

uint64_t sub_24A5BBE80()
{
  return MEMORY[0x270F9E4D8]();
}

uint64_t sub_24A5BBE90()
{
  return MEMORY[0x270F9E4E8]();
}

uint64_t sub_24A5BBEA0()
{
  return MEMORY[0x270F9E4F0]();
}

uint64_t sub_24A5BBEB0()
{
  return MEMORY[0x270F9E4F8]();
}

uint64_t sub_24A5BBEC0()
{
  return MEMORY[0x270F9E508]();
}

uint64_t sub_24A5BBED0()
{
  return MEMORY[0x270F9E510]();
}

uint64_t sub_24A5BBEE0()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_24A5BBEF0()
{
  return MEMORY[0x270F9E5B8]();
}

uint64_t sub_24A5BBF00()
{
  return MEMORY[0x270F9E5C0]();
}

uint64_t sub_24A5BBF10()
{
  return MEMORY[0x270F9E608]();
}

uint64_t sub_24A5BBF20()
{
  return MEMORY[0x270F9E610]();
}

uint64_t sub_24A5BBF30()
{
  return MEMORY[0x270F9E628]();
}

uint64_t sub_24A5BBF40()
{
  return MEMORY[0x270F9E630]();
}

uint64_t sub_24A5BBF50()
{
  return MEMORY[0x270F9E640]();
}

uint64_t sub_24A5BBF60()
{
  return MEMORY[0x270F9E648]();
}

uint64_t sub_24A5BBF70()
{
  return MEMORY[0x270F9E650]();
}

uint64_t sub_24A5BBF90()
{
  return MEMORY[0x270F9E6C0]();
}

uint64_t sub_24A5BBFA0()
{
  return MEMORY[0x270F9E6D8]();
}

uint64_t sub_24A5BBFB0()
{
  return MEMORY[0x270F9E6E0]();
}

uint64_t sub_24A5BBFC0()
{
  return MEMORY[0x270F9E6F0]();
}

uint64_t sub_24A5BBFD0()
{
  return MEMORY[0x270F9E700]();
}

uint64_t sub_24A5BBFE0()
{
  return MEMORY[0x270F9E708]();
}

uint64_t sub_24A5BBFF0()
{
  return MEMORY[0x270F9E720]();
}

uint64_t sub_24A5BC000()
{
  return MEMORY[0x270F9E7C0]();
}

uint64_t sub_24A5BC010()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_24A5BC020()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_24A5BC030()
{
  return MEMORY[0x270F9E8A8]();
}

uint64_t sub_24A5BC040()
{
  return MEMORY[0x270F9E980]();
}

uint64_t sub_24A5BC060()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_24A5BC070()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24A5BC080()
{
  return MEMORY[0x270F9E9E0]();
}

uint64_t sub_24A5BC090()
{
  return MEMORY[0x270F9EA20]();
}

uint64_t sub_24A5BC0A0()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_24A5BC0B0()
{
  return MEMORY[0x270F9EA70]();
}

uint64_t sub_24A5BC0C0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24A5BC0D0()
{
  return MEMORY[0x270F9EA90]();
}

uint64_t sub_24A5BC0E0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24A5BC0F0()
{
  return MEMORY[0x270F9EAD0]();
}

uint64_t sub_24A5BC100()
{
  return MEMORY[0x270F9EAD8]();
}

uint64_t sub_24A5BC110()
{
  return MEMORY[0x270F9EAE8]();
}

uint64_t sub_24A5BC120()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24A5BC130()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_24A5BC140()
{
  return MEMORY[0x270F9EBA0]();
}

uint64_t sub_24A5BC150()
{
  return MEMORY[0x270F9EBA8]();
}

uint64_t sub_24A5BC170()
{
  return MEMORY[0x270F9EBC8]();
}

uint64_t sub_24A5BC180()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_24A5BC190()
{
  return MEMORY[0x270F9EBF0]();
}

uint64_t sub_24A5BC1A0()
{
  return MEMORY[0x270F9EBF8]();
}

uint64_t _s19CollectionsInternal4HeapV5countSivg_0()
{
  return MEMORY[0x270F9EC18]();
}

uint64_t sub_24A5BC1C0()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_24A5BC1D0()
{
  return MEMORY[0x270F9EC50]();
}

uint64_t sub_24A5BC1E0()
{
  return MEMORY[0x270F9EC58]();
}

uint64_t sub_24A5BC1F0()
{
  return MEMORY[0x270F9EC78]();
}

uint64_t sub_24A5BC200()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_24A5BC210()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_24A5BC230()
{
  return MEMORY[0x270F9ECA0]();
}

uint64_t sub_24A5BC240()
{
  return MEMORY[0x270F9ECA8]();
}

uint64_t sub_24A5BC250()
{
  return MEMORY[0x270F9ECB0]();
}

uint64_t sub_24A5BC260()
{
  return MEMORY[0x270F9ECB8]();
}

uint64_t sub_24A5BC270()
{
  return MEMORY[0x270F9ED00]();
}

uint64_t sub_24A5BC280()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24A5BC290()
{
  return MEMORY[0x270F9EDA8]();
}

uint64_t sub_24A5BC2A0()
{
  return MEMORY[0x270F9EDB0]();
}

uint64_t sub_24A5BC2B0()
{
  return MEMORY[0x270F9EDC0]();
}

uint64_t sub_24A5BC2C0()
{
  return MEMORY[0x270F9EDC8]();
}

uint64_t sub_24A5BC2D0()
{
  return MEMORY[0x270F9EDD0]();
}

uint64_t sub_24A5BC2E0()
{
  return MEMORY[0x270F9EE10]();
}

uint64_t sub_24A5BC2F0()
{
  return MEMORY[0x270F9EE38]();
}

uint64_t sub_24A5BC300()
{
  return MEMORY[0x270F9EE40]();
}

uint64_t sub_24A5BC310()
{
  return MEMORY[0x270F9EE58]();
}

uint64_t sub_24A5BC320()
{
  return MEMORY[0x270F9EE60]();
}

uint64_t sub_24A5BC330()
{
  return MEMORY[0x270F9EE90]();
}

uint64_t sub_24A5BC340()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24A5BC350()
{
  return MEMORY[0x270F9F030]();
}

uint64_t sub_24A5BC360()
{
  return MEMORY[0x270F9F108]();
}

uint64_t sub_24A5BC370()
{
  return MEMORY[0x270F9F118]();
}

uint64_t sub_24A5BC380()
{
  return MEMORY[0x270F9F128]();
}

uint64_t sub_24A5BC390()
{
  return MEMORY[0x270F9F148]();
}

uint64_t sub_24A5BC3A0()
{
  return MEMORY[0x270F9F178]();
}

uint64_t sub_24A5BC3B0()
{
  return MEMORY[0x270F9F180]();
}

uint64_t sub_24A5BC3C0()
{
  return MEMORY[0x270F9F188]();
}

uint64_t sub_24A5BC3D0()
{
  return MEMORY[0x270F9F238]();
}

uint64_t sub_24A5BC3E0()
{
  return MEMORY[0x270F9F240]();
}

uint64_t sub_24A5BC3F0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24A5BC400()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24A5BC410()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24A5BC420()
{
  return MEMORY[0x270F9F4D8]();
}

uint64_t sub_24A5BC430()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24A5BC440()
{
  return MEMORY[0x270F9F518]();
}

uint64_t sub_24A5BC450()
{
  return MEMORY[0x270F9F520]();
}

uint64_t sub_24A5BC460()
{
  return MEMORY[0x270F9F550]();
}

uint64_t sub_24A5BC470()
{
  return MEMORY[0x270F9F578]();
}

uint64_t sub_24A5BC480()
{
  return MEMORY[0x270F9F598]();
}

uint64_t sub_24A5BC490()
{
  return MEMORY[0x270F9F5A0]();
}

uint64_t sub_24A5BC4A0()
{
  return MEMORY[0x270F9F620]();
}

uint64_t sub_24A5BC4B0()
{
  return MEMORY[0x270F9F658]();
}

uint64_t sub_24A5BC4C0()
{
  return MEMORY[0x270F9F678]();
}

uint64_t sub_24A5BC4D0()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_24A5BC4E0()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_24A5BC4F0()
{
  return MEMORY[0x270F9F7A8]();
}

uint64_t sub_24A5BC500()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_24A5BC510()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24A5BC520()
{
  return MEMORY[0x270F9F7E0]();
}

uint64_t sub_24A5BC530()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_24A5BC540()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t sub_24A5BC550()
{
  return MEMORY[0x270F9FA28]();
}

uint64_t sub_24A5BC560()
{
  return MEMORY[0x270F9FA48]();
}

uint64_t sub_24A5BC570()
{
  return MEMORY[0x270F9FA60]();
}

uint64_t sub_24A5BC580()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_24A5BC590()
{
  return MEMORY[0x270F9FA98]();
}

uint64_t sub_24A5BC5A0()
{
  return MEMORY[0x270F9FB08]();
}

uint64_t sub_24A5BC5B0()
{
  return MEMORY[0x270F9FBA0]();
}

uint64_t sub_24A5BC5C0()
{
  return MEMORY[0x270F9FBA8]();
}

uint64_t sub_24A5BC5D0()
{
  return MEMORY[0x270F9FBB0]();
}

uint64_t sub_24A5BC5E0()
{
  return MEMORY[0x270F9FBD8]();
}

uint64_t sub_24A5BC5F0()
{
  return MEMORY[0x270F9FC20]();
}

uint64_t sub_24A5BC600()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_24A5BC610()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24A5BC620()
{
  return MEMORY[0x270F9FC50]();
}

uint64_t sub_24A5BC630()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24A5BC640()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24A5BC650()
{
  return MEMORY[0x270F9FC70]();
}

uint64_t sub_24A5BC660()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_24A5BC670()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_24A5BC680()
{
  return MEMORY[0x270F9FC88]();
}

uint64_t sub_24A5BC690()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24A5BC6A0()
{
  return MEMORY[0x270F9FCB8]();
}

uint64_t sub_24A5BC6B0()
{
  return MEMORY[0x270F9FCC8]();
}

uint64_t sub_24A5BC6C0()
{
  return MEMORY[0x270F9FCE0]();
}

uint64_t sub_24A5BC6D0()
{
  return MEMORY[0x270F9FD50]();
}

uint64_t sub_24A5BC6E0()
{
  return MEMORY[0x270F9FD58]();
}

uint64_t sub_24A5BC6F0()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_24A5BC700()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24A5BC710()
{
  return MEMORY[0x270F9FD80]();
}

uint64_t sub_24A5BC720()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_24A5BC730()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24A5BC740()
{
  return MEMORY[0x270F9FDF8]();
}

uint64_t sub_24A5BC750()
{
  return MEMORY[0x270F9FE00]();
}

uint64_t sub_24A5BC760()
{
  return MEMORY[0x270F9FE08]();
}

uint64_t sub_24A5BC770()
{
  return MEMORY[0x270F9FE10]();
}

uint64_t sub_24A5BC780()
{
  return MEMORY[0x270F9FE18]();
}

uint64_t sub_24A5BC790()
{
  return MEMORY[0x270F9FF48]();
}

uint64_t sub_24A5BC7A0()
{
  return MEMORY[0x270FA0090]();
}

uint64_t sub_24A5BC7B0()
{
  return MEMORY[0x270FA00A0]();
}

uint64_t sub_24A5BC7E0()
{
  return MEMORY[0x270FA0128]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x270FA0150]();
}

void bzero(void *a1, size_t a2)
{
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x270FA0408]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x270FA04B0]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x270FA04B8]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}