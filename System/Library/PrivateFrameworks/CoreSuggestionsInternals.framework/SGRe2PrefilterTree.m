@interface SGRe2PrefilterTree
- (SGRe2PrefilterTree)initWithData:(id)a3;
- (id)regexpIdsThatMightMatchUtf8:(const char *)a3;
@end

@implementation SGRe2PrefilterTree

- (void).cxx_destruct
{
}

- (id)regexpIdsThatMightMatchUtf8:(const char *)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  if (a3 && *a3)
  {
    uint64_t v4 = objc_opt_new();
    v5 = a3;
    v64 = (void *)v4;
    int v6 = *(unsigned __int8 *)a3;
    if (*a3)
    {
      unint64_t v7 = 0;
      unint64_t v8 = 0;
      unsigned int v9 = 0;
      unsigned int v10 = 0;
      unsigned int v11 = 0;
      if (self->_n3 <= 1u) {
        int n3 = 1;
      }
      else {
        int n3 = self->_n3;
      }
      unsigned int n2 = self->_n2;
      if (n2 <= 1) {
        unsigned int n2 = 1;
      }
      unsigned int v62 = n2;
      unsigned int v63 = n3;
      unsigned int n1 = self->_n1;
      if (n1 <= 1) {
        unsigned int n1 = 1;
      }
      unsigned int v61 = n1;
      v15 = a3;
      do
      {
        unsigned __int8 v16 = v6 + 32 * ((v6 - 65) < 0x1A);
        unsigned int v11 = 33 * (v11 - 1089 * BYTE2(v8)) + v16;
        if (v7 >= 2)
        {
          unsigned __int16 v17 = self->_n1;
          if (v17)
          {
            unsigned int v18 = v11 % v61;
            h1 = self->_h1;
            while (h1[v18] != 0xFFFF)
            {
              uint64_t v20 = 0;
              s1 = self->_s1;
              v22 = &s1[h1[v18]];
              while (1)
              {
                int v23 = v22[v20];
                if (!v22[v20]) {
                  break;
                }
                int v24 = v15[v20 - 2];
                if (v15[v20 - 2])
                {
                  ++v20;
                  if (v24 + 32 * ((v24 - 65) < 0x1A) == v23) {
                    continue;
                  }
                }
                goto LABEL_20;
              }
              [v64 addIndex:*(unsigned __int16 *)&s1[h1[v18] - 2]];
              v5 = a3;
              unsigned __int16 v17 = self->_n1;
              h1 = self->_h1;
LABEL_20:
              if ((int)(v18 + 1) < v17) {
                ++v18;
              }
              else {
                unsigned int v18 = 0;
              }
            }
          }
        }
        unsigned int v10 = 33 * (v10 - 39135393 * BYTE5(v8)) + v16;
        if (v7 >= 5)
        {
          unsigned __int16 v25 = self->_n2;
          if (v25)
          {
            unsigned int v26 = v10 % v62;
            h2 = self->_h2;
            while (h2[v26] != 0xFFFF)
            {
              uint64_t v28 = 0;
              s2 = self->_s2;
              v30 = &s2[h2[v26]];
              while (1)
              {
                int v31 = v30[v28];
                if (!v30[v28]) {
                  break;
                }
                int v32 = v15[v28 - 5];
                if (v15[v28 - 5])
                {
                  ++v28;
                  if (v32 + 32 * ((v32 - 65) < 0x1A) == v31) {
                    continue;
                  }
                }
                goto LABEL_32;
              }
              [v64 addIndex:*(unsigned __int16 *)&s2[h2[v26] - 2]];
              v5 = a3;
              unsigned __int16 v25 = self->_n2;
              h2 = self->_h2;
LABEL_32:
              if ((int)(v26 + 1) < v25) {
                ++v26;
              }
              else {
                unsigned int v26 = 0;
              }
            }
          }
        }
        unsigned int v9 = 33 * (v9 + 331229983 * HIBYTE(v8)) + v16;
        if (v7 >= 7)
        {
          unsigned __int16 v33 = self->_n3;
          if (v33)
          {
            unsigned int v34 = v9 % v63;
            h3 = self->_h3;
            while (h3[v34] != 0xFFFF)
            {
              uint64_t v36 = 0;
              s3 = self->_s3;
              v38 = &s3[h3[v34]];
              while (1)
              {
                int v39 = v38[v36];
                if (!v38[v36]) {
                  break;
                }
                int v40 = v15[v36 - 7];
                if (v15[v36 - 7])
                {
                  ++v36;
                  if (v40 + 32 * ((v40 - 65) < 0x1A) == v39) {
                    continue;
                  }
                }
                goto LABEL_44;
              }
              [v64 addIndex:*(unsigned __int16 *)&s3[h3[v34] - 2]];
              v5 = a3;
              unsigned __int16 v33 = self->_n3;
              h3 = self->_h3;
LABEL_44:
              if ((int)(v34 + 1) < v33) {
                ++v34;
              }
              else {
                unsigned int v34 = 0;
              }
            }
          }
        }
        unint64_t v8 = v16 | (v8 << 8);
        int v6 = v5[++v7];
        ++v15;
      }
      while (v5[v7]);
    }
    v41 = objc_opt_new();
    memset(v67, 0, sizeof(v67));
    if (!self->_nrpns) {
      goto LABEL_75;
    }
    int v42 = 0;
    uint64_t v43 = 0;
    rpns = self->_rpns;
    while (1)
    {
      unsigned int v46 = *rpns++;
      uint64_t v45 = v46;
      if (!v46) {
        goto LABEL_72;
      }
      uint64_t v47 = 0;
      uint64_t v48 = 0;
LABEL_53:
      if (v48 == 64) {
        break;
      }
      uint64_t v49 = rpns[1];
      switch(*rpns)
      {
        case 0u:
          *((unsigned char *)v67 + v48) = [v64 containsIndex:v49];
          goto LABEL_69;
        case 1u:
          if (v48 < v49) {
            goto LABEL_83;
          }
          if (!rpns[1])
          {
            char v52 = 1;
            goto LABEL_68;
          }
          __int16 v50 = v49 - 1;
          v51 = &v66 + v48;
          char v52 = 1;
          do
          {
            char v53 = *v51--;
            v52 &= v53;
            LODWORD(v49) = v49 - 1;
          }
          while ((_WORD)v49);
          goto LABEL_65;
        case 2u:
          if (v48 < v49)
          {
LABEL_83:
            v58 = sgLogHandle();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v59 = "Prefilter tree stack underflow";
LABEL_85:
              _os_log_impl(&dword_1CA650000, v58, OS_LOG_TYPE_DEFAULT, v59, buf, 2u);
            }
            goto LABEL_86;
          }
          char v52 = 0;
          if (rpns[1])
          {
            __int16 v50 = v49 - 1;
            v54 = &v66 + v48;
            do
            {
              char v55 = *v54--;
              v52 |= v55;
              LODWORD(v49) = v49 - 1;
            }
            while ((_WORD)v49);
LABEL_65:
            v48 += ~v50 | 0xFFFFFFFFFFFF0000;
          }
LABEL_68:
          *((unsigned char *)v67 + v48) = v52;
LABEL_69:
          ++v48;
LABEL_70:
          rpns += 2;
          if (++v47 != v45) {
            goto LABEL_53;
          }
          int v42 = LOBYTE(v67[0]);
LABEL_72:
          if (v42) {
            [v41 addIndex:v43];
          }
          if (++v43 >= (unint64_t)self->_nrpns)
          {
LABEL_75:
            id v56 = v41;
            goto LABEL_76;
          }
          break;
        case 3u:
          *((unsigned char *)v67 + v48) = 1;
          goto LABEL_69;
        default:
          goto LABEL_70;
      }
    }
    v58 = sgLogHandle();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v59 = "Prefilter tree stack overflow";
      goto LABEL_85;
    }
LABEL_86:

    id v56 = 0;
LABEL_76:
  }
  else
  {
    id v56 = 0;
  }
  return v56;
}

- (SGRe2PrefilterTree)initWithData:(id)a3
{
  id v6 = a3;
  if ((unint64_t)[v6 length] <= 0x1C)
  {
    unsigned int v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"SGRe2PrefilterTree.m", 36, @"Invalid parameter not satisfying: %@", @"data.length > 7*sizeof(uint32_t)" object file lineNumber description];
  }
  v55.receiver = self;
  v55.super_class = (Class)SGRe2PrefilterTree;
  unint64_t v7 = [(SGRe2PrefilterTree *)&v55 init];
  unint64_t v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_data, a3);
    id v9 = v6;
    unsigned int v10 = (unsigned int *)[v9 bytes];
    id v11 = v9;
    uint64_t v12 = [v11 bytes];
    uint64_t v13 = [v11 length];
    v14 = (const unsigned __int16 *)(v12 + v13);
    uint64_t v15 = *v10;
    rpns = (const unsigned __int16 *)(v12 + v15);
    v8->_rpns = (const unsigned __int16 *)(v12 + v15);
    if (v12 + v15 > (unint64_t)(v12 + v13))
    {
      v35 = [MEMORY[0x1E4F28B00] currentHandler];
      [v35 handleFailureInMethod:a2, v8, @"SGRe2PrefilterTree.m", 44, @"Invalid parameter not satisfying: %@", @"(const uint8_t *)(_rpns) <= (const uint8_t *)end" object file lineNumber description];

      rpns = v8->_rpns;
    }
    h1 = (const unsigned __int16 *)(v12 + v10[1]);
    h2 = (const unsigned __int16 *)(v12 + v10[2]);
    v8->_h1 = h1;
    v8->_h2 = h2;
    v8->_h3 = (const unsigned __int16 *)(v12 + v10[3]);
    if (rpns > h1)
    {
      uint64_t v36 = [MEMORY[0x1E4F28B00] currentHandler];
      [v36 handleFailureInMethod:a2, v8, @"SGRe2PrefilterTree.m", 57, @"Invalid parameter not satisfying: %@", @"(const uint8_t *)(_rpns) <= (const uint8_t *)(_h1)" object file lineNumber description];

      h1 = v8->_h1;
      h2 = v8->_h2;
    }
    if (h1 > h2)
    {
      v37 = [MEMORY[0x1E4F28B00] currentHandler];
      [v37 handleFailureInMethod:a2, v8, @"SGRe2PrefilterTree.m", 58, @"Invalid parameter not satisfying: %@", @"(const uint8_t *)(_h1) <= (const uint8_t *)(_h2)" object file lineNumber description];

      h2 = v8->_h2;
    }
    if (h2 > v8->_h3)
    {
      v38 = [MEMORY[0x1E4F28B00] currentHandler];
      [v38 handleFailureInMethod:a2, v8, @"SGRe2PrefilterTree.m", 59, @"Invalid parameter not satisfying: %@", @"(const uint8_t *)(_h2) <= (const uint8_t *)(_h3)" object file lineNumber description];
    }
    if (v8->_h1 > v14)
    {
      int v39 = [MEMORY[0x1E4F28B00] currentHandler];
      [v39 handleFailureInMethod:a2, v8, @"SGRe2PrefilterTree.m", 60, @"Invalid parameter not satisfying: %@", @"(const uint8_t *)(_h1) <= (const uint8_t *)end" object file lineNumber description];
    }
    if (v8->_h2 > v14)
    {
      int v40 = [MEMORY[0x1E4F28B00] currentHandler];
      [v40 handleFailureInMethod:a2, v8, @"SGRe2PrefilterTree.m", 61, @"Invalid parameter not satisfying: %@", @"(const uint8_t *)(_h2) <= (const uint8_t *)end" object file lineNumber description];
    }
    h3 = v8->_h3;
    if (h3 > v14)
    {
      v41 = [MEMORY[0x1E4F28B00] currentHandler];
      [v41 handleFailureInMethod:a2, v8, @"SGRe2PrefilterTree.m", 62, @"Invalid parameter not satisfying: %@", @"(const uint8_t *)(_h3) <= (const uint8_t *)end" object file lineNumber description];

      h3 = v8->_h3;
    }
    s1 = (const char *)(v12 + v10[4]);
    s2 = (const char *)(v12 + v10[5]);
    v8->_s1 = s1;
    v8->_s2 = s2;
    v8->_s3 = (const char *)(v12 + v10[6]);
    if (h3 > (const unsigned __int16 *)s1)
    {
      int v42 = [MEMORY[0x1E4F28B00] currentHandler];
      [v42 handleFailureInMethod:a2, v8, @"SGRe2PrefilterTree.m", 72, @"Invalid parameter not satisfying: %@", @"(const uint8_t *)(_h3) <= (const uint8_t *)(_s1)" object file lineNumber description];

      s1 = v8->_s1;
      s2 = v8->_s2;
    }
    if (s1 > s2)
    {
      uint64_t v43 = [MEMORY[0x1E4F28B00] currentHandler];
      [v43 handleFailureInMethod:a2, v8, @"SGRe2PrefilterTree.m", 73, @"Invalid parameter not satisfying: %@", @"(const uint8_t *)(_s1) <= (const uint8_t *)(_s2)" object file lineNumber description];

      s2 = v8->_s2;
    }
    if (s2 > v8->_s3)
    {
      v44 = [MEMORY[0x1E4F28B00] currentHandler];
      [v44 handleFailureInMethod:a2, v8, @"SGRe2PrefilterTree.m", 74, @"Invalid parameter not satisfying: %@", @"(const uint8_t *)(_s2) <= (const uint8_t *)(_s3)" object file lineNumber description];
    }
    if (v8->_s1 > (const char *)v14)
    {
      uint64_t v45 = [MEMORY[0x1E4F28B00] currentHandler];
      [v45 handleFailureInMethod:a2, v8, @"SGRe2PrefilterTree.m", 75, @"Invalid parameter not satisfying: %@", @"(const uint8_t *)(_s1) <= (const uint8_t *)end" object file lineNumber description];
    }
    if (v8->_s2 > (const char *)v14)
    {
      unsigned int v46 = [MEMORY[0x1E4F28B00] currentHandler];
      [v46 handleFailureInMethod:a2, v8, @"SGRe2PrefilterTree.m", 76, @"Invalid parameter not satisfying: %@", @"(const uint8_t *)(_s2) <= (const uint8_t *)end" object file lineNumber description];
    }
    if (v8->_s3 > (const char *)v14)
    {
      uint64_t v47 = [MEMORY[0x1E4F28B00] currentHandler];
      [v47 handleFailureInMethod:a2, v8, @"SGRe2PrefilterTree.m", 77, @"Invalid parameter not satisfying: %@", @"(const uint8_t *)(_s3) <= (const uint8_t *)end" object file lineNumber description];
    }
    v22 = v8->_rpns;
    unsigned __int16 v23 = *v22++;
    v8->_rpns = v22;
    v8->_nrpns = v23;
    if (v22 > v14)
    {
      uint64_t v48 = [MEMORY[0x1E4F28B00] currentHandler];
      [v48 handleFailureInMethod:a2, v8, @"SGRe2PrefilterTree.m", 80, @"Invalid parameter not satisfying: %@", @"(const uint8_t *)(_rpns) <= (const uint8_t *)end" object file lineNumber description];
    }
    unsigned __int16 v25 = v8->_h1;
    int v24 = v8->_h2;
    unsigned __int16 v26 = *v25++;
    v8->_unsigned int n1 = v26;
    unsigned __int16 v28 = *v24;
    v27 = v24 + 1;
    v8->_h1 = v25;
    v8->_h2 = v27;
    v8->_unsigned int n2 = v28;
    v29 = v8->_h3;
    unsigned __int16 v30 = *v29;
    v8->_h3 = v29 + 1;
    v8->_int n3 = v30;
    if (v25 > v14)
    {
      uint64_t v49 = [MEMORY[0x1E4F28B00] currentHandler];
      [v49 handleFailureInMethod:a2, v8, @"SGRe2PrefilterTree.m", 86, @"Invalid parameter not satisfying: %@", @"(const uint8_t *)(_h1) <= (const uint8_t *)end" object file lineNumber description];

      v27 = v8->_h2;
    }
    if (v27 > v14)
    {
      __int16 v50 = [MEMORY[0x1E4F28B00] currentHandler];
      [v50 handleFailureInMethod:a2, v8, @"SGRe2PrefilterTree.m", 87, @"Invalid parameter not satisfying: %@", @"(const uint8_t *)(_h2) <= (const uint8_t *)end" object file lineNumber description];
    }
    if (v8->_h3 > v14)
    {
      v51 = [MEMORY[0x1E4F28B00] currentHandler];
      [v51 handleFailureInMethod:a2, v8, @"SGRe2PrefilterTree.m", 88, @"Invalid parameter not satisfying: %@", @"(const uint8_t *)(_h3) <= (const uint8_t *)end" object file lineNumber description];
    }
    uint64_t v31 = (uint64_t)&v8->_h1[v8->_n1 + 1];
    if ((const unsigned __int16 *)v31 != v8->_h2)
    {
      char v52 = [MEMORY[0x1E4F28B00] currentHandler];
      [v52 handleFailureInMethod:a2, v8, @"SGRe2PrefilterTree.m", 89, @"Invalid parameter not satisfying: %@", @"_h1 + _n1 + 1 == _h2" object file lineNumber description];

      uint64_t v31 = (uint64_t)v8->_h2;
    }
    uint64_t v32 = v31 + 2 * v8->_n2 + 2;
    if ((const unsigned __int16 *)v32 != v8->_h3)
    {
      char v53 = [MEMORY[0x1E4F28B00] currentHandler];
      [v53 handleFailureInMethod:a2, v8, @"SGRe2PrefilterTree.m", 90, @"Invalid parameter not satisfying: %@", @"_h2 + _n2 + 1 == _h3" object file lineNumber description];

      uint64_t v32 = (uint64_t)v8->_h3;
    }
    if ((const char *)(v32 + 2 * v8->_n3) != v8->_s1)
    {
      v54 = [MEMORY[0x1E4F28B00] currentHandler];
      [v54 handleFailureInMethod:a2, v8, @"SGRe2PrefilterTree.m", 91, @"Invalid parameter not satisfying: %@", @"(const void *)(_h3 + _n3 + 0) == (const void *)_s1" object file lineNumber description];
    }
  }

  return v8;
}

@end