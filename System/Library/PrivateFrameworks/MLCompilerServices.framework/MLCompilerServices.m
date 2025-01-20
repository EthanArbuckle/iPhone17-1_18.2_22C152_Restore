uint64_t mlc_services_model_create_bundled(const char *a1)
{
  size_t v2;
  size_t v3;
  void **p_dst;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  BOOL v10;
  size_t v11;
  size_t v12;
  void **v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  size_t v20;
  void **v21;
  size_t v22;
  size_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  std::string::size_type v30;
  std::string::size_type v31;
  int v32;
  std::string::size_type v33;
  void *v34;
  std::string::size_type size;
  uint64_t v36;
  uint64_t v37;
  int v38;
  std::string::size_type v39;
  BOOL v40;
  std::string *v41;
  std::string::size_type v42;
  unint64_t v43;
  uint64_t v44;
  char *v45;
  unsigned char *p_p;
  uint64_t v47;
  unsigned char *v48;
  unsigned char *v49;
  unint64_t v50;
  unsigned int v51;
  void **v52;
  unint64_t v53;
  int v54;
  const void *v55;
  size_t v56;
  std::string::size_type v57;
  std::string::size_type v58;
  std::string *v59;
  std::string::size_type v60;
  size_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  char v66;
  NSObject *v67;
  void **v68;
  uint64_t v69;
  size_t v71;
  void **v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  size_t v76;
  int64_t v77;
  void *v78;
  size_t v79;
  int64_t v80;
  std::string v81;
  std::string v82;
  void *__p;
  long long v84;
  uint64_t v85;
  void **__dst;
  size_t v87;
  unint64_t v88;
  void v89[3];

  v89[2] = *MEMORY[0x263EF8340];
  v2 = strlen(a1);
  if (v2 > 0x7FFFFFFFFFFFFFF7) {
    sub_25514C40C();
  }
  v3 = v2;
  if (v2 >= 0x17)
  {
    v5 = (v2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v2 | 7) != 0x17) {
      v5 = v2 | 7;
    }
    v6 = v5 + 1;
    p_dst = (void **)operator new(v5 + 1);
    v87 = v3;
    v88 = v6 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_8;
  }
  HIBYTE(v88) = v2;
  p_dst = (void **)&__dst;
  if (v2) {
LABEL_8:
  }
    memcpy(p_dst, a1, v3);
  *((unsigned char *)p_dst + v3) = 0;
  sub_255155E9C((const char *)&__dst, &v85);
  if (SHIBYTE(v88) < 0)
  {
    operator delete(__dst);
    v7 = v85;
    if (v85) {
      goto LABEL_11;
    }
  }
  else
  {
    v7 = v85;
    if (v85)
    {
LABEL_11:
      v84 = 0uLL;
      __p = 0;
      v8 = *(void *)(v7 + 16);
      if (v8 < 6
        || ((v9 = *(void *)(v7 + 8), *(_DWORD *)v9 == 1852727854)
          ? (v10 = *(unsigned __int16 *)(v9 + 4) == 8307)
          : (v10 = 0),
            !v10))
      {
        v11 = strlen(a1);
        if (v11 > 0x7FFFFFFFFFFFFFF7) {
          sub_25514C40C();
        }
        v12 = v11;
        if (v11 >= 0x17)
        {
          v16 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v11 | 7) != 0x17) {
            v16 = v11 | 7;
          }
          v17 = v16 + 1;
          v13 = (void **)operator new(v16 + 1);
          v87 = v12;
          v88 = v17 | 0x8000000000000000;
          __dst = v13;
        }
        else
        {
          HIBYTE(v88) = v11;
          v13 = (void **)&__dst;
          if (!v11)
          {
LABEL_28:
            *((unsigned char *)v13 + v12) = 0;
            v18 = sub_2551521B4((uint64_t)&__dst);
            v15 = v18;
            if (SHIBYTE(v88) < 0)
            {
              operator delete(__dst);
              if (!v15) {
                goto LABEL_32;
              }
            }
            else if (!v18)
            {
LABEL_32:
              v19 = strlen(a1);
              if (v19 > 0x7FFFFFFFFFFFFFF7) {
                sub_25514C40C();
              }
              v20 = v19;
              if (v19 >= 0x17)
              {
                v25 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v19 | 7) != 0x17) {
                  v25 = v19 | 7;
                }
                v26 = v25 + 1;
                v21 = (void **)operator new(v25 + 1);
                v87 = v20;
                v88 = v26 | 0x8000000000000000;
                __dst = v21;
              }
              else
              {
                HIBYTE(v88) = v19;
                v21 = (void **)&__dst;
                if (!v19)
                {
LABEL_44:
                  *((unsigned char *)v21 + v20) = 0;
                  sub_25515056C((uint64_t)&v85, (uint64_t)&__dst);
                }
              }
              memcpy(v21, a1, v20);
              goto LABEL_44;
            }
            goto LABEL_162;
          }
        }
        memcpy(v13, a1, v12);
        goto LABEL_28;
      }
      sub_25514C2AC(&__p, (void *)(v9 + 6), v8 - 6);
      v22 = strlen(a1);
      if (v22 > 0x7FFFFFFFFFFFFFF7) {
        sub_25514C40C();
      }
      v23 = v22;
      if (v22 >= 0x17)
      {
        v27 = (v22 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v22 | 7) != 0x17) {
          v27 = v22 | 7;
        }
        v28 = v27 + 1;
        v24 = operator new(v27 + 1);
        v79 = v23;
        v80 = v28 | 0x8000000000000000;
        v78 = v24;
      }
      else
      {
        HIBYTE(v80) = v22;
        v24 = &v78;
        if (!v22) {
          goto LABEL_49;
        }
      }
      memcpy(v24, a1, v23);
LABEL_49:
      *((unsigned char *)v24 + v23) = 0;
      if (v80 >= 0) {
        v29 = (char *)&v78;
      }
      else {
        v29 = (char *)v78;
      }
      v30 = HIBYTE(v80);
      if (v80 < 0) {
        v30 = v79;
      }
      v31 = v30;
      do
      {
        if (!v31) {
          goto LABEL_65;
        }
        v32 = v29[--v31];
      }
      while (v32 != 47);
      if (v31 == -1)
      {
LABEL_65:
        LODWORD(size) = 0;
        *((unsigned char *)&v81.__r_.__value_.__s + 23) = 0;
        v81.__r_.__value_.__s.__data_[0] = 0;
        goto LABEL_71;
      }
      if (v30 >= v31) {
        v33 = v31;
      }
      else {
        v33 = v30;
      }
      if (v33 > 0x7FFFFFFFFFFFFFF7) {
        sub_25514C40C();
      }
      if (v33 >= 0x17)
      {
        v36 = (v33 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v33 | 7) != 0x17) {
          v36 = v33 | 7;
        }
        v37 = v36 + 1;
        v34 = operator new(v36 + 1);
        v81.__r_.__value_.__l.__size_ = v33;
        v81.__r_.__value_.__r.__words[2] = v37 | 0x8000000000000000;
        v81.__r_.__value_.__r.__words[0] = (std::string::size_type)v34;
      }
      else
      {
        *((unsigned char *)&v81.__r_.__value_.__s + 23) = v33;
        v34 = &v81;
        if (!v33) {
          goto LABEL_70;
        }
      }
      memmove(v34, v29, v33);
LABEL_70:
      *((unsigned char *)v34 + v33) = 0;
      LODWORD(size) = HIBYTE(v81.__r_.__value_.__r.__words[2]);
LABEL_71:
      v38 = (char)size;
      size = size;
      if ((size & 0x80u) == 0) {
        v39 = 22;
      }
      else {
        v39 = (v81.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
      }
      if ((size & 0x80u) != 0) {
        size = v81.__r_.__value_.__l.__size_;
      }
      if (v39 == size)
      {
        std::string::__grow_by_and_replace(&v81, v39, 1uLL, v39, v39, 0, 1uLL, "/");
      }
      else
      {
        v40 = v38 < 0;
        v41 = &v81;
        if (v40) {
          v41 = (std::string *)v81.__r_.__value_.__r.__words[0];
        }
        v41->__r_.__value_.__s.__data_[size] = 47;
        v42 = size + 1;
        if (SHIBYTE(v81.__r_.__value_.__r.__words[2]) < 0) {
          v81.__r_.__value_.__l.__size_ = v42;
        }
        else {
          *((unsigned char *)&v81.__r_.__value_.__s + 23) = v42 & 0x7F;
        }
        v41->__r_.__value_.__s.__data_[v42] = 0;
      }
      v82 = v81;
      memset(&v81, 0, sizeof(v81));
      v43 = HIBYTE(v84);
      v45 = (char *)__p;
      v44 = v84;
      if (v84 >= 0) {
        p_p = &__p;
      }
      else {
        p_p = __p;
      }
      if (v84 >= 0) {
        v47 = HIBYTE(v84);
      }
      else {
        v47 = v84;
      }
      if (!v47) {
        goto LABEL_99;
      }
      v48 = &p_p[v47];
      v49 = p_p;
      while ((*v49 & 0xFD) == 0x20)
      {
        if (++v49 == v48) {
          goto LABEL_99;
        }
      }
      v50 = v49 - p_p;
      if (v49 - p_p == -1)
      {
LABEL_99:
        v51 = 0;
        HIBYTE(v88) = 0;
        LOBYTE(__dst) = 0;
LABEL_100:
        if ((v51 & 0x80u) == 0) {
          v52 = (void **)&__dst;
        }
        else {
          v52 = __dst;
        }
        if ((v51 & 0x80u) == 0) {
          v43 = v51;
        }
        v53 = v43 - 1;
        do
        {
          if (v53 == -1) {
            goto LABEL_109;
          }
          v54 = *((unsigned char *)v52 + v53--) & 0xFD;
        }
        while (v54 == 32);
        if (v53 == -2)
        {
LABEL_109:
          HIBYTE(v77) = 0;
          LOBYTE(v75) = 0;
          if ((v51 & 0x80) == 0) {
            goto LABEL_111;
          }
          goto LABEL_110;
        }
        if (v43 >= v53 + 2) {
          v61 = v53 + 2;
        }
        else {
          v61 = v43;
        }
        if (v61 > 0x7FFFFFFFFFFFFFF7) {
          sub_25514C40C();
        }
        if (v61 >= 0x17)
        {
          v63 = (v61 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v61 | 7) != 0x17) {
            v63 = v61 | 7;
          }
          v64 = v63 + 1;
          v62 = operator new(v63 + 1);
          v76 = v61;
          v77 = v64 | 0x8000000000000000;
          v75 = v62;
        }
        else
        {
          HIBYTE(v77) = v61;
          v62 = &v75;
          if (!v61)
          {
LABEL_142:
            *((unsigned char *)v62 + v61) = 0;
            if ((v88 & 0x8000000000000000) != 0) {
LABEL_110:
            }
              operator delete(__dst);
LABEL_111:
            if (v77 >= 0) {
              v55 = &v75;
            }
            else {
              v55 = v75;
            }
            if (v77 >= 0) {
              v56 = HIBYTE(v77);
            }
            else {
              v56 = v76;
            }
            if ((v82.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              v57 = 22;
            }
            else {
              v57 = (v82.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
            }
            if ((v82.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              v58 = HIBYTE(v82.__r_.__value_.__r.__words[2]);
            }
            else {
              v58 = v82.__r_.__value_.__l.__size_;
            }
            if (v57 - v58 >= v56)
            {
              if (v56)
              {
                if ((v82.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  v59 = &v82;
                }
                else {
                  v59 = (std::string *)v82.__r_.__value_.__r.__words[0];
                }
                memmove((char *)v59 + v58, v55, v56);
                v60 = v58 + v56;
                if (SHIBYTE(v82.__r_.__value_.__r.__words[2]) < 0) {
                  v82.__r_.__value_.__l.__size_ = v58 + v56;
                }
                else {
                  *((unsigned char *)&v82.__r_.__value_.__s + 23) = v60 & 0x7F;
                }
                v59->__r_.__value_.__s.__data_[v60] = 0;
              }
            }
            else
            {
              std::string::__grow_by_and_replace(&v82, v57, v58 + v56 - v57, v58, v58, 0, v56, (const std::string::value_type *)v55);
            }
            v89[0] = v82.__r_.__value_.__l.__size_;
            v65 = (void *)v82.__r_.__value_.__r.__words[0];
            *(void *)((char *)v89 + 7) = *(std::string::size_type *)((char *)&v82.__r_.__value_.__r.__words[1] + 7);
            v66 = HIBYTE(v82.__r_.__value_.__r.__words[2]);
            memset(&v82, 0, sizeof(v82));
            if (SHIBYTE(v84) < 0) {
              operator delete(__p);
            }
            __p = v65;
            *(void *)&v84 = v89[0];
            *(void *)((char *)&v84 + 7) = *(void *)((char *)v89 + 7);
            HIBYTE(v84) = v66;
            if (SHIBYTE(v77) < 0)
            {
              operator delete(v75);
              if ((SHIBYTE(v82.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              {
LABEL_150:
                if ((SHIBYTE(v81.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
                  goto LABEL_151;
                }
                goto LABEL_156;
              }
            }
            else if ((SHIBYTE(v82.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
              goto LABEL_150;
            }
            operator delete(v82.__r_.__value_.__l.__data_);
            if ((SHIBYTE(v81.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
LABEL_151:
              if ((SHIBYTE(v80) & 0x80000000) == 0)
              {
LABEL_152:
                sub_255155E9C((const char *)&__p, &__dst);
                if (__dst) {
                  sub_25514C574();
                }
                v67 = os_log_create("com.apple.mlcompiler.service", "Execution");
                if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
                  sub_25515DD04((char *)&v84 + 15, &__p, v67);
                }
                v15 = 0;
                v68 = __dst;
                __dst = 0;
                if (v68) {
                  (*((void (**)(void **))*v68 + 1))(v68);
                }
LABEL_162:
                if (SHIBYTE(v84) < 0) {
                  operator delete(__p);
                }
                goto LABEL_164;
              }
LABEL_157:
              operator delete(v78);
              goto LABEL_152;
            }
LABEL_156:
            operator delete(v81.__r_.__value_.__l.__data_);
            if ((SHIBYTE(v80) & 0x80000000) == 0) {
              goto LABEL_152;
            }
            goto LABEL_157;
          }
        }
        memmove(v62, v52, v61);
        goto LABEL_142;
      }
      if ((HIBYTE(v84) & 0x80) != 0)
      {
        if ((unint64_t)v84 >= v50)
        {
LABEL_168:
          v71 = v44 - v50;
          if (v44 - v50 > 0x7FFFFFFFFFFFFFF7) {
            sub_25514C40C();
          }
          if (v71 >= 0x17)
          {
            v73 = (v71 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v71 | 7) != 0x17) {
              v73 = v71 | 7;
            }
            v74 = v73 + 1;
            v72 = (void **)operator new(v73 + 1);
            v87 = v71;
            v88 = v74 | 0x8000000000000000;
            __dst = v72;
          }
          else
          {
            HIBYTE(v88) = v44 - v50;
            v72 = (void **)&__dst;
            if (v44 == v50) {
              goto LABEL_176;
            }
          }
          memmove(v72, &v45[v50], v71);
LABEL_176:
          *((unsigned char *)v72 + v71) = 0;
          v51 = HIBYTE(v88);
          v43 = v87;
          goto LABEL_100;
        }
      }
      else if (v50 <= HIBYTE(v84))
      {
        v45 = (char *)&__p;
        v44 = HIBYTE(v84);
        goto LABEL_168;
      }
      sub_25514C4B4();
    }
  }
  v14 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_25515DC8C((uint64_t)a1, v14);
  }
  v15 = 0;
LABEL_164:
  v69 = v85;
  v85 = 0;
  if (v69) {
    (*(void (**)(uint64_t))(*(void *)v69 + 8))(v69);
  }
  return v15;
}

void sub_25514B5E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,uint64_t a41)
{
  if (*(char *)(v41 - 105) < 0) {
    operator delete(*(void **)(v41 - 128));
  }
  if (a33 < 0)
  {
    operator delete(__p);
    if ((a27 & 0x80000000) == 0) {
      goto LABEL_5;
    }
  }
  else if ((a27 & 0x80000000) == 0)
  {
LABEL_5:
    if ((a21 & 0x80000000) == 0)
    {
LABEL_10:
      if (a40 < 0) {
        operator delete(a35);
      }
      if (a41)
      {
        (*(void (**)(uint64_t))(*(void *)a41 + 8))(a41);
        _Unwind_Resume(a1);
      }
      _Unwind_Resume(a1);
    }
LABEL_9:
    operator delete(a16);
    goto LABEL_10;
  }
  operator delete(a22);
  if ((a21 & 0x80000000) == 0) {
    goto LABEL_10;
  }
  goto LABEL_9;
}

uint64_t mlc_services_model_bind_raw_ports(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!a1 || a2 && !a3 || a5 && !a6) {
    return 0;
  }
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  v8 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    v10 = "mlc_services_model_bind_raw_ports";
    __int16 v11 = 1024;
    int v12 = v6;
    _os_log_impl(&dword_255146000, v8, OS_LOG_TYPE_DEFAULT, "%s() -> %{BOOL}d", (uint8_t *)&v9, 0x12u);
  }
  return v6;
}

uint64_t mlc_services_model_bind_ports(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!a1 || a2 && !a3 || a4 && !a5) {
    return 0;
  }
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 24))(a1);
  v7 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    int v9 = "mlc_services_model_bind_ports";
    __int16 v10 = 1024;
    int v11 = v5;
    _os_log_impl(&dword_255146000, v7, OS_LOG_TYPE_INFO, "%s() -> %{BOOL}d", (uint8_t *)&v8, 0x12u);
  }
  return v5;
}

uint64_t mlc_services_model_load(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  uint64_t v1 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
  v2 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "mlc_services_model_load";
    __int16 v6 = 1024;
    int v7 = v1;
    _os_log_impl(&dword_255146000, v2, OS_LOG_TYPE_DEFAULT, "%s() -> %{BOOL}d", (uint8_t *)&v4, 0x12u);
  }
  return v1;
}

uint64_t mlc_services_model_get_tensor_shape(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  uint64_t v1 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 40))(a1);
  v2 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    uint64_t v5 = "mlc_services_model_get_tensor_shape";
    __int16 v6 = 1024;
    int v7 = v1;
    _os_log_impl(&dword_255146000, v2, OS_LOG_TYPE_INFO, "%s() -> %{BOOL}d", (uint8_t *)&v4, 0x12u);
  }
  return v1;
}

uint64_t mlc_services_model_set_tensor_shape(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  uint64_t v1 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 48))(a1);
  v2 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    uint64_t v5 = "mlc_services_model_set_tensor_shape";
    __int16 v6 = 1024;
    int v7 = v1;
    _os_log_impl(&dword_255146000, v2, OS_LOG_TYPE_INFO, "%s() -> %{BOOL}d", (uint8_t *)&v4, 0x12u);
  }
  return v1;
}

uint64_t mlc_services_model_reshape(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  uint64_t v1 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
  v2 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    uint64_t v5 = "mlc_services_model_reshape";
    __int16 v6 = 1024;
    int v7 = v1;
    _os_log_impl(&dword_255146000, v2, OS_LOG_TYPE_INFO, "%s() -> %{BOOL}d", (uint8_t *)&v4, 0x12u);
  }
  return v1;
}

uint64_t mlc_services_model_exec_sync(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 72))();
  }
  return result;
}

uint64_t mlc_services_model_teardown(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1);
  (*(void (**)(uint64_t))(*(void *)a1 + 8))(a1);
  v3 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    __int16 v6 = "mlc_services_model_teardown";
    __int16 v7 = 1024;
    int v8 = v2;
    _os_log_impl(&dword_255146000, v3, OS_LOG_TYPE_DEFAULT, "%s() -> %{BOOL}d", (uint8_t *)&v5, 0x12u);
  }
  return v2;
}

uint64_t sub_25514BE58()
{
  v0 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_255146000, v0, OS_LOG_TYPE_DEFAULT, "TODO: Not yet implemented", v2, 2u);
  }
  return 0;
}

uint64_t sub_25514BECC()
{
  v0 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_255146000, v0, OS_LOG_TYPE_DEFAULT, "TODO: Not yet implemented", v2, 2u);
  }
  return 0;
}

uint64_t sub_25514BF40()
{
  v0 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_255146000, v0, OS_LOG_TYPE_DEFAULT, "TODO: Not yet implemented", v2, 2u);
  }
  return 0;
}

uint64_t sub_25514BFB4(uint64_t a1, unint64_t a2, IOSurfaceRef *a3, unint64_t a4, IOSurfaceRef *a5)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_25514C55C();
    }
    __int16 v10 = operator new(8 * a2);
    bzero(v10, 8 * a2);
    int v11 = operator new(8 * a2);
    bzero(v11, 8 * a2);
  }
  else
  {
    __int16 v10 = 0;
    int v11 = 0;
  }
  v26 = v11;
  v27 = v10;
  uint64_t v25 = a1;
  if (!a4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    if (!a2) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (a4 >> 61) {
    sub_25514C55C();
  }
  uint64_t v12 = operator new(8 * a4);
  bzero(v12, 8 * a4);
  uint64_t v13 = operator new(8 * a4);
  bzero(v13, 8 * a4);
  if (a2)
  {
LABEL_10:
    v14 = (size_t *)v11;
    unint64_t v15 = a2;
    do
    {
      BaseAddress = IOSurfaceGetBaseAddress(*a3);
      size_t AllocSize = IOSurfaceGetAllocSize(*a3);
      *v10++ = BaseAddress;
      *v14++ = AllocSize;
      ++a3;
      --v15;
    }
    while (v15);
  }
LABEL_12:
  if (a4)
  {
    v18 = v12;
    v19 = (size_t *)v13;
    unint64_t v20 = a4;
    do
    {
      v21 = IOSurfaceGetBaseAddress(*a5);
      size_t v22 = IOSurfaceGetAllocSize(*a5);
      *v18++ = v21;
      *v19++ = v22;
      ++a5;
      --v20;
    }
    while (v20);
  }
  uint64_t v23 = (*(uint64_t (**)(uint64_t, unint64_t, void *, void *, unint64_t, void *, void *))(*(void *)v25 + 16))(v25, a2, v27, v26, a4, v12, v13);
  if (v13) {
    operator delete(v13);
  }
  if (v12) {
    operator delete(v12);
  }
  if (v26) {
    operator delete(v26);
  }
  if (v27) {
    operator delete(v27);
  }
  return v23;
}

void sub_25514C1D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  operator delete(v17);
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(a1);
}

uint64_t mlc_services_model_create_cached()
{
  v0 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_25515DDC8(v0);
  }
  return 0;
}

void **sub_25514C2AC(void **__dst, void *__src, size_t __len)
{
  LODWORD(v6) = *((char *)__dst + 23);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = (unint64_t)__dst[2];
    unint64_t v8 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (__len > v8)
    {
      size_t v11 = 0x7FFFFFFFFFFFFFF7;
      if (0x7FFFFFFFFFFFFFF7 - (v10 & 0x7FFFFFFFFFFFFFFFLL) >= __len - v8)
      {
        uint64_t v9 = *__dst;
        if (v8 > 0x3FFFFFFFFFFFFFF2)
        {
LABEL_15:
          __int16 v7 = operator new(v11);
          memcpy(v7, __src, __len);
          if (v8 != 22) {
            operator delete(v9);
          }
          __dst[2] = (void *)(v11 | 0x8000000000000000);
          *__dst = v7;
LABEL_23:
          __dst[1] = (void *)__len;
          goto LABEL_24;
        }
LABEL_8:
        unint64_t v12 = 2 * v8;
        if (__len > 2 * v8) {
          unint64_t v12 = __len;
        }
        uint64_t v13 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v13 = v12 | 7;
        }
        if (v12 >= 0x17) {
          size_t v11 = v13 + 1;
        }
        else {
          size_t v11 = 23;
        }
        goto LABEL_15;
      }
LABEL_25:
      sub_25514C40C();
    }
    unint64_t v6 = HIBYTE(v10);
    __int16 v7 = *__dst;
  }
  else
  {
    __int16 v7 = __dst;
    if (__len > 0x16)
    {
      if (__len - 0x7FFFFFFFFFFFFFF7 >= 0x800000000000001FLL)
      {
        unint64_t v8 = 22;
        uint64_t v9 = __dst;
        goto LABEL_8;
      }
      goto LABEL_25;
    }
  }
  if (__len)
  {
    memmove(v7, __src, __len);
    LOBYTE(v6) = *((unsigned char *)__dst + 23);
  }
  if ((v6 & 0x80) != 0) {
    goto LABEL_23;
  }
  *((unsigned char *)__dst + 23) = __len & 0x7F;
LABEL_24:
  *((unsigned char *)v7 + __len) = 0;
  return __dst;
}

void sub_25514C40C()
{
}

void sub_25514C424(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_25514C480(exception, a1);
  __cxa_throw(exception, (struct type_info *)&unk_270445F38, MEMORY[0x263F8C060]);
}

void sub_25514C46C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_25514C480(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_25514C4B4()
{
}

void sub_25514C4CC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_25514C528(exception, a1);
  __cxa_throw(exception, (struct type_info *)&unk_270445F50, MEMORY[0x263F8C068]);
}

void sub_25514C514(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_25514C528(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void sub_25514C55C()
{
}

void sub_25514C574()
{
}

BOOL sub_25514C668(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(a1 + 16) = *(void *)(v2 + 8);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = BNNSGraphContextMake();
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  if (v4)
  {
    BNNSGraphContextSetArgumentType();
    *(void *)(a1 + 72) = BNNSGraphGetInputCount();
    uint64_t OutputCount = BNNSGraphGetOutputCount();
    uint64_t v7 = *(void *)(a1 + 232);
    *(void *)(a1 + 80) = OutputCount;
    unint64_t v8 = *(void *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 240);
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v7) >> 3);
    if (v8 <= v10)
    {
      if (v8 < v10)
      {
        uint64_t v12 = v7 + 24 * v8;
        while (v9 != v12)
        {
          if (*(char *)(v9 - 1) < 0) {
            operator delete(*(void **)(v9 - 24));
          }
          v9 -= 24;
        }
        *(void *)(a1 + 240) = v12;
      }
    }
    else
    {
      sub_25514DC08((char **)(a1 + 232), v8 - v10);
    }
    uint64_t v13 = (void *)(a1 + 256);
    unint64_t v14 = *(void *)(a1 + 80);
    uint64_t v15 = *(void *)(a1 + 256);
    uint64_t v16 = *(void *)(a1 + 264);
    unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * ((v16 - v15) >> 3);
    if (v14 <= v17)
    {
      if (v14 < v17)
      {
        uint64_t v18 = v15 + 24 * v14;
        while (v16 != v18)
        {
          if (*(char *)(v16 - 1) < 0) {
            operator delete(*(void **)(v16 - 24));
          }
          v16 -= 24;
        }
        *(void *)(a1 + 264) = v18;
      }
    }
    else
    {
      sub_25514DC08((char **)(a1 + 256), v14 - v17);
    }
    uint64_t v19 = *(void *)(a1 + 88);
    unint64_t v20 = *(void *)(a1 + 72);
    unint64_t v21 = v20 + *(void *)(a1 + 80);
    unint64_t v22 = 0x2E8BA2E8BA2E8BA3 * ((*(void *)(a1 + 96) - v19) >> 4);
    if (v21 <= v22)
    {
      if (v21 < v22) {
        *(void *)(a1 + 96) = v19 + 176 * v21;
      }
    }
    else
    {
      sub_25514DE30((char **)(a1 + 88), v21 - v22);
      unint64_t v20 = *(void *)(a1 + 72);
      unint64_t v21 = v20 + *(void *)(a1 + 80);
    }
    uint64_t v23 = *(void *)(a1 + 112);
    unint64_t v24 = (*(void *)(a1 + 120) - v23) >> 4;
    if (v21 <= v24)
    {
      if (v21 < v24) {
        *(void *)(a1 + 120) = v23 + 16 * v21;
      }
    }
    else
    {
      sub_25514E020((char **)(a1 + 112), v21 - v24);
      unint64_t v20 = *(void *)(a1 + 72);
    }
    v102 = 0;
    v103 = 0;
    v104 = 0;
    v96 = (void *)(a1 + 232);
    if (v20)
    {
      if (v20 >> 61) {
        sub_25514C55C();
      }
      uint64_t v25 = (char *)operator new(8 * v20);
      v26 = &v25[8 * v20];
      v102 = v25;
      v104 = v26;
      bzero(v25, 8 * v20);
      v103 = v26;
    }
    unint64_t v27 = *(void *)(a1 + 80);
    v100 = 0;
    v101 = 0;
    __p = 0;
    if (v27)
    {
      if (v27 >> 61) {
        sub_25514C55C();
      }
      v28 = (char *)operator new(8 * v27);
      __p = v28;
      v101 = &v28[8 * v27];
      bzero(v28, 8 * v27);
      v100 = v101;
    }
    else
    {
      v28 = 0;
    }
    uint64_t v95 = v4;
    BNNSGraphGetInputNames_v2();
    BNNSGraphGetOutputNames_v2();
    if (*(void *)(a1 + 80))
    {
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      v32 = 0;
      do
      {
        v33 = *(const char **)&v28[8 * (void)v32];
        size_t v34 = strlen(v33);
        if (v34 > 0x7FFFFFFFFFFFFFF7) {
          sub_25514C40C();
        }
        size_t v35 = v34;
        v36 = v13;
        if (v34 >= 0x17)
        {
          uint64_t v38 = (v34 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v34 | 7) != 0x17) {
            uint64_t v38 = v34 | 7;
          }
          uint64_t v39 = v38 + 1;
          p_dst = (long long *)operator new(v38 + 1);
          *((void *)&__dst + 1) = v35;
          unint64_t v98 = v39 | 0x8000000000000000;
          *(void *)&long long __dst = p_dst;
        }
        else
        {
          HIBYTE(v98) = v34;
          p_dst = &__dst;
          if (!v34) {
            goto LABEL_47;
          }
        }
        memmove(p_dst, v33, v35);
LABEL_47:
        *((unsigned char *)p_dst + v35) = 0;
        uint64_t v13 = v36;
        uint64_t v40 = *v36 + v31;
        if (*(char *)(v40 + 23) < 0) {
          operator delete(*(void **)v40);
        }
        long long v41 = __dst;
        *(void *)(v40 + 16) = v98;
        *(_OWORD *)uint64_t v40 = v41;
        *(void *)&long long __dst = *v36 + v31;
        sub_25515006C((uint64_t **)(a1 + 208), (const void **)__dst, (uint64_t)&unk_25515FA2E, (long long **)&__dst)[7] = v32;
        uint64_t v42 = *(void *)(a1 + 88) + v30;
        v28 = (char *)__p;
        BNNSGraphContextGetTensorDescriptor_v2();
        v43 = (void *)(*(void *)(a1 + 112) + v29);
        void *v43 = v42;
        v43[1] = 0;
        v32 = (uint64_t *)((char *)v32 + 1);
        v31 += 24;
        v30 += 176;
        v29 += 16;
      }
      while ((unint64_t)v32 < *(void *)(a1 + 80));
    }
    if (*(void *)(a1 + 72))
    {
      uint64_t v44 = 0;
      unint64_t v45 = 0;
      v46 = v102;
      do
      {
        uint64_t v47 = *(void *)(a1 + 80);
        v48 = (const char *)v46[v45];
        size_t v49 = strlen(v48);
        if (v49 > 0x7FFFFFFFFFFFFFF7) {
          sub_25514C40C();
        }
        size_t v50 = v49;
        if (v49 >= 0x17)
        {
          uint64_t v52 = (v49 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v49 | 7) != 0x17) {
            uint64_t v52 = v49 | 7;
          }
          uint64_t v53 = v52 + 1;
          v51 = (long long *)operator new(v52 + 1);
          *((void *)&__dst + 1) = v50;
          unint64_t v98 = v53 | 0x8000000000000000;
          *(void *)&long long __dst = v51;
        }
        else
        {
          HIBYTE(v98) = v49;
          v51 = &__dst;
          if (!v49) {
            goto LABEL_60;
          }
        }
        memmove(v51, v48, v50);
LABEL_60:
        *((unsigned char *)v51 + v50) = 0;
        uint64_t v54 = *v96 + v44;
        if (*(char *)(v54 + 23) < 0) {
          operator delete(*(void **)v54);
        }
        long long v55 = __dst;
        *(void *)(v54 + 16) = v98;
        *(_OWORD *)uint64_t v54 = v55;
        *(void *)&long long __dst = *v96 + v44;
        sub_25515006C((uint64_t **)(a1 + 208), (const void **)__dst, (uint64_t)&unk_25515FA2E, (long long **)&__dst)[7] = (uint64_t *)(v45 + v47);
        uint64_t v56 = *(void *)(a1 + 88) + 176 * (v45 + v47);
        v46 = v102;
        BNNSGraphContextGetTensorDescriptor_v2();
        v57 = (uint64_t *)(*(void *)(a1 + 112) + 16 * (v45 + v47));
        uint64_t *v57 = v56;
        v57[1] = 0;
        ++v45;
        v44 += 24;
      }
      while (v45 < *(void *)(a1 + 72));
    }
    uint64_t v58 = *(void *)(a1 + 232);
    v59 = *(const void ***)(a1 + 240);
    unint64_t v60 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((uint64_t)v59 - v58) >> 3));
    if (v59 == (const void **)v58) {
      uint64_t v61 = 0;
    }
    else {
      uint64_t v61 = v60;
    }
    sub_25514E15C(v58, v59, (uint64_t)&__dst, v61, 1);
    uint64_t v62 = *(void *)(a1 + 256);
    v63 = *(const void ***)(a1 + 264);
    unint64_t v64 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((uint64_t)v63 - v62) >> 3));
    if (v63 == (const void **)v62) {
      uint64_t v65 = 0;
    }
    else {
      uint64_t v65 = v64;
    }
    sub_25514E15C(v62, v63, (uint64_t)&__dst, v65, 1);
    v67 = (uint64_t *)(a1 + 136);
    uint64_t v66 = *(void *)(a1 + 136);
    unint64_t v68 = *(void *)(a1 + 72) + *(void *)(a1 + 80);
    unint64_t v69 = (*(void *)(a1 + 144) - v66) >> 4;
    if (v68 <= v69)
    {
      if (v68 < v69) {
        *(void *)(a1 + 144) = v66 + 16 * v68;
      }
    }
    else
    {
      sub_25514E020((char **)(a1 + 136), v68 - v69);
      unint64_t v68 = *(void *)(a1 + 72) + *(void *)(a1 + 80);
    }
    uint64_t v70 = *(void *)(a1 + 160);
    v71 = (uint64_t *)(a1 + 160);
    unint64_t v72 = (*(void *)(a1 + 168) - v70) >> 6;
    if (v68 <= v72)
    {
      if (v68 < v72) {
        *(void *)(a1 + 168) = v70 + (v68 << 6);
      }
    }
    else
    {
      sub_25514FEC8((char **)(a1 + 160), v68 - v72);
      unint64_t v68 = *(void *)(a1 + 72) + *(void *)(a1 + 80);
    }
    uint64_t v73 = *(void *)(a1 + 184);
    unint64_t v74 = (*(void *)(a1 + 192) - v73) >> 6;
    if (v68 <= v74)
    {
      if (v68 < v74) {
        *(void *)(a1 + 192) = v73 + (v68 << 6);
      }
    }
    else
    {
      sub_25514FEC8((char **)(a1 + 184), v68 - v74);
    }
    uint64_t v75 = *(void *)(a1 + 88);
    if (*(void *)(a1 + 96) != v75)
    {
      unint64_t v76 = 0;
      uint64_t v77 = -16;
      uint64_t v78 = -8;
      do
      {
        uint64_t v79 = *v67;
        v80 = (uint64_t *)(*v67 + 16 * v76);
        uint64_t *v80 = 8;
        uint64_t v81 = *(void *)(v75 + 176 * v76 + 8);
        uint64_t v82 = *v71;
        if (v81)
        {
          v83 = (void *)(v82 + (v76 << 6));
          void *v83 = v81;
          uint64_t v84 = *(void *)(v75 + 176 * v76 + 16);
          if (v84)
          {
            v83[1] = v84;
            uint64_t v85 = *(void *)(v75 + 176 * v76 + 24);
            if (v85)
            {
              v83[2] = v85;
              uint64_t v86 = *(void *)(v75 + 176 * v76 + 32);
              if (v86)
              {
                v83[3] = v86;
                uint64_t v87 = *(void *)(v75 + 176 * v76 + 40);
                if (v87)
                {
                  v83[4] = v87;
                  uint64_t v88 = *(void *)(v75 + 176 * v76 + 48);
                  if (v88)
                  {
                    v83[5] = v88;
                    uint64_t v89 = *(void *)(v75 + 176 * v76 + 56);
                    if (v89)
                    {
                      v83[6] = v89;
                      uint64_t v90 = *(void *)(v75 + 176 * v76 + 64);
                      if (v90)
                      {
                        v83[7] = v90;
                        uint64_t v91 = 8;
                        goto LABEL_102;
                      }
                      uint64_t v91 = 7;
                    }
                    else
                    {
                      uint64_t v91 = 6;
                    }
                  }
                  else
                  {
                    uint64_t v91 = 5;
                  }
                }
                else
                {
                  uint64_t v91 = 4;
                }
              }
              else
              {
                uint64_t v91 = 3;
              }
            }
            else
            {
              uint64_t v91 = 2;
            }
          }
          else
          {
            uint64_t v91 = 1;
          }
          uint64_t *v80 = v91;
        }
        else
        {
          uint64_t v91 = 0;
          uint64_t *v80 = 0;
        }
LABEL_102:
        *(void *)(v79 + 16 * v76 + 8) = v82 + (v76 << 6);
        uint64_t v92 = *(void *)(a1 + 184);
        uint64_t v93 = sub_25514CF98(*(_DWORD *)(v75 + 176 * v76 + 144));
        if (v91)
        {
          for (*(void *)(v92 + (v76 << 6) + 8 * (v91 - 1)) = v93; v91 != 1; --v91)
          {
            v93 *= *(void *)(v82 + v78 + 8 * v91);
            *(void *)(v92 + v77 + 8 * v91) = v93;
          }
        }
        ++v76;
        uint64_t v75 = *(void *)(a1 + 88);
        v77 += 64;
        v78 += 64;
        v67 = (uint64_t *)(a1 + 136);
        v71 = (uint64_t *)(a1 + 160);
      }
      while (v76 < 0x2E8BA2E8BA2E8BA3 * ((*(void *)(a1 + 96) - v75) >> 4));
    }
    if (__p) {
      operator delete(__p);
    }
    uint64_t v4 = v95;
    if (v102) {
      operator delete(v102);
    }
  }
  else
  {
    size_t v11 = os_log_create("com.apple.mlcompiler.service", "ExecutionBNNSGraph");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_25515DE4C(v11);
    }
  }
  return v4 != 0;
}

void sub_25514CF2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, void *a19, uint64_t a20)
{
  if (__p) {
    operator delete(__p);
  }
  if (a19) {
    operator delete(a19);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_25514CF98(int a1)
{
  if (a1 <= 131103)
  {
    if (a1 <= 98319)
    {
      if (a1 != 65552)
      {
        if (a1 == 65568) {
          return 4;
        }
        goto LABEL_15;
      }
    }
    else if (a1 != 98320)
    {
      if (a1 == 131080) {
        return 1;
      }
      if (a1 != 131088) {
        goto LABEL_15;
      }
    }
    return 2;
  }
  uint64_t v1 = 8;
  if (a1 <= 262159)
  {
    if (a1 != 131104)
    {
      if (a1 != 131136)
      {
        if (a1 != 262152) {
          goto LABEL_15;
        }
        return 1;
      }
      return v1;
    }
    return 4;
  }
  switch(a1)
  {
    case 262160:
      return 2;
    case 262208:
      return v1;
    case 262176:
      return 4;
  }
LABEL_15:
  uint64_t v2 = os_log_create("com.apple.mlcompiler.service", "ExecutionBNNSGraph");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_25515DE90(v2);
  }
  return 0;
}

uint64_t sub_25514D0FC(uint64_t a1)
{
  *(void *)a1 = &unk_270445F78;
  uint64_t v2 = *(void *)(a1 + 256);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 264);
    uint64_t v4 = *(void **)(a1 + 256);
    if (v3 != v2)
    {
      do
      {
        if (*(char *)(v3 - 1) < 0) {
          operator delete(*(void **)(v3 - 24));
        }
        v3 -= 24;
      }
      while (v3 != v2);
      uint64_t v4 = *(void **)(a1 + 256);
    }
    *(void *)(a1 + 264) = v2;
    operator delete(v4);
  }
  uint64_t v5 = *(void *)(a1 + 232);
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 240);
    uint64_t v7 = *(void **)(a1 + 232);
    if (v6 != v5)
    {
      do
      {
        if (*(char *)(v6 - 1) < 0) {
          operator delete(*(void **)(v6 - 24));
        }
        v6 -= 24;
      }
      while (v6 != v5);
      uint64_t v7 = *(void **)(a1 + 232);
    }
    *(void *)(a1 + 240) = v5;
    operator delete(v7);
  }
  sub_255150008(a1 + 208, *(char **)(a1 + 216));
  unint64_t v8 = *(void **)(a1 + 184);
  if (v8)
  {
    *(void *)(a1 + 192) = v8;
    operator delete(v8);
  }
  uint64_t v9 = *(void **)(a1 + 160);
  if (v9)
  {
    *(void *)(a1 + 168) = v9;
    operator delete(v9);
  }
  unint64_t v10 = *(void **)(a1 + 136);
  if (v10)
  {
    *(void *)(a1 + 144) = v10;
    operator delete(v10);
  }
  size_t v11 = *(void **)(a1 + 112);
  if (v11)
  {
    *(void *)(a1 + 120) = v11;
    operator delete(v11);
  }
  uint64_t v12 = *(void **)(a1 + 88);
  if (v12)
  {
    *(void *)(a1 + 96) = v12;
    operator delete(v12);
  }
  if (*(char *)(a1 + 71) < 0) {
    operator delete(*(void **)(a1 + 48));
  }
  uint64_t v13 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = 0;
  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
  }
  return nullsub_1(a1);
}

void sub_25514D284(uint64_t a1)
{
  sub_25514D0FC(a1);
  JUMPOUT(0x25A288F90);
}

BOOL sub_25514D2BC(uint64_t a1, unint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v6 = a6;
  uint64_t v7 = a5;
  if (!a6 && !a3 && !(a5 | a2)) {
    return 1;
  }
  if (*(void *)(a1 + 72) != a2 || *(void *)(a1 + 80) != a5) {
    return 0;
  }
  if (a5)
  {
    uint64_t v12 = 0;
    do
    {
      uint64_t v13 = *v6;
      if (!*v6) {
        return 0;
      }
      uint64_t v18 = (const void **)(*(void *)(a1 + 256) + v12);
      *(void *)(*(void *)(a1 + 88)
                + 176
                * (void)sub_25515006C((uint64_t **)(a1 + 208), v18, (uint64_t)&unk_25515FA2E, (long long **)&v18)[7]
                + 136) = v13;
      ++v6;
      v12 += 24;
    }
    while (--v7);
  }
  if (!a2) {
    return 1;
  }
  uint64_t v14 = *a3;
  if (!*a3) {
    return 0;
  }
  uint64_t v15 = 0;
  uint64_t v16 = 1;
  do
  {
    unint64_t v17 = v16;
    uint64_t v18 = (const void **)(*(void *)(a1 + 232) + v15);
    *(void *)(*(void *)(a1 + 88)
              + 176
              * (void)sub_25515006C((uint64_t **)(a1 + 208), v18, (uint64_t)&unk_25515FA2E, (long long **)&v18)[7]
              + 136) = v14;
    if (a2 == v17) {
      break;
    }
    uint64_t v14 = a3[v17];
    v15 += 24;
    uint64_t v16 = v17 + 1;
  }
  while (v14);
  return v17 >= a2;
}

uint64_t sub_25514D424()
{
  return 1;
}

BOOL sub_25514D42C(void *a1, char *__s, unint64_t a3, void *a4, void *a5)
{
  size_t v10 = strlen(__s);
  if (v10 >= 0x7FFFFFFFFFFFFFF8) {
    sub_25514C40C();
  }
  size_t v11 = (const void *)v10;
  if (v10 >= 0x17)
  {
    uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v13 = v10 | 7;
    }
    uint64_t v14 = v13 + 1;
    uint64_t v12 = (const void **)operator new(v13 + 1);
    __dst[1] = v11;
    unint64_t v26 = v14 | 0x8000000000000000;
    __dst[0] = v12;
    goto LABEL_8;
  }
  HIBYTE(v26) = v10;
  uint64_t v12 = __dst;
  if (v10) {
LABEL_8:
  }
    memcpy(v12, __s, (size_t)v11);
  *((unsigned char *)v11 + (void)v12) = 0;
  uint64_t v15 = sub_25515043C((uint64_t)(a1 + 26), __dst);
  if (SHIBYTE(v26) < 0) {
    operator delete((void *)__dst[0]);
  }
  if (a1 + 27 == v15)
  {
    uint64_t v23 = os_log_create("com.apple.mlcompiler.service", "ExecutionBNNSGraph");
    BOOL result = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_25515DED4();
      return 0;
    }
  }
  else if (a3 >= 9)
  {
    unint64_t v24 = os_log_create("com.apple.mlcompiler.service", "ExecutionBNNSGraph");
    BOOL result = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_25515DF3C();
      return 0;
    }
  }
  else
  {
    if (a3)
    {
      uint64_t v16 = v15[7];
      uint64_t v17 = a1[23];
      uint64_t v18 = *(void **)(a1[17] + 16 * v16 + 8);
      *a4 = *v18;
      if (a3 != 1)
      {
        a4[1] = v18[1];
        if (a3 != 2)
        {
          a4[2] = v18[2];
          if (a3 != 3)
          {
            a4[3] = v18[3];
            if (a3 != 4)
            {
              a4[4] = v18[4];
              if (a3 != 5)
              {
                a4[5] = v18[5];
                if (a3 != 6)
                {
                  a4[6] = v18[6];
                  if (a3 != 7) {
                    a4[7] = v18[7];
                  }
                }
              }
            }
          }
        }
      }
      uint64_t v19 = 8 * a3;
      unint64_t v20 = (uint64_t *)(v17 + (v16 << 6));
      do
      {
        uint64_t v21 = *v20++;
        *a5++ = v21;
        v19 -= 8;
      }
      while (v19);
    }
    return 1;
  }
  return result;
}

void sub_25514D65C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_25514D678(void *a1, char *__s, unint64_t a3, uint64_t *a4, void *a5)
{
  size_t v10 = strlen(__s);
  if (v10 >= 0x7FFFFFFFFFFFFFF8) {
    sub_25514C40C();
  }
  size_t v11 = (const void *)v10;
  if (v10 >= 0x17)
  {
    uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v13 = v10 | 7;
    }
    uint64_t v14 = v13 + 1;
    uint64_t v12 = (const void **)operator new(v13 + 1);
    __dst[1] = v11;
    unint64_t v51 = v14 | 0x8000000000000000;
    __dst[0] = v12;
    goto LABEL_8;
  }
  HIBYTE(v51) = v10;
  uint64_t v12 = __dst;
  if (v10) {
LABEL_8:
  }
    memcpy(v12, __s, (size_t)v11);
  *((unsigned char *)v11 + (void)v12) = 0;
  uint64_t v15 = sub_25515043C((uint64_t)(a1 + 26), __dst);
  if (SHIBYTE(v51) < 0) {
    operator delete((void *)__dst[0]);
  }
  if (a1 + 27 == v15)
  {
    uint64_t v17 = os_log_create("com.apple.mlcompiler.service", "ExecutionBNNSGraph");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_25515DFA4();
    }
    return 0;
  }
  if (a3 >= 9)
  {
    uint64_t v16 = os_log_create("com.apple.mlcompiler.service", "ExecutionBNNSGraph");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_25515DF3C();
    }
    return 0;
  }
  uint64_t v20 = v15[7];
  uint64_t v21 = a1[11];
  uint64_t v22 = a1[17];
  uint64_t v23 = (uint64_t *)(v22 + 16 * v20);
  uint64_t v24 = a1[23];
  if (a3)
  {
    uint64_t v25 = v21 + 176 * v20;
    *(void *)(v25 + 8) = *a4;
    unint64_t v26 = (void *)(v25 + 8);
    if (a3 != 1)
    {
      v26[1] = a4[1];
      if (a3 != 2)
      {
        v26[2] = a4[2];
        if (a3 != 3)
        {
          v26[3] = a4[3];
          if (a3 != 4)
          {
            v26[4] = a4[4];
            if (a3 != 5)
            {
              v26[5] = a4[5];
              if (a3 != 6)
              {
                v26[6] = a4[6];
                if (a3 != 7) {
                  v26[7] = a4[7];
                }
              }
            }
          }
        }
      }
    }
    unint64_t v27 = *(void **)(v22 + 16 * v20 + 8);
    uint64_t v28 = 8 * a3;
    do
    {
      uint64_t v29 = *a4++;
      *v27++ = v29;
      v28 -= 8;
    }
    while (v28);
  }
  uint64_t v30 = *v23;
  uint64_t v31 = a1[20];
  uint64_t v32 = sub_25514CF98(*(_DWORD *)(v21 + 176 * v20 + 144));
  if (v30)
  {
    for (*(void *)(v24 + (v20 << 6) + 8 * (v30 - 1)) = v32; v30 != 1; --v30)
    {
      v32 *= *(void *)((v20 << 6) + v31 - 8 + 8 * v30);
      *(void *)((v20 << 6) + v24 - 16 + 8 * v30) = v32;
    }
  }
  if (!a3) {
    return 1;
  }
  uint64_t v33 = a1[23];
  size_t v34 = (uint64_t *)(v33 + (v20 << 6));
  size_t v35 = (void *)(v21 + 176 * v20 + 72);
  unint64_t v36 = (a3 - 1) & 0x1FFFFFFFFFFFFFFFLL;
  v37 = v34;
  if (v36 < 3) {
    goto LABEL_51;
  }
  unint64_t v38 = v36 + 1;
  uint64_t v39 = v38 & 0x3FFFFFFFFFFFFFFCLL;
  size_t v35 = (void *)((char *)v35 + v39 * 8);
  v37 = &v34[v39];
  uint64_t v40 = (long long *)(v33 + (v20 << 6) + 16);
  long long v41 = (_OWORD *)(v21 + 176 * v20 + 88);
  uint64_t v42 = v38 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    long long v43 = *v40;
    *(v41 - 1) = *(v40 - 1);
    *long long v41 = v43;
    v40 += 2;
    v41 += 2;
    v42 -= 4;
  }
  while (v42);
  if (v38 != (v38 & 0x3FFFFFFFFFFFFFFCLL))
  {
LABEL_51:
    do
    {
      uint64_t v44 = *v37++;
      *v35++ = v44;
    }
    while (v37 != &v34[a3]);
  }
  if (*v34 == *a5)
  {
    unint64_t v45 = 0;
    uint64_t v46 = v33 + (v20 << 6) + 8;
    while (a3 - 1 != v45)
    {
      uint64_t v47 = *(void *)(v46 + 8 * v45);
      uint64_t v48 = a5[++v45];
      if (v47 != v48)
      {
        BOOL v18 = v45 >= a3;
        goto LABEL_46;
      }
    }
    return 1;
  }
  BOOL v18 = 0;
LABEL_46:
  size_t v49 = os_log_create("com.apple.mlcompiler.service", "ExecutionBNNSGraph");
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
    sub_25515E00C();
  }
  return v18;
}

void sub_25514DA1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_25514DA38(void *a1)
{
  int v2 = BNNSGraphContextSetDynamicShapes_v2();
  if (v2 < 0)
  {
    size_t v10 = os_log_create("com.apple.mlcompiler.service", "ExecutionBNNSGraph");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_255146000, v10, OS_LOG_TYPE_INFO, "BNNSGraph: Couldn't set dynamic shapes", v12, 2u);
    }
  }
  else if (a1[10])
  {
    unint64_t v3 = 0;
    uint64_t v4 = -16;
    uint64_t v5 = -8;
    do
    {
      uint64_t v6 = *(void *)(a1[17] + 16 * v3);
      uint64_t v7 = a1[23];
      uint64_t v8 = a1[20];
      uint64_t v9 = sub_25514CF98(*(_DWORD *)(a1[11] + 176 * v3 + 144));
      if (v6)
      {
        for (*(void *)(v7 + (v3 << 6) + 8 * (v6 - 1)) = v9; v6 != 1; --v6)
        {
          v9 *= *(void *)(v8 + v5 + 8 * v6);
          *(void *)(v7 + v4 + 8 * v6) = v9;
        }
      }
      ++v3;
      v4 += 64;
      v5 += 64;
    }
    while (v3 < a1[10]);
  }
  return v2 >= 0;
}

uint64_t sub_25514DB98()
{
  return 1;
}

uint64_t sub_25514DBE4()
{
  return 1;
}

void sub_25514DC08(char **a1, unint64_t a2)
{
  uint64_t v5 = a1[1];
  uint64_t v4 = a1[2];
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - v5) >> 3) >= a2)
  {
    if (a2)
    {
      size_t v12 = 24 * ((24 * a2 - 24) / 0x18) + 24;
      bzero(a1[1], v12);
      v5 += v12;
    }
    a1[1] = v5;
  }
  else
  {
    uint64_t v6 = *a1;
    unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 3);
    unint64_t v8 = v7 + a2;
    if (v7 + a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_25514C55C();
    }
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((v4 - v6) >> 3);
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x555555555555555) {
      unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v10)
    {
      if (v10 > 0xAAAAAAAAAAAAAAALL) {
        sub_25514DDFC();
      }
      size_t v11 = (char *)operator new(24 * v10);
    }
    else
    {
      size_t v11 = 0;
    }
    uint64_t v13 = &v11[24 * v7];
    uint64_t v14 = &v11[24 * v10];
    size_t v15 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v13, v15);
    uint64_t v16 = &v13[v15];
    if (v5 == v6)
    {
      *a1 = v13;
      a1[1] = v16;
      a1[2] = v14;
      if (!v5) {
        return;
      }
      goto LABEL_24;
    }
    do
    {
      long long v17 = *(_OWORD *)(v5 - 24);
      *((void *)v13 - 1) = *((void *)v5 - 1);
      *(_OWORD *)(v13 - 24) = v17;
      v13 -= 24;
      *((void *)v5 - 2) = 0;
      *((void *)v5 - 1) = 0;
      *((void *)v5 - 3) = 0;
      v5 -= 24;
    }
    while (v5 != v6);
    BOOL v18 = *a1;
    uint64_t v5 = a1[1];
    *a1 = v13;
    a1[1] = v16;
    a1[2] = v14;
    if (v5 != v18)
    {
      do
      {
        if (*(v5 - 1) < 0) {
          operator delete(*((void **)v5 - 3));
        }
        v5 -= 24;
      }
      while (v5 != v18);
      uint64_t v5 = v18;
    }
    if (v5)
    {
LABEL_24:
      operator delete(v5);
    }
  }
}

void sub_25514DDFC()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, (struct type_info *)&unk_270445FE0, MEMORY[0x263F8C090]);
}

void sub_25514DE30(char **a1, unint64_t a2)
{
  uint64_t v5 = a1[1];
  uint64_t v4 = a1[2];
  if (0x2E8BA2E8BA2E8BA3 * ((v4 - v5) >> 4) >= a2)
  {
    if (a2)
    {
      size_t v12 = 176 * ((176 * a2 - 176) / 0xB0) + 176;
      bzero(a1[1], v12);
      v5 += v12;
    }
    a1[1] = v5;
  }
  else
  {
    uint64_t v6 = *a1;
    uint64_t v7 = 0x2E8BA2E8BA2E8BA3 * ((v5 - *a1) >> 4);
    unint64_t v8 = v7 + a2;
    if (v7 + a2 > 0x1745D1745D1745DLL) {
      sub_25514C55C();
    }
    unint64_t v9 = 0x2E8BA2E8BA2E8BA3 * ((v4 - v6) >> 4);
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0xBA2E8BA2E8BA2ELL) {
      unint64_t v10 = 0x1745D1745D1745DLL;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v10)
    {
      if (v10 > 0x1745D1745D1745DLL) {
        sub_25514DDFC();
      }
      size_t v11 = (char *)operator new(176 * v10);
    }
    else
    {
      size_t v11 = 0;
    }
    uint64_t v13 = &v11[176 * v7];
    uint64_t v14 = &v11[176 * v10];
    size_t v15 = 176 * ((176 * a2 - 176) / 0xB0) + 176;
    bzero(v13, v15);
    uint64_t v16 = &v13[v15];
    if (v5 != v6)
    {
      do
      {
        long long v17 = *((_OWORD *)v5 - 11);
        long long v18 = *((_OWORD *)v5 - 9);
        *((_OWORD *)v13 - 10) = *((_OWORD *)v5 - 10);
        *((_OWORD *)v13 - 9) = v18;
        *((_OWORD *)v13 - 11) = v17;
        long long v19 = *((_OWORD *)v5 - 8);
        long long v20 = *((_OWORD *)v5 - 7);
        long long v21 = *((_OWORD *)v5 - 5);
        *((_OWORD *)v13 - 6) = *((_OWORD *)v5 - 6);
        *((_OWORD *)v13 - 5) = v21;
        *((_OWORD *)v13 - 8) = v19;
        *((_OWORD *)v13 - 7) = v20;
        long long v22 = *((_OWORD *)v5 - 4);
        long long v23 = *((_OWORD *)v5 - 3);
        long long v24 = *((_OWORD *)v5 - 1);
        *((_OWORD *)v13 - 2) = *((_OWORD *)v5 - 2);
        *((_OWORD *)v13 - 1) = v24;
        *((_OWORD *)v13 - 4) = v22;
        *((_OWORD *)v13 - 3) = v23;
        v13 -= 176;
        v5 -= 176;
      }
      while (v5 != v6);
      uint64_t v5 = *a1;
    }
    *a1 = v13;
    a1[1] = v16;
    a1[2] = v14;
    if (v5)
    {
      operator delete(v5);
    }
  }
}

void sub_25514E020(char **a1, unint64_t a2)
{
  uint64_t v5 = a1[1];
  uint64_t v4 = a1[2];
  if (a2 <= (v4 - v5) >> 4)
  {
    if (a2)
    {
      uint64_t v12 = 16 * a2;
      bzero(a1[1], 16 * a2);
      v5 += v12;
    }
    a1[1] = v5;
  }
  else
  {
    uint64_t v6 = *a1;
    uint64_t v7 = (v5 - *a1) >> 4;
    unint64_t v8 = v7 + a2;
    if ((v7 + a2) >> 60) {
      sub_25514C55C();
    }
    uint64_t v9 = v4 - v6;
    if (v9 >> 3 > v8) {
      unint64_t v8 = v9 >> 3;
    }
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v10)
    {
      if (v10 >> 60) {
        sub_25514DDFC();
      }
      size_t v11 = (char *)operator new(16 * v10);
    }
    else
    {
      size_t v11 = 0;
    }
    uint64_t v13 = &v11[16 * v7];
    size_t v14 = 16 * a2;
    size_t v15 = &v11[16 * v10];
    bzero(v13, v14);
    uint64_t v16 = &v13[v14];
    if (v5 != v6)
    {
      do
      {
        *((_OWORD *)v13 - 1) = *((_OWORD *)v5 - 1);
        v13 -= 16;
        v5 -= 16;
      }
      while (v5 != v6);
      uint64_t v5 = *a1;
    }
    *a1 = v13;
    a1[1] = v16;
    a1[2] = v15;
    if (v5)
    {
      operator delete(v5);
    }
  }
}

__n128 sub_25514E15C(uint64_t a1, const void **a2, uint64_t a3, uint64_t a4, char a5)
{
LABEL_1:
  size_t v11 = (const void **)a1;
LABEL_2:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    a1 = (uint64_t)v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (v14 >> 3);
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          unint64_t v36 = (const void **)*(a2 - 3);
          size_t v35 = a2 - 3;
          size_t v34 = v36;
          int v37 = *((char *)v35 + 23);
          if (v37 >= 0) {
            unint64_t v38 = v35;
          }
          else {
            unint64_t v38 = v34;
          }
          if (v37 >= 0) {
            size_t v39 = *((unsigned __int8 *)v35 + 23);
          }
          else {
            size_t v39 = (size_t)v35[1];
          }
          int v40 = *(char *)(a1 + 23);
          if (v40 >= 0) {
            long long v41 = (const void *)a1;
          }
          else {
            long long v41 = *(const void **)a1;
          }
          if (v40 >= 0) {
            size_t v42 = *(unsigned __int8 *)(a1 + 23);
          }
          else {
            size_t v42 = *(void *)(a1 + 8);
          }
          if (v42 >= v39) {
            size_t v43 = v39;
          }
          else {
            size_t v43 = v42;
          }
          int v44 = memcmp(v38, v41, v43);
          if (v44)
          {
            if ((v44 & 0x80000000) == 0) {
              return result;
            }
          }
          else if (v39 >= v42)
          {
            return result;
          }
          uint64_t v54 = *(const void **)(a1 + 16);
          __n128 v52 = *(__n128 *)a1;
          __n128 v50 = *(__n128 *)v35;
          *(void *)(a1 + 16) = v35[2];
          *(__n128 *)a1 = v50;
          __n128 result = v52;
          *(__n128 *)size_t v35 = v52;
          v35[2] = v54;
          break;
        case 3uLL:
          sub_25514E978((const void **)a1, (const void **)(a1 + 24), a2 - 3);
          return result;
        case 4uLL:
          result.n128_u64[0] = sub_25514F4D0(a1, (long long *)(a1 + 24), (long long *)(a1 + 48), a2 - 3).n128_u64[0];
          return result;
        case 5uLL:
          result.n128_u64[0] = sub_25514F66C(a1, a1 + 24, a1 + 48, (long long *)(a1 + 72), a2 - 3).n128_u64[0];
          return result;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v14 <= 575) {
      break;
    }
    if (v12 == 1)
    {
      if ((const void **)a1 != a2)
      {
        unint64_t v45 = (v15 - 2) >> 1;
        unint64_t v46 = v45 + 1;
        uint64_t v47 = (__n128 *)(a1 + 24 * v45);
        do
        {
          sub_25514F884(a1, a3, 0xAAAAAAAAAAAAAAABLL * (v14 >> 3), v47);
          uint64_t v47 = (__n128 *)((char *)v47 - 24);
          --v46;
        }
        while (v46);
        unint64_t v48 = v14 / 0x18uLL;
        do
        {
          sub_25514FB48(a1, (uint64_t)a2, a3, v48);
          a2 -= 3;
        }
        while (v48-- > 2);
      }
      return result;
    }
    unint64_t v16 = v15 >> 1;
    unint64_t v17 = a1 + 24 * (v15 >> 1);
    if ((unint64_t)v14 < 0xC01)
    {
      sub_25514E978((const void **)v17, (const void **)a1, a2 - 3);
      if (a5) {
        goto LABEL_30;
      }
    }
    else
    {
      sub_25514E978((const void **)a1, (const void **)v17, a2 - 3);
      uint64_t v18 = 24 * v16;
      long long v19 = (const void **)(24 * v16 + a1 - 24);
      sub_25514E978((const void **)(a1 + 24), v19, a2 - 6);
      long long v20 = (const void **)(a1 + 24 + v18);
      sub_25514E978((const void **)(a1 + 48), v20, a2 - 9);
      sub_25514E978(v19, (const void **)v17, v20);
      uint64_t v53 = *(void *)(a1 + 16);
      __n128 v51 = *(__n128 *)a1;
      long long v21 = *(_OWORD *)v17;
      *(void *)(a1 + 16) = *(void *)(v17 + 16);
      *(_OWORD *)a1 = v21;
      *(void *)(v17 + 16) = v53;
      *(__n128 *)unint64_t v17 = v51;
      if (a5) {
        goto LABEL_30;
      }
    }
    int v22 = *(char *)(a1 - 1);
    if (v22 >= 0) {
      long long v23 = (const void *)(a1 - 24);
    }
    else {
      long long v23 = *(const void **)(a1 - 24);
    }
    if (v22 >= 0) {
      size_t v24 = *(unsigned __int8 *)(a1 - 1);
    }
    else {
      size_t v24 = *(void *)(a1 - 16);
    }
    int v25 = *(char *)(a1 + 23);
    if (v25 >= 0) {
      unint64_t v26 = (const void *)a1;
    }
    else {
      unint64_t v26 = *(const void **)a1;
    }
    if (v25 >= 0) {
      size_t v27 = *(unsigned __int8 *)(a1 + 23);
    }
    else {
      size_t v27 = *(void *)(a1 + 8);
    }
    if (v27 >= v24) {
      size_t v28 = v24;
    }
    else {
      size_t v28 = v27;
    }
    int v29 = memcmp(v23, v26, v28);
    if (v29)
    {
      if ((v29 & 0x80000000) == 0) {
        goto LABEL_34;
      }
    }
    else if (v24 >= v27)
    {
LABEL_34:
      size_t v11 = sub_25514EBD8((const void **)a1, a2);
      goto LABEL_35;
    }
LABEL_30:
    uint64_t v30 = (const void **)sub_25514EECC((long long *)a1, (unint64_t)a2);
    if ((v31 & 1) == 0) {
      goto LABEL_33;
    }
    BOOL v32 = sub_25514F19C(a1, v30);
    size_t v11 = v30 + 3;
    if (sub_25514F19C((uint64_t)(v30 + 3), a2))
    {
      a4 = -v13;
      a2 = v30;
      if (v32) {
        return result;
      }
      goto LABEL_1;
    }
    uint64_t v12 = v13 + 1;
    if (!v32)
    {
LABEL_33:
      sub_25514E15C(a1, v30, a3, -v13, a5 & 1);
      size_t v11 = v30 + 3;
LABEL_35:
      a5 = 0;
      a4 = -v13;
      goto LABEL_2;
    }
  }
  if (a5)
  {
    sub_25514E63C((const void **)a1, a2);
  }
  else
  {
    sub_25514E808((const void **)a1, a2);
  }
  return result;
}

const void **sub_25514E63C(const void **result, const void **a2)
{
  if (result != a2)
  {
    uint64_t v32 = v2;
    uint64_t v33 = v3;
    uint64_t v4 = a2;
    char v5 = result;
    char v6 = result + 3;
    if (result + 3 != a2)
    {
      uint64_t v7 = 0;
      unint64_t v8 = result;
      do
      {
        size_t v11 = v8;
        unint64_t v8 = v6;
        int v12 = *((char *)v11 + 47);
        if (v12 >= 0) {
          uint64_t v13 = v6;
        }
        else {
          uint64_t v13 = (const void **)v11[3];
        }
        if (v12 >= 0) {
          size_t v14 = *((unsigned __int8 *)v11 + 47);
        }
        else {
          size_t v14 = (size_t)v11[4];
        }
        int v15 = *((char *)v11 + 23);
        if (v15 >= 0) {
          unint64_t v16 = v11;
        }
        else {
          unint64_t v16 = *v11;
        }
        if (v15 >= 0) {
          size_t v17 = *((unsigned __int8 *)v11 + 23);
        }
        else {
          size_t v17 = (size_t)v11[1];
        }
        if (v17 >= v14) {
          size_t v18 = v14;
        }
        else {
          size_t v18 = v17;
        }
        __n128 result = (const void **)memcmp(v13, v16, v18);
        if (result)
        {
          if ((result & 0x80000000) == 0) {
            goto LABEL_7;
          }
        }
        else if (v14 >= v17)
        {
          goto LABEL_7;
        }
        char v31 = v8[2];
        unint64_t v19 = (unint64_t)v31;
        long long v30 = *(_OWORD *)v8;
        void *v8 = 0;
        v8[1] = 0;
        unint64_t v20 = HIBYTE(v19);
        if ((v20 & 0x80u) == 0) {
          long long v21 = &v30;
        }
        else {
          long long v21 = (long long *)v30;
        }
        if ((v20 & 0x80u) == 0) {
          int v22 = (const void *)v20;
        }
        else {
          int v22 = (const void *)*((void *)&v30 + 1);
        }
        v8[2] = v11[2];
        *(_OWORD *)unint64_t v8 = *(_OWORD *)v11;
        *((unsigned char *)v11 + 23) = 0;
        *(unsigned char *)size_t v11 = 0;
        uint64_t v9 = v5;
        if (v11 == v5) {
          goto LABEL_6;
        }
        uint64_t v23 = v7;
        while (1)
        {
          uint64_t v24 = (uint64_t)v5 + v23;
          int v25 = *((char *)v5 + v23 - 1);
          unint64_t v26 = v25 >= 0 ? (char *)v5 + v23 - 24 : *(char **)((char *)v5 + v23 - 24);
          size_t v27 = v25 >= 0 ? (const void *)*((unsigned __int8 *)v5 + v23 - 1) : *(const void **)((char *)v5 + v23 - 16);
          size_t v28 = (size_t)(v27 >= v22 ? v22 : v27);
          __n128 result = (const void **)memcmp(v21, v26, v28);
          if (!result) {
            break;
          }
          if ((result & 0x80000000) == 0)
          {
            uint64_t v9 = (const void **)((char *)v5 + v23);
            goto LABEL_5;
          }
LABEL_36:
          v11 -= 3;
          *(_OWORD *)uint64_t v24 = *(_OWORD *)((char *)v5 + v23 - 24);
          *(void *)(v24 + 16) = *(const void **)((char *)v5 + v23 - 8);
          *((unsigned char *)v5 + v23 - 1) = 0;
          *(unsigned char *)(v24 - 24) = 0;
          v23 -= 24;
          if (!v23)
          {
            uint64_t v9 = v5;
            goto LABEL_5;
          }
        }
        if (v22 < v27) {
          goto LABEL_36;
        }
        uint64_t v9 = v11;
LABEL_5:
        uint64_t v4 = a2;
LABEL_6:
        long long v10 = v30;
        v9[2] = v31;
        *(_OWORD *)uint64_t v9 = v10;
LABEL_7:
        char v6 = v8 + 3;
        v7 += 24;
      }
      while (v8 + 3 != v4);
    }
  }
  return result;
}

const void **sub_25514E808(const void **result, const void **a2)
{
  if (result != a2)
  {
    uint64_t v26 = v2;
    uint64_t v27 = v3;
    char v5 = result;
    for (i = result + 3; v5 + 3 != a2; i = v5 + 3)
    {
      uint64_t v7 = v5;
      char v5 = i;
      int v8 = *((char *)v7 + 47);
      if (v8 >= 0) {
        uint64_t v9 = i;
      }
      else {
        uint64_t v9 = (const void **)v7[3];
      }
      if (v8 >= 0) {
        size_t v10 = *((unsigned __int8 *)v7 + 47);
      }
      else {
        size_t v10 = (size_t)v7[4];
      }
      int v11 = *((char *)v7 + 23);
      if (v11 >= 0) {
        int v12 = v7;
      }
      else {
        int v12 = *v7;
      }
      if (v11 >= 0) {
        size_t v13 = *((unsigned __int8 *)v7 + 23);
      }
      else {
        size_t v13 = (size_t)v7[1];
      }
      if (v13 >= v10) {
        size_t v14 = v10;
      }
      else {
        size_t v14 = v13;
      }
      __n128 result = (const void **)memcmp(v9, v12, v14);
      if (result)
      {
        if ((result & 0x80000000) != 0) {
          goto LABEL_25;
        }
      }
      else if (v10 < v13)
      {
LABEL_25:
        int v25 = v5[2];
        unint64_t v15 = (unint64_t)v25;
        long long v24 = *(_OWORD *)v5;
        v5[1] = 0;
        v5[2] = 0;
        *char v5 = 0;
        size_t v16 = HIBYTE(v15);
        if ((v16 & 0x80u) == 0) {
          size_t v17 = &v24;
        }
        else {
          size_t v17 = (long long *)v24;
        }
        if ((v16 & 0x80u) == 0) {
          size_t v18 = v16;
        }
        else {
          size_t v18 = *((void *)&v24 + 1);
        }
        for (j = v5; ; j -= 3)
        {
          *(_OWORD *)j = *(_OWORD *)(j - 3);
          j[2] = *(j - 1);
          *((unsigned char *)j - 1) = 0;
          *((unsigned char *)j - 24) = 0;
          int v20 = *((char *)j - 25);
          if (v20 >= 0) {
            long long v21 = j - 6;
          }
          else {
            long long v21 = (const void **)*(j - 6);
          }
          if (v20 >= 0) {
            size_t v22 = *((unsigned __int8 *)j - 25);
          }
          else {
            size_t v22 = (size_t)*(j - 5);
          }
          if (v22 >= v18) {
            size_t v23 = v18;
          }
          else {
            size_t v23 = v22;
          }
          __n128 result = (const void **)memcmp(v17, v21, v23);
          if (result)
          {
            if ((result & 0x80000000) == 0)
            {
LABEL_4:
              *(_OWORD *)(j - 3) = v24;
              *(j - 1) = v25;
              break;
            }
          }
          else if (v18 >= v22)
          {
            goto LABEL_4;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_25514E978(const void **a1, const void **a2, const void **a3)
{
  int v6 = *((char *)a2 + 23);
  if (v6 >= 0) {
    uint64_t v7 = a2;
  }
  else {
    uint64_t v7 = *a2;
  }
  if (v6 >= 0) {
    size_t v8 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v8 = (size_t)a2[1];
  }
  int v9 = *((char *)a1 + 23);
  if (v9 >= 0) {
    size_t v10 = a1;
  }
  else {
    size_t v10 = *a1;
  }
  if (v9 >= 0) {
    size_t v11 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v11 = (size_t)a1[1];
  }
  if (v11 >= v8) {
    size_t v12 = v8;
  }
  else {
    size_t v12 = v11;
  }
  int v13 = memcmp(v7, v10, v12);
  if (v13)
  {
    if ((v13 & 0x80000000) == 0) {
      goto LABEL_18;
    }
LABEL_31:
    int v20 = *((char *)a3 + 23);
    if (v20 >= 0) {
      long long v21 = a3;
    }
    else {
      long long v21 = *a3;
    }
    if (v20 >= 0) {
      size_t v22 = *((unsigned __int8 *)a3 + 23);
    }
    else {
      size_t v22 = (size_t)a3[1];
    }
    if (v8 >= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v8;
    }
    int v24 = memcmp(v21, v7, v23);
    if (v24)
    {
      if ((v24 & 0x80000000) == 0) {
        goto LABEL_42;
      }
    }
    else if (v22 >= v8)
    {
LABEL_42:
      int v25 = a1[2];
      long long v26 = *(_OWORD *)a1;
      uint64_t v27 = a2[2];
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = v27;
      *(_OWORD *)a2 = v26;
      a2[2] = v25;
      int v28 = *((char *)a3 + 23);
      if (v28 >= 0) {
        int v29 = a3;
      }
      else {
        int v29 = *a3;
      }
      if (v28 >= 0) {
        size_t v30 = *((unsigned __int8 *)a3 + 23);
      }
      else {
        size_t v30 = (size_t)a3[1];
      }
      int v31 = *((char *)a2 + 23);
      if (v31 >= 0) {
        uint64_t v32 = a2;
      }
      else {
        uint64_t v32 = *a2;
      }
      if (v31 >= 0) {
        size_t v33 = *((unsigned __int8 *)a2 + 23);
      }
      else {
        size_t v33 = (size_t)a2[1];
      }
      if (v33 >= v30) {
        size_t v34 = v30;
      }
      else {
        size_t v34 = v33;
      }
      int v35 = memcmp(v29, v32, v34);
      if (v35)
      {
        if ((v35 & 0x80000000) == 0) {
          return 1;
        }
      }
      else if (v30 >= v33)
      {
        return 1;
      }
      __n128 v50 = a2[2];
      long long v51 = *(_OWORD *)a2;
      __n128 v52 = a3[2];
      *(_OWORD *)a2 = *(_OWORD *)a3;
      a2[2] = v52;
      *(_OWORD *)a3 = v51;
      a3[2] = v50;
      return 2;
    }
    uint64_t v47 = a1[2];
    long long v48 = *(_OWORD *)a1;
    size_t v49 = a3[2];
    *(_OWORD *)a1 = *(_OWORD *)a3;
    a1[2] = v49;
    *(_OWORD *)a3 = v48;
    a3[2] = v47;
    return 1;
  }
  if (v8 < v11) {
    goto LABEL_31;
  }
LABEL_18:
  int v14 = *((char *)a3 + 23);
  if (v14 >= 0) {
    unint64_t v15 = a3;
  }
  else {
    unint64_t v15 = *a3;
  }
  if (v14 >= 0) {
    size_t v16 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v16 = (size_t)a3[1];
  }
  if (v8 >= v16) {
    size_t v17 = v16;
  }
  else {
    size_t v17 = v8;
  }
  int v18 = memcmp(v15, v7, v17);
  if (v18)
  {
    if ((v18 & 0x80000000) == 0) {
      return 0;
    }
  }
  else if (v16 >= v8)
  {
    return 0;
  }
  unint64_t v36 = a2[2];
  long long v37 = *(_OWORD *)a2;
  unint64_t v38 = a3[2];
  *(_OWORD *)a2 = *(_OWORD *)a3;
  a2[2] = v38;
  *(_OWORD *)a3 = v37;
  a3[2] = v36;
  int v39 = *((char *)a2 + 23);
  if (v39 >= 0) {
    int v40 = a2;
  }
  else {
    int v40 = *a2;
  }
  if (v39 >= 0) {
    size_t v41 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v41 = (size_t)a2[1];
  }
  int v42 = *((char *)a1 + 23);
  if (v42 >= 0) {
    size_t v43 = a1;
  }
  else {
    size_t v43 = *a1;
  }
  if (v42 >= 0) {
    size_t v44 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v44 = (size_t)a1[1];
  }
  if (v44 >= v41) {
    size_t v45 = v41;
  }
  else {
    size_t v45 = v44;
  }
  int v46 = memcmp(v40, v43, v45);
  if (v46)
  {
    if (v46 < 0) {
      goto LABEL_84;
    }
  }
  else if (v41 < v44)
  {
LABEL_84:
    uint64_t v53 = a1[2];
    long long v54 = *(_OWORD *)a1;
    long long v55 = a2[2];
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = v55;
    *(_OWORD *)a2 = v54;
    a2[2] = v53;
    return 2;
  }
  return 1;
}

const void **sub_25514EBD8(const void **a1, const void **a2)
{
  uint64_t v2 = a2;
  long long v54 = a1[2];
  unint64_t v4 = (unint64_t)v54;
  long long v53 = *(_OWORD *)a1;
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  size_t v5 = HIBYTE(v4);
  if ((v5 & 0x80u) == 0) {
    int v6 = &v53;
  }
  else {
    int v6 = (long long *)v53;
  }
  if ((v5 & 0x80u) == 0) {
    size_t v7 = v5;
  }
  else {
    size_t v7 = *((void *)&v53 + 1);
  }
  size_t v8 = (const void **)*(a2 - 3);
  size_t v9 = *((unsigned __int8 *)a2 - 1);
  size_t v10 = (size_t)*(a2 - 2);
  if ((v9 & 0x80u) == 0) {
    size_t v11 = a2 - 3;
  }
  else {
    size_t v11 = (const void **)*(a2 - 3);
  }
  if ((v9 & 0x80u) == 0) {
    size_t v12 = v9;
  }
  else {
    size_t v12 = v10;
  }
  if (v12 >= v7) {
    size_t v13 = v7;
  }
  else {
    size_t v13 = v12;
  }
  int v14 = memcmp(v6, v11, v13);
  if (v14)
  {
    if ((v14 & 0x80000000) == 0) {
      goto LABEL_18;
    }
  }
  else if (v7 >= v12)
  {
LABEL_18:
    for (i = a1 + 3; i < v2; i += 3)
    {
      int v16 = *((char *)i + 23);
      if (v16 >= 0) {
        size_t v17 = i;
      }
      else {
        size_t v17 = *i;
      }
      if (v16 >= 0) {
        size_t v18 = *((unsigned __int8 *)i + 23);
      }
      else {
        size_t v18 = (size_t)i[1];
      }
      if (v18 >= v7) {
        size_t v19 = v7;
      }
      else {
        size_t v19 = v18;
      }
      int v20 = memcmp(v6, v17, v19);
      if (v20)
      {
        if (v20 < 0) {
          goto LABEL_48;
        }
      }
      else if (v7 < v18)
      {
        goto LABEL_48;
      }
    }
    goto LABEL_48;
  }
  long long v21 = a1 + 3;
  do
  {
    while (1)
    {
      i = v21;
      size_t v22 = (const void *)*((unsigned __int8 *)v21 + 23);
      size_t v23 = (char)v22 >= 0 ? i : (const void **)*i;
      int v24 = (char)v22 >= 0 ? v22 : i[1];
      size_t v25 = (unint64_t)v24 >= v7 ? v7 : (size_t)v24;
      int v26 = memcmp(v6, v23, v25);
      long long v21 = i + 3;
      if (v26) {
        break;
      }
      if (v7 < (unint64_t)v24) {
        goto LABEL_48;
      }
    }
  }
  while ((v26 & 0x80000000) == 0);
LABEL_48:
  if (i < v2)
  {
    for (v2 -= 3; ; size_t v10 = (size_t)v2[1])
    {
      if ((v9 & 0x80u) == 0) {
        int v28 = v2;
      }
      else {
        int v28 = v8;
      }
      if ((v9 & 0x80u) == 0) {
        size_t v29 = v9;
      }
      else {
        size_t v29 = v10;
      }
      if (v29 >= v7) {
        size_t v30 = v7;
      }
      else {
        size_t v30 = v29;
      }
      int v31 = memcmp(v6, v28, v30);
      if (v31)
      {
        if ((v31 & 0x80000000) == 0) {
          break;
        }
      }
      else if (v7 >= v29)
      {
        break;
      }
      uint64_t v27 = (const void **)*(v2 - 3);
      v2 -= 3;
      size_t v8 = v27;
      size_t v9 = *((unsigned __int8 *)v2 + 23);
    }
  }
  while (i < v2)
  {
    long long v32 = *(_OWORD *)i;
    uint64_t v56 = i[2];
    long long v55 = v32;
    long long v33 = *(_OWORD *)v2;
    i[2] = v2[2];
    *(_OWORD *)i = v33;
    long long v34 = v55;
    v2[2] = v56;
    *(_OWORD *)uint64_t v2 = v34;
    if (SHIBYTE(v54) >= 0) {
      int v35 = &v53;
    }
    else {
      int v35 = (long long *)v53;
    }
    if (SHIBYTE(v54) >= 0) {
      unint64_t v36 = HIBYTE(v54);
    }
    else {
      unint64_t v36 = *((void *)&v53 + 1);
    }
    long long v37 = i + 3;
    do
    {
      while (1)
      {
        i = v37;
        unint64_t v38 = (const void *)*((unsigned __int8 *)v37 + 23);
        int v39 = (char)v38 >= 0 ? i : (const void **)*i;
        int v40 = (char)v38 >= 0 ? v38 : i[1];
        size_t v41 = (unint64_t)v40 >= v36 ? v36 : (size_t)v40;
        int v42 = memcmp(v35, v39, v41);
        long long v37 = i + 3;
        if (v42) {
          break;
        }
        if (v36 < (unint64_t)v40) {
          goto LABEL_85;
        }
      }
    }
    while ((v42 & 0x80000000) == 0);
LABEL_85:
    size_t v43 = v2 - 3;
    do
    {
      while (1)
      {
        uint64_t v2 = v43;
        size_t v44 = (const void *)*((unsigned __int8 *)v43 + 23);
        size_t v45 = (char)v44 >= 0 ? v2 : (const void **)*v2;
        int v46 = (char)v44 >= 0 ? v44 : v2[1];
        size_t v47 = (unint64_t)v46 >= v36 ? v36 : (size_t)v46;
        int v48 = memcmp(v35, v45, v47);
        size_t v43 = v2 - 3;
        if (v48) {
          break;
        }
        if (v36 >= (unint64_t)v46) {
          goto LABEL_65;
        }
      }
    }
    while (v48 < 0);
LABEL_65:
    ;
  }
  size_t v49 = (void **)(i - 3);
  if (i - 3 == a1)
  {
    if (*((char *)i - 1) < 0) {
      operator delete(*v49);
    }
  }
  else
  {
    if (*((char *)a1 + 23) < 0) {
      operator delete((void *)*a1);
    }
    long long v50 = *(_OWORD *)v49;
    a1[2] = *(i - 1);
    *(_OWORD *)a1 = v50;
    *((unsigned char *)i - 1) = 0;
    *((unsigned char *)i - 24) = 0;
  }
  long long v51 = v53;
  *(i - 1) = v54;
  *(_OWORD *)size_t v49 = v51;
  return i;
}

unint64_t sub_25514EECC(long long *a1, unint64_t a2)
{
  uint64_t v4 = 0;
  int64_t v52 = *((void *)a1 + 2);
  long long v51 = *a1;
  unint64_t v5 = HIBYTE(v52);
  unint64_t v6 = *((void *)&v51 + 1);
  BOOL v7 = v52 < 0;
  if (v52 >= 0) {
    size_t v8 = &v51;
  }
  else {
    size_t v8 = (long long *)v51;
  }
  *((void *)a1 + 1) = 0;
  *((void *)a1 + 2) = 0;
  *(void *)a1 = 0;
  if (v7) {
    unint64_t v9 = v6;
  }
  else {
    unint64_t v9 = v5;
  }
  while (1)
  {
    int v10 = *((char *)a1 + v4 + 47);
    size_t v11 = v10 >= 0 ? (char *)a1 + v4 + 24 : *(char **)((char *)a1 + v4 + 24);
    unint64_t v12 = v10 >= 0 ? *((unsigned __int8 *)a1 + v4 + 47) : *(void *)((char *)a1 + v4 + 32);
    size_t v13 = v9 >= v12 ? v12 : v9;
    int v14 = memcmp(v11, v8, v13);
    if (v14) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_20;
    }
LABEL_8:
    v4 += 24;
  }
  if (v14 < 0) {
    goto LABEL_8;
  }
LABEL_20:
  unint64_t v15 = (unint64_t)a1 + v4 + 24;
  if (v4)
  {
    unint64_t v16 = a2 - 24;
    do
    {
      while (1)
      {
        a2 = v16;
        uint64_t v17 = *(unsigned __int8 *)(v16 + 23);
        size_t v18 = (v17 & 0x80u) == 0 ? (const void *)a2 : *(const void **)a2;
        unint64_t v19 = (v17 & 0x80u) == 0 ? v17 : *(void *)(a2 + 8);
        size_t v20 = v9 >= v19 ? v19 : v9;
        int v21 = memcmp(v18, v8, v20);
        unint64_t v16 = a2 - 24;
        if (v21) {
          break;
        }
        if (v19 < v9) {
          goto LABEL_34;
        }
      }
    }
    while ((v21 & 0x80000000) == 0);
  }
  else
  {
    do
    {
      if (v15 >= a2) {
        break;
      }
      while (1)
      {
        a2 -= 24;
        int v41 = *(char *)(a2 + 23);
        int v42 = v41 >= 0 ? (const void *)a2 : *(const void **)a2;
        unint64_t v43 = v41 >= 0 ? *(unsigned __int8 *)(a2 + 23) : *(void *)(a2 + 8);
        size_t v44 = v9 >= v43 ? v43 : v9;
        int v45 = memcmp(v42, v8, v44);
        if (v45) {
          break;
        }
        if (v43 < v9 || v15 >= a2) {
          goto LABEL_34;
        }
      }
    }
    while ((v45 & 0x80000000) == 0);
  }
LABEL_34:
  if (v15 >= a2)
  {
    unint64_t v22 = v15;
  }
  else
  {
    unint64_t v22 = v15;
    unint64_t v23 = a2;
    do
    {
      long long v24 = *(_OWORD *)v22;
      uint64_t v54 = *(void *)(v22 + 16);
      long long v53 = v24;
      long long v25 = *(_OWORD *)v23;
      *(void *)(v22 + 16) = *(void *)(v23 + 16);
      *(_OWORD *)unint64_t v22 = v25;
      long long v26 = v53;
      *(void *)(v23 + 16) = v54;
      *(_OWORD *)unint64_t v23 = v26;
      if (v52 >= 0) {
        uint64_t v27 = &v51;
      }
      else {
        uint64_t v27 = (long long *)v51;
      }
      if (v52 >= 0) {
        unint64_t v28 = HIBYTE(v52);
      }
      else {
        unint64_t v28 = *((void *)&v51 + 1);
      }
      unint64_t v29 = v22 + 24;
      do
      {
        while (1)
        {
          unint64_t v22 = v29;
          uint64_t v30 = *(unsigned __int8 *)(v29 + 23);
          int v31 = (v30 & 0x80u) == 0 ? (const void *)v22 : *(const void **)v22;
          unint64_t v32 = (v30 & 0x80u) == 0 ? v30 : *(void *)(v22 + 8);
          size_t v33 = v28 >= v32 ? v32 : v28;
          int v34 = memcmp(v31, v27, v33);
          unint64_t v29 = v22 + 24;
          if (v34) {
            break;
          }
          if (v32 >= v28) {
            goto LABEL_56;
          }
        }
      }
      while (v34 < 0);
LABEL_56:
      unint64_t v35 = v23 - 24;
      do
      {
        while (1)
        {
          unint64_t v23 = v35;
          uint64_t v36 = *(unsigned __int8 *)(v35 + 23);
          long long v37 = (v36 & 0x80u) == 0 ? (const void *)v23 : *(const void **)v23;
          unint64_t v38 = (v36 & 0x80u) == 0 ? v36 : *(void *)(v23 + 8);
          size_t v39 = v28 >= v38 ? v38 : v28;
          int v40 = memcmp(v37, v27, v39);
          unint64_t v35 = v23 - 24;
          if (v40) {
            break;
          }
          if (v38 < v28) {
            goto LABEL_36;
          }
        }
      }
      while ((v40 & 0x80000000) == 0);
LABEL_36:
      ;
    }
    while (v22 < v23);
  }
  size_t v47 = (void **)(v22 - 24);
  if ((long long *)(v22 - 24) == a1)
  {
    if (*(char *)(v22 - 1) < 0) {
      operator delete(*v47);
    }
  }
  else
  {
    if (*((char *)a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
    long long v48 = *(_OWORD *)v47;
    *((void *)a1 + 2) = *(void *)(v22 - 8);
    *a1 = v48;
    *(unsigned char *)(v22 - 1) = 0;
    *(unsigned char *)(v22 - 24) = 0;
  }
  long long v49 = v51;
  *(void *)(v22 - 8) = v52;
  *(_OWORD *)size_t v47 = v49;
  return v22 - 24;
}

BOOL sub_25514F19C(uint64_t a1, const void **a2)
{
  uint64_t v3 = ((uint64_t)a2 - a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v3)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      int v5 = *((char *)a2 - 1);
      unint64_t v6 = a2 - 3;
      if (v5 >= 0) {
        BOOL v7 = a2 - 3;
      }
      else {
        BOOL v7 = (const void **)*(a2 - 3);
      }
      if (v5 >= 0) {
        size_t v8 = *((unsigned __int8 *)a2 - 1);
      }
      else {
        size_t v8 = (size_t)*(a2 - 2);
      }
      int v9 = *(char *)(a1 + 23);
      if (v9 >= 0) {
        int v10 = (const void *)a1;
      }
      else {
        int v10 = *(const void **)a1;
      }
      if (v9 >= 0) {
        size_t v11 = *(unsigned __int8 *)(a1 + 23);
      }
      else {
        size_t v11 = *(void *)(a1 + 8);
      }
      if (v11 >= v8) {
        size_t v12 = v8;
      }
      else {
        size_t v12 = v11;
      }
      int v13 = memcmp(v7, v10, v12);
      if (v13)
      {
        if ((v13 & 0x80000000) == 0) {
          return 1;
        }
      }
      else if (v8 >= v11)
      {
        return 1;
      }
      uint64_t v36 = *(const void **)(a1 + 16);
      long long v37 = *(_OWORD *)a1;
      unint64_t v38 = v6[2];
      *(_OWORD *)a1 = *(_OWORD *)v6;
      *(void *)(a1 + 16) = v38;
      *(_OWORD *)unint64_t v6 = v37;
      v6[2] = v36;
      return 1;
    case 3uLL:
      sub_25514E978((const void **)a1, (const void **)(a1 + 24), a2 - 3);
      return 1;
    case 4uLL:
      sub_25514F4D0(a1, (long long *)(a1 + 24), (long long *)(a1 + 48), a2 - 3);
      return 1;
    case 5uLL:
      sub_25514F66C(a1, a1 + 24, a1 + 48, (long long *)(a1 + 72), a2 - 3);
      return 1;
    default:
      int v14 = (const void **)(a1 + 48);
      sub_25514E978((const void **)a1, (const void **)(a1 + 24), (const void **)(a1 + 48));
      unint64_t v15 = (const void **)(a1 + 72);
      if ((const void **)(a1 + 72) == a2) {
        return 1;
      }
      uint64_t v16 = 0;
      int v17 = 0;
      break;
  }
  while (2)
  {
    int v20 = *((char *)v15 + 23);
    if (v20 >= 0) {
      int v21 = v15;
    }
    else {
      int v21 = *v15;
    }
    if (v20 >= 0) {
      size_t v22 = *((unsigned __int8 *)v15 + 23);
    }
    else {
      size_t v22 = (size_t)v15[1];
    }
    int v23 = *((char *)v14 + 23);
    if (v23 >= 0) {
      long long v24 = v14;
    }
    else {
      long long v24 = *v14;
    }
    if (v23 >= 0) {
      size_t v25 = *((unsigned __int8 *)v14 + 23);
    }
    else {
      size_t v25 = (size_t)v14[1];
    }
    if (v25 >= v22) {
      size_t v26 = v22;
    }
    else {
      size_t v26 = v25;
    }
    int v27 = memcmp(v21, v24, v26);
    if (v27)
    {
      if ((v27 & 0x80000000) == 0) {
        goto LABEL_24;
      }
    }
    else if (v22 >= v25)
    {
      goto LABEL_24;
    }
    long long v40 = *(_OWORD *)v15;
    int v41 = v15[2];
    *unint64_t v15 = 0;
    v15[1] = 0;
    v15[2] = v14[2];
    *(_OWORD *)unint64_t v15 = *(_OWORD *)v14;
    *((unsigned char *)v14 + 23) = 0;
    *(unsigned char *)int v14 = 0;
    uint64_t v18 = a1;
    if (v14 == (const void **)a1) {
      goto LABEL_23;
    }
    uint64_t v28 = v16;
    while (1)
    {
      unint64_t v29 = SHIBYTE(v41) >= 0 ? &v40 : (long long *)v40;
      unint64_t v30 = SHIBYTE(v41) >= 0 ? HIBYTE(v41) : *((void *)&v40 + 1);
      int v31 = *(char *)(a1 + v28 + 47);
      unint64_t v32 = v31 >= 0 ? (const void *)(a1 + v28 + 24) : *(const void **)(a1 + v28 + 24);
      unint64_t v33 = v31 >= 0 ? *(unsigned __int8 *)(a1 + v28 + 47) : *(void *)(a1 + v28 + 32);
      size_t v34 = v33 >= v30 ? v30 : v33;
      int v35 = memcmp(v29, v32, v34);
      if (!v35) {
        break;
      }
      if ((v35 & 0x80000000) == 0)
      {
        uint64_t v18 = a1 + v28 + 48;
        goto LABEL_23;
      }
LABEL_47:
      v14 -= 3;
      *(_OWORD *)(a1 + v28 + 48) = *(_OWORD *)(a1 + v28 + 24);
      *(void *)(a1 + v28 + 64) = *(void *)(a1 + v28 + 40);
      *(unsigned char *)(a1 + v28 + 47) = 0;
      *(unsigned char *)(a1 + v28 + 24) = 0;
      v28 -= 24;
      if (v28 == -48)
      {
        uint64_t v18 = a1;
        goto LABEL_23;
      }
    }
    if (v30 < v33) {
      goto LABEL_47;
    }
    uint64_t v18 = (uint64_t)v14;
LABEL_23:
    long long v19 = v40;
    *(void *)(v18 + 16) = v41;
    *(_OWORD *)uint64_t v18 = v19;
    if (++v17 == 8) {
      return v15 + 3 == a2;
    }
LABEL_24:
    int v14 = v15;
    v16 += 24;
    v15 += 3;
    if (v15 != a2) {
      continue;
    }
    return 1;
  }
}

__n128 sub_25514F4D0(uint64_t a1, long long *a2, long long *a3, const void **a4)
{
  sub_25514E978((const void **)a1, (const void **)a2, (const void **)a3);
  int v8 = *((char *)a4 + 23);
  if (v8 >= 0) {
    int v9 = a4;
  }
  else {
    int v9 = *a4;
  }
  if (v8 >= 0) {
    size_t v10 = *((unsigned __int8 *)a4 + 23);
  }
  else {
    size_t v10 = (size_t)a4[1];
  }
  int v11 = *((char *)a3 + 23);
  if (v11 >= 0) {
    size_t v12 = a3;
  }
  else {
    size_t v12 = *(const void **)a3;
  }
  if (v11 >= 0) {
    size_t v13 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v13 = *((void *)a3 + 1);
  }
  if (v13 >= v10) {
    size_t v14 = v10;
  }
  else {
    size_t v14 = v13;
  }
  int v15 = memcmp(v9, v12, v14);
  if (v15)
  {
    if ((v15 & 0x80000000) == 0) {
      return result;
    }
  }
  else if (v10 >= v13)
  {
    return result;
  }
  int v17 = (const void *)*((void *)a3 + 2);
  long long v18 = *a3;
  long long v19 = a4[2];
  *a3 = *(_OWORD *)a4;
  *((void *)a3 + 2) = v19;
  *(_OWORD *)a4 = v18;
  a4[2] = v17;
  int v20 = *((char *)a3 + 23);
  if (v20 >= 0) {
    int v21 = a3;
  }
  else {
    int v21 = *(const void **)a3;
  }
  if (v20 >= 0) {
    size_t v22 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v22 = *((void *)a3 + 1);
  }
  int v23 = *((char *)a2 + 23);
  if (v23 >= 0) {
    long long v24 = a2;
  }
  else {
    long long v24 = *(const void **)a2;
  }
  if (v23 >= 0) {
    size_t v25 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v25 = *((void *)a2 + 1);
  }
  if (v25 >= v22) {
    size_t v26 = v22;
  }
  else {
    size_t v26 = v25;
  }
  int v27 = memcmp(v21, v24, v26);
  if (v27)
  {
    if ((v27 & 0x80000000) == 0) {
      return result;
    }
  }
  else if (v22 >= v25)
  {
    return result;
  }
  uint64_t v28 = *((void *)a2 + 2);
  long long v29 = *a2;
  uint64_t v30 = *((void *)a3 + 2);
  *a2 = *a3;
  *((void *)a2 + 2) = v30;
  *a3 = v29;
  *((void *)a3 + 2) = v28;
  int v31 = *((char *)a2 + 23);
  if (v31 >= 0) {
    unint64_t v32 = a2;
  }
  else {
    unint64_t v32 = *(const void **)a2;
  }
  if (v31 >= 0) {
    size_t v33 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v33 = *((void *)a2 + 1);
  }
  int v34 = *(char *)(a1 + 23);
  if (v34 >= 0) {
    int v35 = (const void *)a1;
  }
  else {
    int v35 = *(const void **)a1;
  }
  if (v34 >= 0) {
    size_t v36 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    size_t v36 = *(void *)(a1 + 8);
  }
  if (v36 >= v33) {
    size_t v37 = v33;
  }
  else {
    size_t v37 = v36;
  }
  int v38 = memcmp(v32, v35, v37);
  if (v38)
  {
    if ((v38 & 0x80000000) == 0) {
      return result;
    }
  }
  else if (v33 >= v36)
  {
    return result;
  }
  uint64_t v39 = *(void *)(a1 + 16);
  __n128 result = *(__n128 *)a1;
  uint64_t v40 = *((void *)a2 + 2);
  *(_OWORD *)a1 = *a2;
  *(void *)(a1 + 16) = v40;
  *a2 = (__int128)result;
  *((void *)a2 + 2) = v39;
  return result;
}

__n128 sub_25514F66C(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4, const void **a5)
{
  sub_25514F4D0(a1, (long long *)a2, (long long *)a3, (const void **)a4);
  int v10 = *((char *)a5 + 23);
  if (v10 >= 0) {
    int v11 = a5;
  }
  else {
    int v11 = *a5;
  }
  if (v10 >= 0) {
    size_t v12 = *((unsigned __int8 *)a5 + 23);
  }
  else {
    size_t v12 = (size_t)a5[1];
  }
  int v13 = *((char *)a4 + 23);
  if (v13 >= 0) {
    size_t v14 = a4;
  }
  else {
    size_t v14 = *(long long **)a4;
  }
  if (v13 >= 0) {
    size_t v15 = *((unsigned __int8 *)a4 + 23);
  }
  else {
    size_t v15 = *((void *)a4 + 1);
  }
  if (v15 >= v12) {
    size_t v16 = v12;
  }
  else {
    size_t v16 = v15;
  }
  int v17 = memcmp(v11, v14, v16);
  if (v17)
  {
    if ((v17 & 0x80000000) == 0) {
      return result;
    }
  }
  else if (v12 >= v15)
  {
    return result;
  }
  long long v19 = (const void *)*((void *)a4 + 2);
  long long v20 = *a4;
  int v21 = a5[2];
  *a4 = *(_OWORD *)a5;
  *((void *)a4 + 2) = v21;
  *(_OWORD *)a5 = v20;
  a5[2] = v19;
  int v22 = *((char *)a4 + 23);
  if (v22 >= 0) {
    int v23 = a4;
  }
  else {
    int v23 = *(long long **)a4;
  }
  if (v22 >= 0) {
    size_t v24 = *((unsigned __int8 *)a4 + 23);
  }
  else {
    size_t v24 = *((void *)a4 + 1);
  }
  int v25 = *(char *)(a3 + 23);
  if (v25 >= 0) {
    size_t v26 = (const void *)a3;
  }
  else {
    size_t v26 = *(const void **)a3;
  }
  if (v25 >= 0) {
    size_t v27 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    size_t v27 = *(void *)(a3 + 8);
  }
  if (v27 >= v24) {
    size_t v28 = v24;
  }
  else {
    size_t v28 = v27;
  }
  int v29 = memcmp(v23, v26, v28);
  if (v29)
  {
    if ((v29 & 0x80000000) == 0) {
      return result;
    }
  }
  else if (v24 >= v27)
  {
    return result;
  }
  uint64_t v30 = *(void *)(a3 + 16);
  long long v31 = *(_OWORD *)a3;
  uint64_t v32 = *((void *)a4 + 2);
  *(_OWORD *)a3 = *a4;
  *(void *)(a3 + 16) = v32;
  *a4 = v31;
  *((void *)a4 + 2) = v30;
  int v33 = *(char *)(a3 + 23);
  if (v33 >= 0) {
    int v34 = (const void *)a3;
  }
  else {
    int v34 = *(const void **)a3;
  }
  if (v33 >= 0) {
    size_t v35 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    size_t v35 = *(void *)(a3 + 8);
  }
  int v36 = *(char *)(a2 + 23);
  if (v36 >= 0) {
    size_t v37 = (const void *)a2;
  }
  else {
    size_t v37 = *(const void **)a2;
  }
  if (v36 >= 0) {
    size_t v38 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v38 = *(void *)(a2 + 8);
  }
  if (v38 >= v35) {
    size_t v39 = v35;
  }
  else {
    size_t v39 = v38;
  }
  int v40 = memcmp(v34, v37, v39);
  if (v40)
  {
    if ((v40 & 0x80000000) == 0) {
      return result;
    }
  }
  else if (v35 >= v38)
  {
    return result;
  }
  uint64_t v41 = *(void *)(a2 + 16);
  long long v42 = *(_OWORD *)a2;
  uint64_t v43 = *(void *)(a3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *(void *)(a2 + 16) = v43;
  *(_OWORD *)a3 = v42;
  *(void *)(a3 + 16) = v41;
  int v44 = *(char *)(a2 + 23);
  if (v44 >= 0) {
    int v45 = (const void *)a2;
  }
  else {
    int v45 = *(const void **)a2;
  }
  if (v44 >= 0) {
    size_t v46 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v46 = *(void *)(a2 + 8);
  }
  int v47 = *(char *)(a1 + 23);
  if (v47 >= 0) {
    long long v48 = (const void *)a1;
  }
  else {
    long long v48 = *(const void **)a1;
  }
  if (v47 >= 0) {
    size_t v49 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    size_t v49 = *(void *)(a1 + 8);
  }
  if (v49 >= v46) {
    size_t v50 = v46;
  }
  else {
    size_t v50 = v49;
  }
  int v51 = memcmp(v45, v48, v50);
  if (v51)
  {
    if ((v51 & 0x80000000) == 0) {
      return result;
    }
  }
  else if (v46 >= v49)
  {
    return result;
  }
  uint64_t v52 = *(void *)(a1 + 16);
  __n128 result = *(__n128 *)a1;
  uint64_t v53 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v53;
  *(__n128 *)a2 = result;
  *(void *)(a2 + 16) = v52;
  return result;
}

__n128 sub_25514F884(uint64_t a1, uint64_t a2, uint64_t a3, __n128 *a4)
{
  unint64_t v6 = a3 - 2;
  if (a3 < 2) {
    return result;
  }
  uint64_t v60 = v4;
  uint64_t v61 = v5;
  uint64_t v8 = a1;
  unint64_t v9 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) < (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - a1) >> 3))) {
    return result;
  }
  uint64_t v10 = a3;
  uint64_t v11 = (0x5555555555555556 * (((uint64_t)a4 - a1) >> 3)) | 1;
  uint64_t v12 = a1 + 24 * v11;
  uint64_t v13 = 0x5555555555555556 * (((uint64_t)a4 - a1) >> 3) + 2;
  if (v13 >= a3) {
    goto LABEL_21;
  }
  size_t v14 = (const void **)(v12 + 24);
  int v15 = *(char *)(v12 + 23);
  if (v15 >= 0) {
    size_t v16 = (const void *)(a1 + 24 * v11);
  }
  else {
    size_t v16 = *(const void **)v12;
  }
  if (v15 >= 0) {
    size_t v17 = *(unsigned __int8 *)(v12 + 23);
  }
  else {
    size_t v17 = *(void *)(v12 + 8);
  }
  int v18 = *(char *)(v12 + 47);
  if (v18 >= 0) {
    long long v19 = (const void *)(v12 + 24);
  }
  else {
    long long v19 = *(const void **)(v12 + 24);
  }
  if (v18 >= 0) {
    size_t v20 = *(unsigned __int8 *)(v12 + 47);
  }
  else {
    size_t v20 = *(void *)(v12 + 32);
  }
  if (v20 >= v17) {
    size_t v21 = v17;
  }
  else {
    size_t v21 = v20;
  }
  int v22 = memcmp(v16, v19, v21);
  if (v22)
  {
    if (v22 < 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (v17 >= v20)
  {
LABEL_21:
    size_t v14 = (const void **)(v8 + 24 * v11);
    uint64_t v13 = v11;
  }
LABEL_22:
  int v23 = *((char *)v14 + 23);
  if (v23 >= 0) {
    size_t v24 = v14;
  }
  else {
    size_t v24 = *v14;
  }
  if (v23 >= 0) {
    size_t v25 = *((unsigned __int8 *)v14 + 23);
  }
  else {
    size_t v25 = (size_t)v14[1];
  }
  int v26 = a4[1].n128_i8[7];
  if (v26 >= 0) {
    size_t v27 = a4;
  }
  else {
    size_t v27 = (__n128 *)a4->n128_u64[0];
  }
  if (v26 >= 0) {
    size_t v28 = a4[1].n128_u8[7];
  }
  else {
    size_t v28 = a4->n128_u64[1];
  }
  if (v28 >= v25) {
    size_t v29 = v25;
  }
  else {
    size_t v29 = v28;
  }
  int v30 = memcmp(v24, v27, v29);
  if (v30)
  {
    uint64_t v32 = v9;
    if (v30 < 0) {
      return result;
    }
  }
  else
  {
    BOOL v33 = v25 >= v28;
    uint64_t v32 = v9;
    if (!v33) {
      return result;
    }
  }
  __n128 v58 = *a4;
  v59 = (const void *)a4[1].n128_u64[0];
  a4->n128_u64[1] = 0;
  a4[1].n128_u64[0] = 0;
  a4->n128_u64[0] = 0;
  int v34 = v14[2];
  *a4 = *(__n128 *)v14;
  a4[1].n128_u64[0] = (unint64_t)v34;
  *((unsigned char *)v14 + 23) = 0;
  *(unsigned char *)size_t v14 = 0;
  if (v32 >= v13)
  {
    int v36 = &v58;
    if (SHIBYTE(v59) < 0) {
      int v36 = (__n128 *)v58.n128_u64[0];
    }
    uint64_t v56 = v10;
    __s2 = v36;
    if (SHIBYTE(v59) >= 0) {
      size_t v37 = HIBYTE(v59);
    }
    else {
      size_t v37 = v58.n128_u64[1];
    }
    while (1)
    {
      uint64_t v39 = (2 * v13) | 1;
      uint64_t v40 = v8 + 24 * v39;
      uint64_t v13 = 2 * v13 + 2;
      if (v13 >= v10) {
        goto LABEL_71;
      }
      uint64_t v41 = v8;
      uint64_t v42 = v32;
      size_t v35 = (const void **)(v40 + 24);
      int v43 = *(char *)(v40 + 23);
      int v44 = v43 >= 0 ? (const void *)v40 : *(const void **)v40;
      unint64_t v45 = v43 >= 0 ? *(unsigned __int8 *)(v40 + 23) : *(void *)(v40 + 8);
      int v46 = *(char *)(v40 + 47);
      int v47 = v46 >= 0 ? (const void *)(v40 + 24) : *(const void **)(v40 + 24);
      unint64_t v48 = v46 >= 0 ? *(unsigned __int8 *)(v40 + 47) : *(void *)(v40 + 32);
      size_t v49 = v48 >= v45 ? v45 : v48;
      int v50 = memcmp(v44, v47, v49);
      if (v50) {
        break;
      }
      BOOL v33 = v45 >= v48;
      uint64_t v32 = v42;
      uint64_t v8 = v41;
      uint64_t v10 = v56;
      if (v33) {
        goto LABEL_71;
      }
LABEL_72:
      int v51 = *((char *)v35 + 23);
      if (v51 >= 0) {
        uint64_t v52 = v35;
      }
      else {
        uint64_t v52 = *v35;
      }
      if (v51 >= 0) {
        size_t v53 = *((unsigned __int8 *)v35 + 23);
      }
      else {
        size_t v53 = (size_t)v35[1];
      }
      if (v37 >= v53) {
        size_t v54 = v53;
      }
      else {
        size_t v54 = v37;
      }
      int v55 = memcmp(v52, __s2, v54);
      if (v55)
      {
        if (v55 < 0) {
          goto LABEL_43;
        }
      }
      else if (v53 < v37)
      {
        goto LABEL_43;
      }
      long long v38 = *(_OWORD *)v35;
      v14[2] = v35[2];
      *(_OWORD *)size_t v14 = v38;
      *((unsigned char *)v35 + 23) = 0;
      *(unsigned char *)size_t v35 = 0;
      size_t v14 = v35;
      if (v32 < v13) {
        goto LABEL_44;
      }
    }
    uint64_t v32 = v42;
    uint64_t v8 = v41;
    uint64_t v10 = v56;
    if (v50 < 0) {
      goto LABEL_72;
    }
LABEL_71:
    size_t v35 = (const void **)v40;
    uint64_t v13 = v39;
    goto LABEL_72;
  }
LABEL_43:
  size_t v35 = v14;
LABEL_44:
  __n128 result = v58;
  v35[2] = v59;
  *(__n128 *)size_t v35 = result;
  return result;
}

void sub_25514FB48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 2)
  {
    uint64_t v5 = 0;
    uint64_t v23 = *(void *)a1;
    *(void *)int v26 = *(void *)(a1 + 8);
    *(void *)&v26[7] = *(void *)(a1 + 15);
    char v24 = *(unsigned char *)(a1 + 23);
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    int64_t v6 = (unint64_t)(a4 - 2) >> 1;
    uint64_t v7 = a1;
    while (1)
    {
      uint64_t v9 = v7 + 24 * v5 + 24;
      uint64_t v10 = (2 * v5) | 1;
      uint64_t v5 = 2 * v5 + 2;
      if (v5 >= a4) {
        goto LABEL_22;
      }
      uint64_t v11 = v9 + 24;
      int v12 = *(char *)(v9 + 23);
      uint64_t v13 = v12 >= 0 ? (const void *)v9 : *(const void **)v9;
      unint64_t v14 = v12 >= 0 ? *(unsigned __int8 *)(v9 + 23) : *(void *)(v9 + 8);
      int v15 = *(char *)(v9 + 47);
      size_t v16 = v15 >= 0 ? (const void *)(v9 + 24) : *(const void **)(v9 + 24);
      unint64_t v17 = v15 >= 0 ? *(unsigned __int8 *)(v9 + 47) : *(void *)(v9 + 32);
      size_t v18 = v17 >= v14 ? v14 : v17;
      int v19 = memcmp(v13, v16, v18);
      if (!v19) {
        break;
      }
      if ((v19 & 0x80000000) == 0) {
        goto LABEL_22;
      }
LABEL_23:
      if (*(char *)(v7 + 23) < 0) {
        operator delete(*(void **)v7);
      }
      long long v8 = *(_OWORD *)v11;
      *(void *)(v7 + 16) = *(void *)(v11 + 16);
      *(_OWORD *)uint64_t v7 = v8;
      *(unsigned char *)(v11 + 23) = 0;
      *(unsigned char *)uint64_t v11 = 0;
      uint64_t v7 = v11;
      if (v5 > v6)
      {
        if (v11 == a2 - 24)
        {
          *(void *)uint64_t v11 = v23;
          *(void *)(v11 + 8) = *(void *)v26;
          *(void *)(v11 + 15) = *(void *)&v26[7];
          *(unsigned char *)(v11 + 23) = v24;
        }
        else
        {
          long long v20 = *(_OWORD *)(a2 - 24);
          *(void *)(v11 + 16) = *(void *)(a2 - 8);
          *(_OWORD *)uint64_t v11 = v20;
          *(void *)(a2 - 24) = v23;
          *(void *)(a2 - 16) = *(void *)v26;
          *(void *)(a2 - 9) = *(void *)&v26[7];
          *(unsigned char *)(a2 - 1) = v24;
          sub_25514FD3C(a1, v11 + 24, a3, 0xAAAAAAAAAAAAAAABLL * ((v11 + 24 - a1) >> 3));
        }
        return;
      }
    }
    if (v14 < v17) {
      goto LABEL_23;
    }
LABEL_22:
    uint64_t v11 = v9;
    uint64_t v5 = v10;
    goto LABEL_23;
  }
}

__n128 sub_25514FD3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v6 = v4 >> 1;
    uint64_t v7 = (__n128 *)(a1 + 24 * (v4 >> 1));
    long long v8 = (__n128 *)(a2 - 24);
    int v9 = v7[1].n128_i8[7];
    if (v9 >= 0) {
      uint64_t v10 = (const void *)(a1 + 24 * (v4 >> 1));
    }
    else {
      uint64_t v10 = (const void *)v7->n128_u64[0];
    }
    if (v9 >= 0) {
      size_t v11 = v7[1].n128_u8[7];
    }
    else {
      size_t v11 = v7->n128_u64[1];
    }
    int v12 = *(char *)(a2 - 1);
    if (v12 >= 0) {
      uint64_t v13 = (const void *)(a2 - 24);
    }
    else {
      uint64_t v13 = *(const void **)(a2 - 24);
    }
    if (v12 >= 0) {
      size_t v14 = v8[1].n128_u8[7];
    }
    else {
      size_t v14 = v8->n128_u64[1];
    }
    if (v14 >= v11) {
      size_t v15 = v11;
    }
    else {
      size_t v15 = v14;
    }
    int v16 = memcmp(v10, v13, v15);
    if (v16)
    {
      if ((v16 & 0x80000000) == 0) {
        return result;
      }
    }
    else if (v11 >= v14)
    {
      return result;
    }
    unint64_t v32 = v8[1].n128_u64[0];
    unint64_t v18 = v32;
    __n128 v31 = *v8;
    v8->n128_u64[1] = 0;
    v8[1].n128_u64[0] = 0;
    v8->n128_u64[0] = 0;
    size_t v19 = HIBYTE(v18);
    if ((v19 & 0x80u) == 0) {
      long long v20 = &v31;
    }
    else {
      long long v20 = (__n128 *)v31.n128_u64[0];
    }
    if ((v19 & 0x80u) == 0) {
      size_t v21 = v19;
    }
    else {
      size_t v21 = v31.n128_u64[1];
    }
    __n128 v22 = *v7;
    v8[1].n128_u64[0] = v7[1].n128_u64[0];
    __n128 *v8 = v22;
    v7[1].n128_u8[7] = 0;
    v7->n128_u8[0] = 0;
    if (v4 >= 2)
    {
      while (1)
      {
        unint64_t v24 = v6 - 1;
        unint64_t v6 = (v6 - 1) >> 1;
        size_t v25 = (__n128 *)(a1 + 24 * v6);
        int v26 = v25[1].n128_i8[7];
        if (v26 >= 0) {
          size_t v27 = (const void *)(a1 + 24 * v6);
        }
        else {
          size_t v27 = (const void *)v25->n128_u64[0];
        }
        if (v26 >= 0) {
          size_t v28 = v25[1].n128_u8[7];
        }
        else {
          size_t v28 = v25->n128_u64[1];
        }
        if (v21 >= v28) {
          size_t v29 = v28;
        }
        else {
          size_t v29 = v21;
        }
        int v30 = memcmp(v27, v20, v29);
        if (v30)
        {
          if ((v30 & 0x80000000) == 0) {
            break;
          }
        }
        else if (v28 >= v21)
        {
          break;
        }
        __n128 v23 = *v25;
        v7[1].n128_u64[0] = v25[1].n128_u64[0];
        __n128 *v7 = v23;
        v25[1].n128_u8[7] = 0;
        v25->n128_u8[0] = 0;
        uint64_t v7 = (__n128 *)(a1 + 24 * v6);
        if (v24 <= 1) {
          goto LABEL_43;
        }
      }
    }
    size_t v25 = v7;
LABEL_43:
    __n128 result = v31;
    v25[1].n128_u64[0] = v32;
    *size_t v25 = result;
  }
  return result;
}

void sub_25514FEC8(char **a1, unint64_t a2)
{
  uint64_t v5 = a1[1];
  unint64_t v4 = a1[2];
  if (a2 <= (v4 - v5) >> 6)
  {
    if (a2)
    {
      unint64_t v12 = a2 << 6;
      bzero(a1[1], a2 << 6);
      v5 += v12;
    }
    a1[1] = v5;
  }
  else
  {
    unint64_t v6 = *a1;
    uint64_t v7 = (v5 - *a1) >> 6;
    unint64_t v8 = v7 + a2;
    if ((v7 + a2) >> 58) {
      sub_25514C55C();
    }
    uint64_t v9 = v4 - v6;
    if (v9 >> 5 > v8) {
      unint64_t v8 = v9 >> 5;
    }
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v10 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v10)
    {
      if (v10 >> 58) {
        sub_25514DDFC();
      }
      size_t v11 = (char *)operator new(v10 << 6);
    }
    else
    {
      size_t v11 = 0;
    }
    uint64_t v13 = &v11[64 * v7];
    size_t v14 = a2 << 6;
    size_t v15 = &v11[64 * v10];
    bzero(v13, v14);
    int v16 = &v13[v14];
    if (v5 != v6)
    {
      do
      {
        long long v17 = *((_OWORD *)v5 - 4);
        long long v18 = *((_OWORD *)v5 - 3);
        long long v19 = *((_OWORD *)v5 - 1);
        *((_OWORD *)v13 - 2) = *((_OWORD *)v5 - 2);
        *((_OWORD *)v13 - 1) = v19;
        *((_OWORD *)v13 - 4) = v17;
        *((_OWORD *)v13 - 3) = v18;
        v13 -= 64;
        v5 -= 64;
      }
      while (v5 != v6);
      uint64_t v5 = *a1;
    }
    *a1 = v13;
    a1[1] = v16;
    a1[2] = v15;
    if (v5)
    {
      operator delete(v5);
    }
  }
}

void sub_255150008(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_255150008(a1, *(void *)a2);
    sub_255150008(a1, *((void *)a2 + 1));
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }
}

uint64_t **sub_25515006C(uint64_t **a1, const void **a2, uint64_t a3, long long **a4)
{
  uint64_t v7 = a1 + 1;
  unint64_t v6 = a1[1];
  if (v6)
  {
    int v8 = *((char *)a2 + 23);
    if (v8 >= 0) {
      uint64_t v9 = a2;
    }
    else {
      uint64_t v9 = *a2;
    }
    if (v8 >= 0) {
      size_t v10 = *((unsigned __int8 *)a2 + 23);
    }
    else {
      size_t v10 = (size_t)a2[1];
    }
    while (1)
    {
      size_t v11 = (uint64_t **)v6;
      size_t v14 = (const void *)v6[4];
      unint64_t v12 = v6 + 4;
      uint64_t v13 = v14;
      int v15 = *((char *)v12 + 23);
      if (v15 >= 0) {
        int v16 = v12;
      }
      else {
        int v16 = v13;
      }
      if (v15 >= 0) {
        size_t v17 = *((unsigned __int8 *)v12 + 23);
      }
      else {
        size_t v17 = v12[1];
      }
      if (v17 >= v10) {
        size_t v18 = v10;
      }
      else {
        size_t v18 = v17;
      }
      int v19 = memcmp(v9, v16, v18);
      if (v19)
      {
        if (v19 < 0) {
          goto LABEL_8;
        }
LABEL_22:
        int v20 = memcmp(v16, v9, v18);
        if (v20)
        {
          if ((v20 & 0x80000000) == 0) {
            return v11;
          }
        }
        else if (v17 >= v10)
        {
          return v11;
        }
        unint64_t v6 = v11[1];
        if (!v6)
        {
          uint64_t v7 = v11 + 1;
          goto LABEL_29;
        }
      }
      else
      {
        if (v10 >= v17) {
          goto LABEL_22;
        }
LABEL_8:
        unint64_t v6 = *v11;
        uint64_t v7 = v11;
        if (!*v11) {
          goto LABEL_29;
        }
      }
    }
  }
  size_t v11 = a1 + 1;
LABEL_29:
  size_t v21 = operator new(0x40uLL);
  __n128 v22 = v21 + 4;
  __n128 v23 = *a4;
  if (*((char *)*a4 + 23) < 0)
  {
    sub_2551501FC(v22, *(void **)v23, *((void *)v23 + 1));
  }
  else
  {
    long long v24 = *v23;
    v21[6] = *((void *)v23 + 2);
    *(_OWORD *)__n128 v22 = v24;
  }
  v21[7] = 0;
  void *v21 = 0;
  v21[1] = 0;
  v21[2] = v11;
  __n128 *v7 = v21;
  size_t v25 = (uint64_t *)**a1;
  int v26 = v21;
  if (v25)
  {
    *a1 = v25;
    int v26 = *v7;
  }
  sub_25515029C(a1[1], v26);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return (uint64_t **)v21;
}

void sub_2551501E8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_2551501FC(unsigned char *__dst, void *__src, unint64_t a3)
{
  uint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_25514C40C();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    int v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *uint64_t v5 = v8;
    uint64_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

uint64_t *sub_25515029C(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = a2[2];
      if (*(unsigned char *)(v2 + 24)) {
        break;
      }
      uint64_t v3 = *(uint64_t **)(v2 + 16);
      uint64_t v4 = *v3;
      if (*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if (*(uint64_t **)v2 == a2)
          {
            uint64_t v9 = (uint64_t *)a2[2];
          }
          else
          {
            uint64_t v9 = *(uint64_t **)(v2 + 8);
            uint64_t v10 = *v9;
            *(void *)(v2 + 8) = *v9;
            if (v10)
            {
              *(void *)(v10 + 16) = v2;
              uint64_t v3 = *(uint64_t **)(v2 + 16);
            }
            v9[2] = (uint64_t)v3;
            *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = v9;
            *uint64_t v9 = v2;
            *(void *)(v2 + 16) = v9;
            uint64_t v3 = (uint64_t *)v9[2];
            uint64_t v2 = *v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v14 = *(void *)(v2 + 8);
          uint64_t *v3 = v14;
          if (v14) {
            *(void *)(v14 + 16) = v3;
          }
          *(void *)(v2 + 16) = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          *(void *)(v2 + 8) = v3;
          v3[2] = v2;
          return result;
        }
      }
      else if (!v4 || (int v6 = *(unsigned __int8 *)(v4 + 24), v5 = (unsigned char *)(v4 + 24), v6))
      {
        if (*(uint64_t **)v2 == a2)
        {
          uint64_t v11 = a2[1];
          *(void *)uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = *(uint64_t **)(v2 + 16);
          }
          a2[2] = (uint64_t)v3;
          *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = a2;
          a2[1] = v2;
          *(void *)(v2 + 16) = a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        unint64_t v12 = (uint64_t *)v3[1];
        uint64_t v13 = *v12;
        v3[1] = *v12;
        if (v13) {
          *(void *)(v13 + 16) = v3;
        }
        v12[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v12;
        *unint64_t v12 = (uint64_t)v3;
        v3[2] = (uint64_t)v12;
        return result;
      }
      *(unsigned char *)(v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *uint64_t v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t *sub_25515043C(uint64_t a1, const void **a2)
{
  uint64_t v2 = (uint64_t *)(a1 + 8);
  uint64_t v3 = *(uint64_t **)(a1 + 8);
  if (!v3) {
    return v2;
  }
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = *a2;
  }
  if (v4 >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  uint64_t v7 = (uint64_t *)(a1 + 8);
  do
  {
    while (1)
    {
      int v8 = *((char *)v3 + 55);
      uint64_t v9 = v8 >= 0 ? v3 + 4 : (uint64_t *)v3[4];
      size_t v10 = v8 >= 0 ? *((unsigned __int8 *)v3 + 55) : v3[5];
      size_t v11 = v6 >= v10 ? v10 : v6;
      int v12 = memcmp(v9, v5, v11);
      if (v12) {
        break;
      }
      if (v10 >= v6) {
        goto LABEL_23;
      }
LABEL_9:
      uint64_t v3 = (uint64_t *)v3[1];
      if (!v3) {
        goto LABEL_24;
      }
    }
    if (v12 < 0) {
      goto LABEL_9;
    }
LABEL_23:
    uint64_t v7 = v3;
    uint64_t v3 = (uint64_t *)*v3;
  }
  while (v3);
LABEL_24:
  if (v7 == v2) {
    return v2;
  }
  int v13 = *((char *)v7 + 55);
  if (v13 >= 0) {
    uint64_t v14 = v7 + 4;
  }
  else {
    uint64_t v14 = (const void *)v7[4];
  }
  if (v13 >= 0) {
    size_t v15 = *((unsigned __int8 *)v7 + 55);
  }
  else {
    size_t v15 = v7[5];
  }
  if (v15 >= v6) {
    size_t v16 = v6;
  }
  else {
    size_t v16 = v15;
  }
  int v17 = memcmp(v5, v14, v16);
  if (!v17)
  {
    if (v6 >= v15) {
      return v7;
    }
    return v2;
  }
  if (v17 < 0) {
    return v2;
  }
  return v7;
}

void sub_255150544(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_25515056C(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) >= 0) {
    uint64_t v2 = (const char *)a2;
  }
  else {
    uint64_t v2 = *(const char **)a2;
  }
  size_t v3 = strlen(v2);
  if (v3 > 0x7FFFFFFFFFFFFFF7) {
    sub_25514C40C();
  }
  std::string::size_type v4 = v3;
  if (v3 >= 0x17)
  {
    uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17) {
      uint64_t v6 = v3 | 7;
    }
    uint64_t v7 = v6 + 1;
    p_p = (std::string *)operator new(v6 + 1);
    __p.__r_.__value_.__l.__size_ = v4;
    __p.__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)p_p;
  }
  else
  {
    *((unsigned char *)&__p.__r_.__value_.__s + 23) = v3;
    p_p = &__p;
    if (!v3) {
      goto LABEL_12;
    }
  }
  memmove(p_p, v2, v4);
LABEL_12:
  p_p->__r_.__value_.__s.__data_[v4] = 0;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v8 = &__p;
  }
  else {
    int v8 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  size_t v10 = size;
  do
  {
    if (!v10) {
      goto LABEL_28;
    }
    int v11 = v8->__r_.__value_.__s.__data_[--v10];
  }
  while (v11 != 47);
  if (v10 == -1)
  {
LABEL_28:
    HIBYTE(v37) = 0;
    LOBYTE(__dst) = 0;
    if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  if (size >= v10) {
    size_t v12 = v10;
  }
  else {
    size_t v12 = size;
  }
  if (v12 > 0x7FFFFFFFFFFFFFF7) {
    sub_25514C40C();
  }
  if (v12 >= 0x17)
  {
    uint64_t v31 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v12 | 7) != 0x17) {
      uint64_t v31 = v12 | 7;
    }
    uint64_t v32 = v31 + 1;
    p_dst = operator new(v31 + 1);
    size_t v36 = v12;
    int64_t v37 = v32 | 0x8000000000000000;
    long long __dst = p_dst;
  }
  else
  {
    HIBYTE(v37) = v12;
    p_dst = &__dst;
    if (!v12)
    {
LABEL_79:
      *((unsigned char *)p_dst + v12) = 0;
      if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) == 0)
      {
LABEL_30:
        uint64_t v14 = getenv("__UNOWUD_RT");
        if (v14) {
          size_t v15 = v14;
        }
        else {
          size_t v15 = "";
        }
        size_t v16 = strlen(v15);
        if (v16 > 0x7FFFFFFFFFFFFFF7) {
          sub_25514C40C();
        }
        std::string::size_type v17 = v16;
        if (v16 >= 0x17)
        {
          uint64_t v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v16 | 7) != 0x17) {
            uint64_t v19 = v16 | 7;
          }
          uint64_t v20 = v19 + 1;
          size_t v18 = (std::string *)operator new(v19 + 1);
          __p.__r_.__value_.__l.__size_ = v17;
          __p.__r_.__value_.__r.__words[2] = v20 | 0x8000000000000000;
          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v18;
        }
        else
        {
          *((unsigned char *)&__p.__r_.__value_.__s + 23) = v16;
          size_t v18 = &__p;
          if (!v16)
          {
LABEL_41:
            v18->__r_.__value_.__s.__data_[v17] = 0;
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type v21 = 22;
            }
            else {
              std::string::size_type v21 = (__p.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
            }
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type v22 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type v22 = __p.__r_.__value_.__l.__size_;
            }
            if (v21 - v22 >= 0x16)
            {
              __n128 v23 = &__p;
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                __n128 v23 = (std::string *)__p.__r_.__value_.__r.__words[0];
              }
              qmemcpy((char *)v23 + v22, " --load-constant-path=", 22);
              std::string::size_type v24 = v22 + 22;
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                __p.__r_.__value_.__l.__size_ = v22 + 22;
              }
              else {
                *((unsigned char *)&__p.__r_.__value_.__s + 23) = v24 & 0x7F;
              }
              v23->__r_.__value_.__s.__data_[v24] = 0;
            }
            else
            {
              std::string::__grow_by_and_replace(&__p, v21, v22 - v21 + 22, v22, v22, 0, 0x16uLL, " --load-constant-path=");
            }
            if (v37 >= 0) {
              size_t v25 = &__dst;
            }
            else {
              size_t v25 = __dst;
            }
            if (v37 >= 0) {
              size_t v26 = HIBYTE(v37);
            }
            else {
              size_t v26 = v36;
            }
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type v27 = 22;
            }
            else {
              std::string::size_type v27 = (__p.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
            }
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type v28 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type v28 = __p.__r_.__value_.__l.__size_;
            }
            if (v27 - v28 >= v26)
            {
              if (v26)
              {
                if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  size_t v29 = &__p;
                }
                else {
                  size_t v29 = (std::string *)__p.__r_.__value_.__r.__words[0];
                }
                memmove((char *)v29 + v28, v25, v26);
                std::string::size_type v30 = v28 + v26;
                if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                  __p.__r_.__value_.__l.__size_ = v28 + v26;
                }
                else {
                  *((unsigned char *)&__p.__r_.__value_.__s + 23) = v30 & 0x7F;
                }
                v29->__r_.__value_.__s.__data_[v30] = 0;
              }
            }
            else
            {
              std::string::__grow_by_and_replace(&__p, v27, v28 + v26 - v27, v28, v28, 0, v26, (const std::string::value_type *)v25);
            }
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              BOOL v33 = &__p;
            }
            else {
              BOOL v33 = (std::string *)__p.__r_.__value_.__r.__words[0];
            }
            setenv("__UNOWUD_RT", (const char *)v33, 1);
            operator new();
          }
        }
        memmove(v18, v15, v17);
        goto LABEL_41;
      }
LABEL_29:
      operator delete(__p.__r_.__value_.__l.__data_);
      goto LABEL_30;
    }
  }
  memmove(p_dst, v8, v12);
  goto LABEL_79;
}

void sub_255150A08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  uint64_t v22 = *(void *)(v20 + 8);
  *(void *)(v20 + 8) = 0;
  if (v22) {
    sub_25515DD90(v22);
  }
  sub_25515E074(v20);
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_255150A74(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = mlc_binary_create();
  *(void *)(a1 + 40) = v2;
  if (!v2) {
    return 0;
  }
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  mlc_binary_error();
  uint64_t v3 = 1;
  sub_255150C9C((void *)(a1 + 16), &v10);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v4 = 22;
  }
  else {
    std::string::size_type v4 = (v10.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
  }
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v10.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v10.__r_.__value_.__l.__size_;
  }
  if (v4 - size >= 6)
  {
    uint64_t v6 = &v10;
    if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      uint64_t v6 = (std::string *)v10.__r_.__value_.__r.__words[0];
    }
    uint64_t v7 = (char *)v6 + size;
    *((_WORD *)v7 + 2) = 25193;
    *(_DWORD *)uint64_t v7 = 1819894830;
    std::string::size_type v8 = size + 6;
    if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
      v10.__r_.__value_.__l.__size_ = size + 6;
    }
    else {
      *((unsigned char *)&v10.__r_.__value_.__s + 23) = v8 & 0x7F;
    }
    v6->__r_.__value_.__s.__data_[v8] = 0;
  }
  else
  {
    std::string::__grow_by_and_replace(&v10, v4, size - v4 + 6, size, size, 0, 6uLL, ".dylib");
  }
  std::string buf = v10;
  mlc_binary_set_kernel_dylib();
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(buf.__r_.__value_.__l.__data_);
  }
  return v3;
}

void sub_255150C60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a14 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void *sub_255150C9C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result;
  unint64_t v4 = *((unsigned __int8 *)result + 23);
  unint64_t v5 = result[1];
  if ((v4 & 0x80u) == 0) {
    size_t v6 = *((unsigned __int8 *)result + 23);
  }
  else {
    size_t v6 = result[1];
  }
  if (!v6
    || ((v7 = (void *)*result, (v4 & 0x80u) == 0) ? (std::string::size_type v8 = result) : (std::string::size_type v8 = (void *)*result),
        (result = memchr(v8, 58, v6), int64_t v9 = (char *)result - (unsigned char *)v8, result) ? (v10 = v9 == -1) : (v10 = 1),
        v10))
  {
    if ((v4 & 0x80) == 0) {
      goto LABEL_14;
    }
  }
  else
  {
    unint64_t v11 = v9 + 2;
    if ((v4 & 0x80) == 0)
    {
      if (v11 < v4)
      {
        int64_t v12 = v9 + 3;
        if (v9 + 3 > v4) {
LABEL_34:
        }
          sub_25514C4B4();
LABEL_22:
        unint64_t v13 = v4 - v12;
        if (v4 - v12 >= 0x7FFFFFFFFFFFFFF8) {
          sub_25514C40C();
        }
        if (v13 >= 0x17)
        {
          uint64_t v15 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v13 | 7) != 0x17) {
            uint64_t v15 = v13 | 7;
          }
          uint64_t v16 = v15 + 1;
          std::string::size_type v17 = operator new(v15 + 1);
          a2[1] = v13;
          a2[2] = v16 | 0x8000000000000000;
          *a2 = v17;
          a2 = v17;
        }
        else
        {
          *((unsigned char *)a2 + 23) = v13;
          if (v4 == v12) {
            goto LABEL_33;
          }
        }
        __n128 result = memmove(a2, (char *)v2 + v12, v4 - v12);
LABEL_33:
        *((unsigned char *)a2 + v13) = 0;
        return result;
      }
LABEL_14:
      *(_OWORD *)a2 = *(_OWORD *)v2;
      a2[2] = v2[2];
      return result;
    }
    if (v5 > v11)
    {
      int64_t v12 = v9 + 3;
      if (v5 < v9 + 3) {
        goto LABEL_34;
      }
      unint64_t v4 = v5;
      uint64_t v2 = v7;
      goto LABEL_22;
    }
  }
  uint64_t v14 = (void *)*v2;
  return sub_2551501FC(a2, v14, v5);
}

uint64_t sub_255150E20(uint64_t a1)
{
  *(void *)a1 = &unk_270446008;
  if (*(char *)(a1 + 39) < 0) {
    operator delete(*(void **)(a1 + 16));
  }
  uint64_t v2 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return nullsub_1(a1);
}

void sub_255150EB0(uint64_t a1)
{
  *(void *)a1 = &unk_270446008;
  if (*(char *)(a1 + 39) < 0) {
    operator delete(*(void **)(a1 + 16));
  }
  uint64_t v2 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  nullsub_1(a1);
  JUMPOUT(0x25A288F90);
}

uint64_t sub_255150F54(unsigned char *a1, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unint64_t v14 = mlc_binary_n_inputs();
  unint64_t v15 = mlc_binary_n_outputs();
  std::string::size_type v21 = a1;
  v28[0] = &unk_2704460A8;
  v28[1] = MEMORY[0x263F53130];
  size_t v29 = v28;
  v26[0] = &unk_2704460F0;
  v26[1] = MEMORY[0x263F53140];
  std::string::size_type v27 = v26;
  if (v14 >= a2) {
    uint64_t v16 = a2;
  }
  else {
    uint64_t v16 = v14;
  }
  sub_2551512EC((uint64_t *)&v21, (uint64_t)v28, (uint64_t)v26, a3, a4, v16);
  if (v27 == v26)
  {
    (*(void (**)(void *))(v26[0] + 32))(v26);
  }
  else if (v27)
  {
    (*(void (**)(void *))(*v27 + 40))(v27);
  }
  if (v29 == v28)
  {
    (*(void (**)(void *))(v28[0] + 32))(v28);
  }
  else if (v29)
  {
    (*(void (**)(void *))(*v29 + 40))(v29);
  }
  v24[0] = &unk_2704460A8;
  v24[1] = MEMORY[0x263F53138];
  size_t v25 = v24;
  v22[0] = &unk_2704460F0;
  v22[1] = MEMORY[0x263F53140];
  __n128 v23 = v22;
  if (v15 >= a5) {
    uint64_t v17 = a5;
  }
  else {
    uint64_t v17 = v15;
  }
  sub_2551512EC((uint64_t *)&v21, (uint64_t)v24, (uint64_t)v22, a6, a7, v17);
  if (v23 == v22)
  {
    (*(void (**)(void *))(v22[0] + 32))(v22);
  }
  else if (v23)
  {
    (*(void (**)(void *))(*v23 + 40))(v23);
  }
  if (v25 == v24)
  {
    (*(void (**)(void *))(v24[0] + 32))(v24);
  }
  else if (v25)
  {
    (*(void (**)(void *))(*v25 + 40))(v25);
  }
  BOOL v19 = v14 == a2 && v15 == a5;
  a1[50] = v19;
  a1[48] = 0;
  return sub_2551516C8(a1);
}

void sub_2551512BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  sub_2551515C0((uint64_t *)va);
  sub_255151644(va1);
  _Unwind_Resume(a1);
}

void sub_2551512EC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *a1;
  v37[0] = 0;
  v37[1] = 0;
  size_t v36 = v37;
  if (!a6) {
    goto LABEL_25;
  }
  for (uint64_t i = 0; i != a6; ++i)
  {
    __p[0] = *(void **)(v6 + 40);
    *(void *)&long long __dst = i;
    uint64_t v12 = *(void *)(a2 + 24);
    if (!v12) {
      sub_255151E60();
    }
    (*(void (**)(uint64_t, void **, long long *))(*(void *)v12 + 48))(v12, __p, &__dst);
    unint64_t v13 = (const char *)mlc_tensor_name();
    size_t v14 = strlen(v13);
    if (v14 >= 0x7FFFFFFFFFFFFFF8) {
      sub_25514C40C();
    }
    size_t v15 = v14;
    if (v14 >= 0x17)
    {
      uint64_t v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v14 | 7) != 0x17) {
        uint64_t v17 = v14 | 7;
      }
      uint64_t v18 = v17 + 1;
      p_dst = (long long *)operator new(v17 + 1);
      *((void *)&__dst + 1) = v15;
      unint64_t v32 = v18 | 0x8000000000000000;
      *(void *)&long long __dst = p_dst;
LABEL_12:
      memmove(p_dst, v13, v15);
      goto LABEL_13;
    }
    HIBYTE(v32) = v14;
    p_dst = &__dst;
    if (v14) {
      goto LABEL_12;
    }
LABEL_13:
    *((unsigned char *)p_dst + v15) = 0;
    *(_OWORD *)std::string __p = __dst;
    unint64_t v34 = v32;
    int v35 = i;
    sub_255151EE8((uint64_t **)&v36, (const void **)__p, (uint64_t)__p);
    if (SHIBYTE(v34) < 0) {
      operator delete(__p[0]);
    }
  }
  uint64_t v19 = 0;
  uint64_t v20 = (uint64_t *)v36;
  do
  {
    uint64_t v21 = *((int *)v20 + 14);
    __p[0] = *(void **)(v6 + 40);
    *(void *)&long long __dst = v21;
    uint64_t v22 = *(void *)(a2 + 24);
    if (!v22
      || (__n128 v23 = (void *)(*(uint64_t (**)(uint64_t, void **, long long *))(*(void *)v22 + 48))(v22, __p, &__dst), v24 = *(void *)(a4 + 8 * v19), v25 = *(void *)(a5 + 8 * v19), __p[0] = v23, *(void *)&__dst = v24, v38 = v25, (v26 = *(void *)(a3 + 24)) == 0))
    {
      sub_255151E60();
    }
    (*(void (**)(uint64_t, void **, long long *, uint64_t *))(*(void *)v26 + 48))(v26, __p, &__dst, &v38);
    mlc_tensor_event();
    mlc_event_record();
    std::string::size_type v27 = (uint64_t *)v20[1];
    if (v27)
    {
      do
      {
        std::string::size_type v28 = v27;
        std::string::size_type v27 = (uint64_t *)*v27;
      }
      while (v27);
    }
    else
    {
      do
      {
        std::string::size_type v28 = (uint64_t *)v20[2];
        BOOL v29 = *v28 == (void)v20;
        uint64_t v20 = v28;
      }
      while (!v29);
    }
    ++v19;
    uint64_t v20 = v28;
  }
  while (v19 != a6);
LABEL_25:
  sub_255150008((uint64_t)&v36, v37[0]);
}

void sub_25515157C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, char a20,char *a21)
{
}

void *sub_2551515C0(void *a1)
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

void *sub_255151644(void *a1)
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

uint64_t sub_2551516C8(unsigned char *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  if (!a1[48] && a1[49] && a1[50])
  {
    mlc_binary_validate();
    mlc_binary_error();
    a1[48] = 1;
  }
  return 1;
}

uint64_t sub_2551517E4(unsigned char *a1)
{
  a1[49] = 1;
  return sub_2551516C8(a1);
}

uint64_t sub_2551518E8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (!sub_255151AB4(a1, a2))
  {
    unint64_t v13 = os_log_create("com.apple.mlcompiler.service", "ExecutionInProcess");
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v14) {
      return result;
    }
    int v21 = 136315138;
    uint64_t v22 = a2;
    uint64_t v16 = "No tensor named '%s' in the inputs or outputs of the binary";
    uint64_t v17 = v13;
    uint32_t v18 = 12;
LABEL_13:
    _os_log_impl(&dword_255146000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v21, v18);
    return 0;
  }
  if (mlc_tensor_rank() != a3)
  {
    uint64_t v19 = os_log_create("com.apple.mlcompiler.service", "ExecutionInProcess");
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v20) {
      return result;
    }
    int v21 = 136315394;
    uint64_t v22 = a2;
    __int16 v23 = 2048;
    uint64_t v24 = a3;
    uint64_t v16 = "Tensor '%s' is not rank %zu";
    uint64_t v17 = v19;
    uint32_t v18 = 22;
    goto LABEL_13;
  }
  if (a3)
  {
    uint64_t v9 = 0;
    do
    {
      *(void *)(a4 + 8 * v9) = mlc_tensor_dimension();
      uint64_t v11 = mlc_tensor_stride();
      unsigned int v12 = mlc_tensor_type();
      if (v12 <= 0xC) {
        uint64_t v10 = qword_25515FA88[v12];
      }
      else {
        uint64_t v10 = 0;
      }
      *(void *)(a5 + 8 * v9++) = v10 * v11;
    }
    while (a3 != v9);
  }
  return 1;
}

uint64_t sub_255151AB4(uint64_t a1, const char *a2)
{
  uint64_t v3 = mlc_binary_n_inputs();
  uint64_t v4 = mlc_binary_n_outputs();
  if (v3)
  {
    uint64_t v5 = 0;
    while (1)
    {
      uint64_t v6 = mlc_binary_input();
      uint64_t v7 = (const char *)mlc_tensor_name();
      size_t v8 = strlen(v7);
      if (!strncmp(a2, v7, v8)) {
        break;
      }
      if (v3 == ++v5) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    if (v4)
    {
      uint64_t v9 = 0;
      while (1)
      {
        uint64_t v6 = mlc_binary_output();
        uint64_t v10 = (const char *)mlc_tensor_name();
        size_t v11 = strlen(v10);
        if (!strncmp(a2, v10, v11)) {
          break;
        }
        if (v4 == ++v9) {
          return 0;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

uint64_t sub_255151B98(unsigned char *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (!sub_255151AB4((uint64_t)a1, a2))
  {
    unint64_t v13 = os_log_create("com.apple.mlcompiler.service", "ExecutionInProcess");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      uint64_t v20 = (uint64_t)a2;
      BOOL v14 = "No tensor named '%s' in the inputs or outputs of the binary";
LABEL_17:
      size_t v15 = v13;
      uint32_t v16 = 12;
LABEL_18:
      _os_log_impl(&dword_255146000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v19, v16);
    }
    return 0;
  }
  if (mlc_tensor_rank() != a3)
  {
    unint64_t v13 = os_log_create("com.apple.mlcompiler.service", "ExecutionInProcess");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      uint64_t v20 = (uint64_t)a2;
      BOOL v14 = "Cannot change rank of tensor '%s'";
      goto LABEL_17;
    }
    return 0;
  }
  a1[48] = 0;
  if (a3)
  {
    uint64_t v9 = 0;
    while (1)
    {
      mlc_tensor_set_dimension();
      unsigned int v10 = mlc_tensor_type();
      uint64_t v11 = v10 > 0xC ? 0 : qword_25515FA88[v10];
      if ((*(void *)(a5 + 8 * v9) & (v11 - 1)) != 0) {
        break;
      }
      mlc_tensor_set_stride();
      if (a3 == ++v9) {
        goto LABEL_10;
      }
    }
    uint64_t v17 = os_log_create("com.apple.mlcompiler.service", "ExecutionInProcess");
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    uint64_t v18 = *(void *)(a5 + 8 * v9);
    int v19 = 134218496;
    uint64_t v20 = v18;
    __int16 v21 = 2048;
    uint64_t v22 = v11;
    __int16 v23 = 2048;
    uint64_t v24 = v18 % v11;
    BOOL v14 = "Strides must be in multiples of the element size (stride %lld mod element size %lld == %lld)";
    size_t v15 = v17;
    uint32_t v16 = 32;
    goto LABEL_18;
  }
LABEL_10:
  return sub_2551516C8(a1);
}

uint64_t sub_255151DFC(uint64_t a1)
{
  return MEMORY[0x270F48890](*(void *)(a1 + 40));
}

uint64_t sub_255151E04()
{
  return 1;
}

uint64_t sub_255151E24(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    mlc_binary_destroy();
    *(void *)(a1 + 40) = 0;
  }
  *(_WORD *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 50) = 0;
  return 1;
}

void sub_255151E60()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &unk_270446080;
  __cxa_throw(exception, (struct type_info *)&unk_270446058, (void (*)(void *))std::exception::~exception);
}

void sub_255151EB0(std::exception *a1)
{
  std::exception::~exception(a1);
  JUMPOUT(0x25A288F90);
}

uint64_t **sub_255151EE8(uint64_t **a1, const void **a2, uint64_t a3)
{
  uint64_t v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    int v7 = *((char *)a2 + 23);
    if (v7 >= 0) {
      size_t v8 = a2;
    }
    else {
      size_t v8 = *a2;
    }
    if (v7 >= 0) {
      size_t v9 = *((unsigned __int8 *)a2 + 23);
    }
    else {
      size_t v9 = (size_t)a2[1];
    }
    while (1)
    {
      unsigned int v10 = (uint64_t **)v5;
      unint64_t v13 = (const void *)v5[4];
      uint64_t v11 = v5 + 4;
      unsigned int v12 = v13;
      int v14 = *((char *)v11 + 23);
      if (v14 >= 0) {
        size_t v15 = v11;
      }
      else {
        size_t v15 = v12;
      }
      if (v14 >= 0) {
        size_t v16 = *((unsigned __int8 *)v11 + 23);
      }
      else {
        size_t v16 = v11[1];
      }
      if (v16 >= v9) {
        size_t v17 = v9;
      }
      else {
        size_t v17 = v16;
      }
      int v18 = memcmp(v8, v15, v17);
      if (v18)
      {
        if (v18 < 0) {
          goto LABEL_8;
        }
LABEL_22:
        int v19 = memcmp(v15, v8, v17);
        if (v19)
        {
          if ((v19 & 0x80000000) == 0) {
            return v10;
          }
        }
        else if (v16 >= v9)
        {
          return v10;
        }
        uint64_t v5 = v10[1];
        if (!v5)
        {
          uint64_t v6 = v10 + 1;
          goto LABEL_29;
        }
      }
      else
      {
        if (v9 >= v16) {
          goto LABEL_22;
        }
LABEL_8:
        uint64_t v5 = *v10;
        uint64_t v6 = v10;
        if (!*v10) {
          goto LABEL_29;
        }
      }
    }
  }
  unsigned int v10 = a1 + 1;
LABEL_29:
  uint64_t v20 = (char *)operator new(0x40uLL);
  __int16 v21 = v20 + 32;
  if (*(char *)(a3 + 23) < 0)
  {
    sub_2551501FC(v21, *(void **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)__int16 v21 = *(_OWORD *)a3;
    *((void *)v20 + 6) = *(void *)(a3 + 16);
  }
  *((_DWORD *)v20 + 14) = *(_DWORD *)(a3 + 24);
  *(void *)uint64_t v20 = 0;
  *((void *)v20 + 1) = 0;
  *((void *)v20 + 2) = v10;
  *uint64_t v6 = (uint64_t *)v20;
  uint64_t v22 = (uint64_t *)**a1;
  __int16 v23 = (uint64_t *)v20;
  if (v22)
  {
    *a1 = v22;
    __int16 v23 = *v6;
  }
  sub_25515029C(a1[1], v23);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return (uint64_t **)v20;
}

void sub_255152064(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_25515207C()
{
}

void *sub_255152090(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_2704460A8;
  result[1] = v3;
  return result;
}

uint64_t sub_2551520D8(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_2704460A8;
  a2[1] = v2;
  return result;
}

uint64_t sub_255152104(uint64_t a1, void *a2, void *a3)
{
  return (*(uint64_t (**)(void, void))(a1 + 8))(*a2, *a3);
}

void sub_255152118()
{
}

void *sub_25515212C(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_2704460F0;
  result[1] = v3;
  return result;
}

uint64_t sub_255152174(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_2704460F0;
  a2[1] = v2;
  return result;
}

uint64_t sub_2551521A0(uint64_t a1, void *a2, void *a3, void *a4)
{
  return (*(uint64_t (**)(void, void, void))(a1 + 8))(*a2, *a3, *a4);
}

uint64_t sub_2551521B4(uint64_t a1)
{
  v6[0] = 0;
  v6[1] = 0;
  char v5 = 4;
  strcpy((char *)__p, "main");
  BOOL v1 = sub_255156D20((uint64_t)v6, a1, (const void **)__p);
  BOOL v2 = v1;
  if ((v5 & 0x80000000) == 0)
  {
    if (!v1) {
      goto LABEL_6;
    }
LABEL_5:
    operator new();
  }
  operator delete(__p[0]);
  if (v2) {
    goto LABEL_5;
  }
LABEL_6:
  sub_255157210(v6);
  return 0;
}

void sub_255152338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  sub_255157210(&a16);
  _Unwind_Resume(a1);
}

BOOL sub_255152364(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  *(unsigned char *)(a1 + 80) = 0;
  unint64_t v7 = a5 + a2;
  if (!(a5 + a2))
  {
    *(unsigned char *)(a1 + 82) = 1;
LABEL_14:
    BOOL result = 1;
    if (*(unsigned char *)(a1 + 81)) {
      *(unsigned char *)(a1 + 80) = 1;
    }
    return result;
  }
  if (a2) {
    uint64_t v11 = a3;
  }
  else {
    uint64_t v11 = a6;
  }
  int v12 = (*(uint64_t (**)(void, void, void))(a1 + 56))(*(void *)(a1 + 24), 0, *v11);
  BOOL result = 0;
  if (!v12)
  {
    uint64_t v14 = (uint64_t)&a6[-a2 + 1];
    size_t v15 = a3 + 1;
    unint64_t v16 = 1;
    while (v7 != v16)
    {
      if (v16 >= a2) {
        size_t v17 = (void *)v14;
      }
      else {
        size_t v17 = v15;
      }
      int v18 = (*(uint64_t (**)(void, unint64_t, void))(a1 + 56))(*(void *)(a1 + 24), v16++, *v17);
      v14 += 8;
      ++v15;
      if (v18) {
        return v16 - 1 >= v7;
      }
    }
    int v19 = *(unsigned __int8 *)(a1 + 80);
    BOOL result = 1;
    *(unsigned char *)(a1 + 82) = 1;
    if (!v19) {
      goto LABEL_14;
    }
  }
  return result;
}

uint64_t sub_255152454()
{
  return 1;
}

uint64_t sub_25515245C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 72))(*(void *)(a1 + 24));
}

uint64_t sub_255152468(uint64_t a1)
{
  sub_255157138(a1 + 16);
  uint64_t v2 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = 0;
  if (v2) {
    MEMORY[0x25A288F70](v2, 0x1000C8077774924);
  }
  *(_WORD *)(a1 + 80) = 0;
  *(unsigned char *)(a1 + 82) = 0;
  return 1;
}

uint64_t sub_2551524BC(void *a1)
{
  *a1 = &unk_270446138;
  sub_255157210(a1 + 2);
  uint64_t v2 = a1[1];
  a1[1] = 0;
  if (v2) {
    MEMORY[0x25A288F70](v2, 0x1000C8077774924);
  }
  return nullsub_1(a1);
}

void sub_255152530(void *a1)
{
  *a1 = &unk_270446138;
  sub_255157210(a1 + 2);
  uint64_t v2 = a1[1];
  a1[1] = 0;
  if (v2) {
    MEMORY[0x25A288F70](v2, 0x1000C8077774924);
  }
  nullsub_1(a1);
  JUMPOUT(0x25A288F90);
}

char *mlc_services_compile(int a1, const char **a2)
{
  memset(&v70, 0, sizeof(v70));
  if (a1 >= 2)
  {
    uint64_t v2 = a1 - 1;
    uint64_t v3 = a2 + 1;
    while (1)
    {
      char v5 = *v3;
      size_t v6 = strlen(*v3);
      if (v6 > 0x7FFFFFFFFFFFFFF7) {
        sub_25514C40C();
      }
      unint64_t v7 = (unsigned char *)v6;
      if (v6 >= 0x17) {
        break;
      }
      HIBYTE(v67) = v6;
      p_dst = (char *)&__dst;
      if (v6) {
        goto LABEL_13;
      }
LABEL_14:
      v7[(void)p_dst] = 0;
      if (v67 >= 0) {
        uint64_t v11 = (const std::string::value_type *)&__dst;
      }
      else {
        uint64_t v11 = __dst;
      }
      if (v67 >= 0) {
        std::string::size_type v12 = HIBYTE(v67);
      }
      else {
        std::string::size_type v12 = (std::string::size_type)v66;
      }
      if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v13 = 22;
      }
      else {
        std::string::size_type v13 = (v70.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
      }
      if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(v70.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v70.__r_.__value_.__l.__size_;
      }
      if (v13 - size < v12)
      {
        std::string::__grow_by_and_replace(&v70, v13, size + v12 - v13, size, size, 0, v12, v11);
        goto LABEL_34;
      }
      if (!v12) {
        goto LABEL_34;
      }
      if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        size_t v15 = &v70;
      }
      else {
        size_t v15 = (std::string *)v70.__r_.__value_.__r.__words[0];
      }
      memmove((char *)v15 + size, v11, v12);
      std::string::size_type v16 = size + v12;
      if ((SHIBYTE(v70.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        *((unsigned char *)&v70.__r_.__value_.__s + 23) = v16 & 0x7F;
        v15->__r_.__value_.__s.__data_[v16] = 0;
LABEL_34:
        if ((SHIBYTE(v67) & 0x80000000) == 0) {
          goto LABEL_36;
        }
LABEL_35:
        operator delete(__dst);
        goto LABEL_36;
      }
      v70.__r_.__value_.__l.__size_ = size + v12;
      v15->__r_.__value_.__s.__data_[v16] = 0;
      if (SHIBYTE(v67) < 0) {
        goto LABEL_35;
      }
LABEL_36:
      std::string::size_type v17 = HIBYTE(v70.__r_.__value_.__r.__words[2]);
      if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        size_t v18 = 22;
      }
      else {
        size_t v18 = (v70.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
      }
      if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type v17 = v70.__r_.__value_.__l.__size_;
      }
      if (v18 != v17)
      {
        if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v22 = &v70;
        }
        else {
          uint64_t v22 = (std::string *)v70.__r_.__value_.__r.__words[0];
        }
        v22->__r_.__value_.__s.__data_[v17] = 32;
        std::string::size_type v23 = v17 + 1;
        if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0) {
          v70.__r_.__value_.__l.__size_ = v23;
        }
        else {
          *((unsigned char *)&v70.__r_.__value_.__s + 23) = v23 & 0x7F;
        }
        uint64_t v4 = (char *)v22 + v23;
        goto LABEL_5;
      }
      if (v18 == 0x7FFFFFFFFFFFFFF6) {
        sub_25514C40C();
      }
      if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int v19 = &v70;
      }
      else {
        int v19 = (std::string *)v70.__r_.__value_.__r.__words[0];
      }
      size_t v20 = 0x7FFFFFFFFFFFFFF7;
      if (v18 <= 0x3FFFFFFFFFFFFFF2)
      {
        if (v18 + 1 > 2 * v18) {
          unint64_t v21 = v18 + 1;
        }
        else {
          unint64_t v21 = 2 * v18;
        }
        if (v21 >= 0x17)
        {
          unint64_t v24 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
          uint64_t v25 = v21 | 7;
          if (v25 == 23) {
            uint64_t v25 = v24;
          }
          size_t v20 = v25 + 1;
        }
        else
        {
          size_t v20 = 23;
        }
      }
      uint64_t v26 = operator new(v20);
      std::string::size_type v27 = (std::string::size_type)v26;
      if (v18)
      {
        memmove(v26, v19, v18);
        *(unsigned char *)(v27 + v18) = 32;
        if (v18 == 22) {
          goto LABEL_65;
        }
      }
      else
      {
        unsigned char *v26 = 32;
      }
      operator delete(v19);
LABEL_65:
      v70.__r_.__value_.__r.__words[0] = v27;
      v70.__r_.__value_.__l.__size_ = v18 + 1;
      v70.__r_.__value_.__r.__words[2] = v20 | 0x8000000000000000;
      uint64_t v4 = (unsigned char *)(v27 + v18 + 1);
LABEL_5:
      *uint64_t v4 = 0;
      ++v3;
      if (!--v2) {
        goto LABEL_68;
      }
    }
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    p_dst = (char *)operator new(v9 + 1);
    uint64_t v66 = v7;
    int64_t v67 = v10 | 0x8000000000000000;
    long long __dst = p_dst;
LABEL_13:
    memmove(p_dst, v5, (size_t)v7);
    goto LABEL_14;
  }
LABEL_68:
  sub_255158DA8(&__dst);
  sub_25515B784(&__dst, (long long *)&v70);
  key[23] = 10;
  strcpy(key, "bnns-graph");
  int v28 = sub_25515B614((uint64_t)&__dst, (uint64_t)key);
  int v29 = v28;
  if (key[23] < 0)
  {
    operator delete(*(void **)key);
    if (v29) {
      goto LABEL_70;
    }
  }
  else if (v28)
  {
LABEL_70:
    uint64_t v30 = sub_2551537A8((uint64_t)&__dst);
    goto LABEL_110;
  }
  sub_255152F3C(&v62, a2, &a2[a1]);
  *(void *)key = operator new(0x20uLL);
  *(_OWORD *)&key[8] = xmmword_25515FAF0;
  strcpy(*(char **)key, "--enable-external-outputs");
  uint64_t v31 = v63;
  if ((unint64_t)v63 >= v64)
  {
    BOOL v33 = sub_255153194(&v62, (uint64_t)key);
    v63 = v33;
    if (key[23] < 0)
    {
      operator delete(*(void **)key);
      BOOL v33 = v63;
    }
  }
  else
  {
    long long v32 = *(_OWORD *)key;
    *((void *)v63 + 2) = *(void *)&key[16];
    *uint64_t v31 = v32;
    BOOL v33 = (char *)v31 + 24;
    v63 = (char *)v31 + 24;
  }
  std::string __p = 0;
  uint64_t v60 = 0;
  uint64_t v61 = 0;
  unint64_t v34 = (void **)v62;
  *(void *)key = &__p;
  if (v62 == v33)
  {
    size_t v36 = 0;
    int64_t v37 = 0;
  }
  else
  {
    do
    {
      if (*((char *)v34 + 23) >= 0) {
        int v35 = (char *)v34;
      }
      else {
        int v35 = (char *)*v34;
      }
      v71 = v35;
      sub_255153300((void ***)key, &v71);
      v34 += 3;
    }
    while (v34 != (void **)v33);
    size_t v36 = __p;
    int64_t v37 = v60;
  }
  uint64_t v38 = xpc_connection_create("com.apple.mlcompiler.services.compiler", 0);
  xpc_connection_set_event_handler(v38, &unk_270446188);
  xpc_connection_activate(v38);
  unint64_t v39 = (unint64_t)(v37 - v36) >> 3;
  v71 = 0;
  unint64_t v72 = 0;
  uint64_t v73 = 0;
  if (v39)
  {
    if ((v39 & 0x80000000) != 0) {
      sub_25514C55C();
    }
    size_t v40 = 8 * (int)((v37 - v36) >> 3);
    uint64_t v41 = (char *)operator new(v40);
    uint64_t v42 = &v41[v40];
    v71 = v41;
    uint64_t v73 = &v41[v40];
    memcpy(v41, v36, v40);
    unint64_t v72 = v42;
  }
  xpc_object_t v43 = sub_25515347C(0x407uLL, (uint64_t)&v71);
  if (v71)
  {
    unint64_t v72 = v71;
    operator delete(v71);
  }
  xpc_object_t v44 = xpc_connection_send_message_with_reply_sync(v38, v43);
  xpc_connection_cancel(v38);
  xpc_release(v38);
  if (MEMORY[0x25A289480](v44) == MEMORY[0x263EF8720])
  {
    key[23] = 19;
    strcpy(key, "XPCErrorDescription");
    xpc_object_t value = xpc_dictionary_get_value(v44, key);
    string_ptr = xpc_string_get_string_ptr(value);
    if (key[23] < 0) {
      operator delete(*(void **)key);
    }
    uint64_t v30 = strdup(string_ptr);
    if (!v44) {
      goto LABEL_98;
    }
    goto LABEL_97;
  }
  key[23] = 1;
  strcpy(key, "m");
  xpc_object_t v45 = xpc_dictionary_get_value(v44, key);
  int v46 = xpc_string_get_string_ptr(v45);
  uint64_t v30 = strdup(v46);
  if ((key[23] & 0x80000000) == 0)
  {
    if (!v44) {
      goto LABEL_98;
    }
    goto LABEL_97;
  }
  operator delete(*(void **)key);
  if (v44) {
LABEL_97:
  }
    xpc_release(v44);
LABEL_98:
  if (v43) {
    xpc_release(v43);
  }
  if (__p)
  {
    uint64_t v60 = __p;
    operator delete(__p);
  }
  size_t v49 = (char *)v62;
  if (v62)
  {
    int v50 = v63;
    int v51 = v62;
    if (v63 != v62)
    {
      do
      {
        if (*(v50 - 1) < 0) {
          operator delete(*((void **)v50 - 3));
        }
        v50 -= 24;
      }
      while (v50 != v49);
      int v51 = v62;
    }
    v63 = v49;
    operator delete(v51);
  }
LABEL_110:
  long long __dst = (char *)&unk_2704461B8;
  sub_255150008((uint64_t)v69, v69[1]);
  uint64_t v52 = (void **)v68;
  if (v68)
  {
    do
    {
      size_t v53 = (void **)*v52;
      uint64_t v54 = *((unsigned int *)v52 + 16);
      if (v54 != -1) {
        ((void (*)(char *, void **))off_2704461D8[v54])(key, v52 + 5);
      }
      *((_DWORD *)v52 + 16) = -1;
      if (*((char *)v52 + 39) < 0) {
        operator delete(v52[2]);
      }
      operator delete(v52);
      uint64_t v52 = v53;
    }
    while (v53);
  }
  int v55 = v66;
  uint64_t v66 = 0;
  if (v55) {
    operator delete(v55);
  }
  nullsub_1(&__dst);
  if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v70.__r_.__value_.__l.__data_);
  }
  return v30;
}

void sub_255152CB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void **a15, void **a16, uint64_t a17, void *a18, void *a19, int a20,__int16 a21,char a22,char a23,void **a24,uint64_t a25,uint64_t a26,uint64_t a27,char *a28,uint64_t a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  if (*(char *)(v35 - 105) < 0) {
    operator delete(*(void **)(v35 - 128));
  }
  int64_t v37 = a15;
  if (a15)
  {
    uint64_t v38 = a16;
    unint64_t v39 = a15;
    if (a16 != a15)
    {
      do
      {
        if (*((char *)v38 - 1) < 0) {
          operator delete(*(v38 - 3));
        }
        v38 -= 3;
      }
      while (v38 != v37);
      unint64_t v39 = a15;
    }
    a16 = v37;
    operator delete(v39);
  }
  a18 = &unk_2704461B8;
  sub_255150008((uint64_t)&a27, a28);
  size_t v40 = a24;
  if (a24)
  {
    do
    {
      uint64_t v42 = (void **)*v40;
      uint64_t v43 = *((unsigned int *)v40 + 16);
      if (v43 != -1) {
        ((void (*)(void ***, void **))off_2704461D8[v43])(&a15, v40 + 5);
      }
      *((_DWORD *)v40 + 16) = -1;
      if (*((char *)v40 + 39) < 0) {
        operator delete(v40[2]);
      }
      operator delete(v40);
      size_t v40 = v42;
    }
    while (v42);
  }
  uint64_t v41 = a19;
  a19 = 0;
  if (v41) {
    operator delete(v41);
  }
  nullsub_1(&a18);
  if (a35 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

const char *mlc_services_compile_to_cache()
{
  v0 = os_log_create("com.apple.mlcompiler.service", "Compilation");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_25515E0A8(v0);
  }
  return "function no longer supported";
}

void sub_255152F28(void *a1)
{
}

void *sub_255152F3C(void *a1, const char **a2, const char **a3)
{
  a1[2] = 0;
  uint64_t v4 = (uint64_t)(a1 + 2);
  *a1 = 0;
  a1[1] = 0;
  uint64_t v5 = (char *)a3 - (char *)a2;
  if (a3 != a2)
  {
    if ((unint64_t)v5 >= 0x5555555555555551) {
      sub_25514C55C();
    }
    uint64_t v8 = v5 >> 3;
    uint64_t v9 = operator new(24 * (v5 >> 3));
    *a1 = v9;
    a1[1] = v9;
    a1[2] = &v9[24 * v8];
    a1[1] = sub_255153010(v4, a2, a3, v9);
  }
  return a1;
}

void sub_255152FE4(_Unwind_Exception *exception_object)
{
  *(void *)(v1 + 8) = v2;
  if (*(void *)v1) {
    sub_25515E12C((void **)(v1 + 8), *(void ***)v1, (void **)v1);
  }
  _Unwind_Resume(exception_object);
}

unsigned char *sub_255153010(uint64_t a1, const char **a2, const char **a3, unsigned char *a4)
{
  uint64_t v4 = a4;
  uint64_t v14 = a4;
  if (a2 != a3)
  {
    size_t v6 = a2;
    while (1)
    {
      unint64_t v7 = *v6;
      size_t v8 = strlen(*v6);
      if (v8 >= 0x7FFFFFFFFFFFFFF8) {
        sub_25514C40C();
      }
      size_t v9 = v8;
      if (v8 >= 0x17) {
        break;
      }
      v4[23] = v8;
      if (v8) {
        goto LABEL_4;
      }
LABEL_5:
      v4[v9] = 0;
      ++v6;
      uint64_t v4 = v14 + 24;
      v14 += 24;
      if (v6 == a3) {
        return v4;
      }
    }
    uint64_t v10 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v10 = v8 | 7;
    }
    uint64_t v11 = v10 + 1;
    std::string::size_type v12 = operator new(v10 + 1);
    *((void *)v4 + 1) = v9;
    *((void *)v4 + 2) = v11 | 0x8000000000000000;
    *(void *)uint64_t v4 = v12;
    uint64_t v4 = v12;
LABEL_4:
    memmove(v4, v7, v9);
    goto LABEL_5;
  }
  return v4;
}

void sub_255153118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_255153130(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v3 = **(void **)(a1 + 16);
    uint64_t v4 = **(void **)(a1 + 8);
    while (v3 != v4)
    {
      if (*(char *)(v3 - 1) < 0) {
        operator delete(*(void **)(v3 - 24));
      }
      v3 -= 24;
    }
  }
  return a1;
}

char *sub_255153194(void **a1, uint64_t a2)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 3);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_25514C55C();
  }
  if (0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) > v4) {
    unint64_t v4 = 0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3);
  }
  if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) >= 0x555555555555555) {
    unint64_t v6 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v6 = v4;
  }
  if (v6)
  {
    if (v6 > 0xAAAAAAAAAAAAAAALL) {
      sub_25514DDFC();
    }
    unint64_t v7 = (char *)operator new(24 * v6);
  }
  else
  {
    unint64_t v7 = 0;
  }
  size_t v8 = &v7[24 * v3];
  size_t v9 = &v7[24 * v6];
  *(_OWORD *)size_t v8 = *(_OWORD *)a2;
  *((void *)v8 + 2) = *(void *)(a2 + 16);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  uint64_t v10 = v8 + 24;
  uint64_t v11 = (char *)*a1;
  std::string::size_type v12 = (char *)a1[1];
  if (v12 == *a1)
  {
    *a1 = v8;
    a1[1] = v10;
    a1[2] = v9;
    if (!v12) {
      return v10;
    }
    goto LABEL_20;
  }
  do
  {
    long long v13 = *(_OWORD *)(v12 - 24);
    *((void *)v8 - 1) = *((void *)v12 - 1);
    *(_OWORD *)(v8 - 24) = v13;
    v8 -= 24;
    *((void *)v12 - 2) = 0;
    *((void *)v12 - 1) = 0;
    *((void *)v12 - 3) = 0;
    v12 -= 24;
  }
  while (v12 != v11);
  uint64_t v14 = (char *)*a1;
  std::string::size_type v12 = (char *)a1[1];
  *a1 = v8;
  a1[1] = v10;
  a1[2] = v9;
  if (v12 != v14)
  {
    do
    {
      if (*(v12 - 1) < 0) {
        operator delete(*((void **)v12 - 3));
      }
      v12 -= 24;
    }
    while (v12 != v14);
    std::string::size_type v12 = v14;
  }
  if (v12) {
LABEL_20:
  }
    operator delete(v12);
  return v10;
}

void ***sub_255153300(void ***a1, void *a2)
{
  unint64_t v4 = *a1;
  unint64_t v6 = (char *)(*a1)[1];
  unint64_t v5 = (unint64_t)(*a1)[2];
  unint64_t v7 = v6;
  if ((unint64_t)v6 >= v5)
  {
    size_t v9 = (char *)*v4;
    uint64_t v10 = v6 - (unsigned char *)*v4;
    uint64_t v11 = v10 >> 3;
    unint64_t v12 = (v10 >> 3) + 1;
    if (v12 >> 61) {
      sub_25514C55C();
    }
    uint64_t v13 = v5 - (void)v9;
    if (v13 >> 2 > v12) {
      unint64_t v12 = v13 >> 2;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v12;
    }
    if (v14)
    {
      if (v14 >> 61) {
        sub_25514DDFC();
      }
      size_t v15 = operator new(8 * v14);
    }
    else
    {
      size_t v15 = 0;
    }
    std::string::size_type v16 = &v15[8 * v11];
    *std::string::size_type v16 = *a2;
    size_t v8 = v16 + 1;
    if (v6 != v9)
    {
      unint64_t v17 = v6 - v9 - 8;
      if (v17 < 0x58) {
        goto LABEL_28;
      }
      if ((unint64_t)(v6 - v15 - v10) < 0x20) {
        goto LABEL_28;
      }
      uint64_t v18 = (v17 >> 3) + 1;
      uint64_t v19 = 8 * (v18 & 0x3FFFFFFFFFFFFFFCLL);
      unint64_t v7 = &v6[-v19];
      std::string::size_type v16 = (void *)((char *)v16 - v19);
      size_t v20 = &v15[8 * v11 - 16];
      unint64_t v21 = (long long *)(v6 - 16);
      uint64_t v22 = v18 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v23 = *v21;
        *(v20 - 1) = *(v21 - 1);
        *size_t v20 = v23;
        v20 -= 2;
        v21 -= 2;
        v22 -= 4;
      }
      while (v22);
      if (v18 != (v18 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_28:
        do
        {
          uint64_t v24 = *((void *)v7 - 1);
          v7 -= 8;
          *--std::string::size_type v16 = v24;
        }
        while (v7 != v9);
      }
      unint64_t v7 = (char *)*v4;
    }
    *unint64_t v4 = v16;
    v4[1] = v8;
    v4[2] = &v15[8 * v14];
    if (v7) {
      operator delete(v7);
    }
  }
  else
  {
    *(void *)unint64_t v6 = *a2;
    size_t v8 = v6 + 8;
  }
  v4[1] = v8;
  return a1;
}

xpc_object_t sub_25515347C(uint64_t a1, uint64_t a2)
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_object_t v21 = empty;
  xpc_object_t v5 = xpc_array_create_empty();
  xpc_object_t v20 = v5;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  std::string __p = 0;
  unint64_t v6 = *(const void **)a2;
  int64_t v7 = *(void *)(a2 + 8) - *(void *)a2;
  if (v7)
  {
    if (v7 < 0) {
      sub_25514C55C();
    }
    size_t v8 = (char *)operator new(v7);
    size_t v9 = &v8[8 * (v7 >> 3)];
    std::string __p = v8;
    uint64_t v19 = v9;
    memcpy(v8, v6, v7);
    uint64_t v18 = v9;
  }
  xpc_object_t v10 = sub_2551536FC((const char ***)&__p);
  *(void *)key = v10;
  xpc_array_append_value(v5, v10);
  if (v10) {
    xpc_release(v10);
  }
  if (__p)
  {
    uint64_t v18 = __p;
    operator delete(__p);
  }
  char v16 = 2;
  strcpy(key, "fc");
  xpc_object_t v11 = xpc_uint64_create(a1);
  v13[0] = v11;
  xpc_dictionary_set_value(empty, key, v11);
  if (v11) {
    xpc_release(v11);
  }
  char v14 = 4;
  strcpy((char *)v13, "args");
  xpc_dictionary_set_value(empty, (const char *)v13, v5);
  if (v14 < 0)
  {
    operator delete(v13[0]);
    if ((v16 & 0x80000000) == 0)
    {
LABEL_12:
      xpc_object_t v21 = 0;
      if (!v5) {
        return empty;
      }
      goto LABEL_16;
    }
  }
  else if ((v16 & 0x80000000) == 0)
  {
    goto LABEL_12;
  }
  operator delete(*(void **)key);
  xpc_object_t v21 = 0;
  if (v5) {
LABEL_16:
  }
    xpc_release(v5);
  return empty;
}

void sub_255153610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  sub_2551536C8((void **)(v23 - 64));
  sub_255153694((void **)(v23 - 56));
  _Unwind_Resume(a1);
}

void **sub_255153694(void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    xpc_release(v2);
  }
  return a1;
}

void **sub_2551536C8(void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    xpc_release(v2);
  }
  return a1;
}

xpc_object_t sub_2551536FC(const char ***a1)
{
  xpc_object_t empty = xpc_array_create_empty();
  unint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  while (v3 != v4)
  {
    xpc_object_t v5 = xpc_string_create(*v3);
    xpc_array_append_value(empty, v5);
    if (v5) {
      xpc_release(v5);
    }
    ++v3;
  }
  return empty;
}

void sub_255153770(_Unwind_Exception *exception_object)
{
  if (v1) {
    xpc_release(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_255153794(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0) {
    operator delete(*(void **)a2);
  }
}

char *sub_2551537A8(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v31[0] = BNNSGraphCompileOptionsMakeDefault();
  v31[1] = v2;
  uint64_t v30 = v31;
  *((unsigned char *)&__p[0].__r_.__value_.__s + 23) = 9;
  strcpy((char *)__p, "n-threads");
  uint64_t v3 = sub_25515B6C4(a1, (uint64_t)__p);
  uint64_t v4 = v3;
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p[0].__r_.__value_.__l.__data_);
    if (!v4) {
      goto LABEL_6;
    }
  }
  else if (!v3)
  {
    goto LABEL_6;
  }
  if (v4 != 1)
  {
    xpc_object_t v11 = strdup("When using --bnns-graph, --n-threads must be either 0 (automatic) or 1");
    goto LABEL_33;
  }
LABEL_6:
  BNNSGraphCompileOptionsSetTargetSingleThread();
  __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&__p[0].__r_.__value_.__r.__words[1] = xmmword_25515FB00;
  strcpy(__p[0].__r_.__value_.__l.__data_, "bnns-graph-generate-debug-info");
  sub_25515B614(a1, (uint64_t)__p);
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p[0].__r_.__value_.__l.__data_);
  }
  BNNSGraphCompileOptionsSetGenerateDebugInfo();
  __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x19uLL);
  *(_OWORD *)&__p[0].__r_.__value_.__r.__words[1] = xmmword_25515FB10;
  strcpy(__p[0].__r_.__value_.__l.__data_, "bnns-graph-validate-mil");
  sub_25515B614(a1, (uint64_t)__p);
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p[0].__r_.__value_.__l.__data_);
  }
  BNNSGraphCompileOptionsSetValidateMILFile();
  *((unsigned char *)&__p[0].__r_.__value_.__s + 23) = 19;
  strcpy((char *)__p, "bnns-graph-opt-pref");
  sub_25515B71C(a1, (uint64_t)__p, (uint64_t)v28);
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p[0].__r_.__value_.__l.__data_);
  }
  unsigned __int8 v5 = v29;
  if ((v29 & 0x80u) == 0) {
    unint64_t v6 = v29;
  }
  else {
    unint64_t v6 = (unint64_t)v28[1];
  }
  switch(v6)
  {
    case 0uLL:
LABEL_35:
      strcpy((char *)__p, "bnns-graph-downconvert");
      *((unsigned char *)&__p[0].__r_.__value_.__s + 23) = 22;
      sub_25515B71C(a1, (uint64_t)__p, (uint64_t)v26);
      if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p[0].__r_.__value_.__l.__data_);
      }
      unint64_t v14 = v27;
      unsigned __int8 v15 = v27;
      if ((v27 & 0x80u) != 0) {
        unint64_t v14 = (unint64_t)v26[1];
      }
      if (v14)
      {
        if (v14 != 4) {
          goto LABEL_44;
        }
        char v16 = (void **)v26[0];
        if ((v27 & 0x80u) == 0) {
          char v16 = v26;
        }
        if (*(_DWORD *)v16 != 1701736302)
        {
LABEL_44:
          xpc_object_t v11 = strdup("--bnns-graph-downconvert values other than 'none' are currently unsupported");
          if ((v15 & 0x80) != 0) {
            operator delete(v26[0]);
          }
          if ((v29 & 0x80) != 0) {
            goto LABEL_32;
          }
          goto LABEL_33;
        }
      }
      BNNSGraphCompileOptionsSetDownconvertMode();
      __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
      *(_OWORD *)&__p[0].__r_.__value_.__r.__words[1] = xmmword_25515FB20;
      strcpy(__p[0].__r_.__value_.__l.__data_, "bnns-graph-inject-custom-data");
      sub_25515B71C(a1, (uint64_t)__p, (uint64_t)v24);
      if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p[0].__r_.__value_.__l.__data_);
        char v17 = v25;
        if ((v25 & 0x80000000) == 0)
        {
LABEL_50:
          if (!v17) {
            goto LABEL_55;
          }
LABEL_54:
          BNNSGraphCompileOptionsSetUserData();
LABEL_55:
          *((unsigned char *)&__from.__pn_.__r_.__value_.__s + 23) = 6;
          strcpy((char *)&__from, "output");
          sub_25515B71C(a1, (uint64_t)&__from, (uint64_t)__p);
          std::__fs::filesystem::path v23 = (std::__fs::filesystem::path)__p[0];
          memset(__p, 0, 24);
          if (SHIBYTE(__from.__pn_.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__from.__pn_.__r_.__value_.__l.__data_);
          }
          *((unsigned char *)&__from.__pn_.__r_.__value_.__s + 23) = 18;
          strcpy((char *)&__from, "bnns-graph-bnns-ir");
          sub_25515B71C(a1, (uint64_t)&__from, (uint64_t)__p);
          std::__fs::filesystem::path __to = (std::__fs::filesystem::path)__p[0];
          memset(__p, 0, 24);
          if (SHIBYTE(__from.__pn_.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(__from.__pn_.__r_.__value_.__l.__data_);
            int v18 = SHIBYTE(__to.__pn_.__r_.__value_.__r.__words[2]);
            if ((SHIBYTE(__to.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
              goto LABEL_59;
            }
          }
          else
          {
            int v18 = SHIBYTE(__to.__pn_.__r_.__value_.__r.__words[2]);
            if ((SHIBYTE(__to.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
LABEL_59:
              if (v18)
              {
LABEL_75:
                std::__fs::filesystem::path v21 = __to;
                goto LABEL_77;
              }
              if (SHIBYTE(v23.__pn_.__r_.__value_.__r.__words[2]) < 0) {
                sub_255154DF8(&__to, v23.__pn_.__r_.__value_.__l.__data_, v23.__pn_.__r_.__value_.__l.__size_);
              }
              else {
                std::__fs::filesystem::path __to = v23;
              }
              goto LABEL_72;
            }
          }
          if (__to.__pn_.__r_.__value_.__l.__size_) {
            goto LABEL_76;
          }
          if ((v23.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            uint64_t v19 = &v23;
          }
          else {
            uint64_t v19 = (std::__fs::filesystem::path *)v23.__pn_.__r_.__value_.__r.__words[0];
          }
          if ((v23.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type size = HIBYTE(v23.__pn_.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type size = v23.__pn_.__r_.__value_.__l.__size_;
          }
          sub_255154EC0((void **)&__to.__pn_.__r_.__value_.__l.__data_, v19, size);
LABEL_72:
          memset(__p, 0, 24);
          sub_2551553A0(__p, (std::string *)"bnnsir", (std::string *)"");
          std::__fs::filesystem::path::replace_extension(&__to, (const std::__fs::filesystem::path *)__p);
          if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p[0].__r_.__value_.__l.__data_);
          }
          if ((SHIBYTE(__to.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_75;
          }
LABEL_76:
          sub_2551501FC(&v21, __to.__pn_.__r_.__value_.__l.__data_, __to.__pn_.__r_.__value_.__l.__size_);
LABEL_77:
          memset(__p, 0, 24);
          sub_2551553A0(__p, (std::string *)".XXXXXXXX.bnnsir", (std::string *)"");
          std::__fs::filesystem::path::replace_extension(&v21, (const std::__fs::filesystem::path *)__p);
          if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(__p[0].__r_.__value_.__l.__data_);
            if ((SHIBYTE(v21.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
              goto LABEL_79;
            }
          }
          else if ((SHIBYTE(v21.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          {
LABEL_79:
            std::__fs::filesystem::path __from = v21;
            goto LABEL_82;
          }
          sub_2551501FC(&__from, v21.__pn_.__r_.__value_.__l.__data_, v21.__pn_.__r_.__value_.__l.__size_);
LABEL_82:
          sub_25515639C((uint64_t)__p, (const char *)&__from);
        }
      }
      else
      {
        char v17 = v25;
        if ((v25 & 0x80000000) == 0) {
          goto LABEL_50;
        }
      }
      if (!v24[1]) {
        goto LABEL_55;
      }
      goto LABEL_54;
    case 4uLL:
      if ((v29 & 0x80u) == 0) {
        unint64_t v12 = v28;
      }
      else {
        unint64_t v12 = (void **)v28[0];
      }
      if (memcmp(v12, "perf", 4uLL)) {
        break;
      }
      goto LABEL_34;
    case 7uLL:
      int64_t v7 = (void **)v28[0];
      if ((v29 & 0x80u) == 0) {
        int64_t v7 = v28;
      }
      int v8 = *(_DWORD *)v7;
      int v9 = *(_DWORD *)((char *)v7 + 3);
      if (v8 == 1932358249 && v9 == 1702521203)
      {
LABEL_34:
        BNNSGraphCompileOptionsSetOptimizationPreference();
        goto LABEL_35;
      }
      break;
  }
  xpc_object_t v11 = strdup("--bnns-graph-opt-pref must be either 'ir-size' or 'perf' if specified");
  if ((v5 & 0x80) != 0) {
LABEL_32:
  }
    operator delete(v28[0]);
LABEL_33:
  BNNSGraphCompileOptionsDestroy();
  return v11;
}

void sub_255154694(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,void *a44,uint64_t a45,int a46,__int16 a47,char a48,char a49,void *a50,uint64_t a51,int a52,__int16 a53,char a54,char a55,void *a56,uint64_t a57,int a58,__int16 a59,char a60,char a61,void *a62,uint64_t a63)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  sub_255154D20(&a71);
  if (a2 == 2)
  {
    uint64_t v73 = __cxa_begin_catch(a1);
    unint64_t v74 = (const char *)(*(uint64_t (**)(void *))(*(void *)v73 + 16))(v73);
    strdup(v74);
    __cxa_end_catch();
    JUMPOUT(0x255154460);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  sub_25515685C((uint64_t)&STACK[0x380]);
  if (a35 < 0) {
    operator delete(a30);
  }
  if (a42 < 0) {
    operator delete(a37);
  }
  if (a49 < 0) {
    operator delete(a44);
  }
  if (a55 < 0) {
    operator delete(a50);
  }
  if (a61 < 0) {
    operator delete(a56);
  }
  if (a67 < 0) {
    operator delete(a62);
  }
  sub_255154DC4((uint64_t)&a68);
  _Unwind_Resume(a1);
}

uint64_t sub_2551549B4(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C340] + 64;
  *(void *)(a1 + 112) = MEMORY[0x263F8C340] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  unsigned __int8 v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 8));
  uint64_t v6 = MEMORY[0x263F8C340] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)a1 = v6;
  *(void *)(a1 + 112) = v2;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_255154B24(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x25A288F40](v1);
  _Unwind_Resume(a1);
}

uint64_t sub_255154B4C(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2C8];
  uint64_t v3 = *MEMORY[0x263F8C2C8];
  *(void *)a1 = *MEMORY[0x263F8C2C8];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x25A288F40](a1 + 112);
  return a1;
}

void sub_255154C50(const std::__fs::filesystem::path *a1@<X0>, const std::__fs::filesystem::path *a2@<X1>, std::__fs::filesystem::path *a3@<X8>)
{
  std::__fs::filesystem::__weakly_canonical(&v6, a1, 0);
  std::__fs::filesystem::__weakly_canonical(&__p, a2, 0);
  std::__fs::filesystem::path::lexically_relative(a3, &v6, &__p);
  if ((SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v6.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return;
    }
LABEL_5:
    operator delete(v6.__pn_.__r_.__value_.__l.__data_);
    return;
  }
  operator delete(__p.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(v6.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_5;
  }
}

void sub_255154CD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if ((a20 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a20 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a15);
  _Unwind_Resume(exception_object);
}

void *sub_255154D20(void *a1)
{
  *a1 = &unk_270446208;
  uint64_t v2 = a1 + 54;
  a1[54] = &unk_270446258;
  a1[2] = &unk_270446230;
  MEMORY[0x25A288D90](a1 + 3);
  std::iostream::~basic_iostream();
  MEMORY[0x25A288F40](v2);
  return a1;
}

uint64_t sub_255154DC4(uint64_t a1)
{
  return a1;
}

void *sub_255154DF8(void *__dst, void *__src, size_t __len)
{
  if (__len > 0x16)
  {
    if (__len - 0x7FFFFFFFFFFFFFF7 <= 0x800000000000001ELL) {
      sub_25514C40C();
    }
    size_t v7 = 44;
    if (__len > 0x2C) {
      size_t v7 = __len;
    }
    size_t v8 = (v7 | 7) + 1;
    std::__fs::filesystem::path v6 = operator new(v8);
    memcpy(v6, __src, __len);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *long long __dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    std::__fs::filesystem::path v6 = __dst;
    if (__len)
    {
      memmove(__dst, __src, __len);
      std::__fs::filesystem::path v6 = __dst;
    }
  }
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void **sub_255154EC0(void **a1, void *__src, size_t __len)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v7 = v6 & 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 0x7FFFFFFFFFFFFFFFLL) <= __len)
  {
    size_t v9 = 0x7FFFFFFFFFFFFFF7;
    if (0x7FFFFFFFFFFFFFF7 - v7 < __len - v7 + 1) {
      sub_25514C40C();
    }
    unint64_t v10 = v7 - 1;
    xpc_object_t v11 = a1;
    if ((v6 & 0x8000000000000000) != 0) {
      xpc_object_t v11 = *a1;
    }
    if (v10 <= 0x3FFFFFFFFFFFFFF2)
    {
      unint64_t v12 = 2 * v10;
      if (__len > 2 * v10) {
        unint64_t v12 = __len;
      }
      uint64_t v13 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v12 | 7) != 0x17) {
        uint64_t v13 = v12 | 7;
      }
      if (v12 >= 0x17) {
        size_t v9 = v13 + 1;
      }
      else {
        size_t v9 = 23;
      }
    }
    unint64_t v14 = operator new(v9);
    size_t v8 = v14;
    if (__len) {
      memcpy(v14, __src, __len);
    }
    if (v10 != 22) {
      operator delete(v11);
    }
    a1[1] = (void *)__len;
    a1[2] = (void *)(v9 | 0x8000000000000000);
    *a1 = v8;
  }
  else
  {
    size_t v8 = *a1;
    a1[1] = (void *)__len;
    if (__len) {
      memmove(v8, __src, __len);
    }
  }
  *((unsigned char *)v8 + __len) = 0;
  return a1;
}

void sub_255154FE4(void *a1)
{
  *(a1 - 2) = &unk_270446208;
  a1[52] = &unk_270446258;
  *a1 = &unk_270446230;
  MEMORY[0x25A288D90](a1 + 1);
  std::iostream::~basic_iostream();
  JUMPOUT(0x25A288F40);
}

void sub_255155088(void *a1)
{
  uint64_t v1 = (void *)((char *)a1 + *(void *)(*a1 - 24));
  *uint64_t v1 = &unk_270446208;
  v1[54] = &unk_270446258;
  v1[2] = &unk_270446230;
  MEMORY[0x25A288D90](v1 + 3);
  std::iostream::~basic_iostream();
  JUMPOUT(0x25A288F40);
}

void sub_255155148(void *a1)
{
  *a1 = &unk_270446208;
  uint64_t v1 = a1 + 54;
  a1[54] = &unk_270446258;
  a1[2] = &unk_270446230;
  MEMORY[0x25A288D90](a1 + 3);
  std::iostream::~basic_iostream();
  MEMORY[0x25A288F40](v1);
  JUMPOUT(0x25A288F90);
}

void sub_25515520C(void *a1)
{
  *(a1 - 2) = &unk_270446208;
  uint64_t v1 = a1 + 52;
  a1[52] = &unk_270446258;
  *a1 = &unk_270446230;
  MEMORY[0x25A288D90](a1 + 1);
  std::iostream::~basic_iostream();
  MEMORY[0x25A288F40](v1);
  JUMPOUT(0x25A288F90);
}

void sub_2551552C8(void *a1)
{
  uint64_t v1 = (void *)((char *)a1 + *(void *)(*a1 - 24));
  *uint64_t v1 = &unk_270446208;
  v1[54] = &unk_270446258;
  v1[2] = &unk_270446230;
  MEMORY[0x25A288D90](v1 + 3);
  std::iostream::~basic_iostream();
  MEMORY[0x25A288F40](v1 + 54);
  JUMPOUT(0x25A288F90);
}

std::string *sub_2551553A0(std::string *this, std::string *__src, std::string *a3)
{
  int v6 = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  size_t v7 = (char *)a3 - (char *)__src;
  if (v6 < 0)
  {
    if (a3 == __src) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    unint64_t v12 = this->__r_.__value_.__r.__words[2];
    unint64_t v9 = (v12 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    xpc_object_t v11 = (std::string *)this->__r_.__value_.__r.__words[0];
    unint64_t v10 = HIBYTE(v12);
    if (this->__r_.__value_.__r.__words[0] > (unint64_t)__src) {
      goto LABEL_12;
    }
LABEL_7:
    if ((std::string *)((char *)&v11->__r_.__value_.__l.__data_ + size + 1) <= __src) {
      goto LABEL_12;
    }
    if (v7 > 0x7FFFFFFFFFFFFFF7) {
      sub_25514C40C();
    }
    if (v7 > 0x16)
    {
      uint64_t v24 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v7 | 7) != 0x17) {
        uint64_t v24 = v7 | 7;
      }
      uint64_t v25 = v24 + 1;
      uint64_t v13 = (void **)operator new(v24 + 1);
      size_t v40 = v7;
      int64_t v41 = v25 | 0x8000000000000000;
      long long __dst = v13;
      if (a3 == __src)
      {
LABEL_38:
        *(unsigned char *)uint64_t v13 = 0;
        if (v41 >= 0) {
          p_dst = (void **)&__dst;
        }
        else {
          p_dst = __dst;
        }
        if (v41 >= 0) {
          size_t v27 = HIBYTE(v41);
        }
        else {
          size_t v27 = v40;
        }
        if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::size_type v29 = this->__r_.__value_.__l.__size_;
          std::string::size_type v28 = (this->__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
        }
        else
        {
          std::string::size_type v28 = 22;
          std::string::size_type v29 = HIBYTE(this->__r_.__value_.__r.__words[2]);
        }
        if (v28 - v29 >= v27)
        {
          if (v27)
          {
            uint64_t v30 = this;
            if ((*((unsigned char *)&this->__r_.__value_.__s + 23) & 0x80) != 0) {
              uint64_t v30 = (std::string *)this->__r_.__value_.__r.__words[0];
            }
            memmove((char *)v30 + v29, p_dst, v27);
            std::string::size_type v31 = v29 + v27;
            if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
            {
              this->__r_.__value_.__l.__size_ = v31;
              v30->__r_.__value_.__s.__data_[v31] = 0;
              if ((SHIBYTE(v41) & 0x80000000) == 0) {
                return this;
              }
              goto LABEL_55;
            }
            *((unsigned char *)&this->__r_.__value_.__s + 23) = v31 & 0x7F;
            v30->__r_.__value_.__s.__data_[v31] = 0;
          }
        }
        else
        {
          std::string::__grow_by_and_replace(this, v28, v27 - v28 + v29, v29, v29, 0, v27, (const std::string::value_type *)p_dst);
        }
        if ((SHIBYTE(v41) & 0x80000000) == 0) {
          return this;
        }
LABEL_55:
        operator delete(__dst);
        return this;
      }
    }
    else
    {
      HIBYTE(v41) = (_BYTE)a3 - (_BYTE)__src;
      uint64_t v13 = (void **)&__dst;
      if (a3 == __src) {
        goto LABEL_38;
      }
    }
    memcpy(v13, __src, v7);
    uint64_t v13 = (void **)((char *)v13 + v7);
    goto LABEL_38;
  }
  if (a3 == __src) {
    return this;
  }
  std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
  unint64_t v9 = 22;
  LOBYTE(v10) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  xpc_object_t v11 = this;
  if (this <= __src) {
    goto LABEL_7;
  }
LABEL_12:
  if (v9 - size >= v7)
  {
    xpc_object_t v20 = this;
    if ((v10 & 0x80) == 0) {
      goto LABEL_31;
    }
  }
  else
  {
    size_t v14 = 0x7FFFFFFFFFFFFFF7;
    if (0x7FFFFFFFFFFFFFF7 - v9 < v7 + size - v9) {
      sub_25514C40C();
    }
    unsigned __int8 v15 = this;
    if (v6 < 0) {
      unsigned __int8 v15 = (std::string *)this->__r_.__value_.__r.__words[0];
    }
    if (v9 <= 0x3FFFFFFFFFFFFFF2)
    {
      unint64_t v16 = 2 * v9;
      if (v7 + size > 2 * v9) {
        unint64_t v16 = v7 + size;
      }
      uint64_t v17 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v16 | 7) != 0x17) {
        uint64_t v17 = v16 | 7;
      }
      if (v16 >= 0x17) {
        size_t v14 = v17 + 1;
      }
      else {
        size_t v14 = 23;
      }
    }
    int v18 = operator new(v14);
    std::string::size_type v19 = (std::string::size_type)v18;
    if (size) {
      memmove(v18, v15, size);
    }
    if (v9 != 22) {
      operator delete(v15);
    }
    this->__r_.__value_.__l.__size_ = size;
    this->__r_.__value_.__r.__words[2] = v14 | 0x8000000000000000;
    this->__r_.__value_.__r.__words[0] = v19;
  }
  xpc_object_t v20 = (std::string *)this->__r_.__value_.__r.__words[0];
LABEL_31:
  std::__fs::filesystem::path v21 = (char *)v20 + size;
  unint64_t v22 = (char *)a3 - (char *)__src;
  if (a3 != __src)
  {
    if (v22 >= 0x20)
    {
      if ((unint64_t)((char *)v20 + size - (char *)__src) >= 0x20)
      {
        std::__fs::filesystem::path v23 = (std::string *)((char *)__src + (v22 & 0xFFFFFFFFFFFFFFE0));
        v21 += v22 & 0xFFFFFFFFFFFFFFE0;
        long long v32 = (_OWORD *)((char *)&v20->__r_.__value_.__r.__words[2] + size);
        BOOL v33 = &__src->__r_.__value_.__r.__words[2];
        unint64_t v34 = v22 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v35 = *(_OWORD *)v33;
          *(v32 - 1) = *((_OWORD *)v33 - 1);
          _OWORD *v32 = v35;
          v32 += 2;
          v33 += 4;
          v34 -= 32;
        }
        while (v34);
        if (v22 == (v22 & 0xFFFFFFFFFFFFFFE0)) {
          goto LABEL_62;
        }
      }
      else
      {
        std::__fs::filesystem::path v23 = __src;
      }
    }
    else
    {
      std::__fs::filesystem::path v23 = __src;
    }
    do
    {
      std::string::value_type v36 = v23->__r_.__value_.__s.__data_[0];
      std::__fs::filesystem::path v23 = (std::string *)((char *)v23 + 1);
      *v21++ = v36;
    }
    while (v23 != a3);
  }
LABEL_62:
  std::string::value_type *v21 = 0;
  std::string::size_type v37 = v7 + size;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
    this->__r_.__value_.__l.__size_ = v37;
  }
  else {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = v37 & 0x7F;
  }
  return this;
}

void sub_255155704(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_255155720(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x25A288DF0](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      unint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!sub_2551558C4(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x25A288E00](v13);
  return a1;
}

void sub_25515585C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x25A288E00](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x25515583CLL);
}

void sub_2551558B0(_Unwind_Exception *a1)
{
}

uint64_t sub_2551558C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      size_t v12 = 0;
    }
    else {
      size_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if ((uint64_t)v12 >= 1)
    {
      if (v12 >= 0x7FFFFFFFFFFFFFF8) {
        sub_25514C40C();
      }
      if (v12 >= 0x17)
      {
        uint64_t v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v14 = v12 | 7;
        }
        uint64_t v15 = v14 + 1;
        uint64_t v13 = (void **)operator new(v14 + 1);
        __b[1] = (void *)v12;
        int64_t v22 = v15 | 0x8000000000000000;
        __b[0] = v13;
      }
      else
      {
        HIBYTE(v22) = v12;
        uint64_t v13 = __b;
      }
      memset(v13, __c, v12);
      *((unsigned char *)v13 + v12) = 0;
      if (v22 >= 0) {
        unint64_t v16 = __b;
      }
      else {
        unint64_t v16 = (void **)__b[0];
      }
      uint64_t v17 = (*(uint64_t (**)(uint64_t, void **, size_t))(*(void *)v6 + 96))(v6, v16, v12);
      uint64_t v18 = v17;
      if (SHIBYTE(v22) < 0)
      {
        operator delete(__b[0]);
        if (v18 != v12) {
          return 0;
        }
      }
      else if (v17 != v12)
      {
        return 0;
      }
    }
    uint64_t v19 = a4 - a3;
    if (v19 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v19) == v19)
    {
      *(void *)(a5 + 24) = 0;
      return v6;
    }
    return 0;
  }
  return v6;
}

void sub_255155A98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_255155AB4(void *a1, unsigned char *a2, unsigned char *a3, unsigned __int8 __c, unsigned __int8 a5)
{
  memset(&v15, 0, sizeof(v15));
  std::string::push_back(&v15, __c);
  for (; a2 != a3; ++a2)
  {
    int v10 = *a2;
    if (v10 == a5 || v10 == __c)
    {
      std::string::push_back(&v15, a5);
      LOBYTE(v10) = *a2;
    }
    std::string::push_back(&v15, v10);
  }
  std::string::push_back(&v15, __c);
  if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v11 = &v15;
  }
  else {
    uint64_t v11 = (std::string *)v15.__r_.__value_.__r.__words[0];
  }
  if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v15.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v15.__r_.__value_.__l.__size_;
  }
  uint64_t v13 = sub_255155720(a1, (uint64_t)v11, size);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  return v13;
}

void sub_255155B9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

__CFDictionary *mlc_services_validate(uint64_t a1, const __CFDictionary *a2)
{
  sub_25515D8D0(a2, a1, (const char **)&v7);
  if ((void)v7) {
    return sub_25515DA3C((const char *)v7);
  }
  if (BYTE8(v8))
  {
    v6[0] = v7;
    v6[1] = v8;
    return sub_25515DB68((uint64_t)v6);
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000;
    unsigned __int8 v5 = (uint64_t (*)(uint64_t, const __CFDictionary *))off_269E86D00;
    uint64_t v13 = off_269E86D00;
    if (!off_269E86D00)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 0x40000000;
      v9[2] = sub_255155CE8;
      v9[3] = &unk_2653C0238;
      v9[4] = &v10;
      sub_255155CE8((uint64_t)v9);
      unsigned __int8 v5 = (uint64_t (*)(uint64_t, const __CFDictionary *))v11[3];
    }
    _Block_object_dispose(&v10, 8);
    if (!v5) {
      sub_25515E1A0();
    }
    return (__CFDictionary *)v5(a1, a2);
  }
}

void sub_255155CC8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t mlc_services_validation_version()
{
  return 0;
}

void *sub_255155CE8(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!qword_269E86D08)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 0x40000000;
    v5[3] = sub_255155E28;
    v5[4] = &unk_2653C0270;
    v5[5] = v5;
    long long v6 = xmmword_2653C0258;
    uint64_t v7 = 0;
    qword_269E86D08 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)qword_269E86D08;
    if (qword_269E86D08)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)qword_269E86D08;
LABEL_5:
  BOOL result = dlsym(v2, "mlc_model_validate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_269E86D00 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_255155E28()
{
  uint64_t result = _sl_dlopen();
  qword_269E86D08 = result;
  return result;
}

FILE *sub_255155E9C@<X0>(const char *a1@<X0>, void *a2@<X8>)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  uint64_t result = fopen(a1, "r");
  if (result)
  {
    uint64_t v4 = result;
    fseek(result, 0, 2);
    MEMORY[0x25A289190](v4);
    fseek(v4, 0, 0);
    fileno(v4);
    operator new();
  }
  *a2 = 0;
  return result;
}

void sub_255155FB0(_Unwind_Exception *a1)
{
  MEMORY[0x25A288F90](v2, 0x1081C40CC6EE3FDLL);
  fclose(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_255155FE4(uint64_t a1)
{
  *(void *)a1 = &unk_2704463E0;
  munmap(*(void **)(a1 + 8), *(void *)(a1 + 16));
  return a1;
}

void sub_255156034(uint64_t a1)
{
  *(void *)a1 = &unk_2704463E0;
  munmap(*(void **)(a1 + 8), *(void *)(a1 + 16));
  JUMPOUT(0x25A288F90);
}

void sub_2551560A4(const char *a1)
{
  int v1 = a1[23];
  uint64_t v2 = *((void *)a1 + 1);
  if (v1 >= 0)
  {
    uint64_t v3 = v1;
  }
  else
  {
    a1 = *(const char **)a1;
    uint64_t v3 = v2;
  }
  uint64_t v4 = v3;
  do
  {
    if (!v4) {
      break;
    }
    int v5 = a1[--v4];
  }
  while (v5 != 88);
  strdup(a1);
  operator new();
}

void sub_25515627C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (*(char *)(v9 + 23) < 0) {
    operator delete(*(void **)v9);
  }
  sub_255156C54((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_2551562D4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  *(uint64_t *)((char *)a1 + *(void *)(v2 - 24)) = a2[3];
  MEMORY[0x25A288D90](a1 + 1);
  return std::ostream::~ostream();
}

void sub_25515639C(uint64_t a1, const char *a2)
{
  uint64_t v4 = a1 + 8;
  *(void *)a1 = &unk_2704464D8;
  *(void *)(a1 + 448) = &unk_270446500;
  std::ios_base::init((std::ios_base *)(a1 + 448), (void *)(a1 + 8));
  *(void *)(a1 + 584) = 0;
  *(_DWORD *)(a1 + 592) = -1;
  *(void *)a1 = off_270446488;
  *(void *)(a1 + 448) = off_2704464B0;
  MEMORY[0x25A288D80](v4);
  *(void *)a1 = &unk_270446408;
  *(void *)(a1 + 448) = &unk_270446430;
  sub_2551560A4(a2);
}

void sub_2551565E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v16 + 439) < 0) {
    operator delete(*v17);
  }
  sub_2551562D4((uint64_t *)v16, (uint64_t *)&off_270446448);
  MEMORY[0x25A288F40](v15);
  _Unwind_Resume(a1);
}

uint64_t sub_255156660(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  *(void *)(a1 + *(void *)(v4 - 24)) = a2[5];
  if (!*(unsigned char *)(a1 + 440))
  {
    std::__fs::filesystem::__status((const std::__fs::filesystem::path *)(a1 + 416), 0);
    if (v11)
    {
      if (v11 != 255 && !std::__fs::filesystem::__remove((const std::__fs::filesystem::path *)(a1 + 416), 0))
      {
        uint64_t v7 = sub_255155720(MEMORY[0x263F8C0F8], (uint64_t)"MLC temp file: error deleting '", 31);
        uint64_t v8 = v7;
        uint64_t v9 = *(unsigned __int8 *)(a1 + 439);
        if ((v9 & 0x80u) == 0) {
          uint64_t v10 = (unsigned char *)(a1 + 416);
        }
        else {
          uint64_t v10 = *(unsigned char **)(a1 + 416);
        }
        if ((v9 & 0x80u) != 0) {
          uint64_t v9 = *(void *)(a1 + 424);
        }
        sub_255155AB4(v7, v10, &v10[v9], 0x22u, 0x5Cu);
        sub_255155720(v8, (uint64_t)"'\n", 2);
      }
    }
  }
  if (*(char *)(a1 + 439) < 0) {
    operator delete(*(void **)(a1 + 416));
  }
  uint64_t v5 = a2[1];
  *(void *)a1 = v5;
  *(void *)(a1 + *(void *)(v5 - 24)) = a2[4];
  MEMORY[0x25A288D90](a1 + 8);
  return std::ostream::~ostream();
}

uint64_t sub_25515685C(uint64_t a1)
{
  uint64_t v2 = sub_255156660(a1, (uint64_t *)&off_270446440);
  MEMORY[0x25A288F40](v2 + 448);
  return a1;
}

void sub_255156894(void *a1)
{
  sub_255156660((uint64_t)a1 + *(void *)(*a1 - 24), (uint64_t *)&off_270446440);
  JUMPOUT(0x25A288F40);
}

void sub_2551568E0(uint64_t a1)
{
  uint64_t v1 = sub_255156660(a1, (uint64_t *)&off_270446440);
  MEMORY[0x25A288F40](v1 + 448);
  JUMPOUT(0x25A288F90);
}

void sub_255156938(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24);
  sub_255156660(v1, (uint64_t *)&off_270446440);
  MEMORY[0x25A288F40](v1 + 448);
  JUMPOUT(0x25A288F90);
}

char *sub_2551569A8@<X0>(char *result@<X0>, uint64_t a2@<X8>)
{
  if (result[439] < 0) {
    return (char *)sub_2551501FC((unsigned char *)a2, *((void **)result + 52), *((void *)result + 53));
  }
  *(_OWORD *)a2 = *((_OWORD *)result + 26);
  *(void *)(a2 + 16) = *((void *)result + 54);
  return result;
}

void *sub_2551569D4(void *a1)
{
  *a1 = MEMORY[0x263F8C310] + 24;
  uint64_t v2 = a1 + 52;
  a1[52] = MEMORY[0x263F8C310] + 64;
  MEMORY[0x25A288D90](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x25A288F40](v2);
  return a1;
}

void sub_255156A58(void *a1)
{
  *a1 = MEMORY[0x263F8C310] + 24;
  uint64_t v1 = a1 + 52;
  a1[52] = MEMORY[0x263F8C310] + 64;
  MEMORY[0x25A288D90](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x25A288F40](v1);
  JUMPOUT(0x25A288F90);
}

void sub_255156AFC(void *a1)
{
  uint64_t v1 = (void *)((char *)a1 + *(void *)(*a1 - 24));
  *uint64_t v1 = MEMORY[0x263F8C310] + 24;
  v1[52] = MEMORY[0x263F8C310] + 64;
  MEMORY[0x25A288D90](v1 + 1);
  std::ostream::~ostream();
  JUMPOUT(0x25A288F40);
}

void sub_255156B9C(void *a1)
{
  uint64_t v1 = (void *)((char *)a1 + *(void *)(*a1 - 24));
  *uint64_t v1 = MEMORY[0x263F8C310] + 24;
  v1[52] = MEMORY[0x263F8C310] + 64;
  MEMORY[0x25A288D90](v1 + 1);
  std::ostream::~ostream();
  MEMORY[0x25A288F40](v1 + 52);
  JUMPOUT(0x25A288F90);
}

uint64_t sub_255156C54(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

void sub_255156CC4(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x25A288F90);
}

uint64_t sub_255156CFC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 24));
}

BOOL sub_255156D20(uint64_t a1, uint64_t a2, const void **a3)
{
  if (*(char *)(a2 + 23) >= 0) {
    uint64_t v5 = (const char *)a2;
  }
  else {
    uint64_t v5 = *(const char **)a2;
  }
  long long v6 = dlopen(v5, 262);
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = v6;
  if (v7)
  {
    dlclose(v7);
    long long v6 = *(void **)a1;
  }
  if (v6)
  {
    HIBYTE(v15[2]) = 6;
    strcpy((char *)v15, "init_2");
    sub_255157214(a3, v15, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    *(void *)(a1 + 24) = dlsym(*(void **)a1, (const char *)p_p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v15[2]) & 0x80000000) == 0) {
        goto LABEL_12;
      }
    }
    else if ((SHIBYTE(v15[2]) & 0x80000000) == 0)
    {
      goto LABEL_12;
    }
    operator delete((void *)v15[0]);
LABEL_12:
    HIBYTE(v15[2]) = 10;
    strcpy((char *)v15, "teardown_2");
    sub_255157214(a3, v15, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v9 = &__p;
    }
    else {
      uint64_t v9 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    *(void *)(a1 + 32) = dlsym(*(void **)a1, (const char *)v9);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v15[2]) & 0x80000000) == 0) {
        goto LABEL_17;
      }
    }
    else if ((SHIBYTE(v15[2]) & 0x80000000) == 0)
    {
      goto LABEL_17;
    }
    operator delete((void *)v15[0]);
LABEL_17:
    HIBYTE(v15[2]) = 16;
    strcpy((char *)v15, "get_network_size");
    sub_255157214(a3, v15, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v10 = &__p;
    }
    else {
      uint64_t v10 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    *(void *)(a1 + 16) = dlsym(*(void **)a1, (const char *)v10);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v15[2]) & 0x80000000) == 0) {
        goto LABEL_22;
      }
    }
    else if ((SHIBYTE(v15[2]) & 0x80000000) == 0)
    {
      goto LABEL_22;
    }
    operator delete((void *)v15[0]);
LABEL_22:
    HIBYTE(v15[2]) = 10;
    strcpy((char *)v15, "set_tensor");
    sub_255157214(a3, v15, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      unsigned __int8 v11 = &__p;
    }
    else {
      unsigned __int8 v11 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    *(void *)(a1 + 40) = dlsym(*(void **)a1, (const char *)v11);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v15[2]) & 0x80000000) == 0) {
        goto LABEL_27;
      }
    }
    else if ((SHIBYTE(v15[2]) & 0x80000000) == 0)
    {
      goto LABEL_27;
    }
    operator delete((void *)v15[0]);
LABEL_27:
    HIBYTE(v15[2]) = 6;
    strcpy((char *)v15, "tensor");
    sub_255157214(a3, v15, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v12 = &__p;
    }
    else {
      uint64_t v12 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    *(void *)(a1 + 48) = dlsym(*(void **)a1, (const char *)v12);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v15[2]) & 0x80000000) == 0) {
        goto LABEL_32;
      }
    }
    else if ((SHIBYTE(v15[2]) & 0x80000000) == 0)
    {
      goto LABEL_32;
    }
    operator delete((void *)v15[0]);
LABEL_32:
    HIBYTE(v15[2]) = 12;
    strcpy((char *)v15, "execute_sync");
    sub_255157214(a3, v15, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v13 = &__p;
    }
    else {
      uint64_t v13 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    *(void *)(a1 + 56) = dlsym(*(void **)a1, (const char *)v13);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v15[2]) & 0x80000000) == 0) {
        return v6 != 0;
      }
    }
    else if ((SHIBYTE(v15[2]) & 0x80000000) == 0)
    {
      return v6 != 0;
    }
    operator delete((void *)v15[0]);
  }
  return v6 != 0;
}

void sub_255157084(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
  {
    operator delete(__p);
    if ((a14 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a9);
  _Unwind_Resume(exception_object);
}

BOOL sub_2551570FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a2, a3);
  *(void *)(a1 + 8) = v4;
  return v4 != 0;
}

void *sub_255157138(uint64_t a1)
{
  uint64_t result = *(void **)a1;
  if (!result)
  {
    *(void *)a1 = 0;
    return result;
  }
  if (!*(void *)(a1 + 8))
  {
    *(void *)a1 = 0;
    return (void *)dlclose(result);
  }
  (*(void (**)(void))(a1 + 32))(*(void *)(a1 + 8));
  uint64_t result = *(void **)a1;
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  if (result) {
    return (void *)dlclose(result);
  }
  return result;
}

uint64_t sub_255157198(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (!v2) {
    goto LABEL_4;
  }
  if (*(void *)(a1 + 8))
  {
    (*(void (**)(void))(a1 + 32))(*(void *)(a1 + 8));
    uint64_t v2 = *(void **)a1;
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    if (!v2)
    {
LABEL_4:
      *(void *)a1 = 0;
      return a1;
    }
  }
  else
  {
    *(void *)a1 = 0;
  }
  dlclose(v2);
  uint64_t v3 = *(void **)a1;
  *(void *)a1 = 0;
  if (v3) {
    dlclose(v3);
  }
  return a1;
}

void sub_255157214(const void **a1@<X0>, const void **a2@<X1>, std::string *a3@<X8>)
{
  *((unsigned char *)&v23.__r_.__value_.__s + 23) = 14;
  strcpy((char *)&v23, "nano_espresso_");
  int v5 = *((char *)a1 + 23);
  if (v5 >= 0) {
    long long v6 = a1;
  }
  else {
    long long v6 = *a1;
  }
  if (v5 >= 0) {
    size_t v7 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v7 = (size_t)a1[1];
  }
  if (v7 <= 8)
  {
    if (v7)
    {
      memmove((char *)&v23.__r_.__value_.__r.__words[1] + 6, v6, v7);
      if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
        v23.__r_.__value_.__l.__size_ = v7 + 14;
      }
      else {
        *((unsigned char *)&v23.__r_.__value_.__s + 23) = v7 + 14;
      }
      v23.__r_.__value_.__s.__data_[v7 + 14] = 0;
    }
  }
  else
  {
    std::string::__grow_by_and_replace(&v23, 0x16uLL, v7 - 8, 0xEuLL, 0xEuLL, 0, v7, (const std::string::value_type *)v6);
  }
  std::string v24 = v23;
  memset(&v23, 0, sizeof(v23));
  if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v8 = 22;
  }
  else {
    std::string::size_type v8 = (v24.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
  }
  if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v24.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v24.__r_.__value_.__l.__size_;
  }
  if (v8 == size)
  {
    std::string::__grow_by_and_replace(&v24, v8, 1uLL, v8, v8, 0, 1uLL, "_");
  }
  else
  {
    uint64_t v10 = &v24;
    if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      uint64_t v10 = (std::string *)v24.__r_.__value_.__r.__words[0];
    }
    v10->__r_.__value_.__s.__data_[size] = 95;
    std::string::size_type v11 = size + 1;
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
      v24.__r_.__value_.__l.__size_ = v11;
    }
    else {
      *((unsigned char *)&v24.__r_.__value_.__s + 23) = v11 & 0x7F;
    }
    v10->__r_.__value_.__s.__data_[v11] = 0;
  }
  unint64_t v12 = v24.__r_.__value_.__r.__words[2];
  std::string v25 = v24;
  memset(&v24, 0, sizeof(v24));
  int v13 = *((char *)a2 + 23);
  if (v13 >= 0) {
    uint64_t v14 = a2;
  }
  else {
    uint64_t v14 = *a2;
  }
  if (v13 >= 0) {
    size_t v15 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v15 = (size_t)a2[1];
  }
  std::string::size_type v16 = HIBYTE(v12);
  int v17 = SHIBYTE(v12);
  uint64_t v18 = (v12 & 0x7FFFFFFFFFFFFFFFLL) - 1;
  if (v17 >= 0) {
    std::string::size_type v19 = 22;
  }
  else {
    std::string::size_type v19 = v18;
  }
  if (v17 >= 0) {
    std::string::size_type v20 = v16;
  }
  else {
    std::string::size_type v20 = v25.__r_.__value_.__l.__size_;
  }
  if (v19 - v20 >= v15)
  {
    if (v15)
    {
      if (v17 >= 0) {
        std::__fs::filesystem::path v21 = &v25;
      }
      else {
        std::__fs::filesystem::path v21 = (std::string *)v25.__r_.__value_.__r.__words[0];
      }
      memmove((char *)v21 + v20, v14, v15);
      std::string::size_type v22 = v20 + v15;
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
        v25.__r_.__value_.__l.__size_ = v20 + v15;
      }
      else {
        *((unsigned char *)&v25.__r_.__value_.__s + 23) = v22 & 0x7F;
      }
      v21->__r_.__value_.__s.__data_[v22] = 0;
    }
  }
  else
  {
    std::string::__grow_by_and_replace(&v25, v19, v20 + v15 - v19, v20, v20, 0, v15, (const std::string::value_type *)v14);
  }
  *a3 = v25;
  memset(&v25, 0, sizeof(v25));
  if ((SHIBYTE(v24.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v23.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return;
    }
LABEL_54:
    operator delete(v23.__r_.__value_.__l.__data_);
    return;
  }
  operator delete(v24.__r_.__value_.__l.__data_);
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_54;
  }
}

void sub_255157494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0)
  {
    operator delete(__p);
    if (a21 < 0)
    {
LABEL_5:
      operator delete(a16);
      if (a15 < 0)
      {
LABEL_8:
        operator delete(a10);
        _Unwind_Resume(a1);
      }
LABEL_9:
      _Unwind_Resume(a1);
    }
  }
  else if (a21 < 0)
  {
    goto LABEL_5;
  }
  if (a15 < 0) {
    goto LABEL_8;
  }
  goto LABEL_9;
}

uint64_t *sub_255157508()
{
  MEMORY[0x270FA5388]();
  uint64_t v469 = *MEMORY[0x263EF8340];
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_269E86D28, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_269E86D28))
  {
    uint64_t v18 = "--I";
    int v19 = 2;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v20 = 0;
    int v23 = 2;
    std::string v24 = "Add directory to include search path for generated code";
    std::string v25 = "--alloc";
    int v26 = 1;
    uint64_t v27 = 1;
    int v28 = 1;
    std::string::size_type v29 = "Allocator pattern to use";
    uint64_t v30 = "--aml-match";
    int v31 = 0;
    char v32 = 0;
    int v33 = 0;
    unint64_t v34 = "Enable the AML pattern matching pass.Currently only work for apple-asc targets.";
    long long v35 = "--api";
    int v36 = 2;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    int v40 = 2;
    int64_t v41 = "Model name used in generated functions and types";
    uint64_t v42 = "--asan";
    int v43 = 0;
    char v44 = 0;
    int v45 = 0;
    int v46 = "Enable Address Sanitizer";
    int v47 = "--async-baking";
    int v48 = 0;
    char v49 = 0;
    int v50 = 0;
    int v51 = "Make bake() run in a dispatch queue";
    uint64_t v52 = "--binary";
    int v53 = 0;
    char v54 = 0;
    int v55 = 0;
    uint64_t v56 = "Build an E5 backend binary";
    v57 = "--bin-debug";
    int v58 = 0;
    char v59 = 0;
    int v60 = 0;
    uint64_t v61 = "Spit out binary_t debugging information";
    uint64_t v62 = "--bnns-filters";
    int v63 = 0;
    char v64 = 1;
    int v65 = 0;
    uint64_t v66 = "enable the use of individual BNNS filters";
    int64_t v67 = "--bnns-graph";
    int v68 = 0;
    char v69 = 0;
    int v70 = 0;
    v71 = "forward the entire MIL graph to MIL2BNNS";
    unint64_t v72 = "--bnns-graph-bnns-ir";
    int v73 = 2;
    sub_2551586C4(v74, "");
    uint64_t v75 = "Set a custom output location for compiled BNNS IR";
    unint64_t v76 = "--bnns-graph-downconvert";
    int v77 = 2;
    sub_2551586C4(v78, "");
    uint64_t v79 = "Set BNNS downconversion mode ('bf16_all', 'bf16_ops', 'fp16_all', 'fp16_ops', or 'none')";
    v80 = "--bnns-graph-generate-debug-info";
    int v81 = 0;
    char v82 = 0;
    int v83 = 0;
    uint64_t v84 = "Include debug info in the BNNS IR";
    uint64_t v85 = "--bnns-graph-inject-custom-data";
    int v86 = 2;
    sub_2551586C4(v87, "");
    uint64_t v88 = "Attaches custom user annotations into the BNNS IR.";
    uint64_t v89 = "--bnns-graph-opt-pref";
    int v90 = 2;
    sub_2551586C4(v91, "");
    uint64_t v92 = "Set BNNS optimization preference ('ir-size' or 'perf')";
    uint64_t v93 = "--bnns-graph-validate-mil";
    int v94 = 0;
    char v95 = 1;
    int v96 = 0;
    v97 = "Set whether BNNS should validate the MIL file";
    unint64_t v98 = "--bnns-match";
    int v99 = 0;
    char v100 = 0;
    int v101 = 0;
    v102 = "Enable the BNNS pattern matching pass";
    v103 = "--c-identifiers";
    int v104 = 0;
    char v105 = 1;
    int v106 = 0;
    v107 = "Force tensor names to be valid C idents";
    v108 = "--code-section";
    int v109 = 2;
    uint64_t v110 = 0;
    uint64_t v112 = 0;
    uint64_t v111 = 0;
    int v113 = 2;
    v114 = "Use the given section for code. Ex.: __ETEXT,__text,regular,pure_instructions";
    v115 = "--compute-at-overrides";
    int v116 = 2;
    uint64_t v119 = 0;
    uint64_t v117 = 0;
    uint64_t v118 = 0;
    int v120 = 2;
    v121 = "Force LoopKit compute_at for certain tensors (check source)";
    v122 = "--compute-at-overrides-allow-unknown";
    int v123 = 0;
    char v124 = 0;
    int v125 = 0;
    v126 = "Allow unknown tensor names in --compute-at-overrides";
    v127 = "--constant-buffer-threshold";
    int v128 = 1;
    uint64_t v129 = 32;
    int v130 = 1;
    v131 = "Threshold in element count under which constant_t's are lowered as LoopKit::Buffer's";
    v132 = "--constant-folding";
    int v133 = 0;
    char v134 = 1;
    int v135 = 0;
    v136 = "Enable constant folding";
    v137 = "--constant-folding-jit-allowed";
    int v138 = 0;
    char v139 = 0;
    int v140 = 0;
    v141 = "Allow jitting of LoopKit kernels during constant-folding";
    v142 = "--check-precompiled-kernels";
    int v143 = 0;
    char v144 = 0;
    int v145 = 0;
    v146 = "Compare results from precompiled kernels with jited ones.";
    v147 = "--const-section";
    int v148 = 2;
    uint64_t v150 = 0;
    uint64_t v149 = 0;
    uint64_t v151 = 0;
    int v152 = 2;
    v153 = "Use the given section for constants. Ex.: __ECONST,__const";
    v154 = "--data-section";
    int v155 = 2;
    uint64_t v158 = 0;
    uint64_t v156 = 0;
    uint64_t v157 = 0;
    int v159 = 2;
    v160 = "Use the given section for data. Ex.: __EDATA,__data";
    v161 = "--debug";
    int v162 = 0;
    char v163 = 0;
    int v164 = 0;
    v165 = "Generate code to improve debugging experience";
    v166 = "--deadline";
    int v167 = 1;
    uint64_t v168 = 0x4000000000000;
    int v169 = 1;
    v170 = "Time limit in seconds for compilation";
    v171 = "--debug-constant";
    int v172 = 0;
    char v173 = 0;
    int v174 = 0;
    v175 = "debugging for constant values";
    v176 = "--debug-loopkit";
    int v177 = 0;
    char v178 = 0;
    int v179 = 0;
    v180 = "Enable debugging for LoopKit-related code";
    v181 = "--disable-precompiled-kernels";
    int v182 = 0;
    char v183 = 0;
    int v184 = 0;
    v185 = "Option to disable precompiled kernels and only enabled for Nano mode.";
    v186 = "--dump-allocation";
    int v187 = 0;
    char v188 = 0;
    int v189 = 0;
    v190 = "Dump a CSV representation of the result of allocation to stdout";
    v191 = "--dump-graphviz";
    int v192 = 0;
    char v193 = 0;
    int v194 = 0;
    v195 = "Dump the IR as a graphviz graph before and after every pass.";
    v196 = "--dump-liveness";
    int v197 = 0;
    char v198 = 0;
    int v199 = 0;
    v200 = "Dump a CSV representation of the result of liveness analysis to stdout";
    v201 = "--dump-yaml-before";
    int v202 = 2;
    sub_255158780(&v16, "");
    long long v203 = v16;
    uint64_t v204 = v17;
    uint64_t v17 = 0;
    long long v16 = 0uLL;
    int v205 = 2;
    v206 = "Dump the IR as structured YAML before the given pass.";
    v207 = "--dump-yaml-after";
    int v208 = 2;
    sub_255158780(v14, "");
    long long v209 = *(_OWORD *)v14;
    uint64_t v210 = v15;
    v14[1] = 0;
    uint64_t v15 = 0;
    v14[0] = 0;
    int v211 = 2;
    v212 = "Dump the IR as structured YAML after the given pass. Use 'frontend' to dump before any compile passes have run.";
    v213 = "--dump-yaml-to";
    int v214 = 2;
    sub_255158780(v12, "-");
    long long v215 = *(_OWORD *)v12;
    uint64_t v216 = v13;
    v12[1] = 0;
    uint64_t v13 = 0;
    v12[0] = 0;
    int v217 = 2;
    v218 = "If --dump-yaml-after is given, dump the yaml to the specified file. Defaults to stdout.";
    v219 = "--dump-cg";
    int v220 = 0;
    char v221 = 0;
    int v222 = 0;
    v223 = "Dump codegen's output to stdout";
    v224 = "--dump-op-names";
    int v225 = 0;
    char v226 = 0;
    int v227 = 0;
    v228 = "Dump all operation names to stdout";
    v229 = "--dump-record-layouts";
    int v230 = 0;
    char v231 = 0;
    int v232 = 0;
    v233 = "Dump clang's representation of the data struct";
    v234 = "--dylib";
    int v235 = 0;
    char v236 = 0;
    int v237 = 0;
    v238 = "Build a dynamic library";
    v239 = "--enable-external-constants";
    int v240 = 0;
    char v241 = 0;
    int v242 = 0;
    v243 = "Enables use of external weight files";
    v244 = "--enable-external-kernels";
    int v245 = 0;
    char v246 = 0;
    int v247 = 0;
    v248 = "Enable external kernels mode for binary_t codegen";
    v249 = "--enable-external-outputs";
    int v250 = 0;
    char v251 = 0;
    int v252 = 0;
    v253 = "Enables use of external output buffers. This can have negative performance implications.";
    v254 = "--enforce-opt-names-exist";
    int v255 = 0;
    char v256 = 0;
    int v257 = 0;
    v258 = "Enforce that operations named in opt_config actually exist.";
    v259 = "--fusion";
    int v260 = 0;
    char v261 = 1;
    int v262 = 0;
    v263 = "Enable the fusion pass";
    v264 = "--fuse-all";
    int v265 = 0;
    char v266 = 0;
    int v267 = 0;
    v268 = "Pretend EVERYTHING is fusable";
    v269 = "--fuse-single";
    int v270 = 0;
    char v271 = 0;
    int v272 = 0;
    v273 = "Max 1 op per fusion";
    v274 = "--header";
    int v275 = 2;
    uint64_t v277 = 0;
    uint64_t v276 = 0;
    uint64_t v278 = 0;
    int v279 = 2;
    v280 = "Path to generated header. Not required when generating a binary";
    v281 = "--lk-bsa";
    int v282 = 0;
    char v283 = 1;
    int v284 = 0;
    v285 = "Use LoopKit's BucketStackAllocations";
    v286 = "--lk-buffers";
    int v287 = 0;
    char v288 = 0;
    int v289 = 0;
    v290 = "Enable/Disable using LoopKit buffers";
    v291 = "--lk-malloc";
    int v292 = 0;
    char v293 = 0;
    int v294 = 0;
    v295 = "Allow LoopKit to call 'malloc'.";
    v296 = "--lk-object";
    int v297 = 0;
    char v298 = 1;
    int v299 = 0;
    v300 = "Output LoopKit generated code as object.";
    v301 = "--lk-partition";
    int v302 = 0;
    char v303 = 1;
    int v304 = 0;
    v305 = "Partition loops in LoopKit";
    v306 = "--lk-profiling";
    int v307 = 0;
    char v308 = 0;
    int v309 = 0;
    v310 = "Enable LoopKit's profiling mode";
    v311 = "--lk-runtime";
    int v312 = 0;
    char v313 = 0;
    int v314 = 0;
    v315 = "Enable/disable the LoopKit runtime";
    v316 = "--lk-scratch";
    int v317 = 0;
    char v318 = 1;
    int v319 = 0;
    v320 = "Utilize scratch buffers in LK";
    v321 = "--lk-scratch-metakernel";
    int v322 = 0;
    char v323 = 0;
    int v324 = 0;
    v325 = "Use metakernels to access scratchbuffer sizes";
    v326 = "--lk-apply-bounds";
    int v327 = 0;
    char v328 = 1;
    int v329 = 0;
    v330 = "Set bounds on input and output params to LK kernels";
    v331 = "--lk-werror";
    int v332 = 0;
    char v333 = 1;
    int v334 = 0;
    v335 = "Treat LoopKit runtime assertion failures as errors";
    v336 = "--llvm-ir";
    int v337 = 0;
    char v338 = 0;
    int v339 = 0;
    v340 = "Outputs LLVM IR files to /tmp or the directory specified with --save-temps";
    v341 = "--llvm-unroll";
    int v342 = 0;
    char v343 = 0;
    int v344 = 0;
    v345 = "Unroll loops at the LLVM level (ignore LK)";
    v346 = "--llvm-vectorize";
    int v347 = 0;
    char v348 = 0;
    int v349 = 0;
    v350 = "Vectorize at the LLVM level (ignore LK)";
    v351 = "--mem-limit";
    int v352 = 1;
    uint64_t v353 = -1;
    int v354 = 1;
    v355 = "Memory limit for graph. -1 to disable.";
    v356 = "--memory";
    int v357 = 2;
    sub_255158780(v10, "static");
    long long v358 = *(_OWORD *)v10;
    uint64_t v359 = v11;
    v10[1] = 0;
    uint64_t v11 = 0;
    v10[0] = 0;
    int v360 = 2;
    v361 = "method to allocate memory";
    v362 = "--min-alignment";
    int v363 = 1;
    uint64_t v364 = 32;
    int v365 = 1;
    v366 = "Minimum alignment for a tensor";
    v367 = "--model-path";
    int v368 = 2;
    sub_255158780(v8, "");
    long long v369 = *(_OWORD *)v8;
    uint64_t v370 = v9;
    v8[1] = 0;
    uint64_t v9 = 0;
    v8[0] = 0;
    int v371 = 2;
    v372 = "MIL file path, used during MIL parsing";
    v373 = "--n-threads";
    int v374 = 1;
    int v376 = 1;
    uint64_t v375 = 0;
    v377 = "Limit runtime execution to N threads (0 means automatic)";
    v378 = "--nanck";
    int v379 = 0;
    char v380 = 0;
    v382 = "Add NaN checking ops";
    int v381 = 0;
    v383 = "--opt_config";
    int v384 = 2;
    uint64_t v386 = 0;
    uint64_t v385 = 0;
    uint64_t v387 = 0;
    int v388 = 2;
    v389 = "Optimization configuration file";
    v390 = "--output";
    int v391 = 2;
    uint64_t v394 = 0;
    uint64_t v392 = 0;
    uint64_t v393 = 0;
    int v395 = 2;
    v396 = "Path to generated library or binary file";
    v397 = "--print";
    int v398 = 0;
    char v399 = 0;
    int v400 = 0;
    v401 = "Add print ops to debug tensor values";
    v402 = "--reachability";
    int v403 = 0;
    char v404 = 0;
    int v405 = 0;
    v406 = "Debug tensor/op reachability calculation";
    v407 = "--rtcg";
    int v408 = 0;
    char v409 = 0;
    int v410 = 0;
    v411 = "Enable RTCG code generator";
    v412 = "--save-temps";
    int v413 = 2;
    sub_255158780(v6, "");
    long long v414 = *(_OWORD *)v6;
    uint64_t v415 = v7;
    v6[1] = 0;
    uint64_t v7 = 0;
    v6[0] = 0;
    int v416 = 2;
    v417 = "Save temporaries to this directory";
    v418 = "--skip-opt-pass";
    int v419 = 2;
    sub_255158780(v4, "");
    long long v420 = *(_OWORD *)v4;
    uint64_t v421 = v5;
    v4[1] = 0;
    uint64_t v5 = 0;
    v4[0] = 0;
    int v422 = 2;
    v423 = "Skip the listed (comma-separated) optimization passes. Available values: 'alloc', 'constant-folding'";
    v424 = "--sdk";
    int v425 = 2;
    uint64_t v426 = 0;
    uint64_t v428 = 0;
    uint64_t v427 = 0;
    v430 = "Use the tools from the given SDK";
    int v429 = 2;
    v431 = "--static";
    int v432 = 0;
    char v433 = 0;
    int v434 = 0;
    v435 = "Build a static library";
    v436 = "--strength-reduction";
    int v437 = 0;
    char v438 = 1;
    int v439 = 0;
    v440 = "Enable strength reduction";
    v441 = "--target";
    int v442 = 2;
    sub_255158780(__p, "arm64e-apple-macosx:apple-m1");
    long long v443 = *(_OWORD *)__p;
    uint64_t v444 = v3;
    __p[1] = 0;
    uint64_t v3 = 0;
    __p[0] = 0;
    int v445 = 2;
    v446 = "The super triple string (target triple and mcpu separated by ':').";
    v447 = "--use-bnns";
    int v448 = 0;
    char v449 = 0;
    int v450 = 0;
    v451 = "Enable BNNS or AccelerateML as a backend.";
    v452 = "--verbose";
    int v453 = 0;
    char v454 = 0;
    int v455 = 0;
    v456 = "Print intermediate tools output information";
    v457 = "--version";
    int v458 = 0;
    char v459 = 0;
    int v460 = 0;
    v461 = "Print version information and exit";
    v462 = "--use-fixed-point";
    int v463 = 2;
    uint64_t v466 = 0;
    uint64_t v464 = 0;
    uint64_t v465 = 0;
    int v467 = 2;
    v468 = "Quantize float-point model to use fixed-point arithmetics. (Supported values: 'i32_16')";
    sub_255158834(&qword_269E86D10, (uint64_t)&v18, 0x55uLL);
    for (uint64_t i = 0; i != -595; i -= 7)
      sub_255158964((uint64_t)&(&v462)[i]);
    if (SHIBYTE(v3) < 0)
    {
      operator delete(__p[0]);
      if ((SHIBYTE(v5) & 0x80000000) == 0)
      {
LABEL_8:
        if ((SHIBYTE(v7) & 0x80000000) == 0) {
          goto LABEL_9;
        }
        goto LABEL_17;
      }
    }
    else if ((SHIBYTE(v5) & 0x80000000) == 0)
    {
      goto LABEL_8;
    }
    operator delete(v4[0]);
    if ((SHIBYTE(v7) & 0x80000000) == 0)
    {
LABEL_9:
      if ((SHIBYTE(v9) & 0x80000000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_18;
    }
LABEL_17:
    operator delete(v6[0]);
    if ((SHIBYTE(v9) & 0x80000000) == 0)
    {
LABEL_10:
      if ((SHIBYTE(v11) & 0x80000000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_19;
    }
LABEL_18:
    operator delete(v8[0]);
    if ((SHIBYTE(v11) & 0x80000000) == 0)
    {
LABEL_11:
      if ((SHIBYTE(v13) & 0x80000000) == 0) {
        goto LABEL_12;
      }
      goto LABEL_20;
    }
LABEL_19:
    operator delete(v10[0]);
    if ((SHIBYTE(v13) & 0x80000000) == 0)
    {
LABEL_12:
      if ((SHIBYTE(v15) & 0x80000000) == 0) {
        goto LABEL_13;
      }
      goto LABEL_21;
    }
LABEL_20:
    operator delete(v12[0]);
    if ((SHIBYTE(v15) & 0x80000000) == 0)
    {
LABEL_13:
      if ((SHIBYTE(v17) & 0x80000000) == 0)
      {
LABEL_14:
        __cxa_atexit((void (*)(void *))sub_2551589C0, &qword_269E86D10, &dword_255146000);
        __cxa_guard_release(&qword_269E86D28);
        return &qword_269E86D10;
      }
LABEL_22:
      operator delete((void *)v16);
      goto LABEL_14;
    }
LABEL_21:
    operator delete(v14[0]);
    if ((SHIBYTE(v17) & 0x80000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_22;
  }
  return &qword_269E86D10;
}

void sub_255158518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50,void *a51,uint64_t a52,int a53,__int16 a54,char a55,char a56,char a57)
{
  uint64_t v59 = -4760;
  uint64_t v60 = v57;
  do
  {
    uint64_t v60 = sub_255158964(v60) - 56;
    v59 += 56;
  }
  while (v59);
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0)
  {
    operator delete(a15);
    if ((a26 & 0x80000000) == 0)
    {
LABEL_7:
      if ((a32 & 0x80000000) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((a26 & 0x80000000) == 0)
  {
    goto LABEL_7;
  }
  operator delete(a21);
  if ((a32 & 0x80000000) == 0)
  {
LABEL_8:
    if ((a38 & 0x80000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_16;
  }
LABEL_15:
  operator delete(a27);
  if ((a38 & 0x80000000) == 0)
  {
LABEL_9:
    if ((a44 & 0x80000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }
LABEL_16:
  operator delete(a33);
  if ((a44 & 0x80000000) == 0)
  {
LABEL_10:
    if ((a50 & 0x80000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_18;
  }
LABEL_17:
  operator delete(a39);
  if ((a50 & 0x80000000) == 0)
  {
LABEL_11:
    if ((a56 & 0x80000000) == 0)
    {
LABEL_20:
      __cxa_guard_abort(&qword_269E86D28);
      _Unwind_Resume(a1);
    }
LABEL_19:
    operator delete(a51);
    goto LABEL_20;
  }
LABEL_18:
  operator delete(a45);
  if ((a56 & 0x80000000) == 0) {
    goto LABEL_20;
  }
  goto LABEL_19;
}

_DWORD *sub_2551586C4(_DWORD *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_25514C40C();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    long long v6 = operator new(v7 + 1);
    *((void *)a1 + 1) = v5;
    *((void *)a1 + 2) = v8 | 0x8000000000000000;
    *(void *)a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    long long v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  a1[6] = 2;
  return a1;
}

void *sub_255158780(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_25514C40C();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    long long v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    long long v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void *sub_255158834(void *a1, uint64_t a2, unint64_t a3)
{
  a1[2] = 0;
  uint64_t v4 = (uint64_t)(a1 + 2);
  *a1 = 0;
  a1[1] = 0;
  if (a3)
  {
    if (a3 >= 0x492492492492493) {
      sub_25514C55C();
    }
    uint64_t v6 = 56 * a3;
    uint64_t v7 = (char *)operator new(56 * a3);
    *a1 = v7;
    a1[1] = v7;
    a1[2] = &v7[v6];
    a1[1] = sub_2551598A4(v4, a2, a2 + v6, (uint64_t)v7);
  }
  return a1;
}

void sub_2551588E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  v13[1] = v14;
  long long v16 = *v13;
  if (*v13)
  {
    uint64_t v17 = v13[1];
    uint64_t v18 = *v13;
    if (v17 != v16)
    {
      do
      {
        uint64_t v19 = *(v17 - 4);
        if (v19 != -1) {
          ((void (*)(char *, _DWORD *))off_270446578[v19])(&a13, v17 - 10);
        }
        *(v17 - 4) = -1;
        v17 -= 14;
      }
      while (v17 != v16);
      uint64_t v18 = *v13;
    }
    v13[1] = v16;
    operator delete(v18);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_255158964(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 40);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))off_270446578[v2])(&v4, a1 + 16);
  }
  *(_DWORD *)(a1 + 40) = -1;
  return a1;
}

void **sub_2551589C0(void **a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    uint64_t v3 = a1[1];
    char v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        uint64_t v5 = *(v3 - 4);
        if (v5 != -1) {
          ((void (*)(char *, _DWORD *))off_270446578[v5])(&v7, v3 - 10);
        }
        *(v3 - 4) = -1;
        v3 -= 14;
      }
      while (v3 != v2);
      char v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_255158A68(uint64_t a1)
{
  *(_OWORD *)(a1 + 8) = 0u;
  uint64_t v1 = a1 + 8;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 40) = 1065353216;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 48) = a1 + 56;
  *(void *)a1 = &unk_270446558;
  sub_255157508();
  uint64_t v2 = qword_269E86D18;
  if (qword_269E86D10 != qword_269E86D18)
  {
    uint64_t v3 = qword_269E86D10 + 16;
    while (1)
    {
      uint64_t v4 = v3 - 16;
      uint64_t v5 = *(const char **)(v3 - 16);
      size_t v6 = strlen(v5);
      if (v6 > 0x7FFFFFFFFFFFFFF7) {
        sub_25514C40C();
      }
      size_t v7 = v6;
      if (v6 >= 0x17) {
        break;
      }
      HIBYTE(v25) = v6;
      p_dst = &__dst;
      if (v6) {
        goto LABEL_11;
      }
LABEL_12:
      *((unsigned char *)p_dst + v7) = 0;
      int v26 = &__dst;
      uint64_t v11 = sub_255159D90(v1, (uint64_t)&__dst, (uint64_t)&unk_25515FA2E, &v26);
      unint64_t v12 = v11;
      uint64_t v13 = *((unsigned int *)v11 + 16);
      uint64_t v14 = *(unsigned int *)(v3 + 24);
      if (v13 == -1)
      {
        if (v14 != -1)
        {
LABEL_16:
          int v26 = (long long *)(v11 + 40);
          ((void (*)(long long **))off_2704465A8[v14])(&v26);
        }
      }
      else
      {
        if (v14 != -1) {
          goto LABEL_16;
        }
        ((void (*)(long long **, unsigned __int8 *))off_270446578[v13])(&v26, v11 + 40);
        *((_DWORD *)v12 + 16) = -1;
      }
      if (SHIBYTE(v25) < 0) {
        operator delete((void *)__dst);
      }
      v3 += 56;
      if (v4 + 56 == v2) {
        goto LABEL_19;
      }
    }
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    p_dst = (long long *)operator new(v9 + 1);
    *((void *)&__dst + 1) = v7;
    unint64_t v25 = v10 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
LABEL_11:
    memmove(p_dst, v5, v7);
    goto LABEL_12;
  }
LABEL_19:
  uint64_t v15 = getenv("__UNOWUD");
  if (v15)
  {
    long long v16 = v15;
    size_t v17 = strlen(v15);
    if (v17 > 0x7FFFFFFFFFFFFFF7) {
      sub_25514C40C();
    }
    size_t v18 = v17;
    if (v17 >= 0x17)
    {
      uint64_t v20 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v17 | 7) != 0x17) {
        uint64_t v20 = v17 | 7;
      }
      uint64_t v21 = v20 + 1;
      uint64_t v19 = (long long *)operator new(v20 + 1);
      *((void *)&__dst + 1) = v18;
      unint64_t v25 = v21 | 0x8000000000000000;
      *(void *)&long long __dst = v19;
    }
    else
    {
      HIBYTE(v25) = v17;
      uint64_t v19 = &__dst;
      if (!v17)
      {
LABEL_28:
        *((unsigned char *)v19 + v18) = 0;
        sub_25515B784((char **)a1, &__dst);
        if (SHIBYTE(v25) < 0) {
          operator delete((void *)__dst);
        }
        return a1;
      }
    }
    memmove(v19, v16, v18);
    goto LABEL_28;
  }
  return a1;
}

void sub_255158D08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  sub_255158D48(a9);
  _Unwind_Resume(a1);
}

uint64_t sub_255158D48(uint64_t a1)
{
  *(void *)a1 = &unk_2704461B8;
  sub_255150008(a1 + 48, *(char **)(a1 + 56));
  sub_255159CE0(a1 + 8);
  return nullsub_1(a1);
}

void sub_255158DAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = *(char *)(a2 + 23);
  unint64_t v7 = *(void *)(a2 + 8);
  if (v6 >= 0) {
    size_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v8 = *(void *)(a2 + 8);
  }
  if (v8 > 1)
  {
    uint64_t v10 = *(char **)a2;
    if (v6 >= 0) {
      uint64_t v11 = (char *)a2;
    }
    else {
      uint64_t v11 = *(char **)a2;
    }
    if (*(_WORD *)v11 == 11565)
    {
      if (v6 < 0)
      {
        sub_2551501FC(__dst, v10, v7);
      }
      else
      {
        *(_OWORD *)long long __dst = *(_OWORD *)a2;
        int64_t v48 = *(void *)(a2 + 16);
      }
      goto LABEL_19;
    }
    unint64_t v9 = v8 + 2;
    if (v8 + 2 > 0x7FFFFFFFFFFFFFF7) {
      sub_25514C40C();
    }
    if (v9 > 0x16)
    {
      uint64_t v29 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v9 | 7) != 0x17) {
        uint64_t v29 = v9 | 7;
      }
      uint64_t v30 = v29 + 1;
      unint64_t v12 = operator new(v29 + 1);
      __dst[1] = (void *)(v8 + 2);
      int64_t v48 = v30 | 0x8000000000000000;
      __dst[0] = v12;
      goto LABEL_13;
    }
  }
  else
  {
    LOBYTE(v9) = v8 + 2;
  }
  __dst[1] = 0;
  int64_t v48 = 0;
  __dst[0] = 0;
  unint64_t v12 = __dst;
  HIBYTE(v48) = v9;
LABEL_13:
  *unint64_t v12 = 11565;
  uint64_t v13 = v12 + 1;
  if (v8)
  {
    if (v6 >= 0) {
      uint64_t v14 = (char *)a2;
    }
    else {
      uint64_t v14 = *(char **)a2;
    }
    memmove(v13, v14, v8);
  }
  *((unsigned char *)v13 + v8) = 0;
LABEL_19:
  sub_255157508();
  uint64_t v15 = qword_269E86D10;
  sub_255157508();
  uint64_t v46 = a1;
  uint64_t v16 = qword_269E86D18;
  if (v15 == qword_269E86D18) {
    goto LABEL_54;
  }
  do
  {
    uint64_t v19 = *(const char **)v15;
    size_t v20 = strlen(*(const char **)v15);
    if (v20 > 0x7FFFFFFFFFFFFFF7) {
      sub_25514C40C();
    }
    uint64_t v21 = (void *)v20;
    if (v20 >= 0x17)
    {
      uint64_t v23 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v20 | 7) != 0x17) {
        uint64_t v23 = v20 | 7;
      }
      uint64_t v24 = v23 + 1;
      uint64_t v22 = operator new(v23 + 1);
      __s1[1] = v21;
      int64_t v51 = v24 | 0x8000000000000000;
      __s1[0] = v22;
LABEL_30:
      memmove(v22, v19, (size_t)v21);
      goto LABEL_31;
    }
    HIBYTE(v51) = v20;
    uint64_t v22 = __s1;
    if (v20) {
      goto LABEL_30;
    }
LABEL_31:
    *((unsigned char *)v21 + (void)v22) = 0;
    if (v51 >= 0) {
      unint64_t v25 = (void *)HIBYTE(v51);
    }
    else {
      unint64_t v25 = __s1[1];
    }
    int v26 = (void *)HIBYTE(v48);
    if (v48 < 0) {
      int v26 = __dst[1];
    }
    if (v25 != v26) {
      goto LABEL_46;
    }
    if (v48 >= 0) {
      uint64_t v27 = __dst;
    }
    else {
      uint64_t v27 = (void **)__dst[0];
    }
    if ((v51 & 0x8000000000000000) == 0)
    {
      if (!HIBYTE(v51)) {
        goto LABEL_54;
      }
      uint64_t v28 = 0;
      while (*((unsigned __int8 *)__s1 + v28) == *((unsigned __int8 *)v27 + v28))
      {
        if (HIBYTE(v51) == ++v28) {
          goto LABEL_54;
        }
      }
LABEL_46:
      if (v51 < 0) {
        operator delete(__s1[0]);
      }
      goto LABEL_22;
    }
    size_t v17 = __s1[0];
    int v18 = memcmp(__s1[0], v27, (size_t)__s1[1]);
    operator delete(v17);
    if (!v18) {
      goto LABEL_54;
    }
LABEL_22:
    v15 += 56;
  }
  while (v15 != v16);
  uint64_t v15 = v16;
LABEL_54:
  sub_255157508();
  if (v15 == qword_269E86D18)
  {
    if (*(char *)(a2 + 23) >= 0) {
      uint64_t v38 = (const char *)a2;
    }
    else {
      uint64_t v38 = *(const char **)a2;
    }
    if (*(char *)(a3 + 23) >= 0) {
      uint64_t v39 = (const char *)a3;
    }
    else {
      uint64_t v39 = *(const char **)a3;
    }
    fprintf((FILE *)*MEMORY[0x263EF8348], "Unknown option %s=%s\n", v38, v39);
    if (SHIBYTE(v48) < 0) {
      goto LABEL_71;
    }
    return;
  }
  int v31 = *(_DWORD *)(v15 + 8);
  if (v31 == 2)
  {
    uint64_t v32 = v46;
    __s1[0] = (void *)a2;
    int v45 = sub_25515A740(v46 + 8, a2, (uint64_t)&unk_25515FA2E, (long long **)__s1);
    sub_255159BA8((void **)v45 + 5, (uint64_t)(v45 + 5), (long long *)a3);
    goto LABEL_79;
  }
  uint64_t v32 = v46;
  if (v31 == 1)
  {
    sub_25515AAFC((uint64_t *)__s1, (long long *)a3, 8);
    uint64_t v49 = 0;
    *(_DWORD *)((char *)&__s1[1] + *((void *)__s1[0] - 3)) |= 1u;
    MEMORY[0x25A288DE0](__s1, &v49);
    uint64_t v40 = v49;
    __s1[0] = *(void **)MEMORY[0x263F8C2C0];
    *(void **)((char *)__s1 + *((void *)__s1[0] - 3)) = *(void **)(MEMORY[0x263F8C2C0] + 24);
    int64_t v51 = MEMORY[0x263F8C318] + 16;
    if (v56 < 0) {
      operator delete(__p);
    }
    std::streambuf::~streambuf();
    std::istream::~istream();
    MEMORY[0x25A288F40](v57);
    __s1[0] = (void *)a2;
    int64_t v41 = sub_25515A740(v46 + 8, a2, (uint64_t)&unk_25515FA2E, (long long **)__s1);
    uint64_t v42 = v41;
    uint64_t v43 = *((unsigned int *)v41 + 16);
    if (v43 != -1)
    {
      char v44 = v41 + 5;
      if (v43 == 1)
      {
        *char v44 = v40;
        if ((*(char *)(a2 + 23) & 0x80000000) == 0) {
          goto LABEL_80;
        }
LABEL_84:
        sub_2551501FC(__s1, *(void **)a2, *(void *)(a2 + 8));
        goto LABEL_85;
      }
      ((void (*)(void **, uint64_t *))off_270446578[v43])(__s1, v44);
    }
    v42[5] = v40;
    *((_DWORD *)v42 + 16) = 1;
    if (*(char *)(a2 + 23) < 0) {
      goto LABEL_84;
    }
    goto LABEL_80;
  }
  if (v31)
  {
LABEL_79:
    if (*(char *)(a2 + 23) < 0) {
      goto LABEL_84;
    }
    goto LABEL_80;
  }
  sub_25515AAFC((uint64_t *)__s1, (long long *)a3, 8);
  LOBYTE(v49) = 0;
  *(_DWORD *)((char *)&__s1[1] + *((void *)__s1[0] - 3)) |= 1u;
  MEMORY[0x25A288DD0](__s1, &v49);
  char v33 = v49;
  __s1[0] = *(void **)MEMORY[0x263F8C2C0];
  *(void **)((char *)__s1 + *((void *)__s1[0] - 3)) = *(void **)(MEMORY[0x263F8C2C0] + 24);
  int64_t v51 = MEMORY[0x263F8C318] + 16;
  if (v56 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::istream::~istream();
  MEMORY[0x25A288F40](v57);
  __s1[0] = (void *)a2;
  unint64_t v34 = sub_25515A740(v46 + 8, a2, (uint64_t)&unk_25515FA2E, (long long **)__s1);
  long long v35 = v34;
  uint64_t v36 = *((unsigned int *)v34 + 16);
  if (v36 == -1)
  {
LABEL_96:
    *((unsigned char *)v35 + 40) = v33;
    *((_DWORD *)v35 + 16) = 0;
    if ((*(char *)(a2 + 23) & 0x80000000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_84;
  }
  uint64_t v37 = v34 + 5;
  if (v36)
  {
    ((void (*)(void **, unsigned char *))off_270446578[v36])(__s1, v37);
    goto LABEL_96;
  }
  unsigned char *v37 = v33;
  if (*(char *)(a2 + 23) < 0) {
    goto LABEL_84;
  }
LABEL_80:
  *(_OWORD *)__s1 = *(_OWORD *)a2;
  int64_t v51 = *(void *)(a2 + 16);
LABEL_85:
  if (*(char *)(a3 + 23) < 0)
  {
    sub_2551501FC(&v52, *(void **)a3, *(void *)(a3 + 8));
  }
  else
  {
    long long v52 = *(_OWORD *)a3;
    uint64_t v53 = *(void *)(a3 + 16);
  }
  int v54 = 2;
  sub_25515AF90(v32 + 8, (uint64_t)__s1, (uint64_t)__s1);
  if (v54 != -1) {
    ((void (*)(uint64_t *, long long *))off_270446578[v54])(&v49, &v52);
  }
  int v54 = -1;
  if ((SHIBYTE(v51) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v48) & 0x80000000) == 0) {
      return;
    }
LABEL_71:
    operator delete(__dst[0]);
    return;
  }
  operator delete(__s1[0]);
  if (SHIBYTE(v48) < 0) {
    goto LABEL_71;
  }
}

void sub_2551594FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a18 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_255159594(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 48);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))off_270446578[v2])(&v4, a1 + 24);
  }
  *(_DWORD *)(a1 + 48) = -1;
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_255159600(uint64_t a1, const char *a2)
{
  sub_255157508();
  uint64_t v3 = qword_269E86D10;
  sub_255157508();
  uint64_t v4 = qword_269E86D18;
  if (v3 != qword_269E86D18)
  {
    while (1)
    {
      unint64_t v7 = *(const char **)v3;
      size_t v8 = strlen(*(const char **)v3);
      if (v8 >= 0x7FFFFFFFFFFFFFF8) {
        sub_25514C40C();
      }
      size_t v9 = v8;
      if (v8 >= 0x17) {
        break;
      }
      HIBYTE(v22) = v8;
      p_s1 = &__s1;
      if (v8) {
        goto LABEL_12;
      }
LABEL_13:
      p_s1[v9] = 0;
      if (v22 >= 0) {
        size_t v13 = HIBYTE(v22);
      }
      else {
        size_t v13 = __n;
      }
      uint64_t v14 = (unsigned __int8 *)*((unsigned __int8 *)a2 + 23);
      int v15 = (char)v14;
      if ((char)v14 < 0) {
        uint64_t v14 = (unsigned __int8 *)*((void *)a2 + 1);
      }
      if ((unsigned __int8 *)v13 == v14)
      {
        if (v15 >= 0) {
          uint64_t v16 = a2;
        }
        else {
          uint64_t v16 = *(const char **)a2;
        }
        if (v22 < 0)
        {
          uint64_t v5 = __s1;
          int v6 = memcmp(__s1, v16, __n);
          operator delete(v5);
          if (!v6) {
            goto LABEL_31;
          }
          goto LABEL_4;
        }
        if (!HIBYTE(v22)) {
          goto LABEL_31;
        }
        uint64_t v17 = 0;
        while (*((unsigned __int8 *)&__s1 + v17) == v16[v17])
        {
          if (HIBYTE(v22) == ++v17) {
            goto LABEL_31;
          }
        }
      }
      if (v22 < 0) {
        operator delete(__s1);
      }
LABEL_4:
      v3 += 56;
      if (v3 == v4)
      {
        uint64_t v3 = v4;
        goto LABEL_31;
      }
    }
    uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v11 = v8 | 7;
    }
    uint64_t v12 = v11 + 1;
    p_s1 = operator new(v11 + 1);
    size_t __n = v9;
    int64_t v22 = v12 | 0x8000000000000000;
    __s1 = p_s1;
LABEL_12:
    memmove(p_s1, v7, v9);
    goto LABEL_13;
  }
LABEL_31:
  sub_255157508();
  if (v3 != qword_269E86D18) {
    return *(unsigned int *)(v3 + 8);
  }
  if (a2[23] >= 0) {
    uint64_t v19 = a2;
  }
  else {
    uint64_t v19 = *(const char **)a2;
  }
  fprintf((FILE *)*MEMORY[0x263EF8348], "Unknown option key %s!\n", v19);
  return 0;
}

uint64_t sub_2551597E0(uint64_t a1)
{
  *(void *)a1 = &unk_2704461B8;
  sub_255150008(a1 + 48, *(char **)(a1 + 56));
  sub_255159CE0(a1 + 8);
  return nullsub_1(a1);
}

void sub_255159840(uint64_t a1)
{
  *(void *)a1 = &unk_2704461B8;
  sub_255150008(a1 + 48, *(char **)(a1 + 56));
  sub_255159CE0(a1 + 8);
  uint64_t v2 = (void *)nullsub_1(a1);
  j__free(v2);
}

uint64_t sub_2551598A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v12 = a4;
  if (a2 != a3)
  {
    uint64_t v6 = a2 + 16;
    do
    {
      uint64_t v8 = v6 - 16;
      uint64_t v7 = *(void *)(v6 - 16);
      *(_DWORD *)(v4 + 8) = *(_DWORD *)(v6 - 8);
      *(void *)uint64_t v4 = v7;
      *(unsigned char *)(v4 + 16) = 0;
      *(_DWORD *)(v4 + 40) = -1;
      uint64_t v9 = *(unsigned int *)(v6 + 24);
      uint64_t v10 = v4;
      if (v9 != -1)
      {
        ((void (*)(unsigned char *, uint64_t, uint64_t))off_270446590[v9])(v13, v4 + 16, v6);
        *(_DWORD *)(v4 + 40) = v9;
        uint64_t v10 = v12;
      }
      *(void *)(v4 + 48) = *(void *)(v6 + 32);
      uint64_t v4 = v10 + 56;
      uint64_t v12 = v10 + 56;
      v6 += 56;
    }
    while (v8 + 56 != a3);
  }
  return v4;
}

void sub_255159990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  uint64_t v22 = *(unsigned int *)(v19 + 40);
  if (v22 != -1) {
    ((void (*)(char *, uint64_t))off_270446578[v22])(&a19, v20);
  }
  *(_DWORD *)(v19 + 40) = -1;
  sub_2551599D4((uint64_t)&a10);
  _Unwind_Resume(a1);
}

uint64_t sub_2551599D4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v4 = *(uint64_t **)(a1 + 8);
    uint64_t v3 = *(uint64_t **)(a1 + 16);
    uint64_t v5 = *v3;
    for (uint64_t i = *v4; v5 != i; v5 -= 56)
    {
      uint64_t v7 = *(unsigned int *)(v5 - 16);
      if (v7 != -1) {
        ((void (*)(char *, uint64_t))off_270446578[v7])(&v8, v5 - 40);
      }
      *(_DWORD *)(v5 - 16) = -1;
    }
  }
  return a1;
}

void sub_255159A74(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  *a2 = *a3;
}

void sub_255159A80(uint64_t a1, void *a2, void *a3)
{
  *a2 = *a3;
}

void *sub_255159A8C(int a1, void *__dst, long long *a3)
{
  if (*((char *)a3 + 23) < 0) {
    return sub_2551501FC(__dst, *(void **)a3, *((void *)a3 + 1));
  }
  long long v3 = *a3;
  __dst[2] = *((void *)a3 + 2);
  *(_OWORD *)long long __dst = v3;
  return result;
}

uint64_t sub_255159AB8(uint64_t result, unsigned char *a2, unsigned char *a3)
{
  uint64_t v4 = *(void *)result;
  uint64_t v5 = *(unsigned int *)(*(void *)result + 24);
  if (v5 != -1)
  {
    if (!v5)
    {
      *a2 = *a3;
      return result;
    }
    uint64_t result = ((uint64_t (*)(char *, uint64_t))off_270446578[v5])(&v6, v4);
  }
  *(unsigned char *)uint64_t v4 = *a3;
  *(_DWORD *)(v4 + 24) = 0;
  return result;
}

uint64_t sub_255159B28(uint64_t result, void *a2, void *a3)
{
  uint64_t v4 = *(void *)result;
  uint64_t v5 = *(unsigned int *)(*(void *)result + 24);
  if (v5 != -1)
  {
    if (v5 == 1)
    {
      *a2 = *a3;
      return result;
    }
    uint64_t result = ((uint64_t (*)(char *, uint64_t))off_270446578[v5])(&v6, v4);
  }
  *(void *)uint64_t v4 = *a3;
  *(_DWORD *)(v4 + 24) = 1;
  return result;
}

void **sub_255159BA0(void ***a1, uint64_t a2, long long *a3)
{
  return sub_255159BA8(*a1, a2, a3);
}

void **sub_255159BA8(void **result, uint64_t a2, long long *a3)
{
  int v3 = *((_DWORD *)result + 6);
  if (v3 != 2)
  {
    uint64_t v6 = (uint64_t)result;
    if (*((char *)a3 + 23) < 0)
    {
      uint64_t result = (void **)sub_2551501FC(&v11, *(void **)a3, *((void *)a3 + 1));
      int v3 = *(_DWORD *)(v6 + 24);
      if (v3 == -1)
      {
LABEL_11:
        *(_OWORD *)uint64_t v6 = v11;
        *(void *)(v6 + 16) = v12;
        *(_DWORD *)(v6 + 24) = 2;
        return result;
      }
    }
    else
    {
      long long v11 = *a3;
      uint64_t v12 = *((void *)a3 + 2);
      if (v3 == -1) {
        goto LABEL_11;
      }
    }
    uint64_t result = (void **)((uint64_t (*)(char *, uint64_t))off_270446578[v3])(&v13, v6);
    goto LABEL_11;
  }
  if ((long long *)a2 != a3)
  {
    char v4 = *((unsigned char *)a3 + 23);
    if (*(char *)(a2 + 23) < 0)
    {
      if (v4 >= 0) {
        uint64_t v7 = a3;
      }
      else {
        uint64_t v7 = *(long long **)a3;
      }
      if (v4 >= 0) {
        size_t v8 = *((unsigned __int8 *)a3 + 23);
      }
      else {
        size_t v8 = *((void *)a3 + 1);
      }
      return sub_255154EC0((void **)a2, v7, v8);
    }
    else if ((*((unsigned char *)a3 + 23) & 0x80) != 0)
    {
      uint64_t v10 = *(void **)a3;
      size_t v9 = *((void *)a3 + 1);
      return (void **)sub_255154DF8((void *)a2, v10, v9);
    }
    else
    {
      long long v5 = *a3;
      *(void *)(a2 + 16) = *((void *)a3 + 2);
      *(_OWORD *)a2 = v5;
    }
  }
  return result;
}

uint64_t sub_255159CE0(uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      int v3 = (void **)*v2;
      uint64_t v4 = *((unsigned int *)v2 + 16);
      if (v4 != -1) {
        ((void (*)(char *, void **))off_270446578[v4])(&v7, v2 + 5);
      }
      *((_DWORD *)v2 + 16) = -1;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  long long v5 = *(void **)a1;
  *(void *)a1 = 0;
  if (v5) {
    operator delete(v5);
  }
  return a1;
}

unsigned __int8 *sub_255159D90(uint64_t a1, uint64_t a2, uint64_t a3, long long **a4)
{
  uint64_t v6 = (unsigned char *)a2;
  unint64_t v8 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v9 = v8;
  }
  unint64_t v10 = sub_25515A1A8((uint64_t)v40, (uint64_t *)a2, v9);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }
    int v15 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v15)
    {
      uint64_t v16 = (unsigned __int8 *)*v15;
      if (*v15)
      {
        char v17 = v6[23];
        if (v17 >= 0) {
          uint64_t v18 = v6[23];
        }
        else {
          uint64_t v18 = *((void *)v6 + 1);
        }
        if (v17 < 0) {
          uint64_t v6 = *(unsigned char **)v6;
        }
        do
        {
          unint64_t v19 = *((void *)v16 + 1);
          if (v19 == v11)
          {
            uint64_t v20 = v16[39];
            if ((v20 & 0x80u) == 0) {
              uint64_t v21 = v16[39];
            }
            else {
              uint64_t v21 = *((void *)v16 + 3);
            }
            if (v21 == v18)
            {
              if ((v20 & 0x80) != 0)
              {
                if (!memcmp(*((const void **)v16 + 2), v6, *((void *)v16 + 3))) {
                  return v16;
                }
              }
              else
              {
                if (!v16[39]) {
                  return v16;
                }
                uint64_t v22 = 0;
                while (v16[v22 + 16] == v6[v22])
                {
                  if (v20 == ++v22) {
                    return v16;
                  }
                }
              }
            }
          }
          else
          {
            if (v14 <= 1)
            {
              v19 &= v12 - 1;
            }
            else if (v19 >= v12)
            {
              v19 %= v12;
            }
            if (v19 != v4) {
              break;
            }
          }
          uint64_t v16 = *(unsigned __int8 **)v16;
        }
        while (v16);
      }
    }
  }
  uint64_t v23 = (void *)(a1 + 16);
  uint64_t v16 = (unsigned __int8 *)operator new(0x48uLL);
  v40[0] = v16;
  v40[1] = a1 + 16;
  *(void *)uint64_t v16 = 0;
  *((void *)v16 + 1) = v11;
  uint64_t v24 = *a4;
  long long v25 = **a4;
  *((void *)v16 + 4) = *((void *)*a4 + 2);
  *((_OWORD *)v16 + 1) = v25;
  *((void *)v24 + 1) = 0;
  *((void *)v24 + 2) = 0;
  *(void *)uint64_t v24 = 0;
  v16[40] = 0;
  *((_DWORD *)v16 + 16) = 0;
  char v41 = 1;
  float v26 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v27 = *(float *)(a1 + 32);
  if (!v12 || (float)(v27 * (float)v12) < v26)
  {
    BOOL v28 = 1;
    if (v12 >= 3) {
      BOOL v28 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v29 = v28 | (2 * v12);
    unint64_t v30 = vcvtps_u32_f32(v26 / v27);
    if (v29 <= v30) {
      size_t prime = v30;
    }
    else {
      size_t prime = v29;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
    }
    int8x8_t v32 = *(int8x8_t *)(a1 + 8);
    if (prime > *(void *)&v32) {
      goto LABEL_49;
    }
    if (prime < *(void *)&v32)
    {
      unint64_t v33 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(void *)&v32 < 3uLL || (uint8x8_t v34 = (uint8x8_t)vcnt_s8(v32), v34.i16[0] = vaddlv_u8(v34), v34.u32[0] > 1uLL))
      {
        unint64_t v33 = std::__next_prime(v33);
      }
      else
      {
        uint64_t v35 = 1 << -(char)__clz(v33 - 1);
        if (v33 >= 2) {
          unint64_t v33 = v35;
        }
      }
      if (prime <= v33) {
        size_t prime = v33;
      }
      if (prime < *(void *)&v32) {
LABEL_49:
      }
        sub_25515A5E0(a1, prime);
    }
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        unint64_t v4 = v11 % v12;
      }
      else {
        unint64_t v4 = v11;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v11;
    }
  }
  uint64_t v36 = *(void *)a1;
  uint64_t v37 = *(void **)(*(void *)a1 + 8 * v4);
  if (v37)
  {
    *(void *)uint64_t v16 = *v37;
LABEL_73:
    void *v37 = v16;
    goto LABEL_74;
  }
  *(void *)uint64_t v16 = *v23;
  *uint64_t v23 = v16;
  *(void *)(v36 + 8 * v4) = v23;
  if (*(void *)v16)
  {
    unint64_t v38 = *(void *)(*(void *)v16 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v38 >= v12) {
        v38 %= v12;
      }
    }
    else
    {
      v38 &= v12 - 1;
    }
    uint64_t v37 = (void *)(*(void *)a1 + 8 * v38);
    goto LABEL_73;
  }
LABEL_74:
  ++*(void *)(a1 + 24);
  return v16;
}

void sub_25515A108(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25515A120((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_25515A120(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16))
    {
      uint64_t v3 = *(unsigned int *)(v2 + 64);
      if (v3 != -1) {
        ((void (*)(char *, uint64_t))off_270446578[v3])(&v5, v2 + 40);
      }
      *(_DWORD *)(v2 + 64) = -1;
      if (*(char *)(v2 + 39) < 0) {
        operator delete(*(void **)(v2 + 16));
      }
    }
    operator delete((void *)v2);
  }
  return a1;
}

unint64_t sub_25515A1A8(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 <= 0x40)
    {
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v7 = *a2 - 0x3C5A37A36834CED9 * (v6 + a3);
      uint64_t v9 = a2[2];
      uint64_t v8 = a2[3];
      uint64_t v10 = __ROR8__(v7 + v8, 52);
      uint64_t v11 = v7 + a2[1];
      uint64_t v12 = __ROR8__(v11, 7);
      uint64_t v13 = v11 + v9;
      uint64_t v14 = *(uint64_t *)((char *)a2 + a3 - 32) + v9;
      uint64_t v15 = *(uint64_t *)((char *)a2 + a3 - 8) + v8;
      uint64_t v16 = __ROR8__(v15 + v14, 52);
      uint64_t v17 = v12 + __ROR8__(*a2 - 0x3C5A37A36834CED9 * (v6 + a3), 37) + v10 + __ROR8__(v13, 31);
      uint64_t v18 = *(uint64_t *)((char *)a2 + a3 - 24) + v14 + v6;
      uint64_t v19 = v18 + v15;
      unint64_t v20 = 0x9AE16A3B2F90404FLL;
      unint64_t v21 = 0xC3A5C85C97CB3127 * (v19 + v17)
          - 0x651E95C4D06FBFB1
          * (v13
           + v8
           + __ROR8__(v14, 37)
           + __ROR8__(*(uint64_t *)((char *)a2 + a3 - 24) + v14, 7)
           + v16
           + __ROR8__(v18, 31));
      unint64_t v22 = v17 - 0x3C5A37A36834CED9 * (v21 ^ (v21 >> 47));
      return (v22 ^ (v22 >> 47)) * v20;
    }
    uint64_t v29 = *(uint64_t *)((char *)a2 + a3 - 48);
    uint64_t v30 = *(uint64_t *)((char *)a2 + a3 - 40);
    uint64_t v31 = *(uint64_t *)((char *)a2 + a3 - 24);
    uint64_t v33 = *(uint64_t *)((char *)a2 + a3 - 64);
    uint64_t v32 = *(uint64_t *)((char *)a2 + a3 - 56);
    uint64_t v34 = *(uint64_t *)((char *)a2 + a3 - 16);
    uint64_t v35 = *(uint64_t *)((char *)a2 + a3 - 8);
    unint64_t v36 = v32 + v34;
    unint64_t v37 = 0x9DDFEA08EB382D69
        * (v31 ^ ((0x9DDFEA08EB382D69 * (v31 ^ (v29 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v31 ^ (v29 + a3))));
    unint64_t v38 = 0x9DDFEA08EB382D69 * (v37 ^ (v37 >> 47));
    unint64_t v39 = v33 + a3 + v32 + v29;
    uint64_t v40 = v39 + v30;
    unint64_t v41 = __ROR8__(v39, 44) + v33 + a3 + __ROR8__(v30 + v33 + a3 - 0x622015F714C7D297 * (v37 ^ (v37 >> 47)), 21);
    uint64_t v42 = v32 + v34 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
    uint64_t v43 = v42 + v31 + v34;
    uint64_t v44 = __ROR8__(v43, 44);
    uint64_t v45 = v43 + v35;
    uint64_t v46 = v44 + v42 + __ROR8__(v42 + v30 + v35, 21);
    uint64_t v48 = *a2;
    int v47 = a2 + 4;
    unint64_t v49 = v48 - 0x4B6D499041670D8DLL * v30;
    uint64_t v50 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
    do
    {
      uint64_t v51 = *(v47 - 3);
      uint64_t v52 = v49 + v40 + v36 + v51;
      uint64_t v53 = v47[2];
      uint64_t v54 = v47[3];
      uint64_t v55 = v47[1];
      unint64_t v36 = v55 + v40 - 0x4B6D499041670D8DLL * __ROR8__(v36 + v41 + v53, 42);
      uint64_t v56 = v38 + v45;
      uint64_t v57 = *(v47 - 2);
      uint64_t v58 = *(v47 - 1);
      uint64_t v59 = *(v47 - 4) - 0x4B6D499041670D8DLL * v41;
      uint64_t v60 = v59 + v45 + v58;
      uint64_t v61 = v59 + v51 + v57;
      uint64_t v40 = v61 + v58;
      uint64_t v62 = __ROR8__(v61, 44) + v59;
      unint64_t v63 = (0xB492B66FBE98F273 * __ROR8__(v52, 37)) ^ v46;
      unint64_t v49 = 0xB492B66FBE98F273 * __ROR8__(v56, 33);
      unint64_t v41 = v62 + __ROR8__(v60 + v63, 21);
      unint64_t v64 = v49 + v46 + *v47;
      uint64_t v45 = v64 + v55 + v53 + v54;
      uint64_t v46 = __ROR8__(v64 + v55 + v53, 44) + v64 + __ROR8__(v36 + v57 + v64 + v54, 21);
      v47 += 8;
      unint64_t v38 = v63;
      v50 += 64;
    }
    while (v50);
    unint64_t v65 = v49
        - 0x622015F714C7D297
        * ((0x9DDFEA08EB382D69
          * (v46 ^ ((0x9DDFEA08EB382D69 * (v46 ^ v41)) >> 47) ^ (0x9DDFEA08EB382D69 * (v46 ^ v41)))) ^ ((0x9DDFEA08EB382D69 * (v46 ^ ((0x9DDFEA08EB382D69 * (v46 ^ v41)) >> 47) ^ (0x9DDFEA08EB382D69 * (v46 ^ v41)))) >> 47));
    unint64_t v66 = 0x9DDFEA08EB382D69
        * (v65 ^ (v63
                - 0x4B6D499041670D8DLL * (v36 ^ (v36 >> 47))
                - 0x622015F714C7D297
                * ((0x9DDFEA08EB382D69
                  * (v45 ^ ((0x9DDFEA08EB382D69 * (v45 ^ v40)) >> 47) ^ (0x9DDFEA08EB382D69 * (v45 ^ v40)))) ^ ((0x9DDFEA08EB382D69 * (v45 ^ ((0x9DDFEA08EB382D69 * (v45 ^ v40)) >> 47) ^ (0x9DDFEA08EB382D69 * (v45 ^ v40)))) >> 47))));
    return 0x9DDFEA08EB382D69
         * ((0x9DDFEA08EB382D69 * (v65 ^ (v66 >> 47) ^ v66)) ^ ((0x9DDFEA08EB382D69 * (v65 ^ (v66 >> 47) ^ v66)) >> 47));
  }
  else
  {
    if (a3 > 0x10)
    {
      uint64_t v23 = a2[1];
      unint64_t v24 = 0xB492B66FBE98F273 * *a2;
      uint64_t v25 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a2 + a3 - 8), 30) + __ROR8__(v24 - v23, 43);
      unint64_t v26 = v24
          + a3
          + __ROR8__(v23 ^ 0xC949D7C7509E6557, 20)
          - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v20 = 0x9DDFEA08EB382D69;
      unint64_t v27 = 0x9DDFEA08EB382D69 * ((v25 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a2 + a3 - 16)) ^ v26);
      unint64_t v28 = v26 ^ (v27 >> 47) ^ v27;
LABEL_8:
      unint64_t v22 = 0x9DDFEA08EB382D69 * v28;
      return (v22 ^ (v22 >> 47)) * v20;
    }
    if (a3 >= 9)
    {
      uint64_t v3 = *(uint64_t *)((char *)a2 + a3 - 8);
      uint64_t v4 = __ROR8__(v3 + a3, a3);
      return (0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69
              * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *a2)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *a2)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *a2)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *a2)))) >> 47))) ^ v3;
    }
    if (a3 >= 4)
    {
      uint64_t v67 = *(unsigned int *)((char *)a2 + a3 - 4);
      unint64_t v20 = 0x9DDFEA08EB382D69;
      unint64_t v68 = 0x9DDFEA08EB382D69 * (((8 * *(_DWORD *)a2) + a3) ^ v67);
      unint64_t v28 = v67 ^ (v68 >> 47) ^ v68;
      goto LABEL_8;
    }
    unint64_t result = 0x9AE16A3B2F90404FLL;
    if (a3)
    {
      unint64_t v69 = (0xC949D7C7509E6557 * (a3 + 4 * *((unsigned __int8 *)a2 + a3 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                     * (*(unsigned __int8 *)a2 | ((unint64_t)*((unsigned __int8 *)a2 + (a3 >> 1)) << 8)));
      return 0x9AE16A3B2F90404FLL * (v69 ^ (v69 >> 47));
    }
  }
  return result;
}

void sub_25515A5E0(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_25514DDFC();
    }
    uint64_t v4 = operator new(8 * a2);
    char v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      uint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v13 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v13 >= a2) {
              v13 %= a2;
            }
          }
          else
          {
            v13 &= a2 - 1;
          }
          if (v13 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v13))
            {
              *(void *)(*(void *)a1 + 8 * v13) = v7;
              goto LABEL_19;
            }
            void *v7 = *v11;
            uint64_t v12 = 8 * v13;
            *uint64_t v11 = **(void **)(*(void *)a1 + v12);
            **(void **)(*(void *)a1 + v12) = v11;
            uint64_t v11 = v7;
          }
          unint64_t v13 = v8;
LABEL_19:
          uint64_t v7 = v11;
          uint64_t v11 = (void *)*v11;
          unint64_t v8 = v13;
        }
        while (v11);
      }
    }
  }
  else
  {
    uint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

uint64_t *sub_25515A740(uint64_t a1, uint64_t a2, uint64_t a3, long long **a4)
{
  uint64_t v6 = (unsigned char *)a2;
  unint64_t v8 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v9 = v8;
  }
  unint64_t v10 = sub_25515A1A8((uint64_t)v40, (uint64_t *)a2, v9);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }
    uint64_t v15 = *(uint64_t ***)(*(void *)a1 + 8 * v4);
    if (v15)
    {
      uint64_t v16 = *v15;
      if (*v15)
      {
        char v17 = v6[23];
        if (v17 >= 0) {
          uint64_t v18 = v6[23];
        }
        else {
          uint64_t v18 = *((void *)v6 + 1);
        }
        if (v17 < 0) {
          uint64_t v6 = *(unsigned char **)v6;
        }
        do
        {
          unint64_t v19 = v16[1];
          if (v19 == v11)
          {
            uint64_t v20 = *((unsigned __int8 *)v16 + 39);
            if ((v20 & 0x80u) == 0) {
              uint64_t v21 = *((unsigned __int8 *)v16 + 39);
            }
            else {
              uint64_t v21 = v16[3];
            }
            if (v21 == v18)
            {
              if ((v20 & 0x80) != 0)
              {
                if (!memcmp((const void *)v16[2], v6, v16[3])) {
                  return v16;
                }
              }
              else
              {
                if (!*((unsigned char *)v16 + 39)) {
                  return v16;
                }
                uint64_t v22 = 0;
                while (*((unsigned __int8 *)v16 + v22 + 16) == v6[v22])
                {
                  if (v20 == ++v22) {
                    return v16;
                  }
                }
              }
            }
          }
          else
          {
            if (v14 <= 1)
            {
              v19 &= v12 - 1;
            }
            else if (v19 >= v12)
            {
              v19 %= v12;
            }
            if (v19 != v4) {
              break;
            }
          }
          uint64_t v16 = (uint64_t *)*v16;
        }
        while (v16);
      }
    }
  }
  uint64_t v23 = (char *)operator new(0x48uLL);
  v40[0] = v23;
  v40[1] = a1 + 16;
  char v41 = 0;
  *(void *)uint64_t v23 = 0;
  *((void *)v23 + 1) = v11;
  unint64_t v24 = v23 + 16;
  uint64_t v25 = *a4;
  if (*((char *)*a4 + 23) < 0)
  {
    sub_2551501FC(v24, *(void **)v25, *((void *)v25 + 1));
  }
  else
  {
    long long v26 = *v25;
    *((void *)v23 + 4) = *((void *)v25 + 2);
    *(_OWORD *)unint64_t v24 = v26;
  }
  v23[40] = 0;
  *((_DWORD *)v23 + 16) = 0;
  char v41 = 1;
  float v27 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v28 = *(float *)(a1 + 32);
  if (!v12 || (float)(v28 * (float)v12) < v27)
  {
    BOOL v29 = 1;
    if (v12 >= 3) {
      BOOL v29 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v30 = v29 | (2 * v12);
    unint64_t v31 = vcvtps_u32_f32(v27 / v28);
    if (v30 <= v31) {
      size_t prime = v31;
    }
    else {
      size_t prime = v30;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
    }
    int8x8_t v33 = *(int8x8_t *)(a1 + 8);
    if (prime > *(void *)&v33) {
      goto LABEL_52;
    }
    if (prime < *(void *)&v33)
    {
      unint64_t v34 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(void *)&v33 < 3uLL || (uint8x8_t v35 = (uint8x8_t)vcnt_s8(v33), v35.i16[0] = vaddlv_u8(v35), v35.u32[0] > 1uLL))
      {
        unint64_t v34 = std::__next_prime(v34);
      }
      else
      {
        uint64_t v36 = 1 << -(char)__clz(v34 - 1);
        if (v34 >= 2) {
          unint64_t v34 = v36;
        }
      }
      if (prime <= v34) {
        size_t prime = v34;
      }
      if (prime < *(void *)&v33) {
LABEL_52:
      }
        sub_25515A5E0(a1, prime);
    }
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        unint64_t v4 = v11 % v12;
      }
      else {
        unint64_t v4 = v11;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v11;
    }
  }
  unint64_t v37 = *(void **)(*(void *)a1 + 8 * v4);
  if (v37)
  {
    *(void *)v40[0] = *v37;
    void *v37 = v40[0];
  }
  else
  {
    *(void *)v40[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v40[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v40[0])
    {
      unint64_t v38 = *(void *)(*(void *)v40[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v38 >= v12) {
          v38 %= v12;
        }
      }
      else
      {
        v38 &= v12 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v38) = v40[0];
    }
  }
  uint64_t v16 = (uint64_t *)v40[0];
  ++*(void *)(a1 + 24);
  return v16;
}

void sub_25515AAE0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25515A120((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_25515AAFC(uint64_t *a1, long long *a2, int a3)
{
  uint64_t v6 = MEMORY[0x263F8C338] + 64;
  a1[15] = MEMORY[0x263F8C338] + 64;
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = *(void *)(MEMORY[0x263F8C2C0] + 16);
  uint64_t v9 = *(void *)(MEMORY[0x263F8C2C0] + 8);
  *a1 = v9;
  *(uint64_t *)((char *)a1 + *(void *)(v9 - 24)) = v8;
  a1[1] = 0;
  unint64_t v10 = (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24));
  std::ios_base::init(v10, a1 + 2);
  uint64_t v11 = MEMORY[0x263F8C338] + 24;
  v10[1].__vftable = 0;
  v10[1].__fmtflags_ = -1;
  *a1 = v11;
  a1[15] = v6;
  sub_25515AD84(v7, a2, a3 | 8);
  return a1;
}

void sub_25515AC58(_Unwind_Exception *a1)
{
  std::istream::~istream();
  MEMORY[0x25A288F40](v1);
  _Unwind_Resume(a1);
}

uint64_t sub_25515AC80(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2C0];
  uint64_t v3 = *MEMORY[0x263F8C2C0];
  *(void *)a1 = *MEMORY[0x263F8C2C0];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 16) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 103) < 0) {
    operator delete(*(void **)(a1 + 80));
  }
  std::streambuf::~streambuf();
  std::istream::~istream();
  MEMORY[0x25A288F40](a1 + 120);
  return a1;
}

uint64_t sub_25515AD84(uint64_t a1, long long *a2, int a3)
{
  uint64_t v6 = std::streambuf::basic_streambuf();
  *(void *)uint64_t v6 = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_DWORD *)(v6 + 96) = a3;
  if ((long long *)(v6 + 64) != a2)
  {
    if (*((char *)a2 + 23) < 0)
    {
      sub_255154DF8((void *)(v6 + 64), *(void **)a2, *((void *)a2 + 1));
    }
    else
    {
      long long v7 = *a2;
      *(void *)(v6 + 80) = *((void *)a2 + 2);
      *(_OWORD *)(v6 + 64) = v7;
    }
  }
  sub_25515AE48(a1);
  return a1;
}

void sub_25515AE24(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 87) < 0) {
    operator delete(*v2);
  }
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

std::string *sub_25515AE48(uint64_t a1)
{
  *(void *)(a1 + 88) = 0;
  unint64_t result = (std::string *)(a1 + 64);
  unint64_t v3 = *(unsigned __int8 *)(a1 + 87);
  if ((*(char *)(a1 + 87) & 0x80000000) == 0)
  {
    unint64_t v4 = result;
    unint64_t v5 = *(unsigned __int8 *)(a1 + 87);
    int v6 = *(_DWORD *)(a1 + 96);
    if ((v6 & 8) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  unint64_t v4 = *(std::string **)(a1 + 64);
  unint64_t v5 = *(void *)(a1 + 72);
  int v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
LABEL_3:
    *(void *)(a1 + 88) = (char *)v4 + v5;
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = (char *)v4 + v5;
  }
LABEL_4:
  if ((v6 & 0x10) == 0) {
    return result;
  }
  *(void *)(a1 + 88) = (char *)v4 + v5;
  if ((v3 & 0x80) != 0)
  {
    unint64_t v3 = *(void *)(a1 + 72);
    unint64_t v7 = (*(void *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v3 >= v7)
    {
      unint64_t result = *(std::string **)(a1 + 64);
      *(void *)(a1 + 72) = v7;
LABEL_14:
      result->__r_.__value_.__s.__data_[v7] = 0;
      LODWORD(v8) = *(char *)(a1 + 87);
      if ((v8 & 0x80000000) != 0) {
        goto LABEL_15;
      }
LABEL_12:
      uint64_t v8 = v8;
      goto LABEL_16;
    }
  }
  else
  {
    unint64_t v7 = 22;
    if (v3 > 0x15)
    {
      *(unsigned char *)(a1 + 87) = 22;
      goto LABEL_14;
    }
  }
  unint64_t result = std::string::append(result, v7 - v3, 0);
  LODWORD(v8) = *(char *)(a1 + 87);
  if ((v8 & 0x80000000) == 0) {
    goto LABEL_12;
  }
LABEL_15:
  uint64_t v8 = *(void *)(a1 + 72);
LABEL_16:
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = v4;
  *(void *)(a1 + 56) = (char *)v4 + v8;
  if ((*(unsigned char *)(a1 + 96) & 3) != 0)
  {
    if (v5 >> 31)
    {
      uint64_t v9 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
      unint64_t v10 = 0x7FFFFFFF * ((v9 + ((v5 - 0x80000000 - v9) >> 1)) >> 30);
      unint64_t v4 = (std::string *)((char *)v4 + v10 + 0x7FFFFFFF);
      unint64_t v5 = v5 - v10 - 0x7FFFFFFF;
      *(void *)(a1 + 48) = v4;
    }
    if (v5) {
      *(void *)(a1 + 48) = (char *)v4 + v5;
    }
  }
  return result;
}

uint64_t *sub_25515AF90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5 = (unsigned char *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v8 = v7;
  }
  unint64_t v9 = sub_25515A1A8((uint64_t)v35, (uint64_t *)a2, v8);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v3 = v9;
      if (v9 >= v11) {
        unint64_t v3 = v9 % v11;
      }
    }
    else
    {
      unint64_t v3 = (v11 - 1) & v9;
    }
    unint64_t v14 = *(uint64_t ***)(*(void *)a1 + 8 * v3);
    if (v14)
    {
      uint64_t v15 = *v14;
      if (*v14)
      {
        char v16 = v5[23];
        if (v16 >= 0) {
          uint64_t v17 = v5[23];
        }
        else {
          uint64_t v17 = *((void *)v5 + 1);
        }
        if (v16 < 0) {
          unint64_t v5 = *(unsigned char **)v5;
        }
        do
        {
          unint64_t v18 = v15[1];
          if (v18 == v10)
          {
            uint64_t v19 = *((unsigned __int8 *)v15 + 39);
            if ((v19 & 0x80u) == 0) {
              uint64_t v20 = *((unsigned __int8 *)v15 + 39);
            }
            else {
              uint64_t v20 = v15[3];
            }
            if (v20 == v17)
            {
              if ((v19 & 0x80) != 0)
              {
                if (!memcmp((const void *)v15[2], v5, v15[3])) {
                  return v15;
                }
              }
              else
              {
                if (!*((unsigned char *)v15 + 39)) {
                  return v15;
                }
                uint64_t v21 = 0;
                while (*((unsigned __int8 *)v15 + v21 + 16) == v5[v21])
                {
                  if (v19 == ++v21) {
                    return v15;
                  }
                }
              }
            }
          }
          else
          {
            if (v13 <= 1)
            {
              v18 &= v11 - 1;
            }
            else if (v18 >= v11)
            {
              v18 %= v11;
            }
            if (v18 != v3) {
              break;
            }
          }
          uint64_t v15 = (uint64_t *)*v15;
        }
        while (v15);
      }
    }
  }
  sub_25515B310(a1, v10, a3, (uint64_t)v35);
  float v22 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v23 = *(float *)(a1 + 32);
  if (!v11 || (float)(v23 * (float)v11) < v22)
  {
    BOOL v24 = 1;
    if (v11 >= 3) {
      BOOL v24 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v25 = v24 | (2 * v11);
    unint64_t v26 = vcvtps_u32_f32(v22 / v23);
    if (v25 <= v26) {
      size_t prime = v26;
    }
    else {
      size_t prime = v25;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
    }
    int8x8_t v28 = *(int8x8_t *)(a1 + 8);
    if (prime > *(void *)&v28) {
      goto LABEL_49;
    }
    if (prime < *(void *)&v28)
    {
      unint64_t v29 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(void *)&v28 < 3uLL || (uint8x8_t v30 = (uint8x8_t)vcnt_s8(v28), v30.i16[0] = vaddlv_u8(v30), v30.u32[0] > 1uLL))
      {
        unint64_t v29 = std::__next_prime(v29);
      }
      else
      {
        uint64_t v31 = 1 << -(char)__clz(v29 - 1);
        if (v29 >= 2) {
          unint64_t v29 = v31;
        }
      }
      if (prime <= v29) {
        size_t prime = v29;
      }
      if (prime < *(void *)&v28) {
LABEL_49:
      }
        sub_25515A5E0(a1, prime);
    }
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v3 = v10 % v11;
      }
      else {
        unint64_t v3 = v10;
      }
    }
    else
    {
      unint64_t v3 = (v11 - 1) & v10;
    }
  }
  uint64_t v32 = *(void **)(*(void *)a1 + 8 * v3);
  if (v32)
  {
    *(void *)v35[0] = *v32;
    void *v32 = v35[0];
  }
  else
  {
    *(void *)v35[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v35[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v35[0])
    {
      unint64_t v33 = *(void *)(*(void *)v35[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v33 >= v11) {
          v33 %= v11;
        }
      }
      else
      {
        v33 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v33) = v35[0];
    }
  }
  uint64_t v15 = (uint64_t *)v35[0];
  ++*(void *)(a1 + 24);
  return v15;
}

void sub_25515B2F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25515A120((uint64_t *)va);
  _Unwind_Resume(a1);
}

unsigned char *sub_25515B310@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = (char *)operator new(0x48uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)unint64_t v8 = 0;
  *((void *)v8 + 1) = a2;
  unint64_t result = v8 + 16;
  if (*(char *)(a3 + 23) < 0)
  {
    unint64_t result = sub_2551501FC(result, *(void **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)unint64_t result = *(_OWORD *)a3;
    *((void *)v8 + 4) = *(void *)(a3 + 16);
  }
  v8[40] = 0;
  *((_DWORD *)v8 + 16) = -1;
  uint64_t v10 = *(unsigned int *)(a3 + 48);
  if (v10 != -1)
  {
    unint64_t result = (unsigned char *)((uint64_t (*)(char *))off_2704465C0[v10])(&v11);
    *((_DWORD *)v8 + 16) = v10;
  }
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_25515B3D0(_Unwind_Exception *a1)
{
  sub_25515A120(v1);
  _Unwind_Resume(a1);
}

void sub_25515B3E8(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  *a2 = *a3;
}

void sub_25515B3F4(uint64_t a1, void *a2, void *a3)
{
  *a2 = *a3;
}

__n128 sub_25515B400(uint64_t a1, __n128 *a2, __n128 *a3)
{
  __n128 result = *a3;
  a2[1].n128_u64[0] = a3[1].n128_u64[0];
  *a2 = result;
  a3->n128_u64[1] = 0;
  a3[1].n128_u64[0] = 0;
  a3->n128_u64[0] = 0;
  return result;
}

void sub_25515B420(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v5 = (void *)(a1 + 8);
  int v6 = sub_25515CCB8((void *)(a1 + 8), a2);
  if (v6) {
    goto LABEL_18;
  }
  int v7 = *(char *)(a2 + 23);
  if (v7 >= 0) {
    size_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v8 = *(void *)(a2 + 8);
  }
  unint64_t v9 = v8 + 2;
  if (v8 + 2 >= 0x7FFFFFFFFFFFFFF8) {
    sub_25514C40C();
  }
  if (v9 >= 0x17)
  {
    uint64_t v11 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17) {
      uint64_t v11 = v9 | 7;
    }
    uint64_t v12 = v11 + 1;
    unint64_t v13 = (char *)operator new(v11 + 1);
    size_t v19 = v8 + 2;
    unint64_t v20 = v12 | 0x8000000000000000;
    std::string __p = v13;
    *(_WORD *)unint64_t v13 = 11565;
    uint64_t v10 = v13 + 2;
  }
  else
  {
    size_t v19 = 0;
    unint64_t v20 = 0;
    HIBYTE(v20) = v8 + 2;
    uint64_t v10 = (char *)&__p + 2;
    std::string __p = (void *)11565;
    if (!v8) {
      goto LABEL_16;
    }
  }
  if (v7 >= 0) {
    unint64_t v14 = (const char *)a2;
  }
  else {
    unint64_t v14 = *(const char **)a2;
  }
  memmove(v10, v14, v8);
LABEL_16:
  v10[v8] = 0;
  uint64_t v15 = sub_25515CCB8(v5, (uint64_t)&__p);
  int v6 = v15;
  if (SHIBYTE(v20) < 0)
  {
    operator delete(__p);
    if (v6)
    {
LABEL_18:
      *(unsigned char *)a3 = 0;
      *(_DWORD *)(a3 + 24) = -1;
      uint64_t v16 = *((unsigned int *)v6 + 16);
      if (v16 != -1)
      {
        ((void (*)(char *, uint64_t, uint64_t *))off_2704465F0[v16])(&v21, a3, v6 + 5);
        *(_DWORD *)(a3 + 24) = v16;
      }
      return;
    }
  }
  else if (v15)
  {
    goto LABEL_18;
  }
  if (*(char *)(a2 + 23) >= 0) {
    uint64_t v17 = (const char *)a2;
  }
  else {
    uint64_t v17 = *(const char **)a2;
  }
  fprintf((FILE *)*MEMORY[0x263EF8348], "ICE: option '%s' not found.\n", v17);
  *(unsigned char *)a3 = 0;
  *(_DWORD *)(a3 + 24) = 0;
}

void sub_25515B5BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_25515B5D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t v13 = *(unsigned int *)(v11 + 24);
  if (v13 != -1) {
    ((void (*)(char *, uint64_t))off_2704465D8[v13])(&a11, v11);
  }
  *(_DWORD *)(v11 + 24) = -1;
  _Unwind_Resume(exception_object);
}

uint64_t sub_25515B614(uint64_t a1, uint64_t a2)
{
  sub_25515B420(a1, a2, (uint64_t)v3);
  if (v4) {
    sub_25515C9C8();
  }
  return v3[0];
}

void sub_25515B654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_25515B668(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 24);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))off_2704465D8[v2])(&v4, a1);
  }
  *(_DWORD *)(a1 + 24) = -1;
  return a1;
}

uint64_t sub_25515B6C4(uint64_t a1, uint64_t a2)
{
  sub_25515B420(a1, a2, (uint64_t)v3);
  if (v4 != 1) {
    sub_25515C9C8();
  }
  return v3[0];
}

void sub_25515B708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

double sub_25515B71C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_25515B420(a1, a2, (uint64_t)&v5);
  if (v7 != 2) {
    sub_25515C9C8();
  }
  double result = *(double *)&v5;
  *(_OWORD *)a3 = v5;
  *(void *)(a3 + 16) = v6;
  return result;
}

void sub_25515B770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_25515B784(char **a1, long long *a2)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  int v4 = a1 + 7;
  uint64_t v31 = (uint64_t **)(a1 + 6);
  sub_255150008((uint64_t)(a1 + 6), a1[7]);
  *(v4 - 1) = v4;
  *int v4 = 0;
  v4[1] = 0;
  char v41 = 0;
  uint64_t v42 = 0;
  unint64_t v43 = 0;
  sub_25515AAFC((uint64_t *)v35, a2, 8);
  std::string::value_type v5 = 0;
  memset(&v34, 0, sizeof(v34));
  memset(&__p, 0, sizeof(__p));
  do
  {
    std::string::value_type v6 = std::istream::get();
    if (v6 <= 33)
    {
      if (v6 != -1)
      {
        if (v6 != 32 || v5)
        {
LABEL_3:
          std::string::append(&v34, 1uLL, v6);
          continue;
        }
        std::string::size_type size = HIBYTE(v34.__r_.__value_.__r.__words[2]);
        if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          std::string::size_type size = v34.__r_.__value_.__l.__size_;
        }
        if (!size)
        {
LABEL_21:
          std::string::value_type v5 = 0;
          continue;
        }
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        {
          sub_2551501FC(&__dst, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
          if ((*((unsigned char *)&v34.__r_.__value_.__s + 23) & 0x80) != 0) {
            goto LABEL_52;
          }
LABEL_19:
          std::string v48 = v34;
        }
        else
        {
          std::string __dst = __p;
          if ((*((unsigned char *)&v34.__r_.__value_.__s + 23) & 0x80) == 0) {
            goto LABEL_19;
          }
LABEL_52:
          sub_2551501FC(&v48, v34.__r_.__value_.__l.__data_, v34.__r_.__value_.__l.__size_);
        }
        unint64_t v14 = v42;
        if ((unint64_t)v42 >= v43)
        {
          uint64_t v42 = sub_25515CA18((void **)&v41, (uint64_t)&__dst);
          if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(v48.__r_.__value_.__l.__data_);
            if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
              goto LABEL_58;
            }
          }
          else if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          {
            goto LABEL_58;
          }
LABEL_55:
          operator delete(__dst.__r_.__value_.__l.__data_);
        }
        else
        {
          long long v15 = *(_OWORD *)&__dst.__r_.__value_.__l.__data_;
          *((void *)v42 + 2) = *((void *)&__dst.__r_.__value_.__l + 2);
          *(_OWORD *)unint64_t v14 = v15;
          memset(&__dst, 0, sizeof(__dst));
          std::string::size_type v16 = v48.__r_.__value_.__r.__words[2];
          *(_OWORD *)(v14 + 24) = *(_OWORD *)&v48.__r_.__value_.__l.__data_;
          *((void *)v14 + 5) = v16;
          memset(&v48, 0, sizeof(v48));
          uint64_t v42 = v14 + 48;
          if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
            goto LABEL_55;
          }
        }
LABEL_58:
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        {
          if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            uint64_t v17 = &v34;
          }
          else {
            uint64_t v17 = (std::string *)v34.__r_.__value_.__r.__words[0];
          }
          if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type v18 = HIBYTE(v34.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type v18 = v34.__r_.__value_.__l.__size_;
          }
          sub_255154EC0((void **)&__p.__r_.__value_.__l.__data_, v17, v18);
        }
        else
        {
          if ((*((unsigned char *)&v34.__r_.__value_.__s + 23) & 0x80) == 0)
          {
            std::string __p = v34;
LABEL_70:
            std::string::value_type v5 = 0;
LABEL_71:
            *((unsigned char *)&v34.__r_.__value_.__s + 23) = 0;
            v34.__r_.__value_.__s.__data_[0] = 0;
            continue;
          }
          sub_255154DF8(&__p, v34.__r_.__value_.__l.__data_, v34.__r_.__value_.__l.__size_);
        }
        if ((SHIBYTE(v34.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_70;
        }
        std::string::value_type v5 = 0;
        goto LABEL_73;
      }
    }
    else
    {
      if (v6 == 34 || v6 == 39)
      {
        if (v6 == v5) {
          goto LABEL_21;
        }
        if (v5) {
          goto LABEL_3;
        }
        std::string::value_type v5 = v6;
        continue;
      }
      if (v6 != 92) {
        goto LABEL_3;
      }
      std::string::value_type v6 = std::istream::get();
      if (v6 != -1) {
        goto LABEL_3;
      }
    }
    std::string::size_type v8 = HIBYTE(v34.__r_.__value_.__r.__words[2]);
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type v8 = v34.__r_.__value_.__l.__size_;
    }
    if (v8)
    {
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        sub_2551501FC(&__dst, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        if ((*((unsigned char *)&v34.__r_.__value_.__s + 23) & 0x80) != 0) {
          goto LABEL_30;
        }
LABEL_27:
        std::string v48 = v34;
      }
      else
      {
        std::string __dst = __p;
        if ((*((unsigned char *)&v34.__r_.__value_.__s + 23) & 0x80) == 0) {
          goto LABEL_27;
        }
LABEL_30:
        sub_2551501FC(&v48, v34.__r_.__value_.__l.__data_, v34.__r_.__value_.__l.__size_);
      }
      unint64_t v9 = v42;
      if ((unint64_t)v42 >= v43)
      {
        uint64_t v42 = sub_25515CA18((void **)&v41, (uint64_t)&__dst);
        if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v48.__r_.__value_.__l.__data_);
          if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_36;
          }
        }
        else if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
          goto LABEL_36;
        }
LABEL_33:
        operator delete(__dst.__r_.__value_.__l.__data_);
        goto LABEL_36;
      }
      long long v10 = *(_OWORD *)&__dst.__r_.__value_.__l.__data_;
      *((void *)v42 + 2) = *((void *)&__dst.__r_.__value_.__l + 2);
      *(_OWORD *)unint64_t v9 = v10;
      memset(&__dst, 0, sizeof(__dst));
      std::string::size_type v11 = v48.__r_.__value_.__r.__words[2];
      *(_OWORD *)(v9 + 24) = *(_OWORD *)&v48.__r_.__value_.__l.__data_;
      *((void *)v9 + 5) = v11;
      memset(&v48, 0, sizeof(v48));
      uint64_t v42 = v9 + 48;
      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
        goto LABEL_33;
      }
LABEL_36:
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v12 = &v34;
        }
        else {
          uint64_t v12 = (std::string *)v34.__r_.__value_.__r.__words[0];
        }
        if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v13 = HIBYTE(v34.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v13 = v34.__r_.__value_.__l.__size_;
        }
        sub_255154EC0((void **)&__p.__r_.__value_.__l.__data_, v12, v13);
      }
      else
      {
        if ((*((unsigned char *)&v34.__r_.__value_.__s + 23) & 0x80) == 0)
        {
          std::string __p = v34;
          goto LABEL_71;
        }
        sub_255154DF8(&__p, v34.__r_.__value_.__l.__data_, v34.__r_.__value_.__l.__size_);
      }
      if ((SHIBYTE(v34.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_71;
      }
LABEL_73:
      v34.__r_.__value_.__l.__size_ = 0;
      *v34.__r_.__value_.__l.__data_ = 0;
    }
  }
  while ((v37[*((void *)v35[0] - 3)] & 2) == 0);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    sub_2551501FC(&v45, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    std::string v45 = __p;
  }
  uint64_t v46 = (std::string *)"";
  sub_25515CBCC((uint64_t)&__dst, (long long *)&v45);
  size_t v19 = v42;
  if ((unint64_t)v42 < v43)
  {
    long long v20 = *(_OWORD *)&__dst.__r_.__value_.__l.__data_;
    *((void *)v42 + 2) = *((void *)&__dst.__r_.__value_.__l + 2);
    *(_OWORD *)size_t v19 = v20;
    *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = 0uLL;
    std::string::size_type v21 = v48.__r_.__value_.__r.__words[2];
    *(_OWORD *)(v19 + 24) = *(_OWORD *)&v48.__r_.__value_.__l.__data_;
    *((void *)v19 + 5) = v21;
    __dst.__r_.__value_.__r.__words[2] = 0;
    memset(&v48, 0, sizeof(v48));
    uint64_t v42 = v19 + 48;
    goto LABEL_87;
  }
  uint64_t v42 = sub_25515CA18((void **)&v41, (uint64_t)&__dst);
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v48.__r_.__value_.__l.__data_);
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_81;
    }
LABEL_87:
    if ((SHIBYTE(v45.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_88;
    }
LABEL_82:
    operator delete(v45.__r_.__value_.__l.__data_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_83;
    }
LABEL_89:
    if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
LABEL_84:
    }
      operator delete(v34.__r_.__value_.__l.__data_);
  }
  else
  {
    if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_87;
    }
LABEL_81:
    operator delete(__dst.__r_.__value_.__l.__data_);
    if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_82;
    }
LABEL_88:
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_89;
    }
LABEL_83:
    operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_84;
    }
  }
  v35[0] = *(void **)MEMORY[0x263F8C2C0];
  uint64_t v32 = v35[0];
  float v22 = *(void **)(MEMORY[0x263F8C2C0] + 24);
  *(void **)((char *)v35 + *((void *)v35[0] - 3)) = v22;
  uint64_t v36 = MEMORY[0x263F8C318] + 16;
  if (v39 < 0) {
    operator delete(v38);
  }
  std::streambuf::~streambuf();
  std::istream::~istream();
  MEMORY[0x25A288F40](v40);
  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_270446630;
  v48.__r_.__value_.__r.__words[0] = (std::string::size_type)&__dst;
  v45.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_270446678;
  uint64_t v46 = &v45;
  BOOL v24 = v41;
  float v23 = v42;
  if (v41 == v42)
  {
LABEL_149:
    (*(void (**)(std::string *))(v45.__r_.__value_.__r.__words[0] + 32))(&v45);
    goto LABEL_150;
  }
  char v25 = 0;
  while (2)
  {
    if (!v46) {
LABEL_168:
    }
      sub_255151E60();
    if (!(*(unsigned int (**)(std::string *, char *))(v46->__r_.__value_.__r.__words[0] + 48))(v46, v24))
    {
      if (!v48.__r_.__value_.__r.__words[0]) {
        goto LABEL_168;
      }
      if (!(*(unsigned int (**)(std::string::size_type, char *))(*(void *)v48.__r_.__value_.__l.__data_
                                                                           + 48))(v48.__r_.__value_.__r.__words[0], v24))goto LABEL_107;
      if (!v48.__r_.__value_.__r.__words[0]) {
        goto LABEL_168;
      }
      if (((*(uint64_t (**)(std::string::size_type, char *))(*(void *)v48.__r_.__value_.__l.__data_ + 48))(v48.__r_.__value_.__r.__words[0], v24 + 24) & 1) == 0)
      {
        if (v24[47] < 0)
        {
          if (!*((void *)v24 + 4)) {
            goto LABEL_134;
          }
        }
        else if (!v24[47])
        {
          goto LABEL_134;
        }
        if ((*((unsigned int (**)(char **, char *))*a1 + 3))(a1, v24))
        {
          (*((void (**)(char **, char *, char *))*a1 + 2))(a1, v24, v24 + 24);
LABEL_140:
          char v25 = 1;
          goto LABEL_96;
        }
      }
      else
      {
LABEL_107:
        if (!v48.__r_.__value_.__r.__words[0]) {
          goto LABEL_168;
        }
        if (!(*(unsigned int (**)(std::string::size_type, char *))(*(void *)v48.__r_.__value_.__l.__data_
                                                                             + 48))(v48.__r_.__value_.__r.__words[0], v24))goto LABEL_111;
        if (!v48.__r_.__value_.__r.__words[0]) {
          goto LABEL_168;
        }
        if (!(*(unsigned int (**)(std::string::size_type, char *))(*(void *)v48.__r_.__value_.__l.__data_
                                                                             + 48))(v48.__r_.__value_.__r.__words[0], v24 + 24))
        {
LABEL_111:
          if (!v48.__r_.__value_.__r.__words[0]) {
            goto LABEL_168;
          }
          if (((*(uint64_t (**)(std::string::size_type, char *))(*(void *)v48.__r_.__value_.__l.__data_
                                                                          + 48))(v48.__r_.__value_.__r.__words[0], v24) & 1) == 0)
          {
            if (!v48.__r_.__value_.__r.__words[0]) {
              goto LABEL_168;
            }
            if ((*(unsigned int (**)(std::string::size_type, char *))(*(void *)v48.__r_.__value_.__l.__data_
                                                                                + 48))(v48.__r_.__value_.__r.__words[0], v24 + 24))
            {
              if (v25) {
                goto LABEL_95;
              }
              if (v24[23] < 0)
              {
                if (!*((void *)v24 + 1)) {
                  goto LABEL_95;
                }
              }
              else if (!v24[23])
              {
                goto LABEL_95;
              }
LABEL_145:
              sub_25515D0A8(v31, (const void **)v24, (uint64_t)v24);
              goto LABEL_95;
            }
          }
          if (!v48.__r_.__value_.__r.__words[0]) {
            goto LABEL_168;
          }
          if (((*(uint64_t (**)(std::string::size_type, char *))(*(void *)v48.__r_.__value_.__l.__data_
                                                                          + 48))(v48.__r_.__value_.__r.__words[0], v24) & 1) != 0)goto LABEL_96;
          if (!v48.__r_.__value_.__r.__words[0]) {
            goto LABEL_168;
          }
          if (((*(uint64_t (**)(std::string::size_type, char *))(*(void *)v48.__r_.__value_.__l.__data_
                                                                          + 48))(v48.__r_.__value_.__r.__words[0], v24 + 24) & 1) != 0)goto LABEL_96;
          if (v24[23] < 0)
          {
            if (*((void *)v24 + 1)) {
              goto LABEL_144;
            }
          }
          else if (v24[23])
          {
            goto LABEL_144;
          }
          if (v24[47] < 0)
          {
            if (*((void *)v24 + 4)) {
              goto LABEL_139;
            }
          }
          else if (v24[47])
          {
LABEL_139:
            sub_25515D0A8(v31, (const void **)v24 + 3, (uint64_t)(v24 + 24));
            goto LABEL_140;
          }
LABEL_144:
          if (v25) {
            goto LABEL_95;
          }
          goto LABEL_145;
        }
      }
LABEL_134:
      HIBYTE(v36) = 4;
      strcpy((char *)v35, "true");
      (*((void (**)(char **, char *, void **))*a1 + 2))(a1, v24, v35);
      if (SHIBYTE(v36) < 0) {
        operator delete(v35[0]);
      }
      goto LABEL_95;
    }
    sub_25515AAFC((uint64_t *)v35, (long long *)v24, 8);
    memset(&v34, 0, sizeof(v34));
    memset(&__p, 0, sizeof(__p));
    sub_25515C610(v35, (uint64_t)&v34, 0x3Du);
    std::ios_base::getloc((const std::ios_base *)((char *)v35 + *((void *)v35[0] - 3)));
    unint64_t v26 = std::locale::use_facet(&v44, MEMORY[0x263F8C108]);
    unsigned __int8 v27 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v26->__vftable[2].~facet_0)(v26, 10);
    std::locale::~locale(&v44);
    sub_25515C610(v35, (uint64_t)&__p, v27);
    (*((void (**)(char **, std::string *, std::string *))*a1 + 2))(a1, &v34, &__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
        goto LABEL_127;
      }
    }
    else
    {
      if ((SHIBYTE(v34.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_101;
      }
LABEL_127:
      operator delete(v34.__r_.__value_.__l.__data_);
    }
LABEL_101:
    v35[0] = v32;
    *(void **)((char *)v35 + *((void *)v32 - 3)) = v22;
    uint64_t v36 = MEMORY[0x263F8C318] + 16;
    if (v39 < 0) {
      operator delete(v38);
    }
    std::streambuf::~streambuf();
    std::istream::~istream();
    MEMORY[0x25A288F40](v40);
LABEL_95:
    char v25 = 0;
LABEL_96:
    v24 += 48;
    if (v24 != v23) {
      continue;
    }
    break;
  }
  if (v46 == &v45) {
    goto LABEL_149;
  }
  if (v46) {
    (*(void (**)(void))(v46->__r_.__value_.__r.__words[0] + 40))();
  }
LABEL_150:
  if ((std::string *)v48.__r_.__value_.__l.__data_ == &__dst)
  {
    (*(void (**)(std::string *))(__dst.__r_.__value_.__r.__words[0] + 32))(&__dst);
    int8x8_t v28 = v41;
    if (!v41) {
      return;
    }
LABEL_156:
    unint64_t v29 = v42;
    uint8x8_t v30 = v28;
    if (v42 == v28)
    {
LABEL_164:
      uint64_t v42 = v28;
      operator delete(v30);
      return;
    }
    while (1)
    {
      if (*(v29 - 1) < 0)
      {
        operator delete(*((void **)v29 - 3));
        if (*(v29 - 25) < 0) {
          goto LABEL_162;
        }
      }
      else if (*(v29 - 25) < 0)
      {
LABEL_162:
        operator delete(*((void **)v29 - 6));
      }
      v29 -= 48;
      if (v29 == v28)
      {
        uint8x8_t v30 = v41;
        goto LABEL_164;
      }
    }
  }
  if (v48.__r_.__value_.__r.__words[0]) {
    (*(void (**)(void))(*(void *)v48.__r_.__value_.__l.__data_ + 40))();
  }
  int8x8_t v28 = v41;
  if (v41) {
    goto LABEL_156;
  }
}

void sub_25515C49C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  if (a24 < 0) {
    operator delete(a19);
  }
  sub_25515AC80((uint64_t)&a25);
  sub_25515C884((void **)(v30 - 208));
  _Unwind_Resume(a1);
}

uint64_t sub_25515C5C0(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
  {
    operator delete(*(void **)(a1 + 24));
    if ((*(char *)(a1 + 23) & 0x80000000) == 0) {
      return a1;
    }
LABEL_5:
    operator delete(*(void **)a1);
    return a1;
  }
  if (*(char *)(a1 + 23) < 0) {
    goto LABEL_5;
  }
  return a1;
}

void *sub_25515C610(void *a1, uint64_t a2, unsigned __int8 a3)
{
  MEMORY[0x25A288DB0](&v11, a1, 1);
  if (!v11) {
    return a1;
  }
  if (*(char *)(a2 + 23) < 0)
  {
    **(unsigned char **)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 23) = 0;
  }
  uint64_t v6 = 0;
  while (1)
  {
    int v7 = *(void **)((char *)a1 + *(void *)(*a1 - 24) + 40);
    std::string::size_type v8 = (unsigned char *)v7[3];
    if (v8 != (unsigned char *)v7[4])
    {
      v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(void *))(*v7 + 80))(v7);
    if (v7 == -1) {
      break;
    }
LABEL_9:
    if (v7 == a3)
    {
      int v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(void *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      int v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6) {
    int v9 = 2;
  }
  else {
    int v9 = 6;
  }
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_25515C770(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v2 = *v1;
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24) + 32) |= 1u;
  if ((*((unsigned char *)v1 + *(void *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x25515C730);
  }
  __cxa_rethrow();
}

void sub_25515C7EC(_Unwind_Exception *a1)
{
}

void *sub_25515C800(void *a1)
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

void **sub_25515C884(void **a1)
{
  uint64_t v2 = (void **)*a1;
  if (*a1)
  {
    unint64_t v3 = (void **)a1[1];
    int v4 = *a1;
    if (v3 == v2)
    {
LABEL_11:
      a1[1] = v2;
      operator delete(v4);
      return a1;
    }
    while (1)
    {
      if (*((char *)v3 - 1) < 0)
      {
        operator delete(*(v3 - 3));
        if (*((char *)v3 - 25) < 0) {
LABEL_9:
        }
          operator delete(*(v3 - 6));
      }
      else if (*((char *)v3 - 25) < 0)
      {
        goto LABEL_9;
      }
      v3 -= 6;
      if (v3 == v2)
      {
        int v4 = *a1;
        goto LABEL_11;
      }
    }
  }
  return a1;
}

void *sub_25515C914@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 8) = 0;
  uint64_t v2 = (uint64_t *)(a2 + 8);
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = a2 + 8;
  unint64_t v3 = (const void **)result[6];
  int v4 = (const void ***)(result + 7);
  if (v3 != result + 7)
  {
    do
    {
      double result = sub_25515D230((uint64_t **)a2, v2, v3 + 4, (uint64_t)(v3 + 4));
      uint64_t v6 = (const void **)v3[1];
      if (v6)
      {
        do
        {
          int v7 = (const void ***)v6;
          uint64_t v6 = (const void **)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          int v7 = (const void ***)v3[2];
          BOOL v8 = *v7 == v3;
          unint64_t v3 = (const void **)v7;
        }
        while (!v8);
      }
      unint64_t v3 = (const void **)v7;
    }
    while (v7 != v4);
  }
  return result;
}

void sub_25515C9B0(_Unwind_Exception *a1)
{
  sub_255150008(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

void sub_25515C9C8()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3A8] + 16;
  __cxa_throw(exception, (struct type_info *)&unk_270446608, (void (*)(void *))std::exception::~exception);
}

char *sub_25515CA18(void **a1, uint64_t a2)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 4);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0x555555555555555) {
    sub_25514C55C();
  }
  if (0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 4) > v4) {
    unint64_t v4 = 0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 4);
  }
  if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v6 = 0x555555555555555;
  }
  else {
    unint64_t v6 = v4;
  }
  if (v6)
  {
    if (v6 > 0x555555555555555) {
      sub_25514DDFC();
    }
    int v7 = (char *)operator new(48 * v6);
  }
  else
  {
    int v7 = 0;
  }
  BOOL v8 = &v7[48 * v3];
  *((void *)v8 + 2) = *(void *)(a2 + 16);
  *(_OWORD *)BOOL v8 = *(_OWORD *)a2;
  int v9 = &v7[48 * v6];
  long long v10 = *(_OWORD *)(a2 + 24);
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_OWORD *)(v8 + 24) = v10;
  *((void *)v8 + 5) = *(void *)(a2 + 40);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  char v11 = v8 + 48;
  uint64_t v12 = (char *)*a1;
  std::string::size_type v13 = (char *)a1[1];
  if (v13 == *a1)
  {
    *a1 = v8;
    a1[1] = v11;
    a1[2] = v9;
    if (!v13) {
      return v11;
    }
    goto LABEL_23;
  }
  do
  {
    long long v14 = *((_OWORD *)v13 - 3);
    *((void *)v8 - 4) = *((void *)v13 - 4);
    *((_OWORD *)v8 - 3) = v14;
    *((void *)v13 - 5) = 0;
    *((void *)v13 - 4) = 0;
    *((void *)v13 - 6) = 0;
    long long v15 = *(_OWORD *)(v13 - 24);
    *((void *)v8 - 1) = *((void *)v13 - 1);
    *(_OWORD *)(v8 - 24) = v15;
    v8 -= 48;
    *((void *)v13 - 2) = 0;
    *((void *)v13 - 1) = 0;
    *((void *)v13 - 3) = 0;
    v13 -= 48;
  }
  while (v13 != v12);
  std::string::size_type v16 = (char *)*a1;
  std::string::size_type v13 = (char *)a1[1];
  *a1 = v8;
  a1[1] = v11;
  a1[2] = v9;
  if (v13 != v16)
  {
    while (1)
    {
      if (*(v13 - 1) < 0)
      {
        operator delete(*((void **)v13 - 3));
        if (*(v13 - 25) < 0) {
LABEL_20:
        }
          operator delete(*((void **)v13 - 6));
      }
      else if (*(v13 - 25) < 0)
      {
        goto LABEL_20;
      }
      v13 -= 48;
      if (v13 == v16)
      {
        std::string::size_type v13 = v16;
        break;
      }
    }
  }
  if (v13) {
LABEL_23:
  }
    operator delete(v13);
  return v11;
}

uint64_t sub_25515CBCC(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v3;
  *((void *)a2 + 1) = 0;
  *((void *)a2 + 2) = 0;
  *(void *)a2 = 0;
  unint64_t v4 = (void *)(a1 + 24);
  std::string::value_type v5 = (const char *)*((void *)a2 + 3);
  size_t v6 = strlen(v5);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    sub_25514C40C();
  }
  size_t v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v8 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v8 = v6 | 7;
    }
    uint64_t v9 = v8 + 1;
    unint64_t v4 = operator new(v8 + 1);
    *(void *)(a1 + 32) = v7;
    *(void *)(a1 + 40) = v9 | 0x8000000000000000;
    *(void *)(a1 + 24) = v4;
  }
  else
  {
    *(unsigned char *)(a1 + 47) = v6;
    if (!v6) {
      goto LABEL_9;
    }
  }
  memmove(v4, v5, v7);
LABEL_9:
  *((unsigned char *)v4 + v7) = 0;
  return a1;
}

void sub_25515CC9C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_25515CCB8(void *a1, uint64_t a2)
{
  uint64_t v2 = (unsigned char *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v5 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v5 = v4;
  }
  unint64_t v6 = sub_25515A1A8((uint64_t)&v21, (uint64_t *)a2, v5);
  int8x8_t v7 = (int8x8_t)a1[1];
  if (!*(void *)&v7) {
    return 0;
  }
  unint64_t v8 = v6;
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v7);
  v9.i16[0] = vaddlv_u8(v9);
  unint64_t v10 = v9.u32[0];
  if (v9.u32[0] > 1uLL)
  {
    unint64_t v11 = v6;
    if (v6 >= *(void *)&v7) {
      unint64_t v11 = v6 % *(void *)&v7;
    }
  }
  else
  {
    unint64_t v11 = (*(void *)&v7 - 1) & v6;
  }
  uint64_t v12 = *(uint64_t ***)(*a1 + 8 * v11);
  if (!v12) {
    return 0;
  }
  std::string::size_type v13 = *v12;
  if (*v12)
  {
    char v14 = v2[23];
    if (v14 >= 0) {
      uint64_t v15 = v2[23];
    }
    else {
      uint64_t v15 = *((void *)v2 + 1);
    }
    if (v14 < 0) {
      uint64_t v2 = *(unsigned char **)v2;
    }
    do
    {
      unint64_t v16 = v13[1];
      if (v8 == v16)
      {
        uint64_t v17 = *((unsigned __int8 *)v13 + 39);
        if ((v17 & 0x80u) == 0) {
          uint64_t v18 = *((unsigned __int8 *)v13 + 39);
        }
        else {
          uint64_t v18 = v13[3];
        }
        if (v18 == v15)
        {
          if ((v17 & 0x80) != 0)
          {
            if (!memcmp((const void *)v13[2], v2, v13[3])) {
              return v13;
            }
          }
          else
          {
            if (!*((unsigned char *)v13 + 39)) {
              return v13;
            }
            uint64_t v19 = 0;
            while (*((unsigned __int8 *)v13 + v19 + 16) == v2[v19])
            {
              if (v17 == ++v19) {
                return v13;
              }
            }
          }
        }
      }
      else
      {
        if (v10 <= 1)
        {
          v16 &= *(void *)&v7 - 1;
        }
        else if (v16 >= *(void *)&v7)
        {
          v16 %= *(void *)&v7;
        }
        if (v16 != v11) {
          return 0;
        }
      }
      std::string::size_type v13 = (uint64_t *)*v13;
    }
    while (v13);
  }
  return v13;
}

void sub_25515CE40()
{
}

void *sub_25515CE54()
{
  double result = operator new(0x10uLL);
  void *result = &unk_270446630;
  return result;
}

void sub_25515CE8C(uint64_t a1, void *a2)
{
  *a2 = &unk_270446630;
}

uint64_t sub_25515CEB4(uint64_t a1, const void **a2, const void *a3)
{
  unint64_t v3 = *((unsigned __int8 *)a2 + 23);
  int v4 = (char)v3;
  unint64_t v5 = (const void **)*a2;
  if ((v3 & 0x80u) != 0) {
    unint64_t v3 = (unint64_t)a2[1];
  }
  if (v3 >= 2) {
    size_t v6 = 2;
  }
  else {
    size_t v6 = v3;
  }
  unsigned __int8 v23 = v6;
  if (v6)
  {
    if (v4 < 0) {
      a2 = v5;
    }
    memcpy(__dst, a2, v6);
    unsigned int v7 = v23;
    a3 = __dst[1];
  }
  else
  {
    unsigned int v7 = 0;
  }
  BOOL v8 = 0;
  *((unsigned char *)__dst + v6) = 0;
  v21[23] = 2;
  strcpy(v21, "--");
  if ((v7 & 0x80u) == 0) {
    unint64_t v9 = v7;
  }
  else {
    unint64_t v9 = (unint64_t)a3;
  }
  if (v9 == 2)
  {
    if ((v7 & 0x80) != 0)
    {
      uint64_t v19 = (void *)__dst[0];
      BOOL v8 = memcmp(__dst[0], v21, (size_t)a3) == 0;
      goto LABEL_26;
    }
    if (!v7) {
      return 1;
    }
    uint64_t v10 = v7 - 1;
    unint64_t v11 = __dst;
    uint64_t v12 = v21;
    do
    {
      int v14 = *(unsigned __int8 *)v11;
      unint64_t v11 = (const void **)((char *)v11 + 1);
      int v13 = v14;
      int v16 = *v12++;
      int v15 = v16;
      BOOL v18 = v10-- != 0;
      BOOL v8 = v13 == v15;
    }
    while (v13 == v15 && v18);
  }
  if ((v7 & 0x80) != 0)
  {
    uint64_t v19 = (void *)__dst[0];
LABEL_26:
    operator delete(v19);
  }
  return v8;
}

void sub_25515CFD0()
{
}

void *sub_25515CFE4()
{
  double result = operator new(0x10uLL);
  void *result = &unk_270446678;
  return result;
}

void sub_25515D01C(uint64_t a1, void *a2)
{
  *a2 = &unk_270446678;
}

BOOL sub_25515D044(uint64_t a1, void **a2)
{
  int v2 = *((char *)a2 + 23);
  if (v2 >= 0) {
    size_t v3 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v3 = (size_t)a2[1];
  }
  if (!v3) {
    return 0;
  }
  if (v2 >= 0) {
    int v4 = a2;
  }
  else {
    int v4 = *a2;
  }
  unint64_t v5 = memchr(v4, 61, v3);
  if (v5) {
    BOOL v6 = v5 - (unsigned char *)v4 == -1;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6;
}

uint64_t **sub_25515D0A8(uint64_t **a1, const void **a2, uint64_t a3)
{
  BOOL v6 = a1 + 1;
  unint64_t v5 = a1[1];
  if (v5)
  {
    int v7 = *((char *)a2 + 23);
    if (v7 >= 0) {
      BOOL v8 = a2;
    }
    else {
      BOOL v8 = *a2;
    }
    if (v7 >= 0) {
      size_t v9 = *((unsigned __int8 *)a2 + 23);
    }
    else {
      size_t v9 = (size_t)a2[1];
    }
    while (1)
    {
      uint64_t v10 = (uint64_t **)v5;
      int v13 = (const void *)v5[4];
      unint64_t v11 = v5 + 4;
      uint64_t v12 = v13;
      int v14 = *((char *)v11 + 23);
      if (v14 >= 0) {
        int v15 = v11;
      }
      else {
        int v15 = v12;
      }
      if (v14 >= 0) {
        size_t v16 = *((unsigned __int8 *)v11 + 23);
      }
      else {
        size_t v16 = v11[1];
      }
      if (v16 >= v9) {
        size_t v17 = v9;
      }
      else {
        size_t v17 = v16;
      }
      int v18 = memcmp(v8, v15, v17);
      if (v18)
      {
        if (v18 < 0) {
          goto LABEL_8;
        }
LABEL_22:
        int v19 = memcmp(v15, v8, v17);
        if (v19)
        {
          if ((v19 & 0x80000000) == 0) {
            return v10;
          }
        }
        else if (v16 >= v9)
        {
          return v10;
        }
        unint64_t v5 = v10[1];
        if (!v5)
        {
          BOOL v6 = v10 + 1;
          goto LABEL_29;
        }
      }
      else
      {
        if (v9 >= v16) {
          goto LABEL_22;
        }
LABEL_8:
        unint64_t v5 = *v10;
        BOOL v6 = v10;
        if (!*v10) {
          goto LABEL_29;
        }
      }
    }
  }
  uint64_t v10 = a1 + 1;
LABEL_29:
  long long v20 = operator new(0x38uLL);
  char v21 = v20 + 4;
  if (*(char *)(a3 + 23) < 0)
  {
    sub_2551501FC(v21, *(void **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)char v21 = *(_OWORD *)a3;
    v20[6] = *(void *)(a3 + 16);
  }
  *long long v20 = 0;
  v20[1] = 0;
  v20[2] = v10;
  *BOOL v6 = v20;
  float v22 = (uint64_t *)**a1;
  unsigned __int8 v23 = v20;
  if (v22)
  {
    *a1 = v22;
    unsigned __int8 v23 = *v6;
  }
  sub_25515029C(a1[1], v23);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return (uint64_t **)v20;
}

void sub_25515D21C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_25515D230(uint64_t **a1, uint64_t *a2, const void **a3, uint64_t a4)
{
  BOOL v6 = sub_25515D314(a1, a2, &v15, &v14, a3);
  int v7 = (void *)*v6;
  if (!*v6)
  {
    BOOL v8 = v6;
    int v7 = operator new(0x38uLL);
    size_t v9 = v7 + 4;
    if (*(char *)(a4 + 23) < 0)
    {
      sub_2551501FC(v9, *(void **)a4, *(void *)(a4 + 8));
    }
    else
    {
      *(_OWORD *)size_t v9 = *(_OWORD *)a4;
      v7[6] = *(void *)(a4 + 16);
    }
    uint64_t v10 = v15;
    void *v7 = 0;
    v7[1] = 0;
    v7[2] = v10;
    uint64_t *v8 = (uint64_t)v7;
    unint64_t v11 = (uint64_t *)**a1;
    uint64_t v12 = v7;
    if (v11)
    {
      *a1 = v11;
      uint64_t v12 = (uint64_t *)*v8;
    }
    sub_25515029C(a1[1], v12);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return v7;
}

void sub_25515D300(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_25515D314(uint64_t **a1, uint64_t *a2, uint64_t **a3, uint64_t **a4, const void **a5)
{
  BOOL v8 = a1 + 1;
  if (a1 + 1 == (uint64_t **)a2) {
    goto LABEL_23;
  }
  int v10 = *((char *)a5 + 23);
  if (v10 >= 0) {
    unint64_t v11 = a5;
  }
  else {
    unint64_t v11 = *a5;
  }
  if (v10 >= 0) {
    size_t v12 = *((unsigned __int8 *)a5 + 23);
  }
  else {
    size_t v12 = (size_t)a5[1];
  }
  int v13 = *((char *)a2 + 55);
  if (v13 >= 0) {
    int v14 = a2 + 4;
  }
  else {
    int v14 = (const void *)a2[4];
  }
  if (v13 >= 0) {
    size_t v15 = *((unsigned __int8 *)a2 + 55);
  }
  else {
    size_t v15 = a2[5];
  }
  if (v15 >= v12) {
    size_t v16 = v12;
  }
  else {
    size_t v16 = v15;
  }
  int v17 = memcmp(v11, v14, v16);
  if (!v17)
  {
    if (v12 >= v15) {
      goto LABEL_19;
    }
LABEL_23:
    int v19 = (uint64_t *)*a2;
    if (*a1 == a2)
    {
      char v21 = a2;
    }
    else
    {
      if (v19)
      {
        long long v20 = (uint64_t *)*a2;
        do
        {
          char v21 = v20;
          long long v20 = (uint64_t *)v20[1];
        }
        while (v20);
      }
      else
      {
        float v22 = a2;
        do
        {
          char v21 = (uint64_t *)v22[2];
          BOOL v23 = *v21 == (void)v22;
          float v22 = v21;
        }
        while (v23);
      }
      int v24 = *((char *)v21 + 55);
      if (v24 >= 0) {
        char v25 = v21 + 4;
      }
      else {
        char v25 = (const void *)v21[4];
      }
      if (v24 >= 0) {
        size_t v26 = *((unsigned __int8 *)v21 + 55);
      }
      else {
        size_t v26 = v21[5];
      }
      int v27 = *((char *)a5 + 23);
      if (v27 >= 0) {
        int8x8_t v28 = a5;
      }
      else {
        int8x8_t v28 = *a5;
      }
      if (v27 >= 0) {
        size_t v29 = *((unsigned __int8 *)a5 + 23);
      }
      else {
        size_t v29 = (size_t)a5[1];
      }
      if (v29 >= v26) {
        size_t v30 = v26;
      }
      else {
        size_t v30 = v29;
      }
      int v31 = memcmp(v25, v28, v30);
      if (v31)
      {
        if ((v31 & 0x80000000) == 0) {
          goto LABEL_48;
        }
      }
      else if (v26 >= v29)
      {
LABEL_48:
        uint64_t v32 = *v8;
        if (!*v8)
        {
          unint64_t v33 = v8;
LABEL_69:
          *a3 = (uint64_t *)v33;
          return (uint64_t *)v8;
        }
        while (1)
        {
          unint64_t v33 = (uint64_t **)v32;
          uint64_t v36 = (const void *)v32[4];
          std::string v34 = v32 + 4;
          uint8x8_t v35 = v36;
          int v37 = *((char *)v34 + 23);
          if (v37 >= 0) {
            unint64_t v38 = v34;
          }
          else {
            unint64_t v38 = v35;
          }
          if (v37 >= 0) {
            size_t v39 = *((unsigned __int8 *)v34 + 23);
          }
          else {
            size_t v39 = v34[1];
          }
          if (v39 >= v29) {
            size_t v40 = v29;
          }
          else {
            size_t v40 = v39;
          }
          int v41 = memcmp(v28, v38, v40);
          if (v41)
          {
            if (v41 < 0) {
              goto LABEL_50;
            }
LABEL_64:
            int v42 = memcmp(v38, v28, v40);
            if (v42)
            {
              if ((v42 & 0x80000000) == 0) {
                goto LABEL_69;
              }
            }
            else if (v39 >= v29)
            {
              goto LABEL_69;
            }
            BOOL v8 = v33 + 1;
            uint64_t v32 = v33[1];
            if (!v32) {
              goto LABEL_69;
            }
          }
          else
          {
            if (v29 >= v39) {
              goto LABEL_64;
            }
LABEL_50:
            uint64_t v32 = *v33;
            BOOL v8 = v33;
            if (!*v33) {
              goto LABEL_69;
            }
          }
        }
      }
    }
    if (v19)
    {
      *a3 = v21;
      return v21 + 1;
    }
    else
    {
      *a3 = a2;
      return a2;
    }
  }
  if (v17 < 0) {
    goto LABEL_23;
  }
LABEL_19:
  int v18 = memcmp(v14, v11, v16);
  if (v18)
  {
    if ((v18 & 0x80000000) == 0)
    {
LABEL_21:
      *a3 = a2;
      *a4 = a2;
      return (uint64_t *)a4;
    }
  }
  else if (v15 >= v12)
  {
    goto LABEL_21;
  }
  uint64_t v43 = a2[1];
  if (v43)
  {
    std::locale v44 = (uint64_t *)a2[1];
    do
    {
      a4 = (uint64_t **)v44;
      std::locale v44 = (uint64_t *)*v44;
    }
    while (v44);
  }
  else
  {
    std::string v45 = a2;
    do
    {
      a4 = (uint64_t **)v45[2];
      BOOL v23 = *a4 == v45;
      std::string v45 = (uint64_t *)a4;
    }
    while (!v23);
  }
  if (a4 != v8)
  {
    int v46 = *((char *)a4 + 55);
    if (v46 >= 0) {
      int v47 = (uint64_t *)(a4 + 4);
    }
    else {
      int v47 = a4[4];
    }
    if (v46 >= 0) {
      size_t v48 = *((unsigned __int8 *)a4 + 55);
    }
    else {
      size_t v48 = (size_t)a4[5];
    }
    if (v48 >= v12) {
      size_t v49 = v12;
    }
    else {
      size_t v49 = v48;
    }
    int v50 = memcmp(v11, v47, v49);
    if (v50)
    {
      if ((v50 & 0x80000000) == 0)
      {
LABEL_95:
        uint64_t v51 = *v8;
        if (*v8)
        {
          uint64_t v52 = a3;
          while (1)
          {
            uint64_t v53 = (uint64_t **)v51;
            uint64_t v56 = (const void *)v51[4];
            uint64_t v54 = v51 + 4;
            uint64_t v55 = v56;
            int v57 = *((char *)v54 + 23);
            if (v57 >= 0) {
              uint64_t v58 = v54;
            }
            else {
              uint64_t v58 = v55;
            }
            if (v57 >= 0) {
              size_t v59 = *((unsigned __int8 *)v54 + 23);
            }
            else {
              size_t v59 = v54[1];
            }
            if (v59 >= v12) {
              size_t v60 = v12;
            }
            else {
              size_t v60 = v59;
            }
            int v61 = memcmp(v11, v58, v60);
            if (v61)
            {
              if (v61 < 0) {
                goto LABEL_97;
              }
LABEL_111:
              int v62 = memcmp(v58, v11, v60);
              if (v62)
              {
                if ((v62 & 0x80000000) == 0) {
                  goto LABEL_123;
                }
              }
              else if (v59 >= v12)
              {
                goto LABEL_123;
              }
              BOOL v8 = v53 + 1;
              uint64_t v51 = v53[1];
              if (!v51) {
                goto LABEL_123;
              }
            }
            else
            {
              if (v12 >= v59) {
                goto LABEL_111;
              }
LABEL_97:
              uint64_t v51 = *v53;
              BOOL v8 = v53;
              if (!*v53) {
                goto LABEL_123;
              }
            }
          }
        }
        uint64_t v53 = v8;
        uint64_t v52 = a3;
LABEL_123:
        *uint64_t v52 = (uint64_t *)v53;
        return (uint64_t *)v8;
      }
    }
    else if (v12 >= v48)
    {
      goto LABEL_95;
    }
  }
  if (v43)
  {
    *a3 = (uint64_t *)a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return (uint64_t *)a4;
}

void sub_25515D6C0(const __CFString *a1@<X0>, void *a2@<X8>)
{
  int v2 = a2;
  if (!a1)
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    return;
  }
  CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
  unint64_t v5 = (void *)CStringPtr;
  if (CStringPtr)
  {
    size_t v6 = strlen(CStringPtr);
    if (v6 > 0x7FFFFFFFFFFFFFF7) {
      sub_25514C40C();
    }
    size_t v7 = v6;
    if (v6 >= 0x17)
    {
      uint64_t v13 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v6 | 7) != 0x17) {
        uint64_t v13 = v6 | 7;
      }
      uint64_t v14 = v13 + 1;
      size_t v15 = operator new(v13 + 1);
      v2[1] = v7;
      v2[2] = v14 | 0x8000000000000000;
      void *v2 = v15;
      int v2 = v15;
    }
    else
    {
      *((unsigned char *)v2 + 23) = v6;
      if (!v6) {
        goto LABEL_20;
      }
    }
    memmove(v2, v5, v7);
LABEL_20:
    *((unsigned char *)v2 + v7) = 0;
    return;
  }
  CFIndex Length = CFStringGetLength(a1);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  int v19 = 0;
  size_t v10 = MaximumSizeForEncoding + 1;
  if (MaximumSizeForEncoding != -1)
  {
    if (MaximumSizeForEncoding <= -2) {
      sub_25514C55C();
    }
    unint64_t v5 = operator new(MaximumSizeForEncoding + 1);
    int v19 = v5;
    bzero(v5, v10);
  }
  if (CFStringGetCString(a1, (char *)v5, v10, 0x8000100u))
  {
    size_t v11 = strlen((const char *)v5);
    if (v11 > 0x7FFFFFFFFFFFFFF7) {
      sub_25514C40C();
    }
    size_t v12 = v11;
    if (v11 >= 0x17)
    {
      uint64_t v16 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v11 | 7) != 0x17) {
        uint64_t v16 = v11 | 7;
      }
      uint64_t v17 = v16 + 1;
      int v18 = operator new(v16 + 1);
      v2[1] = v12;
      v2[2] = v17 | 0x8000000000000000;
      void *v2 = v18;
      int v2 = v18;
    }
    else
    {
      *((unsigned char *)v2 + 23) = v11;
      if (!v11)
      {
LABEL_27:
        *((unsigned char *)v2 + v12) = 0;
        unint64_t v5 = v19;
        if (!v19) {
          return;
        }
        goto LABEL_28;
      }
    }
    memcpy(v2, v5, v12);
    goto LABEL_27;
  }
  void *v2 = 0;
  v2[1] = 0;
  v2[2] = 0;
  if (!v5) {
    return;
  }
LABEL_28:
  operator delete(v5);
}

void sub_25515D8A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_25515D8D0(CFDictionaryRef theDict@<X1>, uint64_t a2@<X0>, const char **a3@<X8>)
{
  if (a2)
  {
    a3[2] = 0;
    a3[3] = 0;
    int v4 = "MLCompiler: validation version mismatch!";
LABEL_3:
    *a3 = v4;
    a3[1] = 0;
    return;
  }
  if (!CFDictionaryGetValue(theDict, @"architecture"))
  {
    a3[2] = 0;
    a3[3] = 0;
    int v4 = "MLCompiler: no target architecture specified!";
    goto LABEL_3;
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"parameters");
  if (!Value)
  {
    a3[2] = 0;
    a3[3] = 0;
    int v4 = "MLCompiler: no parameters specified!";
    goto LABEL_3;
  }
  CFDictionaryRef v7 = Value;
  BOOL v8 = (const char *)CFDictionaryGetValue(theDict, @"MIL");
  if (!v8)
  {
    a3[2] = 0;
    a3[3] = 0;
    int v4 = "MLCompiler: cannot get the MIL program!";
    goto LABEL_3;
  }
  size_t v9 = v8;
  size_t v10 = (const char *)CFDictionaryGetValue(theDict, @"function");
  if (!v10)
  {
    a3[2] = 0;
    a3[3] = 0;
    int v4 = "MLCompiler: cannot get the MIL function name!";
    goto LABEL_3;
  }
  size_t v11 = v10;
  CFStringRef v12 = (const __CFString *)CFDictionaryGetValue(v7, @"bnns-graph");
  if (v12)
  {
    sub_25515D6C0(v12, __p);
    unint64_t v13 = v17;
    if ((v17 & 0x80u) != 0) {
      unint64_t v13 = (unint64_t)__p[1];
    }
    if (v13 == 4)
    {
      uint64_t v14 = (void **)__p[0];
      if ((v17 & 0x80u) == 0) {
        uint64_t v14 = __p;
      }
      BOOL v15 = *(_DWORD *)v14 == 1702195828;
    }
    else
    {
      BOOL v15 = 0;
    }
    if ((char)v17 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    BOOL v15 = 0;
  }
  *a3 = 0;
  a3[1] = v9;
  a3[2] = v11;
  *((unsigned char *)a3 + 24) = v15;
}

__CFDictionary *sub_25515DA3C(const char *a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  size_t v3 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  int v4 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t valuePtr = 0;
  CFNumberRef v6 = CFNumberCreate(v2, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, @"resultsVersion", v6);
  CFRelease(v6);
  int v11 = -1;
  CFNumberRef v7 = CFNumberCreate(v2, kCFNumberIntType, &v11);
  BOOL v8 = CFDictionaryCreateMutable(v2, 0, v3, v4);
  CFStringRef v9 = CFStringCreateWithCString(v2, a1, 0x8000100u);
  CFDictionaryAddValue(v8, @"errorMsg", v9);
  CFDictionaryAddValue(Mutable, v7, v8);
  CFRelease(v9);
  CFRelease(v7);
  CFRelease(v8);
  return Mutable;
}

__CFDictionary *sub_25515DB68(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 8);
  CFAllocatorRef v2 = *(const void **)(a1 + 16);
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, @"MIL", v1);
  CFDictionaryAddValue(Mutable, @"function", v2);
  CFDictionaryAddValue(Mutable, @"parameters", &stru_270446790);
  CFDictionaryAddValue(Mutable, @"architecture", @"local");
  BNNSGraphE5ValidateGetSupportedVersion();
  CFDictionaryRef v5 = (const __CFDictionary *)BNNSGraphE5Validate();
  CFRelease(Mutable);
  CFIndex Count = CFDictionaryGetCount(v5);
  MutableCopy = CFDictionaryCreateMutableCopy(v3, Count, v5);
  CFRelease(v5);
  uint64_t valuePtr = 0;
  CFNumberRef v8 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryReplaceValue(MutableCopy, @"resultsVersion", v8);
  CFRelease(v8);
  return MutableCopy;
}

void sub_25515DC8C(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_255146000, a2, OS_LOG_TYPE_ERROR, "Can't open model at %s", (uint8_t *)&v2, 0xCu);
}

void sub_25515DD04(char *a1, void *a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (*a1 >= 0) {
    uint64_t v3 = a2;
  }
  else {
    uint64_t v3 = (void *)*a2;
  }
  int v4 = 136315138;
  CFDictionaryRef v5 = v3;
  _os_log_error_impl(&dword_255146000, log, OS_LOG_TYPE_ERROR, "Can't open BNNSGraph model at %s", (uint8_t *)&v4, 0xCu);
}

uint64_t sub_25515DD90(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void sub_25515DDC8(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "mlc_managed_model_t mlc_services_model_create_cached(unsigned char *)";
  _os_log_error_impl(&dword_255146000, log, OS_LOG_TYPE_ERROR, "%s: no longer supported", (uint8_t *)&v1, 0xCu);
}

void sub_25515DE4C(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_255146000, log, OS_LOG_TYPE_ERROR, "Failed to create BNNS graph context", v1, 2u);
}

void sub_25515DE90(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_255146000, log, OS_LOG_TYPE_ERROR, "Unhandled BNNS data type in bnns_sizeof", v1, 2u);
}

void sub_25515DED4()
{
  sub_255150560();
  sub_255150544(&dword_255146000, v0, v1, "Tried to get tensor shape of unknown tensor %s", v2, v3, v4, v5, v6);
}

void sub_25515DF3C()
{
  sub_255150560();
  sub_255150544(&dword_255146000, v0, v1, "Rank %zu out of bounds", v2, v3, v4, v5, v6);
}

void sub_25515DFA4()
{
  sub_255150560();
  sub_255150544(&dword_255146000, v0, v1, "Tried to set tensor shape of unknown tensor %s", v2, v3, v4, v5, v6);
}

void sub_25515E00C()
{
  sub_255150560();
  sub_255150544(&dword_255146000, v0, v1, "Tensor %s: strides must be dense", v2, v3, v4, v5, v6);
}

uint64_t sub_25515E074(uint64_t a1)
{
  uint64_t v1 = nullsub_1(a1);
  return MEMORY[0x25A288F90](v1, 0x10B3C40B9A48F69);
}

void sub_25515E0A8(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "const char *mlc_services_compile_to_cache(int, const char *const *, unsigned char *)";
  _os_log_error_impl(&dword_255146000, log, OS_LOG_TYPE_ERROR, "%s: no longer supported", (uint8_t *)&v1, 0xCu);
}

void sub_25515E12C(void **a1, void **a2, void **a3)
{
  uint64_t v5 = (void **)*a1;
  uint8_t v6 = a2;
  if (v5 != a2)
  {
    do
    {
      if (*((char *)v5 - 1) < 0) {
        operator delete(*(v5 - 3));
      }
      v5 -= 3;
    }
    while (v5 != a2);
    uint8_t v6 = *a3;
  }
  *a1 = a2;
  operator delete(v6);
}

void sub_25515E1A0()
{
}

uint64_t BNNSGraphCompileFromFile_v2()
{
  return MEMORY[0x270EDE0B0]();
}

uint64_t BNNSGraphCompileOptionsDestroy()
{
  return MEMORY[0x270EDE0B8]();
}

uint64_t BNNSGraphCompileOptionsMakeDefault()
{
  return MEMORY[0x270EDE0C0]();
}

uint64_t BNNSGraphCompileOptionsSetDownconvertMode()
{
  return MEMORY[0x270EDE0C8]();
}

uint64_t BNNSGraphCompileOptionsSetGenerateDebugInfo()
{
  return MEMORY[0x270EDE0D0]();
}

uint64_t BNNSGraphCompileOptionsSetOptimizationPreference()
{
  return MEMORY[0x270EDE0D8]();
}

uint64_t BNNSGraphCompileOptionsSetOutputPath()
{
  return MEMORY[0x270EDE0E0]();
}

uint64_t BNNSGraphCompileOptionsSetTargetSingleThread()
{
  return MEMORY[0x270EDE0F0]();
}

uint64_t BNNSGraphCompileOptionsSetUserData()
{
  return MEMORY[0x270EDE0F8]();
}

uint64_t BNNSGraphCompileOptionsSetValidateMILFile()
{
  return MEMORY[0x270EDE100]();
}

uint64_t BNNSGraphContextDestroy_v2()
{
  return MEMORY[0x270EDE108]();
}

uint64_t BNNSGraphContextExecute_v2()
{
  return MEMORY[0x270EDE110]();
}

uint64_t BNNSGraphContextGetTensorDescriptor_v2()
{
  return MEMORY[0x270EDE118]();
}

uint64_t BNNSGraphContextMake()
{
  return MEMORY[0x270EDE128]();
}

uint64_t BNNSGraphContextSetArgumentType()
{
  return MEMORY[0x270EDE130]();
}

uint64_t BNNSGraphContextSetDynamicShapes_v2()
{
  return MEMORY[0x270EDE138]();
}

uint64_t BNNSGraphE5Validate()
{
  return MEMORY[0x270EDE158]();
}

uint64_t BNNSGraphE5ValidateGetSupportedVersion()
{
  return MEMORY[0x270EDE160]();
}

uint64_t BNNSGraphGetInputCount()
{
  return MEMORY[0x270EDE170]();
}

uint64_t BNNSGraphGetInputNames_v2()
{
  return MEMORY[0x270EDE178]();
}

uint64_t BNNSGraphGetOutputCount()
{
  return MEMORY[0x270EDE180]();
}

uint64_t BNNSGraphGetOutputNames_v2()
{
  return MEMORY[0x270EDE188]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4C50](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x270EF4C58](buffer);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string *__cdecl std::error_code::message(std::string *__return_ptr retstr, const std::error_code *this)
{
  return (std::string *)MEMORY[0x270F98210](retstr, this);
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  int v1 = (const std::string_view::value_type *)MEMORY[0x270F98288](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__parent_path(const std::__fs::filesystem::path *this)
{
  int v1 = (const std::string_view::value_type *)MEMORY[0x270F98298](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path *__cdecl std::__fs::filesystem::path::lexically_relative(std::__fs::filesystem::path *__return_ptr retstr, const std::__fs::filesystem::path *this, const std::__fs::filesystem::path *__base)
{
  return (std::__fs::filesystem::path *)MEMORY[0x270F982B0](retstr, this, __base);
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

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F984B0](this, __n, __c);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x270F98638]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x270F98640]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x270F98650]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x270F98658]();
}

uint64_t std::istream::get()
{
  return MEMORY[0x270F98668]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x270F986D0]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x270F986D8]();
}

{
  return MEMORY[0x270F98720]();
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

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F987A8]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

uint64_t std::ofstream::open()
{
  return MEMORY[0x270F98878]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x270F98910]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::__fs::filesystem::path *__cdecl std::__fs::filesystem::__weakly_canonical(std::__fs::filesystem::path *__return_ptr retstr, const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return (std::__fs::filesystem::path *)MEMORY[0x270F98AF0](retstr, __p, __ec);
}

BOOL std::__fs::filesystem::__create_directories(const std::__fs::filesystem::path *a1, std::error_code *a2)
{
  return MEMORY[0x270F98B08](a1, a2);
}

std::__fs::filesystem::path *__cdecl std::__fs::filesystem::path::replace_extension(std::__fs::filesystem::path *this, const std::__fs::filesystem::path *__replacement)
{
  return (std::__fs::filesystem::path *)MEMORY[0x270F98B30](this, __replacement);
}

BOOL std::__fs::filesystem::__remove(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return MEMORY[0x270F98B50](a1, __ec);
}

void std::__fs::filesystem::__rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x270F98B60](a1, __ec);
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
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

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
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

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int dlclose(void *__handle)
{
  return MEMORY[0x270ED9618](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x270ED9978](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
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

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
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

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x270EDA570](a1, *(void *)&a2);
}

uint64_t mlc_binary_create()
{
  return MEMORY[0x270F48848]();
}

uint64_t mlc_binary_destroy()
{
  return MEMORY[0x270F48850]();
}

uint64_t mlc_binary_error()
{
  return MEMORY[0x270F48858]();
}

uint64_t mlc_binary_execute_sync()
{
  return MEMORY[0x270F48860]();
}

uint64_t mlc_binary_input()
{
  return MEMORY[0x270F48868]();
}

uint64_t mlc_binary_load_sync()
{
  return MEMORY[0x270F48870]();
}

uint64_t mlc_binary_n_inputs()
{
  return MEMORY[0x270F48878]();
}

uint64_t mlc_binary_n_outputs()
{
  return MEMORY[0x270F48880]();
}

uint64_t mlc_binary_output()
{
  return MEMORY[0x270F48888]();
}

uint64_t mlc_binary_set_kernel_dylib()
{
  return MEMORY[0x270F48898]();
}

uint64_t mlc_binary_validate()
{
  return MEMORY[0x270F488A0]();
}

uint64_t mlc_event_record()
{
  return MEMORY[0x270F488A8]();
}

uint64_t mlc_tensor_dimension()
{
  return MEMORY[0x270F488B0]();
}

uint64_t mlc_tensor_event()
{
  return MEMORY[0x270F488B8]();
}

uint64_t mlc_tensor_name()
{
  return MEMORY[0x270F488C0]();
}

uint64_t mlc_tensor_rank()
{
  return MEMORY[0x270F488C8]();
}

uint64_t mlc_tensor_set_dimension()
{
  return MEMORY[0x270F488D0]();
}

uint64_t mlc_tensor_set_stride()
{
  return MEMORY[0x270F488D8]();
}

uint64_t mlc_tensor_stride()
{
  return MEMORY[0x270F488E0]();
}

uint64_t mlc_tensor_type()
{
  return MEMORY[0x270F488E8]();
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x270EDB3D8](__name, __value, *(void *)&__overwrite);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDBD20]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x270EDBE40](name, targetq);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}