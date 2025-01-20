id sub_1DDBCB8EC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  double *v64;
  double *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  RAWOpcodeMapPolynomial *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t vars8;

  v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, a3, a4, a5);
  v10 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v7, *(unsigned int *)(a1 + 12), v8, v9);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v11, (uint64_t)v10, @"Top", v12);

  v16 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v13, *(unsigned int *)(a1 + 16), v14, v15);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v17, (uint64_t)v16, @"Left", v18);

  v22 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v19, *(unsigned int *)(a1 + 20), v20, v21);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v23, (uint64_t)v22, @"Bottom", v24);

  v28 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v25, *(unsigned int *)(a1 + 24), v26, v27);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v29, (uint64_t)v28, @"Right", v30);

  v34 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v31, *(unsigned int *)(a1 + 28), v32, v33);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v35, (uint64_t)v34, @"Plane", v36);

  v40 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v37, *(unsigned int *)(a1 + 32), v38, v39);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v41, (uint64_t)v40, @"Planes", v42);

  v46 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v43, *(unsigned int *)(a1 + 36), v44, v45);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v47, (uint64_t)v46, @"RowPitch", v48);

  v52 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v49, *(unsigned int *)(a1 + 40), v50, v51);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v53, (uint64_t)v52, @"ColPitch", v54);

  v63 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v55, v56, v57, v58);
  v64 = *(double **)(a1 + 48);
  v65 = *(double **)(a1 + 56);
  while (v64 != v65)
  {
    v66 = objc_msgSend_numberWithDouble_(NSNumber, v59, v60, v61, v62, *v64);
    objc_msgSend_addObject_(v63, v67, (uint64_t)v66, v68, v69);

    ++v64;
  }
  objc_msgSend_setObject_forKeyedSubscript_(v6, v59, (uint64_t)v63, @"Coefficients", v62);
  v70 = [RAWOpcodeMapPolynomial alloc];
  v74 = objc_msgSend_initWithArguments_(v70, v71, (uint64_t)v6, v72, v73);

  return v74;
}

void sub_1DDBCBB28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1DDBCBB7C(void *a1)
{
  *a1 = &unk_1F398C218;
  v2 = (void *)a1[6];
  if (v2)
  {
    a1[7] = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_1DDBCBBCC(void *a1)
{
  *a1 = &unk_1F398C218;
  v2 = (void *)a1[6];
  if (v2)
  {
    a1[7] = v2;
    operator delete(v2);
  }

  JUMPOUT(0x1E01C3DC0);
}

uint64_t sub_1DDBCBC3C()
{
  return 8;
}

void sub_1DDBCBC44(const void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v12 = a2;
  if (a1)
  {
    v11 = __dynamic_cast(a1, (const struct __class_type_info *)&unk_1F39869C0, (const struct __class_type_info *)&unk_1F398C3A8, 0);
    if (v11) {
      sub_1DDBCC244(v11, v12, a3, a4, a5, a6);
    }
  }
}

void sub_1DDBCBD10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DDBCBD24(const void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  id v13 = a2;
  if (a1)
  {
    v9 = __dynamic_cast(a1, (const struct __class_type_info *)&unk_1F39869C0, (const struct __class_type_info *)&unk_1F398C3A8, 0);
    if (v9) {
      sub_1DDBCC34C((uint64_t)v9, v10, v11, a4, v12, a6);
    }
  }
}

void sub_1DDBCBDD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DDBCBDE8(uint64_t *a1@<X0>, void *a2@<X1>, void *a3@<X2>, _OWORD *a4@<X8>)
{
  id v9 = a2;
  id v8 = a3;
  sub_1DDBCC778(a1, &v9, &v8, &v7);
  *a4 = v7;
}

void sub_1DDBCBE60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1DDBCBE7C(uint64_t *a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  v6 = sub_1DDBA1814((uint64_t)a1);
  objc_msgSend_stringWithFormat_(NSString, v7, @"IFD0/%@", v8, v9, *MEMORY[0x1E4F2FD70]);
  uint64_t v10 = (char *)objc_claimAutoreleasedReturnValue();
  v14 = sub_1DDA357A8(v6, v10, v11, v12, v13);

  int v19 = objc_msgSend_intValue(v14, v15, v16, v17, v18);
  if ((v19 - 9) >= 0xFFFFFFF8) {
    int v20 = v19;
  }
  else {
    int v20 = 0;
  }
  if (v14) {
    int v21 = v20;
  }
  else {
    int v21 = v19;
  }
  v22 = sub_1DDBA1814((uint64_t)a1);
  objc_msgSend_stringWithFormat_(NSString, v23, @"IFD0/Exif/Makernote/%@/%@", v24, v25, @"SamsungThumbnail", @"PreviewImageStart");
  v26 = (char *)objc_claimAutoreleasedReturnValue();
  v30 = sub_1DDA357A8(v22, v26, v27, v28, v29);

  v31 = sub_1DDBA1814((uint64_t)a1);
  objc_msgSend_stringWithFormat_(NSString, v32, @"IFD0/Exif/Makernote/%@/%@", v33, v34, @"SamsungThumbnail", @"PreviewImageLength");
  v35 = (char *)objc_claimAutoreleasedReturnValue();
  v39 = sub_1DDA357A8(v31, v35, v36, v37, v38);

  memset(v53, 0, sizeof(v53));
  sub_1DDBA8EB8(a1, a2, &v52);
  LODWORD(v48) = objc_msgSend_intValue(v30, v40, v41, v42, v43);
  unsigned int v49 = objc_msgSend_intValue(v39, v44, v45, v46, v47);
  sub_1DDA1B3CC(&v50, &v49);
  sub_1DDB9FD50(a1, (int *)&v48, &v50, v21, &v51);
  sub_1DDBA8208(a1, @"IFD1/SubIFD0", &v48);
  if ((void)v52) {
    sub_1DDA480D4((uint64_t *)v53, &v52);
  }
  if ((void)v51) {
    sub_1DDA480D4((uint64_t *)v53, &v51);
  }
  if ((void)v48) {
    sub_1DDA480D4((uint64_t *)v53, &v48);
  }
  sub_1DDBA0184(v53, a2, a3);
  if (*((void *)&v48 + 1)) {
    sub_1DDA18310(*((std::__shared_weak_count **)&v48 + 1));
  }
  if (*((void *)&v51 + 1)) {
    sub_1DDA18310(*((std::__shared_weak_count **)&v51 + 1));
  }
  if (*((void *)&v52 + 1)) {
    sub_1DDA18310(*((std::__shared_weak_count **)&v52 + 1));
  }
  *(void *)&long long v52 = v53;
  sub_1DDA18270((void ***)&v52);
}

void sub_1DDBCC0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, void **a16, std::__shared_weak_count *a17, char a18)
{
  if (a15) {
    sub_1DDA18310(a15);
  }
  if (a17) {
    sub_1DDA18310(a17);
  }
  a16 = (void **)&a18;
  sub_1DDA18270(&a16);

  _Unwind_Resume(a1);
}

uint64_t sub_1DDBCC1A0(unsigned char *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v10 = a2;
  sub_1DDBA5A38(a1, v10, word_1F398C250, 0, a5 + a3, a6);
  (*(void (**)(unsigned char *))(*(void *)a1 + 160))(a1);

  return 1;
}

void sub_1DDBCC234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DDBCC244(unsigned char *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11 = a2;
  if (*(_DWORD *)(a4 + 4))
  {
    uint64_t v12 = NSString;
    id v21 = v11;
    uint64_t v13 = sub_1DDBA175C(a3);
    uint64_t v17 = objc_msgSend_stringWithFormat_(v12, v14, @"%@/%@", v15, v16, v21, v13);

    unsigned int v18 = *(_DWORD *)(a4 + 8);
    unsigned int v19 = bswap32(v18);
    if (a6) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = v18;
    }
    sub_1DDBA5A38(a1, v17, word_1E6D06FF0, v20, a5, a6);

    id v11 = v21;
  }
}

void sub_1DDBCC328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1DDBCC34C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  if (*(_DWORD *)(a4 + 4) == 1)
  {
    unsigned int v7 = bswap32(*(unsigned __int16 *)(a4 + 8)) >> 16;
    if (a6) {
      unsigned __int16 v8 = v7;
    }
    else {
      unsigned __int16 v8 = *(_WORD *)(a4 + 8);
    }
    sub_1DDBA1778(a1);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend_numberWithInt_(NSNumber, v9, v8, v10, v11);
    uint64_t v13 = (void *)*MEMORY[0x1E4F2F6D8];
    sub_1DDA784D0(v16, (void *)*MEMORY[0x1E4F2F6D8], (void *)*MEMORY[0x1E4F2F6F8], v12);

    sub_1DDBCC484(v14, v8);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      uint64_t v15 = sub_1DDBA1778(a1);
      sub_1DDA784D0(v15, v13, (void *)*MEMORY[0x1E4F2F708], v17);
    }
  }
}

void sub_1DDBCC45C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_1DDBCC484(uint64_t a1, unsigned int a2)
{
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  v6 = sub_1DDBE3DE4(@"samsung");
  if (v6)
  {
    objc_msgSend_stringWithFormat_(NSString, v3, @"%u", v4, v5, a2);
    unsigned int v7 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = sub_1DDA83A80(v6, v7, v8, v9, v10);

    for (unint64_t i = 0; ; unint64_t i = v63 + 1)
    {
      unint64_t v63 = i;
      if (i >= objc_msgSend_count(v11, v12, v13, v14, v15)) {
        break;
      }
      uint64_t v20 = sub_1DDB66820(v11, (const char *)&v63, v17, v18, v19);
      if (objc_msgSend_count(v20, v21, v22, v23, v24) == 5)
      {
        __p[0] = 0;
        uint64_t v28 = sub_1DDB65E24(v20, (const char *)__p, v25, v26, v27);
        __p[0] = (void *)1;
        double v32 = sub_1DDB667D0(v20, (const char *)__p, v29, v30, v31);
        __p[0] = (void *)2;
        double v36 = sub_1DDB667D0(v20, (const char *)__p, v33, v34, v35);
        __p[0] = (void *)3;
        double v40 = sub_1DDB667D0(v20, (const char *)__p, v37, v38, v39);
        __p[0] = (void *)4;
        double v44 = sub_1DDB667D0(v20, (const char *)__p, v41, v42, v43);
        if (v28)
        {
          double v45 = v44;
          id v46 = v28;
          long long v51 = (char *)objc_msgSend_UTF8String(v46, v47, v48, v49, v50);
          sub_1DDA1A880(v55, v51);
          if (SHIBYTE(v56) < 0)
          {
            sub_1DDA2639C(__p, v55[0], (unint64_t)v55[1]);
          }
          else
          {
            *(_OWORD *)__p = *(_OWORD *)v55;
            uint64_t v58 = v56;
          }
          double v59 = v32;
          double v60 = v36;
          double v61 = v40;
          double v62 = v45;
          sub_1DDBB4C18(&v64, (long long *)__p);
          if (SHIBYTE(v58) < 0) {
            operator delete(__p[0]);
          }
          if (SHIBYTE(v56) < 0) {
            operator delete(v55[0]);
          }
        }
      }
    }
  }
  uint64_t v52 = v64;
  if (v65 == v64)
  {
    v53 = 0;
  }
  else
  {
    if (*(char *)(v64 + 23) < 0) {
      uint64_t v52 = *(void *)v64;
    }
    v53 = objc_msgSend_stringWithUTF8String_(NSString, v3, v52, v4, v5);
  }

  __p[0] = &v64;
  sub_1DDBB5984((void ***)__p);

  return v53;
}

void sub_1DDBCC6D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  a18 = &a30;
  sub_1DDBB5984((void ***)&a18);
  _Unwind_Resume(a1);
}

void sub_1DDBCC778(uint64_t *a1@<X1>, void **a2@<X2>, void **a3@<X3>, void *a4@<X8>)
{
  uint64_t v8 = operator new(0xE0uLL);
  sub_1DDBCC804(v8, a1, a2, a3);
  *a4 = v8 + 3;
  a4[1] = v8;

  sub_1DDA1AF34((uint64_t)a4, v8 + 8, (uint64_t)(v8 + 3));
}

void sub_1DDBCC7F0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_1DDBCC804(void *a1, uint64_t *a2, void **a3, void **a4)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_1F398C3D0;
  sub_1DDBAA64C((uint64_t)(a1 + 3), a2, *a3, *a4);
  a1[3] = &unk_1F398C2D8;
  return a1;
}

void sub_1DDBCC870(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_1DDBCC884(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F398C3D0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1DDBCC8A4(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F398C3D0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1E01C3DC0);
}

uint64_t sub_1DDBCC8F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 48))();
}

void sub_1DDBCC920(const void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  id v13 = a2;
  if (a1)
  {
    uint64_t v10 = __dynamic_cast(a1, (const struct __class_type_info *)&unk_1F39869C0, (const struct __class_type_info *)&unk_1F398C608, 0);
    if (v10) {
      sub_1DDBCDE14((uint64_t)v10, v11, a3, a4, v12, a6);
    }
  }
}

void sub_1DDBCC9D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DDBCC9EC(const void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  id v13 = a2;
  if (a1)
  {
    uint64_t v11 = __dynamic_cast(a1, (const struct __class_type_info *)&unk_1F39869C0, (const struct __class_type_info *)&unk_1F398C608, 0);
    if (v11) {
      sub_1DDBCDEFC((uint64_t)v11, v12, a3, a4, a5, a6);
    }
  }
}

void sub_1DDBCCAB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DDBCCAC8(uint64_t *a1@<X0>, void *a2@<X1>, void *a3@<X2>, _OWORD *a4@<X8>)
{
  id v9 = a2;
  id v8 = a3;
  sub_1DDBCE318(a1, &v9, &v8, &v7);
  *a4 = v7;
}

void sub_1DDBCCB40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1DDBCCB5C(uint64_t a1)
{
  v2 = sub_1DDBA1778(a1);
  sub_1DDB6DAE4(v2, (void *)*MEMORY[0x1E4F2F800], @"LensModel");
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  v3 = sub_1DDBA1778(a1);
  uint64_t v4 = (void *)*MEMORY[0x1E4F2F6D8];
  uint64_t v5 = sub_1DDBB77F0(v3, (void *)*MEMORY[0x1E4F2F6D8], (void *)*MEMORY[0x1E4F2F6F8]);

  if (v5)
  {
    int v10 = objc_msgSend_intValue(v5, v6, v7, v8, v9);
    uint64_t v11 = sub_1DDBCCD04(a1, v10);
    if (sub_1DDB9FCD0(v11, v13, 0))
    {
      uint64_t v12 = sub_1DDBA1778(a1);
      sub_1DDBA6668(v12, v4, (void *)*MEMORY[0x1E4F2F708]);
    }
    else
    {
      uint64_t v12 = sub_1DDBA1778(a1);
      sub_1DDA784D0(v12, v4, (void *)*MEMORY[0x1E4F2F708], v11);
    }
  }
  sub_1DDBA7974(a1);
}

void sub_1DDBCCCAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_1DDBCCD04(uint64_t a1, uint64_t a2)
{
  uint64_t v168 = 0;
  uint64_t v169 = 0;
  uint64_t v170 = 0;
  if (a2 != 0xFFFF
    || (sub_1DDBA1778(a1),
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        sub_1DDB6DAE4(v4, (void *)*MEMORY[0x1E4F2F6D8], (void *)*MEMORY[0x1E4F2F708]),
        id v5 = (id)objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    uint64_t v9 = sub_1DDBE3DE4(@"sony");
    if (v9)
    {
      objc_msgSend_stringWithFormat_(NSString, v6, @"%lld", v7, v8, a2);
      int v10 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = sub_1DDA83A80(v9, v10, v11, v12, v13);

      for (unint64_t i = 0; ; unint64_t i = v167 + 1)
      {
        unint64_t v167 = i;
        if (i >= objc_msgSend_count(v14, v15, v16, v17, v18)) {
          break;
        }
        uint64_t v23 = sub_1DDB66820(v14, (const char *)&v167, v20, v21, v22);
        if (objc_msgSend_count(v23, v24, v25, v26, v27) == 5)
        {
          __p[0] = 0;
          uint64_t v31 = sub_1DDB65E24(v23, (const char *)__p, v28, v29, v30);
          __p[0] = (void *)1;
          double v35 = sub_1DDB667D0(v23, (const char *)__p, v32, v33, v34);
          __p[0] = (void *)2;
          double v39 = sub_1DDB667D0(v23, (const char *)__p, v36, v37, v38);
          __p[0] = (void *)3;
          double v43 = sub_1DDB667D0(v23, (const char *)__p, v40, v41, v42);
          __p[0] = (void *)4;
          double v47 = sub_1DDB667D0(v23, (const char *)__p, v44, v45, v46);
          if (v31)
          {
            double v48 = v47;
            id v49 = v31;
            v54 = (char *)objc_msgSend_UTF8String(v49, v50, v51, v52, v53);
            sub_1DDA1A880(v161, v54);
            if (SHIBYTE(v162) < 0)
            {
              sub_1DDA2639C(__p, v161[0], (unint64_t)v161[1]);
            }
            else
            {
              *(_OWORD *)__p = *(_OWORD *)v161;
              uint64_t v164 = v162;
            }
            *(double *)&long long v165 = v35;
            *((double *)&v165 + 1) = v39;
            *(double *)&long long v166 = v43;
            *((double *)&v166 + 1) = v48;
            sub_1DDBB4C18(&v168, (long long *)__p);
            if (SHIBYTE(v164) < 0) {
              operator delete(__p[0]);
            }
            if (SHIBYTE(v162) < 0) {
              operator delete(v161[0]);
            }
          }
        }
      }
    }
    uint64_t v55 = v168;
    if (v169 - v168 == 56)
    {
      if (*(char *)(v168 + 23) < 0) {
        uint64_t v55 = *(void *)v168;
      }
      objc_msgSend_stringWithUTF8String_(NSString, v6, v55, v7, v8);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_87;
    }
    if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v169 - v168) >> 3)) < 2)
    {
      id v5 = 0;
LABEL_87:

      goto LABEL_88;
    }
    uint64_t v56 = sub_1DDBA91F8(a1);
    v57 = sub_1DDBA1778(a1);
    uint64_t v58 = sub_1DDA2E3A8(v57, (void *)*MEMORY[0x1E4F2F6D8], 0);

    double v62 = sub_1DDA357A8(v56, (const char *)*MEMORY[0x1E4F2F850], v59, v60, v61);
    uint64_t v66 = sub_1DDA357A8(v56, (const char *)*MEMORY[0x1E4F2F8B0], v63, v64, v65);
    v70 = sub_1DDA83A80(v56, (const char *)*MEMORY[0x1E4F2F700], v67, v68, v69);
    v76 = v70;
    double v77 = 0.0;
    if (v70)
    {
      double v79 = 0.0;
      if (objc_msgSend_count(v70, v71, v72, v73, v74) == 4)
      {
        __p[0] = 0;
        double v79 = sub_1DDB667D0(v76, (const char *)__p, v78, v73, v74);
        __p[0] = (void *)1;
        double v77 = sub_1DDB667D0(v76, (const char *)__p, v80, v81, v82);
        __p[0] = (void *)2;
        sub_1DDB667D0(v76, (const char *)__p, v83, v84, v85);
        __p[0] = (void *)3;
        double v75 = sub_1DDB667D0(v76, (const char *)__p, v86, v87, v88);
      }
    }
    else
    {
      double v79 = 0.0;
    }
    uint64_t v89 = v168;
    if (*(char *)(v168 + 23) < 0) {
      uint64_t v89 = *(void *)v168;
    }
    v94 = objc_msgSend_stringWithUTF8String_(NSString, v71, v89, v73, v74, v75);
    if (v62)
    {
      v158 = v58;
      v159 = v56;
      v156 = v66;
      v157 = v62;
      objc_msgSend_doubleValue(v62, v90, v91, v92, v93);
      long double v96 = v95;
      objc_msgSend_doubleValue(v66, v97, v98, v99, v100);
      double v102 = exp2(v101 * 0.5);
      v107 = sub_1DDA49F48(0x6DB6DB6DB6DB6DB7 * ((v169 - v168) >> 3));
      uint64_t v109 = v168;
      if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v169 - v168) >> 3)) >= 2)
      {
        double v154 = log(v96);
        uint64_t v110 = 0;
        v111 = 0;
        double v112 = 999999999.0;
        unint64_t v113 = 1;
        double v160 = v102;
        while (1)
        {
          v114 = (void **)(v109 + v110 + 56);
          if (*(char *)(v109 + v110 + 79) < 0)
          {
            double v116 = v112;
            sub_1DDA2639C(__p, *v114, *(void *)(v109 + v110 + 64));
            double v112 = v116;
          }
          else
          {
            long long v115 = *(_OWORD *)v114;
            uint64_t v164 = *(void *)(v109 + v110 + 72);
            *(_OWORD *)__p = v115;
          }
          long long v117 = *(_OWORD *)(v109 + v110 + 96);
          long long v165 = *(_OWORD *)(v109 + v110 + 80);
          long long v166 = v117;
          long long v118 = v165;
          long double v119 = *((double *)&v117 + 1);
          double v108 = *(double *)&v117;
          if (v79 > 0.0 && vabdd_f64(v79, *(double *)&v165) > 0.9) {
            goto LABEL_66;
          }
          if (v77 > 0.0 && vabdd_f64(v77, *((double *)&v165 + 1)) > 0.9) {
            goto LABEL_66;
          }
          if (v96 < *(double *)&v165 + -0.9 || v96 > *((double *)&v165 + 1) + 0.9) {
            goto LABEL_66;
          }
          if (v102 <= 0.0) {
            break;
          }
          if (v102 < *(double *)&v166 + -0.15 || v102 > *((double *)&v166 + 1) + 0.15) {
            goto LABEL_66;
          }
          if (*(double *)&v165 != *((double *)&v165 + 1) && *(double *)&v166 != *((double *)&v166 + 1))
          {
            double v155 = v112;
            double v122 = log(*(long double *)&v117);
            long double v123 = log(v119) - v122;
            double v124 = log(*((long double *)&v118 + 1));
            long double v125 = log(*(long double *)&v118);
            long double v126 = v122 + v123 / (v124 - v125) * (v154 - v125);
            double v102 = v160;
            double v108 = exp(v126);
            double v112 = v155;
          }
          double v127 = vabdd_f64(v102, v108);
          double v108 = v112 + 0.15;
          if (v127 <= v112 + 0.15)
          {
            if (v127 < v112 + -0.15)
            {
              if (v164 >= 0) {
                objc_msgSend_stringWithUTF8String_(NSString, v103, (uint64_t)__p, v105, v106);
              }
              else {
              uint64_t v128 = objc_msgSend_stringWithUTF8String_(NSString, v103, (uint64_t)__p[0], v105, v106);
              }

              v111 = (void *)v128;
            }
            goto LABEL_61;
          }
LABEL_65:
          double v102 = v160;
LABEL_66:
          if (SHIBYTE(v164) < 0)
          {
            double v133 = v112;
            operator delete(__p[0]);
            double v112 = v133;
          }
          ++v113;
          uint64_t v109 = v168;
          v110 += 56;
          if (v113 >= 0x6DB6DB6DB6DB6DB7 * ((v169 - v168) >> 3)) {
            goto LABEL_71;
          }
        }
        double v127 = v112;
LABEL_61:
        if (v164 >= 0) {
          objc_msgSend_stringWithUTF8String_(NSString, v103, (uint64_t)__p, v105, v106);
        }
        else {
        v129 = objc_msgSend_stringWithUTF8String_(NSString, v103, (uint64_t)__p[0], v105, v106);
        }
        objc_msgSend_addObject_(v107, v130, (uint64_t)v129, v131, v132);

        double v112 = v127;
        goto LABEL_65;
      }
      v111 = 0;
LABEL_71:
      if (objc_msgSend_count(v107, v103, v104, v105, v106, v108))
      {
        if (v111) {
          objc_msgSend_stringWithString_(MEMORY[0x1E4F28E78], v134, (uint64_t)v111, v135, v136);
        }
        else {
          objc_msgSend_stringWithString_(MEMORY[0x1E4F28E78], v134, (uint64_t)&stru_1F398F7F8, v135, v136);
        }
        id v5 = (id)objc_claimAutoreleasedReturnValue();
        for (j = 0; ; j = (char *)__p[0] + 1)
        {
          __p[0] = j;
          if ((unint64_t)j >= objc_msgSend_count(v107, v137, v138, v139, v140)) {
            break;
          }
          v145 = sub_1DDB65E24(v107, (const char *)__p, v142, v143, v144);
          if (objc_msgSend_length(v5, v146, v147, v148, v149))
          {
            if (!v111 || (objc_msgSend_isEqualToString_(v145, v150, (uint64_t)v111, v151, v152) & 1) == 0) {
              objc_msgSend_appendFormat_(v5, v150, @" or %@", v151, v152, v145);
            }
          }
          else
          {
            objc_msgSend_appendString_(v5, v150, (uint64_t)v145, v151, v152);
          }
        }
        uint64_t v58 = v158;
        uint64_t v56 = v159;
        uint64_t v66 = v156;
        double v62 = v157;
        goto LABEL_86;
      }

      uint64_t v58 = v158;
      uint64_t v66 = v156;
      double v62 = v157;
    }
    id v5 = v94;
LABEL_86:

    goto LABEL_87;
  }
LABEL_88:
  __p[0] = &v168;
  sub_1DDBB5984((void ***)__p);

  return v5;
}

void sub_1DDBCD4A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (a33 < 0) {
    operator delete(__p);
  }

  __p = (void *)(v37 - 176);
  sub_1DDBB5984((void ***)&__p);
  _Unwind_Resume(a1);
}

void sub_1DDBCD65C(uint64_t a1)
{
  v2 = sub_1DDBA1778(a1);
  v3 = (void *)*MEMORY[0x1E4F2F6D8];
  id v11 = v2;
  BOOL v4 = sub_1DDBA6568(v2, (void *)*MEMORY[0x1E4F2F6D8], @"ImageStabilization");

  if (v4)
  {
    sub_1DDBA1778(a1);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    int v5 = sub_1DDBA65E8(v12, v3, @"ImageStabilization");

    if (v5) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 0;
    }
    sub_1DDBA1778(a1);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    int v10 = objc_msgSend_numberWithInt_(NSNumber, v7, v6, v8, v9);
    sub_1DDA784D0(v13, v3, @"ImageStabilization", v10);
  }
}

void sub_1DDBCD768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

__CFString *sub_1DDBCD790()
{
  return @"{MakerSony}";
}

BOOL sub_1DDBCD79C(uint64_t a1)
{
  v1 = sub_1DDBA1778(a1);
  v2 = sub_1DDB6DAE4(v1, (void *)*MEMORY[0x1E4F2FD40], (void *)*MEMORY[0x1E4F2FD68]);

  BOOL v3 = sub_1DDBB4B08(v2, @"DSLR-A100", 0) != 0;
  return v3;
}

void sub_1DDBCD818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_1DDBCD834(unsigned char *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  uint64_t v14 = 0;
  v15[0] = 0;
  *(void *)((char *)v15 + 5) = 0;
  uint64_t v11 = sub_1DDBA1314((uint64_t)a1, (uint64_t)&v14, 20, a5, a3);
  if (v11 == 20)
  {
    if (v14 ^ 0x43534420594E4F53 | LOWORD(v15[0]) ^ 0x20) {
      uint64_t v12 = a3;
    }
    else {
      uint64_t v12 = a3 + 12;
    }
    sub_1DDBA5A38(a1, v10, word_1F398C410, v12, a5, a6);
    (*(void (**)(unsigned char *))(*(void *)a1 + 160))(a1);
  }

  return v11 == 20;
}

void sub_1DDBCD95C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DDBCD974(uint64_t a1)
{
  sub_1DDBA1778(a1);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v2 = sub_1DDBA6568(v21, @"{PictStyleSetting}", @"SceneMode");

  if (v2)
  {
    sub_1DDBA1778(a1);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    signed int v3 = sub_1DDBA65E8(v22, @"{PictStyleSetting}", @"SceneMode");

    sub_1DDBCDCA4(v4, v3);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    sub_1DDBA4BE8(a1, @"{PictureStyle}", @"SceneMode", v23, (float)v3, (float)v3);
  }
  sub_1DDBA1778(a1);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v5 = sub_1DDBA6568(v24, @"{PictStyleSetting}", @"ColorMode");

  if (v5)
  {
    sub_1DDBA1778(a1);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    int v6 = sub_1DDBA65E8(v25, @"{PictStyleSetting}", @"ColorMode");

    sub_1DDBCDCC4(v7, v6);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    sub_1DDBA4BE8(a1, @"{PictureStyle}", @"ColorMode", v26, (float)v6, (float)v6);

    BOOL v8 = v6 == 6;
  }
  else
  {
    BOOL v8 = 0;
  }
  uint64_t v9 = sub_1DDBA1778(a1);
  sub_1DDA2E3A8(v9, @"{PictureStyle}", 0);
  id v27 = (id)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    if (!sub_1DDA2E4E0(v27, @"Monochrome")) {
      sub_1DDBA4B30(a1, @"Monochrome", v8);
    }
    int v10 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1);
    if ((v10 & 0x80000000) == 0)
    {
      uint64_t v11 = @"{PictureStyle}";
      uint64_t v12 = sub_1DDBA4D7C(a1, v10);
      sub_1DDBA4BE8(a1, v11, @"PictStyleColorSpace", v12, (float)v10, (float)v10);
    }
  }
  id v13 = sub_1DDBA1778(a1);
  objc_msgSend_removeObjectForKey_(v13, v14, @"{PictStyleSetting}", v15, v16);

  uint64_t v17 = sub_1DDBA1778(a1);
  objc_msgSend_removeObjectForKey_(v17, v18, @"{PictStyleNormalized}", v19, v20);
}

void sub_1DDBCDC38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

__CFString *sub_1DDBCDCA4(uint64_t a1, unsigned int a2)
{
  if (a2 > 0x11) {
    return 0;
  }
  else {
    return off_1E6D07078[a2];
  }
}

__CFString *sub_1DDBCDCC4(uint64_t a1, int a2)
{
  result = 0;
  switch(a2)
  {
    case 0:
      result = @"Standard";
      break;
    case 1:
      result = @"Vivid";
      break;
    case 2:
      result = @"Portrait";
      break;
    case 3:
      result = @"Landscape";
      break;
    case 4:
      result = @"Sunset";
      break;
    case 5:
      result = @"Night Portrait";
      break;
    case 6:
      result = @"Black and White";
      break;
    case 7:
      result = @"Adobe RGB";
      break;
    case 8:
    case 9:
    case 10:
    case 11:
      return result;
    case 12:
LABEL_4:
      result = @"Neutral";
      break;
    default:
      switch(a2)
      {
        case 'd':
          goto LABEL_4;
        case 'e':
          result = @"Clear";
          break;
        case 'f':
          result = @"Deep";
          break;
        case 'g':
          result = @"Ligth";
          break;
        case 'h':
          result = @"Night view";
          break;
        case 'i':
          result = @"Autumn Leaves";
          break;
        default:
          return result;
      }
      break;
  }
  return result;
}

void sub_1DDBCDE14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  LODWORD(v8) = *(_DWORD *)(a4 + 8);
  sub_1DDBA1778(a1);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  unsigned int v9 = bswap32(v8);
  if (a6) {
    uint64_t v8 = v9;
  }
  else {
    uint64_t v8 = v8;
  }
  int v10 = sub_1DDBA17F8(a3);
  uint64_t v11 = sub_1DDBA175C(a3);
  uint64_t v15 = objc_msgSend_numberWithInt_(NSNumber, v12, v8, v13, v14);
  sub_1DDA784D0(v16, v10, v11, v15);
}

void sub_1DDBCDED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1DDBCDEFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  v61[1] = *MEMORY[0x1E4F143B8];
  v61[0] = 0;
  unsigned int v9 = *(_DWORD *)(a4 + 8);
  unsigned int v10 = bswap32(v9);
  if (a6) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = v9;
  }
  if (sub_1DDBA1314(a1, (uint64_t)v61, 8, a5, v11) != 8) {
    return;
  }
  int v15 = v61[0] & 3;
  switch(v15)
  {
    case 3:
      char v16 = 0;
      uint64_t v17 = @"E ";
      goto LABEL_11;
    case 2:
      char v16 = 0;
      uint64_t v17 = @"FE ";
      goto LABEL_11;
    case 1:
      char v16 = 0;
      uint64_t v17 = @"DT ";
LABEL_11:
      uint64_t v59 = (uint64_t)v17;
      goto LABEL_13;
  }
  uint64_t v59 = 0;
  char v16 = 1;
LABEL_13:
  char v18 = v61[0];
  if ((v61[0] & 0x40) != 0) {
    uint64_t v19 = @"PZ ";
  }
  else {
    uint64_t v19 = 0;
  }
  char v20 = HIBYTE(v61[0]);
  id v21 = @" ZA";
  if ((v61[0] & 0x400000000000000) == 0) {
    id v21 = 0;
  }
  uint64_t v57 = (uint64_t)v21;
  uint64_t v58 = (uint64_t)v19;
  uint64_t v60 = a3;
  if ((HIBYTE(v61[0]) & 3) == 2)
  {
    char v22 = 0;
    id v23 = @" SAM";
  }
  else
  {
    if ((HIBYTE(v61[0]) & 3) != 1)
    {
      uint64_t v56 = 0;
      char v22 = 1;
      goto LABEL_24;
    }
    char v22 = 0;
    id v23 = @" SSM";
  }
  uint64_t v56 = (uint64_t)v23;
LABEL_24:
  char v24 = v61[0];
  if (SLOBYTE(v61[0]) < 0) {
    id v25 = @" OSS";
  }
  else {
    id v25 = 0;
  }
  id v26 = @" LE";
  if ((v61[0] & 0x20) == 0) {
    id v26 = 0;
  }
  uint64_t v55 = (uint64_t)v26;
  id v27 = @" II";
  if ((v61[0] & 8) == 0) {
    id v27 = 0;
  }
  uint64_t v53 = (uint64_t)v25;
  uint64_t v54 = (uint64_t)v27;
  unsigned int v28 = BYTE5(v61[0]);
  unsigned int v29 = BYTE6(v61[0]);
  if (BYTE3(v61[0]) | BYTE4(v61[0])) {
    objc_msgSend_stringWithFormat_(NSString, v12, @"%d-%dmm ", v13, v14, (BYTE2(v61[0]) & 0xF) + 100 * (BYTE1(v61[0]) & 0xF) + 10 * ((BYTE2(v61[0]) >> 4) + (BYTE1(v61[0]) >> 4)), (BYTE4(v61[0]) & 0xF) + 100 * (BYTE3(v61[0]) & 0xF) + 10 * ((BYTE4(v61[0]) >> 4) + (BYTE3(v61[0]) >> 4)));
  }
  else {
  uint64_t v33 = objc_msgSend_stringWithFormat_(NSString, v12, @"%dmm ", v13, v14, (BYTE2(v61[0]) & 0xF) + 100 * (BYTE1(v61[0]) & 0xF) + 10 * ((BYTE2(v61[0]) >> 4) + (BYTE1(v61[0]) >> 4)));
  }
  if (BYTE6(v61[0])) {
    objc_msgSend_stringWithFormat_(NSString, v30, @"F%.1f-%.1f", v31, v32, (float)((float)(int)((v28 & 0xF) + 10 * (v28 >> 4)) / 10.0), (float)((float)(int)((v29 & 0xF) + 10 * (v29 >> 4)) / 10.0));
  }
  else {
  uint64_t v34 = objc_msgSend_stringWithFormat_(NSString, v30, @"F%.1f", v31, v32, (float)((float)(int)((v28 & 0xF) + 10 * (v28 >> 4)) / 10.0));
  }
  uint64_t v38 = objc_msgSend_stringWithString_(MEMORY[0x1E4F28E78], v35, @"Sony ", v36, v37);
  uint64_t v42 = v38;
  if ((v16 & 1) == 0) {
    objc_msgSend_appendString_(v38, v39, v59, v40, v41);
  }
  if ((v18 & 0x40) != 0) {
    objc_msgSend_appendString_(v42, v39, v58, v40, v41);
  }
  objc_msgSend_appendString_(v42, v39, (uint64_t)v33, v40, v41);
  objc_msgSend_appendString_(v42, v43, (uint64_t)v34, v44, v45);
  if ((v20 & 4) != 0) {
    objc_msgSend_appendString_(v42, v46, v57, v48, v49);
  }
  if ((v22 & 1) == 0) {
    objc_msgSend_appendString_(v42, v46, v56, v48, v49);
  }
  if (v24 < 0) {
    objc_msgSend_appendString_(v42, v46, v53, v48, v49);
  }
  if ((v24 & 0x20) != 0) {
    objc_msgSend_appendString_(v42, v46, v55, v48, v49);
  }
  if ((v24 & 8) != 0) {
    objc_msgSend_appendString_(v42, v46, v54, v48, v49);
  }
  if (objc_msgSend_length(v42, v46, v47, v48, v49))
  {
    uint64_t v50 = sub_1DDBA1778(a1);
    uint64_t v51 = sub_1DDBA17F8(v60);
    uint64_t v52 = sub_1DDBA175C(v60);
    sub_1DDA784D0(v50, v51, v52, v42);
  }
}

void sub_1DDBCE2D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DDBCE318(uint64_t *a1@<X1>, void **a2@<X2>, void **a3@<X3>, void *a4@<X8>)
{
  uint64_t v8 = operator new(0xE0uLL);
  sub_1DDBCE3A4(v8, a1, a2, a3);
  *a4 = v8 + 3;
  a4[1] = v8;

  sub_1DDA1AF34((uint64_t)a4, v8 + 8, (uint64_t)(v8 + 3));
}

void sub_1DDBCE390(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_1DDBCE3A4(void *a1, uint64_t *a2, void **a3, void **a4)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_1F398C630;
  sub_1DDBAA64C((uint64_t)(a1 + 3), a2, *a3, *a4);
  a1[3] = &unk_1F398C538;
  return a1;
}

void sub_1DDBCE410(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_1DDBCE424(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F398C630;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1DDBCE444(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F398C630;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1E01C3DC0);
}

uint64_t sub_1DDBCE498(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 48))();
}

uint64_t sub_1DDBCE4C0(uint64_t a1, unsigned int a2)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v4 = v8;
  BOOL v5 = off_1EAB8A968[0];
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  sub_1DDBCE594(v4, v5, v6);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return sub_1DDA306A4(a1, a2);
}

void sub_1DDBCE57C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1DDA18310(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBCE594(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  sub_1DDAB6A18(v5, a3, &__p);
  int v6 = (uint64_t *)sub_1DDA2A530(a1 + 24, (void **)&__p.__r_.__value_.__l.__data_);
  if ((uint64_t *)(a1 + 32) != v6)
  {
    sub_1DDB43FD0((uint64_t **)(a1 + 24), v6);
    sub_1DDAB6E08((uint64_t)(v6 + 4));
    operator delete(v6);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1DDBCE634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

id sub_1DDBCE65C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend_isEqualToString_(v3, v4, @"methodNumber", v5, v6))
  {
    unsigned int v10 = NSNumber;
    uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
LABEL_5:
    uint64_t v18 = objc_msgSend_numberWithInt_(v10, v12, v11, v13, v14);
LABEL_6:
    uint64_t v19 = (void *)v18;
    goto LABEL_7;
  }
  if (objc_msgSend_isEqualToString_(v3, v7, @"sushiMode", v8, v9))
  {
    unsigned int v10 = NSNumber;
    uint64_t v11 = sub_1DDA2E598(a1);
    goto LABEL_5;
  }
  if (objc_msgSend_isEqualToString_(v3, v15, @"isV4Faux", v16, v17))
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F1CC28];
    goto LABEL_7;
  }
  if (objc_msgSend_isEqualToString_(v3, v21, @"cameraMake", v22, v23))
  {
    (*(void (**)(void **__return_ptr, uint64_t))(*(void *)a1 + 216))(&__p, a1);
    uint64_t v31 = sub_1DDA1E51C((uint64_t)&__p, v27, v28, v29, v30);
    goto LABEL_16;
  }
  if (objc_msgSend_isEqualToString_(v3, v24, @"cameraModel", v25, v26))
  {
    (*(void (**)(void **__return_ptr, uint64_t))(*(void *)a1 + 224))(&__p, a1);
    uint64_t v31 = sub_1DDA1E51C((uint64_t)&__p, v35, v36, v37, v38);
LABEL_16:
    uint64_t v19 = (void *)v31;
    if (v171 < 0) {
      operator delete(__p);
    }
    goto LABEL_7;
  }
  if (objc_msgSend_isEqualToString_(v3, v32, @"isDNGFile", v33, v34))
  {
    uint64_t v42 = NSNumber;
    uint64_t v43 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(a1);
LABEL_22:
    uint64_t v18 = objc_msgSend_numberWithBool_(v42, v44, v43, v45, v46);
    goto LABEL_6;
  }
  if (objc_msgSend_isEqualToString_(v3, v39, @"isDNGMethod", v40, v41))
  {
    uint64_t v42 = NSNumber;
    uint64_t v43 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 128))(a1);
    goto LABEL_22;
  }
  if (objc_msgSend_isEqualToString_(v3, v47, @"iso", v48, v49))
  {
    uint64_t v53 = NSNumber;
    uint64_t v54 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 256))(a1);
LABEL_25:
    uint64_t v18 = objc_msgSend_numberWithUnsignedInt_(v53, v55, v54, v56, v57);
    goto LABEL_6;
  }
  if (objc_msgSend_isEqualToString_(v3, v50, (uint64_t)off_1EAB8AA28[0], v51, v52))
  {
    unsigned int v10 = NSNumber;
    uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 816))(a1);
    goto LABEL_5;
  }
  if (objc_msgSend_isEqualToString_(v3, v58, @"whiteLevelThresholdMultiplier", v59, v60))
  {
    uint64_t v64 = NSNumber;
    (*(void (**)(uint64_t))(*(void *)a1 + 848))(a1);
LABEL_30:
    uint64_t v18 = objc_msgSend_numberWithDouble_(v64, v65, v66, v67, v68);
    goto LABEL_6;
  }
  if (objc_msgSend_isEqualToString_(v3, v61, (uint64_t)off_1EAB8A960[0], v62, v63))
  {
    std::string __p = (void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 560))(a1);
    uint64_t v18 = sub_1DDBE17C0((unsigned int *)&__p, v72, v73, v74, v75);
    goto LABEL_6;
  }
  if (objc_msgSend_isEqualToString_(v3, v69, (uint64_t)off_1EAB8A988[0], v70, v71))
  {
    std::string __p = (void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 408))(a1);
    uint64_t v18 = sub_1DDBE17C0((unsigned int *)&__p, v79, v80, v81, v82);
    goto LABEL_6;
  }
  if (objc_msgSend_isEqualToString_(v3, v76, @"evenSensorSize", v77, v78))
  {
    std::string __p = (void *)((*(uint64_t (**)(uint64_t))(*(void *)a1 + 408))(a1) & 0xFFFFFFFEFFFFFFFELL);
    uint64_t v18 = sub_1DDBE17C0((unsigned int *)&__p, v86, v87, v88, v89);
    goto LABEL_6;
  }
  if (objc_msgSend_isEqualToString_(v3, v83, (uint64_t)off_1EAB8A990[0], v84, v85))
  {
    std::string __p = (void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 432))(a1);
    uint64_t v170 = v93;
    uint64_t v18 = sub_1DDAD06E0((unsigned int *)&__p, (const char *)v93, v94, v95, v96);
    goto LABEL_6;
  }
  if (objc_msgSend_isEqualToString_(v3, v90, (uint64_t)off_1EAB8A998[0], v91, v92))
  {
    std::string __p = (void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 456))(a1);
    uint64_t v170 = v100;
    uint64_t v18 = sub_1DDAD06E0((unsigned int *)&__p, (const char *)v100, v101, v102, v103);
    goto LABEL_6;
  }
  if (objc_msgSend_isEqualToString_(v3, v97, @"rawDataSize", v98, v99))
  {
    v107 = NSNumber;
    uint64_t v108 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 344))(a1);
    uint64_t v18 = objc_msgSend_numberWithLongLong_(v107, v109, v108, v110, v111);
    goto LABEL_6;
  }
  if (objc_msgSend_isEqualToString_(v3, v104, @"longExposureNoiseReductionEnabled", v105, v106))
  {
    uint64_t v42 = NSNumber;
    uint64_t v43 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 248))(a1);
    goto LABEL_22;
  }
  if (objc_msgSend_isEqualToString_(v3, v112, @"focalLength", v113, v114))
  {
    long long v118 = NSNumber;
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a1 + 160))(&v167, a1);
    uint64_t v119 = v167;
    sub_1DDA1A880(&__p, "IFD0:EXIF");
    (*(void (**)(uint64_t, void **))(*(void *)v119 + 304))(v119, &__p);
    uint64_t v124 = objc_msgSend_numberWithDouble_(v118, v120, v121, v122, v123);
LABEL_51:
    uint64_t v19 = (void *)v124;
    if (v171 < 0) {
      operator delete(__p);
    }
    if (v168) {
      sub_1DDA18310(v168);
    }
    goto LABEL_7;
  }
  if (objc_msgSend_isEqualToString_(v3, v115, @"exifPixelXDimension", v116, v117))
  {
    uint64_t v128 = NSNumber;
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a1 + 160))(&v167, a1);
    uint64_t v129 = v167;
    sub_1DDA1A880(&__p, "IFD0:EXIF");
    uint64_t v130 = (*(uint64_t (**)(uint64_t, void **))(*(void *)v129 + 312))(v129, &__p);
    uint64_t v124 = objc_msgSend_numberWithUnsignedInt_(v128, v131, v130, v132, v133);
    goto LABEL_51;
  }
  if (objc_msgSend_isEqualToString_(v3, v125, @"exifPixelYDimension", v126, v127))
  {
    v137 = NSNumber;
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a1 + 160))(&v167, a1);
    uint64_t v138 = v167;
    sub_1DDA1A880(&__p, "IFD0:EXIF");
    uint64_t v139 = (*(uint64_t (**)(uint64_t, void **))(*(void *)v138 + 320))(v138, &__p);
    uint64_t v124 = objc_msgSend_numberWithUnsignedInt_(v137, v140, v139, v141, v142);
    goto LABEL_51;
  }
  if (objc_msgSend_isEqualToString_(v3, v134, @"bitsPerSample", v135, v136)
    || objc_msgSend_isEqualToString_(v3, v143, @"sensorBitDepth", v144, v145))
  {
    uint64_t v53 = NSNumber;
    uint64_t v54 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 576))(a1);
    goto LABEL_25;
  }
  if (objc_msgSend_isEqualToString_(v3, v146, @"subsampling", v147, v148))
  {
    uint64_t v53 = NSNumber;
    uint64_t v54 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 544))(a1);
    goto LABEL_25;
  }
  if (objc_msgSend_isEqualToString_(v3, v149, (uint64_t)off_1EAB8A9F8[0], v150, v151))
  {
    uint64_t v64 = NSNumber;
    (*(void (**)(uint64_t))(*(void *)a1 + 896))(a1);
    goto LABEL_30;
  }
  if (objc_msgSend_isEqualToString_(v3, v152, (uint64_t)off_1EAB8A9C0[0], v153, v154))
  {
    v158 = NSNumber;
    uint64_t v159 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 864))(a1);
    uint64_t v18 = objc_msgSend_numberWithUnsignedShort_(v158, v160, v159, v161, v162);
    goto LABEL_6;
  }
  if (objc_msgSend_isEqualToString_(v3, v155, @"rn", v156, v157))
  {
    uint64_t v64 = NSNumber;
    (*(void (**)(uint64_t, void, void))(*(void *)a1 + 2664))(a1, 0, 0);
    goto LABEL_30;
  }
  if (objc_msgSend_isEqualToString_(v3, v163, @"rnp", v164, v165))
  {
    uint64_t v64 = NSNumber;
    (*(void (**)(uint64_t))(*(void *)a1 + 2672))(a1);
    goto LABEL_30;
  }
  (*(void (**)(void **__return_ptr, uint64_t))(*(void *)a1 + 160))(&__p, a1);
  uint64_t v19 = (*(void (**)(void *, id))(*(void *)__p + 32))(__p, v3);
  if (v170) {
    sub_1DDA18310(v170);
  }
  if (!v19)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01C3B90](exception, "RawCameraException");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
LABEL_7:

  return v19;
}

void sub_1DDBCF12C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, std::__shared_weak_count *a13, int a14, __int16 a15, char a16, char a17)
{
  if (a13) {
    sub_1DDA18310(a13);
  }

  _Unwind_Resume(a1);
}

double sub_1DDBCF1E4(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A8E8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBCF304;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBCF2EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBCF304()
{
  return sub_1DDA2E6FC();
}

id sub_1DDBCF30C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a1 + 72))(&v9, a1);
  uint64_t v7 = sub_1DDB65E90(v9, v5, v6);
  if (v10) {
    sub_1DDA18310(v10);
  }

  return v7;
}

void sub_1DDBCF3BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1DDA18310(a10);
  }

  _Unwind_Resume(a1);
}

uint64_t (*sub_1DDBCF3E4(uint64_t a1))(void, void, void, void, void)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A8F0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBCF8BC;
  v7[3] = &unk_1E6D07108;
  v7[4] = a1;
  id v5 = sub_1DDBCF4FC(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBCF4E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t (*sub_1DDBCF4FC(uint64_t a1, void *a2, int a3, void *a4))(void, void, void, void, void)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  sub_1DDAB6A18(v7, a3, &__p);
  uint64_t v9 = (uint64_t **)(a1 + 24);
  unsigned int v10 = sub_1DDA2A530(a1 + 24, (void **)&__p.__r_.__value_.__l.__data_);
  if ((void **)(a1 + 32) == v10)
  {
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = sub_1DDBE18AC;
    v43[3] = &unk_1E6D051E8;
    uint64_t v13 = (uint64_t (**)(void))v8;
    id v44 = v13;
    sub_1DDB657E4(a1, v7, v43, &p_p);
    uint64_t v18 = (long long *)p_p;
    if (p_p)
    {
      uint64_t v19 = sub_1DDB67AB8((uint64_t)p_p, v14, v15, v16, v17);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1E01C3B90](exception, "RawCameraException");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      uint64_t v23 = objc_msgSend_objectAtIndexedSubscript_(v19, v20, 0, v21, v22);
      unsigned int v28 = objc_msgSend_intValue(v23, v24, v25, v26, v27);
      uint64_t v32 = objc_msgSend_objectAtIndexedSubscript_(v19, v29, 1, v30, v31);
      uint64_t v37 = objc_msgSend_intValue(v32, v33, v34, v35, v36);

      uint64_t v12 = (uint64_t (*)(void, void, void, void, void))(v28 | (unint64_t)(v37 << 32));
    }
    else
    {
      uint64_t v12 = 0;
    }
    if (v48) {
      sub_1DDA18310(v48);
    }

    if (!v18) {
      uint64_t v12 = (uint64_t (*)(void, void, void, void, void))v13[2](v13);
    }
    p_p = &__p;
    uint64_t v38 = sub_1DDAB6C70(v9, (void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&unk_1DDBFB044, (long long **)&p_p);
    double v39 = (void (**)(uint64_t, void, std::string **, void, void))(v38 + 7);
    v46[0] = (uint64_t (*)(void, void, void, void, void))sub_1DDBE1944;
    v46[1] = v12;
    if (v46 != (uint64_t (**)(void, void, void, void, void))(v38 + 7))
    {
      uint64_t v40 = *v39;
      if (*v39)
      {
        p_p = 0;
        uint64_t v48 = 0;
        v40(2, v39, &p_p, 0, 0);
        v46[0](2, v46, v39, 0, 0);
        ((void (*)(uint64_t, std::string **, uint64_t (**)(void, void, void, void, void), void, void))p_p)(2, &p_p, v46, 0, 0);
        sub_1DDAB6E58((uint64_t (**)(void, void, void, void, void))&p_p);
      }
      else
      {
        v38[7] = (uint64_t)sub_1DDBE1944;
        v38[8] = (uint64_t)v12;
        v46[0] = 0;
      }
    }
    sub_1DDAB6E58(v46);
  }
  else
  {
    uint64_t v11 = sub_1DDBE18F8((uint64_t (**)(uint64_t, void, void, void *, void *))v10 + 7);
    if (!v11) {
      sub_1DDAB6C00();
    }
    uint64_t v12 = (uint64_t (*)(void, void, void, void, void))*v11;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  return v12;
}

void sub_1DDBCF814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,std::__shared_weak_count *a26)
{
  __cxa_free_exception(v29);

  if (a26) {
    sub_1DDA18310(a26);
  }

  if (a20 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_1DDBCF8BC()
{
  return sub_1DDA306D8();
}

double sub_1DDBCF8C4(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A8F8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBCF9E4;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBCF9CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBCF9E4(uint64_t a1)
{
  return sub_1DDACD73C(*(void *)(a1 + 32));
}

BOOL sub_1DDBCF9EC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A900[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBCFB04;
  v7[3] = &unk_1E6D05250;
  v7[4] = a1;
  BOOL v5 = sub_1DDAC8A08(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBCFAEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBCFB04(uint64_t a1)
{
  return sub_1DDB0B8A0(*(void *)(a1 + 32));
}

void sub_1DDBCFB0C(uint64_t a1@<X0>, void *a2@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v4 = v8;
  BOOL v5 = off_1EAB8A908[0];
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBCFC24;
  v7[3] = &unk_1E6D05198;
  v7[4] = a1;
  sub_1DDAB6440(v4, v5, v6, v7, a2);
  if (v9) {
    sub_1DDA18310(v9);
  }
}

void sub_1DDBCFC0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1DDBCFC24@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_1DDACD3E8(*(void *)(a1 + 32), a2);
}

double sub_1DDBCFC2C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A910[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBCFD4C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBCFD34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBCFD4C()
{
  return sub_1DDACC814();
}

void sub_1DDBCFD54(uint64_t a1@<X0>, void *a2@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v4 = v8;
  double v5 = off_1EAB8A918[0];
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBCFE6C;
  v7[3] = &unk_1E6D05198;
  v7[4] = a1;
  sub_1DDAB6440(v4, v5, v6, v7, a2);
  if (v9) {
    sub_1DDA18310(v9);
  }
}

void sub_1DDBCFE54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBCFE6C(uint64_t a1)
{
  return sub_1DDB0A37C(*(void *)(a1 + 32));
}

uint64_t sub_1DDBCFE74(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A920[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD02FC;
  v7[3] = &unk_1E6D07128;
  v7[4] = a1;
  uint64_t v5 = sub_1DDBCFF8C(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBCFF74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBCFF8C(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  sub_1DDAB6A18(v7, a3, &__p);
  uint64_t v9 = (uint64_t **)(a1 + 24);
  unsigned int v10 = sub_1DDA2A530(a1 + 24, (void **)&__p.__r_.__value_.__l.__data_);
  if ((void **)(a1 + 32) == v10)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1DDBE1A1C;
    v29[3] = &unk_1E6D051C0;
    uint64_t v13 = (uint64_t (**)(void))v8;
    id v30 = v13;
    sub_1DDB657E4(a1, v7, v29, &p_p);
    uint64_t v18 = (long long *)p_p;
    if (p_p)
    {
      uint64_t v19 = sub_1DDB67AB8((uint64_t)p_p, v14, v15, v16, v17);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1E01C3B90](exception, "RawCameraException");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      uint64_t v12 = objc_msgSend_longLongValue(v19, v20, v21, v22, v23);
    }
    else
    {
      uint64_t v12 = 0;
    }
    if (v34) {
      sub_1DDA18310(v34);
    }

    if (!v18) {
      uint64_t v12 = v13[2](v13);
    }
    p_p = &__p;
    char v24 = sub_1DDAB6C70(v9, (void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&unk_1DDBFB044, (long long **)&p_p);
    uint64_t v25 = (void (**)(uint64_t, void, std::string **, void, void))(v24 + 7);
    v32[1] = (uint64_t (*)(void, void, void, void, void))v12;
    v32[0] = (uint64_t (*)(void, void, void, void, void))sub_1DDBE1AB4;
    if (v32 != (uint64_t (**)(void, void, void, void, void))(v24 + 7))
    {
      uint64_t v26 = *v25;
      if (*v25)
      {
        p_p = 0;
        uint64_t v34 = 0;
        v26(2, v25, &p_p, 0, 0);
        v32[0](2, v32, v25, 0, 0);
        ((void (*)(uint64_t, std::string **, uint64_t (**)(void, void, void, void, void), void, void))p_p)(2, &p_p, v32, 0, 0);
        sub_1DDAB6E58((uint64_t (**)(void, void, void, void, void))&p_p);
      }
      else
      {
        *((_DWORD *)v24 + 16) = v12;
        v24[7] = (uint64_t)sub_1DDBE1AB4;
        v32[0] = 0;
      }
    }
    sub_1DDAB6E58(v32);
  }
  else
  {
    uint64_t v11 = (unsigned int *)sub_1DDBE1A68((uint64_t (**)(uint64_t, void, void, void, void *))v10 + 7);
    if (!v11) {
      sub_1DDAB6C00();
    }
    uint64_t v12 = *v11;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  return v12;
}

void sub_1DDBD026C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,std::__shared_weak_count *a26)
{
  __cxa_free_exception(v28);

  if (a26) {
    sub_1DDA18310(a26);
  }

  if (a20 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_1DDBD02FC()
{
  return sub_1DDA30908();
}

double sub_1DDBD0304(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A928[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD0424;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD040C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD0424()
{
  return sub_1DDB4884C();
}

BOOL sub_1DDBD042C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A930[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD0544;
  v7[3] = &unk_1E6D05250;
  v7[4] = a1;
  BOOL v5 = sub_1DDAC8A08(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD052C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD0544()
{
  return sub_1DDACBE1C();
}

BOOL sub_1DDBD054C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A938[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD0664;
  v7[3] = &unk_1E6D05250;
  v7[4] = a1;
  BOOL v5 = sub_1DDAC8A08(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD064C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD0664()
{
  return 0;
}

double sub_1DDBD066C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A940[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD078C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD0774(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD078C(uint64_t a1)
{
  return sub_1DDB48858(*(void *)(a1 + 32));
}

uint64_t (*sub_1DDBD0794(uint64_t a1))(void, void, void, void, void)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A948[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD0C10;
  v7[3] = &unk_1E6D07148;
  v7[4] = a1;
  double v5 = sub_1DDBD08AC(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD0894(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t (*sub_1DDBD08AC(uint64_t a1, void *a2, int a3, void *a4))(void, void, void, void, void)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  sub_1DDAB6A18(v7, a3, &__p);
  uint64_t v9 = (uint64_t **)(a1 + 24);
  unsigned int v10 = sub_1DDA2A530(a1 + 24, (void **)&__p.__r_.__value_.__l.__data_);
  if ((void **)(a1 + 32) == v10)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1DDBE1B94;
    v29[3] = &unk_1E6D051C0;
    uint64_t v13 = (uint64_t (**)(void))v8;
    id v30 = v13;
    sub_1DDB657E4(a1, v7, v29, &p_p);
    uint64_t v18 = (long long *)p_p;
    if (p_p)
    {
      uint64_t v19 = sub_1DDB67AB8((uint64_t)p_p, v14, v15, v16, v17);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1E01C3B90](exception, "RawCameraException");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      uint64_t v12 = (uint64_t (*)(void, void, void, void, void))objc_msgSend_longLongValue(v19, v20, v21, v22, v23);
    }
    else
    {
      uint64_t v12 = 0;
    }
    if (v34) {
      sub_1DDA18310(v34);
    }

    if (!v18) {
      uint64_t v12 = (uint64_t (*)(void, void, void, void, void))v13[2](v13);
    }
    p_p = &__p;
    char v24 = sub_1DDAB6C70(v9, (void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&unk_1DDBFB044, (long long **)&p_p);
    uint64_t v25 = (void (**)(uint64_t, void, std::string **, void, void))(v24 + 7);
    v32[0] = (uint64_t (*)(void, void, void, void, void))sub_1DDBE1C2C;
    v32[1] = v12;
    if (v32 != (uint64_t (**)(void, void, void, void, void))(v24 + 7))
    {
      uint64_t v26 = *v25;
      if (*v25)
      {
        p_p = 0;
        uint64_t v34 = 0;
        v26(2, v25, &p_p, 0, 0);
        v32[0](2, v32, v25, 0, 0);
        ((void (*)(uint64_t, std::string **, uint64_t (**)(void, void, void, void, void), void, void))p_p)(2, &p_p, v32, 0, 0);
        sub_1DDAB6E58((uint64_t (**)(void, void, void, void, void))&p_p);
      }
      else
      {
        v24[7] = (uint64_t)sub_1DDBE1C2C;
        v24[8] = (uint64_t)v12;
        v32[0] = 0;
      }
    }
    sub_1DDAB6E58(v32);
  }
  else
  {
    uint64_t v11 = sub_1DDBE1BE0((uint64_t (**)(uint64_t, void, void, void, void *))v10 + 7);
    if (!v11) {
      sub_1DDAB6C00();
    }
    uint64_t v12 = (uint64_t (*)(void, void, void, void, void))*v11;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  return v12;
}

void sub_1DDBD0B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,std::__shared_weak_count *a26)
{
  __cxa_free_exception(v28);

  if (a26) {
    sub_1DDA18310(a26);
  }

  if (a20 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_1DDBD0C10(uint64_t a1)
{
  return sub_1DDA2D098(*(void *)(a1 + 32));
}

double sub_1DDBD0C18(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A950[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD0D38;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD0D20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD0D38()
{
  return sub_1DDB4A480();
}

double sub_1DDBD0D40(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A958[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD0E60;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD0E48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD0E60()
{
  return sub_1DDB4A488();
}

uint64_t (*sub_1DDBD0E68(uint64_t a1))(void, void, void, void, void)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A960[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD0F80;
  v7[3] = &unk_1E6D07108;
  v7[4] = a1;
  double v5 = sub_1DDBCF4FC(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD0F68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD0F80()
{
  return sub_1DDA306D0();
}

uint64_t (*sub_1DDBD0F88(uint64_t a1))(void, void, void, void, void)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A968[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD10A0;
  v7[3] = &unk_1E6D07108;
  v7[4] = a1;
  double v5 = sub_1DDBCF4FC(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD1088(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

unint64_t sub_1DDBD10A0(uint64_t a1)
{
  return sub_1DDA2FC88(*(unsigned int **)(a1 + 32));
}

void sub_1DDBD10A8(uint64_t a1@<X0>, void *a2@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v4 = v8;
  double v5 = off_1EAB8A970[0];
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD16BC;
  v7[3] = &unk_1E6D07168;
  v7[4] = a1;
  sub_1DDBD11C0(v4, v5, v6, v7, a2);
  if (v9) {
    sub_1DDA18310(v9);
  }
}

void sub_1DDBD11A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBD11C0(uint64_t a1@<X0>, void *a2@<X1>, int a3@<W2>, void *a4@<X3>, void *a5@<X8>)
{
  void (**v45)(void *__return_ptr);
  uint64_t **v46;
  id v47;
  __n128 __p;
  unint64_t v49;
  void v50[4];
  id v51;
  uint64_t v52;
  std::__shared_weak_count *v53;
  void *v54;
  unsigned char *v55;
  char v56;
  std::string v57;

  id v9 = a2;
  uint64_t v47 = a4;
  sub_1DDAB6A18(v9, a3, &v57);
  uint64_t v46 = (uint64_t **)(a1 + 24);
  unsigned int v10 = sub_1DDA2A530(a1 + 24, (void **)&v57.__r_.__value_.__l.__data_);
  if ((void **)(a1 + 32) == v10)
  {
    LOBYTE(v54) = 0;
    uint64_t v56 = 0;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = sub_1DDBE1D04;
    v50[3] = &unk_1E6D051E8;
    uint64_t v45 = (void (**)(void *__return_ptr))v47;
    uint64_t v51 = v45;
    sub_1DDB657E4(a1, v9, v50, &v52);
    if (v52)
    {
      uint64_t v16 = sub_1DDB67AB8(v52, v12, v13, v14, v15);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1E01C3B90](exception, "RawCameraException");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      unint64_t v21 = 0;
      std::string __p = 0uLL;
      uint64_t v49 = 0;
      while (v21 < objc_msgSend_count(v16, v17, v18, v19, v20, v45, v46))
      {
        uint64_t v25 = objc_msgSend_objectAtIndexedSubscript_(v16, v22, v21, v23, v24);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v43 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x1E01C3B90](v43, "RawCameraException");
          __cxa_throw(v43, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        int v30 = objc_msgSend_longLongValue(v25, v26, v27, v28, v29);
        int v31 = v30;
        unint64_t v32 = __p.n128_u64[1];
        if (__p.n128_u64[1] >= v49)
        {
          uint64_t v34 = (void *)__p.n128_u64[0];
          uint64_t v35 = (uint64_t)(__p.n128_u64[1] - __p.n128_u64[0]) >> 2;
          unint64_t v36 = v35 + 1;
          if ((unint64_t)(v35 + 1) >> 62) {
            sub_1DDA17F78();
          }
          uint64_t v37 = v49 - __p.n128_u64[0];
          if ((uint64_t)(v49 - __p.n128_u64[0]) >> 1 > v36) {
            unint64_t v36 = v37 >> 1;
          }
          if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v38 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v38 = v36;
          }
          if (v38)
          {
            double v39 = (char *)sub_1DDA17F90((uint64_t)&v49, v38);
            unint64_t v32 = __p.n128_u64[1];
            uint64_t v34 = (void *)__p.n128_u64[0];
          }
          else
          {
            double v39 = 0;
          }
          uint64_t v40 = &v39[4 * v35];
          *(_DWORD *)uint64_t v40 = v31;
          unint64_t v33 = (unint64_t)(v40 + 4);
          while ((void *)v32 != v34)
          {
            int v41 = *(_DWORD *)(v32 - 4);
            v32 -= 4;
            *((_DWORD *)v40 - 1) = v41;
            v40 -= 4;
          }
          __p.n128_u64[0] = (unint64_t)v40;
          __p.n128_u64[1] = v33;
          uint64_t v49 = (unint64_t)&v39[4 * v38];
          if (v34) {
            operator delete(v34);
          }
        }
        else
        {
          *(_DWORD *)__p.n128_u64[1] = v30;
          unint64_t v33 = v32 + 4;
        }
        __p.n128_u64[1] = v33;

        ++v21;
      }
      sub_1DDA8687C((uint64_t)&v54, (uint64_t)&__p);
      if (__p.n128_u64[0])
      {
        __p.n128_u64[1] = __p.n128_u64[0];
        operator delete((void *)__p.n128_u64[0]);
      }
    }
    if (v53) {
      sub_1DDA18310(v53);
    }

    if (!v56)
    {
      ((void (**)(__n128 *__return_ptr))v45)[2](&__p);
      sub_1DDA5BD44((uint64_t)&v54, &__p);
      if (__p.n128_u64[0])
      {
        __p.n128_u64[1] = __p.n128_u64[0];
        operator delete((void *)__p.n128_u64[0]);
      }
      if (!v56) {
        goto LABEL_45;
      }
    }
    __p.n128_u64[0] = (unint64_t)&v57;
    uint64_t v42 = sub_1DDAB6C70(v46, (void **)&v57.__r_.__value_.__l.__data_, (uint64_t)&unk_1DDBFB044, (long long **)&__p);
    sub_1DDBE1D8C((uint64_t)(v42 + 7), (uint64_t)&v54);
    if (!v56) {
LABEL_45:
    }
      sub_1DDA1D8BC();
    *a5 = 0;
    a5[1] = 0;
    a5[2] = 0;
    sub_1DDA1D984(a5, v54, (uint64_t)v55, (v55 - (unsigned char *)v54) >> 2);
    if (v56 && v54)
    {
      uint64_t v55 = v54;
      operator delete(v54);
    }
  }
  else
  {
    uint64_t v11 = (const void **)sub_1DDBE1ED8((uint64_t (**)(uint64_t, void, void, void *, void *))v10 + 7);
    if (!v11) {
      sub_1DDAB6C00();
    }
    *a5 = 0;
    a5[1] = 0;
    a5[2] = 0;
    sub_1DDA1D984(a5, *v11, (uint64_t)v11[1], ((unsigned char *)v11[1] - (unsigned char *)*v11) >> 2);
  }
  if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v57.__r_.__value_.__l.__data_);
  }
}

void sub_1DDBD15C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,std::__shared_weak_count *a22,void *__p,uint64_t a24,uint64_t a25,char a26)
{
  __cxa_free_exception(v27);

  if (a22) {
    sub_1DDA18310(a22);
  }

  if (a26 && __p) {
    operator delete(__p);
  }
  if (*(char *)(v28 - 89) < 0) {
    operator delete(*(void **)(v28 - 112));
  }

  _Unwind_Resume(a1);
}

void sub_1DDBD16BC(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

BOOL sub_1DDBD16C8(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A978[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD17E0;
  v7[3] = &unk_1E6D05250;
  v7[4] = a1;
  BOOL v5 = sub_1DDAC8A08(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD17C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD17E0()
{
  return 0;
}

BOOL sub_1DDBD17E8(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A980[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD1900;
  v7[3] = &unk_1E6D05250;
  v7[4] = a1;
  BOOL v5 = sub_1DDAC8A08(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD18E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD1900()
{
  return sub_1DDB09E84();
}

uint64_t (*sub_1DDBD1908(uint64_t a1))(void, void, void, void, void)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A988[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD1A20;
  v7[3] = &unk_1E6D07108;
  v7[4] = a1;
  BOOL v5 = sub_1DDBCF4FC(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD1A08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD1A20(uint64_t a1)
{
  return sub_1DDA2F31C(*(void *)(a1 + 32));
}

uint64_t (*sub_1DDBD1A28(uint64_t a1))(void, void, void, void, void)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A990[0];
  int v4 = (uint64_t (*)(void, void, void, void, void))(*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD1FB0;
  v7[3] = &unk_1E6D07188;
  v7[4] = a1;
  BOOL v5 = sub_1DDBD1B48(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD1B30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t (*sub_1DDBD1B48(uint64_t a1, void *a2, uint64_t (*a3)(void, void, void, void, void), void *a4))(void, void, void, void, void)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  sub_1DDAB6A18(v7, (int)a3, &__p);
  id v9 = (uint64_t **)(a1 + 24);
  unsigned int v10 = sub_1DDA2A530(a1 + 24, (void **)&__p.__r_.__value_.__l.__data_);
  if ((void **)(a1 + 32) == v10)
  {
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = sub_1DDBE211C;
    v66[3] = &unk_1E6D051E8;
    id v64 = v8;
    uint64_t v63 = (uint64_t (**)(void))v8;
    uint64_t v67 = v63;
    sub_1DDB657E4(a1, v7, v66, &p_p);
    uint64_t v18 = (long long *)p_p;
    if (p_p)
    {
      uint64_t v19 = sub_1DDB67AB8((uint64_t)p_p, v13, v14, v15, v16);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1E01C3B90](exception, "RawCameraException");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      uint64_t v62 = objc_msgSend_objectAtIndexedSubscript_(v19, v20, 0, v21, v22);
      int v27 = objc_msgSend_intValue(v62, v23, v24, v25, v26);
      int v31 = objc_msgSend_objectAtIndexedSubscript_(v19, v28, 1, v29, v30);
      uint64_t v65 = objc_msgSend_intValue(v31, v32, v33, v34, v35);
      double v39 = objc_msgSend_objectAtIndexedSubscript_(v19, v36, 2, v37, v38);
      unsigned int v44 = objc_msgSend_intValue(v39, v40, v41, v42, v43);
      uint64_t v48 = objc_msgSend_objectAtIndexedSubscript_(v19, v45, 3, v46, v47);
      uint64_t v53 = objc_msgSend_intValue(v48, v49, v50, v51, v52);

      unsigned int v54 = v27 & 0xFFFFFF00;
      a3 = (uint64_t (*)(void, void, void, void, void))(v44 | (unint64_t)(v53 << 32));
    }
    else
    {
      LOBYTE(v27) = 0;
      unsigned int v54 = 0;
      uint64_t v65 = v17;
    }
    if (v71) {
      sub_1DDA18310(v71);
    }

    if (!v18)
    {
      unint64_t v55 = v63[2]();
      LOBYTE(v27) = v55;
      a3 = v56;
      unsigned int v54 = v55 & 0xFFFFFF00;
      uint64_t v65 = HIDWORD(v55);
    }
    p_p = &__p;
    uint64_t v57 = sub_1DDAB6C70(v9, (void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&unk_1DDBFB044, (long long **)&p_p);
    uint64_t v58 = (void (**)(uint64_t, void, std::string **, void, void))(v57 + 7);
    uint64_t v12 = (uint64_t (*)(void, void, void, void, void))(v54 & 0xFFFFFF00 | v27 | (unint64_t)(v65 << 32));
    v69[1] = v12;
    v69[2] = a3;
    v69[0] = (uint64_t (*)(void, void, void, void, void))sub_1DDBE21B4;
    id v8 = v64;
    if (v69 != (uint64_t (**)(void, void, void, void, void))(v57 + 7))
    {
      uint64_t v59 = *v58;
      if (*v58)
      {
        p_p = 0;
        uint64_t v71 = 0;
        v59(2, v58, &p_p, 0, 0);
        v69[0](2, v69, v58, 0, 0);
        ((void (*)(uint64_t, std::string **, uint64_t (**)(void, void, void, void, void), void, void))p_p)(2, &p_p, v69, 0, 0);
        sub_1DDAB6E58((uint64_t (**)(void, void, void, void, void))&p_p);
      }
      else
      {
        v57[8] = (uint64_t)v12;
        v57[9] = (uint64_t)a3;
        v57[7] = (uint64_t)sub_1DDBE21B4;
        v69[0] = 0;
      }
    }
    sub_1DDAB6E58(v69);
  }
  else
  {
    uint64_t v11 = sub_1DDBE2168((uint64_t (**)(uint64_t, void, void, void *, void *))v10 + 7);
    if (!v11) {
      sub_1DDAB6C00();
    }
    uint64_t v12 = (uint64_t (*)(void, void, void, void, void))*v11;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  return v12;
}

void sub_1DDBD1EE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,std::__shared_weak_count *a29)
{
  __cxa_free_exception(v30);

  if (a29) {
    sub_1DDA18310(a29);
  }

  if (a23 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_1DDBD1FB0(uint64_t a1)
{
  return sub_1DDA2F54C(*(void *)(a1 + 32));
}

uint64_t (*sub_1DDBD1FB8(uint64_t a1))(void, void, void, void, void)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A998[0];
  int v4 = (uint64_t (*)(void, void, void, void, void))(*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD20D8;
  v7[3] = &unk_1E6D07188;
  v7[4] = a1;
  BOOL v5 = sub_1DDBD1B48(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD20C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

unint64_t sub_1DDBD20D8(uint64_t a1)
{
  return sub_1DDA2F840(*(void *)(a1 + 32));
}

uint64_t (*sub_1DDBD20E0(uint64_t a1))(void, void, void, void, void)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A9A0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD21F8;
  v7[3] = &unk_1E6D07108;
  v7[4] = a1;
  BOOL v5 = sub_1DDBCF4FC(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD21E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD21F8(uint64_t a1)
{
  return sub_1DDA2F268(*(void *)(a1 + 32));
}

uint64_t (*sub_1DDBD2200(uint64_t a1))(void, void, void, void, void)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A9A8[0];
  int v4 = (uint64_t (*)(void, void, void, void, void))(*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD2320;
  v7[3] = &unk_1E6D07188;
  v7[4] = a1;
  BOOL v5 = sub_1DDBD1B48(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD2308(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD2320(uint64_t a1)
{
  return sub_1DDA2F490(*(void *)(a1 + 32));
}

uint64_t (*sub_1DDBD2328(uint64_t a1))(void, void, void, void, void)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A9B0[0];
  int v4 = (uint64_t (*)(void, void, void, void, void))(*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD2448;
  v7[3] = &unk_1E6D07188;
  v7[4] = a1;
  BOOL v5 = sub_1DDBD1B48(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD2430(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD2448(uint64_t a1)
{
  return sub_1DDA2F784(*(void *)(a1 + 32));
}

uint64_t (*sub_1DDBD2450(uint64_t a1))(void, void, void, void, void)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A9B8[0];
  int v4 = (uint64_t (*)(void, void, void, void, void))(*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD2570;
  v7[3] = &unk_1E6D07188;
  v7[4] = a1;
  BOOL v5 = sub_1DDBD1B48(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD2558(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD2570()
{
  return sub_1DDACC934();
}

uint64_t sub_1DDBD2578(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A9C0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD2690;
  v7[3] = &unk_1E6D05458;
  v7[4] = a1;
  uint64_t v5 = sub_1DDACFD70(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD2678(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD2690()
{
  return sub_1DDACBFB8();
}

void sub_1DDBD2698(uint64_t a1@<X0>, void *a2@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v7);
  uint64_t v4 = v7;
  uint64_t v5 = off_1EAB8A9C8[0];
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  sub_1DDBD276C(v4, v5, v6, &unk_1F398C670, a2);
  if (v8) {
    sub_1DDA18310(v8);
  }
}

void sub_1DDBD2754(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1DDA18310(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBD276C(uint64_t a1@<X0>, void *a2@<X1>, int a3@<W2>, void *a4@<X3>, void *a5@<X8>)
{
  void (**v45)(void *__return_ptr);
  uint64_t **v46;
  id v47;
  __n128 __p;
  unint64_t v49;
  void v50[4];
  id v51;
  uint64_t v52;
  std::__shared_weak_count *v53;
  void *v54;
  unsigned char *v55;
  char v56;
  std::string v57;

  id v9 = a2;
  uint64_t v47 = a4;
  sub_1DDAB6A18(v9, a3, &v57);
  uint64_t v46 = (uint64_t **)(a1 + 24);
  unsigned int v10 = sub_1DDA2A530(a1 + 24, (void **)&v57.__r_.__value_.__l.__data_);
  if ((void **)(a1 + 32) == v10)
  {
    LOBYTE(v54) = 0;
    uint64_t v56 = 0;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = sub_1DDBE2294;
    v50[3] = &unk_1E6D051E8;
    uint64_t v45 = (void (**)(void *__return_ptr))v47;
    uint64_t v51 = v45;
    sub_1DDB657E4(a1, v9, v50, &v52);
    if (v52)
    {
      uint64_t v16 = sub_1DDB67AB8(v52, v12, v13, v14, v15);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1E01C3B90](exception, "RawCameraException");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      unint64_t v21 = 0;
      std::string __p = 0uLL;
      uint64_t v49 = 0;
      while (v21 < objc_msgSend_count(v16, v17, v18, v19, v20, v45, v46))
      {
        uint64_t v25 = objc_msgSend_objectAtIndexedSubscript_(v16, v22, v21, v23, v24);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v43 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x1E01C3B90](v43, "RawCameraException");
          __cxa_throw(v43, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        int v30 = objc_msgSend_longLongValue(v25, v26, v27, v28, v29);
        int v31 = v30;
        unint64_t v32 = __p.n128_u64[1];
        if (__p.n128_u64[1] >= v49)
        {
          uint64_t v34 = (void *)__p.n128_u64[0];
          uint64_t v35 = (uint64_t)(__p.n128_u64[1] - __p.n128_u64[0]) >> 2;
          unint64_t v36 = v35 + 1;
          if ((unint64_t)(v35 + 1) >> 62) {
            sub_1DDA17F78();
          }
          uint64_t v37 = v49 - __p.n128_u64[0];
          if ((uint64_t)(v49 - __p.n128_u64[0]) >> 1 > v36) {
            unint64_t v36 = v37 >> 1;
          }
          if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v38 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v38 = v36;
          }
          if (v38)
          {
            double v39 = (char *)sub_1DDA17F90((uint64_t)&v49, v38);
            unint64_t v32 = __p.n128_u64[1];
            uint64_t v34 = (void *)__p.n128_u64[0];
          }
          else
          {
            double v39 = 0;
          }
          uint64_t v40 = &v39[4 * v35];
          *(_DWORD *)uint64_t v40 = v31;
          unint64_t v33 = (unint64_t)(v40 + 4);
          while ((void *)v32 != v34)
          {
            int v41 = *(_DWORD *)(v32 - 4);
            v32 -= 4;
            *((_DWORD *)v40 - 1) = v41;
            v40 -= 4;
          }
          __p.n128_u64[0] = (unint64_t)v40;
          __p.n128_u64[1] = v33;
          uint64_t v49 = (unint64_t)&v39[4 * v38];
          if (v34) {
            operator delete(v34);
          }
        }
        else
        {
          *(_DWORD *)__p.n128_u64[1] = v30;
          unint64_t v33 = v32 + 4;
        }
        __p.n128_u64[1] = v33;

        ++v21;
      }
      sub_1DDA8687C((uint64_t)&v54, (uint64_t)&__p);
      if (__p.n128_u64[0])
      {
        __p.n128_u64[1] = __p.n128_u64[0];
        operator delete((void *)__p.n128_u64[0]);
      }
    }
    if (v53) {
      sub_1DDA18310(v53);
    }

    if (!v56)
    {
      ((void (**)(__n128 *__return_ptr))v45)[2](&__p);
      sub_1DDA5BD44((uint64_t)&v54, &__p);
      if (__p.n128_u64[0])
      {
        __p.n128_u64[1] = __p.n128_u64[0];
        operator delete((void *)__p.n128_u64[0]);
      }
      if (!v56) {
        goto LABEL_45;
      }
    }
    __p.n128_u64[0] = (unint64_t)&v57;
    uint64_t v42 = sub_1DDAB6C70(v46, (void **)&v57.__r_.__value_.__l.__data_, (uint64_t)&unk_1DDBFB044, (long long **)&__p);
    sub_1DDBE231C((uint64_t)(v42 + 7), (uint64_t)&v54);
    if (!v56) {
LABEL_45:
    }
      sub_1DDA1D8BC();
    *a5 = 0;
    a5[1] = 0;
    a5[2] = 0;
    sub_1DDA1D984(a5, v54, (uint64_t)v55, (v55 - (unsigned char *)v54) >> 2);
    if (v56 && v54)
    {
      unint64_t v55 = v54;
      operator delete(v54);
    }
  }
  else
  {
    uint64_t v11 = (const void **)sub_1DDBE2468((uint64_t (**)(uint64_t, void, void, void *, void *))v10 + 7);
    if (!v11) {
      sub_1DDAB6C00();
    }
    *a5 = 0;
    a5[1] = 0;
    a5[2] = 0;
    sub_1DDA1D984(a5, *v11, (uint64_t)v11[1], ((unsigned char *)v11[1] - (unsigned char *)*v11) >> 2);
  }
  if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v57.__r_.__value_.__l.__data_);
  }
}

void sub_1DDBD2B70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,std::__shared_weak_count *a22,void *__p,uint64_t a24,uint64_t a25,char a26)
{
  __cxa_free_exception(v27);

  if (a22) {
    sub_1DDA18310(a22);
  }

  if (a26 && __p) {
    operator delete(__p);
  }
  if (*(char *)(v28 - 89) < 0) {
    operator delete(*(void **)(v28 - 112));
  }

  _Unwind_Resume(a1);
}

void sub_1DDBD2C68(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

uint64_t sub_1DDBD2C74(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A9D0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD30FC;
  v7[3] = &unk_1E6D05178;
  v7[4] = a1;
  uint64_t v5 = sub_1DDBD2D8C(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD2D74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD2D8C(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  sub_1DDAB6A18(v7, a3, &__p);
  id v9 = (uint64_t **)(a1 + 24);
  unsigned int v10 = sub_1DDA2A530(a1 + 24, (void **)&__p.__r_.__value_.__l.__data_);
  if ((void **)(a1 + 32) == v10)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1DDBE26AC;
    v29[3] = &unk_1E6D051C0;
    uint64_t v13 = (uint64_t (**)(void))v8;
    id v30 = v13;
    sub_1DDB657E4(a1, v7, v29, &p_p);
    uint64_t v18 = (long long *)p_p;
    if (p_p)
    {
      uint64_t v19 = sub_1DDB67AB8((uint64_t)p_p, v14, v15, v16, v17);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1E01C3B90](exception, "RawCameraException");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      uint64_t v12 = objc_msgSend_longLongValue(v19, v20, v21, v22, v23);
    }
    else
    {
      uint64_t v12 = 0;
    }
    if (v34) {
      sub_1DDA18310(v34);
    }

    if (!v18) {
      uint64_t v12 = v13[2](v13);
    }
    p_p = &__p;
    uint64_t v24 = sub_1DDAB6C70(v9, (void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&unk_1DDBFB044, (long long **)&p_p);
    uint64_t v25 = (void (**)(uint64_t, void, std::string **, void, void))(v24 + 7);
    v32[1] = (uint64_t (*)(void, void, void, void, void))v12;
    v32[0] = (uint64_t (*)(void, void, void, void, void))sub_1DDBE2744;
    if (v32 != (uint64_t (**)(void, void, void, void, void))(v24 + 7))
    {
      uint64_t v26 = *v25;
      if (*v25)
      {
        p_p = 0;
        uint64_t v34 = 0;
        v26(2, v25, &p_p, 0, 0);
        v32[0](2, v32, v25, 0, 0);
        ((void (*)(uint64_t, std::string **, uint64_t (**)(void, void, void, void, void), void, void))p_p)(2, &p_p, v32, 0, 0);
        sub_1DDAB6E58((uint64_t (**)(void, void, void, void, void))&p_p);
      }
      else
      {
        *((_DWORD *)v24 + 16) = v12;
        v24[7] = (uint64_t)sub_1DDBE2744;
        v32[0] = 0;
      }
    }
    sub_1DDAB6E58(v32);
  }
  else
  {
    uint64_t v11 = (unsigned int *)sub_1DDBE26F8((uint64_t (**)(uint64_t, void, void, void *, void *))v10 + 7);
    if (!v11) {
      sub_1DDAB6C00();
    }
    uint64_t v12 = *v11;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  return v12;
}

void sub_1DDBD306C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,std::__shared_weak_count *a26)
{
  __cxa_free_exception(v28);

  if (a26) {
    sub_1DDA18310(a26);
  }

  if (a20 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_1DDBD30FC()
{
  return 0;
}

void sub_1DDBD3104(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v4 = v8;
  uint64_t v5 = off_1EAB8A9D8[0];
  unint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD3684;
  v7[3] = &unk_1E6D071C8;
  v7[4] = a1;
  sub_1DDBD321C(v4, v5, v6, v7, a2);
  if (v9) {
    sub_1DDA18310(v9);
  }
}

void sub_1DDBD3204(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBD321C(uint64_t a1@<X0>, void *a2@<X1>, unint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a4;
  sub_1DDAB6A18(v10, a3, &__p);
  uint64_t v12 = (uint64_t **)(a1 + 24);
  uint64_t v13 = sub_1DDA2A530(a1 + 24, (void **)&__p.__r_.__value_.__l.__data_);
  if ((void **)(a1 + 32) == v13)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1DDBE2824;
    v28[3] = &unk_1E6D07270;
    id v16 = v11;
    id v29 = v16;
    sub_1DDB657E4(a1, v10, v28, &v32);
    uint64_t v21 = v32;
    if (v32)
    {
      uint64_t v22 = sub_1DDB67AB8((uint64_t)v32, v17, v18, v19, v20);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1E01C3B90](exception, "RawCameraException");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      sub_1DDA31384(v22, &p_p);
      uint64_t v23 = (long long *)p_p;
      a3 = v36;
      v30[0] = *(_DWORD *)v37;
      *(_DWORD *)((char *)v30 + 3) = *(_DWORD *)&v37[3];
      char v5 = v38;
    }
    else
    {
      uint64_t v23 = 0;
    }
    if ((void)v33) {
      sub_1DDA18310((std::__shared_weak_count *)v33);
    }

    if (!v21)
    {
      (*((void (**)(std::string **__return_ptr, id))v16 + 2))(&p_p, v16);
      uint64_t v23 = (long long *)p_p;
      a3 = v36;
      v30[0] = *(_DWORD *)v37;
      *(_DWORD *)((char *)v30 + 3) = *(_DWORD *)&v37[3];
      char v5 = v38;
    }
    p_p = &__p;
    uint64_t v24 = sub_1DDAB6C70(v12, (void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&unk_1DDBFB044, (long long **)&p_p);
    unint64_t v32 = 0;
    *(void *)&long long v33 = 0;
    if (v5 < 0)
    {
      sub_1DDA2639C(&v33, v23, a3);
    }
    else
    {
      *(void *)&long long v33 = v23;
      *((void *)&v33 + 1) = a3;
      LODWORD(v34) = v30[0];
      *(_DWORD *)((char *)&v34 + 3) = *(_DWORD *)((char *)v30 + 3);
      HIBYTE(v34) = v5;
    }
    uint64_t v25 = (void (**)(uint64_t, uint64_t *, std::string **, void, void))(v24 + 7);
    unint64_t v32 = sub_1DDBE28F8;
    if (&v32 != (void *(**)(unsigned int, uint64_t, uint64_t, uint64_t, void *))(v24 + 7))
    {
      uint64_t v26 = *v25;
      if (*v25)
      {
        p_p = 0;
        unint64_t v36 = 0;
        v26(2, v24 + 7, &p_p, 0, 0);
        v32(2u, (uint64_t)&v32, (uint64_t)(v24 + 7), 0, 0);
        ((void (*)(uint64_t, std::string **, void *(**)(unsigned int, uint64_t, uint64_t, uint64_t, void *), void, void))p_p)(2, &p_p, &v32, 0, 0);
        sub_1DDAB6E58((uint64_t (**)(void, void, void, void, void))&p_p);
      }
      else
      {
        *((_OWORD *)v24 + 4) = v33;
        v24[10] = v34;
        uint64_t v34 = 0;
        long long v33 = 0uLL;
        v24[7] = (uint64_t)sub_1DDBE28F8;
        unint64_t v32 = 0;
      }
    }
    sub_1DDAB6E58((uint64_t (**)(void, void, void, void, void))&v32);
    if (v5 < 0)
    {
      sub_1DDA2639C((unsigned char *)a5, v23, a3);
      operator delete(v23);
    }
    else
    {
      *(void *)a5 = v23;
      *(void *)(a5 + 8) = a3;
      *(_DWORD *)(a5 + 16) = v30[0];
      *(_DWORD *)(a5 + 19) = *(_DWORD *)((char *)v30 + 3);
      *(unsigned char *)(a5 + 23) = v5;
    }
  }
  else
  {
    uint64_t v14 = (void **)sub_1DDBE28AC((uint64_t (**)(uint64_t, void, void, void *, void *))v13 + 7);
    if (!v14) {
      sub_1DDAB6C00();
    }
    if (*((char *)v14 + 23) < 0)
    {
      sub_1DDA2639C((unsigned char *)a5, *v14, (unint64_t)v14[1]);
    }
    else
    {
      long long v15 = *(_OWORD *)v14;
      *(void *)(a5 + 16) = v14[2];
      *(_OWORD *)a5 = v15;
    }
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1DDBD35DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,std::__shared_weak_count *a22)
{
  __cxa_free_exception(v24);

  if (a22) {
    sub_1DDA18310(a22);
  }

  if (a20 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1DDBD3684()
{
}

void sub_1DDBD368C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v4 = v8;
  char v5 = off_1EAB8A9E0[0];
  unint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD37A4;
  v7[3] = &unk_1E6D071C8;
  v7[4] = a1;
  sub_1DDBD321C(v4, v5, v6, v7, a2);
  if (v9) {
    sub_1DDA18310(v9);
  }
}

void sub_1DDBD378C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBD37A4()
{
}

uint64_t sub_1DDBD37AC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A9E8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD38C4;
  v7[3] = &unk_1E6D07128;
  v7[4] = a1;
  uint64_t v5 = sub_1DDBCFF8C(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD38AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD38C4(uint64_t a1)
{
  return sub_1DDB47A48(*(void *)(a1 + 32));
}

uint64_t sub_1DDBD38CC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A9F0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD39E4;
  v7[3] = &unk_1E6D07128;
  v7[4] = a1;
  uint64_t v5 = sub_1DDBCFF8C(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD39CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD39E4(uint64_t a1)
{
  return sub_1DDB47994(*(void *)(a1 + 32));
}

double sub_1DDBD39EC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8A9F8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD3B0C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD3AF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD3B0C(uint64_t a1)
{
  return sub_1DDACC068(*(double **)(a1 + 32));
}

uint64_t sub_1DDBD3B14(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8AA00[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD3C2C;
  v7[3] = &unk_1E6D05458;
  v7[4] = a1;
  uint64_t v5 = sub_1DDACFD70(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD3C14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD3C2C(uint64_t a1)
{
  return sub_1DDACBFC0(*(void *)(a1 + 32));
}

double sub_1DDBD3C34(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8AA08[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD3D84;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5 * (*(double (**)(uint64_t))(*(void *)a1 + 896))(a1);
}

void sub_1DDBD3D6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD3D84(uint64_t a1)
{
  return sub_1DDACC408(*(void *)(a1 + 32));
}

uint64_t sub_1DDBD3D8C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8AA10[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD3EA4;
  v7[3] = &unk_1E6D05458;
  v7[4] = a1;
  uint64_t v5 = sub_1DDACFD70(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD3E8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD3EA4()
{
  return 0;
}

uint64_t sub_1DDBD3EAC(uint64_t a1, float *a2)
{
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 976))(a1);
  if (result == 1)
  {
    uint64_t v15 = 0;
    float v16 = 0.0;
    do
      float v16 = v16 + a2[v15++];
    while (v15 != 4);
    float v17 = v16 * 0.25;
    *a2 = v17;
    a2[1] = v17;
    a2[2] = v17;
    uint64_t v5 = 3;
    goto LABEL_43;
  }
  if (result != 2) {
    return result;
  }
  uint64_t v4 = 0;
  LODWORD(v5) = 0;
  float v6 = 0.0;
  float v7 = 32768.0;
  float v8 = 0.0;
  do
  {
    uint64_t v9 = 0;
    char v10 = 1;
    do
    {
      if (v4 == v9) {
        goto LABEL_12;
      }
      float v11 = a2[v9];
      if (v10)
      {
        char v10 = 0;
        float v8 = a2[v9];
LABEL_11:
        float v6 = a2[v9];
        goto LABEL_12;
      }
      char v10 = 0;
      if (v11 < v8)
      {
        float v8 = a2[v9];
        goto LABEL_12;
      }
      if (v11 > v6) {
        goto LABEL_11;
      }
LABEL_12:
      ++v9;
    }
    while (v9 != 4);
    float v12 = v6 - v8;
    if ((float)(v6 - v8) < v7)
    {
      LODWORD(v5) = v4;
      float v7 = v6 - v8;
    }
    ++v4;
  }
  while (v4 != 4);
  switch(v5)
  {
    case 3:
      uint64_t v13 = 2;
      goto LABEL_25;
    case 2:
      uint64_t v13 = 3;
LABEL_25:
      uint64_t v14 = 1;
LABEL_26:
      uint64_t v18 = a2;
      goto LABEL_28;
    case 1:
      uint64_t v13 = 3;
      uint64_t v14 = 2;
      goto LABEL_26;
  }
  uint64_t v18 = a2 + 1;
  uint64_t v13 = 3;
  uint64_t v14 = 2;
LABEL_28:
  float v17 = a2[v13];
  float v19 = a2[v14];
  if (*v18 <= v19) {
    float v20 = *v18;
  }
  else {
    float v20 = a2[v14];
  }
  if (*v18 > v19) {
    float v19 = *v18;
  }
  if (v20 > v17) {
    float v17 = v20;
  }
  if (v19 <= v17) {
    float v17 = v19;
  }
  float v21 = v17 - v12;
  float v22 = v12 + v17;
  if (v21 > (float)(int)v5 || v22 < (float)(int)v5)
  {
    uint64_t v5 = (int)v5;
LABEL_43:
    a2[v5] = v17;
  }
  return result;
}

uint64_t sub_1DDBD404C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8AA18[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD4164;
  v7[3] = &unk_1E6D05178;
  v7[4] = a1;
  uint64_t v5 = sub_1DDAFA00C(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD414C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD4164()
{
  return sub_1DDACC92C();
}

uint64_t sub_1DDBD416C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8AA20[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD4284;
  v7[3] = &unk_1E6D05178;
  v7[4] = a1;
  uint64_t v5 = sub_1DDAFA00C(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD426C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD4284()
{
  return sub_1DDACC924();
}

uint64_t sub_1DDBD428C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8AA28[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD4714;
  v7[3] = &unk_1E6D05178;
  v7[4] = a1;
  uint64_t v5 = sub_1DDBD43A4(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD438C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD43A4(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  sub_1DDAB6A18(v7, a3, &__p);
  uint64_t v9 = (uint64_t **)(a1 + 24);
  char v10 = sub_1DDA2A530(a1 + 24, (void **)&__p.__r_.__value_.__l.__data_);
  if ((void **)(a1 + 32) == v10)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1DDBE2A2C;
    v29[3] = &unk_1E6D051C0;
    uint64_t v13 = (uint64_t (**)(void))v8;
    id v30 = v13;
    sub_1DDB657E4(a1, v7, v29, &p_p);
    uint64_t v18 = (long long *)p_p;
    if (p_p)
    {
      float v19 = sub_1DDB67AB8((uint64_t)p_p, v14, v15, v16, v17);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1E01C3B90](exception, "RawCameraException");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      uint64_t v12 = objc_msgSend_longLongValue(v19, v20, v21, v22, v23);
    }
    else
    {
      uint64_t v12 = 0;
    }
    if (v34) {
      sub_1DDA18310(v34);
    }

    if (!v18) {
      uint64_t v12 = v13[2](v13);
    }
    p_p = &__p;
    uint64_t v24 = sub_1DDAB6C70(v9, (void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&unk_1DDBFB044, (long long **)&p_p);
    uint64_t v25 = (void (**)(uint64_t, void, std::string **, void, void))(v24 + 7);
    v32[1] = (uint64_t (*)(void, void, void, void, void))v12;
    v32[0] = (uint64_t (*)(void, void, void, void, void))sub_1DDBE2AC4;
    if (v32 != (uint64_t (**)(void, void, void, void, void))(v24 + 7))
    {
      uint64_t v26 = *v25;
      if (*v25)
      {
        p_p = 0;
        uint64_t v34 = 0;
        v26(2, v25, &p_p, 0, 0);
        v32[0](2, v32, v25, 0, 0);
        ((void (*)(uint64_t, std::string **, uint64_t (**)(void, void, void, void, void), void, void))p_p)(2, &p_p, v32, 0, 0);
        sub_1DDAB6E58((uint64_t (**)(void, void, void, void, void))&p_p);
      }
      else
      {
        *((_DWORD *)v24 + 16) = v12;
        v24[7] = (uint64_t)sub_1DDBE2AC4;
        v32[0] = 0;
      }
    }
    sub_1DDAB6E58(v32);
  }
  else
  {
    float v11 = (unsigned int *)sub_1DDBE2A78((uint64_t (**)(uint64_t, void, void, void *, void *))v10 + 7);
    if (!v11) {
      sub_1DDAB6C00();
    }
    uint64_t v12 = *v11;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  return v12;
}

void sub_1DDBD4684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,std::__shared_weak_count *a26)
{
  __cxa_free_exception(v28);

  if (a26) {
    sub_1DDA18310(a26);
  }

  if (a20 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_1DDBD4714()
{
  return sub_1DDACBE2C();
}

double sub_1DDBD471C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8AA30[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD483C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD4824(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD483C(uint64_t a1)
{
  return sub_1DDB48158(*(void *)(a1 + 32));
}

double sub_1DDBD4844(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8AA38[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD4964;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD494C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD4964(uint64_t a1)
{
  return sub_1DDB485A8(*(void *)(a1 + 32));
}

double sub_1DDBD496C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8AA40[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD4ABC;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5 + (*(double (**)(uint64_t))(*(void *)a1 + 936))(a1);
}

void sub_1DDBD4AA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBD4ABC(uint64_t a1)
{
}

BOOL sub_1DDBD4AC4(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8AA48[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD4BDC;
  v7[3] = &unk_1E6D05250;
  v7[4] = a1;
  BOOL v5 = sub_1DDAC8A08(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD4BC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_1DDBD4BDC(uint64_t a1)
{
  return sub_1DDB48F10(*(void *)(a1 + 32));
}

BOOL sub_1DDBD4BE4(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8AA50[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD4CFC;
  v7[3] = &unk_1E6D05250;
  v7[4] = a1;
  BOOL v5 = sub_1DDAC8A08(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD4CE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_1DDBD4CFC(uint64_t a1)
{
  return sub_1DDB48E30(*(void *)(a1 + 32));
}

double sub_1DDBD4D04(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8AA58[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD4E24;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD4E0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD4E24(uint64_t a1)
{
  return sub_1DDB47EE0(*(void *)(a1 + 32));
}

double sub_1DDBD4E2C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8AA60[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD4F4C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD4F34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD4F4C()
{
  return sub_1DDACEDF8();
}

double sub_1DDBD4F54(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8AA68[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD5074;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD505C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD5074()
{
  return sub_1DDB4A308();
}

void sub_1DDBD507C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v6);
  uint64_t v2 = v6;
  id v3 = off_1EAB8AA70[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1DDBD51A8;
  v5[3] = &unk_1E6D05380;
  v5[4] = a1;
  sub_1DDAEE388(v2, v3, v4, v5);
  if (v7) {
    sub_1DDA18310(v7);
  }
}

void sub_1DDBD5190(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD51A8(uint64_t a1)
{
  return sub_1DDB4A120(*(void *)(a1 + 32));
}

double sub_1DDBD51B0(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8AA78[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD52D0;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD52B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD52D0()
{
  return sub_1DDB4A14C();
}

void sub_1DDBD52D8(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v6);
  uint64_t v2 = v6;
  id v3 = off_1EAB8AA80[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1DDBD5410;
  v5[3] = &unk_1E6D05380;
  v5[4] = a1;
  sub_1DDAEE388(v2, v3, v4, v5);
  if (v7) {
    sub_1DDA18310(v7);
  }
}

void sub_1DDBD53F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD5410()
{
  return sub_1DDB4A158();
}

uint64_t sub_1DDBD5418(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  id v3 = off_1EAB8AA88[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD5530;
  v7[3] = &unk_1E6D05178;
  v7[4] = a1;
  uint64_t v5 = sub_1DDAFA00C(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD5518(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD5530()
{
  return sub_1DDACC91C();
}

void *sub_1DDBD5538@<X0>(uint64_t **a1@<X0>, void *a2@<X8>)
{
  int v4 = a1 + 38;
  int v5 = ((uint64_t (*)(uint64_t **))(*a1)[15])(a1);
  uint64_t v6 = a1[39];
  if (!v6) {
    goto LABEL_11;
  }
  id v7 = a1 + 39;
  do
  {
    int v8 = *((_DWORD *)v6 + 8);
    BOOL v9 = v8 < v5;
    if (v8 >= v5) {
      char v10 = (uint64_t **)v6;
    }
    else {
      char v10 = (uint64_t **)(v6 + 1);
    }
    if (!v9) {
      id v7 = (uint64_t **)v6;
    }
    uint64_t v6 = *v10;
  }
  while (*v10);
  if (v7 == a1 + 39 || v5 < *((_DWORD *)v7 + 8))
  {
LABEL_11:
    long long v17 = 0uLL;
    ((void (*)(long long *__return_ptr, uint64_t **))(*a1)[9])(&v16, a1);
    BOOL v11 = sub_1DDB65F14(v16, &v17);
    if (*((void *)&v16 + 1)) {
      sub_1DDA18310(*((std::__shared_weak_count **)&v16 + 1));
    }
    if (!v11)
    {
      sub_1DDAF56B0(&v16);
      long long v12 = v16;
      long long v16 = 0uLL;
      uint64_t v13 = (std::__shared_weak_count *)*((void *)&v17 + 1);
      long long v17 = v12;
      if (v13)
      {
        sub_1DDA18310(v13);
        if (*((void *)&v16 + 1)) {
          sub_1DDA18310(*((std::__shared_weak_count **)&v16 + 1));
        }
      }
    }
    LODWORD(v16) = ((uint64_t (*)(uint64_t **))(*a1)[15])(a1);
    sub_1DDBD571C(v4, &v16, (uint64_t **)&v17);
    if (*((void *)&v17 + 1)) {
      sub_1DDA18310(*((std::__shared_weak_count **)&v17 + 1));
    }
  }
  LODWORD(v17) = ((uint64_t (*)(uint64_t **))(*a1)[15])(a1);
  uint64_t result = (void *)sub_1DDBD5784((uint64_t)v4, (int *)&v17);
  uint64_t v15 = result[1];
  *a2 = *result;
  a2[1] = v15;
  if (v15) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1DDBD56E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    sub_1DDA18310(a12);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBD571C(uint64_t **a1, _DWORD *a2, uint64_t **a3)
{
  int v8 = a2;
  int v4 = sub_1DDBE2BA4(a1, a2, (uint64_t)&unk_1DDBFB044, &v8);
  uint64_t v6 = *a3;
  int v5 = a3[1];
  if (v5) {
    atomic_fetch_add_explicit(v5 + 1, 1uLL, memory_order_relaxed);
  }
  id v7 = (std::__shared_weak_count *)v4[6];
  v4[5] = v6;
  v4[6] = v5;
  if (v7) {
    sub_1DDA18310(v7);
  }
}

uint64_t sub_1DDBD5784(uint64_t a1, int *a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v2 = a1 + 8;
  uint64_t v3 = v4;
  if (!v4) {
    goto LABEL_12;
  }
  int v5 = *a2;
  uint64_t v6 = v2;
  do
  {
    int v7 = *(_DWORD *)(v3 + 32);
    BOOL v8 = v7 < v5;
    if (v7 >= v5) {
      BOOL v9 = (uint64_t *)v3;
    }
    else {
      BOOL v9 = (uint64_t *)(v3 + 8);
    }
    if (!v8) {
      uint64_t v6 = v3;
    }
    uint64_t v3 = *v9;
  }
  while (*v9);
  if (v6 == v2 || v5 < *(_DWORD *)(v6 + 32))
  {
LABEL_12:
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01C3B90](exception, "RawCameraException");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  return v6 + 40;
}

void sub_1DDBD581C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_1DDBD5830@<X0>(uint64_t **a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = a1 + 41;
  int v5 = ((uint64_t (*)(uint64_t **))(*a1)[15])(a1);
  uint64_t v6 = a1[42];
  if (!v6) {
    goto LABEL_11;
  }
  int v7 = a1 + 42;
  do
  {
    int v8 = *((_DWORD *)v6 + 8);
    BOOL v9 = v8 < v5;
    if (v8 >= v5) {
      char v10 = (uint64_t **)v6;
    }
    else {
      char v10 = (uint64_t **)(v6 + 1);
    }
    if (!v9) {
      int v7 = (uint64_t **)v6;
    }
    uint64_t v6 = *v10;
  }
  while (*v10);
  if (v7 == a1 + 42 || v5 < *((_DWORD *)v7 + 8))
  {
LABEL_11:
    uint64_t v18 = 0;
    float v19 = 0;
    ((void (*)(uint64_t *__return_ptr, uint64_t **))(*a1)[9])(&v16, a1);
    BOOL v11 = sub_1DDB66F24(v16, &v18);
    if (v17) {
      sub_1DDA18310(v17);
    }
    if (!v11)
    {
      long long v12 = v19;
      uint64_t v18 = 0;
      float v19 = 0;
      if (v12) {
        sub_1DDA18310(v12);
      }
    }
    LODWORD(v16) = ((uint64_t (*)(uint64_t **))(*a1)[15])(a1);
    sub_1DDBD571C(v4, &v16, &v18);
    if (v19) {
      sub_1DDA18310(v19);
    }
  }
  LODWORD(v18) = ((uint64_t (*)(uint64_t **))(*a1)[15])(a1);
  if (!*(void *)sub_1DDBD5784((uint64_t)v4, (int *)&v18))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01C3B90](exception, "RawCameraException");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  LODWORD(v18) = ((uint64_t (*)(uint64_t **))(*a1)[15])(a1);
  uint64_t result = (void *)sub_1DDBD5784((uint64_t)v4, (int *)&v18);
  uint64_t v14 = result[1];
  *a2 = *result;
  a2[1] = v14;
  if (v14) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v14 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1DDBD5A3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a10) {
    sub_1DDA18310(a10);
  }
  if (a12) {
    sub_1DDA18310(a12);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1DDBD5A7C@<X0>(uint64_t **a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = a1 + 44;
  int v5 = ((uint64_t (*)(uint64_t **))(*a1)[15])(a1);
  uint64_t v6 = a1[45];
  if (!v6) {
    goto LABEL_11;
  }
  int v7 = a1 + 45;
  do
  {
    int v8 = *((_DWORD *)v6 + 8);
    BOOL v9 = v8 < v5;
    if (v8 >= v5) {
      char v10 = (uint64_t **)v6;
    }
    else {
      char v10 = (uint64_t **)(v6 + 1);
    }
    if (!v9) {
      int v7 = (uint64_t **)v6;
    }
    uint64_t v6 = *v10;
  }
  while (*v10);
  if (v7 == a1 + 45 || v5 < *((_DWORD *)v7 + 8))
  {
LABEL_11:
    uint64_t v18 = 0;
    float v19 = 0;
    ((void (*)(uint64_t *__return_ptr, uint64_t **))(*a1)[9])(&v16, a1);
    BOOL v11 = sub_1DDB6688C(v16, &v18);
    if (v17) {
      sub_1DDA18310(v17);
    }
    if (!v11)
    {
      long long v12 = v19;
      uint64_t v18 = 0;
      float v19 = 0;
      if (v12) {
        sub_1DDA18310(v12);
      }
    }
    LODWORD(v16) = ((uint64_t (*)(uint64_t **))(*a1)[15])(a1);
    sub_1DDBD571C(v4, &v16, &v18);
    if (v19) {
      sub_1DDA18310(v19);
    }
  }
  LODWORD(v18) = ((uint64_t (*)(uint64_t **))(*a1)[15])(a1);
  if (!*(void *)sub_1DDBD5784((uint64_t)v4, (int *)&v18))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01C3B90](exception, "RawCameraException");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  LODWORD(v18) = ((uint64_t (*)(uint64_t **))(*a1)[15])(a1);
  uint64_t result = (void *)sub_1DDBD5784((uint64_t)v4, (int *)&v18);
  uint64_t v14 = result[1];
  *a2 = *result;
  a2[1] = v14;
  if (v14) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v14 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1DDBD5C88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a10) {
    sub_1DDA18310(a10);
  }
  if (a12) {
    sub_1DDA18310(a12);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_1DDBD5CC8(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1DDBD5DA8;
  v4[3] = &unk_1E6D05250;
  v4[4] = a1;
  BOOL v2 = sub_1DDAC8A08(v5, off_1EAB8AA90[0], 0, v4);
  if (v6) {
    sub_1DDA18310(v6);
  }
  return v2;
}

void sub_1DDBD5D90(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 - 24);
  if (v3) {
    sub_1DDA18310(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD5DA8()
{
  return sub_1DDA2D6CC();
}

BOOL sub_1DDBD5DB0(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  uint64_t v3 = off_1EAB8AA98[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD5EC8;
  v7[3] = &unk_1E6D05250;
  v7[4] = a1;
  BOOL v5 = sub_1DDAC8A08(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD5EB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD5EC8()
{
  return sub_1DDA2D6DC();
}

BOOL sub_1DDBD5ED0(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  uint64_t v3 = off_1EAB8AAA0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD5FE8;
  v7[3] = &unk_1E6D05250;
  v7[4] = a1;
  BOOL v5 = sub_1DDAC8A08(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD5FD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD5FE8()
{
  return sub_1DDA2D6E4();
}

BOOL sub_1DDBD5FF0(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v7);
  uint64_t v2 = v7;
  int v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1DDBD60F8;
  v6[3] = &unk_1E6D05250;
  v6[4] = a1;
  BOOL v4 = sub_1DDAC8A08(v2, @"honorLensCompensationSuggestions", v3, v6);
  if (v8) {
    sub_1DDA18310(v8);
  }
  return v4;
}

void sub_1DDBD60E0(_Unwind_Exception *exception_object)
{
  int v3 = *(std::__shared_weak_count **)(v1 - 24);
  if (v3) {
    sub_1DDA18310(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD60F8()
{
  return 0;
}

float sub_1DDBD6100(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AAB0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD6594;
  v7[3] = &unk_1E6D071E8;
  v7[4] = a1;
  float v5 = sub_1DDBD6220(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD6208(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

float sub_1DDBD6220(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  sub_1DDAB6A18(v7, a3, &__p);
  BOOL v9 = (uint64_t **)(a1 + 24);
  char v10 = sub_1DDA2A530(a1 + 24, (void **)&__p.__r_.__value_.__l.__data_);
  if ((void **)(a1 + 32) == v10)
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = sub_1DDBE2C68;
    v31[3] = &unk_1E6D051C0;
    uint64_t v13 = (float (**)(void))v8;
    id v32 = v13;
    sub_1DDB657E4(a1, v7, v31, &p_p);
    uint64_t v18 = (long long *)p_p;
    if (p_p)
    {
      float v19 = sub_1DDB67AB8((uint64_t)p_p, v14, v15, v16, v17);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1E01C3B90](exception, "RawCameraException");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      objc_msgSend_doubleValue(v19, v20, v21, v22, v23);
      double v25 = v24;

      float v12 = v25;
    }
    else
    {
      float v12 = 0.0;
    }
    if (v36) {
      sub_1DDA18310(v36);
    }

    if (!v18) {
      float v12 = v13[2](v13);
    }
    p_p = &__p;
    uint64_t v26 = sub_1DDAB6C70(v9, (void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&unk_1DDBFB044, (long long **)&p_p);
    uint64_t v27 = (void (**)(uint64_t, void, std::string **, void, void))(v26 + 7);
    v34[1] = (uint64_t (*)(void, void, void, void, void))LODWORD(v12);
    v34[0] = (uint64_t (*)(void, void, void, void, void))sub_1DDBE2CFC;
    if (v34 != (uint64_t (**)(void, void, void, void, void))(v26 + 7))
    {
      uint64_t v28 = *v27;
      if (*v27)
      {
        p_p = 0;
        unint64_t v36 = 0;
        v28(2, v27, &p_p, 0, 0);
        v34[0](2, v34, v27, 0, 0);
        ((void (*)(uint64_t, std::string **, uint64_t (**)(void, void, void, void, void), void, void))p_p)(2, &p_p, v34, 0, 0);
        sub_1DDAB6E58((uint64_t (**)(void, void, void, void, void))&p_p);
      }
      else
      {
        *((float *)v26 + 16) = v12;
        v26[7] = (uint64_t)sub_1DDBE2CFC;
        v34[0] = 0;
      }
    }
    sub_1DDAB6E58(v34);
  }
  else
  {
    BOOL v11 = (float *)sub_1DDBE2CB0((uint64_t (**)(uint64_t, void, void, void, void *))v10 + 7);
    if (!v11) {
      sub_1DDAB6C00();
    }
    float v12 = *v11;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  return v12;
}

void sub_1DDBD6504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,std::__shared_weak_count *a26)
{
  __cxa_free_exception(v28);

  if (a26) {
    sub_1DDA18310(a26);
  }

  if (a20 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

float sub_1DDBD6594(uint64_t a1)
{
  return sub_1DDA351D4(*(void *)(a1 + 32));
}

void sub_1DDBD659C(uint64_t a1@<X0>, void *a2@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v4 = v8;
  float v5 = off_1EAB8AAA8[0];
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD66B4;
  v7[3] = &unk_1E6D05198;
  v7[4] = a1;
  sub_1DDAB6440(v4, v5, v6, v7, a2);
  if (v9) {
    sub_1DDA18310(v9);
  }
}

void sub_1DDBD669C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1DDBD66B4@<X0>(void *a1@<X8>)
{
  return sub_1DDACD708(a1);
}

void sub_1DDBD66BC(uint64_t a1@<X0>, void *a2@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v4 = v8;
  float v5 = off_1EAB8AAB8[0];
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD6CCC;
  v7[3] = &unk_1E6D07208;
  v7[4] = a1;
  sub_1DDBD67D4(v4, v5, v6, v7, a2);
  if (v9) {
    sub_1DDA18310(v9);
  }
}

void sub_1DDBD67BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBD67D4(uint64_t a1@<X0>, void *a2@<X1>, int a3@<W2>, void *a4@<X3>, void *a5@<X8>)
{
  void (**v45)(void *__return_ptr);
  uint64_t **v46;
  id v47;
  __n128 __p;
  unint64_t v49;
  void v50[4];
  id v51;
  uint64_t v52;
  std::__shared_weak_count *v53;
  void *v54;
  unsigned char *v55;
  char v56;
  std::string v57;

  id v9 = a2;
  uint64_t v47 = a4;
  sub_1DDAB6A18(v9, a3, &v57);
  uint64_t v46 = (uint64_t **)(a1 + 24);
  char v10 = sub_1DDA2A530(a1 + 24, (void **)&v57.__r_.__value_.__l.__data_);
  if ((void **)(a1 + 32) == v10)
  {
    LOBYTE(v54) = 0;
    uint64_t v56 = 0;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = sub_1DDBE2DDC;
    v50[3] = &unk_1E6D051E8;
    uint64_t v45 = (void (**)(void *__return_ptr))v47;
    uint64_t v51 = v45;
    sub_1DDB657E4(a1, v9, v50, &v52);
    if (v52)
    {
      uint64_t v16 = sub_1DDB67AB8(v52, v12, v13, v14, v15);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1E01C3B90](exception, "RawCameraException");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      unint64_t v21 = 0;
      std::string __p = 0uLL;
      uint64_t v49 = 0;
      while (v21 < objc_msgSend_count(v16, v17, v18, v19, v20, v45, v46))
      {
        double v25 = objc_msgSend_objectAtIndexedSubscript_(v16, v22, v21, v23, v24);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v43 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x1E01C3B90](v43, "RawCameraException");
          __cxa_throw(v43, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        __int16 v30 = objc_msgSend_longLongValue(v25, v26, v27, v28, v29);
        __int16 v31 = v30;
        unint64_t v32 = __p.n128_u64[1];
        if (__p.n128_u64[1] >= v49)
        {
          uint64_t v34 = (void *)__p.n128_u64[0];
          int64_t v35 = __p.n128_u64[1] - __p.n128_u64[0];
          if ((uint64_t)(__p.n128_u64[1] - __p.n128_u64[0]) <= -3) {
            sub_1DDA17F78();
          }
          uint64_t v36 = v35 >> 1;
          if (v49 - __p.n128_u64[0] <= (v35 >> 1) + 1) {
            uint64_t v37 = v36 + 1;
          }
          else {
            uint64_t v37 = v49 - __p.n128_u64[0];
          }
          if (v49 - __p.n128_u64[0] >= 0x7FFFFFFFFFFFFFFELL) {
            uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v38 = v37;
          }
          if (v38)
          {
            uint64_t v39 = (char *)sub_1DDA1AD0C((uint64_t)&v49, v38);
            unint64_t v32 = __p.n128_u64[1];
            uint64_t v34 = (void *)__p.n128_u64[0];
          }
          else
          {
            uint64_t v39 = 0;
          }
          uint64_t v40 = &v39[2 * v36];
          *(_WORD *)uint64_t v40 = v31;
          unint64_t v33 = (unint64_t)(v40 + 2);
          while ((void *)v32 != v34)
          {
            __int16 v41 = *(_WORD *)(v32 - 2);
            v32 -= 2;
            *((_WORD *)v40 - 1) = v41;
            v40 -= 2;
          }
          __p.n128_u64[0] = (unint64_t)v40;
          __p.n128_u64[1] = v33;
          uint64_t v49 = (unint64_t)&v39[2 * v38];
          if (v34) {
            operator delete(v34);
          }
        }
        else
        {
          *(_WORD *)__p.n128_u64[1] = v30;
          unint64_t v33 = v32 + 2;
        }
        __p.n128_u64[1] = v33;

        ++v21;
      }
      sub_1DDBE2E64((uint64_t)&v54, (uint64_t)&__p);
      if (__p.n128_u64[0])
      {
        __p.n128_u64[1] = __p.n128_u64[0];
        operator delete((void *)__p.n128_u64[0]);
      }
    }
    if (v53) {
      sub_1DDA18310(v53);
    }

    if (!v56)
    {
      ((void (**)(__n128 *__return_ptr))v45)[2](&__p);
      sub_1DDA5BD44((uint64_t)&v54, &__p);
      if (__p.n128_u64[0])
      {
        __p.n128_u64[1] = __p.n128_u64[0];
        operator delete((void *)__p.n128_u64[0]);
      }
      if (!v56) {
        goto LABEL_46;
      }
    }
    __p.n128_u64[0] = (unint64_t)&v57;
    uint64_t v42 = sub_1DDAB6C70(v46, (void **)&v57.__r_.__value_.__l.__data_, (uint64_t)&unk_1DDBFB044, (long long **)&__p);
    sub_1DDBE2EDC((uint64_t)(v42 + 7), (uint64_t)&v54);
    if (!v56) {
LABEL_46:
    }
      sub_1DDA1D8BC();
    *a5 = 0;
    a5[1] = 0;
    a5[2] = 0;
    sub_1DDA1D908(a5, v54, (uint64_t)v55, (v55 - (unsigned char *)v54) >> 1);
    if (v56 && v54)
    {
      unint64_t v55 = v54;
      operator delete(v54);
    }
  }
  else
  {
    BOOL v11 = (const void **)sub_1DDBE3028((uint64_t (**)(uint64_t, void, void, void *, void *))v10 + 7);
    if (!v11) {
      sub_1DDAB6C00();
    }
    *a5 = 0;
    a5[1] = 0;
    a5[2] = 0;
    sub_1DDA1D908(a5, *v11, (uint64_t)v11[1], ((unsigned char *)v11[1] - (unsigned char *)*v11) >> 1);
  }
  if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v57.__r_.__value_.__l.__data_);
  }
}

void sub_1DDBD6BD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,std::__shared_weak_count *a22,void *__p,uint64_t a24,uint64_t a25,char a26)
{
  __cxa_free_exception(v27);

  if (a22) {
    sub_1DDA18310(a22);
  }

  if (a26 && __p) {
    operator delete(__p);
  }
  if (*(char *)(v28 - 89) < 0) {
    operator delete(*(void **)(v28 - 112));
  }

  _Unwind_Resume(a1);
}

void sub_1DDBD6CCC(uint64_t a1@<X0>, _WORD **a2@<X8>)
{
}

uint64_t sub_1DDBD6CD4(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AAC0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD6DEC;
  v7[3] = &unk_1E6D05458;
  v7[4] = a1;
  uint64_t v5 = sub_1DDACFD70(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD6DD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD6DEC(uint64_t a1)
{
  return sub_1DDA3148C(*(void *)(a1 + 32));
}

double sub_1DDBD6DF4(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AAC8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD6F14;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD6EFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD6F14(uint64_t a1)
{
  return sub_1DDA3150C(*(void *)(a1 + 32));
}

void sub_1DDBD6F1C(uint64_t a1@<X0>, void *a2@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v4 = v8;
  double v5 = off_1EAB8AAD0[0];
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD7034;
  v7[3] = &unk_1E6D07208;
  v7[4] = a1;
  sub_1DDBD67D4(v4, v5, v6, v7, a2);
  if (v9) {
    sub_1DDA18310(v9);
  }
}

void sub_1DDBD701C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBD7034(uint64_t a1@<X0>, void *a2@<X8>)
{
}

BOOL sub_1DDBD703C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AAF8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD7154;
  v7[3] = &unk_1E6D05250;
  v7[4] = a1;
  BOOL v5 = sub_1DDAC8A08(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD713C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD7154(uint64_t a1)
{
  return sub_1DDA31614(*(void *)(a1 + 32));
}

void sub_1DDBD715C(uint64_t a1@<X0>, void *a2@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v4 = v8;
  BOOL v5 = off_1EAB8AB00[0];
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD7794;
  v7[3] = &unk_1E6D07228;
  v7[4] = a1;
  sub_1DDBD7274(v4, v5, v6, v7, a2);
  if (v9) {
    sub_1DDA18310(v9);
  }
}

void sub_1DDBD725C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBD7274(uint64_t a1@<X0>, void *a2@<X1>, int a3@<W2>, void *a4@<X3>, void *a5@<X8>)
{
  void (**v46)(void *__return_ptr);
  id v47;
  void *v48;
  std::string *v49;
  void *v50;
  void *v51;
  void *__p;
  char *v53;
  char *v54;
  void v55[4];
  id v56;
  uint64_t v57;
  std::__shared_weak_count *v58;
  char v59[8];
  void *v60;
  void *v61;
  char v62;
  std::string v63;

  id v9 = a2;
  uint64_t v47 = a4;
  uint64_t v48 = v9;
  sub_1DDAB6A18(v9, a3, &v63);
  char v10 = (uint64_t **)(a1 + 24);
  BOOL v11 = sub_1DDA2A530(a1 + 24, (void **)&v63.__r_.__value_.__l.__data_);
  if ((void **)(a1 + 32) == v11)
  {
    v59[0] = 0;
    uint64_t v62 = 0;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = sub_1DDBE326C;
    v55[3] = &unk_1E6D051E8;
    uint64_t v46 = (void (**)(void *__return_ptr))v47;
    uint64_t v56 = v46;
    sub_1DDB657E4(a1, v9, v55, &v57);
    if (v57)
    {
      uint64_t v17 = sub_1DDB67AB8(v57, v13, v14, v15, v16);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1E01C3B90](exception, "RawCameraException");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      unint64_t v22 = 0;
      std::string __p = 0;
      uint64_t v53 = 0;
      unsigned int v54 = 0;
      while (v22 < objc_msgSend_count(v17, v18, v19, v20, v21, v46))
      {
        uint64_t v26 = objc_msgSend_objectAtIndexedSubscript_(v17, v23, v22, v24, v25);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          unsigned int v44 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x1E01C3B90](v44, "RawCameraException");
          __cxa_throw(v44, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        objc_msgSend_doubleValue(v26, v27, v28, v29, v30);
        uint64_t v32 = v31;
        unint64_t v33 = v53;
        if (v53 >= v54)
        {
          int64_t v35 = (char *)__p;
          uint64_t v36 = (v53 - (unsigned char *)__p) >> 3;
          unint64_t v37 = v36 + 1;
          if ((unint64_t)(v36 + 1) >> 61) {
            sub_1DDA17F78();
          }
          uint64_t v38 = v54 - (unsigned char *)__p;
          if ((v54 - (unsigned char *)__p) >> 2 > v37) {
            unint64_t v37 = v38 >> 2;
          }
          if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v39 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v39 = v37;
          }
          if (v39)
          {
            uint64_t v40 = (char *)sub_1DDA1814C((uint64_t)&v54, v39);
            int64_t v35 = (char *)__p;
            unint64_t v33 = v53;
          }
          else
          {
            uint64_t v40 = 0;
          }
          __int16 v41 = &v40[8 * v36];
          *(void *)__int16 v41 = v32;
          uint64_t v34 = v41 + 8;
          while (v33 != v35)
          {
            uint64_t v42 = *((void *)v33 - 1);
            v33 -= 8;
            *((void *)v41 - 1) = v42;
            v41 -= 8;
          }
          std::string __p = v41;
          uint64_t v53 = v34;
          unsigned int v54 = &v40[8 * v39];
          if (v35) {
            operator delete(v35);
          }
        }
        else
        {
          *(void *)uint64_t v53 = v31;
          uint64_t v34 = v33 + 8;
        }
        uint64_t v53 = v34;

        ++v22;
      }
      sub_1DDAD8498(&v49, 3, 3, &__p);
      sub_1DDBE32F4((uint64_t)v59, (uint64_t)&v49);
      if (v50)
      {
        uint64_t v51 = v50;
        operator delete(v50);
      }
      if (__p)
      {
        uint64_t v53 = (char *)__p;
        operator delete(__p);
      }
    }
    if (v58) {
      sub_1DDA18310(v58);
    }

    if (!v62)
    {
      ((void (**)(std::string **__return_ptr))v46)[2](&v49);
      sub_1DDBE32F4((uint64_t)v59, (uint64_t)&v49);
      if (v50)
      {
        uint64_t v51 = v50;
        operator delete(v50);
      }
      if (!v62) {
        goto LABEL_47;
      }
    }
    uint64_t v49 = &v63;
    uint64_t v43 = sub_1DDAB6C70(v10, (void **)&v63.__r_.__value_.__l.__data_, (uint64_t)&unk_1DDBFB044, (long long **)&v49);
    sub_1DDBE333C((unint64_t *)v43 + 7, (uint64_t)v59);
    if (!v62) {
LABEL_47:
    }
      sub_1DDA1D8BC();
    sub_1DDAD80E8(a5, (uint64_t)v59);
    if (v62 && v60)
    {
      uint64_t v61 = v60;
      operator delete(v60);
    }
  }
  else
  {
    uint64_t v12 = sub_1DDBE3464((uint64_t (**)(uint64_t, void, void, void *, void *))v11 + 7);
    if (!v12) {
      sub_1DDAB6C00();
    }
    sub_1DDAD80E8(a5, (uint64_t)v12);
  }
  if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v63.__r_.__value_.__l.__data_);
  }
}

void sub_1DDBD7684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,std::__shared_weak_count *a25,uint64_t a26,void *__p,uint64_t a28,uint64_t a29,char a30)
{
  __cxa_free_exception(v31);

  if (a25) {
    sub_1DDA18310(a25);
  }

  if (a30 && __p) {
    operator delete(__p);
  }
  if (*(char *)(v32 - 105) < 0) {
    operator delete(*(void **)(v32 - 128));
  }

  _Unwind_Resume(a1);
}

void sub_1DDBD7794(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
}

void sub_1DDBD779C(uint64_t a1@<X0>, void *a2@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v4 = v8;
  BOOL v5 = off_1EAB8AB08[0];
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD78B4;
  v7[3] = &unk_1E6D07228;
  v7[4] = a1;
  sub_1DDBD7274(v4, v5, v6, v7, a2);
  if (v9) {
    sub_1DDA18310(v9);
  }
}

void sub_1DDBD789C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBD78B4(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
}

void sub_1DDBD78BC(uint64_t a1@<X0>, void *a2@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v4 = v8;
  BOOL v5 = off_1EAB8AB10[0];
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD79D4;
  v7[3] = &unk_1E6D07228;
  v7[4] = a1;
  sub_1DDBD7274(v4, v5, v6, v7, a2);
  if (v9) {
    sub_1DDA18310(v9);
  }
}

void sub_1DDBD79BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBD79D4(uint64_t a1@<X0>, void *a2@<X8>)
{
}

void sub_1DDBD79DC(uint64_t a1@<X0>, void *a2@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v4 = v8;
  BOOL v5 = off_1EAB8AB18[0];
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD7AF4;
  v7[3] = &unk_1E6D07228;
  v7[4] = a1;
  sub_1DDBD7274(v4, v5, v6, v7, a2);
  if (v9) {
    sub_1DDA18310(v9);
  }
}

void sub_1DDBD7ADC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBD7AF4(uint64_t a1@<X0>, void *a2@<X8>)
{
}

void sub_1DDBD7AFC(uint64_t a1@<X0>, void *a2@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v4 = v8;
  BOOL v5 = off_1EAB8AB20[0];
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD7C14;
  v7[3] = &unk_1E6D07228;
  v7[4] = a1;
  sub_1DDBD7274(v4, v5, v6, v7, a2);
  if (v9) {
    sub_1DDA18310(v9);
  }
}

void sub_1DDBD7BFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBD7C14(uint64_t a1@<X0>, void *a2@<X8>)
{
}

BOOL sub_1DDBD7C1C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AB28[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD7D34;
  v7[3] = &unk_1E6D05250;
  v7[4] = a1;
  BOOL v5 = sub_1DDAC8A08(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD7D1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_1DDBD7D34(uint64_t a1)
{
  return sub_1DDA31914(*(void *)(a1 + 32));
}

BOOL sub_1DDBD7D3C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AB30[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD7E54;
  v7[3] = &unk_1E6D05250;
  v7[4] = a1;
  BOOL v5 = sub_1DDAC8A08(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD7E3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD7E54(uint64_t a1)
{
  return sub_1DDA31994(*(void *)(a1 + 32));
}

BOOL sub_1DDBD7E5C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AB38[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD7F74;
  v7[3] = &unk_1E6D05250;
  v7[4] = a1;
  BOOL v5 = sub_1DDAC8A08(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD7F5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_1DDBD7F74(uint64_t a1)
{
  return sub_1DDA31A14(*(void *)(a1 + 32));
}

BOOL sub_1DDBD7F7C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AB40[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD8094;
  v7[3] = &unk_1E6D05250;
  v7[4] = a1;
  BOOL v5 = sub_1DDAC8A08(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD807C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD8094(uint64_t a1)
{
  return sub_1DDA31A94(*(void *)(a1 + 32));
}

BOOL sub_1DDBD809C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AB48[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD81B4;
  v7[3] = &unk_1E6D05250;
  v7[4] = a1;
  BOOL v5 = sub_1DDAC8A08(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD819C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD81B4(uint64_t a1)
{
  return sub_1DDA31B14(*(void *)(a1 + 32));
}

BOOL sub_1DDBD81BC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AB50[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD82D4;
  v7[3] = &unk_1E6D05250;
  v7[4] = a1;
  BOOL v5 = sub_1DDAC8A08(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD82BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD82D4(uint64_t a1)
{
  return sub_1DDA31B94(*(void *)(a1 + 32));
}

BOOL sub_1DDBD82DC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AB58[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD83F4;
  v7[3] = &unk_1E6D05250;
  v7[4] = a1;
  BOOL v5 = sub_1DDAC8A08(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD83DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD83F4(uint64_t a1)
{
  return sub_1DDA31C14(*(void *)(a1 + 32));
}

uint64_t sub_1DDBD83FC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AB60[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD8884;
  v7[3] = &unk_1E6D05178;
  v7[4] = a1;
  uint64_t v5 = sub_1DDBD8514(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD84FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD8514(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  sub_1DDAB6A18(v7, a3, &__p);
  id v9 = (uint64_t **)(a1 + 24);
  char v10 = sub_1DDA2A530(a1 + 24, (void **)&__p.__r_.__value_.__l.__data_);
  if ((void **)(a1 + 32) == v10)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1DDBE362C;
    v29[3] = &unk_1E6D051C0;
    uint64_t v13 = (uint64_t (**)(void))v8;
    id v30 = v13;
    sub_1DDB657E4(a1, v7, v29, &p_p);
    uint64_t v18 = (long long *)p_p;
    if (p_p)
    {
      uint64_t v19 = sub_1DDB67AB8((uint64_t)p_p, v14, v15, v16, v17);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1E01C3B90](exception, "RawCameraException");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      uint64_t v12 = objc_msgSend_longLongValue(v19, v20, v21, v22, v23);
    }
    else
    {
      uint64_t v12 = 0;
    }
    if (v34) {
      sub_1DDA18310(v34);
    }

    if (!v18) {
      uint64_t v12 = v13[2](v13);
    }
    p_p = &__p;
    uint64_t v24 = sub_1DDAB6C70(v9, (void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&unk_1DDBFB044, (long long **)&p_p);
    uint64_t v25 = (void (**)(uint64_t, void, std::string **, void, void))(v24 + 7);
    v32[1] = (uint64_t (*)(void, void, void, void, void))v12;
    v32[0] = (uint64_t (*)(void, void, void, void, void))sub_1DDBE36C4;
    if (v32 != (uint64_t (**)(void, void, void, void, void))(v24 + 7))
    {
      uint64_t v26 = *v25;
      if (*v25)
      {
        p_p = 0;
        uint64_t v34 = 0;
        v26(2, v25, &p_p, 0, 0);
        v32[0](2, v32, v25, 0, 0);
        ((void (*)(uint64_t, std::string **, uint64_t (**)(void, void, void, void, void), void, void))p_p)(2, &p_p, v32, 0, 0);
        sub_1DDAB6E58((uint64_t (**)(void, void, void, void, void))&p_p);
      }
      else
      {
        *((_DWORD *)v24 + 16) = v12;
        v24[7] = (uint64_t)sub_1DDBE36C4;
        v32[0] = 0;
      }
    }
    sub_1DDAB6E58(v32);
  }
  else
  {
    BOOL v11 = (unsigned int *)sub_1DDBE3678((uint64_t (**)(uint64_t, void, void, void *, void *))v10 + 7);
    if (!v11) {
      sub_1DDAB6C00();
    }
    uint64_t v12 = *v11;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  return v12;
}

void sub_1DDBD87F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,std::__shared_weak_count *a26)
{
  __cxa_free_exception(v28);

  if (a26) {
    sub_1DDA18310(a26);
  }

  if (a20 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

BOOL sub_1DDBD8884(uint64_t a1)
{
  return sub_1DDA31C94(*(void *)(a1 + 32));
}

double sub_1DDBD888C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AB68[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD89AC;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD8994(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD89AC(uint64_t a1)
{
  return sub_1DDA31D14(*(void *)(a1 + 32));
}

double sub_1DDBD89B4(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AB70[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD8AD4;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD8ABC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD8AD4(uint64_t a1)
{
  return sub_1DDA31D9C(*(void *)(a1 + 32));
}

double sub_1DDBD8ADC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AB78[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD8BFC;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD8BE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD8BFC(uint64_t a1)
{
  return sub_1DDA31E24(*(void *)(a1 + 32));
}

double sub_1DDBD8C04(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AB80[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD8D24;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD8D0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD8D24(uint64_t a1)
{
  return sub_1DDA31EAC(*(void *)(a1 + 32));
}

double sub_1DDBD8D2C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AB88[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD8E4C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD8E34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD8E4C(uint64_t a1)
{
  return sub_1DDA31F34(*(void *)(a1 + 32));
}

double sub_1DDBD8E54(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AB90[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD8F74;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD8F5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD8F74(uint64_t a1)
{
  return sub_1DDA31FBC(*(void *)(a1 + 32));
}

double sub_1DDBD8F7C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AB98[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD909C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD9084(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD909C(uint64_t a1)
{
  return sub_1DDA32044(*(void *)(a1 + 32));
}

double sub_1DDBD90A4(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ABA0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD91C4;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD91AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD91C4(uint64_t a1)
{
  return sub_1DDA320CC(*(void *)(a1 + 32));
}

double sub_1DDBD91CC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ABA8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD92EC;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD92D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD92EC(uint64_t a1)
{
  return sub_1DDA32154(*(void *)(a1 + 32));
}

double sub_1DDBD92F4(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ABB0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD9414;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD93FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD9414(uint64_t a1)
{
  return sub_1DDA321DC(*(void *)(a1 + 32));
}

double sub_1DDBD941C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ABB8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD953C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD9524(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD953C(uint64_t a1)
{
  return sub_1DDA32264(*(void *)(a1 + 32));
}

double sub_1DDBD9544(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ABC0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD9664;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD964C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD9664(uint64_t a1)
{
  return sub_1DDA322EC(*(void *)(a1 + 32));
}

BOOL sub_1DDBD966C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ABC8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD9784;
  v7[3] = &unk_1E6D05250;
  v7[4] = a1;
  BOOL v5 = sub_1DDAC8A08(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD976C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD9784(uint64_t a1)
{
  return sub_1DDA32374(*(void *)(a1 + 32));
}

BOOL sub_1DDBD978C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ABD0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD98A4;
  v7[3] = &unk_1E6D05250;
  v7[4] = a1;
  BOOL v5 = sub_1DDAC8A08(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD988C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD98A4(uint64_t a1)
{
  return sub_1DDA323F4(*(void *)(a1 + 32));
}

double sub_1DDBD98AC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ABD8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD99CC;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD99B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD99CC(uint64_t a1)
{
  return sub_1DDA32474(*(void *)(a1 + 32));
}

double sub_1DDBD99D4(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ABE0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD9AF4;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD9ADC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD9AF4(uint64_t a1)
{
  return sub_1DDA324FC(*(void *)(a1 + 32));
}

double sub_1DDBD9AFC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ABE8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD9C1C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD9C04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD9C1C(uint64_t a1)
{
  return sub_1DDA32584(*(void *)(a1 + 32));
}

uint64_t sub_1DDBD9C24(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ABF0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD9D3C;
  v7[3] = &unk_1E6D05178;
  v7[4] = a1;
  uint64_t v5 = sub_1DDB0BDDC(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD9D24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBD9D3C(uint64_t a1)
{
  return sub_1DDA3260C(*(void *)(a1 + 32));
}

double sub_1DDBD9D44(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ABF8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD9E64;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD9E4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD9E64(uint64_t a1)
{
  return sub_1DDA3268C(*(void *)(a1 + 32));
}

double sub_1DDBD9E6C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AC00[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBD9F8C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBD9F74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBD9F8C(uint64_t a1)
{
  return sub_1DDA32714(*(void *)(a1 + 32));
}

double sub_1DDBD9F94(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AC08[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDA0B4;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDA09C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDA0B4(uint64_t a1)
{
  return sub_1DDA3279C(*(void *)(a1 + 32));
}

double sub_1DDBDA0BC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AC10[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDA1DC;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDA1C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDA1DC(uint64_t a1)
{
  return sub_1DDA32824(*(void *)(a1 + 32));
}

double sub_1DDBDA1E4(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AC18[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDA304;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDA2EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDA304(uint64_t a1)
{
  return sub_1DDA328AC(*(void *)(a1 + 32));
}

double sub_1DDBDA30C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AC20[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDA42C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDA414(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDA42C(uint64_t a1)
{
  return sub_1DDA32934(*(void *)(a1 + 32));
}

double sub_1DDBDA434(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AC28[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDA554;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDA53C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDA554(uint64_t a1)
{
  return sub_1DDA329BC(*(void *)(a1 + 32));
}

double sub_1DDBDA55C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AC30[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDA67C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDA664(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDA67C(uint64_t a1)
{
  return sub_1DDA32A44(*(void *)(a1 + 32));
}

double sub_1DDBDA684(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AC38[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDA7A4;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDA78C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDA7A4(uint64_t a1)
{
  return sub_1DDA32ACC(*(void *)(a1 + 32));
}

double sub_1DDBDA7AC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AC40[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDA8CC;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDA8B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDA8CC(uint64_t a1)
{
  return sub_1DDA32B54(*(void *)(a1 + 32));
}

double sub_1DDBDA8D4(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AC48[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDA9F4;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDA9DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDA9F4(uint64_t a1)
{
  return sub_1DDA32BDC(*(void *)(a1 + 32));
}

double sub_1DDBDA9FC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AC50[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDAB1C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDAB04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDAB1C(uint64_t a1)
{
  return sub_1DDA32C64(*(void *)(a1 + 32));
}

double sub_1DDBDAB24(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AC58[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDAC44;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDAC2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDAC44(uint64_t a1)
{
  return sub_1DDA32CEC(*(void *)(a1 + 32));
}

double sub_1DDBDAC4C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AC60[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDAD6C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDAD54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDAD6C(uint64_t a1)
{
  return sub_1DDA32D74(*(void *)(a1 + 32));
}

double sub_1DDBDAD74(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AC68[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDAE94;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDAE7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDAE94(uint64_t a1)
{
  return sub_1DDA32DFC(*(void *)(a1 + 32));
}

double sub_1DDBDAE9C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AC70[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDAFBC;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDAFA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDAFBC(uint64_t a1)
{
  return sub_1DDA32E84(*(void *)(a1 + 32));
}

double sub_1DDBDAFC4(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AC78[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDB0E4;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDB0CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDB0E4(uint64_t a1)
{
  return sub_1DDA32F0C(*(void *)(a1 + 32));
}

double sub_1DDBDB0EC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AC80[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDB20C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDB1F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDB20C(uint64_t a1)
{
  return sub_1DDA32F94(*(void *)(a1 + 32));
}

double sub_1DDBDB214(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AC88[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDB334;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDB31C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDB334(uint64_t a1)
{
  return sub_1DDA3301C(*(void *)(a1 + 32));
}

double sub_1DDBDB33C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AC90[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDB45C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDB444(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDB45C(uint64_t a1)
{
  return sub_1DDA330A4(*(void *)(a1 + 32));
}

double sub_1DDBDB464(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AC98[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDB584;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDB56C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDB584(uint64_t a1)
{
  return sub_1DDA3312C(*(void *)(a1 + 32));
}

double sub_1DDBDB58C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ACA0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDB6AC;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDB694(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDB6AC(uint64_t a1)
{
  return sub_1DDA331B4(*(void *)(a1 + 32));
}

double sub_1DDBDB6B4(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ACA8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDB7D4;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDB7BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDB7D4(uint64_t a1)
{
  return sub_1DDA3323C(*(void *)(a1 + 32));
}

double sub_1DDBDB7DC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ACB0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDB8FC;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDB8E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDB8FC(uint64_t a1)
{
  return sub_1DDA332C4(*(void *)(a1 + 32));
}

double sub_1DDBDB904(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ACB8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDBA24;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDBA0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDBA24(uint64_t a1)
{
  return sub_1DDA3334C(*(void *)(a1 + 32));
}

double sub_1DDBDBA2C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ACC0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDBB4C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDBB34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDBB4C(uint64_t a1)
{
  return sub_1DDA333D4(*(void *)(a1 + 32));
}

double sub_1DDBDBB54(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ACC8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDBC74;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDBC5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDBC74(uint64_t a1)
{
  return sub_1DDA3345C(*(void *)(a1 + 32));
}

double sub_1DDBDBC7C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ACD0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDBD9C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDBD84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDBD9C(uint64_t a1)
{
  return sub_1DDA334E4(*(void *)(a1 + 32));
}

double sub_1DDBDBDA4(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ACD8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDBEC4;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDBEAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDBEC4(uint64_t a1)
{
  return sub_1DDA3356C(*(void *)(a1 + 32));
}

double sub_1DDBDBECC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ACE0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDBFEC;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDBFD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDBFEC(uint64_t a1)
{
  return sub_1DDA335F4(*(void *)(a1 + 32));
}

double sub_1DDBDBFF4(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ACE8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDC114;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDC0FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDC114(uint64_t a1)
{
  return sub_1DDA3367C(*(void *)(a1 + 32));
}

double sub_1DDBDC11C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ACF0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDC23C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDC224(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDC23C(uint64_t a1)
{
  return sub_1DDA33704(*(void *)(a1 + 32));
}

double sub_1DDBDC244(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ACF8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDC364;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDC34C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDC364(uint64_t a1)
{
  return sub_1DDA3378C(*(void *)(a1 + 32));
}

double sub_1DDBDC36C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AD00[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDC48C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDC474(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDC48C(uint64_t a1)
{
  return sub_1DDA33814(*(void *)(a1 + 32));
}

double sub_1DDBDC494(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AD08[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDC5B4;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDC59C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDC5B4(uint64_t a1)
{
  return sub_1DDA3389C(*(void *)(a1 + 32));
}

uint64_t sub_1DDBDC5BC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AD10[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDCA44;
  v7[3] = &unk_1E6D05178;
  v7[4] = a1;
  uint64_t v5 = sub_1DDBDC6D4(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDC6BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBDC6D4(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  sub_1DDAB6A18(v7, a3, &__p);
  id v9 = (uint64_t **)(a1 + 24);
  char v10 = sub_1DDA2A530(a1 + 24, (void **)&__p.__r_.__value_.__l.__data_);
  if ((void **)(a1 + 32) == v10)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1DDBE37A4;
    v29[3] = &unk_1E6D051C0;
    uint64_t v13 = (uint64_t (**)(void))v8;
    id v30 = v13;
    sub_1DDB657E4(a1, v7, v29, &p_p);
    uint64_t v18 = (long long *)p_p;
    if (p_p)
    {
      uint64_t v19 = sub_1DDB67AB8((uint64_t)p_p, v14, v15, v16, v17);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1E01C3B90](exception, "RawCameraException");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      uint64_t v12 = objc_msgSend_longLongValue(v19, v20, v21, v22, v23);
    }
    else
    {
      uint64_t v12 = 0;
    }
    if (v34) {
      sub_1DDA18310(v34);
    }

    if (!v18) {
      uint64_t v12 = v13[2](v13);
    }
    p_p = &__p;
    uint64_t v24 = sub_1DDAB6C70(v9, (void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&unk_1DDBFB044, (long long **)&p_p);
    uint64_t v25 = (void (**)(uint64_t, void, std::string **, void, void))(v24 + 7);
    v32[1] = (uint64_t (*)(void, void, void, void, void))v12;
    v32[0] = (uint64_t (*)(void, void, void, void, void))sub_1DDBE383C;
    if (v32 != (uint64_t (**)(void, void, void, void, void))(v24 + 7))
    {
      uint64_t v26 = *v25;
      if (*v25)
      {
        p_p = 0;
        uint64_t v34 = 0;
        v26(2, v25, &p_p, 0, 0);
        v32[0](2, v32, v25, 0, 0);
        ((void (*)(uint64_t, std::string **, uint64_t (**)(void, void, void, void, void), void, void))p_p)(2, &p_p, v32, 0, 0);
        sub_1DDAB6E58((uint64_t (**)(void, void, void, void, void))&p_p);
      }
      else
      {
        *((_DWORD *)v24 + 16) = v12;
        v24[7] = (uint64_t)sub_1DDBE383C;
        v32[0] = 0;
      }
    }
    sub_1DDAB6E58(v32);
  }
  else
  {
    BOOL v11 = (unsigned int *)sub_1DDBE37F0((uint64_t (**)(uint64_t, void, void, void *, void *))v10 + 7);
    if (!v11) {
      sub_1DDAB6C00();
    }
    uint64_t v12 = *v11;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  return v12;
}

void sub_1DDBDC9B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,std::__shared_weak_count *a26)
{
  __cxa_free_exception(v28);

  if (a26) {
    sub_1DDA18310(a26);
  }

  if (a20 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_1DDBDCA44(uint64_t a1)
{
  return sub_1DDA33924(*(void *)(a1 + 32));
}

uint64_t sub_1DDBDCA4C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AD18[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDCED4;
  v7[3] = &unk_1E6D05178;
  v7[4] = a1;
  uint64_t v5 = sub_1DDBDCB64(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDCB4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBDCB64(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  sub_1DDAB6A18(v7, a3, &__p);
  id v9 = (uint64_t **)(a1 + 24);
  char v10 = sub_1DDA2A530(a1 + 24, (void **)&__p.__r_.__value_.__l.__data_);
  if ((void **)(a1 + 32) == v10)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1DDBE391C;
    v29[3] = &unk_1E6D051C0;
    uint64_t v13 = (uint64_t (**)(void))v8;
    id v30 = v13;
    sub_1DDB657E4(a1, v7, v29, &p_p);
    uint64_t v18 = (long long *)p_p;
    if (p_p)
    {
      uint64_t v19 = sub_1DDB67AB8((uint64_t)p_p, v14, v15, v16, v17);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1E01C3B90](exception, "RawCameraException");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      uint64_t v12 = objc_msgSend_longLongValue(v19, v20, v21, v22, v23);
    }
    else
    {
      uint64_t v12 = 0;
    }
    if (v34) {
      sub_1DDA18310(v34);
    }

    if (!v18) {
      uint64_t v12 = v13[2](v13);
    }
    p_p = &__p;
    uint64_t v24 = sub_1DDAB6C70(v9, (void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&unk_1DDBFB044, (long long **)&p_p);
    uint64_t v25 = (void (**)(uint64_t, void, std::string **, void, void))(v24 + 7);
    v32[1] = (uint64_t (*)(void, void, void, void, void))v12;
    v32[0] = (uint64_t (*)(void, void, void, void, void))sub_1DDBE39B4;
    if (v32 != (uint64_t (**)(void, void, void, void, void))(v24 + 7))
    {
      uint64_t v26 = *v25;
      if (*v25)
      {
        p_p = 0;
        uint64_t v34 = 0;
        v26(2, v25, &p_p, 0, 0);
        v32[0](2, v32, v25, 0, 0);
        ((void (*)(uint64_t, std::string **, uint64_t (**)(void, void, void, void, void), void, void))p_p)(2, &p_p, v32, 0, 0);
        sub_1DDAB6E58((uint64_t (**)(void, void, void, void, void))&p_p);
      }
      else
      {
        *((_DWORD *)v24 + 16) = v12;
        v24[7] = (uint64_t)sub_1DDBE39B4;
        v32[0] = 0;
      }
    }
    sub_1DDAB6E58(v32);
  }
  else
  {
    BOOL v11 = (unsigned int *)sub_1DDBE3968((uint64_t (**)(uint64_t, void, void, void *, void *))v10 + 7);
    if (!v11) {
      sub_1DDAB6C00();
    }
    uint64_t v12 = *v11;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  return v12;
}

void sub_1DDBDCE44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,std::__shared_weak_count *a26)
{
  __cxa_free_exception(v28);

  if (a26) {
    sub_1DDA18310(a26);
  }

  if (a20 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

BOOL sub_1DDBDCED4(uint64_t a1)
{
  return sub_1DDA339A4(*(void *)(a1 + 32));
}

double sub_1DDBDCEDC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AD20[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDCFFC;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDCFE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDCFFC(uint64_t a1)
{
  return sub_1DDA33A24(*(void *)(a1 + 32));
}

void sub_1DDBDD004(uint64_t a1@<X0>, std::__shared_weak_count **a2@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v4 = v8;
  double v5 = off_1EAB8AD28[0];
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDD6D4;
  v7[3] = &unk_1E6D07248;
  v7[4] = a1;
  sub_1DDBDD11C(v4, v5, v6, v7, a2);
  if (v9) {
    sub_1DDA18310(v9);
  }
}

void sub_1DDBDD104(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBDD11C(uint64_t a1@<X0>, void *a2@<X1>, int a3@<W2>, void *a4@<X3>, std::__shared_weak_count **a5@<X8>)
{
  void (**v16)(void *__return_ptr);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *(*v21)(unsigned int, void *, void *, uint64_t, void *);
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  uint64_t *v49;
  void *v50;
  uint64_t (*v51)(uint64_t, void *, void **, void, void);
  void *v52;
  void *exception;
  void *(*v54)(unsigned int, void *, void *, uint64_t, void *);
  id v55;
  void *v56;
  void v57[2];
  void v58[4];
  id v59;
  std::string v60;
  void *(*v61)(unsigned int, void *, void *, uint64_t, void *);
  std::__shared_weak_count *v62;
  std::__shared_weak_count *v63;
  void *__p;
  char *v65;
  void v66[4];

  v66[2] = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a4;
  uint64_t v56 = v10;
  sub_1DDAB6A18(v10, a3, &v60);
  uint64_t v12 = (uint64_t **)(a1 + 24);
  uint64_t v13 = sub_1DDA2A530(a1 + 24, (void **)&v60.__r_.__value_.__l.__data_);
  if ((void **)(a1 + 32) == v13)
  {
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = sub_1DDBE1440;
    v58[3] = &unk_1E6D051E8;
    uint64_t v16 = (void (**)(void *__return_ptr))v11;
    uint64_t v59 = v16;
    unint64_t v55 = v11;
    sub_1DDB657E4(a1, v10, v58, &v61);
    uint64_t v21 = v61;
    if (v61)
    {
      uint64_t v22 = sub_1DDB67AB8((uint64_t)v61, v17, v18, v19, v20);
      objc_opt_class();
      unsigned int v54 = v21;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1E01C3B90](exception, "RawCameraException");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      uint64_t v27 = 0;
      std::string __p = 0;
      uint64_t v65 = 0;
      v66[0] = 0;
      while (v27 < objc_msgSend_count(v22, v23, v24, v25, v26, v54))
      {
        uint64_t v31 = objc_msgSend_objectAtIndexedSubscript_(v22, v28, v27, v29, v30);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v52 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x1E01C3B90](v52, "RawCameraException");
          __cxa_throw(v52, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        objc_msgSend_doubleValue(v31, v32, v33, v34, v35);
        unint64_t v37 = v36;
        uint64_t v38 = v65;
        if ((unint64_t)v65 >= v66[0])
        {
          uint64_t v40 = (char *)__p;
          __int16 v41 = (v65 - (unsigned char *)__p) >> 3;
          uint64_t v42 = v41 + 1;
          if ((unint64_t)(v41 + 1) >> 61) {
            sub_1DDA17F78();
          }
          uint64_t v43 = v66[0] - (void)__p;
          if ((uint64_t)(v66[0] - (void)__p) >> 2 > v42) {
            uint64_t v42 = v43 >> 2;
          }
          if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF8) {
            unsigned int v44 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unsigned int v44 = v42;
          }
          if (v44)
          {
            uint64_t v45 = (char *)sub_1DDA1814C((uint64_t)v66, v44);
            uint64_t v40 = (char *)__p;
            uint64_t v38 = v65;
          }
          else
          {
            uint64_t v45 = 0;
          }
          uint64_t v46 = &v45[8 * v41];
          *(void *)uint64_t v46 = v37;
          unint64_t v39 = v46 + 8;
          while (v38 != v40)
          {
            uint64_t v47 = *((void *)v38 - 1);
            v38 -= 8;
            *((void *)v46 - 1) = v47;
            v46 -= 8;
          }
          std::string __p = v46;
          uint64_t v65 = v39;
          v66[0] = &v45[8 * v44];
          if (v40) {
            operator delete(v40);
          }
        }
        else
        {
          *(void *)uint64_t v65 = v36;
          unint64_t v39 = v38 + 8;
        }
        uint64_t v65 = v39;

        ++v27;
      }
      sub_1DDA58F10((uint64_t *)&__p, v57);
      uint64_t v48 = (std::__shared_weak_count *)v57[0];
      double v5 = (std::__shared_weak_count *)v57[1];
      if (__p)
      {
        uint64_t v65 = (char *)__p;
        operator delete(__p);
      }

      uint64_t v21 = v54;
    }
    else
    {
      uint64_t v48 = 0;
    }
    if (v62) {
      sub_1DDA18310(v62);
    }

    if (!v21)
    {
      ((void (**)(void **__return_ptr))v16)[2](&__p);
      uint64_t v48 = (std::__shared_weak_count *)__p;
      double v5 = (std::__shared_weak_count *)v65;
    }
    std::string __p = &v60;
    uint64_t v49 = sub_1DDAB6C70(v12, (void **)&v60.__r_.__value_.__l.__data_, (uint64_t)&unk_1DDBFB044, (long long **)&__p);
    uint64_t v50 = v49 + 7;
    uint64_t v62 = v48;
    uint64_t v63 = v5;
    if (v5) {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v61 = sub_1DDBE1588;
    if (&v61 != v50)
    {
      uint64_t v51 = (uint64_t (*)(uint64_t, void *, void **, void, void))*v50;
      if (*v50)
      {
        std::string __p = 0;
        uint64_t v65 = 0;
        v51(2, v50, &__p, 0, 0);
        v61(2u, &v61, v50, 0, 0);
        ((void (*)(uint64_t, void **, void *(**)(unsigned int, void *, void *, uint64_t, void *), void, void))__p)(2, &__p, &v61, 0, 0);
        sub_1DDAB6E58((uint64_t (**)(void, void, void, void, void))&__p);
      }
      else
      {
        v49[8] = (uint64_t)v48;
        v49[9] = (uint64_t)v5;
        uint64_t v62 = 0;
        uint64_t v63 = 0;
        v49[7] = (uint64_t)sub_1DDBE1588;
        uint64_t v61 = 0;
      }
    }
    sub_1DDAB6E58((uint64_t (**)(void, void, void, void, void))&v61);
    *a5 = v48;
    a5[1] = v5;
    id v11 = v55;
    if (v5)
    {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
      sub_1DDA18310(v5);
    }
  }
  else
  {
    uint64_t v14 = (std::__shared_weak_count **)sub_1DDBE153C((uint64_t (**)(uint64_t, void, void, void *, void *))v13 + 7);
    if (!v14) {
      sub_1DDAB6C00();
    }
    uint64_t v15 = v14[1];
    *a5 = *v14;
    a5[1] = v15;
    if (v15) {
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    }
  }
  if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v60.__r_.__value_.__l.__data_);
  }
}

void sub_1DDBDD5E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,std::__shared_weak_count *a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31)
{
  __cxa_free_exception(v32);

  if (a27) {
    sub_1DDA18310(a27);
  }

  if (a25 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1DDBDD6D4(uint64_t a1@<X0>, double **a2@<X8>)
{
}

void sub_1DDBDD6DC(uint64_t a1@<X0>, void *a2@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v4 = v8;
  double v5 = off_1EAB8AD30[0];
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDD7F4;
  v7[3] = &unk_1E6D05198;
  v7[4] = a1;
  sub_1DDAB6440(v4, v5, v6, v7, a2);
  if (v9) {
    sub_1DDA18310(v9);
  }
}

void sub_1DDBDD7DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBDD7F4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
}

void sub_1DDBDD7FC(uint64_t a1@<X0>, void *a2@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v4 = v8;
  double v5 = off_1EAB8AD38[0];
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDD914;
  v7[3] = &unk_1E6D07228;
  v7[4] = a1;
  sub_1DDBD7274(v4, v5, v6, v7, a2);
  if (v9) {
    sub_1DDA18310(v9);
  }
}

void sub_1DDBDD8FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBDD914(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
}

void sub_1DDBDD91C(uint64_t a1@<X0>, void *a2@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v4 = v8;
  double v5 = off_1EAB8AD40[0];
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDDA34;
  v7[3] = &unk_1E6D05198;
  v7[4] = a1;
  sub_1DDAB6440(v4, v5, v6, v7, a2);
  if (v9) {
    sub_1DDA18310(v9);
  }
}

void sub_1DDBDDA1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBDDA34(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
}

double sub_1DDBDDA3C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AD48[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDDB5C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDDB44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDDB5C(uint64_t a1)
{
  return sub_1DDA33CAC(*(void *)(a1 + 32));
}

double sub_1DDBDDB64(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AD50[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDDC84;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDDC6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDDC84(uint64_t a1)
{
  return sub_1DDA33D34(*(void *)(a1 + 32));
}

double sub_1DDBDDC8C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AD58[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDDDAC;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDDD94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDDDAC(uint64_t a1)
{
  return sub_1DDA33DBC(*(void *)(a1 + 32));
}

double sub_1DDBDDDB4(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AD60[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDDED4;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDDEBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDDED4(uint64_t a1)
{
  return sub_1DDA33E44(*(void *)(a1 + 32));
}

double sub_1DDBDDEDC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AD68[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDDFFC;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDDFE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDDFFC(uint64_t a1)
{
  return sub_1DDA33ECC(*(void *)(a1 + 32));
}

double sub_1DDBDE004(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AD70[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDE124;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDE10C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDE124(uint64_t a1)
{
  return sub_1DDA33F54(*(void *)(a1 + 32));
}

BOOL sub_1DDBDE12C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AD78[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDE244;
  v7[3] = &unk_1E6D05250;
  v7[4] = a1;
  BOOL v5 = sub_1DDAC8A08(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDE22C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBDE244(uint64_t a1)
{
  return sub_1DDA33FDC(*(void *)(a1 + 32));
}

double sub_1DDBDE24C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AD80[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDE36C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDE354(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDE36C(uint64_t a1)
{
  return sub_1DDA3405C(*(void *)(a1 + 32));
}

double sub_1DDBDE374(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AD88[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDE494;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDE47C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDE494(uint64_t a1)
{
  return sub_1DDA340E4(*(void *)(a1 + 32));
}

double sub_1DDBDE49C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AD90[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDE5BC;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDE5A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDE5BC(uint64_t a1)
{
  return sub_1DDA3416C(*(void *)(a1 + 32));
}

double sub_1DDBDE5C4(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AD98[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDE6E4;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDE6CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBDE6E4(uint64_t a1)
{
}

void sub_1DDBDE6EC(uint64_t a1@<X0>, void *a2@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v4 = v8;
  double v5 = off_1EAB8ADA0[0];
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDE804;
  v7[3] = &unk_1E6D05198;
  v7[4] = a1;
  sub_1DDAB6440(v4, v5, v6, v7, a2);
  if (v9) {
    sub_1DDA18310(v9);
  }
}

void sub_1DDBDE7EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBDE804(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_1DDBDE80C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ADA8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDEC94;
  v7[3] = &unk_1E6D05178;
  v7[4] = a1;
  uint64_t v5 = sub_1DDBDE924(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDE90C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBDE924(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  sub_1DDAB6A18(v7, a3, &__p);
  id v9 = (uint64_t **)(a1 + 24);
  id v10 = sub_1DDA2A530(a1 + 24, (void **)&__p.__r_.__value_.__l.__data_);
  if ((void **)(a1 + 32) == v10)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1DDBE3A94;
    v29[3] = &unk_1E6D051C0;
    uint64_t v13 = (uint64_t (**)(void))v8;
    id v30 = v13;
    sub_1DDB657E4(a1, v7, v29, &p_p);
    uint64_t v18 = (long long *)p_p;
    if (p_p)
    {
      uint64_t v19 = sub_1DDB67AB8((uint64_t)p_p, v14, v15, v16, v17);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1E01C3B90](exception, "RawCameraException");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      uint64_t v12 = objc_msgSend_longLongValue(v19, v20, v21, v22, v23);
    }
    else
    {
      uint64_t v12 = 0;
    }
    if (v34) {
      sub_1DDA18310(v34);
    }

    if (!v18) {
      uint64_t v12 = v13[2](v13);
    }
    p_p = &__p;
    uint64_t v24 = sub_1DDAB6C70(v9, (void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&unk_1DDBFB044, (long long **)&p_p);
    uint64_t v25 = (void (**)(uint64_t, void, std::string **, void, void))(v24 + 7);
    v32[1] = (uint64_t (*)(void, void, void, void, void))v12;
    v32[0] = (uint64_t (*)(void, void, void, void, void))sub_1DDBE3B2C;
    if (v32 != (uint64_t (**)(void, void, void, void, void))(v24 + 7))
    {
      uint64_t v26 = *v25;
      if (*v25)
      {
        p_p = 0;
        uint64_t v34 = 0;
        v26(2, v25, &p_p, 0, 0);
        v32[0](2, v32, v25, 0, 0);
        ((void (*)(uint64_t, std::string **, uint64_t (**)(void, void, void, void, void), void, void))p_p)(2, &p_p, v32, 0, 0);
        sub_1DDAB6E58((uint64_t (**)(void, void, void, void, void))&p_p);
      }
      else
      {
        *((_DWORD *)v24 + 16) = v12;
        v24[7] = (uint64_t)sub_1DDBE3B2C;
        v32[0] = 0;
      }
    }
    sub_1DDAB6E58(v32);
  }
  else
  {
    id v11 = (unsigned int *)sub_1DDBE3AE0((uint64_t (**)(uint64_t, void, void, void *, void *))v10 + 7);
    if (!v11) {
      sub_1DDAB6C00();
    }
    uint64_t v12 = *v11;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  return v12;
}

void sub_1DDBDEC04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,std::__shared_weak_count *a26)
{
  __cxa_free_exception(v28);

  if (a26) {
    sub_1DDA18310(a26);
  }

  if (a20 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_1DDBDEC94(uint64_t a1)
{
  return sub_1DDA343BC(*(void *)(a1 + 32));
}

double sub_1DDBDEC9C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ADB0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDEDBC;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDEDA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDEDBC(uint64_t a1)
{
  return sub_1DDA3443C(*(void *)(a1 + 32));
}

double sub_1DDBDEDC4(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ADB8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDEEE4;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDEECC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDEEE4(uint64_t a1)
{
  return sub_1DDA344C4(*(void *)(a1 + 32));
}

double sub_1DDBDEEEC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ADC0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDF00C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDEFF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDF00C(uint64_t a1)
{
  return sub_1DDA3454C(*(void *)(a1 + 32));
}

uint64_t sub_1DDBDF014(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ADC8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDF12C;
  v7[3] = &unk_1E6D05178;
  v7[4] = a1;
  uint64_t v5 = sub_1DDBDE924(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDF114(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBDF12C(uint64_t a1)
{
  return sub_1DDA345D4(*(void *)(a1 + 32));
}

double sub_1DDBDF134(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ADD0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDF254;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDF23C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDF254(uint64_t a1)
{
  return sub_1DDA34654(*(void *)(a1 + 32));
}

double sub_1DDBDF25C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ADD8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDF37C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDF364(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDF37C(uint64_t a1)
{
  return sub_1DDA346DC(*(void *)(a1 + 32));
}

double sub_1DDBDF384(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ADE0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDF4A4;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDF48C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDF4A4(uint64_t a1)
{
  return sub_1DDA34764(*(void *)(a1 + 32));
}

uint64_t sub_1DDBDF4AC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ADE8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDF5C4;
  v7[3] = &unk_1E6D05458;
  v7[4] = a1;
  uint64_t v5 = sub_1DDACFD70(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDF5AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBDF5C4(uint64_t a1)
{
  return sub_1DDA347EC(*(void *)(a1 + 32));
}

uint64_t sub_1DDBDF5CC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ADF0[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDF6E4;
  v7[3] = &unk_1E6D05178;
  v7[4] = a1;
  uint64_t v5 = sub_1DDBDE924(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDF6CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBDF6E4(uint64_t a1)
{
  return sub_1DDA3486C(*(void *)(a1 + 32));
}

double sub_1DDBDF6EC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8ADF8[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDF80C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDF7F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDF80C(uint64_t a1)
{
  return sub_1DDA348EC(*(void *)(a1 + 32));
}

double sub_1DDBDF814(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AE00[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDF934;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDF91C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDF934(uint64_t a1)
{
  return sub_1DDA34974(*(void *)(a1 + 32));
}

double sub_1DDBDF93C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AE08[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDFA5C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDFA44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDFA5C(uint64_t a1)
{
  return sub_1DDA349FC(*(void *)(a1 + 32));
}

double sub_1DDBDFA64(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AE10[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDFB84;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDFB6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDFB84(uint64_t a1)
{
  return sub_1DDA34A84(*(void *)(a1 + 32));
}

uint64_t sub_1DDBDFB8C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AE18[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDFCA4;
  v7[3] = &unk_1E6D05178;
  v7[4] = a1;
  uint64_t v5 = sub_1DDBDE924(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDFC8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBDFCA4(uint64_t a1)
{
  return sub_1DDA34B0C(*(void *)(a1 + 32));
}

double sub_1DDBDFCAC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AE20[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDFDCC;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDFDB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDFDCC(uint64_t a1)
{
  return sub_1DDA34B8C(*(void *)(a1 + 32));
}

double sub_1DDBDFDD4(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AE28[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBDFEF4;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBDFEDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBDFEF4(uint64_t a1)
{
  return sub_1DDA34C14(*(void *)(a1 + 32));
}

double sub_1DDBDFEFC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AE30[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBE001C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBE0004(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBE001C(uint64_t a1)
{
  return sub_1DDA34C9C(*(void *)(a1 + 32));
}

uint64_t sub_1DDBE0024(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AE38[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBE013C;
  v7[3] = &unk_1E6D05178;
  v7[4] = a1;
  uint64_t v5 = sub_1DDBDE924(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBE0124(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBE013C(uint64_t a1)
{
  return sub_1DDA34D24(*(void *)(a1 + 32));
}

double sub_1DDBE0144(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AE40[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBE0264;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBE024C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBE0264(uint64_t a1)
{
  return sub_1DDA34DA4(*(void *)(a1 + 32));
}

double sub_1DDBE026C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AE48[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBE038C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBE0374(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBE038C(uint64_t a1)
{
  return sub_1DDA34E2C(*(void *)(a1 + 32));
}

double sub_1DDBE0394(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AE50[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBE04B4;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBE049C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBE04B4(uint64_t a1)
{
  return sub_1DDA34EB4(*(void *)(a1 + 32));
}

uint64_t sub_1DDBE04BC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AE58[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBE05D4;
  v7[3] = &unk_1E6D05178;
  v7[4] = a1;
  uint64_t v5 = sub_1DDBDE924(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBE05BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBE05D4(uint64_t a1)
{
  return sub_1DDA34F3C(*(void *)(a1 + 32));
}

double sub_1DDBE05DC(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AE60[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBE06FC;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBE06E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBE06FC(uint64_t a1)
{
  return sub_1DDA34FBC(*(void *)(a1 + 32));
}

double sub_1DDBE0704(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AE68[0];
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBE0824;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBE080C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBE0824(uint64_t a1)
{
  return sub_1DDA35044(*(void *)(a1 + 32));
}

double sub_1DDBE082C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 72))(&v8);
  uint64_t v2 = v8;
  int v3 = off_1EAB8AE70;
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DDBE094C;
  v7[3] = &unk_1E6D05380;
  v7[4] = a1;
  double v5 = sub_1DDAEE388(v2, v3, v4, v7);
  if (v9) {
    sub_1DDA18310(v9);
  }
  return v5;
}

void sub_1DDBE0934(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBE094C(uint64_t a1)
{
  return sub_1DDA350CC(*(void *)(a1 + 32));
}

void *sub_1DDBE0954@<X0>(uint64_t **a1@<X0>, void *a2@<X8>)
{
  int v4 = a1 + 47;
  int v5 = ((uint64_t (*)(uint64_t **))(*a1)[15])(a1);
  int v6 = a1[48];
  if (!v6) {
    goto LABEL_11;
  }
  id v7 = a1 + 48;
  do
  {
    int v8 = *((_DWORD *)v6 + 8);
    BOOL v9 = v8 < v5;
    if (v8 >= v5) {
      id v10 = (uint64_t **)v6;
    }
    else {
      id v10 = (uint64_t **)(v6 + 1);
    }
    if (!v9) {
      id v7 = (uint64_t **)v6;
    }
    int v6 = *v10;
  }
  while (*v10);
  if (v7 == a1 + 48 || v5 < *((_DWORD *)v7 + 8))
  {
LABEL_11:
    ((void (*)(double **__return_ptr, uint64_t **))(*a1)[230])(&v60, a1);
    id v11 = v60;
    unint64_t v12 = (char *)v61 - (char *)v60;
    if ((unint64_t)((char *)v61 - (char *)v60) >= 0x11 && (v61 - v60) % 3uLL == 0)
    {
      uint64_t v38 = (char *)operator new(0x38uLL);
      *((void *)v38 + 1) = 0;
      *((void *)v38 + 2) = 0;
      *(void *)uint64_t v38 = &unk_1F395AA20;
      *((void *)v38 + 6) = 0;
      *((void *)v38 + 5) = 0;
      *((void *)v38 + 3) = &unk_1F395AA70;
      *((void *)v38 + 4) = v38 + 40;
      if (v12 >= 0x18)
      {
        unsigned int v39 = 2;
        unsigned int v40 = 1;
        do
        {
          (*(void (**)(char *, void, double, double))(*((void *)v38 + 3) + 24))(v38 + 24, v11[v39 - 2], v11[v39 - 1], v11[v39]);
          unint64_t v41 = v40;
          id v11 = v60;
          v39 += 3;
          ++v40;
        }
        while (v41 < (v61 - v60) / 3uLL);
      }
      uint64_t v58 = (uint64_t *)(v38 + 24);
      uint64_t v59 = (std::__shared_weak_count *)v38;
      atomic_fetch_add_explicit((atomic_ullong *volatile)v38 + 1, 1uLL, memory_order_relaxed);
      LODWORD(v56) = ((uint64_t (*)(uint64_t **))(*a1)[15])(a1);
      sub_1DDBD571C(v4, &v56, &v58);
      if (v59) {
        sub_1DDA18310(v59);
      }
      uint64_t v42 = (std::__shared_weak_count *)v38;
LABEL_34:
      sub_1DDA18310(v42);
LABEL_35:
      if (v60)
      {
        uint64_t v61 = v60;
        operator delete(v60);
      }
      goto LABEL_37;
    }
    int v14 = ((uint64_t (*)(uint64_t **))(*a1)[231])(a1);
    double v15 = ((double (*)(uint64_t **))(*a1)[232])(a1);
    double v16 = ((double (*)(uint64_t **))(*a1)[233])(a1);
    double v17 = ((double (*)(uint64_t **))(*a1)[234])(a1);
    int v18 = ((uint64_t (*)(uint64_t **))(*a1)[235])(a1);
    double v19 = ((double (*)(uint64_t **))(*a1)[236])(a1);
    double v20 = ((double (*)(uint64_t **))(*a1)[237])(a1);
    double v21 = ((double (*)(uint64_t **))(*a1)[238])(a1);
    int v22 = ((uint64_t (*)(uint64_t **))(*a1)[239])(a1);
    int v23 = ((uint64_t (*)(uint64_t **))(*a1)[240])(a1);
    if (v23)
    {
      double v24 = ((double (*)(uint64_t **))(*a1)[241])(a1);
      double v25 = ((double (*)(uint64_t **))(*a1)[242])(a1);
      uint64_t v54 = ((double (*)(uint64_t **))(*a1)[243])(a1);
      uint64_t v53 = ((double (*)(uint64_t **))(*a1)[244])(a1);
      int v26 = ((uint64_t (*)(uint64_t **))(*a1)[245])(a1);
      uint64_t v52 = ((double (*)(uint64_t **))(*a1)[246])(a1);
      uint64_t v51 = ((double (*)(uint64_t **))(*a1)[247])(a1);
      uint64_t v50 = ((double (*)(uint64_t **))(*a1)[248])(a1);
      int v27 = ((uint64_t (*)(uint64_t **))(*a1)[249])(a1);
      uint64_t v49 = ((double (*)(uint64_t **))(*a1)[250])(a1);
      double v48 = v25;
      uint64_t v47 = ((double (*)(uint64_t **))(*a1)[251])(a1);
      uint64_t v28 = ((double (*)(uint64_t **))(*a1)[252])(a1);
      double v45 = v24;
      double v46 = v21;
      int v29 = ((uint64_t (*)(uint64_t **))(*a1)[253])(a1);
      double v30 = v20;
      double v31 = v19;
      double v32 = v17;
      double v33 = v16;
      double v34 = v15;
      uint64_t v35 = ((double (*)(uint64_t **))(*a1)[254])(a1);
      uint64_t v36 = ((double (*)(uint64_t **))(*a1)[255])(a1);
      *(double *)&uint64_t v37 = ((double (*)(uint64_t **))(*a1)[256])(a1);
      sub_1DDA2439C(v14, v18, v22, v23, v26, v27, v29, &v58, v34, v33, v32, v31, v30, v46, v45, v48, v54, v53, v52,
        v51,
        v50,
        v49,
        v47,
        v28,
        v35,
        v36,
        v37);
      if (v58)
      {
        uint64_t v56 = v58;
        uint64_t v57 = v59;
        if (v59) {
LABEL_27:
        }
          atomic_fetch_add_explicit(&v59->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      else
      {
        uint64_t v56 = 0;
        uint64_t v57 = 0;
      }
    }
    else
    {
      sub_1DDBE13D8(v14, v18, v22, &v58, v15, v16, v17, v19, v20, v21);
      if (v58)
      {
        uint64_t v56 = v58;
        uint64_t v57 = v59;
        if (!v59) {
          goto LABEL_31;
        }
        goto LABEL_27;
      }
      uint64_t v56 = 0;
      uint64_t v57 = 0;
    }
LABEL_31:
    int v55 = ((uint64_t (*)(uint64_t **))(*a1)[15])(a1);
    sub_1DDBD571C(v4, &v55, &v56);
    if (v57) {
      sub_1DDA18310(v57);
    }
    uint64_t v42 = v59;
    if (!v59) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_37:
  LODWORD(v60) = ((uint64_t (*)(uint64_t **))(*a1)[15])(a1);
  uint64_t result = (void *)sub_1DDBD5784((uint64_t)v4, (int *)&v60);
  uint64_t v44 = result[1];
  *a2 = *result;
  a2[1] = v44;
  if (v44) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v44 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1DDBE1308(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  uint64_t v36 = *(void **)(v34 - 176);
  if (v36)
  {
    *(void *)(v34 - 168) = v36;
    operator delete(v36);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1DDBE13D8@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, void *a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>, double a9@<D4>, double a10@<D5>)
{
  int v19 = a1;
  double v17 = a6;
  double v18 = a5;
  double v16 = a7;
  int v15 = a2;
  double v13 = a9;
  double v14 = a8;
  double v12 = a10;
  int v11 = a3;
  return sub_1DDBE1688(&v19, &v18, &v17, &v16, &v15, &v14, &v13, a4, &v12, &v11);
}

id sub_1DDBE1440(uint64_t a1)
{
  (*(void (**)(uint64_t **__return_ptr))(*(void *)(a1 + 32) + 16))(&v3);
  uint64_t v1 = sub_1DDBE14C0(v3);
  if (v4) {
    sub_1DDA18310(v4);
  }

  return v1;
}

void sub_1DDBE14A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1DDA18310(a10);
  }
  _Unwind_Resume(exception_object);
}

id sub_1DDBE14C0(uint64_t *a1)
{
  sub_1DDA5901C(a1, __p);
  uint64_t v1 = sub_1DDAB7258((double **)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v1;
}

void sub_1DDBE1520(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t (**sub_1DDBE153C(uint64_t (**result)(uint64_t, void, void, void *, void *)))(uint64_t, void, void, void *, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void *, void *))(*result)(3, result, 0, &unk_1F398D240, &unk_1DDC0CAAC);
    }
    else {
      return 0;
    }
  }
  return result;
}

void *sub_1DDBE1588(unsigned int a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1;
  uint64_t result = &unk_1F398D240;
  switch(v5)
  {
    case 1:
      uint64_t v9 = a2[2];
      a3[1] = a2[1];
      a3[2] = v9;
      if (v9) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
      }
      uint64_t result = 0;
      *a3 = sub_1DDBE1588;
      break;
    case 2:
      uint64_t result = 0;
      *(_OWORD *)(a3 + 1) = *(_OWORD *)(a2 + 1);
      a2[1] = 0;
      a2[2] = 0;
      *a3 = sub_1DDBE1588;
      goto LABEL_9;
    case 3:
      if (a4) {
        BOOL v10 = sub_1DDAB6F70(a4, (uint64_t)&unk_1F398D240);
      }
      else {
        BOOL v10 = a5 == &unk_1DDC0CAAC;
      }
      if (v10) {
        uint64_t result = a2 + 1;
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 4:
      return result;
    default:
      int v8 = (std::__shared_weak_count *)a2[2];
      if (v8) {
        sub_1DDA18310(v8);
      }
      uint64_t result = 0;
LABEL_9:
      *a2 = 0;
      break;
  }
  return result;
}

void *sub_1DDBE1688@<X0>(int *a1@<X1>, double *a2@<X2>, double *a3@<X3>, double *a4@<X4>, int *a5@<X5>, double *a6@<X6>, double *a7@<X7>, void *a8@<X8>, double *a9, int *a10)
{
  double v17 = operator new(0x68uLL);
  uint64_t result = sub_1DDBE173C(v17, a1, a2, a3, a4, a5, a6, a7, a9, a10);
  *a8 = v17 + 3;
  a8[1] = v17;
  return result;
}

void sub_1DDBE1728(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_1DDBE173C(void *a1, int *a2, double *a3, double *a4, double *a5, int *a6, double *a7, double *a8, double *a9, int *a10)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_1F395ABB8;
  sub_1DDA25304((uint64_t)(a1 + 3), *a2, *a6, *a10, *a3, *a4, *a5, *a7, *a8, *a9);
  return a1;
}

void sub_1DDBE17AC(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

id sub_1DDBE17C0(unsigned int *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  int v6 = objc_msgSend_numberWithInt_(NSNumber, a2, *a1, a4, a5);
  v15[0] = v6;
  BOOL v10 = objc_msgSend_numberWithInt_(NSNumber, v7, a1[1], v8, v9);
  v15[1] = v10;
  double v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v11, (uint64_t)v15, 2, v12);

  return v13;
}

void sub_1DDBE1888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1DDBE18AC(uint64_t a1)
{
  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v5 = sub_1DDBE17C0((unsigned int *)&v7, v1, v2, v3, v4);

  return v5;
}

uint64_t (**sub_1DDBE18F8(uint64_t (**result)(uint64_t, void, void, void *, void *)))(uint64_t, void, void, void *, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void *, void *))(*result)(3, result, 0, &unk_1F398D250, &unk_1DDC0CB40);
    }
    else {
      return 0;
    }
  }
  return result;
}

void *sub_1DDBE1944(unsigned int a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1;
  uint64_t result = &unk_1F398D250;
  switch(v5)
  {
    case 1:
      uint64_t result = 0;
      uint64_t v8 = a2[1];
      *a3 = sub_1DDBE1944;
      a3[1] = v8;
      break;
    case 2:
      uint64_t result = 0;
      uint64_t v9 = a2[1];
      *a3 = sub_1DDBE1944;
      a3[1] = v9;
      goto LABEL_5;
    case 3:
      if (a4) {
        BOOL v10 = sub_1DDAB6F70(a4, (uint64_t)&unk_1F398D250);
      }
      else {
        BOOL v10 = a5 == &unk_1DDC0CB40;
      }
      if (v10) {
        uint64_t result = a2 + 1;
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 4:
      return result;
    default:
      uint64_t result = 0;
LABEL_5:
      *a2 = 0;
      break;
  }
  return result;
}

uint64_t sub_1DDBE1A1C(uint64_t a1)
{
  uint64_t v1 = NSNumber;
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return objc_msgSend_numberWithUnsignedInt_(v1, v2, v3, v4, v5);
}

uint64_t (**sub_1DDBE1A68(uint64_t (**result)(uint64_t, void, void, void, void *)))(uint64_t, void, void, void, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void, void *))(*result)(3, result, 0, MEMORY[0x1E4FBA3B0], &unk_1DDC0CB44);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1DDBE1AB4(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1;
  uint64_t result = MEMORY[0x1E4FBA3B0];
  switch(v5)
  {
    case 1:
      uint64_t result = 0;
      *(_DWORD *)(a3 + 8) = *(_DWORD *)(a2 + 8);
      *(void *)a3 = sub_1DDBE1AB4;
      break;
    case 2:
      uint64_t result = 0;
      *(_DWORD *)(a3 + 8) = *(_DWORD *)(a2 + 8);
      *(void *)a3 = sub_1DDBE1AB4;
      goto LABEL_5;
    case 3:
      if (a4) {
        BOOL v8 = sub_1DDAB6F70(a4, MEMORY[0x1E4FBA3B0]);
      }
      else {
        BOOL v8 = a5 == &unk_1DDC0CB44;
      }
      if (v8) {
        uint64_t result = a2 + 8;
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 4:
      return result;
    default:
      uint64_t result = 0;
LABEL_5:
      *(void *)a2 = 0;
      break;
  }
  return result;
}

uint64_t sub_1DDBE1B94(uint64_t a1)
{
  uint64_t v1 = NSNumber;
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return MEMORY[0x1F4181798](v1, sel_numberWithLong_, v2, v3, v4);
}

uint64_t (**sub_1DDBE1BE0(uint64_t (**result)(uint64_t, void, void, void, void *)))(uint64_t, void, void, void, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void, void *))(*result)(3, result, 0, MEMORY[0x1E4FBA3B8], &unk_1DDC0CB48);
    }
    else {
      return 0;
    }
  }
  return result;
}

void *sub_1DDBE1C2C(unsigned int a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1;
  uint64_t result = (void *)MEMORY[0x1E4FBA3B8];
  switch(v5)
  {
    case 1:
      uint64_t result = 0;
      uint64_t v8 = a2[1];
      *a3 = sub_1DDBE1C2C;
      a3[1] = v8;
      break;
    case 2:
      uint64_t result = 0;
      uint64_t v9 = a2[1];
      *a3 = sub_1DDBE1C2C;
      a3[1] = v9;
      goto LABEL_5;
    case 3:
      if (a4) {
        BOOL v10 = sub_1DDAB6F70(a4, MEMORY[0x1E4FBA3B8]);
      }
      else {
        BOOL v10 = a5 == &unk_1DDC0CB48;
      }
      if (v10) {
        uint64_t result = a2 + 1;
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 4:
      return result;
    default:
      uint64_t result = 0;
LABEL_5:
      *a2 = 0;
      break;
  }
  return result;
}

id sub_1DDBE1D04(uint64_t a1)
{
  (*(void (**)(void **__return_ptr))(*(void *)(a1 + 32) + 16))(__p);
  uint64_t v1 = sub_1DDBE1F24((unsigned int **)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v1;
}

void sub_1DDBE1D70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBE1D8C(uint64_t a1, uint64_t a2)
{
  v6[4] = *(uint64_t (**)(void, void, void, void, void))MEMORY[0x1E4F143B8];
  memset(v5, 0, sizeof(v5));
  sub_1DDA1D984((void *)v5 + 1, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2);
  *(void *)&v5[0] = sub_1DDBE1FFC;
  if (v5 != (_OWORD *)a1)
  {
    uint64_t v3 = *(void (**)(void, void, void, void, void))a1;
    if (*(void *)a1)
    {
      v6[0] = 0;
      v6[1] = 0;
      v3(2, a1, v6, 0, 0);
      (*(void (**)(uint64_t, _OWORD *, uint64_t, void, void))&v5[0])(2, v5, a1, 0, 0);
      ((uint64_t (**)(uint64_t, void, _OWORD *, void, void))v6)[0](2, v6, v5, 0, 0);
      sub_1DDAB6E58(v6);
    }
    else
    {
      *(_OWORD *)(a1 + 8) = *(_OWORD *)((char *)v5 + 8);
      *(void *)(a1 + 24) = *((void *)&v5[1] + 1);
      memset((char *)v5 + 8, 0, 24);
      *(void *)a1 = sub_1DDBE1FFC;
      *(void *)&v5[0] = 0;
    }
  }
  sub_1DDAB6E58((uint64_t (**)(void, void, void, void, void))v5);
  return a1;
}

void sub_1DDBE1ECC(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_1DDA16678(a1);
}

uint64_t (**sub_1DDBE1ED8(uint64_t (**result)(uint64_t, void, void, void *, void *)))(uint64_t, void, void, void *, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void *, void *))(*result)(3, result, 0, &unk_1F398D260, &unk_1DDC0CB70);
    }
    else {
      return 0;
    }
  }
  return result;
}

id sub_1DDBE1F24(unsigned int **a1)
{
  uint64_t v5 = sub_1DDA49F48(a1[1] - *a1);
  int v6 = *a1;
  uint64_t v7 = a1[1];
  if (*a1 != v7)
  {
    do
    {
      uint64_t v8 = objc_msgSend_numberWithInt_(NSNumber, v2, *v6, v3, v4);
      objc_msgSend_addObject_(v5, v9, (uint64_t)v8, v10, v11);

      ++v6;
    }
    while (v6 != v7);
  }
  uint64_t v12 = objc_msgSend_arrayWithArray_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, v3, v4);

  return v12;
}

void sub_1DDBE1FDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1DDBE1FFC(unsigned int a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1;
  uint64_t result = &unk_1F398D260;
  switch(v5)
  {
    case 1:
      a3[2] = 0;
      a3[3] = 0;
      a3[1] = 0;
      sub_1DDA1D984(a3 + 1, *(const void **)(a2 + 8), *(void *)(a2 + 16), (uint64_t)(*(void *)(a2 + 16) - *(void *)(a2 + 8)) >> 2);
      uint64_t result = 0;
      *a3 = sub_1DDBE1FFC;
      break;
    case 2:
      uint64_t result = 0;
      a3[1] = 0;
      a3[2] = 0;
      a3[3] = 0;
      *(_OWORD *)(a3 + 1) = *(_OWORD *)(a2 + 8);
      a3[3] = *(void *)(a2 + 24);
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)(a2 + 24) = 0;
      *a3 = sub_1DDBE1FFC;
      goto LABEL_7;
    case 3:
      if (a4) {
        BOOL v10 = sub_1DDAB6F70(a4, (uint64_t)&unk_1F398D260);
      }
      else {
        BOOL v10 = a5 == &unk_1DDC0CB70;
      }
      if (v10) {
        uint64_t result = (void *)(a2 + 8);
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 4:
      return result;
    default:
      uint64_t v9 = *(void **)(a2 + 8);
      if (v9)
      {
        *(void *)(a2 + 16) = v9;
        operator delete(v9);
      }
      uint64_t result = 0;
LABEL_7:
      *(void *)a2 = 0;
      break;
  }
  return result;
}

id sub_1DDBE211C(uint64_t a1)
{
  v7[0] = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  v7[1] = v1;
  uint64_t v5 = sub_1DDAD06E0((unsigned int *)v7, v1, v2, v3, v4);

  return v5;
}

uint64_t (**sub_1DDBE2168(uint64_t (**result)(uint64_t, void, void, void *, void *)))(uint64_t, void, void, void *, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void *, void *))(*result)(3, result, 0, &unk_1F398D270, &unk_1DDC0CB84);
    }
    else {
      return 0;
    }
  }
  return result;
}

void *sub_1DDBE21B4(unsigned int a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1;
  uint64_t result = &unk_1F398D270;
  switch(v5)
  {
    case 1:
      uint64_t result = 0;
      *(_OWORD *)(a3 + 8) = *(_OWORD *)(a2 + 1);
      *(void *)a3 = sub_1DDBE21B4;
      break;
    case 2:
      uint64_t result = 0;
      *(_OWORD *)(a3 + 8) = *(_OWORD *)(a2 + 1);
      *(void *)a3 = sub_1DDBE21B4;
      goto LABEL_5;
    case 3:
      if (a4) {
        BOOL v8 = sub_1DDAB6F70(a4, (uint64_t)&unk_1F398D270);
      }
      else {
        BOOL v8 = a5 == &unk_1DDC0CB84;
      }
      if (v8) {
        uint64_t result = a2 + 1;
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 4:
      return result;
    default:
      uint64_t result = 0;
LABEL_5:
      *a2 = 0;
      break;
  }
  return result;
}

id sub_1DDBE2294(uint64_t a1)
{
  (*(void (**)(void **__return_ptr))(*(void *)(a1 + 32) + 16))(__p);
  uint64_t v1 = sub_1DDBE24B4((unsigned int **)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v1;
}

void sub_1DDBE2300(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBE231C(uint64_t a1, uint64_t a2)
{
  v6[4] = *(uint64_t (**)(void, void, void, void, void))MEMORY[0x1E4F143B8];
  memset(v5, 0, sizeof(v5));
  sub_1DDA1D984((void *)v5 + 1, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2);
  *(void *)&v5[0] = sub_1DDBE258C;
  if (v5 != (_OWORD *)a1)
  {
    uint64_t v3 = *(void (**)(void, void, void, void, void))a1;
    if (*(void *)a1)
    {
      v6[0] = 0;
      v6[1] = 0;
      v3(2, a1, v6, 0, 0);
      (*(void (**)(uint64_t, _OWORD *, uint64_t, void, void))&v5[0])(2, v5, a1, 0, 0);
      ((uint64_t (**)(uint64_t, void, _OWORD *, void, void))v6)[0](2, v6, v5, 0, 0);
      sub_1DDAB6E58(v6);
    }
    else
    {
      *(_OWORD *)(a1 + 8) = *(_OWORD *)((char *)v5 + 8);
      *(void *)(a1 + 24) = *((void *)&v5[1] + 1);
      memset((char *)v5 + 8, 0, 24);
      *(void *)a1 = sub_1DDBE258C;
      *(void *)&v5[0] = 0;
    }
  }
  sub_1DDAB6E58((uint64_t (**)(void, void, void, void, void))v5);
  return a1;
}

void sub_1DDBE245C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_1DDA16678(a1);
}

uint64_t (**sub_1DDBE2468(uint64_t (**result)(uint64_t, void, void, void *, void *)))(uint64_t, void, void, void *, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void *, void *))(*result)(3, result, 0, &unk_1F398D280, &unk_1DDC0CBAC);
    }
    else {
      return 0;
    }
  }
  return result;
}

id sub_1DDBE24B4(unsigned int **a1)
{
  uint64_t v5 = sub_1DDA49F48(a1[1] - *a1);
  int v6 = *a1;
  uint64_t v7 = a1[1];
  if (*a1 != v7)
  {
    do
    {
      BOOL v8 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v2, *v6, v3, v4);
      objc_msgSend_addObject_(v5, v9, (uint64_t)v8, v10, v11);

      ++v6;
    }
    while (v6 != v7);
  }
  uint64_t v12 = objc_msgSend_arrayWithArray_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, v3, v4);

  return v12;
}

void sub_1DDBE256C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1DDBE258C(unsigned int a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1;
  uint64_t result = &unk_1F398D280;
  switch(v5)
  {
    case 1:
      a3[2] = 0;
      a3[3] = 0;
      a3[1] = 0;
      sub_1DDA1D984(a3 + 1, *(const void **)(a2 + 8), *(void *)(a2 + 16), (uint64_t)(*(void *)(a2 + 16) - *(void *)(a2 + 8)) >> 2);
      uint64_t result = 0;
      *a3 = sub_1DDBE258C;
      break;
    case 2:
      uint64_t result = 0;
      a3[1] = 0;
      a3[2] = 0;
      a3[3] = 0;
      *(_OWORD *)(a3 + 1) = *(_OWORD *)(a2 + 8);
      a3[3] = *(void *)(a2 + 24);
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)(a2 + 24) = 0;
      *a3 = sub_1DDBE258C;
      goto LABEL_7;
    case 3:
      if (a4) {
        BOOL v10 = sub_1DDAB6F70(a4, (uint64_t)&unk_1F398D280);
      }
      else {
        BOOL v10 = a5 == &unk_1DDC0CBAC;
      }
      if (v10) {
        uint64_t result = (void *)(a2 + 8);
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 4:
      return result;
    default:
      uint64_t v9 = *(void **)(a2 + 8);
      if (v9)
      {
        *(void *)(a2 + 16) = v9;
        operator delete(v9);
      }
      uint64_t result = 0;
LABEL_7:
      *(void *)a2 = 0;
      break;
  }
  return result;
}

uint64_t sub_1DDBE26AC(uint64_t a1)
{
  uint64_t v1 = NSNumber;
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return objc_msgSend_numberWithUnsignedInt_(v1, v2, v3, v4, v5);
}

uint64_t (**sub_1DDBE26F8(uint64_t (**result)(uint64_t, void, void, void *, void *)))(uint64_t, void, void, void *, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void *, void *))(*result)(3, result, 0, &unk_1F398D290, &unk_1DDC0CBC8);
    }
    else {
      return 0;
    }
  }
  return result;
}

void *sub_1DDBE2744(unsigned int a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1;
  uint64_t result = &unk_1F398D290;
  switch(v5)
  {
    case 1:
      uint64_t result = 0;
      *(_DWORD *)(a3 + 8) = *((_DWORD *)a2 + 2);
      *(void *)a3 = sub_1DDBE2744;
      break;
    case 2:
      uint64_t result = 0;
      *(_DWORD *)(a3 + 8) = *((_DWORD *)a2 + 2);
      *(void *)a3 = sub_1DDBE2744;
      goto LABEL_5;
    case 3:
      if (a4) {
        BOOL v8 = sub_1DDAB6F70(a4, (uint64_t)&unk_1F398D290);
      }
      else {
        BOOL v8 = a5 == &unk_1DDC0CBC8;
      }
      if (v8) {
        uint64_t result = a2 + 1;
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 4:
      return result;
    default:
      uint64_t result = 0;
LABEL_5:
      *a2 = 0;
      break;
  }
  return result;
}

id sub_1DDBE2824(uint64_t a1)
{
  (*(void (**)(void **__return_ptr))(*(void *)(a1 + 32) + 16))(__p);
  uint64_t v5 = sub_1DDA1E51C((uint64_t)__p, v1, v2, v3, v4);
  if (v8 < 0) {
    operator delete(__p[0]);
  }

  return v5;
}

void sub_1DDBE2890(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t (**sub_1DDBE28AC(uint64_t (**result)(uint64_t, void, void, void *, void *)))(uint64_t, void, void, void *, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void *, void *))(*result)(3, result, 0, &unk_1F398D2A0, &unk_1DDC0CC0C);
    }
    else {
      return 0;
    }
  }
  return result;
}

void *sub_1DDBE28F8(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1;
  uint64_t result = &unk_1F398D2A0;
  switch(v5)
  {
    case 1:
      BOOL v10 = (unsigned char *)(a3 + 8);
      if (*(char *)(a2 + 31) < 0)
      {
        sub_1DDA2639C(v10, *(void **)(a2 + 8), *(void *)(a2 + 16));
      }
      else
      {
        long long v11 = *(_OWORD *)(a2 + 8);
        *(void *)(a3 + 24) = *(void *)(a2 + 24);
        *(_OWORD *)BOOL v10 = v11;
      }
      uint64_t result = 0;
      *(void *)a3 = sub_1DDBE28F8;
      break;
    case 2:
      long long v12 = *(_OWORD *)(a2 + 8);
      *(void *)(a3 + 24) = *(void *)(a2 + 24);
      *(_OWORD *)(a3 + 8) = v12;
      *(void *)(a2 + 16) = 0;
      *(void *)(a2 + 24) = 0;
      *(void *)(a2 + 8) = 0;
      *(void *)a3 = sub_1DDBE28F8;
      if ((*(char *)(a2 + 31) & 0x80000000) == 0) {
        goto LABEL_9;
      }
      uint64_t v9 = *(void **)(a2 + 8);
      goto LABEL_8;
    case 3:
      if (a4) {
        BOOL v13 = sub_1DDAB6F70(a4, (uint64_t)&unk_1F398D2A0);
      }
      else {
        BOOL v13 = a5 == &unk_1DDC0CC0C;
      }
      if (v13) {
        uint64_t result = (void *)(a2 + 8);
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 4:
      return result;
    default:
      if (*(char *)(a2 + 31) < 0)
      {
        uint64_t v9 = *(void **)(a2 + 8);
LABEL_8:
        operator delete(v9);
      }
LABEL_9:
      uint64_t result = 0;
      *(void *)a2 = 0;
      break;
  }
  return result;
}

uint64_t sub_1DDBE2A2C(uint64_t a1)
{
  uint64_t v1 = NSNumber;
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return objc_msgSend_numberWithUnsignedInt_(v1, v2, v3, v4, v5);
}

uint64_t (**sub_1DDBE2A78(uint64_t (**result)(uint64_t, void, void, void *, void *)))(uint64_t, void, void, void *, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void *, void *))(*result)(3, result, 0, &unk_1F398D2B0, &unk_1DDC0CC28);
    }
    else {
      return 0;
    }
  }
  return result;
}

void *sub_1DDBE2AC4(unsigned int a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1;
  uint64_t result = &unk_1F398D2B0;
  switch(v5)
  {
    case 1:
      uint64_t result = 0;
      *(_DWORD *)(a3 + 8) = *((_DWORD *)a2 + 2);
      *(void *)a3 = sub_1DDBE2AC4;
      break;
    case 2:
      uint64_t result = 0;
      *(_DWORD *)(a3 + 8) = *((_DWORD *)a2 + 2);
      *(void *)a3 = sub_1DDBE2AC4;
      goto LABEL_5;
    case 3:
      if (a4) {
        BOOL v8 = sub_1DDAB6F70(a4, (uint64_t)&unk_1F398D2B0);
      }
      else {
        BOOL v8 = a5 == &unk_1DDC0CC28;
      }
      if (v8) {
        uint64_t result = a2 + 1;
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 4:
      return result;
    default:
      uint64_t result = 0;
LABEL_5:
      *a2 = 0;
      break;
  }
  return result;
}

uint64_t **sub_1DDBE2BA4(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t v7 = a1 + 1;
  int v6 = a1[1];
  if (v6)
  {
    int v8 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        int v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10) {
          break;
        }
        int v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      int v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v9 = a1 + 1;
LABEL_10:
    long long v11 = operator new(0x38uLL);
    v11[8] = **a4;
    *((void *)v11 + 5) = 0;
    *((void *)v11 + 6) = 0;
    sub_1DDA25078(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

uint64_t sub_1DDBE2C68(uint64_t a1)
{
  uint64_t v1 = NSNumber;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return objc_msgSend_numberWithFloat_(v1, v2, v3, v4, v5);
}

uint64_t (**sub_1DDBE2CB0(uint64_t (**result)(uint64_t, void, void, void, void *)))(uint64_t, void, void, void, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void, void *))(*result)(3, result, 0, MEMORY[0x1E4FBA398], &unk_1DDC0CC2C);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1DDBE2CFC(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1;
  uint64_t result = MEMORY[0x1E4FBA398];
  switch(v5)
  {
    case 1:
      uint64_t result = 0;
      *(_DWORD *)(a3 + 8) = *(_DWORD *)(a2 + 8);
      *(void *)a3 = sub_1DDBE2CFC;
      break;
    case 2:
      uint64_t result = 0;
      *(_DWORD *)(a3 + 8) = *(_DWORD *)(a2 + 8);
      *(void *)a3 = sub_1DDBE2CFC;
      goto LABEL_5;
    case 3:
      if (a4) {
        BOOL v8 = sub_1DDAB6F70(a4, MEMORY[0x1E4FBA398]);
      }
      else {
        BOOL v8 = a5 == &unk_1DDC0CC2C;
      }
      if (v8) {
        uint64_t result = a2 + 8;
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 4:
      return result;
    default:
      uint64_t result = 0;
LABEL_5:
      *(void *)a2 = 0;
      break;
  }
  return result;
}

id sub_1DDBE2DDC(uint64_t a1)
{
  (*(void (**)(void **__return_ptr))(*(void *)(a1 + 32) + 16))(__p);
  uint64_t v1 = sub_1DDBE3074((unsigned __int16 **)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v1;
}

void sub_1DDBE2E48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBE2E64(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 24))
  {
    if (a1 != a2) {
      sub_1DDA49474((char *)a1, *(char **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 1);
    }
  }
  else
  {
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    sub_1DDA1D908((void *)a1, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 1);
    *(unsigned char *)(a1 + 24) = 1;
  }
  return a1;
}

uint64_t sub_1DDBE2EDC(uint64_t a1, uint64_t a2)
{
  v6[4] = *(uint64_t (**)(void, void, void, void, void))MEMORY[0x1E4F143B8];
  memset(v5, 0, sizeof(v5));
  sub_1DDA1D908((void *)v5 + 1, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 1);
  *(void *)&v5[0] = sub_1DDBE314C;
  if (v5 != (_OWORD *)a1)
  {
    uint64_t v3 = *(void (**)(void, void, void, void, void))a1;
    if (*(void *)a1)
    {
      v6[0] = 0;
      v6[1] = 0;
      v3(2, a1, v6, 0, 0);
      (*(void (**)(uint64_t, _OWORD *, uint64_t, void, void))&v5[0])(2, v5, a1, 0, 0);
      ((uint64_t (**)(uint64_t, void, _OWORD *, void, void))v6)[0](2, v6, v5, 0, 0);
      sub_1DDAB6E58(v6);
    }
    else
    {
      *(_OWORD *)(a1 + 8) = *(_OWORD *)((char *)v5 + 8);
      *(void *)(a1 + 24) = *((void *)&v5[1] + 1);
      memset((char *)v5 + 8, 0, 24);
      *(void *)a1 = sub_1DDBE314C;
      *(void *)&v5[0] = 0;
    }
  }
  sub_1DDAB6E58((uint64_t (**)(void, void, void, void, void))v5);
  return a1;
}

void sub_1DDBE301C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_1DDA16678(a1);
}

uint64_t (**sub_1DDBE3028(uint64_t (**result)(uint64_t, void, void, void *, void *)))(uint64_t, void, void, void *, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void *, void *))(*result)(3, result, 0, &unk_1F398D2C0, &unk_1DDC0CC54);
    }
    else {
      return 0;
    }
  }
  return result;
}

id sub_1DDBE3074(unsigned __int16 **a1)
{
  uint64_t v5 = sub_1DDA49F48(a1[1] - *a1);
  int v6 = *a1;
  uint64_t v7 = a1[1];
  if (*a1 != v7)
  {
    do
    {
      BOOL v8 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v2, *v6, v3, v4);
      objc_msgSend_addObject_(v5, v9, (uint64_t)v8, v10, v11);

      ++v6;
    }
    while (v6 != v7);
  }
  long long v12 = objc_msgSend_arrayWithArray_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, v3, v4);

  return v12;
}

void sub_1DDBE312C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1DDBE314C(unsigned int a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1;
  uint64_t result = &unk_1F398D2C0;
  switch(v5)
  {
    case 1:
      a3[2] = 0;
      a3[3] = 0;
      a3[1] = 0;
      sub_1DDA1D908(a3 + 1, *(const void **)(a2 + 8), *(void *)(a2 + 16), (uint64_t)(*(void *)(a2 + 16) - *(void *)(a2 + 8)) >> 1);
      uint64_t result = 0;
      *a3 = sub_1DDBE314C;
      break;
    case 2:
      uint64_t result = 0;
      a3[1] = 0;
      a3[2] = 0;
      a3[3] = 0;
      *(_OWORD *)(a3 + 1) = *(_OWORD *)(a2 + 8);
      a3[3] = *(void *)(a2 + 24);
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)(a2 + 24) = 0;
      *a3 = sub_1DDBE314C;
      goto LABEL_7;
    case 3:
      if (a4) {
        BOOL v10 = sub_1DDAB6F70(a4, (uint64_t)&unk_1F398D2C0);
      }
      else {
        BOOL v10 = a5 == &unk_1DDC0CC54;
      }
      if (v10) {
        uint64_t result = (void *)(a2 + 8);
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 4:
      return result;
    default:
      uint64_t v9 = *(void **)(a2 + 8);
      if (v9)
      {
        *(void *)(a2 + 16) = v9;
        operator delete(v9);
      }
      uint64_t result = 0;
LABEL_7:
      *(void *)a2 = 0;
      break;
  }
  return result;
}

id sub_1DDBE326C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)(a1 + 32) + 16))(&v3);
  uint64_t v1 = sub_1DDAD9920((unsigned int *)&v3);
  if (__p)
  {
    uint64_t v5 = __p;
    operator delete(__p);
  }

  return v1;
}

void sub_1DDBE32D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBE32F4(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 32))
  {
    sub_1DDAD88E8((void *)a1, a2);
  }
  else
  {
    sub_1DDAD80E8((void *)a1, a2);
    *(unsigned char *)(a1 + 32) = 1;
  }
  return a1;
}

unint64_t *sub_1DDBE333C(unint64_t *a1, uint64_t a2)
{
  v9[4] = *(uint64_t (**)(void, void, void, void, void))MEMORY[0x1E4F143B8];
  v8[0] = 0;
  v8[1] = 0;
  sub_1DDBE34B0(v8, a2);
  if (v8 != (uint64_t (**)(void, void, void, void, void))a1)
  {
    unint64_t v3 = *a1;
    if (v8[0]) {
      BOOL v4 = v3 == 0;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if ((unint64_t)v8[0] | v3)
      {
        if (v8[0])
        {
          unint64_t v3 = (unint64_t)v8[0];
          uint64_t v5 = a1;
        }
        else
        {
          uint64_t v5 = (unint64_t *)v8;
        }
        if (v8[0]) {
          int v6 = (unint64_t *)v8;
        }
        else {
          int v6 = a1;
        }
        ((void (*)(uint64_t, unint64_t *, unint64_t *, void, void))v3)(2, v6, v5, 0, 0);
      }
    }
    else
    {
      v9[0] = 0;
      v9[1] = 0;
      ((void (*)(uint64_t, unint64_t *, uint64_t (**)(void, void, void, void, void), void, void))v3)(2, a1, v9, 0, 0);
      ((uint64_t (**)(uint64_t, void, unint64_t *, void, void))v8)[0](2, v8, a1, 0, 0);
      v9[0](2, v9, v8, 0, 0);
      sub_1DDAB6E58(v9);
    }
  }
  sub_1DDAB6E58(v8);
  return a1;
}

void sub_1DDBE3458(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_1DDA16678(a1);
}

uint64_t (**sub_1DDBE3464(uint64_t (**result)(uint64_t, void, void, void *, void *)))(uint64_t, void, void, void *, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void *, void *))(*result)(3, result, 0, &unk_1F398D2D0, &unk_1DDC0CC64);
    }
    else {
      return 0;
    }
  }
  return result;
}

void *sub_1DDBE34B0(void *a1, uint64_t a2)
{
  BOOL v4 = operator new(0x20uLL);
  sub_1DDAD80E8(v4, a2);
  *a1 = sub_1DDBE3518;
  a1[1] = v4;
  return v4;
}

void sub_1DDBE3504(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_1DDBE3518(unsigned int a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1;
  uint64_t result = &unk_1F398D2D0;
  switch(v5)
  {
    case 1:
      sub_1DDBE34B0(a3, a2[1]);
      goto LABEL_4;
    case 2:
      uint64_t result = 0;
      uint64_t v8 = a2[1];
      *a3 = sub_1DDBE3518;
      a3[1] = v8;
      *a2 = 0;
      break;
    case 3:
      if (a4) {
        BOOL v9 = sub_1DDAB6F70(a4, (uint64_t)&unk_1F398D2D0);
      }
      else {
        BOOL v9 = a5 == &unk_1DDC0CC64;
      }
      if (v9) {
        uint64_t result = (void *)a2[1];
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 4:
      return result;
    default:
      sub_1DDBE35EC(a2);
LABEL_4:
      uint64_t result = 0;
      break;
  }
  return result;
}

void sub_1DDBE35EC(void *a1)
{
  uint64_t v2 = (void *)a1[1];
  unint64_t v3 = (void *)v2[1];
  if (v3)
  {
    v2[2] = v3;
    operator delete(v3);
  }
  operator delete(v2);
  *a1 = 0;
}

uint64_t sub_1DDBE362C(uint64_t a1)
{
  uint64_t v1 = NSNumber;
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return objc_msgSend_numberWithUnsignedInt_(v1, v2, v3, v4, v5);
}

uint64_t (**sub_1DDBE3678(uint64_t (**result)(uint64_t, void, void, void *, void *)))(uint64_t, void, void, void *, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void *, void *))(*result)(3, result, 0, &unk_1F398D2E0, &unk_1DDC0CC78);
    }
    else {
      return 0;
    }
  }
  return result;
}

void *sub_1DDBE36C4(unsigned int a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1;
  uint64_t result = &unk_1F398D2E0;
  switch(v5)
  {
    case 1:
      uint64_t result = 0;
      *(_DWORD *)(a3 + 8) = *((_DWORD *)a2 + 2);
      *(void *)a3 = sub_1DDBE36C4;
      break;
    case 2:
      uint64_t result = 0;
      *(_DWORD *)(a3 + 8) = *((_DWORD *)a2 + 2);
      *(void *)a3 = sub_1DDBE36C4;
      goto LABEL_5;
    case 3:
      if (a4) {
        BOOL v8 = sub_1DDAB6F70(a4, (uint64_t)&unk_1F398D2E0);
      }
      else {
        BOOL v8 = a5 == &unk_1DDC0CC78;
      }
      if (v8) {
        uint64_t result = a2 + 1;
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 4:
      return result;
    default:
      uint64_t result = 0;
LABEL_5:
      *a2 = 0;
      break;
  }
  return result;
}

uint64_t sub_1DDBE37A4(uint64_t a1)
{
  uint64_t v1 = NSNumber;
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return objc_msgSend_numberWithInt_(v1, v2, v3, v4, v5);
}

uint64_t (**sub_1DDBE37F0(uint64_t (**result)(uint64_t, void, void, void *, void *)))(uint64_t, void, void, void *, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void *, void *))(*result)(3, result, 0, &unk_1F398D2F0, &unk_1DDC0CC90);
    }
    else {
      return 0;
    }
  }
  return result;
}

void *sub_1DDBE383C(unsigned int a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1;
  uint64_t result = &unk_1F398D2F0;
  switch(v5)
  {
    case 1:
      uint64_t result = 0;
      *(_DWORD *)(a3 + 8) = *((_DWORD *)a2 + 2);
      *(void *)a3 = sub_1DDBE383C;
      break;
    case 2:
      uint64_t result = 0;
      *(_DWORD *)(a3 + 8) = *((_DWORD *)a2 + 2);
      *(void *)a3 = sub_1DDBE383C;
      goto LABEL_5;
    case 3:
      if (a4) {
        BOOL v8 = sub_1DDAB6F70(a4, (uint64_t)&unk_1F398D2F0);
      }
      else {
        BOOL v8 = a5 == &unk_1DDC0CC90;
      }
      if (v8) {
        uint64_t result = a2 + 1;
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 4:
      return result;
    default:
      uint64_t result = 0;
LABEL_5:
      *a2 = 0;
      break;
  }
  return result;
}

uint64_t sub_1DDBE391C(uint64_t a1)
{
  uint64_t v1 = NSNumber;
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return objc_msgSend_numberWithUnsignedInt_(v1, v2, v3, v4, v5);
}

uint64_t (**sub_1DDBE3968(uint64_t (**result)(uint64_t, void, void, void *, void *)))(uint64_t, void, void, void *, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void *, void *))(*result)(3, result, 0, &unk_1F398D300, &unk_1DDC0CCAC);
    }
    else {
      return 0;
    }
  }
  return result;
}

void *sub_1DDBE39B4(unsigned int a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1;
  uint64_t result = &unk_1F398D300;
  switch(v5)
  {
    case 1:
      uint64_t result = 0;
      *(_DWORD *)(a3 + 8) = *((_DWORD *)a2 + 2);
      *(void *)a3 = sub_1DDBE39B4;
      break;
    case 2:
      uint64_t result = 0;
      *(_DWORD *)(a3 + 8) = *((_DWORD *)a2 + 2);
      *(void *)a3 = sub_1DDBE39B4;
      goto LABEL_5;
    case 3:
      if (a4) {
        BOOL v8 = sub_1DDAB6F70(a4, (uint64_t)&unk_1F398D300);
      }
      else {
        BOOL v8 = a5 == &unk_1DDC0CCAC;
      }
      if (v8) {
        uint64_t result = a2 + 1;
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 4:
      return result;
    default:
      uint64_t result = 0;
LABEL_5:
      *a2 = 0;
      break;
  }
  return result;
}

uint64_t sub_1DDBE3A94(uint64_t a1)
{
  uint64_t v1 = NSNumber;
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return objc_msgSend_numberWithUnsignedInt_(v1, v2, v3, v4, v5);
}

uint64_t (**sub_1DDBE3AE0(uint64_t (**result)(uint64_t, void, void, void *, void *)))(uint64_t, void, void, void *, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void *, void *))(*result)(3, result, 0, &unk_1F398D310, &unk_1DDC0CCC8);
    }
    else {
      return 0;
    }
  }
  return result;
}

void *sub_1DDBE3B2C(unsigned int a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1;
  uint64_t result = &unk_1F398D310;
  switch(v5)
  {
    case 1:
      uint64_t result = 0;
      *(_DWORD *)(a3 + 8) = *((_DWORD *)a2 + 2);
      *(void *)a3 = sub_1DDBE3B2C;
      break;
    case 2:
      uint64_t result = 0;
      *(_DWORD *)(a3 + 8) = *((_DWORD *)a2 + 2);
      *(void *)a3 = sub_1DDBE3B2C;
      goto LABEL_5;
    case 3:
      if (a4) {
        BOOL v8 = sub_1DDAB6F70(a4, (uint64_t)&unk_1F398D310);
      }
      else {
        BOOL v8 = a5 == &unk_1DDC0CCC8;
      }
      if (v8) {
        uint64_t result = a2 + 1;
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 4:
      return result;
    default:
      uint64_t result = 0;
LABEL_5:
      *a2 = 0;
      break;
  }
  return result;
}

uint64_t sub_1DDBE3C0C()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EBA50730, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EBA50730))
  {
    operator new();
  }
  return qword_1EBA50728;
}

void sub_1DDBE3C84(_Unwind_Exception *a1)
{
  MEMORY[0x1E01C3DC0](v1, 0xA0C40E93CF5C4);
  __cxa_guard_abort(&qword_1EBA50730);
  _Unwind_Resume(a1);
}

id sub_1DDBE3CBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = sub_1DDBE4148;
  double v16 = sub_1DDBE4158;
  id v17 = 0;
  uint64_t v4 = sub_1DDBE4160();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DDBE41DC;
  block[3] = &unk_1E6D07298;
  BOOL v10 = &v12;
  uint64_t v11 = a1;
  id v9 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);

  id v6 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v6;
}

id sub_1DDBE3DE4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_1DDBE3C0C();
  id v3 = sub_1DDBE3E44(v2, v1);

  return v3;
}

void sub_1DDBE3E34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1DDBE3E44(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = sub_1DDBE4148;
  double v16 = sub_1DDBE4158;
  id v17 = 0;
  uint64_t v4 = sub_1DDBE4160();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DDBE441C;
  block[3] = &unk_1E6D07298;
  BOOL v10 = &v12;
  uint64_t v11 = a1;
  id v9 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);

  id v6 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v6;
}

void sub_1DDBE3F6C(void *a1@<X0>, void *a2@<X8>)
{
  id v4 = a1;
  uint64_t v3 = sub_1DDBE3C0C();
  sub_1DDBE3FD4(v3, v4, a2);
}

void sub_1DDBE3FC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DDBE3FD4(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  id v10 = a2;
  if (objc_msgSend_isEqualToString_(v10, v5, @"unsupported", v6, v7))
  {
    if (qword_1EAB912B8 != -1) {
      dispatch_once(&qword_1EAB912B8, &unk_1F398D320);
    }
    id v8 = (id)qword_1EAB912B0;
  }
  else
  {
    sub_1DDBE3CBC(a1, v10);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = v8;
  if (v8)
  {
    sub_1DDB653F4(v10, v8, a3);
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
  }
}

void sub_1DDBE40A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DDBE40BC()
{
  sub_1DDB42980(@"unsupported", @"camera");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = objc_msgSend_dictionaryWithContentsOfURL_(MEMORY[0x1E4F1C9E8], v0, (uint64_t)v5, v1, v2);
  id v4 = (void *)qword_1EAB912B0;
  qword_1EAB912B0 = v3;
}

void sub_1DDBE4134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DDBE4148(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1DDBE4158(uint64_t a1)
{
}

id sub_1DDBE4160()
{
  p_cache = DMKernels.cache;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EBA50740, memory_order_acquire) & 1) == 0)
  {
    int v3 = __cxa_guard_acquire(&qword_1EBA50740);
    p_cache = (void **)(DMKernels + 16);
    if (v3)
    {
      qword_1EBA50738 = (uint64_t)dispatch_queue_create("RawCameraSupport Queue", 0);
      __cxa_guard_release(&qword_1EBA50740);
      p_cache = (void **)(DMKernels + 16);
    }
  }
  uint64_t v1 = p_cache[231];

  return v1;
}

void sub_1DDBE41DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = sub_1DDBE42E8(v6, *(const char **)(a1 + 32), a3, a4, a5);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    sub_1DDBE436C((uint64_t *)v6, &v15);
    if (v15)
    {
      uint64_t v12 = sub_1DDBE6578(v15, *(void **)(a1 + 32));
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(v6 + 16), v10, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(void *)(a1 + 32), v11);
    if (v16) {
      sub_1DDA18310(v16);
    }
  }
}

void sub_1DDBE4290(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  __cxa_begin_catch(a1);
  uint64_t v15 = *(void *)(*(void *)(v14 + 40) + 8);
  double v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = 0;

  __cxa_end_catch();
}

id sub_1DDBE42E8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 16), a2, (uint64_t)a2, a4, a5);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

void sub_1DDBE435C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DDBE436C(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  if (!*a1)
  {
    id v5 = sub_1DDBE4528();
    sub_1DDBE64F8(v5, &v10);

    sub_1DDBE4770(a1, &v10, v6, v7, v8);
    if (v11) {
      sub_1DDA18310(v11);
    }
    uint64_t v4 = *a1;
  }
  uint64_t v9 = a1[1];
  *a2 = v4;
  a2[1] = v9;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
}

void sub_1DDBE43F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1DDA18310(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBE441C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = sub_1DDBE42E8(v6, *(const char **)(a1 + 32), a3, a4, a5);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    sub_1DDBE436C((uint64_t *)v6, &v15);
    if (v15)
    {
      uint64_t v12 = sub_1DDBE6DF0(v15, *(void **)(a1 + 32));
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(v6 + 16), v10, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(void *)(a1 + 32), v11);
    if (v16) {
      sub_1DDA18310(v16);
    }
  }
}

void sub_1DDBE44D0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  __cxa_begin_catch(a1);
  uint64_t v15 = *(void *)(*(void *)(v14 + 40) + 8);
  double v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = 0;

  __cxa_end_catch();
}

id sub_1DDBE4528()
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v1 = sub_1DDBE4594();
  id v5 = objc_msgSend_fileURLWithPath_(v0, v2, (uint64_t)v1, v3, v4);

  return v5;
}

void sub_1DDBE4584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *sub_1DDBE4594()
{
  v0 = sub_1DDB42A6C();
  id v5 = v0;
  if (v0)
  {
    uint64_t v6 = objc_msgSend_bundleURL(v0, v1, v2, v3, v4);
    uint64_t v11 = objc_msgSend_path(v6, v7, v8, v9, v10);
    double v16 = objc_msgSend_mutableCopy(v11, v12, v13, v14, v15);

    if (v16)
    {
      if (objc_msgSend_containsString_(v16, v17, @"/RegressionTest.octest/Contents/Resources", v18, v19))
      {
        uint64_t v24 = objc_msgSend_length(v16, v20, v21, v22, v23);
        objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v16, v25, @"/RegressionTest.octest/Contents/Resources", (uint64_t)&stru_1F398F7F8, 0, 0, v24);
      }
      uint64_t v26 = objc_msgSend_length(v16, v20, v21, v22, v23);
      objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v16, v27, @"RawCamera.bundle", @"RawCameraSupport.bundle", 0, 0, v26);
      double v32 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v28, v29, v30, v31);
      char v36 = objc_msgSend_fileExistsAtPath_(v32, v33, (uint64_t)v16, v34, v35);

      if (v36) {
        uint64_t v37 = v16;
      }
      else {
        uint64_t v37 = @"/System/Library/CoreServices/RawCameraSupport.bundle";
      }
    }
    else
    {
      uint64_t v37 = 0;
    }
  }
  else
  {
    uint64_t v37 = 0;
  }

  return v37;
}

void sub_1DDBE46D4(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void *sub_1DDBE471C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, a3, a4, a5);
  return a1;
}

void sub_1DDBE4758(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    sub_1DDA18310(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBE4770(void *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v8 = (std::__shared_weak_count *)a1[1];
  *a1 = v7;
  a1[1] = v6;
  if (v8) {
    sub_1DDA18310(v8);
  }
  uint64_t v9 = a1[2];

  return MEMORY[0x1F4181798](v9, sel_removeAllObjects, a3, a4, a5);
}

id sub_1DDBE47C8(uint64_t *a1, const char *a2)
{
  uint64_t v4 = (void *)MEMORY[0x1E01C4510]();
  sub_1DDBE436C(a1, &v10);
  if (v10)
  {
    uint64_t v8 = sub_1DDBE71E4(v10, a2, v5, v6, v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (v11) {
    sub_1DDA18310(v11);
  }

  return v8;
}

void sub_1DDBE4858(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1DDA18310(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CreateListOfSupportedCamerasAndVersions(const char *a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E01C4510]();
  uint64_t v3 = (uint64_t *)sub_1DDBE3C0C();
  uint64_t v4 = sub_1DDBE47C8(v3, a1);
  return v4;
}

void sub_1DDBE48CC(uint64_t a1)
{
  if ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(a1)) {
    goto LABEL_2;
  }
  uint64_t v10 = 0;
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a1 + 160))(&v8, a1);
  uint64_t v2 = v8;
  sub_1DDA1A880(__p, "IFD0:DNGPrivate:SR2Private:SR2SubIFD:WhiteLevel");
  char v3 = (*(uint64_t (**)(uint64_t, void **, uint64_t *))(*(void *)v2 + 240))(v2, __p, &v10);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  if (v9) {
    sub_1DDA18310(v9);
  }
  if (v3) {
    goto LABEL_13;
  }
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a1 + 160))(&v8, a1);
  uint64_t v4 = v8;
  sub_1DDA1A880(__p, "IFD0:SR2Private:SR2SubIFD:0x7306");
  char v5 = (*(uint64_t (**)(uint64_t, void **, uint64_t *))(*(void *)v4 + 240))(v4, __p, &v10);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  if (v9) {
    sub_1DDA18310(v9);
  }
  if (v5) {
LABEL_13:
  }
    (*(double (**)(uint64_t))(*(void *)a1 + 848))(a1);
  else {
LABEL_2:
  }
    sub_1DDBD39EC(a1);
}

void sub_1DDBE4A94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBE4ACC(uint64_t a1@<X0>, void **a2@<X8>)
{
  if ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(a1)) {
    goto LABEL_9;
  }
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a1 + 160))(&v9, a1);
  uint64_t v4 = v9;
  sub_1DDA1A880(__p, "IFD0:DNGPrivate:SR2Private:SR2SubIFD:BlackLevels");
  char v5 = (*(uint64_t (**)(uint64_t, void **, void **, void))(*(void *)v4 + 248))(v4, __p, a2, 0);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  if (v10) {
    sub_1DDA18310(v10);
  }
  if ((v5 & 1) == 0)
  {
    uint64_t v6 = *a2;
    if (*a2)
    {
      a2[1] = v6;
      operator delete(v6);
    }
LABEL_9:
    sub_1DDBCFB0C(a1, a2);
  }
}

void sub_1DDBE4BE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, std::__shared_weak_count *a17)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a17) {
    sub_1DDA18310(a17);
  }
  uint64_t v19 = *(void **)v17;
  if (*(void *)v17)
  {
    *(void *)(v17 + 8) = v19;
    operator delete(v19);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBE4C2C(uint64_t a1)
{
  int v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 2192))(a1);
  (*(void (**)(void **__return_ptr, uint64_t))(*(void *)a1 + 2200))(__p, a1);
  int v6 = 0;
  int v7 = v2;
  char v5 = &unk_1F396F638;
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a1 + 160))(&v3, a1);
  (*(void (**)(uint64_t, void **, void **, uint64_t))(*(void *)v3 + 600))(v3, __p, &v5, 3);
  if (v4) {
    sub_1DDA18310(v4);
  }
  if (v9 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1DDBE4D7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a11) {
    sub_1DDA18310(a11);
  }
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBE4DAC()
{
  v0 = (unsigned __int8 *)&unk_1EAB91000;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB912C8, memory_order_acquire) & 1) == 0)
  {
    int v2 = __cxa_guard_acquire(&qword_1EAB912C8);
    v0 = (unsigned char *)&unk_1EAB91000;
    if (v2)
    {
      byte_1EAB912C0 = getenv("RAWCAMERA_USE_RAWCAMERASUPPORT") != 0;
      __cxa_guard_release(&qword_1EAB912C8);
      v0 = (unsigned char *)&unk_1EAB91000;
    }
  }
  return v0[704];
}

id sub_1DDBE4E1C()
{
  v0 = &unk_1EAB91000;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB912D8, memory_order_acquire) & 1) == 0)
  {
    int v3 = __cxa_guard_acquire(&qword_1EAB912D8);
    v0 = (void *)&unk_1EAB91000;
    if (v3)
    {
      qword_1EAB912D0 = (uint64_t)dispatch_queue_create("RawCamera_Catalog_Access_Queue", 0);
      __cxa_guard_release(&qword_1EAB912D8);
      v0 = (void *)&unk_1EAB91000;
    }
  }
  uint64_t v1 = (void *)v0[90];

  return v1;
}

id sub_1DDBE4E98()
{
  if (qword_1EAB912E8 != -1) {
    dispatch_once(&qword_1EAB912E8, &unk_1F398DEF0);
  }
  uint64_t v4 = 0;
  char v5 = &v4;
  uint64_t v6 = 0x3032000000;
  int v7 = sub_1DDBE5924;
  char v8 = sub_1DDBE5934;
  id v9 = 0;
  v0 = sub_1DDBE4E1C();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DDBE593C;
  block[3] = &unk_1E6D04F80;
  void block[4] = &v4;
  dispatch_sync(v0, block);

  id v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1DDBE4FB8()
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E01C4510]();
  id v1 = dispatch_get_global_queue(0, 0);
  notify_register_dispatch("com.apple.MobileAsset.RawCamera.Camera.ma.cached-metadata-updated", (int *)&unk_1EAB912F0, v1, &unk_1F398DF10);

  id v2 = objc_alloc(MEMORY[0x1E4F77FB8]);
  uint64_t v6 = objc_msgSend_initWithType_(v2, v3, qword_1EAB8AFA8, v4, v5);
  uint64_t MetaDataSync = objc_msgSend_queryMetaDataSync(v6, v7, v8, v9, v10);
  if (MetaDataSync)
  {
    double v16 = sub_1DDBBA928();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1DDBF54E0();
    }
  }
  else
  {
    uint64_t v21 = objc_msgSend_results(v6, v11, v12, v13, v14);
    uint64_t v22 = (void *)qword_1EAB912E0;
    qword_1EAB912E0 = v21;
  }
  uint64_t v23 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], v17, v18, v19, v20, 0.0);
  uint64_t v28 = objc_msgSend_lastFetchDate(v6, v24, v25, v26, v27);
  objc_msgSend_timeIntervalSinceDate_(v23, v29, (uint64_t)v28, v30, v31);
  double v33 = v32;

  if (v33 > 604800.0 || MetaDataSync == 2)
  {
    if (MetaDataSync == 2)
    {
      uint64_t v34 = sub_1DDBBA928();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        int v38 = 136446210;
        unsigned int v39 = "GetMobileAssetCatalog_block_invoke";
        uint64_t v35 = "%{public}s MobileAsset catalog not present. Initiating download";
LABEL_13:
        _os_log_impl(&dword_1DDA14000, v34, OS_LOG_TYPE_INFO, v35, (uint8_t *)&v38, 0xCu);
      }
    }
    else
    {
      uint64_t v34 = sub_1DDBBA928();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        int v38 = 136446210;
        unsigned int v39 = "GetMobileAssetCatalog_block_invoke";
        uint64_t v35 = "%{public}s MobileAsset may have been updated. Initiating download";
        goto LABEL_13;
      }
    }

    objc_msgSend_startCatalogDownload_then_(MEMORY[0x1E4F77FB0], v36, qword_1EAB8AFA8, (uint64_t)&unk_1F398DF30, v37);
  }

  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB91300, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB91300))
  {
    qword_1EAB912F8 = (uint64_t)dispatch_queue_create("RawCamera_Update_MobileAsset_Catalog", 0);
    __cxa_guard_release(&qword_1EAB91300);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB91310, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB91310))
  {
    qword_1EAB91308 = (uint64_t)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)qword_1EAB912F8);
    __cxa_guard_release(&qword_1EAB91310);
  }
  dispatch_source_set_timer((dispatch_source_t)qword_1EAB91308, 0x2260FF9290000uLL, 0x2260FF9290000uLL, 0x3B9ACA00uLL);
  dispatch_source_set_event_handler((dispatch_source_t)qword_1EAB91308, &unk_1F398DF50);
  dispatch_resume((dispatch_object_t)qword_1EAB91308);
}

void sub_1DDBE52CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DDBE531C()
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v0 = sub_1DDBBA928();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v17 = "GetMobileAssetCatalog_block_invoke_2";
    _os_log_impl(&dword_1DDA14000, v0, OS_LOG_TYPE_INFO, "%{public}s MobileAsset catalog was updated.", buf, 0xCu);
  }

  id v1 = (void *)MEMORY[0x1E01C4510]();
  id v2 = objc_alloc(MEMORY[0x1E4F77FB8]);
  uint64_t v6 = objc_msgSend_initWithType_(v2, v3, qword_1EAB8AFA8, v4, v5);
  if (objc_msgSend_queryMetaDataSync(v6, v7, v8, v9, v10))
  {
    uint64_t v11 = sub_1DDBBA928();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1DDBF54E0();
    }
  }
  else
  {
    uint64_t v12 = sub_1DDBE4E1C();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1DDBE5524;
    block[3] = &unk_1E6D072E0;
    uint64_t v15 = v6;
    dispatch_async(v12, block);

    uint64_t v13 = sub_1DDBBA928();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v17 = "GetMobileAssetCatalog_block_invoke_2";
      _os_log_impl(&dword_1DDA14000, v13, OS_LOG_TYPE_INFO, "%{public}s Updated catalog", buf, 0xCu);
    }

    uint64_t v11 = v15;
  }
}

void sub_1DDBE54F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DDBE5524(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_results(*(void **)(a1 + 32), a2, a3, a4, a5);
  uint64_t v6 = qword_1EAB912E0;
  qword_1EAB912E0 = v5;

  return MEMORY[0x1F41817F8](v5, v6);
}

void sub_1DDBE5560(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v3 = (void *)MEMORY[0x1E01C4510]();
  uint64_t v4 = sub_1DDBBA928();
  uint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1DDBF5554();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 136446466;
    int v7 = "GetMobileAssetCatalog_block_invoke";
    __int16 v8 = 1024;
    int v9 = 0;
    _os_log_impl(&dword_1DDA14000, v5, OS_LOG_TYPE_INFO, "%{public}s MobileAsset catalog download successful (Err: %d)", (uint8_t *)&v6, 0x12u);
  }
}

void sub_1DDBE5650()
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E01C4510]();
  id v1 = objc_alloc(MEMORY[0x1E4F77FB8]);
  uint64_t v5 = objc_msgSend_initWithType_(v1, v2, qword_1EAB8AFA8, v3, v4);
  uint64_t MetaDataSync = objc_msgSend_queryMetaDataSync(v5, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], v11, v12, v13, v14, 0.0);
  uint64_t v20 = objc_msgSend_lastFetchDate(v5, v16, v17, v18, v19);
  objc_msgSend_timeIntervalSinceDate_(v15, v21, (uint64_t)v20, v22, v23);
  double v25 = v24;

  if (v25 > 604800.0 || MetaDataSync == 2)
  {
    if (MetaDataSync == 2)
    {
      uint64_t v27 = sub_1DDBBA928();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        int v31 = 136446210;
        double v32 = "GetMobileAssetCatalog_block_invoke";
        uint64_t v28 = "%{public}s MobileAsset catalog not present. Initiating download";
LABEL_11:
        _os_log_impl(&dword_1DDA14000, v27, OS_LOG_TYPE_INFO, v28, (uint8_t *)&v31, 0xCu);
      }
    }
    else
    {
      uint64_t v27 = sub_1DDBBA928();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        int v31 = 136446210;
        double v32 = "GetMobileAssetCatalog_block_invoke";
        uint64_t v28 = "%{public}s MobileAsset may have been updated. Initiating download";
        goto LABEL_11;
      }
    }

    objc_msgSend_startCatalogDownload_then_(MEMORY[0x1E4F77FB0], v29, qword_1EAB8AFA8, (uint64_t)&unk_1F398DF70, v30);
  }
}

void sub_1DDBE5800(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DDBE5840(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E01C4510]();
  uint64_t v4 = sub_1DDBBA928();
  uint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1DDBF5554();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 136446210;
    uint64_t v7 = "GetMobileAssetCatalog_block_invoke";
    _os_log_impl(&dword_1DDA14000, v5, OS_LOG_TYPE_INFO, "%{public}s MobileAsset catalog download successful", (uint8_t *)&v6, 0xCu);
  }
}

uint64_t sub_1DDBE5924(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1DDBE5934(uint64_t a1)
{
}

void sub_1DDBE593C(uint64_t a1)
{
}

id sub_1DDBE5954(void *a1, int a2)
{
  uint64_t v173 = *MEMORY[0x1E4F143B8];
  id v152 = a1;
  uint64_t v151 = sub_1DDBE4E98();
  if (!v151)
  {
    uint64_t v130 = 0;
    goto LABEL_46;
  }
  id v2 = sub_1DDB42D98();
  int v153 = sub_1DDB42E64(v2);

  uint64_t v157 = objc_msgSend_lowercaseString(v152, v3, v4, v5, v6);
  long long v164 = 0u;
  long long v165 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  obj = v151;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v162, (uint64_t)v172, 16);
  if (v12)
  {
    int v156 = 0;
    double v155 = 0;
    uint64_t v13 = *(void *)v163;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v163 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v162 + 1) + 8 * i);
        double v16 = objc_msgSend_attributes(v15, v8, v9, v10, v11);
        uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v16, v17, @"FormatVersion", v18, v19);

        if ((int)objc_msgSend_intValue(v20, v21, v22, v23, v24) >= 2)
        {
          uint64_t v29 = objc_msgSend_attributes(v15, v25, v26, v27, v28);
          uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v29, v30, @"cameraVersionInfo", v31, v32);
          uint64_t v37 = objc_msgSend_valueForKey_(v33, v34, (uint64_t)v157, v35, v36);

          if (v37)
          {
            unint64_t v41 = objc_msgSend_objectForKeyedSubscript_(v37, v38, @"cameraContentVersion", v39, v40);
            int v46 = objc_msgSend_intValue(v41, v42, v43, v44, v45);

            uint64_t v50 = objc_msgSend_objectForKeyedSubscript_(v37, v47, @"minRawCameraVersion", v48, v49);
            int v51 = sub_1DDB42E64(v50);

            if (v46 > a2 && v46 > v156 && v153 >= v51)
            {
              id v52 = v15;

              int v156 = v46;
              double v155 = v52;
            }
          }
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v162, (uint64_t)v172, 16);
    }
    while (v12);

    if (!v155)
    {
      double v155 = 0;
      uint64_t v130 = 0;
      goto LABEL_45;
    }
    if (objc_msgSend_state(v155, v53, v54, v55, v56) == 1)
    {
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB91320, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_1EAB91320))
      {
        qword_1EAB91318 = objc_opt_new();
        __cxa_guard_release(&qword_1EAB91320);
      }
      dispatch_time_t v61 = dispatch_time(0, 0);
      uint64_t v65 = objc_msgSend_objectForKeyedSubscript_((void *)qword_1EAB91318, v62, (uint64_t)v152, v63, v64);
      unint64_t v70 = objc_msgSend_unsignedLongLongValue(v65, v66, v67, v68, v69);

      if (v61 > v70)
      {
        dispatch_semaphore_t v71 = dispatch_semaphore_create(0);
        dispatch_time(0, 0);
        v159[0] = MEMORY[0x1E4F143A8];
        v159[1] = 3221225472;
        v159[2] = sub_1DDBE629C;
        v159[3] = &unk_1E6D07328;
        id v72 = v152;
        id v160 = v72;
        uint64_t v73 = v71;
        uint64_t v161 = v73;
        objc_msgSend_startDownload_(v155, v74, (uint64_t)v159, v75, v76);
        dispatch_time_t v77 = dispatch_time(0, 5000000000);
        dispatch_semaphore_wait(v73, v77);
        objc_msgSend_refreshState(v155, v78, v79, v80, v81);
        if (objc_msgSend_state(v155, v82, v83, v84, v85) == 2)
        {
          dispatch_time(0, 0);
          uint64_t v89 = objc_msgSend_assetProperty_(v155, v86, @"cameraNames", v87, v88);
          uint64_t v93 = objc_msgSend_componentsJoinedByString_(v89, v90, @", ", v91, v92);
          uint64_t v94 = (void *)v93;
          if (v93) {
            uint64_t v95 = (void *)v93;
          }
          else {
            uint64_t v95 = v72;
          }
          id v96 = v95;

          id v97 = v96;
          AnalyticsSendEventLazy();
        }
      }
    }
    if (objc_msgSend_state(v155, v57, v58, v59, v60) == 4)
    {
      uint64_t v102 = sub_1DDBBA928();
      if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v167 = "GetAssetForKey";
        _os_log_impl(&dword_1DDA14000, v102, OS_LOG_TYPE_INFO, "%{public}s Asset is in the Downloading state", buf, 0xCu);
      }

      int refreshed = objc_msgSend_refreshState(v155, v103, v104, v105, v106);
      uint64_t v108 = sub_1DDBBA928();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
      {
        uint64_t v113 = objc_msgSend_state(v155, v109, v110, v111, v112);
        uint64_t v114 = "WAS NOT";
        uint64_t v167 = "GetAssetForKey";
        *(_DWORD *)buf = 136446722;
        if (refreshed) {
          uint64_t v114 = "was";
        }
        __int16 v168 = 2080;
        uint64_t v169 = (uint64_t)v114;
        __int16 v170 = 2048;
        uint64_t v171 = v113;
        _os_log_impl(&dword_1DDA14000, v108, OS_LOG_TYPE_INFO, "%{public}s After calling refreshState the asset %s updated and the current state is %ld", buf, 0x20u);
      }
    }
    if (objc_msgSend_state(v155, v98, v99, v100, v101) == 2 || objc_msgSend_state(v155, v115, v116, v117, v118) == 3)
    {
      uint64_t v119 = objc_msgSend_getLocalFileUrl(v155, v115, v116, v117, v118);
      uint64_t v123 = objc_msgSend_URLByAppendingPathComponent_(v119, v120, (uint64_t)v157, v121, v122);
      obj = objc_msgSend_URLByAppendingPathExtension_(v123, v124, @"camera", v125, v126);

      uint64_t v130 = objc_msgSend_dictionaryWithContentsOfURL_(MEMORY[0x1E4F1C9E8], v127, (uint64_t)obj, v128, v129);
      if (v130)
      {
        uint64_t v131 = sub_1DDBBA928();
        if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
        {
          uint64_t v136 = objc_msgSend_attributes(v155, v132, v133, v134, v135);
          uint64_t v140 = objc_msgSend_objectForKeyedSubscript_(v136, v137, @"cameraNames", v138, v139);
          uint64_t v144 = objc_msgSend_componentsJoinedByString_(v140, v141, @", ", v142, v143);
          *(_DWORD *)buf = 136446722;
          uint64_t v167 = "GetAssetForKey";
          __int16 v168 = 2112;
          uint64_t v169 = (uint64_t)v157;
          __int16 v170 = 2112;
          uint64_t v171 = (uint64_t)v144;
          _os_log_impl(&dword_1DDA14000, v131, OS_LOG_TYPE_INFO, "%{public}s Found asset for \"%@\" (%@)", buf, 0x20u);
        }
      }
      goto LABEL_43;
    }
    obj = sub_1DDBBA928();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_INFO))
    {
      uint64_t v150 = objc_msgSend_state(v155, v146, v147, v148, v149);
      *(_DWORD *)buf = 136446466;
      uint64_t v167 = "GetAssetForKey";
      __int16 v168 = 2048;
      uint64_t v169 = v150;
      _os_log_impl(&dword_1DDA14000, obj, OS_LOG_TYPE_INFO, "%{public}s Asset is not installed and has state %ld", buf, 0x16u);
    }
  }
  else
  {
    double v155 = 0;
  }
  uint64_t v130 = 0;
LABEL_43:

LABEL_45:
LABEL_46:

  return v130;
}

void sub_1DDBE60D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1DDBE629C(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x1E01C4510]();
  if (a2)
  {
    uint64_t v8 = NSNumber;
    dispatch_time_t v9 = dispatch_time(0, 3600000000000);
    uint64_t v13 = objc_msgSend_numberWithUnsignedLongLong_(v8, v10, v9, v11, v12);
    objc_msgSend_setObject_forKeyedSubscript_((void *)qword_1EAB91318, v14, (uint64_t)v13, *(void *)(a1 + 32), v15);

    double v16 = sub_1DDBBA928();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1DDBF55C8();
    }
  }
  else
  {
    objc_msgSend_removeObjectForKey_((void *)qword_1EAB91318, v4, *(void *)(a1 + 32), v5, v6);
    double v16 = sub_1DDBBA928();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = 136446210;
      uint64_t v18 = "GetAssetForKey_block_invoke";
      _os_log_impl(&dword_1DDA14000, v16, OS_LOG_TYPE_INFO, "%{public}s Download asset successful", (uint8_t *)&v17, 0xCu);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_1DDBE63F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1DDBE6408(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  unint64_t v5 = *(void *)(a1 + 40);
  v11[0] = @"CameraName";
  v11[1] = @"DownloadTime";
  v12[0] = v6;
  uint64_t v7 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, a2, v5 / 0xF4240, a4, a5);
  v12[1] = v7;
  dispatch_time_t v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v8, (uint64_t)v12, (uint64_t)v11, 2);

  return v9;
}

void sub_1DDBE64E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_1DDBE64F8@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  id v3 = a1;
  uint64_t v4 = (char *)operator new(0x58uLL);
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *(void *)uint64_t v4 = &unk_1F398DFC0;
  *((void *)v4 + 3) = 0;
  *((void *)v4 + 4) = v3;
  double result = 0.0;
  *(_OWORD *)(v4 + 40) = 0u;
  *(_OWORD *)(v4 + 56) = 0u;
  *(_OWORD *)(v4 + 66) = 0u;
  *a2 = v4 + 24;
  a2[1] = v4;
  return result;
}

void sub_1DDBE6568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSObject *sub_1DDBE6578(uint64_t a1, void *a2)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v59 = v3;
  if (v3)
  {
    uint64_t v4 = sub_1DDBE6978(a1, v3, @"cam");
    uint64_t v8 = objc_msgSend_valueForKeyPath_(v4, v5, @"version.contentVersion", v6, v7);
    int v13 = objc_msgSend_intValue(v8, v9, v10, v11, v12);

    uint64_t v15 = sub_1DDBE6D14(v14, v59, @"cam", v13);
    uint64_t v19 = v15;
    if (v15)
    {
      id v20 = v15;

      uint64_t v4 = v20;
    }
    uint64_t v58 = v19;
    uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v4, v16, @"alias", v17, v18);
    if (v21)
    {
      uint64_t v60 = a1;
      int v22 = 0;
      do
      {
        if (v22 == 2) {
          break;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v62 = v4;
          dispatch_time_t v61 = sub_1DDBE6578(v60, v21);
          if (!v61)
          {
            exception = __cxa_allocate_exception(0x10uLL);
            MEMORY[0x1E01C3B90](exception, "RawCameraException");
            __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
          }

          uint64_t v4 = objc_msgSend_mutableCopy(v4, v23, v24, v25, v26);
          objc_msgSend_removeObjectForKey_(v4, v27, @"alias", v28, v29);
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          id v30 = v61;
          uint64_t v21 = 0;
          uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v63, (uint64_t)v67, 16);
          if (v35)
          {
            uint64_t v36 = *(void *)v64;
            do
            {
              for (uint64_t i = 0; i != v35; ++i)
              {
                if (*(void *)v64 != v36) {
                  objc_enumerationMutation(v30);
                }
                int v38 = *(void **)(*((void *)&v63 + 1) + 8 * i);
                if (objc_msgSend_isEqualToString_(v38, v32, @"alias", v33, v34))
                {
                  objc_msgSend_objectForKeyedSubscript_(v30, v39, (uint64_t)v38, v40, v41);
                  uint64_t v21 = v42 = v21;
                }
                else
                {
                  uint64_t v43 = objc_msgSend_objectForKeyedSubscript_(v4, v39, (uint64_t)v38, v40, v41);
                  BOOL v44 = v43 == 0;

                  if (!v44) {
                    continue;
                  }
                  uint64_t v42 = objc_msgSend_objectForKeyedSubscript_(v30, v32, (uint64_t)v38, v33, v34);
                  objc_msgSend_setObject_forKeyedSubscript_(v4, v45, (uint64_t)v42, (uint64_t)v38, v46);
                }
              }
              uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v32, (uint64_t)&v63, (uint64_t)v67, 16);
            }
            while (v35);
          }
        }
        ++v22;
      }
      while (v21);
    }
    uint64_t v47 = v4;

    uint64_t v48 = v47;
  }
  else
  {
    uint64_t v47 = sub_1DDBBA928();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_1DDBF563C(v47, v49, v50, v51, v52, v53, v54, v55);
    }
    uint64_t v48 = 0;
  }

  return v48;
}

void sub_1DDBE68A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

NSObject *sub_1DDBE6978(uint64_t a1, void *a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v11 = v6;
  if (!v5)
  {
    uint64_t v21 = sub_1DDBBA928();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1DDBF56B4(v21, v24, v25, v26, v27, v28, v29, v30);
    }
    goto LABEL_31;
  }
  if (!v6)
  {
    uint64_t v21 = sub_1DDBBA928();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1DDBF572C(v21, v31, v32, v33, v34, v35, v36, v37);
    }
    goto LABEL_31;
  }
  uint64_t v12 = objc_msgSend_lowercaseString(v5, v7, v8, v9, v10);
  sub_1DDBE6E94(a1, &v50);
  uint64_t v16 = v50;
  if (v50)
  {
    uint64_t v17 = objc_msgSend_stringWithFormat_(NSString, v13, @"%@.%@", v14, v15, v12, v11);
    sub_1DDB648E4(v16, v17, (uint64_t)&v48);

    if (!v48)
    {
      id v20 = sub_1DDBBA928();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_1DDBF581C();
      }
      uint64_t v21 = 0;
      int v23 = 1;
      goto LABEL_26;
    }
    uint64_t v18 = (const UInt8 *)sub_1DDA7EF68(v48);
    CFAllocatorRef v19 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    id v20 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v18, *(void *)(v48 + 24), (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    if (v20)
    {
      uint64_t v21 = CFPropertyListCreateWithData(v19, (CFDataRef)v20, 0, 0, 0);
      if (v21)
      {
        int v22 = sub_1DDBBA928();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136446466;
          uint64_t v53 = "resourceFromArchive";
          __int16 v54 = 2112;
          uint64_t v55 = v12;
          _os_log_impl(&dword_1DDA14000, v22, OS_LOG_TYPE_INFO, "%{public}s Loaded asset data for \"%@\"", buf, 0x16u);
        }
        int v23 = 0;
        goto LABEL_25;
      }
      int v22 = sub_1DDBBA928();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1DDBF591C();
      }
    }
    else
    {
      int v22 = sub_1DDBBA928();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1DDBF589C();
      }
    }
    uint64_t v21 = 0;
    int v23 = 1;
LABEL_25:

LABEL_26:
    if (v49) {
      sub_1DDA18310(v49);
    }
    goto LABEL_28;
  }
  int v38 = sub_1DDBBA928();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
    sub_1DDBF57A4(v38, v39, v40, v41, v42, v43, v44, v45);
  }

  uint64_t v21 = 0;
  int v23 = 1;
LABEL_28:
  if (v51) {
    sub_1DDA18310(v51);
  }

  if (v23)
  {
LABEL_31:
    uint64_t v46 = 0;
    goto LABEL_32;
  }
  uint64_t v21 = v21;
  uint64_t v46 = v21;
LABEL_32:

  return v46;
}

void sub_1DDBE6C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a12) {
    sub_1DDA18310(a12);
  }
  if (a14) {
    sub_1DDA18310(a14);
  }

  _Unwind_Resume(a1);
}

id sub_1DDBE6D14(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v6 = a2;
  if ((sub_1DDBE4DAC() & 1) == 0)
  {
    if (v6)
    {
      if (a3)
      {
        uint64_t v7 = sub_1DDBE5954(v6, a4);
        goto LABEL_11;
      }
      uint64_t v8 = sub_1DDBBA928();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1DDBF5A14(v8, v16, v17, v18, v19, v20, v21, v22);
      }
    }
    else
    {
      uint64_t v8 = sub_1DDBBA928();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1DDBF599C(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  uint64_t v7 = 0;
LABEL_11:

  return v7;
}

void sub_1DDBE6DD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1DDBE6DF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sub_1DDBE6978(a1, v3, @"ln");
  }
  else
  {
    id v5 = sub_1DDBBA928();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1DDBF5A8C(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    uint64_t v4 = 0;
  }

  return v4;
}

void sub_1DDBE6E80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DDBE6E94(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v4 = sub_1DDBE7170(a1);
    id v5 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v10 = sub_1DDBE7074(a1, v6, v7, v8, v9);
    uint64_t v14 = objc_msgSend_fileURLWithPath_(v5, v11, (uint64_t)v10, v12, v13);
    sub_1DDB63DC8(v14, (uint64_t *)&v36);

    uint64_t v15 = sub_1DDBE7170(a1);
    if ((objc_msgSend_isEqualToString_(v4, v16, (uint64_t)v15, v17, v18) & 1) == 0)
    {
      int v23 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v24 = sub_1DDBE7074(a1, v19, v20, v21, v22);
      uint64_t v28 = objc_msgSend_fileURLWithPath_(v23, v25, (uint64_t)v24, v26, v27);
      sub_1DDB63DC8(v28, (uint64_t *)&v35);
      long long v29 = v35;
      long long v35 = 0uLL;
      uint64_t v30 = (std::__shared_weak_count *)*((void *)&v36 + 1);
      long long v36 = v29;
      if (v30)
      {
        sub_1DDA18310(v30);
        if (*((void *)&v35 + 1)) {
          sub_1DDA18310(*((std::__shared_weak_count **)&v35 + 1));
        }
      }
    }
    uint64_t v31 = v36;
    if ((void)v36 && v15)
    {
      uint64_t v32 = *((void *)&v36 + 1);
      if (*((void *)&v36 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v36 + 1) + 8), 1uLL, memory_order_relaxed);
      }
      uint64_t v33 = *(std::__shared_weak_count **)(a1 + 40);
      *(void *)(a1 + 32) = v31;
      *(void *)(a1 + 40) = v32;
      if (v33) {
        sub_1DDA18310(v33);
      }
      objc_storeStrong((id *)(a1 + 48), v15);
      *(unsigned char *)(a1 + 56) = 1;
    }

    if (*((void *)&v36 + 1)) {
      sub_1DDA18310(*((std::__shared_weak_count **)&v36 + 1));
    }
  }
  uint64_t v34 = *(void *)(a1 + 40);
  *a2 = *(void *)(a1 + 32);
  a2[1] = v34;
  if (v34) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v34 + 8), 1uLL, memory_order_relaxed);
  }
}

void sub_1DDBE7010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    sub_1DDA18310(a12);
  }

  _Unwind_Resume(a1);
}

id sub_1DDBE7074(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5 = sub_1DDBE7114(a1, a2, a3, a4, a5);
  uint64_t v8 = objc_msgSend_URLForResource_withExtension_(v5, v6, @"PlugIns", @"assets", v7);

  if (v8)
  {
    uint64_t v13 = objc_msgSend_path(v8, v9, v10, v11, v12);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

void sub_1DDBE70F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1DDBE7114(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void **)a1;
  if (!v6)
  {
    uint64_t v7 = objc_msgSend_bundleWithURL_(MEMORY[0x1E4F28B50], a2, *(void *)(a1 + 8), a4, a5);
    uint64_t v8 = *(void **)a1;
    *(void *)a1 = v7;

    uint64_t v6 = *(void **)a1;
  }

  return v6;
}

id sub_1DDBE7170(uint64_t a1)
{
  CFDictionaryRef v1 = CFBundleCopyInfoDictionaryInDirectory(*(CFURLRef *)(a1 + 8));
  CFDictionaryRef v5 = v1;
  if (v1)
  {
    uint64_t v6 = sub_1DDA2E474(v1, (const char *)@"CFBundleShortVersionString", v2, v3, v4);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void sub_1DDBE71D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1DDBE71E4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v299[2] = *MEMORY[0x1E4F143B8];
  if (a2 != 1)
  {
    if (a2)
    {
      id v273 = 0;
    }
    else
    {
      sub_1DDBE6E94(a1, &v292);
      if (v292)
      {
        uint64_t v9 = sub_1DDB64CA8(v292, v5, v6, v7, v8);
        objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v10, v11, v12, v13);
        id v270 = (id)objc_claimAutoreleasedReturnValue();
        v267 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v14, v15, v16, v17);
        for (unint64_t i = 0; ; unint64_t i = v291 + 1)
        {
          unint64_t v291 = i;
          if (i >= objc_msgSend_count(v9, v18, v19, v20, v21)) {
            break;
          }
          uint64_t v27 = sub_1DDB65E24(v9, (const char *)&v291, v24, v25, v26);
          if (objc_msgSend_hasSuffix_(v27, v28, @".cam", v29, v30))
          {
            uint64_t v35 = objc_msgSend_length(v27, v31, v32, v33, v34);
            int v38 = objc_msgSend_substringWithRange_(v27, v36, 0, v35 - 4, v37);
            uint64_t v39 = sub_1DDBE6578(a1, v38);
            uint64_t v40 = v39;
            if (v39)
            {
              uint64_t v41 = sub_1DDBA64D4(v39, @"rawImageClass", @"supportedMethods");
              uint64_t v42 = sub_1DDBE7FB4(v40, @"version", @"cameraName");
              uint64_t v47 = (void *)v42;
              if (v41 && v42)
              {
                uint64_t v48 = objc_msgSend_string(MEMORY[0x1E4F28E78], v43, v44, v45, v46);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  objc_msgSend_appendString_(v48, v49, (uint64_t)v47, v50, v51);
                }
                else
                {
                  id v61 = v47;
                  for (unint64_t j = 0; ; unint64_t j = v290 + 1)
                  {
                    unint64_t v290 = j;
                    if (j >= objc_msgSend_count(v61, v57, v58, v59, v60)) {
                      break;
                    }
                    if (objc_msgSend_length(v48, v63, v64, v65, v66)) {
                      objc_msgSend_appendString_(v48, v67, @"/", v69, v70);
                    }
                    dispatch_semaphore_t v71 = sub_1DDB65E24(v61, (const char *)&v290, v68, v69, v70);
                    objc_msgSend_appendString_(v48, v72, (uint64_t)v71, v73, v74);
                  }
                }
                uint64_t v75 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v52, v53, v54, v55);
                objc_msgSend_setObject_forKeyedSubscript_(v75, v76, v41, @"supportedMethods", v77);
                objc_msgSend_setObject_forKeyedSubscript_(v75, v78, (uint64_t)v27, @"id", v79);
                if ((objc_msgSend_containsObject_(v267, v80, (uint64_t)v48, v81, v82) & 1) == 0) {
                  objc_msgSend_addObject_(v267, v83, (uint64_t)v48, v84, v85);
                }
                if (sub_1DDA2E4E0(v270, v48))
                {
                  uint64_t v93 = sub_1DDBE8048(v270, (const char *)v48, v87, v88, v89);
                }
                else
                {
                  uint64_t v93 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v86, v87, v88, v89);
                  objc_msgSend_setObject_forKeyedSubscript_(v270, v94, (uint64_t)v93, (uint64_t)v48, v95);
                }
                objc_msgSend_addObject_(v93, v90, (uint64_t)v75, v91, v92);
              }
              uint64_t v56 = (void *)v41;
            }
            else
            {
              uint64_t v56 = 0;
              uint64_t v47 = 0;
            }
          }
        }
        v298[0] = @"keyArray";
        v298[1] = @"camDict";
        v299[0] = v267;
        v299[1] = v270;
        v197 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v23, (uint64_t)v299, (uint64_t)v298, 2);
        id v273 = (id)objc_msgSend_mutableCopy(v197, v198, v199, v200, v201);
      }
      else
      {
        id v273 = 0;
      }
      if (v293) {
        sub_1DDA18310(v293);
      }
    }
    goto LABEL_95;
  }
  objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, a3, a4, a5);
  id v273 = (id)objc_claimAutoreleasedReturnValue();
  sub_1DDBE6E94(a1, &v292);
  uint64_t v96 = v292;
  if (!v292) {
    goto LABEL_66;
  }
  id v97 = sub_1DDB42D98();
  int v254 = sub_1DDB42E64(v97);

  sub_1DDB64CA8(v96, v98, v99, v100, v101);
  long long v288 = 0u;
  long long v289 = 0u;
  long long v286 = 0u;
  long long v287 = 0u;
  obunint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v259 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v102, (uint64_t)&v286, (uint64_t)v297, 16);
  if (!v259) {
    goto LABEL_65;
  }
  uint64_t v258 = *(void *)v287;
  do
  {
    uint64_t v268 = 0;
    do
    {
      if (*(void *)v287 != v258) {
        objc_enumerationMutation(obj);
      }
      v107 = *(void **)(*((void *)&v286 + 1) + 8 * v268);
      uint64_t v108 = objc_msgSend_pathExtension(v107, v103, v104, v105, v106);
      char isEqualToString = objc_msgSend_isEqualToString_(v108, v109, @"cam", v110, v111);

      if (isEqualToString)
      {
        v257 = objc_msgSend_stringByDeletingPathExtension(v107, v103, v104, v105, v106);
        uint64_t v113 = sub_1DDBE6978(a1, v257, @"cam");
        if (v113)
        {
          v265 = v113;
          uint64_t v117 = objc_msgSend_valueForKeyPath_(v113, v114, @"version.minRawCameraVersion", v115, v116);
          int v118 = sub_1DDB42E64(v117);

          if (v254 < v118)
          {
            id v261 = 0;
            v263 = 0;
            uint64_t v122 = 0;
            goto LABEL_39;
          }
          objc_msgSend_valueForKeyPath_(v265, v119, @"version.cameraName", v120, v121);
          id v271 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v126 = objc_msgSend_valueForKeyPath_(v265, v123, @"alias", v124, v125);
          v263 = v126;
          if (v126)
          {
            uint64_t v130 = sub_1DDBE6978(a1, v126, @"cam");

            uint64_t v131 = (void *)v130;
          }
          else
          {
            uint64_t v131 = v265;
          }
          v265 = v131;
          uint64_t v132 = objc_msgSend_valueForKeyPath_(v131, v127, @"version.showInSystemProfiler", v128, v129);
          uint64_t v136 = objc_msgSend_valueForKeyPath_(v265, v133, @"rawImageClass.supportedMethods", v134, v135);
          uint64_t v140 = objc_msgSend_predicateWithBlock_(MEMORY[0x1E4F28F60], v137, (uint64_t)&unk_1F398DF90, v138, v139);
          id v261 = v132;
          uint64_t v122 = objc_msgSend_filteredArrayUsingPredicate_(v136, v141, (uint64_t)v140, v142, v143);

          if (v265 && v122 && v271 && (!v132 || objc_msgSend_BOOLValue(v132, v144, v145, v146, v147)))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v151 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1C978], v148, (uint64_t)v271, v149, v150);
            }
            else
            {
              uint64_t v151 = v271;
            }
            long long v284 = 0u;
            long long v285 = 0u;
            long long v282 = 0u;
            long long v283 = 0u;
            id v271 = v151;
            uint64_t v156 = objc_msgSend_countByEnumeratingWithState_objects_count_(v271, v152, (uint64_t)&v282, (uint64_t)v296, 16);
            if (v156)
            {
              uint64_t v157 = *(void *)v283;
              do
              {
                for (uint64_t k = 0; k != v156; ++k)
                {
                  if (*(void *)v283 != v157) {
                    objc_enumerationMutation(v271);
                  }
                  uint64_t v159 = *(void *)(*((void *)&v282 + 1) + 8 * k);
                  long long v164 = objc_msgSend_objectForKeyedSubscript_(v273, v153, v159, v154, v155);
                  if (!v164)
                  {
                    long long v164 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v160, v161, v162, v163);
                  }
                  objc_msgSend_addObjectsFromArray_(v164, v160, (uint64_t)v122, v162, v163);
                  long long v165 = (void *)MEMORY[0x1E4F1CA48];
                  uint64_t v169 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v166, (uint64_t)v164, v167, v168);
                  v174 = objc_msgSend_allObjects(v169, v170, v171, v172, v173);
                  v178 = objc_msgSend_arrayWithArray_(v165, v175, (uint64_t)v174, v176, v177);

                  objc_msgSend_sortUsingSelector_(v178, v179, (uint64_t)sel_compare_, v180, v181);
                  objc_msgSend_setObject_forKeyedSubscript_(v273, v182, (uint64_t)v178, v159, v183);
                }
                uint64_t v156 = objc_msgSend_countByEnumeratingWithState_objects_count_(v271, v153, (uint64_t)&v282, (uint64_t)v296, 16);
              }
              while (v156);
            }
          }
        }
        else
        {
          id v261 = 0;
          v263 = 0;
          uint64_t v122 = 0;
          v265 = 0;
LABEL_39:
          id v271 = 0;
        }
      }
      ++v268;
    }
    while (v268 != v259);
    uint64_t v184 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v103, (uint64_t)&v286, (uint64_t)v297, 16);
    uint64_t v259 = v184;
  }
  while (v184);
LABEL_65:

LABEL_66:
  if (v293) {
    sub_1DDA18310(v293);
  }
  id v185 = objc_alloc(MEMORY[0x1E4F77FB8]);
  v260 = objc_msgSend_initWithType_(v185, v186, qword_1EAB8AFA8, v187, v188);
  if (objc_msgSend_queryMetaDataSync(v260, v189, v190, v191, v192))
  {
    v262 = sub_1DDBBA928();
    if (os_log_type_enabled(v262, OS_LOG_TYPE_ERROR)) {
      sub_1DDBF5B04();
    }
  }
  else
  {
    long long v280 = 0u;
    long long v281 = 0u;
    long long v278 = 0u;
    long long v279 = 0u;
    v262 = objc_msgSend_results(v260, v193, v194, v195, v196);
    uint64_t v203 = objc_msgSend_countByEnumeratingWithState_objects_count_(v262, v202, (uint64_t)&v278, (uint64_t)v295, 16);
    if (v203)
    {
      uint64_t v264 = *(void *)v279;
      uint64_t v266 = v203;
      do
      {
        for (id m = 0; m != (id)v266; id m = (char *)m + 1)
        {
          if (*(void *)v279 != v264) {
            objc_enumerationMutation(v262);
          }
          v269 = objc_msgSend_attributes(*(void **)(*((void *)&v278 + 1) + 8 * (void)m), v204, v205, v206, v207);
          v211 = objc_msgSend_objectForKeyedSubscript_(v269, v208, @"showInSystemProfiler", v209, v210);
          int v216 = objc_msgSend_BOOLValue(v211, v212, v213, v214, v215);

          if (v216)
          {
            long long v276 = 0u;
            long long v277 = 0u;
            long long v274 = 0u;
            long long v275 = 0u;
            v220 = objc_msgSend_objectForKeyedSubscript_(v269, v217, @"cameraNames", v218, v219);
            uint64_t v225 = objc_msgSend_countByEnumeratingWithState_objects_count_(v220, v221, (uint64_t)&v274, (uint64_t)v294, 16);
            if (v225)
            {
              uint64_t v226 = *(void *)v275;
              do
              {
                for (uint64_t n = 0; n != v225; ++n)
                {
                  if (*(void *)v275 != v226) {
                    objc_enumerationMutation(v220);
                  }
                  uint64_t v228 = *(void *)(*((void *)&v274 + 1) + 8 * n);
                  v233 = objc_msgSend_objectForKeyedSubscript_(v273, v222, v228, v223, v224);
                  if (!v233)
                  {
                    v233 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v229, v230, v231, v232);
                  }
                  objc_msgSend_addObjectsFromArray_(v233, v229, MEMORY[0x1E4F1CBF0], v231, v232);
                  v234 = (void *)MEMORY[0x1E4F1CA48];
                  v238 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v235, (uint64_t)v233, v236, v237);
                  v243 = objc_msgSend_allObjects(v238, v239, v240, v241, v242);
                  v247 = objc_msgSend_arrayWithArray_(v234, v244, (uint64_t)v243, v245, v246);

                  objc_msgSend_sortUsingSelector_(v247, v248, (uint64_t)sel_compare_, v249, v250);
                  objc_msgSend_setObject_forKeyedSubscript_(v273, v251, (uint64_t)v247, v228, v252);
                }
                uint64_t v225 = objc_msgSend_countByEnumeratingWithState_objects_count_(v220, v222, (uint64_t)&v274, (uint64_t)v294, 16);
              }
              while (v225);
            }
          }
        }
        uint64_t v266 = objc_msgSend_countByEnumeratingWithState_objects_count_(v262, v204, (uint64_t)&v278, (uint64_t)v295, 16);
      }
      while (v266);
    }
  }

LABEL_95:

  return v273;
}

void sub_1DDBE7D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,std::__shared_weak_count *a56)
{
  if (a56) {
    sub_1DDA18310(a56);
  }
  _Unwind_Resume(a1);
}

id sub_1DDBE7FB4(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = sub_1DDA2E3A8(a1, a2, 0);
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)v5, v8, v9);

  return v10;
}

void sub_1DDBE802C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1DDBE8048(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, (uint64_t)a2, a4, a5);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  return v7;
}

void sub_1DDBE80A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DDBE80B4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend_hasSuffix_(v2, v3, @"p", v4, v5)) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = objc_msgSend_isEqualToString_(v2, v6, @"0", v7, v8) ^ 1;
  }

  return v9;
}

void sub_1DDBE810C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DDBE811C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F398DFC0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1DDBE813C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F398DFC0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1E01C3DC0);
}

uint64_t sub_1DDBE8190(uint64_t a1)
{
  return sub_1DDBE819C(a1 + 24);
}

uint64_t sub_1DDBE819C(uint64_t a1)
{
  id v2 = *(std::__shared_weak_count **)(a1 + 40);
  if (v2) {
    sub_1DDA18310(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 24);
  if (v3) {
    sub_1DDA18310(v3);
  }

  return a1;
}

void sub_1DDBE8204(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1DDBE8220(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_1DDBE82C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DDBE83F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DDBE8534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DDBE8664(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DDBE8728(void *a1)
{
  size_t v2 = sub_1DDBE87CC((uint64_t)a1);
  uint64_t v3 = sub_1DDBE8C18();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DDBE8E24;
  block[3] = &unk_1E6D04A58;
  void block[4] = a1;
  dispatch_barrier_sync(v3, block);

  return munmap(a1, v2);
}

unint64_t sub_1DDBE87CC(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  size_t v2 = sub_1DDBE8C18();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  _OWORD v5[2] = sub_1DDBE8C98;
  v5[3] = &unk_1E6D07398;
  v5[4] = &v6;
  void v5[5] = a1;
  dispatch_sync(v2, v5);

  unint64_t v3 = v7[3] & 0xFFFFFFFFFFFFF000;
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_1DDBE8890(void *a1)
{
  if (a1)
  {
    unint64_t v2 = sub_1DDBE87CC((uint64_t)a1);
    unint64_t v3 = v2 + sub_1DDBE9004() - 1;
    if (v3 / sub_1DDBE9004() - 16 >= 0x27F1)
    {
      sub_1DDBE8728(a1);
    }
    else
    {
      uint64_t v4 = sub_1DDBE8E5C();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1DDBE8EDC;
      block[3] = &unk_1E6D04A58;
      void block[4] = a1;
      dispatch_barrier_async(v4, block);
    }
  }
}

uint64_t *sub_1DDBE8958(uint64_t *a1, unsigned char *a2, int a3)
{
  uint64_t v5 = a1;
  if (a2) {
    *a2 = 0;
  }
  if (a1)
  {
    uint64_t v6 = (uint64_t)a1 + sub_1DDBE9004() - 1;
    size_t v7 = v6 & -sub_1DDBE9004();
    size_t v14 = v7;
    unint64_t v8 = v7 + sub_1DDBE9004() - 1;
    if (v8 / sub_1DDBE9004() - 16 < 0x27F1)
    {
      uint64_t v27 = 0;
      uint64_t v28 = &v27;
      uint64_t v29 = 0x2020000000;
      uint64_t v30 = 0;
      uint64_t v23 = 0;
      uint64_t v24 = &v23;
      uint64_t v25 = 0x2020000000;
      size_t v26 = v7;
      unint64_t v9 = (unint64_t)((double)(unint64_t)sub_1DDBE9004() + (double)v7 * 1.2);
      uint64_t v10 = sub_1DDBE8E5C();
      blocuint64_t k = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = sub_1DDBE909C;
      uint64_t v18 = &unk_1E6D073C0;
      uint64_t v21 = &v14;
      unint64_t v22 = v9;
      uint64_t v19 = &v27;
      uint64_t v20 = &v23;
      dispatch_barrier_sync(v10, &block);

      size_t v14 = v24[3];
      uint64_t v5 = (uint64_t *)v28[3];
      _Block_object_dispose(&v23, 8);
      _Block_object_dispose(&v27, 8);
      if (v5) {
        goto LABEL_10;
      }
    }
    if (a2) {
      *a2 = 1;
    }
    uint64_t v5 = (uint64_t *)mmap(0, v14, 3, 4098, 1325400066, 0);
    if (v5 == (uint64_t *)-1
      && (sub_1DDBE8BD0(), uint64_t v5 = (uint64_t *)mmap(0, v14, 3, 4098, 1325400066, 0), v5 == (uint64_t *)-1))
    {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "Unable to allocate memory. mmap() of %lu bytes failed. Aborting.\n", v14);
      sub_1DDBE9068();
      return 0;
    }
    else
    {
LABEL_10:
      size_t v11 = v14;
      uint64_t v12 = sub_1DDBE8C18();
      blocuint64_t k = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = sub_1DDBE9198;
      uint64_t v18 = &unk_1E6D073E0;
      uint64_t v19 = v5;
      uint64_t v20 = (uint64_t *)v11;
      BYTE4(v21) = 0;
      LODWORD(v21) = a3;
      dispatch_barrier_sync(v12, &block);
    }
  }
  return v5;
}

void sub_1DDBE8BD0()
{
  v0 = sub_1DDBE8E5C();
  dispatch_barrier_async(v0, &unk_1F398E058);
}

id sub_1DDBE8C18()
{
  v0 = &unk_1EAB91000;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB91330, memory_order_acquire) & 1) == 0)
  {
    int v3 = __cxa_guard_acquire(&qword_1EAB91330);
    v0 = (void *)&unk_1EAB91000;
    if (v3)
    {
      qword_1EAB91328 = (uint64_t)dispatch_queue_create("com.apple.rawcamera.FEVirtualMemory.PointerToInfo", MEMORY[0x1E4F14430]);
      __cxa_guard_release(&qword_1EAB91330);
      v0 = (void *)&unk_1EAB91000;
    }
  }
  CFDictionaryRef v1 = (void *)v0[101];

  return v1;
}

const void *sub_1DDBE8C98(uint64_t a1)
{
  CFDictionaryRef v2 = (const __CFDictionary *)sub_1DDBE8CD0();
  double result = CFDictionaryGetValue(v2, *(const void **)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_1DDBE8CD0()
{
  CFDictionaryKeyCallBacks keyCallBacks = *(CFDictionaryKeyCallBacks *)byte_1F398E000;
  CFDictionaryValueCallBacks v1 = *(CFDictionaryValueCallBacks *)byte_1F398E030;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB91340, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB91340))
  {
    qword_1EAB91338 = (uint64_t)CFDictionaryCreateMutable(0, 0, &keyCallBacks, &v1);
    __cxa_guard_release(&qword_1EAB91340);
  }
  return qword_1EAB91338;
}

void sub_1DDBE8D74(_Unwind_Exception *a1)
{
}

CFStringRef sub_1DDBE8D8C(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, @"%p", a1);
}

unint64_t sub_1DDBE8DC0(uint64_t a1)
{
  unint64_t v1 = 265 * ((~a1 + (a1 << 21)) ^ ((unint64_t)(~a1 + (a1 << 21)) >> 24));
  return 2147483649u * ((21 * (v1 ^ (v1 >> 14))) ^ ((21 * (v1 ^ (v1 >> 14))) >> 28));
}

CFStringRef sub_1DDBE8DEC(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, @"size=%ld", a1 & 0xFFFFFFFFFFFFF000);
}

void sub_1DDBE8E24(uint64_t a1)
{
  CFDictionaryRef v2 = (__CFDictionary *)sub_1DDBE8CD0();
  int v3 = *(const void **)(a1 + 32);

  CFDictionaryRemoveValue(v2, v3);
}

id sub_1DDBE8E5C()
{
  v0 = &unk_1EAB91000;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB91360, memory_order_acquire) & 1) == 0)
  {
    int v3 = __cxa_guard_acquire(&qword_1EAB91360);
    v0 = (void *)&unk_1EAB91000;
    if (v3)
    {
      qword_1EAB91358 = (uint64_t)dispatch_queue_create("com.apple.rawcamera.FEVirtualMemory.RecycleArray", MEMORY[0x1E4F14430]);
      __cxa_guard_release(&qword_1EAB91360);
      v0 = (void *)&unk_1EAB91000;
    }
  }
  unint64_t v1 = (void *)v0[107];

  return v1;
}

void sub_1DDBE8EDC(uint64_t a1)
{
  CFArrayRef v2 = (const __CFArray *)sub_1DDBE8F84();
  if (CFArrayGetCount(v2) >= 32)
  {
    do
    {
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(v2, 0);
      sub_1DDBE8728(ValueAtIndex);
      CFArrayRemoveValueAtIndex(v2, 0);
    }
    while (CFArrayGetCount(v2) > 31);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = 33;
  if (MEMORY[0x1E01C4A10](*MEMORY[0x1E4F14960], v4, 0, &v5)) {
    sub_1DDBE8728(*(void **)(a1 + 32));
  }
  else {
    CFArrayAppendValue(v2, *(const void **)(a1 + 32));
  }
}

uint64_t sub_1DDBE8F84()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB91370, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB91370))
  {
    qword_1EAB91368 = (uint64_t)CFArrayCreateMutable(0, 32, 0);
    __cxa_guard_release(&qword_1EAB91370);
  }
  return qword_1EAB91368;
}

void sub_1DDBE8FEC(_Unwind_Exception *a1)
{
}

uint64_t sub_1DDBE9004()
{
  v0 = &unk_1EAB91000;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB91350, memory_order_acquire) & 1) == 0)
  {
    int v2 = __cxa_guard_acquire(&qword_1EAB91350);
    v0 = (void *)&unk_1EAB91000;
    if (v2)
    {
      qword_1EAB91348 = getpagesize();
      __cxa_guard_release(&qword_1EAB91350);
      v0 = (void *)&unk_1EAB91000;
    }
  }
  return v0[105];
}

uint64_t sub_1DDBE9068()
{
  return printf("%d\n", *(_DWORD *)0xFFFFFFFFFFFFFFFFLL);
}

void sub_1DDBE909C(uint64_t a1)
{
  CFArrayRef v2 = (const __CFArray *)sub_1DDBE8F84();
  if (CFArrayGetCount(v2) >= 1)
  {
    CFIndex v3 = 0;
    uint64_t v4 = (unsigned int *)MEMORY[0x1E4F14960];
    do
    {
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(v2, v3);
      unint64_t v6 = sub_1DDBE87CC((uint64_t)ValueAtIndex);
      if (**(void **)(a1 + 48) <= v6)
      {
        unint64_t v7 = v6;
        if (v6 <= *(void *)(a1 + 56))
        {
          int v8 = 0;
          if (!MEMORY[0x1E01C4A10](*v4, ValueAtIndex, 0, &v8))
          {
            CFArrayRemoveValueAtIndex(v2, v3);
            *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ValueAtIndex;
            *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
            return;
          }
          sub_1DDBE8728(ValueAtIndex);
          CFArrayRemoveValueAtIndex(v2, v3--);
        }
      }
      ++v3;
    }
    while (v3 < CFArrayGetCount(v2));
  }
}

void sub_1DDBE9198(uint64_t a1)
{
  CFArrayRef v2 = (__CFDictionary *)sub_1DDBE8CD0();
  CFIndex v3 = *(const void **)(a1 + 32);
  uint64_t v4 = (const void *)(*(void *)(a1 + 40) | *(unsigned __int8 *)(a1 + 52) | *(unsigned int *)(a1 + 48));

  CFDictionarySetValue(v2, v3, v4);
}

uint64_t sub_1DDBE91E0()
{
  uint64_t result = sub_1DDBE8F84();
  if (result)
  {
    for (unint64_t i = (__CFArray *)result; ; CFArrayRemoveValueAtIndex(i, 0))
    {
      uint64_t result = CFArrayGetCount(i);
      if (!result) {
        break;
      }
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(i, 0);
      sub_1DDBE8728(ValueAtIndex);
    }
  }
  return result;
}

void sub_1DDBE92AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DDBE93DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DDBE94A0()
{
  return 0xFFFFLL;
}

void sub_1DDBE94A8(uint64_t a1)
{
  unint64_t v6 = &unk_1F39665D8;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 160))(&v4);
  uint64_t v1 = v4;
  sub_1DDA1A880(__p, "CaptureInfo");
  (*(void (**)(uint64_t, void **, void **, uint64_t))(*(void *)v1 + 600))(v1, __p, &v6, 3);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
  if (v5) {
    sub_1DDA18310(v5);
  }
}

void sub_1DDBE9588(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBE95B8()
{
  return 9;
}

uint64_t sub_1DDBE95C0(uint64_t a1)
{
  (*(void (**)(uint64_t))(*(void *)a1 + 432))(a1);
  int v3 = v2;
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 432))(a1);
  if ((v4 & 0x100000000) != 0) {
    int v5 = -11;
  }
  else {
    int v5 = -10;
  }
  int v6 = v5 + HIDWORD(v4);
  unsigned int v7 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 432))(a1);
  if (v6 * v3 >= 4001)
  {
    int v8 = v3 - 4000 / v6;
    if (v3 < 4000 / v6) {
      ++v8;
    }
    v7 += v8 >> 1;
  }
  return v7 | 0x500000000;
}

void sub_1DDBE96D4(_DWORD *a1)
{
  if (!a1[10])
  {
    sub_1DDA30F38(a1);
    if (a1[10] == 1)
    {
      sub_1DDBE972C((uint64_t)a1);
    }
  }
}

void sub_1DDBE972C(uint64_t a1)
{
  if (((*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(a1) & 1) == 0)
  {
    sub_1DDBE9930(a1, &v8);
    sub_1DDBEAEBC(v8, &v6);
    sub_1DDBE9A1C(a1, &v8, &v6);
    sub_1DDBE9DD4(a1);
    BOOL v4 = sub_1DDBEA140(v2, v3, &v6);
    sub_1DDBEA1B4(v4, v5, &v6);
    if (v7) {
      sub_1DDA18310(v7);
    }
    if (v9) {
      sub_1DDA18310(v9);
    }
  }
}

void sub_1DDBE97DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    sub_1DDA18310(a12);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBE9808(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *(const void **)a1;
  if (!*(void *)a1) {
    goto LABEL_14;
  }
  uint64_t v5 = (uint64_t *)__dynamic_cast(v3, (const struct __class_type_info *)&unk_1F395B2A0, (const struct __class_type_info *)&unk_1F398F228, 0);
  if (!v5)
  {
    unsigned int v7 = (uint64_t *)__dynamic_cast(v3, (const struct __class_type_info *)&unk_1F395B2A0, (const struct __class_type_info *)&unk_1F398EED0, 0);
    if (v7)
    {
      uint64_t v6 = *(std::__shared_weak_count **)(a1 + 8);
      if (v6) {
        atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      sub_1DDBF100C(v7, a2);
      goto LABEL_10;
    }
LABEL_14:
    *a2 = 0;
    a2[1] = 0;
    return;
  }
  uint64_t v6 = *(std::__shared_weak_count **)(a1 + 8);
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_1DDBF276C(v5, a2);
LABEL_10:
  if (v6)
  {
    sub_1DDA18310(v6);
  }
}

void sub_1DDBE9914(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_1DDA18310(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBE9930(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 160))(&v4);
  sub_1DDBE9808((uint64_t)&v4, a2);
  if (v5) {
    sub_1DDA18310(v5);
  }
  if (!*a2)
  {
    exceptiouint64_t n = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01C3B90](exception, "RawCameraException");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
}

void sub_1DDBE99E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1DDA18310(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBE9A1C(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  if (sub_1DDB71D10(*a3))
  {
    int v6 = *(unsigned __int8 *)(*a2 + 172);
    unsigned int v7 = *(_DWORD *)(*a2 + 144);
    uint64_t v41 = (void *)sub_1DDAD6FB0(*a2);
    sub_1DDA1B3CC(&v39, (unsigned int *)&v41);
    unsigned int v8 = v39;
    if (v39 >> 4 >= 0x271
      || (uint64_t v41 = (void *)sub_1DDAD6FB0(*a2),
          sub_1DDA1B3CC(&v39, (unsigned int *)&v41 + 1),
          int v9 = v39,
          v39 >> 4 >= 0x271))
    {
      exceptiouint64_t n = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1E01C3B90](exception, "RawCameraException");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    uint64_t v10 = (float *)*a3;
    uint64_t v41 = &unk_1F3984DB0;
    float v11 = v10[16];
    float v12 = v10[17];
    float v42 = v11;
    float v43 = v12;
    float v13 = v10[18];
    float v14 = v10[19];
    float v44 = v13;
    float v45 = v14;
    float v15 = v10[20];
    float v16 = v10[21];
    float v46 = v15;
    float v47 = v16;
    float v17 = v10[22];
    float v18 = v10[23];
    float v48 = v17;
    float v49 = v18;
    double v19 = *(double *)(*a2 + 176);
    if (v6) {
      float v20 = v11;
    }
    else {
      float v20 = v12;
    }
    if (v6) {
      float v21 = v13;
    }
    else {
      float v21 = v14;
    }
    if (v6) {
      float v22 = v15;
    }
    else {
      float v22 = v16;
    }
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a1 + 384))(&v39, a1);
    float v23 = v19;
    float v24 = v21 + (float)(v17 * (float)(v23 - v18));
    if (v24 >= 0.0) {
      unsigned int v25 = v7;
    }
    else {
      unsigned int v25 = 0;
    }
    if (v24 >= 0.0) {
      unsigned int v26 = v8;
    }
    else {
      unsigned int v26 = v7;
    }
    if (v25 >= v8 || v26 > v8 || v25 >= v26)
    {
      int v38 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1E01C3B90](v38, "RawCameraException");
      __cxa_throw(v38, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    float v27 = 0.0;
    if (*(int *)(*a2 + 72) >= 3) {
      float v27 = (float)*(unsigned int *)(*a2 + 116);
    }
    if (v9)
    {
      int v28 = 0;
      uint64_t v29 = v39;
      do
      {
        uint64_t v30 = sub_1DDAA7CC0(v29);
        uint64_t v29 = v39;
        uint64_t v32 = (_WORD *)(v30 + 2 * (*(_DWORD *)(v39 + 56) * v28));
        if (v24 >= 0.0)
        {
          unsigned int v36 = v26 - v7;
          if (v26 > v7)
          {
            do
            {
              LOWORD(v31) = *v32;
              float v31 = fminf(fmaxf((float)((float)(v20 + (float)(v24 * (float)((float)LODWORD(v31) - v27)))+ (float)((float)(v22 * (float)((float)LODWORD(v31) - v27))* (float)((float)LODWORD(v31) - v27)))+ (float)LODWORD(v31), 0.0), 65535.0);
              *v32++ = llroundf(v31);
              --v36;
            }
            while (v36);
          }
        }
        else
        {
          unsigned int v33 = v26;
          do
          {
            LOWORD(v31) = *v32;
            float v34 = (float)LODWORD(v31);
            float v35 = (float)(v20 + (float)(v24 * (float)(v34 - v27)))
                + (float)((float)(v22 * (float)(v34 - v27)) * (float)(v34 - v27));
            float v31 = fminf(fmaxf(v34 - (float)((float)(v35 * v34) / fmaxf(v35 + v34, 0.001)), 0.0), 65535.0);
            *v32++ = llroundf(v31);
            --v33;
          }
          while (v33);
        }
        ++v28;
      }
      while (v28 != v9);
    }
    if (v40) {
      sub_1DDA18310(v40);
    }
  }
}

void sub_1DDBE9D84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
}

void sub_1DDBE9DD4(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1F4188790](a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = v1;
  v31[0x4000] = *MEMORY[0x1E4F143B8];
  if (sub_1DDB71D20(*v2) && !*(unsigned char *)(*v5 + 172))
  {
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)v6 + 384))(&v29, v6);
    v31[0] = sub_1DDAD6FB0(*v5);
    sub_1DDA1B3CC(&__p, (unsigned int *)v31);
    int v7 = (int)__p;
    if (__p >> 4 >= 0x271)
    {
      exceptiouint64_t n = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1E01C3B90](exception, "RawCameraException");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    v31[0] = sub_1DDAD6FB0(*v5);
    sub_1DDA1B3CC(&__p, (unsigned int *)v31 + 1);
    int v8 = (int)__p;
    if (__p >> 4 >= 0x271)
    {
      unsigned int v25 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1E01C3B90](v25, "RawCameraException");
      __cxa_throw(v25, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (*(int *)(*v5 + 72) >= 3) {
      unsigned int v9 = *(_DWORD *)(*v5 + 116);
    }
    else {
      unsigned int v9 = 0;
    }
    uint64_t v10 = *v3;
    float v27 = 0;
    uint64_t v28 = 0;
    std::string __p = 0;
    sub_1DDA1D984(&__p, *(const void **)(v10 + 24), *(void *)(v10 + 32), (uint64_t)(*(void *)(v10 + 32) - *(void *)(v10 + 24)) >> 2);
    float v11 = __p;
    unint64_t v12 = v27 - (unsigned char *)__p;
    if (v27 == __p) {
      sub_1DDA24AD0();
    }
    if (v12 <= 4) {
      sub_1DDA24AD0();
    }
    if (v12 <= 8) {
      sub_1DDA24AD0();
    }
    if (v12 <= 0xC) {
      sub_1DDA24AD0();
    }
    uint64_t v13 = 0;
    float v15 = *(float *)__p;
    float v16 = *((float *)__p + 1);
    float v17 = *((float *)__p + 2);
    float v18 = *((float *)__p + 3);
    do
    {
      float v14 = (float)v9;
      *((_WORD *)v31 + v13) = llroundf(fminf(fmaxf((float)((float)((float)(v15 + (float)(v16 * (float)((float)v13 - v14)))+ (float)((float)(v17 * (float)((float)v13 - v14))* (float)((float)v13 - v14)))+ (float)((float)((float)((float)v13 - v14)* (float)(v18 * (float)((float)v13 - v14)))* (float)((float)v13 - v14)))+ (float)v13, 0.0), 65535.0));
      ++v13;
    }
    while (v13 != 0x10000);
    if (v8)
    {
      int v19 = 0;
      uint64_t v20 = v29;
      do
      {
        uint64_t v21 = sub_1DDAA7CC0(v20);
        uint64_t v20 = v29;
        if (v7)
        {
          float v22 = (_WORD *)(v21 + 2 * (*(_DWORD *)(v29 + 56) * v19));
          int v23 = v7;
          do
          {
            _WORD *v22 = *((_WORD *)v31 + (unsigned __int16)*v22);
            ++v22;
            --v23;
          }
          while (v23);
        }
        ++v19;
      }
      while (v19 != v8);
      float v11 = __p;
    }
    if (v11)
    {
      float v27 = v11;
      operator delete(v11);
    }
    if (v30) {
      sub_1DDA18310(v30);
    }
  }
}

void sub_1DDBEA0D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, std::__shared_weak_count *a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a13) {
    sub_1DDA18310(a13);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_1DDBEA140(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  BOOL result = sub_1DDB71D34(*a3);
  if (result)
  {
    exceptiouint64_t n = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01C3B90](exception, "RawCameraException");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  return result;
}

void sub_1DDBEA1A0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL sub_1DDBEA1B4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  BOOL result = sub_1DDB71D44(*a3);
  if (result)
  {
    exceptiouint64_t n = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01C3B90](exception, "RawCameraException");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  return result;
}

void sub_1DDBEA214(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

id sub_1DDBEA228(uint64_t a1, void *a2)
{
  uint64_t v2 = sub_1DDBCE65C(a1, a2);

  return v2;
}

uint64_t sub_1DDBEA254@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  uint64_t v4 = (char *)operator new(0xD8uLL);
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *(void *)uint64_t v4 = &unk_1F398EC38;
  *((void *)v4 + 10) = 0;
  *((void *)v4 + 11) = 0;
  *((void *)v4 + 9) = 0;
  *(_OWORD *)(v4 + 40) = 0u;
  *(_OWORD *)(v4 + 52) = 0u;
  *(_OWORD *)(v4 + 24) = 0u;
  *((void *)v4 + 12) = 0xFFFFFFFFLL;
  *((_DWORD *)v4 + 26) = 0;
  *((_OWORD *)v4 + 7) = 0u;
  *((_OWORD *)v4 + 8) = 0u;
  *((_OWORD *)v4 + 9) = 0u;
  *(_OWORD *)(v4 + 156) = 0u;
  *((void *)v4 + 22) = 0;
  *((void *)v4 + 23) = 0;
  *(void *)(v4 + 189) = 0;
  *((void *)v4 + 25) = 0x4039000000000000;
  *a2 = v4 + 24;
  a2[1] = v4;
  return sub_1DDBEA320((uint64_t *)v4 + 3, a1);
}

void sub_1DDBEA2F8(void *a1)
{
}

void sub_1DDBEA308(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    sub_1DDA18310(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBEA320(uint64_t *a1, uint64_t *a2)
{
  int v4 = (*(uint64_t (**)(void))(*(void *)*a2 + 48))();
  LODWORD(v17[0]) = sub_1DDA19CA4(*a2);
  LODWORD(v19[0]) = v4;
  LODWORD(v19[0]) = *sub_1DDA1A378(v19, v17);
  sub_1DDA49398((uint64_t)v20, a2, v19);
  int v5 = sub_1DDA19EC8(*a2);
  if (v5 != 1229539657 && v5 != 1296911693)
  {
    exceptiouint64_t n = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01C3B90](exception, "RawCameraException");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  if (v5 == 1296911693) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  *a1 = v7;
  sub_1DDA29F88(v19, a2, v7);
  int v8 = sub_1DDA19EC8(*a2);
  int v18 = sub_1DDA19EC8(*a2);
  if (v8 != 1382119235 && v8 != 1382119252)
  {
    float v15 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01C3B90](v15, "RawCameraException");
    __cxa_throw(v15, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  sub_1DDA18410(&v16, &v18);
  sub_1DDA1A94C(v17, a2, (uint64_t)&v16, 0);
  unsigned int v9 = sub_1DDA19EC8(*a2);
  sub_1DDA19EC8(*a2);
  if (v9 > 0x1FF)
  {
    uint64_t v13 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01C3B90](v13, "RawCameraException");
    __cxa_throw(v13, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  for (; v9; --v9)
  {
    int v10 = sub_1DDA19EC8(*a2);
    sub_1DDA19EC8(*a2);
    int v16 = sub_1DDA19EC8(*a2);
    int v11 = sub_1DDA19EC8(*a2);
    sub_1DDBEA60C(a1, v10, (unsigned int *)&v16, v11, a2);
  }
  sub_1DDA1AA18(v17);
  sub_1DDA2A000(v19);
  return sub_1DDA49424((uint64_t)v20);
}

void sub_1DDBEA580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  __cxa_free_exception(v15);
  sub_1DDA2A000(&a15);
  sub_1DDA49424(v16 - 56);
  _Unwind_Resume(a1);
}

uint64_t *sub_1DDBEA60C(uint64_t *result, int a2, unsigned int *a3, int a4, uint64_t *a5)
{
  uint64_t v7 = result;
  int v51 = a4;
  if (a2 <= 527)
  {
    switch(a2)
    {
      case 256:
        if (a4 == 2) {
          int v8 = 8;
        }
        else {
          int v8 = 1;
        }
        *((_DWORD *)result + 46) = v8;
        return result;
      case 257:
      case 258:
      case 260:
      case 262:
      case 273:
        return result;
      case 259:
        *((float *)result + 42) = *(float *)&a4;
        return result;
      case 261:
        *((float *)result + 20) = *(float *)&a4;
        return result;
      case 263:
        float v42 = (void **)(result + 11);
        if (result[12] != result[11]) {
          return result;
        }
        sub_1DDA18410((int *)__p, &v51);
        sub_1DDA1A94C(v50, a5, (uint64_t)__p, 0);
        sub_1DDA3ECC0(v42, 3uLL);
        *(double *)std::string __p = COERCE_FLOAT(sub_1DDA19EC8(*a5));
        sub_1DDBEADA4((uint64_t)v42, __p);
        *(double *)std::string __p = COERCE_FLOAT(sub_1DDA19EC8(*a5));
        sub_1DDBEADA4((uint64_t)v42, __p);
        *(double *)std::string __p = COERCE_FLOAT(sub_1DDA19EC8(*a5));
        sub_1DDBEADA4((uint64_t)v42, __p);
        return sub_1DDA1AA18(v50);
      case 264:
        *((float *)result + 2) = *(float *)&a4;
        if (a4 <= 0) {
          goto LABEL_83;
        }
        return result;
      case 265:
        *((float *)result + 3) = *(float *)&a4;
        if (a4 <= 0) {
          goto LABEL_83;
        }
        return result;
      case 266:
        *((float *)result + 4) = *(float *)&a4;
        if (a4 <= 0) {
          goto LABEL_83;
        }
        return result;
      case 267:
        *((float *)result + 5) = *(float *)&a4;
        if (a4 <= 0) {
          goto LABEL_83;
        }
        return result;
      case 268:
        *((float *)result + 6) = *(float *)&a4;
        if (a4 <= 0) {
          goto LABEL_83;
        }
        return result;
      case 269:
        *((float *)result + 7) = *(float *)&a4;
        if (a4 <= 0)
        {
LABEL_83:
          exceptiouint64_t n = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x1E01C3B90](exception, "RawCameraException");
          __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        return result;
      case 270:
        *((float *)result + 18) = *(float *)&a4;
        return result;
      case 271:
        LODWORD(v50[0]) = sub_1DDA19CA4(*a5);
        LODWORD(v50[0]) = *sub_1DDA2A648((int *)v50, (unsigned int *)&v51);
        BOOL result = (uint64_t *)sub_1DDA456E8((unsigned int *)v50);
        v7[4] = result;
        *((_DWORD *)v7 + 10) = *a3;
        return result;
      case 272:
        sub_1DDA18410((int *)__p, &v51);
        sub_1DDA1A94C(v50, a5, (uint64_t)__p, 0);
        sub_1DDB70CFC(a5, __p);
        long long v43 = *(_OWORD *)__p;
        __p[0] = 0;
        __p[1] = 0;
        float v44 = (std::__shared_weak_count *)v7[20];
        *(_OWORD *)(v7 + 19) = v43;
        if (v44)
        {
          sub_1DDA18310(v44);
          if (__p[1]) {
            sub_1DDA18310((std::__shared_weak_count *)__p[1]);
          }
        }
        return sub_1DDA1AA18(v50);
      case 274:
        uint64_t v45 = *a5;
        LODWORD(v50[0]) = -4;
        (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)v45 + 40))(v45, v50, 1);
        *((_WORD *)v7 + 56) = sub_1DDA19E68(*a5);
        BOOL result = (uint64_t *)sub_1DDA19E68(*a5);
        *((_WORD *)v7 + 57) = (_WORD)result;
        return result;
      default:
        if (a2 == 523) {
          *((unsigned char *)result + 172) = a4 != 0;
        }
        return result;
    }
  }
  if (a2 > 767)
  {
    if (a2 == 768)
    {
      *((float *)result + 19) = *(float *)&a4;
    }
    else if (a2 == 769)
    {
      sub_1DDA18410((int *)__p, &v51);
      sub_1DDA1A94C(v50, a5, (uint64_t)__p, 0);
      if (*a3 <= 0x95)
      {
        __p[0] = 0;
        __p[1] = 0;
        uint64_t v48 = 0;
        sub_1DDA1A0CC(*a5, a3, (uint64_t)__p);
        if (SHIBYTE(v48) < 0) {
          operator delete(__p[0]);
        }
      }
      return sub_1DDA1AA18(v50);
    }
  }
  else
  {
    switch(a2)
    {
      case 540:
        sub_1DDA18410((int *)__p, &v51);
        sub_1DDA1A94C(v50, a5, (uint64_t)__p, 0);
        int v49 = 4;
        LODWORD(__p[0]) = *a3;
        unint64_t v9 = *sub_1DDAA99E4(__p, &v49);
        int v10 = (void **)(v7 + 6);
        sub_1DDA490A4((void **)v7 + 6, v9);
        if (v9)
        {
          int v11 = 0;
          do
          {
            int v12 = sub_1DDA19EC8(*a5);
            int v13 = v12;
            float v15 = (char *)v7[7];
            unint64_t v14 = v7[8];
            if ((unint64_t)v15 >= v14)
            {
              float v17 = (char *)*v10;
              uint64_t v18 = (v15 - (unsigned char *)*v10) >> 2;
              unint64_t v19 = v18 + 1;
              if ((unint64_t)(v18 + 1) >> 62) {
                sub_1DDA17F78();
              }
              uint64_t v20 = v14 - (void)v17;
              if (v20 >> 1 > v19) {
                unint64_t v19 = v20 >> 1;
              }
              if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v21 = v19;
              }
              if (v21)
              {
                float v22 = (char *)sub_1DDA17F90((uint64_t)(v7 + 8), v21);
                float v17 = (char *)v7[6];
                float v15 = (char *)v7[7];
              }
              else
              {
                float v22 = 0;
              }
              int v23 = &v22[4 * v18];
              *(_DWORD *)int v23 = v13;
              uint64_t v16 = v23 + 4;
              while (v15 != v17)
              {
                int v24 = *((_DWORD *)v15 - 1);
                v15 -= 4;
                *((_DWORD *)v23 - 1) = v24;
                v23 -= 4;
              }
              v7[6] = (uint64_t)v23;
              v7[7] = (uint64_t)v16;
              v7[8] = (uint64_t)&v22[4 * v21];
              if (v17) {
                operator delete(v17);
              }
            }
            else
            {
              *(_DWORD *)float v15 = v12;
              uint64_t v16 = v15 + 4;
            }
            v7[7] = (uint64_t)v16;
            ++v11;
          }
          while (v11 != v9);
        }
        return sub_1DDA1AA18(v50);
      case 541:
        *((float *)result + 29) = *(float *)&a4;
        break;
      case 542:
      case 543:
      case 544:
      case 545:
        return result;
      case 546:
        *((float *)result + 36) = *(float *)&a4;
        break;
      case 547:
        sub_1DDA18410((int *)__p, &v51);
        sub_1DDA1A94C(v50, a5, (uint64_t)__p, 0);
        int v49 = 2;
        LODWORD(__p[0]) = *a3;
        unint64_t v25 = *sub_1DDAA99E4(__p, &v49);
        unsigned int v26 = (void **)(v7 + 15);
        sub_1DDA3F190((void **)v7 + 15, v25);
        if (v25)
        {
          int v27 = 0;
          do
          {
            __int16 v28 = sub_1DDA19FB0(*a5);
            __int16 v29 = v28;
            float v31 = (char *)v7[16];
            unint64_t v30 = v7[17];
            if ((unint64_t)v31 >= v30)
            {
              unsigned int v33 = (char *)*v26;
              uint64_t v34 = v31 - (unsigned char *)*v26;
              if (v34 <= -3) {
                sub_1DDA17F78();
              }
              uint64_t v35 = v34 >> 1;
              unint64_t v36 = v30 - (void)v33;
              if (v36 <= (v34 >> 1) + 1) {
                unint64_t v37 = v35 + 1;
              }
              else {
                unint64_t v37 = v36;
              }
              if (v36 >= 0x7FFFFFFFFFFFFFFELL) {
                uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                uint64_t v38 = v37;
              }
              if (v38)
              {
                uint64_t v39 = (char *)sub_1DDA1AD0C((uint64_t)(v7 + 17), v38);
                unsigned int v33 = (char *)v7[15];
                float v31 = (char *)v7[16];
              }
              else
              {
                uint64_t v39 = 0;
              }
              uint64_t v40 = &v39[2 * v35];
              *(_WORD *)uint64_t v40 = v29;
              uint64_t v32 = v40 + 2;
              while (v31 != v33)
              {
                __int16 v41 = *((_WORD *)v31 - 1);
                v31 -= 2;
                *((_WORD *)v40 - 1) = v41;
                v40 -= 2;
              }
              v7[15] = (uint64_t)v40;
              v7[16] = (uint64_t)v32;
              v7[17] = (uint64_t)&v39[2 * v38];
              if (v33) {
                operator delete(v33);
              }
            }
            else
            {
              *(_WORD *)float v31 = v28;
              uint64_t v32 = v31 + 2;
            }
            v7[16] = (uint64_t)v32;
            ++v27;
          }
          while (v27 != v25);
        }
        return sub_1DDA1AA18(v50);
      default:
        if (a2 == 528) {
          *((double *)result + 22) = *(float *)&a4;
        }
        break;
    }
  }
  return result;
}

void sub_1DDBEAC88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16)
{
}

void sub_1DDBEADA4(uint64_t a1, void *a2)
{
  uint64_t v4 = a1 + 16;
  unint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void **)(a1 + 8);
  if ((unint64_t)v6 >= v5)
  {
    int v8 = *(void **)a1;
    uint64_t v9 = ((uint64_t)v6 - *(void *)a1) >> 3;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61) {
      sub_1DDA17F78();
    }
    uint64_t v11 = v5 - (void)v8;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      int v13 = (char *)sub_1DDA1814C(v4, v12);
      int v8 = *(void **)a1;
      uint64_t v6 = *(void **)(a1 + 8);
    }
    else
    {
      int v13 = 0;
    }
    unint64_t v14 = &v13[8 * v9];
    float v15 = &v13[8 * v12];
    *(void *)unint64_t v14 = *a2;
    uint64_t v7 = v14 + 8;
    while (v6 != v8)
    {
      uint64_t v16 = *--v6;
      *((void *)v14 - 1) = v16;
      v14 -= 8;
    }
    *(void *)a1 = v14;
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    void *v6 = *a2;
    uint64_t v7 = v6 + 1;
  }
  *(void *)(a1 + 8) = v7;
}

uint64_t sub_1DDBEAE8C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 80);
}

uint64_t sub_1DDBEAE94(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t sub_1DDBEAE9C(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t sub_1DDBEAEA8()
{
  return 2492765332;
}

uint64_t sub_1DDBEAEB4()
{
  return 0xFFFFLL;
}

uint64_t sub_1DDBEAEBC@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(result + 152);
  if (!v2)
  {
    exceptiouint64_t n = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01C3B90](exception, "RawCameraException");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  uint64_t v3 = *(void *)(result + 160);
  *a2 = v2;
  a2[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1DDBEAF30(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_1DDBEAF44(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F398EC38;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1DDBEAF64(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F398EC38;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1E01C3DC0);
}

void *sub_1DDBEAFB8(uint64_t a1)
{
  return sub_1DDBEAFC4((void *)(a1 + 24));
}

void *sub_1DDBEAFC4(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[20];
  if (v2) {
    sub_1DDA18310(v2);
  }
  uint64_t v3 = (void *)a1[15];
  if (v3)
  {
    a1[16] = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)a1[11];
  if (v4)
  {
    a1[12] = v4;
    operator delete(v4);
  }
  unint64_t v5 = (void *)a1[6];
  if (v5)
  {
    a1[7] = v5;
    operator delete(v5);
  }
  return a1;
}

double sub_1DDBEB024(_DWORD *a1, unsigned int a2, unsigned int a3)
{
  sub_1DDBEB19C(a1, a2);
  int v7 = (int)v6;
  if (a2) {
    BOOL v8 = a2 % 3 < 2;
  }
  else {
    BOOL v8 = 0;
  }
  unsigned int v9 = a1[58];
  if (a1[60])
  {
    unsigned int v10 = v8 | (2 * (((int)(a2 - 1) / 3) & ~(((int)(a2 - 1) / 3) >> 31)));
    if (a3 % v9) {
      int v11 = dword_1DDC0CDB0[v10];
    }
    else {
      int v11 = 0;
    }
    int v12 = v11 + v7;
    if (a3 % v9 == v9 - 1) {
      int v13 = 0;
    }
    else {
      int v13 = dword_1DDC0CDC8[6 * ((a1[52] >> 1) & ~(-1 << a1[54])) + v10];
    }
    return (double)(v12 + v13);
  }
  return (double)v7;
}

double sub_1DDBEB19C(_DWORD *a1, int a2)
{
  int v2 = a1[54];
  unsigned int v3 = a1[52] >> 1;
  unsigned int v4 = a1[53] >> 1;
  if (v2)
  {
    unsigned int v5 = v2 - (a2 + 2) / 3u;
    unsigned int v6 = v2 - 1;
    if (v5 < v6) {
      unsigned int v6 = v5;
    }
    int v7 = ~v6;
    do
    {
      unsigned int v3 = (v3 & 1) + (v3 >> 1);
      unsigned int v4 = (v4 & 1) + (v4 >> 1);
    }
    while (!__CFADD__(v7++, 1));
  }
  return 0.0;
}

void sub_1DDBEB258(_DWORD *a1@<X0>, void *a2@<X1>, void *a3@<X2>, unsigned int a4@<W3>, unsigned int a5@<W4>, uint64_t a6@<X8>)
{
  id v11 = a2;
  id v12 = a3;
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v11, v13, @"subband_headers", v14, v15);
  uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v11, v17, @"dc_mode", v18, v19);
  int v25 = objc_msgSend_intValue(v20, v21, v22, v23, v24);

  __int16 v29 = objc_msgSend_objectAtIndexedSubscript_(v16, v26, a5, v27, v28);
  if (!v29)
  {
    exceptiouint64_t n = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01C3B90](exception, "RawCameraException");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  *(void *)(a6 + 48) = 0;
  *(void *)(a6 + 56) = 0;
  *(void *)(a6 + 64) = 0;
  double v30 = sub_1DDBEB024(a1, a5, a4);
  double v32 = v31;
  *(double *)(a6 + 32) = v30;
  *(double *)(a6 + 40) = v31;
  *(double *)a6 = sub_1DDBEB19C(a1, a5);
  *(void *)(a6 + 8) = v33;
  *(void *)(a6 + 16) = v34;
  *(void *)(a6 + 24) = v35;
  sub_1DDB032DC(a6 + 48, v30 * v32);
  if (a5) {
    BOOL v39 = 0;
  }
  else {
    BOOL v39 = v25 == 1;
  }
  int v40 = v39;
  __int16 v41 = objc_msgSend_objectForKeyedSubscript_(v29, v36, @"stuffing_data_length", v37, v38);
  objc_msgSend_unsignedIntValue(v41, v42, v43, v44, v45);

  sub_1DDBEDBEC(v40, v30, v32, v12, (uint64_t *)(a6 + 48), 0);
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  std::string __p = 0;
  sub_1DDA1D908(&__p, *(const void **)(a6 + 48), *(void *)(a6 + 56), (uint64_t)(*(void *)(a6 + 56) - *(void *)(a6 + 48)) >> 1);
  if (__p)
  {
    uint64_t v48 = __p;
    operator delete(__p);
  }
}

void sub_1DDBEB440(_Unwind_Exception *a1)
{
  unsigned int v9 = *v6;
  if (*v6)
  {
    *(void *)(v5 + 56) = v9;
    operator delete(v9);
  }

  _Unwind_Resume(a1);
}

void sub_1DDBEB4AC(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, void *a4@<X3>, void *a5@<X4>, long long *a6@<X8>)
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v169 = a5;
  __int16 v170 = v12;
  uint64_t v173 = a1;
  LODWORD(a5) = *(_DWORD *)(a1 + 216);
  uint64_t v177 = objc_msgSend_objectForKeyedSubscript_(v10, v13, @"subband_headers", v14, v15);
  uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v12, v16, @"tile_index", v17, v18);
  unsigned int v172 = objc_msgSend_unsignedIntValue(v19, v20, v21, v22, v23);
  unint64_t v24 = (3 * a5 + 1);

  sub_1DDBEE41C(v193, v24);
  v175 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v25, v26, v27, v28);
  if (3 * a5 != -1)
  {
    uint64_t v32 = 0;
    unsigned int v33 = 0;
    do
    {
      uint64_t v34 = objc_msgSend_objectAtIndexedSubscript_(v177, v29, v32, v30, v31);
      uint64_t v38 = objc_msgSend_objectForKeyedSubscript_(v34, v35, @"subband_data_length", v36, v37);
      unsigned int v43 = objc_msgSend_unsignedIntValue(v38, v39, v40, v41, v42);

      float v46 = objc_msgSend_subdataWithRange_(v11, v44, v33, v43, v45);
      objc_msgSend_addObject_(v175, v47, (uint64_t)v46, v48, v49);

      v33 += v43;
      ++v32;
    }
    while (v24 != v32);
    uint64_t v50 = 0;
    uint64_t v51 = 48;
    do
    {
      uint64_t v52 = objc_msgSend_objectAtIndexedSubscript_(v175, v29, v50, v30, v31);
      sub_1DDBEB258((_DWORD *)v173, v10, v52, v172, v50, (uint64_t)&v188);
      uint64_t v53 = v193[0] + v51;
      long long v54 = v190;
      long long v55 = v188;
      *(_OWORD *)(v53 - 32) = v189;
      *(_OWORD *)(v53 - 16) = v54;
      *(_OWORD *)(v53 - 48) = v55;
      uint64_t v56 = *(void **)v53;
      if (*(void *)v53)
      {
        *(void *)(v53 + 8) = v56;
        operator delete(v56);
        *(void *)uint64_t v53 = 0;
        *(void *)(v53 + 8) = 0;
        *(void *)(v53 + 16) = 0;
      }
      *(_OWORD *)uint64_t v53 = v191;
      *(void *)(v53 + 16) = v192;
      long long v191 = 0uLL;
      uint64_t v192 = 0;

      ++v50;
      v51 += 72;
    }
    while (v24 != v50);
  }
  uint64_t v57 = objc_msgSend_objectForKeyedSubscript_(*(void **)(v173 + 200), v29, @"version", v30, v31);
  int v62 = objc_msgSend_unsignedIntValue(v57, v58, v59, v60, v61);

  if (v62 == 512)
  {
    uint64_t v66 = objc_msgSend_objectForKeyedSubscript_(*(void **)(v173 + 200), v63, @"tile_width", v64, v65);
    unsigned int v71 = objc_msgSend_unsignedIntValue(v66, v67, v68, v69, v70);

    uint64_t v75 = objc_msgSend_objectForKeyedSubscript_(*(void **)(v173 + 200), v72, @"tile_height", v73, v74);
    unsigned int v80 = objc_msgSend_unsignedIntValue(v75, v76, v77, v78, v79);
    id v167 = v10;

    if ((v71 & 0xF) != 0) {
      unsigned int v81 = (v71 >> 4) + 1;
    }
    else {
      unsigned int v81 = v71 >> 4;
    }
    if ((v80 & 3) != 0) {
      int v82 = (v80 >> 2) + 1;
    }
    else {
      int v82 = v80 >> 2;
    }
    long long v188 = 0uLL;
    *(void *)&long long v189 = 0;
    sub_1DDB032DC((uint64_t)&v188, v82 * v81);
    uint64_t v86 = objc_msgSend_objectForKeyedSubscript_(v170, v83, @"qp_stuffing_data_length", v84, v85);
    objc_msgSend_unsignedIntValue(v86, v87, v88, v89, v90);

    sub_1DDBEDBEC(1, v81, v82, v169, (uint64_t *)&v188, 1);
    unint64_t v171 = v24;
    if (v24)
    {
      unint64_t v91 = 0;
      unsigned int v92 = v82 - 1;
      do
      {
        uint64_t v93 = v193[0] + 72 * v91;
        uint64_t v94 = *(double *)(v93 + 32);
        uint64_t v95 = *(double *)(v93 + 40);
        uint64_t v96 = *(void *)(v93 + 48);
        if (v91 >= 7) {
          int v97 = 1;
        }
        else {
          int v97 = 2;
        }
        unint64_t v176 = v91;
        if (v91 >= 4) {
          int v98 = v97;
        }
        else {
          int v98 = 4;
        }
        sub_1DDA4A3A0(v187, v95 * (unint64_t)v94);
        if (v94)
        {
          uint64_t v101 = 0;
          char v102 = v176 < 7;
          if (v176 < 7) {
            char v103 = 1;
          }
          else {
            char v103 = 2;
          }
          if (v176 < 4)
          {
            char v102 = 2;
            char v103 = 0;
          }
          uint64_t v104 = v188;
          uint64_t v105 = v187[0];
          do
          {
            if (v95)
            {
              for (uint64_t i = 0; i != v95; ++i)
              {
                unsigned int v107 = 0;
                unsigned int v108 = i << v102;
                int v109 = v98;
                do
                {
                  if (v92 >= v108) {
                    unsigned int v110 = v108;
                  }
                  else {
                    unsigned int v110 = v92;
                  }
                  v107 += *(__int16 *)(v104 + 2 * ((v101 >> v103) + v110 * v81));
                  ++v108;
                  --v109;
                }
                while (v109);
                v105[v101 + i * v94] = v107 >> v102;
              }
            }
            ++v101;
          }
          while (v101 != v94);
        }
        objc_msgSend_stringWithFormat_(NSString, (const char *)v176, @"subband_%d", v99, v100, v176);

        uint64_t v114 = objc_msgSend_objectAtIndexedSubscript_(v177, v111, v176, v112, v113);
        int v118 = objc_msgSend_objectForKeyedSubscript_(v114, v115, @"mtx_a", v116, v117);
        int v123 = objc_msgSend_intValue(v118, v119, v120, v121, v122);

        v174 = objc_msgSend_objectAtIndexedSubscript_(v177, v124, v176, v125, v126);
        uint64_t v130 = objc_msgSend_objectForKeyedSubscript_(v174, v127, @"mtx_b", v128, v129);
        int v135 = objc_msgSend_intValue(v130, v131, v132, v133, v134);

        if (v94)
        {
          uint64_t v136 = 0;
          v137 = (char *)v187[0];
          do
          {
            if (v95)
            {
              uint64_t v138 = 0;
              uint64_t v139 = v95;
              do
              {
                int v140 = v135 + ((dword_1DDC0CE88[*(__int16 *)&v137[v138]] * v123) >> 3);
                if (v140 >= 1474560) {
                  int v140 = 1474560;
                }
                if (v140 <= 1) {
                  LOWORD(v140) = 1;
                }
                *(_WORD *)(v96 + v138) *= (_WORD)v140;
                v138 += 2 * v94;
                --v139;
              }
              while (v139);
            }
            ++v136;
            v137 += 2;
            v96 += 2;
          }
          while (v136 != v94);
        }
        uint64_t v141 = v193[0] + 72 * v176;
        long long v143 = *(_OWORD *)(v141 + 16);
        long long v142 = *(_OWORD *)(v141 + 32);
        long long v181 = *(_OWORD *)v141;
        long long v182 = v143;
        long long v183 = v142;
        id v185 = 0;
        uint64_t v186 = 0;
        std::string __p = 0;
        sub_1DDA1D908(&__p, *(const void **)(v141 + 48), *(void *)(v141 + 56), (uint64_t)(*(void *)(v141 + 56) - *(void *)(v141 + 48)) >> 1);
        if (__p)
        {
          id v185 = __p;
          operator delete(__p);
        }
        if (v187[0])
        {
          v187[1] = v187[0];
          operator delete(v187[0]);
        }
        unint64_t v91 = v176 + 1;
      }
      while (v176 + 1 != v171);
    }
    if ((void)v188)
    {
      *((void *)&v188 + 1) = v188;
      operator delete((void *)v188);
    }
    id v10 = v167;
  }
  else if (v24)
  {
    for (uint64_t j = 0; j != v24; ++j)
    {
      uint64_t v145 = objc_msgSend_objectAtIndexedSubscript_(v177, v63, j, v64, v65);
      uint64_t v149 = objc_msgSend_objectForKeyedSubscript_(v145, v146, @"ini_qp", v147, v148);
      int v154 = objc_msgSend_intValue(v149, v150, v151, v152, v153);

      uint64_t v155 = v193[0];
      if ((unint64_t)(v154 - 10) <= 0x75)
      {
        uint64_t v156 = v193[0] + 72 * j;
        uint64_t v157 = ((int)*(double *)(v156 + 40) * (int)*(double *)(v156 + 32));
        if ((int)v157 >= 1)
        {
          int v158 = dword_1DDC0CE88[v154];
          uint64_t v159 = *(_WORD **)(v156 + 48);
          do
          {
            *v159++ *= (_WORD)v158;
            --v157;
          }
          while (v157);
        }
      }
      v179 = 0;
      uint64_t v180 = 0;
      v178 = 0;
      sub_1DDA1D908(&v178, *(const void **)(v155 + 72 * j + 48), *(void *)(v155 + 72 * j + 56), (uint64_t)(*(void *)(v155 + 72 * j + 56) - *(void *)(v155 + 72 * j + 48)) >> 1);
      if (v178)
      {
        v179 = v178;
        operator delete(v178);
      }
    }
  }
  id v160 = (long long *)v193[0];
  uint64_t v161 = objc_msgSend_objectForKeyedSubscript_(v10, v63, @"plane_index", v64, v65);
  uint64_t v166 = objc_msgSend_unsignedIntValue(v161, v162, v163, v164, v165);
  sub_1DDBEBCE8((_DWORD *)v173, v160, v172, v166, a6);

  *(void *)&long long v188 = v193;
  sub_1DDBEE56C((void ***)&v188);
}

void sub_1DDBEBB90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,void *a22)
{
  int v25 = *(void **)(v23 - 184);
  if (v25)
  {
    *(void *)(v23 - 176) = v25;
    operator delete(v25);
  }

  *(void *)(v23 - 184) = v23 - 112;
  sub_1DDBEE56C((void ***)(v23 - 184));

  _Unwind_Resume(a1);
}

void sub_1DDBEBCE8(_DWORD *a1@<X0>, long long *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, long long *a5@<X8>)
{
  int v7 = a5;
  long long v8 = a2[1];
  *a5 = *a2;
  a5[1] = v8;
  a5[2] = a2[2];
  *((void *)a5 + 6) = 0;
  *((void *)a5 + 7) = 0;
  *((void *)a5 + 8) = 0;
  float v47 = a5 + 3;
  sub_1DDA1D908((void *)a5 + 6, *((const void **)a2 + 6), *((void *)a2 + 7), (uint64_t)(*((void *)a2 + 7) - *((void *)a2 + 6)) >> 1);
  if (a1[54])
  {
    unint64_t v9 = 0;
    unsigned int v51 = 3;
    uint64_t v49 = v7;
    do
    {
      long long v10 = v7[1];
      long long v122 = *v7;
      long long v123 = v10;
      long long v124 = v7[2];
      uint64_t v126 = 0;
      uint64_t v127 = 0;
      uint64_t v125 = 0;
      sub_1DDA1D908(&v125, *((const void **)v7 + 6), *((void *)v7 + 7), (uint64_t)(*((void *)v7 + 7) - *((void *)v7 + 6)) >> 1);
      objc_msgSend_stringWithFormat_(NSString, v11, @"tile_%d_plane_%d_level_%d_canon_subband_LL", v12, v13, a3, a4, v9);

      if (v125)
      {
        uint64_t v126 = v125;
        operator delete(v125);
      }
      uint64_t v14 = (long long *)((char *)a2 + 72 * v51 - 144);
      long long v15 = v14[1];
      long long v116 = *v14;
      long long v117 = v15;
      long long v118 = v14[2];
      uint64_t v16 = (const void *)*((void *)v14 + 6);
      uint64_t v120 = 0;
      uint64_t v121 = 0;
      uint64_t v119 = 0;
      sub_1DDA1D908(&v119, v16, *((void *)v14 + 7), (uint64_t)(*((void *)v14 + 7) - (void)v16) >> 1);
      objc_msgSend_stringWithFormat_(NSString, v17, @"tile_%d_plane_%d_level_%d_canon_subband_HL", v18, v19, a3, a4, v9);

      if (v119)
      {
        uint64_t v120 = v119;
        operator delete(v119);
      }
      uint64_t v20 = (long long *)((char *)a2 + 72 * v51 - 72);
      long long v21 = v20[1];
      long long v110 = *v20;
      long long v111 = v21;
      long long v112 = v20[2];
      uint64_t v22 = (const void *)*((void *)v20 + 6);
      uint64_t v114 = 0;
      uint64_t v115 = 0;
      std::string __p = 0;
      sub_1DDA1D908(&__p, v22, *((void *)v20 + 7), (uint64_t)(*((void *)v20 + 7) - (void)v22) >> 1);
      objc_msgSend_stringWithFormat_(NSString, v23, @"tile_%d_plane_%d_level_%d_canon_subband_LH", v24, v25, a3, a4, v9);

      if (__p)
      {
        uint64_t v114 = __p;
        operator delete(__p);
      }
      uint64_t v26 = (long long *)((char *)a2 + 72 * v51);
      long long v27 = v26[1];
      long long v104 = *v26;
      long long v105 = v27;
      long long v106 = v26[2];
      uint64_t v28 = (const void *)*((void *)v26 + 6);
      unsigned int v108 = 0;
      uint64_t v109 = 0;
      unsigned int v107 = 0;
      sub_1DDA1D908(&v107, v28, *((void *)v26 + 7), (uint64_t)(*((void *)v26 + 7) - (void)v28) >> 1);
      objc_msgSend_stringWithFormat_(NSString, v29, @"tile_%d_plane_%d_level_%d_canon_subband_HH", v30, v31, a3, a4, v9);

      if (v107)
      {
        unsigned int v108 = v107;
        operator delete(v107);
      }
      long long v32 = v49[1];
      v95[0] = *v49;
      v95[1] = v32;
      v95[2] = v49[2];
      int v97 = 0;
      uint64_t v98 = 0;
      uint64_t v96 = 0;
      sub_1DDA1D908(&v96, *((const void **)v49 + 6), *((void *)v49 + 7), (uint64_t)(*((void *)v49 + 7) - *((void *)v49 + 6)) >> 1);
      long long v33 = v14[1];
      v91[0] = *v14;
      v91[1] = v33;
      v91[2] = v14[2];
      uint64_t v93 = 0;
      uint64_t v94 = 0;
      unsigned int v92 = 0;
      sub_1DDA1D908(&v92, *((const void **)v14 + 6), *((void *)v14 + 7), (uint64_t)(*((void *)v14 + 7) - *((void *)v14 + 6)) >> 1);
      sub_1DDBEC5C8(a1, (uint64_t)v95, (double *)v91, 1, a3, v9, (uint64_t)&v99);
      if (v92)
      {
        uint64_t v93 = v92;
        operator delete(v92);
      }
      if (v96)
      {
        int v97 = v96;
        operator delete(v96);
      }
      long long v34 = v20[1];
      v82[0] = *v20;
      v82[1] = v34;
      v82[2] = v20[2];
      uint64_t v84 = 0;
      uint64_t v85 = 0;
      uint64_t v83 = 0;
      sub_1DDA1D908(&v83, *((const void **)v20 + 6), *((void *)v20 + 7), (uint64_t)(*((void *)v20 + 7) - *((void *)v20 + 6)) >> 1);
      long long v35 = v26[1];
      v78[0] = *v26;
      v78[1] = v35;
      v78[2] = v26[2];
      unsigned int v80 = 0;
      uint64_t v81 = 0;
      uint64_t v79 = 0;
      sub_1DDA1D908(&v79, *((const void **)v26 + 6), *((void *)v26 + 7), (uint64_t)(*((void *)v26 + 7) - *((void *)v26 + 6)) >> 1);
      int v7 = v49;
      sub_1DDBEC5C8(a1, (uint64_t)v82, (double *)v78, 1, a3, v9, (uint64_t)&v86);
      if (v79)
      {
        unsigned int v80 = v79;
        operator delete(v79);
      }
      if (v83)
      {
        uint64_t v84 = v83;
        operator delete(v83);
      }
      v71[0] = v99;
      v71[1] = v100;
      v71[2] = v101;
      uint64_t v73 = 0;
      uint64_t v74 = 0;
      id v72 = 0;
      sub_1DDA1D908(&v72, v102, (uint64_t)v103, (v103 - (unsigned char *)v102) >> 1);
      v67[0] = v86;
      v67[1] = v87;
      v67[2] = v88;
      uint64_t v69 = 0;
      uint64_t v70 = 0;
      uint64_t v68 = 0;
      sub_1DDA1D908(&v68, v89, (uint64_t)v90, (v90 - (unsigned char *)v89) >> 1);
      sub_1DDBEC5C8(a1, (uint64_t)v71, (double *)v67, 0, a3, v9, (uint64_t)v75);
      long long v36 = v75[1];
      *uint64_t v49 = v75[0];
      v49[1] = v36;
      v49[2] = v75[2];
      uint64_t v37 = (void *)*((void *)v49 + 6);
      if (v37)
      {
        *((void *)v49 + 7) = v37;
        operator delete(v37);
        *float v47 = 0;
        v47[1] = 0;
        v47[2] = 0;
      }
      v49[3] = v76;
      *((void *)v49 + 8) = v77;
      uint64_t v77 = 0;
      long long v76 = 0uLL;
      if (v68)
      {
        uint64_t v69 = v68;
        operator delete(v68);
      }
      if (v72)
      {
        uint64_t v73 = v72;
        operator delete(v72);
      }
      long long v61 = v99;
      long long v62 = v100;
      long long v63 = v101;
      uint64_t v65 = 0;
      uint64_t v66 = 0;
      uint64_t v64 = 0;
      sub_1DDA1D908(&v64, v102, (uint64_t)v103, (v103 - (unsigned char *)v102) >> 1);
      objc_msgSend_stringWithFormat_(NSString, v38, @"tile_%d_plane_%d_level_%d_canon_outTop", v39, v40, a3, a4, v9);

      if (v64)
      {
        uint64_t v65 = v64;
        operator delete(v64);
      }
      long long v55 = v86;
      long long v56 = v87;
      long long v57 = v88;
      uint64_t v59 = 0;
      uint64_t v60 = 0;
      uint64_t v58 = 0;
      sub_1DDA1D908(&v58, v89, (uint64_t)v90, (v90 - (unsigned char *)v89) >> 1);
      objc_msgSend_stringWithFormat_(NSString, v41, @"tile_%d_plane_%d_level_%d_canon_outBottom", v42, v43, a3, a4, v9);

      if (v58)
      {
        uint64_t v59 = v58;
        operator delete(v58);
      }
      uint64_t v53 = 0;
      uint64_t v54 = 0;
      uint64_t v52 = 0;
      sub_1DDA1D908(&v52, *((const void **)v49 + 6), *((void *)v49 + 7), (uint64_t)(*((void *)v49 + 7) - *((void *)v49 + 6)) >> 1);
      objc_msgSend_stringWithFormat_(NSString, v44, @"tile_%d_plane_%d_level_%d_canon_out", v45, v46, a3, a4, v9);

      if (v52)
      {
        uint64_t v53 = v52;
        operator delete(v52);
      }
      if (v89)
      {
        uint64_t v90 = v89;
        operator delete(v89);
      }
      if (v102)
      {
        char v103 = v102;
        operator delete(v102);
      }
      ++v9;
      v51 += 3;
    }
    while (v9 < a1[54]);
  }
}

void sub_1DDBEC444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (__p) {
    operator delete(__p);
  }
  id v72 = (void *)STACK[0x3B8];
  if (STACK[0x3B8])
  {
    STACK[0x3C0] = (unint64_t)v72;
    operator delete(v72);
  }
  uint64_t v73 = (void *)STACK[0x498];
  if (STACK[0x498])
  {
    STACK[0x4A0] = (unint64_t)v73;
    operator delete(v73);
  }
  uint64_t v74 = *a12;
  if (*a12)
  {
    *(void *)(a42 + 56) = v74;
    operator delete(v74);
  }
  _Unwind_Resume(a1);
}

void sub_1DDBEC5C8(_DWORD *a1@<X0>, uint64_t a2@<X1>, double *a3@<X2>, int a4@<W3>, unsigned int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  unsigned int v10 = *(double *)a2;
  unsigned int v11 = *(double *)(a2 + 8);
  unsigned int v12 = *(double *)(a2 + 16) + v10;
  if (a4)
  {
    unsigned int v13 = 0;
    v12 += a3[2];
    char v14 = *(double *)a2;
  }
  else
  {
    unsigned int v13 = a3[3];
    char v14 = *(double *)(a2 + 8);
  }
  unsigned int v15 = v13 + v11 + *(double *)(a2 + 24);
  *(void *)(a7 + 48) = 0;
  *(void *)(a7 + 56) = 0;
  *(void *)(a7 + 64) = 0;
  *(double *)a7 = (double)v10;
  *(double *)(a7 + 8) = (double)v11;
  *(double *)(a7 + 16) = (double)(v12 - v10);
  *(double *)(a7 + 24) = (double)(v15 - v11);
  *(_OWORD *)(a7 + 32) = *(_OWORD *)(a7 + 16);
  if (!a4) {
    LOBYTE(v12) = v15;
  }
  int v16 = v14 & 1;
  if (v14) {
    int v17 = 2;
  }
  else {
    int v17 = 1;
  }
  if (v12) {
    unsigned int v18 = 1;
  }
  else {
    unsigned int v18 = 2;
  }
  unsigned int v19 = a1[58];
  int v20 = a5 % v19;
  unsigned int v21 = v19 - 1;
  unsigned int v22 = a1[54];
  int v23 = ~(-1 << v22);
  if (a4)
  {
    if (a1[60])
    {
      unsigned int v24 = a1[52];
      if (v20) {
        uint64_t v25 = *(void *)&dword_1DDC0CDB0[2 * a6];
      }
      else {
        uint64_t v25 = 0;
      }
      if (v20 == v21)
      {
LABEL_25:
        int v26 = 0;
        int v27 = 0;
        goto LABEL_26;
      }
      goto LABEL_22;
    }
  }
  else if (a1[61])
  {
    unsigned int v24 = a1[53];
    if (v19 <= a5) {
      uint64_t v25 = *(void *)&dword_1DDC0CDB0[2 * a6];
    }
    else {
      uint64_t v25 = 0;
    }
    if (a5 / v19 == a1[59] - 1) {
      goto LABEL_25;
    }
LABEL_22:
    uint64_t v28 = &dword_1DDC0CDC8[6 * (v23 & (v24 >> 1))];
    int v26 = v28[2 * a6];
    int v27 = v28[(2 * a6) | 1];
    goto LABEL_26;
  }
  int v26 = 0;
  int v27 = 0;
  uint64_t v25 = 0;
LABEL_26:
  uint64_t v130 = v25;
  if (a1[60] && a6 + 1 < v22)
  {
    int v29 = 2 * (a6 + 1);
    if (v20) {
      unsigned int v30 = dword_1DDC0CDB0[v29];
    }
    else {
      unsigned int v30 = 0;
    }
    if (v20 == v21) {
      unsigned int v31 = 0;
    }
    else {
      unsigned int v31 = dword_1DDC0CDC8[6 * (v23 & (a1[52] >> 1)) + v29];
    }
    *(double *)(a7 + 32) = *(double *)(a7 + 32) + (double)v30 + (double)v31;
  }
  unsigned int v129 = v19 - 1;
  unsigned int v127 = v17;
  sub_1DDB032DC(a7 + 48, *(double *)(a7 + 40) * *(double *)(a7 + 32));
  uint64_t v35 = *(void *)(a7 + 48);
  double v36 = (double)(v27 + HIDWORD(v130));
  if (a4)
  {
    if (a3[4] - a3[2] != v36 || *(double *)(a2 + 32) - *(double *)(a2 + 16) != (double)(v26 + v130)) {
      goto LABEL_118;
    }
  }
  else if (a3[5] - a3[3] != v36 || *(double *)(a2 + 40) - *(double *)(a2 + 24) != (double)(v26 + v130))
  {
LABEL_118:
    exceptiouint64_t n = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01C3B90](exception, "RawCameraException");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  int v119 = v16;
  long long v123 = a3;
  uint64_t v37 = 40;
  if (a4) {
    uint64_t v37 = 32;
  }
  uint64_t v38 = *(double *)(a7 + v37);
  int v39 = v130;
  unsigned int v40 = HIDWORD(v130) + v130;
  if (v127 <= HIDWORD(v130) + (int)v130) {
    unsigned int v41 = HIDWORD(v130) + v130;
  }
  else {
    unsigned int v41 = v127;
  }
  unsigned int v42 = v27 + v26;
  if (v18 <= v42) {
    unsigned int v43 = v42;
  }
  else {
    unsigned int v43 = v18;
  }
  unint64_t v44 = v43 + v41 + v38;
  objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v32, 2 * v44, v33, v34);
  id v120 = objc_claimAutoreleasedReturnValue();
  uint64_t v52 = (_WORD *)objc_msgSend_mutableBytes(v120, v45, v46, v47, v48);
  if ((v38 & 1) == 0 && v20 != v129 && v42 > 1) {
    unsigned int v55 = v38 + 1;
  }
  else {
    unsigned int v55 = v38;
  }
  unsigned int v131 = v55;
  objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v49, 2 * v38, v50, v51);
  id v56 = objc_claimAutoreleasedReturnValue();
  uint64_t v61 = objc_msgSend_mutableBytes(v56, v57, v58, v59, v60);
  unsigned int v62 = v127;
  if (v127 < v40 || v39 || v119)
  {
    long long v116 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01C3B90](v116, "RawCameraException");
    __cxa_throw(v116, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  long long v118 = v56;
  double v63 = *(double *)(a7 + 32);
  double v64 = *(double *)(a7 + 40);
  if (!a4) {
    double v64 = *(double *)(a7 + 32);
  }
  if (v64)
  {
    int v65 = 0;
    unsigned int v66 = *(double *)(a2 + 32);
    unsigned int v67 = v123[4];
    if (a4) {
      unsigned int v68 = 1;
    }
    else {
      unsigned int v68 = *(double *)(a2 + 32);
    }
    if (a4) {
      unsigned int v69 = 1;
    }
    else {
      unsigned int v69 = v123[4];
    }
    uint64_t v70 = 5;
    if (a4) {
      uint64_t v70 = 4;
    }
    unsigned int v71 = v123[v70];
    uint64_t v125 = *(void *)(a2 + 48);
    uint64_t v72 = *((void *)v123 + 6);
    uint64_t v73 = (v131 >> 1) + 1;
    if (v131 >> 1 <= 1) {
      uint64_t v74 = 1;
    }
    else {
      uint64_t v74 = v131 >> 1;
    }
    unsigned int v126 = *(double *)(a2 + 32);
    uint64_t v124 = *((void *)v123 + 6);
    unsigned int v122 = v67;
    uint64_t v121 = v74;
    do
    {
      unsigned int v75 = v66;
      int v76 = v66;
      int v77 = v67;
      if ((a4 & 1) == 0)
      {
        unsigned int v75 = *(double *)(a2 + 40);
        int v76 = 1;
        int v77 = 1;
      }
      uint64_t v78 = (_WORD *)(v72 + 2 * (v77 * v65));
      *uint64_t v52 = *v78;
      uint64_t v79 = v73;
      unsigned int v80 = (_WORD *)v61;
      unsigned int v81 = v62;
      if (v44 >= 2)
      {
        uint64_t v82 = v73;
        uint64_t v83 = 0;
        unsigned int v84 = 0;
        uint64_t v85 = (_WORD *)(v125 + 2 * (v76 * v65));
        unsigned int v86 = HIDWORD(v130);
        do
        {
          BOOL v87 = v84 >= v75;
          int v88 = ((_BYTE)v83 + 1) & 1;
          if ((((_BYTE)v83 + 1) & 1) == 0) {
            BOOL v87 = v86 >= v71;
          }
          uint64_t v89 = &v85[v84 * v68];
          unsigned int v90 = v84 + v88;
          if ((((_BYTE)v83 + 1) & 1) == 0) {
            uint64_t v89 = &v78[v86 * v69];
          }
          unsigned int v91 = (v83 - v38) >> 1;
          int v92 = (v71 - 2 - v91) * v69;
          int v93 = (v75 + ~v91) * v68;
          BOOL v94 = v88 == 0;
          if (((_BYTE)v83 + 1)) {
            unsigned int v95 = v93;
          }
          else {
            unsigned int v95 = v92;
          }
          if (v94) {
            uint64_t v96 = v78;
          }
          else {
            uint64_t v96 = v85;
          }
          int v97 = &v96[v95];
          BOOL v98 = v87;
          if (v87) {
            long long v99 = v97;
          }
          else {
            long long v99 = v89;
          }
          if (!v98)
          {
            v86 += !(((_BYTE)v83 + 1) & 1);
            unsigned int v84 = v90;
          }
          v52[v83 + 1] = *v99;
          unint64_t v100 = v83 + 2;
          ++v83;
        }
        while (v100 < v44);
        uint64_t v73 = v82;
        uint64_t v79 = v82;
        unsigned int v80 = (_WORD *)v61;
        unsigned int v62 = v127;
        unsigned int v81 = v127;
        unsigned int v67 = v122;
        unsigned int v66 = v126;
        uint64_t v72 = v124;
        uint64_t v74 = v121;
      }
      do
      {
        int v101 = (__int16)v52[v81 - 1] + (__int16)v52[v81 + 1];
        int v102 = v101 + 2;
        unsigned int v103 = v101 + 5;
        if (v102 >= 0) {
          unsigned int v103 = v102;
        }
        *unsigned int v80 = v52[v81] - (v103 >> 2);
        v80 += 2;
        v81 += 2;
        --v79;
      }
      while (v79);
      uint64_t v104 = v74;
      long long v105 = v52 + 2;
      long long v106 = (__int16 *)(v61 + 4);
      if (v131 >= 2)
      {
        do
        {
          __int16 v108 = *v105;
          v105 += 2;
          __int16 v107 = v108;
          int v109 = *(v106 - 2);
          int v110 = *v106;
          BOOL v111 = __OFADD__(v110, v109);
          int v112 = v110 + v109;
          if (v112 < 0 != v111) {
            ++v112;
          }
          *(v106 - 1) = v107 + (v112 >> 1);
          v106 += 2;
          --v104;
        }
        while (v104);
      }
      if (v38)
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (a4) {
            int v114 = v65;
          }
          else {
            int v114 = i;
          }
          if (a4) {
            int v115 = i;
          }
          else {
            int v115 = v65;
          }
          *(_WORD *)(v35 + 2 * (v115 + v114 * v63)) = *(_WORD *)(v61 + 2 * i);
        }
      }
      ++v65;
    }
    while (v65 != v64);
  }
}

void sub_1DDBECD24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void **a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  int v20 = *a16;
  if (*a16)
  {
    *(void *)(a19 + 56) = v20;
    operator delete(v20);
  }
  _Unwind_Resume(a1);
}

void sub_1DDBECDB4(os_signpost_id_t a1)
{
  int v2 = sub_1DDA83CFC();
  unsigned int v3 = v2;
  if (a1 + 1 >= 2 && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DDA14000, v3, OS_SIGNPOST_INTERVAL_BEGIN, a1, "CCanonCR3Unpacker", (const char *)&unk_1DDC3ACB6, buf, 2u);
  }

  v230[0] = MEMORY[0x1E4F143A8];
  v230[1] = 3221225472;
  v230[2] = sub_1DDBED8E4;
  v230[3] = &unk_1E6D04A58;
  v230[4] = a1;
  uint64_t v201 = (void (**)(void))MEMORY[0x1E01C46E0](v230);
  if (*(_DWORD *)(a1 + 224) != 4 || *(_DWORD *)(a1 + 188) >= 0x11u)
  {
    exceptiouint64_t n = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01C3B90](exception, "RawCameraException");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  if (*(_DWORD *)(a1 + 48) != *(_DWORD *)(a1 + 212))
  {
    uint64_t v200 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01C3B90](v200, "RawCameraException");
    __cxa_throw(v200, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  uint64_t v4 = *(unsigned int *)(a1 + 44);
  uint64_t v5 = (uint64_t *)(a1 + 24);
  *(_DWORD *)buf = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 48))(*(void *)(a1 + 24));
  int v203 = sub_1DDA456E8((unsigned int *)buf);
  uint64_t v207 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 200), v6, @"tile_headers", v7, v8);
  uint64_t v210 = a1;
  if (*(_DWORD *)(a1 + 228))
  {
    uint64_t v12 = 0;
    unint64_t v13 = 0x1E4F1C000uLL;
    v202 = (uint64_t *)(a1 + 24);
    do
    {
      uint64_t v209 = v12;
      char v14 = objc_msgSend_objectAtIndexedSubscript_(v207, v9, v12, v10, v11);
      uint64_t v206 = objc_msgSend_objectForKeyedSubscript_(v14, v15, @"plane_headers", v16, v17);

      *(void *)buf = 0;
      uint64_t v224 = buf;
      uint64_t v225 = 0x4812000000;
      uint64_t v226 = sub_1DDBED96C;
      v227 = sub_1DDBED990;
      uint64_t v228 = "";
      sub_1DDBEE41C(v229, *(unsigned int *)(v210 + 224));
      int v222 = v203;
      if (v209)
      {
        unsigned int v21 = objc_msgSend_objectAtIndexedSubscript_(v207, v18, v209 - 1, v19, v20);
        uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v21, v22, @"tile_data_length", v23, v24);
        int v30 = objc_msgSend_unsignedIntValue(v25, v26, v27, v28, v29);
        v222 += v30;
      }
      unsigned int v31 = objc_msgSend_objectForKeyedSubscript_(*(void **)(v210 + 200), v18, @"version", v19, v20);
      int v36 = objc_msgSend_unsignedIntValue(v31, v32, v33, v34, v35);

      if (v36 == 512)
      {
        unsigned int v41 = objc_msgSend_objectAtIndexedSubscript_(v207, v37, v209, v39, v40);
        uint64_t v45 = objc_msgSend_objectForKeyedSubscript_(v41, v42, @"tile_qpinfo_flag", v43, v44);
        int v50 = objc_msgSend_BOOLValue(v45, v46, v47, v48, v49);

        if (v50)
        {
          uint64_t v54 = objc_msgSend_objectAtIndexedSubscript_(v207, v51, v209, v52, v53);
          uint64_t v58 = objc_msgSend_objectForKeyedSubscript_(v54, v55, @"qp_data_length", v56, v57);
          unsigned int v63 = objc_msgSend_unsignedIntValue(v58, v59, v60, v61, v62);

          unsigned int v67 = objc_msgSend_objectAtIndexedSubscript_(v207, v64, v209, v65, v66);
          unsigned int v71 = objc_msgSend_objectForKeyedSubscript_(v67, v68, @"qp_stuffing_data_length", v69, v70);
          LODWORD(v58) = objc_msgSend_unsignedIntValue(v71, v72, v73, v74, v75);

          sub_1DDA18410(&v220, &v222);
          sub_1DDA1A94C((uint64_t *)v221, v5, (uint64_t)&v220, 0);
          uint64_t v79 = objc_msgSend_dataWithLength_(*(void **)(v13 + 2648), v76, v58 + (unint64_t)v63, v77, v78);
          uint64_t v80 = *v5;
          id v208 = v79;
          uint64_t v85 = objc_msgSend_mutableBytes(v208, v81, v82, v83, v84);
          uint64_t v90 = objc_msgSend_length(v208, v86, v87, v88, v89);
          sub_1DDA19DD0(v80, v85, v90);
          sub_1DDA1AA18((uint64_t *)v221);
        }
        else
        {
          id v208 = 0;
        }
        unsigned int v91 = objc_msgSend_objectAtIndexedSubscript_(v207, v51, v209, v52, v53);
        unsigned int v95 = objc_msgSend_objectForKeyedSubscript_(v91, v92, @"qp_data_length", v93, v94);
        int v100 = objc_msgSend_unsignedIntValue(v95, v96, v97, v98, v99);
        v222 += v100;

        uint64_t v104 = objc_msgSend_objectAtIndexedSubscript_(v207, v101, v209, v102, v103);
        __int16 v108 = objc_msgSend_objectForKeyedSubscript_(v104, v105, @"qp_stuffing_data_length", v106, v107);
        int v113 = objc_msgSend_unsignedIntValue(v108, v109, v110, v111, v112);
        v222 += v113;
      }
      else
      {
        id v208 = 0;
      }
      int v114 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v37, v38, v39, v40);
      if (*(_DWORD *)(v210 + 224))
      {
        unint64_t v115 = 0;
        do
        {
          sub_1DDA18410(&v220, &v222);
          sub_1DDA1A94C((uint64_t *)v221, v5, (uint64_t)&v220, 0);
          int v119 = objc_msgSend_objectAtIndexedSubscript_(v206, v116, v115, v117, v118);
          long long v123 = objc_msgSend_objectForKeyedSubscript_(v119, v120, @"plane_data_length", v121, v122);
          unsigned int v128 = objc_msgSend_unsignedIntValue(v123, v124, v125, v126, v127);

          uint64_t v132 = objc_msgSend_dataWithLength_(*(void **)(v13 + 2648), v129, v128, v130, v131);
          uint64_t v133 = *v5;
          id v134 = v132;
          uint64_t v139 = objc_msgSend_mutableBytes(v134, v135, v136, v137, v138);
          uint64_t v144 = objc_msgSend_length(v134, v140, v141, v142, v143);
          sub_1DDA19DD0(v133, v139, v144);
          objc_msgSend_addObject_(v114, v145, (uint64_t)v134, v146, v147);
          v222 += v128;

          sub_1DDA1AA18((uint64_t *)v221);
          ++v115;
        }
        while (v115 < *(unsigned int *)(v210 + 224));
      }
      uint64_t v148 = dispatch_group_create();
      v204 = (*(void (**)(uint64_t))(*(void *)v210 + 192))(v210);
      if (*(_DWORD *)(v210 + 224))
      {
        unsigned int v149 = 0;
        uint64_t v205 = MEMORY[0x1E4F143A8];
        do
        {
          block[0] = v205;
          block[1] = 3221225472;
          block[2] = sub_1DDBED9BC;
          block[3] = &unk_1E6D07408;
          int v216 = buf;
          uint64_t v217 = v210;
          unsigned int v218 = v149;
          id v212 = v206;
          id v213 = v114;
          id v214 = v207;
          int v219 = v209;
          id v215 = v208;
          dispatch_group_async(v148, v204, block);

          ++v149;
        }
        while (v149 < *(_DWORD *)(v210 + 224));
      }
      dispatch_group_wait(v148, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v150 = v148;
      uint64_t v151 = sub_1DDAA5B9C(v210);
      unint64_t v152 = *(unsigned int *)(v210 + 212);
      uint64_t v5 = v202;
      unint64_t v13 = 0x1E4F1C000;
      if (v152)
      {
        unsigned int v153 = 0;
        unint64_t v154 = 0;
        uint64_t v155 = *((void *)v224 + 6);
        uint64_t v156 = *(void *)(v155 + 48);
        uint64_t v157 = *(void *)(v155 + 120);
        uint64_t v158 = *(void *)(v155 + 192);
        uint64_t v159 = *(void *)(v155 + 264);
        unsigned int v160 = *(double *)(v155 + 16);
        unint64_t v161 = *(unsigned int *)(v210 + 208);
        uint64_t v162 = v151 + 2 * (v161 * v209);
        do
        {
          if (v161)
          {
            uint64_t v163 = (_WORD *)(v162 + 2 * (v4 * v154));
            int v164 = *(_DWORD *)(v210 + 248);
            int v165 = *(_DWORD *)(v210 + 252);
            int v166 = 1 << (v165 - 1);
            int v167 = ~(-1 << v165);
            uint64_t v168 = 1;
            unsigned int v169 = v153;
            do
            {
              int v170 = *(__int16 *)(v157 + 2 * v169);
              int v171 = *(__int16 *)(v158 + 2 * v169);
              int v172 = *(__int16 *)(v159 + 2 * v169);
              int v173 = v166 + *(__int16 *)(v156 + 2 * v169);
              if (v173 >= v167) {
                __int16 v174 = v167;
              }
              else {
                __int16 v174 = v166 + *(_WORD *)(v156 + 2 * v169);
              }
              if (v164)
              {
                int v175 = v174 << 10;
                if (v173 >= 0) {
                  int v176 = v175;
                }
                else {
                  int v176 = 0;
                }
                int v177 = -168 * v170 - 585 * v172 + v176;
                if (v177 < 0) {
                  unsigned int v178 = -((512 - v177) >> 10);
                }
                else {
                  unsigned int v178 = (v177 + 512) >> 10;
                }
                int v189 = v176 + 1510 * v172;
                int v190 = 2 * v178;
                int v191 = v171 + 2 * v178;
                int v192 = v190 - v171;
                int v193 = v176 + 1927 * v170;
                if (v189 >= 0) {
                  int v194 = (v189 + 512) >> 10;
                }
                else {
                  int v194 = 0;
                }
                int v195 = (v191 + 1) >> 1;
                if (v191 < 0) {
                  int v195 = 0;
                }
                if (v192 >= 0) {
                  int v196 = (v192 + 1) >> 1;
                }
                else {
                  int v196 = 0;
                }
                if (v193 >= 0) {
                  int v197 = (v193 + 512) >> 10;
                }
                else {
                  int v197 = 0;
                }
                if (v194 >= v167) {
                  LOWORD(v194) = v167;
                }
                if (v195 >= v167) {
                  LOWORD(v195) = v167;
                }
                if (v196 >= v167) {
                  LOWORD(v196) = v167;
                }
                _WORD *v163 = v194;
                if (v197 >= v167) {
                  __int16 v188 = v167;
                }
                else {
                  __int16 v188 = v197;
                }
                v163[1] = v195;
                v163[v4] = v196;
                uint64_t v150 = v148;
              }
              else
              {
                if (v173 >= 0) {
                  __int16 v179 = v174;
                }
                else {
                  __int16 v179 = 0;
                }
                _WORD *v163 = v179;
                int v180 = v166 + v170;
                if (v180 >= v167) {
                  __int16 v181 = v167;
                }
                else {
                  __int16 v181 = v180;
                }
                if (v180 >= 0) {
                  __int16 v182 = v181;
                }
                else {
                  __int16 v182 = 0;
                }
                v163[1] = v182;
                int v183 = v166 + v171;
                if (v183 >= v167) {
                  __int16 v184 = v167;
                }
                else {
                  __int16 v184 = v183;
                }
                if (v183 >= 0) {
                  __int16 v185 = v184;
                }
                else {
                  __int16 v185 = 0;
                }
                v163[v4] = v185;
                int v186 = v166 + v172;
                if (v186 >= v167) {
                  __int16 v187 = v167;
                }
                else {
                  __int16 v187 = v186;
                }
                if (v186 >= 0) {
                  __int16 v188 = v187;
                }
                else {
                  __int16 v188 = 0;
                }
              }
              v163[(v4 + 1)] = v188;
              v163 += 2;
              ++v169;
              unint64_t v198 = v168 + 1;
              v168 += 2;
            }
            while (v198 < v161);
          }
          v154 += 2;
          v153 += v160;
        }
        while (v154 < v152);
      }

      _Block_object_dispose(buf, 8);
      v221[0] = (void **)v229;
      sub_1DDBEE56C(v221);

      uint64_t v12 = v209 + 1;
    }
    while (v209 + 1 < (unint64_t)*(unsigned int *)(v210 + 228));
  }

  v201[2](v201);
}

void sub_1DDBED748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1DDBED8E4(uint64_t a1)
{
  int v2 = sub_1DDA83CFC();
  unsigned int v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DDA14000, v3, OS_SIGNPOST_INTERVAL_END, v4, "CCanonCR3Unpacker", (const char *)&unk_1DDC3ACB6, v5, 2u);
  }
}

__n128 sub_1DDBED96C(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void sub_1DDBED990(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 48);
  sub_1DDBEE56C(&v1);
}

void sub_1DDBED9BC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 32), a2, *(unsigned int *)(a1 + 80), a4, a5);
  uint64_t v11 = objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 40), v8, *(unsigned int *)(a1 + 80), v9, v10);
  unsigned int v15 = objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 48), v12, *(unsigned int *)(a1 + 84), v13, v14);
  sub_1DDBEB4AC(v6, v7, v11, v15, *(void **)(a1 + 56), v25);
  uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
  unsigned int v17 = *(_DWORD *)(a1 + 80);
  uint64_t v18 = *(void *)(v16 + 48);
  uint64_t v19 = v18 + 72 * v17;
  long long v20 = v25[0];
  long long v21 = v25[2];
  *(_OWORD *)(v19 + 16) = v25[1];
  *(_OWORD *)(v19 + 32) = v21;
  *(_OWORD *)uint64_t v19 = v20;
  uint64_t v24 = *(void **)(v19 + 48);
  uint64_t v23 = (void *)(v19 + 48);
  unsigned int v22 = v24;
  if (v24)
  {
    *(void *)(v18 + 72 * v17 + 56) = v22;
    operator delete(v22);
    void *v23 = 0;
    v23[1] = 0;
    v23[2] = 0;
  }
  *(_OWORD *)uint64_t v23 = v26;
  *(void *)(v18 + 72 * v17 + 64) = v27;
  long long v26 = 0uLL;
  uint64_t v27 = 0;
}

void sub_1DDBEDAD8(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x1DDBEDABCLL);
}

void *sub_1DDBEDB10(uint64_t a1)
{
  *(void *)a1 = &unk_1F398EC88;
  int v2 = *(std::__shared_weak_count **)(a1 + 272);
  if (v2) {
    sub_1DDA18310(v2);
  }

  return sub_1DDA18384((void *)a1);
}

void sub_1DDBEDB74(uint64_t a1)
{
  *(void *)a1 = &unk_1F398EC88;
  int v2 = *(std::__shared_weak_count **)(a1 + 272);
  if (v2) {
    sub_1DDA18310(v2);
  }

  sub_1DDA18384((void *)a1);

  JUMPOUT(0x1E01C3DC0);
}

void sub_1DDBEDBEC(int a1, unsigned int a2, int a3, void *a4, uint64_t *a5, int a6)
{
  id v65 = a4;
  uint64_t v13 = (unsigned int *)objc_msgSend_bytes(v65, v9, v10, v11, v12);
  int v18 = objc_msgSend_length(v65, v14, v15, v16, v17);
  uint64_t v19 = 0;
  uint64_t v80 = 0;
  unsigned int v81 = 0;
  uint64_t v82 = 0;
  int v83 = v18;
  unsigned int v84 = bswap32(*v13);
  uint64_t v85 = v13;
  if ((a1 & 1) == 0) {
    uint64_t v19 = malloc_type_calloc(a2, 4uLL, 0x100004052888210uLL);
  }
  unsigned int v71 = v19;
  int v74 = 0;
  int v72 = 0;
  int v75 = 0;
  int v20 = 0;
  unsigned int v21 = 0;
  unsigned int v78 = a2 - 1;
  unsigned int v79 = 0;
  if (a6) {
    int v22 = 7;
  }
  else {
    int v22 = 15;
  }
  unsigned int v77 = a3 * a2;
  if (a6) {
    int v23 = 24;
  }
  else {
    int v23 = 42;
  }
  if (a6) {
    int v24 = 8;
  }
  else {
    int v24 = 21;
  }
  int v67 = v24;
  unsigned int v70 = v23;
  int v68 = v22;
  int v69 = v23 - 1;
  do
  {
    BOOL v25 = sub_1DDAB54FC(&v80, 1);
    if (v79 >= v77 || !v25) {
      break;
    }
    BOOL v27 = v21 == 0;
    BOOL v28 = v21 == v78;
    if (a1)
    {
      if (!v20) {
        goto LABEL_26;
      }
      if (!v21) {
        goto LABEL_28;
      }
      uint64_t v29 = *a5;
      int v30 = *(unsigned __int16 *)(*a5 + 2 * (v21 + v20 * a2 - 1));
      unsigned int v31 = v21 + (v20 - 1) * a2;
      __int16 v32 = *(_WORD *)(*a5 + 2 * (v31 - 1));
      int v33 = *(unsigned __int16 *)(*a5 + 2 * v31);
    }
    else
    {
      if (!v20)
      {
LABEL_26:
        if (v21)
        {
          int v33 = 0;
          __int16 v32 = 0;
          int v34 = 0;
          int v30 = *(unsigned __int16 *)(*a5 + 2 * (v21 - 1));
        }
        else
        {
          int v30 = 0;
          int v33 = 0;
          __int16 v32 = 0;
          int v34 = 0;
        }
        goto LABEL_31;
      }
      if (!v21)
      {
LABEL_28:
        unsigned int v35 = (v20 - 1) * a2;
        int v30 = *(unsigned __int16 *)(*a5 + 2 * v35);
        int v34 = *(unsigned __int16 *)(*a5 + 2 * (v35 + 1));
        int v33 = v30;
        __int16 v32 = *(_WORD *)(*a5 + 2 * v35);
        goto LABEL_31;
      }
      uint64_t v29 = *a5;
      int v30 = *(unsigned __int16 *)(*a5 + 2 * (v21 + v20 * a2 - 1));
      unsigned int v31 = v21 + (v20 - 1) * a2;
      int v33 = *(unsigned __int16 *)(*a5 + 2 * v31);
      __int16 v32 = *(_WORD *)(*a5 + 2 * (v31 - 1));
    }
    if (v21 == v78)
    {
      LOWORD(v34) = 0;
      BOOL v27 = 0;
      BOOL v28 = 1;
      unsigned int v21 = a2 - 1;
      goto LABEL_87;
    }
    int v34 = *(unsigned __int16 *)(v29 + 2 * (v31 + 1));
LABEL_31:
    if (v21 != v78 && (a6 & 1) == 0)
    {
      if (!a1)
      {
        if (v30 | v33) {
          goto LABEL_40;
        }
        if (v34)
        {
          LOWORD(v30) = 0;
          LOWORD(v33) = 0;
LABEL_40:
          BOOL v28 = 0;
          goto LABEL_87;
        }
LABEL_41:
        __int16 v66 = v34;
        int v36 = dword_1DDC0D11C[v74];
        if (!sub_1DDAB5424((uint64_t)&v80)) {
          goto LABEL_66;
        }
        int v37 = 0;
        int v38 = a2 - v21;
        int v39 = 1 << v36;
        while (sub_1DDAB5424((uint64_t)&v80))
        {
          v37 += v39;
          if (v37 < v38)
          {
            if (v74 <= 30) {
              int v39 = 1 << dword_1DDC0D11C[++v74];
            }
            if (v37 != a2 - v21 - 1) {
              continue;
            }
          }
          LODWORD(v40) = a2 - v21;
          goto LABEL_52;
        }
        int v41 = v74;
        if (v74 >= 4)
        {
          v37 += sub_1DDAB52E8((uint64_t)&v80, dword_1DDC0D11C[v74]);
          int v41 = v74;
        }
        int v74 = v41 - (v41 > 0);
        LODWORD(v40) = v37 + 1;
LABEL_52:
        if ((int)v40 <= 0)
        {
LABEL_66:
          BOOL v28 = 0;
          int v75 = 1;
          LOWORD(v34) = v66;
          BOOL v27 = v21 == 0;
          goto LABEL_87;
        }
        if (v38 >= (int)v40) {
          uint64_t v40 = v40;
        }
        else {
          uint64_t v40 = v38;
        }
        if (v40)
        {
          uint64_t v42 = *a5;
          uint64_t v43 = v40;
          unsigned int v44 = v21;
          do
          {
            *(_WORD *)(v42 + 2 * (v20 * a2 + v44)) = v30;
            if ((a1 & 1) == 0) {
              v71[v44] = 0;
            }
            ++v44;
            --v43;
          }
          while (v43);
        }
        v21 += v40;
        v79 += v40;
        BOOL v28 = v21 == v78;
        if (a1)
        {
          if (v20)
          {
            if (v21)
            {
              LOWORD(v30) = *(_WORD *)(*a5 + 2 * (v21 + v20 * a2 - 1));
              unsigned int v45 = v21 + (v20 - 1) * a2;
              __int16 v32 = *(_WORD *)(*a5 + 2 * (v45 - 1));
              LOWORD(v33) = *(_WORD *)(*a5 + 2 * v45);
              if (v21 == v78)
              {
                LOWORD(v34) = 0;
                BOOL v27 = 0;
                int v75 = 1;
                unsigned int v21 = a2 - 1;
                BOOL v28 = 1;
                goto LABEL_87;
              }
              BOOL v27 = 0;
              BOOL v28 = 0;
              LOWORD(v34) = *(_WORD *)(*a5 + 2 * (v45 + 1));
              goto LABEL_81;
            }
            unsigned int v49 = (v20 - 1) * a2;
            LOWORD(v30) = *(_WORD *)(*a5 + 2 * v49);
            LOWORD(v34) = *(_WORD *)(*a5 + 2 * (v49 + 1));
            int v75 = 1;
            LOWORD(v33) = v30;
            __int16 v32 = v30;
            goto LABEL_86;
          }
          if (v21)
          {
            LOWORD(v33) = 0;
            __int16 v32 = 0;
            goto LABEL_75;
          }
          LOWORD(v30) = 0;
          LOWORD(v33) = 0;
          __int16 v32 = 0;
LABEL_84:
          LOWORD(v34) = 0;
        }
        else
        {
          if (!v20)
          {
            if (v21)
            {
              LOWORD(v33) = 0;
LABEL_75:
              LOWORD(v34) = 0;
              BOOL v27 = 0;
              LOWORD(v30) = *(_WORD *)(*a5 + 2 * (v21 - 1));
LABEL_81:
              int v75 = 1;
              goto LABEL_87;
            }
            LOWORD(v30) = 0;
            LOWORD(v33) = 0;
            goto LABEL_84;
          }
          unsigned int v46 = (v20 - 1) * a2;
          if (v21)
          {
            unsigned int v47 = v21 + v46;
            uint64_t v48 = *a5;
            if (v21 == v78) {
              LOWORD(v34) = 0;
            }
            else {
              LOWORD(v34) = *(_WORD *)(v48 + 2 * (v47 + 1));
            }
            BOOL v27 = 0;
            LOWORD(v33) = *(_WORD *)(v48 + 2 * v47);
            LOWORD(v30) = *(_WORD *)(v48 + 2 * (v21 + v20 * a2 - 1));
            goto LABEL_81;
          }
          LOWORD(v30) = 0;
          LOWORD(v33) = *(_WORD *)(*a5 + 2 * v46);
          LOWORD(v34) = *(_WORD *)(*a5 + 2 * (v46 + 1));
        }
        int v75 = 1;
LABEL_86:
        BOOL v27 = 1;
        goto LABEL_87;
      }
      BOOL v28 = 0;
      if (v30 == v33 && v33 == v34) {
        goto LABEL_41;
      }
    }
LABEL_87:
    if (v21 < a2)
    {
      __int16 v50 = v32;
      __int16 v51 = v34;
      int v52 = (__int16)v33;
      if ((__int16)v30 <= (__int16)v33) {
        int v53 = (__int16)v33;
      }
      else {
        int v53 = (__int16)v30;
      }
      if ((__int16)v30 >= (__int16)v33) {
        __int16 v54 = v33;
      }
      else {
        __int16 v54 = v30;
      }
      if (a1)
      {
        if (v50 >= (__int16)v53)
        {
          int v53 = v54;
        }
        else if (v50 > v54)
        {
          int v53 = (__int16)v33 + (__int16)v30 - v50;
        }
        if (v75) {
          int v33 = (__int16)v33;
        }
        else {
          int v33 = v53;
        }
      }
      else
      {
        int v33 = 0;
      }
      signed int v55 = sub_1DDAB5474((uint64_t)&v80, v70);
      unsigned int v56 = v55;
      if (v55 >= v69)
      {
        if (v55 != v69) {
          break;
        }
        unsigned int v56 = sub_1DDAB52E8((uint64_t)&v80, v67);
      }
      else if (v72)
      {
        unsigned int v56 = sub_1DDAB52E8((uint64_t)&v80, v72) | (v55 << v72);
      }
      if ((v56 & 0x80000000) != 0) {
        break;
      }
      if (v56 >= 0x20)
      {
        if (v56)
        {
          unsigned int v57 = -((v56 + 1) >> 1);
          if (a1) {
            goto LABEL_120;
          }
          goto LABEL_116;
        }
        unsigned int v57 = v56 >> 1;
        if ((a1 & 1) == 0) {
          goto LABEL_116;
        }
LABEL_120:
        int v58 = v72;
      }
      else
      {
        unsigned int v57 = dword_1DDC0D09C[v56 & 0x1F];
        if (a1) {
          goto LABEL_120;
        }
LABEL_116:
        if ((v75 ^ 1)) {
          goto LABEL_120;
        }
        int v58 = v72;
        if ((a6 & 1) == 0)
        {
          if (v56) {
            unsigned int v57 = (v56 + 1) >> 1;
          }
          else {
            unsigned int v57 = -((v56 + 2) >> 1);
          }
        }
      }
      int v59 = v57 + v33;
      if (a6)
      {
        if (v27 && v20 == 0) {
          v59 += 4;
        }
        if (v59 >= 127) {
          int v59 = 127;
        }
        v59 &= ~(v59 >> 31);
      }
      if (v20 && ((v28 | a1 ^ 1) & 1) == 0)
      {
        int v60 = v51 - v52;
        if (v60 < 0) {
          int v60 = v52 - v51;
        }
        unsigned int v56 = v60 + (v56 >> 1);
      }
      if (v56 >> v58 <= 5)
      {
        if (v56 >> v58 <= 2)
        {
          if ((int)v56 >= 1 << v58 >> 1) {
            int v61 = 0;
          }
          else {
            int v61 = -1;
          }
        }
        else
        {
          int v61 = 1;
        }
      }
      else
      {
        int v61 = 2;
      }
      int v62 = v58 + v61;
      if (v20) {
        int v63 = a1;
      }
      else {
        int v63 = 1;
      }
      if (((v63 | v28) & 1) == 0 && v71[v21 + 1] - v62 > 1) {
        ++v62;
      }
      int v64 = v68;
      if (v62 <= v68) {
        int v64 = v62 & ~(v62 >> 31);
      }
      if (v59 <= -32768) {
        int v59 = -32768;
      }
      if (v59 >= 0x7FFF) {
        LOWORD(v59) = 0x7FFF;
      }
      *(_WORD *)(*a5 + 2 * (v21 + v20 * a2)) = v59;
      if ((a1 & 1) == 0) {
        v71[v21] = v64;
      }
      int v72 = v64;
      int v75 = 0;
      ++v21;
      ++v79;
    }
    if (v21 == a2)
    {
      if ((byte_1EAB91488 & 0x40) != 0 && a6) {
        sub_1DDAB52DC((uint64_t)&v80);
      }
      int v75 = 0;
      unsigned int v21 = 0;
      ++v20;
    }
  }
  while (v79 != v77);
  sub_1DDAB52DC((uint64_t)&v80);
  if (v71) {
    free(v71);
  }
  if (v81) {
    sub_1DDA18310(v81);
  }
}

void sub_1DDBEE3DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,std::__shared_weak_count *a23)
{
  if (a23) {
    sub_1DDA18310(a23);
  }

  _Unwind_Resume(a1);
}

void *sub_1DDBEE41C(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1DDBEE4C8(a1, a2);
    os_signpost_id_t v4 = (char *)a1[1];
    size_t v5 = 72 * ((72 * a2 - 72) / 0x48) + 72;
    bzero(v4, v5);
    a1[1] = &v4[v5];
  }
  return a1;
}

void sub_1DDBEE4B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

char *sub_1DDBEE4C8(void *a1, unint64_t a2)
{
  if (a2 >= 0x38E38E38E38E38FLL) {
    sub_1DDA17F78();
  }
  __n128 result = (char *)sub_1DDBEE520((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[72 * v4];
  return result;
}

void *sub_1DDBEE520(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x38E38E38E38E38FLL) {
    sub_1DDA18058();
  }
  return operator new(72 * a2);
}

void sub_1DDBEE56C(void ***a1)
{
  int v2 = *a1;
  if (*v2)
  {
    sub_1DDBEE5C0((uint64_t *)v2);
    unsigned int v3 = **a1;
    operator delete(v3);
  }
}

void sub_1DDBEE5C0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 72)
  {
    uint64_t v4 = *(void **)(i - 24);
    if (v4)
    {
      *(void *)(i - 16) = v4;
      operator delete(v4);
    }
  }
  a1[1] = v2;
}

CFTypeRef sub_1DDBEE614()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB91410, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB91410))
  {
    qword_1EAB91408 = (uint64_t)CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], byte_1DDC0D9E8, 480, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    __cxa_guard_release(&qword_1EAB91410);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB91420, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB91420))
  {
    qword_1EAB91418 = MEMORY[0x1E01C3590](qword_1EAB91408);
    __cxa_guard_release(&qword_1EAB91420);
  }
  CGColorSpaceRetain((CGColorSpaceRef)qword_1EAB91418);
  v0 = (const void *)qword_1EAB91418;

  return CFAutorelease(v0);
}

void sub_1DDBEE6F0(_Unwind_Exception *a1)
{
}

CFTypeRef sub_1DDBEE718()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB91380, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB91380))
  {
    qword_1EAB91378 = (uint64_t)CGColorSpaceCreateCalibratedGray(dbl_1DDC0D1A0, 0, 1.0);
    __cxa_guard_release(&qword_1EAB91380);
  }
  CGColorSpaceRetain((CGColorSpaceRef)qword_1EAB91378);
  v0 = (const void *)qword_1EAB91378;

  return CFAutorelease(v0);
}

void sub_1DDBEE79C(_Unwind_Exception *a1)
{
}

CFTypeRef sub_1DDBEE7B4()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB91390, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB91390))
  {
    qword_1EAB91388 = (uint64_t)CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], byte_1DDC0D1B8, 476, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    __cxa_guard_release(&qword_1EAB91390);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB913A0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB913A0))
  {
    qword_1EAB91398 = MEMORY[0x1E01C3590](qword_1EAB91388);
    __cxa_guard_release(&qword_1EAB913A0);
  }
  CGColorSpaceRetain((CGColorSpaceRef)qword_1EAB91398);
  v0 = (const void *)qword_1EAB91398;

  return CFAutorelease(v0);
}

void sub_1DDBEE890(_Unwind_Exception *a1)
{
}

CFTypeRef sub_1DDBEE8B8()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB913B0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB913B0))
  {
    qword_1EAB913A8 = (uint64_t)CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], byte_1DDC0D395, 572, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    __cxa_guard_release(&qword_1EAB913B0);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB913C0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB913C0))
  {
    qword_1EAB913B8 = MEMORY[0x1E01C3590](qword_1EAB913A8);
    __cxa_guard_release(&qword_1EAB913C0);
  }
  CGColorSpaceRetain((CGColorSpaceRef)qword_1EAB913B8);
  v0 = (const void *)qword_1EAB913B8;

  return CFAutorelease(v0);
}

void sub_1DDBEE994(_Unwind_Exception *a1)
{
}

CFTypeRef sub_1DDBEE9BC()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB913D0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB913D0))
  {
    qword_1EAB913C8 = (uint64_t)CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], byte_1DDC0D5D2, 528, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    __cxa_guard_release(&qword_1EAB913D0);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB913E0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB913E0))
  {
    qword_1EAB913D8 = MEMORY[0x1E01C3590](qword_1EAB913C8);
    __cxa_guard_release(&qword_1EAB913E0);
  }
  CGColorSpaceRetain((CGColorSpaceRef)qword_1EAB913D8);
  v0 = (const void *)qword_1EAB913D8;

  return CFAutorelease(v0);
}

void sub_1DDBEEA98(_Unwind_Exception *a1)
{
}

CFTypeRef sub_1DDBEEAC0()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB913F0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB913F0))
  {
    qword_1EAB913E8 = (uint64_t)CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], byte_1DDC0D7E3, 516, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    __cxa_guard_release(&qword_1EAB913F0);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB91400, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB91400))
  {
    qword_1EAB913F8 = MEMORY[0x1E01C3590](qword_1EAB913E8);
    __cxa_guard_release(&qword_1EAB91400);
  }
  CGColorSpaceRetain((CGColorSpaceRef)qword_1EAB913F8);
  v0 = (const void *)qword_1EAB913F8;

  return CFAutorelease(v0);
}

void sub_1DDBEEB9C(_Unwind_Exception *a1)
{
}

CFTypeRef sub_1DDBEEBC4()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB91430, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB91430))
  {
    qword_1EAB91428 = (uint64_t)CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    __cxa_guard_release(&qword_1EAB91430);
  }
  CGColorSpaceRetain((CGColorSpaceRef)qword_1EAB91428);
  v0 = (const void *)qword_1EAB91428;

  return CFAutorelease(v0);
}

void sub_1DDBEEC44(_Unwind_Exception *a1)
{
}

CFTypeRef sub_1DDBEEC5C()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB91440, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB91440))
  {
    qword_1EAB91438 = (uint64_t)CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB78]);
    __cxa_guard_release(&qword_1EAB91440);
  }
  CGColorSpaceRetain((CGColorSpaceRef)qword_1EAB91438);
  v0 = (const void *)qword_1EAB91438;

  return CFAutorelease(v0);
}

void sub_1DDBEECDC(_Unwind_Exception *a1)
{
}

CFTypeRef sub_1DDBEECF4()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB91450, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB91450))
  {
    qword_1EAB91448 = (uint64_t)CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], byte_1DDC0DBCC, 548, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    __cxa_guard_release(&qword_1EAB91450);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB91460, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB91460))
  {
    qword_1EAB91458 = MEMORY[0x1E01C3590](qword_1EAB91448);
    __cxa_guard_release(&qword_1EAB91460);
  }
  CGColorSpaceRetain((CGColorSpaceRef)qword_1EAB91458);
  v0 = (const void *)qword_1EAB91458;

  return CFAutorelease(v0);
}

void sub_1DDBEEDD0(_Unwind_Exception *a1)
{
}

CFTypeRef sub_1DDBEEDF8()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB91470, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB91470))
  {
    qword_1EAB91468 = (uint64_t)CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC50]);
    __cxa_guard_release(&qword_1EAB91470);
  }
  CGColorSpaceRetain((CGColorSpaceRef)qword_1EAB91468);
  v0 = (const void *)qword_1EAB91468;

  return CFAutorelease(v0);
}

void sub_1DDBEEE78(_Unwind_Exception *a1)
{
}

CFTypeRef sub_1DDBEEE90()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB91480, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB91480))
  {
    qword_1EAB91478 = (uint64_t)CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC48]);
    __cxa_guard_release(&qword_1EAB91480);
  }
  CGColorSpaceRetain((CGColorSpaceRef)qword_1EAB91478);
  v0 = (const void *)qword_1EAB91478;

  return CFAutorelease(v0);
}

void sub_1DDBEEF10(_Unwind_Exception *a1)
{
}

CFTypeRef sub_1DDBEEF28(void *a1)
{
  uint64_t v1 = a1;
  CGColorSpaceRef v2 = CGColorSpaceCreateWithName(v1);
  if (v2) {
    CFTypeRef v3 = CFAutorelease(v2);
  }
  else {
    CFTypeRef v3 = 0;
  }

  return v3;
}

void sub_1DDBEEF6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DDBEEF7C(uint64_t a1, int a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = sub_1DDBF0D7C(a1, a2);
  *(void *)uint64_t v17 = &unk_1F398ED78;
  *(_OWORD *)(v17 + 16) = 0u;
  *(_OWORD *)(v17 + 32) = 0u;
  *(void *)(v17 + 48) = 0;
  *(double *)uint64_t v19 = a3;
  *(double *)&v19[1] = a4;
  *(double *)&v19[2] = a5;
  *(double *)&uint64_t v19[3] = a6;
  *(double *)&v19[4] = a7;
  sub_1DDA25BB0((char *)(v17 + 16), (char *)v19, (uint64_t)&v20, 5uLL);
  *(double *)(a1 + 40) = a8;
  *(double *)(a1 + 48) = a9;
  return a1;
}

void sub_1DDBEF074(_Unwind_Exception *exception_object)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 24) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBEF094(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = sub_1DDBF0D7C(a1, a2);
  *(void *)uint64_t v5 = &unk_1F398ED78;
  *(_OWORD *)(v5 + 16) = 0u;
  uint64_t v6 = (char *)(v5 + 16);
  *(_OWORD *)(v5 + 32) = 0u;
  *(void *)(v5 + 48) = 0;
  double v7 = sub_1DDA1A030(*a3);
  double v8 = sub_1DDA1A030(*a3);
  double v9 = sub_1DDA1A030(*a3);
  double v10 = sub_1DDA1A030(*a3);
  double v11 = sub_1DDA1A030(*a3);
  double v12 = sub_1DDA1A030(*a3);
  double v13 = sub_1DDA1A030(*a3);
  *(double *)uint64_t v15 = v7;
  *(double *)&v15[1] = v8;
  *(double *)&v15[2] = v9;
  *(double *)&void v15[3] = v10;
  *(double *)&v15[4] = v11;
  sub_1DDA25BB0(v6, (char *)v15, (uint64_t)&v16, 5uLL);
  *(double *)(a1 + 40) = v12;
  *(double *)(a1 + 48) = v13;
  return a1;
}

void sub_1DDBEF1C8(_Unwind_Exception *exception_object)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 24) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

id sub_1DDBEF204(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v60[5] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, a3, a4, a5);
  v59[0] = @"kr0";
  double v11 = objc_msgSend_numberWithDouble_(NSNumber, v7, v8, v9, v10, **(double **)(a1 + 16));
  v60[0] = v11;
  v59[1] = @"k1";
  uint64_t v16 = objc_msgSend_numberWithDouble_(NSNumber, v12, v13, v14, v15, *(double *)(*(void *)(a1 + 16) + 8));
  v60[1] = v16;
  v59[2] = @"k2";
  unsigned int v21 = objc_msgSend_numberWithDouble_(NSNumber, v17, v18, v19, v20, *(double *)(*(void *)(a1 + 16) + 16));
  v60[2] = v21;
  v59[3] = @"k3";
  long long v26 = objc_msgSend_numberWithDouble_(NSNumber, v22, v23, v24, v25, *(double *)(*(void *)(a1 + 16) + 24));
  v60[3] = v26;
  v59[4] = @"k4";
  unsigned int v31 = objc_msgSend_numberWithDouble_(NSNumber, v27, v28, v29, v30, *(double *)(*(void *)(a1 + 16) + 32));
  v60[4] = v31;
  int v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v32, (uint64_t)v60, (uint64_t)v59, 5);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v34, (uint64_t)v33, @"Coefficients", v35);

  double v36 = *(double *)(a1 + 48);
  int v41 = objc_msgSend_numberWithDouble_(NSNumber, v37, v38, v39, v40, *(double *)(a1 + 40));
  v58[0] = v41;
  unsigned int v46 = objc_msgSend_numberWithDouble_(NSNumber, v42, v43, v44, v45, v36);
  v58[1] = v46;
  unsigned int v49 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v47, (uint64_t)v58, 2, v48);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v50, (uint64_t)v49, @"NormalizedCenter", v51);

  int v52 = [RAWOpcodeFixVignetteRadial alloc];
  unsigned int v56 = objc_msgSend_initWithArguments_(v52, v53, (uint64_t)v6, v54, v55);

  return v56;
}

void sub_1DDBEF448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1DDBEF4D0(void *a1)
{
  *a1 = &unk_1F398ED78;
  CGColorSpaceRef v2 = (void *)a1[2];
  if (v2)
  {
    a1[3] = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_1DDBEF520(void *a1)
{
  *a1 = &unk_1F398ED78;
  CGColorSpaceRef v2 = (void *)a1[2];
  if (v2)
  {
    a1[3] = v2;
    operator delete(v2);
  }

  JUMPOUT(0x1E01C3DC0);
}

uint64_t sub_1DDBEF590()
{
  return 3;
}

void sub_1DDBEF7A4(_Unwind_Exception *a1)
{
}

void sub_1DDBEF7B8(uint64_t a1)
{
  CGColorSpaceRef v2 = sub_1DDA83E7C();
  CFTypeRef v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DDA14000, v3, OS_SIGNPOST_INTERVAL_END, v4, "RAWCropFilter", (const char *)&unk_1DDC3ACB6, v5, 2u);
  }
}

void sub_1DDBEF9B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DDBEFC5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DDBF03EC(_Unwind_Exception *a1)
{
}

void sub_1DDBF03F8(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_1DDA16678(a1);
  }
  _Unwind_Resume(a1);
}

void sub_1DDBF0414(uint64_t a1)
{
  CGColorSpaceRef v2 = sub_1DDA83E7C();
  CFTypeRef v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DDA14000, v3, OS_SIGNPOST_INTERVAL_END, v4, "RAWGainMap", (const char *)&unk_1DDC3ACB6, v5, 2u);
  }
}

void sub_1DDBF05A4(os_signpost_id_t a1)
{
  CGColorSpaceRef v2 = sub_1DDA83CFC();
  CFTypeRef v3 = v2;
  if (a1 + 1 >= 2 && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DDA14000, v3, OS_SIGNPOST_INTERVAL_BEGIN, a1, "CPacked14SwappedUnpacker", (const char *)&unk_1DDC3ACB6, buf, 2u);
  }

  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = sub_1DDBF0CF4;
  v76[3] = &unk_1E6D04A58;
  v76[4] = a1;
  os_signpost_id_t v4 = (void (**)(void))MEMORY[0x1E01C46E0](v76);
  unsigned int v6 = *(_DWORD *)(a1 + 44);
  unsigned int v5 = *(_DWORD *)(a1 + 48);
  int v63 = (unint64_t *)(a1 + 200);
  char v7 = *(void *)(a1 + 200) != 0;
  int v8 = (*(uint64_t (**)(os_signpost_id_t))(*(void *)a1 + 152))(a1);
  unint64_t v9 = v5 >> v7;
  unsigned int v10 = (v6 + 9) / 0xA;
  int v11 = 16 * v10 * v9;
  int v12 = 8 * v10;
  if (v11 == v8) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = (14 * v6) >> 3;
  }
  if (v11 == v8) {
    uint64_t v14 = 8;
  }
  else {
    uint64_t v14 = 7;
  }
  int v15 = *(_DWORD *)(a1 + 188);
  if (v13 * v9 > (*(unsigned int (**)(os_signpost_id_t))(*(void *)a1 + 152))(a1))
  {
    exceptiouint64_t n = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01C3B90](exception, "RawCameraException");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  uint64_t v72 = *(unsigned int *)(a1 + 192);
  uint64_t v73 = a1;
  __int16 v66 = v4;
  unint64_t v71 = v9;
  if (v72 == 2)
  {
    unsigned int v74 = ((*(unsigned int (**)(os_signpost_id_t))(*(void *)a1 + 152))(a1) >> 1)
        - v13 * (v9 >> 1);
    sub_1DDA18410((int *)buf, (int *)&v74);
    int v67 = *(_DWORD *)buf;
    if (!*v63)
    {
LABEL_42:
      unint64_t v44 = 0;
      int v45 = 0;
      unsigned int v46 = v6 & 0xFFFFFFFC;
      do
      {
        uint64_t v47 = sub_1DDAA5B9C(v73);
        unint64_t v69 = v44;
        if (v44 < v71)
        {
          uint64_t v48 = (char *)(v47 + 2 * v6 * v44);
          unsigned int v49 = v45;
          do
          {
            uint64_t v50 = 2 * v6 - v13;
            (*(void (**)(void, char *, void))(**(void **)(v73 + 24) + 32))(*(void *)(v73 + 24), &v48[v50], v13);
            if (v44) {
              int v45 = v49;
            }
            else {
              int v45 = v15;
            }
            if (v44) {
              int v51 = 0;
            }
            else {
              int v51 = v15;
            }
            if (v46)
            {
              unsigned int v52 = 0;
              int v53 = (unsigned __int8 *)&v48[v50 + 3 + v49];
              do
              {
                unsigned int v54 = *(v53 - 2);
                unsigned int v55 = *v53;
                unsigned int v56 = v53[2];
                __int16 v57 = *(v53 - 3) | ((v54 & 0x3F) << 8);
                __int16 v58 = v53[3];
                int v59 = (4 * *(v53 - 1)) & 0xC3FF | ((v55 & 0xF) << 10) | (v54 >> 6);
                int v60 = (16 * v53[1]) & 0xCFFF | ((v56 & 3) << 12) | (v55 >> 4);
                *(_WORD *)uint64_t v48 = v57;
                *((_WORD *)v48 + 1) = v59;
                *((_WORD *)v48 + 2) = v60;
                *((_WORD *)v48 + 3) = (v56 >> 2) | (v58 << 6);
                v48 += 8;
                v52 += 4;
                v53 += v14;
              }
              while (v52 < v46);
            }
            v13 += v51;
            v48 += 2 * (v72 - 1) * v6;
            LODWORD(v44) = v44 + v72;
            unsigned int v49 = v45;
          }
          while (v44 < v71);
        }
        os_signpost_id_t v4 = v66;
        if (v67 && !v69)
        {
          uint64_t v61 = *(void *)(v73 + 24);
          *(_DWORD *)buf = v67;
          (*(void (**)(uint64_t, uint8_t *, uint64_t))(*(void *)v61 + 40))(v61, buf, 1);
        }
        unint64_t v44 = v69 + 1;
      }
      while (v69 + 1 != v72);
      goto LABEL_59;
    }
  }
  else
  {
    if (!*v63)
    {
      if (!v72) {
        goto LABEL_59;
      }
      int v67 = 0;
      goto LABEL_42;
    }
    int v67 = 0;
  }
  char v16 = 0;
  uint64_t v17 = 0;
  int v70 = 2 * v6;
  char v18 = 1;
  do
  {
    char v64 = v18;
    uint64_t v19 = v73;
    if (v16)
    {
      uint64_t v20 = *(void *)(v73 + 24);
      sub_1DDA18488(buf, v63);
      (*(void (**)(uint64_t, uint8_t *, void))(*(void *)v20 + 40))(v20, buf, 0);
      os_signpost_id_t v4 = v66;
    }
    if (v72)
    {
      int v21 = 0;
      uint64_t v65 = v17 * v72 * v6;
      unint64_t v22 = 0;
      do
      {
        uint64_t v23 = sub_1DDAA5B9C(v19);
        unint64_t v68 = v22;
        if (v22 < v71)
        {
          uint64_t v24 = (char *)(v23 + 2 * v6 * v22 + 2 * v65);
          do
          {
            (*(void (**)(void, char *, void))(**(void **)(v73 + 24) + 32))(*(void *)(v73 + 24), &v24[v70 - v13], v13);
            uint64_t v25 = (unsigned __int8 *)&v24[v70 - v13 + v21];
            if (v22)
            {
              int v26 = 0;
            }
            else
            {
              int v21 = v15;
              int v26 = v15;
            }
            if (v6 == v6 % 0xA)
            {
              unsigned int v27 = 0;
            }
            else
            {
              unsigned int v27 = 0;
              do
              {
                unsigned int v28 = v25[1];
                __int16 v29 = *v25 | ((v28 & 0xF) << 8);
                LOWORD(v28) = (v28 >> 4) | (16 * v25[2]);
                unsigned int v30 = v25[4];
                __int16 v31 = v25[3] | ((v30 & 0xF) << 8);
                LOWORD(v30) = (v30 >> 4) | (16 * v25[5]);
                *(_WORD *)uint64_t v24 = v29;
                *((_WORD *)v24 + 1) = v28;
                unsigned int v32 = v25[7];
                __int16 v33 = v25[6] | ((v32 & 0xF) << 8);
                LOWORD(v32) = (v32 >> 4) | (16 * v25[8]);
                *((_WORD *)v24 + 2) = v31;
                *((_WORD *)v24 + 3) = v30;
                unsigned int v34 = v25[10];
                __int16 v35 = v25[9] | ((v34 & 0xF) << 8);
                int v36 = (v34 >> 4) | (16 * v25[11]);
                *((_WORD *)v24 + 4) = v33;
                *((_WORD *)v24 + 5) = v32;
                unsigned int v37 = v25[13];
                __int16 v38 = v25[12] | ((v37 & 0xF) << 8);
                int v39 = (v37 >> 4) | (16 * v25[14]);
                *((_WORD *)v24 + 6) = v35;
                *((_WORD *)v24 + 7) = v36;
                *((_WORD *)v24 + 8) = v38;
                *((_WORD *)v24 + 9) = v39;
                v25 += v14;
                v24 += 20;
                v27 += 10;
              }
              while (v27 < 10 * (v6 / 0xA));
            }
            while (v27 < v6)
            {
              unsigned int v40 = v25[1];
              __int16 v41 = *v25 | ((v40 & 0xF) << 8);
              int v42 = (v40 >> 4) | (16 * v25[2]);
              *(_WORD *)uint64_t v24 = v41;
              *((_WORD *)v24 + 1) = v42;
              v25 += 3;
              v24 += 4;
              v27 += 2;
            }
            v13 += v26;
            v24 += 2 * (2 * v72 - 1) * v6;
            LODWORD(v22) = v22 + v72;
          }
          while (v22 < v71);
        }
        os_signpost_id_t v4 = v66;
        uint64_t v19 = v73;
        if (v67 && !v68)
        {
          uint64_t v43 = *(void *)(v73 + 24);
          *(_DWORD *)buf = v67;
          (*(void (**)(uint64_t, uint8_t *, uint64_t))(*(void *)v43 + 40))(v43, buf, 1);
        }
        unint64_t v22 = v68 + 1;
      }
      while (v68 + 1 != v72);
    }
    char v18 = 0;
    char v16 = 1;
    uint64_t v17 = 1;
  }
  while ((v64 & 1) != 0);
LABEL_59:
  v4[2](v4);
}

void sub_1DDBF0C90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DDBF0CF4(uint64_t a1)
{
  CGColorSpaceRef v2 = sub_1DDA83CFC();
  CFTypeRef v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DDA14000, v3, OS_SIGNPOST_INTERVAL_END, v4, "CPacked14SwappedUnpacker", (const char *)&unk_1DDC3ACB6, v5, 2u);
  }
}

uint64_t sub_1DDBF0D7C(uint64_t result, int a2)
{
  *(void *)__n128 result = &unk_1F398EEB0;
  *(_DWORD *)(result + 8) = a2;
  return result;
}

void sub_1DDBF0E18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DDBF0F48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *sub_1DDBF100C@<X0>(uint64_t *result@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2 = (uint64_t)result;
  uint64_t v4 = result[63];
  if (!v4)
  {
    sub_1DDA27D28((uint64_t)result, &v12);
    LODWORD(v10) = 0;
    sub_1DDA1A94C(v13, (uint64_t *)&v12, (uint64_t)&v10, 0);
    if (*((void *)&v12 + 1)) {
      sub_1DDA18310(*((std::__shared_weak_count **)&v12 + 1));
    }
    sub_1DDA27D28(v2, &v10);
    sub_1DDBEA254(&v10, &v12);
    unsigned int v5 = (uint64_t *)(v2 + 504);
    long long v6 = v12;
    long long v12 = 0uLL;
    char v7 = *(std::__shared_weak_count **)(v2 + 512);
    *(_OWORD *)(v2 + 504) = v6;
    if (v7)
    {
      sub_1DDA18310(v7);
      if (*((void *)&v12 + 1)) {
        sub_1DDA18310(*((std::__shared_weak_count **)&v12 + 1));
      }
    }
    if (v11) {
      sub_1DDA18310(v11);
    }
    if (!*v5)
    {
      exceptiouint64_t n = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1E01C3B90](exception, "RawCameraException");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    __n128 result = sub_1DDA1AA18(v13);
    uint64_t v4 = *v5;
  }
  uint64_t v8 = *(void *)(v2 + 512);
  *a2 = v4;
  a2[1] = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1DDBF112C(_Unwind_Exception *a1, uint64_t a2, std::__shared_weak_count *a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  if (a3) {
    sub_1DDA18310(a3);
  }
  sub_1DDA1AA18((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1DDBF1344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DDBF15D0(_Unwind_Exception *a1)
{
  long long v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1DDBF1AC8(_Unwind_Exception *a1)
{
}

void sub_1DDBF1AD4(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_1DDA16678(a1);
  }
  _Unwind_Resume(a1);
}

void sub_1DDBF1AF0(uint64_t a1)
{
  uint64_t v2 = sub_1DDA83E7C();
  CFTypeRef v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DDA14000, v3, OS_SIGNPOST_INTERVAL_END, v4, "RAWLensCorrectionDNG", (const char *)&unk_1DDC3ACB6, v5, 2u);
  }
}

double sub_1DDBF1B78(uint64_t a1, double a2, double a3)
{
  id v5 = *(id *)(*(void *)(a1 + 32) + 88);
  id v6 = *(id *)(*(void *)(a1 + 32) + 96);
  int v11 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v7, v8, v9, v10, *(float *)(a1 + 48), *(float *)(a1 + 52));
  objc_msgSend_X(v5, v12, v13, v14, v15);
  double v17 = v16;
  objc_msgSend_Y(v5, v18, v19, v20, v21);
  double v23 = v22;
  objc_msgSend_Z(v5, v24, v25, v26, v27);
  double v29 = v28;
  objc_msgSend_W(v5, v30, v31, v32, v33);
  double v35 = v34;
  objc_msgSend_X(v6, v36, v37, v38, v39);
  double v41 = v40;
  objc_msgSend_Y(v6, v42, v43, v44, v45);
  double v47 = v46;
  objc_msgSend_X(v11, v48, v49, v50, v51);
  double v53 = v52;
  objc_msgSend_Y(v11, v54, v55, v56, v57);
  float v58 = v47;
  float v59 = v41;
  float v60 = v35;
  float v61 = v29;
  float v62 = v23;
  float v63 = v17;
  float v64 = v53;
  *(float *)&double v65 = v65;
  float v66 = a2;
  float v67 = a3;
  float v68 = *(double *)(a1 + 40);
  float v69 = (float)(v66 - v64) / v68;
  float v70 = (float)(v67 - *(float *)&v65) / v68;
  float v71 = (float)(v70 * v70) + (float)(v69 * v69);
  float v72 = (v71 + (v69 + v69) * v69) * v58 + v59 * ((v69 + v69) * v70);
  double v73 = (float)((float)((float)((float)(v69
                                      * (float)((float)((float)((float)(v71 * v62) + v63)
                                                      + (float)(v61 * (float)(v71 * v71)))
                                              + (float)(v60 * (float)(v71 * (float)(v71 * v71)))))
                              + v72)
                      * v68)
              + v64);

  return v73;
}

void sub_1DDBF1D5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_1DDBF1D84(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v29 = a3 + a5;
  double v7 = *MEMORY[0x1E4F1DB20];
  CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  double v28 = a2 + a4;
  float v10 = 0.0;
  double v11 = 0.0;
  do
  {
    float r1_12 = v10;
    v44.origin.CGFloat x = (*(double (**)(double, double))(*(void *)(a1 + 32) + 16))(a2 + a4 * v11, a3);
    v44.origin.CGFloat y = v12;
    v44.size.CGFloat width = 0.0;
    v44.size.CGFloat height = 0.0;
    v36.origin.CGFloat x = v7;
    v36.origin.CGFloat y = v6;
    v36.size.CGFloat width = v9;
    v36.size.CGFloat height = v8;
    CGRect v37 = CGRectUnion(v36, v44);
    CGFloat x = v37.origin.x;
    CGFloat y = v37.origin.y;
    CGFloat width = v37.size.width;
    CGFloat height = v37.size.height;
    v45.origin.CGFloat x = (*(double (**)(double, double))(*(void *)(a1 + 32) + 16))(a2 + a4 * (1.0 - v11), v29);
    v45.origin.CGFloat y = v17;
    v45.size.CGFloat width = 0.0;
    v45.size.CGFloat height = 0.0;
    v38.origin.CGFloat x = x;
    v38.origin.CGFloat y = y;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    CGRect v39 = CGRectUnion(v38, v45);
    CGFloat r1 = v39.origin.x;
    CGFloat v18 = v39.origin.y;
    CGFloat v19 = v39.size.width;
    CGFloat v20 = v39.size.height;
    v46.origin.CGFloat x = (*(double (**)(double, double))(*(void *)(a1 + 32) + 16))(a2, a3 + a5 * (1.0 - v11));
    v46.origin.CGFloat y = v21;
    v46.size.CGFloat width = 0.0;
    v46.size.CGFloat height = 0.0;
    v40.origin.CGFloat x = r1;
    v40.origin.CGFloat y = v18;
    v40.size.CGFloat width = v19;
    v40.size.CGFloat height = v20;
    CGRect v41 = CGRectUnion(v40, v46);
    CGFloat v22 = v41.origin.x;
    CGFloat v23 = v41.origin.y;
    CGFloat v24 = v41.size.width;
    CGFloat v25 = v41.size.height;
    v47.origin.CGFloat x = (*(double (**)(double, double))(*(void *)(a1 + 32) + 16))(v28, a3 + a5 * v11);
    v47.origin.CGFloat y = v26;
    v47.size.CGFloat width = 0.0;
    v47.size.CGFloat height = 0.0;
    v42.origin.CGFloat x = v22;
    v42.origin.CGFloat y = v23;
    v42.size.CGFloat width = v24;
    v42.size.CGFloat height = v25;
    CGRect v43 = CGRectUnion(v42, v47);
    double v7 = v43.origin.x;
    CGFloat v6 = v43.origin.y;
    CGFloat v9 = v43.size.width;
    CGFloat v8 = v43.size.height;
    float v10 = r1_12 + 0.125;
    double v11 = (float)(r1_12 + 0.125);
  }
  while (v11 < 0.99999);
  return v7;
}

void *sub_1DDBF2024(size_t a1, size_t a2)
{
  uint64_t v2 = malloc_type_calloc(a1, a2, 0xB0CC55A9uLL);
  if (!v2) {
    sub_1DDBF205C();
  }
  return v2;
}

uint64_t sub_1DDBF205C()
{
  return printf("%d\n", v1);
}

void *sub_1DDBF2084(size_t a1)
{
  int v1 = malloc_type_malloc(a1, 0x4A9B4B8DuLL);
  if (!v1) {
    sub_1DDBF205C();
  }
  return v1;
}

void *sub_1DDBF20BC(size_t a1)
{
  int v1 = malloc_type_valloc(a1, 0x3C00A759uLL);
  if (!v1) {
    sub_1DDBF205C();
  }
  return v1;
}

void *sub_1DDBF20FC(const __CFAllocator *a1, CFIndex a2, CFOptionFlags a3)
{
  CFTypeRef v3 = CFAllocatorAllocate(a1, a2, a3);
  if (!v3) {
    sub_1DDBF205C();
  }
  return v3;
}

id sub_1DDBF2130(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v43[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F30058];
  uint64_t v34 = *MEMORY[0x1E4F30038];
  uint64_t v35 = v5;
  v42[0] = MEMORY[0x1E4F1CC28];
  v42[1] = @"com.phaseone.raw-image";
  uint64_t v6 = *MEMORY[0x1E4F30050];
  uint64_t v36 = *MEMORY[0x1E4F30018];
  v42[2] = @".iiq.";
  v42[3] = &unk_1F39AFB18;
  v42[4] = &unk_1F39AFB30;
  double v7 = objc_msgSend_numberWithUnsignedLong_(NSNumber, a2, (uint64_t)sub_1DDBF2428, a4, a5, v34, v35, v36, v6, *MEMORY[0x1E4F30040], *MEMORY[0x1E4F30048]);
  v42[5] = v7;
  uint64_t v37 = *MEMORY[0x1E4F30000];
  double v11 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v8, (uint64_t)sub_1DDBF2544, v9, v10);
  v42[6] = v11;
  uint64_t v38 = *MEMORY[0x1E4F30020];
  uint64_t v15 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v12, (uint64_t)sub_1DDBF2550, v13, v14);
  v42[7] = v15;
  uint64_t v39 = *MEMORY[0x1E4F30008];
  CGFloat v19 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v16, (uint64_t)sub_1DDA818EC, v17, v18);
  v42[8] = v19;
  uint64_t v40 = *MEMORY[0x1E4F30028];
  CGFloat v23 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v20, (uint64_t)sub_1DDBF255C, v21, v22);
  v42[9] = v23;
  uint64_t v41 = *MEMORY[0x1E4F30030];
  uint64_t v27 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v24, (uint64_t)sub_1DDBF2568, v25, v26);
  v42[10] = v27;
  double v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v28, (uint64_t)v42, (uint64_t)&v34, 11);
  v43[0] = v29;
  uint64_t v32 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v30, (uint64_t)v43, 1, v31);

  return v32;
}

void sub_1DDBF23C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_1DDBF2428(unsigned __int8 *a1, unint64_t a2)
{
  if (a2 < 0x10) {
    return 0;
  }
  uint64_t v8 = v2;
  uint64_t v9 = v3;
  unsigned __int16 v7 = 42;
  BOOL result = sub_1DDA57F94(a1, a2, &v7);
  if (result)
  {
    int v6 = *a1;
    if (v6 == 73)
    {
      if (a1[8] != 73 || a1[9] != 73 || a1[10] != 73 || a1[11] != 73 || a1[13] != 119 || a1[14] != 97 || a1[15] != 82) {
        return 0;
      }
    }
    else if (v6 != 77 {
           || a1[8] != 77
    }
           || a1[9] != 77
           || a1[10] != 77
           || a1[11] != 77
           || a1[12] != 82
           || a1[13] != 97
           || a1[14] != 119)
    {
      return 0;
    }
    return 1;
  }
  return result;
}

void sub_1DDBF2544(const void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_1DDBF2550(os_signpost_id_t a1)
{
  return sub_1DDA81764(a1);
}

uint64_t sub_1DDBF255C(os_signpost_id_t a1, unint64_t a2, unint64_t a3)
{
  return sub_1DDA7FF34(a1, a2, a3, &unk_1F398EEE8);
}

uint64_t sub_1DDBF2568(os_signpost_id_t a1, unint64_t a2, unint64_t a3)
{
  return sub_1DDA82568(a1, a2, a3, &unk_1F398EEE8);
}

void sub_1DDBF2574(void *a1@<X1>, char a2@<W2>, void *a3@<X3>, void *a4@<X4>, _OWORD *a5@<X8>)
{
  char v11 = a2;
  id v10 = a3;
  id v9 = a4;
  sub_1DDBF3510(a1, &v11, &v10, &v9, &v8);
  *a5 = v8;
}

void sub_1DDBF25F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1DDBF2610(void **a1)
{
  sub_1DDA3F4AC(a1);
  uint64_t v2 = (*((void (**)(void **))*a1 + 50))(a1);
  if (v2)
  {
    id v16 = v2;
    uint64_t v3 = sub_1DDA7A98C(v2, (void *)*MEMORY[0x1E4F2FD40], 0);
    uint64_t v4 = *MEMORY[0x1E4F2FD70];
    long long v8 = objc_msgSend_objectForKeyedSubscript_(v3, v5, *MEMORY[0x1E4F2FD70], v6, v7);

    if (!v8)
    {
      id v9 = NSNumber;
      sub_1DDBF276C((uint64_t *)a1, &v17);
      uint64_t v13 = objc_msgSend_numberWithUnsignedShort_(v9, v10, *(unsigned __int16 *)(v17 + 184), v11, v12);
      objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, v4, v15);

      if (v18) {
        sub_1DDA18310(v18);
      }
    }

    uint64_t v2 = v16;
  }
}

void sub_1DDBF2724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, std::__shared_weak_count *a12)
{
  uint64_t v14 = v13;

  if (a12) {
    sub_1DDA18310(a12);
  }

  _Unwind_Resume(a1);
}

uint64_t *sub_1DDBF276C@<X0>(uint64_t *result@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2 = (uint64_t)result;
  uint64_t v4 = result[149];
  if (!v4)
  {
    sub_1DDA27D28((uint64_t)result, &v12);
    sub_1DDA1B2DC(&v10, (uint64_t *)(v2 + 1184));
    sub_1DDA1A94C(v13, (uint64_t *)&v12, (uint64_t)&v10, 0);
    if (*((void *)&v12 + 1)) {
      sub_1DDA18310(*((std::__shared_weak_count **)&v12 + 1));
    }
    sub_1DDA27D28(v2, &v10);
    sub_1DDBEA254(&v10, &v12);
    uint64_t v5 = (uint64_t *)(v2 + 1192);
    long long v6 = v12;
    long long v12 = 0uLL;
    uint64_t v7 = *(std::__shared_weak_count **)(v2 + 1200);
    *(_OWORD *)(v2 + 1192) = v6;
    if (v7)
    {
      sub_1DDA18310(v7);
      if (*((void *)&v12 + 1)) {
        sub_1DDA18310(*((std::__shared_weak_count **)&v12 + 1));
      }
    }
    if (v11) {
      sub_1DDA18310(v11);
    }
    if (!*v5)
    {
      exceptiouint64_t n = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1E01C3B90](exception, "RawCameraException");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    BOOL result = sub_1DDA1AA18(v13);
    uint64_t v4 = *v5;
  }
  uint64_t v8 = *(void *)(v2 + 1200);
  *a2 = v4;
  a2[1] = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1DDBF2894(_Unwind_Exception *a1, uint64_t a2, std::__shared_weak_count *a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  if (a3) {
    sub_1DDA18310(a3);
  }
  sub_1DDA1AA18((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1DDBF28E8(uint64_t a1)
{
  sub_1DDA27D28(a1, &v3);
  *(void *)(a1 + 1184) = (*(int (**)(uint64_t))(*(void *)v3 + 48))(v3);
  if (v4) {
    sub_1DDA18310(v4);
  }
  return 1;
}

void sub_1DDBF2958(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1DDA18310(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBF2970(uint64_t *a1)
{
  sub_1DDBF276C(a1, &v3);
  uint64_t v1 = sub_1DDBEAE8C(v3);
  if (v4) {
    sub_1DDA18310(v4);
  }
  return v1;
}

void sub_1DDBF29B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1DDA18310(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBF29D0(uint64_t *a1)
{
  sub_1DDBF276C(a1, &v3);
  uint64_t v1 = sub_1DDBEAE94(v3);
  if (v4) {
    sub_1DDA18310(v4);
  }
  return v1;
}

void sub_1DDBF2A18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1DDA18310(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBF2A30(uint64_t *a1)
{
  sub_1DDBF276C(a1, &v3);
  uint64_t v1 = sub_1DDA2546C(v3);
  if (v4) {
    sub_1DDA18310(v4);
  }
  return v1;
}

void sub_1DDBF2A78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1DDA18310(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBF2A90(uint64_t *a1)
{
  sub_1DDBF276C(a1, &v3);
  uint64_t v1 = sub_1DDAD6FB0(v3);
  if (v4) {
    sub_1DDA18310(v4);
  }
  return v1;
}

void sub_1DDBF2AD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1DDA18310(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBF2AF0(uint64_t *a1)
{
  sub_1DDBF276C(a1, &v3);
  uint64_t v1 = sub_1DDBEAE9C(v3);
  if (v4) {
    sub_1DDA18310(v4);
  }
  return v1;
}

void sub_1DDBF2B40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1DDA18310(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBF2B58(uint64_t *a1)
{
  sub_1DDBF276C(a1, &v3);
  uint64_t v1 = sub_1DDBEAEA8();
  if (v4) {
    sub_1DDA18310(v4);
  }
  return v1;
}

void sub_1DDBF2BA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1DDA18310(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBF2BB8(uint64_t *a1@<X0>, void **a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void **a5@<X8>)
{
  (*(void (**)(void **__return_ptr))(*a1 + 392))(__p);
  unint64_t v10 = v19;
  if ((v19 & 0x80u) != 0) {
    unint64_t v10 = (unint64_t)__p[1];
  }
  if (v10 == 11
    && ((v19 & 0x80u) == 0 ? (uint64_t v11 = __p) : (uint64_t v11 = (void **)__p[0]),
        (long long v12 = *v11, v13 = *(uint64_t *)((char *)v11 + 3), v12 == (void *)0x4965727574706143)
      ? (BOOL v14 = v13 == 0x6F666E4965727574)
      : (BOOL v14 = 0),
        v14))
  {
    sub_1DDBF276C(a1, &v16);
    uint64_t v15 = v16;
    a5[1] = 0;
    a5[2] = 0;
    *a5 = 0;
    sub_1DDA1808C(a5, *(const void **)(v15 + 88), *(void *)(v15 + 96), (uint64_t)(*(void *)(v15 + 96) - *(void *)(v15 + 88)) >> 3);
    if (v17) {
      sub_1DDA18310(v17);
    }
  }
  else
  {
    sub_1DDA282F0((uint64_t)a1, a2, a3, a4, a5);
  }
  if ((char)v19 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1DDBF2CF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a11) {
    sub_1DDA18310(a11);
  }
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DDBF2D28(uint64_t *a1)
{
  sub_1DDBF276C(a1, &v3);
  uint64_t v1 = sub_1DDBEAEB4();
  if (v4) {
    sub_1DDA18310(v4);
  }
  return v1;
}

void sub_1DDBF2D70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1DDA18310(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBF2D88(uint64_t *a1@<X0>, void *a2@<X1>, _OWORD *a3@<X2>, _OWORD *a4@<X8>)
{
  sub_1DDBF276C(a1, &v17);
  sub_1DDA27D28((uint64_t)a1, &v14);
  unint64_t v8 = (*(uint64_t (**)(uint64_t *))(*a1 + 424))(a1);
  v9.n128_f64[0] = sub_1DDB38598(&v14, v8, a2, a3, &v17, &v16);
  if (v15) {
    sub_1DDA18310(v15);
  }
  uint64_t v10 = v16;
  uint64_t v14 = (*(uint64_t (**)(uint64_t *, __n128))(*a1 + 432))(a1, v9);
  sub_1DDA18500(&v13, (unint64_t *)&v14);
  (*(void (**)(uint64_t, int *))(*(void *)v10 + 32))(v10, &v13);
  uint64_t v11 = v16;
  uint64_t v12 = (*(uint64_t (**)(uint64_t *))(*a1 + 104))(a1);
  sub_1DDAA72C4(v11, v12);
  *a4 = v16;
  if (v18) {
    sub_1DDA18310(v18);
  }
}

void sub_1DDBF2EEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1DDA18310(a16);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DDBF2F2C(void **a1, uint64_t a2, int a3)
{
  uint64_t v6 = (uint64_t)(a1 + 36);
  (*((void (**)(void **__return_ptr))*a1 + 49))(__p);
  uint64_t v7 = sub_1DDA2A530(v6, __p);
  unint64_t v8 = v7;
  if (a1 + 37 == v7) {
    double v9 = -1.0;
  }
  else {
    double v9 = *((double *)v7 + 7);
  }
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  if (a1 + 37 == v8 || v9 <= 0.0)
  {
    if (a3)
    {
      (*((void (**)(void **__return_ptr, void **, uint64_t))*a1 + 49))(__p, a1, a2);
      uint64_t v10 = sub_1DDA2A530((uint64_t)(a1 + 39), __p);
      if (a1 + 40 == v10) {
        double v11 = 0.0;
      }
      else {
        double v11 = *((double *)v10 + 7);
      }
      BOOL v13 = v11 > -100.0 && a1 + 40 != v10;
      if (v17 < 0)
      {
        operator delete(__p[0]);
        if (v13) {
          return sub_1DDA27858(v11);
        }
      }
      else if (v13)
      {
        return sub_1DDA27858(v11);
      }
    }
    return sub_1DDA276C8(a1, a2, a3);
  }
  return v9;
}

void sub_1DDBF30A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBF30C8(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  sub_1DDA1A880(&__p, "iq");
  unint64_t v4 = a2[2];
  unint64_t v5 = a2[1];
  if (v5 >= v4)
  {
    unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *a2) >> 3);
    unint64_t v8 = v7 + 1;
    if (v7 + 1 > 0xAAAAAAAAAAAAAAALL) {
      sub_1DDA17F78();
    }
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - *a2) >> 3);
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x555555555555555) {
      unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v10 = v8;
    }
    CGRect v45 = a2 + 2;
    if (v10) {
      double v11 = (char *)sub_1DDA2A160((uint64_t)(a2 + 2), v10);
    }
    else {
      double v11 = 0;
    }
    uint64_t v12 = &v11[24 * v7];
    uint64_t v41 = v11;
    CGRect v42 = v12;
    CGRect v44 = &v11[24 * v10];
    long long v13 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *((void *)v12 + 2) = *((void *)&__p.__r_.__value_.__l + 2);
    *(_OWORD *)uint64_t v12 = v13;
    memset(&__p, 0, sizeof(__p));
    CGRect v43 = v12 + 24;
    sub_1DDA2A0E8(a2, &v41);
    uint64_t v14 = a2[1];
    sub_1DDA2A2C8((uint64_t)&v41);
    int v15 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    a2[1] = v14;
    if (v15 < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    long long v6 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *(void *)(v5 + 16) = *((void *)&__p.__r_.__value_.__l + 2);
    *(_OWORD *)unint64_t v5 = v6;
    a2[1] = v5 + 24;
  }
  sub_1DDA1A880(&__p, "phaseone");
  unint64_t v17 = a2[1];
  unint64_t v16 = a2[2];
  if (v17 >= v16)
  {
    unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v17 - *a2) >> 3);
    unint64_t v20 = v19 + 1;
    if (v19 + 1 > 0xAAAAAAAAAAAAAAALL) {
      sub_1DDA17F78();
    }
    unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16 - *a2) >> 3);
    if (2 * v21 > v20) {
      unint64_t v20 = 2 * v21;
    }
    if (v21 >= 0x555555555555555) {
      unint64_t v22 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v22 = v20;
    }
    CGRect v45 = a2 + 2;
    if (v22) {
      CGFloat v23 = (char *)sub_1DDA2A160((uint64_t)(a2 + 2), v22);
    }
    else {
      CGFloat v23 = 0;
    }
    CGFloat v24 = &v23[24 * v19];
    uint64_t v41 = v23;
    CGRect v42 = v24;
    CGRect v44 = &v23[24 * v22];
    long long v25 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *((void *)v24 + 2) = *((void *)&__p.__r_.__value_.__l + 2);
    *(_OWORD *)CGFloat v24 = v25;
    memset(&__p, 0, sizeof(__p));
    CGRect v43 = v24 + 24;
    sub_1DDA2A0E8(a2, &v41);
    uint64_t v26 = a2[1];
    sub_1DDA2A2C8((uint64_t)&v41);
    int v27 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    a2[1] = v26;
    if (v27 < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    long long v18 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *(void *)(v17 + 16) = *((void *)&__p.__r_.__value_.__l + 2);
    *(_OWORD *)unint64_t v17 = v18;
    a2[1] = v17 + 24;
  }
  sub_1DDA29B20(a1, &__p);
  unint64_t v29 = a2[1];
  unint64_t v28 = a2[2];
  if (v29 >= v28)
  {
    unint64_t v31 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v29 - *a2) >> 3);
    unint64_t v32 = v31 + 1;
    if (v31 + 1 > 0xAAAAAAAAAAAAAAALL) {
      sub_1DDA17F78();
    }
    unint64_t v33 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v28 - *a2) >> 3);
    if (2 * v33 > v32) {
      unint64_t v32 = 2 * v33;
    }
    if (v33 >= 0x555555555555555) {
      unint64_t v34 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v34 = v32;
    }
    CGRect v45 = a2 + 2;
    if (v34) {
      uint64_t v35 = (char *)sub_1DDA2A160((uint64_t)(a2 + 2), v34);
    }
    else {
      uint64_t v35 = 0;
    }
    uint64_t v36 = &v35[24 * v31];
    uint64_t v41 = v35;
    CGRect v42 = v36;
    CGRect v44 = &v35[24 * v34];
    long long v37 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *((void *)v36 + 2) = *((void *)&__p.__r_.__value_.__l + 2);
    *(_OWORD *)uint64_t v36 = v37;
    memset(&__p, 0, sizeof(__p));
    CGRect v43 = v36 + 24;
    sub_1DDA2A0E8(a2, &v41);
    uint64_t v38 = a2[1];
    sub_1DDA2A2C8((uint64_t)&v41);
    int v39 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    a2[1] = v38;
    if (v39 < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    long long v30 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *(void *)(v29 + 16) = *((void *)&__p.__r_.__value_.__l + 2);
    *(_OWORD *)unint64_t v29 = v30;
    a2[1] = v29 + 24;
  }
}

void sub_1DDBF3420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  sub_1DDA2A044((void ***)&__p);
  _Unwind_Resume(a1);
}

void sub_1DDBF347C(void *a1)
{
  sub_1DDBF34B4(a1);

  JUMPOUT(0x1E01C3DC0);
}

uint64_t sub_1DDBF34B4(void *a1)
{
  *a1 = &unk_1F398EF18;
  uint64_t v2 = (std::__shared_weak_count *)a1[150];
  if (v2) {
    sub_1DDA18310(v2);
  }

  return sub_1DDA49A44((uint64_t)a1);
}

void sub_1DDBF3510(void *a1@<X1>, char *a2@<X2>, void **a3@<X3>, void **a4@<X4>, void *a5@<X8>)
{
  unint64_t v10 = operator new(0x4D0uLL);
  sub_1DDBF35A4((uint64_t)v10, a1, a2, a3, a4);
  *a5 = v10 + 3;
  a5[1] = v10;

  sub_1DDA1AF34((uint64_t)a5, v10 + 4, (uint64_t)(v10 + 3));
}

void sub_1DDBF3590(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1DDBF35A4(uint64_t a1, void *a2, char *a3, void **a4, void **a5)
{
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = &unk_1F398F250;
  sub_1DDA3F2B0(a1 + 24, a2, *a3, *a4, *a5);
  *(void *)(a1 + 24) = &unk_1F398EF18;
  *(void *)(a1 + 1208) = -1;
  *(_OWORD *)(a1 + 1216) = 0u;
  return a1;
}

void sub_1DDBF3624(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_1DDBF3638(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F398F250;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1DDBF3658(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F398F250;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1E01C3DC0);
}

uint64_t sub_1DDBF36AC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16))();
}

void sub_1DDBF36D4(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v2 = (char *)(a1 + 64);
  unint64_t v5 = (v4 - v3) >> 3;
  sub_1DDA24B78(v38, v5);
  long long v6 = *(double **)v2;
  if (v4 != v3)
  {
    unint64_t v7 = *(double **)(a1 + 40);
    unint64_t v8 = (double *)v38[0];
    if (v5 <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = (v4 - v3) >> 3;
    }
    unint64_t v10 = *(double **)v2;
    do
    {
      double v11 = *v7++;
      double v12 = v11;
      double v13 = *v10++;
      *v8++ = v12 * 100.0 / (v13 + 100.0);
      --v9;
    }
    while (v9);
  }
  unint64_t v14 = v5 - 1;
  if (v6[v5 - 1] <= 0.0)
  {
    long double v17 = (double)*(int *)(a1 + 12) * 0.25;
    long double v18 = hypot(v17, (double)*(int *)(a1 + 8) * 0.5);
    unint64_t v19 = *(double **)(a1 + 40);
    unint64_t v20 = *(double **)(a1 + 48);
    double v15 = v17 / v18;
    if (v20 != v19)
    {
      unint64_t v21 = v20 - v19;
      unint64_t v20 = *(double **)(a1 + 40);
      do
      {
        unint64_t v22 = v21 >> 1;
        CGFloat v23 = &v20[v21 >> 1];
        double v25 = *v23;
        CGFloat v24 = v23 + 1;
        v21 += ~(v21 >> 1);
        if (v15 < v25) {
          unint64_t v21 = v22;
        }
        else {
          unint64_t v20 = v24;
        }
      }
      while (v21);
    }
    unint64_t v26 = v20 - v19;
    if (v26 >= v14) {
      unint64_t v26 = v5 - 1;
    }
    uint64_t v27 = 8 * v26 - 8;
    double v28 = (v15 - *(double *)((char *)v19 + v27)) / (v19[v26] - *(double *)((char *)v19 + v27));
    double v16 = v28 * *((double *)v38[0] + v26) + (1.0 - v28) * *(double *)((char *)v38[0] + v27);
  }
  else
  {
    double v15 = *(double *)(*(void *)(a1 + 40) + 8 * v14);
    double v16 = *((double *)v38[0] + v14);
  }
  double v29 = v15 / v16;
  sub_1DDA24B78(&__p, (v4 - v3) >> 3);
  if (v4 != v3)
  {
    uint64_t v30 = 0;
    unint64_t v31 = (double *)v38[0];
    unint64_t v32 = (double *)__p;
    if (v5 <= 1) {
      uint64_t v33 = 1;
    }
    else {
      uint64_t v33 = (v4 - v3) >> 3;
    }
    do
    {
      double v34 = v31[v30];
      double v35 = 1.0 / v29;
      if (v34 != 0.0) {
        double v35 = *(double *)(*(void *)(a1 + 40) + 8 * v30) / (v29 * v34);
      }
      v32[v30++] = v35;
    }
    while (v33 != v30);
  }
  if (v2 != (char *)&__p) {
    sub_1DDA25BB0(v2, (char *)__p, (uint64_t)v37, (v37 - (unsigned char *)__p) >> 3);
  }
  if (__p)
  {
    long long v37 = __p;
    operator delete(__p);
  }
  if (v38[0])
  {
    v38[1] = v38[0];
    operator delete(v38[0]);
  }
}

void sub_1DDBF38EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DDBF3920(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v2 = *(void *)(a1 + 72);
  sub_1DDA24B78(v66, (v2 - v3) >> 3);
  uint64_t v4 = *(void *)(a1 + 64);
  if (v2 != v3)
  {
    unint64_t v5 = *(double **)(a1 + 40);
    long long v6 = (double *)v66[0];
    if ((unint64_t)((v2 - v3) >> 3) <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = (v2 - v3) >> 3;
    }
    unint64_t v8 = *(double **)(a1 + 64);
    do
    {
      double v9 = *v5++;
      double v10 = v9;
      double v11 = *v8++;
      *v6++ = v10 * 100.0 / (v11 + 100.0);
      --v7;
    }
    while (v7);
  }
  unint64_t v12 = (*(void *)(a1 + 72) - v4) >> 3;
  std::string __p = 0;
  sub_1DDA25B2C(v65, v12, &__p);
  unint64_t v13 = (uint64_t)(*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 3;
  uint64_t v62 = 0;
  sub_1DDA25B2C(&__p, v13, &v62);
  double v14 = hypot((double)*(int *)(a1 + 12) * 0.5, (double)*(int *)(a1 + 8) * 0.5);
  double v15 = hypot((double)*(int *)(a1 + 20) * 0.5, (double)*(int *)(a1 + 16) * 0.5);
  uint64_t v17 = *(void *)(a1 + 64);
  uint64_t v16 = *(void *)(a1 + 72);
  unint64_t v18 = (v16 - v17) >> 3;
  if (v16 != v17)
  {
    unint64_t v19 = (double *)__p;
    unint64_t v20 = *(uint64_t **)(a1 + 40);
    unint64_t v21 = v65[0];
    if (v18 <= 1) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = (v16 - v17) >> 3;
    }
    CGFloat v23 = *(double **)(a1 + 64);
    do
    {
      double v24 = *v23++;
      *v19++ = 100.0 / (v24 + 100.0);
      uint64_t v25 = *v20++;
      *v21++ = v25;
      --v22;
    }
    while (v22);
  }
  if (*(double *)(v16 - 8) > 0.0 && v16 != v17)
  {
    uint64_t v27 = (double *)__p;
    unint64_t v26 = v64;
    if (v18 <= 1) {
      unint64_t v18 = 1;
    }
    do
    {
      *uint64_t v27 = *v27 / *(v26 - 1);
      ++v27;
      --v18;
    }
    while (v18);
  }
  double v28 = [Curve alloc];
  float v29 = v14;
  unint64_t v30 = *(void *)(a1 + 72) - *(void *)(a1 + 64);
  double v31 = v29;
  double v34 = objc_msgSend_initWithCount_domainMin_domainMax_values_(v28, v32, v30 >> 3, (uint64_t)__p, v33, *(double *)v65[0] * v29, *(double *)((char *)v65[0] + v30 - 8) * v29);
  double v35 = [Curve alloc];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = sub_1DDBF3D38;
  v60[3] = &unk_1E6D05210;
  id v36 = v34;
  id v61 = v36;
  uint64_t v40 = objc_msgSend_initWithBlock_domainMin_domainMax_(v35, v37, (uint64_t)v60, v38, v39, 0.0, v31);
  uint64_t v41 = [Curve alloc];
  uint64_t v55 = MEMORY[0x1E4F143A8];
  uint64_t v56 = 3221225472;
  uint64_t v57 = sub_1DDBF3DAC;
  float v58 = &unk_1E6D05210;
  id v43 = v40;
  id v59 = v43;
  float v42 = v15;
  double v44 = v42;
  double v52 = objc_msgSend_initWithBlock_domainMin_domainMax_(v41, v45, (uint64_t)&v55, v46, v47, 0.0, v44);
  if (*(void *)(a1 + 72) != *(void *)(a1 + 64))
  {
    unint64_t v53 = 0;
    do
    {
      objc_msgSend_function(v52, v48, v49, v50, v51, v55, v56, v57, v58);
      unsigned int v54 = (double (**)(double))objc_claimAutoreleasedReturnValue();
      *(double *)(*(void *)(a1 + 64) + 8 * v53) = v54[2](*(double *)(*(void *)(a1 + 40) + 8 * v53) * v44);

      ++v53;
    }
    while (v53 < (uint64_t)(*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 3);
  }

  if (__p)
  {
    float v64 = (double *)__p;
    operator delete(__p);
  }
  if (v65[0])
  {
    v65[1] = v65[0];
    operator delete(v65[0]);
  }
  if (v66[0])
  {
    v66[1] = v66[0];
    operator delete(v66[0]);
  }
}

void sub_1DDBF3C9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, void *__p,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27)
{
  if (__p) {
    operator delete(__p);
  }
  if (a23) {
    operator delete(a23);
  }
  if (a26) {
    operator delete(a26);
  }
  _Unwind_Resume(a1);
}

double sub_1DDBF3D38(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  double v6 = a6;
  if (a6 >= 0.00001)
  {
    objc_msgSend_function(*(void **)(a1 + 32), a2, a3, a4, a5);
    uint64_t v7 = (double (**)(double))objc_claimAutoreleasedReturnValue();
    double v6 = v7[2](v6) * v6;
  }
  return v6;
}

void sub_1DDBF3D9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_1DDBF3DAC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  double v7 = 1.0;
  if (a6 >= 0.00001)
  {
    objc_msgSend_inverse(*(void **)(a1 + 32), a2, a3, a4, a5);
    unint64_t v8 = (double (**)(double))objc_claimAutoreleasedReturnValue();
    double v7 = v8[2](a6) / a6;
  }
  return v7;
}

void sub_1DDBF3E14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DDBF3E28(void *a1)
{
  sub_1DDBF3E60(a1);

  JUMPOUT(0x1E01C3DC0);
}

void *sub_1DDBF3E60(void *a1)
{
  *a1 = &unk_1F398F2A0;
  uint64_t v2 = (void *)a1[8];
  if (v2)
  {
    a1[9] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[5];
  if (v3)
  {
    a1[6] = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_1DDBF417C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1DDBF4534(_Unwind_Exception *a1)
{
}

void sub_1DDBF4540(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_1DDA16678(a1);
  }
  _Unwind_Resume(a1);
}

void sub_1DDBF455C(uint64_t a1)
{
  uint64_t v2 = sub_1DDA83E7C();
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DDA14000, v3, OS_SIGNPOST_INTERVAL_END, v4, "RAWEdgeSharpen", (const char *)&unk_1DDC3ACB6, v5, 2u);
  }
}

double sub_1DDBF45E4(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -2.0, -2.0);
  return result;
}

void sub_1DDBF4684(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (v2) {
    sub_1DDA18310(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3)
  {
    std::__shared_weak_count::__release_weak(v3);
  }
}

void sub_1DDBF46D4(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136446466;
  uint64_t v2 = "-[RAWLocalToneMap outputImage]";
  __int16 v3 = 2080;
  os_signpost_id_t v4 = "-[RAWLocalToneMap outputImage]";
  _os_log_error_impl(&dword_1DDA14000, log, OS_LOG_TYPE_ERROR, "%{public}s Caught exception in %s", (uint8_t *)&v1, 0x16u);
}

void sub_1DDBF4764(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136446466;
  uint64_t v2 = "-[RAWVignetteTable outputImage]";
  __int16 v3 = 2080;
  os_signpost_id_t v4 = "-[RAWVignetteTable outputImage]";
  _os_log_error_impl(&dword_1DDA14000, log, OS_LOG_TYPE_ERROR, "%{public}s Caught exception in %s", (uint8_t *)&v1, 0x16u);
}

void sub_1DDBF47F4()
{
  sub_1DDA39E68();
  sub_1DDA39E7C(&dword_1DDA14000, v0, v1, "%{public}s Caught exception in %s", v2, v3, v4, v5, 2u);
}

void sub_1DDBF486C()
{
  sub_1DDA39E68();
  sub_1DDA39E7C(&dword_1DDA14000, v0, v1, "%{public}s Caught exception in %s", v2, v3, v4, v5, 2u);
}

void sub_1DDBF48E4()
{
  sub_1DDA39E68();
  sub_1DDA39E7C(&dword_1DDA14000, v0, v1, "%{public}s Caught exception in %s", v2, v3, v4, v5, 2u);
}

void sub_1DDBF495C(void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    sub_1DDA5EFF0(v2, (uint64_t)a1);
  }
}

void sub_1DDBF4970(id *a1, id *a2, void *a3)
{
  uint64_t v5 = (std::__shared_weak_count *)a3[16];
  if (v5) {
    sub_1DDA18310(v5);
  }
  double v6 = (std::__shared_weak_count *)a3[13];
  if (v6) {
    sub_1DDA18310(v6);
  }
  double v7 = (std::__shared_weak_count *)a3[10];
  if (v7) {
    sub_1DDA18310(v7);
  }
  unint64_t v8 = (std::__shared_weak_count *)a3[4];
  if (v8) {
    sub_1DDA18310(v8);
  }
  double v9 = (std::__shared_weak_count *)a3[2];
  if (v9)
  {
    std::__shared_weak_count::__release_weak(v9);
  }
}

void sub_1DDBF49F8(void **a1, void **a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  if (v5)
  {
    *(void *)(a3 + 264) = v5;
    operator delete(v5);
  }
  double v6 = *a2;
  if (*a2)
  {
    *(void *)(a3 + 240) = v6;
    operator delete(v6);
  }
}

void sub_1DDBF4A54(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_1DDBF4A78(std::__shared_weak_count *a1, uint64_t a2, int a3, uint64_t a4)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
  *(void *)a4 = a2;
  *(_DWORD *)(a4 + 8) = a3;
}

void sub_1DDBF4AF0()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136446466;
  sub_1DDA39E68();
  _os_log_error_impl(&dword_1DDA14000, v0, OS_LOG_TYPE_ERROR, "%{public}s Caught exception in %s", (uint8_t *)v1, 0x16u);
}

void sub_1DDBF4B74()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136446466;
  sub_1DDA39E68();
  _os_log_error_impl(&dword_1DDA14000, v0, OS_LOG_TYPE_ERROR, "%{public}s Caught exception in %s", (uint8_t *)v1, 0x16u);
}

void sub_1DDBF4BF8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1DDA14000, log, OS_LOG_TYPE_ERROR, "RAWProfileGainTableMap: Could not create kernel", v1, 2u);
}

void sub_1DDBF4C3C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1DDA14000, log, OS_LOG_TYPE_ERROR, "RAWProfileGainTableMap: Invalid Gain Table Map values.", v1, 2u);
}

void sub_1DDBF4C80(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136446466;
  uint64_t v2 = "-[RAWSimpleLensCorrectionFilter outputImage]";
  __int16 v3 = 2080;
  uint64_t v4 = "-[RAWSimpleLensCorrectionFilter outputImage]";
  _os_log_error_impl(&dword_1DDA14000, log, OS_LOG_TYPE_ERROR, "%{public}s Caught exception in %s", (uint8_t *)&v1, 0x16u);
}

void sub_1DDBF4D10(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136446466;
  uint64_t v2 = "-[RAWGamutMap outputImage]";
  __int16 v3 = 2080;
  uint64_t v4 = "-[RAWGamutMap outputImage]";
  _os_log_error_impl(&dword_1DDA14000, log, OS_LOG_TYPE_ERROR, "%{public}s Caught exception in %s", (uint8_t *)&v1, 0x16u);
}

void sub_1DDBF4DA0()
{
}

void sub_1DDBF4DCC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  *a1 = 0;
  if (v1) {
    sub_1DDB4F290((uint64_t)a1, v1);
  }
}

void sub_1DDBF4DF0()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136446466;
  sub_1DDA39E68();
  _os_log_error_impl(&dword_1DDA14000, v0, OS_LOG_TYPE_ERROR, "%{public}s Caught exception in %s", (uint8_t *)v1, 0x16u);
}

void sub_1DDBF4E74()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136446466;
  sub_1DDA39E68();
  _os_log_error_impl(&dword_1DDA14000, v0, OS_LOG_TYPE_ERROR, "%{public}s Caught exception in %s", (uint8_t *)v1, 0x16u);
}

void sub_1DDBF4EF8(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136446466;
  uint64_t v2 = "-[RAWLinearSpacePlaceholder outputImage]";
  __int16 v3 = 2080;
  uint64_t v4 = "-[RAWLinearSpacePlaceholder outputImage]";
  _os_log_error_impl(&dword_1DDA14000, log, OS_LOG_TYPE_ERROR, "%{public}s Caught exception in %s", (uint8_t *)&v1, 0x16u);
}

void sub_1DDBF4F88()
{
  sub_1DDA39E68();
  sub_1DDA39E7C(&dword_1DDA14000, v0, v1, "%{public}s Caught exception in %s", v2, v3, v4, v5, 2u);
}

void sub_1DDBF5000()
{
  sub_1DDA39E68();
  sub_1DDA39E7C(&dword_1DDA14000, v0, v1, "%{public}s Caught exception in %s", v2, v3, v4, v5, 2u);
}

void sub_1DDBF5078()
{
  sub_1DDA39E68();
  sub_1DDA39E7C(&dword_1DDA14000, v0, v1, "%{public}s Caught exception in %s", v2, v3, v4, v5, 2u);
}

void sub_1DDBF50F0(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136446466;
  uint64_t v2 = "-[RAWHueMagnet outputImage]";
  __int16 v3 = 2080;
  uint64_t v4 = "-[RAWHueMagnet outputImage]";
  _os_log_error_impl(&dword_1DDA14000, log, OS_LOG_TYPE_ERROR, "%{public}s Caught exception in %s", (uint8_t *)&v1, 0x16u);
}

void sub_1DDBF5180(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136446466;
  uint64_t v2 = "-[RAWReduceNoise outputImage]";
  __int16 v3 = 2080;
  uint64_t v4 = "-[RAWReduceNoise outputImage]";
  _os_log_error_impl(&dword_1DDA14000, log, OS_LOG_TYPE_ERROR, "%{public}s Caught exception in %s", (uint8_t *)&v1, 0x16u);
}

void sub_1DDBF5210(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136446466;
  uint64_t v2 = "-[RAWTemperatureAdjust outputImage]";
  __int16 v3 = 2080;
  uint64_t v4 = "-[RAWTemperatureAdjust outputImage]";
  _os_log_error_impl(&dword_1DDA14000, log, OS_LOG_TYPE_ERROR, "%{public}s Caught exception in %s", (uint8_t *)&v1, 0x16u);
}

void sub_1DDBF52A0(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136446466;
  uint64_t v2 = "-[RAWAdjustExposureAndBias outputImage]";
  __int16 v3 = 2080;
  uint64_t v4 = "-[RAWAdjustExposureAndBias outputImage]";
  _os_log_error_impl(&dword_1DDA14000, log, OS_LOG_TYPE_ERROR, "%{public}s Caught exception in %s", (uint8_t *)&v1, 0x16u);
}

void sub_1DDBF5330(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136446466;
  uint64_t v2 = "-[RAWVignetteRadial outputImage]";
  __int16 v3 = 2080;
  uint64_t v4 = "-[RAWVignetteRadial outputImage]";
  _os_log_error_impl(&dword_1DDA14000, log, OS_LOG_TYPE_ERROR, "%{public}s Caught exception in %s", (uint8_t *)&v1, 0x16u);
}

void sub_1DDBF53C0(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136446466;
  uint64_t v2 = "-[RAWConvert outputImage]";
  __int16 v3 = 2080;
  uint64_t v4 = "-[RAWConvert outputImage]";
  _os_log_error_impl(&dword_1DDA14000, log, OS_LOG_TYPE_ERROR, "%{public}s Caught exception in %s", (uint8_t *)&v1, 0x16u);
}

void sub_1DDBF5450(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136446466;
  uint64_t v2 = "-[RAWDefringeFilter outputImage]";
  __int16 v3 = 2080;
  uint64_t v4 = "-[RAWDefringeFilter outputImage]";
  _os_log_error_impl(&dword_1DDA14000, log, OS_LOG_TYPE_ERROR, "%{public}s Caught exception in %s", (uint8_t *)&v1, 0x16u);
}

void sub_1DDBF54E0()
{
  sub_1DDBE81F0();
  sub_1DDBE8220(&dword_1DDA14000, v0, v1, "%{public}s Failed to query metadata (Err: %d)", v2, v3, v4, v5, 2u);
}

void sub_1DDBF5554()
{
  sub_1DDBE81F0();
  sub_1DDBE8220(&dword_1DDA14000, v0, v1, "%{public}s Failed to download MobileAsset catalog (Err: %d)", v2, v3, v4, v5, 2u);
}

void sub_1DDBF55C8()
{
  sub_1DDBE81F0();
  sub_1DDBE8220(&dword_1DDA14000, v0, v1, "%{public}s Failed to download asset (Err: %d)", v2, v3, v4, v5, 2u);
}

void sub_1DDBF563C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1DDBF56B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1DDBF572C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1DDBF57A4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1DDBF581C()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136446466;
  sub_1DDBE823C();
  _os_log_debug_impl(&dword_1DDA14000, v0, OS_LOG_TYPE_DEBUG, "%{public}s No preinstalled asset available for \"%@\"", (uint8_t *)v1, 0x16u);
}

void sub_1DDBF589C()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136446466;
  sub_1DDBE823C();
  _os_log_error_impl(&dword_1DDA14000, v0, OS_LOG_TYPE_ERROR, "%{public}s Failed to create CFData for plugin \"%@\"", (uint8_t *)v1, 0x16u);
}

void sub_1DDBF591C()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136446466;
  sub_1DDBE823C();
  _os_log_error_impl(&dword_1DDA14000, v0, OS_LOG_TYPE_ERROR, "%{public}s Failed to open plist for plugin \"%@\"", (uint8_t *)v1, 0x16u);
}

void sub_1DDBF599C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1DDBF5A14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1DDBF5A8C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1DDBF5B04()
{
  sub_1DDBE81F0();
  sub_1DDBE8220(&dword_1DDA14000, v0, v1, "%{public}s Failed to query metadata (Err: %d)", v2, v3, v4, v5, 2u);
}

void sub_1DDBF5B78(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136446466;
  uint64_t v2 = "-[RAWCropFilter outputImage]";
  __int16 v3 = 2080;
  uint64_t v4 = "-[RAWCropFilter outputImage]";
  _os_log_error_impl(&dword_1DDA14000, log, OS_LOG_TYPE_ERROR, "%{public}s Caught exception in %s", (uint8_t *)&v1, 0x16u);
}

void sub_1DDBF5C08(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136446466;
  uint64_t v2 = "-[RAWGainMap outputImage]";
  __int16 v3 = 2080;
  uint64_t v4 = "-[RAWGainMap outputImage]";
  _os_log_error_impl(&dword_1DDA14000, log, OS_LOG_TYPE_ERROR, "%{public}s Caught exception in %s", (uint8_t *)&v1, 0x16u);
}

void sub_1DDBF5C98(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136446466;
  uint64_t v2 = "-[RAWLensCorrectionDNG outputImage]";
  __int16 v3 = 2080;
  uint64_t v4 = "-[RAWLensCorrectionDNG outputImage]";
  _os_log_error_impl(&dword_1DDA14000, log, OS_LOG_TYPE_ERROR, "%{public}s Caught exception in %s", (uint8_t *)&v1, 0x16u);
}

void sub_1DDBF5D28(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136446466;
  uint64_t v2 = "-[RAWEdgeSharpen outputImage]";
  __int16 v3 = 2080;
  uint64_t v4 = "-[RAWEdgeSharpen outputImage]";
  _os_log_error_impl(&dword_1DDA14000, log, OS_LOG_TYPE_ERROR, "%{public}s Caught exception in %s", (uint8_t *)&v1, 0x16u);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1F40D70E8](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

CFDictionaryRef CFBundleCopyInfoDictionaryInDirectory(CFURLRef bundleURL)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7480](bundleURL);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1F40D78B0](allocator, locale, dateStyle, timeStyle);
}

Boolean CFDateFormatterGetAbsoluteTimeFromString(CFDateFormatterRef formatter, CFStringRef string, CFRange *rangep, CFAbsoluteTime *atp)
{
  return MEMORY[0x1F40D78E8](formatter, string, rangep, atp);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

void CFDateFormatterSetProperty(CFDateFormatterRef formatter, CFStringRef key, CFTypeRef value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BE0](allocator, localeIdentifier);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFShow(CFTypeRef obj)
{
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1F40D8528](theString, idx);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8558](string, buffer, maxBufLen);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1F40D8568](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFTimeZoneRef CFTimeZoneCreateWithTimeIntervalFromGMT(CFAllocatorRef allocator, CFTimeInterval ti)
{
  return (CFTimeZoneRef)MEMORY[0x1F40D8708](allocator, ti);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D8848](allocator, buffer, bufLen, isDirectory);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CFDataRef CGColorSpaceCopyICCData(CGColorSpaceRef space)
{
  return (CFDataRef)MEMORY[0x1F40D9A98](space);
}

CGColorSpaceRef CGColorSpaceCreateCalibratedGray(const CGFloat *whitePoint, const CGFloat *blackPoint, CGFloat gamma)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AC8](whitePoint, blackPoint, gamma);
}

CGColorSpaceRef CGColorSpaceCreateCalibratedRGB(const CGFloat *whitePoint, const CGFloat *blackPoint, const CGFloat *gamma, const CGFloat *matrix)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AD0](whitePoint, blackPoint, gamma, matrix);
}

CGColorSpaceRef CGColorSpaceCreateICCBased(size_t nComponents, const CGFloat *range, CGDataProviderRef profile, CGColorSpaceRef alternate)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B18](nComponents, range, profile, alternate);
}

CGColorSpaceRef CGColorSpaceCreateWithICCData(CFTypeRef data)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B48](data);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1F40D9BE8](space);
}

CFTypeID CGColorSpaceGetTypeID(void)
{
  return MEMORY[0x1F40D9C10]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9C50](space);
}

uint64_t CGColorTransformConvertColorComponents()
{
  return MEMORY[0x1F40D9C98]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x1F40D9CA8]();
}

uint64_t CGColorTransformRelease()
{
  return MEMORY[0x1F40D9CB8]();
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x1F40DA2E8](provider);
}

uint64_t CGDataProviderCreateWithCopyOfData()
{
  return MEMORY[0x1F40DA308]();
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA310](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

uint64_t CGImageBlockCreate()
{
  return MEMORY[0x1F40DA7E8]();
}

uint64_t CGImageBlockSetCreate()
{
  return MEMORY[0x1F40DA810]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

uint64_t CGImageCreateMetadataFromDataArray()
{
  return MEMORY[0x1F40E96F0]();
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1F40DA8F0](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA920](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

CGImageMetadataRef CGImageMetadataCreateFromXMPData(CFDataRef data)
{
  return (CGImageMetadataRef)MEMORY[0x1F40E97B8](data);
}

uint64_t CGImagePluginGetOptions()
{
  return MEMORY[0x1F40E9898]();
}

uint64_t CGImagePluginGetProperties()
{
  return MEMORY[0x1F40E98A0]();
}

uint64_t CGImagePluginGetSession()
{
  return MEMORY[0x1F40E98A8]();
}

uint64_t CGImagePluginInitThumbJPEGAtOffsetWithOptions()
{
  return MEMORY[0x1F40E98B8]();
}

uint64_t CGImagePluginReadRawIPTCProps()
{
  return MEMORY[0x1F40E98C0]();
}

uint64_t CGImagePluginReadRawXMPProps()
{
  return MEMORY[0x1F40E98C8]();
}

uint64_t CGImagePluginSetImageBlockProc()
{
  return MEMORY[0x1F40E98D8]();
}

uint64_t CGImageProviderGetComponentType()
{
  return MEMORY[0x1F40DAA40]();
}

uint64_t CGImageProviderRelease()
{
  return MEMORY[0x1F40DAA70]();
}

uint64_t CGImageProviderRetain()
{
  return MEMORY[0x1F40DAA78]();
}

uint64_t CGImageReadSessionGetBytesAtOffset()
{
  return MEMORY[0x1F40E98E0]();
}

uint64_t CGImageReadSessionGetFilePath()
{
  return MEMORY[0x1F40E98E8]();
}

uint64_t CGImageReadSessionGetSize()
{
  return MEMORY[0x1F40E98F0]();
}

void CGImageRelease(CGImageRef image)
{
}

uint64_t CGImageSourceAddProperty()
{
  return MEMORY[0x1F40E9900]();
}

CFDictionaryRef CGImageSourceCopyAuxiliaryDataInfoAtIndex(CGImageSourceRef isrc, size_t index, CFStringRef auxiliaryImageDataType)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9908](isrc, index, auxiliaryImageDataType);
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9930](isrc, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
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

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1F40DB2E0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFCE0](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1F40DFD30](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD48](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD68](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD70](pixelBuffer, planeIndex);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD88](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD98](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

uint64_t JxlDecoderCreate()
{
  return MEMORY[0x1F410A3C8]();
}

uint64_t JxlDecoderDestroy()
{
  return MEMORY[0x1F410A3D0]();
}

uint64_t JxlDecoderGetBasicInfo()
{
  return MEMORY[0x1F410A3D8]();
}

uint64_t JxlDecoderGetColorAsEncodedProfile()
{
  return MEMORY[0x1F410A3F0]();
}

uint64_t JxlDecoderGetColorAsICCProfile()
{
  return MEMORY[0x1F410A3F8]();
}

uint64_t JxlDecoderGetICCProfileSize()
{
  return MEMORY[0x1F410A400]();
}

uint64_t JxlDecoderImageOutBufferSize()
{
  return MEMORY[0x1F410A408]();
}

uint64_t JxlDecoderProcessInput()
{
  return MEMORY[0x1F410A410]();
}

uint64_t JxlDecoderSetImageOutBitDepth()
{
  return MEMORY[0x1F410A430]();
}

uint64_t JxlDecoderSetImageOutBuffer()
{
  return MEMORY[0x1F410A438]();
}

uint64_t JxlDecoderSetInput()
{
  return MEMORY[0x1F410A448]();
}

uint64_t JxlDecoderSetParallelRunner()
{
  return MEMORY[0x1F410A458]();
}

uint64_t JxlDecoderSetPreferredColorProfile()
{
  return MEMORY[0x1F410A460]();
}

uint64_t JxlDecoderSubscribeEvents()
{
  return MEMORY[0x1F410A470]();
}

uint64_t JxlThreadParallelRunnerCreate()
{
  return MEMORY[0x1F410A4F0]();
}

uint64_t JxlThreadParallelRunnerDestroy()
{
  return MEMORY[0x1F410A4F8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x1F40E71C8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x1F417E390](this, __s);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4B8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

std::__sp_mut *__cdecl std::__get_sp_mut(const void *a1)
{
  return (std::__sp_mut *)MEMORY[0x1F417E580](a1);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5A0](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1F417E5D0](this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E608](this, __pos, __s, __n);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1F417E660](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E860]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E898]();
}

{
  return MEMORY[0x1F417E8A0]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1F417EA90](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

void std::__sp_mut::lock(std::__sp_mut *this)
{
}

void std::__sp_mut::unlock(std::__sp_mut *this)
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
  return MEMORY[0x1F417EE40]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1F417EE70](retstr, *(void *)&__val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1F417EEA0]();
}

std::bad_cast *__cdecl std::bad_cast::bad_cast(std::bad_cast *this)
{
  return (std::bad_cast *)MEMORY[0x1F417EEB0](this);
}

void std::bad_cast::~bad_cast(std::bad_cast *this)
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
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
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1F417EFA8](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9D00](*(void *)&a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void _tlv_atexit(void (__cdecl *termFunc)(void *), void *objAddr)
{
}

uint64_t applejpeg_decode_create()
{
  return MEMORY[0x1F410A1B8]();
}

uint64_t applejpeg_decode_destroy()
{
  return MEMORY[0x1F410A1C0]();
}

uint64_t applejpeg_decode_get_image_info()
{
  return MEMORY[0x1F410A1D8]();
}

uint64_t applejpeg_decode_get_output_buffer_size()
{
  return MEMORY[0x1F410A1E0]();
}

uint64_t applejpeg_decode_get_planar_output_buffer_size()
{
  return MEMORY[0x1F410A1F0]();
}

uint64_t applejpeg_decode_get_precision()
{
  return MEMORY[0x1F410A1F8]();
}

uint64_t applejpeg_decode_image_all()
{
  return MEMORY[0x1F410A218]();
}

uint64_t applejpeg_decode_open_mem()
{
  return MEMORY[0x1F410A230]();
}

uint64_t applejpeg_decode_set_option_alternate_420_prediction()
{
  return MEMORY[0x1F410A240]();
}

uint64_t applejpeg_decode_set_option_outformat()
{
  return MEMORY[0x1F410A280]();
}

uint64_t applejpeg_decode_set_option_stride()
{
  return MEMORY[0x1F410A290]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

int atoi(const char *a1)
{
  return MEMORY[0x1F40CA4A8](a1);
}

void bzero(void *a1, size_t a2)
{
}

int cache_create(const char *name, const cache_attributes_t *attrs, cache_t **cache_out)
{
  return MEMORY[0x1F40CA5A8](name, attrs, cache_out);
}

int cache_get_and_retain(cache_t *cache, void *key, void **value_out)
{
  return MEMORY[0x1F40CA5C0](cache, key, value_out);
}

int cache_release_value(cache_t *cache, void *value)
{
  return MEMORY[0x1F40CA610](cache, value);
}

int cache_remove(cache_t *cache, void *key)
{
  return MEMORY[0x1F40CA618](cache, key);
}

int cache_set_and_retain(cache_t *cache, void *key, void *value, cache_cost_t cost)
{
  return MEMORY[0x1F40CA630](cache, key, value, cost);
}

uint64_t dgels_NEWLAPACK()
{
  return MEMORY[0x1F40D16E0]();
}

void dispatch_apply_f(size_t iterations, dispatch_queue_t queue, void *context, void (__cdecl *work)(void *, size_t))
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_group_async_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1F40CBDA0](a1, a2);
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

float exp2f(float a1)
{
  MEMORY[0x1F40CBFF0](a1);
  return result;
}

float expf(float a1)
{
  MEMORY[0x1F40CBFF8](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x1F40CC098](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1F40CC0A0](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1F40CC110](a1);
}

void flockfile(FILE *a1)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1F40CC298](__stream, a2, *(void *)&__whence);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x1F40CC2E8](__stream);
}

void funlockfile(FILE *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

int getpagesize(void)
{
  return MEMORY[0x1F40CC480]();
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC5B0](a1, a2);
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x1F40CC630](__x, __y);
  return result;
}

float hypotf(float a1, float a2)
{
  MEMORY[0x1F40CC640](a1, a2);
  return result;
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182CB0](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182CB8](strm);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CD8](strm, version, *(void *)&stream_size);
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

float log2f(float a1)
{
  MEMORY[0x1F40CC8B0](a1);
  return result;
}

float logf(float a1)
{
  MEMORY[0x1F40CC8C0](a1);
  return result;
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40CCB08](a1, a2, *(void *)&a3);
}

size_t malloc_good_size(size_t size)
{
  return MEMORY[0x1F40CCB58](size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBB0](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40CCE58](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

int setvbuf(FILE *a1, char *a2, int a3, size_t a4)
{
  return MEMORY[0x1F40CDFD0](a1, a2, *(void *)&a3, a4);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1F40CE140](__big, __little);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

char *__cdecl strncat(char *__s1, const char *__s2, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1E8](__s1, __s2, __n);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1F40CE210](__big, __little, __len);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x1F40CE260](a1, a2);
  return result;
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

void vDSP_vfltu16(const unsigned __int16 *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

vImage_Error vImageConvert_16Fto16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D23A0](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_16Uto16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D23C0](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_PlanarFtoPlanar16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2648](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_RGB16UtoRGBA16U(const vImage_Buffer *rgbSrc, const vImage_Buffer *aSrc, Pixel_16U alpha, const vImage_Buffer *rgbaDest, BOOL premultiply, vImage_Flags flags)
{
  return MEMORY[0x1F40D2678](rgbSrc, aSrc, alpha, rgbaDest, premultiply, *(void *)&flags);
}

kern_return_t vm_purgable_control(vm_map_t target_task, vm_address_t address, vm_purgable_t control, int *state)
{
  return MEMORY[0x1F40CE6E0](*(void *)&target_task, address, *(void *)&control, state);
}

xmlNodePtr xmlDocGetRootElement(const xmlDoc *doc)
{
  return (xmlNodePtr)MEMORY[0x1F4182678](doc);
}

void xmlFreeDoc(xmlDocPtr cur)
{
}

xmlChar *__cdecl xmlNodeGetContent(const xmlNode *cur)
{
  return (xmlChar *)MEMORY[0x1F41827B8](cur);
}

xmlDocPtr xmlReadMemory(const char *buffer, int size, const char *URL, const char *encoding, int options)
{
  return (xmlDocPtr)MEMORY[0x1F4182820](buffer, *(void *)&size, URL, encoding, *(void *)&options);
}

int xmlStrEqual(const xmlChar *str1, const xmlChar *str2)
{
  return MEMORY[0x1F4182930](str1, str2);
}

int xmlStrlen(const xmlChar *str)
{
  return MEMORY[0x1F4182948](str);
}