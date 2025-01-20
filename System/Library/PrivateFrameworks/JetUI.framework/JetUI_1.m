unsigned __int8 *sub_1B0834FA4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  int v15;
  unsigned int v16;
  int v17;
  int v18;
  unsigned int v19;
  char v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  int v29;
  unsigned int v30;
  int v31;
  char v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  int v39;
  unsigned int v40;
  int v41;
  int v42;
  unsigned int v43;
  unsigned int v44;
  char v45;
  int v46;
  unsigned int v47;
  unsigned int v48;
  int v49;
  int v50;
  unsigned int v51;
  char v52;
  unsigned int v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  int v58;
  unsigned int v59;
  int v60;
  int v61;
  unsigned int v62;
  char v63;
  unsigned int v64;
  int v65;
  unsigned int v66;
  char v67;
  unsigned int v68;
  uint64_t v69;
  unsigned int v70;
  char v71;
  int v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  uint64_t v77;
  int v78;
  int v79;
  int v80;
  unsigned int v81;
  char v82;
  unsigned int v83;
  int v84;
  unsigned int v85;
  char v86;
  unsigned int v87;
  uint64_t v88;
  unsigned int v89;
  char v90;
  int v91;
  unsigned int v92;
  int v93;
  unsigned int v94;
  unsigned int v95;
  char v96;
  int v97;
  unsigned int v98;
  unsigned int v99;
  int v100;
  unsigned int v101;
  unsigned int v102;
  unsigned int v103;
  uint64_t v104;
  int v105;
  unsigned int v106;
  unsigned int v107;
  unsigned int v108;
  uint64_t v109;
  int v110;
  unsigned int v111;
  uint64_t v112;
  size_t v113;
  unsigned int v114;
  unsigned int v115;
  int v116;
  int v117;
  unsigned int v118;
  unsigned int v119;
  char v120;
  int v121;
  unsigned int v122;
  int v123;
  int v124;
  char v125;
  unsigned int v126;
  unsigned int v127;
  uint64_t v128;
  int v129;
  unsigned int v130;
  BOOL v131;
  uint64_t v132;
  unsigned int v133;
  BOOL v134;
  BOOL v135;
  int v136;
  unsigned int v137;
  unsigned int v138;
  unsigned int v139;
  unsigned int v140;
  uint64_t v141;
  int v142;
  unsigned int v143;
  uint64_t v144;
  int v145;
  char v146;
  unsigned int v147;
  unsigned int v148;
  unsigned int v149;
  unsigned int v150;
  uint64_t v151;
  uint64_t v152;
  unsigned int v153;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(void *)(AssociatedTypeWitness - 8);
  v6 = *(void *)(v5 + 64);
  if (v6 > 3)
  {
    v7 = 3;
LABEL_3:
    v8 = 8;
    goto LABEL_4;
  }
  v10 = ((1 << (8 * v6)) + 1) >> (8 * v6);
  if (v10 > 0xFFFD) {
    goto LABEL_10;
  }
  v7 = v10 + 2;
  if (v10 <= 0xFD) {
    goto LABEL_3;
  }
  v8 = 16;
LABEL_4:
  v9 = (1 << v8) - v7;
  if ((v9 & 0x80000000) == 0)
  {
    if (v6 > 3) {
      goto LABEL_14;
    }
LABEL_11:
    v11 = ((1 << (8 * v6)) + 1) >> (8 * v6);
    v12 = 2;
    if (v11 > 0xFFFD) {
      v12 = 4;
    }
    if (v11 > 0xFD) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_10:
  v9 = 0x7FFFFFFF;
  if (v6 <= 3) {
    goto LABEL_11;
  }
LABEL_14:
  v12 = 1;
LABEL_15:
  if (v9 > 1) {
    goto LABEL_32;
  }
  v13 = v12 + v6;
  v14 = 8 * v13;
  if (v13 > 3) {
    goto LABEL_17;
  }
  v16 = (~(-1 << v14) - v9 + 2) >> v14;
  if (v16 > 0xFFFE)
  {
    v15 = *(_DWORD *)&a1[v13];
    if (!v15) {
      goto LABEL_31;
    }
    goto LABEL_24;
  }
  if (v16 > 0xFE)
  {
    v15 = *(unsigned __int16 *)&a1[v13];
    if (!*(_WORD *)&a1[v13]) {
      goto LABEL_31;
    }
    goto LABEL_24;
  }
  if (v16)
  {
LABEL_17:
    v15 = a1[v13];
    if (!a1[v13]) {
      goto LABEL_31;
    }
LABEL_24:
    v17 = (v15 - 1) << v14;
    if (v13 > 3) {
      v17 = 0;
    }
    if (v13)
    {
      if (v13 > 3) {
        LODWORD(v13) = 4;
      }
      switch((int)v13)
      {
        case 2:
LABEL_73:
          LODWORD(v13) = *(unsigned __int16 *)a1;
          break;
        case 3:
LABEL_71:
          LODWORD(v13) = *(unsigned __int16 *)a1 | (a1[2] << 16);
          break;
        case 4:
LABEL_72:
          LODWORD(v13) = *(_DWORD *)a1;
          break;
        default:
LABEL_70:
          LODWORD(v13) = *a1;
          break;
      }
    }
LABEL_74:
    if (v9 + (v13 | v17) == -1) {
      goto LABEL_117;
    }
    goto LABEL_75;
  }
LABEL_31:
  if (!v9) {
    goto LABEL_117;
  }
LABEL_32:
  if (v6 > 3)
  {
    v18 = 3;
    goto LABEL_36;
  }
  v19 = ((1 << (8 * v6)) + 1) >> (8 * v6);
  if (v19 <= 0xFFFD)
  {
    v18 = v19 + 2;
    if (v19 > 0xFD)
    {
      v20 = 16;
LABEL_37:
      v21 = (1 << v20) - v18;
      if ((v21 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
LABEL_36:
    v20 = 8;
    goto LABEL_37;
  }
LABEL_38:
  v21 = 0x7FFFFFFF;
LABEL_39:
  if (v6 > 3)
  {
    v22 = 3;
LABEL_43:
    v24 = 8;
    goto LABEL_44;
  }
  v23 = ((1 << (8 * v6)) + 1) >> (8 * v6);
  if (v23 > 0xFFFD) {
    goto LABEL_47;
  }
  v22 = v23 + 2;
  if (v23 <= 0xFD) {
    goto LABEL_43;
  }
  v24 = 16;
LABEL_44:
  v9 = (1 << v24) - v22;
  if ((v9 & 0x80000000) == 0)
  {
    if (v6 > 3) {
      goto LABEL_51;
    }
    goto LABEL_48;
  }
LABEL_47:
  v9 = 0x7FFFFFFF;
  if (v6 > 3)
  {
LABEL_51:
    v26 = 1;
    goto LABEL_52;
  }
LABEL_48:
  v25 = ((1 << (8 * v6)) + 1) >> (8 * v6);
  v26 = 2;
  if (v25 > 0xFFFD) {
    v26 = 4;
  }
  if (v25 <= 0xFD) {
    goto LABEL_51;
  }
LABEL_52:
  if (!v21) {
    goto LABEL_117;
  }
  v27 = v21 - v9;
  if (v21 <= v9) {
    goto LABEL_105;
  }
  v13 = v26 + v6;
  v28 = 8 * (v26 + v6);
  if (v13 > 3) {
    goto LABEL_55;
  }
  v30 = ((v27 + ~(-1 << v28)) >> v28) + 1;
  if (HIWORD(v30))
  {
    v29 = *(_DWORD *)&a1[v13];
    if (!v29) {
      goto LABEL_105;
    }
LABEL_64:
    v17 = (v29 - 1) << v28;
    if (v13 > 3) {
      v17 = 0;
    }
    if (v13)
    {
      if (v13 > 3) {
        LODWORD(v13) = 4;
      }
      switch((int)v13)
      {
        case 2:
          goto LABEL_73;
        case 3:
          goto LABEL_71;
        case 4:
          goto LABEL_72;
        default:
          goto LABEL_70;
      }
    }
    goto LABEL_74;
  }
  if (v30 > 0xFF)
  {
    v29 = *(unsigned __int16 *)&a1[v13];
    if (!*(_WORD *)&a1[v13]) {
      goto LABEL_105;
    }
    goto LABEL_64;
  }
  if (v30 >= 2)
  {
LABEL_55:
    v29 = a1[v13];
    if (!a1[v13]) {
      goto LABEL_105;
    }
    goto LABEL_64;
  }
LABEL_105:
  if (!v9) {
    goto LABEL_117;
  }
  if (v6 <= 3)
  {
    v48 = ((1 << (8 * v6)) + 1) >> (8 * v6);
    if (v48 > 0xFFFD)
    {
      v43 = *(_DWORD *)&a1[v6];
      v44 = ~v43;
LABEL_115:
      if (v44 >= 0x7FFFFFFF) {
        goto LABEL_117;
      }
LABEL_116:
      if (!v43) {
        goto LABEL_117;
      }
LABEL_75:
      if (v6 <= 3)
      {
        v34 = ((1 << (8 * v6)) + 1) >> (8 * v6);
        if (v34 > 0xFFFD) {
          goto LABEL_84;
        }
        v31 = v34 + 2;
        if (v34 > 0xFD)
        {
          v32 = 16;
LABEL_78:
          v33 = (1 << v32) - v31;
          if ((v33 & 0x80000000) == 0)
          {
            if (v6 > 3) {
              goto LABEL_88;
            }
LABEL_85:
            v35 = ((1 << (8 * v6)) + 1) >> (8 * v6);
            v36 = 2;
            if (v35 > 0xFFFD) {
              v36 = 4;
            }
            if (v35 > 0xFD)
            {
LABEL_89:
              if (v33 > 1) {
                goto LABEL_217;
              }
              v37 = v36 + v6;
              v38 = 8 * v37;
              if (v37 <= 3)
              {
                v40 = (~(-1 << v38) - v33 + 2) >> v38;
                if (v40 > 0xFFFE)
                {
                  v39 = *(_DWORD *)&a2[v37];
                  if (!v39) {
                    goto LABEL_216;
                  }
                  goto LABEL_98;
                }
                if (v40 > 0xFE)
                {
                  v39 = *(unsigned __int16 *)&a2[v37];
                  if (!*(_WORD *)&a2[v37]) {
                    goto LABEL_216;
                  }
                  goto LABEL_98;
                }
                if (!v40)
                {
LABEL_216:
                  if (!v33) {
                    goto LABEL_379;
                  }
LABEL_217:
                  if (v6 <= 3)
                  {
                    v81 = ((1 << (8 * v6)) + 1) >> (8 * v6);
                    if (v81 > 0xFFFD)
                    {
LABEL_223:
                      v83 = 0x7FFFFFFF;
LABEL_224:
                      if (v6 <= 3)
                      {
                        v85 = ((1 << (8 * v6)) + 1) >> (8 * v6);
                        if (v85 > 0xFFFD) {
                          goto LABEL_232;
                        }
                        v84 = v85 + 2;
                        if (v85 > 0xFD)
                        {
                          v86 = 16;
LABEL_229:
                          v33 = (1 << v86) - v84;
                          if ((v33 & 0x80000000) == 0)
                          {
                            if (v6 > 3) {
                              goto LABEL_236;
                            }
LABEL_233:
                            v87 = ((1 << (8 * v6)) + 1) >> (8 * v6);
                            v88 = 2;
                            if (v87 > 0xFFFD) {
                              v88 = 4;
                            }
                            if (v87 > 0xFD)
                            {
LABEL_237:
                              if (!v83) {
                                goto LABEL_379;
                              }
                              v89 = v83 - v33;
                              if (v83 <= v33) {
                                goto LABEL_335;
                              }
                              v37 = v88 + v6;
                              v90 = 8 * (v88 + v6);
                              if (v37 > 3) {
                                goto LABEL_240;
                              }
                              v92 = ((v89 + ~(-1 << v90)) >> v90) + 1;
                              if (HIWORD(v92))
                              {
                                v91 = *(_DWORD *)&a2[v37];
                              }
                              else
                              {
                                if (v92 <= 0xFF)
                                {
                                  if (v92 < 2) {
                                    goto LABEL_335;
                                  }
LABEL_240:
                                  v91 = a2[v37];
                                  goto LABEL_327;
                                }
                                v91 = *(unsigned __int16 *)&a2[v37];
                              }
LABEL_327:
                              if (v91)
                              {
                                v41 = (v91 - 1) << v90;
                                if (v37 > 3) {
                                  v41 = 0;
                                }
                                if (v37)
                                {
                                  if (v37 > 3) {
                                    LODWORD(v37) = 4;
                                  }
                                  switch((int)v37)
                                  {
                                    case 2:
                                      goto LABEL_341;
                                    case 3:
                                      goto LABEL_342;
                                    case 4:
                                      goto LABEL_343;
                                    default:
                                      goto LABEL_334;
                                  }
                                }
                                goto LABEL_344;
                              }
LABEL_335:
                              if (!v33) {
                                goto LABEL_379;
                              }
                              if (v6 <= 3)
                              {
                                v122 = ((1 << (8 * v6)) + 1) >> (8 * v6);
                                if (v122 > 0xFFFD)
                                {
                                  v118 = *(_DWORD *)&a2[v6];
                                  v119 = ~v118;
                                  goto LABEL_376;
                                }
                                v121 = v122 + 2;
                                if (v122 > 0xFD)
                                {
                                  v136 = *(unsigned __int16 *)&a2[v6];
                                  v118 = v136 | 0xFFFF0000;
                                  v119 = v136 ^ 0xFFFF;
                                  v120 = 16;
                                }
                                else
                                {
                                  v123 = a2[v6];
                                  v118 = v123 | 0xFFFFFF00;
                                  v119 = v123 ^ 0xFF;
                                  v120 = 8;
                                }
                              }
                              else
                              {
                                v117 = a2[v6];
                                v118 = v117 | 0xFFFFFF00;
                                v119 = v117 ^ 0xFF;
                                v120 = 8;
                                v121 = 3;
                              }
                              v137 = (1 << v120) - v121;
                              if ((v137 & 0x80000000) == 0)
                              {
LABEL_377:
                                if (v137 > v119 && v118) {
                                  goto LABEL_345;
                                }
LABEL_379:
                                if (v6 <= 3)
                                {
                                  v138 = ((1 << (8 * v6)) + 1) >> (8 * v6);
                                  if (v138 > 0xFFFD)
                                  {
                                    v139 = *(_DWORD *)&a2[v6];
                                    v140 = v139 - 2;
                                    if (v139 < 2)
                                    {
LABEL_395:
                                      if (v139 == 1)
                                      {
LABEL_415:
                                        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
                                        if (v6 <= 3)
                                        {
                                          v147 = ((1 << (8 * v6)) + 1) >> (8 * v6);
                                          if (v147 > 0xFFFD)
                                          {
                                            *(_DWORD *)&a1[v6] = 1;
                                            goto LABEL_430;
                                          }
                                          if (v147 > 0xFD)
                                          {
                                            *(_WORD *)&a1[v6] = 1;
                                            goto LABEL_423;
                                          }
                                        }
                                        a1[v6] = 1;
                                        if (v6 <= 3) {
                                          goto LABEL_417;
                                        }
                                      }
                                      else
                                      {
LABEL_396:
                                        if (v139)
                                        {
                                          if (v6 > 3) {
                                            goto LABEL_404;
                                          }
                                          v143 = ((1 << (8 * v6)) + 1) >> (8 * v6);
                                          v144 = 2;
                                          if (v143 > 0xFFFD) {
                                            v144 = 4;
                                          }
                                          if (v143 <= 0xFD) {
LABEL_404:
                                          }
                                            v144 = 1;
                                          memcpy(a1, a2, v144 + v6);
                                          if (v6 <= 3)
                                          {
LABEL_417:
                                            v148 = ((1 << (8 * v6)) + 1) >> (8 * v6);
                                            if (v148 > 0xFFFD) {
                                              goto LABEL_430;
                                            }
                                            v145 = v148 + 2;
                                            if (v148 > 0xFD) {
                                              goto LABEL_424;
                                            }
LABEL_407:
                                            v146 = 8;
                                            goto LABEL_425;
                                          }
                                        }
                                        else
                                        {
                                          (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
                                          if (v6 <= 3)
                                          {
                                            v147 = ((1 << (8 * v6)) + 1) >> (8 * v6);
                                            if (v147 > 0xFFFD)
                                            {
                                              *(_DWORD *)&a1[v6] = 0;
                                              goto LABEL_430;
                                            }
                                            if (v147 > 0xFD)
                                            {
                                              *(_WORD *)&a1[v6] = 0;
LABEL_423:
                                              v145 = v147 + 2;
LABEL_424:
                                              v146 = 16;
LABEL_425:
                                              v149 = (1 << v146) - v145;
                                              if ((v149 & 0x80000000) == 0)
                                              {
                                                if (v6 > 3) {
                                                  goto LABEL_434;
                                                }
LABEL_431:
                                                v150 = ((1 << (8 * v6)) + 1) >> (8 * v6);
                                                v151 = 2;
                                                if (v150 > 0xFFFD) {
                                                  v151 = 4;
                                                }
                                                if (v150 > 0xFD)
                                                {
LABEL_435:
                                                  if (v149 <= 1)
                                                  {
                                                    v152 = v151 + v6;
                                                    if (v152 <= 3)
                                                    {
                                                      v153 = (~(-1 << (8 * v152)) - v149 + 2) >> (8 * v152);
                                                      if (v153 > 0xFFFE)
                                                      {
                                                        *(_DWORD *)&a1[v152] = 0;
                                                        return a1;
                                                      }
                                                      if (v153 > 0xFE)
                                                      {
                                                        *(_WORD *)&a1[v152] = 0;
                                                        return a1;
                                                      }
                                                      if (!v153) {
                                                        return a1;
                                                      }
                                                    }
                                                    a1[v152] = 0;
                                                  }
                                                  return a1;
                                                }
LABEL_434:
                                                v151 = 1;
                                                goto LABEL_435;
                                              }
LABEL_430:
                                              v149 = 0x7FFFFFFF;
                                              if (v6 > 3) {
                                                goto LABEL_434;
                                              }
                                              goto LABEL_431;
                                            }
                                          }
                                          a1[v6] = 0;
                                          if (v6 <= 3) {
                                            goto LABEL_417;
                                          }
                                        }
                                      }
                                      v145 = 3;
                                      goto LABEL_407;
                                    }
LABEL_387:
                                    if (v6 <= 3) {
                                      v141 = v6;
                                    }
                                    else {
                                      v141 = 4;
                                    }
                                    switch(v141)
                                    {
                                      case 1:
                                        v142 = *a2;
                                        if (v6 >= 4) {
                                          goto LABEL_414;
                                        }
                                        goto LABEL_394;
                                      case 2:
                                        v142 = *(unsigned __int16 *)a2;
                                        if (v6 < 4) {
                                          goto LABEL_394;
                                        }
                                        goto LABEL_414;
                                      case 3:
                                        v142 = *(unsigned __int16 *)a2 | (a2[2] << 16);
                                        if (v6 < 4) {
                                          goto LABEL_394;
                                        }
                                        goto LABEL_414;
                                      case 4:
                                        v142 = *(_DWORD *)a2;
                                        if (v6 < 4)
                                        {
LABEL_394:
                                          v139 = (v142 | (v140 << (8 * v6))) + 2;
                                          goto LABEL_395;
                                        }
LABEL_414:
                                        v139 = v142 + 2;
                                        if (v139 == 1) {
                                          goto LABEL_415;
                                        }
                                        goto LABEL_396;
                                      default:
                                        goto LABEL_395;
                                    }
                                  }
                                  if (v138 > 0xFD)
                                  {
                                    v139 = *(unsigned __int16 *)&a2[v6];
                                    v140 = v139 - 2;
                                    if (v139 < 2) {
                                      goto LABEL_395;
                                    }
                                    goto LABEL_387;
                                  }
                                }
                                v139 = a2[v6];
                                v140 = v139 - 2;
                                if (v139 < 2) {
                                  goto LABEL_395;
                                }
                                goto LABEL_387;
                              }
LABEL_376:
                              v137 = 0x7FFFFFFF;
                              goto LABEL_377;
                            }
LABEL_236:
                            v88 = 1;
                            goto LABEL_237;
                          }
LABEL_232:
                          v33 = 0x7FFFFFFF;
                          if (v6 > 3) {
                            goto LABEL_236;
                          }
                          goto LABEL_233;
                        }
                      }
                      else
                      {
                        v84 = 3;
                      }
                      v86 = 8;
                      goto LABEL_229;
                    }
                    v80 = v81 + 2;
                    if (v81 > 0xFD)
                    {
                      v82 = 16;
LABEL_222:
                      v83 = (1 << v82) - v80;
                      if ((v83 & 0x80000000) == 0) {
                        goto LABEL_224;
                      }
                      goto LABEL_223;
                    }
                  }
                  else
                  {
                    v80 = 3;
                  }
                  v82 = 8;
                  goto LABEL_222;
                }
              }
              v39 = a2[v37];
              if (!a2[v37]) {
                goto LABEL_216;
              }
LABEL_98:
              v41 = (v39 - 1) << v38;
              if (v37 > 3) {
                v41 = 0;
              }
              if (v37)
              {
                if (v37 > 3) {
                  LODWORD(v37) = 4;
                }
                switch((int)v37)
                {
                  case 2:
LABEL_341:
                    LODWORD(v37) = *(unsigned __int16 *)a2;
                    break;
                  case 3:
LABEL_342:
                    LODWORD(v37) = *(unsigned __int16 *)a2 | (a2[2] << 16);
                    break;
                  case 4:
LABEL_343:
                    LODWORD(v37) = *(_DWORD *)a2;
                    break;
                  default:
LABEL_334:
                    LODWORD(v37) = *a2;
                    break;
                }
              }
LABEL_344:
              if (v33 + (v37 | v41) != -1) {
                goto LABEL_345;
              }
              goto LABEL_379;
            }
LABEL_88:
            v36 = 1;
            goto LABEL_89;
          }
LABEL_84:
          v33 = 0x7FFFFFFF;
          if (v6 > 3) {
            goto LABEL_88;
          }
          goto LABEL_85;
        }
      }
      else
      {
        v31 = 3;
      }
      v32 = 8;
      goto LABEL_78;
    }
    v46 = v48 + 2;
    if (v48 > 0xFD)
    {
      v79 = *(unsigned __int16 *)&a1[v6];
      v43 = v79 | 0xFFFF0000;
      v44 = v79 ^ 0xFFFF;
      v45 = 16;
    }
    else
    {
      v49 = a1[v6];
      v43 = v49 | 0xFFFFFF00;
      v44 = v49 ^ 0xFF;
      v45 = 8;
    }
  }
  else
  {
    v42 = a1[v6];
    v43 = v42 | 0xFFFFFF00;
    v44 = v42 ^ 0xFF;
    v45 = 8;
    v46 = 3;
  }
  v47 = (1 << v45) - v46;
  if ((v47 & 0x80000000) != 0) {
    goto LABEL_115;
  }
  if (v47 > v44) {
    goto LABEL_116;
  }
LABEL_117:
  if (v6 > 3)
  {
    v50 = 3;
LABEL_121:
    v52 = 8;
    goto LABEL_122;
  }
  v51 = ((1 << (8 * v6)) + 1) >> (8 * v6);
  if (v51 > 0xFFFD) {
    goto LABEL_125;
  }
  v50 = v51 + 2;
  if (v51 <= 0xFD) {
    goto LABEL_121;
  }
  v52 = 16;
LABEL_122:
  v53 = (1 << v52) - v50;
  if ((v53 & 0x80000000) == 0)
  {
    if (v6 > 3) {
      goto LABEL_129;
    }
LABEL_126:
    v54 = ((1 << (8 * v6)) + 1) >> (8 * v6);
    v55 = 2;
    if (v54 > 0xFFFD) {
      v55 = 4;
    }
    if (v54 > 0xFD) {
      goto LABEL_130;
    }
    goto LABEL_129;
  }
LABEL_125:
  v53 = 0x7FFFFFFF;
  if (v6 <= 3) {
    goto LABEL_126;
  }
LABEL_129:
  v55 = 1;
LABEL_130:
  if (v53 > 1) {
    goto LABEL_148;
  }
  v56 = v55 + v6;
  v57 = 8 * v56;
  if (v56 > 3) {
    goto LABEL_132;
  }
  v59 = (~(-1 << v57) - v53 + 2) >> v57;
  if (v59 > 0xFFFE)
  {
    v58 = *(_DWORD *)&a2[v56];
    if (!v58) {
      goto LABEL_147;
    }
    goto LABEL_140;
  }
  if (v59 > 0xFE)
  {
    v58 = *(unsigned __int16 *)&a2[v56];
    if (!*(_WORD *)&a2[v56]) {
      goto LABEL_147;
    }
    goto LABEL_140;
  }
  if (v59)
  {
LABEL_132:
    v58 = a2[v56];
    if (!a2[v56]) {
      goto LABEL_147;
    }
LABEL_140:
    v60 = (v58 - 1) << v57;
    if (v56 > 3) {
      v60 = 0;
    }
    if (v56)
    {
      if (v56 > 3) {
        LODWORD(v56) = 4;
      }
      switch((int)v56)
      {
        case 2:
LABEL_189:
          LODWORD(v56) = *(unsigned __int16 *)a2;
          break;
        case 3:
LABEL_187:
          LODWORD(v56) = *(unsigned __int16 *)a2 | (a2[2] << 16);
          break;
        case 4:
LABEL_188:
          LODWORD(v56) = *(_DWORD *)a2;
          break;
        default:
LABEL_186:
          LODWORD(v56) = *a2;
          break;
      }
    }
LABEL_190:
    if (v53 + (v56 | v60) == -1) {
      goto LABEL_260;
    }
    goto LABEL_191;
  }
LABEL_147:
  if (!v53) {
    goto LABEL_260;
  }
LABEL_148:
  if (v6 > 3)
  {
    v61 = 3;
    goto LABEL_152;
  }
  v62 = ((1 << (8 * v6)) + 1) >> (8 * v6);
  if (v62 <= 0xFFFD)
  {
    v61 = v62 + 2;
    if (v62 > 0xFD)
    {
      v63 = 16;
LABEL_153:
      v64 = (1 << v63) - v61;
      if ((v64 & 0x80000000) == 0) {
        goto LABEL_155;
      }
      goto LABEL_154;
    }
LABEL_152:
    v63 = 8;
    goto LABEL_153;
  }
LABEL_154:
  v64 = 0x7FFFFFFF;
LABEL_155:
  if (v6 > 3)
  {
    v65 = 3;
LABEL_159:
    v67 = 8;
    goto LABEL_160;
  }
  v66 = ((1 << (8 * v6)) + 1) >> (8 * v6);
  if (v66 > 0xFFFD) {
    goto LABEL_163;
  }
  v65 = v66 + 2;
  if (v66 <= 0xFD) {
    goto LABEL_159;
  }
  v67 = 16;
LABEL_160:
  v53 = (1 << v67) - v65;
  if ((v53 & 0x80000000) == 0)
  {
    if (v6 > 3) {
      goto LABEL_167;
    }
    goto LABEL_164;
  }
LABEL_163:
  v53 = 0x7FFFFFFF;
  if (v6 > 3)
  {
LABEL_167:
    v69 = 1;
    goto LABEL_168;
  }
LABEL_164:
  v68 = ((1 << (8 * v6)) + 1) >> (8 * v6);
  v69 = 2;
  if (v68 > 0xFFFD) {
    v69 = 4;
  }
  if (v68 <= 0xFD) {
    goto LABEL_167;
  }
LABEL_168:
  if (!v64) {
    goto LABEL_260;
  }
  v70 = v64 - v53;
  if (v64 <= v53) {
    goto LABEL_248;
  }
  v56 = v69 + v6;
  v71 = 8 * (v69 + v6);
  if (v56 > 3) {
    goto LABEL_171;
  }
  v73 = ((v70 + ~(-1 << v71)) >> v71) + 1;
  if (HIWORD(v73))
  {
    v72 = *(_DWORD *)&a2[v56];
    if (!v72) {
      goto LABEL_248;
    }
LABEL_180:
    v60 = (v72 - 1) << v71;
    if (v56 > 3) {
      v60 = 0;
    }
    if (v56)
    {
      if (v56 > 3) {
        LODWORD(v56) = 4;
      }
      switch((int)v56)
      {
        case 2:
          goto LABEL_189;
        case 3:
          goto LABEL_187;
        case 4:
          goto LABEL_188;
        default:
          goto LABEL_186;
      }
    }
    goto LABEL_190;
  }
  if (v73 > 0xFF)
  {
    v72 = *(unsigned __int16 *)&a2[v56];
    if (!*(_WORD *)&a2[v56]) {
      goto LABEL_248;
    }
    goto LABEL_180;
  }
  if (v73 >= 2)
  {
LABEL_171:
    v72 = a2[v56];
    if (!a2[v56]) {
      goto LABEL_248;
    }
    goto LABEL_180;
  }
LABEL_248:
  if (!v53) {
    goto LABEL_260;
  }
  if (v6 <= 3)
  {
    v99 = ((1 << (8 * v6)) + 1) >> (8 * v6);
    if (v99 > 0xFFFD)
    {
      v94 = *(_DWORD *)&a2[v6];
      v95 = ~v94;
LABEL_258:
      if (v95 >= 0x7FFFFFFF) {
        goto LABEL_260;
      }
LABEL_259:
      if (!v94) {
        goto LABEL_260;
      }
LABEL_191:
      if (v6 <= 3)
      {
        v74 = ((1 << (8 * v6)) + 1) >> (8 * v6);
        if (v74 > 0xFFFD)
        {
          v75 = *(_DWORD *)&a1[v6];
          v76 = v75 - 2;
          if (v75 < 2)
          {
LABEL_208:
            if (v75 <= 1) {
LABEL_209:
            }
              (*(void (**)(unsigned __int8 *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
LABEL_345:
            if (v6 <= 3)
            {
              v127 = ((1 << (8 * v6)) + 1) >> (8 * v6);
              if (v127 > 0xFFFD)
              {
LABEL_353:
                v126 = 0x7FFFFFFF;
LABEL_354:
                v128 = 1;
                if (v6 > 3)
                {
                  v129 = 1;
                  goto LABEL_363;
                }
                v130 = ((1 << (8 * v6)) + 1) >> (8 * v6);
                if (v130 > 0xFFFD)
                {
                  v128 = 4;
                }
                else
                {
                  if (v130 < 0xFE)
                  {
                    v128 = 1;
                    v129 = 1;
LABEL_363:
                    v113 = v6 + v128;
                    if (v126 <= 1)
                    {
                      if ((v129 + v6) <= 3)
                      {
                        v133 = (~(-1 << (8 * (v129 + v6))) - v126 + 2) >> (8 * (v129 + v6));
                        if (v133 > 0xFFFE)
                        {
                          v132 = 4;
                        }
                        else
                        {
                          v134 = v133 != 0;
                          v135 = v133 >= 0xFF;
                          v132 = 2;
                          if (!v135) {
                            v132 = v134;
                          }
                        }
                      }
                      else
                      {
                        v132 = 1;
                      }
                      v113 += v132;
                    }
                    goto LABEL_372;
                  }
                  v128 = 2;
                }
                v131 = v130 > 0xFFFD;
                v129 = 2;
                if (v131) {
                  v129 = 4;
                }
                goto LABEL_363;
              }
              v124 = v127 + 2;
              if (v127 > 0xFD)
              {
                v125 = 16;
LABEL_348:
                v126 = (1 << v125) - v124;
                if ((v126 & 0x80000000) == 0) {
                  goto LABEL_354;
                }
                goto LABEL_353;
              }
            }
            else
            {
              v124 = 3;
            }
            v125 = 8;
            goto LABEL_348;
          }
LABEL_199:
          if (v6 <= 3) {
            v77 = v6;
          }
          else {
            v77 = 4;
          }
          switch(v77)
          {
            case 1:
              v78 = *a1;
              if (v6 >= 4) {
                goto LABEL_213;
              }
              goto LABEL_207;
            case 2:
              v78 = *(unsigned __int16 *)a1;
              if (v6 < 4) {
                goto LABEL_207;
              }
              goto LABEL_213;
            case 3:
              v78 = *(unsigned __int16 *)a1 | (a1[2] << 16);
              if (v6 < 4) {
                goto LABEL_207;
              }
              goto LABEL_213;
            case 4:
              v78 = *(_DWORD *)a1;
              if (v6 < 4)
              {
LABEL_207:
                v75 = (v78 | (v76 << (8 * v6))) + 2;
                goto LABEL_208;
              }
LABEL_213:
              if ((v78 + 2) > 1) {
                goto LABEL_345;
              }
              goto LABEL_209;
            default:
              goto LABEL_208;
          }
        }
        if (v74 > 0xFD)
        {
          v75 = *(unsigned __int16 *)&a1[v6];
          v76 = v75 - 2;
          if (v75 < 2) {
            goto LABEL_208;
          }
          goto LABEL_199;
        }
      }
      v75 = a1[v6];
      v76 = v75 - 2;
      if (v75 < 2) {
        goto LABEL_208;
      }
      goto LABEL_199;
    }
    v97 = v99 + 2;
    if (v99 > 0xFD)
    {
      v116 = *(unsigned __int16 *)&a2[v6];
      v94 = v116 | 0xFFFF0000;
      v95 = v116 ^ 0xFFFF;
      v96 = 16;
    }
    else
    {
      v100 = a2[v6];
      v94 = v100 | 0xFFFFFF00;
      v95 = v100 ^ 0xFF;
      v96 = 8;
    }
  }
  else
  {
    v93 = a2[v6];
    v94 = v93 | 0xFFFFFF00;
    v95 = v93 ^ 0xFF;
    v96 = 8;
    v97 = 3;
  }
  v98 = (1 << v96) - v97;
  if ((v98 & 0x80000000) != 0) {
    goto LABEL_258;
  }
  if (v98 > v95) {
    goto LABEL_259;
  }
LABEL_260:
  if (a1 == a2) {
    return a1;
  }
  if (v6 > 3)
  {
LABEL_262:
    v101 = a1[v6];
    v102 = v101 - 2;
    if (v101 >= 2) {
      goto LABEL_269;
    }
    goto LABEL_277;
  }
  v103 = ((1 << (8 * v6)) + 1) >> (8 * v6);
  if (v103 <= 0xFFFD)
  {
    if (v103 > 0xFD)
    {
      v101 = *(unsigned __int16 *)&a1[v6];
      v102 = v101 - 2;
      if (v101 >= 2)
      {
LABEL_269:
        if (v6 <= 3) {
          v104 = v6;
        }
        else {
          v104 = 4;
        }
        switch(v104)
        {
          case 1:
            v105 = *a1;
            if (v6 >= 4) {
              goto LABEL_296;
            }
            goto LABEL_276;
          case 2:
            v105 = *(unsigned __int16 *)a1;
            if (v6 < 4) {
              goto LABEL_276;
            }
            goto LABEL_296;
          case 3:
            v105 = *(unsigned __int16 *)a1 | (a1[2] << 16);
            if (v6 < 4) {
              goto LABEL_276;
            }
            goto LABEL_296;
          case 4:
            v105 = *(_DWORD *)a1;
            if (v6 < 4)
            {
LABEL_276:
              v101 = (v105 | (v102 << (8 * v6))) + 2;
              goto LABEL_277;
            }
LABEL_296:
            if ((v105 + 2) > 1) {
              goto LABEL_279;
            }
            goto LABEL_278;
          default:
            goto LABEL_277;
        }
      }
      goto LABEL_277;
    }
    goto LABEL_262;
  }
  v101 = *(_DWORD *)&a1[v6];
  v102 = v101 - 2;
  if (v101 >= 2) {
    goto LABEL_269;
  }
LABEL_277:
  if (v101 <= 1) {
LABEL_278:
  }
    (*(void (**)(unsigned __int8 *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
LABEL_279:
  if (v6 > 3) {
    goto LABEL_280;
  }
  v108 = ((1 << (8 * v6)) + 1) >> (8 * v6);
  if (v108 > 0xFFFD)
  {
    v106 = *(_DWORD *)&a2[v6];
    v107 = v106 - 2;
    if (v106 >= 2) {
      goto LABEL_287;
    }
    goto LABEL_300;
  }
  if (v108 <= 0xFD)
  {
LABEL_280:
    v106 = a2[v6];
    v107 = v106 - 2;
    if (v106 >= 2) {
      goto LABEL_287;
    }
  }
  else
  {
    v106 = *(unsigned __int16 *)&a2[v6];
    v107 = v106 - 2;
    if (v106 >= 2)
    {
LABEL_287:
      if (v6 <= 3) {
        v109 = v6;
      }
      else {
        v109 = 4;
      }
      switch(v109)
      {
        case 1:
          v110 = *a2;
          if (v6 >= 4) {
            goto LABEL_316;
          }
          goto LABEL_299;
        case 2:
          v110 = *(unsigned __int16 *)a2;
          if (v6 < 4) {
            goto LABEL_299;
          }
          goto LABEL_316;
        case 3:
          v110 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          if (v6 < 4) {
            goto LABEL_299;
          }
          goto LABEL_316;
        case 4:
          v110 = *(_DWORD *)a2;
          if (v6 < 4)
          {
LABEL_299:
            v106 = (v110 | (v107 << (8 * v6))) + 2;
            break;
          }
LABEL_316:
          v106 = v110 + 2;
          if (v106 == 1) {
            goto LABEL_317;
          }
          goto LABEL_301;
        default:
          break;
      }
    }
  }
LABEL_300:
  if (v106 == 1)
  {
LABEL_317:
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
    if (v6 > 3) {
      goto LABEL_318;
    }
    v115 = ((1 << (8 * v6)) + 1) >> (8 * v6);
    if (v115 > 0xFFFD)
    {
      *(_DWORD *)&a1[v6] = 1;
      return a1;
    }
    if (v115 <= 0xFD) {
LABEL_318:
    }
      a1[v6] = 1;
    else {
      *(_WORD *)&a1[v6] = 1;
    }
    return a1;
  }
LABEL_301:
  if (v106)
  {
    if (v6 > 3) {
      goto LABEL_308;
    }
    v111 = ((1 << (8 * v6)) + 1) >> (8 * v6);
    v112 = 2;
    if (v111 > 0xFFFD) {
      v112 = 4;
    }
    if (v111 <= 0xFD) {
LABEL_308:
    }
      v112 = 1;
    v113 = v112 + v6;
LABEL_372:
    memcpy(a1, a2, v113);
    return a1;
  }
  (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
  if (v6 > 3) {
    goto LABEL_303;
  }
  v114 = ((1 << (8 * v6)) + 1) >> (8 * v6);
  if (v114 > 0xFFFD)
  {
    *(_DWORD *)&a1[v6] = 0;
    return a1;
  }
  if (v114 <= 0xFD) {
LABEL_303:
  }
    a1[v6] = 0;
  else {
    *(_WORD *)&a1[v6] = 0;
  }
  return a1;
}

uint64_t sub_1B083657C(unsigned __int16 *a1, unsigned int a2)
{
  unsigned int v4 = 2147483645;
  uint64_t v5 = *(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64);
  if (v5 <= 3)
  {
    unsigned int v7 = ((1 << (8 * v5)) + 1) >> (8 * v5);
    if (v7 > 0xFFFD) {
      goto LABEL_9;
    }
    int v6 = v7 + 2;
    if (v7 > 0xFD)
    {
      char v8 = 16;
      goto LABEL_6;
    }
  }
  else
  {
    int v6 = 3;
  }
  char v8 = 8;
LABEL_6:
  unsigned int v9 = (1 << v8) - v6;
  if ((v9 & 0x80000000) == 0)
  {
    unsigned int v4 = v9 - 2;
    if (v9 < 2) {
      unsigned int v4 = 0;
    }
  }
LABEL_9:
  if (v5 > 3)
  {
    int v10 = 3;
    goto LABEL_13;
  }
  unsigned int v11 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  if (v11 <= 0xFFFD)
  {
    int v10 = v11 + 2;
    if (v11 > 0xFD)
    {
      char v12 = 16;
LABEL_14:
      unsigned int v13 = (1 << v12) - v10;
      if ((v13 & 0x80000000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
LABEL_13:
    char v12 = 8;
    goto LABEL_14;
  }
LABEL_15:
  unsigned int v13 = 0x7FFFFFFF;
LABEL_16:
  uint64_t v14 = 1;
  if (v5 <= 3)
  {
    unsigned int v16 = ((1 << (8 * v5)) + 1) >> (8 * v5);
    if (v16 > 0xFFFD)
    {
      uint64_t v14 = 4;
    }
    else
    {
      if (v16 < 0xFE)
      {
        uint64_t v14 = 1;
        int v15 = 1;
        goto LABEL_27;
      }
      uint64_t v14 = 2;
    }
    BOOL v17 = v16 > 0xFFFD;
    int v15 = 2;
    if (v17) {
      int v15 = 4;
    }
    goto LABEL_27;
  }
  int v15 = 1;
LABEL_27:
  uint64_t v18 = v5 + v14;
  if (v13 <= 1)
  {
    unsigned int v19 = v15 + v5;
    if (v19 <= 3)
    {
      unsigned int v21 = (~(-1 << (8 * v19)) - v13 + 2) >> (8 * v19);
      if (v21 > 0xFFFE)
      {
        uint64_t v20 = 4;
      }
      else
      {
        BOOL v22 = v21 != 0;
        BOOL v23 = v21 >= 0xFF;
        uint64_t v20 = 2;
        if (!v23) {
          uint64_t v20 = v22;
        }
      }
    }
    else
    {
      uint64_t v20 = 1;
    }
    v18 += v20;
  }
  if (!a2) {
    return 0;
  }
  if (a2 > v4)
  {
    char v24 = 8 * v18;
    if (v18 > 3) {
      goto LABEL_39;
    }
    unsigned int v26 = ((a2 - v4 + ~(-1 << v24)) >> v24) + 1;
    if (HIWORD(v26))
    {
      int v25 = *(_DWORD *)((char *)a1 + v18);
      if (!v25) {
        goto LABEL_54;
      }
      goto LABEL_46;
    }
    if (v26 > 0xFF)
    {
      int v25 = *(unsigned __int16 *)((char *)a1 + v18);
      if (!*(unsigned __int16 *)((char *)a1 + v18)) {
        goto LABEL_54;
      }
      goto LABEL_46;
    }
    if (v26 >= 2)
    {
LABEL_39:
      int v25 = *((unsigned __int8 *)a1 + v18);
      if (!*((unsigned char *)a1 + v18)) {
        goto LABEL_54;
      }
LABEL_46:
      int v27 = (v25 - 1) << v24;
      if (v18 > 3) {
        int v27 = 0;
      }
      if (v18)
      {
        if (v18 > 3) {
          LODWORD(v18) = 4;
        }
        switch((int)v18)
        {
          case 2:
            LODWORD(v18) = *a1;
            break;
          case 3:
            LODWORD(v18) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
            break;
          case 4:
            LODWORD(v18) = *(_DWORD *)a1;
            break;
          default:
            LODWORD(v18) = *(unsigned __int8 *)a1;
            break;
        }
      }
      return v4 + (v18 | v27) + 1;
    }
  }
LABEL_54:
  if (!v4) {
    return 0;
  }
  if (v5 > 3)
  {
    int v28 = 3;
LABEL_57:
    char v29 = 8;
    goto LABEL_58;
  }
  unsigned int v34 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  if (v34 > 0xFFFD)
  {
LABEL_68:
    unsigned int v30 = 0x7FFFFFFF;
    if (v5 > 3) {
      goto LABEL_60;
    }
    goto LABEL_69;
  }
  int v28 = v34 + 2;
  if (v34 <= 0xFD) {
    goto LABEL_57;
  }
  char v29 = 16;
LABEL_58:
  unsigned int v30 = (1 << v29) - v28;
  if ((v30 & 0x80000000) != 0) {
    goto LABEL_68;
  }
  if (v5 > 3)
  {
LABEL_60:
    int v31 = 3;
LABEL_61:
    char v32 = 8;
    goto LABEL_62;
  }
LABEL_69:
  unsigned int v35 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  if (v35 > 0xFFFD) {
    goto LABEL_72;
  }
  int v31 = v35 + 2;
  if (v35 <= 0xFD) {
    goto LABEL_61;
  }
  char v32 = 16;
LABEL_62:
  unsigned int v33 = (1 << v32) - v31;
  if ((v33 & 0x80000000) == 0)
  {
    if (v5 > 3) {
      goto LABEL_76;
    }
    goto LABEL_73;
  }
LABEL_72:
  unsigned int v33 = 0x7FFFFFFF;
  if (v5 > 3)
  {
LABEL_76:
    uint64_t v37 = 1;
    goto LABEL_77;
  }
LABEL_73:
  unsigned int v36 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  uint64_t v37 = 2;
  if (v36 > 0xFFFD) {
    uint64_t v37 = 4;
  }
  if (v36 <= 0xFD) {
    goto LABEL_76;
  }
LABEL_77:
  if (!v30) {
    return 0;
  }
  unsigned int v38 = v30 - v33;
  if (v30 <= v33) {
    goto LABEL_98;
  }
  uint64_t v39 = v37 + v5;
  char v40 = 8 * (v37 + v5);
  if (v39 > 3) {
    goto LABEL_80;
  }
  unsigned int v42 = ((v38 + ~(-1 << v40)) >> v40) + 1;
  if (HIWORD(v42))
  {
    int v41 = *(_DWORD *)((char *)a1 + v39);
  }
  else
  {
    if (v42 <= 0xFF)
    {
      if (v42 < 2) {
        goto LABEL_98;
      }
LABEL_80:
      int v41 = *((unsigned __int8 *)a1 + v39);
      goto LABEL_91;
    }
    int v41 = *(unsigned __int16 *)((char *)a1 + v39);
  }
LABEL_91:
  if (v41)
  {
    int v44 = (v41 - 1) << v40;
    if (v39 > 3) {
      int v44 = 0;
    }
    if (v39)
    {
      if (v39 > 3) {
        LODWORD(v39) = 4;
      }
      switch((int)v39)
      {
        case 2:
          goto LABEL_144;
        case 3:
          goto LABEL_145;
        case 4:
          goto LABEL_146;
        default:
          goto LABEL_137;
      }
    }
    goto LABEL_147;
  }
LABEL_98:
  if (!v33) {
    return 0;
  }
  if (v5 > 3)
  {
    int v45 = 3;
    goto LABEL_103;
  }
  unsigned int v46 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  if (v46 <= 0xFFFD)
  {
    int v45 = v46 + 2;
    if (v46 > 0xFD)
    {
      char v47 = 16;
LABEL_104:
      unsigned int v48 = (1 << v47) - v45;
      if ((v48 & 0x80000000) == 0) {
        goto LABEL_106;
      }
      goto LABEL_105;
    }
LABEL_103:
    char v47 = 8;
    goto LABEL_104;
  }
LABEL_105:
  unsigned int v48 = 0x7FFFFFFF;
LABEL_106:
  if (v5 > 3)
  {
    int v49 = 3;
LABEL_110:
    char v51 = 8;
    goto LABEL_111;
  }
  unsigned int v50 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  if (v50 > 0xFFFD)
  {
LABEL_112:
    unsigned int v33 = 0x7FFFFFFF;
    goto LABEL_113;
  }
  int v49 = v50 + 2;
  if (v50 <= 0xFD) {
    goto LABEL_110;
  }
  char v51 = 16;
LABEL_111:
  unsigned int v33 = (1 << v51) - v49;
  if ((v33 & 0x80000000) != 0) {
    goto LABEL_112;
  }
LABEL_113:
  if (v5 > 3) {
    goto LABEL_117;
  }
  unsigned int v52 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  uint64_t v53 = 2;
  if (v52 > 0xFFFD) {
    uint64_t v53 = 4;
  }
  if (v52 <= 0xFD) {
LABEL_117:
  }
    uint64_t v53 = 1;
  if (!v48) {
    return 0;
  }
  unsigned int v54 = v48 - v33;
  if (v48 <= v33) {
    goto LABEL_138;
  }
  uint64_t v39 = v53 + v5;
  char v55 = 8 * (v53 + v5);
  if (v39 > 3) {
    goto LABEL_121;
  }
  unsigned int v57 = ((v54 + ~(-1 << v55)) >> v55) + 1;
  if (HIWORD(v57))
  {
    int v56 = *(_DWORD *)((char *)a1 + v39);
  }
  else
  {
    if (v57 <= 0xFF)
    {
      if (v57 < 2) {
        goto LABEL_138;
      }
LABEL_121:
      int v56 = *((unsigned __int8 *)a1 + v39);
      goto LABEL_130;
    }
    int v56 = *(unsigned __int16 *)((char *)a1 + v39);
  }
LABEL_130:
  if (v56)
  {
    int v44 = (v56 - 1) << v55;
    if (v39 > 3) {
      int v44 = 0;
    }
    if (v39)
    {
      if (v39 > 3) {
        LODWORD(v39) = 4;
      }
      switch((int)v39)
      {
        case 2:
LABEL_144:
          LODWORD(v39) = *a1;
          break;
        case 3:
LABEL_145:
          LODWORD(v39) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
          break;
        case 4:
LABEL_146:
          LODWORD(v39) = *(_DWORD *)a1;
          break;
        default:
LABEL_137:
          LODWORD(v39) = *(unsigned __int8 *)a1;
          break;
      }
    }
LABEL_147:
    unsigned int v65 = v33 + (v39 | v44) + 1;
    uint64_t result = v65 - 2;
    if (v65 > 2) {
      return result;
    }
    return 0;
  }
LABEL_138:
  if (!v33) {
    return 0;
  }
  if (v5 <= 3)
  {
    unsigned int v63 = ((1 << (8 * v5)) + 1) >> (8 * v5);
    if (v63 > 0xFFFD)
    {
      unsigned int v59 = *(_DWORD *)((char *)a1 + v5);
      unsigned int v60 = ~v59;
LABEL_152:
      unsigned int v67 = 0x7FFFFFFF;
      goto LABEL_153;
    }
    int v62 = v63 + 2;
    if (v63 > 0xFD)
    {
      int v66 = *(unsigned __int16 *)((char *)a1 + v5);
      unsigned int v59 = v66 | 0xFFFF0000;
      unsigned int v60 = v66 ^ 0xFFFF;
      char v61 = 16;
    }
    else
    {
      int v64 = *((unsigned __int8 *)a1 + v5);
      unsigned int v59 = v64 | 0xFFFFFF00;
      unsigned int v60 = v64 ^ 0xFF;
      char v61 = 8;
    }
  }
  else
  {
    int v58 = *((unsigned __int8 *)a1 + v5);
    unsigned int v59 = v58 | 0xFFFFFF00;
    unsigned int v60 = v58 ^ 0xFF;
    char v61 = 8;
    int v62 = 3;
  }
  unsigned int v67 = (1 << v61) - v62;
  if ((v67 & 0x80000000) != 0) {
    goto LABEL_152;
  }
LABEL_153:
  if (v67 <= v60) {
    return 0;
  }
  unsigned int v68 = -v59;
  uint64_t result = v68 - 2;
  if (v68 <= 2) {
    return 0;
  }
  return result;
}

void sub_1B0836CE8(unsigned char *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v6 = 2147483645;
  uint64_t v7 = *(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64);
  char v8 = 8 * v7;
  if (v7 <= 3)
  {
    unsigned int v12 = ((1 << v8) + 1) >> v8;
    if (v12 > 0xFFFD) {
      goto LABEL_10;
    }
    int v9 = v12 + 2;
    if (v12 > 0xFD)
    {
      char v10 = 16;
      goto LABEL_4;
    }
  }
  else
  {
    int v9 = 3;
  }
  char v10 = 8;
LABEL_4:
  unsigned int v11 = (1 << v10) - v9;
  if ((v11 & 0x80000000) == 0)
  {
    unsigned int v6 = v11 - 2;
    if (v11 < 2) {
      unsigned int v6 = 0;
    }
  }
LABEL_10:
  if (v7 > 3)
  {
    int v13 = 3;
    goto LABEL_12;
  }
  unsigned int v16 = ((1 << v8) + 1) >> v8;
  if (v16 <= 0xFFFD)
  {
    int v13 = v16 + 2;
    if (v16 > 0xFD)
    {
      char v14 = 16;
LABEL_13:
      unsigned int v15 = (1 << v14) - v13;
      if ((v15 & 0x80000000) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
LABEL_12:
    char v14 = 8;
    goto LABEL_13;
  }
LABEL_18:
  unsigned int v15 = 0x7FFFFFFF;
LABEL_19:
  uint64_t v17 = 1;
  if (v7 <= 3)
  {
    unsigned int v19 = ((1 << v8) + 1) >> v8;
    if (v19 > 0xFFFD)
    {
      uint64_t v17 = 4;
    }
    else
    {
      if (v19 < 0xFE)
      {
        uint64_t v17 = 1;
        int v18 = 1;
        goto LABEL_28;
      }
      uint64_t v17 = 2;
    }
    BOOL v20 = v19 > 0xFFFD;
    int v18 = 2;
    if (v20) {
      int v18 = 4;
    }
    goto LABEL_28;
  }
  int v18 = 1;
LABEL_28:
  size_t v21 = v7 + v17;
  if (v15 <= 1)
  {
    if ((v18 + v7) <= 3)
    {
      unsigned int v23 = (~(-1 << (8 * (v18 + v7))) - v15 + 2) >> (8 * (v18 + v7));
      if (v23 > 0xFFFE)
      {
        uint64_t v22 = 4;
      }
      else
      {
        BOOL v24 = v23 != 0;
        BOOL v25 = v23 >= 0xFF;
        uint64_t v22 = 2;
        if (!v25) {
          uint64_t v22 = v24;
        }
      }
    }
    else
    {
      uint64_t v22 = 1;
    }
    v21 += v22;
  }
  if (a3 <= v6)
  {
    int v26 = 0;
  }
  else if (v21 <= 3)
  {
    unsigned int v29 = ((a3 - v6 + ~(-1 << (8 * v21))) >> (8 * v21)) + 1;
    if (HIWORD(v29))
    {
      int v26 = 4;
    }
    else if (v29 >= 0x100)
    {
      int v26 = 2;
    }
    else
    {
      int v26 = v29 > 1;
    }
  }
  else
  {
    int v26 = 1;
  }
  if (v6 < a2)
  {
    unsigned int v27 = ~v6 + a2;
    if (v21 < 4)
    {
      int v28 = (v27 >> (8 * v21)) + 1;
      if (v21)
      {
        int v30 = v27 & ~(-1 << (8 * v21));
        bzero(a1, v21);
        if (v21 == 3)
        {
          *(_WORD *)a1 = v30;
          a1[2] = BYTE2(v30);
        }
        else if (v21 == 2)
        {
          *(_WORD *)a1 = v30;
        }
        else
        {
          *a1 = v30;
        }
      }
    }
    else
    {
      bzero(a1, v21);
      *(_DWORD *)a1 = v27;
      int v28 = 1;
    }
    switch(v26)
    {
      case 1:
        a1[v21] = v28;
        return;
      case 2:
        *(_WORD *)&a1[v21] = v28;
        return;
      case 3:
        goto LABEL_170;
      case 4:
        *(_DWORD *)&a1[v21] = v28;
        return;
      default:
        return;
    }
  }
  switch(v26)
  {
    case 1:
      a1[v21] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_57;
    case 2:
      *(_WORD *)&a1[v21] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_57;
    case 3:
LABEL_170:
      __break(1u);
      JUMPOUT(0x1B0837554);
    case 4:
      *(_DWORD *)&a1[v21] = 0;
      goto LABEL_56;
    default:
LABEL_56:
      if (!a2) {
        return;
      }
LABEL_57:
      if (v7 > 3)
      {
        int v31 = 3;
LABEL_59:
        char v32 = 8;
        goto LABEL_60;
      }
      unsigned int v37 = ((1 << v8) + 1) >> v8;
      if (v37 > 0xFFFD)
      {
LABEL_70:
        unsigned int v33 = 0x7FFFFFFF;
        if (v7 > 3) {
          goto LABEL_62;
        }
        goto LABEL_71;
      }
      int v31 = v37 + 2;
      if (v37 <= 0xFD) {
        goto LABEL_59;
      }
      char v32 = 16;
LABEL_60:
      unsigned int v33 = (1 << v32) - v31;
      if ((v33 & 0x80000000) != 0) {
        goto LABEL_70;
      }
      if (v7 > 3)
      {
LABEL_62:
        int v34 = 3;
LABEL_63:
        char v35 = 8;
        goto LABEL_64;
      }
LABEL_71:
      unsigned int v38 = ((1 << v8) + 1) >> v8;
      if (v38 > 0xFFFD) {
        goto LABEL_74;
      }
      int v34 = v38 + 2;
      if (v38 <= 0xFD) {
        goto LABEL_63;
      }
      char v35 = 16;
LABEL_64:
      unsigned int v36 = (1 << v35) - v34;
      if ((v36 & 0x80000000) == 0)
      {
        if (v7 > 3) {
          goto LABEL_78;
        }
        goto LABEL_75;
      }
LABEL_74:
      unsigned int v36 = 0x7FFFFFFF;
      if (v7 > 3)
      {
LABEL_78:
        uint64_t v40 = 1;
        goto LABEL_79;
      }
LABEL_75:
      unsigned int v39 = ((1 << v8) + 1) >> v8;
      uint64_t v40 = 2;
      if (v39 > 0xFFFD) {
        uint64_t v40 = 4;
      }
      if (v39 <= 0xFD) {
        goto LABEL_78;
      }
LABEL_79:
      unsigned int v41 = a2 + 2;
      size_t v42 = v40 + v7;
      BOOL v25 = v33 >= v36;
      unsigned int v43 = v33 - v36;
      if (v43 != 0 && v25)
      {
        if (v42 <= 3)
        {
          unsigned int v47 = ((v43 + ~(-1 << (8 * v42))) >> (8 * v42)) + 1;
          if (HIWORD(v47))
          {
            int v44 = 4;
          }
          else if (v47 >= 0x100)
          {
            int v44 = 2;
          }
          else
          {
            int v44 = v47 > 1;
          }
        }
        else
        {
          int v44 = 1;
        }
      }
      else
      {
        int v44 = 0;
      }
      if (v41 > v36)
      {
        unsigned int v45 = a2 - v36 + 1;
        if (v42 < 4)
        {
          int v46 = (v45 >> (8 * v42)) + 1;
          if (v42)
          {
            int v48 = v45 & ~(-1 << (8 * v42));
            bzero(a1, v42);
            if (v42 == 3)
            {
              *(_WORD *)a1 = v48;
              a1[2] = BYTE2(v48);
            }
            else if (v42 == 2)
            {
              *(_WORD *)a1 = v48;
            }
            else
            {
              *a1 = v48;
            }
          }
        }
        else
        {
          bzero(a1, v42);
          *(_DWORD *)a1 = v45;
          int v46 = 1;
        }
        switch(v44)
        {
          case 1:
            goto LABEL_166;
          case 2:
            goto LABEL_167;
          case 3:
            goto LABEL_170;
          case 4:
            goto LABEL_168;
          default:
            return;
        }
      }
      switch(v44)
      {
        case 1:
          a1[v42] = 0;
          if (a2 == -2) {
            return;
          }
          goto LABEL_108;
        case 2:
          *(_WORD *)&a1[v42] = 0;
          goto LABEL_107;
        case 3:
          goto LABEL_170;
        case 4:
          *(_DWORD *)&a1[v42] = 0;
          if (a2 == -2) {
            return;
          }
          goto LABEL_108;
        default:
LABEL_107:
          if (a2 == -2) {
            return;
          }
LABEL_108:
          if (v7 > 3)
          {
            int v49 = 3;
LABEL_110:
            char v50 = 8;
            goto LABEL_111;
          }
          unsigned int v52 = ((1 << v8) + 1) >> v8;
          if (v52 > 0xFFFD) {
            goto LABEL_116;
          }
          int v49 = v52 + 2;
          if (v52 <= 0xFD) {
            goto LABEL_110;
          }
          char v50 = 16;
LABEL_111:
          unsigned int v51 = (1 << v50) - v49;
          if ((v51 & 0x80000000) == 0) {
            goto LABEL_117;
          }
LABEL_116:
          unsigned int v51 = 0x7FFFFFFF;
LABEL_117:
          if (v7 > 3)
          {
            int v53 = 3;
LABEL_119:
            char v54 = 8;
            goto LABEL_120;
          }
          unsigned int v56 = ((1 << v8) + 1) >> v8;
          if (v56 > 0xFFFD) {
            goto LABEL_126;
          }
          int v53 = v56 + 2;
          if (v56 <= 0xFD) {
            goto LABEL_119;
          }
          char v54 = 16;
LABEL_120:
          unsigned int v55 = (1 << v54) - v53;
          if ((v55 & 0x80000000) == 0)
          {
            if (v7 > 3) {
              goto LABEL_130;
            }
            goto LABEL_127;
          }
LABEL_126:
          unsigned int v55 = 0x7FFFFFFF;
          if (v7 > 3)
          {
LABEL_130:
            uint64_t v58 = 1;
            goto LABEL_131;
          }
LABEL_127:
          unsigned int v57 = ((1 << v8) + 1) >> v8;
          uint64_t v58 = 2;
          if (v57 > 0xFFFD) {
            uint64_t v58 = 4;
          }
          if (v57 <= 0xFD) {
            goto LABEL_130;
          }
LABEL_131:
          size_t v42 = v58 + v7;
          BOOL v25 = v51 >= v55;
          unsigned int v59 = v51 - v55;
          if (v59 != 0 && v25)
          {
            if (v42 <= 3)
            {
              unsigned int v62 = ((v59 + ~(-1 << (8 * v42))) >> (8 * v42)) + 1;
              if (HIWORD(v62))
              {
                int v60 = 4;
              }
              else if (v62 >= 0x100)
              {
                int v60 = 2;
              }
              else
              {
                int v60 = v62 > 1;
              }
            }
            else
            {
              int v60 = 1;
            }
          }
          else
          {
            int v60 = 0;
          }
          if (v41 > v55)
          {
            unsigned int v61 = a2 - v55 + 1;
            if (v42 < 4)
            {
              int v46 = (v61 >> (8 * v42)) + 1;
              if (v42)
              {
                int v63 = v61 & ~(-1 << (8 * v42));
                bzero(a1, v42);
                if (v42 == 3)
                {
                  *(_WORD *)a1 = v63;
                  a1[2] = BYTE2(v63);
                }
                else if (v42 == 2)
                {
                  *(_WORD *)a1 = v63;
                }
                else
                {
                  *a1 = v63;
                }
              }
            }
            else
            {
              bzero(a1, v42);
              *(_DWORD *)a1 = v61;
              int v46 = 1;
            }
            switch(v60)
            {
              case 1:
LABEL_166:
                a1[v42] = v46;
                return;
              case 2:
LABEL_167:
                *(_WORD *)&a1[v42] = v46;
                return;
              case 3:
                goto LABEL_170;
              case 4:
LABEL_168:
                *(_DWORD *)&a1[v42] = v46;
                return;
              default:
                return;
            }
          }
          switch(v60)
          {
            case 1:
              a1[v42] = 0;
              goto LABEL_156;
            case 2:
              *(_WORD *)&a1[v42] = 0;
              goto LABEL_156;
            case 3:
              goto LABEL_170;
            case 4:
              *(_DWORD *)&a1[v42] = 0;
              goto LABEL_156;
            default:
LABEL_156:
              int v64 = -2 - a2;
              if (v7 > 3) {
                goto LABEL_157;
              }
              unsigned int v65 = ((1 << v8) + 1) >> v8;
              if (v65 > 0xFFFD)
              {
                *(_DWORD *)&a1[v7] = v64;
              }
              else if (v65 <= 0xFD)
              {
LABEL_157:
                a1[v7] = v64;
              }
              else
              {
                *(_WORD *)&a1[v7] = v64;
              }
              break;
          }
          return;
      }
  }
}

uint64_t sub_1B08375CC(unsigned __int16 *a1)
{
  uint64_t v2 = *(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64);
  char v3 = 8 * v2;
  if (v2 > 3)
  {
    int v4 = 3;
LABEL_3:
    char v5 = 8;
    goto LABEL_4;
  }
  unsigned int v7 = ((1 << v3) + 1) >> v3;
  if (v7 > 0xFFFD) {
    goto LABEL_10;
  }
  int v4 = v7 + 2;
  if (v7 <= 0xFD) {
    goto LABEL_3;
  }
  char v5 = 16;
LABEL_4:
  unsigned int v6 = (1 << v5) - v4;
  if ((v6 & 0x80000000) == 0)
  {
    if (v2 > 3) {
      goto LABEL_14;
    }
LABEL_11:
    unsigned int v8 = ((1 << v3) + 1) >> v3;
    uint64_t v9 = 2;
    if (v8 > 0xFFFD) {
      uint64_t v9 = 4;
    }
    if (v8 > 0xFD) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_10:
  unsigned int v6 = 0x7FFFFFFF;
  if (v2 <= 3) {
    goto LABEL_11;
  }
LABEL_14:
  uint64_t v9 = 1;
LABEL_15:
  if (v6 > 1) {
    goto LABEL_33;
  }
  uint64_t v10 = v9 + v2;
  char v11 = 8 * v10;
  if (v10 > 3) {
    goto LABEL_17;
  }
  unsigned int v13 = (~(-1 << v11) - v6 + 2) >> v11;
  if (v13 > 0xFFFE)
  {
    int v12 = *(_DWORD *)((char *)a1 + v10);
    if (!v12) {
      goto LABEL_32;
    }
    goto LABEL_24;
  }
  if (v13 > 0xFE)
  {
    int v12 = *(unsigned __int16 *)((char *)a1 + v10);
    if (!*(unsigned __int16 *)((char *)a1 + v10)) {
      goto LABEL_32;
    }
    goto LABEL_24;
  }
  if (v13)
  {
LABEL_17:
    int v12 = *((unsigned __int8 *)a1 + v10);
    if (!*((unsigned char *)a1 + v10)) {
      goto LABEL_32;
    }
LABEL_24:
    int v14 = (v12 - 1) << v11;
    if (v10 > 3) {
      int v14 = 0;
    }
    if (v10)
    {
      if (v10 <= 3) {
        int v15 = v10;
      }
      else {
        int v15 = 4;
      }
      switch(v15)
      {
        case 2:
LABEL_74:
          int v31 = *a1;
          break;
        case 3:
LABEL_75:
          int v31 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
          break;
        case 4:
LABEL_76:
          int v31 = *(_DWORD *)a1;
          break;
        default:
LABEL_72:
          int v31 = *(unsigned __int8 *)a1;
          break;
      }
      return v6 + (v31 | v14) + 1;
    }
LABEL_73:
    int v31 = 0;
    return v6 + (v31 | v14) + 1;
  }
LABEL_32:
  if (!v6) {
    return 0;
  }
LABEL_33:
  if (v2 > 3)
  {
    int v16 = 3;
    goto LABEL_37;
  }
  unsigned int v17 = ((1 << v3) + 1) >> v3;
  if (v17 <= 0xFFFD)
  {
    int v16 = v17 + 2;
    if (v17 > 0xFD)
    {
      char v18 = 16;
LABEL_38:
      unsigned int v19 = (1 << v18) - v16;
      if ((v19 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
LABEL_37:
    char v18 = 8;
    goto LABEL_38;
  }
LABEL_39:
  unsigned int v19 = 0x7FFFFFFF;
LABEL_40:
  if (v2 > 3)
  {
    int v20 = 3;
LABEL_44:
    char v22 = 8;
    goto LABEL_45;
  }
  unsigned int v21 = ((1 << v3) + 1) >> v3;
  if (v21 > 0xFFFD) {
    goto LABEL_48;
  }
  int v20 = v21 + 2;
  if (v21 <= 0xFD) {
    goto LABEL_44;
  }
  char v22 = 16;
LABEL_45:
  unsigned int v6 = (1 << v22) - v20;
  if ((v6 & 0x80000000) == 0)
  {
    if (v2 > 3) {
      goto LABEL_52;
    }
    goto LABEL_49;
  }
LABEL_48:
  unsigned int v6 = 0x7FFFFFFF;
  if (v2 > 3)
  {
LABEL_52:
    uint64_t v24 = 1;
    goto LABEL_53;
  }
LABEL_49:
  unsigned int v23 = ((1 << v3) + 1) >> v3;
  uint64_t v24 = 2;
  if (v23 > 0xFFFD) {
    uint64_t v24 = 4;
  }
  if (v23 <= 0xFD) {
    goto LABEL_52;
  }
LABEL_53:
  if (!v19) {
    return 0;
  }
  unsigned int v25 = v19 - v6;
  if (v19 <= v6) {
    goto LABEL_79;
  }
  uint64_t v26 = v24 + v2;
  char v27 = 8 * (v24 + v2);
  if (v26 > 3)
  {
LABEL_56:
    int v28 = *((unsigned __int8 *)a1 + v26);
    if (!*((unsigned char *)a1 + v26)) {
      goto LABEL_79;
    }
    goto LABEL_65;
  }
  unsigned int v29 = ((v25 + ~(-1 << v27)) >> v27) + 1;
  if (HIWORD(v29))
  {
    int v28 = *(_DWORD *)((char *)a1 + v26);
    if (!v28) {
      goto LABEL_79;
    }
LABEL_65:
    int v14 = (v28 - 1) << v27;
    if (v26 > 3) {
      int v14 = 0;
    }
    if (v26)
    {
      if (v26 <= 3) {
        int v30 = v26;
      }
      else {
        int v30 = 4;
      }
      switch(v30)
      {
        case 2:
          goto LABEL_74;
        case 3:
          goto LABEL_75;
        case 4:
          goto LABEL_76;
        default:
          goto LABEL_72;
      }
    }
    goto LABEL_73;
  }
  if (v29 > 0xFF)
  {
    int v28 = *(unsigned __int16 *)((char *)a1 + v26);
    if (!*(unsigned __int16 *)((char *)a1 + v26)) {
      goto LABEL_79;
    }
    goto LABEL_65;
  }
  if (v29 >= 2) {
    goto LABEL_56;
  }
LABEL_79:
  if (!v6) {
    return 0;
  }
  if (v2 > 3)
  {
    int v33 = *((unsigned __int8 *)a1 + v2);
    unsigned int v34 = v33 | 0xFFFFFF00;
    unsigned int v35 = v33 ^ 0xFF;
    char v36 = 8;
    int v37 = 3;
    goto LABEL_88;
  }
  unsigned int v38 = ((1 << v3) + 1) >> v3;
  if (v38 <= 0xFFFD)
  {
    int v37 = v38 + 2;
    if (v38 > 0xFD)
    {
      int v40 = *(unsigned __int16 *)((char *)a1 + v2);
      unsigned int v34 = v40 | 0xFFFF0000;
      unsigned int v35 = v40 ^ 0xFFFF;
      char v36 = 16;
    }
    else
    {
      int v39 = *((unsigned __int8 *)a1 + v2);
      unsigned int v34 = v39 | 0xFFFFFF00;
      unsigned int v35 = v39 ^ 0xFF;
      char v36 = 8;
    }
LABEL_88:
    unsigned int v41 = (1 << v36) - v37;
    if ((v41 & 0x80000000) == 0) {
      goto LABEL_90;
    }
    goto LABEL_89;
  }
  unsigned int v34 = *(_DWORD *)((char *)a1 + v2);
  unsigned int v35 = ~v34;
LABEL_89:
  unsigned int v41 = 0x7FFFFFFF;
LABEL_90:
  if (v41 > v35) {
    return -v34;
  }
  else {
    return 0;
  }
}

void sub_1B0837A3C(unsigned char *a1, unsigned int a2)
{
  uint64_t v4 = *(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64);
  char v5 = 8 * v4;
  if (v4 > 3)
  {
    int v6 = 3;
LABEL_3:
    char v7 = 8;
    goto LABEL_4;
  }
  unsigned int v9 = ((1 << v5) + 1) >> v5;
  if (v9 > 0xFFFD) {
    goto LABEL_10;
  }
  int v6 = v9 + 2;
  if (v9 <= 0xFD) {
    goto LABEL_3;
  }
  char v7 = 16;
LABEL_4:
  unsigned int v8 = (1 << v7) - v6;
  if ((v8 & 0x80000000) == 0)
  {
    if (v4 > 3) {
      goto LABEL_14;
    }
LABEL_11:
    unsigned int v10 = ((1 << v5) + 1) >> v5;
    uint64_t v11 = 2;
    if (v10 > 0xFFFD) {
      uint64_t v11 = 4;
    }
    if (v10 > 0xFD) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_10:
  unsigned int v8 = 0x7FFFFFFF;
  if (v4 <= 3) {
    goto LABEL_11;
  }
LABEL_14:
  uint64_t v11 = 1;
LABEL_15:
  size_t v12 = v11 + v4;
  if (v8 > 1)
  {
    int v13 = 0;
  }
  else if (v12 <= 3)
  {
    unsigned int v16 = (~(-1 << (8 * v12)) - v8 + 2) >> (8 * v12);
    if (v16 > 0xFFFE)
    {
      int v13 = 4;
    }
    else if (v16 >= 0xFF)
    {
      int v13 = 2;
    }
    else
    {
      int v13 = v16 != 0;
    }
  }
  else
  {
    int v13 = 1;
  }
  if (v8 < a2)
  {
    unsigned int v14 = ~v8 + a2;
    if (v12 < 4)
    {
      int v15 = (v14 >> (8 * v12)) + 1;
      if (v12)
      {
        int v17 = v14 & ~(-1 << (8 * v12));
        bzero(a1, v12);
        if (v12 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if (v12 == 2)
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
      bzero(a1, v12);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v13)
    {
      case 1:
        goto LABEL_93;
      case 2:
        goto LABEL_94;
      case 3:
        goto LABEL_97;
      case 4:
        goto LABEL_95;
      default:
        return;
    }
  }
  switch(v13)
  {
    case 1:
      a1[v12] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 2:
      *(_WORD *)&a1[v12] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 3:
LABEL_97:
      __break(1u);
      JUMPOUT(0x1B0837F5CLL);
    case 4:
      *(_DWORD *)&a1[v12] = 0;
      goto LABEL_34;
    default:
LABEL_34:
      if (!a2) {
        return;
      }
LABEL_35:
      if (v4 > 3)
      {
        int v18 = 3;
LABEL_37:
        char v19 = 8;
        goto LABEL_38;
      }
      unsigned int v21 = ((1 << v5) + 1) >> v5;
      if (v21 > 0xFFFD) {
        goto LABEL_43;
      }
      int v18 = v21 + 2;
      if (v21 <= 0xFD) {
        goto LABEL_37;
      }
      char v19 = 16;
LABEL_38:
      unsigned int v20 = (1 << v19) - v18;
      if ((v20 & 0x80000000) == 0) {
        goto LABEL_44;
      }
LABEL_43:
      unsigned int v20 = 0x7FFFFFFF;
LABEL_44:
      if (v4 > 3)
      {
        int v22 = 3;
LABEL_46:
        char v23 = 8;
        goto LABEL_47;
      }
      unsigned int v25 = ((1 << v5) + 1) >> v5;
      if (v25 > 0xFFFD) {
        goto LABEL_53;
      }
      int v22 = v25 + 2;
      if (v25 <= 0xFD) {
        goto LABEL_46;
      }
      char v23 = 16;
LABEL_47:
      unsigned int v24 = (1 << v23) - v22;
      if ((v24 & 0x80000000) == 0)
      {
        if (v4 > 3) {
          goto LABEL_57;
        }
        goto LABEL_54;
      }
LABEL_53:
      unsigned int v24 = 0x7FFFFFFF;
      if (v4 > 3)
      {
LABEL_57:
        uint64_t v27 = 1;
        goto LABEL_58;
      }
LABEL_54:
      unsigned int v26 = ((1 << v5) + 1) >> v5;
      uint64_t v27 = 2;
      if (v26 > 0xFFFD) {
        uint64_t v27 = 4;
      }
      if (v26 <= 0xFD) {
        goto LABEL_57;
      }
LABEL_58:
      size_t v12 = v27 + v4;
      BOOL v28 = v20 >= v24;
      unsigned int v29 = v20 - v24;
      if (v29 != 0 && v28)
      {
        if (v12 <= 3)
        {
          unsigned int v32 = ((v29 + ~(-1 << (8 * v12))) >> (8 * v12)) + 1;
          if (HIWORD(v32))
          {
            int v30 = 4;
          }
          else if (v32 >= 0x100)
          {
            int v30 = 2;
          }
          else
          {
            int v30 = v32 > 1;
          }
        }
        else
        {
          int v30 = 1;
        }
      }
      else
      {
        int v30 = 0;
      }
      if (v24 < a2)
      {
        unsigned int v31 = ~v24 + a2;
        if (v12 < 4)
        {
          int v15 = (v31 >> (8 * v12)) + 1;
          if (v12)
          {
            int v33 = v31 & ~(-1 << (8 * v12));
            bzero(a1, v12);
            if (v12 == 3)
            {
              *(_WORD *)a1 = v33;
              a1[2] = BYTE2(v33);
            }
            else if (v12 == 2)
            {
              *(_WORD *)a1 = v33;
            }
            else
            {
              *a1 = v33;
            }
          }
        }
        else
        {
          bzero(a1, v12);
          *(_DWORD *)a1 = v31;
          int v15 = 1;
        }
        switch(v30)
        {
          case 1:
LABEL_93:
            a1[v12] = v15;
            return;
          case 2:
LABEL_94:
            *(_WORD *)&a1[v12] = v15;
            return;
          case 3:
            goto LABEL_97;
          case 4:
LABEL_95:
            *(_DWORD *)&a1[v12] = v15;
            return;
          default:
            return;
        }
      }
      switch(v30)
      {
        case 1:
          a1[v12] = 0;
          goto LABEL_83;
        case 2:
          *(_WORD *)&a1[v12] = 0;
          goto LABEL_83;
        case 3:
          goto LABEL_97;
        case 4:
          *(_DWORD *)&a1[v12] = 0;
          goto LABEL_83;
        default:
LABEL_83:
          int v34 = -a2;
          if (v4 > 3) {
            goto LABEL_84;
          }
          unsigned int v35 = ((1 << v5) + 1) >> v5;
          if (v35 > 0xFFFD)
          {
            *(_DWORD *)&a1[v4] = v34;
          }
          else if (v35 <= 0xFD)
          {
LABEL_84:
            a1[v4] = v34;
          }
          else
          {
            *(_WORD *)&a1[v4] = v34;
          }
          break;
      }
      return;
  }
}

uint64_t type metadata accessor for ShelvesPresenter<>.MergeSolution()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1B0837FC4()
{
  return sub_1B0824C48() & 1;
}

uint64_t sub_1B0837FE8()
{
  return sub_1B0824AD4() & 1;
}

void sub_1B083800C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BA48);
  MEMORY[0x1F4188790](v5 - 8);
  char v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB596230);
  MEMORY[0x1F4188790](v8);
  int v30 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v12 = MEMORY[0x1F4188790](v10);
  size_t v42 = (char *)v28 - v13;
  uint64_t v45 = MEMORY[0x1E4FBC860];
  uint64_t v39 = *(void *)(a1 + 16);
  if (v39)
  {
    v28[2] = v2;
    unint64_t v14 = 0;
    uint64_t v37 = v11 + 16;
    uint64_t v38 = v11;
    uint64_t v35 = v11 + 48;
    unsigned int v41 = (void (**)(char *, char *, uint64_t))(v11 + 32);
    uint64_t v15 = a2 + 56;
    unsigned int v31 = (void (**)(char *, uint64_t))(v11 + 8);
    uint64_t v29 = MEMORY[0x1E4FBC860];
    uint64_t v36 = v11 + 56;
    v28[1] = (v11 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    int v33 = v7;
    uint64_t v34 = a1;
    while (v14 < *(void *)(a1 + 16))
    {
      uint64_t v16 = v38;
      unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
      uint64_t v18 = *(void *)(v38 + 72);
      (*(void (**)(char *, unint64_t, uint64_t, __n128))(v38 + 16))(v7, a1 + v17 + v18 * v14, v8, v12);
      unsigned int v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t, __n128))(v16 + 56);
      ((void (*)(char *, void, uint64_t, uint64_t))v32)(v7, 0, 1, v8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v7, 1, v8) == 1) {
        goto LABEL_21;
      }
      int v40 = *v41;
      v40(v42, v7, v8);
      sub_1B0869768();
      if (*(void *)(a2 + 16)
        && (uint64_t v19 = sub_1B086A548(),
            uint64_t v20 = -1 << *(unsigned char *)(a2 + 32),
            unint64_t v21 = v19 & ~v20,
            ((*(void *)(v15 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) != 0))
      {
        uint64_t v22 = ~v20;
        while (1)
        {
          sub_1B08384D0(*(void *)(a2 + 48) + 40 * v21, (uint64_t)v43);
          char v23 = MEMORY[0x1B3E97E80](v43, v44);
          sub_1B083852C((uint64_t)v43);
          if (v23) {
            break;
          }
          unint64_t v21 = (v21 + 1) & v22;
          if (((*(void *)(v15 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
            goto LABEL_3;
          }
        }
        sub_1B083852C((uint64_t)v44);
        v40(v30, v42, v8);
        uint64_t v24 = v29;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_1B081606C(0, *(void *)(v24 + 16) + 1, 1);
        }
        uint64_t v25 = v45;
        unint64_t v27 = *(void *)(v45 + 16);
        unint64_t v26 = *(void *)(v45 + 24);
        if (v27 >= v26 >> 1)
        {
          sub_1B081606C(v26 > 1, v27 + 1, 1);
          uint64_t v25 = v45;
        }
        *(void *)(v25 + 16) = v27 + 1;
        uint64_t v29 = v25;
        v40((char *)(v25 + v17 + v27 * v18), v30, v8);
      }
      else
      {
LABEL_3:
        sub_1B083852C((uint64_t)v44);
        (*v31)(v42, v8);
      }
      ++v14;
      char v7 = v33;
      a1 = v34;
      if (v14 == v39)
      {
        v32(v33, 1, 1, v8, v12);
        goto LABEL_21;
      }
    }
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t, __n128))(v11 + 56))(v7, 1, 1, v8, v12);
LABEL_21:
    swift_bridgeObjectRelease();
    sub_1B0838470((uint64_t)v7);
  }
}

uint64_t sub_1B0838470(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BA48);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B08384D0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1B083852C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B0838580(uint64_t a1)
{
  return sub_1B08385E0(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_1B0827CE4) & 1;
}

uint64_t sub_1B08385B0(uint64_t a1)
{
  return sub_1B08385E0(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_1B08277CC) & 1;
}

uint64_t sub_1B08385E0(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void))
{
  return a2(a1, v2[6], v2[2], v2[3], v2[4], v2[5]) & 1;
}

uint64_t sub_1B0838610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  unsigned int v51 = (char *)&v39 - v10;
  uint64_t v40 = v11;
  __n128 v13 = MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v39 - v14;
  if (MEMORY[0x1B3E97950](v13))
  {
    sub_1B086A5A8();
    uint64_t v16 = sub_1B086A598();
  }
  else
  {
    uint64_t v16 = MEMORY[0x1E4FBC870];
  }
  uint64_t v44 = MEMORY[0x1B3E979A0](v5, a2);
  if (!v44) {
    return v16;
  }
  uint64_t v17 = 0;
  int v49 = (void (**)(char *, uint64_t *, uint64_t))(v6 + 16);
  uint64_t v50 = v16 + 56;
  uint64_t v46 = v6 + 32;
  int v48 = (void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v41 = v6;
  uint64_t v42 = v5;
  unsigned int v43 = v15;
  while (1)
  {
    char v18 = sub_1B086A008();
    sub_1B0869FB8();
    if (v18)
    {
      uint64_t v19 = *(void (**)(char *, uint64_t *, uint64_t))(v6 + 16);
      v19(v15, (uint64_t *)(v5+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v17), a2);
      BOOL v20 = __OFADD__(v17, 1);
      uint64_t v21 = v17 + 1;
      if (v20) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t result = sub_1B086A608();
      if (v40 != 8) {
        goto LABEL_23;
      }
      uint64_t v52 = result;
      uint64_t v19 = *v49;
      (*v49)(v15, &v52, a2);
      swift_unknownObjectRelease();
      BOOL v20 = __OFADD__(v17, 1);
      uint64_t v21 = v17 + 1;
      if (v20)
      {
LABEL_20:
        __break(1u);
        return v16;
      }
    }
    uint64_t v47 = v21;
    uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v45(v51, v15, a2);
    uint64_t v22 = sub_1B0869D08();
    uint64_t v23 = v16;
    uint64_t v24 = -1 << *(unsigned char *)(v16 + 32);
    unint64_t v25 = v22 & ~v24;
    unint64_t v26 = v25 >> 6;
    uint64_t v27 = *(void *)(v50 + 8 * (v25 >> 6));
    uint64_t v28 = 1 << v25;
    uint64_t v29 = *(void *)(v6 + 72);
    if (((1 << v25) & v27) != 0)
    {
      uint64_t v30 = ~v24;
      do
      {
        v19(v8, (uint64_t *)(*(void *)(v23 + 48) + v29 * v25), a2);
        uint64_t v31 = a3;
        char v32 = sub_1B0869D58();
        int v33 = *v48;
        (*v48)(v8, a2);
        if (v32)
        {
          v33(v51, a2);
          a3 = v31;
          uint64_t v6 = v41;
          uint64_t v5 = v42;
          uint64_t v16 = v23;
          goto LABEL_7;
        }
        unint64_t v25 = (v25 + 1) & v30;
        unint64_t v26 = v25 >> 6;
        uint64_t v27 = *(void *)(v50 + 8 * (v25 >> 6));
        uint64_t v28 = 1 << v25;
        a3 = v31;
      }
      while ((v27 & (1 << v25)) != 0);
      uint64_t v6 = v41;
      uint64_t v5 = v42;
    }
    uint64_t v34 = v51;
    *(void *)(v50 + 8 * v26) = v28 | v27;
    unint64_t v35 = *(void *)(v23 + 48) + v29 * v25;
    uint64_t v16 = v23;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v45)(v35, v34, a2);
    uint64_t v37 = *(void *)(v23 + 16);
    BOOL v20 = __OFADD__(v37, 1);
    uint64_t v38 = v37 + 1;
    if (v20) {
      break;
    }
    *(void *)(v23 + 16) = v38;
LABEL_7:
    uint64_t v15 = v43;
    uint64_t v17 = v47;
    if (v47 == v44) {
      return v16;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

BOOL sub_1B08389CC(uint64_t a1)
{
  return sub_1B0827218(a1, *(void *)(v1 + 48), *(void *)(v1 + 56));
}

uint64_t objectdestroy_29Tm()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B0838A38()
{
  return sub_1B08254C4(*(void (**)(uint64_t))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t dispatch thunk of CustomTextStyle.font(compatibleWith:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

double AnyDimension.estimatedTopMargin(for:in:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1B086A868();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B07B76D8((uint64_t)v11);
  AnyDimension.value(in:rounded:)(a2, (uint64_t)v11, a3, a4);
  double v13 = v12;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  objc_msgSend(a1, sel_lineHeight);
  double v15 = v14;
  objc_msgSend(a1, sel_descender);
  return v13 - (v15 + v16);
}

double AnyDimension.estimatedBottomMargin(for:in:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1B086A868();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B07B76D8((uint64_t)v11);
  AnyDimension.value(in:rounded:)(a2, (uint64_t)v11, a3, a4);
  double v13 = v12;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  objc_msgSend(a1, sel_descender);
  return v13 + v14;
}

Swift::Void __swiftcall JUCustomView.traitCollectionDidChange(_:)(UITraitCollection_optional a1)
{
  v1.super_class = (Class)JUCustomView;
  objc_msgSendSuper2(&v1, sel_traitCollectionDidChange_, a1.value.super.isa);
}

uint64_t Resize.Placements.union.getter@<X0>(uint64_t a1@<X8>)
{
  sub_1B07B9D00(v1, (uint64_t)v15);
  Resize.Placements.next()((uint64_t)v9);
  uint64_t result = sub_1B07B99C0((uint64_t)v15);
  if (v10)
  {
    long long v7 = v12;
    long long v8 = v11;
    uint64_t v4 = v13;
    uint64_t v5 = v14;
    uint64_t result = sub_1B07BD394((uint64_t)v9);
    *(_OWORD *)a1 = v8;
    *(_OWORD *)(a1 + 16) = v7;
    *(void *)(a1 + 32) = v4;
    *(void *)(a1 + 40) = v5;
  }
  else
  {
    if (qword_1E9B3A3E8 != -1) {
      uint64_t result = swift_once();
    }
    long long v6 = xmmword_1E9B3A5A0;
    *(_OWORD *)a1 = xmmword_1E9B3A590;
    *(_OWORD *)(a1 + 16) = v6;
    *(_OWORD *)(a1 + 32) = xmmword_1E9B3A5B0;
  }
  return result;
}

void *sub_1B0838DE8@<X0>(void *a1@<X8>)
{
  return memcpy(a1, v1, 0x110uLL);
}

uint64_t sub_1B0838DF8()
{
  uint64_t v1 = sub_1B084FF94(v0);
  sub_1B07B99C0(v0);
  return v1;
}

unint64_t sub_1B0838E30()
{
  return 0xD00000000000003FLL;
}

JetUI::_LayoutAlignment __swiftcall Resize._layoutAlignment(with:)(UITraitCollection with)
{
  uint64_t v3 = v2;
  uint64_t v5 = v1;
  sub_1B07BBD78(v3, (uint64_t)v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595770);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595748);
  if (swift_dynamicCast())
  {
    sub_1B07BA8FC(v9, (uint64_t)v12);
    uint64_t v6 = v13;
    uint64_t v7 = v14;
    __swift_project_boxed_opaque_existential_1(v12, v13);
    (*(void (**)(Class, uint64_t, uint64_t))(v7 + 8))(with.super.isa, v6, v7);
    return (JetUI::_LayoutAlignment)__swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    uint64_t v10 = 0;
    memset(v9, 0, sizeof(v9));
    JetUI::_LayoutAlignment v8 = (JetUI::_LayoutAlignment)sub_1B07BBE14((uint64_t)v9, &qword_1EB595750);
    *uint64_t v5 = 0;
  }
  return v8;
}

unint64_t sub_1B0838F3C(uint64_t a1)
{
  unint64_t result = sub_1B0838F64();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1B0838F64()
{
  unint64_t result = qword_1E9B3BA50;
  if (!qword_1E9B3BA50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BA50);
  }
  return result;
}

unint64_t sub_1B0838FBC()
{
  unint64_t result = qword_1E9B3BA58;
  if (!qword_1E9B3BA58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BA58);
  }
  return result;
}

unint64_t sub_1B0839014()
{
  unint64_t result = qword_1E9B3BA60;
  if (!qword_1E9B3BA60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BA60);
  }
  return result;
}

uint64_t assignWithCopy for Resize(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  if (a1 != a2)
  {
    sub_1B07BABF8(a1 + 40);
    if (*(unsigned char *)(a2 + 80) == 1)
    {
      uint64_t v6 = *(void *)(a2 + 48);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = v6;
      *(unsigned char *)(a1 + 80) = 1;
      swift_retain();
    }
    else
    {
      uint64_t v4 = (long long *)(a2 + 40);
      if (*(unsigned char *)(a2 + 80))
      {
        long long v7 = *v4;
        long long v8 = *(_OWORD *)(a2 + 56);
        *(_OWORD *)(a1 + 65) = *(_OWORD *)(a2 + 65);
        *(_OWORD *)(a1 + 40) = v7;
        *(_OWORD *)(a1 + 56) = v8;
      }
      else
      {
        uint64_t v5 = *(void *)(a2 + 64);
        *(void *)(a1 + 64) = v5;
        *(void *)(a1 + 72) = *(void *)(a2 + 72);
        (**(void (***)(uint64_t, long long *))(v5 - 8))(a1 + 40, v4);
        *(unsigned char *)(a1 + 80) = 0;
      }
    }
    sub_1B07BABF8(a1 + 88);
    if (*(unsigned char *)(a2 + 128) == 1)
    {
      uint64_t v11 = *(void *)(a2 + 96);
      *(void *)(a1 + 88) = *(void *)(a2 + 88);
      *(void *)(a1 + 96) = v11;
      *(unsigned char *)(a1 + 128) = 1;
      swift_retain();
    }
    else
    {
      uint64_t v9 = (long long *)(a2 + 88);
      if (*(unsigned char *)(a2 + 128))
      {
        long long v12 = *v9;
        long long v13 = *(_OWORD *)(a2 + 104);
        *(_OWORD *)(a1 + 113) = *(_OWORD *)(a2 + 113);
        *(_OWORD *)(a1 + 88) = v12;
        *(_OWORD *)(a1 + 104) = v13;
      }
      else
      {
        uint64_t v10 = *(void *)(a2 + 112);
        *(void *)(a1 + 112) = v10;
        *(void *)(a1 + 120) = *(void *)(a2 + 120);
        (**(void (***)(uint64_t, long long *))(v10 - 8))(a1 + 88, v9);
        *(unsigned char *)(a1 + 128) = 0;
      }
    }
    sub_1B07BABF8(a1 + 136);
    if (*(unsigned char *)(a2 + 176) == 1)
    {
      uint64_t v16 = *(void *)(a2 + 144);
      *(void *)(a1 + 136) = *(void *)(a2 + 136);
      *(void *)(a1 + 144) = v16;
      *(unsigned char *)(a1 + 176) = 1;
      swift_retain();
    }
    else
    {
      uint64_t v14 = (long long *)(a2 + 136);
      if (*(unsigned char *)(a2 + 176))
      {
        long long v17 = *v14;
        long long v18 = *(_OWORD *)(a2 + 152);
        *(_OWORD *)(a1 + 161) = *(_OWORD *)(a2 + 161);
        *(_OWORD *)(a1 + 136) = v17;
        *(_OWORD *)(a1 + 152) = v18;
      }
      else
      {
        uint64_t v15 = *(void *)(a2 + 160);
        *(void *)(a1 + 160) = v15;
        *(void *)(a1 + 168) = *(void *)(a2 + 168);
        (**(void (***)(uint64_t, long long *))(v15 - 8))(a1 + 136, v14);
        *(unsigned char *)(a1 + 176) = 0;
      }
    }
    sub_1B07BABF8(a1 + 184);
    if (*(unsigned char *)(a2 + 224) == 1)
    {
      uint64_t v21 = *(void *)(a2 + 192);
      *(void *)(a1 + 184) = *(void *)(a2 + 184);
      *(void *)(a1 + 192) = v21;
      *(unsigned char *)(a1 + 224) = 1;
      swift_retain();
    }
    else
    {
      uint64_t v19 = (long long *)(a2 + 184);
      if (*(unsigned char *)(a2 + 224))
      {
        long long v22 = *v19;
        long long v23 = *(_OWORD *)(a2 + 200);
        *(_OWORD *)(a1 + 209) = *(_OWORD *)(a2 + 209);
        *(_OWORD *)(a1 + 184) = v22;
        *(_OWORD *)(a1 + 200) = v23;
      }
      else
      {
        uint64_t v20 = *(void *)(a2 + 208);
        *(void *)(a1 + 208) = v20;
        *(void *)(a1 + 216) = *(void *)(a2 + 216);
        (**(void (***)(uint64_t, long long *))(v20 - 8))(a1 + 184, v19);
        *(unsigned char *)(a1 + 224) = 0;
      }
    }
  }
  return a1;
}

__n128 __swift_memcpy225_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  long long v4 = a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  long long v7 = a2[7];
  long long v8 = a2[8];
  long long v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  __n128 result = (__n128)a2[11];
  long long v11 = a2[12];
  long long v12 = a2[13];
  *(unsigned char *)(a1 + 224) = *((unsigned char *)a2 + 224);
  *(_OWORD *)(a1 + 192) = v11;
  *(_OWORD *)(a1 + 208) = v12;
  *(__n128 *)(a1 + 176) = result;
  return result;
}

uint64_t assignWithTake for Resize(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  if (a1 != a2)
  {
    sub_1B07BABF8(a1 + 40);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 65) = *(_OWORD *)(a2 + 65);
    sub_1B07BABF8(a1 + 88);
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 113) = *(_OWORD *)(a2 + 113);
    sub_1B07BABF8(a1 + 136);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
    *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
    *(_OWORD *)(a1 + 161) = *(_OWORD *)(a2 + 161);
    sub_1B07BABF8(a1 + 184);
    *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
    *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
    *(_OWORD *)(a1 + 209) = *(_OWORD *)(a2 + 209);
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for Resize(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 225)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Resize(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 216) = 0;
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
    *(unsigned char *)(result + 224) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 225) = 1;
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
    *(unsigned char *)(result + 225) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t assignWithCopy for Resize.Rule(uint64_t a1, long long *a2)
{
  if ((long long *)a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    if (v4 == 1)
    {
      swift_release();
    }
    else if (!v4)
    {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    unsigned int v5 = *((unsigned __int8 *)a2 + 40);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      uint64_t v7 = *((void *)a2 + 1);
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v7;
      *(unsigned char *)(a1 + 40) = 1;
      swift_retain();
    }
    else if (v5)
    {
      long long v8 = *a2;
      long long v9 = a2[1];
      *(_OWORD *)(a1 + 25) = *(long long *)((char *)a2 + 25);
      *(_OWORD *)a1 = v8;
      *(_OWORD *)(a1 + 16) = v9;
    }
    else
    {
      uint64_t v6 = *((void *)a2 + 3);
      *(void *)(a1 + 24) = v6;
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      (**(void (***)(uint64_t, long long *))(v6 - 8))(a1, a2);
      *(unsigned char *)(a1 + 40) = 0;
    }
  }
  return a1;
}

uint64_t assignWithTake for Resize.Rule(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    if (v4 == 1)
    {
      swift_release();
    }
    else if (!v4)
    {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(unsigned char *)(a1 + 40) = 1;
    }
    else
    {
      long long v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
      if (v5)
      {
        *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
      }
      else
      {
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        *(unsigned char *)(a1 + 40) = 0;
      }
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for Resize.Rule(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 3) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Resize.Rule(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1B08396E8(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 2) {
    return (*(_DWORD *)a1 + 2);
  }
  return result;
}

uint64_t assignWithCopy for Resize.Placements(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  unsigned int v4 = *(void **)(a2 + 32);
  unsigned int v5 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v4;
  id v6 = v4;

  if (a1 != a2)
  {
    sub_1B07BABF8(a1 + 40);
    if (*(unsigned char *)(a2 + 80) == 1)
    {
      uint64_t v9 = *(void *)(a2 + 48);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = v9;
      *(unsigned char *)(a1 + 80) = 1;
      swift_retain();
    }
    else
    {
      uint64_t v7 = (long long *)(a2 + 40);
      if (*(unsigned char *)(a2 + 80))
      {
        long long v10 = *v7;
        long long v11 = *(_OWORD *)(a2 + 56);
        *(_OWORD *)(a1 + 65) = *(_OWORD *)(a2 + 65);
        *(_OWORD *)(a1 + 40) = v10;
        *(_OWORD *)(a1 + 56) = v11;
      }
      else
      {
        uint64_t v8 = *(void *)(a2 + 64);
        *(void *)(a1 + 64) = v8;
        *(void *)(a1 + 72) = *(void *)(a2 + 72);
        (**(void (***)(uint64_t, long long *))(v8 - 8))(a1 + 40, v7);
        *(unsigned char *)(a1 + 80) = 0;
      }
    }
    sub_1B07BABF8(a1 + 88);
    if (*(unsigned char *)(a2 + 128) == 1)
    {
      uint64_t v14 = *(void *)(a2 + 96);
      *(void *)(a1 + 88) = *(void *)(a2 + 88);
      *(void *)(a1 + 96) = v14;
      *(unsigned char *)(a1 + 128) = 1;
      swift_retain();
    }
    else
    {
      long long v12 = (long long *)(a2 + 88);
      if (*(unsigned char *)(a2 + 128))
      {
        long long v15 = *v12;
        long long v16 = *(_OWORD *)(a2 + 104);
        *(_OWORD *)(a1 + 113) = *(_OWORD *)(a2 + 113);
        *(_OWORD *)(a1 + 88) = v15;
        *(_OWORD *)(a1 + 104) = v16;
      }
      else
      {
        uint64_t v13 = *(void *)(a2 + 112);
        *(void *)(a1 + 112) = v13;
        *(void *)(a1 + 120) = *(void *)(a2 + 120);
        (**(void (***)(uint64_t, long long *))(v13 - 8))(a1 + 88, v12);
        *(unsigned char *)(a1 + 128) = 0;
      }
    }
    sub_1B07BABF8(a1 + 136);
    if (*(unsigned char *)(a2 + 176) == 1)
    {
      uint64_t v19 = *(void *)(a2 + 144);
      *(void *)(a1 + 136) = *(void *)(a2 + 136);
      *(void *)(a1 + 144) = v19;
      *(unsigned char *)(a1 + 176) = 1;
      swift_retain();
    }
    else
    {
      long long v17 = (long long *)(a2 + 136);
      if (*(unsigned char *)(a2 + 176))
      {
        long long v20 = *v17;
        long long v21 = *(_OWORD *)(a2 + 152);
        *(_OWORD *)(a1 + 161) = *(_OWORD *)(a2 + 161);
        *(_OWORD *)(a1 + 136) = v20;
        *(_OWORD *)(a1 + 152) = v21;
      }
      else
      {
        uint64_t v18 = *(void *)(a2 + 160);
        *(void *)(a1 + 160) = v18;
        *(void *)(a1 + 168) = *(void *)(a2 + 168);
        (**(void (***)(uint64_t, long long *))(v18 - 8))(a1 + 136, v17);
        *(unsigned char *)(a1 + 176) = 0;
      }
    }
    sub_1B07BABF8(a1 + 184);
    if (*(unsigned char *)(a2 + 224) == 1)
    {
      uint64_t v24 = *(void *)(a2 + 192);
      *(void *)(a1 + 184) = *(void *)(a2 + 184);
      *(void *)(a1 + 192) = v24;
      *(unsigned char *)(a1 + 224) = 1;
      swift_retain();
    }
    else
    {
      long long v22 = (long long *)(a2 + 184);
      if (*(unsigned char *)(a2 + 224))
      {
        long long v25 = *v22;
        long long v26 = *(_OWORD *)(a2 + 200);
        *(_OWORD *)(a1 + 209) = *(_OWORD *)(a2 + 209);
        *(_OWORD *)(a1 + 184) = v25;
        *(_OWORD *)(a1 + 200) = v26;
      }
      else
      {
        uint64_t v23 = *(void *)(a2 + 208);
        *(void *)(a1 + 208) = v23;
        *(void *)(a1 + 216) = *(void *)(a2 + 216);
        (**(void (***)(uint64_t, long long *))(v23 - 8))(a1 + 184, v22);
        *(unsigned char *)(a1 + 224) = 0;
      }
    }
  }
  uint64_t v27 = *(void *)(a2 + 256);
  if (!*(void *)(a1 + 256))
  {
    if (v27)
    {
      *(void *)(a1 + 256) = v27;
      *(void *)(a1 + 264) = *(void *)(a2 + 264);
      (**(void (***)(uint64_t, uint64_t))(v27 - 8))(a1 + 232, a2 + 232);
      return a1;
    }
LABEL_28:
    long long v28 = *(_OWORD *)(a2 + 232);
    long long v29 = *(_OWORD *)(a2 + 248);
    *(void *)(a1 + 264) = *(void *)(a2 + 264);
    *(_OWORD *)(a1 + 232) = v28;
    *(_OWORD *)(a1 + 248) = v29;
    return a1;
  }
  if (!v27)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 232);
    goto LABEL_28;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 232), (uint64_t *)(a2 + 232));
  return a1;
}

void *__swift_memcpy272_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x110uLL);
}

uint64_t assignWithTake for Resize.Placements(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  unsigned int v5 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  if (a1 != a2)
  {
    sub_1B07BABF8(a1 + 40);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 65) = *(_OWORD *)(a2 + 65);
    sub_1B07BABF8(a1 + 88);
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 113) = *(_OWORD *)(a2 + 113);
    sub_1B07BABF8(a1 + 136);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
    *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
    *(_OWORD *)(a1 + 161) = *(_OWORD *)(a2 + 161);
    sub_1B07BABF8(a1 + 184);
    *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
    *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
    *(_OWORD *)(a1 + 209) = *(_OWORD *)(a2 + 209);
  }
  if (*(void *)(a1 + 256)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 232);
  }
  long long v6 = *(_OWORD *)(a2 + 248);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_OWORD *)(a1 + 248) = v6;
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  return a1;
}

uint64_t getEnumTagSinglePayload for Resize.Placements(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 272)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Resize.Placements(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 264) = 0;
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
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 272) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 272) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Resize.Placements()
{
  return &type metadata for Resize.Placements;
}

void UIAccessibilityIdentification.setAutomationSemantics(_:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1B0869848();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  unsigned int v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B08699B8();
  sub_1B0869838();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  long long v6 = (void *)sub_1B0869D68();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setAccessibilityIdentifier_, v6);
}

void NSTextStorage.juWritingDirectionOfLine(_:layoutManager:textContainer:)(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (uint64_t)v3;
  unsigned int v5 = a3;
  long long v6 = a2;
  if (!a2)
  {
    id v11 = objc_msgSend(v3, sel_layoutManagers);
    sub_1B07C7B80(0, &qword_1E9B3BA68);
    unint64_t v12 = sub_1B0869F88();

    if (v12 >> 62) {
      goto LABEL_24;
    }
    if (!*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_25;
    }
    goto LABEL_6;
  }
  uint64_t v8 = a2;
  if (!a3) {
    goto LABEL_10;
  }
LABEL_3:
  id v9 = v6;
  long long v10 = v5;
  while (1)
  {
    uint64_t v18 = v5;
    uint64_t v34 = v10;
    objc_msgSend(v8, sel_ensureLayoutForTextContainer_, v10);
    id v19 = objc_msgSend((id)v4, sel_juFullRange);
    id v35 = objc_msgSend(v8, sel_glyphRangeForCharacterRange_actualCharacterRange_, v19, v20, 0);
    uint64_t v22 = v21;
    unsigned int v5 = (void *)swift_allocObject();
    v5[2] = 0;
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = sub_1B0868FD8();
    uint64_t v24 = (void *)(v23 + 16);
    *(void *)(v23 + 24) = 0;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = 0;
    *(void *)(v4 + 24) = 0;
    *(unsigned char *)(v4 + 32) = 1;
    long long v25 = (void *)swift_allocObject();
    v25[2] = v5;
    v25[3] = a1;
    v25[4] = v23;
    v25[5] = v8;
    v25[6] = v4;
    aBlock[4] = sub_1B083A370;
    uint64_t v37 = v25;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B083A3A0;
    aBlock[3] = &block_descriptor_7;
    long long v26 = _Block_copy(aBlock);
    long long v6 = v37;
    swift_retain();
    swift_retain();
    id v27 = v8;
    swift_retain();
    swift_release();
    objc_msgSend(v27, sel_enumerateLineFragmentsForGlyphRange_usingBlock_, v35, v22, v26);
    _Block_release(v26);
    if (a1 == -1)
    {
      swift_beginAccess();
      if ((*(unsigned char *)(v4 + 32) & 1) == 0)
      {
        id v28 = objc_msgSend(v27, sel_characterRangeForGlyphRange_actualGlyphRange_, *(void *)(v4 + 16), *(void *)(v4 + 24), 0);
        uint64_t v30 = v29;
        swift_beginAccess();
        *(void *)(v23 + 16) = v28;
        *(void *)(v23 + 24) = v30;
      }
    }
    unint64_t v12 = sub_1B0868FD8();
    swift_beginAccess();
    if (v12 == *v24)
    {
      swift_release();
      swift_release();
      swift_release();

      return;
    }
    uint64_t v31 = *(void *)(v23 + 24) + *v24;
    if (!__OFSUB__(v31, 1))
    {
      NSAttributedString.juStrongBaseWritingDirectionOfParagraph(atOrBefore:)(v31 - 1);
      swift_release();
      swift_release();
      swift_release();

      return;
    }
    __break(1u);
LABEL_24:
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_1B086A6E8();
    swift_bridgeObjectRelease();
    if (!v32)
    {
LABEL_25:
      swift_bridgeObjectRelease();
      __break(1u);
      goto LABEL_26;
    }
LABEL_6:
    if ((v12 & 0xC000000000000001) == 0) {
      break;
    }
LABEL_26:
    id v13 = (id)MEMORY[0x1B3E97F40](0, v12);
LABEL_9:
    uint64_t v8 = v13;
    swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_3;
    }
LABEL_10:
    id v14 = v6;
    id v15 = objc_msgSend(v8, sel_textContainers);
    sub_1B07C7B80(0, &qword_1E9B3BA70);
    unint64_t v16 = sub_1B0869F88();

    if (v16 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_1B086A6E8();
      swift_bridgeObjectRelease();
      if (!v33)
      {
LABEL_28:
        swift_bridgeObjectRelease();
        __break(1u);
LABEL_29:
        long long v17 = (void *)MEMORY[0x1B3E97F40](0, v16);
        goto LABEL_15;
      }
    }
    else if (!*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_28;
    }
    if ((v16 & 0xC000000000000001) != 0) {
      goto LABEL_29;
    }
    if (!*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_31;
    }
    long long v17 = *(id *)(v16 + 32);
LABEL_15:
    long long v10 = v17;
    swift_bridgeObjectRelease();
  }
  if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v13 = *(id *)(v12 + 32);
    goto LABEL_9;
  }
  __break(1u);
LABEL_31:
  __break(1u);
}

uint64_t sub_1B083A1C4()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B083A1D4()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B083A1E4()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1B083A1F4(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned char *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  v28.size.height = a8;
  v28.size.width = a7;
  v28.origin.y = a6;
  v28.origin.x = a5;
  if (CGRectGetHeight(v28) != 0.0)
  {
    uint64_t v24 = (void *)(a13 + 16);
    swift_beginAccess();
    if (*v24 == a14)
    {
      id v25 = objc_msgSend(a16, sel_characterRangeForGlyphRange_actualGlyphRange_, a10, a11, 0);
      uint64_t v27 = v26;
      swift_beginAccess();
      *(void *)(a15 + 16) = v25;
      *(void *)(a15 + 24) = v27;
      *a12 = 1;
    }
    else
    {
      swift_beginAccess();
      if (__OFADD__(*v24, 1))
      {
        __break(1u);
      }
      else
      {
        ++*v24;
        swift_beginAccess();
        *(void *)(a17 + 16) = a10;
        *(void *)(a17 + 24) = a11;
        *(unsigned char *)(a17 + 32) = 0;
      }
    }
  }
}

uint64_t sub_1B083A320()
{
  swift_release();
  swift_release();

  swift_release();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_1B083A370(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, double a5, double a6, double a7, double a8, CGFloat a9, CGFloat a10, CGFloat a11, CGFloat a12)
{
  sub_1B083A1F4(a5, a6, a7, a8, a9, a10, a11, a12, a1, a2, a3, a4, *(void *)(v12 + 16), *(void *)(v12 + 24), *(void *)(v12 + 32), *(void **)(v12 + 40), *(void *)(v12 + 48));
}

void sub_1B083A3A0(uint64_t a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  id v19 = *(void (**)(double, double, double, double, double, double, double, double))(a1 + 32);
  swift_retain();
  id v20 = a2;
  v19(a3, a4, a5, a6, a7, a8, a9, a10);
  swift_release();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t sub_1B083A494(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a4;
  long long v10 = a5;
  id v11 = a1;
  NSTextStorage.juWritingDirectionOfLine(_:layoutManager:textContainer:)(a3, a4, a5);
  uint64_t v13 = v12;

  return v13;
}

void *AppStore.FourLineTextLayout.init(primaryText:middleStationaryText:secondaryText:primaryFirstLineSpace:primarySecondLineSpace:middleStationaryLineSpace:secondaryFirstLineSpace:secondarySecondLineSpace:numberOfLines:)@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, long long *a4@<X3>, long long *a5@<X4>, long long *a6@<X5>, long long *a7@<X6>, long long *a8@<X7>, uint64_t *a9@<X8>, uint64_t a10)
{
  sub_1B07BA8FC(a1, (uint64_t)v20);
  sub_1B083A60C(a2, (uint64_t)&v20[5]);
  sub_1B07BA8FC(a3, (uint64_t)&v20[10]);
  sub_1B07BA8FC(a4, (uint64_t)&v20[15]);
  sub_1B07BA8FC(a5, (uint64_t)&v20[20]);
  sub_1B07BA8FC(a6, (uint64_t)&v20[25]);
  sub_1B07BA8FC(a7, (uint64_t)&v20[30]);
  sub_1B07BA8FC(a8, (uint64_t)&v20[35]);
  v20[40] = a10;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3BA80);
  uint64_t v18 = swift_allocObject();
  uint64_t result = memcpy((void *)(v18 + 16), v20, 0x148uLL);
  *a9 = v18;
  return result;
}

uint64_t sub_1B083A60C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BA78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t AppStore.FourLineTextLayout.primaryText.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  return sub_1B07BBD78(v3, a1);
}

uint64_t AppStore.FourLineTextLayout.primaryText.setter(uint64_t *a1)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B083A7A8(v3, (uint64_t)__src);
  __swift_assign_boxed_opaque_existential_1(__src, a1);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v4 = *v1 + 16;
    swift_beginAccess();
    sub_1B083A7E0((uint64_t)__src, v4);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3BA80);
    uint64_t v5 = swift_allocObject();
    memcpy((void *)(v5 + 16), __src, 0x148uLL);
    swift_release();
    *uint64_t v1 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1B083A7A8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1B083A7E0(uint64_t a1, uint64_t a2)
{
  return a2;
}

void (*AppStore.FourLineTextLayout.primaryText.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[13] = v1;
  uint64_t v4 = *v1 + 16;
  swift_beginAccess();
  sub_1B07BBD78(v4, (uint64_t)v3);
  return sub_1B083A898;
}

void sub_1B083A898(uint64_t *a1, char a2)
{
}

uint64_t AppStore.FourLineTextLayout.middleStationaryText.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  return sub_1B083A8FC(v3 + 56, a1);
}

uint64_t sub_1B083A8FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BA78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t AppStore.FourLineTextLayout.middleStationaryText.setter(uint64_t a1)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B083A7A8(v3, (uint64_t)__src);
  sub_1B083AA54(a1, (uint64_t)&__src[40]);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v4 = *v1 + 16;
    swift_beginAccess();
    sub_1B083A7E0((uint64_t)__src, v4);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3BA80);
    uint64_t v5 = swift_allocObject();
    memcpy((void *)(v5 + 16), __src, 0x148uLL);
    swift_release();
    *uint64_t v1 = v5;
  }
  return sub_1B083AABC(a1);
}

uint64_t sub_1B083AA54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BA78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B083AABC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BA78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void (*AppStore.FourLineTextLayout.middleStationaryText.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[13] = v1;
  uint64_t v4 = *v1;
  swift_beginAccess();
  sub_1B083A8FC(v4 + 56, (uint64_t)v3);
  return sub_1B083AB98;
}

void sub_1B083AB98(uint64_t *a1, char a2)
{
  uint64_t v2 = (void *)*a1;
  if (a2)
  {
    sub_1B083A8FC(*a1, (uint64_t)v2 + 40);
    AppStore.FourLineTextLayout.middleStationaryText.setter((uint64_t)v2 + 40);
    sub_1B083AABC((uint64_t)v2);
  }
  else
  {
    AppStore.FourLineTextLayout.middleStationaryText.setter(*a1);
  }

  free(v2);
}

uint64_t AppStore.FourLineTextLayout.secondaryText.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  return sub_1B07BBD78(v3 + 96, a1);
}

uint64_t AppStore.FourLineTextLayout.secondaryText.setter(uint64_t *a1)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B083A7A8(v3, (uint64_t)__src);
  __swift_assign_boxed_opaque_existential_1(&__src[10], a1);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v4 = *v1 + 16;
    swift_beginAccess();
    sub_1B083A7E0((uint64_t)__src, v4);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3BA80);
    uint64_t v5 = swift_allocObject();
    memcpy((void *)(v5 + 16), __src, 0x148uLL);
    swift_release();
    *uint64_t v1 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void (*AppStore.FourLineTextLayout.secondaryText.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[13] = v1;
  uint64_t v4 = *v1;
  swift_beginAccess();
  sub_1B07BBD78(v4 + 96, (uint64_t)v3);
  return sub_1B083ADC4;
}

void sub_1B083ADC4(uint64_t *a1, char a2)
{
}

void sub_1B083ADDC(uint64_t *a1, char a2, void (*a3)(char *))
{
  uint64_t v4 = (char *)*a1;
  if (a2)
  {
    sub_1B07BBD78(*a1, (uint64_t)(v4 + 40));
    a3(v4 + 40);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    a3((char *)*a1);
  }

  free(v4);
}

uint64_t AppStore.FourLineTextLayout.primaryFirstLineSpace.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  return sub_1B07BBD78(v3 + 136, a1);
}

uint64_t AppStore.FourLineTextLayout.primaryFirstLineSpace.setter(uint64_t *a1)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B083A7A8(v3, (uint64_t)__src);
  __swift_assign_boxed_opaque_existential_1(&__src[15], a1);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v4 = *v1 + 16;
    swift_beginAccess();
    sub_1B083A7E0((uint64_t)__src, v4);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3BA80);
    uint64_t v5 = swift_allocObject();
    memcpy((void *)(v5 + 16), __src, 0x148uLL);
    swift_release();
    *uint64_t v1 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void (*AppStore.FourLineTextLayout.primaryFirstLineSpace.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[13] = v1;
  uint64_t v4 = *v1;
  swift_beginAccess();
  sub_1B07BBD78(v4 + 136, (uint64_t)v3);
  return sub_1B083B014;
}

void sub_1B083B014(uint64_t *a1, char a2)
{
}

uint64_t AppStore.FourLineTextLayout.primarySecondLineSpace.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  return sub_1B07BBD78(v3 + 176, a1);
}

uint64_t AppStore.FourLineTextLayout.primarySecondLineSpace.setter(uint64_t *a1)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B083A7A8(v3, (uint64_t)__src);
  __swift_assign_boxed_opaque_existential_1(&__src[20], a1);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v4 = *v1 + 16;
    swift_beginAccess();
    sub_1B083A7E0((uint64_t)__src, v4);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3BA80);
    uint64_t v5 = swift_allocObject();
    memcpy((void *)(v5 + 16), __src, 0x148uLL);
    swift_release();
    *uint64_t v1 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void (*AppStore.FourLineTextLayout.primarySecondLineSpace.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[13] = v1;
  uint64_t v4 = *v1;
  swift_beginAccess();
  sub_1B07BBD78(v4 + 176, (uint64_t)v3);
  return sub_1B083B1E4;
}

void sub_1B083B1E4(uint64_t *a1, char a2)
{
}

uint64_t AppStore.FourLineTextLayout.middleStationaryLineSpace.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  return sub_1B07BBD78(v3 + 216, a1);
}

uint64_t AppStore.FourLineTextLayout.middleStationaryLineSpace.setter(uint64_t *a1)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B083A7A8(v3, (uint64_t)__src);
  __swift_assign_boxed_opaque_existential_1(&__src[25], a1);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v4 = *v1 + 16;
    swift_beginAccess();
    sub_1B083A7E0((uint64_t)__src, v4);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3BA80);
    uint64_t v5 = swift_allocObject();
    memcpy((void *)(v5 + 16), __src, 0x148uLL);
    swift_release();
    *uint64_t v1 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void (*AppStore.FourLineTextLayout.middleStationaryLineSpace.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[13] = v1;
  uint64_t v4 = *v1;
  swift_beginAccess();
  sub_1B07BBD78(v4 + 216, (uint64_t)v3);
  return sub_1B083B3B4;
}

void sub_1B083B3B4(uint64_t *a1, char a2)
{
}

void (*AppStore.FourLineTextLayout.secondaryFirstLineSpace.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[13] = v1;
  uint64_t v4 = *v1;
  swift_beginAccess();
  sub_1B07BBD78(v4 + 256, (uint64_t)v3);
  return sub_1B083B450;
}

void sub_1B083B450(uint64_t *a1, char a2)
{
}

uint64_t _s5JetUI8AppStoreO18FourLineTextLayoutV014secondaryFirstF5SpaceAA12AnyDimension_pvg_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  return sub_1B07BBD78(v3 + 256, a1);
}

uint64_t _s5JetUI8AppStoreO18FourLineTextLayoutV014secondaryFirstF5SpaceAA12AnyDimension_pvs_0(uint64_t *a1)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B083A7A8(v3, (uint64_t)__src);
  __swift_assign_boxed_opaque_existential_1(&__src[30], a1);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v4 = *v1 + 16;
    swift_beginAccess();
    sub_1B083A7E0((uint64_t)__src, v4);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3BA80);
    uint64_t v5 = swift_allocObject();
    memcpy((void *)(v5 + 16), __src, 0x148uLL);
    swift_release();
    *uint64_t v1 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void (*AppStore.FourLineTextLayout.secondarySecondLineSpace.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[13] = v1;
  uint64_t v4 = *v1;
  swift_beginAccess();
  sub_1B07BBD78(v4 + 256, (uint64_t)v3);
  return sub_1B083B628;
}

void sub_1B083B628(uint64_t *a1, char a2)
{
}

uint64_t AppStore.FourLineTextLayout.numberOfLines.getter()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  return *(void *)(v1 + 336);
}

uint64_t AppStore.FourLineTextLayout.numberOfLines.setter(uint64_t a1)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B083A7A8(v3, (uint64_t)__src);
  __src[40] = a1;
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v4 = *v1 + 16;
    swift_beginAccess();
    sub_1B083A7E0((uint64_t)__src, v4);
    return swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3BA80);
    uint64_t v6 = swift_allocObject();
    memcpy((void *)(v6 + 16), __src, 0x148uLL);
    uint64_t result = swift_release();
    *uint64_t v1 = v6;
  }
  return result;
}

void (*AppStore.FourLineTextLayout.numberOfLines.modify(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  uint64_t v4 = *v1;
  swift_beginAccess();
  v3[3] = *(void *)(v4 + 336);
  return sub_1B083B7CC;
}

void sub_1B083B7CC(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  AppStore.FourLineTextLayout.numberOfLines.setter(*(void *)(*(void *)a1 + 24));

  free(v1);
}

double AppStore.FourLineTextLayout.measurements(fitting:in:)(uint64_t a1, double a2)
{
  uint64_t v5 = sub_1B086A868();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v23[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  swift_beginAccess();
  sub_1B07BBD78(v9 + 136, (uint64_t)v26);
  uint64_t v10 = v27;
  uint64_t v11 = v28;
  __swift_project_boxed_opaque_existential_1(v26, v27);
  sub_1B07B76D8((uint64_t)v8);
  AnyDimension.value(in:rounded:)(a1, (uint64_t)v8, v10, v11);
  uint64_t v12 = *(void (**)(char *, uint64_t))(v6 + 8);
  v12(v8, v5);
  sub_1B07BBD78(v9 + 176, (uint64_t)v23);
  uint64_t v13 = v24;
  uint64_t v14 = v25;
  __swift_project_boxed_opaque_existential_1(v23, v24);
  sub_1B07B76D8((uint64_t)v8);
  AnyDimension.value(in:rounded:)(a1, (uint64_t)v8, v13, v14);
  v12(v8, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  sub_1B07BBD78(v9 + 256, (uint64_t)v26);
  uint64_t v15 = v27;
  uint64_t v16 = v28;
  __swift_project_boxed_opaque_existential_1(v26, v27);
  sub_1B07B76D8((uint64_t)v8);
  AnyDimension.value(in:rounded:)(a1, (uint64_t)v8, v15, v16);
  v12(v8, v5);
  sub_1B07BBD78(v9 + 256, (uint64_t)v23);
  uint64_t v17 = v24;
  uint64_t v18 = v25;
  __swift_project_boxed_opaque_existential_1(v23, v24);
  sub_1B07B76D8((uint64_t)v8);
  AnyDimension.value(in:rounded:)(a1, (uint64_t)v8, v17, v18);
  v12(v8, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  sub_1B07BBD78(v9 + 136, (uint64_t)v26);
  uint64_t v19 = v27;
  uint64_t v20 = v28;
  __swift_project_boxed_opaque_existential_1(v26, v27);
  sub_1B07B76D8((uint64_t)v8);
  AnyDimension.value(in:rounded:)(a1, (uint64_t)v8, v19, v20);
  v12(v8, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  return a2;
}

double AppStore.FourLineTextLayout.placeChildren(relativeTo:in:)@<D0>(double a1@<X0>, CGFloat *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  double v133 = a1;
  CGFloat v135 = a6;
  CGFloat v134 = a5;
  uint64_t v130 = sub_1B086A868();
  uint64_t v10 = *(void *)(v130 - 8);
  MEMORY[0x1F4188790](v130);
  uint64_t v12 = (char *)&v122 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *v6;
  uint64_t v14 = *v6 + 16;
  swift_beginAccess();
  sub_1B07BBD78(v14, (uint64_t)v139);
  uint64_t v15 = v140;
  uint64_t v16 = v141;
  __swift_project_boxed_opaque_existential_1(v139, v140);
  char v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 88))(v15, v16);
  v131 = a2;
  double v129 = *(double *)&v14;
  if (v17)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
    goto LABEL_8;
  }
  sub_1B083A8FC(v13 + 56, (uint64_t)&v136);
  uint64_t v18 = v137;
  if (v137)
  {
    uint64_t v19 = v138;
    __swift_project_boxed_opaque_existential_1(&v136, v137);
    char v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 88))(v18, v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v136);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
    if (v20) {
      goto LABEL_8;
    }
  }
  else
  {
    sub_1B083AABC((uint64_t)&v136);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
  }
  sub_1B07BBD78(v13 + 96, (uint64_t)v139);
  uint64_t v21 = v140;
  uint64_t v22 = v141;
  __swift_project_boxed_opaque_existential_1(v139, v140);
  char v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 88))(v21, v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
  if (v23)
  {
LABEL_8:
    sub_1B07BBD78(v14, (uint64_t)v139);
    uint64_t v24 = v140;
    uint64_t v25 = v141;
    __swift_project_boxed_opaque_existential_1(v139, v140);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 24))(1, v24, v25);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
    sub_1B07BBD78(v13 + 96, (uint64_t)v139);
    uint64_t v26 = v140;
    uint64_t v27 = v141;
    __swift_project_boxed_opaque_existential_1(v139, v140);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 24))(1, v26, v27);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
    sub_1B07BBD78(v14, (uint64_t)v139);
    uint64_t v28 = v140;
    uint64_t v29 = v141;
    __swift_project_boxed_opaque_existential_1(v139, v140);
    unint64_t v30 = *(void *)&v134;
    unint64_t v31 = *(void *)&v135;
    double v32 = v133;
    (*(void (**)(double, uint64_t, CGFloat, CGFloat))(*(void *)(*(void *)(v29 + 8) + 8) + 8))(COERCE_DOUBLE(*(void *)&v133), v28, v134, v135);
    double v34 = v33;
    double v132 = v35;
    CGFloat v126 = v36;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
    sub_1B07BBD78(v13 + 96, (uint64_t)v139);
    uint64_t v37 = v140;
    uint64_t v38 = v141;
    __swift_project_boxed_opaque_existential_1(v139, v140);
    v39.n128_u64[0] = v30;
    v40.n128_u64[0] = v31;
    (*(void (**)(double, uint64_t, __n128, __n128))(*(void *)(*(void *)(v38 + 8) + 8) + 8))(COERCE_DOUBLE(*(void *)&v32), v37, v39, v40);
    goto LABEL_9;
  }
  sub_1B07BBD78(v14, (uint64_t)v139);
  uint64_t v103 = v140;
  uint64_t v104 = v141;
  __swift_project_boxed_opaque_existential_1(v139, v140);
  (*(void (**)(void, uint64_t, uint64_t))(v104 + 24))(*(void *)(v13 + 336), v103, v104);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
  sub_1B07BBD78(v14, (uint64_t)v139);
  uint64_t v106 = v140;
  uint64_t v105 = v141;
  __swift_project_boxed_opaque_existential_1(v139, v140);
  double v107 = (*(double (**)(double, uint64_t, CGFloat, CGFloat))(*(void *)(*(void *)(v105 + 8) + 8) + 8))(COERCE_DOUBLE(*(void *)&v133), v106, v134, v135);
  double v34 = v108;
  double v110 = v109;
  double v112 = v111;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
  sub_1B07BBD78(v14, (uint64_t)v139);
  __swift_project_boxed_opaque_existential_1(v139, v140);
  v158.var0 = v107;
  v158.var1 = v34;
  double v132 = v110;
  v158.var2 = v110;
  v158.var3 = v112;
  Swift::Int v113 = LayoutTextView.estimatedNumberOfLines(from:)(v158);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
  sub_1B07BBD78(v13 + 96, (uint64_t)v139);
  uint64_t v114 = v140;
  uint64_t v115 = v141;
  __swift_project_boxed_opaque_existential_1(v139, v140);
  CGFloat v126 = v112;
  if (v113 >= 2 && (sub_1B083A8FC(v13 + 56, (uint64_t)&v136), uint64_t v116 = v137, sub_1B083AABC((uint64_t)&v136), v116)) {
    uint64_t v117 = 1;
  }
  else {
    uint64_t v117 = *(void *)(v13 + 336);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v115 + 24))(v117, v114, v115);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
  sub_1B07BBD78(v13 + 96, (uint64_t)v139);
  uint64_t v118 = v140;
  uint64_t v119 = v141;
  __swift_project_boxed_opaque_existential_1(v139, v140);
  v120.n128_f64[0] = v134;
  v121.n128_f64[0] = v135;
  (*(void (**)(double, uint64_t, __n128, __n128))(*(void *)(*(void *)(v119 + 8) + 8) + 8))(COERCE_DOUBLE(*(void *)&v133), v118, v120, v121);
LABEL_9:
  double v127 = v41;
  CGFloat v125 = v42;
  double v128 = v43;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
  sub_1B083A8FC(v13 + 56, (uint64_t)v139);
  uint64_t v44 = v140;
  if (v140)
  {
    uint64_t v45 = v141;
    __swift_project_boxed_opaque_existential_1(v139, v140);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 24))(1, v44, v45);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
  }
  else
  {
    sub_1B083AABC((uint64_t)v139);
  }
  sub_1B07BBD78(v13 + 136, (uint64_t)v139);
  uint64_t v46 = v140;
  uint64_t v47 = v141;
  __swift_project_boxed_opaque_existential_1(v139, v140);
  sub_1B07B76D8((uint64_t)v12);
  uint64_t v48 = *(void *)&v133;
  AnyDimension.value(in:rounded:)(*(uint64_t *)&v133, (uint64_t)v12, v46, v47);
  double v50 = v49;
  unsigned int v51 = *(void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v52 = v130;
  v51(v12, v130);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
  sub_1B07BBD78(v13 + 216, (uint64_t)v139);
  uint64_t v53 = v140;
  uint64_t v54 = v141;
  __swift_project_boxed_opaque_existential_1(v139, v140);
  sub_1B07B76D8((uint64_t)v12);
  AnyDimension.value(in:rounded:)(v48, (uint64_t)v12, v53, v54);
  double v122 = v55;
  v51(v12, v52);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
  sub_1B07BBD78(v13 + 256, (uint64_t)v139);
  uint64_t v56 = v140;
  uint64_t v57 = v141;
  __swift_project_boxed_opaque_existential_1(v139, v140);
  sub_1B07B76D8((uint64_t)v12);
  AnyDimension.value(in:rounded:)(v48, (uint64_t)v12, v56, v57);
  double v123 = v58;
  v51(v12, v52);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
  v142.origin.x = a3;
  v142.origin.y = a4;
  CGFloat v59 = v134;
  v142.size.width = v134;
  CGFloat v60 = v135;
  v142.size.height = v135;
  double MinX = CGRectGetMinX(v142);
  v143.origin.x = a3;
  v143.origin.y = a4;
  v143.size.width = v59;
  v143.size.height = v60;
  CGFloat v62 = v50 - v132 + CGRectGetMinY(v143);
  v144.origin.x = a3;
  v144.origin.y = a4;
  v144.size.width = v59;
  v144.size.height = v60;
  double Width = CGRectGetWidth(v144);
  sub_1B07BBD78(*(uint64_t *)&v129, (uint64_t)v139);
  uint64_t v65 = v140;
  uint64_t v64 = v141;
  __swift_project_boxed_opaque_existential_1(v139, v140);
  (*(void (**)(uint64_t, double, CGFloat, double, double))(*(void *)(v64 + 8) + 24))(v65, MinX, v62, Width, v34);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
  uint64_t v130 = *(void *)&MinX;
  v145.origin.x = MinX;
  double v129 = v62;
  v145.origin.y = v62;
  CGFloat v124 = Width;
  v145.size.width = Width;
  v145.size.height = v34;
  double MaxY = CGRectGetMaxY(v145);
  sub_1B083A8FC(v13 + 56, (uint64_t)v139);
  uint64_t v67 = v140;
  if (v140)
  {
    uint64_t v68 = v141;
    __swift_project_boxed_opaque_existential_1(v139, v140);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v68 + 24))(1, v67, v68);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
  }
  else
  {
    sub_1B083AABC((uint64_t)v139);
  }
  v69 = v131;
  double v70 = MaxY - v126;
  sub_1B083A8FC(v13 + 56, (uint64_t)&v136);
  if (v137)
  {
    sub_1B07BA8FC(&v136, (uint64_t)v139);
    uint64_t v71 = v140;
    uint64_t v72 = v141;
    __swift_project_boxed_opaque_existential_1(v139, v140);
    v73 = *(void (**)(void, uint64_t, double, double))(*(void *)(*(void *)(v72 + 8) + 8) + 8);
    CGFloat v126 = v34;
    CGFloat v74 = v134;
    CGFloat v75 = v135;
    v73(*(void *)&v133, v71, v134, v135);
    double v77 = v76;
    double v79 = v78;
    double v133 = v80;
    v146.origin.x = a3;
    v146.origin.y = a4;
    v146.size.width = v74;
    v146.size.height = v75;
    double v81 = a4;
    double v82 = CGRectGetMinX(v146);
    CGFloat v83 = v70 + v122 - v79;
    v147.origin.x = a3;
    v147.origin.y = v81;
    v147.size.width = v74;
    double v34 = v126;
    v147.size.height = v75;
    double v84 = CGRectGetWidth(v147);
    uint64_t v86 = v140;
    uint64_t v85 = v141;
    __swift_project_boxed_opaque_existential_1(v139, v140);
    (*(void (**)(uint64_t, double, CGFloat, double, double))(*(void *)(v85 + 8) + 24))(v86, v82, v83, v84, v77);
    v148.origin.x = v82;
    a4 = v81;
    v148.origin.y = v83;
    v148.size.width = v84;
    v148.size.height = v77;
    double v70 = CGRectGetMaxY(v148) - v133;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
  }
  else
  {
    sub_1B083AABC((uint64_t)&v136);
  }
  v149.origin.x = a3;
  v149.origin.y = a4;
  CGFloat v87 = v134;
  v149.size.width = v134;
  CGFloat v88 = v135;
  v149.size.height = v135;
  double v89 = CGRectGetMinX(v149);
  CGFloat v126 = v89;
  CGFloat v90 = v123 - v125 + v70;
  CGFloat v125 = v90;
  v150.origin.x = a3;
  v150.origin.y = a4;
  v150.size.width = v87;
  v150.size.height = v88;
  double v91 = CGRectGetWidth(v150);
  double v133 = v91;
  sub_1B07BBD78(v13 + 96, (uint64_t)v139);
  uint64_t v93 = v140;
  uint64_t v92 = v141;
  __swift_project_boxed_opaque_existential_1(v139, v140);
  double v94 = v89;
  CGFloat v95 = v127;
  (*(void (**)(uint64_t, double, CGFloat, double, double))(*(void *)(v92 + 8) + 24))(v93, v94, v90, v91, v127);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
  *(void *)&v151.origin.x = v130;
  v151.origin.y = v129;
  v151.size.width = v124;
  v151.size.height = v34;
  double MinY = CGRectGetMinY(v151);
  v152.origin.x = a3;
  v152.origin.y = a4;
  v152.size.width = v87;
  v152.size.height = v88;
  double v132 = v132 + MinY - CGRectGetMinY(v152);
  v153.origin.x = a3;
  v153.origin.y = a4;
  v153.size.width = v87;
  v153.size.height = v88;
  CGFloat v97 = CGRectGetMinX(v153);
  v154.origin.x = a3;
  v154.origin.y = a4;
  v154.size.width = v87;
  v154.size.height = v88;
  CGFloat v98 = CGRectGetMinY(v154);
  v155.origin.x = a3;
  v155.origin.y = a4;
  v155.size.width = v87;
  v155.size.height = v88;
  CGFloat v99 = CGRectGetWidth(v155);
  v156.origin.x = v126;
  v156.origin.y = v125;
  v156.size.width = v133;
  v156.size.height = v95;
  double v100 = CGRectGetMaxY(v156);
  v157.origin.x = a3;
  v157.origin.y = a4;
  v157.size.width = v87;
  v157.size.height = v88;
  CGFloat v101 = CGRectGetMinY(v157);
  CGFloat *v69 = v97;
  v69[1] = v98;
  v69[2] = v99;
  v69[3] = v100 - v101;
  double result = v128;
  v69[4] = v132;
  v69[5] = result;
  return result;
}

double sub_1B083C6D4(uint64_t a1, double a2)
{
  return AppStore.FourLineTextLayout.measurements(fitting:in:)(a1, a2);
}

uint64_t sub_1B083C6F0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + 16;
  swift_beginAccess();
  return sub_1B07BBD78(v3, a2);
}

uint64_t sub_1B083C740(uint64_t a1)
{
  sub_1B07BBD78(a1, (uint64_t)v2);
  return AppStore.FourLineTextLayout.primaryText.setter(v2);
}

uint64_t sub_1B083C778@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  return sub_1B083A8FC(v3 + 56, a2);
}

uint64_t sub_1B083C7C4(uint64_t a1)
{
  sub_1B083A8FC(a1, (uint64_t)v2);
  return AppStore.FourLineTextLayout.middleStationaryText.setter((uint64_t)v2);
}

uint64_t sub_1B083C7FC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  return sub_1B07BBD78(v3 + 96, a2);
}

uint64_t sub_1B083C848(uint64_t a1)
{
  sub_1B07BBD78(a1, (uint64_t)v2);
  return AppStore.FourLineTextLayout.secondaryText.setter(v2);
}

uint64_t sub_1B083C880@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  return sub_1B07BBD78(v3 + 136, a2);
}

uint64_t sub_1B083C8CC(uint64_t a1)
{
  sub_1B07BBD78(a1, (uint64_t)v2);
  return AppStore.FourLineTextLayout.primaryFirstLineSpace.setter(v2);
}

uint64_t sub_1B083C904@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  return sub_1B07BBD78(v3 + 176, a2);
}

uint64_t sub_1B083C950(uint64_t a1)
{
  sub_1B07BBD78(a1, (uint64_t)v2);
  return AppStore.FourLineTextLayout.primarySecondLineSpace.setter(v2);
}

uint64_t sub_1B083C988@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  return sub_1B07BBD78(v3 + 216, a2);
}

uint64_t sub_1B083C9D4(uint64_t a1)
{
  sub_1B07BBD78(a1, (uint64_t)v2);
  return AppStore.FourLineTextLayout.middleStationaryLineSpace.setter(v2);
}

uint64_t sub_1B083CA10(uint64_t a1)
{
  sub_1B07BBD78(a1, (uint64_t)v2);
  return AppStore.FourLineTextLayout.secondaryFirstLineSpace.setter(v2);
}

uint64_t keypath_get_16Tm@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  return sub_1B07BBD78(v3 + 256, a2);
}

uint64_t sub_1B083CA98@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(void *)(v3 + 336);
  return result;
}

uint64_t sub_1B083CAE0(uint64_t *a1)
{
  return AppStore.FourLineTextLayout.numberOfLines.setter(*a1);
}

ValueMetadata *type metadata accessor for AppStore.FourLineTextLayout()
{
  return &type metadata for AppStore.FourLineTextLayout;
}

uint64_t _s18FourLineTextLayoutV7StorageVwxx(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  if (*(void *)(a1 + 64)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  }
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  __swift_destroy_boxed_opaque_existential_1(a1 + 160);
  __swift_destroy_boxed_opaque_existential_1(a1 + 200);
  __swift_destroy_boxed_opaque_existential_1(a1 + 240);

  return __swift_destroy_boxed_opaque_existential_1(a1 + 280);
}

uint64_t _s18FourLineTextLayoutV7StorageVwcp(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = (_OWORD *)(a1 + 40);
  uint64_t v6 = (_OWORD *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 64);
  if (v7)
  {
    uint64_t v8 = *(void *)(a2 + 72);
    *(void *)(a1 + 64) = v7;
    *(void *)(a1 + 72) = v8;
    (**(void (***)(_OWORD *, _OWORD *))(v7 - 8))(v5, v6);
  }
  else
  {
    long long v9 = *(_OWORD *)(a2 + 56);
    *uint64_t v5 = *v6;
    *(_OWORD *)(a1 + 56) = v9;
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
  }
  long long v10 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 80, a2 + 80);
  long long v11 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 144) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 120, a2 + 120);
  long long v12 = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 184) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 160, a2 + 160);
  long long v13 = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 224) = v13;
  (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 200, a2 + 200);
  uint64_t v14 = *(void *)(a2 + 264);
  uint64_t v15 = *(void *)(a2 + 272);
  *(void *)(a1 + 264) = v14;
  *(void *)(a1 + 272) = v15;
  (**(void (***)(uint64_t, uint64_t))(v14 - 8))(a1 + 240, a2 + 240);
  long long v16 = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 304) = v16;
  (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 280, a2 + 280);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  return a1;
}

uint64_t _s18FourLineTextLayoutV7StorageVwca(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  uint64_t v4 = *(void *)(a2 + 64);
  if (!*(void *)(a1 + 64))
  {
    if (v4)
    {
      *(void *)(a1 + 64) = v4;
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 40, a2 + 40);
      goto LABEL_8;
    }
LABEL_7:
    long long v5 = *(_OWORD *)(a2 + 40);
    long long v6 = *(_OWORD *)(a2 + 56);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(_OWORD *)(a1 + 40) = v5;
    *(_OWORD *)(a1 + 56) = v6;
    goto LABEL_8;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 40);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)(a2 + 40));
LABEL_8:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 80), (uint64_t *)(a2 + 80));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 120), (uint64_t *)(a2 + 120));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 160), (uint64_t *)(a2 + 160));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 200), (uint64_t *)(a2 + 200));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 240), (uint64_t *)(a2 + 240));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 280), (uint64_t *)(a2 + 280));
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  return a1;
}

void *__swift_memcpy328_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x148uLL);
}

uint64_t _s18FourLineTextLayoutV7StorageVwta(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  if (*(void *)(a1 + 64)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  }
  long long v5 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v5;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v6;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  __swift_destroy_boxed_opaque_existential_1(a1 + 160);
  long long v7 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v7;
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  __swift_destroy_boxed_opaque_existential_1(a1 + 200);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  __swift_destroy_boxed_opaque_existential_1(a1 + 240);
  long long v8 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v8;
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  __swift_destroy_boxed_opaque_existential_1(a1 + 280);
  long long v9 = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 296) = v9;
  uint64_t v10 = *(void *)(a2 + 320);
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  *(void *)(a1 + 320) = v10;
  return a1;
}

uint64_t _s18FourLineTextLayoutV7StorageVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 328)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s18FourLineTextLayoutV7StorageVwst(uint64_t result, int a2, int a3)
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
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 328) = 1;
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
    *(unsigned char *)(result + 328) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s18FourLineTextLayoutV7StorageVMa()
{
  return &_s18FourLineTextLayoutV7StorageVN;
}

uint64_t Center.init(_:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  Measurable.placeable.getter(v4, v5, a2);
  a2[5] = 0;

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t Center.init(_:filling:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v6);
  Measurable.placeable.getter(v6, v7, a3);
  a3[5] = a2;

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

UIFontDescriptor_optional __swiftcall UIFontDescriptor.withCompatibleSymbolicTraits(_:)(UIFontDescriptorSymbolicTraits a1)
{
  id v2 = objc_msgSend(v1, sel_fontDescriptorWithSymbolicTraits_, *(void *)&a1);

  uint64_t v3 = (objc_class *)v2;
  result.value.super.isa = v3;
  result.is_nil = v4;
  return result;
}

__n128 AppStore.ThreeLineTextLayout.init(primaryText:secondaryText:primaryRegularSpace:primaryCompressedSpace:secondarySpace:numberOfLines:)@<Q0>(long long *a1@<X0>, long long *a2@<X1>, long long *a3@<X2>, long long *a4@<X3>, long long *a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  sub_1B07BA8FC(a1, (uint64_t)v20);
  sub_1B07BA8FC(a2, (uint64_t)v21 + 8);
  sub_1B07BA8FC(a3, (uint64_t)v22);
  sub_1B07BA8FC(a4, (uint64_t)v23 + 8);
  sub_1B07BA8FC(a5, (uint64_t)v24);
  *((void *)&v25 + 1) = a6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595818);
  uint64_t v13 = swift_allocObject();
  long long v14 = v24[1];
  *(_OWORD *)(v13 + 176) = v24[0];
  *(_OWORD *)(v13 + 192) = v14;
  *(_OWORD *)(v13 + 208) = v25;
  long long v15 = v23[0];
  *(_OWORD *)(v13 + 112) = v22[1];
  *(_OWORD *)(v13 + 128) = v15;
  long long v16 = v23[2];
  *(_OWORD *)(v13 + 144) = v23[1];
  *(_OWORD *)(v13 + 160) = v16;
  long long v17 = v21[1];
  *(_OWORD *)(v13 + 48) = v21[0];
  *(_OWORD *)(v13 + 64) = v17;
  long long v18 = v22[0];
  *(_OWORD *)(v13 + 80) = v21[2];
  *(_OWORD *)(v13 + 96) = v18;
  __n128 result = (__n128)v20[1];
  *(_OWORD *)(v13 + 16) = v20[0];
  *(__n128 *)(v13 + 32) = result;
  *a7 = v13;
  return result;
}

uint64_t AppStore.ThreeLineTextLayout.primaryText.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  return sub_1B07BBD78(v3, a1);
}

uint64_t AppStore.ThreeLineTextLayout.primaryText.setter(uint64_t *a1)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B083D484(v3, (uint64_t)v13);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v13, a1);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v4 = *v1 + 16;
    swift_beginAccess();
    sub_1B083D4BC((uint64_t)v13, v4);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595818);
    uint64_t v5 = (_OWORD *)swift_allocObject();
    long long v6 = v13[11];
    v5[11] = v13[10];
    v5[12] = v6;
    v5[13] = v13[12];
    long long v7 = v13[7];
    v5[7] = v13[6];
    v5[8] = v7;
    long long v8 = v13[9];
    v5[9] = v13[8];
    v5[10] = v8;
    long long v9 = v13[3];
    v5[3] = v13[2];
    v5[4] = v9;
    long long v10 = v13[5];
    v5[5] = v13[4];
    v5[6] = v10;
    long long v11 = v13[1];
    v5[1] = v13[0];
    v5[2] = v11;
    swift_release();
    *uint64_t v1 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1B083D484(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1B083D4BC(uint64_t a1, uint64_t a2)
{
  return a2;
}

void (*AppStore.ThreeLineTextLayout.primaryText.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[13] = v1;
  uint64_t v4 = *v1 + 16;
  swift_beginAccess();
  sub_1B07BBD78(v4, (uint64_t)v3);
  return sub_1B083D574;
}

void sub_1B083D574(uint64_t *a1, char a2)
{
}

uint64_t AppStore.ThreeLineTextLayout.secondaryText.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  return sub_1B07BBD78(v3 + 56, a1);
}

uint64_t AppStore.ThreeLineTextLayout.secondaryText.setter(uint64_t *a1)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B083D484(v3, (uint64_t)v13);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v14 + 1, a1);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v4 = *v1 + 16;
    swift_beginAccess();
    sub_1B083D4BC((uint64_t)v13, v4);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595818);
    uint64_t v5 = (_OWORD *)swift_allocObject();
    long long v6 = v14[9];
    v5[11] = v14[8];
    v5[12] = v6;
    v5[13] = v14[10];
    long long v7 = v14[5];
    v5[7] = v14[4];
    v5[8] = v7;
    long long v8 = v14[7];
    v5[9] = v14[6];
    v5[10] = v8;
    long long v9 = v14[1];
    v5[3] = v14[0];
    v5[4] = v9;
    long long v10 = v14[3];
    v5[5] = v14[2];
    v5[6] = v10;
    long long v11 = v13[1];
    v5[1] = v13[0];
    v5[2] = v11;
    swift_release();
    *uint64_t v1 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void (*AppStore.ThreeLineTextLayout.secondaryText.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[13] = v1;
  uint64_t v4 = *v1;
  swift_beginAccess();
  sub_1B07BBD78(v4 + 56, (uint64_t)v3);
  return sub_1B083D76C;
}

void sub_1B083D76C(uint64_t *a1, char a2)
{
}

void sub_1B083D784(uint64_t *a1, char a2, void (*a3)(char *))
{
  uint64_t v4 = (char *)*a1;
  if (a2)
  {
    sub_1B07BBD78(*a1, (uint64_t)(v4 + 40));
    a3(v4 + 40);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    a3((char *)*a1);
  }

  free(v4);
}

uint64_t AppStore.ThreeLineTextLayout.primaryRegularSpace.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  return sub_1B07BBD78(v3 + 96, a1);
}

uint64_t AppStore.ThreeLineTextLayout.primaryRegularSpace.setter(uint64_t *a1)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B083D484(v3, (uint64_t)v13);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v14, a1);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v4 = *v1 + 16;
    swift_beginAccess();
    sub_1B083D4BC((uint64_t)v13, v4);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595818);
    uint64_t v5 = (_OWORD *)swift_allocObject();
    long long v6 = v14[6];
    v5[11] = v14[5];
    v5[12] = v6;
    v5[13] = v14[7];
    long long v7 = v14[2];
    v5[7] = v14[1];
    v5[8] = v7;
    long long v8 = v14[4];
    v5[9] = v14[3];
    v5[10] = v8;
    long long v9 = v13[3];
    v5[3] = v13[2];
    v5[4] = v9;
    long long v10 = v14[0];
    v5[5] = v13[4];
    v5[6] = v10;
    long long v11 = v13[1];
    v5[1] = v13[0];
    v5[2] = v11;
    swift_release();
    *uint64_t v1 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void (*AppStore.ThreeLineTextLayout.primaryRegularSpace.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[13] = v1;
  uint64_t v4 = *v1;
  swift_beginAccess();
  sub_1B07BBD78(v4 + 96, (uint64_t)v3);
  return sub_1B083D9E4;
}

void sub_1B083D9E4(uint64_t *a1, char a2)
{
}

uint64_t AppStore.ThreeLineTextLayout.primaryCompressedSpace.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  return sub_1B07BBD78(v3 + 136, a1);
}

uint64_t AppStore.ThreeLineTextLayout.primaryCompressedSpace.setter(uint64_t *a1)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B083D484(v3, (uint64_t)v13);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v14 + 1, a1);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v4 = *v1 + 16;
    swift_beginAccess();
    sub_1B083D4BC((uint64_t)v13, v4);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595818);
    uint64_t v5 = (_OWORD *)swift_allocObject();
    long long v6 = v14[4];
    v5[11] = v14[3];
    v5[12] = v6;
    v5[13] = v14[5];
    long long v7 = v14[0];
    v5[7] = v13[6];
    v5[8] = v7;
    long long v8 = v14[2];
    v5[9] = v14[1];
    v5[10] = v8;
    long long v9 = v13[3];
    v5[3] = v13[2];
    v5[4] = v9;
    long long v10 = v13[5];
    v5[5] = v13[4];
    v5[6] = v10;
    long long v11 = v13[1];
    v5[1] = v13[0];
    v5[2] = v11;
    swift_release();
    *uint64_t v1 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void (*AppStore.ThreeLineTextLayout.primaryCompressedSpace.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[13] = v1;
  uint64_t v4 = *v1;
  swift_beginAccess();
  sub_1B07BBD78(v4 + 136, (uint64_t)v3);
  return sub_1B083DBDC;
}

void sub_1B083DBDC(uint64_t *a1, char a2)
{
}

uint64_t AppStore.ThreeLineTextLayout.secondarySpace.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  return sub_1B07BBD78(v3 + 176, a1);
}

uint64_t AppStore.ThreeLineTextLayout.secondarySpace.setter(uint64_t *a1)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B083D484(v3, (uint64_t)v13);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v14, a1);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v4 = *v1 + 16;
    swift_beginAccess();
    sub_1B083D4BC((uint64_t)v13, v4);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595818);
    uint64_t v5 = (_OWORD *)swift_allocObject();
    long long v6 = v14[1];
    v5[11] = v14[0];
    v5[12] = v6;
    v5[13] = v14[2];
    long long v7 = v13[7];
    v5[7] = v13[6];
    v5[8] = v7;
    long long v8 = v13[9];
    v5[9] = v13[8];
    v5[10] = v8;
    long long v9 = v13[3];
    v5[3] = v13[2];
    v5[4] = v9;
    long long v10 = v13[5];
    v5[5] = v13[4];
    v5[6] = v10;
    long long v11 = v13[1];
    v5[1] = v13[0];
    v5[2] = v11;
    swift_release();
    *uint64_t v1 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void (*AppStore.ThreeLineTextLayout.secondarySpace.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[13] = v1;
  uint64_t v4 = *v1;
  swift_beginAccess();
  sub_1B07BBD78(v4 + 176, (uint64_t)v3);
  return sub_1B083DDD4;
}

void sub_1B083DDD4(uint64_t *a1, char a2)
{
}

uint64_t AppStore.ThreeLineTextLayout.numberOfLines.getter()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  return *(void *)(v1 + 216);
}

uint64_t AppStore.ThreeLineTextLayout.numberOfLines.setter(uint64_t a1)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B083D484(v3, (uint64_t)v13);
  *((void *)&v14 + 1) = a1;
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v4 = *v1 + 16;
    swift_beginAccess();
    sub_1B083D4BC((uint64_t)v13, v4);
    return swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595818);
    long long v6 = (_OWORD *)swift_allocObject();
    long long v7 = v13[11];
    v6[11] = v13[10];
    v6[12] = v7;
    v6[13] = v14;
    long long v8 = v13[7];
    v6[7] = v13[6];
    v6[8] = v8;
    long long v9 = v13[9];
    v6[9] = v13[8];
    v6[10] = v9;
    long long v10 = v13[3];
    v6[3] = v13[2];
    v6[4] = v10;
    long long v11 = v13[5];
    v6[5] = v13[4];
    v6[6] = v11;
    long long v12 = v13[1];
    v6[1] = v13[0];
    v6[2] = v12;
    uint64_t result = swift_release();
    *uint64_t v1 = v6;
  }
  return result;
}

void (*AppStore.ThreeLineTextLayout.numberOfLines.modify(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  uint64_t v4 = *v1;
  swift_beginAccess();
  v3[3] = *(void *)(v4 + 216);
  return sub_1B083DFA0;
}

void sub_1B083DFA0(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  AppStore.ThreeLineTextLayout.numberOfLines.setter(*(void *)(*(void *)a1 + 24));

  free(v1);
}

double AppStore.ThreeLineTextLayout.measurements(fitting:in:)(uint64_t a1, double a2)
{
  uint64_t v5 = sub_1B086A868();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  long long v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = *v2;
  swift_beginAccess();
  sub_1B07BBD78(v9 + 96, (uint64_t)v17);
  uint64_t v10 = v18;
  uint64_t v11 = v19;
  __swift_project_boxed_opaque_existential_1(v17, v18);
  sub_1B07B76D8((uint64_t)v8);
  AnyDimension.value(in:rounded:)(a1, (uint64_t)v8, v10, v11);
  long long v12 = *(void (**)(unsigned char *, uint64_t))(v6 + 8);
  v12(v8, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  sub_1B07BBD78(v9 + 176, (uint64_t)v17);
  uint64_t v13 = v18;
  uint64_t v14 = v19;
  __swift_project_boxed_opaque_existential_1(v17, v18);
  sub_1B07B76D8((uint64_t)v8);
  AnyDimension.value(in:rounded:)(a1, (uint64_t)v8, v13, v14);
  v12(v8, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return a2;
}

double AppStore.ThreeLineTextLayout.placeChildren(relativeTo:in:)@<D0>(void *a1@<X0>, CGFloat *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  CGFloat v164 = a6;
  CGFloat v163 = a5;
  CGFloat v161 = a4;
  CGFloat v162 = a3;
  CGRect v154 = a2;
  uint64_t v8 = sub_1B086A868();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v146 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v12 = *v6;
  uint64_t v13 = *(void *)v6 + 16;
  swift_beginAccess();
  sub_1B07BBD78(v13, (uint64_t)&v166);
  CGFloat d = v166.d;
  CGFloat tx = v166.tx;
  __swift_project_boxed_opaque_existential_1(&v166, *(uint64_t *)&v166.d);
  char v16 = (*(uint64_t (**)(CGFloat, CGFloat))(*(void *)&tx + 88))(COERCE_CGFLOAT(*(void *)&d), COERCE_CGFLOAT(*(void *)&tx));
  double v155 = v12;
  *(void *)&long long v160 = v8;
  if (v16)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v166);
LABEL_4:
    sub_1B07BBD78(v13, (uint64_t)&v166);
    CGFloat v21 = v166.d;
    CGFloat v22 = v166.tx;
    __swift_project_boxed_opaque_existential_1(&v166, *(uint64_t *)&v166.d);
    (*(void (**)(uint64_t, CGFloat, CGFloat))(*(void *)&v22 + 24))(1, COERCE_CGFLOAT(*(void *)&v21), COERCE_CGFLOAT(*(void *)&v22));
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v166);
    sub_1B07BBD78(*(void *)&v12 + 56, (uint64_t)&v166);
    CGFloat v23 = v166.d;
    CGFloat v24 = v166.tx;
    __swift_project_boxed_opaque_existential_1(&v166, *(uint64_t *)&v166.d);
    (*(void (**)(uint64_t, CGFloat, CGFloat))(*(void *)&v24 + 24))(1, COERCE_CGFLOAT(*(void *)&v23), COERCE_CGFLOAT(*(void *)&v24));
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v166);
    sub_1B07BBD78(v13, (uint64_t)&v166);
    CGFloat v25 = v166.d;
    CGFloat v26 = v166.tx;
    __swift_project_boxed_opaque_existential_1(&v166, *(uint64_t *)&v166.d);
    double v27 = v163;
    CGFloat v28 = v164;
    double v29 = (*(double (**)(void *, CGFloat, CGFloat, CGFloat))(*(void *)(*(void *)(*(void *)&v26 + 8)
                                                                                  + 8)
                                                                      + 8))(a1, COERCE_CGFLOAT(*(void *)&v25), v163, v164);
    CGFloat v159 = v30;
    double v32 = v31;
    CGFloat v158 = v33;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v166);
    sub_1B07BBD78(*(void *)&v12 + 56, (uint64_t)&v166);
    CGFloat v34 = v166.d;
    CGFloat v35 = v166.tx;
    __swift_project_boxed_opaque_existential_1(&v166, *(uint64_t *)&v166.d);
    double v36 = v28;
    double v37 = v32;
    *(void *)&long long v151 = (*(double (**)(void *, CGFloat, double, double))(*(void *)(*(void *)(*(void *)&v35 + 8)
                                                                                             + 8)
                                                                                 + 8))(a1, COERCE_CGFLOAT(*(void *)&v34), v27, v36);
    CGFloat v152 = v38;
    *(void *)&long long v150 = v39;
    double v153 = v40;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v166);
LABEL_5:
    sub_1B07BBD78(*(void *)&v12 + 96, (uint64_t)&v166);
    uint64_t v41 = *(void *)&v166.d;
    uint64_t v42 = *(void *)&v166.tx;
    __swift_project_boxed_opaque_existential_1(&v166, *(uint64_t *)&v166.d);
    sub_1B07B76D8((uint64_t)v11);
    AnyDimension.value(in:rounded:)((uint64_t)a1, (uint64_t)v11, v41, v42);
    double v44 = v43;
    uint64_t v45 = *(void (**)(char *, uint64_t))(v9 + 8);
    double v46 = v12;
    uint64_t v47 = v160;
    v45(v11, v160);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v166);
    goto LABEL_6;
  }
  uint64_t v17 = *(void *)&v12 + 56;
  sub_1B07BBD78(*(void *)&v12 + 56, (uint64_t)&v165);
  CGFloat v18 = v165.d;
  CGFloat v19 = v165.tx;
  __swift_project_boxed_opaque_existential_1(&v165, *(uint64_t *)&v165.d);
  char v20 = (*(uint64_t (**)(CGFloat, CGFloat))(*(void *)&v19 + 88))(COERCE_CGFLOAT(*(void *)&v18), COERCE_CGFLOAT(*(void *)&v19));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v165);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v166);
  if (v20) {
    goto LABEL_4;
  }
  sub_1B07BBD78(v13, (uint64_t)&v166);
  CGFloat v115 = v166.d;
  CGFloat v116 = v166.tx;
  __swift_project_boxed_opaque_existential_1(&v166, *(uint64_t *)&v166.d);
  (*(void (**)(void, CGFloat, CGFloat))(*(void *)&v116 + 24))(*(void *)(*(void *)&v12 + 216), COERCE_CGFLOAT(*(void *)&v115), COERCE_CGFLOAT(*(void *)&v116));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v166);
  sub_1B07BBD78(v13, (uint64_t)&v166);
  CGFloat v117 = v166.d;
  CGFloat v118 = v166.tx;
  __swift_project_boxed_opaque_existential_1(&v166, *(uint64_t *)&v166.d);
  double v119 = (*(double (**)(void *, CGFloat, CGFloat, CGFloat))(*(void *)(*(void *)(*(void *)&v118 + 8)
                                                                                 + 8)
                                                                     + 8))(a1, COERCE_CGFLOAT(*(void *)&v117), v163, v164);
  double v121 = v120;
  double v123 = v122;
  double v125 = v124;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v166);
  sub_1B07BBD78(v13, (uint64_t)&v166);
  __swift_project_boxed_opaque_existential_1(&v166, *(uint64_t *)&v166.d);
  v189.var0 = v119;
  CGFloat v159 = v121;
  v189.var1 = v121;
  v189.var2 = v123;
  CGFloat v158 = v125;
  v189.var3 = v125;
  Swift::Int v126 = LayoutTextView.estimatedNumberOfLines(from:)(v189);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v166);
  sub_1B07BBD78(*(void *)&v12 + 56, (uint64_t)&v166);
  double v127 = v12;
  CGFloat v128 = v166.d;
  CGFloat v129 = v166.tx;
  __swift_project_boxed_opaque_existential_1(&v166, *(uint64_t *)&v166.d);
  double v157 = v123;
  CGFloat MinX = v119;
  if (v126 <= 1) {
    uint64_t v130 = *(void *)(*(void *)&v127 + 216);
  }
  else {
    uint64_t v130 = 1;
  }
  (*(void (**)(uint64_t, CGFloat, CGFloat))(*(void *)&v129 + 24))(v130, COERCE_CGFLOAT(*(void *)&v128), COERCE_CGFLOAT(*(void *)&v129));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v166);
  sub_1B07BBD78(v17, (uint64_t)&v166);
  CGFloat v131 = v166.d;
  CGFloat v132 = v166.tx;
  __swift_project_boxed_opaque_existential_1(&v166, *(uint64_t *)&v166.d);
  double v133 = (*(double (**)(void *, CGFloat, CGFloat, CGFloat))(*(void *)(*(void *)(*(void *)&v132 + 8)
                                                                                 + 8)
                                                                     + 8))(a1, COERCE_CGFLOAT(*(void *)&v131), v163, v164);
  double v135 = v134;
  double v137 = v136;
  double v139 = v138;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v166);
  sub_1B07BBD78(v17, (uint64_t)&v166);
  __swift_project_boxed_opaque_existential_1(&v166, *(uint64_t *)&v166.d);
  *(double *)&long long v151 = v133;
  v190.var0 = v133;
  CGFloat v152 = v135;
  v190.var1 = v135;
  *(double *)&long long v150 = v137;
  v190.var2 = v137;
  double v153 = v139;
  v190.var3 = v139;
  Swift::Int v140 = LayoutTextView.estimatedNumberOfLines(from:)(v190);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v166);
  id v141 = objc_msgSend(a1, sel_traitCollection);
  id v142 = objc_msgSend(v141, sel_preferredContentSizeCategory);
  LOBYTE(v132) = sub_1B086A348();

  if ((LOBYTE(v132) & 1) == 0 && v126 <= 1 && v140 < 2)
  {
    double v12 = v155;
    double v37 = v157;
    double v29 = MinX;
    goto LABEL_5;
  }
  double v46 = v155;
  sub_1B07BBD78(*(void *)&v155 + 136, (uint64_t)&v166);
  uint64_t v143 = *(void *)&v166.d;
  uint64_t v144 = *(void *)&v166.tx;
  __swift_project_boxed_opaque_existential_1(&v166, *(uint64_t *)&v166.d);
  sub_1B07B76D8((uint64_t)v11);
  AnyDimension.value(in:rounded:)((uint64_t)a1, (uint64_t)v11, v143, v144);
  double v44 = v145;
  uint64_t v45 = *(void (**)(char *, uint64_t))(v9 + 8);
  uint64_t v47 = v160;
  v45(v11, v160);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v166);
  double v37 = v157;
  double v29 = MinX;
LABEL_6:
  sub_1B07BBD78(*(void *)&v46 + 176, (uint64_t)&v166);
  uint64_t v48 = *(void *)&v166.d;
  uint64_t v49 = *(void *)&v166.tx;
  __swift_project_boxed_opaque_existential_1(&v166, *(uint64_t *)&v166.d);
  sub_1B07B76D8((uint64_t)v11);
  AnyDimension.value(in:rounded:)((uint64_t)a1, (uint64_t)v11, v48, v49);
  double v149 = v50;
  v45(v11, v47);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v166);
  CGFloat v51 = v162;
  v170.origin.x = v162;
  CGFloat v52 = v161;
  v170.origin.y = v161;
  CGFloat v53 = v163;
  v170.size.width = v163;
  CGFloat v54 = v164;
  v170.size.height = v164;
  CGFloat MinX = CGRectGetMinX(v170);
  v171.origin.x = v51;
  v171.origin.y = v52;
  v171.size.width = v53;
  v171.size.height = v54;
  double MinY = CGRectGetMinY(v171);
  v172.origin.x = v51;
  v172.origin.y = v52;
  v172.size.width = v53;
  v172.size.height = v54;
  double Width = CGRectGetWidth(v172);
  if (Width >= v29) {
    CGFloat v57 = v29;
  }
  else {
    CGFloat v57 = Width;
  }
  double v58 = v44 - v37 + MinY;
  sub_1B07BBD78(v13, (uint64_t)&v167);
  uint64_t v59 = v168;
  uint64_t v60 = v169;
  __swift_project_boxed_opaque_existential_1(&v167, v168);
  id v61 = objc_msgSend(a1, sel_traitCollection);
  id v62 = objc_msgSend(v61, sel_layoutDirection);

  double v157 = v37;
  if (v62 == (id)1)
  {
    CGAffineTransformMakeScale(&v166, -1.0, 1.0);
    long long v160 = *(_OWORD *)&v166.a;
    long long v148 = *(_OWORD *)&v166.c;
    CGFloat ty = v166.ty;
    CGFloat v147 = v166.tx;
    CGFloat v68 = v44 - v37 + MinY;
    double v69 = v57;
    CGFloat v70 = v162;
    v173.origin.x = v162;
    CGFloat v71 = v161;
    v173.origin.y = v161;
    CGFloat v72 = v163;
    v173.size.width = v163;
    CGFloat v73 = v164;
    v173.size.height = v164;
    double v74 = CGRectGetMinX(v173);
    v174.origin.x = v70;
    CGFloat v57 = v69;
    double v58 = v68;
    v174.origin.y = v71;
    v174.size.width = v72;
    v174.size.height = v73;
    CGFloat MaxX = CGRectGetMaxX(v174);
    *(_OWORD *)&v166.a = v160;
    *(_OWORD *)&v166.c = v148;
    v166.CGFloat tx = v147;
    v166.CGFloat ty = ty;
    CGAffineTransformTranslate(&v165, &v166, -(v74 + MaxX), 0.0);
    CGAffineTransform v166 = v165;
    CGFloat v76 = MinX;
    v175.origin.x = MinX;
    v175.origin.y = v68;
    v175.size.width = v57;
    CGFloat v77 = v159;
    v175.size.height = v159;
    *(CGRect *)v63.n128_u64 = CGRectApplyAffineTransform(v175, &v166);
  }
  else
  {
    v66.n128_f64[0] = v159;
    CGFloat v77 = v159;
    CGFloat v76 = MinX;
    v63.n128_f64[0] = MinX;
    v64.n128_f64[0] = v58;
    v65.n128_f64[0] = v57;
  }
  (*(void (**)(uint64_t, __n128, __n128, __n128, __n128))(*(void *)(v60 + 8) + 24))(v59, v63, v64, v65, v66);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v167);
  CGFloat v78 = v162;
  v176.origin.x = v162;
  CGFloat v79 = v161;
  v176.origin.y = v161;
  CGFloat v80 = v163;
  v176.size.width = v163;
  CGFloat v81 = v164;
  v176.size.height = v164;
  *(void *)&long long v160 = CGRectGetMinX(v176);
  v177.origin.x = v76;
  v177.origin.y = v58;
  v177.size.width = v57;
  *(CGFloat *)&long long v148 = v77;
  v177.size.height = v77;
  double MaxY = CGRectGetMaxY(v177);
  v178.origin.x = v78;
  v178.origin.y = v79;
  v178.size.width = v80;
  v178.size.height = v81;
  double v83 = CGRectGetWidth(v178);
  if (v83 >= *(double *)&v151) {
    double v83 = *(double *)&v151;
  }
  CGFloat v159 = v83;
  CGFloat v158 = v149 - *(double *)&v150 + MaxY - v158;
  sub_1B07BBD78(*(void *)&v155 + 56, (uint64_t)&v167);
  uint64_t v85 = v168;
  uint64_t v84 = v169;
  __swift_project_boxed_opaque_existential_1(&v167, v168);
  id v86 = objc_msgSend(a1, sel_traitCollection);
  id v87 = objc_msgSend(v86, sel_layoutDirection);

  if (v87 == (id)1)
  {
    CGAffineTransformMakeScale(&v166, -1.0, 1.0);
    long long v151 = *(_OWORD *)&v166.a;
    long long v150 = *(_OWORD *)&v166.c;
    CGFloat v92 = v161;
    double v155 = v58;
    CGFloat v93 = v166.tx;
    CGFloat v94 = v166.ty;
    CGFloat v95 = v162;
    v179.origin.x = v162;
    v179.origin.y = v161;
    double v96 = v57;
    CGFloat v97 = v163;
    v179.size.width = v163;
    CGFloat v98 = v164;
    v179.size.height = v164;
    double v99 = CGRectGetMinX(v179);
    v180.origin.x = v95;
    v180.origin.y = v92;
    v180.size.width = v97;
    CGFloat v57 = v96;
    v180.size.height = v98;
    CGFloat v100 = CGRectGetMaxX(v180);
    *(_OWORD *)&v166.a = v151;
    *(_OWORD *)&v166.c = v150;
    v166.CGFloat tx = v93;
    v166.CGFloat ty = v94;
    double v58 = v155;
    CGFloat v76 = MinX;
    CGAffineTransformTranslate(&v165, &v166, -(v99 + v100), 0.0);
    CGAffineTransform v166 = v165;
    *(void *)&v181.origin.x = v160;
    v181.origin.y = v158;
    v181.size.width = v159;
    CGFloat v101 = v152;
    v181.size.height = v152;
    *(CGRect *)v88.n128_u64 = CGRectApplyAffineTransform(v181, &v166);
  }
  else
  {
    v91.n128_f64[0] = v152;
    CGFloat v101 = v152;
    v88.n128_u64[0] = v160;
    v89.n128_f64[0] = v158;
    v90.n128_f64[0] = v159;
  }
  double v102 = v157;
  (*(void (**)(uint64_t, __n128, __n128, __n128, __n128))(*(void *)(v84 + 8) + 24))(v85, v88, v89, v90, v91);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v167);
  v182.origin.x = v76;
  v182.origin.y = v58;
  v182.size.width = v57;
  *(void *)&v182.size.height = v148;
  double v103 = CGRectGetMinY(v182);
  CGFloat v104 = v162;
  v183.origin.x = v162;
  CGFloat v105 = v161;
  v183.origin.y = v161;
  CGFloat v106 = v163;
  v183.size.width = v163;
  CGFloat v107 = v164;
  v183.size.height = v164;
  double v157 = v102 + v103 - CGRectGetMinY(v183);
  v184.origin.x = v104;
  v184.origin.y = v105;
  v184.size.width = v106;
  v184.size.height = v107;
  CGFloat v108 = CGRectGetMinX(v184);
  v185.origin.x = v104;
  v185.origin.y = v105;
  v185.size.width = v106;
  v185.size.height = v107;
  CGFloat v109 = CGRectGetMinY(v185);
  v186.origin.x = v104;
  v186.origin.y = v105;
  v186.size.width = v106;
  v186.size.height = v107;
  CGFloat v110 = CGRectGetWidth(v186);
  *(void *)&v187.origin.x = v160;
  v187.origin.y = v158;
  v187.size.width = v159;
  v187.size.height = v101;
  double v111 = CGRectGetMaxY(v187);
  v188.origin.x = v104;
  v188.origin.y = v105;
  v188.size.width = v106;
  v188.size.height = v107;
  CGFloat v112 = CGRectGetMinY(v188);
  Swift::Int v113 = v154;
  *CGRect v154 = v108;
  v113[1] = v109;
  v113[2] = v110;
  v113[3] = v111 - v112;
  double result = v153;
  v113[4] = v157;
  v113[5] = result;
  return result;
}

double sub_1B083EF2C(uint64_t a1, double a2)
{
  return AppStore.ThreeLineTextLayout.measurements(fitting:in:)(a1, a2);
}

uint64_t sub_1B083EF48@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + 16;
  swift_beginAccess();
  return sub_1B07BBD78(v3, a2);
}

uint64_t sub_1B083EF98(uint64_t a1)
{
  sub_1B07BBD78(a1, (uint64_t)v2);
  return AppStore.ThreeLineTextLayout.primaryText.setter(v2);
}

uint64_t sub_1B083EFD0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  return sub_1B07BBD78(v3 + 56, a2);
}

uint64_t sub_1B083F01C(uint64_t a1)
{
  sub_1B07BBD78(a1, (uint64_t)v2);
  return AppStore.ThreeLineTextLayout.secondaryText.setter(v2);
}

uint64_t sub_1B083F054@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  return sub_1B07BBD78(v3 + 96, a2);
}

uint64_t sub_1B083F0A0(uint64_t a1)
{
  sub_1B07BBD78(a1, (uint64_t)v2);
  return AppStore.ThreeLineTextLayout.primaryRegularSpace.setter(v2);
}

uint64_t sub_1B083F0D8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  return sub_1B07BBD78(v3 + 136, a2);
}

uint64_t sub_1B083F124(uint64_t a1)
{
  sub_1B07BBD78(a1, (uint64_t)v2);
  return AppStore.ThreeLineTextLayout.primaryCompressedSpace.setter(v2);
}

uint64_t sub_1B083F15C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  return sub_1B07BBD78(v3 + 176, a2);
}

uint64_t sub_1B083F1A8(uint64_t a1)
{
  sub_1B07BBD78(a1, (uint64_t)v2);
  return AppStore.ThreeLineTextLayout.secondarySpace.setter(v2);
}

uint64_t sub_1B083F1E0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(void *)(v3 + 216);
  return result;
}

uint64_t sub_1B083F228(uint64_t *a1)
{
  return AppStore.ThreeLineTextLayout.numberOfLines.setter(*a1);
}

ValueMetadata *type metadata accessor for AppStore.ThreeLineTextLayout()
{
  return &type metadata for AppStore.ThreeLineTextLayout;
}

uint64_t _s19ThreeLineTextLayoutV7StorageVwcp(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  long long v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 80, a2 + 80);
  long long v7 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 144) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 120, a2 + 120);
  long long v8 = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 184) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 160, a2 + 160);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  return a1;
}

uint64_t *_s19ThreeLineTextLayoutV7StorageVwca(uint64_t *a1, uint64_t *a2)
{
  a1[25] = a2[25];
  return a1;
}

uint64_t _s19ThreeLineTextLayoutV7StorageVwta(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  __swift_destroy_boxed_opaque_existential_1(a1 + 160);
  long long v6 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v6;
  uint64_t v7 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v7;
  return a1;
}

uint64_t _s19ThreeLineTextLayoutV7StorageVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 208)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s19ThreeLineTextLayoutV7StorageVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 200) = 0;
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
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 208) = 1;
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
    *(unsigned char *)(result + 208) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s19ThreeLineTextLayoutV7StorageVMa()
{
  return &_s19ThreeLineTextLayoutV7StorageVN;
}

id Placeable.juPlaceable.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)(a1 - 8);
  MEMORY[0x1F4188790](a1);
  long long v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v10 = MEMORY[0x1F4188790](v9);
  double v12 = (char *)v17 - v11;
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v6 + 16);
  v13((char *)v17 - v11, v3, a1, v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BA90);
  if (swift_dynamicCast() || swift_dynamicCast())
  {
    id v14 = (id)v17[1];
  }
  else
  {
    long long v15 = (objc_class *)type metadata accessor for _PlaceableAsJUPlaceable();
    ((void (*)(char *, uint64_t, uint64_t))v13)(v8, v3, a1);
    id v14 = sub_1B083FC14((uint64_t)v8, v15, a1, a2);
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v12, a1);
  return v14;
}

uint64_t type metadata accessor for _PlaceableAsJUPlaceable()
{
  return self;
}

uint64_t _PlaceableAsJUPlaceable.base.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B07BBD78(v1 + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base, a1);
}

JUMeasurements __swiftcall _PlaceableAsJUPlaceable.measure(toFit:with:)(CGSize toFit, UITraitCollection with)
{
  double height = toFit.height;
  double width = toFit.width;
  uint64_t v6 = *(void *)(v2 + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base + 24);
  uint64_t v7 = *(void *)(v2 + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v2 + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base), v6);
  (*(void (**)(Class, uint64_t, uint64_t, double, double))(v7 + 8))(with.super.isa, v6, v7, width, height);
  result.var3 = v11;
  result.var2 = v10;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

Swift::Void __swiftcall _PlaceableAsJUPlaceable.place(at:with:)(__C::CGRect at, UITraitCollection with)
{
  double height = at.size.height;
  double width = at.size.width;
  double y = at.origin.y;
  double x = at.origin.x;
  uint64_t v8 = *(void *)(v2 + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base + 24);
  uint64_t v9 = *(void *)(v2 + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v2 + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base), v8);
  (*(void (**)(Class, uint64_t, uint64_t, double, double, double, double))(v9 + 16))(with.super.isa, v8, v9, x, y, width, height);
}

uint64_t _PlaceableAsJUPlaceable.description.getter()
{
  sub_1B07BBD78(v0 + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base, (uint64_t)v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595770);
  return sub_1B0869DE8();
}

id _PlaceableAsJUPlaceable.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void _PlaceableAsJUPlaceable.init()()
{
}

id _PlaceableAsJUPlaceable.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1B083FC14(uint64_t a1, objc_class *a2, uint64_t a3, uint64_t a4)
{
  void v12[3] = a3;
  v12[4] = a4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(boxed_opaque_existential_0, a1, a3);
  id v8 = objc_allocWithZone(a2);
  sub_1B07BBD78((uint64_t)v12, (uint64_t)v8 + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base);
  v11.receiver = v8;
  v11.super_class = a2;
  id v9 = objc_msgSendSuper2(&v11, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v9;
}

uint64_t method lookup function for _PlaceableAsJUPlaceable(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for _PlaceableAsJUPlaceable);
}

void sub_1B083FCE4(uint64_t a1)
{
  sub_1B083FDBC(a1);
  if ((unsigned __int16)((unsigned __int16)(v3 + 9216) >> 10) >= 0x3Fu)
  {
    uint64_t v4 = *(void *)(v1 + 16);
    BOOL v5 = __OFSUB__(v4, 1);
    uint64_t v6 = v4 - 1;
    if (v5)
    {
      __break(1u);
    }
    else if (v6 > a1)
    {
      sub_1B083FDBC(a1 + 1);
    }
  }
}

void sub_1B083FDBC(uint64_t a1)
{
  if ((a1 & 0x8000000000000000) == 0)
  {
    uint64_t v3 = *(void *)(v1 + 16);
    if (v3 > a1)
    {
      if (*(void *)(v1 + 24))
      {
        if (!__OFADD__(a1, *(void *)(v1 + 8))) {
          return;
        }
        __break(1u);
        goto LABEL_25;
      }
      uint64_t v4 = *(void *)(v1 + 32);
      if (v4)
      {
        uint64_t v5 = *(void *)(v1 + 8);
        BOOL v6 = __OFADD__(a1, v5);
        uint64_t v7 = a1 + v5;
        if (v6)
        {
LABEL_25:
          __break(1u);
          goto LABEL_26;
        }
        if (*(char *)(v4 + v7) < 0)
        {
LABEL_26:
          __break(1u);
          goto LABEL_27;
        }
      }
      else
      {
        if (*(void *)(v1 + 56) <= a1 || (uint64_t v8 = *(void *)(v1 + 48), v8 > a1))
        {
          uint64_t v9 = 4;
          if (a1 > 4) {
            uint64_t v9 = a1;
          }
          uint64_t v8 = v9 - 4;
          *(void *)(v1 + 48) = v9 - 4;
          BOOL v6 = __OFADD__(v9, 2044);
          uint64_t v10 = v9 + 2044;
          if (v6) {
            goto LABEL_28;
          }
          if (v3 >= v10) {
            uint64_t v3 = v10;
          }
          *(void *)(v1 + 56) = v3;
          uint64_t v11 = *(void *)(v1 + 8);
          if (__OFADD__(v11, v8)) {
            goto LABEL_29;
          }
          if (__OFSUB__(v3, v8))
          {
LABEL_30:
            __break(1u);
            goto LABEL_31;
          }
          v12.location = v11 + v8;
          v12.length = v3 - v8;
          CFStringGetCharacters(*(CFStringRef *)v1, v12, *(UniChar **)(v1 + 40));
        }
        if (!*(void *)(v1 + 40))
        {
LABEL_31:
          __break(1u);
          return;
        }
        if (__OFSUB__(a1, v8))
        {
LABEL_27:
          __break(1u);
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
          goto LABEL_30;
        }
      }
    }
  }
}

void sub_1B083FED0(void *a1@<X0>, __CFString *a2@<X1>, uint64_t a3@<X2>, __CFString **a4@<X8>)
{
  uint64_t v7 = a1;
  CharactersPtr = CFStringGetCharactersPtr(v7);
  if (CharactersPtr)
  {

    CStringPtr = 0;
    uint64_t v10 = 0;
LABEL_9:
    *a4 = v7;
    a4[1] = a2;
    a4[2] = (__CFString *)a3;
    a4[3] = (__CFString *)CharactersPtr;
    a4[4] = (__CFString *)CStringPtr;
    a4[5] = (__CFString *)v10;
    a4[6] = 0;
    a4[7] = 0;
    return;
  }
  uint64_t v11 = v7;
  CFStringEncoding v12 = sub_1B0869098();
  CStringPtr = CFStringGetCStringPtr(v11, v12);

  if (CStringPtr)
  {

    uint64_t v10 = 0;
    goto LABEL_9;
  }
  int64_t v13 = 2048;
  if (a3 < 2048) {
    int64_t v13 = a3;
  }
  if (v13 >= (uint64_t)0xC000000000000000)
  {
    uint64_t v10 = swift_slowAlloc();

    CStringPtr = 0;
    goto LABEL_9;
  }
  __break(1u);
}

uint64_t sub_1B083FFA8(uint64_t a1)
{
  return sub_1B0840078(a1, qword_1E9B3A568, MEMORY[0x1E4FB7E40]);
}

uint64_t static JUContentUnavailableViewController.PresentationContext.placeholder.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B0840138(&qword_1E9B3A5E0, (uint64_t)qword_1E9B3A568, a1);
}

uint64_t type metadata accessor for JUContentUnavailableViewController.PresentationContext(uint64_t a1)
{
  return sub_1B07B57FC(a1, (uint64_t *)&unk_1E9B3A5E8);
}

uint64_t sub_1B0840000(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JUContentUnavailableViewController.PresentationContext(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B0840064(uint64_t a1)
{
  return sub_1B0840078(a1, qword_1E9B3BAA0, MEMORY[0x1E4FB7E48]);
}

uint64_t sub_1B0840078(uint64_t a1, uint64_t *a2, unsigned int *a3)
{
  uint64_t v5 = type metadata accessor for JUContentUnavailableViewController.PresentationContext(0);
  __swift_allocate_value_buffer(v5, a2);
  uint64_t v6 = __swift_project_value_buffer(v5, (uint64_t)a2);
  uint64_t v7 = *a3;
  uint64_t v8 = sub_1B08692E8();
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 104);

  return v9(v6, v7, v8);
}

uint64_t static JUContentUnavailableViewController.PresentationContext.inline.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B0840138(&qword_1E9B3A6C8, (uint64_t)qword_1E9B3BAA0, a1);
}

uint64_t sub_1B0840138@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for JUContentUnavailableViewController.PresentationContext(0);
  uint64_t v6 = __swift_project_value_buffer(v5, a2);

  return sub_1B0840000(v6, a3);
}

uint64_t sub_1B0840198(uint64_t a1)
{
  return sub_1B0840078(a1, qword_1E9B3BAB8, MEMORY[0x1E4FB7E50]);
}

uint64_t static JUContentUnavailableViewController.PresentationContext.fullCover.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B0840138(qword_1E9B3A6D0, (uint64_t)qword_1E9B3BAB8, a1);
}

id JUContentUnavailableViewController.__allocating_init(error:presentationContext:retry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (char *)objc_allocWithZone(v4);
  *(void *)&v9[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_error] = a1;
  sub_1B0840000(a2, (uint64_t)&v9[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_presentationContext]);
  uint64_t v10 = &v9[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_retry];
  *(void *)uint64_t v10 = a3;
  *((void *)v10 + 1) = a4;
  v13.receiver = v9;
  v13.super_class = v4;
  id v11 = objc_msgSendSuper2(&v13, sel_initWithNibName_bundle_, 0, 0);
  sub_1B0840328(a2);
  return v11;
}

id JUContentUnavailableViewController.init(error:presentationContext:retry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v4[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_error] = a1;
  sub_1B0840000(a2, (uint64_t)&v4[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_presentationContext]);
  uint64_t v10 = &v4[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_retry];
  *(void *)uint64_t v10 = a3;
  *((void *)v10 + 1) = a4;
  v13.receiver = v4;
  v13.super_class = ObjectType;
  id v11 = objc_msgSendSuper2(&v13, sel_initWithNibName_bundle_, 0, 0);
  sub_1B0840328(a2);
  return v11;
}

uint64_t sub_1B0840328(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JUContentUnavailableViewController.PresentationContext(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id JUContentUnavailableViewController.__allocating_init(error:retry:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = (char *)objc_allocWithZone(v4);
  *(void *)&v8[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_error] = a1;
  uint64_t v9 = v8;
  id v10 = a1;
  if (qword_1E9B3A6C8 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for JUContentUnavailableViewController.PresentationContext(0);
  uint64_t v12 = __swift_project_value_buffer(v11, (uint64_t)qword_1E9B3BAA0);
  sub_1B0840000(v12, (uint64_t)&v9[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_presentationContext]);
  objc_super v13 = (uint64_t *)&v9[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_retry];
  *objc_super v13 = a2;
  v13[1] = a3;
  sub_1B07E8728(a2);

  v16.receiver = v9;
  v16.super_class = v4;
  id v14 = objc_msgSendSuper2(&v16, sel_initWithNibName_bundle_, 0, 0);
  sub_1B07BDB64(a2);

  return v14;
}

id JUContentUnavailableViewController.init(error:retry:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v4[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_error] = a1;
  uint64_t v9 = v4;
  id v10 = a1;
  if (qword_1E9B3A6C8 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for JUContentUnavailableViewController.PresentationContext(0);
  uint64_t v12 = __swift_project_value_buffer(v11, (uint64_t)qword_1E9B3BAA0);
  sub_1B0840000(v12, (uint64_t)&v9[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_presentationContext]);
  objc_super v13 = (uint64_t *)&v9[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_retry];
  *objc_super v13 = a2;
  v13[1] = a3;
  sub_1B07E8728(a2);

  v16.receiver = v9;
  v16.super_class = ObjectType;
  id v14 = objc_msgSendSuper2(&v16, sel_initWithNibName_bundle_, 0, 0);
  sub_1B07BDB64(a2);

  return v14;
}

id JUContentUnavailableViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void JUContentUnavailableViewController.init(coder:)()
{
}

Swift::Void __swiftcall JUContentUnavailableViewController.encode(with:)(NSCoder with)
{
}

Swift::Void __swiftcall JUContentUnavailableViewController.viewDidLoad()()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3A618);
  *(void *)&double v4 = MEMORY[0x1F4188790](v3 - 8).n128_u64[0];
  uint64_t v6 = (char *)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47.receiver = v1;
  v47.super_class = ObjectType;
  objc_msgSendSuper2(&v47, sel_viewDidLoad, v4);
  sub_1B0840BF8((uint64_t)v1, (uint64_t)v6);
  id v7 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3A608));
  uint64_t v8 = (void *)sub_1B0869488();
  objc_msgSend(v1, sel_addChildViewController_, v8);
  id v9 = objc_msgSend(v8, sel_view);
  if (!v9)
  {
    __break(1u);
    goto LABEL_14;
  }
  id v10 = v9;
  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  id v11 = objc_msgSend(v1, sel_view);
  if (!v11)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v12 = v11;
  id v13 = objc_msgSend(v8, sel_view);
  if (!v13)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  id v14 = v13;
  objc_msgSend(v12, sel_addSubview_, v13);

  __swift_instantiateConcreteTypeFromMangledName(qword_1EB596010);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1B0871680;
  id v16 = objc_msgSend(v8, sel_view);
  if (!v16)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v17 = v16;
  id v18 = objc_msgSend(v16, sel_topAnchor);

  id v19 = objc_msgSend(v1, sel_view);
  if (!v19)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  char v20 = v19;
  id v21 = objc_msgSend(v19, sel_topAnchor);

  id v22 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v21);
  *(void *)(v15 + 32) = v22;
  id v23 = objc_msgSend(v8, sel_view);
  if (!v23)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  CGFloat v24 = v23;
  id v25 = objc_msgSend(v23, sel_leadingAnchor);

  id v26 = objc_msgSend(v1, sel_view);
  if (!v26)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  double v27 = v26;
  id v28 = objc_msgSend(v26, sel_leadingAnchor);

  id v29 = objc_msgSend(v25, sel_constraintEqualToAnchor_, v28);
  *(void *)(v15 + 40) = v29;
  id v30 = objc_msgSend(v8, sel_view);
  if (!v30)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  double v31 = v30;
  id v32 = objc_msgSend(v30, sel_bottomAnchor);

  id v33 = objc_msgSend(v1, sel_view);
  if (!v33)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  CGFloat v34 = v33;
  id v35 = objc_msgSend(v33, sel_bottomAnchor);

  id v36 = objc_msgSend(v32, sel_constraintEqualToAnchor_, v35);
  *(void *)(v15 + 48) = v36;
  id v37 = objc_msgSend(v8, sel_view);
  if (!v37)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  double v38 = v37;
  id v39 = objc_msgSend(v37, sel_trailingAnchor);

  id v40 = objc_msgSend(v1, sel_view);
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = self;
    id v43 = objc_msgSend(v41, sel_trailingAnchor);

    id v44 = objc_msgSend(v39, sel_constraintEqualToAnchor_, v43);
    *(void *)(v15 + 56) = v44;
    v46[1] = v15;
    sub_1B0869F98();
    sub_1B07B6684();
    uint64_t v45 = (void *)sub_1B0869F78();
    swift_bridgeObjectRelease();
    objc_msgSend(v42, sel_activateConstraints_, v45);

    objc_msgSend(v8, sel_didMoveToParentViewController_, v1);
    return;
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_1B0840BF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v49 = a2;
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3A5D8);
  uint64_t v40 = *(void *)(v47 - 8);
  MEMORY[0x1F4188790](v47);
  double v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3A620);
  uint64_t v42 = *(void *)(v48 - 8);
  MEMORY[0x1F4188790](v48);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v41 = (char *)&v40 - v8;
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3A610);
  MEMORY[0x1F4188790](v44);
  double v46 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for JUContentUnavailableViewController.PresentationContext(0);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3A5C8);
  uint64_t v13 = *(void *)(v43 - 8);
  MEMORY[0x1F4188790](v43);
  uint64_t v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3A628);
  uint64_t v16 = *(void *)(v45 - 8);
  MEMORY[0x1F4188790](v45);
  id v18 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19);
  id v21 = (char *)&v40 - v20;
  uint64_t v22 = *(void *)(a1 + OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_retry);
  if (v22)
  {
    uint64_t v23 = *(void *)(a1 + OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_retry + 8);
    CGFloat v24 = *(void **)(a1 + OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_error);
    sub_1B07E8728(*(void *)(a1 + OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_retry));
    uint64_t v42 = v23;
    sub_1B07E8728(v22);
    id v25 = v24;
    sub_1B08692B8();
    sub_1B0840000(a1 + OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_presentationContext, (uint64_t)v12);
    uint64_t v26 = sub_1B0841CAC(&qword_1E9B3A5C0, &qword_1E9B3A5C8);
    uint64_t v27 = v43;
    sub_1B08694A8();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v27);
    uint64_t v28 = sub_1B08692E8();
    (*(void (**)(char *, uint64_t))(*(void *)(v28 - 8) + 8))(v12, v28);
    uint64_t v29 = v45;
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v18, v45);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v46, v21, v29);
    swift_storeEnumTagMultiPayload();
    uint64_t v50 = v27;
    uint64_t v51 = v26;
    swift_getOpaqueTypeConformance2();
    uint64_t v30 = sub_1B0841CAC(&qword_1E9B3A5D0, &qword_1E9B3A5D8);
    uint64_t v50 = v47;
    uint64_t v51 = v30;
    swift_getOpaqueTypeConformance2();
    sub_1B0869498();
    sub_1B07BDB64(v22);
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v21, v29);
  }
  else
  {
    id v32 = *(id *)(a1 + OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_error);
    sub_1B08692C8();
    sub_1B0840000(a1 + OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_presentationContext, (uint64_t)v12);
    uint64_t v33 = sub_1B0841CAC(&qword_1E9B3A5D0, &qword_1E9B3A5D8);
    uint64_t v34 = v47;
    sub_1B08694A8();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v4, v34);
    uint64_t v35 = sub_1B08692E8();
    (*(void (**)(char *, uint64_t))(*(void *)(v35 - 8) + 8))(v12, v35);
    id v37 = v41;
    uint64_t v36 = v42;
    uint64_t v38 = v48;
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v41, v6, v48);
    (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v46, v37, v38);
    swift_storeEnumTagMultiPayload();
    uint64_t v39 = sub_1B0841CAC(&qword_1E9B3A5C0, &qword_1E9B3A5C8);
    uint64_t v50 = v43;
    uint64_t v51 = v39;
    swift_getOpaqueTypeConformance2();
    uint64_t v50 = v34;
    uint64_t v51 = v33;
    swift_getOpaqueTypeConformance2();
    sub_1B0869498();
    return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v37, v38);
  }
}

id JUContentUnavailableViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  double v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_1B0869D68();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void JUContentUnavailableViewController.init(nibName:bundle:)()
{
}

id JUContentUnavailableViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static ObjCFunctions.makeContentUnavailableViewController(with:retry:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for JUContentUnavailableViewController.PresentationContext(0);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a1;
  sub_1B07E8728(a2);
  if (qword_1E9B3A5E0 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v6, (uint64_t)qword_1E9B3A568);
  sub_1B0840000(v10, (uint64_t)v8);
  uint64_t v11 = (objc_class *)type metadata accessor for JUContentUnavailableViewController(0);
  uint64_t v12 = (char *)objc_allocWithZone(v11);
  *(void *)&v12[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_error] = a1;
  sub_1B0840000((uint64_t)v8, (uint64_t)&v12[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_presentationContext]);
  uint64_t v13 = (uint64_t *)&v12[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_retry];
  *uint64_t v13 = a2;
  v13[1] = a3;
  v16.receiver = v12;
  v16.super_class = v11;
  id v14 = objc_msgSendSuper2(&v16, sel_initWithNibName_bundle_, 0, 0);
  sub_1B0840328((uint64_t)v8);
  return v14;
}

uint64_t type metadata accessor for JUContentUnavailableViewController(uint64_t a1)
{
  return sub_1B07B57FC(a1, (uint64_t *)&unk_1E9B3A580);
}

uint64_t sub_1B08415C8()
{
  return type metadata accessor for JUContentUnavailableViewController(0);
}

uint64_t sub_1B08415D0()
{
  uint64_t result = sub_1B08692E8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for JUContentUnavailableViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for JUContentUnavailableViewController);
}

uint64_t dispatch thunk of JUContentUnavailableViewController.__allocating_init(error:presentationContext:retry:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of JUContentUnavailableViewController.__allocating_init(error:retry:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t initializeBufferWithCopyOfBuffer for JUContentUnavailableViewController.PresentationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B08692E8();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for JUContentUnavailableViewController.PresentationContext(uint64_t a1)
{
  uint64_t v2 = sub_1B08692E8();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for JUContentUnavailableViewController.PresentationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B08692E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for JUContentUnavailableViewController.PresentationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B08692E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for JUContentUnavailableViewController.PresentationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B08692E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for JUContentUnavailableViewController.PresentationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B08692E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for JUContentUnavailableViewController.PresentationContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B0841928);
}

uint64_t sub_1B0841928(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B08692E8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for JUContentUnavailableViewController.PresentationContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B08419A8);
}

uint64_t sub_1B08419A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B08692E8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_1B0841A18()
{
  uint64_t result = sub_1B08692E8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1B0841C64()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B0841C9C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1B0841CAC(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_1B0841CFC()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PartialLayoutView()
{
  return self;
}

uint64_t sub_1B0841D60(uint64_t a1, double a2, double a3)
{
  uint64_t v7 = *(void *)(*(void *)v3 + 40);
  uint64_t v8 = *(void *)(*(void *)v3 + 48);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)v3 + 16), v7);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, double, double))(v8 + 8))(a1, v7, v8, a2, a3);
}

uint64_t sub_1B0841DD8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 80);
  uint64_t v2 = *(void *)(*(void *)v0 + 88);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)v0 + 56), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

uint64_t sub_1B0841E30(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = *(void *)(*(void *)v4 + 80);
  uint64_t v10 = *(void *)(*(void *)v4 + 88);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)v4 + 56), v9);
  return (*(uint64_t (**)(uint64_t, uint64_t, double, double, double, double))(v10 + 24))(v9, v10, a1, a2, a3, a4);
}

void (*sub_1B0841EB8(double **a1))(double **a1)
{
  uint64_t v3 = (double *)malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = (void *)*v1;
  v3[4] = *(double *)v1;
  uint64_t v5 = v4[10];
  uint64_t v6 = v4[11];
  __swift_project_boxed_opaque_existential_1(v4 + 7, v5);
  *uint64_t v3 = (*(double (**)(uint64_t, uint64_t))(v6 + 16))(v5, v6);
  *((void *)v3 + 1) = v7;
  *((void *)v3 + 2) = v8;
  *((void *)v3 + 3) = v9;
  return sub_1B0841F54;
}

void sub_1B0841F54(double **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void *)*((void *)*a1 + 4);
  double v3 = **a1;
  double v4 = (*a1)[1];
  double v5 = (*a1)[2];
  double v6 = (*a1)[3];
  uint64_t v7 = v2[10];
  uint64_t v8 = v2[11];
  __swift_project_boxed_opaque_existential_1(v2 + 7, v7);
  (*(void (**)(uint64_t, uint64_t, double, double, double, double))(v8 + 24))(v7, v8, v3, v4, v5, v6);

  free(v1);
}

uint64_t sub_1B0841FEC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 80);
  uint64_t v2 = *(void *)(*(void *)v0 + 88);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)v0 + 56), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 40))(v1, v2) & 1;
}

uint64_t sub_1B0842048(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 80);
  uint64_t v4 = *(void *)(*(void *)v1 + 88);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)v1 + 56), v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, v3, v4);
}

uint64_t (*sub_1B08420A8(uint64_t a1))(unsigned __int8 *a1)
{
  uint64_t v3 = (void *)*v1;
  *(void *)a1 = *v1;
  uint64_t v4 = v3[10];
  uint64_t v5 = v3[11];
  __swift_project_boxed_opaque_existential_1(v3 + 7, v4);
  *(unsigned char *)(a1 + 8) = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 40))(v4, v5) & 1;
  return sub_1B084212C;
}

uint64_t sub_1B084212C(unsigned __int8 *a1)
{
  uint64_t v1 = a1[8];
  uint64_t v2 = *(void *)(*(void *)a1 + 80);
  uint64_t v3 = *(void *)(*(void *)a1 + 88);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)a1 + 56), v2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, v2, v3);
}

uint64_t sub_1B0842190()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 80);
  uint64_t v2 = *(void *)(*(void *)v0 + 88);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)v0 + 56), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 64))(v1, v2) & 1;
}

uint64_t sub_1B08421EC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 80);
  uint64_t v2 = *(void *)(*(void *)v0 + 88);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)v0 + 56), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 72))(v1, v2);
}

void *sub_1B0842244(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v19 = a7;
  uint64_t v20 = a8;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v18);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a7 - 8) + 32))(boxed_opaque_existential_0, a1, a7);
  uint64_t v15 = (void *)swift_allocObject();
  v15[5] = &type metadata for StaticMeasurable;
  v15[6] = &protocol witness table for StaticMeasurable;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595820);
  objc_super v16 = (double *)swift_allocObject();
  v16[2] = a2;
  v16[3] = a3;
  v16[4] = a4;
  v16[5] = a5;
  v15[2] = v16;
  sub_1B07BA8FC(&v18, (uint64_t)(v15 + 7));
  return v15;
}

uint64_t sub_1B0842334(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = a4;
  uint64_t v13 = a5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v11);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_0, a2, a4);
  uint64_t v9 = swift_allocObject();
  sub_1B07BA8FC(a1, v9 + 16);
  sub_1B07BA8FC(&v11, v9 + 56);
  return v9;
}

ValueMetadata *type metadata accessor for PartialMeasurableLayout()
{
  return &type metadata for PartialMeasurableLayout;
}

uint64_t sub_1B08423EC(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v11 = *v5;
  swift_beginAccess();
  sub_1B07BBD78(v11 + 56, (uint64_t)v15);
  uint64_t v12 = v16;
  uint64_t v13 = v17;
  __swift_project_boxed_opaque_existential_1(v15, v16);
  (*(void (**)(uint64_t, uint64_t, uint64_t, double, double, double, double))(v13 + 8))(a1, v12, v13, a2, a3, a4, a5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
}

double sub_1B08424BC(uint64_t a1, double a2, double a3)
{
  uint64_t v7 = *v3 + 16;
  swift_beginAccess();
  sub_1B07BBD78(v7, (uint64_t)v12);
  uint64_t v8 = v13;
  uint64_t v9 = v14;
  __swift_project_boxed_opaque_existential_1(v12, v13);
  double v10 = (*(double (**)(uint64_t, uint64_t, uint64_t, double, double))(v9 + 8))(a1, v8, v9, a2, a3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v10;
}

__n128 sub_1B0842590(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = a3;
  uint64_t v15 = a4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v13);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(boxed_opaque_existential_0, a2, a3);
  sub_1B07BA8FC(a1, (uint64_t)v11);
  sub_1B07BA8FC(&v13, (uint64_t)v12 + 8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BAD8);
  uint64_t v8 = swift_allocObject();
  long long v9 = v12[1];
  *(_OWORD *)(v8 + 48) = v12[0];
  *(_OWORD *)(v8 + 64) = v9;
  *(_OWORD *)(v8 + 80) = v12[2];
  __n128 result = (__n128)v11[1];
  *(_OWORD *)(v8 + 16) = v11[0];
  *(__n128 *)(v8 + 32) = result;
  return result;
}

uint64_t initializeWithCopy for PartialMeasurableLayout.Storage(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  return a1;
}

uint64_t *assignWithCopy for PartialMeasurableLayout.Storage(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for PartialMeasurableLayout.Storage(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for PartialMeasurableLayout.Storage(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PartialMeasurableLayout.Storage(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PartialMeasurableLayout.Storage()
{
  return &type metadata for PartialMeasurableLayout.Storage;
}

uint64_t UIViewController.PresenterMultiplexer.init(presenters:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t UIViewController.PresenterMultiplexer.presenters.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t UIViewController.PresenterMultiplexer.add(_:)(uint64_t a1, uint64_t a2)
{
  long long v5 = *v2;
  swift_unknownObjectRetain();
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_1B07CF574(0, v5[2] + 1, 1, v5);
    long long v5 = (void *)result;
  }
  unint64_t v8 = v5[2];
  unint64_t v7 = v5[3];
  if (v8 >= v7 >> 1)
  {
    uint64_t result = (uint64_t)sub_1B07CF574((void *)(v7 > 1), v8 + 1, 1, v5);
    long long v5 = (void *)result;
  }
  v5[2] = v8 + 1;
  long long v9 = &v5[2 * v8];
  v9[4] = a1;
  v9[5] = a2;
  *unint64_t v2 = v5;
  return result;
}

uint64_t UIViewController.PresenterMultiplexer.remove(_:)(uint64_t result)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 16);
  if (v2)
  {
    unint64_t v3 = 0;
    for (i = (void *)(*(void *)v1 + 32); *i != result; i += 2)
    {
      if (v2 == ++v3) {
        return result;
      }
    }
    sub_1B07EB89C(v3);
    return swift_unknownObjectRelease();
  }
  return result;
}

Swift::Void __swiftcall UIViewController.PresenterMultiplexer.viewDidLoad()()
{
}

Swift::Void __swiftcall UIViewController.PresenterMultiplexer.viewWillAppear()()
{
}

Swift::Void __swiftcall UIViewController.PresenterMultiplexer.viewDidAppear()()
{
}

uint64_t UIViewController.PresenterMultiplexer.viewWillDisappear(forReason:)()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = v1 + 40;
    do
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      sub_1B0869A18();
      swift_unknownObjectRelease();
      v3 += 16;
      --v2;
    }
    while (v2);
    return swift_bridgeObjectRelease();
  }
  return result;
}

Swift::Void __swiftcall UIViewController.PresenterMultiplexer.viewDidDisappear()()
{
}

Swift::Void __swiftcall UIViewController.PresenterMultiplexer.viewDidReceiveMemoryWarning()()
{
}

uint64_t sub_1B0842AAC(uint64_t result)
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 16);
  if (v3)
  {
    long long v4 = (void (*)(uint64_t, uint64_t))result;
    swift_bridgeObjectRetain();
    long long v5 = (uint64_t *)(v2 + 40);
    do
    {
      uint64_t v6 = *v5;
      uint64_t ObjectType = swift_getObjectType();
      swift_unknownObjectRetain();
      v4(ObjectType, v6);
      swift_unknownObjectRelease();
      v5 += 2;
      --v3;
    }
    while (v3);
    return swift_bridgeObjectRelease();
  }
  return result;
}

ValueMetadata *type metadata accessor for UIViewController.PresenterMultiplexer()
{
  return &type metadata for UIViewController.PresenterMultiplexer;
}

uint64_t DisjointStack.Properties.topEdge.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B07E7774(v1, a1);
}

uint64_t DisjointStack.Properties.leadingEdge.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B07E7774(v1 + 40, a1);
}

uint64_t DisjointStack.Properties.bottomEdge.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B07E7774(v1 + 80, a1);
}

uint64_t DisjointStack.Properties.trailingEdge.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B07E7774(v1 + 120, a1);
}

double DisjointStack.Properties.init()@<D0>(uint64_t a1@<X8>)
{
  *(_WORD *)(a1 + 160) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t DisjointStack.Properties.topEdge.setter(uint64_t a1)
{
  return sub_1B07E7E3C(a1, v1);
}

uint64_t DisjointStack.Properties.leadingEdge.setter(uint64_t a1)
{
  return sub_1B07E7E3C(a1, v1 + 40);
}

uint64_t DisjointStack.Properties.bottomEdge.setter(uint64_t a1)
{
  return sub_1B07E7E3C(a1, v1 + 80);
}

uint64_t DisjointStack.Properties.trailingEdge.setter(uint64_t a1)
{
  return sub_1B07E7E3C(a1, v1 + 120);
}

void DisjointStack.Placements.union.getter(CGFloat *a1@<X8>)
{
  uint64_t v3 = (void *)*((void *)v1 + 4);
  uint64_t v4 = *((void *)v1 + 5);
  uint64_t v5 = *((void *)v1 + 6);
  uint64_t v6 = *((void *)v1 + 11);
  char v7 = *((unsigned char *)v1 + 96);
  long long v8 = v1[1];
  long long v34 = *v1;
  long long v35 = v8;
  uint64_t v36 = v3;
  uint64_t v37 = v4;
  long long v9 = *(long long *)((char *)v1 + 72);
  long long v39 = *(long long *)((char *)v1 + 56);
  long long v40 = v9;
  uint64_t v38 = v5;
  uint64_t v41 = v6;
  char v42 = v7;
  id v10 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  DisjointStack.Placements.next()((uint64_t)&v28);
  if (*((void *)&v29 + 1))
  {
    char v11 = 0;
    CGFloat y = 0.0;
    CGFloat x = 0.0;
    CGFloat height = 0.0;
    CGFloat width = 0.0;
    double v16 = 0.0;
    double v17 = 0.0;
    do
    {
      CGFloat r1 = width;
      double v24 = v16;
      double v18 = v17;
      CGFloat v19 = height;
      while (1)
      {
        v25[2] = v30;
        v25[3] = v31;
        long long v26 = v32;
        double v27 = v33;
        v25[0] = v28;
        v25[1] = v29;
        CGFloat v20 = *((double *)&v30 + 1);
        CGFloat width = *((double *)&v31 + 1);
        CGFloat v21 = *(double *)&v31;
        CGFloat height = *(double *)&v32;
        v43.origin.CGFloat x = *((CGFloat *)&v30 + 1);
        *(_OWORD *)&v43.origin.CGFloat y = v31;
        *(void *)&v43.size.CGFloat height = v32;
        if (!CGRectIsEmpty(v43)) {
          break;
        }
        sub_1B07BD394((uint64_t)v25);
        DisjointStack.Placements.next()((uint64_t)&v28);
        if (!*((void *)&v29 + 1))
        {
          CGFloat height = v19;
          double v17 = v18;
          CGFloat width = r1;
          double v16 = v24;
          goto LABEL_18;
        }
      }
      if (v11)
      {
        v44.origin.CGFloat x = x;
        v44.origin.CGFloat y = y;
        v44.size.CGFloat width = r1;
        v44.size.CGFloat height = v19;
        v46.origin.CGFloat x = v20;
        v46.origin.CGFloat y = v21;
        v46.size.CGFloat width = width;
        v46.size.CGFloat height = height;
        CGRect v45 = CGRectUnion(v44, v46);
        CGFloat x = v45.origin.x;
        CGFloat y = v45.origin.y;
        CGFloat width = v45.size.width;
        CGFloat height = v45.size.height;
        if (v18 >= *((double *)&v26 + 1)) {
          double v17 = *((double *)&v26 + 1);
        }
        else {
          double v17 = v18;
        }
        double v16 = v24;
        if (v24 >= v27) {
          double v16 = v27;
        }
      }
      else
      {
        double v17 = *((double *)&v26 + 1);
        double v16 = v27;
        CGFloat x = v20;
        CGFloat y = v21;
      }
      sub_1B07BD394((uint64_t)v25);
      DisjointStack.Placements.next()((uint64_t)&v28);
      char v11 = 1;
    }
    while (*((void *)&v29 + 1));
  }
  else
  {
    double v17 = 0.0;
    double v16 = 0.0;
    CGFloat width = 0.0;
    CGFloat height = 0.0;
    CGFloat x = 0.0;
    CGFloat y = 0.0;
  }
LABEL_18:
  uint64_t v22 = v36;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  *a1 = x;
  a1[1] = y;
  a1[2] = width;
  a1[3] = height;
  a1[4] = v17;
  a1[5] = v16;
}

void DisjointStack.Placements.next()(uint64_t a1@<X8>)
{
  uint64_t v5 = *((void *)v1 + 7);
  uint64_t v6 = *((void *)v1 + 5);
  if (v5 >= *(void *)(v6 + 16))
  {
    *(void *)(a1 + 80) = 0;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    return;
  }
  if (v5 < 0)
  {
    __break(1u);
    goto LABEL_41;
  }
  char v7 = v1;
  long long v8 = (uint64_t *)v74;
  sub_1B0843424(v6 + 208 * v5 + 32, (uint64_t)v74);
  if (v78[40] == 1)
  {
    double v9 = sub_1B08438A8();
    double v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    if ((v79 & 1) == 0) {
      goto LABEL_5;
    }
LABEL_13:
    sub_1B07BBD78((uint64_t)v74, (uint64_t)v71);
    sub_1B07BBD78((uint64_t)v71, (uint64_t)&v65);
    *((void *)&v67 + 1) = floor(v9);
    long long v68 = COERCE_UNSIGNED_INT64(floor(v11));
    *(void *)&long long v69 = 0;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v71);
    *((void *)&v69 + 1) = 0;
    *(void *)(a1 + 80) = 0;
    long long v31 = v68;
    *(_OWORD *)(a1 + 32) = v67;
    *(_OWORD *)(a1 + 48) = v31;
    long long v32 = v66;
    *(_OWORD *)a1 = v65;
    *(_OWORD *)(a1 + 16) = v32;
    *(_OWORD *)(a1 + 64) = v69;
    sub_1B07BBE14((uint64_t)v74, &qword_1E9B3A4A0);
    uint64_t v33 = *((void *)v1 + 7);
    BOOL v34 = __OFADD__(v33, 1);
    uint64_t v20 = v33 + 1;
    if (!v34)
    {
LABEL_37:
      *((void *)v7 + 7) = v20;
      return;
    }
    __break(1u);
    goto LABEL_16;
  }
  double v9 = *(double *)v1;
  double v11 = *((double *)v1 + 1);
  CGFloat v13 = *((double *)v1 + 2);
  CGFloat v15 = *((double *)v1 + 3);
  if (v79) {
    goto LABEL_13;
  }
LABEL_5:
  long long v8 = &v75;
  sub_1B0843AD4(*((void *)v1 + 7));
  double v2 = v16;
  double v3 = v17;
  double v60 = v19;
  double v61 = v18;
  uint64_t v1 = (char *)&v67 + 8;
  sub_1B07E7774((uint64_t)&v76, (uint64_t)&v65);
  sub_1B07E7774((uint64_t)v78, (uint64_t)&v67 + 8);
  uint64_t v20 = v69;
  if (*((void *)&v66 + 1))
  {
    if ((void)v69)
    {
      sub_1B07BA8FC(&v65, (uint64_t)v71);
      sub_1B07BA8FC((long long *)((char *)&v67 + 8), (uint64_t)v62);
      v80.origin.CGFloat x = v9;
      v80.origin.CGFloat y = v11;
      v80.size.CGFloat width = v13;
      v80.size.CGFloat height = v15;
      double MinX = CGRectGetMinX(v80);
      uint64_t v22 = v72;
      uint64_t v23 = v73;
      __swift_project_boxed_opaque_existential_1(v71, v72);
      double v24 = (void *)*((void *)v7 + 4);
      double v25 = MinX + AnyDimension.value(with:)(v24, v22, v23);
      v81.origin.CGFloat x = v9;
      v81.origin.CGFloat y = v11;
      v81.size.CGFloat width = v13;
      v81.size.CGFloat height = v15;
      double MaxX = CGRectGetMaxX(v81);
      v82.origin.CGFloat y = 0.0;
      v82.size.CGFloat width = 0.0;
      v82.size.CGFloat height = 0.0;
      v82.origin.CGFloat x = v25;
      double v27 = MaxX - CGRectGetMinX(v82);
      if (v2 > v27) {
        double v28 = v2;
      }
      else {
        double v28 = v27;
      }
      uint64_t v29 = v63;
      uint64_t v30 = v64;
      __swift_project_boxed_opaque_existential_1(v62, v63);
      double v2 = v28 - AnyDimension.value(with:)(v24, v29, v30);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
    }
    else
    {
      sub_1B07BA8FC(&v65, (uint64_t)v71);
      v84.origin.CGFloat x = v9;
      v84.origin.CGFloat y = v11;
      v84.size.CGFloat width = v13;
      v84.size.CGFloat height = v15;
      double v38 = CGRectGetMinX(v84);
      uint64_t v39 = v72;
      uint64_t v40 = v73;
      __swift_project_boxed_opaque_existential_1(v71, v72);
      double v25 = v38 + AnyDimension.value(with:)(*((void **)v7 + 4), v39, v40);
    }
    goto LABEL_19;
  }
LABEL_16:
  if (v20)
  {
    sub_1B07BA8FC((long long *)v1, (uint64_t)v71);
    v83.origin.CGFloat x = v9;
    v83.origin.CGFloat y = v11;
    v83.size.CGFloat width = v13;
    v83.size.CGFloat height = v15;
    CGFloat v35 = CGRectGetMaxX(v83) - v2;
    uint64_t v36 = v72;
    uint64_t v37 = v73;
    __swift_project_boxed_opaque_existential_1(v71, v72);
    double v25 = v35 - AnyDimension.value(with:)(*((void **)v7 + 4), v36, v37);
LABEL_19:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v71);
    goto LABEL_20;
  }
  v92.origin.CGFloat x = v9;
  v92.origin.CGFloat y = v11;
  v92.size.CGFloat width = v13;
  v92.size.CGFloat height = v15;
  double v25 = CGRectGetMidX(v92) + v2 * -0.5;
LABEL_20:
  sub_1B07E7774((uint64_t)v8, (uint64_t)&v65);
  sub_1B07E7774((uint64_t)&v77, (uint64_t)&v67 + 8);
  if (*((void *)&v66 + 1))
  {
    if ((void)v69)
    {
      sub_1B07BA8FC(&v65, (uint64_t)v71);
      sub_1B07BA8FC((long long *)((char *)&v67 + 8), (uint64_t)v62);
      v85.origin.CGFloat x = v9;
      v85.origin.CGFloat y = v11;
      v85.size.CGFloat width = v13;
      v85.size.CGFloat height = v15;
      double MinY = CGRectGetMinY(v85);
      uint64_t v42 = v72;
      uint64_t v43 = v73;
      __swift_project_boxed_opaque_existential_1(v71, v72);
      CGRect v44 = (void *)*((void *)v7 + 4);
      double v45 = MinY + AnyDimension.value(with:)(v44, v42, v43);
      v86.origin.CGFloat x = v9;
      v86.origin.CGFloat y = v11;
      v86.size.CGFloat width = v13;
      v86.size.CGFloat height = v15;
      double MaxY = CGRectGetMaxY(v86);
      v87.size.CGFloat height = 0.0;
      v87.origin.CGFloat x = v25;
      v87.origin.CGFloat y = v45;
      v87.size.CGFloat width = v2;
      double v47 = MaxY - CGRectGetMinY(v87);
      if (v3 > v47) {
        double v48 = v3;
      }
      else {
        double v48 = v47;
      }
      uint64_t v49 = v63;
      uint64_t v50 = v64;
      __swift_project_boxed_opaque_existential_1(v62, v63);
      double v3 = v48 - AnyDimension.value(with:)(v44, v49, v50);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
    }
    else
    {
      sub_1B07BA8FC(&v65, (uint64_t)v71);
      v89.origin.CGFloat x = v9;
      v89.origin.CGFloat y = v11;
      v89.size.CGFloat width = v13;
      v89.size.CGFloat height = v15;
      double v54 = CGRectGetMinY(v89);
      uint64_t v55 = v72;
      uint64_t v56 = v73;
      __swift_project_boxed_opaque_existential_1(v71, v72);
      double v45 = v54 + AnyDimension.value(with:)(*((void **)v7 + 4), v55, v56);
    }
  }
  else
  {
    if (!(void)v69)
    {
      v93.origin.CGFloat x = v9;
      v93.origin.CGFloat y = v11;
      v93.size.CGFloat width = v13;
      v93.size.CGFloat height = v15;
      double v45 = CGRectGetMidY(v93) + v3 * -0.5;
      goto LABEL_30;
    }
    sub_1B07BA8FC((long long *)((char *)&v67 + 8), (uint64_t)v71);
    v88.origin.CGFloat x = v9;
    v88.origin.CGFloat y = v11;
    v88.size.CGFloat width = v13;
    v88.size.CGFloat height = v15;
    CGFloat v51 = CGRectGetMaxY(v88) - v3;
    uint64_t v52 = v72;
    uint64_t v53 = v73;
    __swift_project_boxed_opaque_existential_1(v71, v72);
    double v45 = v51 - AnyDimension.value(with:)(*((void **)v7 + 4), v52, v53);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v71);
LABEL_30:
  v90.origin.CGFloat x = v25;
  v90.origin.CGFloat y = v45;
  v90.size.CGFloat width = v2;
  v90.size.CGFloat height = v3;
  if (CGRectGetMinX(v90) < 0.0 && CGRectGetWidth(*(CGRect *)v7) == 0.0) {
    double v25 = 0.0;
  }
  v91.origin.CGFloat x = v25;
  v91.origin.CGFloat y = v45;
  v91.size.CGFloat width = v2;
  v91.size.CGFloat height = v3;
  if (CGRectGetMinY(v91) < 0.0 && CGRectGetHeight(*(CGRect *)v7) == 0.0) {
    double v45 = 0.0;
  }
  sub_1B07BBD78((uint64_t)v74, (uint64_t)v71);
  sub_1B07BBD78((uint64_t)v71, (uint64_t)&v65);
  *((void *)&v67 + 1) = floor(v25);
  *(void *)&long long v68 = floor(v45);
  *((void *)&v68 + 1) = ceil(v2);
  *(void *)&long long v69 = ceil(v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v71);
  *((void *)&v69 + 1) = floor(v61);
  double v70 = floor(v60);
  long long v57 = v68;
  *(_OWORD *)(a1 + 32) = v67;
  *(_OWORD *)(a1 + 48) = v57;
  long long v58 = v66;
  *(_OWORD *)a1 = v65;
  *(_OWORD *)(a1 + 16) = v58;
  *(_OWORD *)(a1 + 64) = v69;
  *(double *)(a1 + 80) = v70;
  sub_1B07BBE14((uint64_t)v74, &qword_1E9B3A4A0);
  uint64_t v59 = *((void *)v7 + 7);
  BOOL v34 = __OFADD__(v59, 1);
  uint64_t v20 = v59 + 1;
  if (!v34) {
    goto LABEL_37;
  }
LABEL_41:
  __break(1u);
}

uint64_t sub_1B0843424(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3A4A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t DisjointStack.init(with:)@<X0>(void (*a1)(_OWORD *)@<X0>, uint64_t a2@<X8>)
{
  __int16 v6 = 0;
  memset(v5, 0, sizeof(v5));
  if (a1) {
    a1(v5);
  }
  sub_1B07E8738((uint64_t)v5, a2);
  sub_1B07BDB64((uint64_t)a1);
  uint64_t result = sub_1B07E7B60((uint64_t)v5);
  *(void *)(a2 + 168) = MEMORY[0x1E4FBC860];
  return result;
}

uint64_t DisjointStack.insert(_:at:with:)(uint64_t a1, int64_t a2, char a3, void (*a4)(unsigned char *))
{
  sub_1B07E8738(v4, (uint64_t)v37);
  if (a4) {
    a4(v37);
  }
  double v9 = (int64_t *)(v4 + 168);
  if ((a3 & 1) == 0)
  {
    sub_1B07BBD78(a1, (uint64_t)&v25);
    sub_1B07E8738((uint64_t)v37, (uint64_t)&v27 + 8);
    if (*(void *)(*v9 + 16) < a2)
    {
      __break(1u);
    }
    else if ((a2 & 0x8000000000000000) == 0)
    {
      v23[10] = v35;
      v24[0] = v36[0];
      *(_OWORD *)((char *)v24 + 10) = *(_OWORD *)((char *)v36 + 10);
      v23[6] = v31;
      v23[7] = v32;
      v23[8] = v33;
      v23[9] = v34;
      v23[2] = v27;
      _OWORD v23[3] = v28;
      v23[4] = v29;
      v23[5] = v30;
      v23[0] = v25;
      v23[1] = v26;
      sub_1B07D054C(a2, a2, (uint64_t)v23);
      return sub_1B07E7B60((uint64_t)v37);
    }
    __break(1u);
    goto LABEL_14;
  }
  sub_1B07BBD78(a1, (uint64_t)&v25);
  sub_1B07E8738((uint64_t)v37, (uint64_t)&v27 + 8);
  a2 = *v9;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_14:
  }
    a2 = (int64_t)sub_1B07CED1C(0, *(void *)(a2 + 16) + 1, 1, (void *)a2);
  unint64_t v11 = *(void *)(a2 + 16);
  unint64_t v10 = *(void *)(a2 + 24);
  if (v11 >= v10 >> 1) {
    a2 = (int64_t)sub_1B07CED1C((void *)(v10 > 1), v11 + 1, 1, (void *)a2);
  }
  *(void *)(a2 + 16) = v11 + 1;
  double v12 = (_OWORD *)(a2 + 208 * v11);
  v12[2] = v25;
  long long v13 = v26;
  long long v14 = v27;
  long long v15 = v29;
  uint64_t v12[5] = v28;
  v12[6] = v15;
  _OWORD v12[3] = v13;
  v12[4] = v14;
  long long v16 = v30;
  long long v17 = v31;
  long long v18 = v33;
  v12[9] = v32;
  v12[10] = v18;
  v12[7] = v16;
  v12[8] = v17;
  long long v19 = v34;
  long long v20 = v35;
  long long v21 = v36[0];
  *(_OWORD *)((char *)v12 + 218) = *(_OWORD *)((char *)v36 + 10);
  v12[12] = v20;
  v12[13] = v21;
  v12[11] = v19;
  *double v9 = a2;
  return sub_1B07E7B60((uint64_t)v37);
}

void __swiftcall DisjointStack.layout(relativeTo:with:)(JetUI::DisjointStack::Placements *__return_ptr retstr, __C::CGRect relativeTo, UITraitCollection with)
{
  CGFloat height = relativeTo.size.height;
  CGFloat width = relativeTo.size.width;
  CGFloat y = relativeTo.origin.y;
  CGFloat x = relativeTo.origin.x;
  double v9 = *(void **)(v3 + 168);
  uint64_t v10 = v9[2];
  unint64_t v11 = with.super.isa;
  swift_bridgeObjectRetain();
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3A548);
    double v12 = (void *)sub_1B0869FF8();
    v12[2] = v10;
    uint64_t v13 = 4;
    do
    {
      long long v14 = &v12[v13];
      *(_OWORD *)long long v14 = 0uLL;
      *((_OWORD *)v14 + 1) = 0uLL;
      *((unsigned char *)v14 + 32) = 1;
      v13 += 5;
      --v10;
    }
    while (v10);
  }
  else
  {
    double v12 = (void *)MEMORY[0x1E4FBC860];
  }
  retstr->boundingRect.origin.CGFloat x = x;
  retstr->boundingRect.origin.CGFloat y = y;
  retstr->boundingRect.size.CGFloat width = width;
  retstr->boundingRect.size.CGFloat height = height;
  retstr->traits.super.isa = v11;
  retstr->children._rawValue = v9;
  retstr->measurements._rawValue = v12;
  *(_OWORD *)&retstr->walkingChildIndeCGFloat x = 0u;
  *(_OWORD *)&retstr->$__lazy_storage_$_contentBoundingRect.value.origin.CGFloat y = 0u;
  retstr->$__lazy_storage_$_contentBoundingRect.value.size.CGFloat height = 0.0;
  retstr->$__lazy_storage_$_contentBoundingRect.is_nil = 1;
}

double (*DisjointStack.Properties.topEdge.modify())(void)
{
  return nullsub_1;
}

double (*DisjointStack.Properties.leadingEdge.modify())(void)
{
  return nullsub_1;
}

double (*DisjointStack.Properties.bottomEdge.modify())(void)
{
  return nullsub_1;
}

double (*DisjointStack.Properties.trailingEdge.modify())(void)
{
  return nullsub_1;
}

uint64_t DisjointStack.Properties.anchorsHugContent.getter()
{
  return *(unsigned __int8 *)(v0 + 160);
}

uint64_t DisjointStack.Properties.anchorsHugContent.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 160) = result;
  return result;
}

double (*DisjointStack.Properties.anchorsHugContent.modify())(void)
{
  return nullsub_1;
}

uint64_t DisjointStack.Properties.shouldSkip.getter()
{
  return *(unsigned __int8 *)(v0 + 161);
}

uint64_t DisjointStack.Properties.shouldSkip.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 161) = result;
  return result;
}

double (*DisjointStack.Properties.shouldSkip.modify())(void)
{
  return nullsub_1;
}

double sub_1B08438A8()
{
  if ((*(unsigned char *)(v0 + 96) & 1) == 0) {
    return *(double *)(v0 + 64);
  }
  sub_1B08438E8(v0);
  *(double *)(v0 + 64) = result;
  *(void *)(v0 + 72) = v2;
  *(void *)(v0 + 80) = v3;
  *(void *)(v0 + 88) = v4;
  *(unsigned char *)(v0 + 96) = 0;
  return result;
}

void sub_1B08438E8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    __int16 v6 = *(char **)(a1 + 48);
    double v7 = 0.0;
    uint64_t v8 = 32;
    double v9 = 0.0;
    uint64_t v27 = *(void *)(v2 + 16);
    while (v5 < *((void *)v6 + 2))
    {
      double v12 = &v6[v4];
      if (v6[v4 + 64])
      {
        uint64_t v13 = *(void *)(a1 + 40);
        if (v5 >= *(void *)(v13 + 16)) {
          goto LABEL_18;
        }
        sub_1B0843424(v13 + v8, (uint64_t)v28);
        double v14 = *(double *)(a1 + 16);
        double v15 = *(double *)(a1 + 24);
        long long v16 = *(void **)(a1 + 32);
        uint64_t v17 = v28[4];
        __swift_project_boxed_opaque_existential_1(v28, v28[3]);
        long long v18 = *(double (**)(double, double))(v17 + 8);
        id v19 = v16;
        double v11 = v18(v14, v15);
        double v10 = v20;
        uint64_t v22 = v21;
        uint64_t v24 = v23;

        sub_1B07BBE14((uint64_t)v28, &qword_1E9B3A4A0);
        __int16 v6 = *(char **)(a1 + 48);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(a1 + 48) = v6;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          __int16 v6 = sub_1B0860E70((uint64_t)v6);
        }
        uint64_t v3 = v27;
        if (v5 >= *((void *)v6 + 2)) {
          goto LABEL_19;
        }
        long long v26 = &v6[v4];
        *((double *)v26 + 4) = v11;
        *((double *)v26 + 5) = v10;
        *((void *)v26 + 6) = v22;
        *((void *)v26 + 7) = v24;
        v26[64] = 0;
        *(void *)(a1 + 48) = v6;
      }
      else
      {
        double v11 = *((double *)v12 + 4);
        double v10 = *((double *)v12 + 5);
      }
      ++v5;
      if (v9 <= v11) {
        double v9 = v11;
      }
      if (v7 <= v10) {
        double v7 = v10;
      }
      v4 += 40;
      v8 += 208;
      if (v3 == v5) {
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
  }
  else
  {
LABEL_16:
    CGRectGetMidX(*(CGRect *)a1);
    CGRectGetMidY(*(CGRect *)a1);
  }
}

unint64_t sub_1B0843AD4(unint64_t result)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v1 = v2;
  unint64_t v3 = result;
  uint64_t v9 = *((void *)v2 + 6);
  if (*(void *)(v9 + 16) <= result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v4 = 5 * result;
  if ((*(unsigned char *)(v9 + 40 * result + 64) & 1) == 0) {
    return result;
  }
  uint64_t v10 = *((void *)v2 + 5);
  if (*(void *)(v10 + 16) > result)
  {
    sub_1B0843424(v10 + 208 * result + 32, (uint64_t)v21);
    double v11 = v2[2];
    double v12 = v2[3];
    uint64_t v13 = (void *)*((void *)v2 + 4);
    uint64_t v14 = v21[4];
    __swift_project_boxed_opaque_existential_1(v21, v21[3]);
    double v15 = *(double (**)(double, double))(v14 + 8);
    id v16 = v13;
    double v8 = v15(v11, v12);
    uint64_t v7 = v17;
    uint64_t v6 = v18;
    uint64_t v5 = v19;

    sub_1B07BBE14((uint64_t)v21, &qword_1E9B3A4A0);
    uint64_t v2 = (double *)*((void *)v2 + 6);
    double result = swift_isUniquelyReferenced_nonNull_native();
    if (result) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  __break(1u);
LABEL_12:
  double result = (unint64_t)sub_1B0860E70((uint64_t)v2);
  uint64_t v2 = (double *)result;
LABEL_6:
  if (*((void *)v2 + 2) <= v3)
  {
    __break(1u);
  }
  else
  {
    double v20 = &v2[v4];
    v20[4] = v8;
    *((void *)v20 + 5) = v7;
    *((void *)v20 + 6) = v6;
    *((void *)v20 + 7) = v5;
    *((unsigned char *)v20 + 64) = 0;
    *((void *)v1 + 6) = v2;
  }
  return result;
}

uint64_t DisjointStack.inserting(_:at:with:)@<X0>(uint64_t a1@<X0>, int64_t a2@<X1>, char a3@<W2>, void (*a4)(unsigned char *)@<X3>, uint64_t a5@<X8>)
{
  char v9 = a3 & 1;
  sub_1B08001D8(v5, a5);
  return DisjointStack.insert(_:at:with:)(a1, a2, v9, a4);
}

void DisjointStack.add(_:with:)()
{
}

void DisjointStack.adding(_:with:)()
{
}

unint64_t sub_1B0843D6C(uint64_t a1)
{
  unint64_t result = sub_1B0843D94();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1B0843D94()
{
  unint64_t result = qword_1E9B3BAE0;
  if (!qword_1E9B3BAE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BAE0);
  }
  return result;
}

unint64_t sub_1B0843DEC()
{
  unint64_t result = qword_1E9B3BAE8;
  if (!qword_1E9B3BAE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BAE8);
  }
  return result;
}

unint64_t sub_1B0843E44()
{
  unint64_t result = qword_1E9B3BAF0;
  if (!qword_1E9B3BAF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BAF0);
  }
  return result;
}

uint64_t assignWithCopy for DisjointStack(uint64_t a1, long long *a2)
{
  uint64_t v4 = *((void *)a2 + 3);
  if (*(void *)(a1 + 24))
  {
    if (v4)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
    }
    else
    {
      sub_1B07BBE14(a1, &qword_1E9B3B148);
      uint64_t v5 = *((void *)a2 + 4);
      long long v6 = a2[1];
      *(_OWORD *)a1 = *a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(void *)(a1 + 32) = v5;
    }
  }
  else if (v4)
  {
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    (**(void (***)(uint64_t, long long *))(v4 - 8))(a1, a2);
  }
  else
  {
    long long v7 = *a2;
    long long v8 = a2[1];
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    *(_OWORD *)a1 = v7;
    *(_OWORD *)(a1 + 16) = v8;
  }
  char v9 = (_OWORD *)(a1 + 40);
  uint64_t v10 = (long long *)((char *)a2 + 40);
  uint64_t v11 = *((void *)a2 + 8);
  if (*(void *)(a1 + 64))
  {
    if (v11)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)a2 + 5);
    }
    else
    {
      sub_1B07BBE14(a1 + 40, &qword_1E9B3B148);
      uint64_t v12 = *((void *)a2 + 9);
      long long v13 = *(long long *)((char *)a2 + 56);
      *char v9 = *v10;
      *(_OWORD *)(a1 + 56) = v13;
      *(void *)(a1 + 72) = v12;
    }
  }
  else if (v11)
  {
    *(void *)(a1 + 64) = v11;
    *(void *)(a1 + 72) = *((void *)a2 + 9);
    (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 40, (uint64_t)a2 + 40);
  }
  else
  {
    long long v14 = *v10;
    long long v15 = *(long long *)((char *)a2 + 56);
    *(void *)(a1 + 72) = *((void *)a2 + 9);
    *char v9 = v14;
    *(_OWORD *)(a1 + 56) = v15;
  }
  id v16 = (_OWORD *)(a1 + 80);
  uint64_t v17 = a2 + 5;
  uint64_t v18 = *((void *)a2 + 13);
  if (*(void *)(a1 + 104))
  {
    if (v18)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 80), (uint64_t *)a2 + 10);
    }
    else
    {
      sub_1B07BBE14(a1 + 80, &qword_1E9B3B148);
      uint64_t v19 = *((void *)a2 + 14);
      long long v20 = a2[6];
      *id v16 = *v17;
      *(_OWORD *)(a1 + 96) = v20;
      *(void *)(a1 + 112) = v19;
    }
  }
  else if (v18)
  {
    *(void *)(a1 + 104) = v18;
    *(void *)(a1 + 112) = *((void *)a2 + 14);
    (**(void (***)(uint64_t, uint64_t))(v18 - 8))(a1 + 80, (uint64_t)(a2 + 5));
  }
  else
  {
    long long v21 = *v17;
    long long v22 = a2[6];
    *(void *)(a1 + 112) = *((void *)a2 + 14);
    *id v16 = v21;
    *(_OWORD *)(a1 + 96) = v22;
  }
  uint64_t v23 = (_OWORD *)(a1 + 120);
  uint64_t v24 = (long long *)((char *)a2 + 120);
  uint64_t v25 = *((void *)a2 + 18);
  if (*(void *)(a1 + 144))
  {
    if (v25)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 120), (uint64_t *)a2 + 15);
    }
    else
    {
      sub_1B07BBE14(a1 + 120, &qword_1E9B3B148);
      uint64_t v26 = *((void *)a2 + 19);
      long long v27 = *(long long *)((char *)a2 + 136);
      *uint64_t v23 = *v24;
      *(_OWORD *)(a1 + 136) = v27;
      *(void *)(a1 + 152) = v26;
    }
  }
  else if (v25)
  {
    *(void *)(a1 + 144) = v25;
    *(void *)(a1 + 152) = *((void *)a2 + 19);
    (**(void (***)(uint64_t, uint64_t))(v25 - 8))(a1 + 120, (uint64_t)a2 + 120);
  }
  else
  {
    long long v28 = *v24;
    long long v29 = *(long long *)((char *)a2 + 136);
    *(void *)(a1 + 152) = *((void *)a2 + 19);
    *uint64_t v23 = v28;
    *(_OWORD *)(a1 + 136) = v29;
  }
  *(unsigned char *)(a1 + 160) = *((unsigned char *)a2 + 160);
  *(unsigned char *)(a1 + 161) = *((unsigned char *)a2 + 161);
  *(void *)(a1 + 168) = *((void *)a2 + 21);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DisjointStack(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    if (*(void *)(a2 + 24)) {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    else {
      sub_1B07BBE14(a1, &qword_1E9B3B148);
    }
  }
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  if (*(void *)(a1 + 64))
  {
    if (*(void *)(a2 + 64)) {
      __swift_destroy_boxed_opaque_existential_1(a1 + 40);
    }
    else {
      sub_1B07BBE14(a1 + 40, &qword_1E9B3B148);
    }
  }
  long long v5 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v5;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  if (*(void *)(a1 + 104))
  {
    if (*(void *)(a2 + 104)) {
      __swift_destroy_boxed_opaque_existential_1(a1 + 80);
    }
    else {
      sub_1B07BBE14(a1 + 80, &qword_1E9B3B148);
    }
  }
  long long v6 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v6;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  if (*(void *)(a1 + 144))
  {
    if (*(void *)(a2 + 144)) {
      __swift_destroy_boxed_opaque_existential_1(a1 + 120);
    }
    else {
      sub_1B07BBE14(a1 + 120, &qword_1E9B3B148);
    }
  }
  long long v7 = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = v7;
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  *(unsigned char *)(a1 + 161) = *(unsigned char *)(a2 + 161);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for DisjointStack.EdgePosition()
{
  return &type metadata for DisjointStack.EdgePosition;
}

uint64_t initializeWithCopy for DisjointStack.Properties(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    uint64_t v5 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = v5;
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1, a2);
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
  }
  long long v7 = (_OWORD *)(a1 + 40);
  long long v8 = (_OWORD *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 64);
  if (v9)
  {
    uint64_t v10 = *(void *)(a2 + 72);
    *(void *)(a1 + 64) = v9;
    *(void *)(a1 + 72) = v10;
    (**(void (***)(_OWORD *, _OWORD *))(v9 - 8))(v7, v8);
  }
  else
  {
    long long v11 = *(_OWORD *)(a2 + 56);
    *long long v7 = *v8;
    *(_OWORD *)(a1 + 56) = v11;
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
  }
  uint64_t v12 = (_OWORD *)(a1 + 80);
  long long v13 = (_OWORD *)(a2 + 80);
  uint64_t v14 = *(void *)(a2 + 104);
  if (v14)
  {
    uint64_t v15 = *(void *)(a2 + 112);
    *(void *)(a1 + 104) = v14;
    *(void *)(a1 + 112) = v15;
    (**(void (***)(_OWORD *, _OWORD *))(v14 - 8))(v12, v13);
  }
  else
  {
    long long v16 = *(_OWORD *)(a2 + 96);
    *uint64_t v12 = *v13;
    *(_OWORD *)(a1 + 96) = v16;
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
  }
  uint64_t v17 = (_OWORD *)(a1 + 120);
  uint64_t v18 = (_OWORD *)(a2 + 120);
  uint64_t v19 = *(void *)(a2 + 144);
  if (v19)
  {
    uint64_t v20 = *(void *)(a2 + 152);
    *(void *)(a1 + 144) = v19;
    *(void *)(a1 + 152) = v20;
    (**(void (***)(_OWORD *, _OWORD *))(v19 - 8))(v17, v18);
  }
  else
  {
    long long v21 = *(_OWORD *)(a2 + 136);
    *uint64_t v17 = *v18;
    *(_OWORD *)(a1 + 136) = v21;
    *(void *)(a1 + 152) = *(void *)(a2 + 152);
  }
  *(_WORD *)(a1 + 160) = *(_WORD *)(a2 + 160);
  return a1;
}

uint64_t assignWithCopy for DisjointStack.Properties(uint64_t a1, long long *a2)
{
  uint64_t v4 = *((void *)a2 + 3);
  if (*(void *)(a1 + 24))
  {
    if (v4)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
    }
    else
    {
      sub_1B07BBE14(a1, &qword_1E9B3B148);
      uint64_t v5 = *((void *)a2 + 4);
      long long v6 = a2[1];
      *(_OWORD *)a1 = *a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(void *)(a1 + 32) = v5;
    }
  }
  else if (v4)
  {
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    (**(void (***)(uint64_t, long long *))(v4 - 8))(a1, a2);
  }
  else
  {
    long long v7 = *a2;
    long long v8 = a2[1];
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    *(_OWORD *)a1 = v7;
    *(_OWORD *)(a1 + 16) = v8;
  }
  uint64_t v9 = (_OWORD *)(a1 + 40);
  uint64_t v10 = (long long *)((char *)a2 + 40);
  uint64_t v11 = *((void *)a2 + 8);
  if (*(void *)(a1 + 64))
  {
    if (v11)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)a2 + 5);
    }
    else
    {
      sub_1B07BBE14(a1 + 40, &qword_1E9B3B148);
      uint64_t v12 = *((void *)a2 + 9);
      long long v13 = *(long long *)((char *)a2 + 56);
      *uint64_t v9 = *v10;
      *(_OWORD *)(a1 + 56) = v13;
      *(void *)(a1 + 72) = v12;
    }
  }
  else if (v11)
  {
    *(void *)(a1 + 64) = v11;
    *(void *)(a1 + 72) = *((void *)a2 + 9);
    (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 40, (uint64_t)a2 + 40);
  }
  else
  {
    long long v14 = *v10;
    long long v15 = *(long long *)((char *)a2 + 56);
    *(void *)(a1 + 72) = *((void *)a2 + 9);
    *uint64_t v9 = v14;
    *(_OWORD *)(a1 + 56) = v15;
  }
  long long v16 = (_OWORD *)(a1 + 80);
  uint64_t v17 = a2 + 5;
  uint64_t v18 = *((void *)a2 + 13);
  if (*(void *)(a1 + 104))
  {
    if (v18)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 80), (uint64_t *)a2 + 10);
    }
    else
    {
      sub_1B07BBE14(a1 + 80, &qword_1E9B3B148);
      uint64_t v19 = *((void *)a2 + 14);
      long long v20 = a2[6];
      *long long v16 = *v17;
      *(_OWORD *)(a1 + 96) = v20;
      *(void *)(a1 + 112) = v19;
    }
  }
  else if (v18)
  {
    *(void *)(a1 + 104) = v18;
    *(void *)(a1 + 112) = *((void *)a2 + 14);
    (**(void (***)(uint64_t, uint64_t))(v18 - 8))(a1 + 80, (uint64_t)(a2 + 5));
  }
  else
  {
    long long v21 = *v17;
    long long v22 = a2[6];
    *(void *)(a1 + 112) = *((void *)a2 + 14);
    *long long v16 = v21;
    *(_OWORD *)(a1 + 96) = v22;
  }
  uint64_t v23 = (_OWORD *)(a1 + 120);
  uint64_t v24 = (long long *)((char *)a2 + 120);
  uint64_t v25 = *((void *)a2 + 18);
  if (*(void *)(a1 + 144))
  {
    if (v25)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 120), (uint64_t *)a2 + 15);
    }
    else
    {
      sub_1B07BBE14(a1 + 120, &qword_1E9B3B148);
      uint64_t v26 = *((void *)a2 + 19);
      long long v27 = *(long long *)((char *)a2 + 136);
      *uint64_t v23 = *v24;
      *(_OWORD *)(a1 + 136) = v27;
      *(void *)(a1 + 152) = v26;
    }
  }
  else if (v25)
  {
    *(void *)(a1 + 144) = v25;
    *(void *)(a1 + 152) = *((void *)a2 + 19);
    (**(void (***)(uint64_t, uint64_t))(v25 - 8))(a1 + 120, (uint64_t)a2 + 120);
  }
  else
  {
    long long v28 = *v24;
    long long v29 = *(long long *)((char *)a2 + 136);
    *(void *)(a1 + 152) = *((void *)a2 + 19);
    *uint64_t v23 = v28;
    *(_OWORD *)(a1 + 136) = v29;
  }
  *(unsigned char *)(a1 + 160) = *((unsigned char *)a2 + 160);
  *(unsigned char *)(a1 + 161) = *((unsigned char *)a2 + 161);
  return a1;
}

__n128 __swift_memcpy162_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  long long v4 = a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  __n128 result = (__n128)a2[7];
  long long v8 = a2[8];
  long long v9 = a2[9];
  *(_WORD *)(a1 + 160) = *((_WORD *)a2 + 80);
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  *(__n128 *)(a1 + 112) = result;
  return result;
}

uint64_t assignWithTake for DisjointStack.Properties(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    if (*(void *)(a2 + 24)) {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    else {
      sub_1B07BBE14(a1, &qword_1E9B3B148);
    }
  }
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  if (*(void *)(a1 + 64))
  {
    if (*(void *)(a2 + 64)) {
      __swift_destroy_boxed_opaque_existential_1(a1 + 40);
    }
    else {
      sub_1B07BBE14(a1 + 40, &qword_1E9B3B148);
    }
  }
  long long v5 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v5;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  if (*(void *)(a1 + 104))
  {
    if (*(void *)(a2 + 104)) {
      __swift_destroy_boxed_opaque_existential_1(a1 + 80);
    }
    else {
      sub_1B07BBE14(a1 + 80, &qword_1E9B3B148);
    }
  }
  long long v6 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v6;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  if (*(void *)(a1 + 144))
  {
    if (*(void *)(a2 + 144)) {
      __swift_destroy_boxed_opaque_existential_1(a1 + 120);
    }
    else {
      sub_1B07BBE14(a1 + 120, &qword_1E9B3B148);
    }
  }
  long long v7 = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = v7;
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  *(unsigned char *)(a1 + 161) = *(unsigned char *)(a2 + 161);
  return a1;
}

uint64_t getEnumTagSinglePayload for DisjointStack.Properties(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 162)) {
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

uint64_t storeEnumTagSinglePayload for DisjointStack.Properties(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 160) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 162) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 162) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DisjointStack.Properties()
{
  return &type metadata for DisjointStack.Properties;
}

ValueMetadata *type metadata accessor for DisjointStack.Placements()
{
  return &type metadata for DisjointStack.Placements;
}

uint64_t dispatch thunk of _PlaceableCompatibilityWrapper._unwrapped.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

NSAttributedString __swiftcall NSAttributedString.init(attributedString:defaultAttributes:)(NSAttributedString attributedString, Swift::OpaquePointer defaultAttributes)
{
  id v3 = [(objc_class *)attributedString.super.isa string];
  sub_1B0869D98();

  id v4 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
  long long v5 = (void *)sub_1B0869D68();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1B07BE6C4();
  long long v6 = (void *)sub_1B0869CA8();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v4, sel_initWithString_attributes_, v5, v6);

  id v8 = [(objc_class *)attributedString.super.isa length];
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_1B07CA3DC;
  *(void *)(v10 + 24) = v9;
  v15[4] = sub_1B0844CE4;
  v15[5] = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 1107296256;
  v15[2] = sub_1B07C8AA0;
  void v15[3] = &block_descriptor_8;
  uint64_t v11 = _Block_copy(v15);
  id v12 = v7;
  swift_retain();
  swift_release();
  -[objc_class enumerateAttributesInRange:options:usingBlock:](attributedString.super.isa, sel_enumerateAttributesInRange_options_usingBlock_, 0, v8, 0, v11);
  _Block_release(v11);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
  result.super.isa = (Class)swift_release();
  if (v8)
  {
    __break(1u);
  }
  else
  {
    id v14 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithAttributedString_, v12);
    swift_release();

    return (NSAttributedString)v14;
  }
  return result;
}

void sub_1B0844BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  type metadata accessor for Key(0);
  sub_1B07BE6C4();
  id v8 = (id)sub_1B0869CA8();
  objc_msgSend(a5, sel_addAttributes_range_, v8, a2, a3);
}

uint64_t sub_1B0844C9C()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B0844CD4()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B0844CE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B07C8A78(a1, a2, a3, a4, *(uint64_t (**)(void))(v4 + 16));
}

uint64_t block_destroy_helper_8()
{
  return swift_release();
}

uint64_t sub_1B0844CF4(void *a1, void *a2)
{
  objc_msgSend(a1, sel_size);
  double v5 = v4;
  objc_msgSend(a2, sel_size);
  if (v5 <= v6) {
    double v5 = v6;
  }
  objc_msgSend(a1, sel_size);
  double v8 = v7;
  objc_msgSend(a2, sel_size);
  double v10 = v8 + v9;
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB17D8]), sel_initWithSize_, v5, v10);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(double *)(v12 + 24) = v5;
  *(double *)(v12 + 32) = v10;
  *(void *)(v12 + 40) = a2;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_1B0844FF0;
  *(void *)(v13 + 24) = v12;
  v20[4] = sub_1B0845010;
  v20[5] = v13;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 1107296256;
  _OWORD v20[2] = sub_1B07D7B20;
  v20[3] = &block_descriptor_9;
  id v14 = _Block_copy(v20);
  id v15 = a1;
  id v16 = a2;
  swift_retain();
  swift_release();
  id v17 = objc_msgSend(v11, sel_imageWithActions_, v14);

  _Block_release(v14);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0) {
    return (uint64_t)v17;
  }
  __break(1u);
  return result;
}

id sub_1B0844EE4(int a1, id a2, double a3, double a4, void *a5)
{
  objc_msgSend(a2, sel_size);
  double v9 = a4 - v8;
  objc_msgSend(a2, sel_size);
  double v11 = v10;
  objc_msgSend(a2, sel_size);
  objc_msgSend(a2, sel_drawInRect_, 0.0, v9, v11, v12);
  objc_msgSend(a5, sel_size);
  double v14 = v13;
  objc_msgSend(a5, sel_size);

  return objc_msgSend(a5, sel_drawInRect_, 0.0, 0.0, v14, v15);
}

uint64_t sub_1B0844FB0()
{
  return MEMORY[0x1F4186498](v0, 48, 7);
}

id sub_1B0844FF0(int a1)
{
  return sub_1B0844EE4(a1, *(id *)(v1 + 16), *(double *)(v1 + 24), *(double *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_1B0845000()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B0845010(uint64_t a1)
{
  return sub_1B07D7AF8(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t block_destroy_helper_9()
{
  return swift_release();
}

uint64_t _s5JetUI8AdaptiveVyACxcAA12CustomLayoutRzlufC_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v7 = *(void *)(a3 + 8);
  a4[3] = a2;
  a4[4] = v7;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a4);
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32))(boxed_opaque_existential_0, a1, a2);
  a4[5] = MEMORY[0x1E4FBC860];
  return result;
}

__n128 Adaptive.init(_:)@<Q0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  a2[3] = (uint64_t)&type metadata for Adaptive;
  a2[4] = (uint64_t)&protocol witness table for Adaptive;
  uint64_t v4 = swift_allocObject();
  *a2 = v4;
  long long v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v4 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v4 + 32) = v5;
  __n128 result = *(__n128 *)(a1 + 32);
  *(__n128 *)(v4 + 48) = result;
  a2[5] = MEMORY[0x1E4FBC860];
  return result;
}

uint64_t sub_1B0845110()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1B0845154(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a2, a1);
  *(void *)(a2 + 40) = *(void *)(a1 + 40);
  swift_bridgeObjectRetain();
  return a2;
}

__n128 _s5JetUI8AdaptiveV8onCustomyACSbSo17UITraitCollectionCc_xtAA0E6LayoutRzlF_0@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  sub_1B0845154(v6, a6);
  uint64_t v13 = *(void *)(a5 + 8);
  *((void *)&v24 + 1) = a4;
  uint64_t v25 = v13;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v23);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(boxed_opaque_existential_0, a3, a4);
  v22.n128_u64[0] = a1;
  v22.n128_u64[1] = a2;
  double v15 = *(char **)(a6 + 40);
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    double v15 = sub_1B07CF698(0, *((void *)v15 + 2) + 1, 1, v15);
  }
  unint64_t v17 = *((void *)v15 + 2);
  unint64_t v16 = *((void *)v15 + 3);
  if (v17 >= v16 >> 1) {
    double v15 = sub_1B07CF698((char *)(v16 > 1), v17 + 1, 1, v15);
  }
  *((void *)v15 + 2) = v17 + 1;
  uint64_t v18 = &v15[56 * v17];
  uint64_t v19 = v25;
  __n128 result = v22;
  long long v21 = v24;
  *((_OWORD *)v18 + 3) = v23;
  *((_OWORD *)v18 + 4) = v21;
  *((__n128 *)v18 + 2) = v22;
  *((void *)v18 + 10) = v19;
  *(void *)(a6 + 40) = v15;
  return result;
}

__n128 Adaptive.onCustom(_:_:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  sub_1B0845154(v5, a4);
  uint64_t v10 = swift_allocObject();
  sub_1B0845154(a3, v10 + 16);
  double v11 = *(char **)(a4 + 40);
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    double v11 = sub_1B07CF698(0, *((void *)v11 + 2) + 1, 1, v11);
  }
  unint64_t v13 = *((void *)v11 + 2);
  unint64_t v12 = *((void *)v11 + 3);
  if (v13 >= v12 >> 1) {
    double v11 = sub_1B07CF698((char *)(v12 > 1), v13 + 1, 1, v11);
  }
  *((void *)v11 + 2) = v13 + 1;
  double v14 = &v11[56 * v13];
  *((void *)v14 + 4) = a1;
  *((void *)v14 + 5) = a2;
  *((void *)v14 + 6) = v10;
  __n128 result = v16;
  *(__n128 *)(v14 + 56) = v16;
  *((void *)v14 + 9) = &type metadata for Adaptive;
  *((void *)v14 + 10) = &protocol witness table for Adaptive;
  *(void *)(a4 + 40) = v11;
  return result;
}

uint64_t Adaptive.onAccessibleContentSize<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Adaptive.onCustom<A>(_:_:)(sub_1B0845448, 0, a1, a2, a3);
}

{
  return Adaptive.onCustom<A>(_:_:)(sub_1B0845448, 0, a1, a2, a3);
}

__n128 Adaptive.onAccessibleContentSize(_:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1B0845154(v2, a2);
  uint64_t v5 = swift_allocObject();
  sub_1B0845154(a1, v5 + 16);
  uint64_t v6 = *(char **)(a2 + 40);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v6 = sub_1B07CF698(0, *((void *)v6 + 2) + 1, 1, v6);
  }
  unint64_t v8 = *((void *)v6 + 2);
  unint64_t v7 = *((void *)v6 + 3);
  if (v8 >= v7 >> 1) {
    uint64_t v6 = sub_1B07CF698((char *)(v7 > 1), v8 + 1, 1, v6);
  }
  *((void *)v6 + 2) = v8 + 1;
  double v9 = &v6[56 * v8];
  *((void *)v9 + 4) = sub_1B0845448;
  *((void *)v9 + 5) = 0;
  *((void *)v9 + 6) = v5;
  __n128 result = v11;
  *(__n128 *)(v9 + 56) = v11;
  *((void *)v9 + 9) = &type metadata for Adaptive;
  *((void *)v9 + 10) = &protocol witness table for Adaptive;
  *(void *)(a2 + 40) = v6;
  return result;
}

uint64_t sub_1B0845584(void *a1)
{
  id v1 = objc_msgSend(a1, sel_preferredContentSizeCategory);
  char v2 = sub_1B086A348();

  return v2 & 1;
}

uint64_t Adaptive.bestLayout(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + 40);
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return sub_1B07BBD78(v2, a2);
  }
  uint64_t v7 = v4 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_1B0845CC4(v7, (uint64_t)&v10);
    unint64_t v8 = v10;
    swift_retain();
    LOBYTE(v8) = v8(a1);
    swift_release();
    if (v8) {
      break;
    }
    sub_1B0845CFC((uint64_t)&v10);
    v7 += 56;
    if (!--v5)
    {
      swift_bridgeObjectRelease();
      return sub_1B07BBD78(v2, a2);
    }
  }
  swift_bridgeObjectRelease();
  sub_1B07BBD78((uint64_t)&v11, a2);
  return sub_1B0845CFC((uint64_t)&v10);
}

uint64_t Adaptive._bestLayoutForTesting(with:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 40);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v5 = v2 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_1B0845CC4(v5, (uint64_t)&v8);
      uint64_t v6 = v8;
      swift_retain();
      LOBYTE(v6) = v6(a1);
      swift_release();
      if (v6) {
        break;
      }
      sub_1B0845CFC((uint64_t)&v8);
      v5 += 56;
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    sub_1B07BBD78((uint64_t)&v9, (uint64_t)v10);
    sub_1B0845CFC((uint64_t)&v8);
  }
  else
  {
LABEL_6:
    sub_1B07BBD78(v1, (uint64_t)v10);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595770);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3B628);
  return swift_dynamicCast();
}

JUMeasurements __swiftcall Adaptive.measure(toFit:with:)(CGSize toFit, UITraitCollection with)
{
  double height = toFit.height;
  double width = toFit.width;
  Adaptive.bestLayout(with:)((uint64_t)with.super.isa, (uint64_t)v18);
  uint64_t v5 = v19;
  uint64_t v6 = v20;
  __swift_project_boxed_opaque_existential_1(v18, v19);
  double v7 = (*(double (**)(Class, uint64_t, uint64_t, double, double))(v6 + 8))(with.super.isa, v5, v6, width, height);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.vaCGFloat r1 = v15;
  result.var0 = v14;
  return result;
}

Swift::Void __swiftcall Adaptive.place(at:with:)(__C::CGRect at, UITraitCollection with)
{
  double height = at.size.height;
  double width = at.size.width;
  double y = at.origin.y;
  double x = at.origin.x;
  Adaptive.bestLayout(with:)((uint64_t)with.super.isa, (uint64_t)v9);
  uint64_t v7 = v10;
  uint64_t v8 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  (*(void (**)(Class, uint64_t, uint64_t, double, double, double, double))(v8 + 16))(with.super.isa, v7, v8, x, y, width, height);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
}

JetUI::_LayoutAlignment __swiftcall Adaptive._layoutAlignment(with:)(UITraitCollection with)
{
  uint64_t v3 = v1;
  Adaptive.bestLayout(with:)((uint64_t)with.super.isa, (uint64_t)v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595770);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595748);
  if (swift_dynamicCast())
  {
    sub_1B07BA8FC(v7, (uint64_t)v10);
    uint64_t v4 = v11;
    uint64_t v5 = v12;
    __swift_project_boxed_opaque_existential_1(v10, v11);
    (*(void (**)(Class, uint64_t, uint64_t))(v5 + 8))(with.super.isa, v4, v5);
    return (JetUI::_LayoutAlignment)__swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  else
  {
    uint64_t v8 = 0;
    memset(v7, 0, sizeof(v7));
    JetUI::_LayoutAlignment v6 = (JetUI::_LayoutAlignment)sub_1B0845D30((uint64_t)v7);
    *uint64_t v3 = 0;
  }
  return v6;
}

uint64_t Adaptive._eraseToAnyForTesting(with:)(uint64_t a1)
{
  Adaptive.bestLayout(with:)(a1, (uint64_t)&v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595770);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3B628);
  swift_dynamicCast();
  uint64_t v2 = v7;
  uint64_t v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 8))(a1, v2, v3);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

double sub_1B0845AB0(uint64_t a1, double a2, double a3)
{
  Adaptive.bestLayout(with:)(a1, (uint64_t)v10);
  uint64_t v6 = v11;
  uint64_t v7 = v12;
  __swift_project_boxed_opaque_existential_1(v10, v11);
  double v8 = (*(double (**)(uint64_t, uint64_t, uint64_t, double, double))(v7 + 8))(a1, v6, v7, a2, a3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  return v8;
}

uint64_t sub_1B0845B64(uint64_t a1, double a2, double a3, double a4, double a5)
{
  Adaptive.bestLayout(with:)(a1, (uint64_t)v13);
  uint64_t v10 = v14;
  uint64_t v11 = v15;
  __swift_project_boxed_opaque_existential_1(v13, v14);
  (*(void (**)(uint64_t, uint64_t, uint64_t, double, double, double, double))(v11 + 16))(a1, v10, v11, a2, a3, a4, a5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

uint64_t sub_1B0845C0C(uint64_t a1)
{
  Adaptive.bestLayout(with:)(a1, (uint64_t)&v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595770);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3B628);
  swift_dynamicCast();
  uint64_t v2 = v7;
  uint64_t v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 8))(a1, v2, v3);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

uint64_t sub_1B0845CC4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1B0845CFC(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B0845D30(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595750);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t destroy for Adaptive(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Adaptive(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for Adaptive(uint64_t *a1, uint64_t *a2)
{
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for Adaptive(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for Adaptive()
{
  return &type metadata for Adaptive;
}

uint64_t destroy for Adaptive.Alternate(uint64_t a1)
{
  swift_release();

  return __swift_destroy_boxed_opaque_existential_1(a1 + 16);
}

uint64_t initializeWithCopy for Adaptive.Alternate(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = a2 + 16;
  long long v5 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v5;
  uint64_t v6 = v5;
  uint64_t v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_retain();
  v7(a1 + 16, v4, v6);
  return a1;
}

void *assignWithCopy for Adaptive.Alternate(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
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

uint64_t assignWithTake for Adaptive.Alternate(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for Adaptive.Alternate(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Adaptive.Alternate(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Adaptive.Alternate()
{
  return &type metadata for Adaptive.Alternate;
}

uint64_t VerticalStack.add(_:with:)(void *a1, void (*a2)(_OWORD *))
{
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v3);
  Measurable.placeable.getter(v3, v4, v6);
  VerticalStack.add(_:with:)((uint64_t)v6, a2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

uint64_t VerticalStack.adding(_:with:)@<X0>(void *a1@<X0>, void (*a2)(_OWORD *)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  Measurable.placeable.getter(v7, v8, v10);
  sub_1B07B3FEC(v4, a3);
  VerticalStack.add(_:with:)((uint64_t)v10, a2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
}

uint64_t VerticalStack.insert(_:at:with:)(void *a1, int64_t a2, void (*a3)(unsigned char *))
{
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  Measurable.placeable.getter(v5, v6, v8);
  VerticalStack.insert(_:at:with:)((uint64_t)v8, a2, a3);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t VerticalStack.inserting(_:at:with:)@<X0>(void *a1@<X0>, int64_t a2@<X1>, void (*a3)(unsigned char *)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  Measurable.placeable.getter(v9, v10, v12);
  sub_1B07B3FEC(v5, a4);
  VerticalStack.insert(_:at:with:)((uint64_t)v12, a2, a3);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

__n128 FrameLayout.init(view:skipLayoutMeasurements:layoutMargins:)@<Q0>(long long *a1@<X0>, char a2@<W1>, uint64_t *a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  sub_1B07BA8FC(a1, (uint64_t)v16);
  BYTE8(v17) = a2;
  *(double *)&long long v18 = a4;
  *((double *)&v18 + 1) = a5;
  *(double *)&long long v19 = a6;
  *((double *)&v19 + 1) = a7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BAF8);
  uint64_t v13 = swift_allocObject();
  long long v14 = v18;
  *(_OWORD *)(v13 + 48) = v17;
  *(_OWORD *)(v13 + 64) = v14;
  *(_OWORD *)(v13 + 80) = v19;
  __n128 result = (__n128)v16[1];
  *(_OWORD *)(v13 + 16) = v16[0];
  *(__n128 *)(v13 + 32) = result;
  *a3 = v13;
  return result;
}

uint64_t FrameLayout.view.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B0846428(v3, (uint64_t)v5);
  return sub_1B07BA8FC(v5, a1);
}

uint64_t sub_1B0846428(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a2, a1);
  *(unsigned char *)(a2 + 40) = *(unsigned char *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 48) = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 64) = v5;
  return a2;
}

uint64_t sub_1B084649C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + 16;
  swift_beginAccess();
  sub_1B0846428(v3, (uint64_t)v5);
  return sub_1B07BA8FC(v5, a2);
}

uint64_t FrameLayout.view.setter(uint64_t *a1)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B0846428(v3, (uint64_t)v9);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v9, a1);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v4 = *v1 + 16;
    swift_beginAccess();
    sub_1B08465E4(v9, v4);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BAF8);
    long long v5 = (_OWORD *)swift_allocObject();
    long long v6 = v9[3];
    v5[3] = v9[2];
    v5[4] = v6;
    long long v5[5] = v9[4];
    long long v7 = v9[1];
    v5[1] = v9[0];
    v5[2] = v7;
    swift_release();
    *uint64_t v1 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1B08465E4(long long *a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a2);
  long long v4 = *a1;
  long long v5 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v4;
  *(_OWORD *)(a2 + 16) = v5;
  *(unsigned char *)(a2 + 40) = *((unsigned char *)a1 + 40);
  long long v6 = a1[4];
  *(_OWORD *)(a2 + 48) = a1[3];
  *(_OWORD *)(a2 + 64) = v6;
  return a2;
}

void (*FrameLayout.view.modify(long long **a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = (long long *)malloc(0x98uLL);
  *a1 = v3;
  *((void *)v3 + 18) = v1;
  uint64_t v4 = *v1 + 16;
  swift_beginAccess();
  sub_1B0846428(v4, (uint64_t)v3);
  sub_1B07BA8FC(v3, (uint64_t)(v3 + 5));
  return sub_1B08466C4;
}

void sub_1B08466C4(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (uint64_t)(*a1 + 10);
  if (a2)
  {
    sub_1B07BBD78((uint64_t)(*a1 + 10), (uint64_t)v2);
    FrameLayout.view.setter(v2);
    __swift_destroy_boxed_opaque_existential_1(v3);
  }
  else
  {
    FrameLayout.view.setter(*a1 + 10);
  }

  free(v2);
}

uint64_t FrameLayout.skipLayoutMeasurements.getter()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  return *(unsigned __int8 *)(v1 + 56);
}

uint64_t FrameLayout.skipLayoutMeasurements.setter(char a1)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B0846428(v3, (uint64_t)v9);
  BYTE8(v10) = a1;
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v4 = *v1 + 16;
    swift_beginAccess();
    sub_1B08465E4(v9, v4);
    return swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BAF8);
    long long v6 = (_OWORD *)swift_allocObject();
    long long v7 = v11;
    void v6[3] = v10;
    v6[4] = v7;
    void v6[5] = v12;
    long long v8 = v9[1];
    v6[1] = v9[0];
    v6[2] = v8;
    uint64_t result = swift_release();
    *uint64_t v1 = v6;
  }
  return result;
}

void (*FrameLayout.skipLayoutMeasurements.modify(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = *v1;
  swift_beginAccess();
  *((unsigned char *)v3 + 32) = *(unsigned char *)(v4 + 56);
  return sub_1B08468C8;
}

void sub_1B08468C8(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  FrameLayout.skipLayoutMeasurements.setter(*(unsigned char *)(*(void *)a1 + 32));

  free(v1);
}

double FrameLayout.layoutMargins.getter()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  return *(double *)(v1 + 64);
}

uint64_t FrameLayout.layoutMargins.setter(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = *v4 + 16;
  swift_beginAccess();
  sub_1B0846428(v9, (uint64_t)v15);
  *(double *)&long long v16 = a1;
  *((double *)&v16 + 1) = a2;
  *(double *)&long long v17 = a3;
  *((double *)&v17 + 1) = a4;
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v10 = *v4 + 16;
    swift_beginAccess();
    sub_1B08465E4(v15, v10);
    return swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BAF8);
    long long v12 = (_OWORD *)swift_allocObject();
    long long v13 = v16;
    _OWORD v12[3] = v15[2];
    v12[4] = v13;
    void v12[5] = v17;
    long long v14 = v15[1];
    v12[1] = v15[0];
    v12[2] = v14;
    uint64_t result = swift_release();
    *uint64_t v4 = v12;
  }
  return result;
}

void (*FrameLayout.layoutMargins.modify(void *a1))(double **a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[7] = v1;
  uint64_t v4 = *v1;
  swift_beginAccess();
  long long v5 = *(_OWORD *)(v4 + 80);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(v4 + 64);
  *((_OWORD *)v3 + 1) = v5;
  return sub_1B0846AB8;
}

void sub_1B0846AB8(double **a1)
{
  uint64_t v1 = *a1;
  FrameLayout.layoutMargins.setter(**a1, (*a1)[1], (*a1)[2], (*a1)[3]);

  free(v1);
}

double FrameLayout.measurements(fitting:in:)(uint64_t a1, double a2, double a3)
{
  long long v7 = *v3;
  uint64_t v8 = (uint64_t)(*v3 + 2);
  swift_beginAccess();
  double v9 = a2 - (v7[9] + v7[11]);
  double v10 = a3 - (v7[8] + v7[10]);
  sub_1B0846428(v8, (uint64_t)v15);
  sub_1B07BA8FC(v15, (uint64_t)v16);
  uint64_t v11 = v17;
  uint64_t v12 = v18;
  __swift_project_boxed_opaque_existential_1(v16, v17);
  double v13 = (*(double (**)(uint64_t, uint64_t, double, double))(*(void *)(v12 + 8) + 8))(a1, v11, v9, v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  return v13;
}

void FrameLayout.placeChildren(relativeTo:in:)(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  uint64_t v13 = *v6;
  swift_beginAccess();
  double v14 = *(double *)(v13 + 64);
  double v15 = *(double *)(v13 + 72);
  double v16 = v15 + a3;
  double v17 = v14 + a4;
  double v18 = a5 - (v15 + *(double *)(v13 + 88));
  double v19 = a6 - (v14 + *(double *)(v13 + 80));
  if (*(unsigned char *)(v13 + 56) == 1)
  {
    sub_1B0846428(v13 + 16, (uint64_t)v36);
    sub_1B07BA8FC(v36, (uint64_t)v37);
    uint64_t v20 = v38;
    uint64_t v21 = v39;
    __swift_project_boxed_opaque_existential_1(v37, v38);
    (*(void (**)(uint64_t, uint64_t, double, double, double, double))(v21 + 24))(v20, v21, v16, v17, v18, v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    v40.origin.double x = v16;
    v40.origin.double y = v17;
    v40.size.double width = v18;
    v40.size.double height = v19;
    CGFloat Height = CGRectGetHeight(v40);
    uint64_t v23 = 0;
  }
  else
  {
    sub_1B0846428(v13 + 16, (uint64_t)v36);
    sub_1B07BA8FC(v36, (uint64_t)v37);
    uint64_t v24 = v38;
    uint64_t v25 = v39;
    __swift_project_boxed_opaque_existential_1(v37, v38);
    double v35 = (*(double (**)(uint64_t, uint64_t, double, double))(*(void *)(v25 + 8) + 8))(a1, v24, v18, v19);
    double v27 = v26;
    CGFloat Height = v28;
    uint64_t v23 = v29;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    v41.origin.double x = v16;
    v41.origin.double y = v17;
    v41.size.double width = v18;
    v41.size.double height = v19;
    double MinX = CGRectGetMinX(v41);
    v42.origin.double x = v16;
    v42.origin.double y = v17;
    v42.size.double width = v18;
    v42.size.double height = v19;
    CGFloat MinY = CGRectGetMinY(v42);
    sub_1B0846428(v13 + 16, (uint64_t)v36);
    sub_1B07BA8FC(v36, (uint64_t)v37);
    uint64_t v32 = v38;
    uint64_t v33 = v39;
    __swift_project_boxed_opaque_existential_1(v37, v38);
    double v34 = MinY;
    double v18 = v35;
    (*(void (**)(uint64_t, uint64_t, double, double, double, double))(v33 + 24))(v32, v33, MinX, v34, v35, v27);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    double v19 = v27;
  }
  *(double *)a2 = v16;
  *(double *)(a2 + 8) = v17;
  *(double *)(a2 + 16) = v18;
  *(double *)(a2 + 24) = v19;
  *(CGFloat *)(a2 + 32) = Height;
  *(void *)(a2 + 40) = v23;
}

uint64_t sub_1B0846E48(uint64_t a1)
{
  sub_1B07BBD78(a1, (uint64_t)v2);
  return FrameLayout.view.setter(v2);
}

uint64_t sub_1B0846E80@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 56);
  return result;
}

uint64_t sub_1B0846EC8(char *a1)
{
  return FrameLayout.skipLayoutMeasurements.setter(*a1);
}

__n128 sub_1B0846EF0@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  __n128 result = *(__n128 *)(v3 + 64);
  long long v5 = *(_OWORD *)(v3 + 80);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

uint64_t sub_1B0846F38(double *a1)
{
  return FrameLayout.layoutMargins.setter(*a1, a1[1], a1[2], a1[3]);
}

ValueMetadata *type metadata accessor for FrameLayout()
{
  return &type metadata for FrameLayout;
}

uint64_t initializeWithCopy for FrameLayout.Storage(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  return a1;
}

uint64_t assignWithCopy for FrameLayout.Storage(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return a1;
}

uint64_t assignWithTake for FrameLayout.Storage(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  return a1;
}

ValueMetadata *type metadata accessor for FrameLayout.Storage()
{
  return &type metadata for FrameLayout.Storage;
}

id sub_1B0847090(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v10 = objc_msgSend(a1, sel_layer);
  objc_msgSend(v10, sel_anchorPoint);
  double v12 = v11;
  double v14 = v13;

  v20.origin.double x = a2;
  v20.origin.double y = a3;
  v20.size.double width = a4;
  v20.size.double height = a5;
  double MinX = CGRectGetMinX(v20);
  v21.origin.double x = a2;
  v21.origin.double y = a3;
  v21.size.double width = a4;
  v21.size.double height = a5;
  double v16 = MinX + v12 * CGRectGetWidth(v21);
  v22.origin.double x = a2;
  v22.origin.double y = a3;
  v22.size.double width = a4;
  v22.size.double height = a5;
  double MinY = CGRectGetMinY(v22);
  v23.origin.double x = a2;
  v23.origin.double y = a3;
  v23.size.double width = a4;
  v23.size.double height = a5;
  objc_msgSend(a1, sel_setCenter_, v16, MinY + v14 * CGRectGetHeight(v23));
  objc_msgSend(a1, sel_bounds);

  return objc_msgSend(a1, sel_setBounds_);
}

CGFloat sub_1B08471C0()
{
  id v1 = *v0;
  id v2 = objc_msgSend(*v0, sel_layer);
  objc_msgSend(v2, sel_anchorPoint);
  double v4 = v3;

  objc_msgSend(v1, sel_center);
  double v6 = v5;
  objc_msgSend(v1, sel_frame);
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  CGFloat v10 = v6 - v4 * CGRectGetWidth(v12);
  v13.origin.double x = v10;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGRectGetHeight(v13);
  return v10;
}

id sub_1B084729C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  return sub_1B0847090(*v4, a1, a2, a3, a4);
}

void (*sub_1B08472A4(double **a1))(CGFloat **a1)
{
  double v3 = (double *)malloc(0x28uLL);
  *a1 = v3;
  double v4 = *v1;
  *((void *)v3 + 4) = v4;
  id v5 = objc_msgSend(v4, sel_layer);
  objc_msgSend(v5, sel_anchorPoint);
  double v7 = v6;
  double v9 = v8;

  objc_msgSend(v4, sel_center);
  double v11 = v10;
  double v13 = v12;
  objc_msgSend(v4, sel_frame);
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  CGFloat v17 = v11 - v7 * CGRectGetWidth(v20);
  v21.origin.double x = v17;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGFloat v18 = CGRectGetHeight(v21);
  *double v3 = v17;
  v3[1] = v13 - v9 * v18;
  v3[2] = width;
  v3[3] = height;
  return sub_1B08473B8;
}

void sub_1B08473B8(CGFloat **a1)
{
  id v1 = *a1;
  sub_1B0847090(*((void **)*a1 + 4), *v1, v1[1], v1[2], v1[3]);

  free(v1);
}

id sub_1B08473FC()
{
  return objc_msgSend(*v0, sel_jet_focusedFrame);
}

id UIView.withUntransformedFrame.getter@<X0>(void *a1@<X8>)
{
  a1[3] = &type metadata for UIViewAffineTransformAdapter;
  a1[4] = &off_1F094F910;
  *a1 = v1;
  return v1;
}

ValueMetadata *type metadata accessor for UIViewAffineTransformAdapter()
{
  return &type metadata for UIViewAffineTransformAdapter;
}

__C::CGRect __swiftcall measuringBoundingRect(toFit:)(CGSize toFit)
{
  double height = toFit.height;
  double width = toFit.width;
  v7.origin.double x = 0.0;
  v7.origin.CGFloat y = 0.0;
  v7.size.double width = width;
  v7.size.double height = height;
  if (CGRectGetWidth(v7) == 1.79769313e308) {
    double width = 0.0;
  }
  v8.origin.double x = 0.0;
  v8.origin.CGFloat y = 0.0;
  v8.size.double width = width;
  v8.size.double height = height;
  if (CGRectGetHeight(v8) == 1.79769313e308) {
    double v3 = 0.0;
  }
  else {
    double v3 = height;
  }
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = width;
  result.size.double height = v3;
  result.size.double width = v6;
  result.origin.CGFloat y = v5;
  result.origin.double x = v4;
  return result;
}

__n128 AspectFitLayout.init(view:aspectRatio:anchorPoint:)@<Q0>(long long *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v8 = *a2;
  uint64_t v9 = a2[1];
  char v10 = *((unsigned char *)a2 + 16);
  sub_1B07BA8FC(a1, (uint64_t)v14);
  *((void *)&v15 + 1) = v8;
  *(void *)&long long v16 = v9;
  BYTE8(v16) = v10;
  *(double *)&long long v17 = a4;
  *((double *)&v17 + 1) = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595648);
  uint64_t v11 = swift_allocObject();
  long long v12 = v16;
  *(_OWORD *)(v11 + 48) = v15;
  *(_OWORD *)(v11 + 64) = v12;
  *(_OWORD *)(v11 + 80) = v17;
  __n128 result = (__n128)v14[1];
  *(_OWORD *)(v11 + 16) = v14[0];
  *(__n128 *)(v11 + 32) = result;
  *a3 = v11;
  return result;
}

uint64_t AspectFitLayout.view.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B08475B8(v3, (uint64_t)v5);
  return sub_1B07BA8FC(v5, a1);
}

uint64_t sub_1B08475B8(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a2, a1);
  long long v5 = *(_OWORD *)(a1 + 40);
  *(unsigned char *)(a2 + 56) = *(unsigned char *)(a1 + 56);
  *(_OWORD *)(a2 + 40) = v5;
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  return a2;
}

uint64_t sub_1B0847634@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + 16;
  swift_beginAccess();
  sub_1B08475B8(v3, (uint64_t)v5);
  return sub_1B07BA8FC(v5, a2);
}

uint64_t AspectFitLayout.view.setter(uint64_t *a1)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B08475B8(v3, (uint64_t)v9);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v9, a1);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v4 = *v1 + 16;
    swift_beginAccess();
    sub_1B084777C(v9, v4);
    swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595648);
    long long v5 = (_OWORD *)swift_allocObject();
    long long v6 = v9[3];
    v5[3] = v9[2];
    v5[4] = v6;
    long long v5[5] = v9[4];
    long long v7 = v9[1];
    v5[1] = v9[0];
    v5[2] = v7;
    swift_release();
    *id v1 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1B084777C(long long *a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a2);
  long long v4 = *a1;
  long long v5 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v4;
  *(_OWORD *)(a2 + 16) = v5;
  long long v6 = *(long long *)((char *)a1 + 40);
  *(unsigned char *)(a2 + 56) = *((unsigned char *)a1 + 56);
  *(_OWORD *)(a2 + 40) = v6;
  *(_OWORD *)(a2 + 64) = a1[4];
  return a2;
}

void (*AspectFitLayout.view.modify(long long **a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = (long long *)malloc(0x98uLL);
  *a1 = v3;
  *((void *)v3 + 18) = v1;
  uint64_t v4 = *v1 + 16;
  swift_beginAccess();
  sub_1B08475B8(v4, (uint64_t)v3);
  sub_1B07BA8FC(v3, (uint64_t)(v3 + 5));
  return sub_1B0847864;
}

void sub_1B0847864(uint64_t **a1, char a2)
{
  id v2 = *a1;
  uint64_t v3 = (uint64_t)(*a1 + 10);
  if (a2)
  {
    sub_1B07BBD78((uint64_t)(*a1 + 10), (uint64_t)v2);
    AspectFitLayout.view.setter(v2);
    __swift_destroy_boxed_opaque_existential_1(v3);
  }
  else
  {
    AspectFitLayout.view.setter(*a1 + 10);
  }

  free(v2);
}

__n128 AspectFitLayout.explicitAspectRatio.getter@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  unsigned __int8 v4 = *(unsigned char *)(v3 + 72);
  __n128 result = *(__n128 *)(v3 + 56);
  *a1 = result;
  a1[1].n128_u8[0] = v4;
  return result;
}

uint64_t AspectFitLayout.explicitAspectRatio.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  char v4 = *((unsigned char *)a1 + 16);
  uint64_t v5 = *v1 + 16;
  swift_beginAccess();
  sub_1B08475B8(v5, (uint64_t)v11);
  *((void *)&v12 + 1) = v2;
  *(void *)&long long v13 = v3;
  BYTE8(v13) = v4;
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v6 = *v1 + 16;
    swift_beginAccess();
    sub_1B084777C(v11, v6);
    return swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595648);
    uint64_t v8 = (_OWORD *)swift_allocObject();
    long long v9 = v13;
    v8[3] = v12;
    v8[4] = v9;
    void v8[5] = v14;
    long long v10 = v11[1];
    v8[1] = v11[0];
    v8[2] = v10;
    uint64_t result = swift_release();
    *id v1 = v8;
  }
  return result;
}

void (*AspectFitLayout.explicitAspectRatio.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = (char *)malloc(0xB8uLL);
  *a1 = v3;
  *((void *)v3 + 22) = v1;
  uint64_t v4 = *v1;
  swift_beginAccess();
  char v5 = *(unsigned char *)(v4 + 72);
  *(_OWORD *)(v3 + 152) = *(_OWORD *)(v4 + 56);
  v3[168] = v5;
  return sub_1B0847A90;
}

void sub_1B0847A90(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 152);
  uint64_t v4 = *(void *)(*a1 + 160);
  char v5 = *(unsigned char *)(*a1 + 168);
  uint64_t v6 = **(void **)(*a1 + 176) + 16;
  if (a2)
  {
    swift_beginAccess();
    sub_1B08475B8(v6, v2);
    *(void *)(v2 + 40) = v3;
    *(void *)(v2 + 48) = v4;
    *(unsigned char *)(v2 + 56) = v5;
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *(void **)(v2 + 176);
    if (isUniquelyReferenced_nonNull_native)
    {
      uint64_t v9 = *v8 + 16;
      swift_beginAccess();
      sub_1B084777C((long long *)v2, v9);
      swift_endAccess();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595648);
      long long v13 = (_OWORD *)swift_allocObject();
      v13[1] = *(_OWORD *)v2;
      long long v14 = *(_OWORD *)(v2 + 64);
      long long v16 = *(_OWORD *)(v2 + 16);
      long long v15 = *(_OWORD *)(v2 + 32);
      v13[4] = *(_OWORD *)(v2 + 48);
      _OWORD v13[5] = v14;
      _OWORD v13[2] = v16;
      void v13[3] = v15;
      swift_release();
      *uint64_t v8 = v13;
    }
  }
  else
  {
    swift_beginAccess();
    sub_1B08475B8(v6, v2);
    *(void *)(v2 + 40) = v3;
    *(void *)(v2 + 48) = v4;
    *(unsigned char *)(v2 + 56) = v5;
    int v10 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *(void **)(v2 + 176);
    if (v10)
    {
      uint64_t v12 = *v11 + 16;
      swift_beginAccess();
      sub_1B084777C((long long *)v2, v12);
      swift_endAccess();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595648);
      long long v17 = (_OWORD *)swift_allocObject();
      v17[1] = *(_OWORD *)v2;
      long long v18 = *(_OWORD *)(v2 + 64);
      long long v20 = *(_OWORD *)(v2 + 16);
      long long v19 = *(_OWORD *)(v2 + 32);
      v17[4] = *(_OWORD *)(v2 + 48);
      v17[5] = v18;
      void v17[2] = v20;
      void v17[3] = v19;
      swift_release();
      *uint64_t v11 = v17;
    }
  }

  free((void *)v2);
}

double AspectFitLayout.anchorPoint.getter()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  return *(double *)(v1 + 80);
}

uint64_t AspectFitLayout.anchorPoint.setter(double a1, double a2)
{
  uint64_t v5 = *v2 + 16;
  swift_beginAccess();
  sub_1B08475B8(v5, (uint64_t)v11);
  *(double *)&long long v12 = a1;
  *((double *)&v12 + 1) = a2;
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    uint64_t v6 = *v2 + 16;
    swift_beginAccess();
    sub_1B084777C(v11, v6);
    return swift_endAccess();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595648);
    uint64_t v8 = (_OWORD *)swift_allocObject();
    long long v9 = v11[3];
    v8[3] = v11[2];
    v8[4] = v9;
    void v8[5] = v12;
    long long v10 = v11[1];
    v8[1] = v11[0];
    v8[2] = v10;
    uint64_t result = swift_release();
    *uint64_t v2 = v8;
  }
  return result;
}

void (*AspectFitLayout.anchorPoint.modify(void *a1))(uint64_t a1)
{
  uint64_t v3 = (char *)malloc(0x30uLL);
  *a1 = v3;
  *((void *)v3 + 5) = v1;
  uint64_t v4 = *v1;
  swift_beginAccess();
  *(_OWORD *)(v3 + 24) = *(_OWORD *)(v4 + 80);
  return sub_1B0847DF4;
}

void sub_1B0847DF4(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  AspectFitLayout.anchorPoint.setter(*(double *)(*(void *)a1 + 24), *(double *)(*(void *)a1 + 32));

  free(v1);
}

void AspectFitLayout.measurements(fitting:in:)(void *a1, double a2, double a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = *v3 + 16;
  swift_beginAccess();
  if (*(unsigned char *)(v7 + 72))
  {
    sub_1B08475B8(v8, (uint64_t)v14);
    sub_1B07BA8FC(v14, (uint64_t)v15);
    uint64_t v9 = v16;
    uint64_t v10 = v17;
    __swift_project_boxed_opaque_existential_1(v15, v16);
    double v11 = (*(double (**)(void *, uint64_t, double, double))(*(void *)(v10 + 8) + 8))(a1, v9, a2, a3);
    uint64_t v13 = v12;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  }
  else
  {
    double v11 = *(double *)(v7 + 56);
    uint64_t v13 = *(void *)(v7 + 64);
  }
  *(double *)long long v14 = v11;
  *((void *)&v14[0] + 1) = v13;
  AspectFitMeasurable.measurements(fitting:in:)(a1, a2, a3);
}

double AspectFitLayout.placeChildren(relativeTo:in:)@<D0>(void *a1@<X0>, CGFloat *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  uint64_t v13 = sub_1B086A868();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  long long v19 = (char *)&v56 - v18;
  uint64_t v20 = *v6;
  uint64_t v21 = *v6 + 16;
  swift_beginAccess();
  char v22 = *(unsigned char *)(v20 + 72);
  CGFloat v59 = *(double *)&v21;
  if (v22)
  {
    sub_1B08475B8(v21, (uint64_t)v61);
    sub_1B07BA8FC(v61, (uint64_t)v62);
    uint64_t v24 = v63;
    uint64_t v23 = v64;
    __swift_project_boxed_opaque_existential_1(v62, v63);
    double v25 = (*(double (**)(void *, uint64_t, double, double))(*(void *)(v23 + 8) + 8))(a1, v24, a5, a6);
    uint64_t v27 = v26;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    double v25 = *(double *)(v20 + 56);
    uint64_t v27 = *(void *)(v20 + 64);
  }
  *(double *)double v61 = v25;
  *((void *)&v61[0] + 1) = v27;
  double v28 = AspectFitMeasurable.measurements(fitting:in:)(a1, a5, a6);
  double v30 = v29;
  v65.origin.double x = a3;
  v65.origin.CGFloat y = a4;
  v65.size.double width = a5;
  v65.size.double height = a6;
  double MinX = CGRectGetMinX(v65);
  v66.origin.double x = a3;
  v66.origin.CGFloat y = a4;
  v66.size.double width = a5;
  v66.size.double height = a6;
  CGFloat Width = CGRectGetWidth(v66);
  double v33 = *(double *)(v20 + 80);
  double v60 = v28;
  double v34 = MinX + Width * v33 - v28 * v33;
  v67.origin.double x = a3;
  v67.origin.CGFloat y = a4;
  v67.size.double width = a5;
  v67.size.double height = a6;
  CGFloat MinY = CGRectGetMinY(v67);
  v68.origin.double x = a3;
  v68.origin.CGFloat y = a4;
  v68.size.double width = a5;
  v68.size.double height = a6;
  double Height = CGRectGetHeight(v68);
  double v36 = *(double *)(v20 + 88);
  uint64_t v37 = *MEMORY[0x1E4FBBEB0];
  uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 104);
  v38(v19, v37, v13);
  id v39 = objc_msgSend(a1, sel_traitCollection);
  objc_msgSend(v39, sel_displayScale);
  if (v40 <= 0.0) {
    double v40 = ForJetUIOnly_MainScreenScale();
  }
  double v41 = sub_1B07B8068((uint64_t)v19, v40, v34);

  CGRect v42 = *(void (**)(char *, uint64_t))(v14 + 8);
  v42(v19, v13);
  v38(v16, v37, v13);
  id v43 = objc_msgSend(a1, sel_traitCollection);
  objc_msgSend(v43, sel_displayScale);
  if (v44 <= 0.0) {
    double v44 = ForJetUIOnly_MainScreenScale();
  }
  double v45 = sub_1B07B8068((uint64_t)v16, v44, MinY + Height * v36 - v30 * v36);

  v42(v16, v13);
  sub_1B08475B8(*(uint64_t *)&v59, (uint64_t)v61);
  sub_1B07BA8FC(v61, (uint64_t)v62);
  uint64_t v46 = v63;
  uint64_t v47 = v64;
  __swift_project_boxed_opaque_existential_1(v62, v63);
  double v48 = *(void (**)(uint64_t, uint64_t, double, double, double, double))(v47 + 24);
  CGFloat v57 = v45;
  CGFloat v49 = v60;
  v48(v46, v47, v41, v45, v60, v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  v69.origin.double x = a3;
  v69.origin.CGFloat y = a4;
  v69.size.double width = a5;
  v69.size.double height = a6;
  CGFloat v59 = CGRectGetMinX(v69);
  v70.origin.double x = a3;
  v70.origin.CGFloat y = a4;
  v70.size.double width = a5;
  v70.size.double height = a6;
  CGFloat MinY = CGRectGetMinY(v70);
  v71.origin.double x = v41;
  v71.origin.CGFloat y = v45;
  v71.size.double width = v49;
  v71.size.double height = v30;
  CGFloat v50 = v41;
  double MaxY = CGRectGetMaxY(v71);
  v72.origin.double x = a3;
  v72.origin.CGFloat y = a4;
  v72.size.double width = a5;
  v72.size.double height = a6;
  double v52 = MaxY - CGRectGetMinY(v72);
  v73.origin.double x = a3;
  v73.origin.CGFloat y = a4;
  v73.size.double width = a5;
  v73.size.double height = a6;
  double v53 = CGRectGetMaxY(v73);
  v74.origin.double x = v50;
  v74.origin.CGFloat y = v57;
  v74.size.double width = v49;
  v74.size.double height = v30;
  double result = v53 - CGRectGetMaxY(v74);
  CGFloat v55 = MinY;
  *a2 = v59;
  a2[1] = v55;
  a2[2] = v49;
  a2[3] = v30;
  a2[4] = v52;
  a2[5] = result;
  return result;
}

uint64_t sub_1B08483D4(uint64_t a1)
{
  sub_1B07BBD78(a1, (uint64_t)v2);
  return AspectFitLayout.view.setter(v2);
}

__n128 sub_1B084840C@<Q0>(uint64_t *a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  unsigned __int8 v4 = *(unsigned char *)(v3 + 72);
  __n128 result = *(__n128 *)(v3 + 56);
  *a2 = result;
  a2[1].n128_u8[0] = v4;
  return result;
}

uint64_t sub_1B084845C(long long *a1)
{
  char v1 = *((unsigned char *)a1 + 16);
  long long v3 = *a1;
  char v4 = v1;
  return AspectFitLayout.explicitAspectRatio.setter((uint64_t *)&v3);
}

__n128 sub_1B084849C@<Q0>(__n128 **a1@<X0>, __n128 *a2@<X8>)
{
  long long v3 = *a1;
  swift_beginAccess();
  __n128 result = v3[5];
  *a2 = result;
  return result;
}

uint64_t sub_1B08484E4(double *a1)
{
  return AspectFitLayout.anchorPoint.setter(*a1, a1[1]);
}

ValueMetadata *type metadata accessor for AspectFitLayout()
{
  return &type metadata for AspectFitLayout;
}

uint64_t initializeWithCopy for AspectFitLayout.Storage(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  return a1;
}

uint64_t assignWithCopy for AspectFitLayout.Storage(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  long long v4 = *(_OWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v4;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return a1;
}

uint64_t assignWithTake for AspectFitLayout.Storage(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  return a1;
}

ValueMetadata *type metadata accessor for AspectFitLayout.Storage()
{
  return &type metadata for AspectFitLayout.Storage;
}

double sub_1B0848640(void *a1, double a2, double a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  uint64_t v16 = sub_1B086A868();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  long long v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(*v9)
  {
    case 1:
      v32.origin.double x = a6;
      v32.origin.CGFloat y = a7;
      v32.size.double width = a8;
      v32.size.double height = a9;
      double MidY = CGRectGetMidY(v32);
      double v26 = a3 * 0.5;
      (*(void (**)(char *, void, uint64_t))(v17 + 104))(v19, *MEMORY[0x1E4FBBEB0], v16);
      id v27 = objc_msgSend(a1, sel_traitCollection);
      objc_msgSend(v27, sel_displayScale);
      if (v28 <= 0.0) {
        double v28 = ForJetUIOnly_MainScreenScale();
      }
      double v29 = sub_1B07B8068((uint64_t)v19, v28, v26);

      (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
      double result = MidY - v29;
      break;
    case 2:
      v33.origin.double x = a6;
      v33.origin.CGFloat y = a7;
      v33.size.double width = a8;
      v33.size.double height = a9;
      double result = CGRectGetMaxY(v33) - a3;
      break;
    default:
      CGFloat v20 = a6;
      CGFloat v21 = a7;
      CGFloat v22 = a8;
      CGFloat v23 = a9;
      double result = CGRectGetMinY(*(CGRect *)&v20);
      break;
  }
  return result;
}

JetUI::FlankedHorizontalLayout::ViewAlignment_optional __swiftcall FlankedHorizontalLayout.ViewAlignment.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 4;
  if ((unint64_t)rawValue < 4) {
    char v2 = rawValue;
  }
  *char v1 = v2;
  return (JetUI::FlankedHorizontalLayout::ViewAlignment_optional)rawValue;
}

uint64_t FlankedHorizontalLayout.ViewAlignment.rawValue.getter()
{
  return *v0;
}

JetUI::FlankedHorizontalLayout::ViewAlignment_optional sub_1B0848878(Swift::Int *a1)
{
  return FlankedHorizontalLayout.ViewAlignment.init(rawValue:)(*a1);
}

uint64_t FlankedHorizontalLayout.init(sublayout:leadingView:leadingMargin:leadingAlignment:trailingView:trailingMargin:trailingAlignment:)@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, long long *a6@<X5>, char *a7@<X6>, uint64_t a8@<X8>)
{
  char v13 = *a4;
  char v14 = *a7;
  *(_OWORD *)(a8 + 56) = 0u;
  *(_OWORD *)(a8 + 40) = 0u;
  uint64_t v15 = a8 + 40;
  *(void *)(a8 + 72) = 0;
  *(_OWORD *)(a8 + 144) = 0u;
  *(void *)(a8 + 160) = 0;
  *(_OWORD *)(a8 + 128) = 0u;
  uint64_t v16 = a8 + 128;
  sub_1B07BA8FC(a1, a8);
  sub_1B080F440(a2, v15);
  sub_1B07BA8FC(a3, a8 + 80);
  *(unsigned char *)(a8 + 120) = v13;
  sub_1B080F440(a5, v16);
  uint64_t result = sub_1B07BA8FC(a6, a8 + 168);
  *(unsigned char *)(a8 + 208) = v14;
  return result;
}

uint64_t FlankedHorizontalLayout.sublayout.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B07BBD78(v1, a1);
}

uint64_t FlankedHorizontalLayout.sublayout.setter(long long *a1)
{
  __swift_destroy_boxed_opaque_existential_1(v1);

  return sub_1B07BA8FC(a1, v1);
}

double (*FlankedHorizontalLayout.sublayout.modify())(void)
{
  return nullsub_1;
}

uint64_t FlankedHorizontalLayout.leadingView.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B080F550(v1 + 40, a1);
}

uint64_t FlankedHorizontalLayout.leadingView.setter(uint64_t a1)
{
  return sub_1B080F440(a1, v1 + 40);
}

double (*FlankedHorizontalLayout.leadingView.modify())(void)
{
  return nullsub_1;
}

uint64_t FlankedHorizontalLayout.leadingMargin.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B07BBD78(v1 + 80, a1);
}

uint64_t FlankedHorizontalLayout.leadingMargin.setter(long long *a1)
{
  uint64_t v3 = v1 + 80;
  __swift_destroy_boxed_opaque_existential_1(v3);

  return sub_1B07BA8FC(a1, v3);
}

double (*FlankedHorizontalLayout.leadingMargin.modify())(void)
{
  return nullsub_1;
}

void FlankedHorizontalLayout.leadingAlignment.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 120);
}

unsigned char *FlankedHorizontalLayout.leadingAlignment.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 120) = *result;
  return result;
}

double (*FlankedHorizontalLayout.leadingAlignment.modify())(void)
{
  return nullsub_1;
}

uint64_t FlankedHorizontalLayout.trailingView.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B080F550(v1 + 128, a1);
}

uint64_t FlankedHorizontalLayout.trailingView.setter(uint64_t a1)
{
  return sub_1B080F440(a1, v1 + 128);
}

double (*FlankedHorizontalLayout.trailingView.modify())(void)
{
  return nullsub_1;
}

uint64_t FlankedHorizontalLayout.trailingMargin.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B07BBD78(v1 + 168, a1);
}

uint64_t FlankedHorizontalLayout.trailingMargin.setter(long long *a1)
{
  uint64_t v3 = v1 + 168;
  __swift_destroy_boxed_opaque_existential_1(v3);

  return sub_1B07BA8FC(a1, v3);
}

double (*FlankedHorizontalLayout.trailingMargin.modify())(void)
{
  return nullsub_1;
}

void FlankedHorizontalLayout.trailingAlignment.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 208);
}

unsigned char *FlankedHorizontalLayout.trailingAlignment.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 208) = *result;
  return result;
}

double (*FlankedHorizontalLayout.trailingAlignment.modify())(void)
{
  return nullsub_1;
}

uint64_t FlankedHorizontalLayout.placeChildren(relativeTo:in:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  uint64_t v7 = v6;
  CGFloat v75 = a4;
  CGFloat v76 = a3;
  uint64_t v12 = sub_1B086A868();
  uint64_t v74 = *(void *)(v12 - 8);
  *(void *)&double v13 = MEMORY[0x1F4188790](v12).n128_u64[0];
  uint64_t v15 = (char *)&v73 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v16 = objc_msgSend(a1, sel_traitCollection, v13);
  id v17 = objc_msgSend(v16, sel_layoutDirection);

  if (v17 == (id)1)
  {
    sub_1B080F550(v7 + 128, (uint64_t)v89);
    sub_1B080F550(v7 + 40, (uint64_t)v88);
    int v18 = *(unsigned __int8 *)(v7 + 208);
    int v19 = *(unsigned __int8 *)(v7 + 120);
    sub_1B07BBD78(v7 + 168, (uint64_t)v85);
    uint64_t v20 = v7 + 80;
  }
  else
  {
    sub_1B080F550(v7 + 40, (uint64_t)v89);
    sub_1B080F550(v7 + 128, (uint64_t)v88);
    int v18 = *(unsigned __int8 *)(v7 + 120);
    int v19 = *(unsigned __int8 *)(v7 + 208);
    sub_1B07BBD78(v7 + 80, (uint64_t)v85);
    uint64_t v20 = v7 + 168;
  }
  sub_1B07BBD78(v20, (uint64_t)v82);
  sub_1B080F550((uint64_t)v89, (uint64_t)&v80);
  if (v81)
  {
    sub_1B07BA8FC(&v80, (uint64_t)v77);
    uint64_t v21 = v78;
    uint64_t v22 = v79;
    __swift_project_boxed_opaque_existential_1(v77, v78);
    if (((*(uint64_t (**)(uint64_t, uint64_t))(v22 + 40))(v21, v22) & 1) == 0)
    {
      uint64_t v25 = v78;
      uint64_t v26 = v79;
      __swift_project_boxed_opaque_existential_1(v77, v78);
      double Height = (*(double (**)(void *, uint64_t, CGFloat, CGFloat))(*(void *)(v26 + 8) + 8))(a1, v25, a5, a6);
      double v31 = Height;
      if (v18 == 3)
      {
        v90.origin.double x = v76;
        v90.origin.CGFloat y = v75;
        v90.size.double width = a5;
        v90.size.double height = a6;
        double Height = CGRectGetHeight(v90);
        double v32 = Height;
      }
      else
      {
        double v32 = v28;
      }
      LOBYTE(v80) = v18;
      double v33 = v76;
      CGFloat v34 = v75;
      double v35 = sub_1B0848640(a1, Height, v32, v29, v30, v76, v75, a5, a6);
      v91.origin.double x = v33;
      v91.origin.CGFloat y = v34;
      v91.size.double width = a5;
      v91.size.double height = a6;
      double MinX = CGRectGetMinX(v91);
      uint64_t v37 = v78;
      uint64_t v38 = v79;
      __swift_project_boxed_opaque_existential_1(v77, v78);
      (*(void (**)(uint64_t, uint64_t, double, double, double, double))(v38 + 24))(v37, v38, MinX, v35, v31, v32);
      uint64_t v39 = v86;
      uint64_t v40 = v87;
      __swift_project_boxed_opaque_existential_1(v85, v86);
      sub_1B07B76D8((uint64_t)v15);
      AnyDimension.value(in:rounded:)((uint64_t)a1, (uint64_t)v15, v39, v40);
      double v41 = a5;
      double v42 = a6;
      double v44 = v43;
      (*(void (**)(char *, uint64_t))(v74 + 8))(v15, v12);
      v92.origin.double x = MinX;
      v92.origin.CGFloat y = v35;
      v92.size.double width = v31;
      v92.size.double height = v32;
      double v45 = v44 + CGRectGetWidth(v92) + v33;
      v93.origin.double x = MinX;
      double v24 = v45;
      v93.origin.CGFloat y = v35;
      v93.size.double width = v31;
      v93.size.double height = v32;
      double v46 = v44 + CGRectGetWidth(v93);
      a6 = v42;
      a5 = v41;
      double v23 = v41 - v46;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v77);
      goto LABEL_13;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v77);
  }
  else
  {
    sub_1B08100A8((uint64_t)&v80);
  }
  double v23 = a5;
  double v24 = v76;
LABEL_13:
  sub_1B080F550((uint64_t)v88, (uint64_t)&v80);
  if (v81)
  {
    sub_1B07BA8FC(&v80, (uint64_t)v77);
    uint64_t v47 = v78;
    uint64_t v48 = v79;
    __swift_project_boxed_opaque_existential_1(v77, v78);
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v48 + 40))(v47, v48))
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v77);
    }
    else
    {
      uint64_t v49 = v78;
      uint64_t v50 = v79;
      __swift_project_boxed_opaque_existential_1(v77, v78);
      double v51 = (*(double (**)(void *, uint64_t, CGFloat, CGFloat))(*(void *)(v50 + 8) + 8))(a1, v49, a5, a6);
      double v55 = v51;
      double v73 = v24;
      if (v19 == 3)
      {
        v94.origin.double x = v76;
        v94.origin.CGFloat y = v75;
        v94.size.double width = a5;
        v94.size.double height = a6;
        double v51 = CGRectGetHeight(v94);
        double v56 = v51;
      }
      else
      {
        double v56 = v52;
      }
      LOBYTE(v80) = v19;
      CGFloat v57 = v76;
      CGFloat v58 = v75;
      double v59 = sub_1B0848640(a1, v51, v56, v53, v54, v76, v75, a5, a6);
      v95.origin.double x = v57;
      v95.origin.CGFloat y = v58;
      v95.size.double width = a5;
      v95.size.double height = a6;
      CGFloat v60 = CGRectGetMaxX(v95) - v55;
      uint64_t v61 = v78;
      uint64_t v62 = v79;
      __swift_project_boxed_opaque_existential_1(v77, v78);
      (*(void (**)(uint64_t, uint64_t, CGFloat, double, double, double))(v62 + 24))(v61, v62, v60, v59, v55, v56);
      uint64_t v63 = v83;
      uint64_t v64 = v84;
      __swift_project_boxed_opaque_existential_1(v82, v83);
      sub_1B07B76D8((uint64_t)v15);
      AnyDimension.value(in:rounded:)((uint64_t)a1, (uint64_t)v15, v63, v64);
      double v66 = v65;
      (*(void (**)(char *, uint64_t))(v74 + 8))(v15, v12);
      v96.origin.double x = v60;
      v96.origin.CGFloat y = v59;
      v96.size.double width = v55;
      v96.size.double height = v56;
      double v23 = v23 - (v66 + CGRectGetWidth(v96));
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v77);
      double v24 = v73;
    }
  }
  else
  {
    sub_1B08100A8((uint64_t)&v80);
  }
  uint64_t v67 = *(void *)(v7 + 24);
  uint64_t v68 = *(void *)(v7 + 32);
  __swift_project_boxed_opaque_existential_1((void *)v7, v67);
  CGFloat v69 = v75;
  (*(void (**)(void *__return_ptr, void *, uint64_t, uint64_t, double, CGFloat, double, CGFloat))(v68 + 8))(v77, a1, v67, v68, v24, v75, v23, a6);
  CGFloat v70 = v76;
  v97.origin.double x = v76;
  v97.origin.CGFloat y = v69;
  v97.size.double width = a5;
  v97.size.double height = a6;
  CGFloat v71 = CGRectGetHeight(v97);
  *(CGFloat *)a2 = v70;
  *(CGFloat *)(a2 + 8) = v69;
  *(CGFloat *)(a2 + 16) = a5;
  *(CGFloat *)(a2 + 24) = a6;
  *(CGFloat *)(a2 + 32) = v71;
  *(void *)(a2 + 40) = 0;
  sub_1B08100A8((uint64_t)v88);
  sub_1B08100A8((uint64_t)v89);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v82);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v85);
}

unint64_t sub_1B0849278()
{
  unint64_t result = qword_1E9B3BB00;
  if (!qword_1E9B3BB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BB00);
  }
  return result;
}

uint64_t destroy for FlankedHorizontalLayout(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  if (*(void *)(a1 + 64)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  }
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  if (*(void *)(a1 + 152)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 128);
  }

  return __swift_destroy_boxed_opaque_existential_1(a1 + 168);
}

uint64_t initializeWithCopy for FlankedHorizontalLayout(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = (_OWORD *)(a1 + 40);
  uint64_t v6 = (_OWORD *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 64);
  if (v7)
  {
    uint64_t v8 = *(void *)(a2 + 72);
    *(void *)(a1 + 64) = v7;
    *(void *)(a1 + 72) = v8;
    (**(void (***)(_OWORD *, _OWORD *))(v7 - 8))(v5, v6);
  }
  else
  {
    long long v9 = *(_OWORD *)(a2 + 56);
    *uint64_t v5 = *v6;
    *(_OWORD *)(a1 + 56) = v9;
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
  }
  long long v10 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 80, a2 + 80);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  double v11 = (_OWORD *)(a1 + 128);
  uint64_t v12 = (_OWORD *)(a2 + 128);
  uint64_t v13 = *(void *)(a2 + 152);
  if (v13)
  {
    uint64_t v14 = *(void *)(a2 + 160);
    *(void *)(a1 + 152) = v13;
    *(void *)(a1 + 160) = v14;
    (**(void (***)(_OWORD *, _OWORD *))(v13 - 8))(v11, v12);
  }
  else
  {
    long long v15 = *(_OWORD *)(a2 + 144);
    *double v11 = *v12;
    *(_OWORD *)(a1 + 144) = v15;
    *(void *)(a1 + 160) = *(void *)(a2 + 160);
  }
  long long v16 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 192) = v16;
  (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 168, a2 + 168);
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  return a1;
}

uint64_t assignWithCopy for FlankedHorizontalLayout(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  uint64_t v4 = *(void *)(a2 + 64);
  if (*(void *)(a1 + 64))
  {
    if (v4)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)(a2 + 40));
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  }
  else if (v4)
  {
    *(void *)(a1 + 64) = v4;
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 40, a2 + 40);
    goto LABEL_8;
  }
  long long v5 = *(_OWORD *)(a2 + 40);
  long long v6 = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(_OWORD *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 56) = v6;
LABEL_8:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 80), (uint64_t *)(a2 + 80));
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  uint64_t v7 = *(void *)(a2 + 152);
  if (!*(void *)(a1 + 152))
  {
    if (v7)
    {
      *(void *)(a1 + 152) = v7;
      *(void *)(a1 + 160) = *(void *)(a2 + 160);
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 128, a2 + 128);
      goto LABEL_15;
    }
LABEL_14:
    long long v8 = *(_OWORD *)(a2 + 128);
    long long v9 = *(_OWORD *)(a2 + 144);
    *(void *)(a1 + 160) = *(void *)(a2 + 160);
    *(_OWORD *)(a1 + 128) = v8;
    *(_OWORD *)(a1 + 144) = v9;
    goto LABEL_15;
  }
  if (!v7)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 128);
    goto LABEL_14;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 128), (uint64_t *)(a2 + 128));
LABEL_15:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 168), (uint64_t *)(a2 + 168));
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  return a1;
}

__n128 __swift_memcpy209_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  __n128 result = *(__n128 *)(a2 + 160);
  long long v10 = *(_OWORD *)(a2 + 176);
  long long v11 = *(_OWORD *)(a2 + 192);
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  *(_OWORD *)(a1 + 176) = v10;
  *(_OWORD *)(a1 + 192) = v11;
  *(__n128 *)(a1 + 160) = result;
  return result;
}

uint64_t assignWithTake for FlankedHorizontalLayout(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  if (*(void *)(a1 + 64)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  }
  long long v5 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v5;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v6;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  if (*(void *)(a1 + 152)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 128);
  }
  long long v7 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v7;
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  __swift_destroy_boxed_opaque_existential_1(a1 + 168);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  return a1;
}

uint64_t getEnumTagSinglePayload for FlankedHorizontalLayout(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 209)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FlankedHorizontalLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 200) = 0;
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
    *(unsigned char *)(result + 208) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 209) = 1;
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
    *(unsigned char *)(result + 209) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FlankedHorizontalLayout()
{
  return &type metadata for FlankedHorizontalLayout;
}

unsigned char *storeEnumTagSinglePayload for FlankedHorizontalLayout.ViewAlignment(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B08498D4);
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

ValueMetadata *type metadata accessor for FlankedHorizontalLayout.ViewAlignment()
{
  return &type metadata for FlankedHorizontalLayout.ViewAlignment;
}

__C::CGRect __swiftcall CGRect.adding(outsets:)(UIEdgeInsets outsets)
{
  double v5 = v2 - outsets.top;
  CGFloat v6 = outsets.left + outsets.right + v3;
  double v7 = outsets.top + outsets.bottom + v4;
  double v8 = v1 - outsets.left;
  double v9 = v5;
  double v10 = v6;
  result.size.double height = v7;
  result.size.double width = v10;
  result.origin.CGFloat y = v9;
  result.origin.double x = v8;
  return result;
}

Swift::Void __swiftcall CGRect.subtract(insets:)(UIEdgeInsets insets)
{
  double v2 = v1[1] + insets.top;
  *double v1 = *v1 + insets.left;
  v1[1] = v2;
  double v3 = v1[3] - (insets.top + insets.bottom);
  v1[2] = v1[2] - (insets.left + insets.right);
  v1[3] = v3;
}

Swift::Void __swiftcall CGRect.add(outsets:)(UIEdgeInsets outsets)
{
  double v2 = v1[1] - outsets.top;
  *double v1 = *v1 - outsets.left;
  v1[1] = v2;
  CGFloat v3 = outsets.top + outsets.bottom + v1[3];
  v1[2] = outsets.left + outsets.right + v1[2];
  v1[3] = v3;
}

uint64_t static Locale.withMockLocaleForStorefront(_:_:)(uint64_t a1, void (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v27 = a3;
  double v28 = a2;
  uint64_t v4 = sub_1B08694D8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  double v29 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  double v9 = (char *)v21 - v8;
  if (qword_1EB595980 != -1) {
    swift_once();
  }
  v21[1] = qword_1EB5957E0;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595968);
  uint64_t v11 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v24 = ((v11 + 32) & ~v11) + *(void *)(v5 + 72);
  uint64_t v25 = v10;
  uint64_t v23 = v11 | 7;
  uint64_t v12 = swift_allocObject();
  long long v22 = xmmword_1B086C130;
  *(_OWORD *)(v12 + 16) = xmmword_1B086C130;
  sub_1B08694C8();
  uint64_t v30 = v12;
  uint64_t v13 = sub_1B07B2378(&qword_1EB5962A0, MEMORY[0x1E4FBCB00]);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5962A8);
  sub_1B07B2830(&qword_1EB5962B0, &qword_1EB5962A8);
  _OWORD v21[3] = v14;
  uint64_t v26 = v13;
  uint64_t v15 = sub_1B086A498();
  MEMORY[0x1F4188790](v15);
  v21[-2] = a1;
  sub_1B086A308();
  long long v16 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
  uint64_t v17 = v16(v9, v4);
  v28(v17);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = v22;
  sub_1B08694C8();
  uint64_t v30 = v18;
  int v19 = v29;
  sub_1B086A498();
  sub_1B086A308();
  return v16(v19, v4);
}

uint64_t sub_1B0849D30@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1B08691E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1B08691A8();
  if (!v9) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, v2, v4);
  }
  if (v8 == 29281 && v9 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v10 = sub_1B086A8A8();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0) {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, v2, v4);
    }
  }
  sub_1B08691D8();
  uint64_t v11 = sub_1B08691A8();
  uint64_t v13 = v12;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (!v13) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, v2, v4);
  }
  if (v11 == 29281 && v13 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v15 = sub_1B086A8A8();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0) {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, v2, v4);
    }
  }
  return sub_1B08691D8();
}

uint64_t sub_1B0849EE0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595800);
  MEMORY[0x1F4188790](v0);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EB595988 != -1) {
    swift_once();
  }
  uint64_t v3 = __swift_project_value_buffer(v0, (uint64_t)qword_1EB5957E8);
  uint64_t v4 = sub_1B08691E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v2, 1, 1, v4);
  swift_beginAccess();
  sub_1B07C22F0((uint64_t)v2, v3);
  return swift_endAccess();
}

uint64_t sub_1B084A010(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595800);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B084A070()
{
  return sub_1B07C243C();
}

uint64_t sub_1B084A088(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 6449010;
  unint64_t v3 = 0xE300000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 6449010;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x64656D616ELL;
      break;
    case 2:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x63696D616E7964;
      break;
    case 3:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1819112552;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE300000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE500000000000000;
      if (v5 == 0x64656D616ELL) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v2 = 0x63696D616E7964;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xE400000000000000;
      if (v5 == 1819112552) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_1B086A8A8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_1B084A1F0(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xE900000000000064;
  uint64_t v3 = 0x65526D6574737973;
  uint64_t v4 = a1;
  uint64_t v5 = 0x65526D6574737973;
  unint64_t v6 = 0xE900000000000064;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x72476D6574737973;
      unint64_t v6 = 0xEB000000006E6565;
      break;
    case 2:
      uint64_t v5 = 0x6C426D6574737973;
      uint64_t v7 = 25973;
      goto LABEL_9;
    case 3:
      uint64_t v5 = 0x724F6D6574737973;
      unint64_t v6 = 0xEC00000065676E61;
      break;
    case 4:
      uint64_t v5 = 0x65596D6574737973;
      unint64_t v6 = 0xEC000000776F6C6CLL;
      break;
    case 5:
      uint64_t v5 = 0x69506D6574737973;
      unint64_t v6 = 0xEA00000000006B6ELL;
      break;
    case 6:
      uint64_t v5 = 0x75506D6574737973;
      unint64_t v6 = 0xEC000000656C7072;
      break;
    case 7:
      uint64_t v5 = 0x72476D6574737973;
      uint64_t v7 = 31073;
LABEL_9:
      unint64_t v6 = v7 & 0xFFFFFFFFFFFFLL | 0xEA00000000000000;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xEB000000006E6565;
      if (v5 == 0x72476D6574737973) {
        goto LABEL_25;
      }
      goto LABEL_27;
    case 2:
      uint64_t v8 = 0x6C426D6574737973;
      uint64_t v9 = 25973;
      goto LABEL_24;
    case 3:
      uint64_t v10 = 0x724F6D6574737973;
      uint64_t v11 = 1701277281;
      goto LABEL_16;
    case 4:
      uint64_t v10 = 0x65596D6574737973;
      uint64_t v11 = 2003790956;
LABEL_16:
      unint64_t v2 = v11 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
      if (v5 != v10) {
        goto LABEL_27;
      }
      goto LABEL_25;
    case 5:
      unint64_t v2 = 0xEA00000000006B6ELL;
      if (v5 != 0x69506D6574737973) {
        goto LABEL_27;
      }
      goto LABEL_25;
    case 6:
      uint64_t v3 = 0x75506D6574737973;
      unint64_t v2 = 0xEC000000656C7072;
      goto LABEL_21;
    case 7:
      uint64_t v8 = 0x72476D6574737973;
      uint64_t v9 = 31073;
LABEL_24:
      unint64_t v2 = v9 & 0xFFFFFFFFFFFFLL | 0xEA00000000000000;
      if (v5 == v8) {
        goto LABEL_25;
      }
      goto LABEL_27;
    default:
LABEL_21:
      if (v5 != v3) {
        goto LABEL_27;
      }
LABEL_25:
      if (v6 == v2) {
        char v12 = 1;
      }
      else {
LABEL_27:
      }
        char v12 = sub_1B086A8A8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v12 & 1;
  }
}

uint64_t sub_1B084A4CC(char a1, char a2)
{
  if (*(void *)&aBlack_1[8 * a1] == *(void *)&aBlack_1[8 * a2]) {
    char v2 = 1;
  }
  else {
    char v2 = sub_1B086A8A8();
  }
  swift_bridgeObjectRelease_n();
  return v2 & 1;
}

BOOL sub_1B084A534(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_1B084A540(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1952867692;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 1952867692;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x7265746E6563;
      break;
    case 2:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x7468676972;
      break;
    case 3:
      uint64_t v5 = 0x656966697473756ALL;
      goto LABEL_6;
    case 4:
      uint64_t v5 = 0x657A696C61636F6CLL;
LABEL_6:
      unint64_t v3 = 0xE900000000000064;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v2 = 0x7265746E6563;
      break;
    case 2:
      unint64_t v6 = 0xE500000000000000;
      uint64_t v2 = 0x7468676972;
      break;
    case 3:
      uint64_t v2 = 0x656966697473756ALL;
      goto LABEL_12;
    case 4:
      uint64_t v2 = 0x657A696C61636F6CLL;
LABEL_12:
      unint64_t v6 = 0xE900000000000064;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1B086A8A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1B084A6D8(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6C6961746564;
  }
  else {
    uint64_t v3 = 0x776569767265766FLL;
  }
  if (v2) {
    unint64_t v4 = 0xE800000000000000;
  }
  else {
    unint64_t v4 = 0xE600000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x6C6961746564;
  }
  else {
    uint64_t v5 = 0x776569767265766FLL;
  }
  if (a2) {
    unint64_t v6 = 0xE600000000000000;
  }
  else {
    unint64_t v6 = 0xE800000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1B086A8A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1B084A77C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000015;
  }
  else {
    unint64_t v3 = 0x616C702F74786574;
  }
  if (v2) {
    unint64_t v4 = 0xEA00000000006E69;
  }
  else {
    unint64_t v4 = 0x80000001B0873E80;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000015;
  }
  else {
    unint64_t v5 = 0x616C702F74786574;
  }
  if (a2) {
    unint64_t v6 = 0x80000001B0873E80;
  }
  else {
    unint64_t v6 = 0xEA00000000006E69;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1B086A8A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1B084A82C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 1954047348;
  }
  else {
    uint64_t v3 = 0x646E696B24;
  }
  if (v2) {
    unint64_t v4 = 0xE500000000000000;
  }
  else {
    unint64_t v4 = 0xE400000000000000;
  }
  if (a2) {
    uint64_t v5 = 1954047348;
  }
  else {
    uint64_t v5 = 0x646E696B24;
  }
  if (a2) {
    unint64_t v6 = 0xE400000000000000;
  }
  else {
    unint64_t v6 = 0xE500000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1B086A8A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1B084A8C8()
{
  sub_1B0869E38();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B084AA24()
{
  return sub_1B086A998();
}

void static UIColor.tryToMakeInstance(byDeserializing:using:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BB08);
  MEMORY[0x1F4188790](v4);
  if ((sub_1B08695D8() & 1) == 0) {
    static UIColor.makeInstance(byDeserializing:using:)(a1, a2);
  }
}

uint64_t UIColor.StaticNamedColor.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2 = sub_1B086A778();
  uint64_t result = swift_bridgeObjectRelease();
  char v4 = 3;
  if (v2 < 3) {
    char v4 = v2;
  }
  *a1 = v4;
  return result;
}

uint64_t UIColor.StaticNamedColor.rawValue.getter()
{
  return *(void *)&aBlack_1[8 * *v0];
}

uint64_t sub_1B084ADA0(char *a1, char *a2)
{
  return sub_1B084A4CC(*a1, *a2);
}

uint64_t sub_1B084ADAC()
{
  return sub_1B086A998();
}

uint64_t sub_1B084AE08()
{
  sub_1B0869E38();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B084AE48()
{
  return sub_1B086A998();
}

uint64_t sub_1B084AEA0@<X0>(char *a1@<X8>)
{
  return UIColor.StaticNamedColor.init(rawValue:)(a1);
}

void sub_1B084AEAC(void *a1@<X8>)
{
  *a1 = *(void *)&aBlack_1[8 * *v1];
  a1[1] = 0xE500000000000000;
}

id sub_1B084AEC8()
{
  id v1 = objc_msgSend(self, *off_1E5FD1C58[*v0]);

  return v1;
}

uint64_t UIColor.SystemNamedColor.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2 = sub_1B086A778();
  uint64_t result = swift_bridgeObjectRelease();
  char v4 = 8;
  if (v2 < 8) {
    char v4 = v2;
  }
  *a1 = v4;
  return result;
}

uint64_t UIColor.SystemNamedColor.rawValue.getter()
{
  uint64_t result = 0x65526D6574737973;
  switch(*v0)
  {
    case 1:
    case 7:
      uint64_t result = 0x72476D6574737973;
      break;
    case 2:
      uint64_t result = 0x6C426D6574737973;
      break;
    case 3:
      uint64_t result = 0x724F6D6574737973;
      break;
    case 4:
      uint64_t result = 0x65596D6574737973;
      break;
    case 5:
      uint64_t result = 0x69506D6574737973;
      break;
    case 6:
      uint64_t result = 0x75506D6574737973;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1B084B09C(unsigned __int8 *a1, char *a2)
{
  return sub_1B084A1F0(*a1, *a2);
}

uint64_t sub_1B084B0A8()
{
  return sub_1B084AA24();
}

uint64_t sub_1B084B0B4()
{
  return sub_1B084A8C8();
}

uint64_t sub_1B084B0BC()
{
  return sub_1B084AA24();
}

uint64_t sub_1B084B0C4@<X0>(char *a1@<X8>)
{
  return UIColor.SystemNamedColor.init(rawValue:)(a1);
}

void sub_1B084B0D0(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xE900000000000064;
  uint64_t v3 = 0x65526D6574737973;
  switch(*v1)
  {
    case 1:
      unint64_t v4 = 0xEB000000006E6565;
      goto LABEL_10;
    case 2:
      uint64_t v3 = 0x6C426D6574737973;
      unint64_t v2 = 0xEA00000000006575;
      goto LABEL_4;
    case 3:
      strcpy((char *)a1, "systemOrange");
      *(unsigned char *)(a1 + 13) = 0;
      *(_WORD *)(a1 + 14) = -5120;
      return;
    case 4:
      strcpy((char *)a1, "systemYellow");
      *(unsigned char *)(a1 + 13) = 0;
      *(_WORD *)(a1 + 14) = -5120;
      return;
    case 5:
      *(void *)a1 = 0x69506D6574737973;
      *(void *)(a1 + 8) = 0xEA00000000006B6ELL;
      return;
    case 6:
      strcpy((char *)a1, "systemPurple");
      *(unsigned char *)(a1 + 13) = 0;
      *(_WORD *)(a1 + 14) = -5120;
      return;
    case 7:
      unint64_t v4 = 0xEA00000000007961;
LABEL_10:
      *(void *)a1 = 0x72476D6574737973;
      *(void *)(a1 + 8) = v4;
      return;
    default:
LABEL_4:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      return;
  }
}

uint64_t sub_1B084B20C(unsigned __int8 *a1, char *a2)
{
  return sub_1B084A088(*a1, *a2);
}

uint64_t sub_1B084B218()
{
  return sub_1B086A998();
}

uint64_t sub_1B084B2E0()
{
  sub_1B0869E38();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B084B390()
{
  return sub_1B086A998();
}

uint64_t sub_1B084B454@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1B084C87C();
  *a1 = result;
  return result;
}

void sub_1B084B484(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE300000000000000;
  uint64_t v3 = 6449010;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE500000000000000;
      uint64_t v3 = 0x64656D616ELL;
      goto LABEL_3;
    case 2:
      *a1 = 0x63696D616E7964;
      a1[1] = 0xE700000000000000;
      break;
    case 3:
      *a1 = 1819112552;
      a1[1] = 0xE400000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

void static UIColor.makeInstance(byDeserializing:using:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B08695F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  char v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)v22 - v9;
  sub_1B0869608();
  sub_1B084B908();
  sub_1B0869578();
  uint64_t v11 = *(void (**)(char *, uint64_t))(v5 + 8);
  v11(v10, v4);
  switch(v23)
  {
    case 1:
      sub_1B084BE00();
      break;
    case 2:
      sub_1B084C104(a1, a2);
      break;
    case 3:
      sub_1B0869608();
      uint64_t v12 = sub_1B08695E8();
      uint64_t v14 = v13;
      v11(v7, v4);
      if (!v14)
      {
        uint64_t v20 = sub_1B0869C28();
        sub_1B07DCB60();
        swift_allocError();
        *uint64_t v21 = 0x65756C6176;
        v21[1] = 0xE500000000000000;
        v21[2] = v22[1];
        (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v21, *MEMORY[0x1E4F717D8], v20);
        goto LABEL_10;
      }
      sub_1B07F7C20();
      v15._countAndFlagsBits = v12;
      v15._object = v14;
      UIColor.init(htmlColor:)(v15);
      break;
    case 4:
      uint64_t v16 = sub_1B0869C28();
      sub_1B07DCB60();
      swift_allocError();
      uint64_t v18 = v17;
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BB28);
      *uint64_t v18 = 0x646E696B24;
      v18[1] = 0xE500000000000000;
      v18[2] = v19;
      (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x1E4F717D8], v16);
LABEL_10:
      swift_willThrow();
      break;
    default:
      sub_1B084B95C(a1);
      break;
  }
}

uint64_t sub_1B084B840(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BB18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B084B8A8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BB18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1B084B908()
{
  unint64_t result = qword_1E9B3BB20;
  if (!qword_1E9B3BB20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BB20);
  }
  return result;
}

id sub_1B084B95C(uint64_t a1)
{
  uint64_t v2 = sub_1B08695F8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v54 - v7;
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v54 - v10;
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v54 - v13;
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v54 - v16;
  uint64_t v57 = a1;
  sub_1B0869608();
  uint64_t v18 = sub_1B08695C8();
  LOBYTE(a1) = v19;
  uint64_t v20 = v17;
  uint64_t v21 = v2;
  uint64_t v22 = v2;
  char v23 = *(void (**)(char *, uint64_t))(v3 + 8);
  v23(v20, v22);
  if (a1)
  {
    uint64_t v43 = sub_1B0869C28();
    sub_1B07DCB60();
    swift_allocError();
    double v45 = v44;
    uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BB28);
    *double v45 = 6579570;
    unint64_t v47 = 0xE300000000000000;
LABEL_10:
    v45[1] = v47;
LABEL_11:
    v45[2] = v46;
    uint64_t v49 = (unsigned int *)MEMORY[0x1E4F717D8];
    goto LABEL_12;
  }
  double v55 = *(double *)&v18;
  double v56 = v8;
  uint64_t v24 = v5;
  sub_1B0869608();
  uint64_t v25 = sub_1B08695C8();
  char v27 = v26;
  uint64_t v28 = v21;
  uint64_t v29 = v21;
  uint64_t v30 = v23;
  v23(v14, v29);
  if (v27)
  {
    uint64_t v43 = sub_1B0869C28();
    sub_1B07DCB60();
    swift_allocError();
    double v45 = v48;
    uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BB28);
    *double v45 = 0x6E65657267;
    unint64_t v47 = 0xE500000000000000;
    goto LABEL_10;
  }
  double v31 = *(double *)&v25;
  sub_1B0869608();
  uint64_t v32 = sub_1B08695C8();
  char v34 = v33;
  v30(v11, v28);
  if (v34)
  {
    uint64_t v43 = sub_1B0869C28();
    sub_1B07DCB60();
    swift_allocError();
    double v45 = v50;
    uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BB28);
    *double v45 = 1702194274;
    v45[1] = 0xE400000000000000;
    goto LABEL_11;
  }
  double v35 = *(double *)&v32;
  double v36 = v56;
  sub_1B0869608();
  char v37 = sub_1B08695D8();
  v30(v36, v28);
  double v38 = 1.0;
  if (v37) {
    return objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1618]), sel_initWithRed_green_blue_alpha_, v55, v31, v35, v38);
  }
  sub_1B0869608();
  uint64_t v39 = sub_1B08695C8();
  char v41 = v40;
  v30(v24, v28);
  if ((v41 & 1) == 0)
  {
    double v38 = *(double *)&v39;
    return objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1618]), sel_initWithRed_green_blue_alpha_, v55, v31, v35, v38);
  }
  uint64_t v43 = sub_1B0869C28();
  sub_1B07DCB60();
  swift_allocError();
  double v45 = v51;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BB28);
  uint64_t v53 = MEMORY[0x1E4FBC860];
  *double v45 = 0x6168706C61;
  v45[1] = 0xE500000000000000;
  v45[2] = v52;
  v45[3] = v53;
  uint64_t v49 = (unsigned int *)MEMORY[0x1E4F717E8];
LABEL_12:
  (*(void (**)(void *, void, uint64_t))(*(void *)(v43 - 8) + 104))(v45, *v49, v43);
  return (id)swift_willThrow();
}

id sub_1B084BE00()
{
  uint64_t v0 = sub_1B08695F8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v17 - v5;
  sub_1B0869608();
  sub_1B084C8C8();
  sub_1B0869578();
  uint64_t v7 = *(void (**)(char *, uint64_t))(v1 + 8);
  v7(v6, v0);
  switch(v20)
  {
    case 1:
      id result = objc_msgSend(self, sel_whiteColor);
      break;
    case 2:
      id result = objc_msgSend(self, sel_clearColor);
      break;
    case 3:
      sub_1B0869608();
      sub_1B084C91C();
      sub_1B0869578();
      v7(v6, v0);
      if (v19 == 8)
      {
        uint64_t v9 = sub_1B0869C28();
        sub_1B07DCB60();
        swift_allocError();
        uint64_t v11 = v10;
        sub_1B0869608();
        uint64_t v12 = sub_1B08695E8();
        unint64_t v14 = v13;
        v7(v3, v0);
        if (v14)
        {
          unint64_t v15 = v14;
        }
        else
        {
          uint64_t v12 = 0;
          unint64_t v15 = 0xE000000000000000;
        }
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BB28);
        *uint64_t v11 = v12;
        v11[1] = v15;
        long long v11[2] = v16;
        (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v9 - 8) + 104))(v11, *MEMORY[0x1E4F717C8], v9);
        id result = (id)swift_willThrow();
      }
      else
      {
        char v18 = v19;
        id result = sub_1B084AEC8();
      }
      break;
    default:
      id result = objc_msgSend(self, sel_blackColor);
      break;
  }
  return result;
}

void sub_1B084C104(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = sub_1B08695F8();
  v29.super.isa = *(Class *)(v30 - 8);
  MEMORY[0x1F4188790](v30);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v24 - v7;
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v24 - v10;
  MEMORY[0x1F4188790](v12);
  unint64_t v14 = (char *)&v24 - v13;
  sub_1B07F7C20();
  sub_1B0869608();
  uint64_t v28 = a2;
  unint64_t v15 = (objc_class *)static UIColor.makeInstance(byDeserializing:using:)(v14, a2);
  if (v2)
  {
    (*((void (**)(char *, uint64_t))v29.super.isa + 1))(v14, v30);
  }
  else
  {
    char v26 = v8;
    v27.super.isa = v15;
    uint64_t v25 = v5;
    uint64_t v16 = (void (*)(char *, uint64_t))*((void *)v29.super.isa + 1);
    v16(v14, v30);
    sub_1B0869608();
    uint64_t v17 = v28;
    v29.super.isa = (Class)static UIColor.makeInstance(byDeserializing:using:)(v11, v28);
    v16(v11, v30);
    char v18 = v26;
    sub_1B0869608();
    v19.super.isa = (Class)static UIColor.makeInstance(byDeserializing:using:)(v18, v17);
    char v20 = v18;
    uint64_t v21 = v16;
    v16(v20, v30);
    uint64_t v22 = v25;
    sub_1B0869608();
    v23.super.isa = (Class)static UIColor.makeInstance(byDeserializing:using:)(v22, v17);
    v21(v22, v30);
    UIColor.init(light:lightHighContrast:dark:darkHighContrast:)(v27, v29, v19, v23);
  }
}

unint64_t sub_1B084C46C()
{
  unint64_t result = qword_1E9B3BB30;
  if (!qword_1E9B3BB30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BB30);
  }
  return result;
}

unint64_t sub_1B084C4C4()
{
  unint64_t result = qword_1E9B3BB38;
  if (!qword_1E9B3BB38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BB38);
  }
  return result;
}

unsigned char *_s16StaticNamedColorOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B084C5E4);
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

ValueMetadata *type metadata accessor for UIColor.StaticNamedColor()
{
  return &type metadata for UIColor.StaticNamedColor;
}

unsigned char *_s16SystemNamedColorOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x1B084C6E8);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UIColor.SystemNamedColor()
{
  return &type metadata for UIColor.SystemNamedColor;
}

unsigned char *_s9ColorKindOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B084C7ECLL);
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

ValueMetadata *_s9ColorKindOMa()
{
  return &_s9ColorKindON;
}

unint64_t sub_1B084C828()
{
  unint64_t result = qword_1E9B3BB40;
  if (!qword_1E9B3BB40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BB40);
  }
  return result;
}

uint64_t sub_1B084C87C()
{
  unint64_t v0 = sub_1B086A778();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

unint64_t sub_1B084C8C8()
{
  unint64_t result = qword_1E9B3BB48;
  if (!qword_1E9B3BB48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BB48);
  }
  return result;
}

unint64_t sub_1B084C91C()
{
  unint64_t result = qword_1E9B3BB50;
  if (!qword_1E9B3BB50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BB50);
  }
  return result;
}

uint64_t dispatch thunk of DiffableDataPresenter.onApplySnapshot.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of DiffableDataPresenter.reapplySnapshot()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_1B084C998(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = result;
  long long v5 = v3[5];
  *(_OWORD *)&v41[16] = v3[4];
  *(_OWORD *)&v41[32] = v5;
  char v42 = *((unsigned char *)v3 + 96);
  long long v6 = v3[1];
  long long v38 = *v3;
  long long v39 = v6;
  long long v7 = v3[3];
  long long v40 = v3[2];
  *(_OWORD *)char v41 = v7;
  if (!a2)
  {
    uint64_t v8 = 0;
    *(unsigned char *)(result + 96) = *((unsigned char *)v3 + 96);
    long long v16 = v3[5];
    *(_OWORD *)(result + 64) = v3[4];
    *(_OWORD *)(result + 80) = v16;
    long long v17 = v3[1];
    *(_OWORD *)unint64_t result = *v3;
    *(_OWORD *)(result + 16) = v17;
    long long v18 = v3[3];
    *(_OWORD *)(result + 32) = v3[2];
    *(_OWORD *)(result + 48) = v18;
    return v8;
  }
  uint64_t v8 = a3;
  if (!a3) {
    goto LABEL_10;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = a2;
    DisjointStack.Placements.next()((uint64_t)&v26);
    if (!*((void *)&v27 + 1))
    {
      uint64_t v10 = 0;
LABEL_12:
      sub_1B07BBE14((uint64_t)&v26, &qword_1E9B3B3F8);
      uint64_t v23 = *(void *)v41;
      uint64_t v24 = *(void *)&v41[40];
      char v21 = v42;
      long long v25 = v39;
      *(_OWORD *)uint64_t v4 = v38;
      *(_OWORD *)(v4 + 16) = v25;
      *(_OWORD *)(v4 + 32) = v40;
      *(void *)(v4 + 48) = v23;
      *(_OWORD *)(v4 + 56) = *(_OWORD *)&v41[8];
      *(_OWORD *)(v4 + 72) = *(_OWORD *)&v41[24];
      *(void *)(v4 + 88) = v24;
      uint64_t v8 = v10;
      goto LABEL_13;
    }
    uint64_t v10 = 0;
    while (1)
    {
      long long v11 = v29;
      long long v12 = v30;
      long long v35 = v29;
      long long v36 = v30;
      uint64_t v13 = v31;
      uint64_t v37 = v31;
      long long v14 = v26;
      long long v15 = v27;
      long long v32 = v26;
      long long v33 = v27;
      long long v34 = v28;
      *(_OWORD *)(v9 + 32) = v28;
      *(_OWORD *)(v9 + 48) = v11;
      *(_OWORD *)(v9 + 64) = v12;
      *(void *)(v9 + 80) = v13;
      *(_OWORD *)uint64_t v9 = v14;
      *(_OWORD *)(v9 + 16) = v15;
      if (v8 - 1 == v10) {
        break;
      }
      v9 += 88;
      DisjointStack.Placements.next()((uint64_t)&v26);
      ++v10;
      if (!*((void *)&v27 + 1)) {
        goto LABEL_12;
      }
    }
LABEL_10:
    uint64_t v19 = *(void *)v41;
    uint64_t v20 = *(void *)&v41[40];
    char v21 = v42;
    long long v22 = v39;
    *(_OWORD *)uint64_t v4 = v38;
    *(_OWORD *)(v4 + 16) = v22;
    *(_OWORD *)(v4 + 32) = v40;
    *(void *)(v4 + 48) = v19;
    *(_OWORD *)(v4 + 56) = *(_OWORD *)&v41[8];
    *(_OWORD *)(v4 + 72) = *(_OWORD *)&v41[24];
    *(void *)(v4 + 88) = v20;
LABEL_13:
    *(unsigned char *)(v4 + 96) = v21;
    return v8;
  }
  __break(1u);
  return result;
}

long long *sub_1B084CB44(long long *a1, uint64_t a2, uint64_t a3)
{
  return sub_1B084CB74(a1, a2, a3, (void *(*)(long long *__return_ptr))VerticalStack.Placements.next());
}

long long *sub_1B084CB5C(long long *a1, uint64_t a2, uint64_t a3)
{
  return sub_1B084CB74(a1, a2, a3, (void *(*)(long long *__return_ptr))HorizontalStack.Placements.next());
}

long long *sub_1B084CB74(long long *result, uint64_t a2, uint64_t a3, void *(*a4)(long long *__return_ptr))
{
  long long v5 = result;
  long long v6 = v4[1];
  long long v36 = *v4;
  long long v37 = v6;
  long long v7 = v4[3];
  long long v38 = v4[2];
  long long v39 = v7;
  if (!a2)
  {
    uint64_t v8 = 0;
    long long v18 = v4[1];
    *unint64_t result = *v4;
    result[1] = v18;
    long long v19 = v4[3];
    result[2] = v4[2];
    result[3] = v19;
    return (long long *)v8;
  }
  uint64_t v8 = a3;
  if (!a3)
  {
LABEL_10:
    long long v20 = v39;
    long long v21 = v37;
    *long long v5 = v36;
    v5[1] = v21;
    v5[2] = v38;
    v5[3] = v20;
    return (long long *)v8;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v10 = a2;
    long long v11 = a4(&v24);
    if (!*((void *)&v25 + 1))
    {
      uint64_t v12 = 0;
LABEL_12:
      sub_1B07BBE14((uint64_t)&v24, &qword_1E9B3B3F8);
      long long v22 = v39;
      long long v23 = v37;
      *long long v5 = v36;
      v5[1] = v23;
      v5[2] = v38;
      v5[3] = v22;
      return (long long *)v12;
    }
    uint64_t v12 = 0;
    while (1)
    {
      long long v13 = v27;
      long long v14 = v28;
      long long v33 = v27;
      long long v34 = v28;
      uint64_t v15 = v29;
      uint64_t v35 = v29;
      long long v16 = v24;
      long long v17 = v25;
      long long v30 = v24;
      long long v31 = v25;
      long long v32 = v26;
      *(_OWORD *)(v10 + 32) = v26;
      *(_OWORD *)(v10 + 48) = v13;
      *(_OWORD *)(v10 + 64) = v14;
      *(void *)(v10 + 80) = v15;
      *(_OWORD *)uint64_t v10 = v16;
      *(_OWORD *)(v10 + 16) = v17;
      if (v8 - 1 == v12) {
        goto LABEL_10;
      }
      v10 += 88;
      long long v11 = ((void *(*)(long long *__return_ptr, void *))a4)(&v24, v11);
      ++v12;
      if (!*((void *)&v25 + 1)) {
        goto LABEL_12;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1B084CCE8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t)v3;
  uint64_t v8 = v3[3];
  uint64_t v9 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v8);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 24))(v8, v9);
  uint64_t result = sub_1B0800544(v4);
  uint64_t v12 = 0;
  if (!a2 || !a3)
  {
LABEL_12:
    *a1 = v10;
    return v12;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    sub_1B086A728();
    if (*((void *)&v19 + 1))
    {
      uint64_t v12 = 0;
      while (1)
      {
        long long v13 = v21;
        long long v14 = v22;
        long long v27 = v21;
        long long v28 = v22;
        uint64_t v15 = v23;
        uint64_t v29 = v23;
        long long v16 = v18;
        long long v17 = v19;
        long long v24 = v18;
        long long v25 = v19;
        long long v26 = v20;
        *(_OWORD *)(a2 + 32) = v20;
        *(_OWORD *)(a2 + 48) = v13;
        *(_OWORD *)(a2 + 64) = v14;
        *(void *)(a2 + 80) = v15;
        *(_OWORD *)a2 = v16;
        *(_OWORD *)(a2 + 16) = v17;
        if (a3 - 1 == v12) {
          break;
        }
        a2 += 88;
        sub_1B086A728();
        ++v12;
        if (!*((void *)&v19 + 1)) {
          goto LABEL_10;
        }
      }
      uint64_t v12 = a3;
    }
    else
    {
      uint64_t v12 = 0;
LABEL_10:
      sub_1B07BBE14((uint64_t)&v18, &qword_1E9B3B3F8);
    }
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B084CE20(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = result;
  long long v5 = v3[7];
  v33[6] = v3[6];
  v33[7] = v5;
  char v34 = *((unsigned char *)v3 + 128);
  long long v6 = v3[3];
  v33[2] = v3[2];
  v33[3] = v6;
  long long v7 = v3[5];
  v33[4] = v3[4];
  v33[5] = v7;
  long long v8 = v3[1];
  v33[0] = *v3;
  v33[1] = v8;
  if (!a2)
  {
    uint64_t v9 = 0;
LABEL_13:
    long long v17 = v3[7];
    *(_OWORD *)(v4 + 96) = v3[6];
    *(_OWORD *)(v4 + 112) = v17;
    *(unsigned char *)(v4 + 128) = *((unsigned char *)v3 + 128);
    long long v18 = v3[3];
    *(_OWORD *)(v4 + 32) = v3[2];
    *(_OWORD *)(v4 + 48) = v18;
    long long v19 = v3[5];
    *(_OWORD *)(v4 + 64) = v3[4];
    *(_OWORD *)(v4 + 80) = v19;
    long long v20 = v3[1];
    *(_OWORD *)uint64_t v4 = *v3;
    *(_OWORD *)(v4 + 16) = v20;
    return v9;
  }
  uint64_t v9 = a3;
  if (!a3)
  {
LABEL_10:
    int v3 = v33;
    goto LABEL_13;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v10 = a2;
    Pin.Placements.next()((uint64_t)&v21);
    if (!*((void *)&v22 + 1))
    {
      uint64_t v11 = 0;
LABEL_12:
      sub_1B07BBE14((uint64_t)&v21, &qword_1E9B3B3F8);
      int v3 = v33;
      uint64_t v9 = v11;
      goto LABEL_13;
    }
    uint64_t v11 = 0;
    while (1)
    {
      long long v12 = v24;
      long long v13 = v25;
      long long v30 = v24;
      long long v31 = v25;
      uint64_t v14 = v26;
      uint64_t v32 = v26;
      long long v15 = v21;
      long long v16 = v22;
      long long v27 = v21;
      long long v28 = v22;
      long long v29 = v23;
      *(_OWORD *)(v10 + 32) = v23;
      *(_OWORD *)(v10 + 48) = v12;
      *(_OWORD *)(v10 + 64) = v13;
      *(void *)(v10 + 80) = v14;
      *(_OWORD *)uint64_t v10 = v15;
      *(_OWORD *)(v10 + 16) = v16;
      if (v9 - 1 == v11) {
        goto LABEL_10;
      }
      v10 += 88;
      Pin.Placements.next()((uint64_t)&v21);
      ++v11;
      if (!*((void *)&v22 + 1)) {
        goto LABEL_12;
      }
    }
  }
  __break(1u);
  return result;
}

void *sub_1B084CF78(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = memcpy(__dst, v3, sizeof(__dst));
  if (!a2)
  {
    a3 = 0;
LABEL_13:
    memcpy(a1, v3, 0x110uLL);
    return (void *)a3;
  }
  if (!a3)
  {
LABEL_10:
    int v3 = __dst;
    goto LABEL_13;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    Resize.Placements.next()((uint64_t)&v14);
    if (!*((void *)&v15 + 1))
    {
      uint64_t v8 = 0;
LABEL_12:
      sub_1B07BBE14((uint64_t)&v14, &qword_1E9B3B3F8);
      int v3 = __dst;
      a3 = v8;
      goto LABEL_13;
    }
    uint64_t v8 = 0;
    while (1)
    {
      long long v9 = v17;
      long long v10 = v18;
      long long v23 = v17;
      long long v24 = v18;
      uint64_t v11 = v19;
      uint64_t v25 = v19;
      long long v12 = v14;
      long long v13 = v15;
      long long v20 = v14;
      long long v21 = v15;
      long long v22 = v16;
      *(_OWORD *)(a2 + 32) = v16;
      *(_OWORD *)(a2 + 48) = v9;
      *(_OWORD *)(a2 + 64) = v10;
      *(void *)(a2 + 80) = v11;
      *(_OWORD *)a2 = v12;
      *(_OWORD *)(a2 + 16) = v13;
      if (a3 - 1 == v8) {
        goto LABEL_10;
      }
      a2 += 88;
      Resize.Placements.next()((uint64_t)&v14);
      ++v8;
      if (!*((void *)&v15 + 1)) {
        goto LABEL_12;
      }
    }
  }
  __break(1u);
  return result;
}

BOOL static Pin.Edge.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Pin.Edge.hash(into:)()
{
  return sub_1B086A968();
}

uint64_t Pin.Edge.hashValue.getter()
{
  return sub_1B086A998();
}

uint64_t sub_1B084D12C@<X0>(uint64_t result@<X0>, _WORD *a2@<X8>)
{
  if ((*(unsigned char *)(v2 + 40) & 1) == 0)
  {
    sub_1B07BBD78(result, (uint64_t)v8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595770);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595748);
    if (swift_dynamicCast())
    {
      sub_1B07BA8FC(v6, (uint64_t)v9);
      uint64_t v4 = v10;
      uint64_t v5 = v11;
      __swift_project_boxed_opaque_existential_1(v9, v10);
      (*(void (**)(void, uint64_t, uint64_t))(v5 + 8))(*(void *)(v2 + 32), v4, v5);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    }
    uint64_t v7 = 0;
    memset(v6, 0, sizeof(v6));
    uint64_t result = sub_1B07BBE14((uint64_t)v6, &qword_1EB595750);
  }
  *a2 = 0;
  return result;
}

uint64_t Pin.Placements.union.getter@<X0>(CGFloat *a1@<X8>)
{
  if (*(unsigned char *)(v1 + 41))
  {
    sub_1B0800124(v1, (uint64_t)v22);
    Pin.Placements.next()((uint64_t)&v16);
    if (*((void *)&v17 + 1))
    {
      long long v12 = v18;
      long long v13 = v19;
      long long v14 = v20;
      double v15 = v21;
      long long v10 = v16;
      long long v11 = v17;
      CGFloat x = *((double *)&v18 + 1);
      CGFloat width = *((double *)&v19 + 1);
      CGFloat y = *(double *)&v19;
      double v7 = *((double *)&v20 + 1);
      for (CGFloat i = *(double *)&v20; ; CGFloat i = v24.size.height)
      {
        double v8 = v15;
        sub_1B07BD394((uint64_t)&v10);
        Pin.Placements.next()((uint64_t)&v16);
        if (!*((void *)&v17 + 1)) {
          break;
        }
        long long v12 = v18;
        long long v13 = v19;
        long long v14 = v20;
        double v15 = v21;
        long long v10 = v16;
        long long v11 = v17;
        v27.origin.CGFloat x = *((CGFloat *)&v18 + 1);
        *(_OWORD *)&v27.origin.CGFloat y = v19;
        *(void *)&v27.size.double height = v20;
        v23.origin.CGFloat x = x;
        v23.origin.CGFloat y = y;
        v23.size.CGFloat width = width;
        v23.size.double height = i;
        CGRect v24 = CGRectUnion(v23, v27);
        CGFloat x = v24.origin.x;
        CGFloat y = v24.origin.y;
        CGFloat width = v24.size.width;
      }
      goto LABEL_15;
    }
LABEL_14:
    double v7 = 0.0;
    double v8 = 0.0;
    CGFloat width = 0.0;
    CGFloat i = 0.0;
    CGFloat x = 0.0;
    CGFloat y = 0.0;
    goto LABEL_15;
  }
  sub_1B0800124(v1, (uint64_t)v22);
  Pin.Placements.next()((uint64_t)&v16);
  if (!*((void *)&v17 + 1)) {
    goto LABEL_14;
  }
  long long v12 = v18;
  long long v13 = v19;
  long long v14 = v20;
  double v15 = v21;
  long long v10 = v16;
  long long v11 = v17;
  CGFloat x = *((double *)&v18 + 1);
  CGFloat width = *((double *)&v19 + 1);
  CGFloat y = *(double *)&v19;
  double v7 = *((double *)&v20 + 1);
  CGFloat i = *(double *)&v20;
  double v8 = v21;
  while (1)
  {
    sub_1B07BD394((uint64_t)&v10);
    Pin.Placements.next()((uint64_t)&v16);
    if (!*((void *)&v17 + 1)) {
      break;
    }
    long long v12 = v18;
    long long v13 = v19;
    long long v14 = v20;
    double v15 = v21;
    long long v10 = v16;
    long long v11 = v17;
    v28.origin.CGFloat x = *((CGFloat *)&v18 + 1);
    *(_OWORD *)&v28.origin.CGFloat y = v19;
    *(void *)&v28.size.double height = v20;
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.double height = i;
    CGRect v26 = CGRectUnion(v25, v28);
    CGFloat x = v26.origin.x;
    CGFloat y = v26.origin.y;
    CGFloat width = v26.size.width;
    CGFloat i = v26.size.height;
    if (v7 >= *((double *)&v14 + 1)) {
      double v7 = *((double *)&v14 + 1);
    }
    if (v8 >= v15) {
      double v8 = v15;
    }
  }
LABEL_15:
  uint64_t result = sub_1B0800180((uint64_t)v22);
  *a1 = x;
  a1[1] = y;
  a1[2] = width;
  a1[3] = i;
  a1[4] = v7;
  a1[5] = v8;
  return result;
}

uint64_t Pin.Placements.next()@<X0>(uint64_t a1@<X8>)
{
  int v3 = (_OWORD *)(v1 + 48);
  uint64_t result = sub_1B084D950(v1 + 48, (uint64_t)v84);
  if (!v88)
  {
    sub_1B07BA8FC(v84, (uint64_t)v81);
    sub_1B07BA8FC((long long *)&v85, (uint64_t)v78);
    uint64_t v27 = v79;
    uint64_t v28 = v80;
    __swift_project_boxed_opaque_existential_1(v78, v79);
    double v30 = *(double *)(v1 + 16);
    double v29 = *(double *)(v1 + 24);
    double v31 = (*(double (**)(void, uint64_t, uint64_t, double, double))(v28 + 8))(*(void *)(v1 + 32), v27, v28, v30, v29);
    double v33 = v32;
    double v70 = v34;
    double v36 = v35;
    if (*(unsigned char *)(v1 + 41))
    {
      sub_1B084D12C((uint64_t)v78, &v72);
      CGFloat v38 = *(double *)v1;
      CGFloat v37 = *(double *)(v1 + 8);
      CGFloat v39 = *(double *)v1;
      CGFloat v40 = v37;
      double v41 = v30;
      double v42 = v29;
      if (v72 >= 2u)
      {
        if (v72 == 2) {
          double MinX = CGRectGetMidX(*(CGRect *)&v39) + v31 * -0.5;
        }
        else {
          double MinX = CGRectGetMaxX(*(CGRect *)&v39) - v31;
        }
      }
      else
      {
        double MinX = CGRectGetMinX(*(CGRect *)&v39);
      }
      v94.origin.CGFloat x = v38;
      v94.origin.CGFloat y = v37;
      v94.size.CGFloat width = v30;
      v94.size.double height = v29;
      double MinY = CGRectGetMaxY(v94) - v33;
    }
    else
    {
      CGFloat v56 = *(double *)v1;
      CGFloat v55 = *(double *)(v1 + 8);
      v92.origin.CGFloat x = *(CGFloat *)v1;
      v92.origin.CGFloat y = v55;
      v92.size.CGFloat width = v30;
      v92.size.double height = v29;
      double MaxX = CGRectGetMaxX(v92);
      sub_1B084D12C((uint64_t)v78, &v72);
      CGFloat v58 = v56;
      CGFloat v59 = v55;
      double v60 = v30;
      double v61 = v29;
      if (v72 >= 2u)
      {
        if (v72 == 2) {
          double MinY = CGRectGetMidY(*(CGRect *)&v58) + v33 * -0.5;
        }
        else {
          double MinY = CGRectGetMaxY(*(CGRect *)&v58) - v33;
        }
      }
      else
      {
        double MinY = CGRectGetMinY(*(CGRect *)&v58);
      }
      double MinX = MaxX - v31;
    }
    sub_1B084D988((uint64_t)v3);
    sub_1B07BBD78((uint64_t)v81, (uint64_t)v3);
    *(double *)(v1 + 88) = MinX;
    *(double *)(v1 + 96) = MinY;
    *(double *)(v1 + 104) = v31;
    *(double *)(v1 + 112) = v33;
    *(unsigned char *)(v1 + 128) = 1;
    sub_1B07BBD78((uint64_t)v78, (uint64_t)v71);
    sub_1B07BBD78((uint64_t)v71, (uint64_t)&v72);
    *((void *)&v74 + 1) = floor(MinX);
    *(void *)&long long v75 = floor(MinY);
    *((void *)&v75 + 1) = ceil(v31);
    *(void *)&long long v76 = ceil(v33);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v71);
    *((void *)&v76 + 1) = floor(v36);
    double v77 = floor(v70);
    long long v67 = v75;
    *(_OWORD *)(a1 + 32) = v74;
    *(_OWORD *)(a1 + 48) = v67;
    long long v68 = v73;
    *(_OWORD *)a1 = v72;
    *(_OWORD *)(a1 + 16) = v68;
    *(_OWORD *)(a1 + 64) = v76;
    *(double *)(a1 + 80) = v77;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v81);
    double v66 = v78;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v66);
  }
  if (v88 != 1)
  {
    *(void *)(a1 + 80) = 0;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    return result;
  }
  CGPoint v5 = v85;
  CGFloat v7 = v86;
  CGFloat v6 = v87;
  sub_1B07BA8FC(v84, (uint64_t)v81);
  double v9 = *(double *)(v1 + 16);
  double v8 = *(double *)(v1 + 24);
  if (*(unsigned char *)(v1 + 41))
  {
    double v10 = *(double *)(v1 + 24);
    if (v8 != 0.0)
    {
      v89.origin = v5;
      v89.size.CGFloat width = v7;
      v89.size.double height = v6;
      double v11 = v8 - CGRectGetHeight(v89);
      if (v11 < 0.0) {
        double v10 = 0.0;
      }
      else {
        double v10 = v11;
      }
    }
    uint64_t v12 = v82;
    uint64_t v13 = v83;
    __swift_project_boxed_opaque_existential_1(v81, v82);
    double v14 = (*(double (**)(void, uint64_t, uint64_t, double, double))(v13 + 8))(*(void *)(v1 + 32), v12, v13, v9, v10);
    double v16 = v15;
    double v69 = v17;
    double v19 = v18;
    sub_1B084D12C((uint64_t)v81, &v72);
    CGFloat v21 = *(double *)v1;
    CGFloat v20 = *(double *)(v1 + 8);
    CGFloat v22 = *(double *)v1;
    CGFloat v23 = v20;
    double v24 = v9;
    double v25 = v8;
    if (v72 >= 2u)
    {
      if (v72 == 2) {
        double v26 = CGRectGetMidX(*(CGRect *)&v22) + v14 * -0.5;
      }
      else {
        double v26 = CGRectGetMaxX(*(CGRect *)&v22) - v14;
      }
    }
    else
    {
      double v26 = CGRectGetMinX(*(CGRect *)&v22);
    }
  }
  else
  {
    double v44 = *(double *)(v1 + 16);
    if (v9 != 0.0)
    {
      v90.origin = v5;
      v90.size.CGFloat width = v7;
      v90.size.double height = v6;
      double v45 = v9 - CGRectGetWidth(v90);
      if (v45 < 0.0) {
        double v44 = 0.0;
      }
      else {
        double v44 = v45;
      }
    }
    uint64_t v46 = v82;
    uint64_t v47 = v83;
    __swift_project_boxed_opaque_existential_1(v81, v82);
    double v14 = (*(double (**)(void, uint64_t, uint64_t, double, double))(v47 + 8))(*(void *)(v1 + 32), v46, v47, v44, v8);
    double v16 = v48;
    double v69 = v49;
    double v19 = v50;
    CGFloat v21 = *(double *)v1;
    CGFloat v20 = *(double *)(v1 + 8);
    v91.origin.CGFloat x = *(CGFloat *)v1;
    v91.origin.CGFloat y = v20;
    v91.size.CGFloat width = v9;
    v91.size.double height = v8;
    double v26 = CGRectGetMinX(v91);
    sub_1B084D12C((uint64_t)v81, &v72);
    if (v72 >= 2u)
    {
      CGFloat v51 = v21;
      CGFloat v52 = v20;
      double v53 = v9;
      double v54 = v8;
      if (v72 == 2) {
        double v63 = CGRectGetMidY(*(CGRect *)&v51) + v16 * -0.5;
      }
      else {
        double v63 = CGRectGetMaxY(*(CGRect *)&v51) - v16;
      }
      goto LABEL_34;
    }
  }
  v93.origin.CGFloat x = v21;
  v93.origin.CGFloat y = v20;
  v93.size.CGFloat width = v9;
  v93.size.double height = v8;
  double v63 = CGRectGetMinY(v93);
LABEL_34:
  sub_1B084D988((uint64_t)v3);
  *int v3 = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 80) = 0u;
  *(_OWORD *)(v1 + 96) = 0u;
  *(_OWORD *)(v1 + 112) = 0u;
  *(unsigned char *)(v1 + 128) = 2;
  sub_1B07BBD78((uint64_t)v81, (uint64_t)v78);
  sub_1B07BBD78((uint64_t)v78, (uint64_t)&v72);
  *((void *)&v74 + 1) = floor(v26);
  *(void *)&long long v75 = floor(v63);
  *((void *)&v75 + 1) = ceil(v14);
  *(void *)&long long v76 = ceil(v16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v78);
  *((void *)&v76 + 1) = floor(v69);
  double v77 = floor(v19);
  long long v64 = v75;
  *(_OWORD *)(a1 + 32) = v74;
  *(_OWORD *)(a1 + 48) = v64;
  long long v65 = v73;
  *(_OWORD *)a1 = v72;
  *(_OWORD *)(a1 + 16) = v65;
  *(_OWORD *)(a1 + 64) = v76;
  *(double *)(a1 + 80) = v77;
  double v66 = v81;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v66);
}

uint64_t sub_1B084D950(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1B084D988(uint64_t a1)
{
  return a1;
}

__n128 sub_1B084D9C0@<Q0>(uint64_t a1@<X8>)
{
  long long v2 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(a1 + 112) = v2;
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(v1 + 128);
  long long v3 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(a1 + 48) = v3;
  long long v4 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(a1 + 80) = v4;
  __n128 result = *(__n128 *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1B084D9EC()
{
  uint64_t v1 = sub_1B084FDB4(v0);
  sub_1B0800180(v0);
  return v1;
}

unint64_t sub_1B084DA24()
{
  return 0xD000000000000080;
}

unint64_t sub_1B084DA40()
{
  return 0xD00000000000007ELL;
}

uint64_t Pin.init(_:to:of:)@<X0>(long long *a1@<X0>, char *a2@<X1>, long long *a3@<X2>, uint64_t a4@<X8>)
{
  char v7 = *a2;
  sub_1B07BBD78((uint64_t)a1, (uint64_t)v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595770);
  uint64_t v8 = swift_dynamicCast();
  if (v8)
  {
    *(_OWORD *)double v10 = *(_OWORD *)&v10[7];
    *(_OWORD *)&v10[2] = *(_OWORD *)&v10[9];
    *(_OWORD *)&v10[4] = *(_OWORD *)&v10[11];
    MEMORY[0x1F4188790](v8);
    sub_1B0869BC8();
    sub_1B084DBC8((uint64_t)v10);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  sub_1B07BA8FC(a1, a4);
  *(unsigned char *)(a4 + 40) = v7;
  return sub_1B07BA8FC(a3, a4 + 48);
}

uint64_t sub_1B084DBC8(uint64_t a1)
{
  return a1;
}

BOOL sub_1B084DC1C()
{
  return *(void *)(*(void *)(v0 + 16) + 40) == 0;
}

JUMeasurements __swiftcall Pin.measure(toFit:with:)(CGSize toFit, UITraitCollection with)
{
  CGFloat height = toFit.height;
  double width = toFit.width;
  v22.origin.CGFloat x = 0.0;
  v22.origin.CGFloat y = 0.0;
  v22.size.double width = width;
  v22.size.CGFloat height = height;
  if (CGRectGetWidth(v22) == 1.79769313e308) {
    double width = 0.0;
  }
  v23.origin.CGFloat x = 0.0;
  v23.origin.CGFloat y = 0.0;
  v23.size.double width = width;
  v23.size.CGFloat height = height;
  if (CGRectGetHeight(v23) == 1.79769313e308) {
    CGFloat height = 0.0;
  }
  char v6 = *(unsigned char *)(v2 + 40);
  sub_1B07BBD78(v2 + 48, (uint64_t)&v20);
  sub_1B07BBD78(v2, (uint64_t)v21);
  v17[0] = 0;
  v17[1] = 0;
  *(double *)&void v17[2] = width;
  *(CGFloat *)&void v17[3] = height;
  v17[4] = with.super.isa;
  char v18 = 1;
  char v19 = v6;
  v21[40] = 0;
  char v7 = with.super.isa;
  Pin.Placements.union.getter(v16);
  double v8 = ceil(v16[2]);
  double v9 = ceil(v16[3]);
  double v10 = floor(v16[4]);
  double v11 = floor(v16[5]);
  sub_1B0800180((uint64_t)v17);
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  result.var3 = v15;
  result.var2 = v14;
  result.vaCGFloat r1 = v13;
  result.var0 = v12;
  return result;
}

id Pin.layout(relativeTo:with:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  char v12 = *(unsigned char *)(v6 + 40);
  sub_1B07BBD78(v6 + 48, a2 + 48);
  sub_1B07BBD78(v6, a2 + 88);
  *(double *)a2 = a3;
  *(double *)(a2 + 8) = a4;
  *(double *)(a2 + 16) = a5;
  *(double *)(a2 + 24) = a6;
  *(void *)(a2 + 32) = a1;
  *(unsigned char *)(a2 + 40) = 0;
  *(unsigned char *)(a2 + 41) = v12;
  *(unsigned char *)(a2 + 128) = 0;

  return a1;
}

JetUI::_LayoutAlignment __swiftcall Pin._layoutAlignment(with:)(UITraitCollection with)
{
  long long v4 = v1;
  sub_1B07BBD78(v2, (uint64_t)v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595770);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595748);
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v17 = 0;
    memset(v16, 0, sizeof(v16));
    JetUI::_LayoutAlignment v13 = (JetUI::_LayoutAlignment)sub_1B07BBE14((uint64_t)v16, &qword_1EB595750);
LABEL_12:
    char v12 = 0;
    char v11 = 0;
    goto LABEL_13;
  }
  sub_1B07BA8FC(v16, (uint64_t)v21);
  sub_1B07BBD78(v2 + 48, (uint64_t)v16);
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_1B07BBE14((uint64_t)v14, &qword_1EB595750);
    JetUI::_LayoutAlignment v13 = (JetUI::_LayoutAlignment)__swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    goto LABEL_12;
  }
  sub_1B07BA8FC(v14, (uint64_t)v18);
  uint64_t v5 = v22;
  uint64_t v6 = v23;
  __swift_project_boxed_opaque_existential_1(v21, v22);
  (*(void (**)(long long *__return_ptr, Class, uint64_t, uint64_t))(v6 + 8))(v16, with.super.isa, v5, v6);
  int v7 = LOBYTE(v16[0]);
  int v8 = BYTE1(v16[0]);
  uint64_t v9 = v19;
  uint64_t v10 = v20;
  __swift_project_boxed_opaque_existential_1(v18, v19);
  (*(void (**)(long long *__return_ptr, Class, uint64_t, uint64_t))(v10 + 8))(v16, with.super.isa, v9, v10);
  if (v7 == LOBYTE(v16[0])) {
    char v11 = v7;
  }
  else {
    char v11 = 0;
  }
  if (v8 == BYTE1(v16[0])) {
    char v12 = v8;
  }
  else {
    char v12 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  JetUI::_LayoutAlignment v13 = (JetUI::_LayoutAlignment)__swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
LABEL_13:
  *long long v4 = v11;
  v4[1] = v12;
  return v13;
}

unint64_t sub_1B084DFB0()
{
  unint64_t result = qword_1E9B3BB58;
  if (!qword_1E9B3BB58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BB58);
  }
  return result;
}

unint64_t sub_1B084E004(uint64_t a1)
{
  unint64_t result = sub_1B084E02C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1B084E02C()
{
  unint64_t result = qword_1E9B3BB60;
  if (!qword_1E9B3BB60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BB60);
  }
  return result;
}

unint64_t sub_1B084E084()
{
  unint64_t result = qword_1E9B3BB68;
  if (!qword_1E9B3BB68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BB68);
  }
  return result;
}

unint64_t sub_1B084E0DC()
{
  unint64_t result = qword_1E9B3BB70;
  if (!qword_1E9B3BB70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BB70);
  }
  return result;
}

id sub_1B084E130@<X0>(void *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  char v12 = *(unsigned char *)(v6 + 40);
  sub_1B07BBD78(v6 + 48, a2 + 48);
  sub_1B07BBD78(v6, a2 + 88);
  *(double *)a2 = a3;
  *(double *)(a2 + 8) = a4;
  *(double *)(a2 + 16) = a5;
  *(double *)(a2 + 24) = a6;
  *(void *)(a2 + 32) = a1;
  *(unsigned char *)(a2 + 40) = 0;
  *(unsigned char *)(a2 + 41) = v12;
  *(unsigned char *)(a2 + 128) = 0;

  return a1;
}

uint64_t destroy for Pin(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);

  return __swift_destroy_boxed_opaque_existential_1(a1 + 48);
}

uint64_t initializeWithCopy for Pin(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  long long v5 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 72) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 48, a2 + 48);
  return a1;
}

uint64_t assignWithCopy for Pin(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 48), (uint64_t *)(a2 + 48));
  return a1;
}

uint64_t assignWithTake for Pin(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for Pin(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Pin(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Pin()
{
  return &type metadata for Pin;
}

unsigned char *storeEnumTagSinglePayload for Pin.Edge(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B084E4D4);
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

uint64_t destroy for Pin.Placements(uint64_t a1)
{
  uint64_t result = a1 + 48;
  if (*(unsigned char *)(a1 + 128) != 1)
  {
    if (*(unsigned char *)(a1 + 128)) {
      return result;
    }
    __swift_destroy_boxed_opaque_existential_1(result);
    uint64_t result = a1 + 88;
  }

  return __swift_destroy_boxed_opaque_existential_1(result);
}

uint64_t initializeWithCopy for Pin.Placements(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  uint64_t v6 = a1 + 48;
  uint64_t v7 = a2 + 48;
  int v8 = *(unsigned __int8 *)(a2 + 128);
  id v9 = v5;
  if (v8 == 1)
  {
    long long v12 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 72) = v12;
    (**(void (***)(uint64_t, uint64_t))(v12 - 8))(v6, v7);
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(unsigned char *)(a1 + 128) = 1;
  }
  else if (v8)
  {
    long long v13 = *(_OWORD *)(v7 + 48);
    *(_OWORD *)(v6 + 32) = *(_OWORD *)(v7 + 32);
    *(_OWORD *)(v6 + 48) = v13;
    *(_OWORD *)(v6 + 64) = *(_OWORD *)(v7 + 64);
    *(unsigned char *)(v6 + 80) = *(unsigned char *)(v7 + 80);
    long long v14 = *(_OWORD *)(v7 + 16);
    *(_OWORD *)uint64_t v6 = *(_OWORD *)v7;
    *(_OWORD *)(v6 + 16) = v14;
  }
  else
  {
    long long v10 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 72) = v10;
    (**(void (***)(uint64_t, uint64_t))(v10 - 8))(v6, v7);
    long long v11 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 112) = v11;
    (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 88, a2 + 88);
    *(unsigned char *)(a1 + 128) = 0;
  }
  return a1;
}

uint64_t assignWithCopy for Pin.Placements(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  long long v4 = *(void **)(a2 + 32);
  uint64_t v5 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v4;
  id v6 = v4;

  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  if (a1 != a2)
  {
    sub_1B084D988(a1 + 48);
    if (*(unsigned char *)(a2 + 128) == 1)
    {
      uint64_t v9 = *(void *)(a2 + 72);
      *(void *)(a1 + 72) = v9;
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 48, a2 + 48);
      long long v10 = *(_OWORD *)(a2 + 104);
      *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
      *(_OWORD *)(a1 + 104) = v10;
      *(unsigned char *)(a1 + 128) = 1;
    }
    else if (*(unsigned char *)(a2 + 128))
    {
      long long v11 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
      *(_OWORD *)(a1 + 64) = v11;
      long long v12 = *(_OWORD *)(a2 + 80);
      long long v13 = *(_OWORD *)(a2 + 96);
      long long v14 = *(_OWORD *)(a2 + 112);
      *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
      *(_OWORD *)(a1 + 96) = v13;
      *(_OWORD *)(a1 + 112) = v14;
      *(_OWORD *)(a1 + 80) = v12;
    }
    else
    {
      uint64_t v7 = *(void *)(a2 + 72);
      *(void *)(a1 + 72) = v7;
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 48, a2 + 48);
      uint64_t v8 = *(void *)(a2 + 112);
      *(void *)(a1 + 112) = v8;
      *(void *)(a1 + 120) = *(void *)(a2 + 120);
      (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 88, a2 + 88);
      *(unsigned char *)(a1 + 128) = 0;
    }
  }
  return a1;
}

__n128 __swift_memcpy129_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for Pin.Placements(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  if (a1 != a2)
  {
    sub_1B084D988(a1 + 48);
    long long v6 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 96) = v6;
    *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
    *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
    long long v7 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v7;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for Pin.Placements(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 129)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Pin.Placements(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 128) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 129) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 129) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Pin.Placements()
{
  return &type metadata for Pin.Placements;
}

uint64_t destroy for Pin.Placements.LayoutState(uint64_t result)
{
  uint64_t v1 = result;
  unsigned int v2 = *(unsigned __int8 *)(result + 80);
  if (v2 >= 2) {
    unsigned int v2 = *(_DWORD *)result + 2;
  }
  if (v2 != 1)
  {
    if (v2) {
      return result;
    }
    __swift_destroy_boxed_opaque_existential_1(result);
    v1 += 40;
  }

  return __swift_destroy_boxed_opaque_existential_1(v1);
}

uint64_t initializeWithCopy for Pin.Placements.LayoutState(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(unsigned __int8 *)(a2 + 80);
  if (v4 >= 2) {
    unsigned int v4 = *(_DWORD *)a2 + 2;
  }
  if (v4 == 1)
  {
    long long v7 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1, a2);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(unsigned char *)(a1 + 80) = 1;
  }
  else if (v4)
  {
    long long v8 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v8;
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
    long long v9 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v9;
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v5;
    (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1, a2);
    long long v6 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 64) = v6;
    (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 40, a2 + 40);
    *(unsigned char *)(a1 + 80) = 0;
  }
  return a1;
}

uint64_t assignWithCopy for Pin.Placements.LayoutState(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  if (a1 == a2) {
    return v2;
  }
  unsigned int v4 = *(unsigned __int8 *)(a1 + 80);
  if (v4 >= 2) {
    unsigned int v4 = *(_DWORD *)a1 + 2;
  }
  if (v4 == 1) {
    goto LABEL_7;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    a1 = v2 + 40;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  unsigned int v5 = *(unsigned __int8 *)(a2 + 80);
  if (v5 >= 2) {
    unsigned int v5 = *(_DWORD *)a2 + 2;
  }
  if (v5 == 1)
  {
    uint64_t v8 = *(void *)(a2 + 24);
    *(void *)(v2 + 24) = v8;
    *(void *)(v2 + 32) = *(void *)(a2 + 32);
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))(v2, a2);
    long long v9 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(v2 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(v2 + 56) = v9;
    *(unsigned char *)(v2 + 80) = 1;
  }
  else if (v5)
  {
    long long v10 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)uint64_t v2 = *(_OWORD *)a2;
    *(_OWORD *)(v2 + 16) = v10;
    long long v11 = *(_OWORD *)(a2 + 32);
    long long v12 = *(_OWORD *)(a2 + 48);
    long long v13 = *(_OWORD *)(a2 + 64);
    *(unsigned char *)(v2 + 80) = *(unsigned char *)(a2 + 80);
    *(_OWORD *)(v2 + 48) = v12;
    *(_OWORD *)(v2 + 64) = v13;
    *(_OWORD *)(v2 + 32) = v11;
  }
  else
  {
    uint64_t v6 = *(void *)(a2 + 24);
    *(void *)(v2 + 24) = v6;
    *(void *)(v2 + 32) = *(void *)(a2 + 32);
    (**(void (***)(uint64_t, uint64_t))(v6 - 8))(v2, a2);
    uint64_t v7 = *(void *)(a2 + 64);
    *(void *)(v2 + 64) = v7;
    *(void *)(v2 + 72) = *(void *)(a2 + 72);
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))(v2 + 40, a2 + 40);
    *(unsigned char *)(v2 + 80) = 0;
  }
  return v2;
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

uint64_t assignWithTake for Pin.Placements.LayoutState(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  if (a1 == a2) {
    return v2;
  }
  unsigned int v4 = *(unsigned __int8 *)(a1 + 80);
  if (v4 >= 2) {
    unsigned int v4 = *(_DWORD *)a1 + 2;
  }
  if (v4 == 1) {
    goto LABEL_7;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    a1 = v2 + 40;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  unsigned int v5 = *(unsigned __int8 *)(a2 + 80);
  if (v5 >= 2) {
    unsigned int v5 = *(_DWORD *)a2 + 2;
  }
  if (v5 == 1)
  {
    long long v8 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(v2 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(v2 + 48) = v8;
    *(void *)(v2 + 64) = *(void *)(a2 + 64);
    long long v9 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)uint64_t v2 = *(_OWORD *)a2;
    *(_OWORD *)(v2 + 16) = v9;
    *(unsigned char *)(v2 + 80) = 1;
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(v2 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(v2 + 48) = v6;
    *(_OWORD *)(v2 + 64) = *(_OWORD *)(a2 + 64);
    if (v5)
    {
      *(unsigned char *)(v2 + 80) = *(unsigned char *)(a2 + 80);
      long long v10 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)uint64_t v2 = *(_OWORD *)a2;
      *(_OWORD *)(v2 + 16) = v10;
    }
    else
    {
      long long v7 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)uint64_t v2 = *(_OWORD *)a2;
      *(_OWORD *)(v2 + 16) = v7;
      *(unsigned char *)(v2 + 80) = 0;
    }
  }
  return v2;
}

uint64_t getEnumTagSinglePayload for Pin.Placements.LayoutState(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 81)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 >= 3) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Pin.Placements.LayoutState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 80) = 0;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_DWORD *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 81) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 81) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 80) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1B084EEF8(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 80);
  if (result >= 2) {
    return (*(_DWORD *)a1 + 2);
  }
  return result;
}

uint64_t sub_1B084EF14(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)uint64_t result = 0u;
    *(_DWORD *)uint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 80) = a2;
  return result;
}

ValueMetadata *type metadata accessor for Pin.Placements.LayoutState()
{
  return &type metadata for Pin.Placements.LayoutState;
}

void *sub_1B084EF50(long long *a1)
{
  return sub_1B084F9A8(a1, sub_1B08505D4, (void *(*)(long long *__return_ptr, uint64_t))HorizontalStack.Placements.next());
}

uint64_t sub_1B084EF7C(uint64_t a1)
{
  sub_1B07D0DAC(a1, (uint64_t)&v81);
  sub_1B07BA914((uint64_t)v91, (uint64_t)&v59);
  double v53 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v1 = 0;
  if (*((void *)&v60 + 1))
  {
    uint64_t v2 = MEMORY[0x1E4FBC860] + 32;
    while (1)
    {
      uint64_t v58 = v1;
      sub_1B07BA8FC(&v59, (uint64_t)v66);
      sub_1B07BBE14((uint64_t)v91, &qword_1EB595778);
      memset(v91, 0, sizeof(v91));
      uint64_t v92 = 0;
      double v3 = v83;
      int v4 = v84;
      double v5 = v85;
      int v6 = v86;
      CGFloat x = v81.origin.x;
      CGFloat y = v81.origin.y;
      CGFloat width = v81.size.width;
      CGFloat height = v81.size.height;
      double v11 = CGRectGetWidth(v81);
      unsigned __int8 v12 = v4 ^ 1;
      int v13 = (v4 ^ 1) & (v11 < v3);
      double v57 = v3;
      if (v13) {
        double v14 = v3;
      }
      else {
        double v14 = v11;
      }
      double v54 = v5;
      if (v11 > v5) {
        double v11 = v5;
      }
      if (v6) {
        double v11 = v14;
      }
      if (v13) {
        double v15 = v14;
      }
      else {
        double v15 = v11;
      }
      double v16 = v87;
      int v17 = v88;
      double v18 = v89;
      int v19 = v90;
      v93.origin.CGFloat x = x;
      v93.origin.CGFloat y = y;
      v93.size.CGFloat width = width;
      v93.size.CGFloat height = height;
      double v20 = CGRectGetHeight(v93);
      int v21 = (v17 ^ 1) & (v20 < v16);
      if (v21) {
        double v22 = v16;
      }
      else {
        double v22 = v20;
      }
      if (v20 > v18) {
        double v20 = v18;
      }
      if (v19) {
        double v20 = v22;
      }
      if (v21) {
        double v23 = v22;
      }
      else {
        double v23 = v20;
      }
      uint64_t v24 = v67;
      uint64_t v25 = v68;
      __swift_project_boxed_opaque_existential_1(v66, v67);
      double v26 = (*(double (**)(uint64_t, uint64_t, uint64_t, double, double))(v25 + 8))(v82, v24, v25, v15, v23);
      double v28 = v27;
      double v55 = v30;
      double v56 = v29;
      v94.origin.CGFloat x = x;
      v94.origin.CGFloat y = y;
      v94.size.CGFloat width = width;
      v94.size.CGFloat height = height;
      double MinX = CGRectGetMinX(v94);
      v95.origin.CGFloat x = x;
      v95.origin.CGFloat y = y;
      v95.size.CGFloat width = width;
      v95.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v95);
      if ((v12 & (v26 < v57)) != 0) {
        double v33 = v57;
      }
      else {
        double v33 = v26;
      }
      if ((v12 & (v26 < v57) | v6) != 1)
      {
        double v33 = v54;
        if (v26 <= v54) {
          double v33 = v26;
        }
      }
      if (((v17 ^ 1) & (v28 < v16)) != 0) {
        double v34 = v16;
      }
      else {
        double v34 = v28;
      }
      uint64_t v1 = v58;
      if (((v17 ^ 1) & (v28 < v16) | v19) != 1)
      {
        double v34 = v18;
        if (v28 <= v18) {
          double v34 = v28;
        }
      }
      sub_1B07BBD78((uint64_t)v66, (uint64_t)v65);
      sub_1B07BBD78((uint64_t)v65, (uint64_t)&v59);
      *((void *)&v61 + 1) = floor(MinX);
      *(void *)&long long v62 = floor(MinY);
      *((void *)&v62 + 1) = ceil(v33);
      *(void *)&long long v63 = ceil(v34);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
      *((void *)&v63 + 1) = floor(v56);
      double v64 = floor(v55);
      long long v71 = v61;
      long long v72 = v62;
      long long v69 = v59;
      long long v70 = v60;
      long long v73 = v63;
      double v74 = v64;
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v66);
      if (!*((void *)&v70 + 1)) {
        break;
      }
      long long v77 = v71;
      long long v78 = v72;
      long long v79 = v73;
      double v80 = v74;
      long long v75 = v69;
      long long v76 = v70;
      if (v58)
      {
        uint64_t v1 = v58 - 1;
        if (__OFSUB__(v58, 1)) {
          goto LABEL_56;
        }
      }
      else
      {
        unint64_t v36 = v53[3];
        if ((uint64_t)((v36 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_57;
        }
        int64_t v37 = v36 & 0xFFFFFFFFFFFFFFFELL;
        if (v37 <= 1) {
          uint64_t v38 = 1;
        }
        else {
          uint64_t v38 = v37;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BB78);
        CGFloat v39 = (void *)swift_allocObject();
        uint64_t v40 = (uint64_t)(_swift_stdlib_malloc_size(v39) - 32) / 88;
        v39[2] = v38;
        v39[3] = 2 * v40;
        unint64_t v41 = (unint64_t)(v39 + 4);
        uint64_t v42 = v53[3] >> 1;
        if (v53[2])
        {
          uint64_t v43 = v53 + 4;
          if (v39 != v53 || v41 >= (unint64_t)v43 + 88 * v42) {
            memmove(v39 + 4, v43, 88 * v42);
          }
          v53[2] = 0;
        }
        uint64_t v2 = v41 + 88 * v42;
        uint64_t v44 = (v40 & 0x7FFFFFFFFFFFFFFFLL) - v42;
        uint64_t result = swift_release();
        double v53 = v39;
        BOOL v45 = __OFSUB__(v44, 1);
        uint64_t v1 = v44 - 1;
        if (v45)
        {
LABEL_56:
          __break(1u);
LABEL_57:
          __break(1u);
          goto LABEL_58;
        }
      }
      long long v46 = v76;
      *(_OWORD *)uint64_t v2 = v75;
      *(_OWORD *)(v2 + 16) = v46;
      long long v47 = v77;
      long long v48 = v78;
      long long v49 = v79;
      *(double *)(v2 + 80) = v80;
      *(_OWORD *)(v2 + 48) = v48;
      *(_OWORD *)(v2 + 64) = v49;
      *(_OWORD *)(v2 + 32) = v47;
      v2 += 88;
      sub_1B07BA914((uint64_t)v91, (uint64_t)&v59);
      if (!*((void *)&v60 + 1)) {
        goto LABEL_51;
      }
    }
  }
  else
  {
LABEL_51:
    sub_1B07BBE14((uint64_t)&v59, &qword_1EB595778);
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    double v74 = 0.0;
  }
  sub_1B07D10AC((uint64_t)&v81);
  sub_1B07BBE14((uint64_t)&v69, &qword_1E9B3B3F8);
  uint64_t result = (uint64_t)v53;
  unint64_t v50 = v53[3];
  if (v50 >= 2)
  {
    unint64_t v51 = v50 >> 1;
    BOOL v45 = __OFSUB__(v51, v1);
    uint64_t v52 = v51 - v1;
    if (v45) {
LABEL_58:
    }
      __break(1u);
    else {
      v53[2] = v52;
    }
  }
  return result;
}

uint64_t sub_1B084F408(uint64_t a1)
{
  sub_1B07BB13C(a1, (uint64_t)&v58);
  sub_1B07BA914((uint64_t)v63, (uint64_t)&v36);
  uint64_t v1 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v2 = 0;
  if (*((void *)&v37 + 1))
  {
    uint64_t v3 = MEMORY[0x1E4FBC860] + 32;
    while (1)
    {
      sub_1B07BA8FC(&v36, (uint64_t)v43);
      sub_1B07BBE14((uint64_t)v63, &qword_1EB595778);
      memset(v63, 0, sizeof(v63));
      uint64_t v64 = 0;
      uint64_t v4 = v44;
      uint64_t v5 = v45;
      __swift_project_boxed_opaque_existential_1(v43, v44);
      CGFloat v6 = v60;
      CGFloat v7 = v61;
      double v8 = (*(double (**)(uint64_t, uint64_t, uint64_t, double, double))(v5 + 8))(v62, v4, v5, v60, v61);
      double v10 = v9;
      double v34 = v12;
      double v35 = v11;
      CGFloat v13 = v58;
      CGFloat v14 = v59;
      v65.origin.CGFloat x = v58;
      v65.origin.CGFloat y = v59;
      v65.size.CGFloat width = v6;
      v65.size.CGFloat height = v7;
      double v15 = CGRectGetMidX(v65) - v8 * 0.5;
      v66.origin.CGFloat x = v13;
      v66.origin.CGFloat y = v14;
      v66.size.CGFloat width = v6;
      v66.size.CGFloat height = v7;
      double v16 = CGRectGetMidY(v66) - v10 * 0.5;
      sub_1B07BBD78((uint64_t)v43, (uint64_t)v42);
      sub_1B07BBD78((uint64_t)v42, (uint64_t)&v36);
      *((void *)&v38 + 1) = floor(v15);
      *(void *)&long long v39 = floor(v16);
      *((void *)&v39 + 1) = ceil(v8);
      *(void *)&long long v40 = ceil(v10);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
      *((void *)&v40 + 1) = floor(v35);
      double v41 = floor(v34);
      long long v48 = v38;
      long long v49 = v39;
      long long v46 = v36;
      long long v47 = v37;
      long long v50 = v40;
      double v51 = v41;
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
      if (!*((void *)&v47 + 1)) {
        break;
      }
      long long v54 = v48;
      long long v55 = v49;
      long long v56 = v50;
      double v57 = v51;
      long long v52 = v46;
      long long v53 = v47;
      if (!v2)
      {
        unint64_t v18 = v1[3];
        if ((uint64_t)((v18 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_23;
        }
        int64_t v19 = v18 & 0xFFFFFFFFFFFFFFFELL;
        if (v19 <= 1) {
          uint64_t v20 = 1;
        }
        else {
          uint64_t v20 = v19;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BB78);
        int v21 = (void *)swift_allocObject();
        uint64_t v22 = (uint64_t)(_swift_stdlib_malloc_size(v21) - 32) / 88;
        v21[2] = v20;
        void v21[3] = 2 * v22;
        unint64_t v23 = (unint64_t)(v21 + 4);
        uint64_t v24 = v1[3] >> 1;
        if (v1[2])
        {
          uint64_t v25 = v1 + 4;
          if (v21 != v1 || v23 >= (unint64_t)v25 + 88 * v24) {
            memmove(v21 + 4, v25, 88 * v24);
          }
          v1[2] = 0;
        }
        uint64_t v3 = v23 + 88 * v24;
        uint64_t v2 = (v22 & 0x7FFFFFFFFFFFFFFFLL) - v24;
        uint64_t result = swift_release();
        uint64_t v1 = v21;
      }
      BOOL v26 = __OFSUB__(v2--, 1);
      if (v26)
      {
        __break(1u);
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
      long long v27 = v53;
      *(_OWORD *)uint64_t v3 = v52;
      *(_OWORD *)(v3 + 16) = v27;
      long long v28 = v54;
      long long v29 = v55;
      long long v30 = v56;
      *(double *)(v3 + 80) = v57;
      *(_OWORD *)(v3 + 48) = v29;
      *(_OWORD *)(v3 + 64) = v30;
      *(_OWORD *)(v3 + 32) = v28;
      v3 += 88;
      sub_1B07BA914((uint64_t)v63, (uint64_t)&v36);
      if (!*((void *)&v37 + 1)) {
        goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:
    sub_1B07BBE14((uint64_t)&v36, &qword_1EB595778);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    double v51 = 0.0;
  }
  sub_1B07B968C((uint64_t)&v58);
  uint64_t result = sub_1B07BBE14((uint64_t)&v46, &qword_1E9B3B3F8);
  unint64_t v31 = v1[3];
  if (v31 < 2) {
    return (uint64_t)v1;
  }
  unint64_t v32 = v31 >> 1;
  BOOL v26 = __OFSUB__(v32, v2);
  uint64_t v33 = v32 - v2;
  if (!v26)
  {
    v1[2] = v33;
    return (uint64_t)v1;
  }
LABEL_24:
  __break(1u);
  return result;
}

void sub_1B084F770(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 80);
  long long v40 = *(_OWORD *)(a1 + 64);
  long long v41 = v1;
  char v42 = *(unsigned char *)(a1 + 96);
  long long v2 = *(_OWORD *)(a1 + 16);
  long long v36 = *(_OWORD *)a1;
  long long v37 = v2;
  long long v3 = *(_OWORD *)(a1 + 48);
  long long v38 = *(_OWORD *)(a1 + 32);
  long long v39 = v3;
  sub_1B085058C(a1);
  DisjointStack.Placements.next()((uint64_t)&v24);
  uint64_t v4 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v5 = 0;
  if (*((void *)&v25 + 1))
  {
    uint64_t v6 = MEMORY[0x1E4FBC860] + 32;
    while (1)
    {
      long long v33 = v27;
      long long v34 = v28;
      uint64_t v35 = v29;
      long long v30 = v24;
      long long v31 = v25;
      long long v32 = v26;
      if (!v5)
      {
        unint64_t v7 = v4[3];
        if ((uint64_t)((v7 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_24;
        }
        int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
        if (v8 <= 1) {
          uint64_t v9 = 1;
        }
        else {
          uint64_t v9 = v8;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BB78);
        double v10 = (void *)swift_allocObject();
        uint64_t v11 = (uint64_t)(_swift_stdlib_malloc_size(v10) - 32) / 88;
        v10[2] = v9;
        void v10[3] = 2 * v11;
        unint64_t v12 = (unint64_t)(v10 + 4);
        uint64_t v13 = v4[3] >> 1;
        if (v4[2])
        {
          if (v10 != v4 || v12 >= (unint64_t)&v4[11 * v13 + 4]) {
            memmove(v10 + 4, v4 + 4, 88 * v13);
          }
          v4[2] = 0;
        }
        uint64_t v6 = v12 + 88 * v13;
        uint64_t v5 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - v13;
        swift_release();
        uint64_t v4 = v10;
      }
      BOOL v15 = __OFSUB__(v5--, 1);
      if (v15) {
        break;
      }
      long long v16 = v31;
      *(_OWORD *)uint64_t v6 = v30;
      *(_OWORD *)(v6 + 16) = v16;
      long long v17 = v32;
      long long v18 = v33;
      long long v19 = v34;
      *(void *)(v6 + 80) = v35;
      *(_OWORD *)(v6 + 48) = v18;
      *(_OWORD *)(v6 + 64) = v19;
      *(_OWORD *)(v6 + 32) = v17;
      v6 += 88;
      DisjointStack.Placements.next()((uint64_t)&v24);
      if (!*((void *)&v25 + 1)) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_19:
  uint64_t v20 = (void *)v38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B07BBE14((uint64_t)&v24, &qword_1E9B3B3F8);
  unint64_t v21 = v4[3];
  if (v21 >= 2)
  {
    unint64_t v22 = v21 >> 1;
    BOOL v15 = __OFSUB__(v22, v5);
    uint64_t v23 = v22 - v5;
    if (v15)
    {
LABEL_25:
      __break(1u);
      return;
    }
    v4[2] = v23;
  }
}

void *sub_1B084F97C(long long *a1)
{
  return sub_1B084F9A8(a1, (uint64_t (*)(void))sub_1B0850174, (void *(*)(long long *__return_ptr, uint64_t))VerticalStack.Placements.next());
}

void *sub_1B084F9A8(long long *a1, uint64_t (*a2)(void), void *(*a3)(long long *__return_ptr, uint64_t))
{
  long long v4 = a1[1];
  long long v40 = *a1;
  long long v41 = v4;
  long long v5 = a1[3];
  long long v42 = a1[2];
  long long v43 = v5;
  uint64_t v6 = a2();
  uint64_t result = a3(&v28, v6);
  int64_t v8 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v9 = 0;
  if (*((void *)&v29 + 1))
  {
    uint64_t v10 = MEMORY[0x1E4FBC860] + 32;
    while (1)
    {
      long long v37 = v31;
      long long v38 = v32;
      uint64_t v39 = v33;
      long long v34 = v28;
      long long v35 = v29;
      long long v36 = v30;
      if (!v9)
      {
        unint64_t v11 = v8[3];
        if ((uint64_t)((v11 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_24;
        }
        int64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
        if (v12 <= 1) {
          uint64_t v13 = 1;
        }
        else {
          uint64_t v13 = v12;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BB78);
        CGFloat v14 = (void *)swift_allocObject();
        uint64_t v15 = (uint64_t)(_swift_stdlib_malloc_size(v14) - 32) / 88;
        long long v14[2] = v13;
        _OWORD v14[3] = 2 * v15;
        unint64_t v16 = (unint64_t)(v14 + 4);
        uint64_t v17 = v8[3] >> 1;
        if (v8[2])
        {
          if (v14 != v8 || v16 >= (unint64_t)&v8[11 * v17 + 4]) {
            memmove(v14 + 4, v8 + 4, 88 * v17);
          }
          v8[2] = 0;
        }
        uint64_t v10 = v16 + 88 * v17;
        uint64_t v9 = (v15 & 0x7FFFFFFFFFFFFFFFLL) - v17;
        uint64_t result = (void *)swift_release();
        int64_t v8 = v14;
      }
      BOOL v19 = __OFSUB__(v9--, 1);
      if (v19) {
        break;
      }
      long long v20 = v35;
      *(_OWORD *)uint64_t v10 = v34;
      *(_OWORD *)(v10 + 16) = v20;
      long long v21 = v36;
      long long v22 = v37;
      long long v23 = v38;
      *(void *)(v10 + 80) = v39;
      *(_OWORD *)(v10 + 48) = v22;
      *(_OWORD *)(v10 + 64) = v23;
      *(_OWORD *)(v10 + 32) = v21;
      v10 += 88;
      uint64_t result = a3(&v28, (uint64_t)result);
      if (!*((void *)&v29 + 1)) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_19:
  long long v24 = (void *)v42;
  swift_bridgeObjectRelease();

  uint64_t result = (void *)sub_1B07BBE14((uint64_t)&v28, &qword_1E9B3B3F8);
  unint64_t v25 = v8[3];
  if (v25 < 2) {
    return v8;
  }
  unint64_t v26 = v25 >> 1;
  BOOL v19 = __OFSUB__(v26, v9);
  uint64_t v27 = v26 - v9;
  if (!v19)
  {
    v8[2] = v27;
    return v8;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1B084FBA4(uint64_t a1)
{
  sub_1B08004E8(a1, (uint64_t)&v29);
  uint64_t v1 = *((void *)&v30 + 1);
  uint64_t v2 = v31;
  __swift_project_boxed_opaque_existential_1(&v29, *((uint64_t *)&v30 + 1));
  (*(void (**)(uint64_t, uint64_t))(v2 + 24))(v1, v2);
  sub_1B0800544((uint64_t)&v29);
  uint64_t result = sub_1B086A728();
  long long v4 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v5 = 0;
  if (*((void *)&v24 + 1))
  {
    uint64_t v6 = MEMORY[0x1E4FBC860] + 32;
    while (1)
    {
      long long v32 = v26;
      long long v33 = v27;
      uint64_t v34 = v28;
      long long v29 = v23;
      long long v30 = v24;
      long long v31 = v25;
      if (!v5)
      {
        unint64_t v7 = v4[3];
        if ((uint64_t)((v7 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_24;
        }
        int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
        if (v8 <= 1) {
          uint64_t v9 = 1;
        }
        else {
          uint64_t v9 = v8;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BB78);
        uint64_t v10 = (void *)swift_allocObject();
        uint64_t v11 = (uint64_t)(_swift_stdlib_malloc_size(v10) - 32) / 88;
        v10[2] = v9;
        void v10[3] = 2 * v11;
        unint64_t v12 = (unint64_t)(v10 + 4);
        uint64_t v13 = v4[3] >> 1;
        if (v4[2])
        {
          if (v10 != v4 || v12 >= (unint64_t)&v4[11 * v13 + 4]) {
            memmove(v10 + 4, v4 + 4, 88 * v13);
          }
          v4[2] = 0;
        }
        uint64_t v6 = v12 + 88 * v13;
        uint64_t v5 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - v13;
        uint64_t result = swift_release();
        long long v4 = v10;
      }
      BOOL v15 = __OFSUB__(v5--, 1);
      if (v15) {
        break;
      }
      long long v16 = v30;
      *(_OWORD *)uint64_t v6 = v29;
      *(_OWORD *)(v6 + 16) = v16;
      long long v17 = v31;
      long long v18 = v32;
      long long v19 = v33;
      *(void *)(v6 + 80) = v34;
      *(_OWORD *)(v6 + 48) = v18;
      *(_OWORD *)(v6 + 64) = v19;
      *(_OWORD *)(v6 + 32) = v17;
      v6 += 88;
      uint64_t result = sub_1B086A728();
      if (!*((void *)&v24 + 1)) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_19:
  swift_release();
  uint64_t result = sub_1B07BBE14((uint64_t)&v23, &qword_1E9B3B3F8);
  unint64_t v20 = v4[3];
  if (v20 < 2) {
    return (uint64_t)v4;
  }
  unint64_t v21 = v20 >> 1;
  BOOL v15 = __OFSUB__(v21, v5);
  uint64_t v22 = v21 - v5;
  if (!v15)
  {
    v4[2] = v22;
    return (uint64_t)v4;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1B084FDB4(uint64_t a1)
{
  sub_1B0800124(a1, (uint64_t)v33);
  uint64_t result = Pin.Placements.next()((uint64_t)&v21);
  uint64_t v2 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v3 = 0;
  if (*((void *)&v22 + 1))
  {
    uint64_t v4 = MEMORY[0x1E4FBC860] + 32;
    while (1)
    {
      long long v30 = v24;
      long long v31 = v25;
      uint64_t v32 = v26;
      long long v27 = v21;
      long long v28 = v22;
      long long v29 = v23;
      if (!v3)
      {
        unint64_t v5 = v2[3];
        if ((uint64_t)((v5 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_24;
        }
        int64_t v6 = v5 & 0xFFFFFFFFFFFFFFFELL;
        if (v6 <= 1) {
          uint64_t v7 = 1;
        }
        else {
          uint64_t v7 = v6;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BB78);
        int64_t v8 = (void *)swift_allocObject();
        uint64_t v9 = (uint64_t)(_swift_stdlib_malloc_size(v8) - 32) / 88;
        v8[2] = v7;
        v8[3] = 2 * v9;
        unint64_t v10 = (unint64_t)(v8 + 4);
        uint64_t v11 = v2[3] >> 1;
        if (v2[2])
        {
          if (v8 != v2 || v10 >= (unint64_t)&v2[11 * v11 + 4]) {
            memmove(v8 + 4, v2 + 4, 88 * v11);
          }
          v2[2] = 0;
        }
        uint64_t v4 = v10 + 88 * v11;
        uint64_t v3 = (v9 & 0x7FFFFFFFFFFFFFFFLL) - v11;
        uint64_t result = swift_release();
        uint64_t v2 = v8;
      }
      BOOL v13 = __OFSUB__(v3--, 1);
      if (v13) {
        break;
      }
      long long v14 = v28;
      *(_OWORD *)uint64_t v4 = v27;
      *(_OWORD *)(v4 + 16) = v14;
      long long v15 = v29;
      long long v16 = v30;
      long long v17 = v31;
      *(void *)(v4 + 80) = v32;
      *(_OWORD *)(v4 + 48) = v16;
      *(_OWORD *)(v4 + 64) = v17;
      *(_OWORD *)(v4 + 32) = v15;
      v4 += 88;
      uint64_t result = Pin.Placements.next()((uint64_t)&v21);
      if (!*((void *)&v22 + 1)) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_19:
  sub_1B0800180((uint64_t)v33);
  uint64_t result = sub_1B07BBE14((uint64_t)&v21, &qword_1E9B3B3F8);
  unint64_t v18 = v2[3];
  if (v18 < 2) {
    return (uint64_t)v2;
  }
  unint64_t v19 = v18 >> 1;
  BOOL v13 = __OFSUB__(v19, v3);
  uint64_t v20 = v19 - v3;
  if (!v13)
  {
    v2[2] = v20;
    return (uint64_t)v2;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1B084FF94(uint64_t a1)
{
  sub_1B07B9D00(a1, (uint64_t)v33);
  uint64_t result = Resize.Placements.next()((uint64_t)&v21);
  uint64_t v2 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v3 = 0;
  if (*((void *)&v22 + 1))
  {
    uint64_t v4 = MEMORY[0x1E4FBC860] + 32;
    while (1)
    {
      long long v30 = v24;
      long long v31 = v25;
      uint64_t v32 = v26;
      long long v27 = v21;
      long long v28 = v22;
      long long v29 = v23;
      if (!v3)
      {
        unint64_t v5 = v2[3];
        if ((uint64_t)((v5 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_24;
        }
        int64_t v6 = v5 & 0xFFFFFFFFFFFFFFFELL;
        if (v6 <= 1) {
          uint64_t v7 = 1;
        }
        else {
          uint64_t v7 = v6;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BB78);
        int64_t v8 = (void *)swift_allocObject();
        uint64_t v9 = (uint64_t)(_swift_stdlib_malloc_size(v8) - 32) / 88;
        v8[2] = v7;
        v8[3] = 2 * v9;
        unint64_t v10 = (unint64_t)(v8 + 4);
        uint64_t v11 = v2[3] >> 1;
        if (v2[2])
        {
          if (v8 != v2 || v10 >= (unint64_t)&v2[11 * v11 + 4]) {
            memmove(v8 + 4, v2 + 4, 88 * v11);
          }
          v2[2] = 0;
        }
        uint64_t v4 = v10 + 88 * v11;
        uint64_t v3 = (v9 & 0x7FFFFFFFFFFFFFFFLL) - v11;
        uint64_t result = swift_release();
        uint64_t v2 = v8;
      }
      BOOL v13 = __OFSUB__(v3--, 1);
      if (v13) {
        break;
      }
      long long v14 = v28;
      *(_OWORD *)uint64_t v4 = v27;
      *(_OWORD *)(v4 + 16) = v14;
      long long v15 = v29;
      long long v16 = v30;
      long long v17 = v31;
      *(void *)(v4 + 80) = v32;
      *(_OWORD *)(v4 + 48) = v16;
      *(_OWORD *)(v4 + 64) = v17;
      *(_OWORD *)(v4 + 32) = v15;
      v4 += 88;
      uint64_t result = Resize.Placements.next()((uint64_t)&v21);
      if (!*((void *)&v22 + 1)) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_19:
  sub_1B07B99C0((uint64_t)v33);
  uint64_t result = sub_1B07BBE14((uint64_t)&v21, &qword_1E9B3B3F8);
  unint64_t v18 = v2[3];
  if (v18 < 2) {
    return (uint64_t)v2;
  }
  unint64_t v19 = v18 >> 1;
  BOOL v13 = __OFSUB__(v19, v3);
  uint64_t v20 = v19 - v3;
  if (!v13)
  {
    v2[2] = v20;
    return (uint64_t)v2;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1B0850174(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1B08501A8(uint64_t a1)
{
  sub_1B07C0D04(a1, (uint64_t)&v71);
  sub_1B07BA914((uint64_t)v73, (uint64_t)&v49);
  uint64_t v1 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v2 = 0;
  if (*((void *)&v50 + 1))
  {
    uint64_t v3 = MEMORY[0x1E4FBC860] + 32;
    while (1)
    {
      sub_1B07BA8FC(&v49, (uint64_t)v56);
      sub_1B07BBE14((uint64_t)v73, &qword_1EB595778);
      memset(v73, 0, sizeof(v73));
      uint64_t v74 = 0;
      uint64_t v4 = v72;
      double v5 = sub_1B07C1158(v72);
      double v47 = v6;
      double v48 = v7;
      double v8 = v7;
      CGFloat x = v71.origin.x;
      CGFloat y = v71.origin.y;
      CGFloat width = v71.size.width;
      CGFloat height = v71.size.height;
      double v14 = CGRectGetWidth(v71) - (v6 + v13);
      v75.origin.CGFloat x = x;
      v75.origin.CGFloat y = y;
      v75.size.CGFloat width = width;
      v75.size.CGFloat height = height;
      double v15 = CGRectGetHeight(v75) - (v5 + v8);
      double v16 = v14 < 0.0 ? 0.0 : v14;
      double v17 = v15 < 0.0 ? 0.0 : v15;
      uint64_t v18 = v57;
      uint64_t v19 = v58;
      __swift_project_boxed_opaque_existential_1(v56, v57);
      double v20 = (*(double (**)(void *, uint64_t, uint64_t, double, double))(v19 + 8))(v4, v18, v19, v16, v17);
      double v45 = v21;
      double v46 = v20;
      double v23 = v22;
      double v25 = v24;
      v76.origin.CGFloat x = x;
      v76.origin.CGFloat y = y;
      v76.size.CGFloat width = width;
      v76.size.CGFloat height = height;
      double v26 = v47 + CGRectGetMinX(v76);
      v77.origin.CGFloat x = x;
      v77.origin.CGFloat y = y;
      v77.size.CGFloat width = width;
      v77.size.CGFloat height = height;
      double v27 = v5 + CGRectGetMinY(v77);
      sub_1B07BBD78((uint64_t)v56, (uint64_t)v55);
      sub_1B07BBD78((uint64_t)v55, (uint64_t)&v49);
      *((void *)&v51 + 1) = floor(v26);
      *(void *)&long long v52 = floor(v27);
      *((void *)&v52 + 1) = ceil(v46);
      *(void *)&long long v53 = ceil(v45);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v55);
      *((void *)&v53 + 1) = floor(v5 + v23);
      double v54 = floor(v48 + v25);
      long long v61 = v51;
      long long v62 = v52;
      long long v59 = v49;
      long long v60 = v50;
      long long v63 = v53;
      double v64 = v54;
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
      if (!*((void *)&v60 + 1)) {
        break;
      }
      long long v67 = v61;
      long long v68 = v62;
      long long v69 = v63;
      double v70 = v64;
      long long v65 = v59;
      long long v66 = v60;
      if (!v2)
      {
        unint64_t v29 = v1[3];
        if ((uint64_t)((v29 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_29;
        }
        int64_t v30 = v29 & 0xFFFFFFFFFFFFFFFELL;
        if (v30 <= 1) {
          uint64_t v31 = 1;
        }
        else {
          uint64_t v31 = v30;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BB78);
        uint64_t v32 = (void *)swift_allocObject();
        uint64_t v33 = (uint64_t)(_swift_stdlib_malloc_size(v32) - 32) / 88;
        v32[2] = v31;
        v32[3] = 2 * v33;
        unint64_t v34 = (unint64_t)(v32 + 4);
        uint64_t v35 = v1[3] >> 1;
        if (v1[2])
        {
          long long v36 = v1 + 4;
          if (v32 != v1 || v34 >= (unint64_t)v36 + 88 * v35) {
            memmove(v32 + 4, v36, 88 * v35);
          }
          v1[2] = 0;
        }
        uint64_t v3 = v34 + 88 * v35;
        uint64_t v2 = (v33 & 0x7FFFFFFFFFFFFFFFLL) - v35;
        uint64_t result = swift_release();
        uint64_t v1 = v32;
      }
      BOOL v37 = __OFSUB__(v2--, 1);
      if (v37)
      {
        __break(1u);
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
      long long v38 = v66;
      *(_OWORD *)uint64_t v3 = v65;
      *(_OWORD *)(v3 + 16) = v38;
      long long v39 = v67;
      long long v40 = v68;
      long long v41 = v69;
      *(double *)(v3 + 80) = v70;
      *(_OWORD *)(v3 + 48) = v40;
      *(_OWORD *)(v3 + 64) = v41;
      *(_OWORD *)(v3 + 32) = v39;
      v3 += 88;
      sub_1B07BA914((uint64_t)v73, (uint64_t)&v49);
      if (!*((void *)&v50 + 1)) {
        goto LABEL_23;
      }
    }
  }
  else
  {
LABEL_23:
    sub_1B07BBE14((uint64_t)&v49, &qword_1EB595778);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    double v64 = 0.0;
  }
  sub_1B07C09AC((uint64_t)&v71);
  uint64_t result = sub_1B07BBE14((uint64_t)&v59, &qword_1E9B3B3F8);
  unint64_t v42 = v1[3];
  if (v42 < 2) {
    return (uint64_t)v1;
  }
  unint64_t v43 = v42 >> 1;
  BOOL v37 = __OFSUB__(v43, v2);
  uint64_t v44 = v43 - v2;
  if (!v37)
  {
    v1[2] = v44;
    return (uint64_t)v1;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1B085058C(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t DisjointStack.insert(_:at:with:)(void *a1, int64_t a2, char a3, void (*a4)(unsigned char *))
{
  char v6 = a3 & 1;
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  Measurable.placeable.getter(v7, v8, v10);
  DisjointStack.insert(_:at:with:)((uint64_t)v10, a2, v6, a4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
}

uint64_t DisjointStack.inserting(_:at:with:)@<X0>(void *a1@<X0>, int64_t a2@<X1>, char a3@<W2>, void (*a4)(unsigned char *)@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6 = v5;
  char v10 = a3 & 1;
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v11);
  Measurable.placeable.getter(v11, v12, v14);
  sub_1B08001D8(v6, a5);
  DisjointStack.insert(_:at:with:)((uint64_t)v14, a2, v10, a4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
}

id sub_1B0850724(uint64_t a1, uint64_t a2)
{
  return sub_1B0850874(a1, a2, (SEL *)&selRef_frame);
}

id sub_1B0850730()
{
  uint64_t v1 = *(void **)v0;
  objc_msgSend(*(id *)(v0 + 16), sel_convertRect_toCoordinateSpace_, *(void *)(v0 + 8));

  return objc_msgSend(v1, sel_setFrame_);
}

void (*sub_1B085077C(void *a1))(double **a1)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = *(void **)v1;
  uint64_t v5 = *(void *)(v1 + 8);
  v3[4] = *(void *)v1;
  v3[5] = v5;
  uint64_t v6 = *(void **)(v1 + 16);
  v3[6] = v6;
  objc_msgSend(v4, sel_frame);
  objc_msgSend(v6, sel_convertRect_fromCoordinateSpace_, v5);
  *uint64_t v3 = v7;
  v3[1] = v8;
  v3[2] = v9;
  v3[3] = v10;
  return sub_1B0850808;
}

void sub_1B0850808(double **a1)
{
  uint64_t v1 = *a1;
  id v2 = (void *)*((void *)*a1 + 4);
  objc_msgSend(*((id *)*a1 + 6), sel_convertRect_toCoordinateSpace_, *((void *)*a1 + 5), *v1, v1[1], v1[2], v1[3]);
  objc_msgSend(v2, sel_setFrame_);

  free(v1);
}

id sub_1B0850868(uint64_t a1, uint64_t a2)
{
  return sub_1B0850874(a1, a2, (SEL *)&selRef_jet_focusedFrame);
}

id sub_1B0850874(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t v4 = *(void **)v3;
  uint64_t v5 = *(void *)(v3 + 8);
  uint64_t v6 = *(void **)(v3 + 16);
  [v4 *a3];

  return objc_msgSend(v6, sel_convertRect_fromCoordinateSpace_, v5);
}

double UIView.withCoordinateSpace(_:)@<D0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  id v5 = v2;
  swift_unknownObjectRetain();
  id v6 = objc_msgSend(v5, sel_superview);
  if (v6)
  {
    *a2 = v5;
    a2[1] = v6;
    a2[3] = &type metadata for UIViewCoordinateSpaceAdapter;
    a2[4] = &off_1F094F9A0;
    a2[2] = a1;
  }
  else
  {

    swift_unknownObjectRelease();
    a2[4] = 0;
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *((_OWORD *)a2 + 1) = 0u;
  }
  return result;
}

uint64_t destroy for UIViewCoordinateSpaceAdapter(id *a1)
{
  return swift_unknownObjectRelease();
}

void *_s5JetUI28UIViewCoordinateSpaceAdapterVwCP_0(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  id v5 = v3;
  id v6 = v4;
  swift_unknownObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UIViewCoordinateSpaceAdapter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 8);
  uint64_t v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t assignWithTake for UIViewCoordinateSpaceAdapter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_unknownObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for UIViewCoordinateSpaceAdapter()
{
  return &type metadata for UIViewCoordinateSpaceAdapter;
}

id sub_1B0850AF8()
{
  uint64_t v1 = OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString;
  id v2 = *(void **)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString);
  }
  else
  {
    id v4 = sub_1B0850BC8(*(void **)(v0 + OBJC_IVAR___JULanguageAwareString_baseAttributedString), *(void *)(v0 + OBJC_IVAR___JULanguageAwareString_paragraphs));
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_1B0850BC8(void *a1, unint64_t a2)
{
  if (a1)
  {
    return a1;
  }
  else
  {
    uint64_t v4 = a2 >> 62;
    if (a2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_1B086A6E8();
      swift_bridgeObjectRelease();
      if (v18 != 1) {
        goto LABEL_17;
      }
      swift_bridgeObjectRetain();
      if (!sub_1B086A6E8())
      {
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
    }
    else
    {
      if (*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10) != 1) {
        goto LABEL_17;
      }
      swift_bridgeObjectRetain();
    }
    if ((a2 & 0xC000000000000001) != 0) {
      goto LABEL_38;
    }
    if (*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      for (id i = *(id *)(a2 + 32); ; id i = (id)MEMORY[0x1B3E97F40](0, a2))
      {
        id v6 = i;
        swift_bridgeObjectRelease();
        objc_msgSend(v6, sel_juDirectionalRangeValue);

        swift_bridgeObjectRetain();
        uint64_t v7 = sub_1B0869EB8();
        swift_bridgeObjectRelease();
        if (!v29 && v30 == v7)
        {
          uint64_t v8 = (void *)sub_1B0854140(v31);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3BED0);
          initeCGFloat d = swift_initStackObject();
          *(_OWORD *)(inited + 16) = xmmword_1B086C130;
          uint64_t v10 = (void *)*MEMORY[0x1E4FB0738];
          *(void *)(inited + 32) = *MEMORY[0x1E4FB0738];
          *(void *)(inited + 64) = sub_1B07C7B80(0, (unint64_t *)&unk_1E9B3BEE0);
          *(void *)(inited + 40) = v8;
          id v11 = v8;
          swift_bridgeObjectRetain();
          id v12 = v11;
          id v13 = v10;
          sub_1B07D6098(inited);
          id v14 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
          double v15 = (void *)sub_1B0869D68();
          swift_bridgeObjectRelease();
          type metadata accessor for Key(0);
          sub_1B07BE6C4();
          double v16 = (void *)sub_1B0869CA8();
          swift_bridgeObjectRelease();
          id v17 = objc_msgSend(v14, sel_initWithString_attributes_, v15, v16);

          return v17;
        }
LABEL_17:
        id v19 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
        swift_bridgeObjectRetain();
        double v20 = (void *)sub_1B0869D68();
        swift_bridgeObjectRelease();
        id v28 = objc_msgSend(v19, sel_initWithString_, v20);

        if (v4)
        {
          swift_bridgeObjectRetain();
          uint64_t v21 = sub_1B086A6E8();
          if (!v21)
          {
LABEL_36:
            swift_bridgeObjectRelease();
            id v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28B18]), sel_initWithAttributedString_, v28);

            return v27;
          }
        }
        else
        {
          uint64_t v21 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (!v21) {
            goto LABEL_36;
          }
        }
        uint64_t v4 = 4;
        uint64_t v22 = *MEMORY[0x1E4FB0738];
        while (1)
        {
          id v24 = (a2 & 0xC000000000000001) != 0
              ? (id)MEMORY[0x1B3E97F40](v4 - 4, a2)
              : *(id *)(a2 + 8 * v4);
          double v25 = v24;
          uint64_t v26 = v4 - 3;
          if (__OFADD__(v4 - 4, 1)) {
            break;
          }
          objc_msgSend(v24, sel_juDirectionalRangeValue);
          if (v31 == -1)
          {
            double v23 = &qword_1E9B46128;
            if (qword_1E9B3A6F0 != -1)
            {
              swift_once();
              double v23 = &qword_1E9B46128;
            }
          }
          else if (v31 == 1)
          {
            double v23 = &qword_1E9B46130;
            if (qword_1E9B3A6F8 != -1)
            {
              swift_once();
              double v23 = &qword_1E9B46130;
            }
          }
          else
          {
            if (v31) {
              goto LABEL_40;
            }
            double v23 = &qword_1E9B46120;
            if (qword_1E9B3A6E8 != -1)
            {
              swift_once();
              double v23 = &qword_1E9B46120;
            }
          }
          objc_msgSend(v28, sel_addAttribute_value_range_, v22, *v23, v29, v30);

          ++v4;
          if (v26 == v21) {
            goto LABEL_36;
          }
        }
        __break(1u);
LABEL_38:
        ;
      }
    }
    __break(1u);
LABEL_40:
    sub_1B086A5E8();
    swift_bridgeObjectRelease();
    sub_1B086A848();
    sub_1B0869E68();
    swift_bridgeObjectRelease();
    id result = (id)sub_1B086A6C8();
    __break(1u);
  }
  return result;
}

uint64_t LanguageAwareString.string.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___JULanguageAwareString_string);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_1B0851200()
{
  return sub_1B085133C(&OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedLowercase, MEMORY[0x1E4F280D8]);
}

id LanguageAwareString.__allocating_init(_:baseParagraphStyle:generateAttributedString:keepStatisticsOnLanguageComponents:)(uint64_t a1, uint64_t a2, void *a3, char a4, char a5)
{
  id v11 = objc_allocWithZone(v5);
  id v12 = sub_1B08545A0(a1, a2, a3, a4, a5);

  return v12;
}

id sub_1B085131C()
{
  return sub_1B085133C(&OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedUppercase, MEMORY[0x1E4F280E0]);
}

id sub_1B085133C(uint64_t *a1, uint64_t (*a2)(void, unint64_t))
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    id v5 = *(id *)(v2 + *a1);
  }
  else
  {
    uint64_t v7 = v2;
    unint64_t v8 = sub_1B07B862C();
    uint64_t v9 = a2(MEMORY[0x1E4FBB1A0], v8);
    uint64_t v11 = v10;
    swift_beginAccess();
    char v12 = byte_1E9B3BBE0;
    swift_beginAccess();
    char v13 = byte_1E9B3BBE1;
    id v14 = objc_allocWithZone((Class)type metadata accessor for LanguageAwareString());
    id v15 = sub_1B08545A0(v9, v11, 0, v12, v13);
    double v16 = *(void **)(v7 + v3);
    *(void *)(v7 + v3) = v15;
    id v5 = v15;

    uint64_t v4 = 0;
  }
  id v17 = v4;
  return v5;
}

id sub_1B08514D8()
{
  uint64_t v1 = OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace);
  }
  else
  {
    uint64_t v4 = v0;
    sub_1B07B862C();
    uint64_t v5 = sub_1B086A428();
    uint64_t v7 = v6;
    swift_beginAccess();
    char v8 = byte_1E9B3BBE0;
    swift_beginAccess();
    char v9 = byte_1E9B3BBE1;
    id v10 = objc_allocWithZone((Class)type metadata accessor for LanguageAwareString());
    id v11 = sub_1B08545A0(v5, v7, 0, v8, v9);
    char v12 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v11;
    id v3 = v11;

    uint64_t v2 = 0;
  }
  id v13 = v2;
  return v3;
}

id sub_1B08516B4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1B0869078();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = &v20[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed;
  uint64_t v7 = *(void **)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed);
  if (v7)
  {
    id v8 = *(id *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed);
  }
  else
  {
    uint64_t v9 = *(void *)(v0 + OBJC_IVAR___JULanguageAwareString_string + 8);
    uint64_t v21 = *(void *)(v0 + OBJC_IVAR___JULanguageAwareString_string);
    uint64_t v22 = v9;
    swift_bridgeObjectRetain();
    sub_1B0869038();
    sub_1B07B862C();
    uint64_t v10 = sub_1B086A418();
    uint64_t v12 = v11;
    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
    swift_bridgeObjectRelease();
    swift_beginAccess();
    char v13 = byte_1E9B3BBE0;
    swift_beginAccess();
    char v14 = byte_1E9B3BBE1;
    id v15 = objc_allocWithZone((Class)type metadata accessor for LanguageAwareString());
    id v16 = sub_1B08545A0(v10, v12, 0, v13, v14);
    id v17 = *(void **)(v1 + v6);
    *(void *)(v1 + v6) = v16;
    id v8 = v16;

    uint64_t v7 = 0;
  }
  id v18 = v7;
  return v8;
}

uint64_t LanguageAwareString.numbers.getter()
{
  return swift_bridgeObjectRetain();
}

id sub_1B0851938()
{
  sub_1B07C7B80(0, &qword_1E9B3B728);
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_1B0869F78();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t LanguageAwareString.paragraphs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t LanguageAwareString.words.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B0851A18()
{
  uint64_t v1 = v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___juFullRange;
  if (*(unsigned char *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___juFullRange + 16) != 1) {
    return *(void *)v1;
  }
  uint64_t v2 = sub_1B0851B38();
  uint64_t result = 0;
  *(void *)uint64_t v1 = 0;
  *(void *)(v1 + 8) = v2;
  *(unsigned char *)(v1 + 16) = 0;
  return result;
}

BOOL sub_1B0851AA8()
{
  int v1 = *(unsigned __int8 *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___isEmpty);
  if (v1 != 2) {
    return v1 & 1;
  }
  unint64_t v2 = *(void *)(v0 + OBJC_IVAR___JULanguageAwareString_string + 8);
  if ((v2 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(v2) & 0xF;
  }
  else {
    uint64_t v3 = *(void *)(v0 + OBJC_IVAR___JULanguageAwareString_string) & 0xFFFFFFFFFFFFLL;
  }
  BOOL result = v3 == 0;
  *(unsigned char *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___isEmpty) = result;
  return result;
}

uint64_t sub_1B0851B38()
{
  int v1 = (unsigned char *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___utf16Count);
  if (*(unsigned char *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___utf16Count + 8) != 1) {
    return *(void *)v1;
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_1B0869EB8();
  swift_bridgeObjectRelease();
  *(void *)int v1 = v2;
  v1[8] = 0;
  return v2;
}

unint64_t sub_1B0851BF4()
{
  int v1 = (unsigned char *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___utf32Count);
  if (*(unsigned char *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___utf32Count + 8) != 1) {
    return *(void *)v1;
  }
  unint64_t v2 = *(void *)(v0 + OBJC_IVAR___JULanguageAwareString_string);
  unint64_t v3 = *(void *)(v0 + OBJC_IVAR___JULanguageAwareString_string + 8);
  uint64_t v4 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0) {
    uint64_t v4 = *(void *)(v0 + OBJC_IVAR___JULanguageAwareString_string);
  }
  uint64_t v5 = 7;
  if (((v3 >> 60) & ((v2 & 0x800000000000000) == 0)) != 0) {
    uint64_t v5 = 11;
  }
  unint64_t result = sub_1B0853E1C(0xFuLL, v5 | (v4 << 16), v2, v3);
  *(void *)int v1 = result;
  v1[8] = 0;
  return result;
}

uint64_t sub_1B0851CC8()
{
  int v1 = (unsigned char *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___characterCount);
  if (*(unsigned char *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___characterCount + 8) != 1) {
    return *(void *)v1;
  }
  uint64_t result = sub_1B0869E48();
  *(void *)int v1 = result;
  v1[8] = 0;
  return result;
}

uint64_t static LanguageAwareString.alwaysGenerateAttributedString.getter()
{
  return byte_1E9B3BBE0;
}

uint64_t static LanguageAwareString.alwaysGenerateAttributedString.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  byte_1E9B3BBE0 = a1;
  return result;
}

uint64_t (*static LanguageAwareString.alwaysGenerateAttributedString.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static LanguageAwareString.keepStatisticsOnLanguageComponents.getter()
{
  return byte_1E9B3BBE1;
}

uint64_t type metadata accessor for LanguageAwareString()
{
  return self;
}

uint64_t static LanguageAwareString.keepStatisticsOnLanguageComponents.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  byte_1E9B3BBE1 = a1;
  return result;
}

uint64_t (*static LanguageAwareString.keepStatisticsOnLanguageComponents.modify())()
{
  return j__swift_endAccess;
}

uint64_t static LanguageAwareString.delegate.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t static LanguageAwareString.delegate.setter(uint64_t a1)
{
  qword_1E9B3BBE8 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*static LanguageAwareString.delegate.modify())()
{
  return j_j__swift_endAccess;
}

id sub_1B08521E8()
{
  swift_beginAccess();
  char v0 = byte_1E9B3BBE0;
  swift_beginAccess();
  char v1 = byte_1E9B3BBE1;
  id v2 = objc_allocWithZone((Class)type metadata accessor for LanguageAwareString());
  id result = sub_1B08545A0(0, 0xE000000000000000, 0, v0, v1);
  qword_1E9B3BBF0 = (uint64_t)result;
  return result;
}

id static LanguageAwareString.empty.getter()
{
  if (qword_1E9B3A6E0 != -1) {
    swift_once();
  }
  char v0 = (void *)qword_1E9B3BBF0;

  return v0;
}

id LanguageAwareString.__allocating_init(_:baseParagraphStyle:keepStatisticsOnLanguageComponents:)(void *a1, void *a2, char a3)
{
  id v7 = objc_allocWithZone(v3);
  id v8 = sub_1B0854E38(a1, a2, a3);

  return v8;
}

id LanguageAwareString.init(_:baseParagraphStyle:keepStatisticsOnLanguageComponents:)(void *a1, void *a2, char a3)
{
  id v5 = sub_1B0854E38(a1, a2, a3);

  return v5;
}

id LanguageAwareString.__allocating_init(_:attributes:baseParagraphStyle:keepStatisticsOnLanguageComponents:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char a5)
{
  id v11 = objc_allocWithZone(v5);
  id v12 = sub_1B085524C(a1, a2, a3, a4, a5);

  return v12;
}

id LanguageAwareString.init(_:attributes:baseParagraphStyle:keepStatisticsOnLanguageComponents:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char a5)
{
  id v6 = sub_1B085524C(a1, a2, a3, a4, a5);

  return v6;
}

uint64_t LanguageAwareString.__allocating_init(_:baseParagraphStyle:generateAttributedString:keepStatisticsOnLanguageComponents:)(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  id v5 = v4;
  id v10 = objc_allocWithZone(v5);
  if (a2)
  {
    uint64_t ObjectType = swift_getObjectType();
    swift_beginAccess();
    uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, void *, void, void))(ObjectType + 504))(a1, a2, a3, a4 & 1, byte_1E9B3BBE1);
    swift_deallocPartialClassInstance();
  }
  else
  {

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v12;
}

uint64_t LanguageAwareString.init(_:baseParagraphStyle:generateAttributedString:keepStatisticsOnLanguageComponents:)(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  if (a2)
  {
    uint64_t ObjectType = swift_getObjectType();
    swift_beginAccess();
    uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, void *, void, void))(ObjectType + 504))(a1, a2, a3, a4 & 1, byte_1E9B3BBE1);
    swift_deallocPartialClassInstance();
  }
  else
  {

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v9;
}

id LanguageAwareString.init(_:baseParagraphStyle:generateAttributedString:keepStatisticsOnLanguageComponents:)(uint64_t a1, uint64_t a2, void *a3, char a4, char a5)
{
  id v6 = sub_1B08545A0(a1, a2, a3, a4, a5);

  return v6;
}

id LanguageAwareString.__allocating_init(_:attributes:keepStatisticsOnLanguageComponents:)(void *a1, uint64_t a2, char a3)
{
  id v7 = objc_allocWithZone(v3);
  id v8 = sub_1B08556E8((uint64_t)a1, a2, a3);

  return v8;
}

id LanguageAwareString.init(_:attributes:keepStatisticsOnLanguageComponents:)(void *a1, uint64_t a2, char a3)
{
  id v4 = sub_1B08556E8((uint64_t)a1, a2, a3);

  return v4;
}

id LanguageAwareString.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return LanguageAwareString.init(from:)(a1);
}

id LanguageAwareString.init(from:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString;
  *(void *)&v1[OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString] = 0;
  uint64_t v4 = OBJC_IVAR___JULanguageAwareString_cachedTextStorage;
  *(void *)&v1[OBJC_IVAR___JULanguageAwareString_cachedTextStorage] = 0;
  uint64_t v5 = OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedLowercase;
  *(void *)&v1[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedLowercase] = 0;
  uint64_t v6 = OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedUppercase;
  *(void *)&v1[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedUppercase] = 0;
  uint64_t v75 = OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace;
  *(void *)&v1[OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace] = 0;
  uint64_t v77 = OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed;
  *(void *)&v1[OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed] = 0;
  id v7 = &v1[OBJC_IVAR___JULanguageAwareString____lazy_storage___juFullRange];
  *(void *)id v7 = 0;
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  v1[OBJC_IVAR___JULanguageAwareString____lazy_storage___isEmpty] = 2;
  id v8 = &v1[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf16Count];
  *(void *)id v8 = 0;
  v8[8] = 1;
  uint64_t v9 = &v1[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf32Count];
  *(void *)uint64_t v9 = 0;
  v9[8] = 1;
  id v10 = &v1[OBJC_IVAR___JULanguageAwareString____lazy_storage___characterCount];
  *(void *)id v10 = 0;
  v10[8] = 1;
  id v11 = &v1[OBJC_IVAR___JULanguageAwareString____lazy_storage___thresholdBaseWritingDirection];
  *(void *)id v11 = 0;
  v11[8] = 1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  double v80 = v1;
  sub_1B086A9A8();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v82, v83);
    sub_1B086A8B8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v82);
    swift_beginAccess();
    id v15 = (void *)qword_1E9B3BBE8;
    if (qword_1E9B3BBE8)
    {
      swift_unknownObjectRetain();
      id v16 = (void *)sub_1B0869D68();
      swift_bridgeObjectRelease();
      id v17 = objc_msgSend(v15, sel_preprocessForLanguageAwarenessString_, v16);

      sub_1B0869D98();
      swift_unknownObjectRelease();
    }
    swift_beginAccess();
    if (byte_1E9B3BBE0 == 1)
    {
      id v18 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
      swift_bridgeObjectRetain();
      id v19 = (void *)sub_1B0869D68();
      swift_bridgeObjectRelease();
      id v20 = objc_msgSend(v18, sel_initWithString_, v19);

      uint64_t v21 = 0;
    }
    else
    {
      uint64_t v21 = (void *)sub_1B0869D68();
      id v20 = 0;
    }
    uint64_t v22 = v80;
    swift_beginAccess();
    int v23 = byte_1E9B3BBE1;
    id v24 = v20;
    long long v72 = v21;
    sub_1B0817BA4(v20, v21, 0, v23, (uint64_t)v82);
    unint64_t v25 = v82[2];
    uint64_t v73 = v82[0];
    uint64_t v74 = v82[1];
    uint64_t v76 = v83;
    int v71 = v84;
    uint64_t v26 = v85;

    unint64_t v78 = v25;
    if (v20)
    {
      if (v26)
      {
        uint64_t v27 = *(void *)(v26 + 16);
        if (v27)
        {
          id v68 = v24;
          id v28 = v24;
          swift_bridgeObjectRetain();
          for (uint64_t i = 0; i != v27; ++i)
          {
            uint64_t v30 = *(void *)(v26 + 8 * i + 32);
            v82[0] = v30;
            sub_1B07DC148(v82, v28, v78);
          }

          swift_bridgeObjectRelease_n();
          id v24 = v68;
LABEL_22:
          unint64_t v25 = v78;
          int v39 = v71;
          if (!v20)
          {
            if (v71) {
              goto LABEL_24;
            }
LABEL_41:
            *(void *)&v22[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = 0;
            goto LABEL_43;
          }
LABEL_28:
          objc_msgSend(v24, sel_copy, v67);
          sub_1B086A438();
          swift_unknownObjectRelease();
          sub_1B07C7B80(0, &qword_1EB595990);
          if (swift_dynamicCast()) {
            uint64_t v44 = v86;
          }
          else {
            uint64_t v44 = 0;
          }
          if (v39)
          {
            id v70 = v24;
            id v45 = v24;
            swift_bridgeObjectRelease();
            *(void *)&v22[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = v44;
            uint64_t v46 = qword_1E9B3A650;
            id v47 = v44;
            if (v46 != -1) {
              swift_once();
            }
            uint64_t v48 = qword_1E9B3AE10;
            id v49 = v45;
            objc_msgSend(v49, sel_performSelector_, v48);
            id v50 = objc_msgSend(v49, sel_string);
            uint64_t v51 = sub_1B0869D98();
            uint64_t v53 = v52;

            double v54 = &v22[OBJC_IVAR___JULanguageAwareString_string];
            *(void *)&v22[OBJC_IVAR___JULanguageAwareString_string] = v51;
            id v24 = v70;
          }
          else
          {
            *(void *)&v22[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = v44;
            if (!v44)
            {
              unint64_t v25 = v78;
LABEL_43:
              id v42 = sub_1B0850BC8(0, v25);
              swift_bridgeObjectRelease();
              id v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28E48]), sel_initWithAttributedString_, v42);
              if (qword_1E9B3A650 == -1)
              {
LABEL_44:
                uint64_t v62 = qword_1E9B3AE10;
                id v63 = v43;
                objc_msgSend(v63, sel_performSelector_, v62);
                id v64 = objc_msgSend(v63, sel_string);
                uint64_t v65 = sub_1B0869D98();
                uint64_t v53 = v66;

                double v54 = &v22[OBJC_IVAR___JULanguageAwareString_string];
                *(void *)&v22[OBJC_IVAR___JULanguageAwareString_string] = v65;
                goto LABEL_45;
              }
LABEL_46:
              swift_once();
              goto LABEL_44;
            }
            id v55 = v44;
            swift_bridgeObjectRelease();
            id v56 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28E48]), sel_initWithAttributedString_, v55);
            if (qword_1E9B3A650 != -1) {
              swift_once();
            }
            uint64_t v57 = qword_1E9B3AE10;
            id v58 = v56;
            objc_msgSend(v58, sel_performSelector_, v57);
            id v59 = objc_msgSend(v58, sel_string);
            uint64_t v60 = sub_1B0869D98();
            uint64_t v53 = v61;

            double v54 = &v22[OBJC_IVAR___JULanguageAwareString_string];
            *(void *)&v22[OBJC_IVAR___JULanguageAwareString_string] = v60;
          }
          unint64_t v25 = v78;
LABEL_45:
          *((void *)v54 + 1) = v53;
          *(void *)&v22[OBJC_IVAR___JULanguageAwareString_paragraphs] = v25;
          *(void *)&v22[OBJC_IVAR___JULanguageAwareString_numbers] = v73;
          *(void *)&v22[OBJC_IVAR___JULanguageAwareString_words] = v74;
          *(void *)&v22[OBJC_IVAR___JULanguageAwareString_knownBaseWritingDirections] = v76;

          v81.receiver = v22;
          v81.super_class = (Class)type metadata accessor for LanguageAwareString();
          id v13 = objc_msgSendSuper2(&v81, sel_init);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
          return v13;
        }
        swift_bridgeObjectRelease();
      }
      int v39 = v71;
      goto LABEL_28;
    }
    if (!v26)
    {
      if (v71)
      {
LABEL_24:
        id v40 = sub_1B0850BC8(0, v25);
        swift_bridgeObjectRelease();
        *(void *)&v22[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = v40;
        id v41 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
        id v42 = v40;
        id v43 = objc_msgSend(v41, sel_initWithAttributedString_, v42);
        if (qword_1E9B3A650 == -1) {
          goto LABEL_44;
        }
        goto LABEL_46;
      }
      goto LABEL_41;
    }
    uint64_t v31 = (void *)sub_1B0869D68();
    swift_bridgeObjectRelease();
    objc_msgSend(v31, sel_mutableCopy);

    sub_1B086A438();
    swift_unknownObjectRelease();
    sub_1B07C7B80(0, &qword_1E9B3BC88);
    uint64_t v32 = MEMORY[0x1E4FBC840] + 8;
    swift_dynamicCast();
    uint64_t v33 = v86;
    uint64_t v34 = *(void *)(v26 + 16);
    if (v34)
    {
      uint64_t v67 = v32;
      id v69 = v24;
      swift_bridgeObjectRetain();
      uint64_t v35 = 0;
      do
      {
        uint64_t v36 = *(void *)(v26 + 8 * v35++ + 32);
        BOOL v37 = (void *)sub_1B0869D68();
        objc_msgSend(v33, sel_replaceCharactersInRange_withString_, v36, 1, v37);
      }
      while (v34 != v35);
      swift_bridgeObjectRelease();
      uint64_t v22 = v80;
      id v24 = v69;
    }
    swift_bridgeObjectRelease();
    objc_msgSend(v33, sel_copy);
    sub_1B086A438();
    swift_unknownObjectRelease();
    sub_1B07C7B80(0, (unint64_t *)&qword_1E9B3ADD0);
    swift_dynamicCast();
    long long v38 = v86;
    sub_1B0869D98();

    goto LABEL_22;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);

  uint64_t v12 = *(void **)&v1[v77];
  id v13 = v80;

  type metadata accessor for LanguageAwareString();
  swift_deallocPartialClassInstance();
  return v13;
}

uint64_t sub_1B08533E4(uint64_t a1)
{
  id v2 = sub_1B0850AF8();
  id v3 = NSAttributedString.baseWritingDirection(forCharacterAt:)(a1);
  char v5 = v4;

  if (v5) {
    return -1;
  }
  else {
    return (uint64_t)v3;
  }
}

uint64_t sub_1B08534B0()
{
  char v1 = (unsigned char *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___thresholdBaseWritingDirection);
  if (*(unsigned char *)(v0 + OBJC_IVAR___JULanguageAwareString____lazy_storage___thresholdBaseWritingDirection + 8) != 1) {
    return *(void *)v1;
  }
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___JULanguageAwareString_knownBaseWritingDirections);
  if (*(unsigned char *)(v2 + OBJC_IVAR___JUWritingDirectionsCounts_hasStronglyTypedCounts) == 1) {
    uint64_t result = *(unsigned __int8 *)(v2 + OBJC_IVAR___JUWritingDirectionsCounts_isRTLEnough);
  }
  else {
    uint64_t result = -1;
  }
  *(void *)char v1 = result;
  v1[8] = 0;
  return result;
}

void sub_1B0853530(uint64_t a1, id a2, id a3, char a4, double a5)
{
  uint64_t v6 = *(void *)(v5 + OBJC_IVAR___JULanguageAwareString_knownBaseWritingDirections);
  if (*(unsigned char *)(v6 + OBJC_IVAR___JUWritingDirectionsCounts_hasStronglyTypedCounts) == 1)
  {
    uint64_t v12 = *(void *)(v6 + OBJC_IVAR___JUWritingDirectionsCounts_leftToRight);
    uint64_t v13 = *(void *)(v6 + OBJC_IVAR___JUWritingDirectionsCounts_rightToLeft);
    if (v12)
    {
      if (!v13) {
        return;
      }
    }
    else if (v13)
    {
      return;
    }
    if ((a4 & 1) == 0 || (char v14 = *(void **)(v5 + OBJC_IVAR___JULanguageAwareString_cachedTextStorage)) == 0)
    {
      id v35 = sub_1B0850AF8();
      id v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB08B8]), sel_initWithAttributedString_, v35);

      id v37 = objc_allocWithZone(MEMORY[0x1E4FB0840]);
      id v15 = v36;
      id v18 = objc_msgSend(v37, sel_init);
      objc_msgSend(v15, sel_addLayoutManager_, v18);
      id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB0880]), sel_initWithSize_, a5, 1.79769313e308);
      objc_msgSend(v24, sel_setLineFragmentPadding_, 0.0);
      objc_msgSend(v24, sel_setMaximumNumberOfLines_, a2);
      objc_msgSend(v24, sel_setLineBreakMode_, a3);
      objc_msgSend(v18, sel_addTextContainer_, v24);

      if (a4)
      {
        uint64_t v34 = *(void **)(v5 + OBJC_IVAR___JULanguageAwareString_cachedTextStorage);
        *(void *)(v5 + OBJC_IVAR___JULanguageAwareString_cachedTextStorage) = v15;
      }
      else
      {

        uint64_t v34 = *(void **)(v5 + OBJC_IVAR___JULanguageAwareString_cachedTextStorage);
        *(void *)(v5 + OBJC_IVAR___JULanguageAwareString_cachedTextStorage) = 0;
      }
      goto LABEL_35;
    }
    id v15 = v14;
    id v16 = objc_msgSend(v15, sel_layoutManagers);
    sub_1B07C7B80(0, &qword_1E9B3BA68);
    unint64_t v17 = sub_1B0869F88();

    if (v17 >> 62)
    {
      swift_bridgeObjectRetain();
      id v18 = (id)sub_1B086A6E8();
      swift_bridgeObjectRelease();
      if (v18)
      {
LABEL_11:
        if ((v17 & 0xC000000000000001) == 0)
        {
          if (!*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_41;
          }
          id v19 = *(id *)(v17 + 32);
LABEL_14:
          id v20 = v19;
          swift_bridgeObjectRelease();
          id v18 = v20;
          id v21 = objc_msgSend(v18, sel_textContainers);
          sub_1B07C7B80(0, &qword_1E9B3BA70);
          unint64_t v17 = sub_1B0869F88();

          if (!(v17 >> 62))
          {
            if (*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_16;
            }
            goto LABEL_42;
          }
LABEL_41:
          swift_bridgeObjectRetain();
          uint64_t v40 = sub_1B086A6E8();
          swift_bridgeObjectRelease();
          if (v40)
          {
LABEL_16:
            if ((v17 & 0xC000000000000001) == 0)
            {
              if (!*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
              {
                __break(1u);
                return;
              }
              id v22 = *(id *)(v17 + 32);
LABEL_19:
              int v23 = v22;
              swift_bridgeObjectRelease();
              id v24 = v23;
              objc_msgSend(v24, sel_size);
              double v26 = v25;
              double v28 = v27;
              objc_msgSend(v24, sel_lineFragmentPadding);
              double v30 = v29;
              id v31 = objc_msgSend(v24, sel_maximumNumberOfLines);
              id v32 = objc_msgSend(v24, sel_lineBreakMode);
              id v33 = v32;
              if (v26 == a5 && v28 == 1.79769313e308)
              {
                if (v30 == 0.0)
                {
                  if (v31 == a2)
                  {
                    if (v32 == a3)
                    {

                      uint64_t v34 = v24;
LABEL_35:

                      objc_msgSend(v15, sel_juWritingDirectionOfLine_usingLayoutManager_textContainer_, a1, v18, v24);
                      return;
                    }
                    goto LABEL_33;
                  }
LABEL_31:
                  objc_msgSend(v24, sel_setMaximumNumberOfLines_, a2);
LABEL_32:
                  if (v33 == a3)
                  {
LABEL_34:

                    id v38 = objc_msgSend(v15, sel_juFullRange);
                    objc_msgSend(v18, sel_invalidateLayoutForCharacterRange_actualCharacterRange_, v38, v39, 0);

                    uint64_t v34 = v15;
                    goto LABEL_35;
                  }
LABEL_33:
                  objc_msgSend(v24, sel_setLineBreakMode_, a3);
                  goto LABEL_34;
                }
              }
              else
              {
                objc_msgSend(v24, sel_setSize_, a5, 1.79769313e308);
                if (v30 == 0.0) {
                  goto LABEL_30;
                }
              }
              objc_msgSend(v24, sel_setLineFragmentPadding_, 0.0);
LABEL_30:
              if (v31 == a2) {
                goto LABEL_32;
              }
              goto LABEL_31;
            }
LABEL_43:
            id v22 = (id)MEMORY[0x1B3E97F40](0, v17);
            goto LABEL_19;
          }
LABEL_42:
          swift_bridgeObjectRelease();
          __break(1u);
          goto LABEL_43;
        }
LABEL_39:
        id v19 = (id)MEMORY[0x1B3E97F40](0, v17);
        goto LABEL_14;
      }
    }
    else
    {
      id v18 = *(id *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v18) {
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_39;
  }
}

id sub_1B0853ABC()
{
  return *(id *)(v0 + OBJC_IVAR___JULanguageAwareString_knownBaseWritingDirections);
}

id LanguageAwareString.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void LanguageAwareString.init()()
{
}

id LanguageAwareString.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LanguageAwareString();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B0853C94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 528))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_1B0853CD0()
{
  uint64_t result = sub_1B0853D18(0);
  qword_1E9B46120 = result;
  return result;
}

uint64_t sub_1B0853CF4()
{
  uint64_t result = sub_1B0853D18(-1);
  qword_1E9B46128 = result;
  return result;
}

uint64_t sub_1B0853D18(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB0848]), sel_init);
  objc_msgSend(v2, sel_setAlignment_, 4);
  objc_msgSend(v2, sel_setBaseWritingDirection_, a1);
  objc_msgSend(v2, sel_setLineBreakMode_, 0);
  objc_msgSend(v2, sel_copy);
  sub_1B086A438();

  swift_unknownObjectRelease();
  sub_1B07C7B80(0, (unint64_t *)&unk_1E9B3BEE0);
  swift_dynamicCast();
  return v4;
}

uint64_t sub_1B0853DF8()
{
  uint64_t result = sub_1B0853D18(1);
  qword_1E9B46130 = result;
  return result;
}

unint64_t sub_1B0853E1C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = sub_1B0854030(a1, a3, a4);
  unint64_t result = sub_1B0854030(a2, a3, a4);
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
        unint64_t result = sub_1B0869E08();
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
            unint64_t result = sub_1B086A648();
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
        unint64_t result = sub_1B0869E18();
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
            unint64_t result = sub_1B086A648();
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

unint64_t sub_1B0854030(unint64_t result, unint64_t a2, unint64_t a3)
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
    unint64_t result = sub_1B08540D0(result, a2, a3);
    if ((result & 1) == 0) {
      return result & 0xC | sub_1B0817920(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
    }
  }
  return result;
}

unint64_t sub_1B08540D0(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 0xC) == 4 << v5) {
    unint64_t result = sub_1B08176B4(result, a2, a3);
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

uint64_t sub_1B0854140(uint64_t a1)
{
  switch(a1)
  {
    case -1:
      if (qword_1E9B3A6F0 != -1) {
        swift_once();
      }
      uint64_t v1 = &qword_1E9B46128;
      return *v1;
    case 1:
      if (qword_1E9B3A6F8 != -1) {
        swift_once();
      }
      uint64_t v1 = &qword_1E9B46130;
      return *v1;
    case 0:
      if (qword_1E9B3A6E8 != -1) {
        swift_once();
      }
      uint64_t v1 = &qword_1E9B46120;
      return *v1;
  }
  sub_1B086A5E8();
  swift_bridgeObjectRelease();
  sub_1B086A848();
  sub_1B0869E68();
  swift_bridgeObjectRelease();
  uint64_t result = sub_1B086A6C8();
  __break(1u);
  return result;
}

id sub_1B08542D0(void *a1, int a2)
{
  *(void *)&v2[OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString] = 0;
  uint64_t v5 = OBJC_IVAR___JULanguageAwareString_cachedTextStorage;
  *(void *)&v2[OBJC_IVAR___JULanguageAwareString_cachedTextStorage] = 0;
  *(void *)&v2[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedLowercase] = 0;
  *(void *)&v2[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedUppercase] = 0;
  *(void *)&v2[OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace] = 0;
  *(void *)&v2[OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed] = 0;
  unint64_t v6 = &v2[OBJC_IVAR___JULanguageAwareString____lazy_storage___juFullRange];
  *(void *)unint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  v2[OBJC_IVAR___JULanguageAwareString____lazy_storage___isEmpty] = 2;
  unint64_t v7 = &v2[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf16Count];
  *(void *)unint64_t v7 = 0;
  v7[8] = 1;
  id v8 = &v2[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf32Count];
  *(void *)id v8 = 0;
  v8[8] = 1;
  unint64_t v9 = &v2[OBJC_IVAR___JULanguageAwareString____lazy_storage___characterCount];
  *(void *)unint64_t v9 = 0;
  v9[8] = 1;
  id v10 = &v2[OBJC_IVAR___JULanguageAwareString____lazy_storage___thresholdBaseWritingDirection];
  *(void *)id v10 = 0;
  v10[8] = 1;
  uint64_t v11 = v2;
  sub_1B0817BA4(a1, 0, 0, a2, (uint64_t)v34);
  unint64_t v12 = v34[2];
  uint64_t v30 = v34[0];
  uint64_t v31 = v34[1];
  uint64_t v32 = v34[3];
  uint64_t v13 = v35;
  if (v35)
  {
    uint64_t v14 = *(void *)(v35 + 16);
    if (v14)
    {
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v14; ++i)
      {
        uint64_t v16 = *(void *)(v13 + 8 * i + 32);
        v34[0] = v16;
        sub_1B07DC148(v34, a1, v12);
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  *(void *)&v11[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = a1;
  id v17 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
  id v18 = a1;
  id v19 = objc_msgSend(v17, sel_initWithAttributedString_, v18);
  if (qword_1E9B3A650 != -1) {
    swift_once();
  }
  uint64_t v20 = qword_1E9B3AE10;
  id v21 = v19;
  objc_msgSend(v21, sel_performSelector_, v20);
  id v22 = objc_msgSend(v21, sel_string);
  uint64_t v23 = sub_1B0869D98();
  uint64_t v25 = v24;

  double v26 = (uint64_t *)&v11[OBJC_IVAR___JULanguageAwareString_string];
  *double v26 = v23;
  v26[1] = v25;
  double v27 = *(void **)&v2[v5];
  *(void *)&v2[v5] = a1;
  id v28 = v18;

  *(void *)&v11[OBJC_IVAR___JULanguageAwareString_paragraphs] = v12;
  *(void *)&v11[OBJC_IVAR___JULanguageAwareString_numbers] = v30;
  *(void *)&v11[OBJC_IVAR___JULanguageAwareString_words] = v31;
  *(void *)&v11[OBJC_IVAR___JULanguageAwareString_knownBaseWritingDirections] = v32;

  v33.receiver = v11;
  v33.super_class = (Class)type metadata accessor for LanguageAwareString();
  return objc_msgSendSuper2(&v33, sel_init);
}

id sub_1B08545A0(uint64_t a1, uint64_t a2, void *a3, char a4, char a5)
{
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString] = 0;
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString_cachedTextStorage] = 0;
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedLowercase] = 0;
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedUppercase] = 0;
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace] = 0;
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed] = 0;
  unint64_t v9 = &v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___juFullRange];
  *(void *)unint64_t v9 = 0;
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___isEmpty] = 2;
  id v10 = &v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf16Count];
  *(void *)id v10 = 0;
  v10[8] = 1;
  uint64_t v11 = &v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf32Count];
  *(void *)uint64_t v11 = 0;
  v11[8] = 1;
  unint64_t v12 = &v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___characterCount];
  *(void *)unint64_t v12 = 0;
  v12[8] = 1;
  uint64_t v13 = &v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___thresholdBaseWritingDirection];
  *(void *)uint64_t v13 = 0;
  v13[8] = 1;
  swift_beginAccess();
  uint64_t v14 = (void *)qword_1E9B3BBE8;
  if (qword_1E9B3BBE8)
  {
    unsigned int v15 = v5;
    swift_unknownObjectRetain();
    uint64_t v16 = (void *)sub_1B0869D68();
    swift_bridgeObjectRelease();
    id v17 = objc_msgSend(v14, sel_preprocessForLanguageAwarenessString_, v16);

    sub_1B0869D98();
    swift_unknownObjectRelease();

    if (a4) {
      goto LABEL_7;
    }
  }
  else
  {
    id v18 = v5;
    if (a4) {
      goto LABEL_7;
    }
  }
  if (!a3)
  {
    id v19 = (void *)sub_1B0869D68();
    id v20 = 0;
    goto LABEL_8;
  }
LABEL_7:
  id v21 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
  swift_bridgeObjectRetain();
  id v22 = (void *)sub_1B0869D68();
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v21, sel_initWithString_, v22);

  id v19 = 0;
LABEL_8:
  id v23 = v20;
  long long v72 = v19;
  sub_1B0817BA4(v20, v19, a3, a5 & 1, (uint64_t)v77);
  unint64_t v24 = v77[2];
  uint64_t v73 = v77[0];
  uint64_t v74 = v77[1];
  uint64_t v25 = v77[3];
  int v71 = v78;
  uint64_t v26 = v79;

  if (!v20)
  {
    if (v26)
    {
      id v42 = (void *)sub_1B0869D68();
      swift_bridgeObjectRelease();
      objc_msgSend(v42, sel_mutableCopy);

      sub_1B086A438();
      swift_unknownObjectRelease();
      sub_1B07C7B80(0, &qword_1E9B3BC88);
      swift_dynamicCast();
      uint64_t v43 = *(void *)(v26 + 16);
      if (v43)
      {
        id v68 = v23;
        swift_bridgeObjectRetain();
        uint64_t v44 = 0;
        do
        {
          uint64_t v45 = *(void *)(v26 + 8 * v44++ + 32);
          uint64_t v46 = (void *)sub_1B0869D68();
          objc_msgSend(v76, sel_replaceCharactersInRange_withString_, v45, 1, v46);
        }
        while (v43 != v44);
        swift_bridgeObjectRelease();
        id v23 = v68;
      }
      swift_bridgeObjectRelease();
      objc_msgSend(v76, sel_copy);
      sub_1B086A438();
      swift_unknownObjectRelease();
      sub_1B07C7B80(0, (unint64_t *)&qword_1E9B3ADD0);
      swift_dynamicCast();
      sub_1B0869D98();

      if (v71) {
        goto LABEL_15;
      }
    }
    else if (v71)
    {
LABEL_15:
      id v32 = sub_1B0850BC8(0, v24);
      swift_bridgeObjectRelease();
      *(void *)&v5[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = v32;
      id v33 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
      id v34 = v32;
      id v35 = objc_msgSend(v33, sel_initWithAttributedString_, v34);
      if (qword_1E9B3A650 != -1) {
        swift_once();
      }
      uint64_t v36 = qword_1E9B3AE10;
      id v37 = v35;
      objc_msgSend(v37, sel_performSelector_, v36);
      id v38 = objc_msgSend(v37, sel_string);
      uint64_t v39 = sub_1B0869D98();
      uint64_t v41 = v40;

      goto LABEL_43;
    }
    *(void *)&v5[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = 0;
    goto LABEL_39;
  }
  if (v26)
  {
    uint64_t v27 = *(void *)(v26 + 16);
    if (v27)
    {
      id v67 = v23;
      uint64_t v69 = v25;
      id v28 = v23;
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v27; ++i)
      {
        uint64_t v30 = *(void *)(v26 + 8 * i + 32);
        v77[0] = v30;
        sub_1B07DC148(v77, v28, v24);
      }

      swift_bridgeObjectRelease_n();
      id v23 = v67;
      uint64_t v25 = v69;
      int v31 = v71;
      goto LABEL_26;
    }
    swift_bridgeObjectRelease();
  }
  int v31 = v71;
LABEL_26:
  objc_msgSend(v23, sel_copy);
  sub_1B086A438();
  swift_unknownObjectRelease();
  sub_1B07C7B80(0, &qword_1EB595990);
  if (swift_dynamicCast()) {
    id v47 = v76;
  }
  else {
    id v47 = 0;
  }
  if (!v31)
  {
    *(void *)&v5[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = v47;
    if (v47)
    {
      id v57 = v47;
      swift_bridgeObjectRelease();
      id v58 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28E48]), sel_initWithAttributedString_, v57);
      if (qword_1E9B3A650 != -1) {
        swift_once();
      }
      uint64_t v59 = qword_1E9B3AE10;
      id v60 = v58;
      objc_msgSend(v60, sel_performSelector_, v59);
      id v61 = objc_msgSend(v60, sel_string);
      uint64_t v39 = sub_1B0869D98();
      uint64_t v41 = v62;

LABEL_42:
LABEL_43:

      id v56 = &v5[OBJC_IVAR___JULanguageAwareString_string];
      *(void *)&v5[OBJC_IVAR___JULanguageAwareString_string] = v39;
      goto LABEL_44;
    }
LABEL_39:
    id v57 = sub_1B0850BC8(0, v24);
    swift_bridgeObjectRelease();
    id v63 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28E48]), sel_initWithAttributedString_, v57);
    if (qword_1E9B3A650 != -1) {
      swift_once();
    }
    uint64_t v64 = qword_1E9B3AE10;
    id v60 = v63;
    objc_msgSend(v60, sel_performSelector_, v64);
    id v61 = objc_msgSend(v60, sel_string);
    uint64_t v39 = sub_1B0869D98();
    uint64_t v41 = v65;
    goto LABEL_42;
  }
  uint64_t v70 = v25;
  id v48 = v23;
  swift_bridgeObjectRelease();
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = v47;
  uint64_t v49 = qword_1E9B3A650;
  id v50 = v47;
  if (v49 != -1) {
    swift_once();
  }
  uint64_t v51 = qword_1E9B3AE10;
  id v52 = v48;
  objc_msgSend(v52, sel_performSelector_, v51);
  id v53 = objc_msgSend(v52, sel_string);
  uint64_t v54 = sub_1B0869D98();
  uint64_t v41 = v55;

  id v56 = &v5[OBJC_IVAR___JULanguageAwareString_string];
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString_string] = v54;
  uint64_t v25 = v70;
LABEL_44:
  *((void *)v56 + 1) = v41;
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString_paragraphs] = v24;
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString_numbers] = v73;
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString_words] = v74;
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString_knownBaseWritingDirections] = v25;

  v75.receiver = v5;
  v75.super_class = (Class)type metadata accessor for LanguageAwareString();
  return objc_msgSendSuper2(&v75, sel_init);
}

id sub_1B0854E38(void *a1, void *a2, char a3)
{
  *(void *)&v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString] = 0;
  *(void *)&v3[OBJC_IVAR___JULanguageAwareString_cachedTextStorage] = 0;
  *(void *)&v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedLowercase] = 0;
  *(void *)&v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedUppercase] = 0;
  *(void *)&v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace] = 0;
  *(void *)&v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed] = 0;
  unint64_t v7 = &v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___juFullRange];
  *(void *)unint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___isEmpty] = 2;
  id v8 = &v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf16Count];
  *(void *)id v8 = 0;
  v8[8] = 1;
  unint64_t v9 = &v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf32Count];
  *(void *)unint64_t v9 = 0;
  v9[8] = 1;
  id v10 = &v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___characterCount];
  *(void *)id v10 = 0;
  v10[8] = 1;
  uint64_t v11 = &v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___thresholdBaseWritingDirection];
  *(void *)uint64_t v11 = 0;
  v11[8] = 1;
  swift_beginAccess();
  unint64_t v12 = (void *)qword_1E9B3BBE8;
  if (qword_1E9B3BBE8
    && (objc_msgSend((id)qword_1E9B3BBE8, sel_respondsToSelector_, sel_preprocessForLanguageAwarenessAttributedString_) & 1) != 0)
  {
    uint64_t v13 = v3;
    id v14 = objc_msgSend(v12, sel_preprocessForLanguageAwarenessAttributedString_, a1);
  }
  else
  {
    unsigned int v15 = v3;
    id v14 = a1;
  }
  uint64_t v16 = v14;
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28E48]), sel_initWithAttributedString_, v14);
  id v18 = v17;
  sub_1B0817BA4(v17, 0, a2, a3 & 1, (uint64_t)v47);
  unint64_t v19 = v47[2];
  uint64_t v44 = v47[0];
  uint64_t v45 = v47[1];
  uint64_t v20 = v47[3];
  int v21 = v48;
  uint64_t v22 = v49;

  if (v22)
  {
    uint64_t v23 = v20;
    uint64_t v24 = *(void *)(v22 + 16);
    if (v24)
    {
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v24; ++i)
      {
        uint64_t v26 = *(void *)(v22 + 8 * i + 32);
        v47[0] = v26;
        sub_1B07DC148(v47, v18, v19);
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    uint64_t v20 = v23;
  }
  id v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28B18]), sel_initWithAttributedString_, v18);
  id v28 = v27;
  *(void *)&v3[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = v27;
  if (v21)
  {
    uint64_t v29 = qword_1E9B3A650;
    id v30 = v27;
    if (v29 != -1) {
      swift_once();
    }
    uint64_t v31 = qword_1E9B3AE10;
    id v32 = v18;
    objc_msgSend(v32, sel_performSelector_, v31);
    id v18 = objc_msgSend(v32, sel_string);
    uint64_t v33 = sub_1B0869D98();
    uint64_t v35 = v34;
  }
  else
  {
    id v36 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
    id v37 = v28;
    id v38 = objc_msgSend(v36, sel_initWithAttributedString_, v37);
    if (qword_1E9B3A650 != -1) {
      swift_once();
    }
    uint64_t v39 = qword_1E9B3AE10;
    id v32 = v38;
    objc_msgSend(v32, sel_performSelector_, v39);
    id v40 = objc_msgSend(v32, sel_string);
    uint64_t v33 = sub_1B0869D98();
    uint64_t v35 = v41;

    id v30 = v16;
    uint64_t v16 = v40;
  }

  id v42 = (uint64_t *)&v3[OBJC_IVAR___JULanguageAwareString_string];
  *id v42 = v33;
  v42[1] = v35;
  *(void *)&v3[OBJC_IVAR___JULanguageAwareString_paragraphs] = v19;
  *(void *)&v3[OBJC_IVAR___JULanguageAwareString_numbers] = v44;
  *(void *)&v3[OBJC_IVAR___JULanguageAwareString_words] = v45;
  *(void *)&v3[OBJC_IVAR___JULanguageAwareString_knownBaseWritingDirections] = v20;

  v46.receiver = v3;
  v46.super_class = (Class)type metadata accessor for LanguageAwareString();
  return objc_msgSendSuper2(&v46, sel_init);
}

id sub_1B085524C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char a5)
{
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString] = 0;
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString_cachedTextStorage] = 0;
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedLowercase] = 0;
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedUppercase] = 0;
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace] = 0;
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed] = 0;
  unint64_t v9 = &v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___juFullRange];
  *(void *)unint64_t v9 = 0;
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___isEmpty] = 2;
  id v10 = &v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf16Count];
  *(void *)id v10 = 0;
  v10[8] = 1;
  uint64_t v11 = &v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf32Count];
  *(void *)uint64_t v11 = 0;
  v11[8] = 1;
  unint64_t v12 = &v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___characterCount];
  *(void *)unint64_t v12 = 0;
  v12[8] = 1;
  uint64_t v13 = &v5[OBJC_IVAR___JULanguageAwareString____lazy_storage___thresholdBaseWritingDirection];
  *(void *)uint64_t v13 = 0;
  v13[8] = 1;
  swift_beginAccess();
  id v14 = (void *)qword_1E9B3BBE8;
  if (qword_1E9B3BBE8)
  {
    unsigned int v15 = v5;
    swift_unknownObjectRetain();
    uint64_t v16 = (void *)sub_1B0869D68();
    swift_bridgeObjectRelease();
    id v17 = objc_msgSend(v14, sel_preprocessForLanguageAwarenessString_, v16);

    sub_1B0869D98();
    swift_unknownObjectRelease();
  }
  else
  {
    id v18 = v5;
  }
  unint64_t v19 = (void *)sub_1B0869D68();
  swift_bridgeObjectRelease();
  if (a3)
  {
    type metadata accessor for Key(0);
    sub_1B07BE6C4();
    uint64_t v20 = (void *)sub_1B0869CA8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v20 = 0;
  }
  id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28E48]), sel_initWithString_attributes_, v19, v20);

  id v22 = v21;
  sub_1B0817BA4(v21, 0, a4, a5 & 1, (uint64_t)v51);
  uint64_t v23 = v51[1];
  uint64_t v49 = v51[0];
  unint64_t v24 = v51[2];
  uint64_t v25 = v51[3];
  int v26 = v52;
  uint64_t v27 = v53;

  if (v27)
  {
    uint64_t v28 = *(void *)(v27 + 16);
    if (v28)
    {
      uint64_t v29 = v23;
      uint64_t v30 = v25;
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v28; ++i)
      {
        uint64_t v32 = *(void *)(v27 + 8 * i + 32);
        v51[0] = v32;
        sub_1B07DC148(v51, v22, v24);
      }
      swift_bridgeObjectRelease();
      uint64_t v25 = v30;
      uint64_t v23 = v29;
    }
    swift_bridgeObjectRelease();
  }
  id v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28B18]), sel_initWithAttributedString_, v22);
  uint64_t v34 = v33;
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = v33;
  if (v26)
  {
    uint64_t v35 = qword_1E9B3A650;
    id v36 = v33;
    if (v35 != -1) {
      swift_once();
    }
    uint64_t v37 = qword_1E9B3AE10;
    id v38 = v22;
    objc_msgSend(v38, sel_performSelector_, v37);
    id v22 = objc_msgSend(v38, sel_string);
    uint64_t v39 = sub_1B0869D98();
    uint64_t v41 = v40;
  }
  else
  {
    id v42 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
    id v43 = v34;
    id v44 = objc_msgSend(v42, sel_initWithAttributedString_, v43);
    if (qword_1E9B3A650 != -1) {
      swift_once();
    }
    uint64_t v45 = qword_1E9B3AE10;
    id v36 = v44;
    objc_msgSend(v36, sel_performSelector_, v45);
    id v38 = objc_msgSend(v36, sel_string);
    uint64_t v39 = sub_1B0869D98();
    uint64_t v41 = v46;
  }
  id v47 = (uint64_t *)&v5[OBJC_IVAR___JULanguageAwareString_string];
  *id v47 = v39;
  v47[1] = v41;
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString_paragraphs] = v24;
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString_numbers] = v49;
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString_words] = v23;
  *(void *)&v5[OBJC_IVAR___JULanguageAwareString_knownBaseWritingDirections] = v25;

  v50.receiver = v5;
  v50.super_class = (Class)type metadata accessor for LanguageAwareString();
  return objc_msgSendSuper2(&v50, sel_init);
}

id sub_1B08556E8(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)&v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString] = 0;
  *(void *)&v3[OBJC_IVAR___JULanguageAwareString_cachedTextStorage] = 0;
  *(void *)&v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedLowercase] = 0;
  *(void *)&v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedUppercase] = 0;
  *(void *)&v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace] = 0;
  *(void *)&v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed] = 0;
  unint64_t v7 = &v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___juFullRange];
  *(void *)unint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___isEmpty] = 2;
  id v8 = &v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf16Count];
  *(void *)id v8 = 0;
  v8[8] = 1;
  unint64_t v9 = &v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___utf32Count];
  *(void *)unint64_t v9 = 0;
  v9[8] = 1;
  id v10 = &v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___characterCount];
  *(void *)id v10 = 0;
  v10[8] = 1;
  uint64_t v11 = &v3[OBJC_IVAR___JULanguageAwareString____lazy_storage___thresholdBaseWritingDirection];
  *(void *)uint64_t v11 = 0;
  v11[8] = 1;
  unint64_t v12 = v3;
  id v13 = sub_1B0850AF8();
  id v14 = v13;
  if (a2)
  {
    id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28E48]), sel_initWithAttributedString_, v13);
    type metadata accessor for Key(0);
    sub_1B07BE6C4();
    uint64_t v16 = (void *)sub_1B0869CA8();
    swift_bridgeObjectRelease();
    id v17 = objc_msgSend(v14, sel_juFullRange);
    objc_msgSend(v15, sel_addAttributes_range_, v16, v17, v18);

    id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28B18]), sel_initWithAttributedString_, v15);
  }
  else
  {
    id v19 = v13;
  }
  *(void *)&v12[OBJC_IVAR___JULanguageAwareString_baseAttributedString] = v19;
  id v20 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
  id v21 = v19;
  id v22 = objc_msgSend(v20, sel_initWithAttributedString_, v21);
  if (qword_1E9B3A650 != -1) {
    swift_once();
  }
  uint64_t v23 = qword_1E9B3AE10;
  id v24 = v22;
  objc_msgSend(v24, sel_performSelector_, v23);
  id v25 = objc_msgSend(v24, sel_string);
  uint64_t v26 = sub_1B0869D98();
  uint64_t v28 = v27;

  uint64_t v29 = (uint64_t *)&v12[OBJC_IVAR___JULanguageAwareString_string];
  *uint64_t v29 = v26;
  v29[1] = v28;
  if (a3)
  {
    *(void *)&v12[OBJC_IVAR___JULanguageAwareString_paragraphs] = *(void *)(a1
                                                                              + OBJC_IVAR___JULanguageAwareString_paragraphs);
    *(void *)&v12[OBJC_IVAR___JULanguageAwareString_numbers] = *(void *)(a1
                                                                           + OBJC_IVAR___JULanguageAwareString_numbers);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();

    uint64_t v30 = OBJC_IVAR___JULanguageAwareString_words;
    uint64_t v31 = *(void *)(a1 + OBJC_IVAR___JULanguageAwareString_words);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v31 = MEMORY[0x1E4FBC860];
    *(void *)&v12[OBJC_IVAR___JULanguageAwareString_paragraphs] = MEMORY[0x1E4FBC860];
    *(void *)&v12[OBJC_IVAR___JULanguageAwareString_numbers] = v31;

    uint64_t v30 = OBJC_IVAR___JULanguageAwareString_words;
  }
  *(void *)&v12[v30] = v31;
  uint64_t v32 = *(void **)(a1 + OBJC_IVAR___JULanguageAwareString_knownBaseWritingDirections);
  *(void *)&v12[OBJC_IVAR___JULanguageAwareString_knownBaseWritingDirections] = v32;
  id v33 = v32;

  v35.receiver = v12;
  v35.super_class = (Class)type metadata accessor for LanguageAwareString();
  return objc_msgSendSuper2(&v35, sel_init);
}

id sub_1B0855A38@<X0>(void *a1@<X8>)
{
  id result = sub_1B0850AF8();
  *a1 = result;
  return result;
}

void sub_1B0855A64(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_1B0855A70@<X0>(void *a1@<X8>)
{
  id result = sub_1B0851200();
  *a1 = result;
  return result;
}

void sub_1B0855A9C(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_1B0855AA8@<X0>(void *a1@<X8>)
{
  id result = sub_1B085131C();
  *a1 = result;
  return result;
}

void sub_1B0855AD4(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_1B0855AE0@<X0>(void *a1@<X8>)
{
  id result = sub_1B08514D8();
  *a1 = result;
  return result;
}

void sub_1B0855B0C(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_1B0855B18@<X0>(void *a1@<X8>)
{
  id result = sub_1B08516B4();
  *a1 = result;
  return result;
}

void sub_1B0855B44(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

void keypath_setTm(void **a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *a1;
  id v7 = *(id *)(*a2 + *a5);
  *(void *)(*a2 + *a5) = *a1;
  id v6 = v5;
}

uint64_t sub_1B0855B9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B0851A18();
  *a1 = result;
  a1[1] = v3;
  return result;
}

__n128 sub_1B0855BC8(__n128 *a1, void *a2)
{
  uint64_t v2 = *a2 + OBJC_IVAR___JULanguageAwareString____lazy_storage___juFullRange;
  __n128 result = *a1;
  *(__n128 *)uint64_t v2 = *a1;
  *(unsigned char *)(v2 + 16) = 0;
  return result;
}

BOOL sub_1B0855BE8@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_1B0851AA8();
  *a1 = result;
  return result;
}

unsigned char *sub_1B0855C18(unsigned char *result, void *a2)
{
  *(unsigned char *)(*a2 + OBJC_IVAR___JULanguageAwareString____lazy_storage___isEmpty) = *result;
  return result;
}

uint64_t sub_1B0855C30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B0851B38();
  *a1 = result;
  return result;
}

void *sub_1B0855C5C(void *result, void *a2)
{
  uint64_t v2 = *a2 + OBJC_IVAR___JULanguageAwareString____lazy_storage___utf16Count;
  *(void *)uint64_t v2 = *result;
  *(unsigned char *)(v2 + 8) = 0;
  return result;
}

unint64_t sub_1B0855C7C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1B0851BF4();
  *a1 = result;
  return result;
}

void *sub_1B0855CA8(void *result, void *a2)
{
  uint64_t v2 = *a2 + OBJC_IVAR___JULanguageAwareString____lazy_storage___utf32Count;
  *(void *)uint64_t v2 = *result;
  *(unsigned char *)(v2 + 8) = 0;
  return result;
}

uint64_t sub_1B0855CC8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B0851CC8();
  *a1 = result;
  return result;
}

void *sub_1B0855CF4(void *result, void *a2)
{
  uint64_t v2 = *a2 + OBJC_IVAR___JULanguageAwareString____lazy_storage___characterCount;
  *(void *)uint64_t v2 = *result;
  *(unsigned char *)(v2 + 8) = 0;
  return result;
}

uint64_t sub_1B0855D14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B08534B0();
  *a1 = result;
  return result;
}

void *sub_1B0855D40(void *result, void *a2)
{
  uint64_t v2 = *a2 + OBJC_IVAR___JULanguageAwareString____lazy_storage___thresholdBaseWritingDirection;
  *(void *)uint64_t v2 = *result;
  *(unsigned char *)(v2 + 8) = 0;
  return result;
}

uint64_t method lookup function for LanguageAwareString(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LanguageAwareString);
}

uint64_t dispatch thunk of LanguageAwareString.attributedString.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of LanguageAwareString.localizedLowercase.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of LanguageAwareString.localizedUppercase.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of LanguageAwareString.newlinesCollapsedToSpace.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of LanguageAwareString.trimmed.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of LanguageAwareString.juFullRange.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of LanguageAwareString.isEmpty.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x188))();
}

uint64_t dispatch thunk of LanguageAwareString.utf16Count.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of LanguageAwareString.utf32Count.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of LanguageAwareString.characterCount.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of LanguageAwareString.__allocating_init(_:baseParagraphStyle:keepStatisticsOnLanguageComponents:)()
{
  return (*(uint64_t (**)(void))(v0 + 488))();
}

uint64_t dispatch thunk of LanguageAwareString.__allocating_init(_:attributes:baseParagraphStyle:keepStatisticsOnLanguageComponents:)()
{
  return (*(uint64_t (**)(void))(v0 + 496))();
}

uint64_t dispatch thunk of LanguageAwareString.__allocating_init(_:baseParagraphStyle:generateAttributedString:keepStatisticsOnLanguageComponents:)()
{
  return (*(uint64_t (**)(void))(v0 + 504))();
}

uint64_t dispatch thunk of LanguageAwareString.__allocating_init(_:attributes:keepStatisticsOnLanguageComponents:)()
{
  return (*(uint64_t (**)(void))(v0 + 520))();
}

uint64_t dispatch thunk of LanguageAwareString.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 528))();
}

uint64_t dispatch thunk of LanguageAwareString.baseWritingDirection(forCharacterAt:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x218))();
}

uint64_t dispatch thunk of LanguageAwareString.thresholdBaseWritingDirection.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x220))();
}

uint64_t dispatch thunk of LanguageAwareString.writingDirectionOfLine(_:maximumLinesShown:withWidth:lineBreakMode:cacheLayoutInfo:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x238))();
}

uint64_t dispatch thunk of LanguageAwareString.writingDirectionsQuantities()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x240))();
}

unint64_t JUComponentMenuBuilder.init()@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1B07D62FC(MEMORY[0x1E4FBC860]);
  *a1 = result;
  return result;
}

uint64_t JUComponentMenuBuilder.addTemplate(for:content:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  *(void *)(v10 + 24) = a4;
  swift_bridgeObjectRetain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v5;
  *uint64_t v5 = 0x8000000000000000;
  sub_1B07CAD7C((uint64_t)&unk_1E9B3BC98, v10, a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v5 = v13;
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B0856240(uint64_t a1, uint64_t a2, uint64_t *a3, int *a4)
{
  *(void *)(v4 + 16) = a1;
  uint64_t v6 = *a3;
  unint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)a4 + *a4);
  id v7 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v7;
  *id v7 = v4;
  v7[1] = sub_1B0856328;
  return v9(a2, v6);
}

uint64_t sub_1B0856328(uint64_t a1)
{
  uint64_t v3 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  *uint64_t v3 = a1;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_1B0856438()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B0856470(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  id v8 = *(int **)(v3 + 16);
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *unint64_t v9 = v4;
  v9[1] = sub_1B08591F4;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t *, int *))((char *)&dword_1E9B3BC90 + dword_1E9B3BC90);
  return v10(a1, a2, a3, v8);
}

uint64_t JUComponentMenuBuilder.addingTemplate(for:content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v11 = *v5;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a5 = 0x8000000000000000;
  sub_1B07CAD7C((uint64_t)&unk_1E9B3BCA0, v12, a1, a2, isUniquelyReferenced_nonNull_native);
  *a5 = v11;
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t JUComponentMenuBuilder.buildContextMenu(forContentsOf:withMetrics:asPartOf:)(void *a1, uint64_t a2, uint64_t a3)
{
  v16[0] = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BCA8);
  MEMORY[0x1F4188790](v6 - 8);
  id v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1B0869BA8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *v3;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B0869868();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_1B07BBE14((uint64_t)v8, &qword_1E9B3BCA8);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    v16[1] = v13;
    uint64_t v14 = sub_1B0856800((uint64_t)v12, (uint64_t)a1, a2, v16[0]);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  return v14;
}

uint64_t sub_1B0856800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v87 = a4;
  uint64_t v86 = a3;
  uint64_t v73 = a2;
  uint64_t v70 = sub_1B0869BA8();
  uint64_t v91 = *(void *)(v70 - 8);
  MEMORY[0x1F4188790](v70);
  uint64_t v7 = (char *)v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_1E9B3B008);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v72 = (uint64_t)v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = sub_1B0869B88();
  double v89 = *(char **)(v84 - 8);
  MEMORY[0x1F4188790](v84);
  uint64_t v64 = (char *)v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BCB0);
  MEMORY[0x1F4188790](v83);
  uint64_t v12 = (char *)v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BCB8);
  MEMORY[0x1F4188790](v13 - 8);
  id v15 = (char *)v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  uint64_t v90 = (uint64_t)v62 - v17;
  MEMORY[0x1F4188790](v18);
  id v20 = (char *)v62 - v19;
  uint64_t v98 = sub_1B0869B58();
  uint64_t v21 = *(void *)(v98 - 8);
  MEMORY[0x1F4188790](v98);
  CGRect v97 = (char *)v62 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1B0869B68();
  uint64_t v24 = *(void *)(v23 - 8);
  MEMORY[0x1F4188790](v23);
  double v99 = (char *)v62 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v26);
  CGFloat v100 = (char *)v62 - v27;
  uint64_t v71 = *v4;
  uint64_t v106 = MEMORY[0x1E4FBC860];
  uint64_t v28 = sub_1B0869B98();
  uint64_t v29 = *(void *)(v28 + 16);
  if (!v29)
  {
LABEL_34:
    swift_bridgeObjectRelease();
    sub_1B07C7B80(0, &qword_1E9B3BCC0);
    sub_1B0869B78();
    sub_1B0869B08();
    sub_1B0869D68();
    swift_bridgeObjectRelease();
    return sub_1B086A358();
  }
  unsigned __int8 v88 = v20;
  uint64_t v69 = v15;
  v62[1] = a1;
  uint64_t v31 = *(void (**)(void, void, void))(v24 + 16);
  uint64_t v30 = v24 + 16;
  CGRect v96 = (void (*)(uint64_t *, char *, uint64_t))v31;
  unint64_t v32 = (*(unsigned __int8 *)(v30 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 64);
  v62[0] = v28;
  unint64_t v33 = v28 + v32;
  CGRect v95 = (uint64_t (**)(uint64_t *, uint64_t))(v30 + 72);
  int v94 = *MEMORY[0x1E4F71700];
  CGRect v93 = (void (**)(uint64_t *, uint64_t))(v30 + 80);
  v62[2] = v103;
  uint64_t v92 = (void (**)(char *, uint64_t))(v30 - 8);
  id v68 = (void (**)(char *, uint64_t *, uint64_t))(v91 + 32);
  id v67 = (void (**)(char *, uint64_t))(v91 + 8);
  double v80 = (void (**)(char *, uint64_t *, uint64_t))(v21 + 32);
  int v79 = *MEMORY[0x1E4F71708];
  unsigned __int8 v78 = (void (**)(uint64_t, void, uint64_t))(v89 + 104);
  uint64_t v77 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v89 + 56);
  int v66 = *MEMORY[0x1E4F71710];
  id v76 = (unsigned int (**)(char *, uint64_t, uint64_t))(v89 + 48);
  id v63 = (void (**)(char *, uint64_t, uint64_t))(v89 + 32);
  unsigned int v75 = *MEMORY[0x1E4F71718];
  uint64_t v65 = (void (**)(uint64_t, uint64_t))(v89 + 8);
  uint64_t v74 = (void (**)(char *, uint64_t))(v21 + 8);
  uint64_t v91 = *(void *)(v30 + 56);
  double v89 = v12;
  uint64_t v85 = v23;
  uint64_t v81 = v30;
  uint64_t v34 = (uint64_t *)v99;
  uint64_t v82 = v7;
  while (1)
  {
    id v38 = v100;
    uint64_t v39 = v96;
    v96((uint64_t *)v100, (char *)v33, v23);
    v39(v34, v38, v23);
    int v40 = (*v95)(v34, v23);
    if (v40 == v94)
    {
      (*v93)(v34, v23);
      (*v80)(v97, v34, v98);
      uint64_t v41 = (uint64_t)v88;
      sub_1B0869B28();
      uint64_t v42 = v90;
      uint64_t v43 = v84;
      (*v78)(v90, v75, v84);
      (*v77)(v42, 0, 1, v43);
      uint64_t v44 = (uint64_t)&v12[*(int *)(v83 + 48)];
      sub_1B07B9258(v41, (uint64_t)v12, &qword_1E9B3BCB8);
      sub_1B07B9258(v42, v44, &qword_1E9B3BCB8);
      uint64_t v45 = *v76;
      if ((*v76)(v12, 1, v43) == 1)
      {
        sub_1B07BBE14(v42, &qword_1E9B3BCB8);
        sub_1B07BBE14(v41, &qword_1E9B3BCB8);
        if (v45((char *)v44, 1, v43) == 1)
        {
          sub_1B07BBE14((uint64_t)v12, &qword_1E9B3BCB8);
          uint64_t v46 = v97;
LABEL_19:
          sub_1B0869B48();
          if (v105)
          {
            sub_1B07BA8FC(&v104, (uint64_t)&aBlock);
            sub_1B07BBD78((uint64_t)&aBlock, (uint64_t)&v104);
            uint64_t v35 = v72;
            sub_1B07B9258(v86, v72, qword_1E9B3B008);
            type metadata accessor for JUActionPerformer();
            uint64_t v36 = swift_allocObject();
            sub_1B07BA8FC(&v104, v36 + 16);
            sub_1B07E2854(v35, v36 + OBJC_IVAR____TtC5JetUI17JUActionPerformer_metricsContext);
            *(void *)(v36 + OBJC_IVAR____TtC5JetUI17JUActionPerformer_objectGraph) = v87;
            sub_1B07C7B80(0, &qword_1E9B3BCC8);
            swift_retain();
            sub_1B0869B38();
            uint64_t v37 = v46;
            sub_1B0869B18();
            sub_1B0869D68();
            swift_bridgeObjectRelease();
            swift_retain();
            sub_1B086A398();
            MEMORY[0x1B3E97890]();
            if (*(void *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_1B0869FC8();
            }
            sub_1B086A018();
            sub_1B0869F98();
            swift_release();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
          }
          else
          {
            sub_1B07BBE14((uint64_t)&v104, &qword_1E9B3B000);
            sub_1B07C7B80(0, &qword_1E9B3BCC8);
            sub_1B0869B38();
            sub_1B0869B18();
            sub_1B0869D68();
            uint64_t v37 = v46;
            swift_bridgeObjectRelease();
            sub_1B086A398();
            MEMORY[0x1B3E97890]();
            if (*(void *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_1B0869FC8();
            }
            sub_1B086A018();
            sub_1B0869F98();
          }
          (*v74)(v37, v98);
          uint64_t v23 = v85;
          (*v92)(v100, v85);
          uint64_t v7 = v82;
          uint64_t v12 = v89;
          goto LABEL_7;
        }
      }
      else
      {
        uint64_t v48 = (uint64_t)v69;
        sub_1B07B9258((uint64_t)v12, (uint64_t)v69, &qword_1E9B3BCB8);
        if (v45((char *)v44, 1, v43) != 1)
        {
          unsigned __int8 v52 = v64;
          (*v63)(v64, v44, v43);
          sub_1B0858A08();
          sub_1B0869D58();
          uint64_t v53 = *v65;
          (*v65)((uint64_t)v52, v43);
          sub_1B07BBE14(v90, &qword_1E9B3BCB8);
          sub_1B07BBE14((uint64_t)v88, &qword_1E9B3BCB8);
          v53(v48, v43);
          sub_1B07BBE14((uint64_t)v12, &qword_1E9B3BCB8);
          uint64_t v46 = v97;
          goto LABEL_19;
        }
        sub_1B07BBE14(v90, &qword_1E9B3BCB8);
        sub_1B07BBE14((uint64_t)v88, &qword_1E9B3BCB8);
        (*v65)(v48, v43);
      }
      sub_1B07BBE14((uint64_t)v12, &qword_1E9B3BCB0);
      uint64_t v46 = v97;
      goto LABEL_19;
    }
    if (v40 == v79)
    {
      (*v93)(v34, v23);
      uint64_t v47 = v70;
      (*v68)(v7, v34, v70);
      uint64_t aBlock = v71;
      sub_1B0856800(v7, v73, v86, v87);
      MEMORY[0x1B3E97890]();
      if (*(void *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1B0869FC8();
      }
      sub_1B086A018();
      sub_1B0869F98();
      (*v67)(v7, v47);
      (*v92)(v100, v23);
      goto LABEL_7;
    }
    if (v40 != v66) {
      break;
    }
    (*v93)(v34, v23);
    uint64_t v50 = *v34;
    uint64_t v49 = v34[1];
    if (sub_1B0869AF8() == v50 && v51 == v49)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v54 = sub_1B086A8A8();
      swift_bridgeObjectRelease();
      if ((v54 & 1) == 0)
      {
        sub_1B07BBD78(v73, (uint64_t)&v104);
        uint64_t v55 = (void *)swift_allocObject();
        sub_1B07BA8FC(&v104, (uint64_t)(v55 + 2));
        v55[7] = v71;
        v55[8] = v50;
        uint64_t v56 = v87;
        v55[9] = v49;
        v55[10] = v56;
        v103[2] = sub_1B08589EC;
        v103[3] = v55;
        uint64_t aBlock = MEMORY[0x1E4F143A8];
        unint64_t v102 = 1107296256;
        v103[0] = sub_1B08586A8;
        v103[1] = &block_descriptor_10;
        id v57 = _Block_copy(&aBlock);
        id v58 = self;
        swift_retain();
        swift_bridgeObjectRetain();
        id v59 = objc_msgSend(v58, sel_elementWithProvider_, v57, v62[0]);
        _Block_release(v57);
        uint64_t v60 = swift_release();
        MEMORY[0x1B3E97890](v60);
        if (*(void *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1B0869FC8();
        }
        sub_1B086A018();
        sub_1B0869F98();
        uint64_t v23 = v85;
        (*v92)(v100, v85);
        goto LABEL_33;
      }
    }
    (*v92)(v100, v23);
    swift_bridgeObjectRelease();
LABEL_33:
    uint64_t v12 = v89;
LABEL_7:
    v33 += v91;
    --v29;
    uint64_t v34 = (uint64_t *)v99;
    if (!v29) {
      goto LABEL_34;
    }
  }
  uint64_t aBlock = 0;
  unint64_t v102 = 0xE000000000000000;
  sub_1B086A5E8();
  sub_1B0869E68();
  sub_1B086A6B8();
  uint64_t result = sub_1B086A6C8();
  __break(1u);
  return result;
}

uint64_t sub_1B08577BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595DD0);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1B086A118();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  sub_1B07BBD78(a3, (uint64_t)v26);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a1;
  *(void *)(v18 + 24) = a2;
  sub_1B07B9258((uint64_t)v26, (uint64_t)v24, &qword_1E9B3BCE8);
  sub_1B086A0F8();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v19 = sub_1B086A0E8();
  sub_1B07BBE14((uint64_t)v26, &qword_1E9B3BCE8);
  uint64_t v20 = swift_allocObject();
  long long v21 = v24[1];
  *(_OWORD *)(v20 + 56) = v24[0];
  uint64_t v22 = MEMORY[0x1E4FBCFD8];
  *(void *)(v20 + 16) = v19;
  *(void *)(v20 + 24) = v22;
  *(void *)(v20 + 32) = a4;
  *(void *)(v20 + 40) = a5;
  *(void *)(v20 + 48) = a6;
  *(_OWORD *)(v20 + 72) = v21;
  *(void *)(v20 + 88) = v25;
  *(void *)(v20 + 96) = a7;
  *(void *)(v20 + 104) = sub_1B081D284;
  *(void *)(v20 + 112) = v18;
  sub_1B08584FC((uint64_t)v16, (uint64_t)&unk_1E9B3BCF0, v20);
  return swift_release();
}

uint64_t sub_1B085799C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[3] = v17;
  v8[4] = v18;
  void v8[5] = sub_1B086A0F8();
  v8[6] = sub_1B086A0E8();
  v8[2] = a4;
  uint64_t v14 = (void *)swift_task_alloc();
  v8[7] = v14;
  *uint64_t v14 = v8;
  v14[1] = sub_1B0857A88;
  return sub_1B0857C64(a5, a6, a7, a8);
}

uint64_t sub_1B0857A88(uint64_t a1)
{
  *(void *)(*(void *)v1 + 64) = a1;
  swift_task_dealloc();
  uint64_t v3 = sub_1B086A0D8();
  return MEMORY[0x1F4188298](sub_1B0857BCC, v3, v2);
}

uint64_t sub_1B0857BCC()
{
  uint64_t v6 = v0;
  uint64_t v1 = v0[8];
  uint64_t v2 = (void (*)(uint64_t *))v0[3];
  swift_release();
  uint64_t v5 = v1;
  swift_retain();
  v2(&v5);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_1B0857C64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _OWORD v5[10] = a3;
  v5[11] = a4;
  v5[8] = a1;
  v5[9] = a2;
  sub_1B0869688();
  v5[12] = swift_task_alloc();
  uint64_t v6 = sub_1B0869C18();
  v5[13] = v6;
  v5[14] = *(void *)(v6 - 8);
  v5[15] = swift_task_alloc();
  uint64_t v7 = sub_1B0869AA8();
  v5[16] = v7;
  v5[17] = *(void *)(v7 - 8);
  v5[18] = swift_task_alloc();
  uint64_t v8 = swift_task_alloc();
  uint64_t v9 = *v4;
  v5[19] = v8;
  v5[20] = v9;
  sub_1B086A0F8();
  v5[21] = sub_1B086A0E8();
  uint64_t v11 = sub_1B086A0D8();
  v5[22] = v11;
  v5[23] = v10;
  return MEMORY[0x1F4188298](sub_1B0857DF8, v11, v10);
}

uint64_t sub_1B0857DF8()
{
  if (*(void *)(v0[20] + 16))
  {
    uint64_t v2 = v0[8];
    uint64_t v1 = v0[9];
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1B07E47A0(v2, v1);
    if (v4)
    {
      uint64_t v5 = v0[11];
      uint64_t v6 = *(void *)(v0[20] + 56) + 16 * v3;
      uint64_t v7 = *(int **)v6;
      v0[24] = *(void *)(v6 + 8);
      swift_retain();
      swift_bridgeObjectRelease();
      v0[6] = v5;
      uint64_t v26 = (int *)((char *)v7 + *v7);
      uint64_t v8 = (void *)swift_task_alloc();
      v0[25] = v8;
      *uint64_t v8 = v0;
      v8[1] = sub_1B085830C;
      uint64_t v9 = v0[10];
      return ((uint64_t (*)(void *, uint64_t, void *))v26)(v0 + 7, v9, v0 + 6);
    }
    swift_bridgeObjectRelease();
  }
  swift_release();
  uint64_t v11 = v0[18];
  uint64_t v12 = v0[19];
  uint64_t v13 = v0[16];
  uint64_t v14 = v0[17];
  sub_1B0869A98();
  (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))(v11, *MEMORY[0x1E4F715A0], v13);
  char v15 = sub_1B0869A88();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  v16(v11, v13);
  v16(v12, v13);
  if (v15)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_1EB596010);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_1B086C120;
    sub_1B07C7B80(0, &qword_1E9B3BCC8);
    sub_1B086A5E8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1B0869E68();
    swift_bridgeObjectRelease();
    sub_1B0869E68();
    *(void *)(v17 + 32) = sub_1B086A398();
    sub_1B0869F98();
    uint64_t v18 = v17;
  }
  else
  {
    if (qword_1E9B3A6A0 != -1) {
      swift_once();
    }
    uint64_t v20 = v0[14];
    uint64_t v19 = v0[15];
    uint64_t v21 = v0[13];
    uint64_t v23 = v0[8];
    uint64_t v22 = v0[9];
    uint64_t v24 = __swift_project_value_buffer(v21, (uint64_t)qword_1E9B46108);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v19, v24, v21);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3AA70);
    sub_1B08696C8();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B086C130;
    sub_1B0869678();
    sub_1B0869668();
    v0[5] = MEMORY[0x1E4F716F8];
    v0[2] = v23;
    v0[3] = v22;
    swift_bridgeObjectRetain();
    sub_1B0869628();
    sub_1B07BBE14((uint64_t)(v0 + 2), (uint64_t *)&unk_1EB5962E0);
    sub_1B0869668();
    sub_1B0869698();
    sub_1B0869AE8();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    uint64_t v18 = MEMORY[0x1E4FBC860];
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = (uint64_t (*)(uint64_t))v0[1];
  return v25(v18);
}

uint64_t sub_1B085830C()
{
  uint64_t v1 = (void *)*v0;
  swift_task_dealloc();
  swift_release();
  v1[26] = v1[7];
  uint64_t v2 = v1[23];
  uint64_t v3 = v1[22];
  return MEMORY[0x1F4188298](sub_1B0858464, v3, v2);
}

uint64_t sub_1B0858464()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 208);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_1B08584FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B086A118();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1B086A108();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1B07BBE14(a1, &qword_1EB595DD0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B086A0D8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1B08586A8(uint64_t a1, void *aBlock)
{
  uint64_t v2 = *(void (**)(void (*)(uint64_t), uint64_t))(a1 + 32);
  uint64_t v3 = _Block_copy(aBlock);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  v2(sub_1B0858A98, v4);
  swift_release();

  return swift_release();
}

void sub_1B085873C(uint64_t a1, uint64_t a2)
{
  sub_1B07C7B80(0, &qword_1E9B3BCD8);
  id v3 = (id)sub_1B0869F78();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);
}

uint64_t sub_1B08587B8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1B0858894;
  return v6(a1);
}

uint64_t sub_1B0858894()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

ValueMetadata *type metadata accessor for JUComponentMenuBuilder()
{
  return &type metadata for JUComponentMenuBuilder;
}

uint64_t sub_1B085899C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 88, 7);
}

uint64_t sub_1B08589EC(uint64_t a1, uint64_t a2)
{
  return sub_1B08577BC(a1, a2, (uint64_t)(v2 + 2), v2[7], v2[8], v2[9], v2[10]);
}

uint64_t block_destroy_helper_10()
{
  return swift_release();
}

unint64_t sub_1B0858A08()
{
  unint64_t result = qword_1E9B3BCD0;
  if (!qword_1E9B3BCD0)
  {
    sub_1B0869B88();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BCD0);
  }
  return result;
}

uint64_t sub_1B0858A60()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B0858A98(uint64_t a1)
{
  sub_1B085873C(a1, *(void *)(v1 + 16));
}

uint64_t sub_1B0858AA0()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 120, 7);
}

uint64_t sub_1B0858B00(uint64_t a1)
{
  uint64_t v4 = v1[3];
  uint64_t v11 = v1[2];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v7 = v1[6];
  uint64_t v8 = v1[12];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_1B0858BF8;
  return sub_1B085799C(a1, v11, v4, v5, v6, v7, (uint64_t)(v1 + 7), v8);
}

uint64_t sub_1B0858BF8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1B0858CEC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1B0858BF8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E9B3BCF8 + dword_1E9B3BCF8);
  return v6(a1, v4);
}

uint64_t sub_1B0858DA4()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1B0858E34(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
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
  return v5 + (v6 | v11) + 1;
}

void sub_1B0858F90(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x1B08591A8);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t type metadata accessor for Send()
{
  return __swift_instantiateGenericMetadata();
}

JUMeasurements __swiftcall UIImageView.measure(toFit:with:)(CGSize toFit, UITraitCollection with)
{
  objc_msgSend(v2, sel_sizeThatFits_, toFit.width, toFit.height);
  double v4 = v3;
  double v6 = v5;
  id v7 = objc_msgSend(v2, sel_image);
  if (v7)
  {
    size_t v8 = v7;
    double v9 = COERCE_DOUBLE(sub_1B086A368());
    char v11 = v10;

    if (v11) {
      double v12 = 0.0;
    }
    else {
      double v12 = v9;
    }
  }
  else
  {
    double v12 = 0.0;
  }
  double v13 = v4;
  double v14 = v6;
  double v15 = v6;
  result.var3 = v12;
  result.var2 = v15;
  result.vaCGFloat r1 = v14;
  result.var0 = v13;
  return result;
}

double sub_1B0859290()
{
  id v1 = *v0;
  objc_msgSend(*v0, sel_sizeThatFits_);
  double v3 = v2;
  id v4 = objc_msgSend(v1, sel_image);
  if (v4)
  {
    double v5 = v4;
    sub_1B086A368();
  }
  return v3;
}

BOOL static Separator.Position.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Separator.Position.hash(into:)()
{
  return sub_1B086A968();
}

uint64_t Separator.Position.hashValue.getter()
{
  return sub_1B086A998();
}

void Separator.position.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *Separator.position.setter(unsigned char *result)
{
  *id v1 = *result;
  return result;
}

double (*Separator.position.modify())(void)
{
  return nullsub_1;
}

double Separator.leadingInset.getter()
{
  return *(double *)(v0 + 8);
}

void Separator.leadingInset.setter(double a1)
{
  *(double *)(v1 + 8) = a1;
}

double (*Separator.leadingInset.modify())(void)
{
  return nullsub_1;
}

uint64_t Separator.withLeadingInset(_:)@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  char v5 = *v2;
  uint64_t v6 = *((void *)v2 + 2);
  uint64_t result = sub_1B07BBD78((uint64_t)(v2 + 24), a1 + 24);
  *(unsigned char *)a1 = v5;
  *(double *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = v6;
  return result;
}

double Separator.trailingInset.getter()
{
  return *(double *)(v0 + 16);
}

void Separator.trailingInset.setter(double a1)
{
  *(double *)(v1 + 16) = a1;
}

double (*Separator.trailingInset.modify())(void)
{
  return nullsub_1;
}

uint64_t Separator.withTrailingInset(_:)@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  char v5 = *v2;
  uint64_t v6 = *((void *)v2 + 1);
  uint64_t result = sub_1B07BBD78((uint64_t)(v2 + 24), a1 + 24);
  *(unsigned char *)a1 = v5;
  *(void *)(a1 + 8) = v6;
  *(double *)(a1 + 16) = a2;
  return result;
}

uint64_t Separator.withInsets(of:)@<X0>(uint64_t a1@<X8>, double a2@<D1>, double a3@<D3>)
{
  char v7 = *v3;
  uint64_t result = sub_1B07BBD78((uint64_t)(v3 + 24), a1 + 24);
  *(unsigned char *)a1 = v7;
  *(double *)(a1 + 8) = a2;
  *(double *)(a1 + 16) = a3;
  return result;
}

uint64_t Separator.verticalOutset.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B07BBD78(v1 + 24, a1);
}

uint64_t Separator.verticalOutset.setter(long long *a1)
{
  uint64_t v3 = v1 + 24;
  __swift_destroy_boxed_opaque_existential_1(v3);

  return sub_1B07BA8FC(a1, v3);
}

double (*Separator.verticalOutset.modify())(void)
{
  return nullsub_1;
}

uint64_t Separator.withVerticalOutset(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v4 = *v2;
  uint64_t v5 = *((void *)v2 + 1);
  uint64_t v6 = *((void *)v2 + 2);
  uint64_t result = sub_1B07BBD78(a1, a2 + 24);
  *(unsigned char *)a2 = v4;
  *(void *)(a2 + 8) = v5;
  *(void *)(a2 + 16) = v6;
  return result;
}

double static Separator.thickness(compatibleWith:)(void *a1)
{
  id v2 = objc_msgSend(a1, sel_preferredContentSizeCategory);
  char v3 = sub_1B086A348();

  double result = 1.0;
  if ((v3 & 1) == 0)
  {
    objc_msgSend(a1, sel_displayScale, 1.0);
    if (v5 <= 0.0) {
      double v5 = ForJetUIOnly_MainScreenScale();
    }
    return 1.0 / v5;
  }
  return result;
}

double Separator.height(in:)(void *a1)
{
  uint64_t v3 = sub_1B086A868();
  uint64_t v4 = *(void *)(v3 - 8);
  *(void *)&double v5 = MEMORY[0x1F4188790](v3).n128_u64[0];
  char v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(a1, sel_traitCollection, v5);
  id v9 = objc_msgSend(v8, sel_preferredContentSizeCategory);
  char v10 = sub_1B086A348();

  if (v10)
  {

    double v11 = 1.0;
  }
  else
  {
    objc_msgSend(v8, sel_displayScale);
    if (v12 <= 0.0)
    {
      float v14 = ForJetUIOnly_MainScreenScale();

      double v13 = v14;
    }
    else
    {
      double v13 = v12;
    }
    double v11 = 1.0 / v13;
  }
  double v15 = v1 + 3;
  uint64_t v17 = v1[6];
  uint64_t v16 = v1[7];
  __swift_project_boxed_opaque_existential_1(v15, v17);
  sub_1B07B76D8((uint64_t)v7);
  AnyDimension.value(in:rounded:)((uint64_t)a1, (uint64_t)v7, v17, v16);
  double v19 = v18;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return v11 + v19 + v19;
}

BOOL static Separator.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v4 = *a1;
  int v5 = *a2;
  sub_1B0859B18((uint64_t)a1, (uint64_t)v16);
  sub_1B0859B18((uint64_t)a2, (uint64_t)v14);
  if (v4 == v5)
  {
    double v6 = v17;
    sub_1B0859B8C((uint64_t)v16);
    double v7 = v15;
    sub_1B0859B8C((uint64_t)v14);
    sub_1B0859B18((uint64_t)a1, (uint64_t)v12);
    sub_1B0859B18((uint64_t)a2, (uint64_t)v11);
    if (v6 == v7)
    {
      double v8 = v13;
      sub_1B0859B8C((uint64_t)v12);
      double v9 = *(double *)&v11[2];
      sub_1B0859B8C((uint64_t)v11);
      return v8 == v9;
    }
  }
  else
  {
    sub_1B0859B8C((uint64_t)v14);
    sub_1B0859B8C((uint64_t)v16);
    sub_1B0859B18((uint64_t)a1, (uint64_t)v12);
    sub_1B0859B18((uint64_t)a2, (uint64_t)v11);
  }
  sub_1B0859B8C((uint64_t)v11);
  sub_1B0859B8C((uint64_t)v12);
  return 0;
}

double CGSize.add(separator:in:)(uint64_t a1, void *a2)
{
  double result = Separator.height(in:)(a2) + *(double *)(v2 + 8);
  *(double *)(v2 + 8) = result;
  return result;
}

double CGSize.adding(separator:in:)(double a1, uint64_t a2, void *a3)
{
  return a1;
}

double CGRect.inset(bySeparator:in:)(unsigned char *a1, void *a2)
{
  uint64_t v3 = v2;
  double result = Separator.height(in:)(a2);
  *(double *)(v3 + 24) = *(double *)(v3 + 24) - result;
  if ((*a1 & 1) == 0)
  {
    double result = result + *(double *)(v3 + 8);
    *(double *)(v3 + 8) = result;
  }
  return result;
}

double CGRect.insetting(bySeparator:in:)(double a1, uint64_t a2, void *a3)
{
  return a1;
}

double JUMeasurements.add(separator:in:)(unsigned char *a1, void *a2)
{
  uint64_t v3 = v2;
  double v5 = Separator.height(in:)(a2);
  *(double *)(v3 + 8) = v5 + *(double *)(v3 + 8);
  uint64_t v6 = 16;
  if (*a1) {
    uint64_t v6 = 24;
  }
  double result = v5 + *(double *)(v3 + v6);
  *(double *)(v3 + v6) = result;
  return result;
}

double JUMeasurements.adding(separator:in:)(double a1, uint64_t a2, void *a3)
{
  return a1;
}

uint64_t sub_1B0859B18(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a2 = *(unsigned char *)a1;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  long long v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 48) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2 + 24, a1 + 24);
  return a2;
}

uint64_t sub_1B0859B8C(uint64_t a1)
{
  return a1;
}

unint64_t sub_1B0859BBC()
{
  unint64_t result = qword_1E9B3BD90;
  if (!qword_1E9B3BD90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BD90);
  }
  return result;
}

uint64_t initializeWithCopy for Separator(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  long long v3 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 48) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a1 + 24, a2 + 24);
  return a1;
}

uint64_t assignWithCopy for Separator(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 24), (uint64_t *)(a2 + 24));
  return a1;
}

uint64_t assignWithTake for Separator(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  __swift_destroy_boxed_opaque_existential_1(a1 + 24);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for Separator(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Separator(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for Separator.Position(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B0859E88);
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

uint64_t sub_1B0859EB0(uint64_t a1)
{
  v3[0] = 0;
  v3[1] = 0xE000000000000000;
  sub_1B086A5E8();
  uint64_t v4 = 0;
  unint64_t v5 = 0xE000000000000000;
  sub_1B0869E68();
  swift_beginAccess();
  sub_1B07BBD78(a1 + 16, (uint64_t)v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595DE0);
  sub_1B086A6B8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  sub_1B0869E68();
  return v4;
}

uint64_t sub_1B0859F7C()
{
  uint64_t v1 = *v0 + 16;
  swift_beginAccess();
  sub_1B07BBD78(v1, (uint64_t)v6);
  uint64_t v2 = v7;
  uint64_t v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v2, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

uint64_t sub_1B085A010(uint64_t a1)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B07BBD78(v3, (uint64_t)v7);
  uint64_t v4 = v8;
  uint64_t v5 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24))(a1, v4, v5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

void (*sub_1B085A0A4(void *a1))(uint64_t *a1)
{
  uint64_t v3 = malloc(0x50uLL);
  *a1 = v3;
  uint64_t v4 = *v1;
  v3[9] = *v1;
  uint64_t v5 = v4 + 16;
  swift_beginAccess();
  sub_1B07BBD78(v5, (uint64_t)v3);
  uint64_t v6 = v3[3];
  uint64_t v7 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v6);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v6, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  v3[8] = v8;
  return sub_1B085A16C;
}

void sub_1B085A16C(uint64_t *a1)
{
  uint64_t v1 = (void *)*a1;
  uint64_t v2 = *(void *)(*a1 + 64);
  sub_1B07BBD78(*(void *)(*a1 + 72) + 16, *a1);
  uint64_t v3 = v1[3];
  uint64_t v4 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v2, v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);

  free(v1);
}

uint64_t sub_1B085A1F8()
{
  uint64_t v1 = *v0 + 16;
  swift_beginAccess();
  sub_1B07BBD78(v1, (uint64_t)v6);
  uint64_t v2 = v7;
  uint64_t v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 40))(v2, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

uint64_t sub_1B085A28C(uint64_t a1)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B07BBD78(v3, (uint64_t)v7);
  uint64_t v4 = v8;
  uint64_t v5 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, v4, v5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

void (*sub_1B085A320(void *a1))(uint64_t *a1)
{
  uint64_t v3 = malloc(0x50uLL);
  *a1 = v3;
  uint64_t v4 = *v1;
  v3[9] = *v1;
  uint64_t v5 = v4 + 16;
  swift_beginAccess();
  sub_1B07BBD78(v5, (uint64_t)v3);
  uint64_t v6 = v3[3];
  uint64_t v7 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v6);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 40))(v6, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  v3[8] = v8;
  return sub_1B085A3E8;
}

void sub_1B085A3E8(uint64_t *a1)
{
  uint64_t v1 = (void *)*a1;
  uint64_t v2 = *(void *)(*a1 + 64);
  sub_1B07BBD78(*(void *)(*a1 + 72) + 16, *a1);
  uint64_t v3 = v1[3];
  uint64_t v4 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v2, v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);

  free(v1);
}

uint64_t sub_1B085A474()
{
  uint64_t v1 = *v0 + 16;
  swift_beginAccess();
  sub_1B07BBD78(v1, (uint64_t)v6);
  uint64_t v2 = v7;
  uint64_t v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 64))(v2, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

uint64_t sub_1B085A508(uint64_t a1)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B07BBD78(v3, (uint64_t)v7);
  uint64_t v4 = v8;
  uint64_t v5 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 72))(a1, v4, v5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

void (*sub_1B085A59C(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x50uLL);
  *a1 = v3;
  uint64_t v4 = *v1;
  v3[9] = *v1;
  uint64_t v5 = v4 + 16;
  swift_beginAccess();
  sub_1B07BBD78(v5, (uint64_t)v3);
  uint64_t v6 = v3[3];
  uint64_t v7 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v6);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 64))(v6, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  v3[8] = v8;
  return sub_1B085A664;
}

void sub_1B085A664(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void **)(*a1 + 64);
  sub_1B07BBD78(*(void *)(*a1 + 72) + 16, *a1);
  uint64_t v5 = *(void *)(v3 + 24);
  uint64_t v6 = *(void *)(v3 + 32);
  __swift_project_boxed_opaque_existential_1((void *)v3, v5);
  uint64_t v7 = *(void (**)(void *, uint64_t, uint64_t))(v6 + 72);
  if (a2)
  {
    id v8 = v4;
    v7(v4, v5, v6);
    __swift_destroy_boxed_opaque_existential_1(v3);
  }
  else
  {
    v7(v4, v5, v6);
    __swift_destroy_boxed_opaque_existential_1(v3);
  }

  free((void *)v3);
}

uint64_t sub_1B085A744()
{
  uint64_t v1 = *v0 + 16;
  swift_beginAccess();
  sub_1B07BBD78(v1, (uint64_t)v5);
  uint64_t v2 = v6;
  uint64_t v3 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v2, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v2 & 1;
}

double sub_1B085A7D8()
{
  uint64_t v1 = *v0 + 16;
  swift_beginAccess();
  sub_1B07BBD78(v1, (uint64_t)v6);
  uint64_t v2 = v7;
  uint64_t v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  double v4 = (*(double (**)(uint64_t, uint64_t))(v3 + 96))(v2, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

uint64_t sub_1B085A894()
{
  uint64_t v1 = *v0 + 16;
  swift_beginAccess();
  sub_1B07BBD78(v1, (uint64_t)v6);
  uint64_t v2 = v7;
  uint64_t v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 104))(v2, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

uint64_t sub_1B085A928()
{
  return sub_1B0859EB0(*v0);
}

void (*sub_1B085A930(double **a1))(uint64_t *a1)
{
  uint64_t v3 = (double *)malloc(0x68uLL);
  *a1 = v3;
  double v4 = *v1;
  v3[12] = *v1;
  uint64_t v5 = *(void *)&v4 + 16;
  swift_beginAccess();
  sub_1B07BBD78(v5, (uint64_t)v3);
  uint64_t v7 = *((void *)v3 + 3);
  uint64_t v6 = *((void *)v3 + 4);
  __swift_project_boxed_opaque_existential_1(v3, v7);
  double v8 = (*(double (**)(uint64_t))(*(void *)(v6 + 8) + 16))(v7);
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  void v3[5] = v8;
  *((void *)v3 + 6) = v10;
  v3 += 5;
  *((void *)v3 + 2) = v12;
  *((void *)v3 + 3) = v14;
  return sub_1B085AA10;
}

void sub_1B085AA10(uint64_t *a1)
{
  uint64_t v1 = (void *)*a1;
  double v2 = *(double *)(*a1 + 40);
  double v3 = *(double *)(*a1 + 48);
  double v4 = *(double *)(*a1 + 56);
  double v5 = *(double *)(*a1 + 64);
  sub_1B07BBD78(*(void *)(*a1 + 96) + 16, *a1);
  uint64_t v7 = v1[3];
  uint64_t v6 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v7);
  (*(void (**)(uint64_t, double, double, double, double))(*(void *)(v6 + 8) + 24))(v7, v2, v3, v4, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);

  free(v1);
}

uint64_t sub_1B085AABC()
{
  uint64_t v1 = *v0 + 16;
  swift_beginAccess();
  sub_1B07BBD78(v1, (uint64_t)v5);
  uint64_t v2 = v6;
  uint64_t v3 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t))(*(void *)(v3 + 8) + 40))(v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v2 & 1;
}

uint64_t sub_1B085AB48(uint64_t a1)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_1B07BBD78(v3, (uint64_t)v7);
  uint64_t v4 = v8;
  uint64_t v5 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 + 8) + 48))(a1, v4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

void (*sub_1B085ABDC(void *a1))(uint64_t *a1)
{
  uint64_t v3 = malloc(0x50uLL);
  *a1 = v3;
  uint64_t v4 = *v1;
  v3[8] = *v1;
  uint64_t v5 = v4 + 16;
  swift_beginAccess();
  sub_1B07BBD78(v5, (uint64_t)v3);
  uint64_t v7 = v3[3];
  uint64_t v6 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v7);
  LOBYTE(v6) = (*(uint64_t (**)(uint64_t))(*(void *)(v6 + 8) + 40))(v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  *((unsigned char *)v3 + 72) = v6 & 1;
  return sub_1B085ACA0;
}

void sub_1B085ACA0(uint64_t *a1)
{
  uint64_t v1 = (void *)*a1;
  uint64_t v2 = *(unsigned __int8 *)(*a1 + 72);
  sub_1B07BBD78(*(void *)(*a1 + 64) + 16, *a1);
  uint64_t v3 = v1[3];
  uint64_t v4 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 + 8) + 48))(v2, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);

  free(v1);
}

double sub_1B085AD30()
{
  uint64_t v1 = *v0 + 16;
  swift_beginAccess();
  sub_1B07BBD78(v1, (uint64_t)v6);
  uint64_t v2 = v7;
  uint64_t v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  double v4 = (*(double (**)(uint64_t))(*(void *)(v3 + 8) + 72))(v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

ValueMetadata *type metadata accessor for LanguageAwareLayoutTextView()
{
  return &type metadata for LanguageAwareLayoutTextView;
}

id UILabel.hasContent.getter()
{
  id result = objc_msgSend(v0, sel_text);
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = sub_1B0869D98();
    unint64_t v5 = v4;

    swift_bridgeObjectRelease();
    uint64_t v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0) {
      uint64_t v6 = v3 & 0xFFFFFFFFFFFFLL;
    }
    return (id)(v6 != 0);
  }
  return result;
}

uint64_t UILabel.isTextExtraTall.getter()
{
  id v1 = objc_msgSend(v0, sel_text);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  sub_1B0869D98();

  if (qword_1EB5964B8 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1B0869078();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EB596390);
  sub_1B07B862C();
  uint64_t v4 = 1;
  sub_1B086A408();
  char v6 = v5;
  swift_bridgeObjectRelease();
  if (v6) {
    return 0;
  }
  return v4;
}

double UILabel.languageAwareOutsets.getter()
{
  objc_msgSend(v0, sel__contentInsetsFromFonts);
  return fabs(v1);
}

uint64_t sub_1B085AF8C(void *a1)
{
  id v1 = a1;
  id v2 = objc_msgSend(v1, sel_text);
  if (v2)
  {
    uint64_t v3 = v2;
    sub_1B0869D98();

    uint64_t v4 = sub_1B0869E48();
    swift_bridgeObjectRelease();
    return v4;
  }
  else
  {

    return 0;
  }
}

id UILabel.textLength.getter()
{
  id result = objc_msgSend(v0, sel_text);
  if (result)
  {
    id v2 = result;
    sub_1B0869D98();

    uint64_t v3 = sub_1B0869E48();
    swift_bridgeObjectRelease();
    return (id)v3;
  }
  return result;
}

id sub_1B085B080()
{
  return objc_msgSend(*v0, sel_numberOfLines);
}

id (*sub_1B085B090(void *a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = objc_msgSend(v3, sel_numberOfLines);
  return sub_1B085B0E4;
}

id sub_1B085B0E4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), sel_setNumberOfLines_, *(void *)a1);
}

id sub_1B085B0F8()
{
  return objc_msgSend(*v0, sel_lineBreakMode);
}

id (*sub_1B085B108(void *a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = objc_msgSend(v3, sel_lineBreakMode);
  return sub_1B085B15C;
}

id sub_1B085B15C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), sel_setLineBreakMode_, *(void *)a1);
}

void (*sub_1B085B170(void *a1))(id *a1)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = objc_msgSend(v3, sel_font);
  return sub_1B085B1CC;
}

void sub_1B085B1CC(id *a1)
{
  id v1 = *a1;
  objc_msgSend(a1[1], sel_setFont_);
}

id sub_1B085B214()
{
  return objc_msgSend(*v0, sel_jet_textLength);
}

JetUI::_LayoutAlignment __swiftcall _LayoutAlignment.init(horizontal:vertical:)(JetUI::_LayoutAlignment::Horizontal horizontal, JetUI::_LayoutAlignment::Vertical vertical)
{
  char v3 = *(unsigned char *)vertical;
  *id v2 = *(unsigned char *)horizontal;
  v2[1] = v3;
  result.horizontal = horizontal;
  return result;
}

void static _LayoutAlignment.unspecified.getter(_WORD *a1@<X8>)
{
  *a1 = 0;
}

BOOL static _LayoutAlignment.Horizontal.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t _LayoutAlignment.Horizontal.hash(into:)()
{
  return sub_1B086A968();
}

void _LayoutAlignment.horizontal.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *_LayoutAlignment.horizontal.setter(unsigned char *result)
{
  *id v1 = *result;
  return result;
}

double (*_LayoutAlignment.horizontal.modify())(void)
{
  return nullsub_1;
}

void _LayoutAlignment.vertical.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 1);
}

unsigned char *_LayoutAlignment.vertical.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 1) = *result;
  return result;
}

double (*_LayoutAlignment.vertical.modify())(void)
{
  return nullsub_1;
}

BOOL static _LayoutAlignment.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

unint64_t sub_1B085B31C()
{
  unint64_t result = qword_1E9B3BD98;
  if (!qword_1E9B3BD98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BD98);
  }
  return result;
}

unint64_t sub_1B085B374()
{
  unint64_t result = qword_1E9B3BDA0;
  if (!qword_1E9B3BDA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BDA0);
  }
  return result;
}

BOOL sub_1B085B3C8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for _LayoutAlignment(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 65283 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65283 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 65283;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 65283;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65283;
    }
  }
LABEL_17:
  unsigned int v6 = *(unsigned __int8 *)a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for _LayoutAlignment(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65283 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65283 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 253) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 253;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1B085B554);
      case 4:
        *(_DWORD *)(result + 2) = v6;
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
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(unsigned char *)unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _LayoutAlignment()
{
  return &type metadata for _LayoutAlignment;
}

ValueMetadata *type metadata accessor for _LayoutAlignment.Horizontal()
{
  return &type metadata for _LayoutAlignment.Horizontal;
}

unsigned char *_s5JetUI16_LayoutAlignmentV10HorizontalOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B085B670);
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

ValueMetadata *type metadata accessor for _LayoutAlignment.Vertical()
{
  return &type metadata for _LayoutAlignment.Vertical;
}

uint64_t dispatch thunk of _AlignableLayout._layoutAlignment(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

BOOL static VerticalFlowLayout.VerticalPlacement.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t VerticalFlowLayout.VerticalPlacement.hash(into:)()
{
  return sub_1B086A968();
}

uint64_t VerticalFlowLayout.VerticalPlacement.hashValue.getter()
{
  return sub_1B086A998();
}

BOOL static VerticalFlowLayout.HorizontalPlacement.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t VerticalFlowLayout.HorizontalPlacement.hash(into:)()
{
  return sub_1B086A968();
}

uint64_t VerticalFlowLayout.HorizontalPlacement.hashValue.getter()
{
  return sub_1B086A998();
}

JetUI::VerticalFlowLayout::ExclusionCondition __swiftcall VerticalFlowLayout.ExclusionCondition.init(rawValue:)(JetUI::VerticalFlowLayout::ExclusionCondition rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

uint64_t VerticalFlowLayout.ExclusionCondition.rawValue.getter()
{
  return *(void *)v0;
}

void static VerticalFlowLayout.ExclusionCondition.isHidden.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static VerticalFlowLayout.ExclusionCondition.hasNoContent.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter(void *a1@<X8>)
{
  *a1 = 8;
}

uint64_t static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, char *a5@<X4>, uint64_t *a6@<X5>, uint64_t a7@<X8>)
{
  char v10 = *a4;
  char v11 = *a5;
  uint64_t v12 = *a6;
  sub_1B07BBD78(a1, a7);
  sub_1B07BBD78(a2, a7 + 40);
  uint64_t result = sub_1B07D32D4(a3, a7 + 80);
  *(unsigned char *)(a7 + 120) = v10;
  *(unsigned char *)(a7 + 121) = v11;
  *(void *)(a7 + 128) = v12;
  return result;
}

uint64_t VerticalFlowLayout.Child.view.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B07BBD78(v1, a1);
}

uint64_t VerticalFlowLayout.Child.topSpace.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B07BBD78(v1 + 40, a1);
}

uint64_t VerticalFlowLayout.Child.bottomSpace.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B07D32D4(v1 + 80, a1);
}

void VerticalFlowLayout.Child.verticalPlacement.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 120);
}

void VerticalFlowLayout.Child.horizontalPlacement.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 121);
}

void VerticalFlowLayout.Child.excludeWhen.getter(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 128);
}

JetUI::VerticalFlowLayout __swiftcall VerticalFlowLayout.init(expandChildrenToFit:children:)(Swift::Bool expandChildrenToFit, Swift::OpaquePointer children)
{
  *(unsigned char *)uint64_t v2 = expandChildrenToFit;
  *(Swift::OpaquePointer *)(v2 + 8) = children;
  result.children = children;
  result.expandChildrenToFit = expandChildrenToFit;
  return result;
}

uint64_t VerticalFlowLayout.expandChildrenToFit.getter()
{
  return *v0;
}

uint64_t VerticalFlowLayout.expandChildrenToFit.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

double (*VerticalFlowLayout.expandChildrenToFit.modify())(void)
{
  return nullsub_1;
}

uint64_t VerticalFlowLayout.children.getter()
{
  return swift_bridgeObjectRetain();
}

__n128 VerticalFlowLayout.addChild(_:)(uint64_t a1)
{
  sub_1B07D0C20(a1, (uint64_t)v12);
  uint64_t v2 = *(char **)(v1 + 8);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1B07CF7B8(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1B07CF7B8((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  uint64_t v5 = &v2[136 * v4];
  *((_OWORD *)v5 + 2) = v12[0];
  long long v6 = v12[1];
  long long v7 = v12[2];
  long long v8 = v12[4];
  *((_OWORD *)v5 + 5) = v12[3];
  *((_OWORD *)v5 + 6) = v8;
  *((_OWORD *)v5 + 3) = v6;
  *((_OWORD *)v5 + 4) = v7;
  __n128 result = (__n128)v12[5];
  long long v10 = v12[6];
  long long v11 = v12[7];
  *((void *)v5 + 20) = v13;
  *((_OWORD *)v5 + 8) = v10;
  *((_OWORD *)v5 + 9) = v11;
  *((__n128 *)v5 + 7) = result;
  *(void *)(v1 + 8) = v2;
  return result;
}

unint64_t VerticalFlowLayout.insertChild(_:at:)(unint64_t result, int64_t a2)
{
  if (*(void *)(*(void *)(v2 + 8) + 16) < a2)
  {
    __break(1u);
  }
  else if ((a2 & 0x8000000000000000) == 0)
  {
    sub_1B07D0C20(result, (uint64_t)v4);
    return sub_1B07D0AC8(a2, a2, (uint64_t)v4);
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall VerticalFlowLayout.removeChild(at:)(Swift::Int at)
{
  sub_1B07EB928(at, (uint64_t)v1);
  sub_1B085C85C((uint64_t)v1);
}

Swift::Void __swiftcall VerticalFlowLayout.removeAllChildren()()
{
  swift_bridgeObjectRelease();
  *(void *)(v0 + 8) = MEMORY[0x1E4FBC860];
}

void VerticalFlowLayout.measurements(fitting:in:)(uint64_t a1, double a2, double a3)
{
  uint64_t v59 = sub_1B086A868();
  MEMORY[0x1F4188790](v59);
  uint64_t v58 = (uint64_t)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *((void *)v3 + 1);
  uint64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
    int v53 = *v3;
    unsigned __int8 v52 = (void (**)(uint64_t, uint64_t))(v7 + 8);
    uint64_t v56 = &v78;
    id v57 = &v75;
    swift_bridgeObjectRetain();
    int v11 = 0;
    unint64_t v12 = 0;
    uint64_t v13 = v9 + 32;
    double v63 = 0.0;
    double v14 = 0.0;
    double v60 = 0.0;
    double v15 = 0.0;
    uint64_t v54 = v9 + 32;
    uint64_t v55 = v10 - 1;
LABEL_4:
    int v62 = v11;
    double v61 = v14;
    uint64_t v16 = v13 + 136 * v12;
    unint64_t v17 = v12;
    while (1)
    {
      if (v17 >= *(void *)(v9 + 16))
      {
        __break(1u);
        return;
      }
      sub_1B07D0C20(v16, (uint64_t)v72);
      uint64_t v18 = v73;
      uint64_t v19 = v74;
      __swift_project_boxed_opaque_existential_1(v72, v73);
      double v20 = (*(double (**)(uint64_t, uint64_t, double, double))(*(void *)(v19 + 8) + 8))(a1, v18, a2, a3);
      double v22 = v21;
      double v24 = v23;
      double v14 = v25;
      char v26 = v80;
      sub_1B07D0C20((uint64_t)v72, (uint64_t)v69);
      if ((v26 & 2) != 0)
      {
        uint64_t v28 = v70;
        uint64_t v27 = v71;
        __swift_project_boxed_opaque_existential_1(v69, v70);
        char v29 = (*(uint64_t (**)(uint64_t, uint64_t))(v27 + 64))(v28, v27);
        sub_1B085C85C((uint64_t)v69);
        sub_1B07D0C20((uint64_t)v72, (uint64_t)v68);
        if ((v29 & 1) == 0)
        {
          sub_1B085C85C((uint64_t)v68);
          sub_1B07D0C20((uint64_t)v72, (uint64_t)v64);
LABEL_6:
          sub_1B085C85C((uint64_t)v64);
          goto LABEL_7;
        }
      }
      else
      {
        sub_1B085C85C((uint64_t)v69);
        sub_1B07D0C20((uint64_t)v72, (uint64_t)v68);
      }
      char v30 = v68[128];
      sub_1B07D0C20((uint64_t)v68, (uint64_t)v64);
      if (v30)
      {
        uint64_t v31 = v65;
        uint64_t v32 = v66;
        __swift_project_boxed_opaque_existential_1(v64, v65);
        char v33 = (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 40))(v31, v32);
        sub_1B085C85C((uint64_t)v68);
        sub_1B085C85C((uint64_t)v64);
        sub_1B07D0C20((uint64_t)v72, (uint64_t)v64);
        if (v33) {
          goto LABEL_6;
        }
      }
      else
      {
        sub_1B085C85C((uint64_t)v68);
        sub_1B085C85C((uint64_t)v64);
        sub_1B07D0C20((uint64_t)v72, (uint64_t)v64);
      }
      if ((v67 & 8) == 0)
      {
        sub_1B085C85C((uint64_t)v64);
LABEL_19:
        char v34 = v79;
        uint64_t v35 = v76;
        uint64_t v36 = v77;
        __swift_project_boxed_opaque_existential_1(v57, v76);
        if (v34)
        {
          double v37 = AnyDimension.topMargin(from:in:)(a1, v35, v36, v20, v22, v24);
        }
        else
        {
          uint64_t v38 = v58;
          sub_1B07B76D8(v58);
          AnyDimension.value(in:rounded:)(a1, v38, v35, v36);
          double v37 = v39;
          (*v52)(v38, v59);
        }
        char v40 = v62;
        double v41 = 0.0;
        if (v37 >= 0.0) {
          double v41 = v37;
        }
        double v42 = v22 + floor(v63 + v41);
        if (v20 > v15) {
          double v15 = v20;
        }
        sub_1B07D32D4((uint64_t)v56, (uint64_t)v69);
        uint64_t v43 = v70;
        if (v70)
        {
          uint64_t v44 = v71;
          __swift_project_boxed_opaque_existential_1(v69, v70);
          double v45 = AnyDimension.bottomMargin(from:in:)(a1, v43, v44, v20, v22, v24, v14);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v69);
          double v63 = v42 + v45;
          if ((v40 & 1) == 0) {
            goto LABEL_30;
          }
        }
        else
        {
          sub_1B07D34C8((uint64_t)v69);
          double v63 = v42 - v14;
          if ((v40 & 1) == 0)
          {
LABEL_30:
            double v60 = v24;
            if ((v79 & 1) == 0)
            {
              uint64_t v46 = v76;
              uint64_t v47 = v77;
              __swift_project_boxed_opaque_existential_1(v57, v76);
              uint64_t v48 = v58;
              sub_1B07B76D8(v58);
              AnyDimension.value(in:rounded:)(a1, v48, v46, v47);
              double v50 = v49;
              (*v52)(v48, v59);
              double v60 = v24 + v50;
            }
          }
        }
        unint64_t v12 = v17 + 1;
        sub_1B085C85C((uint64_t)v72);
        int v11 = 1;
        uint64_t v13 = v54;
        if (v55 != v17) {
          goto LABEL_4;
        }
LABEL_32:
        swift_bridgeObjectRelease();
        return;
      }
      sub_1B085C85C((uint64_t)v64);
      if (v22 >= COERCE_DOUBLE(1)) {
        goto LABEL_19;
      }
LABEL_7:
      ++v17;
      sub_1B085C85C((uint64_t)v72);
      v16 += 136;
      if (v10 == v17) {
        goto LABEL_32;
      }
    }
  }
}

void VerticalFlowLayout.placeChildren(relativeTo:in:)(void *a1@<X0>, CGFloat *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  uint64_t v104 = sub_1B086A868();
  uint64_t v13 = *(void *)(v104 - 8);
  MEMORY[0x1F4188790](v104);
  uint64_t v103 = (uint64_t)&v92 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v105 = *v6;
  uint64_t v15 = *((void *)v6 + 1);
  CGFloat v114 = a3;
  v132.origin.CGFloat x = a3;
  v132.origin.CGFloat y = a4;
  v132.size.CGFloat width = a5;
  v132.size.CGFloat height = a6;
  double MinY = CGRectGetMinY(v132);
  uint64_t v17 = *(void *)(v15 + 16);
  if (v17)
  {
    *(double *)&long long v110 = MinY;
    double v113 = a4;
    CGRect v97 = (void (**)(uint64_t, uint64_t))(v13 + 8);
    uint64_t v98 = a2;
    CGFloat v101 = &v128;
    unint64_t v102 = &v125;
    swift_bridgeObjectRetain();
    int v18 = 0;
    unint64_t v19 = 0;
    uint64_t v20 = v15 + 32;
    double v21 = 0.0;
    double v108 = 0.0;
    double v22 = 0.0;
    double v111 = 0.0;
    uint64_t v99 = v15 + 32;
    uint64_t v100 = v17 - 1;
LABEL_4:
    int v109 = v18;
    double v23 = v21;
    uint64_t v24 = v20 + 136 * v19;
    unint64_t v25 = v19;
    while (1)
    {
      if (v25 >= *(void *)(v15 + 16))
      {
        __break(1u);
        return;
      }
      sub_1B07D0C20(v24, (uint64_t)v122);
      uint64_t v26 = v123;
      uint64_t v27 = v124;
      __swift_project_boxed_opaque_existential_1(v122, v123);
      double v28 = (*(double (**)(void *, uint64_t, CGFloat, CGFloat))(*(void *)(v27 + 8) + 8))(a1, v26, a5, a6);
      double v30 = v29;
      double v32 = v31;
      double v21 = v33;
      char v34 = v131;
      sub_1B07D0C20((uint64_t)v122, (uint64_t)&v121);
      if ((v34 & 2) != 0)
      {
        CGFloat d = v121.d;
        CGFloat tx = v121.tx;
        __swift_project_boxed_opaque_existential_1(&v121, *(uint64_t *)&v121.d);
        char v37 = (*(uint64_t (**)(CGFloat, CGFloat))(*(void *)&tx + 64))(COERCE_CGFLOAT(*(void *)&d), COERCE_CGFLOAT(*(void *)&tx));
        sub_1B085C85C((uint64_t)&v121);
        sub_1B07D0C20((uint64_t)v122, (uint64_t)v119);
        if ((v37 & 1) == 0)
        {
          sub_1B085C85C((uint64_t)v119);
          sub_1B07D0C20((uint64_t)v122, (uint64_t)v115);
LABEL_6:
          sub_1B085C85C((uint64_t)v115);
          goto LABEL_7;
        }
      }
      else
      {
        sub_1B085C85C((uint64_t)&v121);
        sub_1B07D0C20((uint64_t)v122, (uint64_t)v119);
      }
      char v38 = v120;
      sub_1B07D0C20((uint64_t)v119, (uint64_t)v115);
      if (v38)
      {
        uint64_t v39 = v116;
        uint64_t v40 = v117;
        __swift_project_boxed_opaque_existential_1(v115, v116);
        char v41 = (*(uint64_t (**)(uint64_t, uint64_t))(v40 + 40))(v39, v40);
        sub_1B085C85C((uint64_t)v119);
        sub_1B085C85C((uint64_t)v115);
        sub_1B07D0C20((uint64_t)v122, (uint64_t)v115);
        if (v41) {
          goto LABEL_6;
        }
      }
      else
      {
        sub_1B085C85C((uint64_t)v119);
        sub_1B085C85C((uint64_t)v115);
        sub_1B07D0C20((uint64_t)v122, (uint64_t)v115);
      }
      if ((v118 & 8) == 0)
      {
        sub_1B085C85C((uint64_t)v115);
LABEL_19:
        double Width = v28;
        CGFloat v42 = v113;
        if (v105)
        {
          v133.origin.CGFloat x = v114;
          v133.origin.CGFloat y = v113;
          v133.size.CGFloat width = a5;
          v133.size.CGFloat height = a6;
          double Width = CGRectGetWidth(v133);
        }
        if (v130)
        {
          CGFloat v43 = v114;
          CGFloat v44 = v42;
          CGFloat v45 = a5;
          CGFloat v46 = a6;
          if (v130 == 1) {
            double MinX = floor(CGRectGetMidX(*(CGRect *)&v43) + Width * -0.5);
          }
          else {
            double MinX = CGRectGetMaxX(*(CGRect *)&v43) - Width;
          }
        }
        else
        {
          v134.origin.CGFloat x = v114;
          v134.origin.CGFloat y = v42;
          v134.size.CGFloat width = a5;
          v134.size.CGFloat height = a6;
          double MinX = CGRectGetMinX(v134);
        }
        char v48 = v129;
        uint64_t v49 = v126;
        uint64_t v50 = v127;
        __swift_project_boxed_opaque_existential_1(v102, v126);
        if (v48)
        {
          double v51 = AnyDimension.topMargin(from:in:)((uint64_t)a1, v49, v50, v28, v30, v32);
        }
        else
        {
          uint64_t v52 = v103;
          sub_1B07B76D8(v103);
          AnyDimension.value(in:rounded:)((uint64_t)a1, v52, v49, v50);
          double v51 = v53;
          (*v97)(v52, v104);
        }
        double v54 = 0.0;
        if (v51 >= 0.0) {
          double v54 = v51;
        }
        CGFloat v55 = floor(*(double *)&v110 + v54);
        uint64_t v56 = v123;
        uint64_t v57 = v124;
        __swift_project_boxed_opaque_existential_1(v122, v123);
        id v58 = objc_msgSend(a1, sel_traitCollection);
        id v59 = objc_msgSend(v58, sel_layoutDirection);

        CGFloat v106 = v55;
        CGFloat v107 = MinX;
        v60.n128_f64[0] = MinX;
        v61.n128_f64[0] = v55;
        v62.n128_f64[0] = Width;
        v63.n128_f64[0] = v30;
        if (v59 == (id)1)
        {
          CGAffineTransformMakeScale(&v121, -1.0, 1.0);
          long long v110 = *(_OWORD *)&v121.a;
          long long v96 = *(_OWORD *)&v121.c;
          CGFloat ty = v121.ty;
          CGFloat v95 = v121.tx;
          CGFloat v65 = v113;
          CGFloat v64 = v114;
          v135.origin.CGFloat x = v114;
          v135.origin.CGFloat y = v113;
          v135.size.CGFloat width = a5;
          v135.size.CGFloat height = a6;
          CGFloat v93 = CGRectGetMinX(v135);
          v136.origin.CGFloat x = v64;
          v136.origin.CGFloat y = v65;
          v136.size.CGFloat width = a5;
          v136.size.CGFloat height = a6;
          CGFloat v66 = -(v93 + CGRectGetMaxX(v136));
          *(_OWORD *)&v121.a = v110;
          *(_OWORD *)&v121.c = v96;
          v121.CGFloat tx = v95;
          v121.CGFloat ty = ty;
          CGAffineTransformTranslate(v119, &v121, v66, 0.0);
          CGAffineTransform v121 = v119[0];
          v137.origin.CGFloat y = v106;
          v137.origin.CGFloat x = v107;
          v137.size.CGFloat width = Width;
          v137.size.CGFloat height = v30;
          *(CGRect *)v60.n128_u64 = CGRectApplyAffineTransform(v137, &v121);
        }
        (*(void (**)(uint64_t, uint64_t, __n128, __n128, __n128, __n128))(v57 + 24))(v56, v57, v60, v61, v62, v63);
        uint64_t v67 = v123;
        uint64_t v68 = v124;
        __swift_project_boxed_opaque_existential_1(v122, v123);
        v138.origin.CGFloat x = (*(double (**)(uint64_t, uint64_t))(v68 + 16))(v67, v68);
        double MaxX = CGRectGetMaxX(v138);
        v139.origin.CGFloat y = v113;
        v139.origin.CGFloat x = v114;
        v139.size.CGFloat width = a5;
        v139.size.CGFloat height = a6;
        double v70 = MaxX - CGRectGetMinX(v139);
        double v71 = v111;
        if (v70 > v111) {
          double v71 = v70;
        }
        double v111 = v71;
        sub_1B07D32D4((uint64_t)v101, (uint64_t)&v121);
        uint64_t v72 = *(void *)&v121.d;
        if (*(void *)&v121.d)
        {
          uint64_t v73 = *(void *)&v121.tx;
          __swift_project_boxed_opaque_existential_1(&v121, *(uint64_t *)&v121.d);
          CGFloat v95 = AnyDimension.bottomMargin(from:in:)((uint64_t)a1, v72, v73, v28, v30, v32, v21);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v121);
          CGFloat v74 = v106;
          CGFloat v75 = v107;
          v140.origin.CGFloat x = v107;
          v140.origin.CGFloat y = v106;
          CGFloat v76 = Width;
          v140.size.CGFloat width = Width;
          v140.size.CGFloat height = v30;
          CGFloat MaxY = CGRectGetMaxY(v140);
          *(CGFloat *)&long long v96 = a6;
          double v78 = v95;
          *(double *)&long long v110 = v95 + MaxY;
          v141.origin.CGFloat x = v75;
          v141.origin.CGFloat y = v74;
          v141.size.CGFloat width = v76;
          v141.size.CGFloat height = v30;
          double v79 = v78 + CGRectGetMaxY(v141);
          a6 = *(double *)&v96;
        }
        else
        {
          sub_1B07D34C8((uint64_t)&v121);
          CGFloat v81 = v106;
          CGFloat v80 = v107;
          v142.origin.CGFloat x = v107;
          v142.origin.CGFloat y = v106;
          CGFloat v82 = Width;
          v142.size.CGFloat width = Width;
          v142.size.CGFloat height = v30;
          *(double *)&long long v110 = CGRectGetMaxY(v142) - v21;
          v143.origin.CGFloat x = v80;
          v143.origin.CGFloat y = v81;
          v143.size.CGFloat width = v82;
          v143.size.CGFloat height = v30;
          double v79 = CGRectGetMaxY(v143);
        }
        char v83 = v109;
        v144.origin.CGFloat y = v113;
        v144.origin.CGFloat x = v114;
        v144.size.CGFloat width = a5;
        v144.size.CGFloat height = a6;
        double v84 = CGRectGetMinY(v144);
        if ((v83 & 1) == 0)
        {
          double v108 = v32;
          if ((v129 & 1) == 0)
          {
            uint64_t v85 = v126;
            uint64_t v86 = v127;
            __swift_project_boxed_opaque_existential_1(v102, v126);
            uint64_t v87 = v103;
            sub_1B07B76D8(v103);
            AnyDimension.value(in:rounded:)((uint64_t)a1, v87, v85, v86);
            double v89 = v88;
            (*v97)(v87, v104);
            double v108 = v32 + v89;
          }
        }
        unint64_t v19 = v25 + 1;
        double v22 = v79 - v84;
        sub_1B085C85C((uint64_t)v122);
        int v18 = 1;
        uint64_t v20 = v99;
        if (v100 == v25) {
          goto LABEL_42;
        }
        goto LABEL_4;
      }
      sub_1B085C85C((uint64_t)v115);
      if (v30 >= COERCE_DOUBLE(1)) {
        goto LABEL_19;
      }
LABEL_7:
      ++v25;
      sub_1B085C85C((uint64_t)v122);
      v24 += 136;
      if (v17 == v25)
      {
        double v21 = v23;
LABEL_42:
        swift_bridgeObjectRelease();
        a2 = v98;
        a4 = v113;
        double v90 = v111;
        double v91 = v108;
        goto LABEL_44;
      }
    }
  }
  double v21 = 0.0;
  double v91 = 0.0;
  double v22 = 0.0;
  double v90 = 0.0;
LABEL_44:
  *a2 = v114;
  a2[1] = a4;
  a2[2] = v90;
  a2[3] = v22;
  a2[4] = v91;
  a2[5] = v21;
}

uint64_t sub_1B085C85C(uint64_t a1)
{
  return a1;
}

unint64_t sub_1B085C890()
{
  unint64_t result = qword_1E9B3BDA8;
  if (!qword_1E9B3BDA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BDA8);
  }
  return result;
}

unint64_t sub_1B085C8E8()
{
  unint64_t result = qword_1E9B3BDB0;
  if (!qword_1E9B3BDB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BDB0);
  }
  return result;
}

unint64_t sub_1B085C940()
{
  unint64_t result = qword_1E9B3BDB8;
  if (!qword_1E9B3BDB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BDB8);
  }
  return result;
}

unint64_t sub_1B085C998()
{
  unint64_t result = qword_1E9B3BDC0;
  if (!qword_1E9B3BDC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BDC0);
  }
  return result;
}

unint64_t sub_1B085C9F0()
{
  unint64_t result = qword_1EB596290;
  if (!qword_1EB596290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB596290);
  }
  return result;
}

unint64_t sub_1B085CA48()
{
  unint64_t result = qword_1EB596298;
  if (!qword_1EB596298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB596298);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for VerticalFlowLayout(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for VerticalFlowLayout(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for VerticalFlowLayout(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for VerticalFlowLayout()
{
  return &type metadata for VerticalFlowLayout;
}

unsigned char *storeEnumTagSinglePayload for VerticalFlowLayout.VerticalPlacement(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B085CC30);
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

ValueMetadata *type metadata accessor for VerticalFlowLayout.VerticalPlacement()
{
  return &type metadata for VerticalFlowLayout.VerticalPlacement;
}

unsigned char *storeEnumTagSinglePayload for VerticalFlowLayout.HorizontalPlacement(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B085CD34);
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

ValueMetadata *type metadata accessor for VerticalFlowLayout.HorizontalPlacement()
{
  return &type metadata for VerticalFlowLayout.HorizontalPlacement;
}

ValueMetadata *type metadata accessor for VerticalFlowLayout.ExclusionCondition()
{
  return &type metadata for VerticalFlowLayout.ExclusionCondition;
}

uint64_t destroy for VerticalFlowLayout.Child(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  if (*(void *)(a1 + 104))
  {
    return __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  }
  return result;
}

uint64_t initializeWithCopy for VerticalFlowLayout.Child(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  unsigned int v6 = (_OWORD *)(a1 + 80);
  uint64_t v7 = (_OWORD *)(a2 + 80);
  uint64_t v8 = *(void *)(a2 + 104);
  if (v8)
  {
    uint64_t v9 = *(void *)(a2 + 112);
    *(void *)(a1 + 104) = v8;
    *(void *)(a1 + 112) = v9;
    (**(void (***)(_OWORD *, _OWORD *))(v8 - 8))(v6, v7);
  }
  else
  {
    long long v10 = *(_OWORD *)(a2 + 96);
    *unsigned int v6 = *v7;
    *(_OWORD *)(a1 + 96) = v10;
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
  }
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(unsigned char *)(a1 + 121) = *(unsigned char *)(a2 + 121);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  return a1;
}

uint64_t assignWithCopy for VerticalFlowLayout.Child(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)(a2 + 40));
  uint64_t v4 = *(void *)(a2 + 104);
  if (!*(void *)(a1 + 104))
  {
    if (v4)
    {
      *(void *)(a1 + 104) = v4;
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 80, a2 + 80);
      goto LABEL_8;
    }
LABEL_7:
    long long v5 = *(_OWORD *)(a2 + 80);
    long long v6 = *(_OWORD *)(a2 + 96);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    *(_OWORD *)(a1 + 80) = v5;
    *(_OWORD *)(a1 + 96) = v6;
    goto LABEL_8;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 80);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 80), (uint64_t *)(a2 + 80));
LABEL_8:
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(unsigned char *)(a1 + 121) = *(unsigned char *)(a2 + 121);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  return a1;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for VerticalFlowLayout.Child(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  if (*(void *)(a1 + 104)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  }
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(unsigned char *)(a1 + 121) = *(unsigned char *)(a2 + 121);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  return a1;
}

uint64_t getEnumTagSinglePayload for VerticalFlowLayout.Child(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 136)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VerticalFlowLayout.Child(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 136) = 1;
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
    *(unsigned char *)(result + 136) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VerticalFlowLayout.Child()
{
  return &type metadata for VerticalFlowLayout.Child;
}

uint64_t StackChild.subscript.getter()
{
  return swift_getAtKeyPath();
}

JUMeasurements __swiftcall StackChild.measure(toFit:with:)(CGSize toFit, UITraitCollection with)
{
  double height = toFit.height;
  double width = toFit.width;
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v6);
  (*(void (**)(Class, uint64_t, uint64_t, double, double))(v7 + 8))(with.super.isa, v6, v7, width, height);
  result.var3 = v11;
  result.var2 = v10;
  result.vaCGFloat r1 = v9;
  result.var0 = v8;
  return result;
}

uint64_t StackChild.init(_:with:)@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_1B07BA8FC(a1, a4);
  uint64_t v7 = a4 + *(int *)(type metadata accessor for StackChild() + 28);
  double v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32);

  return v8(v7, a2, a3);
}

uint64_t StackChild.base.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B07BBD78(v1, a1);
}

uint64_t StackChild.properties.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 28));
}

uint64_t StackChild.properties.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 40))(v2 + *(int *)(a2 + 28), a1);
}

double (*StackChild.properties.modify())(void)
{
  return nullsub_1;
}

uint64_t sub_1B085D308(uint64_t a1)
{
  type metadata accessor for StackChild();
  swift_retain();
  sub_1B085D6E0(a1);

  return swift_release();
}

uint64_t StackChild.subscript.setter(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  sub_1B085D6E0(a1);
  swift_release();
  long long v4 = *(uint64_t (**)(uint64_t))(*(void *)(*(void *)(*MEMORY[0x1E4FBBC10] + v3 + 8) - 8) + 8);

  return v4(a1);
}

void (*StackChild.subscript.modify(void *a1, void *a2, uint64_t a3))(uint64_t a1, char a2)
{
  uint64_t v7 = malloc(0x38uLL);
  *a1 = v7;
  v7[1] = a3;
  long long v7[2] = v3;
  *uint64_t v7 = a2;
  uint64_t v8 = *(void *)(*MEMORY[0x1E4FBBC10] + *a2 + 8);
  void v7[3] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v7[4] = v9;
  size_t v10 = *(void *)(v9 + 64);
  v7[5] = malloc(v10);
  v7[6] = malloc(v10);
  swift_getAtKeyPath();
  return sub_1B085D53C;
}

void sub_1B085D53C(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 40);
  long long v4 = *(void **)(*(void *)a1 + 48);
  uint64_t v5 = *(void *)(*(void *)a1 + 24);
  uint64_t v6 = *(void *)(*(void *)a1 + 32);
  if (a2)
  {
    (*(void (**)(void, void *, uint64_t))(v6 + 16))(*(void *)(*(void *)a1 + 40), v4, v5);
    swift_retain();
    sub_1B085D6E0((uint64_t)v3);
    swift_release();
    uint64_t v7 = *(void (**)(void *, uint64_t))(v6 + 8);
    v7(v3, v5);
    v7(v4, v5);
  }
  else
  {
    swift_retain();
    sub_1B085D6E0((uint64_t)v4);
    swift_release();
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  free(v4);
  free(v3);

  free(v2);
}

Swift::Void __swiftcall StackChild.place(at:with:)(__C::CGRect at, UITraitCollection with)
{
  double height = at.size.height;
  double width = at.size.width;
  double y = at.origin.y;
  double x = at.origin.x;
  uint64_t v8 = v2[3];
  uint64_t v9 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v8);
  (*(void (**)(Class, uint64_t, uint64_t, double, double, double, double))(v9 + 16))(with.super.isa, v8, v9, x, y, width, height);
}

uint64_t sub_1B085D6E0(uint64_t a1)
{
  __n128 v1 = MEMORY[0x1F4188790](a1);
  (*(void (**)(char *, __n128))(v3 + 16))((char *)&v5 - v2, v1);
  return swift_setAtWritableKeyPath();
}

uint64_t sub_1B085D7DC()
{
  return StackChild.subscript.getter();
}

uint64_t sub_1B085D834()
{
  return 16;
}

__n128 sub_1B085D840(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

void *sub_1B085D84C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  long long v4 = (void *)a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(_DWORD *)(v6 + 80);
  if (v7 > 7
    || (*(_DWORD *)(v6 + 80) & 0x100000) != 0
    || ((v7 + 40) & (unint64_t)~v7) + *(void *)(v6 + 64) > 0x18)
  {
    uint64_t v10 = *a2;
    *long long v4 = *a2;
    long long v4 = (void *)(v10 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16)));
    swift_retain();
  }
  else
  {
    long long v11 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v11;
    (**(void (***)(uint64_t, uint64_t *))(v11 - 8))(a1, a2);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16))(((unint64_t)v4 + v7 + 40) & ~v7, ((unint64_t)a2 + v7 + 40) & ~v7, v5);
  }
  return v4;
}

uint64_t *sub_1B085D984(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

uint64_t sub_1B085DA00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v5 + 32))((*(unsigned __int8 *)(v5 + 80) + 40 + a1) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80), (*(unsigned __int8 *)(v5 + 80) + 40 + a2) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return a1;
}

uint64_t sub_1B085DA78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))((*(unsigned __int8 *)(v7 + 80) + 40 + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(unsigned __int8 *)(v7 + 80) + 40 + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_1B085DB04(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
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
  int v8 = a2 - v7;
  if (a2 <= v7) {
    goto LABEL_23;
  }
  uint64_t v9 = ((v6 + 40) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  char v10 = 8 * v9;
  if (v9 <= 3)
  {
    unsigned int v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      int v11 = *(_DWORD *)((char *)a1 + v9);
      if (!v11) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)((char *)a1 + v9);
      if (!*(unsigned __int16 *)((char *)a1 + v9)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_23:
      if ((v5 & 0x80000000) != 0) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v6 + 40) & ~v6);
      }
      unint64_t v15 = *((void *)a1 + 3);
      if (v15 >= 0xFFFFFFFF) {
        LODWORD(v15) = -1;
      }
      return (v15 + 1);
    }
  }
  int v11 = *((unsigned __int8 *)a1 + v9);
  if (!*((unsigned char *)a1 + v9)) {
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
        LODWORD(v9) = *a1;
        break;
      case 3:
        LODWORD(v9) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v9) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v9) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v9 | v14) + 1;
}

void sub_1B085DCA4(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
  size_t v10 = ((v9 + 40) & ~v9) + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
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
        goto LABEL_41;
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
LABEL_41:
      __break(1u);
      JUMPOUT(0x1B085DF10);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if ((v7 & 0x80000000) != 0)
        {
          unint64_t v18 = (unint64_t)&a1[v9 + 40] & ~v9;
          unint64_t v19 = *(void (**)(unint64_t))(v6 + 56);
          v19(v18);
        }
        else if ((a2 & 0x80000000) != 0)
        {
          *(_OWORD *)(a1 + 8) = 0u;
          *(_OWORD *)(a1 + 24) = 0u;
          *(void *)a1 = a2 ^ 0x80000000;
        }
        else
        {
          *((void *)a1 + 3) = a2 - 1;
        }
      }
      return;
  }
}

void *LayoutTextViewPlaceholder.__allocating_init(text:font:textAlignment:lineBreakMode:lineSpacing:numberOfLines:)(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = swift_allocObject();
  int v15 = (void *)v14;
  *(void *)(v14 + 104) = 0;
  unsigned int v16 = (void **)(v14 + 104);
  if (a2) {
    uint64_t v17 = a1;
  }
  else {
    uint64_t v17 = 0;
  }
  unint64_t v18 = 0xE000000000000000;
  *(_OWORD *)(v14 + 48) = 0u;
  *(_OWORD *)(v14 + 64) = 0u;
  *(unsigned char *)(v14 + 80) = 0;
  if (a2) {
    unint64_t v18 = a2;
  }
  *(void *)(v14 + 16) = v17;
  *(void *)(v14 + 24) = v18;
  swift_beginAccess();
  unint64_t v19 = *v16;
  *unsigned int v16 = a3;

  v15[4] = a4;
  long long v15[5] = a6;
  v15[11] = a7;
  v15[12] = a5;
  return v15;
}

uint64_t LayoutTextViewPlaceholder.text.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LayoutTextViewPlaceholder.text.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*LayoutTextViewPlaceholder.text.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t LayoutTextViewPlaceholder.textAlignment.getter()
{
  swift_beginAccess();
  return *(void *)(v0 + 32);
}

uint64_t LayoutTextViewPlaceholder.textAlignment.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 32) = a1;
  return result;
}

uint64_t (*LayoutTextViewPlaceholder.textAlignment.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t LayoutTextViewPlaceholder.lineSpacing.getter()
{
  swift_beginAccess();
  return *(void *)(v0 + 40);
}

uint64_t LayoutTextViewPlaceholder.lineSpacing.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 40) = a1;
  return result;
}

uint64_t (*LayoutTextViewPlaceholder.lineSpacing.modify())()
{
  return j__swift_endAccess;
}

uint64_t LayoutTextViewPlaceholder.description.getter()
{
  sub_1B086A5E8();
  uint64_t v1 = sub_1B086AA98();
  swift_bridgeObjectRelease();
  sub_1B0869E68();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B0869E68();
  swift_bridgeObjectRelease();
  sub_1B0869E68();
  uint64_t result = swift_beginAccess();
  uint64_t v3 = *(void **)(v0 + 104);
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_msgSend(v4, sel_description);
    sub_1B0869D98();

    sub_1B0869E68();
    swift_bridgeObjectRelease();
    sub_1B0869E68();
    return v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

BOOL LayoutTextViewPlaceholder.hasContent.getter()
{
  swift_beginAccess();
  unint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 16) & 0xFFFFFFFFFFFFLL;
  if ((v1 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(v1) & 0xF;
  }
  return v2 != 0;
}

double _s5JetUI25LayoutTextViewPlaceholderC12focusedFrameSo6CGRectVvg_0()
{
  swift_beginAccess();
  return *(double *)(v0 + 48);
}

uint64_t LayoutTextViewPlaceholder.frame.setter(double a1, double a2, double a3, double a4)
{
  uint64_t result = swift_beginAccess();
  v4[6] = a1;
  v4[7] = a2;
  v4[8] = a3;
  v4[9] = a4;
  return result;
}

uint64_t (*LayoutTextViewPlaceholder.frame.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t LayoutTextViewPlaceholder.isHidden.getter()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 80);
}

uint64_t LayoutTextViewPlaceholder.isHidden.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 80) = a1;
  return result;
}

uint64_t (*LayoutTextViewPlaceholder.isHidden.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t LayoutTextViewPlaceholder.numberOfLines.getter()
{
  swift_beginAccess();
  return *(void *)(v0 + 88);
}

uint64_t LayoutTextViewPlaceholder.numberOfLines.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 88) = a1;
  return result;
}

uint64_t (*LayoutTextViewPlaceholder.numberOfLines.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t LayoutTextViewPlaceholder.lineBreakMode.getter()
{
  swift_beginAccess();
  return *(void *)(v0 + 96);
}

uint64_t LayoutTextViewPlaceholder.lineBreakMode.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 96) = a1;
  return result;
}

uint64_t (*LayoutTextViewPlaceholder.lineBreakMode.modify())()
{
  return j_j__swift_endAccess;
}

void *LayoutTextViewPlaceholder.font.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 104);
  id v2 = v1;
  return v1;
}

void LayoutTextViewPlaceholder.font.setter(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 104);
  *(void *)(v1 + 104) = a1;
}

uint64_t (*LayoutTextViewPlaceholder.font.modify())()
{
  return j_j__swift_endAccess;
}

BOOL LayoutTextViewPlaceholder.isTextExtraTall.getter()
{
  swift_beginAccess();
  uint64_t v0 = qword_1EB5964B8;
  swift_bridgeObjectRetain();
  if (v0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1B0869078();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EB596390);
  sub_1B07B862C();
  sub_1B086A408();
  BOOL v3 = (v2 & 1) == 0;
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t LayoutTextViewPlaceholder.textLength.getter()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_1B0869E48();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t LayoutTextViewPlaceholder.deinit()
{
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_1B085E9C8()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  return *(void *)(v1 + 96);
}

uint64_t sub_1B085EA08(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_beginAccess();
  *(void *)(v3 + 96) = a1;
  return result;
}

void *sub_1B085EA4C()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  char v2 = *(void **)(v1 + 104);
  id v3 = v2;
  return v2;
}

void sub_1B085EA94(uint64_t a1)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  id v4 = *(void **)(v3 + 104);
  *(void *)(v3 + 104) = a1;
}

uint64_t (*sub_1B085EAE0())()
{
  return j_j__swift_endAccess;
}

BOOL sub_1B085EB38()
{
  swift_beginAccess();
  uint64_t v0 = qword_1EB5964B8;
  swift_bridgeObjectRetain();
  if (v0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1B0869078();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EB596390);
  sub_1B07B862C();
  sub_1B086A408();
  BOOL v3 = (v2 & 1) == 0;
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1B085EC08()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_1B0869E48();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B085EC6C()
{
  return LayoutTextViewPlaceholder.description.getter();
}

uint64_t sub_1B085EC94(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = *v4;
  uint64_t result = swift_beginAccess();
  v9[6] = a1;
  v9[7] = a2;
  v9[8] = a3;
  v9[9] = a4;
  return result;
}

uint64_t (*sub_1B085ECF8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B085ED50()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  return *(unsigned __int8 *)(v1 + 80);
}

uint64_t sub_1B085ED90(char a1)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v3 + 80) = a1;
  return result;
}

double sub_1B085EDD4()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  return *(double *)(v1 + 48);
}

uint64_t method lookup function for LayoutTextViewPlaceholder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LayoutTextViewPlaceholder);
}

uint64_t dispatch thunk of LayoutTextViewPlaceholder.__allocating_init(text:font:textAlignment:lineBreakMode:lineSpacing:numberOfLines:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

void __swiftcall NQMLConfiguration.init(font:)(JetUI::NQMLConfiguration *__return_ptr retstr, UIFont font)
{
  uint64_t v3 = font.super.isa;
  id v4 = (objc_class *)sub_1B08107A4();
  id v5 = (objc_class *)sub_1B0810938();
  uint64_t v6 = (objc_class *)sub_1B0810938();

  retstr->newline._countAndFlagsBits = 10;
  retstr->newline._object = (void *)0xE100000000000000;
  retstr->font.super.isa = v3;
  retstr->paragraphStyle.super.isa = v4;
  retstr->listItemBullet._countAndFlagsBits = 161644770;
  retstr->listItemBullet._object = (void *)0xA400000000000000;
  retstr->listItemStyle.super.isa = v5;
  retstr->orderedListItemBulletFormat._countAndFlagsBits = 606245;
  retstr->orderedListItemBulletFormat._object = (void *)0xE300000000000000;
  retstr->orderedListItemStyle.super.isa = v6;
  retstr->behavior = JetUI_NQMLConfiguration_Behavior_default;
}

id NSAttributedString.ju_byCollapsingNewlines.getter()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28E48]), sel_initWithAttributedString_, v0);
  id v2 = objc_msgSend(v1, sel_length);
  id v3 = objc_msgSend(v1, sel_mutableString);
  id v4 = (void *)sub_1B0869D68();
  id v5 = (void *)sub_1B0869D68();
  objc_msgSend(v3, sel_replaceOccurrencesOfString_withString_options_range_, v4, v5, 1024, 0, v2);

  return v1;
}

NSAttributedString __swiftcall NSAttributedString.init(ju_nqml:configuration:)(Swift::String ju_nqml, JetUI::NQMLConfiguration *configuration)
{
  object = ju_nqml._object;
  uint64_t countAndFlagsBits = ju_nqml._countAndFlagsBits;
  Class isa = configuration->paragraphStyle.super.isa;
  uint64_t v5 = configuration->listItemBullet._countAndFlagsBits;
  uint64_t v6 = configuration->orderedListItemBulletFormat._countAndFlagsBits;
  JetUI::NQMLConfiguration::Behavior behavior = configuration->behavior;
  uint64_t v14 = configuration->newline._countAndFlagsBits;
  long long v15 = *(_OWORD *)&configuration->newline._object;
  Class v16 = isa;
  uint64_t v17 = v5;
  long long v18 = *(_OWORD *)&configuration->listItemBullet._object;
  uint64_t v19 = v6;
  long long v20 = *(_OWORD *)&configuration->orderedListItemBulletFormat._object;
  JetUI::NQMLConfiguration::Behavior v21 = behavior;
  id v8 = objc_allocWithZone((Class)type metadata accessor for NQMLStringGenerator());
  uint64_t v9 = sub_1B085F8C4(countAndFlagsBits, (uint64_t)object, &v14);
  objc_msgSend(*(id *)&v9[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_parser], sel_parse);
  uint64_t v10 = OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_accumulator;
  id v11 = objc_msgSend(*(id *)&v9[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_accumulator], sel_mutableString);
  if (qword_1E9B3A708 != -1) {
    swift_once();
  }
  sub_1B080B034((void *)qword_1E9B3BDD8);

  id v12 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithAttributedString_, *(void *)&v9[v10]);
  return (NSAttributedString)v12;
}

id sub_1B085F0E8(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  return objc_msgSend(v2, sel_initWithInteger_, a1);
}

id sub_1B085F130()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28FD8]);
  id result = sub_1B0860D94(0x745C725C6E5C5B28, 0xEC000000292B5D20, 0);
  qword_1E9B3BDD0 = (uint64_t)result;
  return result;
}

uint64_t sub_1B085F1AC()
{
  uint64_t v0 = sub_1B0869078();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  id v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0869038();
  uint64_t v4 = sub_1B0869028();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_1E9B3BDD8 = v4;
  return result;
}

BOOL static NQMLConfiguration.Behavior.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t NQMLConfiguration.Behavior.hash(into:)()
{
  return sub_1B086A968();
}

uint64_t NQMLConfiguration.Behavior.hashValue.getter()
{
  return sub_1B086A998();
}

uint64_t NQMLConfiguration.newline.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

id NQMLConfiguration.font.getter()
{
  return *(id *)(v0 + 16);
}

id NQMLConfiguration.paragraphStyle.getter()
{
  return *(id *)(v0 + 24);
}

uint64_t NQMLConfiguration.listItemBullet.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

id NQMLConfiguration.listItemStyle.getter()
{
  return *(id *)(v0 + 48);
}

uint64_t NQMLConfiguration.orderedListItemBulletFormat.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

id NQMLConfiguration.orderedListItemStyle.getter()
{
  return *(id *)(v0 + 72);
}

void NQMLConfiguration.behavior.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 80);
}

void __swiftcall NQMLConfiguration.withBehavior(_:)(JetUI::NQMLConfiguration *__return_ptr retstr, JetUI::NQMLConfiguration::Behavior a2)
{
  JetUI::NQMLConfiguration::Behavior v3 = *(unsigned char *)a2;
  uint64_t v4 = (void *)v2[1];
  uint64_t v5 = (objc_class *)v2[2];
  uint64_t v6 = (objc_class *)v2[3];
  uint64_t v7 = v2[4];
  id v8 = (void *)v2[5];
  uint64_t v10 = (objc_class *)v2[6];
  uint64_t v9 = v2[7];
  id v11 = (void *)v2[8];
  Class v16 = (objc_class *)v2[9];
  retstr->newline._uint64_t countAndFlagsBits = *v2;
  retstr->newline._object = v4;
  retstr->font.super.Class isa = v5;
  retstr->paragraphStyle.super.Class isa = v6;
  retstr->listItemBullet._uint64_t countAndFlagsBits = v7;
  retstr->listItemBullet._object = v8;
  retstr->listItemStyle.super.Class isa = v10;
  retstr->orderedListItemBulletFormat._uint64_t countAndFlagsBits = v9;
  retstr->orderedListItemBulletFormat._object = v11;
  retstr->orderedListItemStyle.super.Class isa = v16;
  retstr->JetUI::NQMLConfiguration::Behavior behavior = v3;
  swift_bridgeObjectRetain();
  id v12 = v5;
  int v13 = v6;
  swift_bridgeObjectRetain();
  uint64_t v14 = v10;
  swift_bridgeObjectRetain();

  long long v15 = v16;
}

uint64_t sub_1B085F460()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1B08691E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = &v22[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v6);
  id v8 = &v22[-v7];
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28EE0]), sel_init);
  if (qword_1EB595980 != -1) {
    swift_once();
  }
  sub_1B086A318();
  sub_1B0849D30((uint64_t)v5);
  uint64_t v10 = *(void (**)(unsigned char *, uint64_t))(v3 + 8);
  v10(v8, v2);
  id v11 = (void *)sub_1B08691C8();
  v10(v5, v2);
  objc_msgSend(v9, sel_setLocale_, v11);

  objc_msgSend(v9, sel_setNumberStyle_, 1);
  id v12 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, *(void *)(v1 + 16));
  id v13 = objc_msgSend(v9, sel_stringFromNumber_, v12);

  if (!v13)
  {
    uint64_t v14 = self;
    id v15 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, *(void *)(v1 + 16));
    id v13 = objc_msgSend(v14, sel_localizedStringFromNumber_numberStyle_, v15, 1);
  }
  uint64_t v16 = sub_1B0869D98();
  uint64_t v18 = v17;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3ACB8);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1B086C130;
  *(void *)(v19 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v19 + 64) = sub_1B07DB6C0();
  *(void *)(v19 + 32) = v16;
  *(void *)(v19 + 40) = v18;
  uint64_t v20 = sub_1B0869DB8();

  return v20;
}

uint64_t sub_1B085F744()
{
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_1B085F77C()
{
  uint64_t v0 = sub_1B0869BE8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1B0869C18();
  __swift_allocate_value_buffer(v4, qword_1E9B3BDE0);
  __swift_project_value_buffer(v4, (uint64_t)qword_1E9B3BDE0);
  if (qword_1E9B3A698 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_1E9B460F0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_1B0869C08();
}

char *sub_1B085F8C4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = *a3;
  uint64_t v6 = a3[4];
  uint64_t v18 = a3[3];
  uint64_t v19 = a3[7];
  uint64_t v7 = *((unsigned __int8 *)a3 + 80);
  *(void *)&v3[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_orderedListTracker] = 0;
  uint64_t v8 = OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_accumulator;
  id v9 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
  uint64_t v10 = v3;
  *(void *)&v3[v8] = objc_msgSend(v9, sel_init);
  *(void *)&v10[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_attributeStack] = MEMORY[0x1E4FBC860];
  v10[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_didParseEverything] = 1;
  uint64_t v11 = OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_foregroundColor;
  *(void *)&v10[v11] = objc_msgSend(self, sel_systemGrayColor);
  id v12 = objc_allocWithZone((Class)JUNQMLParser);
  id v13 = (void *)sub_1B0869D68();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v12, sel_initWithString_behavior_, v13, v7);

  *(void *)&v10[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_parser] = v14;
  id v15 = &v10[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration];
  *(void *)id v15 = v5;
  *(_OWORD *)(v15 + 8) = *(_OWORD *)(a3 + 1);
  *((void *)v15 + 3) = v18;
  *((void *)v15 + 4) = v6;
  *(_OWORD *)(v15 + 40) = *(_OWORD *)(a3 + 5);
  *((void *)v15 + 7) = v19;
  *((_OWORD *)v15 + 4) = *((_OWORD *)a3 + 4);
  v15[80] = v7;

  v20.receiver = v10;
  v20.super_class = (Class)type metadata accessor for NQMLStringGenerator();
  uint64_t v16 = (char *)objc_msgSendSuper2(&v20, sel_init);
  objc_msgSend(*(id *)&v16[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_parser], sel_setDelegate_, v16);
  return v16;
}

uint64_t sub_1B085FA88(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_attributeStack);
  swift_beginAccess();
  uint64_t v4 = (void *)*v3;
  uint64_t v5 = *(void *)(*v3 + 16);
  if (v5)
  {
    uint64_t v6 = (void *)v4[v5 + 3];
    uint64_t v39 = v3;
    uint64_t v40 = a1 + 64;
    uint64_t v7 = 1 << *(unsigned char *)(a1 + 32);
    uint64_t v8 = -1;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    unint64_t v9 = v8 & *(void *)(a1 + 64);
    uint64_t v4 = (void *)v42 + 1;
    int64_t v41 = (unint64_t)(v7 + 63) >> 6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    int64_t v10 = 0;
    while (!v9)
    {
      int64_t v17 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_50;
      }
      if (v17 < v41)
      {
        unint64_t v18 = *(void *)(v40 + 8 * v17);
        if (v18) {
          goto LABEL_13;
        }
        int64_t v19 = v10 + 2;
        ++v10;
        if (v17 + 1 < v41)
        {
          unint64_t v18 = *(void *)(v40 + 8 * v19);
          if (v18) {
            goto LABEL_16;
          }
          int64_t v10 = v17 + 1;
          if (v17 + 2 < v41)
          {
            unint64_t v18 = *(void *)(v40 + 8 * (v17 + 2));
            if (v18)
            {
              v17 += 2;
              goto LABEL_13;
            }
            int64_t v19 = v17 + 3;
            int64_t v10 = v17 + 2;
            if (v17 + 3 < v41)
            {
              unint64_t v18 = *(void *)(v40 + 8 * v19);
              if (!v18)
              {
                while (1)
                {
                  int64_t v17 = v19 + 1;
                  if (__OFADD__(v19, 1)) {
                    break;
                  }
                  if (v17 >= v41)
                  {
                    int64_t v10 = v41 - 1;
                    goto LABEL_27;
                  }
                  unint64_t v18 = *(void *)(v40 + 8 * v17);
                  ++v19;
                  if (v18) {
                    goto LABEL_13;
                  }
                }
                __break(1u);
LABEL_55:
                type metadata accessor for Key(0);
                uint64_t result = sub_1B086A8F8();
                __break(1u);
                return result;
              }
LABEL_16:
              int64_t v17 = v19;
LABEL_13:
              unint64_t v9 = (v18 - 1) & v18;
              unint64_t v13 = __clz(__rbit64(v18)) + (v17 << 6);
              int64_t v10 = v17;
LABEL_9:
              uint64_t v14 = *(void *)(a1 + 56);
              *(void *)&v42[0] = *(void *)(*(void *)(a1 + 48) + 8 * v13);
              id v15 = *(void **)&v42[0];
              sub_1B07CBDEC(v14 + 32 * v13, (uint64_t)v42 + 8);
              id v16 = v15;
              goto LABEL_28;
            }
          }
        }
      }
LABEL_27:
      unint64_t v9 = 0;
      uint64_t v43 = 0;
      memset(v42, 0, sizeof(v42));
LABEL_28:
      sub_1B086148C((uint64_t)v42, (uint64_t)&v44);
      objc_super v20 = v44;
      if (!v44)
      {
        swift_release();
        uint64_t v3 = v39;
        uint64_t v4 = (void *)*v39;
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        *uint64_t v39 = (uint64_t)v4;
        if (result) {
          goto LABEL_41;
        }
LABEL_51:
        uint64_t result = (uint64_t)sub_1B07CF8D0(0, v4[2] + 1, 1, v4);
        uint64_t v4 = (void *)result;
        *uint64_t v3 = result;
LABEL_41:
        unint64_t v36 = v4[2];
        unint64_t v35 = v4[3];
        unint64_t v37 = v36 + 1;
        if (v36 < v35 >> 1) {
          goto LABEL_47;
        }
        uint64_t result = (uint64_t)sub_1B07CF8D0((void *)(v35 > 1), v36 + 1, 1, v4);
        uint64_t v4 = (void *)result;
LABEL_53:
        *uint64_t v3 = (uint64_t)v4;
        goto LABEL_47;
      }
      sub_1B07BFE44(&v45, v42);
      uint64_t v3 = v20;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v23 = sub_1B07E45BC((uint64_t)v3);
      uint64_t v24 = v6[2];
      BOOL v25 = (v22 & 1) == 0;
      uint64_t v26 = v24 + v25;
      if (__OFADD__(v24, v25))
      {
        __break(1u);
LABEL_49:
        __break(1u);
LABEL_50:
        __break(1u);
        goto LABEL_51;
      }
      char v27 = v22;
      if (v6[3] >= v26)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          if (v22) {
            goto LABEL_5;
          }
        }
        else
        {
          sub_1B07CB09C();
          if (v27) {
            goto LABEL_5;
          }
        }
      }
      else
      {
        sub_1B07C8B70(v26, isUniquelyReferenced_nonNull_native);
        unint64_t v28 = sub_1B07E45BC((uint64_t)v3);
        if ((v27 & 1) != (v29 & 1)) {
          goto LABEL_55;
        }
        unint64_t v23 = v28;
        if (v27)
        {
LABEL_5:
          uint64_t v11 = (_OWORD *)(v6[7] + 32 * v23);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
          sub_1B07BFE44(v42, v11);
          goto LABEL_6;
        }
      }
      v6[(v23 >> 6) + 8] |= 1 << v23;
      *(void *)(v6[6] + 8 * v23) = v3;
      sub_1B07BFE44(v42, (_OWORD *)(v6[7] + 32 * v23));
      uint64_t v30 = v6[2];
      BOOL v31 = __OFADD__(v30, 1);
      uint64_t v32 = v30 + 1;
      if (v31) {
        goto LABEL_49;
      }
      long long v6[2] = v32;
      double v33 = v3;
LABEL_6:

      swift_bridgeObjectRelease();
    }
    unint64_t v12 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v13 = v12 | (v10 << 6);
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v3 = (uint64_t)v4;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_1B07CF8D0(0, v4[2] + 1, 1, v4);
    uint64_t v4 = (void *)result;
    *uint64_t v3 = result;
  }
  unint64_t v36 = v4[2];
  unint64_t v38 = v4[3];
  unint64_t v37 = v36 + 1;
  if (v36 >= v38 >> 1)
  {
    uint64_t result = (uint64_t)sub_1B07CF8D0((void *)(v38 > 1), v36 + 1, 1, v4);
    uint64_t v4 = (void *)result;
    uint64_t v6 = (void *)a1;
    goto LABEL_53;
  }
  uint64_t v6 = (void *)a1;
LABEL_47:
  v4[2] = v37;
  v4[v36 + 4] = v6;
  return result;
}

void sub_1B085FEDC()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_accumulator);
  uint64_t v2 = v0 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_attributeStack;
  swift_beginAccess();
  if (*(void *)(*(void *)v2 + 16))
  {
    id v3 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
    id v4 = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v5 = (void *)sub_1B0869D68();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_1B086286C((unint64_t *)&qword_1EB595E20, type metadata accessor for Key);
    uint64_t v6 = (void *)sub_1B0869CA8();
    swift_bridgeObjectRelease();
    id v7 = objc_msgSend(v3, sel_initWithString_attributes_, v5, v6);

    objc_msgSend(v4, sel_appendAttributedString_, v7);
  }
  else
  {
    __break(1u);
  }
}

id sub_1B0860044()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_attributeStack;
  swift_beginAccess();
  uint64_t v3 = *(void *)(*(void *)v2 + 16);
  if (!v3 || (uint64_t v4 = *(void *)(*(void *)v2 + 8 * v3 + 24), !*(void *)(v4 + 16)))
  {
    long long v12 = 0u;
    long long v13 = 0u;
LABEL_10:
    sub_1B07B86F8((uint64_t)&v12);
    goto LABEL_11;
  }
  uint64_t v5 = (void *)*MEMORY[0x1E4FB06F8];
  swift_bridgeObjectRetain();
  id v6 = v5;
  unint64_t v7 = sub_1B07E45BC((uint64_t)v6);
  if (v8)
  {
    sub_1B07CBDEC(*(void *)(v4 + 56) + 32 * v7, (uint64_t)&v12);
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
  }

  swift_bridgeObjectRelease();
  if (!*((void *)&v13 + 1)) {
    goto LABEL_10;
  }
  sub_1B07C7B80(0, (unint64_t *)&qword_1EB595950);
  if (swift_dynamicCast()) {
    return (id)v11;
  }
LABEL_11:
  int64_t v10 = *(void **)(v1
                 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration
                 + 16);

  return v10;
}

id sub_1B086018C(int a1)
{
  uint64_t v2 = sub_1B0869C18();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = sub_1B0860044();
  id v7 = objc_msgSend(v6, sel_fontDescriptor);
  uint64_t v8 = objc_msgSend(v7, sel_symbolicTraits) | a1;
  id v9 = objc_msgSend(v7, sel_fontDescriptorWithSymbolicTraits_, v8);
  if (v9)
  {
    int64_t v10 = v9;
    objc_msgSend(v6, sel_pointSize);
    id v12 = objc_msgSend(self, sel_fontWithDescriptor_size_, v10, v11);

    return v12;
  }
  else
  {
    if (qword_1E9B3A710 != -1) {
      swift_once();
    }
    uint64_t v14 = __swift_project_value_buffer(v2, (uint64_t)qword_1E9B3BDE0);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v14, v2);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3AA70);
    sub_1B08696C8();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B086D510;
    sub_1B0869618();
    uint64_t v18 = sub_1B07C7B80(0, (unint64_t *)&qword_1EB595950);
    v17[0] = v6;
    id v16 = v6;
    sub_1B08696A8();
    sub_1B07B86F8((uint64_t)v17);
    sub_1B0869618();
    uint64_t v18 = MEMORY[0x1E4FBC4C0];
    LODWORD(v17[0]) = v8;
    sub_1B08696A8();
    sub_1B07B86F8((uint64_t)v17);
    sub_1B0869AB8();
    swift_bridgeObjectRelease();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return v16;
  }
}

id sub_1B08604C4()
{
  id v0 = sub_1B086018C(2);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3BEA0);
  initeCGFloat d = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B086D960;
  uint64_t v2 = (void *)*MEMORY[0x1E4FB0968];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB0968];
  *(void *)(inited + 40) = 6;
  uint64_t v3 = (void *)*MEMORY[0x1E4FB0960];
  *(void *)(inited + 48) = *MEMORY[0x1E4FB0960];
  *(void *)(inited + 56) = 0;
  id v4 = v2;
  id v5 = v3;
  unint64_t v6 = sub_1B07D6428(inited);
  id v7 = objc_msgSend(v0, sel_fontDescriptor);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5964B0);
  uint64_t v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_1B086C130;
  id v9 = (void *)*MEMORY[0x1E4FB0910];
  *(void *)(v8 + 32) = *MEMORY[0x1E4FB0910];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BEB0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1B086C130;
  *(void *)(v10 + 32) = v6;
  *(void *)(v8 + 64) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3BEB8);
  *(void *)(v8 + 40) = v10;
  id v11 = v9;
  sub_1B07C00CC(v8);
  type metadata accessor for AttributeName(0);
  sub_1B086286C((unint64_t *)&qword_1EB596480, type metadata accessor for AttributeName);
  id v12 = (void *)sub_1B0869CA8();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v7, sel_fontDescriptorByAddingAttributes_, v12);

  objc_msgSend(v0, sel_pointSize);
  id v15 = objc_msgSend(self, sel_fontWithDescriptor_size_, v13, v14);

  return v15;
}

id sub_1B0860C84()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NQMLStringGenerator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1B0860D94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[1] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = (void *)sub_1B0869D68();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithPattern_options_error_, v5, a3, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_1B0869088();

    swift_willThrow();
  }
  return v6;
}

char *sub_1B0860E70(uint64_t a1)
{
  return sub_1B07CE86C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_1B0860E84(uint64_t a1)
{
  return sub_1B07CEE58(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_1B0860E98(void *a1)
{
  return sub_1B07CEF74(0, a1[2], 0, a1);
}

char *sub_1B0860EAC(uint64_t a1)
{
  return sub_1B07CF37C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_1B0860EC0(void *a1)
{
  return sub_1B07CF574(0, a1[2], 0, a1);
}

char *sub_1B0860ED4(uint64_t a1)
{
  return sub_1B07CF7B8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_1B0860EE8(void *a1)
{
  return sub_1B07CF8D0(0, a1[2], 0, a1);
}

uint64_t sub_1B0860EFC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
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

uint64_t sub_1B0860F5C()
{
  uint64_t v1 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result)
  {
    uint64_t v3 = v1[2];
    if (v3)
    {
LABEL_3:
      uint64_t v4 = v3 - 1;
      uint64_t result = v1[v4 + 4];
      v1[2] = v4;
      *id v0 = v1;
      return result;
    }
  }
  else
  {
    uint64_t result = (uint64_t)sub_1B0860EE8(v1);
    uint64_t v1 = (void *)result;
    uint64_t v3 = *(void *)(result + 16);
    if (v3) {
      goto LABEL_3;
    }
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for NQMLStringGenerator()
{
  return self;
}

unint64_t sub_1B0860FE4()
{
  unint64_t result = qword_1E9B3BE08;
  if (!qword_1E9B3BE08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B3BE08);
  }
  return result;
}

void destroy for NQMLConfiguration(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_super v2 = *(void **)(a1 + 72);
}

uint64_t initializeWithCopy for NQMLConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void **)(a2 + 16);
  id v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  id v8 = *(void **)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v7;
  id v9 = *(void **)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v9;
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  swift_bridgeObjectRetain();
  id v10 = v4;
  id v11 = v5;
  swift_bridgeObjectRetain();
  id v12 = v8;
  swift_bridgeObjectRetain();
  id v13 = v9;
  return a1;
}

uint64_t assignWithCopy for NQMLConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a2 + 16);
  id v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v4;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 24);
  id v8 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v7;
  id v9 = v7;

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v10 = *(void **)(a2 + 48);
  id v11 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v10;
  id v12 = v10;

  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v13 = *(void **)(a2 + 72);
  double v14 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = v13;
  id v15 = v13;

  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  return a1;
}

uint64_t assignWithTake for NQMLConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  id v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  id v6 = *(void **)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);

  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void **)(a1 + 72);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);

  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for NQMLConfiguration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 81)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NQMLConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 80) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 81) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NQMLConfiguration()
{
  return &type metadata for NQMLConfiguration;
}

unsigned char *storeEnumTagSinglePayload for NQMLConfiguration.Behavior(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B0861430);
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

ValueMetadata *type metadata accessor for NQMLConfiguration.Behavior()
{
  return &type metadata for NQMLConfiguration.Behavior;
}

uint64_t type metadata accessor for NQMLOrderedListTracker()
{
  return self;
}

uint64_t sub_1B086148C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BEC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_1B08614F4(uint64_t a1, void *a2)
{
  v35[0] = a2;
  uint64_t v3 = sub_1B0869C18();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  unsigned int v6 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16)) {
    goto LABEL_24;
  }
  uint64_t v7 = @"font-name";
  uint64_t v8 = sub_1B07BFEE4();
  if (v9)
  {
    id v10 = (uint64_t *)(*(void *)(a1 + 56) + 16 * v8);
    uint64_t v12 = *v10;
    uint64_t v11 = v10[1];
    swift_bridgeObjectRetain();
  }
  else
  {

    uint64_t v7 = (__CFString *)objc_msgSend(v35[0], sel_fontName);
    *(double *)&uint64_t v12 = COERCE_DOUBLE(sub_1B0869D98());
    uint64_t v11 = v13;
  }

  if (!*(void *)(a1 + 16)) {
    goto LABEL_18;
  }
  double v14 = @"font-size";
  uint64_t v15 = sub_1B07BFEE4();
  if ((v16 & 1) == 0)
  {

    goto LABEL_18;
  }
  int64_t v17 = (double *)(*(void *)(a1 + 56) + 16 * v15);
  double v19 = *v17;
  uint64_t v18 = *((void *)v17 + 1);
  swift_bridgeObjectRetain();

  double v37 = 0.0;
  MEMORY[0x1F4188790](v20);
  v35[-2] = &v37;
  if ((v18 & 0x1000000000000000) != 0 || !(v18 & 0x2000000000000000 | *(void *)&v19 & 0x1000000000000000))
  {
    sub_1B086A5B8();
    swift_bridgeObjectRelease();
    if ((v36 & 1) == 0) {
      goto LABEL_18;
    }
  }
  else
  {
    MEMORY[0x1F4188790](v21);
    v35[-2] = sub_1B08628B4;
    v35[-1] = v22;
    if ((v18 & 0x2000000000000000) == 0)
    {
      if ((*(void *)&v19 & 0x1000000000000000) != 0)
      {
        uint64_t v23 = (v18 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v24 = *(void *)&v19 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v23 = sub_1B086A648();
      }
      char v25 = sub_1B0860EFC(v23, v24, (void (*)(uint64_t *__return_ptr))sub_1B0862924);
      swift_bridgeObjectRelease();
      if (v25) {
        goto LABEL_13;
      }
LABEL_18:
      objc_msgSend(v35[0], sel_pointSize, v35[0]);
      double v26 = v27;
      goto LABEL_19;
    }
    double v38 = v19;
    uint64_t v39 = v18 & 0xFFFFFFFFFFFFFFLL;
    if (LOBYTE(v19) <= 0x20u && ((1 << SLOBYTE(v19)) & 0x100003E01) != 0
      || (double v33 = (unsigned __int8 *)_swift_stdlib_strtod_clocale()) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_18;
    }
    int v34 = *v33;
    swift_bridgeObjectRelease();
    if (v34) {
      goto LABEL_18;
    }
  }
LABEL_13:
  double v26 = v37;
LABEL_19:
  swift_bridgeObjectRetain();
  unint64_t v28 = (void *)sub_1B0869D68();
  swift_bridgeObjectRelease();
  id v29 = objc_msgSend(self, sel_fontWithName_size_, v28, v26);

  if (v29)
  {
    swift_bridgeObjectRelease();
    return v29;
  }
  if (qword_1E9B3A710 != -1) {
    swift_once();
  }
  uint64_t v31 = __swift_project_value_buffer(v3, (uint64_t)qword_1E9B3BDE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v31, v3);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3AA70);
  sub_1B08696C8();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B086D510;
  sub_1B0869618();
  uint64_t v40 = MEMORY[0x1E4FBB1A0];
  double v38 = *(double *)&v12;
  uint64_t v39 = v11;
  sub_1B08696A8();
  sub_1B07B86F8((uint64_t)&v38);
  sub_1B0869618();
  uint64_t v40 = MEMORY[0x1E4FBC958];
  double v38 = v26;
  sub_1B08696A8();
  sub_1B07B86F8((uint64_t)&v38);
  sub_1B0869AD8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
LABEL_24:
  id v32 = v35[0];

  return v32;
}

uint64_t sub_1B0861A58()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3BED0);
  initeCGFloat d = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B086D960;
  unint64_t v2 = (void *)*MEMORY[0x1E4FB0738];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB0738];
  uint64_t v3 = v0 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration;
  uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration + 24);
  uint64_t v5 = sub_1B07C7B80(0, (unint64_t *)&unk_1E9B3BEE0);
  *(void *)(inited + 40) = v4;
  unsigned int v6 = (void *)*MEMORY[0x1E4FB06F8];
  *(void *)(inited + 64) = v5;
  *(void *)(inited + 72) = v6;
  uint64_t v7 = *(void **)(v3 + 16);
  *(void *)(inited + 104) = sub_1B07C7B80(0, (unint64_t *)&qword_1EB595950);
  *(void *)(inited + 80) = v7;
  id v8 = v2;
  id v9 = v4;
  id v10 = v6;
  id v11 = v7;
  unint64_t v12 = sub_1B07D6098(inited);
  sub_1B085FA88(v12);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B0861B48()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1B0869C18();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1E9B3A710 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_1E9B3BDE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3AA70);
  sub_1B08696C8();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B086D960;
  sub_1B0869618();
  swift_getErrorValue();
  uint64_t v7 = v11;
  uint64_t v8 = v12;
  void v13[3] = v12;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v13);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(boxed_opaque_existential_0, v7, v8);
  sub_1B08696B8();
  sub_1B07B86F8((uint64_t)v13);
  sub_1B0869AD8();
  swift_bridgeObjectRelease();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_didParseEverything) = 0;
  return result;
}

id sub_1B0861DB4(uint64_t a1, uint64_t a2)
{
  id result = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_accumulator), sel_beginEditing);
  switch(a1)
  {
    case 0:
      id v6 = sub_1B086018C(2);
      id v7 = sub_1B08614F4(a2, v6);

      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3BED0);
      initeCGFloat d = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1B086D960;
      id v9 = (void *)*MEMORY[0x1E4FB06F8];
      *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
      uint64_t v10 = sub_1B07C7B80(0, (unint64_t *)&qword_1EB595950);
      *(void *)(inited + 40) = v7;
      uint64_t v11 = (void *)*MEMORY[0x1E4FB0700];
      *(void *)(inited + 64) = v10;
      *(void *)(inited + 72) = v11;
      id v12 = *(id *)(v2 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_foregroundColor);
      *(void *)(inited + 104) = sub_1B07C7B80(0, (unint64_t *)&qword_1E9B3B368);
      *(void *)(inited + 80) = v12;
      id v13 = v9;
      id v14 = v7;
      goto LABEL_9;
    case 1:
      id v15 = sub_1B086018C(1);
      id v12 = sub_1B08614F4(a2, v15);

      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3BED0);
      initeCGFloat d = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1B086C130;
      uint64_t v11 = (void *)*MEMORY[0x1E4FB06F8];
      *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
      *(void *)(inited + 64) = sub_1B07C7B80(0, (unint64_t *)&qword_1EB595950);
      *(void *)(inited + 40) = v12;
      goto LABEL_8;
    case 2:
      id v16 = sub_1B0860044();
      id v12 = sub_1B08614F4(a2, v16);

      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3BED0);
      uint64_t v17 = swift_initStackObject();
      initeCGFloat d = v17;
      long long v18 = xmmword_1B086D960;
      double v19 = (void **)MEMORY[0x1E4FB0808];
      goto LABEL_6;
    case 3:
      id v20 = sub_1B0860044();
      id v12 = sub_1B08614F4(a2, v20);

      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3BED0);
      uint64_t v17 = swift_initStackObject();
      initeCGFloat d = v17;
      long long v18 = xmmword_1B086D960;
      double v19 = (void **)MEMORY[0x1E4FB0768];
LABEL_6:
      *(_OWORD *)(v17 + 16) = v18;
      uint64_t v21 = *v19;
      *(void *)(v17 + 32) = *v19;
      id v22 = objc_allocWithZone(NSNumber);
      id v23 = v21;
      id v24 = objc_msgSend(v22, sel_initWithInteger_, 1);
      uint64_t v25 = sub_1B07C7B80(0, (unint64_t *)&unk_1E9B3BEF0);
      *(void *)(inited + 40) = v24;
      uint64_t v11 = (void *)*MEMORY[0x1E4FB06F8];
      *(void *)(inited + 64) = v25;
      *(void *)(inited + 72) = v11;
      *(void *)(inited + 104) = sub_1B07C7B80(0, (unint64_t *)&qword_1EB595950);
      *(void *)(inited + 80) = v12;
      goto LABEL_8;
    case 4:
      id v26 = sub_1B0860044();
      id v12 = sub_1B08614F4(a2, v26);

      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3BED0);
      initeCGFloat d = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1B086D960;
      double v27 = (void *)*MEMORY[0x1E4FB0738];
      *(void *)(inited + 32) = *MEMORY[0x1E4FB0738];
      unint64_t v28 = *(void **)(v2
                     + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration
                     + 24);
      uint64_t v29 = sub_1B07C7B80(0, (unint64_t *)&unk_1E9B3BEE0);
      *(void *)(inited + 40) = v28;
      uint64_t v11 = (void *)*MEMORY[0x1E4FB06F8];
      *(void *)(inited + 64) = v29;
      *(void *)(inited + 72) = v11;
      *(void *)(inited + 104) = sub_1B07C7B80(0, (unint64_t *)&qword_1EB595950);
      *(void *)(inited + 80) = v12;
      id v30 = v27;
      id v31 = v28;
LABEL_8:
      id v14 = v12;
LABEL_9:
      id v32 = v11;
      id v33 = v12;
      unint64_t v34 = sub_1B07D6098(inited);
      sub_1B085FA88(v34);

      id result = (id)swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1B086216C(uint64_t a1)
{
  if (a1 == 4) {
    sub_1B085FEDC();
  }
  uint64_t v2 = v1 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_attributeStack;
  swift_beginAccess();
  uint64_t v3 = *(void **)v2;
  if (!*(void *)(*(void *)v2 + 16))
  {
    __break(1u);
LABEL_8:
    uint64_t result = (uint64_t)sub_1B0860EE8(v3);
    uint64_t v3 = (void *)result;
    uint64_t v5 = *(void *)(result + 16);
    if (v5) {
      goto LABEL_6;
    }
    goto LABEL_9;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v5 = v3[2];
  if (v5)
  {
LABEL_6:
    v3[2] = v5 - 1;
    *(void *)uint64_t v2 = v3;
    swift_bridgeObjectRelease();
    return (uint64_t)objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_accumulator), sel_endEditing);
  }
LABEL_9:
  __break(1u);
  return result;
}

char *sub_1B0862240()
{
  id v1 = objc_allocWithZone(MEMORY[0x1E4F28E78]);
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_1B0869D68();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v1, sel_initWithString_, v2);

  id v4 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_accumulator), sel_mutableString);
  if (qword_1E9B3A708 != -1) {
    swift_once();
  }
  uint64_t v5 = (void *)qword_1E9B3BDD8;
  if ((uint64_t)objc_msgSend(v4, sel_length) < 1)
  {
  }
  else
  {
    uint64_t result = (char *)objc_msgSend(v4, sel_length);
    if (__OFSUB__(result, 1))
    {
      __break(1u);
      return result;
    }
    unsigned __int8 v7 = objc_msgSend(v5, sel_characterIsMember_, objc_msgSend(v4, sel_characterAtIndex_, result - 1));

    if (v7) {
      sub_1B080B180((void *)qword_1E9B3BDD8);
    }
  }
  if (qword_1E9B3A700 != -1) {
    swift_once();
  }
  uint64_t v8 = (void *)qword_1E9B3BDD0;
  if (qword_1E9B3BDD0)
  {
    id v9 = objc_msgSend(v3, sel_length);
    uint64_t v10 = (void *)sub_1B0869D68();
    objc_msgSend(v8, sel_replaceMatchesInString_options_range_withTemplate_, v3, 0, 0, v9, v10);
  }
  sub_1B0869D98();
  sub_1B085FEDC();

  return (char *)swift_bridgeObjectRelease();
}

id sub_1B0862444(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_accumulator), sel_beginEditing);
  if (a1 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3BED0);
    initeCGFloat d = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B086C130;
    id v9 = (void *)*MEMORY[0x1E4FB0738];
    *(void *)(inited + 32) = *MEMORY[0x1E4FB0738];
    uint64_t v10 = *(void **)(v1
                   + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration
                   + 48);
  }
  else
  {
    if (a1) {
      return result;
    }
    uint64_t v4 = v1 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration;
    uint64_t v6 = *(void *)(v1
                   + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration
                   + 56);
    uint64_t v5 = *(void *)(v1
                   + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration
                   + 64);
    type metadata accessor for NQMLOrderedListTracker();
    unsigned __int8 v7 = (void *)swift_allocObject();
    long long v7[2] = 1;
    void v7[3] = v6;
    v7[4] = v5;
    *(void *)(v1 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_orderedListTracker) = v7;
    swift_bridgeObjectRetain();
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3BED0);
    initeCGFloat d = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B086C130;
    id v9 = (void *)*MEMORY[0x1E4FB0738];
    *(void *)(inited + 32) = *MEMORY[0x1E4FB0738];
    uint64_t v10 = *(void **)(v4 + 72);
  }
  *(void *)(inited + 64) = sub_1B07C7B80(0, (unint64_t *)&unk_1E9B3BEE0);
  *(void *)(inited + 40) = v10;
  id v11 = v9;
  id v12 = v10;
  unint64_t v13 = sub_1B07D6098(inited);
  sub_1B085FA88(v13);
  return (id)swift_bridgeObjectRelease();
}

void sub_1B08625A8()
{
  uint64_t v1 = v0;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_orderedListTracker))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3BED0);
    initeCGFloat d = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B086D960;
    id v3 = (void *)*MEMORY[0x1E4FB06F8];
    *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
    id v4 = v3;
    swift_retain();
    id v5 = sub_1B08604C4();
    uint64_t v6 = sub_1B07C7B80(0, (unint64_t *)&qword_1EB595950);
    *(void *)(inited + 40) = v5;
    unsigned __int8 v7 = (void *)*MEMORY[0x1E4FB0700];
    *(void *)(inited + 64) = v6;
    *(void *)(inited + 72) = v7;
    uint64_t v8 = *(void **)(v1 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_foregroundColor);
    *(void *)(inited + 104) = sub_1B07C7B80(0, (unint64_t *)&qword_1E9B3B368);
    *(void *)(inited + 80) = v8;
    id v9 = v7;
    id v10 = v8;
    unint64_t v11 = sub_1B07D6098(inited);
    sub_1B085FA88(v11);
    swift_bridgeObjectRelease();
    sub_1B085F460();
    sub_1B085FEDC();
    swift_bridgeObjectRelease();
    uint64_t v12 = v1 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_attributeStack;
    swift_beginAccess();
    unint64_t v13 = *(void **)v12;
    if (*(void *)(*(void *)v12 + 16))
    {
      if (swift_isUniquelyReferenced_nonNull_native())
      {
        uint64_t v14 = v13[2];
        if (v14)
        {
LABEL_5:
          _OWORD v13[2] = v14 - 1;
          *(void *)uint64_t v12 = v13;
          swift_release();
          swift_bridgeObjectRelease();
          return;
        }
        goto LABEL_11;
      }
    }
    else
    {
      __break(1u);
    }
    unint64_t v13 = sub_1B0860EE8(v13);
    uint64_t v14 = v13[2];
    if (v14) {
      goto LABEL_5;
    }
LABEL_11:
    __break(1u);
    return;
  }

  sub_1B085FEDC();
}

uint64_t sub_1B086278C()
{
  sub_1B085FEDC();
  uint64_t v1 = v0 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_attributeStack;
  swift_beginAccess();
  uint64_t v2 = *(void **)v1;
  if (!*(void *)(*(void *)v1 + 16))
  {
    __break(1u);
LABEL_6:
    uint64_t result = (uint64_t)sub_1B0860EE8(v2);
    uint64_t v2 = (void *)result;
    uint64_t v4 = *(void *)(result + 16);
    if (v4) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v4 = v2[2];
  if (v4)
  {
LABEL_4:
    v2[2] = v4 - 1;
    *(void *)uint64_t v1 = v2;
    swift_bridgeObjectRelease();
    objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_accumulator), sel_endEditing);
    *(void *)(v0 + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_orderedListTracker) = 0;
    return swift_release();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_1B086286C(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *sub_1B08628B4@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  BOOL v7 = v6 && (result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

void *sub_1B0862924@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

id DynamicTextAppearance.init()@<X0>(uint64_t *a1@<X8>)
{
  BOOL v4 = (void *)*MEMORY[0x1E4FB28C8];
  a1[3] = (uint64_t)&type metadata for FontSource;
  a1[4] = (uint64_t)&protocol witness table for FontSource;
  uint64_t v2 = swift_allocObject();
  *a1 = v2;
  *(void *)(v2 + 16) = v4;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(unsigned char *)(v2 + 56) = 0;
  a1[5] = 4;
  a1[6] = 0;
  a1[7] = 0;
  a1[8] = 0;

  return v4;
}

uint64_t sub_1B0862A00()
{
  sub_1B07BF284(*(id *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(unsigned char *)(v0 + 56));

  return MEMORY[0x1F4186498](v0, 57, 7);
}

uint64_t DynamicTextAppearance.withNumberOfLines(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1B07EA080(v2, a2);
  *(void *)(a2 + 56) = a1;
  return result;
}

uint64_t DynamicTextAppearance.withLineBreakMode(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1B07EA080(v2, a2);
  *(void *)(a2 + 48) = a1;
  return result;
}

__n128 DynamicTextAppearance.textAppearance(compatibleWith:)@<Q0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = v2;
  id v6 = objc_msgSend(self, sel_preferredFontForTextStyle_compatibleWithTraitCollection_, *MEMORY[0x1E4FB28C8], 0);
  *a2 = (uint64_t)v6;
  a2[1] = 4;
  a2[3] = 0;
  a2[4] = 0;
  a2[2] = 0;
  uint64_t v7 = *(void *)(v3 + 24);
  uint64_t v8 = *(void *)(v3 + 32);
  __swift_project_boxed_opaque_existential_1((void *)v3, v7);
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 8))(a1, v7, v8);

  *a2 = v9;
  *(_OWORD *)(a2 + 1) = *(_OWORD *)(v3 + 40);
  __n128 result = *(__n128 *)(v3 + 56);
  *(__n128 *)(a2 + 3) = result;
  return result;
}

uint64_t DynamicTextAppearance.customTextStyle.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B07BBD78(v1, a1);
}

uint64_t DynamicTextAppearance.customTextStyle.setter(long long *a1)
{
  __swift_destroy_boxed_opaque_existential_1(v1);

  return sub_1B07BA8FC(a1, v1);
}

double (*DynamicTextAppearance.customTextStyle.modify())(void)
{
  return nullsub_1;
}

uint64_t *DynamicTextAppearance.withCustomTextStyle(_:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1B07EA080(v2, (uint64_t)a2);

  return __swift_assign_boxed_opaque_existential_1(a2, a1);
}

uint64_t DynamicTextAppearance.withFontUseCase(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  BOOL v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  char v9 = *(unsigned char *)(a1 + 40);
  sub_1B07EA080(v2, a2);
  unint64_t v13 = &type metadata for FontSource;
  uint64_t v14 = &protocol witness table for FontSource;
  uint64_t v10 = swift_allocObject();
  *(void *)&long long v12 = v10;
  *(void *)(v10 + 16) = v4;
  *(void *)(v10 + 24) = v5;
  *(void *)(v10 + 32) = v6;
  *(void *)(v10 + 40) = v7;
  *(void *)(v10 + 48) = v8;
  *(unsigned char *)(v10 + 56) = v9 | 0x80;
  sub_1B07BCAAC(v4, v5, v6, v7, v8, v9);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return sub_1B07BA8FC(&v12, a2);
}

uint64_t DynamicTextAppearance.withTextStyle(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1B07EA080(v2, a2);
  char v9 = &type metadata for FontSource;
  uint64_t v10 = &protocol witness table for FontSource;
  uint64_t v5 = swift_allocObject();
  *(void *)&long long v8 = v5;
  *(void *)(v5 + 16) = a1;
  *(_OWORD *)(v5 + 24) = 0u;
  *(_OWORD *)(v5 + 40) = 0u;
  *(unsigned char *)(v5 + 56) = 0;
  id v6 = a1;
  __swift_destroy_boxed_opaque_existential_1(a2);
  return sub_1B07BA8FC(&v8, a2);
}

uint64_t DynamicTextAppearance.textAlignment.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t DynamicTextAppearance.textAlignment.setter(uint64_t result)
{
  *(void *)(v1 + 40) = result;
  return result;
}

double (*DynamicTextAppearance.textAlignment.modify())(void)
{
  return nullsub_1;
}

uint64_t DynamicTextAppearance.withTextAlignment(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1B07EA080(v2, a2);
  *(void *)(a2 + 40) = a1;
  return result;
}

uint64_t DynamicTextAppearance.lineBreakMode.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t DynamicTextAppearance.lineBreakMode.setter(uint64_t result)
{
  *(void *)(v1 + 48) = result;
  return result;
}

double (*DynamicTextAppearance.lineBreakMode.modify())(void)
{
  return nullsub_1;
}

uint64_t DynamicTextAppearance.numberOfLines.getter()
{
  return *(void *)(v0 + 56);
}

uint64_t DynamicTextAppearance.numberOfLines.setter(uint64_t result)
{
  *(void *)(v1 + 56) = result;
  return result;
}

double (*DynamicTextAppearance.numberOfLines.modify())(void)
{
  return nullsub_1;
}

uint64_t DynamicTextAppearance.lineSpacing.getter()
{
  return *(void *)(v0 + 64);
}

uint64_t DynamicTextAppearance.lineSpacing.setter(uint64_t result)
{
  *(void *)(v1 + 64) = result;
  return result;
}

double (*DynamicTextAppearance.lineSpacing.modify())(void)
{
  return nullsub_1;
}

uint64_t DynamicTextAppearance.withLineSpacing(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1B07EA080(v2, a2);
  *(void *)(a2 + 64) = a1;
  return result;
}

uint64_t initializeWithCopy for DynamicTextAppearance(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  return a1;
}

uint64_t *assignWithCopy for DynamicTextAppearance(uint64_t *a1, uint64_t *a2)
{
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

uint64_t assignWithTake for DynamicTextAppearance(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicTextAppearance(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DynamicTextAppearance(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicTextAppearance()
{
  return &type metadata for DynamicTextAppearance;
}

double JUMeasurements.contentHeight.getter(double a1, double a2, double a3, double a4)
{
  return a2 - a4;
}

void JUMeasurements.baselines.getter(double *a1@<X8>, double a2@<D2>, double a3@<D3>)
{
  *a1 = a2;
  a1[1] = a3;
}

JUMeasurements __swiftcall JUMeasurements.init(representing:)(CGSize representing)
{
  double v1 = 0.0;
  CGFloat height = representing.height;
  result.vaCGFloat r1 = representing.height;
  result.var0 = representing.width;
  result.var3 = v1;
  result.uint64_t var2 = height;
  return result;
}

uint64_t JUMeasurements.isEmpty.getter(double a1, double a2)
{
  BOOL v2 = fabs(a1) < COERCE_DOUBLE(1);
  return fabs(a2) < COERCE_DOUBLE(1) || v2;
}

double JUMeasurements.edgeInsets.getter(double a1, double a2, double a3)
{
  return a3;
}

BOOL static JUMeasurements.== infix(_:_:)(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return JUMeasurementsEqual(a1, a2, a3, a4, a5, a6, a7, a8);
}

BOOL sub_1B0863128(double *a1, double *a2)
{
  return JUMeasurementsEqual(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

Swift::Void __swiftcall JUMeasurements.round()()
{
  *uint64_t v0 = vrndpq_f64(*v0);
  double v1 = floor(v0[1].f64[1]);
  v0[1].f64[0] = ceil(v0[1].f64[0]);
  v0[1].f64[1] = v1;
}

JUMeasurements __swiftcall JUMeasurements.rounded()()
{
  double v4 = ceil(v0);
  double v5 = ceil(v1);
  double v6 = ceil(v2);
  double v7 = floor(v3);
  result.var3 = v7;
  result.uint64_t var2 = v6;
  result.vaCGFloat r1 = v5;
  result.var0 = v4;
  return result;
}

uint64_t sub_1B0863184()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1B08631BC()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t _MeasurableLayoutPlaceable.base.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B0810CB4(v1, a1);
}

JUMeasurements __swiftcall _MeasurableLayoutPlaceable.measure(toFit:with:)(CGSize toFit, UITraitCollection with)
{
  double height = toFit.height;
  double width = toFit.width;
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[5];
  __swift_project_boxed_opaque_existential_1(v2, v6);
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB596010);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1B086C120;
  *(UITraitCollection *)(v8 + 32) = with;
  uint64_t v27 = v8;
  sub_1B0869F98();
  sub_1B07BCC68();
  char v9 = with.super.isa;
  uint64_t v10 = (void *)sub_1B0869F78();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(self, sel_traitCollectionWithTraitsFromCollections_, v10);

  long long v12 = (objc_class *)type metadata accessor for TraitEnvironmentPlaceholder();
  unint64_t v13 = (char *)objc_allocWithZone(v12);
  *(void *)&v13[OBJC_IVAR____TtC5JetUI27TraitEnvironmentPlaceholder_traitCollection] = v11;
  v26.receiver = v13;
  v26.super_class = v12;
  id v14 = objc_msgSendSuper2(&v26, sel_init);
  double v15 = (*(double (**)(id, uint64_t, uint64_t, double, double))(v7 + 8))(v14, v6, v7, width, height);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.var3 = v25;
  result.uint64_t var2 = v24;
  result.vaCGFloat r1 = v23;
  result.var0 = v22;
  return result;
}

Swift::Void __swiftcall _MeasurableLayoutPlaceable.place(at:with:)(__C::CGRect at, UITraitCollection with)
{
  double height = at.size.height;
  double width = at.size.width;
  double y = at.origin.y;
  double x = at.origin.x;
  uint64_t v8 = v2[3];
  uint64_t v9 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v8);
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB596010);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1B086C120;
  *(UITraitCollection *)(v10 + 32) = with;
  v18[0] = v10;
  sub_1B0869F98();
  sub_1B07BCC68();
  id v11 = with.super.isa;
  long long v12 = (void *)sub_1B0869F78();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(self, sel_traitCollectionWithTraitsFromCollections_, v12);

  id v14 = (objc_class *)type metadata accessor for TraitEnvironmentPlaceholder();
  double v15 = (char *)objc_allocWithZone(v14);
  *(void *)&v15[OBJC_IVAR____TtC5JetUI27TraitEnvironmentPlaceholder_traitCollection] = v13;
  v17.receiver = v15;
  v17.super_class = v14;
  id v16 = objc_msgSendSuper2(&v17, sel_init);
  (*(void (**)(uint64_t *__return_ptr, id, uint64_t, uint64_t, double, double, double, double))(v9 + 8))(v18, v16, v8, v9, x, y, width, height);
}

uint64_t _MeasurableLayoutPlaceable.description.getter()
{
  sub_1B0810CB4(v0, (uint64_t)&v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595668);
  return sub_1B0869DE8();
}

uint64_t sub_1B0863528()
{
  sub_1B0810CB4(v0, (uint64_t)&v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB595668);
  return sub_1B0869DE8();
}

uint64_t _LayoutViewPlaceable.base.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B07BBD78(v1, a1);
}

Swift::Void __swiftcall _LayoutViewPlaceable.place(at:with:)(__C::CGRect at, UITraitCollection with)
{
  double height = at.size.height;
  double width = at.size.width;
  double y = at.origin.y;
  double x = at.origin.x;
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v7);
  (*(void (**)(uint64_t, uint64_t, double, double, double, double))(v8 + 24))(v7, v8, x, y, width, height);
}

uint64_t _LayoutViewPlaceable.description.getter()
{
  return sub_1B08637A8(qword_1EB5963B0);
}

uint64_t sub_1B0863618(uint64_t a1, uint64_t a2)
{
  return sub_1B0863800(a1, a2, qword_1EB5963B0);
}

JUMeasurements __swiftcall _MeasurablePlaceable.measure(toFit:with:)(CGSize toFit, UITraitCollection with)
{
  double height = toFit.height;
  double width = toFit.width;
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v6);
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB596010);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1B086C120;
  *(UITraitCollection *)(v8 + 32) = with;
  uint64_t v27 = v8;
  sub_1B0869F98();
  sub_1B07BCC68();
  uint64_t v9 = with.super.isa;
  uint64_t v10 = (void *)sub_1B0869F78();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(self, sel_traitCollectionWithTraitsFromCollections_, v10);

  long long v12 = (objc_class *)type metadata accessor for TraitEnvironmentPlaceholder();
  id v13 = (char *)objc_allocWithZone(v12);
  *(void *)&v13[OBJC_IVAR____TtC5JetUI27TraitEnvironmentPlaceholder_traitCollection] = v11;
  v26.receiver = v13;
  v26.super_class = v12;
  id v14 = objc_msgSendSuper2(&v26, sel_init);
  double v15 = (*(double (**)(id, uint64_t, uint64_t, double, double))(v7 + 8))(v14, v6, v7, width, height);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.var3 = v25;
  result.uint64_t var2 = v24;
  result.vaCGFloat r1 = v23;
  result.var0 = v22;
  return result;
}

uint64_t _MeasurablePlaceable.description.getter()
{
  return sub_1B08637A8(&qword_1EB595F48);
}

uint64_t sub_1B08637A8(uint64_t *a1)
{
  sub_1B07BBD78(v1, (uint64_t)v4);
  __swift_instantiateConcreteTypeFromMangledName(a1);
  return sub_1B0869DE8();
}

uint64_t sub_1B08637F4(uint64_t a1, uint64_t a2)
{
  return sub_1B0863800(a1, a2, &qword_1EB595F48);
}

uint64_t sub_1B0863800(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_1B07BBD78(v3, (uint64_t)v6);
  __swift_instantiateConcreteTypeFromMangledName(a3);
  return sub_1B0869DE8();
}

uint64_t destroy for _MeasurableLayoutPlaceable(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t initializeWithCopy for _MeasurableLayoutPlaceable(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 40);
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  *(void *)(a1 + 40) = v3;
  (**(void (***)(void))(v4 - 8))();
  return a1;
}

uint64_t *assignWithCopy for _MeasurableLayoutPlaceable(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

_OWORD *assignWithTake for _MeasurableLayoutPlaceable(_OWORD *a1, _OWORD *a2)
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  return a1;
}

ValueMetadata *type metadata accessor for _MeasurableLayoutPlaceable()
{
  return &type metadata for _MeasurableLayoutPlaceable;
}

ValueMetadata *type metadata accessor for _LayoutViewPlaceable()
{
  return &type metadata for _LayoutViewPlaceable;
}

ValueMetadata *type metadata accessor for _MeasurablePlaceable()
{
  return &type metadata for _MeasurablePlaceable;
}

id sub_1B086396C()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  qword_1E9B3A4C0 = (uint64_t)result;
  return result;
}

__n128 ImagePlaceholder.init(_:with:)@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = a1;
  __n128 result = *a2;
  *(__n128 *)(a3 + 8) = *a2;
  return result;
}

double _s5JetUI16ImagePlaceholderV7measure5toFit4withSo14JUMeasurementsVSo6CGSizeV_So17UITraitCollectionCtF_0(double a1, double a2)
{
  uint64_t v5 = sub_1B0869508();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (uint64_t *)((char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = *v2;
  uint64_t v10 = (void *)v2[1];
  uint64_t v11 = v2[2];
  sub_1B07BE798();
  *uint64_t v8 = sub_1B086A2F8();
  (*(void (**)(uint64_t *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4FBCBF0], v5);
  char v12 = sub_1B0869518();
  (*(void (**)(uint64_t *, uint64_t))(v6 + 8))(v8, v5);
  if (v12)
  {
    if (qword_1E9B3A418 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  id v13 = (void *)qword_1E9B3A4C0;
  id v14 = v10;
  objc_msgSend(v13, sel_setContentMode_, v11);
  objc_msgSend(v13, sel_setPreferredSymbolConfiguration_, v14);

  double v15 = (void *)qword_1E9B3A4C0;
  objc_msgSend((id)qword_1E9B3A4C0, sel_setImage_, v9);
  objc_msgSend(v15, sel_sizeThatFits_, a1, a2);
  double v17 = v16;
  id v18 = objc_msgSend(v15, sel_image);
  if (v18)
  {
    double v19 = v18;
    sub_1B086A368();
  }
  double v20 = (void *)qword_1E9B3A4C0;
  objc_msgSend((id)qword_1E9B3A4C0, sel_setContentMode_, 4);
  objc_msgSend(v20, sel_setPreferredSymbolConfiguration_, 0);
  objc_msgSend(v20, sel_setImage_, 0);
  return v17;
}

void *initializeBufferWithCopyOfBuffer for ImagePlaceholder(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  long long v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for ImagePlaceholder(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
}

uint64_t assignWithCopy for ImagePlaceholder(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  uint64_t v7 = *(void **)(a1 + 8);
  uint64_t v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for ImagePlaceholder(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for ImagePlaceholder(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 24)) {
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

uint64_t storeEnumTagSinglePayload for ImagePlaceholder(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ImagePlaceholder()
{
  return &type metadata for ImagePlaceholder;
}

uint64_t FontUseCase.hashValue.getter()
{
  return sub_1B086A998();
}

uint64_t sub_1B0863E88()
{
  return sub_1B086A998();
}

uint64_t sub_1B0863EE4()
{
  return sub_1B086A998();
}

uint64_t sub_1B0863F4C()
{
  sub_1B07BCA18(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(unsigned char *)(v0 + 56));

  return MEMORY[0x1F4186498](v0, 57, 7);
}

uint64_t assignWithTake for FontUseCase(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  char v4 = *(unsigned char *)(a2 + 40);
  id v5 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(void *)(a1 + 32) = v3;
  char v11 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v4;
  sub_1B07BCA18(v5, v7, v6, v8, v9, v11);
  return a1;
}

uint64_t sub_1B0863FE4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t StaticDimension.init(constant:source:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  id v13 = &type metadata for FontSource;
  id v14 = &protocol witness table for FontSource;
  uint64_t v6 = swift_allocObject();
  *(void *)&long long v12 = v6;
  uint64_t v7 = *(void *)(a1 + 32);
  char v8 = *(unsigned char *)(a1 + 40);
  long long v9 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v6 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v6 + 32) = v9;
  *(void *)(v6 + 48) = v7;
  *(unsigned char *)(v6 + 56) = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB596380);
  uint64_t v10 = swift_allocObject();
  uint64_t result = sub_1B07BA8FC(&v12, v10 + 16);
  *(double *)a2 = a3;
  *(void *)(a2 + 8) = v10;
  return result;
}

uint64_t sub_1B0864098()
{
  sub_1B07BF284(*(id *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(unsigned char *)(v0 + 56));

  return MEMORY[0x1F4186498](v0, 57, 7);
}

uint64_t StaticDimension.value(compatibleWith:rounded:)(void *a1, uint64_t a2)
{
  uint64_t v5 = sub_1B086A868();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  char v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  double v9 = *v2;
  uint64_t v10 = *((void *)v2 + 1) + 16;
  swift_beginAccess();
  sub_1B07BBD78(v10, (uint64_t)v17);
  uint64_t v11 = v18;
  uint64_t v12 = v19;
  id v13 = __swift_project_boxed_opaque_existential_1(v17, v18);
  double v14 = sub_1B07B2690(v9, (uint64_t)v13, a1, v11, v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  *(double *)double v17 = v14;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, v5);
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 88))(v8, v5);
  if (result != *MEMORY[0x1E4FBBEA0]
    && result != *MEMORY[0x1E4FBBE98]
    && result != *MEMORY[0x1E4FBBEA8]
    && result != *MEMORY[0x1E4FBBEB0]
    && result != *MEMORY[0x1E4FBBE88]
    && result != *MEMORY[0x1E4FBBE90])
  {
    sub_1B086A138();
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return result;
}

void StaticDimension.value(for:roundingRule:)()
{
}

double StaticDimension.rawValue(in:)(void *a1)
{
  double v3 = *(double *)v1;
  uint64_t v4 = *(void *)(v1 + 8) + 16;
  swift_beginAccess();
  sub_1B07BBD78(v4, (uint64_t)v12);
  id v5 = objc_msgSend(a1, sel_traitCollection);
  uint64_t v6 = v13;
  uint64_t v7 = v14;
  __swift_project_boxed_opaque_existential_1(v12, v13);
  double v8 = CustomTextStyle.scalingValues(compatibleWith:)(v5, v6, v7);
  double v10 = v9;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v10 * (v3 / v8);
}

UIEdgeInsets __swiftcall StaticDimension.languageAwareOutsets(compatibleWith:)(UITraitCollection compatibleWith)
{
  uint64_t v3 = *(void *)(v1 + 8) + 16;
  swift_beginAccess();
  sub_1B07BBD78(v3, (uint64_t)v18);
  uint64_t v4 = v19;
  uint64_t v5 = v20;
  __swift_project_boxed_opaque_existential_1(v18, v19);
  uint64_t v6 = (void *)(*(uint64_t (**)(Class, uint64_t, uint64_t))(v5 + 8))(compatibleWith.super.isa, v4, v5);
  double v7 = UIFont.languageAwareOutsets.getter();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

uint64_t StaticDimension.description.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  v3[0] = 0;
  v3[1] = 0xE000000000000000;
  sub_1B086A5E8();
  uint64_t v4 = 0;
  unint64_t v5 = 0xE000000000000000;
  sub_1B0869E68();
  sub_1B086A128();
  sub_1B0869E68();
  swift_bridgeObjectRelease();
  sub_1B0869E68();
  swift_beginAccess();
  sub_1B07BBD78(v1 + 16, (uint64_t)v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB596388);
  sub_1B086A6B8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  sub_1B0869E68();
  return v4;
}

double sub_1B0864630(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 8) + 16;
  swift_beginAccess();
  sub_1B07BBD78(v3, (uint64_t)v9);
  uint64_t v4 = v10;
  uint64_t v5 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  uint64_t v6 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 8))(a1, v4, v5);
  double v7 = UIFont.languageAwareOutsets.getter();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v7;
}

double StaticDimension.constant.getter()
{
  return *(double *)v0;
}

void *assignWithTake for StaticDimension(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t sub_1B086474C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_1B086A6E8())
  {
    unint64_t v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      id v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      id v5 = (id)MEMORY[0x1B3E97F40](0, a2);
LABEL_5:
      uint64_t v6 = v5;
      sub_1B08649E8();
      char v7 = sub_1B086A388();

      if (v7)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1) {
        goto LABEL_18;
      }
      if (v4) {
        break;
      }
      unint64_t v4 = 5;
      while (1)
      {
        unint64_t v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1)) {
          break;
        }
        id v13 = *(id *)(a2 + 8 * v4);
        char v14 = sub_1B086A388();

        if (v14) {
          goto LABEL_6;
        }
        ++v4;
        if (v12 == v3) {
          goto LABEL_18;
        }
      }
      __break(1u);
    }
    uint64_t v9 = 1;
    while (1)
    {
      MEMORY[0x1B3E97F40](v9, a2);
      uint64_t v10 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
      char v11 = sub_1B086A388();
      swift_unknownObjectRelease();
      if (v11) {
        goto LABEL_6;
      }
      ++v9;
      if (v10 == v3) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

void static ViewWillDisappearReason.inferred(for:)(void *a1)
{
  id v2 = objc_msgSend(a1, sel_navigationController);
  if (!v2)
  {
LABEL_4:
    if (objc_msgSend(a1, sel_isBeingDismissed))
    {
      MEMORY[0x1F4128A38]();
    }
    else
    {
      MEMORY[0x1F4128A30]();
    }
    return;
  }
  id v5 = v2;
  id v3 = objc_msgSend(v2, sel_viewControllers);
  sub_1B08649E8();
  unint64_t v4 = sub_1B0869F88();

  LOBYTE(v3) = sub_1B086474C((uint64_t)a1, v4);
  swift_bridgeObjectRelease();
  if (v3)
  {

    goto LABEL_4;
  }
  sub_1B0869A48();
}

unint64_t sub_1B08649E8()
{
  unint64_t result = qword_1EB595FF8;
  if (!qword_1EB595FF8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB595FF8);
  }
  return result;
}

uint64_t CollectionContent.observeReloadTriggers<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v18[1] = *v5;
  v18[2] = a1;
  swift_getAssociatedTypeWitness();
  uint64_t v10 = sub_1B0869918();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  id v13 = (char *)v18 - v12;
  uint64_t v14 = sub_1B07C7B80(0, (unint64_t *)&qword_1EB5962D0);
  uint64_t v15 = sub_1B086A2F8();
  v19[3] = v14;
  v19[4] = MEMORY[0x1E4F71860];
  v19[0] = v15;
  double v16 = (void *)swift_allocObject();
  uint64_t v16[2] = a2;
  void v16[3] = a3;
  v16[4] = a4;
  v16[5] = a5;
  sub_1B08697C8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
}

uint64_t sub_1B0864BEC()
{
  return MEMORY[0x1F4186498](v0, 48, 7);
}

void (*sub_1B0864BFC(uint64_t a1))(unint64_t a1)
{
  uint64_t v3 = swift_allocObject();
  long long v4 = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v3 + 32) = v4;
  *(void *)(v3 + 48) = a1;
  swift_retain();
  return sub_1B0865D34;
}

void sub_1B0864C6C(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v107 = a4;
  unint64_t v108 = a1;
  uint64_t v8 = sub_1B08697A8();
  uint64_t v9 = sub_1B08697A8();
  v110[0] = v8;
  v110[1] = v9;
  v110[2] = swift_getWitnessTable();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v81 = sub_1B0869388();
  uint64_t v80 = *(void *)(v81 - 8);
  MEMORY[0x1F4188790](v81);
  double v79 = (char *)v73 - v10;
  uint64_t v11 = sub_1B0869688();
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v99 = (char *)v73 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = sub_1B0869C18();
  int v94 = *(void (***)(char *, uint64_t))(v98 - 8);
  MEMORY[0x1F4188790](v98);
  CGRect v97 = (char *)v73 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = sub_1B086A3B8();
  CGFloat v95 = *(void (***)(char *, uint64_t, uint64_t))(v84 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v84);
  uint64_t v87 = (char *)v73 - v15;
  *(void *)&long long v93 = *(void *)(v9 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  char v83 = (char *)v73 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  CGFloat v82 = (char *)v73 - v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BF18);
  MEMORY[0x1F4188790](v19 - 8);
  uint64_t v103 = (char *)v73 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = sub_1B0869238();
  unint64_t v90 = *(void *)(v101 - 8);
  uint64_t v21 = MEMORY[0x1F4188790](v101);
  uint64_t v92 = (char *)v73 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x1F4188790](v21);
  double v91 = (char *)v73 - v24;
  uint64_t v25 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](v23);
  uint64_t v27 = (char *)v73 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_1B0869508();
  uint64_t v29 = *(void *)(v28 - 8);
  MEMORY[0x1F4188790](v28);
  id v31 = (void *)((char *)v73 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1B07C7B80(0, (unint64_t *)&qword_1EB5962D0);
  *id v31 = sub_1B086A2F8();
  (*(void (**)(uint64_t *, void, uint64_t))(v29 + 104))(v31, *MEMORY[0x1E4FBCBF0], v28);
  char v32 = sub_1B0869518();
  (*(void (**)(uint64_t *, uint64_t))(v29 + 8))(v31, v28);
  if ((v32 & 1) == 0)
  {
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_1B086A6E8();
    swift_bridgeObjectRelease();
    uint64_t v35 = v101;
    if (v34) {
      goto LABEL_4;
    }
LABEL_35:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v110[0] = v109;
    sub_1B086A098();
    swift_getWitnessTable();
    if (sub_1B086A248())
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v70 = (uint64_t)v79;
      uint64_t v71 = v104;
      CollectionContent.snapshot()();
      uint64_t v72 = v81;
      sub_1B0869308();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      CollectionContent.apply(_:animatingDifferences:completion:)(v70, *(unsigned __int8 *)(v71 + 41), 0, 0);
      (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v70, v72);
    }
    return;
  }
  (*(void (**)(char *, unint64_t, uint64_t))(v25 + 16))(v27, v108, a2);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v106 = sub_1B086A1D8();
  uint64_t v109 = sub_1B0869C78();
  id v102 = *(id *)(v5 + 32);
  id v33 = objc_msgSend(v102, sel_visibleCells);
  sub_1B07C7B80(0, &qword_1E9B3BF20);
  a3 = sub_1B0869F88();

  uint64_t v89 = v9;
  uint64_t v104 = v5;
  if (a3 >> 62) {
    goto LABEL_34;
  }
  uint64_t v34 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v35 = v101;
  if (!v34) {
    goto LABEL_35;
  }
LABEL_4:
  if (v34 >= 1)
  {
    uint64_t v36 = 0;
    unint64_t v108 = a3 & 0xC000000000000001;
    long long v96 = (void (**)(char *, char *, uint64_t))(v90 + 32);
    uint64_t v100 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v90 + 56);
    double v88 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v90 + 48);
    uint64_t v86 = (unsigned int (**)(char *, uint64_t, uint64_t))(v93 + 48);
    double v78 = (void (**)(char *, char *, uint64_t))(v93 + 32);
    uint64_t v77 = (void (**)(char *, char *, uint64_t))(v93 + 16);
    CGFloat v76 = (void (**)(char *, uint64_t))(v93 + 8);
    uint64_t v85 = (void (**)(char *, uint64_t))(v90 + 8);
    CGFloat v75 = (void (**)(char *, uint64_t))(v95 + 1);
    CGFloat v95 = (void (**)(char *, uint64_t, uint64_t))(v94 + 2);
    CGFloat v74 = (void (**)(uint64_t *, char *, uint64_t))(v90 + 16);
    ++v94;
    long long v93 = xmmword_1B086C130;
    unint64_t v90 = 0x80000001B0876640;
    v73[2] = 0x80000001B0876660;
    while (1)
    {
      if (v108) {
        id v37 = (id)MEMORY[0x1B3E97F40](v36, a3);
      }
      else {
        id v37 = *(id *)(a3 + 8 * v36 + 32);
      }
      id v38 = v37;
      swift_getObjectType();
      uint64_t v39 = swift_conformsToProtocol2();
      if (v39) {
        uint64_t v40 = v39;
      }
      else {
        uint64_t v40 = 0;
      }
      if (v39) {
        id v41 = v38;
      }
      else {
        id v41 = 0;
      }
      if (!v41) {
        goto LABEL_7;
      }
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v43 = *(uint64_t (**)(uint64_t, uint64_t))(v40 + 8);
      id v38 = v38;
      uint64_t v44 = v43(ObjectType, v40);
      uint64_t v45 = sub_1B086A538();
      uint64_t v46 = sub_1B0866018(v45, v44);
      swift_bridgeObjectRelease();
      if (!*(void *)(v46 + 16))
      {

        swift_release();
        goto LABEL_8;
      }
      char v47 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v40 + 16))(v46, ObjectType, v40);
      swift_release();
      if (v47) {
        break;
      }
      id v48 = objc_msgSend(v102, sel_indexPathForCell_, v38);
      if (!v48)
      {
        uint64_t v52 = (uint64_t)v103;
        (*v100)(v103, 1, 1, v35);
LABEL_29:
        sub_1B07BBE14(v52, &qword_1E9B3BF18);
        if (qword_1E9B3A6A0 != -1) {
          swift_once();
        }
        uint64_t v65 = v98;
        uint64_t v66 = __swift_project_value_buffer(v98, (uint64_t)qword_1E9B46108);
        uint64_t v67 = v97;
        (*v95)(v97, v66, v65);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3AA70);
        sub_1B08696C8();
        *(_OWORD *)(swift_allocObject() + 16) = v93;
        sub_1B0869678();
        sub_1B0869668();
        sub_1B0869648();
        sub_1B0869668();
        id v68 = v38;
        sub_1B0869648();

        sub_1B0869668();
        sub_1B0869698();
        sub_1B0869AE8();

        swift_bridgeObjectRelease();
        (*v94)(v67, v65);
        uint64_t v35 = v101;
        goto LABEL_8;
      }
      uint64_t v49 = v48;
      uint64_t v50 = v92;
      sub_1B0869208();

      double v51 = *v96;
      uint64_t v52 = (uint64_t)v103;
      (*v96)(v103, v50, v35);
      (*v100)((char *)v52, 0, 1, v35);
      if ((*v88)(v52, 1, v35) == 1) {
        goto LABEL_29;
      }
      v51(v91, (char *)v52, v35);
      double v53 = v87;
      CollectionContent.item(for:)();
      double v54 = v53;
      CGFloat v55 = v53;
      uint64_t v56 = v89;
      if ((*v86)(v55, 1, v89) == 1)
      {
        (*v75)(v54, v84);
        if (qword_1E9B3A6A0 != -1) {
          swift_once();
        }
        uint64_t v57 = v98;
        uint64_t v58 = __swift_project_value_buffer(v98, (uint64_t)qword_1E9B46108);
        id v59 = v97;
        (*v95)(v97, v58, v57);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B3AA70);
        uint64_t v60 = *(void *)(sub_1B08696C8() - 8);
        unint64_t v61 = (*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
        uint64_t v62 = swift_allocObject();
        *(_OWORD *)(v62 + 16) = v93;
        v73[1] = v62 + v61;
        sub_1B0869678();
        sub_1B0869668();
        sub_1B0869648();
        sub_1B0869668();
        uint64_t WitnessTable = v35;
        boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v110);
        CGFloat v64 = v91;
        (*v74)(boxed_opaque_existential_0, v91, v35);
        sub_1B0869638();
        sub_1B07BBE14((uint64_t)v110, (uint64_t *)&unk_1EB5962E0);
        sub_1B0869668();
        sub_1B0869698();
        sub_1B0869AE8();

        swift_bridgeObjectRelease();
        (*v94)(v59, v57);
        (*v85)(v64, v35);
      }
      else
      {
        uint64_t v69 = v82;
        (*v78)(v82, v54, v56);
        (*v77)(v83, v69, v56);
        sub_1B086A098();
        sub_1B086A048();

        (*v76)(v69, v56);
        (*v85)(v91, v35);
      }
LABEL_8:
      if (v34 == ++v36) {
        goto LABEL_35;
      }
    }

LABEL_7:
    goto LABEL_8;
  }
  __break(1u);
}

uint64_t CollectionContent.observeReloadTriggers(publishedIn:)()
{
  uint64_t v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BF10);
  uint64_t v2 = sub_1B08698C8();
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = v2 + 32;
    do
    {
      sub_1B07BBD78(v4, (uint64_t)v8);
      uint64_t v5 = v9;
      uint64_t v6 = v10;
      __swift_project_boxed_opaque_existential_1(v8, v9);
      (*(void (**)(uint64_t *, void, void, uint64_t, uint64_t))(v6 + 8))(v0, *(void *)(v1 + 80), *(void *)(v1 + 88), v5, v6);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
      v4 += 40;
      --v3;
    }
    while (v3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1B0865CFC()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_1B0865D34(unint64_t a1)
{
  unint64_t v3 = *(void *)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  sub_1B0864C6C(a1, AssociatedTypeWitness, v3, v4);
}

uint64_t sub_1B0865D94(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3)
  {
    swift_release();
    return MEMORY[0x1E4FBC870];
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B3BF28);
  uint64_t result = sub_1B086A598();
  uint64_t v6 = result;
  uint64_t v30 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
    }
    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_40;
      }
      if (v15 >= a2)
      {
LABEL_37:
        swift_release();
        return v6;
      }
      unint64_t v16 = v30[v15];
      ++v11;
      if (!v16)
      {
        uint64_t v11 = v15 + 1;
        if (v15 + 1 >= a2) {
          goto LABEL_37;
        }
        unint64_t v16 = v30[v11];
        if (!v16)
        {
          uint64_t v11 = v15 + 2;
          if (v15 + 2 >= a2) {
            goto LABEL_37;
          }
          unint64_t v16 = v30[v11];
          if (!v16)
          {
            uint64_t v17 = v15 + 3;
            if (v17 >= a2) {
              goto LABEL_37;
            }
            unint64_t v16 = v30[v17];
            if (!v16)
            {
              while (1)
              {
                uint64_t v11 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_41;
                }
                if (v11 >= a2) {
                  goto LABEL_37;
                }
                unint64_t v16 = v30[v11];
                ++v17;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v11 = v17;
          }
        }
      }
LABEL_24:
      unint64_t v10 = (v16 - 1) & v16;
      unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    sub_1B08384D0(*(void *)(a4 + 48) + 40 * v14, (uint64_t)v31);
    uint64_t result = sub_1B086A548();
    uint64_t v18 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v12 + 8 * (v19 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v12 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v12 + 8 * v20);
      }
      while (v25 == -1);
      unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
    }
    *(void *)(v12 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t v26 = *(void *)(v6 + 48) + 40 * v21;
    long long v27 = v31[0];
    long long v28 = v31[1];
    *(void *)(v26 + 32) = v32;
    *(_OWORD *)uint64_t v26 = v27;
    *(_OWORD *)(v26 + 16) = v28;
    ++*(void *)(v6 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      goto LABEL_37;
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

uint64_t sub_1B0866018(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x1E4F143B8];
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1F4188790](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    uint64_t v7 = sub_1B08661A0((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    uint64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_1B08661A0((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x1B3E98D90](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_1B08661A0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CGFloat v42 = (unint64_t *)result;
  if (*(void *)(a4 + 16) < *(void *)(a3 + 16))
  {
    uint64_t v43 = 0;
    int64_t v6 = 0;
    uint64_t v40 = a4 + 56;
    uint64_t v7 = 1 << *(unsigned char *)(a4 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(a4 + 56);
    int64_t v49 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v10 = a3 + 56;
    do
    {
      while (1)
      {
        if (v9)
        {
          unint64_t v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          unint64_t v12 = v11 | (v6 << 6);
        }
        else
        {
          int64_t v13 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
LABEL_62:
            __break(1u);
            goto LABEL_63;
          }
          if (v13 >= v49) {
            goto LABEL_60;
          }
          unint64_t v14 = *(void *)(v40 + 8 * v13);
          ++v6;
          if (!v14)
          {
            int64_t v6 = v13 + 1;
            if (v13 + 1 >= v49) {
              goto LABEL_60;
            }
            unint64_t v14 = *(void *)(v40 + 8 * v6);
            if (!v14)
            {
              int64_t v6 = v13 + 2;
              if (v13 + 2 >= v49) {
                goto LABEL_60;
              }
              unint64_t v14 = *(void *)(v40 + 8 * v6);
              if (!v14)
              {
                int64_t v15 = v13 + 3;
                if (v15 >= v49)
                {
LABEL_60:
                  swift_retain();
                  return sub_1B0865D94(v42, a2, v43, a3);
                }
                unint64_t v14 = *(void *)(v40 + 8 * v15);
                if (!v14)
                {
                  while (1)
                  {
                    int64_t v6 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      break;
                    }
                    if (v6 >= v49) {
                      goto LABEL_60;
                    }
                    unint64_t v14 = *(void *)(v40 + 8 * v6);
                    ++v15;
                    if (v14) {
                      goto LABEL_22;
                    }
                  }
LABEL_63:
                  __break(1u);
                  goto LABEL_64;
                }
                int64_t v6 = v15;
              }
            }
          }
LABEL_22:
          unint64_t v9 = (v14 - 1) & v14;
          unint64_t v12 = __clz(__rbit64(v14)) + (v6 << 6);
        }
        sub_1B08384D0(*(void *)(a4 + 48) + 40 * v12, (uint64_t)v47);
        v45[0] = v47[0];
        v45[1] = v47[1];
        uint64_t v46 = v48;
        uint64_t v16 = sub_1B086A548();
        uint64_t v17 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v18 = v16 & ~v17;
        if ((*(void *)(v10 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18)) {
          break;
        }
LABEL_6:
        uint64_t result = sub_1B083852C((uint64_t)v45);
      }
      uint64_t v19 = ~v17;
      while (1)
      {
        sub_1B08384D0(*(void *)(a3 + 48) + 40 * v18, (uint64_t)v44);
        char v20 = MEMORY[0x1B3E97E80](v44, v45);
        sub_1B083852C((uint64_t)v44);
        if (v20) {
          break;
        }
        unint64_t v18 = (v18 + 1) & v19;
        if (((*(void *)(v10 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
          goto LABEL_6;
        }
      }
      uint64_t result = sub_1B083852C((uint64_t)v45);
      *(unint64_t *)((char *)v42 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      BOOL v21 = __OFADD__(v43++, 1);
    }
    while (!v21);
    __break(1u);
  }
  uint64_t v43 = 0;
  int64_t v22 = 0;
  uint64_t v39 = a3 + 56;
  uint64_t v23 = 1 << *(unsigned char *)(a3 + 32);
  if (v23 < 64) {
    uint64_t v24 = ~(-1 << v23);
  }
  else {
    uint64_t v24 = -1;
  }
  unint64_t v25 = v24 & *(void *)(a3 + 56);
  int64_t v41 = (unint64_t)(v23 + 63) >> 6;
  uint64_t v26 = a4 + 56;
  while (v25)
  {
    unint64_t v27 = __clz(__rbit64(v25));
    v25 &= v25 - 1;
    int64_t v49 = v22;
    unint64_t v28 = v27 | (v22 << 6);
LABEL_52:
    sub_1B08384D0(*(void *)(a3 + 48) + 40 * v28, (uint64_t)v47);
    uint64_t v33 = sub_1B086A548();
    uint64_t v34 = -1 << *(unsigned char *)(a4 + 32);
    unint64_t v35 = v33 & ~v34;
    if ((*(void *)(v26 + ((v35 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v35))
    {
      uint64_t v36 = ~v34;
      while (1)
      {
        sub_1B08384D0(*(void *)(a4 + 48) + 40 * v35, (uint64_t)v45);
        char v37 = MEMORY[0x1B3E97E80](v45, v47);
        sub_1B083852C((uint64_t)v45);
        if (v37) {
          break;
        }
        unint64_t v35 = (v35 + 1) & v36;
        if (((*(void *)(v26 + ((v35 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v35) & 1) == 0) {
          goto LABEL_35;
        }
      }
      uint64_t result = sub_1B083852C((uint64_t)v47);
      *(unint64_t *)((char *)v42 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
      BOOL v21 = __OFADD__(v43++, 1);
      int64_t v22 = v49;
      if (v21)
      {
        __break(1u);
        goto LABEL_60;
      }
    }
    else
    {
LABEL_35:
      uint64_t result = sub_1B083852C((uint64_t)v47);
      int64_t v22 = v49;
    }
  }
  int64_t v29 = v22 + 1;
  if (__OFADD__(v22, 1)) {
    goto LABEL_62;
  }
  if (v29 >= v41) {
    goto LABEL_60;
  }
  unint64_t v30 = *(void *)(v39 + 8 * v29);
  int64_t v31 = v22 + 1;
  if (v30) {
    goto LABEL_51;
  }
  int64_t v31 = v22 + 2;
  if (v22 + 2 >= v41) {
    goto LABEL_60;
  }
  unint64_t v30 = *(void *)(v39 + 8 * v31);
  if (v30) {
    goto LABEL_51;
  }
  int64_t v31 = v22 + 3;
  if (v22 + 3 >= v41) {
    goto LABEL_60;
  }
  unint64_t v30 = *(void *)(v39 + 8 * v31);
  if (v30)
  {
LABEL_51:
    unint64_t v25 = (v30 - 1) & v30;
    int64_t v49 = v31;
    unint64_t v28 = __clz(__rbit64(v30)) + (v31 << 6);
    goto LABEL_52;
  }
  int64_t v32 = v22 + 4;
  if (v22 + 4 >= v41) {
    goto LABEL_60;
  }
  unint64_t v30 = *(void *)(v39 + 8 * v32);
  if (v30)
  {
    int64_t v31 = v22 + 4;
    goto LABEL_51;
  }
  while (1)
  {
    int64_t v31 = v32 + 1;
    if (__OFADD__(v32, 1)) {
      break;
    }
    if (v31 >= v41) {
      goto LABEL_60;
    }
    unint64_t v30 = *(void *)(v39 + 8 * v31);
    ++v32;
    if (v30) {
      goto LABEL_51;
    }
  }
LABEL_64:
  __break(1u);
  return result;
}

uint64_t sub_1B0866644()
{
  return sub_1B08697B8();
}

uint64_t TableContent.__allocating_init<A>(_:tableView:cellProvider:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1B086669C(a1, a2, a3, a4, a5, a6, (uint64_t (*)(void))sub_1B086792C);
}

uint64_t TableContent.init<A>(_:tableView:cellProvider:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1B086669C(a1, a2, a3, a4, a5, a6, (uint64_t (*)(void))sub_1B08674C4);
}

uint64_t sub_1B086669C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(void))
{
  uint64_t v8 = a7();
  swift_unknownObjectRelease();

  swift_release();
  return v8;
}

uint64_t sub_1B08666F0(uint64_t a1)
{
  uint64_t v3 = (unsigned __int8 *)(v1 + *(void *)(*(void *)v1 + 120));
  swift_beginAccess();
  return TableContent.apply(_:animatingDifferences:completion:)(a1, *v3, 0, 0);
}

char *TableContent.__allocating_init<A>(_:tableView:cellProvider:)(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *a1;
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = *(_OWORD *)(v4 + 80);
  *(void *)(v10 + 32) = a3;
  *(void *)(v10 + 40) = a4;
  *(void *)(v10 + 48) = a1;
  uint64_t v11 = *(void *)(v9 + 80);
  uint64_t v12 = *(void *)(v9 + 88);
  swift_allocObject();
  uint64_t v13 = swift_unknownObjectRetain();
  unint64_t v14 = sub_1B08674C4(v13, a2, (uint64_t)sub_1B08679E8, v10, v11, v12);
  swift_unknownObjectRelease();

  swift_release();
  return v14;
}

uint64_t sub_1B0866870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, char *, uint64_t))
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB596260);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  DiffableDataStatePresenter.lens(for:)(a1);
  uint64_t v12 = a4(a1, a2, v11, a3);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v12;
}

id TableContent.view.getter()
{
  return *(id *)(v0 + *(void *)(*(void *)v0 + 112));
}

uint64_t TableContent.animatePresenterChanges.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + *(void *)(*(void *)v0 + 120));
  swift_beginAccess();
  return *v1;
}

uint64_t TableContent.animatePresenterChanges.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + *(void *)(*(void *)v1 + 120));
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*TableContent.animatePresenterChanges.modify())()
{
  return j__swift_endAccess;
}

uint64_t TableContent.onSnapshotApplied.getter()
{
  return swift_retain();
}

uint64_t TableContent.snapshot()()
{
  return sub_1B08693C8();
}

uint64_t TableContent.apply(_:animatingDifferences:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *v4;
  uint64_t v8 = (uint64_t)v4 + *(void *)(*v4 + 104);
  swift_beginAccess();
  uint64_t v9 = *(void *)(v7 + 80);
  sub_1B08697A8();
  uint64_t v10 = *(void *)(v7 + 88);
  sub_1B08697A8();
  swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v11 = sub_1B0869388();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v8, a1, v11);
  swift_endAccess();
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  uint64_t v13 = (void *)swift_allocObject();
  _OWORD v13[2] = v9;
  void v13[3] = v10;
  uint64_t v13[4] = a3;
  _OWORD v13[5] = a4;
  v13[6] = v12;
  sub_1B07E8728(a3);
  swift_retain();
  sub_1B08693B8();
  swift_release();
  return swift_release();
}

uint64_t sub_1B0866CE0(void (*a1)(void))
{
  if (a1) {
    a1();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1B0869528();
    return swift_release();
  }
  return result;
}

uint64_t TableContent.section(for:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = sub_1B08697A8();
  uint64_t v15 = v4;
  uint64_t v16 = sub_1B08697A8();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v18 = swift_getWitnessTable();
  uint64_t v5 = sub_1B0869388();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v12 - v7;
  uint64_t v9 = (char *)v1 + *(void *)(v3 + 104);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v9, v5);
  uint64_t v10 = sub_1B0869368();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *(void *)&long long v13 = v10;
  sub_1B086A098();
  swift_getWitnessTable();
  sub_1B086A1F8();
  long long v13 = v14;
  v12[1] = sub_1B0869228();
  __swift_instantiateConcreteTypeFromMangledName(qword_1E9B3BF30);
  if (sub_1B086A2B8())
  {
    sub_1B0869228();
    sub_1B086A0C8();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(a1, 0, 1, v4);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(a1, 1, 1, v4);
    return swift_bridgeObjectRelease();
  }
}

uint64_t TableContent.indexPath(forSection:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v15 = sub_1B08697A8();
  uint64_t v16 = sub_1B08697A8();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v18 = swift_getWitnessTable();
  uint64_t v4 = sub_1B0869388();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - v6;
  uint64_t v8 = (char *)v1 + *(void *)(v3 + 104);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = sub_1B0869368();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v13[1] = v9;
  sub_1B086A098();
  swift_getWitnessTable();
  swift_getWitnessTable();
  sub_1B086A258();
  swift_bridgeObjectRelease();
  if (v14)
  {
    uint64_t v10 = sub_1B0869238();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(a1, 1, 1, v10);
  }
  else
  {
    MEMORY[0x1B3E96B40](0, v13[2]);
    uint64_t v12 = sub_1B0869238();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(a1, 0, 1, v12);
  }
}

uint64_t TableContent.item(for:)()
{
  return sub_1B08693A8();
}

uint64_t TableContent.indexPath(forItem:)()
{
  return sub_1B08693D8();
}

id *TableContent.deinit()
{
  uint64_t v1 = (char *)v0 + *((void *)*v0 + 13);
  sub_1B08697A8();
  sub_1B08697A8();
  swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v2 = sub_1B0869388();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_release();
  return v0;
}

uint64_t TableContent.__deallocating_deinit()
{
  TableContent.deinit();

  return swift_deallocClassInstance();
}

char *sub_1B08674C4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v35 = a5;
  uint64_t v36 = a3;
  uint64_t v37 = a4;
  id v38 = a2;
  uint64_t v41 = a1;
  uint64_t v39 = *(void *)v6;
  uint64_t v34 = *(void *)(v39 + 80);
  uint64_t v9 = sub_1B08697A8();
  uint64_t v10 = *(void *)(v39 + 88);
  uint64_t v11 = sub_1B08697A8();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v13 = swift_getWitnessTable();
  uint64_t v44 = v9;
  uint64_t v45 = v11;
  uint64_t v46 = WitnessTable;
  uint64_t v47 = v13;
  uint64_t v14 = sub_1B0869388();
  uint64_t v15 = sub_1B0869918();
  uint64_t v42 = *(void *)(v15 - 8);
  uint64_t v43 = v15;
  MEMORY[0x1F4188790](v15);
  uint64_t v40 = (char *)&v33 - v16;
  uint64_t v17 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v18);
  char v20 = (char *)&v33 - v19;
  uint64_t v44 = v9;
  uint64_t v45 = v11;
  uint64_t v46 = WitnessTable;
  uint64_t v47 = v13;
  sub_1B08693E8();
  BOOL v21 = (void *)swift_allocObject();
  v21[2] = v34;
  void v21[3] = v10;
  uint64_t v23 = v35;
  uint64_t v22 = v36;
  void v21[4] = v35;
  v21[5] = a6;
  uint64_t v24 = v37;
  v21[6] = v22;
  v21[7] = v24;
  id v25 = v38;
  swift_retain();
  uint64_t v26 = (void *)sub_1B0869398();
  *((void *)v7 + 2) = v26;
  id v27 = v26;
  sub_1B08693C8();

  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(&v7[*(void *)(*(void *)v7 + 104)], v20, v14);
  *(void *)&v7[*(void *)(*(void *)v7 + 112)] = v25;
  v7[*(void *)(*(void *)v7 + 120)] = 1;
  sub_1B0869548();
  id v28 = v25;
  *(void *)&v7[*(void *)(*(void *)v7 + 128)] = sub_1B0869538();
  (*(void (**)(uint64_t, uint64_t))(a6 + 32))(v23, a6);
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = v23;
  *(void *)(v29 + 24) = a6;
  unint64_t v30 = (void *)swift_allocObject();
  v30[2] = v23;
  v30[3] = a6;
  v30[4] = sub_1B0867C38;
  v30[5] = v29;
  sub_1B0869548();
  swift_getWitnessTable();
  sub_1B08697B8();
  int64_t v31 = v40;
  sub_1B08697C8();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v44);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v31, v43);
  (*(void (**)(uint64_t, uint64_t))(a6 + 40))(v23, a6);
  return v7;
}

char *sub_1B086792C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1B08674C4(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_1B08679A8()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1B08679E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B0866870(a1, a2, a3, *(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t))(v3 + 32));
}

uint64_t sub_1B08679F8()
{
  swift_weakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B0867A30()
{
  if (*(void *)(v0 + 32)) {
    swift_release();
  }
  swift_release();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1B0867A78()
{
  return sub_1B0866CE0(*(void (**)(void))(v0 + 32));
}

uint64_t sub_1B0867A88()
{
  sub_1B08697A8();
  sub_1B08697A8();
  swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t result = sub_1B0869388();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for TableContent()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for TableContent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TableContent);
}

uint64_t dispatch thunk of TableContent.__allocating_init<A>(_:tableView:cellProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_1B0867BF0()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1B0867C28()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t (*sub_1B0867C38(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v1 + 16);
  *(void *)(v3 + 32) = a1;
  swift_retain();
  return sub_1B0867D18;
}

uint64_t sub_1B0867CA8()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1B0867CE0()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B0867D18(uint64_t a1)
{
  return sub_1B08666F0(a1);
}

void UICollectionView.registerComponent<A>(_:)()
{
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  swift_getAssociatedTypeWitness();
  sub_1B086AA98();
  id v2 = (id)sub_1B0869D68();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_registerClass_forCellWithReuseIdentifier_, ObjCClassFromMetadata, v2);
}

{
  uint64_t vars8;

  type metadata accessor for JUComponentCollectionViewCell();

  UICollectionView.registerComponent<A>(_:)();
}

uint64_t UICollectionView.dequeueComponent(forContentsOf:with:at:asPartOf:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB596230);
  sub_1B0869778();
  __swift_project_boxed_opaque_existential_1(v20, v20[3]);
  swift_getDynamicType();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  sub_1B086AA98();
  uint64_t v8 = (void *)sub_1B0869D68();
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)sub_1B08691F8();
  id v10 = objc_msgSend(v4, sel_dequeueReusableCellWithReuseIdentifier_forIndexPath_, v8, v9);

  type metadata accessor for JUAnyComponentCollectionViewCell();
  uint64_t v11 = (void *)swift_dynamicCastClass();
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & *v11) + 0x50);
    id v14 = v10;
    v13(a1, a2, a4);

    return (uint64_t)v12;
  }
  else
  {
    id v16 = objc_msgSend(v10, sel_description);
    uint64_t v17 = sub_1B0869D98();
    uint64_t v19 = v18;

    v20[0] = v17;
    v20[1] = v19;
    sub_1B0869E68();
    swift_getObjectType();
    sub_1B086AA98();
    sub_1B0869E68();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1B086A6C8();
    __break(1u);
  }
  return result;
}

uint64_t sub_1B0868004()
{
  uint64_t result = sub_1B0869D68();
  qword_1E9B3BFB8 = result;
  return result;
}

id static CustomLayoutView.didInvalidateMeasurementsNotification.getter()
{
  if (qword_1E9B3A720 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1E9B3BFB8;

  return v0;
}

uint64_t sub_1B0868098@<X0>(uint64_t *a1@<X8>)
{
  a1[3] = (uint64_t)&type metadata for VerticalStack;
  a1[4] = (uint64_t)&protocol witness table for VerticalStack;
  uint64_t result = swift_allocObject();
  *a1 = result;
  *(void *)(result + 40) = &type metadata for ZeroDimension;
  *(void *)(result + 48) = &protocol witness table for ZeroDimension;
  *(void *)(result + 80) = &type metadata for ZeroDimension;
  *(void *)(result + 88) = &protocol witness table for ZeroDimension;
  *(unsigned char *)(result + 96) = 0;
  *(void *)(result + 104) = 0;
  *(unsigned char *)(result + 112) = 0;
  *(void *)(result + 120) = MEMORY[0x1E4FBC860];
  return result;
}

uint64_t sub_1B0868114()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 128, 7);
}

void sub_1B086815C()
{
  id v1 = objc_msgSend(self, sel_defaultCenter);
  if (qword_1E9B3A720 != -1) {
    swift_once();
  }
  objc_msgSend(v1, sel_postNotificationName_object_, qword_1E9B3BFB8, v0);

  objc_msgSend(v0, sel_setNeedsLayout);
  objc_msgSend(v0, sel_invalidateIntrinsicContentSize);
  id v2 = objc_msgSend(v0, sel_superview);
  if (v2)
  {
    id v4 = v2;
    type metadata accessor for CustomLayoutView();
    uint64_t v3 = (void *)swift_dynamicCastClass();
    if (v3)
    {
      (*(void (**)(void))((*MEMORY[0x1E4FBC8C8] & *v3) + 0x58))();
      goto LABEL_8;
    }
  }
  id v4 = objc_msgSend(v0, sel_superview);
  objc_msgSend(v4, sel_setNeedsLayout);
LABEL_8:
}

JUMeasurements __swiftcall CustomLayoutView.measure(toFit:with:)(CGSize toFit, UITraitCollection with)
{
  double height = toFit.height;
  double width = toFit.width;
  (*(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x50))(v19);
  uint64_t v6 = v20;
  uint64_t v7 = v21;
  __swift_project_boxed_opaque_existential_1(v19, v20);
  double v8 = (*(double (**)(Class, uint64_t, uint64_t, double, double))(v7 + 8))(with.super.isa, v6, v7, width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.var3 = v18;
  result.uint64_t var2 = v17;
  result.vaCGFloat r1 = v16;
  result.var0 = v15;
  return result;
}

double CustomLayoutView.intrinsicContentSize.getter()
{
  id v1 = objc_msgSend(v0, sel_traitCollection);
  (*(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x50))(v6);
  uint64_t v2 = v7;
  uint64_t v3 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  double v4 = (*(double (**)(id, uint64_t, uint64_t, double, double))(v3 + 8))(v1, v2, v3, 0.0, 0.0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);

  return v4;
}

id CustomLayoutView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

id CustomLayoutView.init(frame:)(double a1, double a2, double a3, double a4)
{
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for CustomLayoutView();
  return objc_msgSendSuper2(&v10, sel_initWithFrame_, a1, a2, a3, a4);
}

id CustomLayoutView.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id CustomLayoutView.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for CustomLayoutView();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id CustomLayoutView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CustomLayoutView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for CustomLayoutView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CustomLayoutView);
}

uint64_t dispatch thunk of CustomLayoutView.customLayout.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x50))();
}

uint64_t dispatch thunk of CustomLayoutView.invalidateMeasurements()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x58))();
}

uint64_t dispatch thunk of CustomLayoutView.willLayout()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of CustomLayoutView.didLayout()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t Constrain.init(_:width:height:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, int a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>, unsigned __int8 a10)
{
  uint64_t v16 = a1[3];
  uint64_t v17 = a1[5];
  char v18 = a3 | a5;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  uint64_t v19 = Measurable.placeable.getter(v16, v17, v24);
  if ((v18 & 1) == 0)
  {
    MEMORY[0x1F4188790](v19);
    uint64_t v19 = sub_1B0869BC8();
  }
  if (((a7 | a10) & 1) == 0)
  {
    MEMORY[0x1F4188790](v19);
    sub_1B0869BC8();
  }
  sub_1B07BA8FC(v24, a9);
  *(void *)(a9 + 40) = a2;
  *(unsigned char *)(a9 + 48) = a3 & 1;
  *(void *)(a9 + 56) = a4;
  *(unsigned char *)(a9 + 64) = a5 & 1;
  *(void *)(a9 + 72) = a6;
  *(unsigned char *)(a9 + 80) = a7 & 1;
  *(void *)(a9 + 88) = a8;
  *(unsigned char *)(a9 + 96) = a10 & 1;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

BOOL sub_1B0868B3C()
{
  return sub_1B07D1148(*(double *)(v0 + 16), *(double *)(v0 + 24));
}

uint64_t Placement.init(child:frame:baselines:)@<X0>(uint64_t a1@<X0>, double *a2@<X1>, double *a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  double v13 = *a2;
  double v14 = a2[1];
  sub_1B07BBD78(a1, (uint64_t)a3);
  a3[5] = floor(a4);
  a3[6] = floor(a5);
  a3[7] = ceil(a6);
  a3[8] = ceil(a7);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1(a1);
  a3[9] = floor(v13);
  a3[10] = floor(v14);
  return result;
}

Swift::Void __swiftcall Placement.place(inCoordinateSpaceOf:with:)(__C::CGRect inCoordinateSpaceOf, UITraitCollection with)
{
  CGFloat height = inCoordinateSpaceOf.size.height;
  CGFloat width = inCoordinateSpaceOf.size.width;
  CGFloat y = inCoordinateSpaceOf.origin.y;
  CGFloat x = inCoordinateSpaceOf.origin.x;
  sub_1B07BBD78((uint64_t)v2, (uint64_t)v23);
  uint64_t v8 = v24;
  uint64_t v9 = v25;
  __swift_project_boxed_opaque_existential_1(v23, v24);
  double v10 = v2[5];
  double v11 = v2[6];
  double v12 = v2[7];
  double v13 = v2[8];
  if ([(objc_class *)with.super.isa layoutDirection] == (id)1)
  {
    CGAffineTransformMakeScale(&v22, -1.0, 1.0);
    long long v19 = *(_OWORD *)&v22.c;
    long long v20 = *(_OWORD *)&v22.a;
    CGFloat ty = v22.ty;
    CGFloat tx = v22.tx;
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    CGFloat MinX = CGRectGetMinX(v26);
    v27.size.CGFloat height = height;
    double v15 = MinX;
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    CGFloat MaxX = CGRectGetMaxX(v27);
    *(_OWORD *)&v22.a = v20;
    *(_OWORD *)&v22.c = v19;
    v22.CGFloat tx = tx;
    v22.CGFloat ty = ty;
    CGAffineTransformTranslate(&v21, &v22, -(v15 + MaxX), 0.0);
    CGAffineTransform v22 = v21;
    v28.origin.CGFloat x = v10;
    v28.origin.CGFloat y = v11;
    v28.size.CGFloat width = v12;
    v28.size.CGFloat height = v13;
    CGRect v29 = CGRectApplyAffineTransform(v28, &v22);
    double v10 = v29.origin.x;
    double v11 = v29.origin.y;
    double v12 = v29.size.width;
    double v13 = v29.size.height;
  }
  (*(void (**)(Class, uint64_t, uint64_t, double, double, double, double))(v9 + 16))(with.super.isa, v8, v9, v10, v11, v12, v13);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
}

uint64_t Placement.init(child:verbatimFrame:verbatimBaselines:)@<X0>(long long *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  uint64_t v12 = *a2;
  uint64_t v13 = a2[1];
  uint64_t result = sub_1B07BA8FC(a1, a3);
  *(double *)(a3 + 40) = a4;
  *(double *)(a3 + 48) = a5;
  *(double *)(a3 + 56) = a6;
  *(double *)(a3 + 64) = a7;
  *(void *)(a3 + 72) = v12;
  *(void *)(a3 + 80) = v13;
  return result;
}

uint64_t Placement.child.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B07BBD78(v1, a1);
}

uint64_t Placement.child.setter(long long *a1)
{
  __swift_destroy_boxed_opaque_existential_1(v1);

  return sub_1B07BA8FC(a1, v1);
}

double (*Placement.child.modify())(void)
{
  return nullsub_1;
}

double Placement.frame.getter()
{
  return *(double *)(v0 + 40);
}

void Placement.frame.setter(double a1, double a2, double a3, double a4)
{
  v4[5] = a1;
  v4[6] = a2;
  v4[7] = a3;
  v4[8] = a4;
}

double (*Placement.frame.modify())(void)
{
  return nullsub_1;
}

__n128 Placement.baselines.getter@<Q0>(__n128 *a1@<X8>)
{
  __n128 result = *(__n128 *)(v1 + 72);
  *a1 = result;
  return result;
}

__n128 Placement.baselines.setter(__n128 *a1)
{
  __n128 result = *a1;
  *(__n128 *)(v1 + 72) = *a1;
  return result;
}

double (*Placement.baselines.modify())(void)
{
  return nullsub_1;
}

uint64_t initializeWithCopy for Placement(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  return a1;
}

uint64_t *assignWithCopy for Placement(uint64_t *a1, uint64_t *a2)
{
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  return a1;
}

uint64_t assignWithTake for Placement(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  return a1;
}

ValueMetadata *type metadata accessor for Placement()
{
  return &type metadata for Placement;
}

uint64_t sub_1B0868FD8()
{
  return MEMORY[0x1F40E2E10]();
}

uint64_t sub_1B0868FE8()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1B0868FF8()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1B0869008()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1B0869018()
{
  return MEMORY[0x1F40E32B0]();
}

uint64_t sub_1B0869028()
{
  return MEMORY[0x1F40E3340]();
}

uint64_t sub_1B0869038()
{
  return MEMORY[0x1F40E3368]();
}

uint64_t sub_1B0869048()
{
  return MEMORY[0x1F40E3370]();
}

uint64_t sub_1B0869058()
{
  return MEMORY[0x1F40E33F0]();
}

uint64_t sub_1B0869068()
{
  return MEMORY[0x1F40E3418]();
}

uint64_t sub_1B0869078()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1B0869088()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1B0869098()
{
  return MEMORY[0x1F40E4558]();
}

uint64_t sub_1B08690A8()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1B08690B8()
{
  return MEMORY[0x1F40E49E8]();
}

uint64_t sub_1B08690C8()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1B08690D8()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1B08690E8()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1B08690F8()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1B0869108()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1B0869118()
{
  return MEMORY[0x1F40E4D58]();
}

uint64_t sub_1B0869128()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1B0869138()
{
  return MEMORY[0x1F40E4E10]();
}

uint64_t sub_1B0869148()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1B0869158()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1B0869168()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1B0869178()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1B0869188()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1B0869198()
{
  return MEMORY[0x1F40E5510]();
}

uint64_t sub_1B08691A8()
{
  return MEMORY[0x1F40E55A0]();
}

uint64_t sub_1B08691B8()
{
  return MEMORY[0x1F40E5628]();
}

uint64_t sub_1B08691C8()
{
  return MEMORY[0x1F40E5648]();
}

uint64_t sub_1B08691D8()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1B08691E8()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1B08691F8()
{
  return MEMORY[0x1F40E5E68]();
}

uint64_t sub_1B0869208()
{
  return MEMORY[0x1F40E5EA0]();
}

uint64_t sub_1B0869218()
{
  return MEMORY[0x1F4165730]();
}

uint64_t sub_1B0869228()
{
  return MEMORY[0x1F4165760]();
}

uint64_t sub_1B0869238()
{
  return MEMORY[0x1F40E5EF0]();
}

uint64_t sub_1B0869258()
{
  return MEMORY[0x1F40E5F60]();
}

uint64_t sub_1B0869268()
{
  return MEMORY[0x1F40E5F70]();
}

uint64_t sub_1B0869278()
{
  return MEMORY[0x1F40E5F80]();
}

uint64_t sub_1B0869288()
{
  return MEMORY[0x1F41777C8]();
}

uint64_t sub_1B0869298()
{
  return MEMORY[0x1F41777D0]();
}

uint64_t sub_1B08692A8()
{
  return MEMORY[0x1F41777D8]();
}

uint64_t sub_1B08692B8()
{
  return MEMORY[0x1F4177808]();
}

uint64_t sub_1B08692C8()
{
  return MEMORY[0x1F4177810]();
}

uint64_t sub_1B08692D8()
{
  return MEMORY[0x1F4177860]();
}

uint64_t sub_1B08692E8()
{
  return MEMORY[0x1F4177868]();
}

uint64_t sub_1B08692F8()
{
  return MEMORY[0x1F4165F80]();
}

uint64_t sub_1B0869308()
{
  return MEMORY[0x1F4165FB8]();
}

uint64_t sub_1B0869318()
{
  return MEMORY[0x1F4165FD0]();
}

uint64_t sub_1B0869328()
{
  return MEMORY[0x1F4165FE8]();
}

uint64_t sub_1B0869338()
{
  return MEMORY[0x1F4165FF8]();
}

uint64_t sub_1B0869348()
{
  return MEMORY[0x1F4166000]();
}

uint64_t sub_1B0869358()
{
  return MEMORY[0x1F4166008]();
}

uint64_t sub_1B0869368()
{
  return MEMORY[0x1F4166028]();
}

uint64_t sub_1B0869378()
{
  return MEMORY[0x1F4166068]();
}

uint64_t sub_1B0869388()
{
  return MEMORY[0x1F4166070]();
}

uint64_t sub_1B0869398()
{
  return MEMORY[0x1F41660D8]();
}

uint64_t sub_1B08693A8()
{
  return MEMORY[0x1F41660E8]();
}

uint64_t sub_1B08693B8()
{
  return MEMORY[0x1F41660F8]();
}

uint64_t sub_1B08693C8()
{
  return MEMORY[0x1F4166100]();
}

uint64_t sub_1B08693D8()
{
  return MEMORY[0x1F4166108]();
}

uint64_t sub_1B08693E8()
{
  return MEMORY[0x1F4166110]();
}

uint64_t sub_1B08693F8()
{
  return MEMORY[0x1F4166218]();
}

uint64_t sub_1B0869408()
{
  return MEMORY[0x1F4166230]();
}

uint64_t sub_1B0869418()
{
  return MEMORY[0x1F4166240]();
}

uint64_t sub_1B0869428()
{
  return MEMORY[0x1F4166248]();
}

uint64_t sub_1B0869438()
{
  return MEMORY[0x1F4166288]();
}

uint64_t sub_1B0869448()
{
  return MEMORY[0x1F4166298]();
}

uint64_t sub_1B0869458()
{
  return MEMORY[0x1F41662A8]();
}

uint64_t sub_1B0869468()
{
  return MEMORY[0x1F41662B0]();
}

uint64_t sub_1B0869478()
{
  return MEMORY[0x1F41662B8]();
}

uint64_t sub_1B0869488()
{
  return MEMORY[0x1F40F9E10]();
}

uint64_t sub_1B0869498()
{
  return MEMORY[0x1F40F9FA8]();
}

uint64_t sub_1B08694A8()
{
  return MEMORY[0x1F4177890]();
}

uint64_t sub_1B08694B8()
{
  return MEMORY[0x1F4177898]();
}

uint64_t sub_1B08694C8()
{
  return MEMORY[0x1F4186C98]();
}

uint64_t sub_1B08694D8()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1B08694E8()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1B08694F8()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1B0869508()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1B0869518()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1B0869528()
{
  return MEMORY[0x1F41278E0]();
}

uint64_t sub_1B0869538()
{
  return MEMORY[0x1F41278E8]();
}

uint64_t sub_1B0869548()
{
  return MEMORY[0x1F41278F8]();
}

uint64_t sub_1B0869558()
{
  return MEMORY[0x1F4127950]();
}

uint64_t sub_1B0869568()
{
  return MEMORY[0x1F4127958]();
}

uint64_t sub_1B0869578()
{
  return MEMORY[0x1F4127970]();
}

uint64_t sub_1B0869588()
{
  return MEMORY[0x1F4127978]();
}

uint64_t sub_1B0869598()
{
  return MEMORY[0x1F4127980]();
}

uint64_t sub_1B08695A8()
{
  return MEMORY[0x1F4127988]();
}

uint64_t sub_1B08695B8()
{
  return MEMORY[0x1F4127998]();
}

uint64_t sub_1B08695C8()
{
  return MEMORY[0x1F41279D0]();
}

uint64_t sub_1B08695D8()
{
  return MEMORY[0x1F41279D8]();
}

uint64_t sub_1B08695E8()
{
  return MEMORY[0x1F41279E8]();
}

uint64_t sub_1B08695F8()
{
  return MEMORY[0x1F4127A00]();
}

uint64_t sub_1B0869608()
{
  return MEMORY[0x1F4127A08]();
}

uint64_t sub_1B0869618()
{
  return MEMORY[0x1F4127A18]();
}

uint64_t sub_1B0869628()
{
  return MEMORY[0x1F4127A30]();
}

uint64_t sub_1B0869638()
{
  return MEMORY[0x1F4127A38]();
}

uint64_t sub_1B0869648()
{
  return MEMORY[0x1F4127A40]();
}

uint64_t sub_1B0869658()
{
  return MEMORY[0x1F4127A48]();
}

uint64_t sub_1B0869668()
{
  return MEMORY[0x1F4127A50]();
}

uint64_t sub_1B0869678()
{
  return MEMORY[0x1F4127A58]();
}

uint64_t sub_1B0869688()
{
  return MEMORY[0x1F4127A60]();
}

uint64_t sub_1B0869698()
{
  return MEMORY[0x1F4127A68]();
}

uint64_t sub_1B08696A8()
{
  return MEMORY[0x1F4127A70]();
}

uint64_t sub_1B08696B8()
{
  return MEMORY[0x1F4127A88]();
}

uint64_t sub_1B08696C8()
{
  return MEMORY[0x1F4127A90]();
}

uint64_t sub_1B08696D8()
{
  return MEMORY[0x1F4127A98]();
}

uint64_t sub_1B08696E8()
{
  return MEMORY[0x1F4127AA0]();
}

uint64_t sub_1B08696F8()
{
  return MEMORY[0x1F4127AA8]();
}

uint64_t sub_1B0869708()
{
  return MEMORY[0x1F4127B00]();
}

uint64_t sub_1B0869718()
{
  return MEMORY[0x1F4127B28]();
}

uint64_t sub_1B0869728()
{
  return MEMORY[0x1F4127B38]();
}

uint64_t sub_1B0869738()
{
  return MEMORY[0x1F4127B48]();
}

uint64_t sub_1B0869748()
{
  return MEMORY[0x1F4127B80]();
}

uint64_t sub_1B0869758()
{
  return MEMORY[0x1F4127BD0]();
}

uint64_t sub_1B0869768()
{
  return MEMORY[0x1F4127CD8]();
}

uint64_t sub_1B0869778()
{
  return MEMORY[0x1F4127CE0]();
}

uint64_t sub_1B0869788()
{
  return MEMORY[0x1F4127CF0]();
}

uint64_t sub_1B0869798()
{
  return MEMORY[0x1F4127CF8]();
}

uint64_t sub_1B08697A8()
{
  return MEMORY[0x1F4127D00]();
}

uint64_t sub_1B08697B8()
{
  return MEMORY[0x1F4127D10]();
}

uint64_t sub_1B08697C8()
{
  return MEMORY[0x1F4127D18]();
}

uint64_t sub_1B08697D8()
{
  return MEMORY[0x1F4127DC8]();
}

uint64_t sub_1B08697E8()
{
  return MEMORY[0x1F4127DD0]();
}

uint64_t sub_1B08697F8()
{
  return MEMORY[0x1F4127DD8]();
}

uint64_t sub_1B0869808()
{
  return MEMORY[0x1F4127DE0]();
}

uint64_t sub_1B0869818()
{
  return MEMORY[0x1F4127DE8]();
}

uint64_t sub_1B0869828()
{
  return MEMORY[0x1F4127DF0]();
}

uint64_t sub_1B0869838()
{
  return MEMORY[0x1F4127EB8]();
}

uint64_t sub_1B0869848()
{
  return MEMORY[0x1F4127EC0]();
}

uint64_t sub_1B0869858()
{
  return MEMORY[0x1F4127EC8]();
}

uint64_t sub_1B0869868()
{
  return MEMORY[0x1F4127EE0]();
}

uint64_t sub_1B0869878()
{
  return MEMORY[0x1F4127EE8]();
}

uint64_t sub_1B0869888()
{
  return MEMORY[0x1F4127EF0]();
}

uint64_t sub_1B0869898()
{
  return MEMORY[0x1F4127F90]();
}

uint64_t sub_1B08698A8()
{
  return MEMORY[0x1F4127FB0]();
}

uint64_t sub_1B08698B8()
{
  return MEMORY[0x1F4127FB8]();
}

uint64_t sub_1B08698C8()
{
  return MEMORY[0x1F4128018]();
}

uint64_t sub_1B08698D8()
{
  return MEMORY[0x1F4128060]();
}

uint64_t sub_1B08698E8()
{
  return MEMORY[0x1F41281A8]();
}

uint64_t sub_1B08698F8()
{
  return MEMORY[0x1F41281D0]();
}

uint64_t sub_1B0869908()
{
  return MEMORY[0x1F41281E0]();
}

uint64_t sub_1B0869918()
{
  return MEMORY[0x1F4128358]();
}

uint64_t sub_1B0869928()
{
  return MEMORY[0x1F4128368]();
}

uint64_t sub_1B0869938()
{
  return MEMORY[0x1F4128370]();
}

uint64_t sub_1B0869948()
{
  return MEMORY[0x1F41283F8]();
}

uint64_t sub_1B0869958()
{
  return MEMORY[0x1F4128410]();
}

uint64_t sub_1B0869968()
{
  return MEMORY[0x1F4128418]();
}

uint64_t sub_1B0869978()
{
  return MEMORY[0x1F4128428]();
}

uint64_t sub_1B0869988()
{
  return MEMORY[0x1F4128430]();
}

uint64_t sub_1B0869998()
{
  return MEMORY[0x1F4128438]();
}

uint64_t sub_1B08699A8()
{
  return MEMORY[0x1F41284C0]();
}

uint64_t sub_1B08699B8()
{
  return MEMORY[0x1F41284E0]();
}

uint64_t sub_1B08699C8()
{
  return MEMORY[0x1F41284F8]();
}

uint64_t sub_1B08699D8()
{
  return MEMORY[0x1F4128500]();
}

uint64_t sub_1B08699E8()
{
  return MEMORY[0x1F4128508]();
}

uint64_t sub_1B08699F8()
{
  return MEMORY[0x1F4128690]();
}

uint64_t sub_1B0869A08()
{
  return MEMORY[0x1F4128968]();
}

uint64_t sub_1B0869A18()
{
  return MEMORY[0x1F41289F0]();
}

uint64_t sub_1B0869A48()
{
  return MEMORY[0x1F4128A40]();
}

uint64_t sub_1B0869A58()
{
  return MEMORY[0x1F4128A50]();
}

uint64_t sub_1B0869A68()
{
  return MEMORY[0x1F4128A60]();
}

uint64_t sub_1B0869A78()
{
  return MEMORY[0x1F4128A68]();
}

uint64_t sub_1B0869A88()
{
  return MEMORY[0x1F4128A90]();
}

uint64_t sub_1B0869A98()
{
  return MEMORY[0x1F4128A98]();
}

uint64_t sub_1B0869AA8()
{
  return MEMORY[0x1F4128AA0]();
}

uint64_t sub_1B0869AB8()
{
  return MEMORY[0x1F4128E58]();
}

uint64_t sub_1B0869AC8()
{
  return MEMORY[0x1F4128E60]();
}

uint64_t sub_1B0869AD8()
{
  return MEMORY[0x1F4128E68]();
}

uint64_t sub_1B0869AE8()
{
  return MEMORY[0x1F4128E70]();
}

uint64_t sub_1B0869AF8()
{
  return MEMORY[0x1F4128EF0]();
}

uint64_t sub_1B0869B08()
{
  return MEMORY[0x1F4128EF8]();
}

uint64_t sub_1B0869B18()
{
  return MEMORY[0x1F4128F00]();
}

uint64_t sub_1B0869B28()
{
  return MEMORY[0x1F4128F08]();
}

uint64_t sub_1B0869B38()
{
  return MEMORY[0x1F4128F10]();
}

uint64_t sub_1B0869B48()
{
  return MEMORY[0x1F4128F18]();
}

uint64_t sub_1B0869B58()
{
  return MEMORY[0x1F4128F20]();
}

uint64_t sub_1B0869B68()
{
  return MEMORY[0x1F4128F28]();
}

uint64_t sub_1B0869B78()
{
  return MEMORY[0x1F4128F30]();
}

uint64_t sub_1B0869B88()
{
  return MEMORY[0x1F4128F38]();
}

uint64_t sub_1B0869B98()
{
  return MEMORY[0x1F4128F40]();
}

uint64_t sub_1B0869BA8()
{
  return MEMORY[0x1F4128F48]();
}

uint64_t sub_1B0869BB8()
{
  return MEMORY[0x1F41290C0]();
}

uint64_t sub_1B0869BC8()
{
  return MEMORY[0x1F4129130]();
}

uint64_t sub_1B0869BD8()
{
  return MEMORY[0x1F4129168]();
}

uint64_t sub_1B0869BE8()
{
  return MEMORY[0x1F4129180]();
}

uint64_t sub_1B0869BF8()
{
  return MEMORY[0x1F4129188]();
}

uint64_t sub_1B0869C08()
{
  return MEMORY[0x1F4129190]();
}

uint64_t sub_1B0869C18()
{
  return MEMORY[0x1F4129198]();
}

uint64_t sub_1B0869C28()
{
  return MEMORY[0x1F4129250]();
}

uint64_t sub_1B0869C38()
{
  return MEMORY[0x1F4129310]();
}

uint64_t sub_1B0869C48()
{
  return MEMORY[0x1F4129328]();
}

uint64_t sub_1B0869C58()
{
  return MEMORY[0x1F4129338]();
}

uint64_t sub_1B0869C68()
{
  return MEMORY[0x1F4129348]();
}

uint64_t sub_1B0869C78()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1B0869C88()
{
  return MEMORY[0x1F41832F8]();
}

uint64_t sub_1B0869C98()
{
  return MEMORY[0x1F4183308]();
}

uint64_t sub_1B0869CA8()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1B0869CB8()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1B0869CC8()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1B0869CD8()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1B0869CE8()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1B0869CF8()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1B0869D08()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1B0869D18()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1B0869D28()
{
  return MEMORY[0x1F4183718]();
}

uint64_t sub_1B0869D38()
{
  return MEMORY[0x1F4183720]();
}

uint64_t sub_1B0869D48()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1B0869D58()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1B0869D68()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1B0869D78()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1B0869D88()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1B0869D98()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1B0869DA8()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1B0869DB8()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1B0869DC8()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1B0869DD8()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1B0869DE8()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1B0869DF8()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1B0869E08()
{
  return MEMORY[0x1F4183920]();
}

uint64_t sub_1B0869E18()
{
  return MEMORY[0x1F4183928]();
}

uint64_t sub_1B0869E28()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1B0869E38()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1B0869E48()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1B0869E58()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t sub_1B0869E68()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1B0869E78()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1B0869E88()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1B0869E98()
{
  return MEMORY[0x1F4183AA8]();
}

uint64_t sub_1B0869EA8()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1B0869EB8()
{
  return MEMORY[0x1F4183B00]();
}

uint64_t sub_1B0869EC8()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1B0869ED8()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1B0869EE8()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1B0869EF8()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1B0869F08()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1B0869F18()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_1B0869F28()
{
  return MEMORY[0x1F4183C18]();
}

uint64_t sub_1B0869F38()
{
  return MEMORY[0x1F4183C60]();
}

uint64_t sub_1B0869F48()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1B0869F58()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1B0869F68()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1B0869F78()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1B0869F88()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1B0869F98()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1B0869FA8()
{
  return MEMORY[0x1F4183EA0]();
}

uint64_t sub_1B0869FB8()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1B0869FC8()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1B0869FD8()
{
  return MEMORY[0x1F4183EE8]();
}

uint64_t sub_1B0869FE8()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1B0869FF8()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1B086A008()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1B086A018()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1B086A028()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1B086A038()
{
  return MEMORY[0x1F4183F58]();
}

uint64_t sub_1B086A048()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1B086A058()
{
  return MEMORY[0x1F4183F68]();
}

uint64_t sub_1B086A068()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1B086A078()
{
  return MEMORY[0x1F4183F80]();
}

uint64_t sub_1B086A088()
{
  return MEMORY[0x1F4183F98]();
}

uint64_t sub_1B086A098()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1B086A0A8()
{
  return MEMORY[0x1F4183FD8]();
}

uint64_t sub_1B086A0B8()
{
  return MEMORY[0x1F4183FE0]();
}

uint64_t sub_1B086A0C8()
{
  return MEMORY[0x1F4183FF0]();
}

uint64_t sub_1B086A0D8()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1B086A0E8()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1B086A0F8()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1B086A108()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1B086A118()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1B086A128()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1B086A138()
{
  return MEMORY[0x1F4184018]();
}

uint64_t sub_1B086A148()
{
  return MEMORY[0x1F4184070]();
}

uint64_t sub_1B086A158()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1B086A168()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1B086A178()
{
  return MEMORY[0x1F41841A0]();
}

uint64_t sub_1B086A188()
{
  return MEMORY[0x1F41841A8]();
}

uint64_t sub_1B086A198()
{
  return MEMORY[0x1F41841C0]();
}

uint64_t sub_1B086A1A8()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1B086A1B8()
{
  return MEMORY[0x1F41841F0]();
}

uint64_t sub_1B086A1C8()
{
  return MEMORY[0x1F4184230]();
}

uint64_t sub_1B086A1D8()
{
  return MEMORY[0x1F4184250]();
}

uint64_t sub_1B086A1E8()
{
  return MEMORY[0x1F4184278]();
}

uint64_t sub_1B086A1F8()
{
  return MEMORY[0x1F41842C0]();
}

uint64_t sub_1B086A208()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1B086A218()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1B086A228()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1B086A238()
{
  return MEMORY[0x1F4184348]();
}

uint64_t sub_1B086A248()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1B086A258()
{
  return MEMORY[0x1F4184418]();
}

uint64_t sub_1B086A268()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1B086A278()
{
  return MEMORY[0x1F41844B0]();
}

uint64_t sub_1B086A288()
{
  return MEMORY[0x1F4184510]();
}

uint64_t sub_1B086A298()
{
  return MEMORY[0x1F4184568]();
}

uint64_t sub_1B086A2A8()
{
  return MEMORY[0x1F4184580]();
}

uint64_t sub_1B086A2B8()
{
  return MEMORY[0x1F41845A0]();
}

uint64_t sub_1B086A2C8()
{
  return MEMORY[0x1F4186FC0]();
}

uint64_t sub_1B086A2D8()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1B086A2E8()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1B086A2F8()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1B086A308()
{
  return MEMORY[0x1F41870C0]();
}

uint64_t sub_1B086A318()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_1B086A328()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1B086A338()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1B086A348()
{
  return MEMORY[0x1F4166688]();
}

uint64_t sub_1B086A358()
{
  return MEMORY[0x1F4166780]();
}

uint64_t sub_1B086A368()
{
  return MEMORY[0x1F4166818]();
}

uint64_t sub_1B086A378()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1B086A388()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1B086A398()
{
  return MEMORY[0x1F4166838]();
}

uint64_t sub_1B086A3A8()
{
  return MEMORY[0x1F40E6948]();
}

uint64_t sub_1B086A3B8()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1B086A3C8()
{
  return MEMORY[0x1F4184730]();
}

uint64_t sub_1B086A3D8()
{
  return MEMORY[0x1F4184770]();
}

uint64_t sub_1B086A3E8()
{
  return MEMORY[0x1F4184790]();
}

uint64_t sub_1B086A3F8()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1B086A408()
{
  return MEMORY[0x1F40E6C30]();
}

uint64_t sub_1B086A418()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1B086A428()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1B086A438()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1B086A448()
{
  return MEMORY[0x1F41849B8]();
}

uint64_t sub_1B086A458()
{
  return MEMORY[0x1F41849F8]();
}

uint64_t sub_1B086A468()
{
  return MEMORY[0x1F4184A18]();
}

uint64_t sub_1B086A478()
{
  return MEMORY[0x1F4184A60]();
}

uint64_t sub_1B086A498()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1B086A4A8()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1B086A4B8()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1B086A4C8()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1B086A4D8()
{
  return MEMORY[0x1F4184B78]();
}

uint64_t sub_1B086A4E8()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1B086A4F8()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1B086A508()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1B086A518()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1B086A528()
{
  return MEMORY[0x1F4184BD0]();
}

uint64_t sub_1B086A538()
{
  return MEMORY[0x1F4184BF0]();
}

uint64_t sub_1B086A548()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1B086A558()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1B086A568()
{
  return MEMORY[0x1F4184C50]();
}

uint64_t sub_1B086A578()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1B086A588()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1B086A598()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1B086A5A8()
{
  return MEMORY[0x1F4184CB0]();
}

uint64_t sub_1B086A5B8()
{
  return MEMORY[0x1F4184CC0]();
}

uint64_t sub_1B086A5D8()
{
  return MEMORY[0x1F4184CE0]();
}

uint64_t sub_1B086A5E8()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1B086A5F8()
{
  return MEMORY[0x1F4184D08]();
}

uint64_t sub_1B086A608()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1B086A618()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1B086A628()
{
  return MEMORY[0x1F4184DC0]();
}

uint64_t sub_1B086A638()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1B086A648()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1B086A658()
{
  return MEMORY[0x1F4184E70]();
}

uint64_t sub_1B086A668()
{
  return MEMORY[0x1F4184EA8]();
}

uint64_t sub_1B086A678()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1B086A688()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1B086A698()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1B086A6A8()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1B086A6B8()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1B086A6C8()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1B086A6D8()
{
  return MEMORY[0x1F41852C0]();
}

uint64_t sub_1B086A6E8()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1B086A6F8()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1B086A708()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1B086A718()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1B086A728()
{
  return MEMORY[0x1F41853A8]();
}

uint64_t sub_1B086A738()
{
  return MEMORY[0x1F41853D0]();
}

uint64_t sub_1B086A748()
{
  return MEMORY[0x1F41853E0]();
}

uint64_t sub_1B086A758()
{
  return MEMORY[0x1F41853E8]();
}

uint64_t sub_1B086A768()
{
  return MEMORY[0x1F4185450]();
}

uint64_t sub_1B086A778()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1B086A788()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1B086A798()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1B086A7A8()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1B086A7B8()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1B086A7C8()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1B086A7D8()
{
  return MEMORY[0x1F41855D8]();
}

uint64_t sub_1B086A7E8()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1B086A7F8()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1B086A808()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1B086A818()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1B086A828()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1B086A838()
{
  return MEMORY[0x1F4185700]();
}

uint64_t sub_1B086A848()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1B086A858()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1B086A868()
{
  return MEMORY[0x1F41859C8]();
}

uint64_t sub_1B086A878()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1B086A888()
{
  return MEMORY[0x1F4185A00]();
}

uint64_t sub_1B086A898()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1B086A8A8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1B086A8B8()
{
  return MEMORY[0x1F4185A58]();
}

uint64_t sub_1B086A8C8()
{
  return MEMORY[0x1F4185B20]();
}

uint64_t sub_1B086A8D8()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1B086A8E8()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1B086A8F8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1B086A908()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1B086A918()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1B086A928()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1B086A938()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1B086A958()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1B086A968()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1B086A978()
{
  return MEMORY[0x1F4185EE0]();
}

uint64_t sub_1B086A988()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1B086A998()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1B086A9A8()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t sub_1B086A9B8()
{
  return MEMORY[0x1F4185FC0]();
}

uint64_t sub_1B086A9C8()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1B086A9D8()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t sub_1B086A9E8()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1B086A9F8()
{
  return MEMORY[0x1F4186018]();
}

uint64_t sub_1B086AA08()
{
  return MEMORY[0x1F4186090]();
}

uint64_t sub_1B086AA18()
{
  return MEMORY[0x1F41860A0]();
}

uint64_t sub_1B086AA28()
{
  return MEMORY[0x1F41860E8]();
}

uint64_t sub_1B086AA38()
{
  return MEMORY[0x1F41860F0]();
}

uint64_t sub_1B086AA68()
{
  return MEMORY[0x1F4188198]();
}

uint64_t sub_1B086AA78()
{
  return MEMORY[0x1F41881A8]();
}

uint64_t sub_1B086AA88()
{
  return MEMORY[0x1F41881B0]();
}

uint64_t sub_1B086AA98()
{
  return MEMORY[0x1F4186318]();
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x1F40DF300]();
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x1F40DF518]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1F417CE10]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4166CC0](image);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1F4186340]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1F4186398]();
}

void bzero(void *a1, size_t a2)
{
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

htmlParserCtxtPtr htmlCreateMemoryParserCtxt(const char *buffer, int size)
{
  return (htmlParserCtxtPtr)MEMORY[0x1F4182578](buffer, *(void *)&size);
}

int htmlCtxtUseOptions(htmlParserCtxtPtr ctxt, int options)
{
  return MEMORY[0x1F4182588](ctxt, *(void *)&options);
}

int htmlParseDocument(htmlParserCtxtPtr ctxt)
{
  return MEMORY[0x1F41825A0](ctxt);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

IMP method_setImplementation(Method m, IMP imp)
{
  return (IMP)MEMORY[0x1F4181628](m, imp);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1F41864F0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1F4186658]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x1F4186788]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

UCharDirection u_charDirection(UChar32 c)
{
  return MEMORY[0x1F417F700](*(void *)&c);
}

xmlErrorPtr xmlCtxtGetLastError(void *ctx)
{
  return (xmlErrorPtr)MEMORY[0x1F4182628](ctx);
}

void xmlFreeDoc(xmlDocPtr cur)
{
}

void xmlFreeParserCtxt(xmlParserCtxtPtr ctxt)
{
}

void xmlInitParser(void)
{
}

void xmlStopParser(xmlParserCtxtPtr ctxt)
{
}

int xmlStrEqual(const xmlChar *str1, const xmlChar *str2)
{
  return MEMORY[0x1F4182930](str1, str2);
}

int xmlStrlen(const xmlChar *str)
{
  return MEMORY[0x1F4182948](str);
}