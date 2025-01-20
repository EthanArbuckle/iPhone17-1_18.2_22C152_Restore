id sub_252974E80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id result;
  int64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  int64_t v31;
  unint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  int64_t v42;
  int64_t v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  int64_t v54;
  unint64_t v55;
  int64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int64_t v60;
  id v61;
  int64_t v62;
  int64_t v63;
  uint64_t v64;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3D998);
  v2 = MEMORY[0x270FA5388](v1 - 8);
  v4 = (char *)&v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  v6 = (char *)&v59 - v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3D9A0);
  v8 = MEMORY[0x270FA5388](v7 - 8);
  v10 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v12 = (char *)&v59 - v11;
  v13 = self;
  objc_msgSend(v13, sel_begin);
  v61 = v13;
  objc_msgSend(v13, sel_setDisableActions_, 1);
  swift_beginAccess();
  v14 = *(void *)(v0 + 40);
  v15 = *(void *)(v14 + 64);
  v62 = v14 + 64;
  v16 = 1 << *(unsigned char *)(v14 + 32);
  v17 = -1;
  if (v16 < 64) {
    v17 = ~(-1 << v16);
  }
  v18 = v17 & v15;
  v63 = (unint64_t)(v16 + 63) >> 6;
  v64 = v0;
  v60 = v63 - 1;
  result = (id)swift_bridgeObjectRetain();
  v20 = 0;
  if (!v18) {
    goto LABEL_8;
  }
LABEL_6:
  v23 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  v24 = v23 | (v20 << 6);
LABEL_7:
  v25 = *(void *)(v14 + 48);
  v26 = sub_25298CEF8();
  (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v26 - 8) + 16))(v10, v25 + *(void *)(*(void *)(v26 - 8) + 72) * v24, v26);
  v27 = *(void *)(v14 + 56);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3D9A8);
  v29 = *(void **)(v27 + 8 * v24);
  *(void *)&v10[*(int *)(v28 + 48)] = v29;
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v10, 0, 1, v28);
  v30 = v29;
  while (1)
  {
    sub_252976E10((uint64_t)v10, (uint64_t)v12, &qword_269C3D9A0);
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3D9A8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v35 - 8) + 48))(v12, 1, v35) == 1) {
      break;
    }
    v21 = *(void **)&v12[*(int *)(v35 + 48)];
    objc_msgSend(*(id *)(v64 + 56), sel_addSublayer_, v21);

    v22 = sub_25298CEF8();
    result = (id)(*(uint64_t (**)(char *, uint64_t))(*(void *)(v22 - 8) + 8))(v12, v22);
    if (v18) {
      goto LABEL_6;
    }
LABEL_8:
    v31 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
LABEL_55:
      __break(1u);
LABEL_56:
      __break(1u);
      goto LABEL_57;
    }
    if (v31 < v63)
    {
      v32 = *(void *)(v62 + 8 * v31);
      if (v32) {
        goto LABEL_11;
      }
      v33 = v20 + 2;
      ++v20;
      if (v31 + 1 < v63)
      {
        v32 = *(void *)(v62 + 8 * v33);
        if (v32) {
          goto LABEL_14;
        }
        v20 = v31 + 1;
        if (v31 + 2 < v63)
        {
          v32 = *(void *)(v62 + 8 * (v31 + 2));
          if (v32)
          {
            v31 += 2;
            goto LABEL_11;
          }
          v33 = v31 + 3;
          v20 = v31 + 2;
          if (v31 + 3 < v63)
          {
            v32 = *(void *)(v62 + 8 * v33);
            if (v32)
            {
LABEL_14:
              v31 = v33;
LABEL_11:
              v18 = (v32 - 1) & v32;
              v24 = __clz(__rbit64(v32)) + (v31 << 6);
              v20 = v31;
              goto LABEL_7;
            }
            while (1)
            {
              v31 = v33 + 1;
              if (__OFADD__(v33, 1)) {
                goto LABEL_56;
              }
              if (v31 >= v63) {
                break;
              }
              v32 = *(void *)(v62 + 8 * v31);
              ++v33;
              if (v32) {
                goto LABEL_11;
              }
            }
            v20 = v60;
          }
        }
      }
    }
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3D9A8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v10, 1, 1, v34);
    v18 = 0;
  }
  swift_release();
  v36 = v64;
  swift_beginAccess();
  v37 = *(void *)(v36 + 32);
  v38 = *(void *)(v37 + 64);
  v63 = v37 + 64;
  v39 = 1 << *(unsigned char *)(v37 + 32);
  v40 = -1;
  if (v39 < 64) {
    v40 = ~(-1 << v39);
  }
  v41 = v40 & v38;
  v42 = (unint64_t)(v39 + 63) >> 6;
  v62 = v42 - 1;
  result = (id)swift_bridgeObjectRetain();
  v43 = 0;
  if (!v41) {
    goto LABEL_34;
  }
LABEL_32:
  v46 = __clz(__rbit64(v41));
  v41 &= v41 - 1;
  v47 = v46 | (v43 << 6);
  while (2)
  {
    v48 = *(void *)(v37 + 48);
    v49 = sub_25298CFA8();
    (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v49 - 8) + 16))(v4, v48 + *(void *)(*(void *)(v49 - 8) + 72) * v47, v49);
    v50 = *(void *)(v37 + 56);
    v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3D9B0);
    v52 = *(void **)(v50 + 8 * v47);
    *(void *)&v4[*(int *)(v51 + 48)] = v52;
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v4, 0, 1, v51);
    v53 = v52;
    while (1)
    {
      sub_252976E10((uint64_t)v4, (uint64_t)v6, &qword_269C3D998);
      v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3D9B0);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v58 - 8) + 48))(v6, 1, v58) == 1)
      {
        swift_release();
        objc_msgSend(*(id *)(v64 + 56), sel_addSublayer_, *(void *)(v64 + 48));
        return objc_msgSend(v61, sel_commit);
      }
      v44 = *(void **)&v6[*(int *)(v58 + 48)];
      objc_msgSend(*(id *)(v64 + 56), sel_addSublayer_, v44);

      v45 = sub_25298CFA8();
      result = (id)(*(uint64_t (**)(char *, uint64_t))(*(void *)(v45 - 8) + 8))(v6, v45);
      if (v41) {
        goto LABEL_32;
      }
LABEL_34:
      v54 = v43 + 1;
      if (__OFADD__(v43, 1)) {
        goto LABEL_55;
      }
      if (v54 < v42)
      {
        v55 = *(void *)(v63 + 8 * v54);
        if (v55) {
          goto LABEL_37;
        }
        v56 = v43 + 2;
        ++v43;
        if (v54 + 1 < v42)
        {
          v55 = *(void *)(v63 + 8 * v56);
          if (v55) {
            goto LABEL_40;
          }
          v43 = v54 + 1;
          if (v54 + 2 < v42)
          {
            v55 = *(void *)(v63 + 8 * (v54 + 2));
            if (v55)
            {
              v54 += 2;
              goto LABEL_37;
            }
            v56 = v54 + 3;
            v43 = v54 + 2;
            if (v54 + 3 < v42) {
              break;
            }
          }
        }
      }
LABEL_51:
      v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3D9B0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v4, 1, 1, v57);
      v41 = 0;
    }
    v55 = *(void *)(v63 + 8 * v56);
    if (v55)
    {
LABEL_40:
      v54 = v56;
LABEL_37:
      v41 = (v55 - 1) & v55;
      v47 = __clz(__rbit64(v55)) + (v54 << 6);
      v43 = v54;
      continue;
    }
    break;
  }
  while (1)
  {
    v54 = v56 + 1;
    if (__OFADD__(v56, 1)) {
      break;
    }
    if (v54 >= v42)
    {
      v43 = v62;
      goto LABEL_51;
    }
    v55 = *(void *)(v63 + 8 * v54);
    ++v56;
    if (v55) {
      goto LABEL_37;
    }
  }
LABEL_57:
  __break(1u);
  return result;
}

id sub_2529755F4(uint64_t a1, void *a2)
{
  v99 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3D9B8);
  MEMORY[0x270FA5388](v4 - 8);
  v92 = (char *)v89 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_25298CE58();
  uint64_t v93 = *(void *)(v94 - 8);
  MEMORY[0x270FA5388](v94);
  v90 = (char *)v89 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = sub_25298CFA8();
  uint64_t v91 = *(void *)(v106 - 8);
  MEMORY[0x270FA5388](v106);
  v8 = (char *)v89 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25298D038();
  uint64_t v108 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  v107 = (char *)v89 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v14 = (char *)v89 - v13;
  MEMORY[0x270FA5388](v12);
  v16 = (char *)v89 - v15;
  uint64_t v17 = sub_25298CEF8();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  v20 = (char *)v89 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = v2;
  objc_msgSend(*(id *)(v2 + 56), sel_bounds);
  double v22 = v21;
  double v24 = v23;
  v25 = self;
  objc_msgSend(v25, sel_begin);
  objc_msgSend(v25, sel_setDisableActions_, 1);
  uint64_t v95 = a1;
  uint64_t v26 = sub_25298CF08();
  uint64_t v27 = *(void *)(v26 + 16);
  v105 = v8;
  uint64_t v109 = v9;
  id v110 = v25;
  if (v27)
  {
    v29 = *(void (**)(char *, unint64_t, uint64_t))(v18 + 16);
    v28 = (uint64_t *)(v18 + 16);
    v113 = v29;
    v112 = (uint64_t *)(v96 + 40);
    unint64_t v30 = (*((unsigned __int8 *)v28 + 64) + 32) & ~(unint64_t)*((unsigned __int8 *)v28 + 64);
    v89[1] = v26;
    unint64_t v31 = v26 + v30;
    uint64_t v111 = v28[7];
    v98 = v115;
    v97 = &v116;
    v103 = (void (**)(char *, uint64_t))(v108 + 8);
    v32 = (void (**)(char *, uint64_t))(v28 - 1);
    v102 = v14;
    v101 = v16;
    uint64_t v100 = v17;
    v104 = v28;
    v29(v20, v26 + v30, v17);
    while (1)
    {
      v33 = v112;
      swift_beginAccess();
      uint64_t v34 = *v33;
      if (*(void *)(v34 + 16) && (unint64_t v35 = sub_252982438((uint64_t)v20), (v36 & 1) != 0))
      {
        v37 = *(void **)(*(void *)(v34 + 56) + 8 * v35);
        swift_endAccess();
        CGMutablePathRef v38 = v37;
        sub_25298CED8();
        sub_25298CEC8();
        if (sub_25298CEE8())
        {
          sub_25298D028();
          sub_25298D028();
          sub_25298D028();
          sub_25298D028();
          id v39 = objc_msgSend(v99, sel_CGColor);
          id v40 = v110;
          objc_msgSend(v110, sel_begin);
          objc_msgSend(v40, sel_setDisableActions_, 1);
          CGMutablePathRef Mutable = CGPathCreateMutable();
          v42 = v98;
          void *v98 = 0;
          v42[1] = 0;
          uint64_t v114 = 0x3FF0000000000000;
          v115[2] = 0x3FF0000000000000;
          v43 = v97;
          *(void *)v97 = 0;
          *((void *)v43 + 1) = 0;
          sub_25298D578();
          sub_25298D588();
          [(CGPath *)v38 setPath:Mutable];
          [(CGPath *)v38 setLineWidth:3.0];
          [(CGPath *)v38 setLineJoin:*MEMORY[0x263F15E90]];
          [(CGPath *)v38 setStrokeColor:v39];
          id v44 = objc_msgSend(self, sel_clearColor);
          id v45 = objc_msgSend(v44, sel_CGColor);

          v46 = v101;
          [(CGPath *)v38 setBackgroundColor:v45];

          uint64_t v17 = v100;
          objc_msgSend(v110, sel_commit);

          v47 = v102;
          CGMutablePathRef v38 = Mutable;
        }
        else
        {
          id v48 = v110;
          objc_msgSend(v110, sel_begin);
          objc_msgSend(v48, sel_setDisableActions_, 1);
          [(CGPath *)v38 setPath:0];
          [(CGPath *)v38 setLineWidth:0.0];
          v49 = self;
          id v50 = objc_msgSend(v49, sel_clearColor);
          id v51 = objc_msgSend(v50, sel_CGColor);

          [(CGPath *)v38 setStrokeColor:v51];
          v46 = v101;
          uint64_t v17 = v100;
          id v52 = objc_msgSend(v49, sel_clearColor);
          id v53 = objc_msgSend(v52, sel_CGColor);

          [(CGPath *)v38 setBackgroundColor:v53];
          v47 = v102;
          objc_msgSend(v48, sel_commit);
        }

        v54 = *v103;
        uint64_t v55 = v109;
        (*v103)(v47, v109);
        v54(v46, v55);
      }
      else
      {
        swift_endAccess();
      }
      (*v32)(v20, v17);
      v31 += v111;
      if (!--v27) {
        break;
      }
      v113(v20, v31, v17);
    }
    swift_bridgeObjectRelease();
    v8 = v105;
    uint64_t v9 = v109;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v56 = sub_25298D0B8();
  uint64_t v57 = *(void *)(v56 + 16);
  v58 = v107;
  if (v57)
  {
    v59 = (uint64_t *)(v96 + 32);
    v113 = *(void (**)(char *, unint64_t, uint64_t))(v108 + 16);
    unint64_t v60 = (*(unsigned __int8 *)(v108 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v108 + 80);
    v103 = (void (**)(char *, uint64_t))v56;
    unint64_t v61 = v56 + v60;
    uint64_t v111 = *(void *)(v108 + 72);
    v112 = (uint64_t *)(v91 + 8);
    v62 = (void (**)(char *, uint64_t))(v108 + 8);
    uint64_t v63 = v106;
    v108 += 16;
    v104 = (uint64_t *)(v96 + 32);
    v113(v107, v56 + v60, v9);
    while (1)
    {
      sub_25298D008();
      swift_beginAccess();
      uint64_t v64 = *v59;
      if (*(void *)(*v59 + 16) && (unint64_t v65 = sub_252982364((uint64_t)v8), (v66 & 1) != 0))
      {
        v67 = *(void **)(*(void *)(v64 + 56) + 8 * v65);
        swift_endAccess();
        v68 = (void (*)(char *, uint64_t))*v112;
        id v69 = v67;
        v68(v8, v63);
        if (sub_25298D018())
        {
          id v70 = v69;
          sub_25298D028();
          double v72 = v22 * v71;
          sub_25298D028();
          objc_msgSend(v70, sel_setPosition_, v72, v24 * v73);

          id v74 = v110;
          objc_msgSend(v110, sel_begin);
          objc_msgSend(v74, sel_setDisableActions_, 1);
          objc_msgSend(v70, sel_setBounds_, 0.0, 0.0, 10.0, 10.0);
          objc_msgSend(v70, sel_setCornerRadius_, 5.0);
          double v75 = 2.0;
          v76 = &selRef_whiteColor;
        }
        else
        {
          id v74 = v110;
          objc_msgSend(v110, sel_begin);
          objc_msgSend(v74, sel_setDisableActions_, 1);
          double v75 = 0.0;
          v76 = &selRef_clearColor;
        }
        v77 = self;
        id v78 = objc_msgSend(v77, sel_clearColor);
        id v79 = objc_msgSend(v78, sel_CGColor);

        objc_msgSend(v69, sel_setBackgroundColor_, v79);
        id v80 = [v77 *v76];
        id v81 = objc_msgSend(v80, sel_CGColor);

        objc_msgSend(v69, sel_setBorderColor_, v81);
        objc_msgSend(v69, sel_setBorderWidth_, v75);
        objc_msgSend(v74, sel_commit);

        uint64_t v63 = v106;
        v8 = v105;
        uint64_t v9 = v109;
        v58 = v107;
        v59 = v104;
      }
      else
      {
        swift_endAccess();
        ((void (*)(char *, uint64_t))*v112)(v8, v63);
      }
      (*v62)(v58, v9);
      v61 += v111;
      if (!--v57) {
        break;
      }
      v113(v58, v61, v9);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v82 = (uint64_t)v92;
  sub_25298CF28();
  uint64_t v83 = v93;
  uint64_t v84 = v94;
  int v85 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v93 + 48))(v82, 1, v94);
  uint64_t v86 = v96;
  if (v85 == 1)
  {
    sub_252976E74(v82);
  }
  else
  {
    uint64_t v87 = (uint64_t)v90;
    (*(void (**)(char *, uint64_t, uint64_t))(v83 + 32))(v90, v82, v84);
    sub_2529761E0(*(void **)(v86 + 48), v87, v99);
    (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v87, v84);
  }
  return objc_msgSend(v110, sel_commit);
}

id sub_2529761E0(void *a1, uint64_t a2, void *a3)
{
  id v32 = a3;
  uint64_t v5 = sub_25298CE88();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25298CEB8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(*(id *)(v3 + 56), sel_bounds);
  double v14 = v13;
  double v16 = v15;
  sub_25298CE48();
  sub_25298CE98();
  float v18 = v17;
  uint64_t v19 = *(void (**)(char *, uint64_t))(v10 + 8);
  v19(v12, v9);
  double v20 = v14 * v18;
  sub_25298CE48();
  sub_25298CEA8();
  float v22 = v21;
  v19(v12, v9);
  sub_25298CE38();
  sub_25298CE68();
  float v24 = v23;
  v25 = *(void (**)(char *, uint64_t))(v6 + 8);
  v25(v8, v5);
  double v26 = v14 * v24;
  sub_25298CE38();
  sub_25298CE78();
  float v28 = v27;
  v25(v8, v5);
  objc_msgSend(a1, sel_setFrame_, v20, v16 * v22, v26, v16 * v28);
  id v29 = objc_msgSend(v32, sel_CGColor);
  objc_msgSend(a1, sel_setBorderColor_, v29);

  return objc_msgSend(a1, sel_setBorderWidth_, 4.0);
}

uint64_t sub_25297648C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t type metadata accessor for Skeleton2DOverlay()
{
  return self;
}

void type metadata accessor for CVMetalTextureCache()
{
  if (!qword_269C3D990)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_269C3D990);
    }
  }
}

uint64_t sub_252976560(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_25298CFA8();
  uint64_t v76 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v8 = (char *)&v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25298D038();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v87 = v9;
  uint64_t v88 = v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v91 = (char *)&v74 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25298CEF8();
  v92 = *(void **)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v84 = (void (**)(char *, uint64_t))((char *)&v74 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v13);
  v90 = (char *)&v74 - v15;
  uint64_t v16 = MEMORY[0x263F8EE80];
  uint64_t v77 = v3;
  *(void *)(v3 + 32) = MEMORY[0x263F8EE80];
  float v17 = (void *)(v3 + 32);
  v17[1] = v16;
  float v18 = v17 + 1;
  v17[3] = a2;
  id v19 = a2;
  *(v17 - 2) = sub_25298CF38();
  uint64_t v20 = sub_25298CF08();
  uint64_t v21 = *(void *)(v20 + 16);
  unint64_t v22 = 0x265384000uLL;
  unint64_t v23 = 0x265384000uLL;
  uint64_t v78 = a1;
  int v85 = v8;
  uint64_t v86 = v6;
  if (v21)
  {
    double v75 = v17;
    uint64_t v24 = v20;
    uint64_t v83 = self;
    uint64_t v82 = (void (**)(uint64_t, void))self;
    v89 = (void (*)(char *, unint64_t, uint64_t))v92[2];
    unint64_t v25 = (*((unsigned __int8 *)v92 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v92 + 80);
    uint64_t v74 = v24;
    unint64_t v26 = v24 + v25;
    v92 += 2;
    uint64_t v79 = v92[7];
    id v80 = (char *)(v92 - 1);
    float v27 = v90;
    uint64_t v81 = v12;
    do
    {
      v89(v27, v26, v12);
      id v28 = objc_allocWithZone((Class)_s15ConnectionLayerCMa());
      id v29 = objc_msgSend(v28, sel_init, v74);
      id v30 = (id)v83;
      objc_msgSend((id)v83, sel_begin);
      objc_msgSend(v30, sel_setDisableActions_, 1);
      objc_msgSend(v29, sel_setPath_, 0);
      objc_msgSend(v29, sel_setLineWidth_, 0.0);
      id v31 = v82;
      id v32 = objc_msgSend(v82, sel_clearColor);
      id v33 = objc_msgSend(v32, sel_CGColor);

      objc_msgSend(v29, sel_setStrokeColor_, v33);
      id v34 = objc_msgSend(v31, sel_clearColor);
      id v35 = objc_msgSend(v34, sel_CGColor);

      objc_msgSend(v29, sel_setBackgroundColor_, v35);
      char v36 = v30;
      uint64_t v12 = v81;
      objc_msgSend(v36, sel_commit);
      uint64_t v37 = (uint64_t)v84;
      v89((char *)v84, (unint64_t)v90, v12);
      float v27 = v90;
      swift_beginAccess();
      id v38 = v29;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v93 = *v18;
      *float v18 = 0x8000000000000000;
      sub_2529836EC((uint64_t)v38, v37, isUniquelyReferenced_nonNull_native);
      *float v18 = v93;
      swift_bridgeObjectRelease();
      id v40 = *(void (**)(char *, uint64_t))v80;
      (*(void (**)(uint64_t, uint64_t))v80)(v37, v12);
      swift_endAccess();

      v40(v27, v12);
      v26 += v79;
      --v21;
    }
    while (v21);
    swift_bridgeObjectRelease();
    a1 = v78;
    unint64_t v23 = 0x265384000;
    unint64_t v22 = 0x265384000;
    float v17 = v75;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v41 = sub_25298D0B8();
  uint64_t v42 = *(void *)(v41 + 16);
  unint64_t v43 = 0x265384000uLL;
  unint64_t v44 = 0x265384000uLL;
  if (v42)
  {
    v90 = (char *)self;
    v92 = self;
    uint64_t v45 = v87;
    v46 = *(void (**)(char *, unint64_t, uint64_t))(v88 + 16);
    v88 += 16;
    v89 = v46;
    unint64_t v47 = v41 + ((*(unsigned __int8 *)(v88 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v88 + 64));
    uint64_t v48 = *(void *)(v88 + 56);
    uint64_t v81 = v41;
    uint64_t v82 = (void (**)(uint64_t, void))(v76 + 8);
    uint64_t v83 = v48;
    uint64_t v84 = (void (**)(char *, uint64_t))(v88 - 8);
    id v50 = v90;
    v49 = v91;
    do
    {
      v89(v49, v47, v45);
      id v51 = objc_msgSend(objc_allocWithZone((Class)_s13LandmarkLayerCMa()), sel_init);
      objc_msgSend(v50, sel_begin);
      objc_msgSend(v50, sel_setDisableActions_, 1);
      id v52 = v92;
      id v53 = [v92 *(SEL *)(v22 + 2416)];
      id v54 = objc_msgSend(v53, sel_CGColor);

      objc_msgSend(v51, sel_setBackgroundColor_, v54);
      id v55 = [v52 *(SEL *)(v22 + 2416)];
      id v56 = objc_msgSend(v55, sel_CGColor);

      objc_msgSend(v51, sel_setBorderColor_, v56);
      objc_msgSend(v51, sel_setBorderWidth_, 0.0);
      objc_msgSend(v50, sel_commit);
      uint64_t v57 = (uint64_t)v85;
      sub_25298D008();
      swift_beginAccess();
      id v58 = v51;
      char v59 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v93 = *v17;
      *float v17 = 0x8000000000000000;
      sub_2529836E0((uint64_t)v58, v57, v59);
      uint64_t v45 = v87;
      *float v17 = v93;
      swift_bridgeObjectRelease();
      (*v82)(v57, v86);
      swift_endAccess();

      v49 = v91;
      (*v84)(v91, v45);
      v47 += v83;
      --v42;
    }
    while (v42);
    swift_bridgeObjectRelease();
    a1 = v78;
    unint64_t v23 = 0x265384000;
    unint64_t v22 = 0x265384000;
    unint64_t v44 = 0x265384000;
    unint64_t v43 = 0x265384000;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  unint64_t v60 = self;
  id v61 = [v60 *(SEL *)(v22 + 2416)];
  unint64_t v62 = v22;
  uint64_t v63 = v77;
  *(void *)(v77 + 24) = v61;
  id v64 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F157E0]), sel_init);
  *(void *)(v63 + 48) = v64;
  id v65 = v64;
  id v66 = [v60 *(SEL *)(v62 + 2416)];
  unint64_t v67 = v23;
  id v68 = [v66 *(SEL *)(v23 + 2424)];

  objc_msgSend(v65, sel_setBackgroundColor_, v68);
  id v69 = *(id *)(v63 + 48);
  id v70 = [v60 *(SEL *)(v62 + 2416)];
  id v71 = [v70 (SEL)(v67 + 1069)];

  objc_msgSend(v69, *(SEL *)(v43 + 2456), v71);
  objc_msgSend(*(id *)(v63 + 48), *(SEL *)(v44 + 2464), 0.0);
  uint64_t v72 = sub_25298D0C8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v72 - 8) + 8))(a1, v72);
  return v63;
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

uint64_t sub_252976E10(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_252976E74(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3D9B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for PreviewController3DRepresentable()
{
  return &type metadata for PreviewController3DRepresentable;
}

uint64_t sub_252976EE4()
{
  return MEMORY[0x263F1BB60];
}

id sub_252976EF0()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for PreviewController3D_iOS());
  return objc_msgSend(v0, sel_init);
}

void sub_252976F28()
{
  sub_2529805EC(*v0);
}

uint64_t sub_252976FB0()
{
  return sub_25298D278();
}

uint64_t sub_252976FC8()
{
  return sub_25298D288();
}

uint64_t sub_252976FE0()
{
  return sub_25298D2F8();
}

uint64_t sub_252976FF8(uint64_t a1, unsigned __int8 a2, uint64_t a3, unsigned __int8 a4)
{
  if ((a2 | a4)) {
    return 0;
  }
  return result;
}

uint64_t sub_252977010()
{
  return sub_25298D2C8();
}

uint64_t sub_252977028()
{
  return sub_25298D2B8();
}

uint64_t sub_252977040()
{
  return sub_25298D2E8();
}

uint64_t sub_252977098()
{
  return sub_25298D2A8();
}

uint64_t sub_2529770F0()
{
  return sub_25298D398();
}

void sub_25297710C()
{
}

unint64_t sub_252977138()
{
  unint64_t result = qword_269C3DAE0;
  if (!qword_269C3DAE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3DAE0);
  }
  return result;
}

unint64_t sub_25297718C()
{
  unint64_t result = qword_269C3DAE8;
  if (!qword_269C3DAE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3DAE8);
  }
  return result;
}

uint64_t sub_2529771E0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25298D138();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_252977254()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC7HumanUI10Renderer3D__skeletons;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DB18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_2529772F8()
{
  return type metadata accessor for Renderer3D();
}

uint64_t type metadata accessor for Renderer3D()
{
  uint64_t result = qword_269C3DAF8;
  if (!qword_269C3DAF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25297734C()
{
  sub_2529773DC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_2529773DC()
{
  if (!qword_269C3DB08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C3DB10);
    unint64_t v0 = sub_25298D158();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269C3DB08);
    }
  }
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

uint64_t sub_252977480()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_25297748C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25298D118();
  *a1 = result;
  return result;
}

id sub_2529775B0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  *(void *)&v3[OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_canvasView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_renderer] = 0;
  uint64_t v7 = OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_currentSkeleton2DOverlays;
  uint64_t v8 = MEMORY[0x263F8EE78];
  *(void *)&v4[v7] = sub_2529854FC(MEMORY[0x263F8EE78]);
  *(void *)&v4[OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_previousSkeletons] = v8;
  uint64_t v9 = OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_colors;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DB50);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_25298E1D0;
  uint64_t v11 = self;
  uint64_t v12 = v4;
  *(void *)(v10 + 32) = objc_msgSend(v11, sel_systemRedColor);
  *(void *)(v10 + 40) = objc_msgSend(v11, sel_systemBlueColor);
  *(void *)(v10 + 48) = objc_msgSend(v11, sel_systemCyanColor);
  *(void *)(v10 + 56) = objc_msgSend(v11, sel_systemGrayColor);
  *(void *)(v10 + 64) = objc_msgSend(v11, sel_systemMintColor);
  *(void *)(v10 + 72) = objc_msgSend(v11, sel_systemPinkColor);
  *(void *)(v10 + 80) = objc_msgSend(v11, sel_systemTealColor);
  *(void *)(v10 + 88) = objc_msgSend(v11, sel_systemBrownColor);
  *(void *)(v10 + 96) = objc_msgSend(v11, sel_blackColor);
  *(void *)(v10 + 104) = objc_msgSend(v11, sel_systemGreenColor);
  *(void *)(v10 + 112) = objc_msgSend(v11, sel_systemIndigoColor);
  *(void *)(v10 + 120) = objc_msgSend(v11, sel_systemOrangeColor);
  *(void *)(v10 + 128) = objc_msgSend(v11, sel_systemPurpleColor);
  *(void *)(v10 + 136) = objc_msgSend(v11, sel_systemYellowColor);
  *(void *)(v10 + 144) = objc_msgSend(v11, sel_whiteColor);
  *(void *)(v10 + 152) = objc_msgSend(v11, sel_magentaColor);
  uint64_t v18 = v10;
  sub_25298D4E8();
  *(void *)&v4[v9] = v10;
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F157E0]), sel_init);
  *(void *)&v12[OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_rootLayer] = v13;

  if (a2)
  {
    uint64_t v14 = (void *)sub_25298D498();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = 0;
  }
  v17.receiver = v12;
  v17.super_class = (Class)type metadata accessor for PreviewController2D_iOS();
  id v15 = objc_msgSendSuper2(&v17, sel_initWithNibName_bundle_, v14, a3);

  return v15;
}

void sub_252977A08()
{
  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for PreviewController2D_iOS();
  objc_msgSendSuper2(&v9, sel_viewDidLoad);
  id v1 = objc_msgSend(self, sel_sharedApplication);
  objc_msgSend(v1, sel_setIdleTimerDisabled_, 1);

  id v2 = objc_msgSend(v0, sel_view);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = self;
    id v5 = objc_msgSend(v4, sel_clearColor);
    objc_msgSend(v3, sel_setBackgroundColor_, v5);

    uint64_t v6 = *(void **)&v0[OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_rootLayer];
    id v7 = objc_msgSend(v4, sel_clearColor);
    id v8 = objc_msgSend(v7, sel_CGColor);

    objc_msgSend(v6, sel_setBackgroundColor_, v8);
  }
  else
  {
    __break(1u);
  }
}

void sub_252977B90(char a1)
{
  v13.receiver = v1;
  v13.super_class = (Class)type metadata accessor for PreviewController2D_iOS();
  objc_msgSendSuper2(&v13, sel_viewDidAppear_, a1 & 1);
  uint64_t v3 = OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_canvasView;
  uint64_t v4 = *(void **)&v1[OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_canvasView];
  if (v4)
  {
    objc_msgSend(v4, sel_bounds);
    double v6 = v5;
    double v8 = v7;
    objc_super v9 = *(void **)&v1[OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_rootLayer];
    uint64_t v10 = self;
    objc_msgSend(v10, sel_begin);
    objc_msgSend(v10, sel_setDisableActions_, 1);
    objc_msgSend(v9, sel_setBounds_, 0.0, 0.0, v6, v8);
    objc_msgSend(v9, sel_setPosition_, v6 * 0.5, v8 * 0.5);
    objc_msgSend(v10, sel_commit);
    uint64_t v11 = *(void **)&v1[v3];
    if (v11)
    {
      id v12 = objc_msgSend(v11, sel_layer);
      objc_msgSend(v12, sel_addSublayer_, v9);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id sub_252977D20()
{
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for PreviewController2D_iOS();
  objc_msgSendSuper2(&v8, sel_viewDidLayoutSubviews);
  id result = *(id *)&v0[OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_canvasView];
  if (result)
  {
    id v2 = *(void **)&v0[OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_rootLayer];
    objc_msgSend(result, sel_frame);
    double v4 = v3;
    double v6 = v5;
    double v7 = self;
    objc_msgSend(v7, sel_begin);
    objc_msgSend(v7, sel_setDisableActions_, 1);
    objc_msgSend(v2, sel_setBounds_, 0.0, 0.0, v4, v6);
    objc_msgSend(v2, sel_setPosition_, v4 * 0.5, v6 * 0.5);
    return objc_msgSend(v7, sel_commit);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_252977E5C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PreviewController2D_iOS();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PreviewController2D_iOS()
{
  return self;
}

uint64_t sub_252977F40(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25298D0C8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v57 = (uint64_t)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  objc_super v9 = (char *)&v51 - v8;
  uint64_t v10 = v1 + OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_currentSkeleton2DOverlays;
  swift_beginAccess();
  uint64_t v56 = v10;
  unint64_t v11 = 0x269C3D000;
  if (!*(void *)(*(void *)v10 + 16))
  {
    sub_2529784D4();
    sub_252978744(a1);
    goto LABEL_39;
  }
  int64_t v12 = *(void *)(a1 + 16);
  objc_super v13 = (void *)MEMORY[0x263F8EE78];
  uint64_t v54 = v2;
  uint64_t v55 = a1;
  uint64_t v52 = v5;
  int64_t v53 = v12;
  if (v12)
  {
    id v61 = (void *)MEMORY[0x263F8EE78];
    sub_25298452C(0, v12, 0);
    uint64_t v14 = v5 + 16;
    id v15 = *(char **)(v5 + 16);
    unint64_t v16 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    id v58 = *(void (**)(void, void, void))(v14 + 56);
    char v59 = v15;
    uint64_t v60 = v14;
    objc_super v17 = (void (**)(char *, uint64_t))(v14 - 8);
    int64_t v18 = v12;
    do
    {
      ((void (*)(char *, unint64_t, uint64_t))v59)(v9, v16, v4);
      uint64_t v19 = sub_25298CF38();
      (*v17)(v9, v4);
      objc_super v13 = v61;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25298452C(0, v13[2] + 1, 1);
        objc_super v13 = v61;
      }
      unint64_t v21 = v13[2];
      unint64_t v20 = v13[3];
      if (v21 >= v20 >> 1)
      {
        sub_25298452C(v20 > 1, v21 + 1, 1);
        objc_super v13 = v61;
      }
      v13[2] = v21 + 1;
      v13[v21 + 4] = v19;
      v16 += (unint64_t)v58;
      --v18;
    }
    while (v18);
    uint64_t v2 = v54;
    a1 = v55;
    unint64_t v11 = 0x269C3D000uLL;
  }
  uint64_t v22 = *(void *)(v2 + *(void *)(v11 + 2880));
  int64_t v23 = *(void *)(v22 + 16);
  uint64_t v24 = (void *)MEMORY[0x263F8EE78];
  if (v23)
  {
    id v61 = (void *)MEMORY[0x263F8EE78];
    uint64_t v25 = v22;
    swift_bridgeObjectRetain();
    sub_25298452C(0, v23, 0);
    unint64_t v26 = *(char **)(v52 + 16);
    uint64_t v27 = *(unsigned __int8 *)(v52 + 80);
    uint64_t v51 = v25;
    uint64_t v28 = v25 + ((v27 + 32) & ~v27);
    id v58 = *(void (**)(void, void, void))(v52 + 72);
    char v59 = v26;
    uint64_t v60 = v52 + 16;
    id v29 = (void (**)(char *, uint64_t))(v52 + 8);
    do
    {
      ((void (*)(char *, uint64_t, uint64_t))v59)(v9, v28, v4);
      uint64_t v30 = sub_25298CF38();
      (*v29)(v9, v4);
      uint64_t v24 = v61;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25298452C(0, v24[2] + 1, 1);
        uint64_t v24 = v61;
      }
      unint64_t v32 = v24[2];
      unint64_t v31 = v24[3];
      if (v32 >= v31 >> 1)
      {
        sub_25298452C(v31 > 1, v32 + 1, 1);
        uint64_t v24 = v61;
      }
      v24[2] = v32 + 1;
      v24[v32 + 4] = v30;
      v28 += (uint64_t)v58;
      --v23;
    }
    while (v23);
    swift_bridgeObjectRelease();
    uint64_t v2 = v54;
    a1 = v55;
    unint64_t v11 = 0x269C3D000;
  }
  BOOL v33 = sub_252980FA0(v24, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int64_t v34 = v53;
  if (!v33)
  {
    sub_2529784D4();
    goto LABEL_39;
  }
  if (!v53)
  {
LABEL_39:
    *(void *)(v2 + *(void *)(v11 + 2880)) = a1;
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRelease();
  }
  id v35 = *(void (**)(void, void, void))(v52 + 16);
  unint64_t v36 = a1 + ((*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80));
  uint64_t v37 = *(void *)(v52 + 72);
  char v59 = (char *)OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_colors;
  uint64_t v60 = v37;
  id v38 = (void (**)(uint64_t, uint64_t))(v52 + 8);
  swift_bridgeObjectRetain();
  uint64_t v39 = v56;
  uint64_t v40 = v57;
  id v58 = v35;
  while (1)
  {
    v35(v40, v36, v4);
    uint64_t v43 = sub_25298CF38();
    if (!*(void *)(*(void *)v39 + 16)) {
      goto LABEL_25;
    }
    sub_25298250C(v43);
    if ((v44 & 1) == 0) {
      goto LABEL_25;
    }
    swift_retain();
    uint64_t result = sub_25298CF38();
    uint64_t v46 = result;
    unint64_t v47 = *(void *)&v59[v2];
    if (v47 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_25298D688();
      uint64_t result = swift_bridgeObjectRelease();
      if (!v48)
      {
LABEL_37:
        __break(1u);
LABEL_38:
        a1 = v55;
        swift_bridgeObjectRelease();
        unint64_t v11 = 0x269C3D000uLL;
        goto LABEL_39;
      }
    }
    else
    {
      uint64_t v48 = *(void *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v48) {
        goto LABEL_37;
      }
    }
    if (v46 == 0x8000000000000000 && v48 == -1) {
      goto LABEL_42;
    }
    unint64_t v49 = v46 % v48;
    uint64_t v50 = *(void *)&v59[v2];
    if ((v50 & 0xC000000000000001) == 0) {
      break;
    }
    swift_bridgeObjectRetain();
    id v41 = (id)MEMORY[0x2533C20F0](v49, v50);
    swift_bridgeObjectRelease();
LABEL_24:
    uint64_t v42 = v57;
    sub_2529755F4(v57, v41);
    swift_release();

    uint64_t v40 = v42;
    uint64_t v39 = v56;
    id v35 = v58;
LABEL_25:
    (*v38)(v40, v4);
    v36 += v60;
    if (!--v34) {
      goto LABEL_38;
    }
  }
  if ((v49 & 0x8000000000000000) == 0)
  {
    if (v49 >= *(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_41;
    }
    id v41 = *(id *)(v50 + 8 * v49 + 32);
    goto LABEL_24;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_2529784D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_rootLayer);
  id v3 = objc_msgSend(v2, sel_sublayers);
  if (!v3) {
    goto LABEL_18;
  }
  uint64_t v4 = v3;
  sub_252978D64();
  unint64_t v5 = sub_25298D4D8();

  if (!(v5 >> 62))
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6) {
      goto LABEL_4;
    }
LABEL_16:
    swift_bridgeObjectRelease();
LABEL_17:
    objc_msgSend(v2, sel_setSublayers_, 0);
LABEL_18:
    unint64_t v17 = sub_2529854FC(MEMORY[0x263F8EE78]);
    int64_t v18 = (unint64_t *)(v1 + OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_currentSkeleton2DOverlays);
    swift_beginAccess();
    *int64_t v18 = v17;
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_25298D688();
  swift_bridgeObjectRelease();
  if (!v6) {
    goto LABEL_16;
  }
LABEL_4:
  uint64_t v20 = MEMORY[0x263F8EE78];
  uint64_t result = sub_25298454C(0, v6 & ~(v6 >> 63), 0);
  if ((v6 & 0x8000000000000000) == 0)
  {
    uint64_t v19 = v1;
    uint64_t v8 = 0;
    do
    {
      if ((v5 & 0xC000000000000001) != 0) {
        id v9 = (id)MEMORY[0x2533C20F0](v8, v5);
      }
      else {
        id v9 = *(id *)(v5 + 8 * v8 + 32);
      }
      id v10 = v9;
      uint64_t v11 = swift_allocObject();
      *(void *)(v11 + 16) = v10;
      uint64_t v12 = swift_allocObject();
      *(void *)(v12 + 16) = sub_252978DDC;
      *(void *)(v12 + 24) = v11;
      uint64_t v13 = v20;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25298454C(0, *(void *)(v20 + 16) + 1, 1);
        uint64_t v13 = v20;
      }
      unint64_t v15 = *(void *)(v13 + 16);
      unint64_t v14 = *(void *)(v13 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_25298454C(v14 > 1, v15 + 1, 1);
        uint64_t v13 = v20;
      }
      ++v8;
      *(void *)(v13 + 16) = v15 + 1;
      uint64_t v16 = v13 + 16 * v15;
      *(void *)(v16 + 32) = sub_252978E24;
      *(void *)(v16 + 40) = v12;
    }
    while (v6 != v8);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v1 = v19;
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_252978744(uint64_t a1)
{
  uint64_t v3 = sub_25298D0C8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  id v35 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v29 - v8;
  uint64_t v10 = *(void *)(a1 + 16);
  if (!v10) {
    return result;
  }
  uint64_t v11 = (uint64_t *)(v1 + OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_currentSkeleton2DOverlays);
  uint64_t v36 = OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_colors;
  id v33 = *(id *)(v1 + OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_rootLayer);
  uint64_t v34 = v1;
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  uint64_t v12 = v4 + 16;
  unint64_t v14 = (char *)(a1 + ((*(unsigned __int8 *)(v12 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 64)));
  uint64_t v31 = *(void *)(v12 + 56);
  unint64_t v32 = v13;
  uint64_t v29 = a1;
  uint64_t v30 = (void (**)(char *, uint64_t))(v12 - 8);
  swift_bridgeObjectRetain();
  while (1)
  {
    unint64_t v15 = v32;
    v32(v9, v14, v3);
    uint64_t v16 = (uint64_t)v35;
    uint64_t v17 = v12;
    v15(v35, v9, v3);
    type metadata accessor for Skeleton2DOverlay();
    swift_allocObject();
    id v18 = v33;
    uint64_t v19 = sub_252976560(v16, v18);

    sub_252974E80();
    uint64_t v20 = sub_25298CF38();
    swift_beginAccess();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v37 = *v11;
    *uint64_t v11 = 0x8000000000000000;
    sub_252983C8C(v19, v20, isUniquelyReferenced_nonNull_native);
    *uint64_t v11 = v37;
    swift_bridgeObjectRelease();
    swift_endAccess();
    uint64_t result = sub_25298CF38();
    uint64_t v22 = result;
    uint64_t v23 = v34;
    unint64_t v24 = *(void *)(v34 + v36);
    if (v24 >> 62) {
      break;
    }
    uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v25) {
      goto LABEL_17;
    }
LABEL_5:
    if (v22 == 0x8000000000000000 && v25 == -1) {
      goto LABEL_20;
    }
    unint64_t v26 = v22 % v25;
    uint64_t v27 = *(void *)(v23 + v36);
    if ((v27 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      id v28 = (id)MEMORY[0x2533C20F0](v26, v27);
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v26 & 0x8000000000000000) != 0) {
        goto LABEL_18;
      }
      if (v26 >= *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_19;
      }
      id v28 = *(id *)(v27 + 8 * v26 + 32);
    }
    sub_2529755F4((uint64_t)v9, v28);
    swift_release();

    (*v30)(v9, v3);
    v14 += v31;
    --v10;
    uint64_t v12 = v17;
    if (!v10) {
      return swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_25298D688();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v23 = v34;
  if (v25) {
    goto LABEL_5;
  }
LABEL_17:
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

void sub_252978AA8()
{
  uint64_t v1 = v0;
  *(void *)&v0[OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_canvasView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_renderer] = 0;
  uint64_t v2 = OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_currentSkeleton2DOverlays;
  uint64_t v3 = MEMORY[0x263F8EE78];
  *(void *)&v1[v2] = sub_2529854FC(MEMORY[0x263F8EE78]);
  *(void *)&v1[OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_previousSkeletons] = v3;
  uint64_t v4 = OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_colors;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DB50);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_25298E1D0;
  uint64_t v6 = self;
  *(void *)(v5 + 32) = objc_msgSend(v6, sel_systemRedColor);
  *(void *)(v5 + 40) = objc_msgSend(v6, sel_systemBlueColor);
  *(void *)(v5 + 48) = objc_msgSend(v6, sel_systemCyanColor);
  *(void *)(v5 + 56) = objc_msgSend(v6, sel_systemGrayColor);
  *(void *)(v5 + 64) = objc_msgSend(v6, sel_systemMintColor);
  *(void *)(v5 + 72) = objc_msgSend(v6, sel_systemPinkColor);
  *(void *)(v5 + 80) = objc_msgSend(v6, sel_systemTealColor);
  *(void *)(v5 + 88) = objc_msgSend(v6, sel_systemBrownColor);
  *(void *)(v5 + 96) = objc_msgSend(v6, sel_blackColor);
  *(void *)(v5 + 104) = objc_msgSend(v6, sel_systemGreenColor);
  *(void *)(v5 + 112) = objc_msgSend(v6, sel_systemIndigoColor);
  *(void *)(v5 + 120) = objc_msgSend(v6, sel_systemOrangeColor);
  *(void *)(v5 + 128) = objc_msgSend(v6, sel_systemPurpleColor);
  *(void *)(v5 + 136) = objc_msgSend(v6, sel_systemYellowColor);
  *(void *)(v5 + 144) = objc_msgSend(v6, sel_whiteColor);
  *(void *)(v5 + 152) = objc_msgSend(v6, sel_magentaColor);
  sub_25298D4E8();
  *(void *)&v1[v4] = v5;

  sub_25298D678();
  __break(1u);
}

unint64_t sub_252978D64()
{
  unint64_t result = qword_269C3DB58;
  if (!qword_269C3DB58)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269C3DB58);
  }
  return result;
}

uint64_t sub_252978DA4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_252978DDC()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_removeFromSuperlayer);
}

uint64_t sub_252978DEC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_252978E24()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void *initializeBufferWithCopyOfBuffer for InfoView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for InfoView()
{
  return swift_release();
}

void *assignWithCopy for InfoView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for InfoView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for InfoView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for InfoView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for InfoView()
{
  return &type metadata for InfoView;
}

uint64_t sub_252978F9C(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_25298FF28, 1);
}

uint64_t sub_252978FB8(uint64_t a1)
{
  uint64_t v2 = sub_25298CDE8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_25298D138();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v6 = sub_25298CDA8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v6 < 1)
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DB60);
    MEMORY[0x270FA5388](v14);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DB68);
    sub_25297A3A8();
    return sub_25298D268();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DB68);
    MEMORY[0x270FA5388](v7);
    id v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    *(void *)id v9 = sub_25298D258();
    *((void *)v9 + 1) = 0;
    v9[16] = 1;
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DB78);
    sub_2529792C0(a1, &v9[*(int *)(v10 + 44)]);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DB60);
    MEMORY[0x270FA5388](v11);
    sub_25297A8A8((uint64_t)v9, (uint64_t)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_269C3DB68);
    swift_storeEnumTagMultiPayload();
    sub_25297A3A8();
    sub_25298D268();
    return sub_25297A90C((uint64_t)v9, &qword_269C3DB68);
  }
}

uint64_t sub_2529792C0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  v69[1] = a1;
  v89 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DB80);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v85 = v2 - 8;
  uint64_t v88 = *(void *)(v3 + 64);
  uint64_t v4 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v86 = (uint64_t)v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v87 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  uint64_t v84 = (uint64_t)v69 - v6;
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DB88) - 8;
  MEMORY[0x270FA5388](v83);
  uint64_t v82 = (uint64_t)v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DB90) - 8;
  MEMORY[0x270FA5388](v81);
  id v80 = (char *)v69 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_25298D258();
  sub_252979BC4((uint64_t)v97);
  uint64_t v77 = *((void *)&v97[0] + 1);
  uint64_t v78 = *(void *)&v97[0];
  char v9 = v97[1];
  uint64_t v75 = *(void *)&v97[2];
  uint64_t v76 = *((void *)&v97[1] + 1);
  char v10 = BYTE8(v97[2]);
  long long v74 = v97[3];
  uint64_t v73 = *(void *)&v97[4];
  char v11 = BYTE8(v97[4]);
  long long v72 = v97[5];
  uint64_t v70 = *(void *)&v97[7];
  uint64_t v71 = *(void *)&v97[6];
  char v94 = 1;
  char v93 = v97[1];
  char v92 = BYTE8(v97[2]);
  char v91 = BYTE8(v97[4]);
  char v90 = BYTE8(v97[6]);
  char v12 = BYTE8(v97[6]);
  uint64_t v13 = sub_25298D338();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v15 = sub_25298D428();
  uint64_t v17 = v16;
  sub_2529799CC((uint64_t)&v95[20]);
  v95[0] = v79;
  v95[1] = 0;
  LOBYTE(v95[2]) = 1;
  v95[3] = v78;
  v95[4] = v77;
  LOBYTE(v95[5]) = v9;
  v95[6] = v76;
  v95[7] = v75;
  LOBYTE(v95[8]) = v10;
  *(_OWORD *)&v95[9] = v74;
  v95[11] = v73;
  LOBYTE(v95[12]) = v11;
  *(_OWORD *)&v95[13] = v72;
  v95[15] = v71;
  LOBYTE(v95[16]) = v12;
  v95[17] = v70;
  v95[18] = KeyPath;
  v95[19] = v13;
  v95[47] = v15;
  v95[48] = v17;
  char v18 = sub_25298D318();
  memcpy(v97, v95, 0x188uLL);
  char v96 = 1;
  char v19 = sub_25298D308();
  sub_25298D168();
  BYTE8(v97[24]) = v18;
  memset(&v97[25], 0, 32);
  LOBYTE(v97[27]) = v96;
  BYTE8(v97[27]) = v19;
  *(void *)&v97[28] = v20;
  *((void *)&v97[28] + 1) = v21;
  *(void *)&v97[29] = v22;
  *((void *)&v97[29] + 1) = v23;
  LOBYTE(v97[30]) = 0;
  uint64_t v24 = sub_25298D418();
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)v69 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25298D408();
  uint64_t v28 = sub_25298D1A8();
  uint64_t v29 = MEMORY[0x270FA5388](v28 - 8);
  uint64_t v31 = (_OWORD *)((char *)v69 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v32 = (char *)v31 + *(int *)(v29 + 28);
  uint64_t v33 = *MEMORY[0x263F19858];
  uint64_t v34 = sub_25298D248();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v34 - 8) + 104))(v32, v33, v34);
  __asm { FMOV            V0.2D, #12.0 }
  *uint64_t v31 = _Q0;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DB98);
  uint64_t v41 = v40 - 8;
  MEMORY[0x270FA5388](v40);
  uint64_t v43 = (char *)v69 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v43, v27, v24);
  sub_25297A450((uint64_t)v31, (uint64_t)&v43[*(int *)(v41 + 60)]);
  *(_WORD *)&v43[*(int *)(v41 + 64)] = 256;
  char v44 = v80;
  sub_25297A8A8((uint64_t)v43, (uint64_t)&v80[*(int *)(v81 + 44)], &qword_269C3DB98);
  memcpy(v44, v97, 0x1E1uLL);
  sub_25297A4B4((uint64_t)v97);
  sub_25297A90C((uint64_t)v43, &qword_269C3DB98);
  sub_25297A64C((uint64_t)v31);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
  sub_25297A6A8((uint64_t)v95);
  char v45 = sub_25298D328();
  sub_25298D168();
  uint64_t v47 = v46;
  uint64_t v49 = v48;
  uint64_t v51 = v50;
  uint64_t v53 = v52;
  uint64_t v54 = v82;
  sub_25297A8A8((uint64_t)v44, v82, &qword_269C3DB90);
  uint64_t v55 = v54 + *(int *)(v83 + 44);
  *(unsigned char *)uint64_t v55 = v45;
  *(void *)(v55 + 8) = v47;
  *(void *)(v55 + 16) = v49;
  *(void *)(v55 + 24) = v51;
  *(void *)(v55 + 32) = v53;
  *(unsigned char *)(v55 + 40) = 0;
  sub_25297A90C((uint64_t)v44, &qword_269C3DB90);
  uint64_t v56 = sub_25298D3A8();
  MEMORY[0x270FA5388](v56);
  (*(void (**)(char *, void))(v58 + 104))((char *)v69 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F1B370]);
  uint64_t v59 = sub_25298D3E8();
  uint64_t v60 = v84;
  sub_25297A8A8(v54, v84, &qword_269C3DB88);
  id v61 = (uint64_t *)(v60 + *(int *)(v85 + 44));
  *id v61 = v59;
  v61[1] = 0x403E000000000000;
  v61[2] = 0;
  v61[3] = 0;
  sub_25297A90C(v54, &qword_269C3DB88);
  uint64_t v62 = v86;
  uint64_t v63 = sub_25297A840(v60, v86);
  MEMORY[0x270FA5388](v63);
  id v64 = (char *)v69 - v87;
  sub_25297A8A8(v62, (uint64_t)v69 - v87, &qword_269C3DB80);
  id v65 = v89;
  void *v89 = 0;
  *((unsigned char *)v65 + 8) = 1;
  id v66 = v65;
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DBA0);
  sub_25297A8A8((uint64_t)v64, (uint64_t)v66 + *(int *)(v67 + 48), &qword_269C3DB80);
  sub_25297A90C(v62, &qword_269C3DB80);
  return sub_25297A90C((uint64_t)v64, &qword_269C3DB80);
}

__n128 sub_2529799CC@<Q0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DBA8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_25298E200;
  *(void *)(v2 + 32) = sub_25298D3B8();
  *(void *)(v2 + 40) = sub_25298D3C8();
  *(void *)(v2 + 48) = sub_25298D3D8();
  v27[0] = v2;
  sub_25298D4E8();
  sub_25298D438();
  sub_25298D448();
  MEMORY[0x2533C1EB0](v2);
  sub_25298D178();
  uint64_t v26 = v39;
  long long v25 = v40;
  uint64_t v3 = v41;
  uint64_t v4 = v42;
  uint64_t v5 = sub_25298D428();
  uint64_t v23 = v6;
  uint64_t v24 = v5;
  uint64_t v22 = sub_25298D258();
  sub_252979BC4((uint64_t)v27);
  uint64_t v7 = v27[1];
  uint64_t v21 = v27[0];
  char v8 = v28;
  uint64_t v10 = v29;
  uint64_t v9 = v30;
  LOBYTE(v2) = v31;
  uint64_t v11 = v33;
  char v12 = v34;
  __n128 v19 = v35;
  long long v20 = v32;
  uint64_t v17 = v38;
  uint64_t v18 = v36;
  LOBYTE(v27[0]) = 1;
  char v46 = v28;
  char v45 = v31;
  char v44 = v34;
  char v43 = v37;
  char v13 = v37;
  uint64_t v14 = sub_25298D338();
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)a1 = v26;
  *(_OWORD *)(a1 + 8) = v25;
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v24;
  *(void *)(a1 + 48) = v23;
  *(void *)(a1 + 56) = v22;
  *(void *)(a1 + 64) = 0;
  *(unsigned char *)(a1 + 72) = 1;
  *(void *)(a1 + 80) = v21;
  *(void *)(a1 + 88) = v7;
  *(unsigned char *)(a1 + 96) = v8;
  *(void *)(a1 + 104) = v10;
  *(void *)(a1 + 112) = v9;
  *(unsigned char *)(a1 + 120) = v2;
  *(_OWORD *)(a1 + 128) = v20;
  *(void *)(a1 + 144) = v11;
  *(unsigned char *)(a1 + 152) = v12;
  __n128 result = v19;
  *(__n128 *)(a1 + 160) = v19;
  *(void *)(a1 + 176) = v18;
  *(unsigned char *)(a1 + 184) = v13;
  *(void *)(a1 + 192) = v17;
  *(void *)(a1 + 200) = KeyPath;
  *(void *)(a1 + 208) = v14;
  return result;
}

uint64_t sub_252979BC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_25298CDE8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_25298D1D8();
  sub_252979F60((uint64_t)v39);
  uint64_t v37 = v39[1];
  uint64_t v31 = v39[0];
  uint64_t v32 = v41;
  uint64_t v33 = v43;
  uint64_t v34 = v42;
  int v29 = v44;
  int v30 = v40;
  uint64_t v35 = v45;
  uint64_t v6 = sub_25298D228();
  MEMORY[0x270FA5388](v6 - 8);
  sub_25298D218();
  sub_25298D208();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_25298D138();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v7 = sub_25298CDA8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v39[0] = v7;
  sub_25298D1E8();
  sub_25298D208();
  sub_25298D238();
  uint64_t v8 = sub_25298D368();
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  sub_25298D348();
  uint64_t v13 = sub_25298D358();
  uint64_t v15 = v14;
  char v17 = v16;
  uint64_t v19 = v18;
  swift_release();
  LOBYTE(v5) = v17 & 1;
  sub_25297A830(v8, v10, v12);
  swift_bridgeObjectRelease();
  char v21 = v29;
  char v20 = v30;
  LOBYTE(v39[0]) = v30;
  char v38 = v29;
  uint64_t v22 = v37;
  *(void *)a1 = v36;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v23 = v31;
  uint64_t v24 = v32;
  *(void *)(a1 + 24) = v31;
  *(void *)(a1 + 32) = v22;
  *(unsigned char *)(a1 + 40) = v20;
  uint64_t v26 = v33;
  uint64_t v25 = v34;
  *(void *)(a1 + 48) = v24;
  *(void *)(a1 + 56) = v25;
  *(void *)(a1 + 64) = v26;
  *(unsigned char *)(a1 + 72) = v21;
  *(void *)(a1 + 80) = v35;
  *(void *)(a1 + 88) = v13;
  *(void *)(a1 + 96) = v15;
  *(unsigned char *)(a1 + 104) = (_BYTE)v5;
  *(void *)(a1 + 112) = v19;
  uint64_t v27 = v23;
  sub_25297A63C(v23, v22, v20);
  swift_bridgeObjectRetain();
  sub_25297A63C(v25, v26, v21);
  swift_bridgeObjectRetain();
  sub_25297A63C(v13, v15, (char)v5);
  swift_bridgeObjectRetain();
  sub_25297A830(v13, v15, (char)v5);
  swift_bridgeObjectRelease();
  LOBYTE(v19) = v38;
  sub_25297A830(v27, v37, v39[0]);
  swift_bridgeObjectRelease();
  sub_25297A830(v25, v26, v19);
  return swift_bridgeObjectRelease();
}

uint64_t sub_252979F60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_25298CDE8();
  uint64_t v27 = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  int v30 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v26 - v6;
  uint64_t v8 = sub_25298D228();
  uint64_t v9 = *(void *)(*(void *)(v8 - 8) + 64);
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v31 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_25298D218();
  sub_25298D208();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_25298D138();
  swift_release();
  swift_release();
  swift_release();
  sub_25298CDD8();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v26[1] = v3 + 8;
  char v28 = v10;
  v10(v7, v2);
  sub_25298D1F8();
  swift_bridgeObjectRelease();
  sub_25298D208();
  sub_25298D238();
  uint64_t v11 = sub_25298D368();
  uint64_t v13 = v12;
  char v15 = v14;
  uint64_t v17 = v16;
  int v29 = v26;
  MEMORY[0x270FA5388](v11);
  sub_25298D218();
  sub_25298D208();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  uint64_t v18 = v30;
  sub_25298D138();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v19 = sub_25298CDB8();
  v28(v18, v27);
  uint64_t v33 = v19;
  sub_25298D1E8();
  sub_25298D208();
  sub_25298D238();
  uint64_t v20 = sub_25298D368();
  uint64_t v22 = v21;
  LOBYTE(v9) = v23 & 1;
  char v32 = v15 & 1;
  *(void *)a1 = v11;
  *(void *)(a1 + 8) = v13;
  *(unsigned char *)(a1 + 16) = v15 & 1;
  *(void *)(a1 + 24) = v17;
  *(void *)(a1 + 32) = v20;
  *(void *)(a1 + 40) = v21;
  *(unsigned char *)(a1 + 48) = v23 & 1;
  *(void *)(a1 + 56) = v24;
  sub_25297A63C(v11, v13, v15 & 1);
  swift_bridgeObjectRetain();
  sub_25297A63C(v20, v22, v9);
  swift_bridgeObjectRetain();
  sub_25297A830(v20, v22, v9);
  swift_bridgeObjectRelease();
  sub_25297A830(v11, v13, v32);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25297A368()
{
  return sub_25298D378();
}

uint64_t sub_25297A380()
{
  return sub_25298D388();
}

uint64_t sub_25297A398()
{
  return sub_252978FB8(*v0);
}

unint64_t sub_25297A3A8()
{
  unint64_t result = qword_269C3DB70;
  if (!qword_269C3DB70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C3DB68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3DB70);
  }
  return result;
}

uint64_t sub_25297A3F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25298D1B8();
  *a1 = result;
  return result;
}

uint64_t sub_25297A424()
{
  return sub_25298D1C8();
}

uint64_t sub_25297A450(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25298D1A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25297A4B4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  uint64_t v3 = *(void *)(a1 + 88);
  char v4 = *(unsigned char *)(a1 + 96);
  uint64_t v5 = *(void *)(a1 + 112);
  uint64_t v6 = *(void *)(a1 + 120);
  char v7 = *(unsigned char *)(a1 + 128);
  uint64_t v10 = *(void *)(a1 + 272);
  uint64_t v11 = *(void *)(a1 + 264);
  char v9 = *(unsigned char *)(a1 + 280);
  uint64_t v13 = *(void *)(a1 + 304);
  uint64_t v14 = *(void *)(a1 + 296);
  char v12 = *(unsigned char *)(a1 + 312);
  uint64_t v16 = *(void *)(a1 + 336);
  uint64_t v17 = *(void *)(a1 + 328);
  char v15 = *(unsigned char *)(a1 + 344);
  sub_25297A63C(*(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned char *)(a1 + 64));
  swift_bridgeObjectRetain();
  sub_25297A63C(v2, v3, v4);
  swift_bridgeObjectRetain();
  sub_25297A63C(v5, v6, v7);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_25297A63C(v11, v10, v9);
  swift_bridgeObjectRetain();
  sub_25297A63C(v14, v13, v12);
  swift_bridgeObjectRetain();
  sub_25297A63C(v17, v16, v15);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_25297A63C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_25297A64C(uint64_t a1)
{
  uint64_t v2 = sub_25298D1A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25297A6A8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  uint64_t v3 = *(void *)(a1 + 88);
  char v4 = *(unsigned char *)(a1 + 96);
  uint64_t v5 = *(void *)(a1 + 112);
  uint64_t v6 = *(void *)(a1 + 120);
  char v7 = *(unsigned char *)(a1 + 128);
  uint64_t v10 = *(void *)(a1 + 272);
  uint64_t v11 = *(void *)(a1 + 264);
  char v9 = *(unsigned char *)(a1 + 280);
  uint64_t v13 = *(void *)(a1 + 304);
  uint64_t v14 = *(void *)(a1 + 296);
  char v12 = *(unsigned char *)(a1 + 312);
  uint64_t v16 = *(void *)(a1 + 336);
  uint64_t v17 = *(void *)(a1 + 328);
  char v15 = *(unsigned char *)(a1 + 344);
  sub_25297A830(*(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned char *)(a1 + 64));
  swift_bridgeObjectRelease();
  sub_25297A830(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_25297A830(v5, v6, v7);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_25297A830(v11, v10, v9);
  swift_bridgeObjectRelease();
  sub_25297A830(v14, v13, v12);
  swift_bridgeObjectRelease();
  sub_25297A830(v17, v16, v15);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

uint64_t sub_25297A830(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_25297A840(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DB80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25297A8A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25297A90C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_25297A96C()
{
  unint64_t result = qword_269C3DBB0;
  if (!qword_269C3DBB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C3DBB8);
    sub_25297A3A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3DBB0);
  }
  return result;
}

uint64_t sub_25297A9E0()
{
  sub_25298D628();
  return sub_25298CD78();
}

uint64_t sub_25297AAD0()
{
  uint64_t v0 = sub_25298CD88();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_269C3EF10);
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_269C3EF10);
  sub_25298D628();
  sub_25298CD78();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v1 + 32))(v5, v4, v0);
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25297AC84(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25297AD58(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25297B608((uint64_t)v12, *a3);
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
      sub_25297B608((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_25297AD58(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25298D5D8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25297AF14(a5, a6);
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
  uint64_t v8 = sub_25298D648();
  if (!v8)
  {
    sub_25298D668();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25298D6C8();
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

uint64_t sub_25297AF14(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25297AFAC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25297B18C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25297B18C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25297AFAC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25297B124(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25298D618();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25298D668();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25298D4B8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25298D6C8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25298D668();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25297B124(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DBC0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25297B18C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DBC0);
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
  uint64_t result = sub_25298D6C8();
  __break(1u);
  return result;
}

uint64_t sub_25297B2DC(double a1)
{
  uint64_t v2 = sub_25298CD88();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  size_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(self, sel_processInfo);
  objc_msgSend(v6, sel_systemUptime);
  double v8 = v7;

  sub_25297A9E0();
  int64_t v9 = sub_25298CD68();
  os_log_type_t v10 = sub_25298D568();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v17 = v12;
    *(_DWORD *)uint64_t v11 = 136315394;
    uint64_t v13 = sub_25298D628();
    double v16 = COERCE_DOUBLE(sub_25297AC84(v13, v14, &v17));
    sub_25298D5C8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2048;
    double v16 = (v8 - a1) * 1000.0;
    sub_25298D5C8();
    _os_log_impl(&dword_252973000, v9, v10, "%s: %f", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533C2760](v12, -1, -1);
    MEMORY[0x2533C2760](v11, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
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

uint64_t sub_25297B608(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

ValueMetadata *type metadata accessor for PreviewController2DRepresentable()
{
  return &type metadata for PreviewController2DRepresentable;
}

id sub_25297B678()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for PreviewController2D_iOS());
  return objc_msgSend(v0, sel_init);
}

uint64_t sub_25297B6B0()
{
  return sub_252977F40(*v0);
}

uint64_t sub_25297B6DC()
{
  return sub_25298D2E8();
}

uint64_t sub_25297B734()
{
  return sub_25298D2A8();
}

void sub_25297B78C()
{
}

unint64_t sub_25297B7B8()
{
  unint64_t result = qword_269C3DBC8;
  if (!qword_269C3DBC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3DBC8);
  }
  return result;
}

unint64_t sub_25297B80C()
{
  unint64_t result = qword_269C3DBD0;
  if (!qword_269C3DBD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3DBD0);
  }
  return result;
}

uint64_t Preview.renderer.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  char v8 = *(unsigned char *)(v1 + 41);
  char v9 = *(unsigned char *)(v1 + 42);
  char v10 = *(unsigned char *)(v1 + 43);
  char v11 = *(unsigned char *)(v1 + 44);
  char v12 = *(unsigned char *)(v1 + 45);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 40) = v7;
  *(unsigned char *)(a1 + 41) = v8;
  *(unsigned char *)(a1 + 42) = v9;
  *(unsigned char *)(a1 + 43) = v10;
  *(unsigned char *)(a1 + 44) = v11;
  *(unsigned char *)(a1 + 45) = v12;
  id v13 = v2;
  swift_retain();
  swift_retain();
  swift_retain();
  return swift_retain();
}

__n128 Preview.init(renderer:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(a1 + 40);
  char v4 = *(unsigned char *)(a1 + 41);
  char v5 = *(unsigned char *)(a1 + 42);
  char v6 = *(unsigned char *)(a1 + 43);
  char v7 = *(unsigned char *)(a1 + 44);
  char v8 = *(unsigned char *)(a1 + 45);
  __n128 result = *(__n128 *)a1;
  long long v10 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v10;
  *(void *)(a2 + 32) = v2;
  *(unsigned char *)(a2 + 40) = v3;
  *(unsigned char *)(a2 + 41) = v4;
  *(unsigned char *)(a2 + 42) = v5;
  *(unsigned char *)(a2 + 43) = v6;
  *(unsigned char *)(a2 + 44) = v7;
  *(unsigned char *)(a2 + 45) = v8;
  return result;
}

uint64_t Preview.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  char v8 = *(unsigned char *)(v1 + 41);
  char v9 = *(unsigned char *)(v1 + 42);
  char v10 = *(unsigned char *)(v1 + 43);
  char v11 = *(unsigned char *)(v1 + 44);
  char v12 = *(unsigned char *)(v1 + 45);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 40) = v7;
  *(unsigned char *)(a1 + 41) = v8;
  *(unsigned char *)(a1 + 42) = v9;
  *(unsigned char *)(a1 + 43) = v10;
  *(unsigned char *)(a1 + 44) = v11;
  *(unsigned char *)(a1 + 45) = v12;
  id v13 = v2;
  swift_retain();
  swift_retain();
  swift_retain();
  return swift_retain();
}

uint64_t sub_25297B9EC(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &opaque type descriptor for <<opaque return type of Preview.body>>, 1);
}

uint64_t sub_25297BA08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  char v8 = *(unsigned char *)(v1 + 41);
  char v9 = *(unsigned char *)(v1 + 42);
  char v10 = *(unsigned char *)(v1 + 43);
  char v11 = *(unsigned char *)(v1 + 44);
  char v12 = *(unsigned char *)(v1 + 45);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 40) = v7;
  *(unsigned char *)(a1 + 41) = v8;
  *(unsigned char *)(a1 + 42) = v9;
  *(unsigned char *)(a1 + 43) = v10;
  *(unsigned char *)(a1 + 44) = v11;
  *(unsigned char *)(a1 + 45) = v12;
  id v13 = v2;
  swift_retain();
  swift_retain();
  swift_retain();
  return swift_retain();
}

uint64_t initializeBufferWithCopyOfBuffer for Renderer(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for Renderer(id *a1)
{
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for Renderer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_WORD *)(a1 + 44) = *(_WORD *)(a2 + 44);
  id v6 = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for Renderer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  *(unsigned char *)(a1 + 42) = *(unsigned char *)(a2 + 42);
  *(unsigned char *)(a1 + 43) = *(unsigned char *)(a2 + 43);
  *(unsigned char *)(a1 + 44) = *(unsigned char *)(a2 + 44);
  *(unsigned char *)(a1 + 45) = *(unsigned char *)(a2 + 45);
  return a1;
}

__n128 __swift_memcpy46_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 30) = *(_OWORD *)(a2 + 30);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Renderer(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  *(unsigned char *)(a1 + 42) = *(unsigned char *)(a2 + 42);
  *(unsigned char *)(a1 + 43) = *(unsigned char *)(a2 + 43);
  *(unsigned char *)(a1 + 44) = *(unsigned char *)(a2 + 44);
  *(unsigned char *)(a1 + 45) = *(unsigned char *)(a2 + 45);
  return a1;
}

uint64_t getEnumTagSinglePayload for Renderer(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 46)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Renderer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 44) = 0;
    *(_DWORD *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 46) = 1;
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
    *(unsigned char *)(result + 46) = 0;
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

unint64_t sub_25297BDE0()
{
  unint64_t result = qword_269C3DBD8;
  if (!qword_269C3DBD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3DBD8);
  }
  return result;
}

id sub_25297BEBC(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC7HumanUI25PreviewControllerMesh_iOS_sceneView] = 0;
  uint64_t v6 = OBJC_IVAR____TtC7HumanUI25PreviewControllerMesh_iOS_currentSkeleton3DOverlays;
  uint64_t v7 = MEMORY[0x263F8EE78];
  *(void *)&v3[v6] = sub_2529854F0(MEMORY[0x263F8EE78]);
  *(void *)&v3[OBJC_IVAR____TtC7HumanUI25PreviewControllerMesh_iOS_previousSkeletons] = v7;
  uint64_t v8 = OBJC_IVAR____TtC7HumanUI25PreviewControllerMesh_iOS_skeleton3DColor;
  char v9 = self;
  char v10 = v3;
  *(void *)&v3[v8] = objc_msgSend(v9, sel_magentaColor);

  if (a2)
  {
    char v11 = (void *)sub_25298D498();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v11 = 0;
  }
  v14.receiver = v10;
  v14.super_class = (Class)type metadata accessor for PreviewControllerMesh_iOS();
  id v12 = objc_msgSendSuper2(&v14, sel_initWithNibName_bundle_, v11, a3);

  return v12;
}

void *sub_25297C100()
{
  uint64_t v1 = v0;
  uint64_t v45 = *MEMORY[0x263EF8340];
  swift_getObjectType();
  v44.receiver = v0;
  v44.super_class = (Class)type metadata accessor for PreviewControllerMesh_iOS();
  objc_msgSendSuper2(&v44, sel_viewDidLoad);
  id v2 = objc_msgSend(v0, sel_view);
  if (!v2)
  {
    __break(1u);
LABEL_14:
    __break(1u);
  }
  long long v3 = v2;
  id v4 = objc_msgSend(v2, sel_layer);

  uint64_t v5 = self;
  id v6 = objc_msgSend(v5, sel_clearColor);
  id v7 = objc_msgSend(v6, sel_CGColor);

  objc_msgSend(v4, sel_setBackgroundColor_, v7);
  uint64_t v41 = OBJC_IVAR____TtC7HumanUI25PreviewControllerMesh_iOS_sceneView;
  uint64_t v8 = *(void **)&v1[OBJC_IVAR____TtC7HumanUI25PreviewControllerMesh_iOS_sceneView];
  if (!v8) {
    goto LABEL_14;
  }
  id v9 = objc_msgSend(v8, sel_layer);
  id v10 = objc_msgSend(v5, sel_clearColor);
  id v11 = objc_msgSend(v10, sel_CGColor);

  objc_msgSend(v9, sel_setBackgroundColor_, v11);
  uint64_t v12 = sub_25298CD58();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v42 = (char *)&v40 - v15;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v17 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v18 = (void *)sub_25298D498();
  uint64_t v19 = (void *)sub_25298D498();
  id v20 = objc_msgSend(v17, sel_URLForResource_withExtension_, v18, v19);

  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DC00);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  uint64_t v24 = (char *)&v40 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v20)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v24, 1, 1, v12);
    return (void *)sub_25297C780((uint64_t)v24);
  }
  MEMORY[0x270FA5388](v22);
  sub_25298CD48();

  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v25(v24, (char *)&v40 - v15, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v24, 0, 1, v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v24, 1, v12) == 1) {
    return (void *)sub_25297C780((uint64_t)v24);
  }
  uint64_t v26 = v42;
  v25(v42, v24, v12);
  uint64_t v27 = (void *)sub_25298CD38();
  char v28 = self;
  id v43 = 0;
  id v29 = objc_msgSend(v28, sel_sceneWithURL_options_error_, v27, 0, &v43);

  id v30 = v43;
  if (v29)
  {
    id v31 = objc_allocWithZone(MEMORY[0x263F16A78]);
    id v32 = v30;
    id v33 = objc_msgSend(v31, sel_init);
    objc_msgSend(v33, sel_setType_, *MEMORY[0x263F16B78]);
    objc_msgSend(v33, sel_setCastsShadow_, 1);
    id v34 = objc_msgSend(v29, sel_rootNode);
    objc_msgSend(v34, sel_setLight_, v33);

    id v35 = objc_msgSend(v29, sel_rootNode);
    LODWORD(v36) = 10.0;
    objc_msgSend(v35, sel_setPosition_, 0.0, 0.0, v36);

    unint64_t result = *(void **)&v1[v41];
    if (!result)
    {
      __break(1u);
      return result;
    }
    objc_msgSend(result, sel_setScene_, v29);
  }
  else
  {
    id v38 = v43;
    uint64_t v39 = (void *)sub_25298CD28();

    swift_willThrow();
  }
  return (void *)(*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v26, v12);
}

id sub_25297C6BC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PreviewControllerMesh_iOS();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PreviewControllerMesh_iOS()
{
  return self;
}

uint64_t sub_25297C780(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DC00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_25297C7E0(uint64_t x0_0)
{
  uint64_t v58 = sub_25298CFA8();
  *(void *)&long long v56 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  uint64_t v57 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25298CFD8();
  uint64_t v59 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25298D068();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  id v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v46 - v12;
  uint64_t v14 = sub_25298D0C8();
  MEMORY[0x270FA5388](v14);
  if (!*(void *)(x0_0 + 16)) {
    return;
  }
  uint64_t v49 = v14;
  uint64_t v50 = v1;
  uint64_t v55 = v4;
  id v17 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = v16;
  (*(void (**)(void))(v16 + 16))();
  sub_25298D078();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v11, *MEMORY[0x263F49D58], v7);
  sub_25297CE80();
  char v19 = sub_25298D488();
  id v20 = *(void (**)(char *, uint64_t))(v8 + 8);
  v20(v11, v7);
  v20(v13, v7);
  if ((v19 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v17, v49);
    return;
  }
  uint64_t v47 = v18;
  uint64_t v48 = v17;
  uint64_t v51 = OBJC_IVAR____TtC7HumanUI25PreviewControllerMesh_iOS_sceneView;
  uint64_t v21 = *(void **)(v52 + OBJC_IVAR____TtC7HumanUI25PreviewControllerMesh_iOS_sceneView);
  if (!v21) {
    goto LABEL_25;
  }
  id v22 = objc_msgSend(v21, sel_scene);
  uint64_t v23 = v48;
  if (v22)
  {
    uint64_t v24 = v22;
    id v25 = objc_msgSend(v22, sel_rootNode);

    sub_25298CF18();
    objc_msgSend(v25, sel_setSimdPosition_, v26);
  }
  uint64_t v27 = sub_25298CFF8();
  uint64_t v28 = *(void *)(v27 + 16);
  if (!v28)
  {
    swift_bridgeObjectRelease();
LABEL_21:
    (*(void (**)(char *, uint64_t))(v47 + 8))(v23, v49);
    return;
  }
  id v29 = *(void (**)(char *, uint64_t, uint64_t))(v59 + 16);
  uint64_t v30 = *(unsigned __int8 *)(v59 + 80);
  uint64_t v46 = v27;
  uint64_t v31 = v27 + ((v30 + 32) & ~v30);
  id v32 = (void (**)(char *, uint64_t))(v56 + 8);
  id v33 = (void (**)(char *, uint64_t))(v59 + 8);
  v59 += 16;
  uint64_t v53 = *(void *)(v59 + 56);
  uint64_t v54 = v29;
  v29(v6, v31, v55);
  while (1)
  {
    id v35 = v57;
    sub_25298CFB8();
    uint64_t v36 = sub_25298CF98();
    uint64_t v38 = v37;
    (*v32)(v35, v58);
    sub_25298CF78();
    *(double *)&long long v39 = simd_quaternion(v60);
    long long v56 = v39;
    if (v36 == 1953460082 && v38 == 0xE400000000000000 || (sub_25298D708() & 1) != 0)
    {
LABEL_8:
      uint64_t v34 = v55;
      (*v33)(v6, v55);
      swift_bridgeObjectRelease();
      goto LABEL_9;
    }
    uint64_t v40 = *(void **)(v52 + v51);
    if (!v40) {
      break;
    }
    id v41 = objc_msgSend(v40, sel_scene, v46);
    if (!v41) {
      goto LABEL_8;
    }
    uint64_t v42 = v41;
    id v43 = objc_msgSend(v41, sel_rootNode);
    objc_super v44 = (void *)sub_25298D498();
    swift_bridgeObjectRelease();
    id v45 = objc_msgSend(v43, sel_childNodeWithName_recursively_, v44, 1);

    if (!v45) {
      goto LABEL_24;
    }
    objc_msgSend(v45, sel_setSimdOrientation_, *(double *)&v56);

    uint64_t v34 = v55;
    (*v33)(v6, v55);
LABEL_9:
    v31 += v53;
    if (!--v28)
    {
      swift_bridgeObjectRelease();
      uint64_t v23 = v48;
      goto LABEL_21;
    }
    v54(v6, v31, v34);
  }
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
}

void sub_25297CDB8()
{
  *(void *)&v0[OBJC_IVAR____TtC7HumanUI25PreviewControllerMesh_iOS_sceneView] = 0;
  uint64_t v1 = OBJC_IVAR____TtC7HumanUI25PreviewControllerMesh_iOS_currentSkeleton3DOverlays;
  uint64_t v2 = MEMORY[0x263F8EE78];
  *(void *)&v0[v1] = sub_2529854F0(MEMORY[0x263F8EE78]);
  *(void *)&v0[OBJC_IVAR____TtC7HumanUI25PreviewControllerMesh_iOS_previousSkeletons] = v2;
  uint64_t v3 = OBJC_IVAR____TtC7HumanUI25PreviewControllerMesh_iOS_skeleton3DColor;
  *(void *)&v0[v3] = objc_msgSend(self, sel_magentaColor);

  sub_25298D678();
  __break(1u);
}

unint64_t sub_25297CE80()
{
  unint64_t result = qword_269C3DC08;
  if (!qword_269C3DC08)
  {
    sub_25298D068();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3DC08);
  }
  return result;
}

double simd_quaternion(simd_float4x4 a1)
{
  float v1 = a1.columns[2].f32[2] + (float)(a1.columns[0].f32[0] + a1.columns[1].f32[1]);
  if (v1 >= 0.0)
  {
    a1.columns[3].f32[0] = sqrtf(v1 + 1.0);
    float32x2_t v5 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(a1.columns[3].f32[0] + a1.columns[3].f32[0]));
    float32x2_t v6 = vmul_f32(v5, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(a1.columns[3].f32[0] + a1.columns[3].f32[0]), v5));
    *(float32x2_t *)a1.columns[3].f32 = vmul_n_f32(vsub_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[1], (int8x16_t)a1.columns[1], 8uLL), *(int32x2_t *)a1.columns[2].f32), (float32x2_t)vext_s8(*(int8x8_t *)a1.columns[2].f32, (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[0], (int8x16_t)a1.columns[0], 8uLL), 4uLL)), vmul_f32(v6, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(a1.columns[3].f32[0] + a1.columns[3].f32[0]), v6)).f32[0]);
  }
  else if (a1.columns[0].f32[0] < a1.columns[1].f32[1] || a1.columns[0].f32[0] < a1.columns[2].f32[2])
  {
    float v3 = 1.0 - a1.columns[0].f32[0];
    if (a1.columns[1].f32[1] >= a1.columns[2].f32[2])
    {
      a1.columns[3].f32[0] = sqrtf(a1.columns[1].f32[1] + (float)(v3 - a1.columns[2].f32[2]));
      a1.columns[3].f32[0] = a1.columns[3].f32[0] + a1.columns[3].f32[0];
      float32x2_t v16 = vrecpe_f32((float32x2_t)a1.columns[3].u32[0]);
      float32x2_t v17 = vmul_f32(v16, vrecps_f32((float32x2_t)a1.columns[3].u32[0], v16));
      v18.i32[0] = vmul_f32(v17, vrecps_f32((float32x2_t)a1.columns[3].u32[0], v17)).u32[0];
      v17.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)a1.columns[0].f32, 1), *(float32x2_t *)a1.columns[1].f32).u32[0];
      v17.i32[1] = a1.columns[3].i32[0];
      v18.i32[1] = 0.25;
      *(float32x2_t *)a1.columns[3].f32 = vmul_f32(v17, v18);
    }
    else
    {
      float32x2_t v4 = (float32x2_t)__PAIR64__(a1.columns[0].u32[1], COERCE_UNSIGNED_INT(sqrtf(a1.columns[2].f32[2] + (float)(v3 - a1.columns[1].f32[1]))));
      *(float32x2_t *)a1.columns[2].f32 = vadd_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[0], (int8x16_t)a1.columns[0], 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[1], (int8x16_t)a1.columns[1], 8uLL)), *(float32x2_t *)a1.columns[2].f32);
      *(int32x2_t *)a1.columns[1].f32 = vdup_lane_s32(*(int32x2_t *)a1.columns[1].f32, 0);
      a1.columns[1].i32[0] = 2.0;
      a1.columns[1].i32[0] = vmul_f32(v4, *(float32x2_t *)a1.columns[1].f32).u32[0];
      *(float32x2_t *)a1.columns[3].f32 = vrecpe_f32((float32x2_t)a1.columns[1].u32[0]);
      *(float32x2_t *)a1.columns[3].f32 = vmul_f32(*(float32x2_t *)a1.columns[3].f32, vrecps_f32((float32x2_t)a1.columns[1].u32[0], *(float32x2_t *)a1.columns[3].f32));
      *(float32x2_t *)a1.columns[3].f32 = vmul_n_f32(*(float32x2_t *)a1.columns[2].f32, vmul_f32(*(float32x2_t *)a1.columns[3].f32, vrecps_f32((float32x2_t)a1.columns[1].u32[0], *(float32x2_t *)a1.columns[3].f32)).f32[0]);
      __asm { FMOV            V2.2S, #0.25 }
    }
  }
  else
  {
    *(int32x2_t *)a1.columns[3].f32 = vdup_lane_s32(*(int32x2_t *)a1.columns[1].f32, 0);
    float32x2_t v7 = vadd_f32(*(float32x2_t *)a1.columns[0].f32, *(float32x2_t *)a1.columns[3].f32);
    a1.columns[3].i32[0] = 2.0;
    v8.i32[0] = vmul_f32((float32x2_t)__PAIR64__(a1.columns[0].u32[1], COERCE_UNSIGNED_INT(sqrtf(a1.columns[0].f32[0]+ (float)((float)(1.0 - a1.columns[1].f32[1]) - a1.columns[2].f32[2])))), *(float32x2_t *)a1.columns[3].f32).u32[0];
    v8.i32[1] = v7.i32[1];
    float32x2_t v9 = vrecpe_f32((float32x2_t)v8.u32[0]);
    float32x2_t v10 = vmul_f32(v9, vrecps_f32((float32x2_t)v8.u32[0], v9));
    unsigned __int32 v11 = vmul_f32(v10, vrecps_f32((float32x2_t)v8.u32[0], v10)).u32[0];
    __asm { FMOV            V5.2S, #0.25 }
    _D5.i32[1] = v11;
    *(float32x2_t *)a1.columns[3].f32 = vmul_f32(v8, _D5);
  }
  return *(double *)a1.columns[3].i64;
}

uint64_t sub_25297D0BC()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 + 64);
  int64_t v53 = v0;
  uint64_t v54 = v1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & v2;
  v52[1] = v52;
  uint64_t v6 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C3DC38) - 8) + 64);
  ((void (*)(void))MEMORY[0x270FA5388])();
  int64_t v55 = (unint64_t)(v3 + 63) >> 6;
  unint64_t v56 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  v52[0] = v55 - 1;
  uint64_t v7 = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    uint64_t result = MEMORY[0x270FA5388](v7);
    float32x2_t v10 = (char *)v52 - v56;
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_6;
    }
    int64_t v19 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      break;
    }
    if (v19 < v55)
    {
      unint64_t v20 = *(void *)(v54 + 8 * v19);
      if (v20) {
        goto LABEL_10;
      }
      int64_t v21 = v8 + 2;
      ++v8;
      if (v19 + 1 < v55)
      {
        unint64_t v20 = *(void *)(v54 + 8 * v21);
        if (v20) {
          goto LABEL_13;
        }
        int64_t v8 = v19 + 1;
        if (v19 + 2 < v55)
        {
          unint64_t v20 = *(void *)(v54 + 8 * (v19 + 2));
          if (v20)
          {
            v19 += 2;
LABEL_10:
            unint64_t v5 = (v20 - 1) & v20;
            unint64_t v12 = __clz(__rbit64(v20)) + (v19 << 6);
            int64_t v8 = v19;
LABEL_6:
            uint64_t v13 = *(void *)(v1 + 48);
            uint64_t v14 = sub_25298CFA8();
            (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v10, v13 + *(void *)(*(void *)(v14 - 8) + 72) * v12, v14);
            uint64_t v15 = *(void *)(v1 + 56);
            uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DC40);
            float32x2_t v17 = *(void **)(v15 + 8 * v12);
            *(void *)&v10[*(int *)(v16 + 48)] = v17;
            (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v10, 0, 1, v16);
            id v18 = v17;
            goto LABEL_25;
          }
          int64_t v21 = v19 + 3;
          int64_t v8 = v19 + 2;
          if (v19 + 3 < v55)
          {
            unint64_t v20 = *(void *)(v54 + 8 * v21);
            if (v20)
            {
LABEL_13:
              int64_t v19 = v21;
              goto LABEL_10;
            }
            while (1)
            {
              int64_t v19 = v21 + 1;
              if (__OFADD__(v21, 1)) {
                goto LABEL_56;
              }
              if (v19 >= v55) {
                break;
              }
              unint64_t v20 = *(void *)(v54 + 8 * v19);
              ++v21;
              if (v20) {
                goto LABEL_10;
              }
            }
            int64_t v8 = v52[0];
          }
        }
      }
    }
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DC40);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v10, 1, 1, v22);
    unint64_t v5 = 0;
LABEL_25:
    sub_252976E10((uint64_t)v10, (uint64_t)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_269C3DC38);
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DC40);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 48))((char *)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v23) == 1)
    {
      swift_release();
      int64_t v26 = v53;
      swift_beginAccess();
      uint64_t v27 = *(void *)(v26 + 32);
      uint64_t v28 = *(void *)(v27 + 64);
      uint64_t v54 = v27 + 64;
      uint64_t v29 = 1 << *(unsigned char *)(v27 + 32);
      uint64_t v30 = -1;
      if (v29 < 64) {
        uint64_t v30 = ~(-1 << v29);
      }
      unint64_t v31 = v30 & v28;
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DC48);
      uint64_t v33 = *(void *)(*(void *)(v32 - 8) + 64);
      MEMORY[0x270FA5388](v32 - 8);
      int64_t v55 = (unint64_t)(v29 + 63) >> 6;
      unint64_t v56 = (v33 + 15) & 0xFFFFFFFFFFFFFFF0;
      int64_t v53 = v55 - 1;
      uint64_t v34 = swift_bridgeObjectRetain();
      int64_t v35 = 0;
      while (1)
      {
        uint64_t result = MEMORY[0x270FA5388](v34);
        uint64_t v36 = (char *)v52 - v56;
        if (v31) {
          break;
        }
        int64_t v45 = v35 + 1;
        if (__OFADD__(v35, 1)) {
          goto LABEL_55;
        }
        if (v45 < v55)
        {
          unint64_t v46 = *(void *)(v54 + 8 * v45);
          if (v46) {
            goto LABEL_36;
          }
          int64_t v47 = v35 + 2;
          ++v35;
          if (v45 + 1 < v55)
          {
            unint64_t v46 = *(void *)(v54 + 8 * v47);
            if (v46) {
              goto LABEL_39;
            }
            int64_t v35 = v45 + 1;
            if (v45 + 2 < v55)
            {
              unint64_t v46 = *(void *)(v54 + 8 * (v45 + 2));
              if (v46)
              {
                v45 += 2;
                goto LABEL_36;
              }
              int64_t v47 = v45 + 3;
              int64_t v35 = v45 + 2;
              if (v45 + 3 < v55)
              {
                unint64_t v46 = *(void *)(v54 + 8 * v47);
                if (!v46)
                {
                  while (1)
                  {
                    int64_t v45 = v47 + 1;
                    if (__OFADD__(v47, 1)) {
                      goto LABEL_57;
                    }
                    if (v45 >= v55)
                    {
                      int64_t v35 = v53;
                      goto LABEL_50;
                    }
                    unint64_t v46 = *(void *)(v54 + 8 * v45);
                    ++v47;
                    if (v46) {
                      goto LABEL_36;
                    }
                  }
                }
LABEL_39:
                int64_t v45 = v47;
LABEL_36:
                unint64_t v31 = (v46 - 1) & v46;
                unint64_t v38 = __clz(__rbit64(v46)) + (v45 << 6);
                int64_t v35 = v45;
LABEL_32:
                uint64_t v39 = *(void *)(v27 + 48);
                uint64_t v40 = sub_25298CF68();
                (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v40 - 8) + 16))(v36, v39 + *(void *)(*(void *)(v40 - 8) + 72) * v38, v40);
                uint64_t v41 = *(void *)(v27 + 56);
                uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DC50);
                id v43 = *(void **)(v41 + 8 * v38);
                *(void *)&v36[*(int *)(v42 + 48)] = v43;
                (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v36, 0, 1, v42);
                id v44 = v43;
                goto LABEL_51;
              }
            }
          }
        }
LABEL_50:
        uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DC50);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v36, 1, 1, v48);
        unint64_t v31 = 0;
LABEL_51:
        sub_252976E10((uint64_t)v36, (uint64_t)v52 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_269C3DC48);
        uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DC50);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v49 - 8) + 48))((char *)v52 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v49) == 1)return swift_release(); {
        uint64_t v50 = *(void **)((char *)v52 + *(int *)(v49 + 48) - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0));
        }
        objc_msgSend(v50, sel_removeFromParentNode);

        uint64_t v51 = sub_25298CF68();
        uint64_t v34 = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v51 - 8) + 8))((char *)v52 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0), v51);
      }
      unint64_t v37 = __clz(__rbit64(v31));
      v31 &= v31 - 1;
      unint64_t v38 = v37 | (v35 << 6);
      goto LABEL_32;
    }
    uint64_t v24 = *(void **)((char *)v52 + *(int *)(v23 + 48) - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
    objc_msgSend(v24, sel_removeFromParentNode);

    uint64_t v25 = sub_25298CFA8();
    uint64_t v7 = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v25 - 8) + 8))((char *)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v25);
  }
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
  return result;
}

uint64_t sub_25297D7F8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = a3;
  id v52 = a2;
  uint64_t v5 = sub_25298CFA8();
  uint64_t v50 = *(void *)(v5 - 8);
  uint64_t v51 = v5;
  MEMORY[0x270FA5388](v5);
  unint64_t v46 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_25298D098();
  uint64_t v48 = *(void *)(v44 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v44);
  int64_t v47 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  int64_t v45 = (char *)&v41 - v9;
  uint64_t v43 = sub_25298D048();
  uint64_t v10 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  unint64_t v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_25298D068();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x263F8EE80];
  *(void *)(v3 + 16) = MEMORY[0x263F8EE80];
  id v18 = (uint64_t *)(v3 + 16);
  *(void *)(v3 + 32) = v17;
  uint64_t v41 = v3 + 32;
  uint64_t v42 = v3;
  sub_25298D078();
  sub_25298D058();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v3 + OBJC_IVAR____TtC7HumanUI17Skeleton3DOverlay_topology, v12, v43);
  int64_t v19 = v49;
  unint64_t v20 = v45;
  sub_25298D0A8();
  uint64_t v22 = v47;
  uint64_t v21 = v48;
  uint64_t v23 = v44;
  (*(void (**)(char *, void, uint64_t))(v48 + 104))(v47, *MEMORY[0x263F49D70], v44);
  sub_25297FF18(&qword_269C3DC28, MEMORY[0x263F49D80]);
  char v24 = sub_25298D488();
  uint64_t v25 = *(void (**)(char *, uint64_t))(v21 + 8);
  v25(v22, v23);
  v25(v20, v23);
  uint64_t v26 = v42;
  *(unsigned char *)(v42 + 24) = (v24 & 1) == 0;
  uint64_t v27 = sub_25297DD64(a1, (uint64_t)v19);
  swift_beginAccess();
  *id v18 = v27;
  swift_bridgeObjectRelease();
  uint64_t v28 = (uint64_t)v46;
  sub_25298CF88();
  swift_beginAccess();
  uint64_t v29 = *v18;
  if (*(void *)(*v18 + 16) && (unint64_t v30 = sub_252982364(v28), (v31 & 1) != 0))
  {
    uint64_t v32 = *(void **)(*(void *)(v29 + 56) + 8 * v30);
    swift_endAccess();
    uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
    id v34 = v32;
    v33(v28, v51);
    sub_25298CF18();
    objc_msgSend(v34, sel_setSimdPosition_, v35);
    id v36 = v52;
    objc_msgSend(v52, sel_addChildNode_, v34);
    unint64_t v37 = sub_25297F954(a1, (uint64_t)v19);

    uint64_t v38 = sub_25298D0C8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v38 - 8) + 8))(a1, v38);
    swift_beginAccess();
    *(void *)(v26 + 32) = v37;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_endAccess();

    uint64_t v39 = sub_25298D0C8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v39 - 8) + 8))(a1, v39);
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v28, v51);
  }
  return v26;
}

uint64_t sub_25297DD64(uint64_t a1, uint64_t a2)
{
  uint64_t v53 = a1;
  uint64_t v61 = sub_25298CFD8();
  uint64_t v3 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v5 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25298CFA8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v52 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v52 - v14;
  sub_25298CF88();
  uint64_t v55 = a2;
  id v16 = sub_25297F4F4((uint64_t)v15, a2);
  id v66 = *(void (**)(char *, uint64_t))(v7 + 8);
  v66(v15, v6);
  sub_25298CF18();
  objc_msgSend(v16, sel_setSimdPosition_, v17);
  sub_25298CF88();
  id v18 = v16;
  uint64_t v19 = MEMORY[0x263F8EE80];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v69 = v19;
  id v57 = v18;
  sub_2529838C4((uint64_t)v18, (uint64_t)v15, isUniquelyReferenced_nonNull_native);
  uint64_t v21 = v69;
  swift_bridgeObjectRelease();
  uint64_t v59 = v15;
  uint64_t v65 = v7 + 8;
  v66(v15, v6);
  uint64_t v22 = sub_25298CFF8();
  uint64_t v23 = *(void *)(v22 + 16);
  if (!v23)
  {

    swift_bridgeObjectRelease();
    return v21;
  }
  uint64_t v60 = v21;
  uint64_t v25 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
  uint64_t v24 = v3 + 16;
  id v64 = v25;
  unint64_t v26 = (*(unsigned __int8 *)(v24 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 64);
  uint64_t v52 = v22;
  unint64_t v27 = v22 + v26;
  uint64_t v28 = *(void *)(v24 + 56);
  uint64_t v62 = (void (**)(char *, uint64_t))(v24 - 8);
  uint64_t v63 = v28;
  uint64_t v29 = v61;
  uint64_t v54 = v10;
  do
  {
    uint64_t v31 = v24;
    v64(v5, v27, v29);
    sub_25298CFB8();
    sub_25298CF88();
    sub_25297FF18(&qword_269C3DC30, MEMORY[0x263F49D38]);
    sub_25298D4C8();
    sub_25298D4C8();
    if (v69 == v67 && v70 == v68)
    {
      swift_bridgeObjectRelease_n();
      unint64_t v30 = v66;
      v66(v10, v6);
      v30(v13, v6);
LABEL_4:
      uint64_t v24 = v31;
      goto LABEL_5;
    }
    char v33 = sub_25298D708();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v34 = v66;
    v66(v10, v6);
    v34(v13, v6);
    if (v33)
    {
      uint64_t v29 = v61;
      goto LABEL_4;
    }
    uint64_t v35 = (uint64_t)v59;
    sub_25298CFB8();
    id v36 = sub_25297F4F4(v35, v55);
    unint64_t v37 = (void (*)(uint64_t, uint64_t))v34;
    uint64_t v38 = v36;
    v37(v35, v6);
    int v39 = *(unsigned __int8 *)(v56 + 24);
    sub_25298CFC8();
    float32x4_t v58 = v40;
    if (v39 == 1)
    {
      id v41 = v57;
      objc_msgSend(v57, sel_simdPosition);
    }
    else
    {
      sub_25298CF18();
      float32x4_t v58 = vaddq_f32(v46, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v43, v58.f32[0]), v44, *(float32x2_t *)v58.f32, 1), v45, v58, 2));
      id v41 = v57;
      objc_msgSend(v57, sel_simdPosition, v52, v53);
    }
    objc_msgSend(v38, sel_setSimdPosition_, COERCE_DOUBLE(vsub_f32(*(float32x2_t *)v58.f32, v42)), v52);
    objc_msgSend(v41, sel_addChildNode_, v38);
    uint64_t v47 = (uint64_t)v59;
    sub_25298CFB8();
    id v48 = v38;
    uint64_t v49 = v60;
    char v50 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v69 = v49;
    sub_2529838C4((uint64_t)v48, v47, v50);
    uint64_t v60 = v69;
    swift_bridgeObjectRelease();
    v66((char *)v47, v6);

    uint64_t v29 = v61;
    uint64_t v24 = v31;
    uint64_t v10 = v54;
LABEL_5:
    (*v62)(v5, v29);
    v27 += v63;
    --v23;
  }
  while (v23);

  swift_bridgeObjectRelease();
  return v60;
}

id sub_25297E318(uint64_t a1, uint64_t a2)
{
  uint64_t v69 = a2;
  uint64_t v4 = sub_25298CFD8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25298CFA8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v71 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v77 = (char *)&v64 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  id v16 = (char *)&v64 - v15;
  MEMORY[0x270FA5388](v14);
  id v18 = (char *)&v64 - v17;
  sub_25298CF88();
  uint64_t v70 = (uint64_t *)(v2 + 16);
  swift_beginAccess();
  uint64_t v66 = v2;
  uint64_t v19 = *(void *)(v2 + 16);
  if (!*(void *)(v19 + 16) || (unint64_t v20 = sub_252982364((uint64_t)v18), (v21 & 1) == 0))
  {
    swift_endAccess();
    id result = (id)(*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v18, v8);
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  uint64_t v22 = *(void **)(*(void *)(v19 + 56) + 8 * v20);
  swift_endAccess();
  uint64_t v23 = *(void (**)(void, void))(v9 + 8);
  id v24 = v22;
  uint64_t v78 = (void (*)(char *, uint64_t))v23;
  uint64_t v79 = v9 + 8;
  v23(v18, v8);
  id result = objc_msgSend(v24, sel_geometry);
  if (!result)
  {
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
    return result;
  }
  unint64_t v26 = result;
  self;
  id v27 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_firstMaterial);

  if (v27)
  {
    id v28 = objc_msgSend(v27, sel_diffuse);

    objc_msgSend(v28, sel_setContents_, v69);
  }
  id result = objc_msgSend(v24, sel_geometry);
  if (!result) {
    goto LABEL_39;
  }
  uint64_t v29 = result;
  self;
  id v30 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_firstMaterial);

  if (v30)
  {
    id v31 = objc_msgSend(v30, sel_ambientOcclusion);

    objc_msgSend(v31, sel_setContents_, v69);
  }
  id v32 = v24;
  sub_25298CF18();
  objc_msgSend(v32, sel_setSimdPosition_, v33);

  uint64_t v34 = sub_25298CFF8();
  uint64_t v35 = *(void *)(v34 + 16);
  if (v35)
  {
    id v67 = v32;
    uint64_t v65 = a1;
    uint64_t v75 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    unint64_t v36 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v64 = v34;
    unint64_t v37 = v34 + v36;
    uint64_t v76 = v5 + 16;
    uint64_t v72 = *(void *)(v5 + 72);
    uint64_t v73 = (void (**)(char *, uint64_t))(v5 + 8);
    long long v74 = v16;
    while (1)
    {
      uint64_t v38 = v4;
      v75(v7, v37, v4);
      sub_25298CFB8();
      int v39 = v77;
      sub_25298CF88();
      sub_25297FF18(&qword_269C3DC30, MEMORY[0x263F49D38]);
      sub_25298D4C8();
      sub_25298D4C8();
      if (v82 == v80 && v83 == v81)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v53 = v78;
        v78(v39, v8);
        v53(v16, v8);
      }
      else
      {
        char v41 = sub_25298D708();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        float32x2_t v42 = v78;
        v78(v39, v8);
        v42(v16, v8);
        if ((v41 & 1) == 0)
        {
          uint64_t v43 = (uint64_t)v71;
          sub_25298CFB8();
          float32x4_t v44 = v70;
          swift_beginAccess();
          uint64_t v45 = *v44;
          if (*(void *)(v45 + 16))
          {
            unint64_t v46 = sub_252982364(v43);
            if (v47)
            {
              id v48 = *(void **)(*(void *)(v45 + 56) + 8 * v46);
              swift_endAccess();
              id v49 = v48;
              v78((char *)v43, v8);
              int v50 = *(unsigned __int8 *)(v66 + 24);
              sub_25298CFC8();
              float32x4_t v68 = v51;
              id v16 = v74;
              if (v50 == 1)
              {
                objc_msgSend(v67, sel_simdPosition);
              }
              else
              {
                sub_25298CF18();
                float32x4_t v68 = vaddq_f32(v57, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v54, v68.f32[0]), v55, *(float32x2_t *)v68.f32, 1), v56, v68, 2));
                objc_msgSend(v67, sel_simdPosition, v64, v65);
              }
              objc_msgSend(v49, sel_setSimdPosition_, COERCE_DOUBLE(vsub_f32(*(float32x2_t *)v68.f32, v52)), v64, v65);
              id result = objc_msgSend(v49, sel_geometry);
              if (!result) {
                goto LABEL_36;
              }
              float32x4_t v58 = result;
              self;
              id v59 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_firstMaterial);

              if (v59)
              {
                id v60 = objc_msgSend(v59, sel_diffuse);

                objc_msgSend(v60, sel_setContents_, v69);
              }
              id result = objc_msgSend(v49, sel_geometry);
              if (!result) {
                goto LABEL_37;
              }
              uint64_t v61 = result;
              self;
              id v62 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_firstMaterial);

              if (v62)
              {
                id v63 = objc_msgSend(v62, sel_ambientOcclusion);

                objc_msgSend(v63, sel_setContents_, v69);
                uint64_t v4 = v38;
                (*v73)(v7, v38);
              }
              else
              {
                uint64_t v4 = v38;
                (*v73)(v7, v38);
              }
              goto LABEL_23;
            }
          }
          swift_endAccess();
          v78((char *)v43, v8);
        }
      }
      uint64_t v4 = v38;
      (*v73)(v7, v38);
      id v16 = v74;
LABEL_23:
      v37 += v72;
      if (!--v35)
      {

        return (id)swift_bridgeObjectRelease();
      }
    }
  }

  return (id)swift_bridgeObjectRelease();
}

id sub_25297EB8C(uint64_t a1, uint64_t a2)
{
  uint64_t v93 = a2;
  uint64_t v4 = sub_25298CFD8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v82 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_25298CF68();
  uint64_t v8 = *(void *)(v91 - 8);
  MEMORY[0x270FA5388](v91);
  uint64_t v10 = (char *)v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25298CFA8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v82 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25298CF88();
  swift_beginAccess();
  uint64_t v92 = v2;
  uint64_t v15 = *(void *)(v2 + 16);
  if (!*(void *)(v15 + 16) || (unint64_t v16 = sub_252982364((uint64_t)v14), (v17 & 1) == 0))
  {
    swift_endAccess();
    return (id)(*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  uint64_t v96 = v5;
  id v18 = *(void **)(*(void *)(v15 + 56) + 8 * v16);
  swift_endAccess();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v12 + 8);
  id v20 = v18;
  uint64_t v21 = v11;
  id v22 = v20;
  v19(v14, v21);
  sub_25298CF18();
  objc_msgSend(v22, sel_setSimdPosition_, v23);
  uint64_t v24 = sub_25298CFE8();
  uint64_t v25 = *(void *)(v24 + 16);
  if (!v25)
  {

    return (id)swift_bridgeObjectRelease();
  }
  uint64_t v89 = v4;
  id v90 = v22;
  v82[2] = a1;
  unint64_t v26 = (uint64_t *)(v92 + 32);
  uint64_t v28 = v8 + 16;
  id v27 = *(void (**)(void, void, void))(v8 + 16);
  unint64_t v29 = (*(unsigned __int8 *)(v28 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 64);
  v82[1] = v24;
  unint64_t v30 = v24 + v29;
  uint64_t v86 = (void (**)(char *, uint64_t))(v96 + 8);
  id v31 = (void (**)(char *, uint64_t))(v28 - 8);
  uint64_t v96 = *(void *)(v28 + 56);
  uint64_t v84 = v7;
  uint64_t v32 = v91;
  unint64_t v87 = (uint64_t *)(v92 + 32);
  uint64_t v88 = v28;
  uint64_t v83 = v27;
  uint64_t v85 = (void (**)(char *, uint64_t))(v28 - 8);
  v27(v10, v24 + v29, v91);
  while (1)
  {
    swift_beginAccess();
    uint64_t v33 = *v26;
    if (!*(void *)(*v26 + 16) || (unint64_t v34 = sub_252982550((uint64_t)v10), (v35 & 1) == 0))
    {
      swift_endAccess();
      goto LABEL_6;
    }
    unint64_t v36 = *(void **)(*(void *)(v33 + 56) + 8 * v34);
    swift_endAccess();
    int v37 = *(unsigned __int8 *)(v92 + 24);
    id v38 = v36;
    sub_25298CF58();
    sub_25298CFC8();
    float32x4_t v95 = v39;
    float32x4_t v40 = *v86;
    uint64_t v41 = v89;
    (*v86)(v7, v89);
    if (v37 == 1)
    {
      id v42 = v90;
      objc_msgSend(v90, sel_simdPosition);
      *(float32x2_t *)v44.f32 = vsub_f32(*(float32x2_t *)v95.f32, v43);
      v44.f32[2] = v95.f32[2] - v45;
      v44.i32[3] = 0;
      float32x4_t v95 = v44;
      sub_25298CF48();
      sub_25298CFC8();
      float32x4_t v94 = v46;
      v40(v7, v41);
      objc_msgSend(v42, sel_simdPosition);
      *(float32x2_t *)v49.f32 = vsub_f32(*(float32x2_t *)v94.f32, v48);
      v49.i32[3] = 0;
      float v50 = v94.f32[2];
    }
    else
    {
      sub_25298CF18();
      float32x4_t v95 = vaddq_f32(v54, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v51, v95.f32[0]), v52, *(float32x2_t *)v95.f32, 1), v53, v95, 2));
      sub_25298CF48();
      sub_25298CFC8();
      float32x4_t v94 = v55;
      v40(v7, v41);
      sub_25298CF18();
      float32x4_t v94 = vaddq_f32(v59, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v56, v94.f32[0]), v57, *(float32x2_t *)v94.f32, 1), v58, v94, 2));
      float v60 = v95.f32[2];
      id v61 = v90;
      objc_msgSend(v90, sel_simdPosition);
      *(float32x2_t *)v63.f32 = vsub_f32(*(float32x2_t *)v95.f32, v62);
      v63.f32[2] = v60 - v64;
      v63.i32[3] = 0;
      float32x4_t v95 = v63;
      float v50 = v94.f32[2];
      objc_msgSend(v61, sel_simdPosition);
      *(float32x2_t *)v49.f32 = vsub_f32(*(float32x2_t *)v94.f32, v65);
      v49.i32[3] = 0;
    }
    float v66 = v50 - v47;
    float v67 = v95.f32[2];
    float32x4_t v94 = v49;
    objc_msgSend(v38, sel_setSimdPosition_, COERCE_DOUBLE(vmul_f32(vadd_f32(*(float32x2_t *)v49.f32, *(float32x2_t *)v95.f32), (float32x2_t)0x3F0000003F000000)));
    id result = objc_msgSend(v38, sel_geometry);
    unint64_t v26 = v87;
    id v31 = v85;
    if (!result) {
      break;
    }
    uint64_t v69 = result;
    float32x4_t v71 = v94;
    v70.i64[1] = v95.i64[1];
    *(float32x2_t *)v70.f32 = vsub_f32(*(float32x2_t *)v94.f32, *(float32x2_t *)v95.f32);
    v71.f32[0] = v66 - v67;
    float32x4_t v94 = v71;
    float32x4_t v95 = v70;
    v70.f32[2] = v66 - v67;
    float32x4_t v72 = vmulq_f32(v70, v70);
    float v73 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v72, 2), vaddq_f32(v72, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v72.f32, 1))).f32[0]);
    self;
    objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setHeight_, v73);

    id result = objc_msgSend(v38, sel_geometry);
    uint64_t v7 = v84;
    if (!result) {
      goto LABEL_26;
    }
    long long v74 = result;
    self;
    id v75 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_firstMaterial);

    if (v75)
    {
      id v76 = objc_msgSend(v75, sel_diffuse);

      objc_msgSend(v76, sel_setContents_, v93);
    }
    id result = objc_msgSend(v38, sel_geometry);
    if (!result) {
      goto LABEL_27;
    }
    uint64_t v77 = result;
    self;
    id v78 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_firstMaterial);

    if (v78)
    {
      id v79 = objc_msgSend(v78, sel_ambientOcclusion);

      objc_msgSend(v79, sel_setContents_, v93);
    }
    *(float *)&uint64_t v80 = acosf(v94.f32[0] / v73);
    v94.i64[0] = v80;
    atan2f(v95.f32[1], v95.f32[0]);
    LODWORD(v81) = 1070141402;
    HIDWORD(v81) = v94.i32[0];
    objc_msgSend(v38, sel_setSimdEulerAngles_, v81);

    uint64_t v32 = v91;
    id v27 = v83;
LABEL_6:
    (*v31)(v10, v32);
    v30 += v96;
    if (!--v25)
    {

      return (id)swift_bridgeObjectRelease();
    }
    v27(v10, v30, v32);
  }
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_25297F344()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC7HumanUI17Skeleton3DOverlay_topology;
  uint64_t v2 = sub_25298D048();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_25297F3F4()
{
  return type metadata accessor for Skeleton3DOverlay();
}

uint64_t type metadata accessor for Skeleton3DOverlay()
{
  uint64_t result = qword_269C3DC18;
  if (!qword_269C3DC18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25297F448()
{
  uint64_t result = sub_25298D048();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_25297F4F4(uint64_t a1, uint64_t a2)
{
  id v3 = objc_msgSend(self, sel_sphereWithRadius_, 1.0);
  id v4 = objc_msgSend(self, sel_nodeWithGeometry_, v3);
  id v5 = objc_msgSend(v4, sel_geometry);
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = objc_msgSend(v5, sel_firstMaterial);

    if (v7)
    {
      objc_msgSend(v7, sel_setLightingModelName_, *MEMORY[0x263F16BA0]);
    }
  }
  id v8 = objc_msgSend(v4, sel_geometry);
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = objc_msgSend(v8, sel_firstMaterial);

    if (v10)
    {
      id v11 = objc_msgSend(v10, sel_diffuse);

      objc_msgSend(v11, sel_setContents_, a2);
    }
  }
  id v12 = objc_msgSend(v4, sel_geometry);
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = objc_msgSend(v12, sel_firstMaterial);

    if (v14)
    {
      objc_msgSend(v14, sel_setDoubleSided_, 0);
    }
  }
  sub_25298CF98();
  uint64_t v15 = (void *)sub_25298D498();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setName_, v15);

  return v4;
}

id sub_25297F6D4(uint64_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4)
{
  double v5 = *(double *)a2.i64;
  *(float32x2_t *)a2.f32 = vsub_f32(*(float32x2_t *)a3.f32, *(float32x2_t *)a4.f32);
  float v6 = a3.f32[2];
  float v7 = a4.f32[2];
  a2.f32[2] = a3.f32[2] - a4.f32[2];
  float32x4_t v8 = vmulq_f32(a2, a2);
  float v9 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 2), vaddq_f32(v8, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 1))).f32[0]);
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F16A08]), sel_init);
  objc_msgSend(v10, sel_setHeight_, v9);
  objc_msgSend(v10, sel_setRadius_, v5);
  objc_msgSend(v10, sel_setHeightSegmentCount_, 30);
  objc_msgSend(v10, sel_setRadialSegmentCount_, 30);
  id v11 = objc_msgSend(v10, sel_firstMaterial);
  if (v11)
  {
    id v12 = v11;
    objc_msgSend(v11, sel_setLightingModelName_, *MEMORY[0x263F16BA0]);
  }
  id v13 = objc_msgSend(v10, sel_firstMaterial);
  if (v13)
  {
    id v14 = v13;
    id v15 = objc_msgSend(v13, sel_diffuse);

    objc_msgSend(v15, sel_setContents_, a1);
  }
  id v16 = objc_msgSend(v10, sel_firstMaterial);
  if (v16)
  {
    char v17 = v16;
    objc_msgSend(v16, sel_setDoubleSided_, 0);
  }
  id v18 = objc_msgSend(self, sel_nodeWithGeometry_, v10);
  objc_msgSend(v18, sel_setSimdPosition_, COERCE_DOUBLE(vmul_f32(vadd_f32(*(float32x2_t *)a3.f32, *(float32x2_t *)a4.f32), (float32x2_t)0x3F0000003F000000)));
  objc_msgSend(v18, sel_setOpacity_, 1.0);
  objc_msgSend(v18, sel_setCastsShadow_, 1);
  float v22 = acosf((float)(v7 - v6) / v9);
  unint64_t v19 = vsubq_f32(a4, a3).u64[0];
  atan2f(*((float *)&v19 + 1), *(float *)&v19);
  LODWORD(v20) = 1070141402;
  *((float *)&v20 + 1) = v22;
  objc_msgSend(v18, sel_setSimdEulerAngles_, v20);

  return v18;
}

unint64_t sub_25297F954(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v73 = a2;
  v65[1] = a1;
  uint64_t v79 = sub_25298CFD8();
  uint64_t v4 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  uint64_t v77 = (char *)v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = sub_25298CF68();
  uint64_t v6 = *(void *)(v78 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v78);
  float32x4_t v72 = (char *)v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)v65 - v9;
  uint64_t v11 = sub_25298CFA8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  id v14 = (char *)v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25298CF88();
  swift_beginAccess();
  uint64_t v15 = *(void *)(v2 + 16);
  if (*(void *)(v15 + 16) && (unint64_t v16 = sub_252982364((uint64_t)v14), (v17 & 1) != 0))
  {
    id v18 = *(void **)(*(void *)(v15 + 56) + 8 * v16);
    swift_endAccess();
    unint64_t v19 = *(void (**)(char *, uint64_t))(v12 + 8);
    id v20 = v18;
    v19(v14, v11);
    sub_25298CF18();
    objc_msgSend(v20, sel_setSimdPosition_, v21);
    uint64_t v22 = sub_25298CFE8();
    uint64_t v23 = *(void *)(v22 + 16);
    if (v23)
    {
      id v71 = v20;
      uint64_t v25 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
      uint64_t v24 = v6 + 16;
      int v69 = *(unsigned __int8 *)(v3 + 24);
      unint64_t v26 = (*(unsigned __int8 *)(v24 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 64);
      v65[0] = v22;
      unint64_t v27 = v22 + v26;
      uint64_t v68 = *(void *)(v24 + 56);
      uint64_t v28 = (void (**)(char *, uint64_t))(v4 + 8);
      uint64_t v76 = v24;
      float v66 = (void (**)(uint64_t, uint64_t))(v24 - 8);
      uint64_t v29 = MEMORY[0x263F8EE80];
      float v67 = (void (**)(char *, uint64_t))(v4 + 8);
      float32x4_t v70 = v25;
      v25(v10, v22 + v26, v78);
      while (1)
      {
        float32x4_t v56 = v77;
        sub_25298CF58();
        sub_25298CFC8();
        float32x4_t v75 = v57;
        float32x4_t v58 = *v28;
        (*v28)(v56, v79);
        if (v69)
        {
          id v41 = v71;
          objc_msgSend(v71, sel_simdPosition);
          *(float32x2_t *)v60.f32 = vsub_f32(*(float32x2_t *)v75.f32, v59);
          v60.f32[2] = v75.f32[2] - v61;
          v60.i32[3] = 0;
          float32x4_t v75 = v60;
          float32x2_t v62 = v77;
          sub_25298CF48();
          sub_25298CFC8();
          float32x4_t v74 = v63;
          v58(v62, v79);
          objc_msgSend(v41, sel_simdPosition);
          *(float32x2_t *)v47.f32 = vsub_f32(*(float32x2_t *)v74.f32, *(float32x2_t *)v46.f32);
          v47.i32[3] = 0;
          float v45 = v74.f32[2];
        }
        else
        {
          unint64_t v30 = v77;
          sub_25298CF18();
          float32x4_t v75 = vaddq_f32(v34, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v31, v75.f32[0]), v32, *(float32x2_t *)v75.f32, 1), v33, v75, 2));
          sub_25298CF48();
          sub_25298CFC8();
          float32x4_t v74 = v35;
          v58(v30, v79);
          sub_25298CF18();
          float32x4_t v74 = vaddq_f32(v39, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v36, v74.f32[0]), v37, *(float32x2_t *)v74.f32, 1), v38, v74, 2));
          float v40 = v75.f32[2];
          id v41 = v71;
          objc_msgSend(v71, sel_simdPosition, v65[0]);
          *(float32x2_t *)v43.f32 = vsub_f32(*(float32x2_t *)v75.f32, v42);
          v43.f32[2] = v40 - v44;
          v43.i32[3] = 0;
          float32x4_t v75 = v43;
          float v45 = v74.f32[2];
          objc_msgSend(v41, sel_simdPosition);
          *(float32x2_t *)v47.f32 = vsub_f32(*(float32x2_t *)v74.f32, *(float32x2_t *)v46.f32);
          v47.i32[3] = 0;
        }
        v47.f32[2] = v45 - v46.f32[2];
        v46.i64[0] = 0.5;
        id v48 = sub_25297F6D4(v73, v46, v75, v47);
        objc_msgSend(v41, sel_addChildNode_, v48);
        uint64_t v49 = (uint64_t)v72;
        uint64_t v50 = v78;
        float32x4_t v51 = v70;
        v70(v72, (unint64_t)v10, v78);
        id v52 = v48;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v80 = v29;
        sub_252983AB4((uint64_t)v52, v49, isUniquelyReferenced_nonNull_native);
        uint64_t v29 = v80;
        swift_bridgeObjectRelease();
        float32x4_t v54 = *v66;
        (*v66)(v49, v50);

        v54((uint64_t)v10, v50);
        float32x4_t v55 = v51;
        uint64_t v28 = v67;
        v27 += v68;
        if (!--v23) {
          break;
        }
        v55(v10, v27, v78);
      }

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return MEMORY[0x263F8EE80];
    }
  }
  else
  {
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return sub_252980DB4(MEMORY[0x263F8EE78]);
  }
  return v29;
}

uint64_t sub_25297FF18(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25297FF60()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25298D138();
  swift_release();
  return swift_release();
}

uint64_t sub_25297FFD8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC7HumanUI12RendererInfo__repetition;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DC78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_25298007C()
{
  return type metadata accessor for RendererInfo();
}

uint64_t type metadata accessor for RendererInfo()
{
  uint64_t result = qword_269C3DC60;
  if (!qword_269C3DC60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2529800D0()
{
  sub_252980160();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_252980160()
{
  if (!qword_269C3DC70)
  {
    sub_25298CDE8();
    unint64_t v0 = sub_25298D158();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269C3DC70);
    }
  }
}

id sub_2529802F4()
{
  v2.receiver = v0;
  v2.super_class = (Class)_s13LandmarkLayerCMa();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s13LandmarkLayerCMa()
{
  return self;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

ValueMetadata *type metadata accessor for PreviewControllerMeshRepresentable()
{
  return &type metadata for PreviewControllerMeshRepresentable;
}

id sub_2529803A0()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for PreviewControllerMesh_iOS());
  return objc_msgSend(v0, sel_init);
}

void sub_2529803D8()
{
  if (*(void *)(*v0 + 16)) {
    sub_25297C7E0(*v0);
  }
}

uint64_t sub_252980468()
{
  return sub_25298D2E8();
}

uint64_t sub_2529804C0()
{
  return sub_25298D2A8();
}

void sub_252980518()
{
}

unint64_t sub_252980544()
{
  unint64_t result = qword_269C3DC80;
  if (!qword_269C3DC80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3DC80);
  }
  return result;
}

unint64_t sub_252980598()
{
  unint64_t result = qword_269C3DC88;
  if (!qword_269C3DC88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3DC88);
  }
  return result;
}

void sub_2529805EC(uint64_t a1)
{
  uint64_t v74 = sub_25298D098();
  uint64_t v4 = *(void *)(v74 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v74);
  uint64_t v73 = (char *)v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  float32x4_t v72 = (char *)v59 - v7;
  uint64_t v8 = sub_25298D0C8();
  uint64_t v64 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v59 - v12;
  uint64_t v14 = v1 + OBJC_IVAR____TtC7HumanUI23PreviewController3D_iOS_currentSkeleton3DOverlays;
  swift_beginAccess();
  uint64_t v66 = v14;
  if (*(void *)(*(void *)v14 + 16))
  {
    uint64_t v62 = v4;
    id v71 = v11;
    v59[1] = v2;
    int64_t v15 = *(void *)(a1 + 16);
    unint64_t v16 = (void *)MEMORY[0x263F8EE78];
    uint64_t v65 = v1;
    uint64_t v76 = v8;
    uint64_t v60 = a1;
    v59[0] = v15;
    if (v15)
    {
      float32x4_t v75 = (void *)MEMORY[0x263F8EE78];
      sub_25298452C(0, v15, 0);
      char v17 = *(char **)(v64 + 16);
      unint64_t v18 = a1 + ((*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80));
      uint64_t v68 = *(void (**)(uint64_t, unint64_t, uint64_t))(v64 + 72);
      int v69 = v17;
      float32x4_t v70 = (void (**)(char *, void, uint64_t))(v64 + 16);
      unint64_t v19 = (void (**)(char *, uint64_t))(v64 + 8);
      do
      {
        uint64_t v20 = v76;
        ((void (*)(char *, unint64_t, uint64_t))v69)(v13, v18, v76);
        uint64_t v21 = sub_25298CF38();
        (*v19)(v13, v20);
        unint64_t v16 = v75;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25298452C(0, v16[2] + 1, 1);
          unint64_t v16 = v75;
        }
        unint64_t v23 = v16[2];
        unint64_t v22 = v16[3];
        if (v23 >= v22 >> 1)
        {
          sub_25298452C(v22 > 1, v23 + 1, 1);
          unint64_t v16 = v75;
        }
        v16[2] = v23 + 1;
        v16[v23 + 4] = v21;
        v18 += (unint64_t)v68;
        --v15;
      }
      while (v15);
      uint64_t v1 = v65;
      uint64_t v8 = v76;
    }
    uint64_t v24 = *(void *)(v1 + OBJC_IVAR____TtC7HumanUI23PreviewController3D_iOS_previousSkeletons);
    int64_t v25 = *(void *)(v24 + 16);
    unint64_t v26 = (void *)MEMORY[0x263F8EE78];
    if (v25)
    {
      float32x4_t v75 = (void *)MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_25298452C(0, v25, 0);
      unint64_t v27 = *(char **)(v64 + 16);
      uint64_t v28 = *(unsigned __int8 *)(v64 + 80);
      uint64_t v63 = v24;
      uint64_t v29 = v24 + ((v28 + 32) & ~v28);
      uint64_t v68 = *(void (**)(uint64_t, unint64_t, uint64_t))(v64 + 72);
      int v69 = v27;
      float32x4_t v70 = (void (**)(char *, void, uint64_t))(v64 + 16);
      float v67 = (void (**)(char *, uint64_t))(v64 + 8);
      do
      {
        ((void (*)(char *, uint64_t, uint64_t))v69)(v13, v29, v8);
        uint64_t v30 = sub_25298CF38();
        (*v67)(v13, v8);
        unint64_t v26 = v75;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25298452C(0, v26[2] + 1, 1);
          unint64_t v26 = v75;
        }
        unint64_t v32 = v26[2];
        unint64_t v31 = v26[3];
        if (v32 >= v31 >> 1)
        {
          sub_25298452C(v31 > 1, v32 + 1, 1);
          unint64_t v26 = v75;
        }
        void v26[2] = v32 + 1;
        v26[v32 + 4] = v30;
        v29 += (uint64_t)v68;
        --v25;
        uint64_t v8 = v76;
      }
      while (v25);
      swift_bridgeObjectRelease();
      uint64_t v1 = v65;
    }
    BOOL v33 = sub_252980FA0(v26, v16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a1 = v60;
    if (v33)
    {
      uint64_t v34 = v59[0];
      if (v59[0])
      {
        uint64_t v68 = *(void (**)(uint64_t, unint64_t, uint64_t))(v64 + 16);
        int v69 = (char *)OBJC_IVAR____TtC7HumanUI23PreviewController3D_iOS_skeleton3DColor;
        unint64_t v35 = v60 + ((*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80));
        float v67 = *(void (***)(char *, uint64_t))(v64 + 72);
        LODWORD(v63) = *MEMORY[0x263F49D68];
        float32x4_t v70 = (void (**)(char *, void, uint64_t))(v62 + 104);
        float32x4_t v36 = (void (**)(char *, uint64_t))(v62 + 8);
        LODWORD(v62) = *MEMORY[0x263F49D78];
        v64 += 16;
        float v61 = (void (**)(uint64_t, uint64_t))(v64 - 8);
        swift_bridgeObjectRetain();
        uint64_t v37 = (uint64_t)v71;
        do
        {
          v68(v37, v35, v8);
          float v40 = v72;
          sub_25298D0A8();
          id v41 = *v70;
          float32x2_t v42 = v73;
          uint64_t v43 = v74;
          (*v70)(v73, v63, v74);
          char v44 = sub_25298D088();
          float v45 = *v36;
          (*v36)(v42, v43);
          v45(v40, v43);
          if (v44)
          {
            id v46 = objc_msgSend(self, sel_redColor);
            float32x4_t v47 = *(void **)&v69[v65];
            *(void *)&v69[v65] = v46;
          }
          id v48 = v72;
          sub_25298D0A8();
          uint64_t v49 = v73;
          uint64_t v50 = v74;
          v41(v73, v62, v74);
          char v51 = sub_25298D088();
          v45(v49, v50);
          v45(v48, v50);
          if (v51)
          {
            id v52 = objc_msgSend(self, sel_greenColor);
            float32x4_t v53 = *(void **)&v69[v65];
            *(void *)&v69[v65] = v52;
          }
          uint64_t v37 = (uint64_t)v71;
          uint64_t v54 = sub_25298CF38();
          uint64_t v8 = v76;
          if (*(void *)(*(void *)v66 + 16) && (sub_25298250C(v54), (v55 & 1) != 0))
          {
            float32x4_t v38 = *(void **)&v69[v65];
            swift_retain();
            id v39 = v38;
            sub_25297E318(v37, (uint64_t)v39);
            sub_25297EB8C(v37, (uint64_t)v39);
            swift_release();
          }
          else
          {
            uint64_t v56 = sub_25298CF38();
            if (*(void *)(*(void *)v66 + 16))
            {
              sub_25298250C(v56);
              if (v57)
              {
                swift_retain();
                uint64_t v58 = sub_25298CF38();
                swift_beginAccess();
                sub_2529822C4(v58);
                swift_endAccess();
                swift_release();
                sub_25297D0BC();
                swift_release();
              }
            }
          }
          (*v61)(v37, v8);
          v35 += (unint64_t)v67;
          --v34;
        }
        while (v34);
        a1 = v60;
        swift_bridgeObjectRelease();
        uint64_t v1 = v65;
      }
    }
    else
    {
      sub_2529818E4();
    }
  }
  else
  {
    sub_2529818E4();
    sub_252981CD4(a1);
    if (v2) {
      return;
    }
  }
  *(void *)(v1 + OBJC_IVAR____TtC7HumanUI23PreviewController3D_iOS_previousSkeletons) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
}

unint64_t sub_252980DB4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DCC0);
    uint64_t v2 = (void *)sub_25298D6B8();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DCD8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    uint64_t v9 = *(int *)(v4 + 48);
    unint64_t v10 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v21[1] = a1;
    uint64_t v11 = a1 + v10;
    uint64_t v12 = *(void *)(v5 + 72);
    swift_retain();
    while (1)
    {
      sub_2529856D4(v11, (uint64_t)v7);
      unint64_t result = sub_252982550((uint64_t)v7);
      if (v14) {
        break;
      }
      unint64_t v15 = result;
      *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      uint64_t v16 = v2[6];
      uint64_t v17 = sub_25298CF68();
      unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v16 + *(void *)(*(void *)(v17 - 8) + 72) * v15, v7, v17);
      *(void *)(v2[7] + 8 * v15) = *(void *)&v7[v9];
      uint64_t v18 = v2[2];
      BOOL v19 = __OFADD__(v18, 1);
      uint64_t v20 = v18 + 1;
      if (v19) {
        goto LABEL_12;
      }
      v2[2] = v20;
      v11 += v12;
      if (!--v8)
      {
        swift_release();
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_12:
    __break(1u);
  }
  else
  {
LABEL_10:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  return result;
}

BOOL sub_252980FA0(void *a1, void *a2)
{
  if (a2[2] != a1[2]) {
    return 0;
  }
  uint64_t v6 = a2;
  swift_bridgeObjectRetain();
  sub_2529849A8((uint64_t *)&v6);
  uint64_t v3 = v6;
  uint64_t v6 = a1;
  swift_bridgeObjectRetain();
  sub_2529849A8((uint64_t *)&v6);
  BOOL v4 = sub_252982250(v3, v6);
  swift_release();
  swift_release();
  return v4;
}

id sub_2529810E8(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC7HumanUI23PreviewController3D_iOS_sceneView] = 0;
  uint64_t v6 = OBJC_IVAR____TtC7HumanUI23PreviewController3D_iOS_currentSkeleton3DOverlays;
  uint64_t v7 = MEMORY[0x263F8EE78];
  *(void *)&v3[v6] = sub_252985508(MEMORY[0x263F8EE78], &qword_269C3DCB0);
  *(void *)&v3[OBJC_IVAR____TtC7HumanUI23PreviewController3D_iOS_previousSkeletons] = v7;
  uint64_t v8 = OBJC_IVAR____TtC7HumanUI23PreviewController3D_iOS_skeleton3DColor;
  uint64_t v9 = self;
  unint64_t v10 = v3;
  *(void *)&v3[v8] = objc_msgSend(v9, sel_magentaColor);

  if (a2)
  {
    uint64_t v11 = (void *)sub_25298D498();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = 0;
  }
  v14.receiver = v10;
  v14.super_class = (Class)type metadata accessor for PreviewController3D_iOS();
  id v12 = objc_msgSendSuper2(&v14, sel_initWithNibName_bundle_, v11, a3);

  return v12;
}

void sub_252981334()
{
  uint64_t v1 = v0;
  uint64_t v38 = *MEMORY[0x263EF8340];
  swift_getObjectType();
  v37.receiver = v0;
  v37.super_class = (Class)type metadata accessor for PreviewController3D_iOS();
  objc_msgSendSuper2(&v37, sel_viewDidLoad);
  id v2 = objc_msgSend(v0, sel_view);
  if (!v2)
  {
    __break(1u);
LABEL_14:
    __break(1u);
  }
  uint64_t v3 = v2;
  id v4 = objc_msgSend(v2, sel_layer);

  uint64_t v5 = self;
  id v6 = objc_msgSend(v5, sel_clearColor);
  id v7 = objc_msgSend(v6, sel_CGColor);

  objc_msgSend(v4, sel_setBackgroundColor_, v7);
  uint64_t v35 = OBJC_IVAR____TtC7HumanUI23PreviewController3D_iOS_sceneView;
  uint64_t v8 = *(void **)&v1[OBJC_IVAR____TtC7HumanUI23PreviewController3D_iOS_sceneView];
  if (!v8) {
    goto LABEL_14;
  }
  id v9 = objc_msgSend(v8, sel_layer);
  id v10 = objc_msgSend(v5, sel_clearColor);
  id v11 = objc_msgSend(v10, sel_CGColor);

  objc_msgSend(v9, sel_setBackgroundColor_, v11);
  uint64_t v12 = sub_25298CD58();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v17 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v18 = (void *)sub_25298D498();
  id v19 = objc_msgSend(v17, sel_URLForResource_withExtension_, v18, 0);

  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DC00);
  uint64_t v21 = MEMORY[0x270FA5388](v20 - 8);
  unint64_t v23 = (char *)&v33 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v19)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v23, 1, 1, v12);
    goto LABEL_9;
  }
  uint64_t v34 = (char *)&v33 - v15;
  MEMORY[0x270FA5388](v21);
  sub_25298CD48();

  uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v24(v23, (char *)&v33 - v15, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v23, 0, 1, v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v23, 1, v12) == 1)
  {
LABEL_9:
    sub_25297C780((uint64_t)v23);
    return;
  }
  int64_t v25 = v34;
  v24(v34, v23, v12);
  unint64_t v26 = (void *)sub_25298CD38();
  unint64_t v27 = self;
  id v36 = 0;
  id v28 = objc_msgSend(v27, sel_sceneWithURL_options_error_, v26, 0, &v36);

  if (v28)
  {
    uint64_t v29 = *(void **)&v1[v35];
    if (!v29)
    {
      __break(1u);
      return;
    }
    id v30 = v36;
    objc_msgSend(v29, sel_setScene_, v28);
  }
  else
  {
    id v31 = v36;
    unint64_t v32 = (void *)sub_25298CD28();

    swift_willThrow();
  }
  (*(void (**)(char *, uint64_t))(v13 + 8))(v25, v12);
}

id sub_252981820()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PreviewController3D_iOS();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PreviewController3D_iOS()
{
  return self;
}

id sub_2529818E4()
{
  id result = *(id *)(v0 + OBJC_IVAR____TtC7HumanUI23PreviewController3D_iOS_sceneView);
  if (!result) {
    goto LABEL_53;
  }
  uint64_t v2 = v0;
  id result = objc_msgSend(result, sel_scene);
  if (result)
  {
    uint64_t v3 = result;
    id v4 = objc_msgSend(result, sel_rootNode);
    id v5 = objc_msgSend(v4, sel_childNodes);
    sub_25298573C();
    unint64_t v6 = sub_25298D4D8();

    if (v6 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_25298D688();
      swift_bridgeObjectRelease();
      uint64_t v33 = v4;
      if (v7) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v33 = v4;
      if (v7)
      {
LABEL_5:
        uint64_t v34 = MEMORY[0x263F8EE78];
        id result = (id)sub_25298450C(0, v7 & ~(v7 >> 63), 0);
        if (v7 < 0) {
          goto LABEL_52;
        }
        uint64_t v31 = v2;
        unint64_t v32 = v3;
        uint64_t v8 = 0;
        while (1)
        {
          if ((v6 & 0xC000000000000001) != 0) {
            id v9 = (id)MEMORY[0x2533C20F0](v8, v6);
          }
          else {
            id v9 = *(id *)(v6 + 8 * v8 + 32);
          }
          id v10 = v9;
          id v11 = objc_msgSend(v9, sel_name, v31, v32, v33);
          if (!v11) {
            goto LABEL_17;
          }
          uint64_t v12 = v11;
          uint64_t v13 = sub_25298D4A8();
          uint64_t v15 = v14;

          if (!v15) {
            goto LABEL_17;
          }
          if (v13 == 0x6172656D6163 && v15 == 0xE600000000000000)
          {

            swift_bridgeObjectRelease();
            goto LABEL_19;
          }
          char v17 = sub_25298D708();
          swift_bridgeObjectRelease();
          if ((v17 & 1) == 0) {
LABEL_17:
          }
            objc_msgSend(v10, sel_removeFromParentNode);

LABEL_19:
          unint64_t v19 = *(void *)(v34 + 16);
          unint64_t v18 = *(void *)(v34 + 24);
          unint64_t v20 = v19 + 1;
          if (v19 >= v18 >> 1) {
            sub_25298450C(v18 > 1, v19 + 1, 1);
          }
          ++v8;
          *(void *)(v34 + 16) = v20;
          if (v7 == v8)
          {
            swift_bridgeObjectRelease();
            swift_release();
            uint64_t v2 = v31;
            uint64_t v3 = v32;
LABEL_26:
            uint64_t v21 = v2 + OBJC_IVAR____TtC7HumanUI23PreviewController3D_iOS_currentSkeleton3DOverlays;
            swift_beginAccess();
            uint64_t v22 = *(void *)v21 + 64;
            uint64_t v23 = 1 << *(unsigned char *)(*(void *)v21 + 32);
            uint64_t v24 = -1;
            if (v23 < 64) {
              uint64_t v24 = ~(-1 << v23);
            }
            uint64_t v25 = v24 & *(void *)(*(void *)v21 + 64);
            int64_t v26 = (unint64_t)(v23 + 63) >> 6;
            id result = (id)swift_bridgeObjectRetain();
            int64_t v27 = 0;
            while (1)
            {
              if (v25)
              {
                v25 &= v25 - 1;
              }
              else
              {
                int64_t v28 = v27 + 1;
                if (__OFADD__(v27, 1))
                {
                  __break(1u);
                  goto LABEL_51;
                }
                if (v28 >= v26) {
                  goto LABEL_48;
                }
                uint64_t v29 = *(void *)(v22 + 8 * v28);
                ++v27;
                if (!v29)
                {
                  int64_t v27 = v28 + 1;
                  if (v28 + 1 >= v26) {
                    goto LABEL_48;
                  }
                  uint64_t v29 = *(void *)(v22 + 8 * v27);
                  if (!v29)
                  {
                    int64_t v27 = v28 + 2;
                    if (v28 + 2 >= v26) {
                      goto LABEL_48;
                    }
                    uint64_t v29 = *(void *)(v22 + 8 * v27);
                    if (!v29)
                    {
                      int64_t v27 = v28 + 3;
                      if (v28 + 3 >= v26) {
                        goto LABEL_48;
                      }
                      uint64_t v29 = *(void *)(v22 + 8 * v27);
                      if (!v29)
                      {
                        int64_t v30 = v28 + 4;
                        if (v30 >= v26)
                        {
LABEL_48:
                          swift_release();
                          *(void *)uint64_t v21 = sub_252985508(MEMORY[0x263F8EE78], &qword_269C3DCB0);

                          return (id)swift_bridgeObjectRelease();
                        }
                        uint64_t v29 = *(void *)(v22 + 8 * v30);
                        if (!v29)
                        {
                          while (1)
                          {
                            int64_t v27 = v30 + 1;
                            if (__OFADD__(v30, 1)) {
                              break;
                            }
                            if (v27 >= v26) {
                              goto LABEL_48;
                            }
                            uint64_t v29 = *(void *)(v22 + 8 * v27);
                            ++v30;
                            if (v29) {
                              goto LABEL_47;
                            }
                          }
LABEL_51:
                          __break(1u);
LABEL_52:
                          __break(1u);
LABEL_53:
                          __break(1u);
                          return result;
                        }
                        int64_t v27 = v30;
                      }
                    }
                  }
                }
LABEL_47:
                uint64_t v25 = (v29 - 1) & v29;
              }
              swift_retain();
              sub_25297D0BC();
              id result = (id)swift_release();
            }
          }
        }
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  return result;
}

void sub_252981CD4(uint64_t a1)
{
  uint64_t v63 = sub_25298D098();
  uint64_t v4 = *(void *)(v63 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v63);
  uint64_t v62 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  float v61 = (char *)&v46 - v7;
  uint64_t v8 = sub_25298D0C8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  char v55 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v46 - v12;
  uint64_t v64 = v1;
  uint64_t v14 = *(void **)(v1 + OBJC_IVAR____TtC7HumanUI23PreviewController3D_iOS_sceneView);
  if (!v14)
  {
    __break(1u);
    return;
  }
  id v56 = objc_msgSend(v14, sel_scene);
  if (v56)
  {
    uint64_t v15 = *(void *)(a1 + 16);
    if (!v15)
    {

      return;
    }
    uint64_t v59 = OBJC_IVAR____TtC7HumanUI23PreviewController3D_iOS_skeleton3DColor;
    uint64_t v60 = v2;
    id v48 = (uint64_t *)(v64 + OBJC_IVAR____TtC7HumanUI23PreviewController3D_iOS_currentSkeleton3DOverlays);
    char v17 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    uint64_t v16 = v9 + 16;
    uint64_t v65 = v17;
    uint64_t v18 = a1 + ((*(unsigned __int8 *)(v16 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 64));
    unsigned int v51 = *MEMORY[0x263F49D68];
    char v57 = (void (**)(char *, uint64_t))(v4 + 8);
    uint64_t v58 = (void (**)(char *, void, uint64_t))(v4 + 104);
    unsigned int v49 = *MEMORY[0x263F49D78];
    unint64_t v19 = (void (**)(char *, uint64_t))(v16 - 8);
    uint64_t v20 = *(void *)(v16 + 56);
    uint64_t v46 = a1;
    swift_bridgeObjectRetain();
    uint64_t v53 = v16;
    uint64_t v54 = v8;
    id v52 = (void (**)(char *, uint64_t))(v16 - 8);
    uint64_t v50 = v13;
    uint64_t v47 = v20;
    while (1)
    {
      v65(v13, v18, v8);
      unint64_t v21 = *(void *)(sub_25298CFF8() + 16);
      swift_bridgeObjectRelease();
      if (v21 > 1)
      {
        uint64_t v22 = v61;
        sub_25298D0A8();
        uint64_t v23 = *v58;
        uint64_t v25 = v62;
        uint64_t v24 = v63;
        (*v58)(v62, v51, v63);
        char v26 = sub_25298D088();
        int64_t v27 = *v57;
        (*v57)(v25, v24);
        v27(v22, v24);
        if (v26)
        {
          id v28 = objc_msgSend(self, sel_redColor);
          uint64_t v29 = *(void **)(v64 + v59);
          *(void *)(v64 + v59) = v28;
        }
        int64_t v30 = v61;
        uint64_t v13 = v50;
        sub_25298D0A8();
        unint64_t v32 = v62;
        uint64_t v31 = v63;
        v23(v62, v49, v63);
        char v33 = sub_25298D088();
        v27(v32, v31);
        v27(v30, v31);
        if (v33)
        {
          id v34 = objc_msgSend(self, sel_greenColor);
          uint64_t v35 = *(void **)(v64 + v59);
          *(void *)(v64 + v59) = v34;
        }
        uint64_t v8 = v54;
        uint64_t v36 = (uint64_t)v55;
        v65(v55, (uint64_t)v13, v54);
        id v37 = objc_msgSend(v56, sel_rootNode);
        uint64_t v38 = *(void **)(v64 + v59);
        type metadata accessor for Skeleton3DOverlay();
        swift_allocObject();
        id v39 = v38;
        uint64_t v40 = v60;
        uint64_t v41 = sub_25297D7F8(v36, v37, v39);
        if (v40)
        {

          (*v52)(v13, v8);
          swift_bridgeObjectRelease();
          return;
        }
        uint64_t v42 = v41;
        uint64_t v60 = 0;
        uint64_t v43 = sub_25298CF38();
        char v44 = v48;
        swift_beginAccess();
        swift_retain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v66 = *v44;
        *char v44 = 0x8000000000000000;
        sub_252983C98(v42, v43, isUniquelyReferenced_nonNull_native, &qword_269C3DCB0);
        *char v44 = v66;
        swift_bridgeObjectRelease();
        swift_endAccess();
        swift_release();
        unint64_t v19 = v52;
        uint64_t v20 = v47;
      }
      (*v19)(v13, v8);
      v18 += v20;
      if (!--v15)
      {

        swift_bridgeObjectRelease();
        return;
      }
    }
  }
}

BOOL sub_252982250(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (a1[4] != a2[4]) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  uint64_t v5 = a1 + 5;
  uint64_t v6 = a2 + 5;
  do
  {
    uint64_t v8 = *v5++;
    uint64_t v7 = v8;
    uint64_t v10 = *v6++;
    uint64_t v9 = v10;
    BOOL v12 = v4-- != 0;
    BOOL result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

uint64_t sub_2529822C4(uint64_t a1)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_25298250C(a1);
  if ((v4 & 1) == 0) {
    return 0;
  }
  unint64_t v5 = v3;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v1;
  uint64_t v10 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_252984370(&qword_269C3DCB0);
    uint64_t v7 = v10;
  }
  uint64_t v8 = *(void *)(*(void *)(v7 + 56) + 8 * v5);
  sub_252983548(v5, v7);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

unint64_t sub_252982364(uint64_t a1)
{
  sub_25298CFA8();
  uint64_t v2 = (void (*)(uint64_t))MEMORY[0x263F49D38];
  sub_25298577C(&qword_269C3DCE0, MEMORY[0x263F49D38]);
  uint64_t v3 = sub_25298D478();
  return sub_252983E9C(a1, v3, MEMORY[0x263F49D38], &qword_269C3DCE8, v2, MEMORY[0x263F49D48]);
}

unint64_t sub_252982438(uint64_t a1)
{
  sub_25298CEF8();
  uint64_t v2 = (void (*)(uint64_t))MEMORY[0x263F49D08];
  sub_25298577C(&qword_269C3DD28, MEMORY[0x263F49D08]);
  uint64_t v3 = sub_25298D478();
  return sub_252983E9C(a1, v3, MEMORY[0x263F49D08], &qword_269C3DD30, v2, MEMORY[0x263F49D18]);
}

unint64_t sub_25298250C(uint64_t a1)
{
  uint64_t v2 = sub_25298D768();
  return sub_25298403C(a1, v2);
}

unint64_t sub_252982550(uint64_t a1)
{
  sub_25298CF68();
  uint64_t v2 = (void (*)(uint64_t))MEMORY[0x263F49D20];
  sub_25298577C(&qword_269C3DCC8, MEMORY[0x263F49D20]);
  uint64_t v3 = sub_25298D478();
  return sub_252983E9C(a1, v3, MEMORY[0x263F49D20], &qword_269C3DCD0, v2, MEMORY[0x263F49D30]);
}

uint64_t sub_252982624(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_25298CEF8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DD20);
  int v46 = a2;
  uint64_t v10 = sub_25298D6A8();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  uint64_t v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  char v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    uint64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    sub_25298577C(&qword_269C3DD28, MEMORY[0x263F49D08]);
    uint64_t result = sub_25298D478();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  uint64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t sub_252982A48(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v5 = v3;
  uint64_t v7 = sub_25298CFA8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  int v48 = a2;
  uint64_t v12 = sub_25298D6A8();
  uint64_t v13 = v11;
  uint64_t v14 = v12;
  if (!*(void *)(v13 + 16)) {
    goto LABEL_41;
  }
  uint64_t v15 = 1 << *(unsigned char *)(v13 + 32);
  uint64_t v16 = *(void *)(v13 + 64);
  char v44 = (void *)(v13 + 64);
  if (v15 < 64) {
    uint64_t v17 = ~(-1 << v15);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v16;
  uint64_t v42 = v5;
  int64_t v43 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v45 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v47 = v8;
  unint64_t v19 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v20 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v22 = 0;
  for (i = v13; ; uint64_t v13 = i)
  {
    if (v18)
    {
      unint64_t v24 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v25 = v24 | (v22 << 6);
      goto LABEL_22;
    }
    int64_t v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v26 >= v43) {
      break;
    }
    int64_t v27 = v44;
    unint64_t v28 = v44[v26];
    ++v22;
    if (!v28)
    {
      int64_t v22 = v26 + 1;
      if (v26 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v28 = v44[v22];
      if (!v28)
      {
        int64_t v29 = v26 + 2;
        if (v29 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v5 = v42;
          if ((v48 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v28 = v44[v29];
        if (!v28)
        {
          while (1)
          {
            int64_t v22 = v29 + 1;
            if (__OFADD__(v29, 1)) {
              goto LABEL_43;
            }
            if (v22 >= v43) {
              goto LABEL_34;
            }
            unint64_t v28 = v44[v22];
            ++v29;
            if (v28) {
              goto LABEL_21;
            }
          }
        }
        int64_t v22 = v29;
      }
    }
LABEL_21:
    unint64_t v18 = (v28 - 1) & v28;
    unint64_t v25 = __clz(__rbit64(v28)) + (v22 << 6);
LABEL_22:
    uint64_t v30 = *(void *)(v47 + 72);
    unint64_t v31 = *(void *)(v13 + 48) + v30 * v25;
    if (v48)
    {
      (*v19)(v10, v31, v7);
      id v32 = *(id *)(*(void *)(v13 + 56) + 8 * v25);
    }
    else
    {
      (*v45)(v10, v31, v7);
      id v32 = *(id *)(*(void *)(v13 + 56) + 8 * v25);
    }
    sub_25298577C(&qword_269C3DCE0, MEMORY[0x263F49D38]);
    uint64_t result = sub_25298D478();
    uint64_t v33 = -1 << *(unsigned char *)(v14 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v20 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v34) & ~*(void *)(v20 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v20 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v23 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v20 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v19)(*(void *)(v14 + 48) + v30 * v23, v10, v7);
    *(void *)(*(void *)(v14 + 56) + 8 * v23) = v32;
    ++*(void *)(v14 + 16);
  }
  swift_release();
  uint64_t v5 = v42;
  int64_t v27 = v44;
  if ((v48 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v13 + 32);
  if (v40 >= 64) {
    bzero(v27, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v27 = -1 << v40;
  }
  *(void *)(v13 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v5 = v14;
  return result;
}

uint64_t sub_252982E70(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_25298CF68();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DCC0);
  int v46 = a2;
  uint64_t v10 = sub_25298D6A8();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  uint64_t v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  int64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  uint64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    unint64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    sub_25298577C(&qword_269C3DCC8, MEMORY[0x263F49D20]);
    uint64_t result = sub_25298D478();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  unint64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t sub_252983294(uint64_t a1, char a2, uint64_t *a3)
{
  char v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t result = sub_25298D6A8();
  uint64_t v8 = result;
  if (*(void *)(v6 + 16))
  {
    int64_t v9 = 0;
    uint64_t v10 = (uint64_t *)(v6 + 64);
    uint64_t v11 = 1 << *(unsigned char *)(v6 + 32);
    uint64_t v32 = -1 << v11;
    uint64_t v33 = v11;
    if (v11 < 64) {
      uint64_t v12 = ~(-1 << v11);
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v13 = v12 & *(void *)(v6 + 64);
    int64_t v34 = (unint64_t)(v11 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v13)
      {
        unint64_t v20 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        unint64_t v21 = v20 | (v9 << 6);
      }
      else
      {
        int64_t v22 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v22 >= v34) {
          goto LABEL_33;
        }
        unint64_t v23 = v10[v22];
        ++v9;
        if (!v23)
        {
          int64_t v9 = v22 + 1;
          if (v22 + 1 >= v34) {
            goto LABEL_33;
          }
          unint64_t v23 = v10[v9];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v34)
            {
LABEL_33:
              if (a2)
              {
                if (v33 >= 64) {
                  bzero((void *)(v6 + 64), 8 * v34);
                }
                else {
                  *uint64_t v10 = v32;
                }
                *(void *)(v6 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v10[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v9 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_41;
                }
                if (v9 >= v34) {
                  goto LABEL_33;
                }
                unint64_t v23 = v10[v9];
                ++v24;
                if (v23) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v9 = v24;
          }
        }
LABEL_30:
        unint64_t v13 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v9 << 6);
      }
      uint64_t v29 = 8 * v21;
      uint64_t v30 = *(void *)(*(void *)(v6 + 48) + v29);
      uint64_t v31 = *(void *)(*(void *)(v6 + 56) + v29);
      if ((a2 & 1) == 0) {
        swift_retain();
      }
      uint64_t result = sub_25298D768();
      uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v14 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v14 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v27 = v17 == v26;
          if (v17 == v26) {
            unint64_t v17 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v14 + 8 * v17);
        }
        while (v28 == -1);
        unint64_t v18 = __clz(__rbit64(~v28)) + (v17 << 6);
      }
      *(void *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t v19 = 8 * v18;
      *(void *)(*(void *)(v8 + 48) + v19) = v30;
      *(void *)(*(void *)(v8 + 56) + v19) = v31;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
  *char v4 = v8;
  return result;
}

unint64_t sub_252983548(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_25298D608();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        uint64_t v10 = (void *)(v9 + 8 * v6);
        uint64_t result = sub_25298D768();
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            uint64_t v14 = (void *)(v9 + 8 * v3);
            if (v3 != v6 || v14 >= v10 + 1) {
              void *v14 = *v10;
            }
            uint64_t v15 = *(void *)(a2 + 56);
            unint64_t v16 = (void *)(v15 + 8 * v3);
            unint64_t v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 1))
            {
              void *v16 = *v17;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *unint64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_2529836E0(uint64_t a1, uint64_t a2, char a3)
{
}

void sub_2529836EC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_25298CEF8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_252982438(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];

      *(void *)(v21 + 8 * v14) = a1;
      return;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_2529840D8(MEMORY[0x263F49D08], &qword_269C3DD20);
    goto LABEL_7;
  }
  sub_252982624(v17, a3 & 1);
  unint64_t v22 = sub_252982438(a2);
  if ((v18 & 1) != (v23 & 1))
  {
LABEL_14:
    sub_25298D718();
    __break(1u);
    return;
  }
  unint64_t v14 = v22;
  uint64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  sub_252983DE0(v14, (uint64_t)v11, a1, v20, MEMORY[0x263F49D08]);
}

void sub_2529838C4(uint64_t a1, uint64_t a2, char a3)
{
}

void sub_2529838D0(uint64_t a1, uint64_t a2, char a3, uint64_t *a4)
{
  unint64_t v6 = (void **)v4;
  uint64_t v26 = a1;
  uint64_t v9 = sub_25298CFA8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v13 = (void *)*v4;
  unint64_t v15 = sub_252982364(a2);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v19 = v14;
  uint64_t v20 = v13[3];
  if (v20 >= v18 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v21 = *v6;
    if (v19)
    {
LABEL_8:
      uint64_t v22 = v21[7];

      *(void *)(v22 + 8 * v15) = v26;
      return;
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a3 & 1) == 0)
  {
    sub_2529840D8(MEMORY[0x263F49D38], a4);
    goto LABEL_7;
  }
  sub_252982A48(v18, a3 & 1, a4);
  unint64_t v23 = sub_252982364(a2);
  if ((v19 & 1) != (v24 & 1))
  {
LABEL_14:
    sub_25298D718();
    __break(1u);
    return;
  }
  unint64_t v15 = v23;
  uint64_t v21 = *v6;
  if (v19) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a2, v9);
  sub_252983DE0(v15, (uint64_t)v12, v26, v21, MEMORY[0x263F49D38]);
}

void sub_252983AB4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_25298CF68();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_252982550(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];

      *(void *)(v21 + 8 * v14) = a1;
      return;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_2529840D8(MEMORY[0x263F49D20], &qword_269C3DCC0);
    goto LABEL_7;
  }
  sub_252982E70(v17, a3 & 1);
  unint64_t v22 = sub_252982550(a2);
  if ((v18 & 1) != (v23 & 1))
  {
LABEL_14:
    sub_25298D718();
    __break(1u);
    return;
  }
  unint64_t v14 = v22;
  uint64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  sub_252983DE0(v14, (uint64_t)v11, a1, v20, MEMORY[0x263F49D20]);
}

uint64_t sub_252983C8C(uint64_t a1, uint64_t a2, char a3)
{
  return sub_252983C98(a1, a2, a3, &qword_269C3DCB8);
}

uint64_t sub_252983C98(uint64_t a1, uint64_t a2, char a3, uint64_t *a4)
{
  unint64_t v6 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_25298250C(a2);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_252984370(a4);
LABEL_7:
    char v18 = (void *)*v6;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    uint64_t v21 = 8 * v12;
    *(void *)(v18[6] + v21) = a2;
    *(void *)(v18[7] + v21) = a1;
    uint64_t v22 = v18[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_252983294(result, a3 & 1, a4);
  uint64_t result = sub_25298250C(a2);
  if ((v16 & 1) == (v20 & 1))
  {
    unint64_t v12 = result;
    char v18 = (void *)*v6;
    if (v16) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_25298D718();
  __break(1u);
  return result;
}

uint64_t sub_252983DE0(unint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(void))
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v9 = a4[6];
  uint64_t v10 = a5(0);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a2, v10);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v12 = a4[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a4[2] = v14;
  }
  return result;
}

unint64_t sub_252983E9C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), unint64_t *a4, void (*a5)(uint64_t), uint64_t a6)
{
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  BOOL v23 = a4;
  v21[1] = a1;
  uint64_t v8 = a3(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)v21 - v10;
  uint64_t v22 = v6;
  uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v13 = a2 & ~v12;
  v21[0] = v6 + 64;
  if ((*(void *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v14 = ~v12;
    uint64_t v17 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    uint64_t v16 = v9 + 16;
    uint64_t v15 = v17;
    uint64_t v18 = *(void *)(v16 + 56);
    do
    {
      v15(v11, *(void *)(v22 + 48) + v18 * v13, v8);
      sub_25298577C(v23, v24);
      char v19 = sub_25298D488();
      (*(void (**)(char *, uint64_t))(v16 - 8))(v11, v8);
      if (v19) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v14;
    }
    while (((*(void *)(v21[0] + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  }
  return v13;
}

unint64_t sub_25298403C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

id sub_2529840D8(uint64_t (*a1)(void), uint64_t *a2)
{
  uint64_t v4 = a1(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v26 - v6;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  BOOL v27 = v2;
  uint64_t v8 = *v2;
  uint64_t v9 = sub_25298D698();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *BOOL v27 = v10;
    return result;
  }
  id result = (id)(v9 + 64);
  unint64_t v12 = (unint64_t)((1 << *(unsigned char *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v12) {
    id result = memmove(result, (const void *)(v8 + 64), 8 * v12);
  }
  uint64_t v28 = v8 + 64;
  int64_t v14 = 0;
  *(void *)(v10 + 16) = *(void *)(v8 + 16);
  uint64_t v15 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & *(void *)(v8 + 64);
  uint64_t v31 = v5 + 16;
  int64_t v29 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v30 = v5 + 32;
  while (1)
  {
    if (v17)
    {
      unint64_t v18 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v19 = v18 | (v14 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v29) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v23);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v23 + 1;
      if (v23 + 1 >= v29) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v28 + 8 * v14);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v17 = (v24 - 1) & v24;
    unint64_t v19 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_12:
    unint64_t v20 = *(void *)(v5 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(void *)(v8 + 48) + v20, v4);
    uint64_t v21 = 8 * v19;
    uint64_t v22 = *(void **)(*(void *)(v8 + 56) + v21);
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(void *)(v10 + 48) + v20, v7, v4);
    *(void *)(*(void *)(v10 + 56) + v21) = v22;
    id result = v22;
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v29) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v28 + 8 * v25);
  if (v24)
  {
    int64_t v14 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v14 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v14 >= v29) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v14);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_252984370(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_25298D698();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v14) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v7 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    uint64_t v18 = *(void *)(*(void *)(v3 + 56) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = *(void *)(*(void *)(v3 + 48) + v17);
    *(void *)(*(void *)(v5 + 56) + v17) = v18;
    id result = (void *)swift_retain();
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v14) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v7 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_25298450C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25298456C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25298452C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2529846BC(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25298454C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25298481C(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25298456C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DD00);
    int64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25298D6C8();
  __break(1u);
  return result;
}

uint64_t sub_2529846BC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DD10);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  int64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25298D6C8();
  __break(1u);
  return result;
}

uint64_t sub_25298481C(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DD38);
    int64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    int64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DD40);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25298D6C8();
  __break(1u);
  return result;
}

uint64_t sub_2529849A8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2529854DC(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_252984A14(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_252984A14(void *a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_25298D6D8();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_137;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v78 = 0;
      uint64_t v79 = *v2;
      for (uint64_t i = 1; i != v3; ++i)
      {
        uint64_t v81 = *(void *)(v79 + 8 * i);
        uint64_t v82 = v78;
        do
        {
          uint64_t v83 = *(void *)(v79 + v82);
          if (v81 >= v83) {
            break;
          }
          if (!v79) {
            goto LABEL_141;
          }
          *(void *)(v79 + v82 + 8) = v83;
          *(void *)(v79 + v82) = v81;
          v82 -= 8;
        }
        while (v82 != -8);
        v78 += 8;
      }
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
    goto LABEL_146;
  }
  uint64_t v95 = result;
  uint64_t v96 = v3;
  if (v3 < 2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
      int64_t v11 = (char *)MEMORY[0x263F8EE78];
LABEL_103:
      uint64_t v94 = v8;
      if (v12 >= 2)
      {
        uint64_t v84 = *v2;
        do
        {
          unint64_t v85 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_132;
          }
          if (!v84) {
            goto LABEL_145;
          }
          uint64_t v86 = v11;
          unint64_t v87 = v11 + 32;
          uint64_t v88 = *(void *)&v11[16 * v85 + 32];
          uint64_t v89 = *(void *)&v11[16 * v12 + 24];
          sub_2529850A0((char *)(v84 + 8 * v88), (char *)(v84 + 8 * *(void *)&v87[16 * v12 - 16]), v84 + 8 * v89, __dst);
          if (v1) {
            break;
          }
          if (v89 < v88) {
            goto LABEL_133;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v86 = sub_2529854C8((uint64_t)v86);
          }
          if (v85 >= *((void *)v86 + 2)) {
            goto LABEL_134;
          }
          id v90 = &v86[16 * v85 + 32];
          *(void *)id v90 = v88;
          *((void *)v90 + 1) = v89;
          unint64_t v91 = *((void *)v86 + 2);
          if (v12 > v91) {
            goto LABEL_135;
          }
          memmove(&v86[16 * v12 + 16], &v86[16 * v12 + 32], 16 * (v91 - v12));
          int64_t v11 = v86;
          *((void *)v86 + 2) = v91 - 1;
          unint64_t v12 = v91 - 1;
        }
        while (v91 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(void *)(v94 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v94 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_25298D4F8();
    *(void *)(v7 + 16) = v6;
    uint64_t v3 = v96;
    uint64_t v94 = v7;
    __dst = (char *)(v7 + 32);
  }
  uint64_t v9 = 0;
  uint64_t v10 = *v2;
  uint64_t v92 = v2;
  uint64_t v93 = *v2 - 8;
  int64_t v11 = (char *)MEMORY[0x263F8EE78];
  uint64_t v97 = *v2;
  while (1)
  {
    uint64_t v13 = v9++;
    if (v9 < v3)
    {
      uint64_t v14 = *(void *)(v10 + 8 * v9);
      uint64_t v15 = *(void *)(v10 + 8 * v13);
      uint64_t v9 = v13 + 2;
      if (v13 + 2 < v3)
      {
        uint64_t v16 = v14;
        while (1)
        {
          uint64_t v17 = *(void *)(v10 + 8 * v9);
          if (v14 < v15 == v17 >= v16) {
            break;
          }
          ++v9;
          uint64_t v16 = v17;
          if (v3 == v9)
          {
            uint64_t v9 = v3;
            break;
          }
        }
      }
      if (v14 < v15)
      {
        if (v9 < v13) {
          goto LABEL_138;
        }
        if (v13 < v9)
        {
          uint64_t v18 = v9 - 1;
          uint64_t v19 = v13;
          do
          {
            if (v19 != v18)
            {
              if (!v10) {
                goto LABEL_144;
              }
              uint64_t v20 = *(void *)(v10 + 8 * v19);
              *(void *)(v10 + 8 * v19) = *(void *)(v10 + 8 * v18);
              *(void *)(v10 + 8 * v18) = v20;
            }
            BOOL v59 = ++v19 < v18--;
          }
          while (v59);
        }
      }
    }
    if (v9 >= v3) {
      goto LABEL_47;
    }
    if (__OFSUB__(v9, v13)) {
      goto LABEL_136;
    }
    if (v9 - v13 >= v95) {
      goto LABEL_47;
    }
    uint64_t v21 = v13 + v95;
    if (__OFADD__(v13, v95)) {
      goto LABEL_139;
    }
    if (v21 >= v3) {
      uint64_t v21 = v3;
    }
    if (v21 < v13) {
      break;
    }
    if (v9 != v21)
    {
      uint64_t v22 = (uint64_t *)(v93 + 8 * v9);
      do
      {
        uint64_t v23 = *(void *)(v10 + 8 * v9);
        uint64_t v24 = v13;
        int64_t v25 = v22;
        do
        {
          uint64_t v26 = *v25;
          if (v23 >= *v25) {
            break;
          }
          if (!v10) {
            goto LABEL_142;
          }
          uint64_t *v25 = v23;
          v25[1] = v26;
          --v25;
          ++v24;
        }
        while (v9 != v24);
        ++v9;
        ++v22;
      }
      while (v9 != v21);
      uint64_t v9 = v21;
    }
LABEL_47:
    if (v9 < v13) {
      goto LABEL_131;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v11 = sub_252985310(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v28 = *((void *)v11 + 2);
    unint64_t v27 = *((void *)v11 + 3);
    unint64_t v12 = v28 + 1;
    uint64_t v10 = v97;
    if (v28 >= v27 >> 1)
    {
      uint64_t v77 = sub_252985310((char *)(v27 > 1), v28 + 1, 1, v11);
      uint64_t v10 = v97;
      int64_t v11 = v77;
    }
    *((void *)v11 + 2) = v12;
    int64_t v29 = v11 + 32;
    uint64_t v30 = &v11[16 * v28 + 32];
    *(void *)uint64_t v30 = v13;
    *((void *)v30 + 1) = v9;
    if (v28)
    {
      while (1)
      {
        unint64_t v31 = v12 - 1;
        if (v12 >= 4)
        {
          BOOL v36 = &v29[16 * v12];
          uint64_t v37 = *((void *)v36 - 8);
          uint64_t v38 = *((void *)v36 - 7);
          BOOL v42 = __OFSUB__(v38, v37);
          uint64_t v39 = v38 - v37;
          if (v42) {
            goto LABEL_120;
          }
          uint64_t v41 = *((void *)v36 - 6);
          uint64_t v40 = *((void *)v36 - 5);
          BOOL v42 = __OFSUB__(v40, v41);
          uint64_t v34 = v40 - v41;
          char v35 = v42;
          if (v42) {
            goto LABEL_121;
          }
          unint64_t v43 = v12 - 2;
          char v44 = &v29[16 * v12 - 32];
          uint64_t v46 = *(void *)v44;
          uint64_t v45 = *((void *)v44 + 1);
          BOOL v42 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          if (v42) {
            goto LABEL_123;
          }
          BOOL v42 = __OFADD__(v34, v47);
          uint64_t v48 = v34 + v47;
          if (v42) {
            goto LABEL_126;
          }
          if (v48 >= v39)
          {
            uint64_t v66 = &v29[16 * v31];
            uint64_t v68 = *(void *)v66;
            uint64_t v67 = *((void *)v66 + 1);
            BOOL v42 = __OFSUB__(v67, v68);
            uint64_t v69 = v67 - v68;
            if (v42) {
              goto LABEL_130;
            }
            BOOL v59 = v34 < v69;
            goto LABEL_84;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v60 = *((void *)v11 + 4);
            uint64_t v61 = *((void *)v11 + 5);
            BOOL v42 = __OFSUB__(v61, v60);
            uint64_t v53 = v61 - v60;
            char v54 = v42;
            goto LABEL_78;
          }
          uint64_t v33 = *((void *)v11 + 4);
          uint64_t v32 = *((void *)v11 + 5);
          BOOL v42 = __OFSUB__(v32, v33);
          uint64_t v34 = v32 - v33;
          char v35 = v42;
        }
        if (v35) {
          goto LABEL_122;
        }
        unint64_t v43 = v12 - 2;
        unsigned int v49 = &v29[16 * v12 - 32];
        uint64_t v51 = *(void *)v49;
        uint64_t v50 = *((void *)v49 + 1);
        BOOL v52 = __OFSUB__(v50, v51);
        uint64_t v53 = v50 - v51;
        char v54 = v52;
        if (v52) {
          goto LABEL_125;
        }
        char v55 = &v29[16 * v31];
        uint64_t v57 = *(void *)v55;
        uint64_t v56 = *((void *)v55 + 1);
        BOOL v42 = __OFSUB__(v56, v57);
        uint64_t v58 = v56 - v57;
        if (v42) {
          goto LABEL_128;
        }
        if (__OFADD__(v53, v58)) {
          goto LABEL_129;
        }
        if (v53 + v58 >= v34)
        {
          BOOL v59 = v34 < v58;
LABEL_84:
          if (v59) {
            unint64_t v31 = v43;
          }
          goto LABEL_86;
        }
LABEL_78:
        if (v54) {
          goto LABEL_124;
        }
        uint64_t v62 = &v29[16 * v31];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v42 = __OFSUB__(v63, v64);
        uint64_t v65 = v63 - v64;
        if (v42) {
          goto LABEL_127;
        }
        if (v65 < v53) {
          goto LABEL_15;
        }
LABEL_86:
        unint64_t v70 = v31 - 1;
        if (v31 - 1 >= v12)
        {
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
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
          goto LABEL_140;
        }
        if (!v10) {
          goto LABEL_143;
        }
        id v71 = &v29[16 * v70];
        uint64_t v72 = *(void *)v71;
        uint64_t v73 = v29;
        uint64_t v74 = &v29[16 * v31];
        uint64_t v75 = *((void *)v74 + 1);
        sub_2529850A0((char *)(v10 + 8 * *(void *)v71), (char *)(v10 + 8 * *(void *)v74), v10 + 8 * v75, __dst);
        if (v1) {
          goto LABEL_114;
        }
        if (v75 < v72) {
          goto LABEL_117;
        }
        if (v31 > *((void *)v11 + 2)) {
          goto LABEL_118;
        }
        *(void *)id v71 = v72;
        *(void *)&v73[16 * v70 + 8] = v75;
        unint64_t v76 = *((void *)v11 + 2);
        if (v31 >= v76) {
          goto LABEL_119;
        }
        unint64_t v12 = v76 - 1;
        memmove(v74, v74 + 16, 16 * (v76 - 1 - v31));
        int64_t v29 = v73;
        *((void *)v11 + 2) = v76 - 1;
        uint64_t v10 = v97;
        if (v76 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    uint64_t v3 = v96;
    if (v9 >= v96)
    {
      uint64_t v8 = v94;
      uint64_t v2 = v92;
      goto LABEL_103;
    }
  }
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
  uint64_t result = sub_25298D668();
  __break(1u);
  return result;
}

uint64_t sub_2529850A0(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 7;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 3;
  uint64_t v24 = __src;
  uint64_t v23 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[8 * v13] <= __dst) {
        memmove(__dst, a2, 8 * v13);
      }
      uint64_t v16 = &v4[8 * v13];
      uint64_t v22 = v16;
      uint64_t v24 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        uint64_t v17 = (char *)(a3 - 8);
        while (1)
        {
          uint64_t v18 = v17 + 8;
          uint64_t v19 = v6 - 8;
          uint64_t v20 = *((void *)v6 - 1);
          if (*((void *)v16 - 1) >= v20)
          {
            uint64_t v22 = v16 - 8;
            if (v18 < v16 || v17 >= v16 || v18 != v16) {
              *(void *)uint64_t v17 = *((void *)v16 - 1);
            }
            v16 -= 8;
            if (v6 <= v7) {
              goto LABEL_42;
            }
          }
          else
          {
            if (v18 != v6 || v17 >= v6) {
              *(void *)uint64_t v17 = v20;
            }
            uint64_t v24 = v6 - 8;
            v6 -= 8;
            if (v19 <= v7) {
              goto LABEL_42;
            }
          }
          v17 -= 8;
          if (v16 <= v4) {
            goto LABEL_42;
          }
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[8 * v10] <= __dst) {
      memmove(__dst, __src, 8 * v10);
    }
    uint64_t v14 = &v4[8 * v10];
    uint64_t v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      do
      {
        if (*(void *)v6 >= *(void *)v4)
        {
          if (v7 != v4) {
            *(void *)uint64_t v7 = *(void *)v4;
          }
          v4 += 8;
          uint64_t v23 = v4;
          uint64_t v15 = v6;
        }
        else
        {
          uint64_t v15 = v6 + 8;
          if (v7 < v6 || v7 >= v15 || v7 != v6) {
            *(void *)uint64_t v7 = *(void *)v6;
          }
        }
        v7 += 8;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      uint64_t v24 = v7;
    }
LABEL_42:
    sub_25298540C((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  uint64_t result = sub_25298D6C8();
  __break(1u);
  return result;
}

char *sub_252985310(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DD08);
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
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_25298540C(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_25298D6C8();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_2529854C8(uint64_t a1)
{
  return sub_252985310(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2529854DC(uint64_t a1)
{
  return sub_2529846BC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

unint64_t sub_2529854F0(void *a1)
{
  return sub_252985508(a1, &qword_269C3DCB0);
}

unint64_t sub_2529854FC(void *a1)
{
  return sub_252985508(a1, &qword_269C3DCB8);
}

unint64_t sub_252985508(void *a1, uint64_t *a2)
{
  uint64_t v2 = a1[2];
  if (!v2) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v4 = (void *)sub_25298D6B8();
  uint64_t v6 = a1[4];
  uint64_t v5 = a1[5];
  unint64_t result = sub_25298250C(v6);
  if (v8)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain();
    return (unint64_t)v4;
  }
  uint64_t v9 = a1 + 7;
  while (1)
  {
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v4[6] + v10) = v6;
    *(void *)(v4[7] + v10) = v5;
    uint64_t v11 = v4[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      break;
    }
    v4[2] = v13;
    if (!--v2) {
      goto LABEL_8;
    }
    uint64_t v14 = v9 + 2;
    uint64_t v6 = *(v9 - 1);
    uint64_t v15 = *v9;
    swift_retain();
    unint64_t result = sub_25298250C(v6);
    uint64_t v9 = v14;
    uint64_t v5 = v15;
    if (v16) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

void sub_252985604()
{
  *(void *)&v0[OBJC_IVAR____TtC7HumanUI23PreviewController3D_iOS_sceneView] = 0;
  uint64_t v1 = OBJC_IVAR____TtC7HumanUI23PreviewController3D_iOS_currentSkeleton3DOverlays;
  uint64_t v2 = MEMORY[0x263F8EE78];
  *(void *)&v0[v1] = sub_252985508(MEMORY[0x263F8EE78], &qword_269C3DCB0);
  *(void *)&v0[OBJC_IVAR____TtC7HumanUI23PreviewController3D_iOS_previousSkeletons] = v2;
  uint64_t v3 = OBJC_IVAR____TtC7HumanUI23PreviewController3D_iOS_skeleton3DColor;
  *(void *)&v0[v3] = objc_msgSend(self, sel_magentaColor);

  sub_25298D678();
  __break(1u);
}

uint64_t sub_2529856D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DCD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_25298573C()
{
  unint64_t result = qword_269C3DCF8;
  if (!qword_269C3DCF8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269C3DCF8);
  }
  return result;
}

uint64_t sub_25298577C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_252985AA4(char a1)
{
  v13.receiver = v1;
  v13.super_class = (Class)type metadata accessor for FrameViewController_iOS();
  objc_msgSendSuper2(&v13, sel_viewDidAppear_, a1 & 1);
  uint64_t v3 = OBJC_IVAR____TtC7HumanUI23FrameViewController_iOS_metalView;
  uint64_t v4 = *(void **)&v1[OBJC_IVAR____TtC7HumanUI23FrameViewController_iOS_metalView];
  if (!v4)
  {
    __break(1u);
    goto LABEL_9;
  }
  id v5 = v4;
  id v6 = MTLCreateSystemDefaultDevice();
  if (!v6)
  {
LABEL_10:
    sub_25298D658();
    uint64_t result = sub_25298D678();
    __break(1u);
    return result;
  }
  objc_msgSend(v5, sel_setDevice_, v6);

  swift_unknownObjectRelease();
  uint64_t v7 = *(void **)&v1[v3];
  if (!v7)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  char v8 = *(void **)&v1[OBJC_IVAR____TtC7HumanUI23FrameViewController_iOS_renderer];
  if (v8)
  {
    id v9 = v7;
    uint64_t v10 = v8;
  }
  else
  {
    uint64_t v10 = 0;
    char v8 = v7;
  }
  id v11 = v8;
  objc_msgSend(v7, sel_setDelegate_, v10);

  return swift_unknownObjectRelease();
}

id sub_252985C48()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FrameViewController_iOS();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FrameViewController_iOS()
{
  return self;
}

ValueMetadata *type metadata accessor for FrameViewControllerRepresentable()
{
  return &type metadata for FrameViewControllerRepresentable;
}

char *sub_252985CFC()
{
  uint64_t v1 = *v0;
  objc_super v2 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameViewController_iOS()), sel_init);
  uint64_t v3 = *(void **)&v2[OBJC_IVAR____TtC7HumanUI23FrameViewController_iOS_renderer];
  *(void *)&v2[OBJC_IVAR____TtC7HumanUI23FrameViewController_iOS_renderer] = v1;
  id v4 = v1;

  return v2;
}

uint64_t sub_252985D64()
{
  return sub_25298D298();
}

uint64_t sub_252985D98()
{
  return sub_25298D2E8();
}

uint64_t sub_252985DF0()
{
  return sub_25298D2A8();
}

void sub_252985E48()
{
}

unint64_t sub_252985E74()
{
  unint64_t result = qword_269C3DD58;
  if (!qword_269C3DD58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3DD58);
  }
  return result;
}

unint64_t sub_252985EC8()
{
  unint64_t result = qword_269C3DD60;
  if (!qword_269C3DD60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3DD60);
  }
  return result;
}

uint64_t sub_252985F1C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25298D138();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_252985F90()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC7HumanUI10Renderer2D__skeletons;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DB18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_252986034()
{
  return type metadata accessor for Renderer2D();
}

uint64_t type metadata accessor for Renderer2D()
{
  uint64_t result = qword_269C3DD70;
  if (!qword_269C3DD70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_252986090()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25298D138();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_252986104()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC7HumanUI12RendererMesh__skeletons;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DB18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_2529861A8()
{
  return type metadata accessor for RendererMesh();
}

uint64_t type metadata accessor for RendererMesh()
{
  uint64_t result = qword_269C3DD88;
  if (!qword_269C3DD88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

BOOL static RendererViewOrientation.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t RendererViewOrientation.hash(into:)()
{
  return sub_25298D788();
}

uint64_t RendererViewOrientation.hashValue.getter()
{
  return sub_25298D798();
}

BOOL sub_25298628C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2529862A0()
{
  return sub_25298D798();
}

uint64_t sub_2529862E8()
{
  return sub_25298D788();
}

uint64_t sub_252986314()
{
  return sub_25298D798();
}

unint64_t sub_25298635C()
{
  unint64_t result = qword_269C3DD98;
  if (!qword_269C3DD98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3DD98);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RendererViewOrientation(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RendererViewOrientation(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25298651CLL);
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

uint64_t sub_252986544(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25298654C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RendererViewOrientation()
{
  return &type metadata for RendererViewOrientation;
}

uint64_t PreviewerError.hash(into:)()
{
  return sub_25298D788();
}

BOOL static PreviewerError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PreviewerError.hashValue.getter()
{
  return sub_25298D798();
}

unint64_t PreviewerError.debugDescription.getter()
{
  unint64_t result = 0xD00000000000001BLL;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000029;
      break;
    case 2:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 3:
      unint64_t result = 0xD000000000000031;
      break;
    case 4:
      unint64_t result = 0xD000000000000034;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_2529866A8()
{
  unint64_t result = qword_269C3DDA0;
  if (!qword_269C3DDA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3DDA0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PreviewerError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PreviewerError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x25298685CLL);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewerError()
{
  return &type metadata for PreviewerError;
}

ValueMetadata *type metadata accessor for InternalRendererView()
{
  return &type metadata for InternalRendererView;
}

uint64_t sub_2529868A4(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_252990378, 1);
}

void sub_2529868C0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v3 = *(unsigned char *)(a1 + 41);
  char v4 = *(unsigned char *)(a1 + 42);
  char v5 = *(unsigned char *)(a1 + 43);
  char v6 = *(unsigned char *)(a1 + 44);
  char v7 = *(unsigned char *)(a1 + 45);
  if (*(unsigned char *)(a1 + 40))
  {
    id v15 = *(id *)a1;
    id v8 = *(id *)a1;
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    id v15 = 0;
    if (*(unsigned char *)(a1 + 43))
    {
LABEL_3:
      type metadata accessor for Renderer3D();
      sub_252986E64(&qword_269C3DDD8, (void (*)(uint64_t))type metadata accessor for Renderer3D);
      swift_retain();
      sub_25298D188();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DDA8);
      sub_252986D80();
      sub_252986F74(&qword_269C3DDB8, &qword_269C3DDA8);
      sub_25298D268();
      goto LABEL_10;
    }
  }
  if (v4)
  {
    type metadata accessor for Renderer3D();
    sub_252986E64(&qword_269C3DDD8, (void (*)(uint64_t))type metadata accessor for Renderer3D);
    swift_retain();
    sub_25298D188();
    if ((v3 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (v3)
  {
LABEL_7:
    type metadata accessor for Renderer2D();
    sub_252986E64(&qword_269C3DDD0, (void (*)(uint64_t))type metadata accessor for Renderer2D);
    swift_retain();
    sub_25298D188();
  }
LABEL_9:
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DDA8);
  sub_252986D80();
  sub_252986F74(&qword_269C3DDB8, &qword_269C3DDA8);
  sub_25298D268();
  swift_release_n();
  swift_release_n();
LABEL_10:
  if (v6)
  {
    type metadata accessor for RendererMesh();
    sub_252986E64(&qword_269C3DDC8, (void (*)(uint64_t))type metadata accessor for RendererMesh);
    swift_retain();
    uint64_t v9 = sub_25298D188();
    uint64_t v10 = v13;
    uint64_t v11 = 0;
    if (v7) {
      goto LABEL_12;
    }
LABEL_14:
    uint64_t v12 = 0;
    goto LABEL_15;
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  if ((v7 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_12:
  type metadata accessor for RendererInfo();
  sub_252986E64(&qword_269C3DDC0, (void (*)(uint64_t))type metadata accessor for RendererInfo);
  swift_retain();
  uint64_t v11 = sub_25298D188();
LABEL_15:
  *(void *)a2 = v15;
  *(void *)(a2 + 8) = v16;
  *(void *)(a2 + 16) = v17;
  *(void *)(a2 + 24) = v18;
  *(void *)(a2 + 32) = v19;
  *(unsigned char *)(a2 + 40) = v20;
  *(void *)(a2 + 48) = v9;
  *(void *)(a2 + 56) = v10;
  *(void *)(a2 + 64) = v11;
  *(void *)(a2 + 72) = v12;
  id v14 = v15;
  sub_252986DD4(v16, v17, v18, v19, v20);
  sub_252986E14(v16, v17, v18, v19, v20);
}

__n128 sub_252986CB8@<Q0>(uint64_t a1@<X8>)
{
  long long v3 = v1[1];
  long long v23 = *v1;
  v24[0] = v3;
  *(_OWORD *)((char *)v24 + 14) = *(long long *)((char *)v1 + 30);
  uint64_t v4 = sub_25298D428();
  uint64_t v6 = v5;
  sub_2529868C0((uint64_t)&v23, (uint64_t)v17);
  long long v15 = v17[1];
  long long v16 = v17[0];
  uint64_t v7 = v18;
  char v8 = v19;
  __n128 v14 = v20;
  uint64_t v9 = v21;
  uint64_t v10 = v22;
  uint64_t v11 = sub_25298D198();
  char v12 = sub_25298D318();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v6;
  *(_OWORD *)(a1 + 16) = v16;
  *(_OWORD *)(a1 + 32) = v15;
  *(void *)(a1 + 48) = v7;
  *(unsigned char *)(a1 + 56) = v8;
  __n128 result = v14;
  *(__n128 *)(a1 + 64) = v14;
  *(void *)(a1 + 80) = v9;
  *(void *)(a1 + 88) = v10;
  *(void *)(a1 + 96) = v11;
  *(unsigned char *)(a1 + 104) = v12;
  return result;
}

unint64_t sub_252986D80()
{
  unint64_t result = qword_269C3DDB0;
  if (!qword_269C3DDB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3DDB0);
  }
  return result;
}

uint64_t sub_252986DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5) {
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_252986E14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t result = swift_release();
  if (a5)
  {
    return swift_release();
  }
  return result;
}

uint64_t sub_252986E64(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for RendererMeshView()
{
  return &type metadata for RendererMeshView;
}

ValueMetadata *type metadata accessor for Renderer2DView()
{
  return &type metadata for Renderer2DView;
}

ValueMetadata *type metadata accessor for Renderer3DView()
{
  return &type metadata for Renderer3DView;
}

unint64_t sub_252986EEC()
{
  unint64_t result = qword_269C3DDE0;
  if (!qword_269C3DDE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C3DDE8);
    sub_252986F74(&qword_269C3DDF0, &qword_269C3DDF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3DDE0);
  }
  return result;
}

uint64_t sub_252986F74(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_252986FB8(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_2529903F0, 1);
}

uint64_t sub_252986FD4@<X0>(void *a1@<X8>)
{
  return sub_25298702C(a1);
}

uint64_t sub_252986FE8(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_2529903C8, 1);
}

uint64_t sub_252987004@<X0>(void *a1@<X8>)
{
  return sub_25298702C(a1);
}

uint64_t sub_252987018@<X0>(void *a1@<X8>)
{
  return sub_25298702C(a1);
}

uint64_t sub_25298702C@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_25298D138();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2529870B4(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_2529903A0, 1);
}

id sub_252987130()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FrameRenderer.Observer()
{
  return self;
}

void sub_252987248(void *a1)
{
  objc_super v2 = *(void **)(v1 + OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_sourceImage);
  if (!v2) {
    return;
  }
  uint64_t v4 = self;
  id v5 = v2;
  objc_msgSend(v5, sel_extent);
  double v7 = v6;
  if ((~*(void *)&v6 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v6 <= -9.22337204e18)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v6 >= 9.22337204e18)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  objc_msgSend(v5, sel_extent);
  if ((~*(void *)&v8 & 0x7FF0000000000000) == 0)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (v8 <= -9.22337204e18)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v8 >= 9.22337204e18)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  id v31 = objc_msgSend(v4, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v7, (uint64_t)v8, 0);
  objc_msgSend(v31, sel_setUsage_, 0);
  uint64_t v9 = *(void **)(v1 + OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_captureScope);
  objc_msgSend(v9, sel_beginScope);
  id v10 = objc_msgSend((id)sub_25298CBC4(), sel_commandBuffer);
  swift_unknownObjectRelease();
  if (v10)
  {
    id v11 = MTLCreateSystemDefaultDevice();
    if (!v11)
    {
LABEL_32:
      sub_25298D658();
      sub_25298D678();
      __break(1u);
      return;
    }
    id v12 = objc_msgSend(v11, sel_newTextureWithDescriptor_, v31);
    swift_unknownObjectRelease();
    if (v12)
    {
      uint64_t v13 = (void *)sub_25298D498();
      objc_msgSend(v10, sel_setLabel_, v13);

      __n128 v14 = (void *)sub_25298D498();
      objc_msgSend(v12, sel_setLabel_, v14);

      long long v15 = *(void **)(v1 + OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_context);
      swift_unknownObjectRetain();
      objc_msgSend(v5, sel_extent);
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
      objc_msgSend(v15, sel_render_toMTLTexture_commandBuffer_bounds_colorSpace_, v5, v12, v10, DeviceRGB, v17, v19, v21, v23);
      swift_unknownObjectRelease();

      id v25 = objc_msgSend(a1, sel_currentRenderPassDescriptor);
      if (!v25)
      {
        objc_msgSend(v10, sel_commit);
        objc_msgSend(v9, sel_endScope);

        swift_unknownObjectRelease();
        goto LABEL_22;
      }
      uint64_t v26 = v25;
      id v27 = objc_msgSend(v10, sel_renderCommandEncoderWithDescriptor_, v25);
      if (v27)
      {
        unint64_t v28 = v27;
        int64_t v29 = (void *)sub_25298D498();
        objc_msgSend(v28, sel_setLabel_, v29);

        objc_msgSend(v28, sel_setRenderPipelineState_, *(void *)(v1 + OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_renderPipelineState));
        objc_msgSend(v28, sel_setVertexBuffer_offset_atIndex_, *(void *)(v1 + OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_vertexBuffer), 0, 0);
        objc_msgSend(v28, sel_setFragmentTexture_atIndex_, v12, 0);
        objc_msgSend(v28, sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_, 3, 6, 0, *(void *)(v1 + OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_indexBuffer), 0);
        objc_msgSend(v28, sel_endEncoding);
        id v30 = objc_msgSend(a1, sel_currentDrawable);
        if (v30)
        {
          objc_msgSend(v10, sel_presentDrawable_, v30);
          objc_msgSend(v10, sel_commit);
          objc_msgSend(v9, sel_endScope);

          swift_unknownObjectRelease();
          swift_unknownObjectRelease();

          swift_unknownObjectRelease();
        }
        else
        {
          objc_msgSend(v10, sel_commit);
          objc_msgSend(v9, sel_endScope);

          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
        }
LABEL_22:
        swift_unknownObjectRelease();
        return;
      }
      goto LABEL_31;
    }
    swift_unknownObjectRelease();
  }
  objc_msgSend(v9, sel_endScope);
}

ValueMetadata *type metadata accessor for FrameRenderer()
{
  return &type metadata for FrameRenderer;
}

id sub_252987888()
{
  uint64_t v1 = v0;
  cacheOut[1] = *(CVMetalTextureCacheRef *)MEMORY[0x263EF8340];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v85 = OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_textureCache;
  *(void *)&v0[OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_textureCache] = 0;
  uint64_t v82 = OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_sourceImage;
  *(void *)&v0[OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_sourceImage] = 0;
  uint64_t v3 = v0;
  uint64_t v4 = sub_25298CBC4();
  id v5 = objc_msgSend(self, sel_contextWithMTLCommandQueue_, v4);
  swift_unknownObjectRelease();
  uint64_t v81 = OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_context;
  *(void *)&v3[OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_context] = v5;
  sub_252988560();
  uint64_t v6 = sub_25298D468();
  MEMORY[0x270FA5388](v6 - 8);
  sub_25298D458();
  uint64_t v7 = sub_25298D598();
  MEMORY[0x270FA5388](v7);
  id v88 = (id)MEMORY[0x263F8EE78];
  sub_2529885A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DEC8);
  sub_2529885EC();
  sub_25298D5F8();
  uint64_t v8 = sub_25298D5A8();
  MEMORY[0x270FA5388](v8);
  (*(void (**)(char *, void))(v10 + 104))((char *)&v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F8F128]);
  uint64_t v11 = sub_25298D5B8();
  uint64_t v80 = OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_dispatchQueue;
  *(void *)&v3[OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_dispatchQueue] = v11;
  dispatch_semaphore_t v12 = dispatch_semaphore_create(3);
  uint64_t v79 = OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_semaphore;
  *(void *)&v3[OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_semaphore] = v12;
  *(void *)&v3[OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_inflightBuffer] = 0;
  uint64_t v84 = (objc_class *)ObjectType;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v14 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DC00);
  uint64_t v16 = *(void *)(*(void *)(v15 - 8) + 64);
  MEMORY[0x270FA5388](v15 - 8);
  unint64_t v17 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
  double v18 = (char *)&v76 - v17;
  double v19 = (void *)sub_25298D498();
  double v20 = (void *)sub_25298D498();
  id v83 = v14;
  id v21 = objc_msgSend(v14, sel_URLForResource_withExtension_, v19, v20);

  MEMORY[0x270FA5388](v22);
  if (v21)
  {
    sub_25298CD48();

    uint64_t v23 = sub_25298CD58();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))((char *)&v76 - v17, 0, 1, v23);
  }
  else
  {
    uint64_t v24 = sub_25298CD58();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))((char *)&v76 - v17, 1, 1, v24);
  }
  sub_252988648((uint64_t)&v76 - v17, (uint64_t)&v76 - v17);
  id v25 = MTLCreateSystemDefaultDevice();
  if (!v25) {
    goto LABEL_33;
  }
  uint64_t v26 = v25;
  MEMORY[0x270FA5388](v25);
  id v27 = (char *)&v76 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2529886B0((uint64_t)v18, (uint64_t)v27);
  uint64_t v28 = sub_25298CD58();
  uint64_t v29 = *(void *)(v28 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28) == 1) {
    __break(1u);
  }
  id v30 = (void *)sub_25298CD38();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v27, v28);
  id v88 = 0;
  id v31 = objc_msgSend(v26, sel_newLibraryWithURL_error_, v30, &v88);
  swift_unknownObjectRelease();

  id v32 = v88;
  if (!v31)
  {
    uint64_t v69 = v32;
    unint64_t v70 = (void *)sub_25298CD28();

    swift_willThrow();
LABEL_25:
    sub_252988718();
    swift_allocError();
    *uint64_t v72 = 0;
    swift_willThrow();

    sub_25297C780((uint64_t)v18);
    uint64_t v73 = *(void **)&v3[v80];

    swift_deallocPartialClassInstance();
    return v31;
  }
  uint64_t v33 = (void *)sub_25298D498();
  id v34 = objc_msgSend(v31, sel_newFunctionWithName_, v33);

  if (!v34) {
    goto LABEL_23;
  }
  char v35 = (void *)sub_25298D498();
  id v36 = objc_msgSend(v31, sel_newFunctionWithName_, v35);

  if (!v36)
  {
    swift_unknownObjectRelease();
LABEL_23:
    sub_252988718();
    unint64_t v70 = (void *)swift_allocError();
    *id v71 = 2;
    swift_willThrow();
LABEL_24:
    swift_unknownObjectRelease();
    goto LABEL_25;
  }
  qword_269C3EF28 = (uint64_t)v31;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  cacheOut[0] = 0;
  CFAllocatorRef v37 = (const __CFAllocator *)*MEMORY[0x263EFFB10];
  id v38 = MTLCreateSystemDefaultDevice();
  if (!v38)
  {
LABEL_34:
    id v88 = 0;
    unint64_t v89 = 0xE000000000000000;
    char v87 = 0;
    goto LABEL_35;
  }
  CVReturn v39 = CVMetalTextureCacheCreate(v37, 0, v38, 0, cacheOut);
  swift_unknownObjectRelease();
  if (v39) {
    goto LABEL_36;
  }
  CVMetalTextureCacheRef v40 = cacheOut[0];
  if (!cacheOut[0])
  {
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v41 = *(void **)&v1[v85];
  *(CVMetalTextureCacheRef *)&v1[v85] = cacheOut[0];
  uint64_t v77 = v40;

  sub_252988874();
  unint64_t v43 = v42;
  id v44 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F129C8]), sel_init);
  uint64_t v45 = (void *)sub_25298D498();
  objc_msgSend(v44, sel_setLabel_, v45);

  objc_msgSend(v44, sel_setVertexFunction_, v34);
  objc_msgSend(v44, sel_setFragmentFunction_, v36);
  id v78 = v43;
  objc_msgSend(v44, sel_setVertexDescriptor_, v43);
  id v46 = objc_msgSend(v44, sel_colorAttachments);
  id v47 = objc_msgSend(v46, sel_objectAtIndexedSubscript_, 0);

  if (!v47)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  objc_msgSend(v47, sel_setPixelFormat_, 80, v36);

  objc_msgSend(v44, sel_setDepthAttachmentPixelFormat_, 0);
  id v48 = MTLCreateSystemDefaultDevice();
  if (!v48) {
    goto LABEL_34;
  }
  id v88 = 0;
  id v49 = objc_msgSend(v48, sel_newRenderPipelineStateWithDescriptor_error_, v44, &v88);
  swift_unknownObjectRelease();
  id v50 = v88;
  if (!v49)
  {
    id v75 = v88;
    unint64_t v70 = (void *)sub_25298CD28();

    swift_willThrow();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    goto LABEL_24;
  }
  *(void *)&v3[OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_renderPipelineState] = v49;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DEE8);
  uint64_t v51 = swift_allocObject();
  *(_OWORD *)(v51 + 16) = xmmword_25298EC90;
  *(_OWORD *)(v51 + 32) = xmmword_25298ECA0;
  uint64_t v52 = v51 + 32;
  *(void *)(v51 + 48) = 0x3F80000000000000;
  *(_OWORD *)(v51 + 64) = xmmword_25298ECB0;
  __asm { FMOV            V0.2S, #1.0 }
  *(void *)(v51 + 80) = _D0;
  *(_OWORD *)(v51 + 96) = xmmword_25298ECC0;
  *(void *)(v51 + 112) = 0;
  *(_OWORD *)(v51 + 128) = xmmword_25298ECD0;
  *(void *)(v51 + 144) = 1065353216;
  id v58 = v50;
  id v59 = MTLCreateSystemDefaultDevice();
  if (!v59) {
    goto LABEL_34;
  }
  id v60 = objc_msgSend(v59, sel_newBufferWithBytes_length_options_, v52, 128, 0);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (!v60)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  *(void *)&v3[OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_vertexBuffer] = v60;
  swift_unknownObjectRetain();
  uint64_t v61 = (void *)sub_25298D498();
  objc_msgSend(v60, sel_setLabel_, v61);
  swift_unknownObjectRelease();

  id v62 = MTLCreateSystemDefaultDevice();
  if (!v62) {
    goto LABEL_34;
  }
  id v63 = objc_msgSend(v62, sel_newBufferWithBytes_length_options_, &unk_2702D9100, 12, 0);
  swift_unknownObjectRelease();
  if (!v63)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  *(void *)&v3[OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_indexBuffer] = v63;
  swift_unknownObjectRetain();
  uint64_t v64 = (void *)sub_25298D498();
  objc_msgSend(v63, sel_setLabel_, v64);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  id v65 = objc_msgSend(self, sel_sharedCaptureManager);
  id v66 = MTLCreateSystemDefaultDevice();
  if (!v66)
  {
LABEL_33:
    id v88 = 0;
    unint64_t v89 = 0xE000000000000000;
    LOBYTE(cacheOut[0]) = 0;
LABEL_35:
    sub_25298D658();
    while (1)
    {
LABEL_36:
      sub_25298D678();
      __break(1u);
    }
  }
  id v67 = objc_msgSend(v65, sel_newCaptureScopeWithDevice_, v66);
  swift_unknownObjectRelease();
  *(void *)&v3[OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_captureScope] = v67;
  swift_unknownObjectRetain();
  uint64_t v68 = (void *)sub_25298D498();
  objc_msgSend(v67, sel_setLabel_, v68);
  swift_unknownObjectRelease();

  v86.receiver = v3;
  v86.super_class = v84;
  id v31 = objc_msgSendSuper2(&v86, sel_init);

  sub_25297C780((uint64_t)v18);
  return v31;
}

unint64_t sub_252988560()
{
  unint64_t result = qword_269C3DEB8;
  if (!qword_269C3DEB8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269C3DEB8);
  }
  return result;
}

unint64_t sub_2529885A0()
{
  unint64_t result = qword_269C3DEC0;
  if (!qword_269C3DEC0)
  {
    sub_25298D598();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3DEC0);
  }
  return result;
}

unint64_t sub_2529885EC()
{
  unint64_t result = qword_269C3DED0;
  if (!qword_269C3DED0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C3DEC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3DED0);
  }
  return result;
}

uint64_t sub_252988648(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DC00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2529886B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DC00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_252988718()
{
  unint64_t result = qword_269C3DEE0;
  if (!qword_269C3DEE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3DEE0);
  }
  return result;
}

uint64_t Renderer.Configuration.rendersBackground.getter()
{
  return *v0;
}

uint64_t Renderer.Configuration.renders2D.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t Renderer.Configuration.renders3D.getter()
{
  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t Renderer.Configuration.rendersHands3D.getter()
{
  return *(unsigned __int8 *)(v0 + 3);
}

uint64_t Renderer.Configuration.rendersMesh.getter()
{
  return *(unsigned __int8 *)(v0 + 4);
}

uint64_t Renderer.Configuration.rendersInfo.getter()
{
  return *(unsigned __int8 *)(v0 + 5);
}

uint64_t Renderer.Configuration.init(rendersBackground:renders2D:renders3D:rendersHands3D:rendersMesh:rendersInfo:)@<X0>(uint64_t result@<X0>, char a2@<W1>, char a3@<W2>, char a4@<W3>, char a5@<W4>, char a6@<W5>, unsigned char *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[5] = a6;
  return result;
}

uint64_t __swift_memcpy6_1(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(_WORD *)(result + 4) = *((_WORD *)a2 + 2);
  *(_DWORD *)unint64_t result = v2;
  return result;
}

uint64_t _s13ConfigurationVwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[6]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t _s13ConfigurationVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)(result + 4) = 0;
    *(_DWORD *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 6) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 6) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Renderer.Configuration()
{
  return &type metadata for Renderer.Configuration;
}

void sub_252988874()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F12A78]), sel_init);
  id v1 = objc_msgSend(v0, sel_attributes);
  id v2 = objc_msgSend(v1, sel_objectAtIndexedSubscript_, 0);

  if (!v2)
  {
    __break(1u);
    goto LABEL_10;
  }
  objc_msgSend(v2, sel_setFormat_, 30);

  id v3 = objc_msgSend(v0, sel_attributes);
  id v4 = objc_msgSend(v3, sel_objectAtIndexedSubscript_, 0);

  if (!v4)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  objc_msgSend(v4, sel_setOffset_, 0);

  id v5 = objc_msgSend(v0, sel_attributes);
  id v6 = objc_msgSend(v5, sel_objectAtIndexedSubscript_, 0);

  if (!v6)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  objc_msgSend(v6, sel_setBufferIndex_, 0);

  id v7 = objc_msgSend(v0, sel_attributes);
  id v8 = objc_msgSend(v7, sel_objectAtIndexedSubscript_, 1);

  if (!v8)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  objc_msgSend(v8, sel_setFormat_, 29);

  id v9 = objc_msgSend(v0, sel_attributes);
  id v10 = objc_msgSend(v9, sel_objectAtIndexedSubscript_, 1);

  if (!v10)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  objc_msgSend(v10, sel_setOffset_, 16);

  id v11 = objc_msgSend(v0, sel_attributes);
  id v12 = objc_msgSend(v11, sel_objectAtIndexedSubscript_, 1);

  if (!v12)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  objc_msgSend(v12, sel_setBufferIndex_, 0);

  id v13 = objc_msgSend(v0, sel_layouts);
  id v14 = objc_msgSend(v13, sel_objectAtIndexedSubscript_, 0);

  if (v14)
  {
    objc_msgSend(v14, sel_setStride_, 32);

    return;
  }
LABEL_15:
  __break(1u);
}

__n128 __swift_memcpy24_16(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for Vertex(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Vertex(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for Vertex()
{
  return &type metadata for Vertex;
}

uint64_t sub_252988B80()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25298D138();
  swift_release();
  return swift_release();
}

uint64_t sub_252988BFC(uint64_t a1)
{
  uint64_t v2 = sub_25298CDE8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  id v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v11 - v7;
  id v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  swift_getKeyPath();
  swift_getKeyPath();
  v9(v6, (uint64_t)v8, v2);
  swift_retain();
  sub_25298D148();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

id Renderer.init(configuration:)@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DC78);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25298CDE8();
  uint64_t v40 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  id v14 = (char *)&v34 - v13;
  char v15 = a1[1];
  char v16 = a1[2];
  char v17 = a1[3];
  LOBYTE(v13) = a1[4];
  char v18 = a1[5];
  char v42 = *a1;
  char v47 = v15;
  char v46 = v16;
  char v45 = v17;
  char v44 = v13;
  char v43 = v18;
  id v19 = objc_allocWithZone((Class)type metadata accessor for FrameRenderer.Observer());
  id result = sub_252987888();
  if (!v2)
  {
    id v39 = result;
    type metadata accessor for Renderer2D();
    uint64_t v21 = swift_allocObject();
    uint64_t v37 = v5;
    uint64_t v38 = v21;
    uint64_t v22 = MEMORY[0x263F8EE78];
    uint64_t v41 = MEMORY[0x263F8EE78];
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DB10);
    uint64_t v36 = v6;
    sub_25298D128();
    type metadata accessor for Renderer3D();
    uint64_t v35 = swift_allocObject();
    uint64_t v41 = v22;
    sub_25298D128();
    type metadata accessor for RendererMesh();
    uint64_t v34 = swift_allocObject();
    uint64_t v41 = v22;
    sub_25298D128();
    type metadata accessor for RendererInfo();
    uint64_t v23 = swift_allocObject();
    uint64_t v24 = v23 + OBJC_IVAR____TtC7HumanUI12RendererInfo__repetition;
    sub_25298CDC8();
    uint64_t v25 = v40;
    (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v12, v14, v9);
    sub_25298D128();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v9);
    id result = (id)(*(uint64_t (**)(uint64_t, char *, uint64_t))(v36 + 32))(v24, v8, v37);
    char v26 = v42;
    char v27 = v47;
    char v28 = v46;
    char v29 = v45;
    char v30 = v44;
    char v31 = v43;
    uint64_t v32 = v38;
    *(void *)a2 = v39;
    *(void *)(a2 + 8) = v32;
    uint64_t v33 = v34;
    *(void *)(a2 + 16) = v35;
    *(void *)(a2 + 24) = v33;
    *(void *)(a2 + 32) = v23;
    *(unsigned char *)(a2 + 40) = v26;
    *(unsigned char *)(a2 + 41) = v27;
    *(unsigned char *)(a2 + 42) = v28;
    *(unsigned char *)(a2 + 43) = v29;
    *(unsigned char *)(a2 + 44) = v30;
    *(unsigned char *)(a2 + 45) = v31;
  }
  return result;
}

uint64_t Renderer.applied(to:)(uint64_t a1)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v2 + 72) = *(_OWORD *)v1;
  *(void *)(v2 + 64) = a1;
  *(_OWORD *)(v2 + 88) = v3;
  *(void *)(v2 + 104) = *(void *)(v1 + 32);
  *(unsigned char *)(v2 + 62) = *(unsigned char *)(v1 + 40);
  *(unsigned char *)(v2 + 63) = *(unsigned char *)(v1 + 41);
  *(unsigned char *)(v2 + 128) = *(unsigned char *)(v1 + 42);
  *(unsigned char *)(v2 + 129) = *(unsigned char *)(v1 + 43);
  *(unsigned char *)(v2 + 130) = *(unsigned char *)(v1 + 44);
  *(unsigned char *)(v2 + 131) = *(unsigned char *)(v1 + 45);
  return MEMORY[0x270FA2498](sub_25298913C, 0, 0);
}

uint64_t sub_25298913C()
{
  sub_25298D548();
  char v1 = *(unsigned char *)(v0 + 131);
  char v2 = *(unsigned char *)(v0 + 130);
  char v3 = *(unsigned char *)(v0 + 129);
  char v4 = *(unsigned char *)(v0 + 128);
  char v5 = *(unsigned char *)(v0 + 63);
  char v6 = *(unsigned char *)(v0 + 62);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 72);
  uint64_t v7 = *(void *)(v0 + 104);
  *(_OWORD *)(v0 + 32) = *(_OWORD *)(v0 + 88);
  *(void *)(v0 + 48) = v7;
  *(unsigned char *)(v0 + 56) = v6;
  *(unsigned char *)(v0 + 57) = v5;
  *(unsigned char *)(v0 + 58) = v4;
  *(unsigned char *)(v0 + 59) = v3;
  *(unsigned char *)(v0 + 60) = v2;
  *(unsigned char *)(v0 + 61) = v1;
  id v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v8;
  void *v8 = v0;
  v8[1] = sub_252989268;
  uint64_t v9 = *(void *)(v0 + 64);
  return sub_2529893B4(v9);
}

uint64_t sub_252989268()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25298939C, 0, 0);
  }
  else
  {
    char v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_25298939C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2529893B4(uint64_t a1)
{
  *(void *)(v2 + 56) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DF18);
  *(void *)(v2 + 64) = swift_task_alloc();
  uint64_t v3 = sub_25298CDE8();
  *(void *)(v2 + 72) = v3;
  *(void *)(v2 + 80) = *(void *)(v3 - 8);
  *(void *)(v2 + 88) = swift_task_alloc();
  *(void *)(v2 + 96) = swift_task_alloc();
  *(void *)(v2 + 104) = swift_task_alloc();
  uint64_t v4 = sub_25298D0C8();
  *(void *)(v2 + 112) = v4;
  *(void *)(v2 + 120) = *(void *)(v4 - 8);
  *(void *)(v2 + 128) = swift_task_alloc();
  uint64_t v5 = sub_25298D0E8();
  *(void *)(v2 + 136) = v5;
  *(void *)(v2 + 144) = *(void *)(v5 - 8);
  *(void *)(v2 + 152) = swift_task_alloc();
  uint64_t v6 = sub_25298D108();
  *(void *)(v2 + 160) = v6;
  *(void *)(v2 + 168) = *(void *)(v6 - 8);
  uint64_t v7 = swift_task_alloc();
  long long v8 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v2 + 184) = *(_OWORD *)v1;
  *(void *)(v2 + 176) = v7;
  *(_OWORD *)(v2 + 200) = v8;
  *(void *)(v2 + 216) = *(void *)(v1 + 32);
  *(unsigned char *)(v2 + 424) = *(unsigned char *)(v1 + 40);
  *(unsigned char *)(v2 + 425) = *(unsigned char *)(v1 + 41);
  *(unsigned char *)(v2 + 426) = *(unsigned char *)(v1 + 42);
  *(unsigned char *)(v2 + 427) = *(unsigned char *)(v1 + 43);
  *(unsigned char *)(v2 + 428) = *(unsigned char *)(v1 + 44);
  *(unsigned char *)(v2 + 429) = *(unsigned char *)(v1 + 45);
  return MEMORY[0x270FA2498](sub_252989618, 0, 0);
}

uint64_t sub_252989618()
{
  uint64_t v1 = self;
  v0[28] = v1;
  id v2 = objc_msgSend(v1, sel_processInfo);
  objc_msgSend(v2, sel_systemUptime);
  v0[29] = v3;

  sub_25298D0D8();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[30] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_252989700;
  uint64_t v5 = v0[22];
  uint64_t v6 = v0[19];
  return MEMORY[0x270F3C7A8](v5, v6);
}

uint64_t sub_252989700()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 152);
  uint64_t v4 = *(void *)(*v1 + 144);
  uint64_t v5 = *(void *)(*v1 + 136);
  uint64_t v6 = *v1;
  *(void *)(*v1 + 248) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25298B2F0, 0, 0);
  }
  else if (*(unsigned char *)(v2 + 424) == 1)
  {
    *(void *)(v2 + 256) = sub_25298D538();
    *(void *)(v2 + 264) = sub_25298D528();
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v2 + 272) = v7;
    *uint64_t v7 = v6;
    v7[1] = sub_2529899F8;
    return MEMORY[0x270F3C920]();
  }
  else if (*(unsigned char *)(v2 + 427) == 1)
  {
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v2 + 288) = v8;
    void *v8 = v6;
    v8[1] = sub_252989C74;
    return MEMORY[0x270F3C770]();
  }
  else
  {
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v2 + 320) = v9;
    *uint64_t v9 = v6;
    v9[1] = sub_252989F70;
    return MEMORY[0x270F3C7B0]();
  }
}

uint64_t sub_2529899F8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 280) = a1;
  swift_task_dealloc();
  uint64_t v3 = sub_25298D508();
  return MEMORY[0x270FA2498](sub_252989B3C, v3, v2);
}

uint64_t sub_252989B3C()
{
  uint64_t v1 = *(void *)(v0 + 280);
  swift_release();
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 184);
    uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_sourceImage);
    *(void *)(v2 + OBJC_IVAR____TtCV7HumanUI13FrameRenderer8Observer_sourceImage) = *(void *)(v0 + 280);
  }
  if (*(unsigned char *)(v0 + 427) == 1)
  {
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 288) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_252989C74;
    return MEMORY[0x270F3C770]();
  }
  else
  {
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 320) = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_252989F70;
    return MEMORY[0x270F3C7B0]();
  }
}

uint64_t sub_252989C74(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 296) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_25298B3B0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  else
  {
    *(void *)(v4 + 304) = a1;
    sub_25298D538();
    *(void *)(v4 + 312) = sub_25298D528();
    uint64_t v8 = sub_25298D508();
    uint64_t v10 = v9;
    uint64_t v5 = sub_252989DD8;
    uint64_t v6 = v8;
    uint64_t v7 = v10;
  }
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_252989DD8()
{
  uint64_t v1 = *(void *)(v0 + 304);
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)(v0 + 48) = v1;
  swift_retain();
  sub_25298D148();
  return MEMORY[0x270FA2498](sub_252989E98, 0, 0);
}

uint64_t sub_252989E98()
{
  (*(void (**)(void, void))(v0[21] + 8))(v0[22], v0[20]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_252989F70(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 328) = a1;
  *(void *)(v3 + 336) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_25298B488;
  }
  else {
    uint64_t v4 = sub_25298A084;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_25298A084()
{
  if (*(unsigned char *)(v0 + 425) == 1)
  {
    sub_25298D538();
    *(void *)(v0 + 344) = sub_25298D528();
    uint64_t v1 = sub_25298D508();
    uint64_t v3 = v2;
    uint64_t v4 = sub_25298A428;
LABEL_9:
    return MEMORY[0x270FA2498](v4, v1, v3);
  }
  if (*(unsigned char *)(v0 + 426) == 1)
  {
    uint64_t v5 = *(void *)(v0 + 328);
    if (*(void *)(v5 + 16))
    {
      uint64_t v7 = *(void *)(v0 + 120);
      unint64_t v6 = *(void *)(v0 + 128);
      uint64_t v8 = *(void *)(v0 + 112);
      uint64_t v9 = *(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16);
      unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      v9(v6, v5 + v10, v8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DF20);
      uint64_t v11 = swift_allocObject();
      *(void *)(v0 + 352) = v11;
      *(_OWORD *)(v11 + 16) = xmmword_25298ED70;
      v9(v11 + v10, v6, v8);
      sub_25298D538();
      *(void *)(v0 + 360) = sub_25298D528();
      uint64_t v1 = sub_25298D508();
      uint64_t v3 = v12;
      uint64_t v4 = sub_25298A848;
      goto LABEL_9;
    }
  }
  uint64_t v13 = *(void *)(v0 + 328);
  if (*(unsigned char *)(v0 + 428) == 1 && *(void *)(v13 + 16))
  {
    uint64_t v15 = *(void *)(v0 + 120);
    unint64_t v14 = *(void *)(v0 + 128);
    uint64_t v16 = *(void *)(v0 + 112);
    char v17 = *(void (**)(unint64_t, unint64_t, uint64_t))(v15 + 16);
    unint64_t v18 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    v17(v14, v13 + v18, v16);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DF20);
    uint64_t v19 = swift_allocObject();
    *(void *)(v0 + 368) = v19;
    *(_OWORD *)(v19 + 16) = xmmword_25298ED70;
    v17(v19 + v18, v14, v16);
    sub_25298D538();
    *(void *)(v0 + 376) = sub_25298D528();
    uint64_t v1 = sub_25298D508();
    uint64_t v3 = v20;
    uint64_t v4 = sub_25298ABB4;
    goto LABEL_9;
  }
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v0 + 429) == 1)
  {
    uint64_t v21 = (void *)swift_task_alloc();
    *(void *)(v0 + 384) = v21;
    *uint64_t v21 = v0;
    v21[1] = sub_25298AE08;
    uint64_t v22 = *(void *)(v0 + 64);
    return MEMORY[0x270F3C7A0](v22);
  }
  else
  {
    sub_25297B2DC(*(double *)(v0 + 232));
    (*(void (**)(void, void))(*(void *)(v0 + 168) + 8))(*(void *)(v0 + 176), *(void *)(v0 + 160));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
    return v23();
  }
}

uint64_t sub_25298A428()
{
  uint64_t v1 = *(void *)(v0 + 328);
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)(v0 + 40) = v1;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_25298D148();
  return MEMORY[0x270FA2498](sub_25298A4F4, 0, 0);
}

uint64_t sub_25298A4F4()
{
  if (*(unsigned char *)(v0 + 426) == 1)
  {
    uint64_t v1 = *(void *)(v0 + 328);
    if (*(void *)(v1 + 16))
    {
      uint64_t v3 = *(void *)(v0 + 120);
      unint64_t v2 = *(void *)(v0 + 128);
      uint64_t v4 = *(void *)(v0 + 112);
      uint64_t v5 = *(void (**)(unint64_t, unint64_t, uint64_t))(v3 + 16);
      unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
      v5(v2, v1 + v6, v4);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DF20);
      uint64_t v7 = swift_allocObject();
      *(void *)(v0 + 352) = v7;
      *(_OWORD *)(v7 + 16) = xmmword_25298ED70;
      v5(v7 + v6, v2, v4);
      sub_25298D538();
      *(void *)(v0 + 360) = sub_25298D528();
      uint64_t v8 = sub_25298D508();
      uint64_t v10 = v9;
      uint64_t v11 = sub_25298A848;
LABEL_7:
      return MEMORY[0x270FA2498](v11, v8, v10);
    }
  }
  uint64_t v12 = *(void *)(v0 + 328);
  if (*(unsigned char *)(v0 + 428) == 1 && *(void *)(v12 + 16))
  {
    uint64_t v14 = *(void *)(v0 + 120);
    unint64_t v13 = *(void *)(v0 + 128);
    uint64_t v15 = *(void *)(v0 + 112);
    uint64_t v16 = *(void (**)(unint64_t, unint64_t, uint64_t))(v14 + 16);
    unint64_t v17 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    v16(v13, v12 + v17, v15);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DF20);
    uint64_t v18 = swift_allocObject();
    *(void *)(v0 + 368) = v18;
    *(_OWORD *)(v18 + 16) = xmmword_25298ED70;
    v16(v18 + v17, v13, v15);
    sub_25298D538();
    *(void *)(v0 + 376) = sub_25298D528();
    uint64_t v8 = sub_25298D508();
    uint64_t v10 = v19;
    uint64_t v11 = sub_25298ABB4;
    goto LABEL_7;
  }
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v0 + 429) == 1)
  {
    uint64_t v20 = (void *)swift_task_alloc();
    *(void *)(v0 + 384) = v20;
    void *v20 = v0;
    v20[1] = sub_25298AE08;
    uint64_t v21 = *(void *)(v0 + 64);
    return MEMORY[0x270F3C7A0](v21);
  }
  else
  {
    sub_25297B2DC(*(double *)(v0 + 232));
    (*(void (**)(void, void))(*(void *)(v0 + 168) + 8))(*(void *)(v0 + 176), *(void *)(v0 + 160));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
    return v22();
  }
}

uint64_t sub_25298A848()
{
  uint64_t v1 = v0[44];
  uint64_t v3 = v0[15];
  uint64_t v2 = v0[16];
  uint64_t v4 = v0[14];
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  v0[4] = v1;
  swift_retain();
  sub_25298D148();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return MEMORY[0x270FA2498](sub_25298A930, 0, 0);
}

uint64_t sub_25298A930()
{
  uint64_t v1 = *(void *)(v0 + 328);
  if (*(unsigned char *)(v0 + 428) == 1 && *(void *)(v1 + 16))
  {
    uint64_t v3 = *(void *)(v0 + 120);
    unint64_t v2 = *(void *)(v0 + 128);
    uint64_t v4 = *(void *)(v0 + 112);
    uint64_t v5 = *(void (**)(unint64_t, unint64_t, uint64_t))(v3 + 16);
    unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    v5(v2, v1 + v6, v4);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DF20);
    uint64_t v7 = swift_allocObject();
    *(void *)(v0 + 368) = v7;
    *(_OWORD *)(v7 + 16) = xmmword_25298ED70;
    v5(v7 + v6, v2, v4);
    sub_25298D538();
    *(void *)(v0 + 376) = sub_25298D528();
    uint64_t v9 = sub_25298D508();
    return MEMORY[0x270FA2498](sub_25298ABB4, v9, v8);
  }
  else
  {
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(v0 + 429) == 1)
    {
      uint64_t v10 = (void *)swift_task_alloc();
      *(void *)(v0 + 384) = v10;
      *uint64_t v10 = v0;
      v10[1] = sub_25298AE08;
      uint64_t v11 = *(void *)(v0 + 64);
      return MEMORY[0x270F3C7A0](v11);
    }
    else
    {
      sub_25297B2DC(*(double *)(v0 + 232));
      (*(void (**)(void, void))(*(void *)(v0 + 168) + 8))(*(void *)(v0 + 176), *(void *)(v0 + 160));
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
      return v12();
    }
  }
}

uint64_t sub_25298ABB4()
{
  uint64_t v1 = v0[46];
  uint64_t v3 = v0[15];
  uint64_t v2 = v0[16];
  uint64_t v4 = v0[14];
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  v0[3] = v1;
  swift_retain();
  sub_25298D148();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return MEMORY[0x270FA2498](sub_25298AC9C, 0, 0);
}

uint64_t sub_25298AC9C()
{
  if (*(unsigned char *)(v0 + 429) == 1)
  {
    uint64_t v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 384) = v1;
    *uint64_t v1 = v0;
    v1[1] = sub_25298AE08;
    uint64_t v2 = *(void *)(v0 + 64);
    return MEMORY[0x270F3C7A0](v2);
  }
  else
  {
    sub_25297B2DC(*(double *)(v0 + 232));
    (*(void (**)(void, void))(*(void *)(v0 + 168) + 8))(*(void *)(v0 + 176), *(void *)(v0 + 160));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return v3();
  }
}

uint64_t sub_25298AE08()
{
  *(void *)(*(void *)v1 + 392) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25298B560;
  }
  else {
    uint64_t v2 = sub_25298AF1C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25298AF1C()
{
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 64);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_25298C4F4(v3);
    sub_25297B2DC(*(double *)(v0 + 232));
    (*(void (**)(void, void))(*(void *)(v0 + 168) + 8))(*(void *)(v0 + 176), *(void *)(v0 + 160));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v2 + 32))(*(void *)(v0 + 104), v3, v1);
    sub_25298D538();
    *(void *)(v0 + 400) = sub_25298D528();
    uint64_t v7 = sub_25298D508();
    return MEMORY[0x270FA2498](sub_25298B0CC, v7, v6);
  }
}

uint64_t sub_25298B0CC()
{
  uint64_t v2 = v0[12];
  uint64_t v1 = v0[13];
  uint64_t v4 = v0[10];
  uint64_t v3 = v0[11];
  uint64_t v5 = v0[9];
  swift_release();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v6(v2, v1, v5);
  swift_getKeyPath();
  swift_getKeyPath();
  v6(v3, v2, v5);
  swift_retain();
  sub_25298D148();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v0[51] = v7;
  v0[52] = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v7(v2, v5);
  return MEMORY[0x270FA2498](sub_25298B1FC, 0, 0);
}

uint64_t sub_25298B1FC()
{
  (*(void (**)(void, void))(v0 + 408))(*(void *)(v0 + 104), *(void *)(v0 + 72));
  sub_25297B2DC(*(double *)(v0 + 232));
  (*(void (**)(void, void))(*(void *)(v0 + 168) + 8))(*(void *)(v0 + 176), *(void *)(v0 + 160));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25298B2F0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25298B3B0()
{
  (*(void (**)(void, void))(v0[21] + 8))(v0[22], v0[20]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_25298B488()
{
  (*(void (**)(void, void))(v0[21] + 8))(v0[22], v0[20]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_25298B560()
{
  id v1 = objc_msgSend(*(id *)(v0 + 224), sel_processInfo);
  objc_msgSend(v1, sel_systemUptime);
  double v3 = v2;

  if (qword_269C3D860 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25298CD88();
  __swift_project_value_buffer(v4, (uint64_t)qword_269C3EF10);
  uint64_t v5 = sub_25298CD68();
  os_log_type_t v6 = sub_25298D568();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(void **)(v0 + 392);
  if (v7)
  {
    double v9 = *(double *)(v0 + 232);
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 134217984;
    *(double *)(v0 + 16) = (v3 - v9) * 1000.0;
    sub_25298D5C8();
    _os_log_impl(&dword_252973000, v5, v6, "Renderer: %f", v10, 0xCu);
    MEMORY[0x2533C2760](v10, -1, -1);
  }

  (*(void (**)(void, void))(*(void *)(v0 + 168) + 8))(*(void *)(v0 + 176), *(void *)(v0 + 160));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t Renderer.render<A>(descriptors:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 64) = a1;
  *(void *)(v4 + 72) = a2;
  uint64_t v7 = sub_25298CE28();
  *(void *)(v4 + 80) = v7;
  *(void *)(v4 + 88) = *(void *)(v7 - 8);
  *(void *)(v4 + 96) = swift_task_alloc();
  *(void *)(v4 + 104) = *(void *)(a3 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  *(void *)(v4 + 112) = AssociatedTypeWitness;
  *(void *)(v4 + 120) = *(void *)(AssociatedTypeWitness - 8);
  *(void *)(v4 + 128) = swift_task_alloc();
  *(void *)(v4 + 136) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269C3DF08);
  *(void *)(v4 + 144) = swift_task_alloc();
  *(void *)(v4 + 152) = *(void *)(a2 - 8);
  *(void *)(v4 + 160) = swift_task_alloc();
  uint64_t v9 = swift_getAssociatedTypeWitness();
  *(void *)(v4 + 168) = v9;
  *(void *)(v4 + 176) = *(void *)(v9 - 8);
  *(void *)(v4 + 184) = swift_task_alloc();
  long long v10 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)(v4 + 192) = *(_OWORD *)v3;
  *(_OWORD *)(v4 + 208) = v10;
  *(void *)(v4 + 224) = *(void *)(v3 + 32);
  *(unsigned char *)(v4 + 62) = *(unsigned char *)(v3 + 40);
  *(unsigned char *)(v4 + 63) = *(unsigned char *)(v3 + 41);
  *(unsigned char *)(v4 + 272) = *(unsigned char *)(v3 + 42);
  *(unsigned char *)(v4 + 273) = *(unsigned char *)(v3 + 43);
  *(unsigned char *)(v4 + 274) = *(unsigned char *)(v3 + 44);
  *(unsigned char *)(v4 + 275) = *(unsigned char *)(v3 + 45);
  return MEMORY[0x270FA2498](sub_25298BA0C, 0, 0);
}

uint64_t sub_25298BA0C()
{
  (*(void (**)(void, void, void))(v0[19] + 16))(v0[20], v0[8], v0[9]);
  sub_25298D558();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v0[29] = AssociatedConformanceWitness;
  double v2 = (void *)swift_task_alloc();
  v0[30] = v2;
  *double v2 = v0;
  v2[1] = sub_25298BB24;
  uint64_t v3 = v0[21];
  uint64_t v5 = v0[17];
  uint64_t v4 = v0[18];
  return MEMORY[0x270FA1E88](v4, 0, 0, v5, v3, AssociatedConformanceWitness);
}

uint64_t sub_25298BB24()
{
  *(void *)(*(void *)v1 + 248) = v0;
  swift_task_dealloc();
  if (v0) {
    double v2 = sub_25298C0A4;
  }
  else {
    double v2 = sub_25298BC38;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25298BC38()
{
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 88);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 176) + 8))(*(void *)(v0 + 184), *(void *)(v0 + 168));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
LABEL_5:
    return v4();
  }
  uint64_t v5 = *(void *)(v0 + 248);
  (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(*(void *)(v0 + 96), v1, v2);
  sub_25298D548();
  if (v5)
  {
    uint64_t v7 = *(void *)(v0 + 176);
    uint64_t v6 = *(void *)(v0 + 184);
    uint64_t v8 = *(void *)(v0 + 168);
    (*(void (**)(void, void))(*(void *)(v0 + 88) + 8))(*(void *)(v0 + 96), *(void *)(v0 + 80));
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_5;
  }
  long long v10 = *(_OWORD *)(v0 + 208);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 192);
  char v11 = *(unsigned char *)(v0 + 275);
  char v12 = *(unsigned char *)(v0 + 274);
  char v13 = *(unsigned char *)(v0 + 273);
  char v14 = *(unsigned char *)(v0 + 272);
  char v15 = *(unsigned char *)(v0 + 63);
  char v16 = *(unsigned char *)(v0 + 62);
  uint64_t v17 = *(void *)(v0 + 224);
  *(_OWORD *)(v0 + 32) = v10;
  *(void *)(v0 + 48) = v17;
  *(unsigned char *)(v0 + 56) = v16;
  *(unsigned char *)(v0 + 57) = v15;
  *(unsigned char *)(v0 + 58) = v14;
  *(unsigned char *)(v0 + 59) = v13;
  *(unsigned char *)(v0 + 60) = v12;
  *(unsigned char *)(v0 + 61) = v11;
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 256) = v18;
  *uint64_t v18 = v0;
  v18[1] = sub_25298BEA4;
  uint64_t v19 = *(void *)(v0 + 96);
  return sub_2529893B4(v19);
}

uint64_t sub_25298BEA4()
{
  *(void *)(*(void *)v1 + 264) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25298C224;
  }
  else {
    uint64_t v2 = sub_25298BFB8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25298BFB8()
{
  (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v0[29] = AssociatedConformanceWitness;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[30] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25298BB24;
  uint64_t v3 = v0[21];
  uint64_t v5 = v0[17];
  uint64_t v4 = v0[18];
  return MEMORY[0x270FA1E88](v4, 0, 0, v5, v3, AssociatedConformanceWitness);
}

uint64_t sub_25298C0A4()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[15] + 32);
  v1(v0[16], v0[17], v0[14]);
  swift_getAssociatedConformanceWitness();
  uint64_t v2 = sub_25298D6E8();
  uint64_t v3 = v0[16];
  if (v2)
  {
    (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[14]);
  }
  else
  {
    uint64_t v4 = v0[14];
    swift_allocError();
    v1(v5, v3, v4);
  }
  (*(void (**)(void, void))(v0[22] + 8))(v0[23], v0[21]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_25298C224()
{
  uint64_t v2 = v0[22];
  uint64_t v1 = v0[23];
  uint64_t v3 = v0[21];
  (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_25298C308(uint64_t a1)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v2 + 72) = *(_OWORD *)v1;
  *(void *)(v2 + 64) = a1;
  *(_OWORD *)(v2 + 88) = v3;
  *(void *)(v2 + 104) = *(void *)(v1 + 32);
  *(unsigned char *)(v2 + 62) = *(unsigned char *)(v1 + 40);
  *(unsigned char *)(v2 + 63) = *(unsigned char *)(v1 + 41);
  *(unsigned char *)(v2 + 128) = *(unsigned char *)(v1 + 42);
  *(unsigned char *)(v2 + 129) = *(unsigned char *)(v1 + 43);
  *(unsigned char *)(v2 + 130) = *(unsigned char *)(v1 + 44);
  *(unsigned char *)(v2 + 131) = *(unsigned char *)(v1 + 45);
  return MEMORY[0x270FA2498](sub_25298913C, 0, 0);
}

uint64_t sub_25298C36C@<X0>(void *a1@<X8>)
{
  return sub_25298C3D0(a1);
}

uint64_t sub_25298C380()
{
  return sub_25298C460();
}

uint64_t sub_25298C394@<X0>(void *a1@<X8>)
{
  return sub_25298C3D0(a1);
}

uint64_t sub_25298C3A8()
{
  return sub_25298C460();
}

uint64_t sub_25298C3BC@<X0>(void *a1@<X8>)
{
  return sub_25298C3D0(a1);
}

uint64_t sub_25298C3D0@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25298D138();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_25298C44C()
{
  return sub_25298C460();
}

uint64_t sub_25298C460()
{
  return sub_25298D148();
}

uint64_t sub_25298C4D8()
{
  return MEMORY[0x263F49D00];
}

ValueMetadata *type metadata accessor for Renderer()
{
  return &type metadata for Renderer;
}

uint64_t sub_25298C4F4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C3DF18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25298C55C@<X0>(void *a1@<X8>)
{
  return sub_25298C3D0(a1);
}

uint64_t sub_25298C584()
{
  return sub_25298C460();
}

uint64_t sub_25298C5AC@<X0>(void *a1@<X8>)
{
  return sub_25298C3D0(a1);
}

uint64_t sub_25298C5D4()
{
  return sub_25298C460();
}

uint64_t sub_25298C5FC@<X0>(void *a1@<X8>)
{
  return sub_25298C3D0(a1);
}

uint64_t sub_25298C624()
{
  return sub_25298C460();
}

unint64_t RendererError.errorDescription.getter()
{
  unint64_t result = 0xD000000000000013;
  switch(*v0)
  {
    case 2:
    case 3:
    case 4:
      unint64_t result = 0x20676E697373694DLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t RendererError.debugDescription.getter()
{
  unint64_t result = 0xD000000000000013;
  switch(*v0)
  {
    case 2:
    case 3:
    case 4:
      unint64_t result = 0x20676E697373694DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t RendererError.hash(into:)()
{
  return sub_25298D788();
}

BOOL static RendererError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t RendererError.hashValue.getter()
{
  return sub_25298D798();
}

unint64_t sub_25298C838()
{
  unint64_t result = qword_269C3DF28;
  if (!qword_269C3DF28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3DF28);
  }
  return result;
}

unint64_t sub_25298C890()
{
  unint64_t result = qword_269C3DF30;
  if (!qword_269C3DF30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3DF30);
  }
  return result;
}

uint64_t sub_25298C8E8()
{
  return sub_25298CD08();
}

uint64_t sub_25298C900()
{
  return sub_25298CD18();
}

uint64_t sub_25298C918()
{
  return sub_25298CCF8();
}

unsigned char *storeEnumTagSinglePayload for RendererError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x25298CA00);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RendererError()
{
  return &type metadata for RendererError;
}

id sub_25298CB6C()
{
  v2.receiver = v0;
  v2.super_class = (Class)_s15ConnectionLayerCMa();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s15ConnectionLayerCMa()
{
  return self;
}

uint64_t sub_25298CBC4()
{
  id v0 = MTLCreateSystemDefaultDevice();
  if (v0 && (id v1 = objc_msgSend(v0, sel_newCommandQueue), swift_unknownObjectRelease(), v1))
  {
    objc_super v2 = (void *)sub_25298D498();
    objc_msgSend(v1, sel_setLabel_, v2);

    return (uint64_t)v1;
  }
  else
  {
    sub_25298D658();
    sub_25298D678();
    __break(1u);
    return sub_25298CCF8();
  }
}

uint64_t sub_25298CCF8()
{
  return MEMORY[0x270EEE918]();
}

uint64_t sub_25298CD08()
{
  return MEMORY[0x270EEE928]();
}

uint64_t sub_25298CD18()
{
  return MEMORY[0x270EEE948]();
}

uint64_t sub_25298CD28()
{
  return MEMORY[0x270EEF838]();
}

uint64_t sub_25298CD38()
{
  return MEMORY[0x270EEFD20]();
}

uint64_t sub_25298CD48()
{
  return MEMORY[0x270EEFE28]();
}

uint64_t sub_25298CD58()
{
  return MEMORY[0x270EEFF70]();
}

uint64_t sub_25298CD68()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25298CD78()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25298CD88()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25298CDA8()
{
  return MEMORY[0x270F3C778]();
}

uint64_t sub_25298CDB8()
{
  return MEMORY[0x270F3C780]();
}

uint64_t sub_25298CDC8()
{
  return MEMORY[0x270F3C788]();
}

uint64_t sub_25298CDD8()
{
  return MEMORY[0x270F3C790]();
}

uint64_t sub_25298CDE8()
{
  return MEMORY[0x270F3C798]();
}

uint64_t sub_25298CE28()
{
  return MEMORY[0x270F3C7B8]();
}

uint64_t sub_25298CE38()
{
  return MEMORY[0x270F3C7C0]();
}

uint64_t sub_25298CE48()
{
  return MEMORY[0x270F3C7C8]();
}

uint64_t sub_25298CE58()
{
  return MEMORY[0x270F3C7D0]();
}

uint64_t sub_25298CE68()
{
  return MEMORY[0x270F3C7D8]();
}

uint64_t sub_25298CE78()
{
  return MEMORY[0x270F3C7E0]();
}

uint64_t sub_25298CE88()
{
  return MEMORY[0x270F3C7E8]();
}

uint64_t sub_25298CE98()
{
  return MEMORY[0x270F3C7F0]();
}

uint64_t sub_25298CEA8()
{
  return MEMORY[0x270F3C7F8]();
}

uint64_t sub_25298CEB8()
{
  return MEMORY[0x270F3C800]();
}

uint64_t sub_25298CEC8()
{
  return MEMORY[0x270F3C808]();
}

uint64_t sub_25298CED8()
{
  return MEMORY[0x270F3C810]();
}

uint64_t sub_25298CEE8()
{
  return MEMORY[0x270F3C818]();
}

uint64_t sub_25298CEF8()
{
  return MEMORY[0x270F3C820]();
}

uint64_t sub_25298CF08()
{
  return MEMORY[0x270F3C828]();
}

uint64_t sub_25298CF18()
{
  return MEMORY[0x270F3C830]();
}

uint64_t sub_25298CF28()
{
  return MEMORY[0x270F3C838]();
}

uint64_t sub_25298CF38()
{
  return MEMORY[0x270F3C840]();
}

uint64_t sub_25298CF48()
{
  return MEMORY[0x270F3C848]();
}

uint64_t sub_25298CF58()
{
  return MEMORY[0x270F3C850]();
}

uint64_t sub_25298CF68()
{
  return MEMORY[0x270F3C858]();
}

uint64_t sub_25298CF78()
{
  return MEMORY[0x270F3C860]();
}

uint64_t sub_25298CF88()
{
  return MEMORY[0x270F3C868]();
}

uint64_t sub_25298CF98()
{
  return MEMORY[0x270F3C870]();
}

uint64_t sub_25298CFA8()
{
  return MEMORY[0x270F3C878]();
}

uint64_t sub_25298CFB8()
{
  return MEMORY[0x270F3C880]();
}

uint64_t sub_25298CFC8()
{
  return MEMORY[0x270F3C888]();
}

uint64_t sub_25298CFD8()
{
  return MEMORY[0x270F3C890]();
}

uint64_t sub_25298CFE8()
{
  return MEMORY[0x270F3C898]();
}

uint64_t sub_25298CFF8()
{
  return MEMORY[0x270F3C8A0]();
}

uint64_t sub_25298D008()
{
  return MEMORY[0x270F3C8A8]();
}

uint64_t sub_25298D018()
{
  return MEMORY[0x270F3C8B0]();
}

uint64_t sub_25298D028()
{
  return MEMORY[0x270F3C8B8]();
}

uint64_t sub_25298D038()
{
  return MEMORY[0x270F3C8C0]();
}

uint64_t sub_25298D048()
{
  return MEMORY[0x270F3C8C8]();
}

uint64_t sub_25298D058()
{
  return MEMORY[0x270F3C8D0]();
}

uint64_t sub_25298D068()
{
  return MEMORY[0x270F3C8D8]();
}

uint64_t sub_25298D078()
{
  return MEMORY[0x270F3C8E0]();
}

uint64_t sub_25298D088()
{
  return MEMORY[0x270F3C8E8]();
}

uint64_t sub_25298D098()
{
  return MEMORY[0x270F3C8F0]();
}

uint64_t sub_25298D0A8()
{
  return MEMORY[0x270F3C8F8]();
}

uint64_t sub_25298D0B8()
{
  return MEMORY[0x270F3C900]();
}

uint64_t sub_25298D0C8()
{
  return MEMORY[0x270F3C908]();
}

uint64_t sub_25298D0D8()
{
  return MEMORY[0x270F3C910]();
}

uint64_t sub_25298D0E8()
{
  return MEMORY[0x270F3C918]();
}

uint64_t sub_25298D108()
{
  return MEMORY[0x270EE78B0]();
}

uint64_t sub_25298D118()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_25298D128()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_25298D138()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_25298D148()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_25298D158()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_25298D168()
{
  return MEMORY[0x270EFED00]();
}

uint64_t sub_25298D178()
{
  return MEMORY[0x270EFFA70]();
}

uint64_t sub_25298D188()
{
  return MEMORY[0x270EFFB78]();
}

uint64_t sub_25298D198()
{
  return MEMORY[0x270F00218]();
}

uint64_t sub_25298D1A8()
{
  return MEMORY[0x270F005A0]();
}

uint64_t sub_25298D1B8()
{
  return MEMORY[0x270F00D88]();
}

uint64_t sub_25298D1C8()
{
  return MEMORY[0x270F00D98]();
}

uint64_t sub_25298D1D8()
{
  return MEMORY[0x270F01068]();
}

uint64_t sub_25298D1E8()
{
  return MEMORY[0x270F011F8]();
}

uint64_t sub_25298D1F8()
{
  return MEMORY[0x270F01220]();
}

uint64_t sub_25298D208()
{
  return MEMORY[0x270F01230]();
}

uint64_t sub_25298D218()
{
  return MEMORY[0x270F01240]();
}

uint64_t sub_25298D228()
{
  return MEMORY[0x270F01260]();
}

uint64_t sub_25298D238()
{
  return MEMORY[0x270F01278]();
}

uint64_t sub_25298D248()
{
  return MEMORY[0x270F01350]();
}

uint64_t sub_25298D258()
{
  return MEMORY[0x270F01508]();
}

uint64_t sub_25298D268()
{
  return MEMORY[0x270F01808]();
}

uint64_t sub_25298D278()
{
  return MEMORY[0x270F026A8]();
}

uint64_t sub_25298D288()
{
  return MEMORY[0x270F026B8]();
}

uint64_t sub_25298D298()
{
  return MEMORY[0x270F026C0]();
}

uint64_t sub_25298D2A8()
{
  return MEMORY[0x270F026D0]();
}

uint64_t sub_25298D2B8()
{
  return MEMORY[0x270F026E8]();
}

uint64_t sub_25298D2C8()
{
  return MEMORY[0x270F026F8]();
}

uint64_t sub_25298D2D8()
{
  return MEMORY[0x270F02708]();
}

uint64_t sub_25298D2E8()
{
  return MEMORY[0x270F02718]();
}

uint64_t sub_25298D2F8()
{
  return MEMORY[0x270F02720]();
}

uint64_t sub_25298D308()
{
  return MEMORY[0x270F02A18]();
}

uint64_t sub_25298D318()
{
  return MEMORY[0x270F02A28]();
}

uint64_t sub_25298D328()
{
  return MEMORY[0x270F02A50]();
}

uint64_t sub_25298D338()
{
  return MEMORY[0x270F02C78]();
}

uint64_t sub_25298D348()
{
  return MEMORY[0x270F02C80]();
}

uint64_t sub_25298D358()
{
  return MEMORY[0x270F030B0]();
}

uint64_t sub_25298D368()
{
  return MEMORY[0x270F03230]();
}

uint64_t sub_25298D378()
{
  return MEMORY[0x270F032C8]();
}

uint64_t sub_25298D388()
{
  return MEMORY[0x270F032D8]();
}

uint64_t sub_25298D398()
{
  return MEMORY[0x270F036B8]();
}

uint64_t sub_25298D3A8()
{
  return MEMORY[0x270F043A0]();
}

uint64_t sub_25298D3B8()
{
  return MEMORY[0x270F04400]();
}

uint64_t sub_25298D3C8()
{
  return MEMORY[0x270F04490]();
}

uint64_t sub_25298D3D8()
{
  return MEMORY[0x270F044B8]();
}

uint64_t sub_25298D3E8()
{
  return MEMORY[0x270F04578]();
}

uint64_t sub_25298D3F8()
{
  return MEMORY[0x270F04EE0]();
}

uint64_t sub_25298D408()
{
  return MEMORY[0x270F04F80]();
}

uint64_t sub_25298D418()
{
  return MEMORY[0x270F04FB8]();
}

uint64_t sub_25298D428()
{
  return MEMORY[0x270F05080]();
}

uint64_t sub_25298D438()
{
  return MEMORY[0x270F05360]();
}

uint64_t sub_25298D448()
{
  return MEMORY[0x270F05388]();
}

uint64_t sub_25298D458()
{
  return MEMORY[0x270FA09F0]();
}

uint64_t sub_25298D468()
{
  return MEMORY[0x270FA0A50]();
}

uint64_t sub_25298D478()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25298D488()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25298D498()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_25298D4A8()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_25298D4B8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25298D4C8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25298D4D8()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_25298D4E8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25298D4F8()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25298D508()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25298D528()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_25298D538()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_25298D548()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_25298D558()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_25298D568()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25298D578()
{
  return MEMORY[0x270EE58B0]();
}

uint64_t sub_25298D588()
{
  return MEMORY[0x270EE58D0]();
}

uint64_t sub_25298D598()
{
  return MEMORY[0x270FA0C58]();
}

uint64_t sub_25298D5A8()
{
  return MEMORY[0x270FA0D48]();
}

uint64_t sub_25298D5B8()
{
  return MEMORY[0x270FA0DC0]();
}

uint64_t sub_25298D5C8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25298D5D8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25298D5E8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25298D5F8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25298D608()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25298D618()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25298D628()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_25298D638()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25298D648()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25298D658()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25298D668()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25298D678()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25298D688()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25298D698()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25298D6A8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25298D6B8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25298D6C8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25298D6D8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25298D6E8()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_25298D6F8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_25298D708()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25298D718()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25298D728()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25298D738()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25298D748()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25298D758()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25298D768()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_25298D778()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25298D788()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25298D798()
{
  return MEMORY[0x270F9FC90]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C70]();
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7028]();
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x270EEA0D8](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E18]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

float acosf(float a1)
{
  MEMORY[0x270ED8590](a1);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B0](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94C0](value);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}