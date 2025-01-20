@interface IPQuoteParser
+ (id)strippedQuoteBlockWithHtml:(id)a3;
@end

@implementation IPQuoteParser

+ (id)strippedQuoteBlockWithHtml:(id)a3
{
  CFStringRef v3 = (const __CFString *)a3;
  v4 = (__CFString *)v3;
  if (!v3)
  {
    v135 = 0;
    goto LABEL_332;
  }
  long long v171 = 0u;
  long long v172 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v166 = 0u;
  CFIndex Length = CFStringGetLength(v3);
  theString[0] = v4;
  *((void *)&v174 + 1) = 0;
  *(void *)&long long v175 = Length;
  CFStringRef CharactersPtr = (const __CFString *)CFStringGetCharactersPtr(v4);
  CStringPtr = 0;
  theString[1] = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v4, 0x600u);
  }
  *((void *)&v175 + 1) = 0;
  uint64_t v176 = 0;
  *(void *)&long long v174 = CStringPtr;
  if (Length < 1) {
    goto LABEL_326;
  }
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  BOOL v10 = 0;
  BOOL v11 = 0;
  uint64_t v151 = 0;
  uint64_t v152 = 0;
  uint64_t v142 = 0;
  uint64_t v139 = 0;
  unint64_t v140 = 0;
  uint64_t v146 = 0;
  unint64_t v147 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  BOOL v14 = 0;
  int v143 = 0;
  uint64_t v148 = Length - 14;
  uint64_t v150 = 0;
  uint64_t v15 = MEMORY[0x263EF8318];
  unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v149 = -1;
  CFIndex v141 = Length;
  do
  {
    if (v13 < 0)
    {
      if (v10) {
        goto LABEL_121;
      }
      UniChar v20 = 0;
LABEL_19:
      if (v8 && !v9)
      {
        if (v11)
        {
          BOOL v14 = 0;
          BOOL v10 = 0;
          uint64_t v9 = 0;
          BOOL v11 = 1;
        }
        else if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        {
          BOOL v14 = 0;
          BOOL v11 = 0;
          BOOL v10 = 0;
          uint64_t v9 = 0;
          unint64_t v16 = (*((void *)&v174 + 1) + v13) & ~((*((void *)&v174 + 1) + v13) >> 63);
        }
        else
        {
          BOOL v14 = 0;
          BOOL v11 = v20 <= 0x20u && ((1 << v20) & 0x100002600) != 0;
          BOOL v10 = 0;
          uint64_t v9 = 0;
        }
        goto LABEL_122;
      }
      if (v8 | v9)
      {
        BOOL v10 = 0;
        goto LABEL_122;
      }
      uint64_t v9 = 0;
      BOOL v10 = 0;
      if (v20 > 0xCu)
      {
        if (v20 != 32)
        {
          if (v20 != 13)
          {
LABEL_32:
            BOOL v30 = v12 > 0 && v151 == 0;
            int v31 = v30;
            v143 |= v31;
            if (v12 | v151)
            {
              BOOL v10 = 0;
              uint64_t v9 = 0;
              uint64_t v8 = 0;
            }
            else
            {
              BOOL v71 = v14 || v149 < 0;
              BOOL v14 = 0;
              uint64_t v151 = 0;
              uint64_t v12 = 0;
              if (v71) {
                uint64_t v72 = 0;
              }
              else {
                uint64_t v72 = v149;
              }
              uint64_t v73 = v150;
              if (v71) {
                uint64_t v73 = 0;
              }
              uint64_t v149 = v72;
              uint64_t v150 = v73;
              BOOL v30 = !v71;
              uint64_t v74 = v142;
              if (!v30) {
                uint64_t v74 = v13;
              }
              uint64_t v142 = v74;
              BOOL v10 = 0;
              uint64_t v9 = 0;
              uint64_t v8 = 0;
            }
            goto LABEL_122;
          }
LABEL_68:
          uint64_t v40 = v151;
          uint64_t v41 = v12 | v151;
          uint64_t v42 = v13 + ~v142;
          uint64_t v44 = v149;
          uint64_t v43 = v150;
          if (v149) {
            uint64_t v42 = v150;
          }
          uint64_t v45 = -1;
          if (v149 <= 3) {
            uint64_t v45 = v149 + 1;
          }
          if (!v41)
          {
            BOOL v14 = 1;
            uint64_t v40 = 0;
          }
          uint64_t v151 = v40;
          if (v41)
          {
            uint64_t v46 = v146;
          }
          else
          {
            uint64_t v12 = 0;
            uint64_t v46 = 0;
          }
          unint64_t v47 = v147;
          if (!v41) {
            unint64_t v47 = 0;
          }
          uint64_t v146 = v46;
          unint64_t v147 = v47;
          if (!v41)
          {
            uint64_t v44 = v45;
            uint64_t v43 = v42;
          }
          uint64_t v149 = v44;
          uint64_t v150 = v43;
          BOOL v10 = 0;
          uint64_t v9 = 0;
          uint64_t v8 = 0;
          goto LABEL_122;
        }
      }
      else if (v20 != 9)
      {
        if (v20 != 10) {
          goto LABEL_32;
        }
        goto LABEL_68;
      }
      uint64_t v8 = 0;
      goto LABEL_122;
    }
    uint64_t v17 = v175;
    if ((uint64_t)v175 > v13)
    {
      v18 = (UniChar *)theString[1];
      if (theString[1])
      {
        uint64_t v19 = *((void *)&v174 + 1) + v13;
        goto LABEL_10;
      }
      if (!(void)v174)
      {
        if (v176 <= v13 || (uint64_t v38 = *((void *)&v175 + 1), *((uint64_t *)&v175 + 1) > v13))
        {
          uint64_t v39 = v13 - 4;
          if ((unint64_t)v13 < 4) {
            uint64_t v39 = 0;
          }
          if (v39 + 64 < (uint64_t)v175) {
            uint64_t v17 = v39 + 64;
          }
          *((void *)&v175 + 1) = v39;
          uint64_t v176 = v17;
          v178.location = *((void *)&v174 + 1) + v39;
          v178.length = v17 - v39;
          CFStringGetCharacters(theString[0], v178, buffer);
          uint64_t v15 = MEMORY[0x263EF8318];
          uint64_t v38 = *((void *)&v175 + 1);
        }
        uint64_t v19 = v13 - v38;
        v18 = buffer;
LABEL_10:
        UniChar v20 = v18[v19];
        if (v10) {
          goto LABEL_24;
        }
        goto LABEL_11;
      }
      UniChar v20 = *(char *)(v174 + *((void *)&v174 + 1) + v13);
      if (!v10) {
        goto LABEL_11;
      }
LABEL_24:
      *(_OWORD *)theString1 = *(_OWORD *)theString;
      long long v162 = v174;
      long long v163 = v175;
      uint64_t v164 = v176;
      long long v157 = v169;
      long long v158 = v170;
      long long v159 = v171;
      long long v160 = v172;
      *(_OWORD *)v153 = *(_OWORD *)buffer;
      long long v154 = v166;
      long long v155 = v167;
      long long v156 = v168;
      uint64_t v26 = v175;
      if ((uint64_t)v175 <= v13) {
        goto LABEL_121;
      }
      v27 = (UniChar *)theString1[1];
      if (theString1[1])
      {
        uint64_t v28 = *((void *)&v162 + 1) + v13;
      }
      else
      {
        if ((void)v162)
        {
          UniChar v29 = *(char *)(v162 + *((void *)&v162 + 1) + v13);
          goto LABEL_52;
        }
        if (v164 <= v13 || (uint64_t v50 = *((void *)&v163 + 1), *((uint64_t *)&v163 + 1) > v13))
        {
          uint64_t v51 = v13 - 4;
          if ((unint64_t)v13 < 4) {
            uint64_t v51 = 0;
          }
          if (v51 + 64 < (uint64_t)v175) {
            uint64_t v26 = v51 + 64;
          }
          *((void *)&v163 + 1) = v51;
          uint64_t v164 = v26;
          v179.location = *((void *)&v162 + 1) + v51;
          v179.length = v26 - v51;
          CFStringGetCharacters(theString1[0], v179, v153);
          uint64_t v15 = MEMORY[0x263EF8318];
          uint64_t v50 = *((void *)&v163 + 1);
        }
        uint64_t v28 = v13 - v50;
        v27 = v153;
      }
      UniChar v29 = v27[v28];
LABEL_52:
      if (v29 != 45) {
        goto LABEL_121;
      }
      uint64_t v33 = v13 + 1;
      uint64_t v34 = v163;
      if ((uint64_t)v163 <= v13 + 1) {
        goto LABEL_121;
      }
      v35 = (UniChar *)theString1[1];
      if (theString1[1])
      {
        uint64_t v36 = *((void *)&v162 + 1) + v33;
      }
      else
      {
        if ((void)v162)
        {
          UniChar v37 = *(char *)(v162 + *((void *)&v162 + 1) + v33);
LABEL_116:
          if (v37 == 45)
          {
            unint64_t v137 = v16;
            v57 = v4;
            uint64_t v58 = v12;
            uint64_t v59 = v8;
            uint64_t v60 = v13 + 2;
            uint64_t v61 = v163;
            if ((uint64_t)v163 <= v13 + 2)
            {
              BOOL v10 = 1;
LABEL_183:
              uint64_t v8 = v59;
              uint64_t v12 = v58;
              v4 = v57;
              unint64_t v16 = v137;
              goto LABEL_122;
            }
            v62 = (UniChar *)theString1[1];
            if (theString1[1])
            {
              uint64_t v63 = *((void *)&v162 + 1) + v60;
            }
            else
            {
              if ((void)v162)
              {
                UniChar v64 = *(char *)(v162 + *((void *)&v162 + 1) + v60);
LABEL_181:
                BOOL v10 = v64 != 62;
                if (v64 == 62) {
                  v13 += 2;
                }
                goto LABEL_183;
              }
              if (v164 <= v60 || (uint64_t v97 = *((void *)&v163 + 1), *((uint64_t *)&v163 + 1) > v60))
              {
                uint64_t v98 = v13 - 2;
                if ((unint64_t)v13 < 2) {
                  uint64_t v98 = 0;
                }
                if (v98 + 64 < (uint64_t)v163) {
                  uint64_t v61 = v98 + 64;
                }
                *((void *)&v163 + 1) = v98;
                uint64_t v164 = v61;
                v183.location = *((void *)&v162 + 1) + v98;
                v183.length = v61 - v98;
                CFStringGetCharacters(theString1[0], v183, v153);
                uint64_t v15 = MEMORY[0x263EF8318];
                uint64_t v97 = *((void *)&v163 + 1);
              }
              uint64_t v63 = v60 - v97;
              v62 = v153;
            }
            UniChar v64 = v62[v63];
            goto LABEL_181;
          }
LABEL_121:
          BOOL v10 = 1;
          goto LABEL_122;
        }
        if (v164 <= v33 || (uint64_t v83 = *((void *)&v163 + 1), *((uint64_t *)&v163 + 1) > v33))
        {
          uint64_t v84 = v13 - 3;
          if ((unint64_t)v13 < 3) {
            uint64_t v84 = 0;
          }
          if (v84 + 64 < (uint64_t)v163) {
            uint64_t v34 = v84 + 64;
          }
          *((void *)&v163 + 1) = v84;
          uint64_t v164 = v34;
          v181.location = *((void *)&v162 + 1) + v84;
          v181.length = v34 - v84;
          CFStringGetCharacters(theString1[0], v181, v153);
          uint64_t v15 = MEMORY[0x263EF8318];
          uint64_t v83 = *((void *)&v163 + 1);
        }
        uint64_t v36 = v33 - v83;
        v35 = v153;
      }
      UniChar v37 = v35[v36];
      goto LABEL_116;
    }
    UniChar v20 = 0;
    if (v10) {
      goto LABEL_24;
    }
LABEL_11:
    if (v20 == 62)
    {
      BOOL v14 = 0;
      if (!v8 || v9)
      {
        BOOL v10 = 0;
        goto LABEL_122;
      }
      unint64_t v32 = Length - v16;
      if (Length < v16)
      {
        BOOL v14 = 0;
        BOOL v10 = 0;
        uint64_t v9 = 0;
        goto LABEL_122;
      }
      if (v32 < 0xA)
      {
        if (v151) {
          BOOL v65 = 1;
        }
        else {
          BOOL v65 = v12 <= 0;
        }
        int v66 = !v65;
        v143 |= v66;
        if (v32 < 4)
        {
          BOOL v144 = v11;
          if (v32 == 3)
          {
            uint64_t v138 = v12;
            BOOL v76 = 0;
            BOOL v68 = 0;
            BOOL v67 = 0;
            BOOL v75 = [(__CFString *)v4 compare:@"div", 1, v16, 3 options range] == 0;
          }
          else
          {
            unint64_t v77 = v16;
            if (v32 < 2)
            {
              BOOL v76 = 0;
              BOOL v79 = 0;
              BOOL v67 = 0;
              BOOL v75 = 0;
              BOOL v78 = 0;
              goto LABEL_153;
            }
            uint64_t v138 = v12;
            BOOL v76 = 0;
            BOOL v68 = 0;
            BOOL v67 = 0;
            BOOL v75 = 0;
          }
LABEL_152:
          unint64_t v77 = v16;
          BOOL v78 = [(__CFString *)v4 compare:@"br", 1, v16, 2 options range] == 0;
          uint64_t v15 = MEMORY[0x263EF8318];
          BOOL v79 = v68;
          uint64_t v12 = v138;
LABEL_153:
          int v80 = 0;
          if (!v78 && !v75 && !v76 || v12 | v151)
          {
            BOOL v81 = 0;
          }
          else
          {
            BOOL v81 = v149 == 0;
            uint64_t v82 = v150;
            if (!v149) {
              uint64_t v82 = v152 + ~v142;
            }
            uint64_t v150 = v82;
            if (v149 >= 4)
            {
              uint64_t v146 = 0;
              unint64_t v147 = 0;
              BOOL v81 = 0;
              uint64_t v149 = -1;
            }
            else
            {
              ++v149;
            }
            int v80 = 1;
          }
          if (v76 || v79)
          {
            unint64_t v90 = v140;
            unint64_t v16 = v77;
            if (v150 >= 1)
            {
LABEL_188:
              BOOL v91 = !v81;
              uint64_t v92 = v146;
              if (!v91) {
                uint64_t v92 = v13 - v90;
              }
              uint64_t v146 = v92;
              unint64_t v93 = v147;
              if (!v91) {
                unint64_t v93 = v90;
              }
              unint64_t v147 = v93;
            }
          }
          else
          {
            BOOL v94 = v150 > 0 && v78;
            unint64_t v90 = v140;
            unint64_t v16 = v77;
            if (v94) {
              goto LABEL_188;
            }
          }
          BOOL v11 = v144;
          if (v75 || v67)
          {
            unint64_t v140 = v152;
          }
          else
          {
            if (v78) {
              unint64_t v90 = v16 + 3;
            }
            unint64_t v140 = v90;
          }
          goto LABEL_203;
        }
LABEL_131:
        uint64_t v138 = v12;
        BOOL v67 = [(__CFString *)v4 compare:@"span", 1, v16, 4 options range] == 0;
        BOOL v144 = v11;
        BOOL v68 = v32 >= 5
           && [(__CFString *)v4 compare:@"/span", 1, v16, 5 options range] == 0;
        BOOL v75 = [(__CFString *)v4 compare:@"div", 1, v16, 3 options range] == 0;
        BOOL v76 = [(__CFString *)v4 compare:@"/div", 1, v16, 4 options range] == 0;
        goto LABEL_152;
      }
      if ([(__CFString *)v4 compare:@"blockquote", 1, v16, 10 options range])
      {
        if (!v151
          || v32 < 0xB
          || [(__CFString *)v4 compare:@"/blockquote", 1, v16, 11 options range])
        {
          if (v151) {
            BOOL v48 = 1;
          }
          else {
            BOOL v48 = v12 <= 0;
          }
          int v49 = !v48;
          v143 |= v49;
          goto LABEL_131;
        }
        if (v151 == 1)
        {
          int v80 = 0;
          uint64_t v151 = 0;
          uint64_t v12 = v13 - v139 + 1;
        }
        else
        {
          --v151;
          int v80 = 0;
        }
        uint64_t v15 = MEMORY[0x263EF8318];
LABEL_203:
        BOOL v10 = 0;
        uint64_t v9 = 0;
        --v8;
        BOOL v14 = v80 != 0;
        goto LABEL_122;
      }
      uint64_t v15 = MEMORY[0x263EF8318];
      if (v151)
      {
        int v80 = 0;
        ++v151;
        goto LABEL_203;
      }
      if (v12 >= 1)
      {
        if (v143) {
          goto LABEL_325;
        }
        int v143 = 0;
        int v80 = 0;
        goto LABEL_209;
      }
      if (v149 < 0 || (uint64_t v122 = v142 + v150, v142 + v150 < 0) || (v123 = v175, (uint64_t)v175 <= v122))
      {
        int v80 = 0;
        uint64_t v151 = 1;
        uint64_t v139 = v152;
        goto LABEL_203;
      }
      v124 = (UniChar *)theString[1];
      if (theString[1])
      {
        uint64_t v125 = *((void *)&v174 + 1) + v122;
      }
      else
      {
        if ((void)v174)
        {
          UniChar v126 = *(char *)(v174 + *((void *)&v174 + 1) + v122);
          goto LABEL_311;
        }
        if (v176 <= v122 || (uint64_t v131 = *((void *)&v175 + 1), *((uint64_t *)&v175 + 1) > v122))
        {
          uint64_t v132 = v122 - 4;
          if ((unint64_t)v122 < 4) {
            uint64_t v132 = 0;
          }
          if (v132 + 64 < (uint64_t)v175) {
            uint64_t v123 = v132 + 64;
          }
          *((void *)&v175 + 1) = v132;
          uint64_t v176 = v123;
          v187.location = *((void *)&v174 + 1) + v132;
          v187.length = v123 - v132;
          CFStringGetCharacters(theString[0], v187, buffer);
          uint64_t v15 = MEMORY[0x263EF8318];
          uint64_t v131 = *((void *)&v175 + 1);
        }
        uint64_t v125 = v122 - v131;
        v124 = buffer;
      }
      UniChar v126 = v124[v125];
LABEL_311:
      int v80 = 0;
      uint64_t v129 = v142;
      if (v146 > 0) {
        uint64_t v129 = v147;
      }
      BOOL v30 = v126 == 58;
      uint64_t v130 = v152;
      if (v30) {
        uint64_t v130 = v129;
      }
      uint64_t v139 = v130;
LABEL_209:
      uint64_t v151 = 1;
      goto LABEL_203;
    }
    if (v20 != 60) {
      goto LABEL_19;
    }
    unint64_t v21 = v13 + 1;
    *(_OWORD *)theString1 = *(_OWORD *)theString;
    long long v162 = v174;
    long long v163 = v175;
    uint64_t v164 = v176;
    long long v157 = v169;
    long long v158 = v170;
    long long v159 = v171;
    long long v160 = v172;
    *(_OWORD *)v153 = *(_OWORD *)buffer;
    long long v154 = v166;
    long long v155 = v167;
    long long v156 = v168;
    uint64_t v22 = v175;
    if ((uint64_t)v175 <= v13 + 1) {
      goto LABEL_233;
    }
    v23 = (UniChar *)theString1[1];
    if (theString1[1])
    {
      unint64_t v24 = *((void *)&v162 + 1) + v21;
    }
    else
    {
      if ((void)v162)
      {
        UniChar v25 = *(char *)(v162 + *((void *)&v162 + 1) + v21);
        goto LABEL_109;
      }
      if (v164 <= (uint64_t)v21 || (uint64_t v69 = *((void *)&v163 + 1), *((uint64_t *)&v163 + 1) > (uint64_t)v21))
      {
        uint64_t v70 = v13 - 3;
        if (v21 < 4) {
          uint64_t v70 = 0;
        }
        if (v70 + 64 < (uint64_t)v175) {
          uint64_t v22 = v70 + 64;
        }
        *((void *)&v163 + 1) = v70;
        uint64_t v164 = v22;
        v180.location = *((void *)&v162 + 1) + v70;
        v180.length = v22 - v70;
        CFStringGetCharacters(theString1[0], v180, v153);
        uint64_t v15 = MEMORY[0x263EF8318];
        uint64_t v69 = *((void *)&v163 + 1);
      }
      unint64_t v24 = v21 - v69;
      v23 = v153;
    }
    UniChar v25 = v23[v24];
LABEL_109:
    if (v25 != 33) {
      goto LABEL_233;
    }
    uint64_t v52 = v13 + 2;
    uint64_t v53 = v163;
    if ((uint64_t)v163 <= v13 + 2) {
      goto LABEL_233;
    }
    v54 = (UniChar *)theString1[1];
    if (theString1[1])
    {
      uint64_t v55 = *((void *)&v162 + 1) + v52;
    }
    else
    {
      if ((void)v162)
      {
        UniChar v56 = *(char *)(v162 + *((void *)&v162 + 1) + v52);
        goto LABEL_174;
      }
      if (v164 <= v52 || (uint64_t v95 = *((void *)&v163 + 1), *((uint64_t *)&v163 + 1) > v52))
      {
        uint64_t v96 = v13 - 2;
        if (v21 < 3) {
          uint64_t v96 = 0;
        }
        if (v96 + 64 < (uint64_t)v163) {
          uint64_t v53 = v96 + 64;
        }
        *((void *)&v163 + 1) = v96;
        uint64_t v164 = v53;
        v182.location = *((void *)&v162 + 1) + v96;
        v182.length = v53 - v96;
        CFStringGetCharacters(theString1[0], v182, v153);
        uint64_t v15 = MEMORY[0x263EF8318];
        uint64_t v95 = *((void *)&v163 + 1);
      }
      uint64_t v55 = v52 - v95;
      v54 = v153;
    }
    UniChar v56 = v54[v55];
LABEL_174:
    if (v56 == 45)
    {
      uint64_t v85 = v13 + 3;
      uint64_t v86 = v163;
      if ((uint64_t)v163 > v13 + 3)
      {
        v87 = (UniChar *)theString1[1];
        if (theString1[1])
        {
          uint64_t v88 = *((void *)&v162 + 1) + v85;
        }
        else
        {
          if ((void)v162)
          {
            UniChar v89 = *(char *)(v162 + *((void *)&v162 + 1) + v85);
LABEL_231:
            if (v89 == 45)
            {
              BOOL v14 = 0;
              BOOL v10 = 1;
              uint64_t v13 = v85;
              goto LABEL_122;
            }
            goto LABEL_233;
          }
          if (v164 <= v85 || (uint64_t v127 = *((void *)&v163 + 1), *((uint64_t *)&v163 + 1) > v85))
          {
            uint64_t v128 = v13 - 1;
            if (v21 < 2) {
              uint64_t v128 = 0;
            }
            if (v128 + 64 < (uint64_t)v163) {
              uint64_t v86 = v128 + 64;
            }
            *((void *)&v163 + 1) = v128;
            uint64_t v164 = v86;
            v186.location = *((void *)&v162 + 1) + v128;
            v186.length = v86 - v128;
            CFStringGetCharacters(theString1[0], v186, v153);
            uint64_t v85 = v13 + 3;
            uint64_t v15 = MEMORY[0x263EF8318];
            uint64_t v127 = *((void *)&v163 + 1);
          }
          uint64_t v88 = v85 - v127;
          v87 = v153;
        }
        UniChar v89 = v87[v88];
        goto LABEL_231;
      }
    }
LABEL_233:
    v99 = v4;
    uint64_t v100 = v13 + 64;
    uint64_t v101 = v13;
    do
    {
      uint64_t v102 = v101++;
      if (v102 < -1 || (uint64_t v103 = v175, (uint64_t)v175 <= v101))
      {
        unsigned int v105 = 0;
LABEL_239:
        int v106 = *(_DWORD *)(v15 + 4 * v105 + 60) & 0x4000;
        goto LABEL_240;
      }
      if (theString[1])
      {
        UniChar v104 = *((_WORD *)&theString[1]->isa + v102 + *((void *)&v174 + 1) + 1);
      }
      else if ((void)v174)
      {
        UniChar v104 = *(char *)(v174 + *((void *)&v174 + 1) + v102 + 1);
      }
      else
      {
        if (v176 <= v101 || (uint64_t v107 = *((void *)&v175 + 1), *((uint64_t *)&v175 + 1) > v101))
        {
          uint64_t v108 = v102 - 3;
          if ((unint64_t)v101 < 4) {
            uint64_t v108 = 0;
          }
          if (v108 + 64 < (uint64_t)v175) {
            uint64_t v103 = v108 + 64;
          }
          *((void *)&v175 + 1) = v108;
          uint64_t v176 = v103;
          v184.location = *((void *)&v174 + 1) + v108;
          v184.length = v103 - v108;
          CFStringGetCharacters(theString[0], v184, buffer);
          uint64_t v15 = MEMORY[0x263EF8318];
          uint64_t v107 = *((void *)&v175 + 1);
        }
        UniChar v104 = buffer[v102 + 1 - v107];
      }
      unsigned int v105 = v104;
      if (v104 <= 0x7Fu) {
        goto LABEL_239;
      }
      int v106 = __maskrune(v104, 0x4000uLL);
      uint64_t v15 = MEMORY[0x263EF8318];
LABEL_240:
      ++v100;
    }
    while (v106);
    uint64_t v109 = v152;
    if (!v9) {
      uint64_t v109 = v13;
    }
    uint64_t v152 = v109;
    v8 += v9 == 0;
    if (v101 >= v148)
    {
      BOOL v14 = 0;
      BOOL v11 = 0;
      BOOL v10 = 0;
      unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      *(_OWORD *)theString1 = *(_OWORD *)theString;
      long long v162 = v174;
      long long v163 = v175;
      uint64_t v164 = v176;
      long long v157 = v169;
      long long v158 = v170;
      long long v159 = v171;
      long long v160 = v172;
      *(_OWORD *)v153 = *(_OWORD *)buffer;
      long long v154 = v166;
      long long v155 = v167;
      long long v156 = v168;
      uint64_t v145 = v8;
      if (v102 < -1 || (uint64_t v110 = v163, (uint64_t)v163 <= v101))
      {
        UniChar v111 = 0;
      }
      else if (theString1[1])
      {
        UniChar v111 = *((_WORD *)&theString1[1]->isa + *((void *)&v162 + 1) + v101);
      }
      else if ((void)v162)
      {
        UniChar v111 = *(char *)(v162 + *((void *)&v162 + 1) + v101);
      }
      else
      {
        if (v164 <= v101 || (uint64_t v119 = *((void *)&v163 + 1), *((uint64_t *)&v163 + 1) > v101))
        {
          uint64_t v120 = 4;
          if ((unint64_t)v101 < 4) {
            uint64_t v120 = v101;
          }
          uint64_t v121 = v101 - v120 + 64;
          if (v121 >= (uint64_t)v163) {
            uint64_t v121 = v163;
          }
          *((void *)&v163 + 1) = v101 - v120;
          uint64_t v164 = v121;
          if ((uint64_t)v163 >= v100 - v120) {
            uint64_t v110 = v100 - v120;
          }
          v185.length = v110 + v120 - v101;
          v185.location = v101 - v120 + *((void *)&v162 + 1);
          CFStringGetCharacters(theString1[0], v185, v153);
          uint64_t v119 = *((void *)&v163 + 1);
        }
        UniChar v111 = v153[v101 - v119];
      }
      BOOL v112 = v111 == 47;
      if (v111 == 47) {
        uint64_t v113 = -1;
      }
      else {
        uint64_t v113 = 1;
      }
      uint64_t v114 = *((void *)&v162 + 1);
      if (v111 == 47) {
        uint64_t v115 = *((void *)&v162 + 1) + 1;
      }
      else {
        uint64_t v115 = *((void *)&v162 + 1);
      }
      CFIndex v116 = v115 + v101;
      CFIndex v117 = CFStringGetLength(theString1[0]) - v114 - v112;
      unint64_t v118 = v117 - v101;
      if (v117 - v101 >= 5)
      {
        v188.location = v116;
        v188.length = 5;
        v4 = v99;
        if (CFStringCompareWithOptions(theString1[0], @"style", v188, 1uLL) == kCFCompareEqualTo)
        {
          CFIndex Length = v141;
          goto LABEL_279;
        }
        if (v118 >= 6)
        {
          v189.location = v116;
          v189.length = 6;
          CFIndex Length = v141;
          if (CFStringCompareWithOptions(theString1[0], @"script", v189, 1uLL) == kCFCompareEqualTo) {
            goto LABEL_279;
          }
        }
        else
        {
          CFIndex Length = v141;
        }
      }
      else
      {
        v4 = v99;
        CFIndex Length = v141;
        if (v117 - 4 != v101)
        {
LABEL_278:
          uint64_t v113 = 0;
          goto LABEL_279;
        }
      }
      v190.location = v116;
      v190.length = 4;
      if (CFStringCompareWithOptions(theString1[0], @"head", v190, 1uLL)) {
        goto LABEL_278;
      }
LABEL_279:
      BOOL v14 = 0;
      BOOL v11 = 0;
      BOOL v10 = 0;
      v9 += v113;
      unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v8 = v145;
      uint64_t v15 = MEMORY[0x263EF8318];
    }
LABEL_122:
    ++v13;
  }
  while (v13 < Length);
  if (v12 >= 1)
  {
LABEL_325:
    -[__CFString stringByReplacingCharactersInRange:withString:](v4, "stringByReplacingCharactersInRange:withString:", v139, v12, &stru_26D895C60);
    v133 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_327;
  }
LABEL_326:
  v133 = 0;
LABEL_327:
  if (v133) {
    v134 = v133;
  }
  else {
    v134 = v4;
  }
  v135 = v134;

LABEL_332:
  return v135;
}

@end