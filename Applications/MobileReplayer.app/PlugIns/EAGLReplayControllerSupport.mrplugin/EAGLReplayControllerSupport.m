void sub_470C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_47B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_49B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4AC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4B74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4D6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4EB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_50C0(uint64_t a1, void *a2, GPUTools::GL::WireframeRenderer *a3, unsigned int a4, unsigned int a5, unsigned int a6, void **a7, uint64_t a8, float a9)
{
  id v17 = a2;
  if (GPUTools::GL::WireframeRenderer::IsBadDrawCall(a3, a5, a8, v18))
  {
LABEL_73:

    return;
  }
  id v58 = v17;
  v19 = (uint64_t (**)(id, uint64_t))[v17 gliDispatch];
  id v20 = [v17 gliContext];
  int v54 = v19[143](v20, 2929);
  unsigned __int8 v67 = 0;
  ((void (*)(id, uint64_t, unsigned __int8 *))v19[99])(v20, 2930, &v67);
  v19[63](v20, 2929);
  v19[61](v20, 0);
  int v53 = v19[143](v20, 2960);
  unsigned int v66 = 0;
  ((void (*)(id, uint64_t, unsigned int *))v19[104])(v20, 2968, &v66);
  v19[63](v20, 2960);
  v19[255](v20, 0);
  unsigned int v50 = a4;
  v51 = a7;
  unsigned int v59 = a5;
  ((void (*)(id, uint64_t, unsigned char *))v19[99])(v20, 3107, v65);
  ((void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))v19[49])(v20, 1, 1, 1, 1);
  int v21 = v19[143](v20, 2896);
  v19[63](v20, 2896);
  int v22 = v19[143](v20, 2912);
  v19[63](v20, 2912);
  int v23 = v19[143](v20, 3042);
  v19[63](v20, 3042);
  int v57 = v19[143](v20, 3058);
  v19[63](v20, 3058);
  int v56 = v19[143](v20, 2884);
  v19[63](v20, 2884);
  unsigned int v64 = 0;
  ((void (*)(id, uint64_t, unsigned int *))v19[104])(v20, 34016, &v64);
  unsigned int v60 = a6;
  int v63 = 0;
  ((void (*)(id, uint64_t, int *))v19[104])(v20, 2849, &v63);
  ((void (*)(id, float))v19[155])(v20, a9);
  uint64_t v24 = *(void *)(a1 + 8);
  uint64_t v25 = *(void *)(a1 + 16);
  int v55 = v21;
  if (v25 == v24)
  {
    v68[0] = 0.0;
    ((void (*)(id, uint64_t, float *))v19[104])(v20, 34018, v68);
    LOBYTE(v61) = 0;
    uint64_t v24 = *(void *)(a1 + 8);
    uint64_t v25 = *(void *)(a1 + 16);
    if (SLODWORD(v68[0]) <= (unint64_t)(v25 - v24))
    {
      uint64_t v26 = a8;
      int v27 = v22;
      if (SLODWORD(v68[0]) < (unint64_t)(v25 - v24))
      {
        uint64_t v25 = v24 + SLODWORD(v68[0]);
        *(void *)(a1 + 16) = v25;
      }
    }
    else
    {
      uint64_t v26 = a8;
      sub_5A90((void *)(a1 + 8), SLODWORD(v68[0]) - (v25 - v24), &v61);
      int v27 = v22;
      uint64_t v24 = *(void *)(a1 + 8);
      uint64_t v25 = *(void *)(a1 + 16);
    }
  }
  else
  {
    uint64_t v26 = a8;
    int v27 = v22;
  }
  int v28 = v23;
  if (v25 != v24)
  {
    unint64_t v29 = 0;
    do
    {
      v19[342](v20, (v29 + 33984));
      *(unsigned char *)(*(void *)(a1 + 8) + v29) = v19[143](v20, 3553);
      v19[63](v20, 3553);
      ++v29;
    }
    while (v29 < *(void *)(a1 + 16) - *(void *)(a1 + 8));
  }
  int v52 = v19[143](v20, 32886);
  v19[64](v20, 32886);
  ((void (*)(id, uint64_t, float *))v19[103])(v20, 2816, v68);
  v30 = (GPUTools::GL *)a6;
  ((void (*)(id, float, float, float, float))v19[37])(v20, 1.0, 1.0, 1.0, 1.0);
  if ((a3 - 4) > 2)
  {
    if (a6)
    {
      if ((int)v26 < 2) {
        ((void (*)(id, GPUTools::GL::WireframeRenderer *, void, void, void **))v19[67])(v20, a3, v59, a6, v51);
      }
      else {
        ((void (*)(id, GPUTools::GL::WireframeRenderer *, void, void, void **, uint64_t))v19[763])(v20, a3, v59, a6, v51, v26);
      }
    }
    else if ((int)v26 < 2)
    {
      ((void (*)(id, GPUTools::GL::WireframeRenderer *, void, void, uint64_t))v19[762])(v20, a3, v50, v59, v26);
    }
    else
    {
      ((void (*)(id, GPUTools::GL::WireframeRenderer *, void, void))v19[65])(v20, a3, v50, v59);
    }
LABEL_51:
    ((void (*)(id, float))v19[155])(v20, (float)v63);
    if (v55) {
      v19[72](v20, 2896);
    }
    if (v56) {
      v19[72](v20, 2884);
    }
    if (v27) {
      v19[72](v20, 2912);
    }
    if (v57) {
      v19[72](v20, 3058);
    }
    if (v28) {
      v19[72](v20, 3042);
    }
    uint64_t v48 = *(void *)(a1 + 8);
    uint64_t v47 = *(void *)(a1 + 16);
    if (v47 != v48)
    {
      unint64_t v49 = 0;
      do
      {
        if (*(unsigned char *)(v48 + v49))
        {
          v19[342](v20, (v49 + 33984));
          v19[72](v20, 3553);
          uint64_t v48 = *(void *)(a1 + 8);
          uint64_t v47 = *(void *)(a1 + 16);
        }
        ++v49;
      }
      while (v49 < v47 - v48);
    }
    v19[342](v20, v64);
    if (v52) {
      v19[73](v20, 32886);
    }
    ((void (*)(id, float, float, float, float))v19[37])(v20, v68[0], v68[1], v68[2], v68[3]);
    ((void (*)(id, void, void, void, void))v19[49])(v20, v65[0], v65[1], v65[2], v65[3]);
    if (v53) {
      v19[72](v20, 2960);
    }
    v19[255](v20, v66);
    if (v54) {
      v19[72](v20, 2929);
    }
    v19[61](v20, v67);
    id v17 = v58;
    goto LABEL_73;
  }
  if (!a6)
  {
    int v62 = 0;
    ((void (*)(id, uint64_t, int *))v19[104])(v20, 34965, &v62);
    if (v62) {
      ((void (*)(id, uint64_t, void))v19[642])(v20, 34963, 0);
    }
    if ((int)(v59 + v50) >= 256) {
      v35 = (GPUTools::GL *)&unk_1403;
    }
    else {
      v35 = (GPUTools::GL *)&unk_1401;
    }
    v61 = 0;
    if (a3 == 4)
    {
      unsigned int v36 = GPUTools::GL::dy_type_size(v35, v34);
      uint64_t LineListFromTriList = GPUTools::GL::WireframeRenderer::CreateLineListFromTriList((GPUTools::GL::WireframeRenderer *)&v61, (void **)v50, v59, v36, v37);
    }
    else
    {
      unsigned int v45 = GPUTools::GL::dy_type_size(v35, v34);
      if (a3 == 5) {
        uint64_t LineListFromTriList = GPUTools::GL::WireframeRenderer::CreateLineListFromTriStrip((GPUTools::GL::WireframeRenderer *)&v61, (void **)v50, v59, v45, v46);
      }
      else {
        uint64_t LineListFromTriList = GPUTools::GL::WireframeRenderer::CreateLineListFromTriFan((GPUTools::GL::WireframeRenderer *)&v61, (void **)v50, v59, v45, v46);
      }
    }
    if ((int)v26 < 2) {
      ((void (*)(id, uint64_t, uint64_t, GPUTools::GL *, void *))v19[67])(v20, 1, LineListFromTriList, v35, v61);
    }
    else {
      ((void (*)(id, uint64_t, uint64_t, GPUTools::GL *, void *, uint64_t))v19[763])(v20, 1, LineListFromTriList, v35, v61, v26);
    }
    free(v61);
    if (v62) {
      v19[642](v20, 34963);
    }
    goto LABEL_51;
  }
  int v62 = 0;
  ((void (*)(id, uint64_t, int *))v19[104])(v20, 34965, &v62);
  if (!v62)
  {
    v33 = v51;
    if (!v51) {
      goto LABEL_43;
    }
LABEL_31:
    v39 = (GPUTools::GL::WireframeRenderer *)v33;
    v61 = 0;
    if (a3 == 4)
    {
      unsigned int v40 = GPUTools::GL::dy_type_size(v30, v31);
      uint64_t v42 = GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriList(v39, &v61, (void **)v59, v40, 0, v41);
    }
    else
    {
      unsigned int v43 = GPUTools::GL::dy_type_size(v30, v31);
      if (a3 == 5) {
        uint64_t v42 = GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriStrip(v39, &v61, (void **)v59, v43, 0, v44);
      }
      else {
        uint64_t v42 = GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriFan(v39, &v61, (void **)v59, v43, 0, v44);
      }
    }
    if ((int)v26 < 2) {
      ((void (*)(id, uint64_t, uint64_t, GPUTools::GL *, void *))v19[67])(v20, 1, v42, v30, v61);
    }
    else {
      ((void (*)(id, uint64_t, uint64_t, GPUTools::GL *, void *, uint64_t))v19[763])(v20, 1, v42, v30, v61, v26);
    }
    free(v61);
LABEL_43:
    if (v62)
    {
      v19[642](v20, 34963);
      v19[650](v20, 34963);
    }
    goto LABEL_51;
  }
  LODWORD(v61) = 0;
  ((void (*)(id, uint64_t, uint64_t, void **))v19[651])(v20, 34963, 34660, &v61);
  uint64_t v32 = ((uint64_t (*)(id, uint64_t, void, void, uint64_t))v19[795])(v20, 34963, 0, (int)v61, 1);
  if (v32)
  {
    ((void (*)(id, uint64_t, void))v19[642])(v20, 34963, 0);
    v33 = (void **)((char *)v51 + v32);
    v30 = (GPUTools::GL *)v60;
    if (!(void **)((char *)v51 + v32)) {
      goto LABEL_43;
    }
    goto LABEL_31;
  }
  dy_abort();
  __break(1u);
}

void sub_5970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_59F8(GPUTools::GL::WireframeRenderer *a1)
{
  sub_5A30(a1);

  operator delete();
}

void sub_5A30(GPUTools::GL::WireframeRenderer *a1)
{
  *(void *)a1 = off_28660;
  v2 = (void *)*((void *)a1 + 1);
  if (v2)
  {
    *((void *)a1 + 2) = v2;
    operator delete(v2);
  }

  GPUTools::GL::WireframeRenderer::~WireframeRenderer(a1);
}

void sub_5A90(void *a1, unint64_t a2, unsigned char *a3)
{
  unint64_t v4 = a2;
  v7 = (unsigned char *)a1[1];
  uint64_t v6 = a1[2];
  if (v6 - (uint64_t)v7 >= a2)
  {
    if (a2)
    {
      v13 = &v7[a2];
      do
      {
        *v7++ = *a3;
        --v4;
      }
      while (v4);
      v7 = v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = &v7[-*a1];
    unint64_t v9 = (unint64_t)&v8[a2];
    if ((uint64_t)&v8[a2] < 0) {
      sub_5BBC();
    }
    unint64_t v10 = v6 - *a1;
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v11 = v9;
    }
    if (v11) {
      v12 = operator new(v11);
    }
    else {
      v12 = 0;
    }
    v14 = &v8[(void)v12];
    v15 = &v8[(void)v12 + v4];
    v16 = &v8[(void)v12];
    do
    {
      *v16++ = *a3;
      --v4;
    }
    while (v4);
    id v17 = (unsigned char *)*a1;
    if (v7 != (unsigned char *)*a1)
    {
      do
      {
        char v18 = *--v7;
        *--v14 = v18;
      }
      while (v7 != v17);
      v7 = (unsigned char *)*a1;
    }
    *a1 = v14;
    a1[1] = v15;
    a1[2] = (char *)v12 + v11;
    if (v7)
    {
      operator delete(v7);
    }
  }
}

void sub_5BBC()
{
}

void sub_5BD4(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_5C30(exception, a1);
}

void sub_5C1C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_5C30(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_5C64(uint64_t a1)
{
  *(void *)a1 = off_286C8;
  uint64_t v2 = a1 + 152;
  for (i = *(void **)(a1 + 168); i; i = (void *)*i)
  {
    for (j = (void *)i[5]; j; j = (void *)*j)
    {
      if (j[3]) {
        operator delete();
      }
    }
  }
  sub_8060(a1 + 232);
  sub_7F94(a1 + 192);
  sub_7F94(v2);
  sub_7F94(a1 + 112);
  sub_7F0C(a1 + 72);
  sub_7F0C(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = 0;
  if (v5) {
    operator delete();
  }
  uint64_t v6 = *(id **)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v6) {
    sub_8C58(a1 + 16, v6);
  }

  GPUTools::GL::WireframeRenderer::~WireframeRenderer((GPUTools::GL::WireframeRenderer *)a1);
}

void sub_5D68(void *a1)
{
}

void sub_5D80(uint64_t a1)
{
  sub_5C64(a1);

  operator delete();
}

uint64_t sub_5DB8(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7 = a3;
  if (a4) {
    uint64_t v5 = DYCreatePrivateGLShader();
  }
  else {
    uint64_t v5 = (*(uint64_t (**)(void))(a1[1] + 4752))(*(void *)(*a1 + 16));
  }
  (*(void (**)(void, void, uint64_t, uint64_t *, void))(a1[1] + 4760))(*(void *)(*a1 + 16), v5, 1, &v7, 0);
  (*(void (**)(void, void))(a1[1] + 4768))(*(void *)(*a1 + 16), v5);
  return v5;
}

uint64_t sub_5E54(uint64_t a1)
{
  LODWORD(v4) = 0;
  (*(void (**)(void, uint64_t, Dispatcher **))(*(void *)(*(void *)(a1 + 24) + 8) + 832))(*(void *)(**(void **)(a1 + 24) + 16), 35725, &v4);
  if (v4)
  {
    int v3 = 0;
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 24) + 8) + 5264))(*(void *)(**(void **)(a1 + 24)
                                                                                                  + 16));
  }
  return 0;
}

void sub_5FDC()
{
}

uint64_t sub_6024(uint64_t a1, void *a2, unsigned int a3)
{
  id v5 = a2;
  unsigned int v11 = a3;
  id v10 = v5;
  uint64_t v6 = sub_8CB4((void *)(a1 + 192), (unint64_t *)&v10);
  if (v6 && (uint64_t v7 = sub_9D28(v6 + 3, &v11)) != 0) {
    uint64_t v8 = *(unsigned int *)v7[3];
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_60A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_60B4(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = sub_5DB8(*(void **)(a1 + 24), 35632, a2, 1);
  unint64_t v4 = [*(id *)(a1 + 8) context];
  uint64_t v5 = DYCreatePrivateGLProgram();

  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8) + 5512))(*(void *)(**(void **)(a1 + 24) + 16), v5, 33368, 1);
  (*(void (**)(void, void, void))(*(void *)(*(void *)(a1 + 24) + 8) + 4784))(*(void *)(**(void **)(a1 + 24) + 16), v5, v3);
  (*(void (**)(void, void))(*(void *)(*(void *)(a1 + 24) + 8) + 4792))(*(void *)(**(void **)(a1 + 24) + 16), v5);
  (*(void (**)(void, void, void))(*(void *)(*(void *)(a1 + 24) + 8) + 4744))(*(void *)(**(void **)(a1 + 24) + 16), v5, v3);
  (*(void (**)(void, void))(*(void *)(*(void *)(a1 + 24) + 8) + 4728))(*(void *)(**(void **)(a1 + 24) + 16), v3);
  uint64_t v6 = [*(id *)(a1 + 8) context];
  uint64_t v7 = DYCreatePrivateGLProgramPipeline();

  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8) + 6552))(*(void *)(**(void **)(a1 + 24) + 16), v7, 2, v5);
  return v7;
}

void sub_61E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_61F4(uint64_t a1, uint64_t a2)
{
  unsigned int v45 = 0;
  (*(void (**)(void, uint64_t, uint64_t, unsigned int *))(*(void *)(*(void *)(a1 + 24) + 8) + 6608))(*(void *)(**(void **)(a1 + 24) + 16), a2, 35633, &v45);
  unsigned int v3 = [*(id *)(a1 + 8) context];
  unint64_t v4 = [v3 sharegroup];

  BOOL v44 = v4;
  unsigned int v46 = (unint64_t *)&v44;
  uint64_t v5 = sub_80E0(a1 + 112, (unint64_t *)&v44, (uint64_t)&unk_27801, &v46);
  unsigned int v46 = (unint64_t *)&v45;
  uint64_t v6 = *((unsigned int *)sub_8628((uint64_t)(v5 + 3), &v45, (uint64_t)&unk_27801, (_DWORD **)&v46) + 5);
  unsigned int v46 = *(unint64_t **)(**(void **)(a1 + 24) + 16);
  uint64_t v7 = sub_884C((void *)(a1 + 72), &v46);
  if (!v7)
  {
    int v8 = sub_60B4(a1, (uint64_t)"void main() { gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0); }");
    BOOL v44 = *(void **)(**(void **)(a1 + 24) + 16);
    unsigned int v46 = (unint64_t *)&v44;
    unint64_t v9 = sub_8938(a1 + 72, &v44, (uint64_t)&unk_27801, &v46);
    id v10 = v9;
    unsigned int v11 = (char *)v9[4];
    uint64_t v12 = (uint64_t)(v9 + 5);
    unint64_t v13 = v9[5];
    if ((unint64_t)v11 >= v13)
    {
      v15 = (char *)v9[3];
      uint64_t v16 = (v11 - v15) >> 2;
      if ((unint64_t)(v16 + 1) >> 62) {
        sub_5BBC();
      }
      unint64_t v17 = v13 - (void)v15;
      unint64_t v18 = (uint64_t)(v13 - (void)v15) >> 1;
      if (v18 <= v16 + 1) {
        unint64_t v18 = v16 + 1;
      }
      if (v17 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v19 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v19 = v18;
      }
      if (v19)
      {
        id v20 = (char *)sub_8C20(v12, v19);
        v15 = (char *)v10[3];
        unsigned int v11 = (char *)v10[4];
      }
      else
      {
        id v20 = 0;
      }
      int v21 = &v20[4 * v16];
      int v22 = &v20[4 * v19];
      *(_DWORD *)int v21 = v8;
      v14 = v21 + 4;
      while (v11 != v15)
      {
        int v23 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v21 - 1) = v23;
        v21 -= 4;
      }
      v10[3] = v21;
      v10[4] = v14;
      v10[5] = v22;
      if (v15) {
        operator delete(v15);
      }
    }
    else
    {
      *(_DWORD *)unsigned int v11 = v8;
      v14 = v11 + 4;
    }
    v10[4] = v14;
    uint64_t v24 = [*(id *)(a1 + 8) context];
    uint64_t v25 = (char *)[v24 API];

    if (v25 == (unsigned char *)&dword_0 + 3)
    {
      int v26 = sub_60B4(a1, (uint64_t)"#version 300 es\nout lowp vec4 fragColor;\n"
                       "void main() { fragColor = vec4(1.0, 1.0, 1.0, 1.0); }");
      BOOL v44 = *(void **)(**(void **)(a1 + 24) + 16);
      unsigned int v46 = (unint64_t *)&v44;
      int v27 = sub_8938(a1 + 72, &v44, (uint64_t)&unk_27801, &v46);
      int v28 = v27;
      unint64_t v29 = (char *)v27[4];
      uint64_t v30 = (uint64_t)(v27 + 5);
      unint64_t v31 = v27[5];
      if ((unint64_t)v29 >= v31)
      {
        v33 = (char *)v27[3];
        uint64_t v34 = (v29 - v33) >> 2;
        if ((unint64_t)(v34 + 1) >> 62) {
          sub_5BBC();
        }
        unint64_t v35 = v31 - (void)v33;
        unint64_t v36 = (uint64_t)(v31 - (void)v33) >> 1;
        if (v36 <= v34 + 1) {
          unint64_t v36 = v34 + 1;
        }
        if (v35 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v37 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v37 = v36;
        }
        if (v37)
        {
          v38 = (char *)sub_8C20(v30, v37);
          v33 = (char *)v28[3];
          unint64_t v29 = (char *)v28[4];
        }
        else
        {
          v38 = 0;
        }
        v39 = &v38[4 * v34];
        unsigned int v40 = &v38[4 * v37];
        *(_DWORD *)v39 = v26;
        uint64_t v32 = v39 + 4;
        while (v29 != v33)
        {
          int v41 = *((_DWORD *)v29 - 1);
          v29 -= 4;
          *((_DWORD *)v39 - 1) = v41;
          v39 -= 4;
        }
        v28[3] = v39;
        v28[4] = v32;
        v28[5] = v40;
        if (v33) {
          operator delete(v33);
        }
      }
      else
      {
        *(_DWORD *)unint64_t v29 = v26;
        uint64_t v32 = v29 + 4;
      }
      v28[4] = v32;
    }
    BOOL v44 = *(void **)(**(void **)(a1 + 24) + 16);
    unsigned int v46 = (unint64_t *)&v44;
    uint64_t v7 = sub_8938(a1 + 72, &v44, (uint64_t)&unk_27801, &v46);
  }
  uint64_t v42 = *(unsigned int *)(v7[3] + 4 * v6);
  (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(*(void *)(a1 + 24) + 8) + 6552))(*(void *)(**(void **)(a1 + 24) + 16), v42, 1, v45);
  LODWORD(v46) = 0;
  (*(void (**)(void, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8) + 6616))(*(void *)(**(void **)(a1 + 24) + 16), v42);
  (*(void (**)(void, uint64_t, uint64_t, unint64_t **))(*(void *)(*(void *)(a1 + 24) + 8)
                                                                        + 6608))(*(void *)(**(void **)(a1 + 24) + 16), v42, 35715, &v46);
  if (v46)
  {

    return v42;
  }
  else
  {
    uint64_t result = dy_abort();
    __break(1u);
  }
  return result;
}

void sub_65DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6624(uint64_t a1, void *a2, GPUTools::GL::WireframeRenderer *a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, int a8)
{
  id v14 = a2;
  if ((GPUTools::GL::WireframeRenderer::IsBadDrawCall(a3, a5, a8, v13) & 1) == 0)
  {
    objc_storeStrong((id *)(a1 + 8), a2);
    operator new();
  }
}

void sub_70D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

id *sub_71F4(id *location, void **a2)
{
  id v4 = *a2;
  if (*location != v4)
  {
    objc_storeStrong(location, v4);
    uint64_t v5 = *a2;
    *a2 = 0;
  }
  return location;
}

void sub_7240(uint64_t a1, void *a2, uint64_t a3)
{
  v7[1] = a3;
  id v5 = *(id *)(*a2 + 8);
  v7[0] = 0;
  (*(void (**)(void, uint64_t, uint64_t, _DWORD *))(a2[1] + 5256))(*(void *)(*a2 + 16), a3, 35663, v7);
  if (v7[0] == 35633)
  {
    int v6 = 0;
    (*(void (**)(void, uint64_t, uint64_t, int *))(a2[1] + 5256))(*(void *)(*a2 + 16), a3, 35713, &v6);
    if (v6 == 1) {
      sub_774C(a2);
    }
  }
}

void sub_76EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_774C(void *a1)
{
  int v1 = 0;
  (*(void (**)(void))(a1[1] + 5256))(*(void *)(*a1 + 16));
  operator new[]();
}

void sub_785C()
{
}

uint64_t *sub_788C(uint64_t a1, void *a2, void *a3, unsigned int a4)
{
  unsigned int v9 = a4;
  uint64_t result = sub_9D28(a3, &v9);
  if (result)
  {
    uint64_t v7 = (unsigned int *)result[3];
    int v8 = v7[2] - 1;
    _DWORD v7[2] = v8;
    if (!v8)
    {
      (*(void (**)(void, void))(a2[1] + 4728))(*(void *)(*a2 + 16), *v7);
      operator delete();
    }
    return (uint64_t *)sub_9DDC(a3, result);
  }
  return result;
}

void sub_7924(uint64_t a1, void *a2, uint64_t a3)
{
  int v22 = 0;
  unsigned int v23 = a3;
  (*(void (**)(void, uint64_t, uint64_t, int *))(a2[1] + 5264))(*(void *)(*a2 + 16), a3, 35714, &v22);
  if (v22)
  {
    unsigned int v21 = sub_7BFC(a2, a3, 35633);
    if (v21)
    {
      int v6 = sub_7BFC(a2, v23, 35632);
      uint64_t v7 = (unint64_t *)*(id *)(*a2 + 8);
      int v8 = v7;
      if (v6)
      {
        *(void *)&long long v18 = v7;
        uint64_t v9 = (uint64_t)sub_8CB4((void *)(a1 + 192), (unint64_t *)&v18);
        id v10 = (void *)v9;
        if (!v9)
        {
          long long v18 = 0u;
          long long v19 = 0u;
          int v20 = 1065353216;
          unint64_t v17 = v8;
          uint64_t v24 = (unint64_t *)&v17;
          unsigned int v11 = sub_9484(a1 + 192, (unint64_t *)&v17, (uint64_t)&unk_27801, &v24);
          if (v11 + 3 != (void *)&v18)
          {
            *((_DWORD *)v11 + 14) = v20;
            sub_96F4(v11 + 3, (uint64_t *)v19, 0);
          }
          unint64_t v17 = v8;
          uint64_t v24 = (unint64_t *)&v17;
          id v10 = sub_9484(a1 + 192, (unint64_t *)&v17, (uint64_t)&unk_27801, &v24);
          uint64_t v9 = sub_8014((uint64_t)&v18);
        }
        sub_788C(v9, a2, v10 + 3, v23);
        uint64_t v24 = v8;
        *(void *)&long long v18 = &v24;
        uint64_t v12 = sub_9484(a1 + 152, (unint64_t *)&v24, (uint64_t)&unk_27801, (void **)&v18);
        *(void *)&long long v18 = &v21;
        uint64_t v13 = sub_925C((uint64_t)(v12 + 3), &v21, (uint64_t)&unk_27801, (_DWORD **)&v18)[3];
        ++*(_DWORD *)(v13 + 8);
        *(void *)&long long v18 = &v23;
        sub_925C((uint64_t)(v10 + 3), &v23, (uint64_t)&unk_27801, (_DWORD **)&v18)[3] = v13;
      }
      else
      {
        uint64_t v24 = v7;
        *(void *)&long long v18 = &v24;
        id v14 = sub_9484(a1 + 152, (unint64_t *)&v24, (uint64_t)&unk_27801, (void **)&v18);
        *(void *)&long long v18 = &v21;
        int v15 = *(_DWORD *)(sub_925C((uint64_t)(v14 + 3), &v21, (uint64_t)&unk_27801, (_DWORD **)&v18)[3] + 4);
        uint64_t v24 = v8;
        *(void *)&long long v18 = &v24;
        uint64_t v16 = sub_80E0(a1 + 112, (unint64_t *)&v24, (uint64_t)&unk_27801, (void **)&v18);
        *(void *)&long long v18 = &v23;
        *((_DWORD *)sub_8628((uint64_t)(v16 + 3), &v23, (uint64_t)&unk_27801, (_DWORD **)&v18) + 5) = v15;
      }
    }
  }
}

void sub_7BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_8014((uint64_t)va);

  _Unwind_Resume(a1);
}

uint64_t sub_7BFC(void *a1, uint64_t a2, int a3)
{
  int v8 = 2;
  (*(void (**)(void, uint64_t, uint64_t, int *, _DWORD *))(a1[1] + 6072))(*(void *)(*a1 + 16), a2, 2, &v8, v9);
  if (v8 < 1) {
    return 0;
  }
  uint64_t v5 = 0;
  while (1)
  {
    int v7 = 0;
    (*(void (**)(void, void, uint64_t, int *))(a1[1] + 5256))(*(void *)(*a1 + 16), v9[v5], 35663, &v7);
    if (v7 == a3) {
      break;
    }
    if (++v5 >= v8) {
      return 0;
    }
  }
  return v9[v5];
}

void sub_7CF0(uint64_t a1, id **a2, uint64_t a3, int a4, int a5, const std::string::value_type **a6)
{
  unsigned int v19 = a3;
  if (a4 == 35633)
  {
    LODWORD(v7) = a5;
    int v18 = 0;
    ((void (*)(id, uint64_t, uint64_t, int *))a2[1][658])((*a2)[2], a3, 35714, &v18);
    if (v18)
    {
      memset(&v17, 0, sizeof(v17));
      if ((int)v7 >= 1)
      {
        uint64_t v7 = v7;
        do
        {
          std::string::append(&v17, *a6++);
          --v7;
        }
        while (v7);
      }
      id v10 = (*a2)[1];
      if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unsigned int v11 = &v17;
      }
      else {
        unsigned int v11 = (std::string *)v17.__r_.__value_.__r.__words[0];
      }
      unsigned int v12 = sub_5DB8(a2, 35633, (uint64_t)v11, 0);
      unsigned int v16 = v12;
      [**a2 getParameter:1710 to:&v16];
      ((void (*)(id, void))a2[1][591])((*a2)[2], v12);
      BOOL v13 = v16 == 300;
      id v15 = v10;
      int v20 = (unint64_t *)&v15;
      id v14 = sub_80E0(a1 + 112, (unint64_t *)&v15, (uint64_t)&unk_27801, &v20);
      int v20 = (unint64_t *)&v19;
      *((_DWORD *)sub_8628((uint64_t)(v14 + 3), &v19, (uint64_t)&unk_27801, (_DWORD **)&v20) + 5) = v13;

      if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v17.__r_.__value_.__l.__data_);
      }
    }
  }
}

void sub_7E64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void *sub_7E98(void *a1, void *a2)
{
  id v3 = a2;
  *a1 = v3;
  a1[1] = 0;
  uint64_t v4 = [v3 sharegroup];
  uint64_t v5 = (void *)a1[1];
  a1[1] = v4;

  a1[2] = GLIContextFromEAGLContext();
  a1[3] = GLCFrontDispatch();
  a1[4] = GLCBackDispatch();

  return a1;
}

uint64_t sub_7F0C(uint64_t a1)
{
  sub_7F48(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_7F48(int a1, void *__p)
{
  if (__p)
  {
    uint64_t v2 = __p;
    do
    {
      id v3 = (void *)*v2;
      uint64_t v4 = (void *)v2[3];
      if (v4)
      {
        v2[4] = v4;
        operator delete(v4);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t sub_7F94(uint64_t a1)
{
  sub_7FD0(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_7FD0(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      id v3 = (void *)*v2;
      sub_8014((uint64_t)(v2 + 3));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t sub_8014(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      id v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_8060(uint64_t a1)
{
  sub_809C(a1, *(id **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_809C(uint64_t a1, id *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      id v3 = (id *)*v2;

      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void *sub_80E0(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    id v10 = *(void **)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unsigned int v11 = (void *)*v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          unsigned int v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  uint64_t v13 = a1 + 16;
  id v14 = (char *)operator new(0x40uLL);
  v24[0] = v14;
  v24[1] = a1 + 16;
  *(void *)id v14 = 0;
  *((void *)v14 + 1) = v7;
  *((void *)v14 + 2) = **a4;
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  *((_DWORD *)v14 + 14) = 1065353216;
  char v25 = 1;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = 1;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_8384(a1, v20);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  unsigned int v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *(void *)v24[0] = *v21;
    *unsigned int v21 = v24[0];
  }
  else
  {
    *(void *)v24[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v24[0];
    *(void *)(*(void *)a1 + 8 * v4) = v13;
    if (*(void *)v24[0])
    {
      unint64_t v22 = *(void *)(*(void *)v24[0] + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v22 >= v8) {
          v22 %= v8;
        }
      }
      else
      {
        v22 &= v8 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v22) = v24[0];
    }
  }
  unsigned int v11 = (void *)v24[0];
  v24[0] = 0;
  ++*(void *)(a1 + 24);
  sub_85D0((uint64_t)v24, 0);
  return v11;
}

void sub_8338(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_85D0((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void sub_8350()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  int v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_8384(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_8474(a1, prime);
    }
  }
}

void sub_8474(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_8350();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
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
      unsigned int v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            void *v7 = *v11;
            *unsigned int v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            unsigned int v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          unsigned int v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    id v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void sub_85D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      sub_8014((uint64_t)v2 + 24);
    }
    operator delete(v2);
  }
}

void *sub_8628(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    id v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unsigned int v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          unsigned int v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  unsigned int v11 = operator new(0x18uLL);
  *unsigned int v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  *((_DWORD *)v11 + 5) = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    sub_8384(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v19 = *(void *)a1;
  size_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *unsigned int v11 = *v20;
LABEL_38:
    *size_t v20 = v11;
    goto LABEL_39;
  }
  *unsigned int v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    size_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_8838(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_884C(void *a1, void *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  unint64_t v4 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v3 >> 47) ^ v3);
  unint64_t v5 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(v2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v7 = v5;
    if (v5 >= *(void *)&v2) {
      unint64_t v7 = v5 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v7 = v5 & (*(void *)&v2 - 1);
  }
  unint64_t v8 = *(void **)(*a1 + 8 * v7);
  if (!v8) {
    return 0;
  }
  uint64_t result = (void *)*v8;
  if (*v8)
  {
    do
    {
      unint64_t v10 = result[1];
      if (v10 == v5)
      {
        if (result[2] == *a2) {
          return result;
        }
      }
      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v10 >= *(void *)&v2) {
            v10 %= *(void *)&v2;
          }
        }
        else
        {
          v10 &= *(void *)&v2 - 1;
        }
        if (v10 != v7) {
          return 0;
        }
      }
      uint64_t result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void *sub_8938(uint64_t a1, void *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  unint64_t v8 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v7 >> 47) ^ v7);
  unint64_t v9 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v4 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
      if (v9 >= v10) {
        unint64_t v4 = v9 % v10;
      }
    }
    else
    {
      unint64_t v4 = v9 & (v10 - 1);
    }
    unint64_t v12 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v12)
    {
      for (i = *v12; i; i = (void *)*i)
      {
        unint64_t v14 = i[1];
        if (v14 == v9)
        {
          if (i[2] == *a2) {
            return i;
          }
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v14 >= v10) {
              v14 %= v10;
            }
          }
          else
          {
            v14 &= v10 - 1;
          }
          if (v14 != v4) {
            break;
          }
        }
      }
    }
  }
  BOOL v15 = (void *)(a1 + 16);
  i = operator new(0x30uLL);
  void *i = 0;
  i[1] = v9;
  i[2] = **a4;
  i[3] = 0;
  i[4] = 0;
  i[5] = 0;
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    sub_8384(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v4 = v9 % v10;
      }
      else {
        unint64_t v4 = v9;
      }
    }
    else
    {
      unint64_t v4 = (v10 - 1) & v9;
    }
  }
  uint64_t v22 = *(void *)a1;
  unsigned int v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    void *i = *v23;
LABEL_38:
    *unsigned int v23 = i;
    goto LABEL_39;
  }
  void *i = *v15;
  void *v15 = i;
  *(void *)(v22 + 8 * v4) = v15;
  if (*i)
  {
    unint64_t v24 = *(void *)(*i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v24 >= v10) {
        v24 %= v10;
      }
    }
    else
    {
      v24 &= v10 - 1;
    }
    unsigned int v23 = (void *)(*(void *)a1 + 8 * v24);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_8BA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  sub_8BC0(v11, v10);
  _Unwind_Resume(a1);
}

void sub_8BC0(uint64_t a1, void *__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    unint64_t v3 = (void *)__p[3];
    if (v3)
    {
      __p[4] = v3;
      operator delete(v3);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void *sub_8C20(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_8350();
  }
  return operator new(4 * a2);
}

void sub_8C58(uint64_t a1, id *a2)
{
  if (a2)
  {

    operator delete();
  }
}

void *sub_8CB4(void *a1, unint64_t *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  uint8x8_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  uint64_t result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3) {
          return result;
        }
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }
        else
        {
          v8 &= *(void *)&v2 - 1;
        }
        if (v8 != v5) {
          return 0;
        }
      }
      uint64_t result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void *sub_8D68(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    unint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (i = *v10; i; i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7) {
            return i;
          }
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v4) {
            break;
          }
        }
      }
    }
  }
  float v13 = (void *)(a1 + 16);
  i = operator new(0x20uLL);
  void *i = 0;
  i[1] = v7;
  i[2] = **a4;
  i[3] = 0;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v15 = *(float *)(a1 + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    BOOL v16 = 1;
    if (v8 >= 3) {
      BOOL v16 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v8);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    sub_8384(a1, v19);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v20 = *(void *)a1;
  size_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    void *i = *v21;
LABEL_38:
    *size_t v21 = i;
    goto LABEL_39;
  }
  void *i = *v13;
  void *v13 = i;
  *(void *)(v20 + 8 * v4) = v13;
  if (*i)
  {
    unint64_t v22 = *(void *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8) {
        v22 %= v8;
      }
    }
    else
    {
      v22 &= v8 - 1;
    }
    size_t v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_8F98(_Unwind_Exception *a1)
{
  sub_8FB4(v2, v1);
  _Unwind_Resume(a1);
}

void sub_8FB4(uint64_t a1, id *a2)
{
  if (*(unsigned char *)(a1 + 8))
  {
  }
  else if (!a2)
  {
    return;
  }

  operator delete(a2);
}

void *sub_900C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    unint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (i = *v10; i; i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7) {
            return i;
          }
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v4) {
            break;
          }
        }
      }
    }
  }
  float v13 = (void *)(a1 + 16);
  i = operator new(0x30uLL);
  void *i = 0;
  i[1] = v7;
  uint64_t v14 = **a4;
  i[4] = 0;
  i[5] = 0;
  i[2] = v14;
  i[3] = 0;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = 1;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_8384(a1, v20);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v21 = *(void *)a1;
  unint64_t v22 = *(void **)(*(void *)a1 + 8 * v4);
  if (v22)
  {
    void *i = *v22;
LABEL_38:
    *unint64_t v22 = i;
    goto LABEL_39;
  }
  void *i = *v13;
  void *v13 = i;
  *(void *)(v21 + 8 * v4) = v13;
  if (*i)
  {
    unint64_t v23 = *(void *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v23 >= v8) {
        v23 %= v8;
      }
    }
    else
    {
      v23 &= v8 - 1;
    }
    unint64_t v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_9240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  sub_8BC0(v11, v10);
  _Unwind_Resume(a1);
}

void *sub_925C(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    unint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      uint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          uint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  uint64_t v11 = operator new(0x20uLL);
  *uint64_t v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[3] = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    sub_8384(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v19 = *(void *)a1;
  size_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *uint64_t v11 = *v20;
LABEL_38:
    *size_t v20 = v11;
    goto LABEL_39;
  }
  *uint64_t v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    size_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_9470(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_9484(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    unint64_t v10 = *(void **)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      uint64_t v11 = (void *)*v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          uint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  uint64_t v13 = a1 + 16;
  float v14 = (char *)operator new(0x40uLL);
  v24[0] = v14;
  v24[1] = a1 + 16;
  *(void *)float v14 = 0;
  *((void *)v14 + 1) = v7;
  *((void *)v14 + 2) = **a4;
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  *((_DWORD *)v14 + 14) = 1065353216;
  char v25 = 1;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = 1;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_8384(a1, v20);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  unint64_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *(void *)v24[0] = *v21;
    *unint64_t v21 = v24[0];
  }
  else
  {
    *(void *)v24[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v24[0];
    *(void *)(*(void *)a1 + 8 * v4) = v13;
    if (*(void *)v24[0])
    {
      unint64_t v22 = *(void *)(*(void *)v24[0] + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v22 >= v8) {
          v22 %= v8;
        }
      }
      else
      {
        v22 &= v8 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v22) = v24[0];
    }
  }
  uint64_t v11 = (void *)v24[0];
  v24[0] = 0;
  ++*(void *)(a1 + 24);
  sub_85D0((uint64_t)v24, 0);
  return v11;
}

void sub_96DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_85D0((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void sub_96F4(void *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = a1[1];
  if (!v6) {
    goto LABEL_9;
  }
  for (uint64_t i = 0; i != v6; *(void *)(*a1 + 8 * i++) = 0)
    ;
  unint64_t v8 = (uint64_t *)a1[2];
  a1[2] = 0;
  a1[3] = 0;
  if (v8)
  {
    while (a2 != a3)
    {
      unint64_t v9 = *((unsigned int *)a2 + 4);
      *((_DWORD *)v8 + 4) = v9;
      v8[3] = a2[3];
      unint64_t v10 = (uint64_t *)*v8;
      v8[1] = v9;
      uint64_t v11 = (void *)sub_9808((uint64_t)a1, v9, (_DWORD *)v8 + 4);
      sub_9960(a1, v8, v11);
      a2 = (uint64_t *)*a2;
      unint64_t v8 = v10;
      if (!v10) {
        goto LABEL_9;
      }
    }
    do
    {
      unint64_t v12 = (uint64_t *)*v8;
      operator delete(v8);
      unint64_t v8 = v12;
    }
    while (v12);
  }
  else
  {
LABEL_9:
    while (a2 != a3)
    {
      sub_9CAC(a1, (_OWORD *)a2 + 1);
      a2 = (uint64_t *)*a2;
    }
  }
}

void sub_97D4(void *a1)
{
  __cxa_begin_catch(a1);
  do
  {
    uint64_t v2 = (void *)*v1;
    operator delete(v1);
    int v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_97F4(_Unwind_Exception *a1)
{
}

uint64_t sub_9808(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  float v7 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    uint64_t v9 = 2 * v6;
    BOOL v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    size_t v11 = v10 | v9;
    unint64_t v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12) {
      size_t v13 = v12;
    }
    else {
      size_t v13 = v11;
    }
    sub_9A48(a1, v13);
    unint64_t v6 = *(void *)(a1 + 8);
  }
  uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    unint64_t v15 = a2;
    if (v6 <= a2) {
      unint64_t v15 = a2 % v6;
    }
  }
  else
  {
    unint64_t v15 = (v6 - 1) & a2;
  }
  uint64_t v16 = *(void *)(*(void *)a1 + 8 * v15);
  if (!v16) {
    return 0;
  }
  int v17 = 0;
  do
  {
    uint64_t result = v16;
    uint64_t v16 = *(void *)v16;
    if (!v16) {
      break;
    }
    unint64_t v19 = *(void *)(v16 + 8);
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v20 = *(void *)(v16 + 8);
      if (v19 >= v6) {
        unint64_t v20 = v19 % v6;
      }
    }
    else
    {
      unint64_t v20 = v19 & (v6 - 1);
    }
    if (v20 != v15) {
      break;
    }
    BOOL v21 = v19 == a2 && *(_DWORD *)(v16 + 16) == *a3;
    int v22 = v17 & !v21;
    v17 |= v21;
  }
  while (v22 != 1);
  return result;
}

void *sub_9960(void *result, void *a2, void *a3)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(void *)(*result + 8 * v4) = result + 2;
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
LABEL_18:
    *(void *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
    if (v6 != v4) {
      goto LABEL_18;
    }
  }
LABEL_19:
  ++result[3];
  return result;
}

void sub_9A48(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_9B38(a1, prime);
    }
  }
}

void sub_9B38(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_8350();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(uint64_t ***)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = (unint64_t)v7[1];
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
      for (uint64_t i = *v7; *v7; uint64_t i = *v7)
      {
        unint64_t v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2) {
            v12 %= a2;
          }
        }
        else
        {
          v12 &= a2 - 1;
        }
        if (v12 == v8)
        {
          uint64_t v7 = (uint64_t **)i;
        }
        else
        {
          size_t v13 = i;
          if (*(void *)(*(void *)a1 + 8 * v12))
          {
            do
            {
              uint8x8_t v14 = v13;
              size_t v13 = (uint64_t *)*v13;
            }
            while (v13 && *((_DWORD *)i + 4) == *((_DWORD *)v13 + 4));
            void *v7 = v13;
            void *v14 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = i;
          }
          else
          {
            *(void *)(*(void *)a1 + 8 * v12) = v7;
            uint64_t v7 = (uint64_t **)i;
            unint64_t v8 = v12;
          }
        }
      }
    }
  }
  else
  {
    BOOL v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

unsigned int *sub_9CAC(void *a1, _OWORD *a2)
{
  int8x8_t v4 = (unsigned int *)operator new(0x20uLL);
  *((_OWORD *)v4 + 1) = *a2;
  unint64_t v5 = v4[4];
  *(void *)int8x8_t v4 = 0;
  *((void *)v4 + 1) = v5;
  uint64_t v6 = (void *)sub_9808((uint64_t)a1, v5, v4 + 4);
  sub_9960(a1, v4, v6);
  return v4;
}

void sub_9D14(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_9D28(void *a1, unsigned int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (v2.i32[0] - 1) & v3;
  }
  uint64_t v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (uint64_t result = *v6; result; uint64_t result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == v3) {
        return result;
      }
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }
      else
      {
        v8 &= *(void *)&v2 - 1;
      }
      if (v8 != v5) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_9DDC(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  sub_9E20(a1, a2, (uint64_t)&__p);
  unint64_t v3 = __p;
  __p = 0;
  if (v3) {
    operator delete(v3);
  }
  return v2;
}

void *sub_9E20@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  uint64_t v6 = *(void **)(*result + 8 * v4);
  do
  {
    uint64_t v7 = v6;
    uint64_t v6 = (void *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2) {
    goto LABEL_18;
  }
  unint64_t v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(void *)&v3) {
      v8 %= *(void *)&v3;
    }
  }
  else
  {
    v8 &= *(void *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v3) {
        v9 %= *(void *)&v3;
      }
    }
    else
    {
      v9 &= *(void *)&v3 - 1;
    }
    if (v9 != v4) {
LABEL_19:
    }
      *(void *)(*result + 8 * v4) = 0;
  }
  uint64_t v10 = *a2;
  if (*a2)
  {
    unint64_t v11 = *(void *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(void *)&v3) {
        v11 %= *(void *)&v3;
      }
    }
    else
    {
      v11 &= *(void *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(void *)(*result + 8 * v11) = v7;
      uint64_t v10 = *a2;
    }
  }
  void *v7 = v10;
  *a2 = 0;
  --result[3];
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = result + 2;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_9FD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A270(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A32C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_A4E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_A59C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_AA38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_AA68(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_AA78(uint64_t a1)
{
}

id sub_AA80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _onResourceUpdated:a4 target:a3 dispatcher:a2];
}

void sub_AAEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)DYEAGLDebugFunctionPlayer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_AB9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_ADB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B3A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_B728(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C4A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

uint64_t sub_C5C0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + OBJC_IVAR___DYGLFunctionPlayer__disp)
                                           + 832))(*(void *)(*(void *)(a1 + 32)
                                                               + OBJC_IVAR___DYGLFunctionPlayer__gli_ctx));
}

void sub_D090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_D34C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_D690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_D7C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_DAC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19)
{
  _Block_object_dispose((const void *)(v19 - 80), 8);
  _Unwind_Resume(a1);
}

id sub_DB14(uint64_t a1)
{
  *(void *)int8x8_t v3 = 0;
  GPUTools::GL::DYGetTextureTargetInfo();
  id result = [*(id *)(a1 + 32) _isBoundObjectAlive:isObjectFunc:0, *(void *)(*(void *)(*(void *)(a1 + 32) + OBJC_IVAR___DYGLFunctionPlayer__disp) + 1160), 0, *(void *)&v3[1]];
  if ((result & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

void sub_DC7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_DDB4(uint64_t a1, int a2, char a3)
{
  *(void *)(a1 + 8) = +[CATransaction animationTimingFunction];
  +[CATransaction animationDuration];
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = +[CATransaction disableActions];
  *(unsigned char *)(a1 + 33) = a3;
  uint64_t v7 = +[CATransaction completionBlock];
  id v8 = [v7 copy];
  unint64_t v9 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v8;

  if (a2) {
    +[CATransaction setDisableActions:1];
  }
  return a1;
}

void sub_DE50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_DE80(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 33)) {
    +[CATransaction flush];
  }
  id v2 = *(id *)(a1 + 8);
  +[CATransaction setAnimationTimingFunction:v2];

  +[CATransaction setAnimationDuration:*(double *)(a1 + 16)];
  +[CATransaction setCompletionBlock:*(void *)(a1 + 24)];
  +[CATransaction setDisableActions:*(unsigned __int8 *)(a1 + 32)];

  return a1;
}

void sub_DF18(GPUTools::Playback::GL::ContextInfo *a1)
{
  *(void *)a1 = off_28798;
  uint64_t v2 = (uint64_t)a1 + 120;
  sub_7F94((uint64_t)a1 + 200);
  sub_8014((uint64_t)a1 + 160);
  sub_8014(v2);

  GPUTools::Playback::GL::ContextInfo::~ContextInfo(a1);
}

void sub_DF88(GPUTools::Playback::GL::ContextInfo *a1)
{
  sub_DF18(a1);

  operator delete();
}

void sub_E14C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E2F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_EEFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14, uint64_t a15, uint64_t a16, char a17)
{
}

__n64 sub_F08C(uint64_t a1, unint64_t a2)
{
  __int16 v2 = *(_WORD *)(a1 + 22);
  if (v2)
  {
    result.n64_f64[0] = 0.0;
    if (*(unsigned __int16 *)(a1 + 20) <= a2) {
      return result;
    }
  }
  else
  {
    result.n64_f64[0] = 0.0;
    if (a2) {
      return result;
    }
  }
  switch(*(_DWORD *)(a1 + 8))
  {
    case 1:
      int v4 = *(char *)(*(void *)a1 + a2);
      goto LABEL_12;
    case 2:
      result.n64_u8[0] = *(unsigned char *)(*(void *)a1 + a2);
      goto LABEL_18;
    case 3:
      int v4 = *(__int16 *)(*(void *)a1 + 2 * a2);
LABEL_12:
      result.n64_f64[0] = (double)v4;
      return result;
    case 4:
      result.n64_u16[0] = *(_WORD *)(*(void *)a1 + 2 * a2);
      goto LABEL_18;
    case 5:
      result.n64_f64[0] = (double)*(int *)(*(void *)a1 + 4 * a2);
      if (*(_DWORD *)(a1 + 12) == 19) {
        result.n64_f64[0] = result.n64_f64[0] * 0.0000152587891;
      }
      return result;
    case 6:
      result.n64_u32[0] = *(_DWORD *)(*(void *)a1 + 4 * a2);
      goto LABEL_18;
    case 7:
    case 0xB:
      result.n64_f64[0] = (double)*(uint64_t *)(*(void *)a1 + 8 * a2);
      return result;
    case 8:
    case 0xC:
      result.n64_u64[0] = *(unint64_t *)(*(void *)a1 + 8 * a2);
LABEL_18:
      result.n64_f64[0] = (double)result.n64_u64[0];
      break;
    case 9:
      result.n64_f64[0] = *(float *)(*(void *)a1 + 4 * a2);
      break;
    case 0xA:
      result.n64_u64[0] = *(unint64_t *)(*(void *)a1 + 8 * a2);
      break;
    case 0xD:
      if ((v2 & 0x10) != 0) {
        result.n64_f64[0] = (double)GPUTools::FD::Argument::ViewAsGLObjectName((GPUTools::FD::Argument *)a1);
      }
      break;
    default:
      return result;
  }
  return result;
}

void sub_F9F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FEDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_10990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,void *a27)
{
  _Unwind_Resume(a1);
}

void sub_10BC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_10CB0(uint64_t a1, unsigned int *a2, _DWORD *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    unint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      uint64_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == v6) {
              return v10;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3) {
              break;
            }
          }
          uint64_t v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  uint64_t v10 = operator new(0x18uLL);
  *uint64_t v10 = 0;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    sub_8384(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  uint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *uint64_t v10 = *v19;
LABEL_38:
    *uint64_t v19 = v10;
    goto LABEL_39;
  }
  *uint64_t v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    uint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_10EBC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_10ED0(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    uint64_t v10 = *(void **)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = (void *)*v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          unint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  uint64_t v13 = a1 + 16;
  BOOL v14 = (char *)operator new(0x40uLL);
  v24[0] = v14;
  v24[1] = a1 + 16;
  *(void *)BOOL v14 = 0;
  *((void *)v14 + 1) = v7;
  *((void *)v14 + 2) = **a4;
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  *((_DWORD *)v14 + 14) = 1065353216;
  char v25 = 1;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = 1;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_8384(a1, v20);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  BOOL v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *(void *)v24[0] = *v21;
    *BOOL v21 = v24[0];
  }
  else
  {
    *(void *)v24[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v24[0];
    *(void *)(*(void *)a1 + 8 * v4) = v13;
    if (*(void *)v24[0])
    {
      unint64_t v22 = *(void *)(*(void *)v24[0] + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v22 >= v8) {
          v22 %= v8;
        }
      }
      else
      {
        v22 &= v8 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v22) = v24[0];
    }
  }
  unint64_t v11 = (void *)v24[0];
  v24[0] = 0;
  ++*(void *)(a1 + 24);
  sub_85D0((uint64_t)v24, 0);
  return v11;
}

void sub_11128(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_85D0((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void sub_11140(uint64_t a1, uint64_t *a2)
{
  sub_111E4((void *)a1);
  uint64_t v4 = *a2;
  *a2 = 0;
  uint8x8_t v5 = *(void **)a1;
  *(void *)a1 = v4;
  if (v5) {
    operator delete(v5);
  }
  uint64_t v8 = a2[2];
  unint64_t v7 = a2 + 2;
  uint64_t v6 = v8;
  uint64_t v9 = *(v7 - 1);
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 8) = v9;
  *(v7 - 1) = 0;
  uint64_t v10 = v7[1];
  *(void *)(a1 + 24) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    unint64_t v11 = *(void *)(v6 + 8);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        v11 %= v12;
      }
    }
    else
    {
      v11 &= v12 - 1;
    }
    *(void *)(*(void *)a1 + 8 * v11) = a1 + 16;
    void *v7 = 0;
    v7[1] = 0;
  }
}

void *sub_111E4(void *result)
{
  if (result[3])
  {
    uint64_t v1 = result;
    __n64 result = (void *)result[2];
    if (result)
    {
      do
      {
        __int16 v2 = (void *)*result;
        operator delete(result);
        __n64 result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

void *sub_1124C(uint64_t a1, unint64_t *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (uint64_t i = *v9; i; uint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6) {
            return i;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x18uLL);
  void *i = 0;
  i[1] = v6;
  i[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    sub_8384(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  unint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    void *i = *v19;
LABEL_38:
    *unint64_t v19 = i;
    goto LABEL_39;
  }
  void *i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v20 = *(void *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    unint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_11454(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

unint64_t sub_11468(uint64_t a1, unint64_t a2)
{
  __int16 v2 = *(_WORD *)(a1 + 22);
  if (v2)
  {
    if (*(unsigned __int16 *)(a1 + 20) > a2) {
      goto LABEL_5;
    }
    return 0;
  }
  if (a2) {
    return 0;
  }
LABEL_5:
  switch(*(_DWORD *)(a1 + 8))
  {
    case 1:
      return *(char *)(*(void *)a1 + a2);
    case 2:
      return *(unsigned __int8 *)(*(void *)a1 + a2);
    case 3:
      return *(__int16 *)(*(void *)a1 + 2 * a2);
    case 4:
      return *(unsigned __int16 *)(*(void *)a1 + 2 * a2);
    case 5:
      int v4 = *(_DWORD *)(a1 + 12);
      unint64_t result = *(int *)(*(void *)a1 + 4 * a2);
      if (v4 != 19) {
        return result;
      }
      double v5 = (double)(int)result * 0.0000152587891;
LABEL_10:
      unint64_t result = (unint64_t)v5;
      break;
    case 6:
      return *(unsigned int *)(*(void *)a1 + 4 * a2);
    case 7:
    case 8:
    case 0xB:
    case 0xC:
      return *(void *)(*(void *)a1 + 8 * a2);
    case 9:
      return (unint64_t)*(float *)(*(void *)a1 + 4 * a2);
    case 0xA:
      double v5 = *(double *)(*(void *)a1 + 8 * a2);
      goto LABEL_10;
    case 0xD:
      if ((v2 & 0x10) == 0) {
        return 0;
      }
      return GPUTools::FD::Argument::ViewAsGLObjectName((GPUTools::FD::Argument *)a1);
    default:
      return 0;
  }
  return result;
}

void *sub_115A0(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          unint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  unint64_t v11 = operator new(0x20uLL);
  *unint64_t v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  *(void *)((char *)v11 + 20) = 0x8A7A00000000;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    sub_8384(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v19 = *(void *)a1;
  unint64_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *unint64_t v11 = *v20;
LABEL_38:
    *unint64_t v20 = v11;
    goto LABEL_39;
  }
  *unint64_t v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    unint64_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_117BC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_117D0(uint64_t a1, unint64_t *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    uint8x8_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (uint64_t i = *v9; i; uint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6) {
            return i;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x18uLL);
  void *i = 0;
  i[1] = v6;
  i[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    sub_8384(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  uint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    void *i = *v19;
LABEL_38:
    *uint64_t v19 = i;
    goto LABEL_39;
  }
  void *i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v20 = *(void *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    uint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_119D8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_119EC(void *a1, unint64_t *a2)
{
  unint64_t result = sub_8CB4(a1, a2);
  if (result)
  {
    sub_9DDC(a1, result);
    return (void *)(&dword_0 + 1);
  }
  return result;
}

void sub_11A90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_11B14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_11E24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_11E60(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_15D50((void **)a1, v4);
  }
  else if (!v3)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 40 * a2;
  }
}

void sub_11F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)DYGLShaderProfilerFunctionPlayerSupport;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1216C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_121F8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) strongPlaybackEngine];
  [v2 setDelegate:0];

  id v3 = [*(id *)(a1 + 32) _queryShaderResult];
  [*(id *)(a1 + 40) setResult:];
}

void sub_12270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1231C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_126E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1306C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

_DWORD *sub_13130(void **a1, _DWORD *a2, _DWORD *a3)
{
  unint64_t v8 = (unint64_t)a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  unint64_t v7 = v8;
  uint8x8_t v9 = *(_DWORD **)(v6 - 8);
  if ((unint64_t)v9 >= v8)
  {
    uint64_t v11 = ((char *)v9 - (unsigned char *)*a1) >> 3;
    unint64_t v12 = v11 + 1;
    if ((unint64_t)(v11 + 1) >> 61) {
      sub_5BBC();
    }
    uint64_t v13 = v7 - (void)*a1;
    if (v13 >> 2 > v12) {
      unint64_t v12 = v13 >> 2;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v12;
    }
    unint64_t v15 = (char *)sub_163A8(v6, v14);
    unint64_t v16 = &v15[8 * v11];
    uint64_t v18 = &v15[8 * v17];
    *(_DWORD *)unint64_t v16 = *a2;
    *((_DWORD *)v16 + 1) = *a3;
    uint64_t v10 = v16 + 8;
    unint64_t v20 = (char *)*a1;
    uint64_t v19 = (char *)a1[1];
    if (v19 != *a1)
    {
      do
      {
        uint64_t v21 = *((void *)v19 - 1);
        v19 -= 8;
        *((void *)v16 - 1) = v21;
        v16 -= 8;
      }
      while (v19 != v20);
      uint64_t v19 = (char *)*a1;
    }
    *a1 = v16;
    a1[1] = v10;
    a1[2] = v18;
    if (v19) {
      operator delete(v19);
    }
  }
  else
  {
    *uint8x8_t v9 = *a2;
    v9[1] = *a3;
    uint64_t v10 = v9 + 2;
  }
  a1[1] = v10;
  return v10 - 2;
}

void sub_133F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_13760(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_13B04()
{
}

uint64_t *sub_13B70(uint64_t *result)
{
  if (*((_DWORD *)result + 6))
  {
    unint64_t v1 = 0;
    uint64_t v2 = *result;
    uint64_t v3 = result[25];
    uint64_t v4 = result[4];
    uint64_t v5 = result[7];
    do
    {
      uint64_t v6 = 0;
      *(void *)(v2 + 8 * v1) = 0;
      *(_DWORD *)(v3 + 4 * v1) = 0;
      *(void *)(v4 + 8 * v1) = 0;
      *(void *)(v5 + 8 * v1) = 0;
      do
      {
        *(void *)(result[v6 + 10] + 8 * v1) = 0;
        v6 += 3;
      }
      while (v6 != 15);
      ++v1;
      unint64_t v7 = *((unsigned int *)result + 6);
    }
    while (v1 < v7);
    int v8 = v7 - 1;
  }
  else
  {
    int v8 = -1;
  }
  *((_DWORD *)result + 56) = 0;
  *((_DWORD *)result + 57) = v8;
  return result;
}

void sub_13CF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_13E9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_14124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_14138(uint64_t a1, void *a2)
{
  int v3 = *(_DWORD *)(a1 + 224);
  unsigned int v4 = *(_DWORD *)(a1 + 24);
  uint64_t v5 = (*(_DWORD *)(a1 + 228) + 1) % v4;
  if (v4 >= v3 + 1) {
    int v6 = v3 + 1;
  }
  else {
    int v6 = *(_DWORD *)(a1 + 24);
  }
  *(_DWORD *)(a1 + 224) = v6;
  *(_DWORD *)(a1 + 228) = v5;
  unint64_t v7 = *(uint64_t **)a1;
  *(void *)(*(void *)a1 + 8 * v5) = *a2;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 80);
  uint64_t v11 = *(void *)(a1 + 104);
  uint64_t v12 = *(void *)(a1 + 128);
  uint64_t v13 = *(void *)(a1 + 152);
  uint64_t v14 = *(void *)(a1 + 176);
  if (v6 == 1)
  {
    uint64_t v15 = *v7;
    *(void *)(v14 + 8 * v5) = v15;
    *(void *)(v13 + 8 * v5) = v15;
    *(void *)(v12 + 8 * v5) = v15;
    *(void *)(v11 + 8 * v5) = v15;
    *(void *)(v10 + 8 * v5) = v15;
    **(_DWORD **)(a1 + 200) = 0;
    *(void *)(v9 + 8 * v5) = v15;
    *(void *)(v8 + 8 * v5) = v15;
  }
  else
  {
    *(void *)(v8 + 8 * v5) = 0;
    unint64_t v16 = *(_DWORD **)(a1 + 200);
    if (v6)
    {
      size_t v17 = 0;
      uint64_t v18 = 0;
      do
      {
        v16[v17] = v17;
        v18 += v7[v17];
        *(void *)(v8 + 8 * v5) = v18;
        ++v17;
        size_t v19 = *(unsigned int *)(a1 + 224);
      }
      while (v17 < v19);
    }
    else
    {
      size_t v19 = 0;
    }
    __compar[0] = _NSConcreteStackBlock;
    __compar[1] = 3221225472;
    __compar[2] = sub_169A4;
    __compar[3] = &unk_287D0;
    __compar[4] = a1;
    qsort_b(v16, v19, 4uLL, __compar);
    uint64_t v20 = *(void *)(v8 + 8 * v5);
    unint64_t v21 = *(unsigned int *)(a1 + 224);
    unint64_t v22 = v21 >> 1;
    if (v20) {
      unint64_t v23 = v20 + (v21 >> 1);
    }
    else {
      unint64_t v23 = -(uint64_t)v22;
    }
    *(void *)(v8 + 8 * v5) = v23 / v21;
    unint64_t v24 = *(unsigned int **)(a1 + 200);
    char v25 = *(uint64_t **)a1;
    *(void *)(v10 + 8 * v5) = *(void *)(*(void *)a1 + 8 * *v24);
    *(void *)(v14 + 8 * v5) = v25[v24[(v21 - 1)]];
    if (v21) {
      unint64_t v26 = v25[v24[v22]];
    }
    else {
      unint64_t v26 = (unint64_t)(v25[v24[v22]] + v25[v24[(v22 - 1)]]) >> 1;
    }
    *(void *)(v12 + 8 * v5) = v26;
    unint64_t v27 = v21 >> 2;
    unsigned int v28 = ~(v21 >> 2);
    unsigned int v29 = v21 + v28;
    uint64_t v30 = v24[v21 >> 2];
    uint64_t v31 = v25[v30];
    if ((v21 & 3) != 0)
    {
      *(void *)(v11 + 8 * v5) = v31;
      uint64_t v32 = v24[v29];
      unint64_t v33 = v25[v32];
    }
    else
    {
      *(void *)(v11 + 8 * v5) = (unint64_t)(v25[v24[(v27 - 1)]] + v31) >> 1;
      uint64_t v32 = v24[v29];
      unint64_t v33 = (unint64_t)(v25[v24[(v21 - v27)]] + v25[v32]) >> 1;
    }
    *(void *)(v13 + 8 * v5) = v33;
    uint64_t v34 = (v21 & 0xFFFFFFFC) - (v21 & 0x3FFFFFFF) + 4;
    unint64_t v35 = (v25[v32] + v25[v30]) * v34;
    *(void *)(v9 + 8 * v5) = v35;
    if ((int)v27 + 1 < v29)
    {
      unint64_t v36 = &v24[v27 + 1];
      int v37 = 2 * v27 - v21 + 2;
      do
      {
        int v38 = *v36++;
        v35 += 4 * v25[v38];
        *(void *)(v9 + 8 * v5) = v35;
      }
      while (!__CFADD__(v37++, 1));
    }
    *(void *)(v9 + 8 * v5) = v35 / (4 * (v29 + v28) + 2 * v34);
  }
}

unint64_t sub_143D8(uint64_t a1, unsigned int a2, double *a3, double *a4)
{
  LODWORD(v4) = *(_DWORD *)(a1 + 224);
  if (!v4) {
    return v4 & 1;
  }
  if (v4 == 1)
  {
    uint64_t v5 = (*(_DWORD *)(a1 + 24) + *(_DWORD *)(a1 + 228)) % *(_DWORD *)(a1 + 24);
    unint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8 * v5);
    if (v4)
    {
      double v6 = (double)(unint64_t)(*(void *)(*(void *)(a1 + 152) + 8 * v5)
                                    - *(void *)(*(void *)(a1 + 104) + 8 * v5))
         / (double)v4;
      *a4 = v6;
      *a3 = v6;
      LOBYTE(v4) = 1;
    }
    return v4 & 1;
  }
  if (v4 >= a2) {
    LODWORD(v4) = a2;
  }
  if (v4)
  {
    unsigned int v7 = *(_DWORD *)(a1 + 228);
    uint64_t v8 = *(void *)(a1 + 56);
    char v9 = 1;
    unsigned int v10 = *(_DWORD *)(a1 + 24);
    while (1)
    {
      unint64_t v11 = *(void *)(v8 + 8 * v7);
      if (v11)
      {
        double v12 = (double)(unint64_t)(*(void *)(*(void *)(a1 + 152) + 8 * v7)
                                       - *(void *)(*(void *)(a1 + 104) + 8 * v7))
            / (double)v11;
        if (v9)
        {
          *a4 = v12;
          uint64_t v13 = a3;
        }
        else
        {
          uint64_t v13 = a3;
          if (v12 >= *a3)
          {
            uint64_t v13 = a4;
            if (v12 <= *a4)
            {
              char v9 = 0;
              goto LABEL_15;
            }
          }
        }
        char v9 = 0;
        double *v13 = v12;
      }
LABEL_15:
      unsigned int v7 = (v7 + v10 - 1) % v10;
      LODWORD(v4) = v4 - 1;
      if (!v4) {
        goto LABEL_19;
      }
    }
  }
  char v9 = 1;
LABEL_19:
  LOBYTE(v4) = v9 ^ 1;
  return v4 & 1;
}

void sub_149BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25)
{
  if (__p)
  {
    a18 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_14F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_152F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,void *a29)
{
  _Unwind_Resume(a1);
}

void sub_1586C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_159E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_15C0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15D50(void **a1, unint64_t a2)
{
  double v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  unsigned int v7 = *(char **)(v4 - 8);
  if (0xCCCCCCCCCCCCCCCDLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      size_t v13 = 40 * ((40 * a2 - 40) / 0x28) + 40;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * ((v7 - (unsigned char *)*a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0x666666666666666) {
      sub_5BBC();
    }
    unint64_t v10 = 0xCCCCCCCCCCCCCCCDLL * ((v5 - (unsigned char *)*a1) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x333333333333333) {
      unint64_t v11 = 0x666666666666666;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11) {
      double v12 = (char *)sub_15EEC(v4, v11);
    }
    else {
      double v12 = 0;
    }
    uint64_t v14 = &v12[40 * v8];
    uint64_t v15 = &v12[40 * v11];
    size_t v16 = 40 * ((40 * a2 - 40) / 0x28) + 40;
    bzero(v14, v16);
    size_t v17 = &v14[v16];
    size_t v19 = (char *)*a1;
    uint64_t v18 = (char *)a1[1];
    if (v18 != *a1)
    {
      do
      {
        long long v20 = *(_OWORD *)(v18 - 40);
        long long v21 = *(_OWORD *)(v18 - 24);
        *((void *)v14 - 1) = *((void *)v18 - 1);
        *(_OWORD *)(v14 - 24) = v21;
        *(_OWORD *)(v14 - 40) = v20;
        v14 -= 40;
        v18 -= 40;
      }
      while (v18 != v19);
      uint64_t v18 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v17;
    a1[2] = v15;
    if (v18)
    {
      operator delete(v18);
    }
  }
}

void *sub_15EEC(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    sub_8350();
  }
  return operator new(40 * a2);
}

void *sub_15F34(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    unint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          unint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  unint64_t v11 = operator new(0x20uLL);
  *unint64_t v11 = 0;
  v11[1] = v7;
  v11[2] = **a4;
  *((_DWORD *)v11 + 6) = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    sub_8384(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v19 = *(void *)a1;
  long long v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *unint64_t v11 = *v20;
LABEL_38:
    *long long v20 = v11;
    goto LABEL_39;
  }
  *unint64_t v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    long long v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_16144(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_16158(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    unint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7) {
            return i;
          }
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v4) {
            break;
          }
        }
      }
    }
  }
  float v13 = (void *)(a1 + 16);
  uint64_t i = operator new(0x30uLL);
  void *i = 0;
  i[1] = v7;
  uint64_t v14 = **a4;
  i[4] = 0;
  i[5] = 0;
  i[2] = v14;
  i[3] = 0;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = 1;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_8384(a1, v20);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v21 = *(void *)a1;
  unint64_t v22 = *(void **)(*(void *)a1 + 8 * v4);
  if (v22)
  {
    void *i = *v22;
LABEL_38:
    *unint64_t v22 = i;
    goto LABEL_39;
  }
  void *i = *v13;
  void *v13 = i;
  *(void *)(v21 + 8 * v4) = v13;
  if (*i)
  {
    unint64_t v23 = *(void *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v23 >= v8) {
        v23 %= v8;
      }
    }
    else
    {
      v23 &= v8 - 1;
    }
    unint64_t v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_1638C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  sub_8BC0(v11, v10);
  _Unwind_Resume(a1);
}

void *sub_163A8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_8350();
  }
  return operator new(8 * a2);
}

void sub_163E0(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    sub_16438(a1, *(void **)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

void sub_16438(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      int v3 = (void *)*v2;
      sub_7F0C((uint64_t)(v2 + 3));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void sub_1647C(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    sub_7F48(a1, *(void **)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

uint64_t sub_164D4(uint64_t a1, unsigned int a2)
{
  *(_OWORD *)(a1 + 32) = 0u;
  uint64_t v3 = a1 + 32;
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = a1 + 56;
  uint64_t v5 = a1 + 200;
  *(void *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_DWORD *)(a1 + 224) = 0;
  *(_DWORD *)(a1 + 24) = a2;
  unint64_t v6 = a2;
  uint64_t v12 = 0;
  sub_1664C(a1, a2, &v12);
  unint64_t v7 = *(unsigned int *)(a1 + 24);
  LODWORD(v12) = 0;
  sub_1667C(v5, v7, &v12);
  unint64_t v8 = *(unsigned int *)(a1 + 24);
  uint64_t v12 = 0;
  sub_1664C(v3, v8, &v12);
  unint64_t v9 = *(unsigned int *)(a1 + 24);
  uint64_t v12 = 0;
  sub_1664C(v4, v9, &v12);
  for (uint64_t i = 80; i != 200; i += 24)
  {
    uint64_t v12 = 0;
    sub_1664C(a1 + i, v6, &v12);
  }
  *(_DWORD *)(a1 + 228) = *(_DWORD *)(a1 + 24) - 1;
  return a1;
}

void sub_165CC(_Unwind_Exception *exception_object)
{
  unint64_t v6 = *v4;
  if (*v4)
  {
    *(void *)(v1 + 208) = v6;
    operator delete(v6);
  }
  uint64_t v7 = 0;
  while (1)
  {
    unint64_t v8 = *(void **)(v1 + v7 + 176);
    if (v8)
    {
      *(void *)(v1 + v7 + 184) = v8;
      operator delete(v8);
    }
    v7 -= 24;
    if (v7 == -120)
    {
      unint64_t v9 = *v3;
      if (*v3)
      {
        *(void *)(v1 + 64) = v9;
        operator delete(v9);
      }
      unint64_t v10 = *v2;
      if (*v2)
      {
        *(void *)(v1 + 40) = v10;
        operator delete(v10);
      }
      uint64_t v11 = *(void **)v1;
      if (*(void *)v1)
      {
        *(void *)(v1 + 8) = v11;
        operator delete(v11);
      }
      _Unwind_Resume(exception_object);
    }
  }
}

void sub_1664C(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    sub_166AC((void **)a1, a2 - v3, a3);
  }
}

void sub_1667C(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + 8) = *(void *)a1 + 4 * a2;
    }
  }
  else
  {
    sub_167D0((void **)a1, a2 - v3, a3);
  }
}

void sub_166AC(void **a1, unint64_t a2, void *a3)
{
  unint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  unint64_t v9 = *(void **)(v6 - 8);
  if (a2 <= (v8 - (unsigned char *)v9) >> 3)
  {
    if (a2)
    {
      uint64_t v16 = 8 * a2;
      BOOL v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 8;
      }
      while (v16);
      unint64_t v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    uint64_t v10 = (char *)v9 - (unsigned char *)*a1;
    unint64_t v11 = a2 + (v10 >> 3);
    if (v11 >> 61) {
      sub_5BBC();
    }
    uint64_t v12 = v10 >> 3;
    uint64_t v13 = v7 - (unsigned char *)*a1;
    if (v13 >> 2 > v11) {
      unint64_t v11 = v13 >> 2;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      float v15 = (char *)sub_163A8(v6, v14);
    }
    else {
      float v15 = 0;
    }
    unint64_t v18 = &v15[8 * v12];
    unint64_t v19 = &v18[8 * a2];
    uint64_t v20 = 8 * a2;
    uint64_t v21 = v18;
    do
    {
      *(void *)uint64_t v21 = *a3;
      v21 += 8;
      v20 -= 8;
    }
    while (v20);
    unint64_t v22 = &v15[8 * v14];
    unint64_t v23 = (char *)*a1;
    for (uint64_t i = (char *)a1[1]; i != v23; i -= 8)
    {
      uint64_t v25 = *((void *)i - 1);
      *((void *)v18 - 1) = v25;
      v18 -= 8;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
    {
      operator delete(v23);
    }
  }
}

void sub_167D0(void **a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  unint64_t v9 = *(_DWORD **)(v6 - 8);
  if (a2 <= (v8 - (unsigned char *)v9) >> 2)
  {
    if (a2)
    {
      uint64_t v16 = 4 * a2;
      BOOL v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 4;
      }
      while (v16);
      unint64_t v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    uint64_t v10 = (char *)v9 - (unsigned char *)*a1;
    unint64_t v11 = a2 + (v10 >> 2);
    if (v11 >> 62) {
      sub_5BBC();
    }
    uint64_t v12 = v10 >> 2;
    uint64_t v13 = v7 - (unsigned char *)*a1;
    if (v13 >> 1 > v11) {
      unint64_t v11 = v13 >> 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      float v15 = (char *)sub_8C20(v6, v14);
    }
    else {
      float v15 = 0;
    }
    unint64_t v18 = &v15[4 * v12];
    unint64_t v19 = &v18[4 * a2];
    uint64_t v20 = 4 * a2;
    uint64_t v21 = v18;
    do
    {
      *(_DWORD *)uint64_t v21 = *a3;
      v21 += 4;
      v20 -= 4;
    }
    while (v20);
    unint64_t v22 = &v15[4 * v14];
    unint64_t v23 = (char *)*a1;
    for (uint64_t i = (char *)a1[1]; i != v23; i -= 4)
    {
      int v25 = *((_DWORD *)i - 1);
      *((_DWORD *)v18 - 1) = v25;
      v18 -= 4;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
    {
      operator delete(v23);
    }
  }
}

void sub_168F4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    unint64_t v3 = *(void **)(a2 + 200);
    if (v3)
    {
      *(void *)(a2 + 208) = v3;
      operator delete(v3);
    }
    uint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = *(void **)(a2 + v4 + 176);
      if (v5)
      {
        *(void *)(a2 + v4 + 184) = v5;
        operator delete(v5);
      }
      v4 -= 24;
      if (v4 == -120)
      {
        uint64_t v6 = *(void **)(a2 + 56);
        if (v6)
        {
          *(void *)(a2 + 64) = v6;
          operator delete(v6);
        }
        uint64_t v7 = *(void **)(a2 + 32);
        if (v7)
        {
          *(void *)(a2 + 40) = v7;
          operator delete(v7);
        }
        unint64_t v8 = *(void **)a2;
        if (*(void *)a2)
        {
          *(void *)(a2 + 8) = v8;
          operator delete(v8);
        }
        operator delete();
      }
    }
  }
}

uint64_t sub_169A4(uint64_t a1, unsigned int *a2, unsigned int *a3)
{
  uint64_t v3 = **(void **)(a1 + 32);
  unint64_t v4 = *(void *)(v3 + 8 * *a2);
  unint64_t v5 = *(void *)(v3 + 8 * *a3);
  BOOL v6 = v4 >= v5;
  BOOL v7 = v4 > v5;
  if (v6) {
    return v7;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

void *sub_169CC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    sub_8350();
  }
  return operator new(32 * a2);
}

void *sub_16A04(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    uint64_t v10 = *(void **)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = (void *)*v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          unint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  uint64_t v13 = a1 + 16;
  unint64_t v14 = (char *)operator new(0x40uLL);
  v24[0] = v14;
  v24[1] = a1 + 16;
  *(void *)unint64_t v14 = 0;
  *((void *)v14 + 1) = v7;
  *((void *)v14 + 2) = **a4;
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  *((_DWORD *)v14 + 14) = 1065353216;
  char v25 = 1;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = 1;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_8384(a1, v20);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *(void *)v24[0] = *v21;
    *uint64_t v21 = v24[0];
  }
  else
  {
    *(void *)v24[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v24[0];
    *(void *)(*(void *)a1 + 8 * v4) = v13;
    if (*(void *)v24[0])
    {
      unint64_t v22 = *(void *)(*(void *)v24[0] + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v22 >= v8) {
          v22 %= v8;
        }
      }
      else
      {
        v22 &= v8 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v22) = v24[0];
    }
  }
  unint64_t v11 = (void *)v24[0];
  v24[0] = 0;
  ++*(void *)(a1 + 24);
  sub_16C74((uint64_t)v24, 0);
  return v11;
}

void sub_16C5C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_16C74((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void sub_16C74(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      sub_7F0C((uint64_t)v2 + 24);
    }
    operator delete(v2);
  }
}

void sub_16CCC(uint64_t a1, uint64_t *a2)
{
  sub_1647C(a1);
  uint64_t v4 = *a2;
  *a2 = 0;
  unint64_t v5 = *(void **)a1;
  *(void *)a1 = v4;
  if (v5) {
    operator delete(v5);
  }
  uint64_t v8 = a2[2];
  unint64_t v7 = a2 + 2;
  uint64_t v6 = v8;
  uint64_t v9 = *(v7 - 1);
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 8) = v9;
  *(v7 - 1) = 0;
  uint64_t v10 = v7[1];
  *(void *)(a1 + 24) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    unint64_t v11 = *(void *)(v6 + 8);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        v11 %= v12;
      }
    }
    else
    {
      v11 &= v12 - 1;
    }
    *(void *)(*(void *)a1 + 8 * v11) = a1 + 16;
    void *v7 = 0;
    v7[1] = 0;
  }
}

void *sub_16D70(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          unint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  uint64_t v13 = (void *)(a1 + 16);
  unint64_t v11 = operator new(0x30uLL);
  *unint64_t v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[4] = 0;
  v11[5] = 0;
  v11[3] = 0;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v15 = *(float *)(a1 + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    BOOL v16 = 1;
    if (v8 >= 3) {
      BOOL v16 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v8);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    sub_8384(a1, v19);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v20 = *(void *)a1;
  uint64_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *unint64_t v11 = *v21;
LABEL_38:
    *uint64_t v21 = v11;
    goto LABEL_39;
  }
  *unint64_t v11 = *v13;
  void *v13 = v11;
  *(void *)(v20 + 8 * v4) = v13;
  if (*v11)
  {
    unint64_t v22 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8) {
        v22 %= v8;
      }
    }
    else
    {
      v22 &= v8 - 1;
    }
    uint64_t v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_16FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  sub_8BC0(v11, v10);
  _Unwind_Resume(a1);
}

uint64_t *sub_16FC8(void *a1, unint64_t *a2)
{
  unint64_t result = sub_8CB4(a1, a2);
  if (result)
  {
    sub_17000(a1, result);
    return (void *)(&dword_0 + 1);
  }
  return result;
}

uint64_t sub_17000(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  sub_9E20(a1, a2, (uint64_t)&__p);
  uint64_t v3 = __p;
  __p = 0;
  if (v3) {
    sub_8BC0((uint64_t)&v6, v3);
  }
  return v2;
}

uint64_t sub_1704C(uint64_t a1)
{
  sub_16438(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_17144(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_171F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_17278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_17364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_176F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_1770C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) eaglPlayer];
  unint64_t v4 = [v3 contextForContextIdentifier:a2];

  return v4;
}

void sub_17764(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17880(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return _CGAffineTransformRotate(retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformScale(retstr, t, sx, sy);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

uint64_t DYAddPerFunctionProfilingData()
{
  return _DYAddPerFunctionProfilingData();
}

uint64_t DYCreatePrivateGLProgram()
{
  return _DYCreatePrivateGLProgram();
}

uint64_t DYCreatePrivateGLProgramPipeline()
{
  return _DYCreatePrivateGLProgramPipeline();
}

uint64_t DYCreatePrivateGLShader()
{
  return _DYCreatePrivateGLShader();
}

uint64_t DYDisableBufferSwaps()
{
  return _DYDisableBufferSwaps();
}

uint64_t DYGetGLGuestAppClient()
{
  return _DYGetGLGuestAppClient();
}

uint64_t DYHarvestRenderbuffer()
{
  return _DYHarvestRenderbuffer();
}

uint64_t DYHarvestRenderbufferInfo()
{
  return _DYHarvestRenderbufferInfo();
}

uint64_t DYReserveGLObjects()
{
  return _DYReserveGLObjects();
}

uint64_t DYReserveGLProgram()
{
  return _DYReserveGLProgram();
}

uint64_t DYReserveGLShader()
{
  return _DYReserveGLShader();
}

uint64_t DYReserveGLVAOs()
{
  return _DYReserveGLVAOs();
}

uint64_t DYSetContextRemappingBlock()
{
  return _DYSetContextRemappingBlock();
}

uint64_t DYSetNameReservationEncoding()
{
  return _DYSetNameReservationEncoding();
}

uint64_t DYSetResourceUpdateCallbackBlock()
{
  return _DYSetResourceUpdateCallbackBlock();
}

uint64_t GLCBackDispatch()
{
  return _GLCBackDispatch();
}

uint64_t GLCFrontDispatch()
{
  return _GLCFrontDispatch();
}

uint64_t GLIContextFromEAGLContext()
{
  return _GLIContextFromEAGLContext();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t GPUTools::GL::GetImageData(GPUTools::GL *this, const Dispatcher *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  return GPUTools::GL::GetImageData(this, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t GPUTools::GL::GetImageInfo()
{
  return GPUTools::GL::GetImageInfo();
}

{
  return GPUTools::GL::GetImageInfo();
}

uint64_t GPUTools::GL::IsSignedType(GPUTools::GL *this, unsigned int a2)
{
  return GPUTools::GL::IsSignedType(this, a2);
}

uint64_t GPUTools::GL::dy_type_size(GPUTools::GL *this, unsigned int a2)
{
  return GPUTools::GL::dy_type_size(this, a2);
}

uint64_t GPUTools::GL::IsIntegerFormat(GPUTools::GL *this, unsigned int a2)
{
  return GPUTools::GL::IsIntegerFormat(this, a2);
}

uint64_t GPUTools::GL::WireframeRenderer::IsBadDrawCall(GPUTools::GL::WireframeRenderer *this, unsigned int a2, int a3, int a4)
{
  return GPUTools::GL::WireframeRenderer::IsBadDrawCall(this, a2, a3, a4);
}

uint64_t GPUTools::GL::WireframeRenderer::CreateLineListFromTriFan(GPUTools::GL::WireframeRenderer *this, void **a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  return GPUTools::GL::WireframeRenderer::CreateLineListFromTriFan(this, a2, a3, a4, a5);
}

uint64_t GPUTools::GL::WireframeRenderer::CreateLineListFromTriList(GPUTools::GL::WireframeRenderer *this, void **a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  return GPUTools::GL::WireframeRenderer::CreateLineListFromTriList(this, a2, a3, a4, a5);
}

uint64_t GPUTools::GL::WireframeRenderer::CreateLineListFromTriStrip(GPUTools::GL::WireframeRenderer *this, void **a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  return GPUTools::GL::WireframeRenderer::CreateLineListFromTriStrip(this, a2, a3, a4, a5);
}

uint64_t GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriFan(GPUTools::GL::WireframeRenderer *this, const void *a2, void **a3, unsigned int a4, unsigned int a5, BOOL a6)
{
  return GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriFan(this, a2, a3, a4, a5, a6);
}

uint64_t GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriList(GPUTools::GL::WireframeRenderer *this, const void *a2, void **a3, unsigned int a4, unsigned int a5, BOOL a6)
{
  return GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriList(this, a2, a3, a4, a5, a6);
}

uint64_t GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriStrip(GPUTools::GL::WireframeRenderer *this, const void *a2, void **a3, unsigned int a4, unsigned int a5, BOOL a6)
{
  return GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriStrip(this, a2, a3, a4, a5, a6);
}

uint64_t GPUTools::GL::RangeForUnpackedType(GPUTools::GL *this, unsigned int a2, double *a3, double *a4)
{
  return GPUTools::GL::RangeForUnpackedType(this, a2, a3, a4);
}

uint64_t GPUTools::GL::GetInternalFormatInfo(GPUTools::GL *this, unsigned int a2)
{
  return GPUTools::GL::GetInternalFormatInfo(this, a2);
}

uint64_t GPUTools::GL::DYGetTextureTargetInfo()
{
  return GPUTools::GL::DYGetTextureTargetInfo();
}

uint64_t GPUTools::GL::DYIsAttachmentWritable()
{
  return GPUTools::GL::DYIsAttachmentWritable();
}

uint64_t GPUTools::GL::EnumerateTextureTargets()
{
  return GPUTools::GL::EnumerateTextureTargets();
}

uint64_t GPUTools::GL::SavePixelStorePackState()
{
  return GPUTools::GL::SavePixelStorePackState();
}

uint64_t GPUTools::GL::ApplyPixelStorePackState()
{
  return GPUTools::GL::ApplyPixelStorePackState();
}

uint64_t GPUTools::GL::CopyProgramActiveUniforms()
{
  return GPUTools::GL::CopyProgramActiveUniforms();
}

uint64_t GPUTools::GL::SavePixelStoreUnpackState()
{
  return GPUTools::GL::SavePixelStoreUnpackState();
}

uint64_t GPUTools::GL::ApplyPixelStoreUnpackState()
{
  return GPUTools::GL::ApplyPixelStoreUnpackState();
}

uint64_t GPUTools::GL::CopyProgramActiveAttributes(GPUTools::GL *this, const Dispatcher *a2)
{
  return GPUTools::GL::CopyProgramActiveAttributes(this, a2);
}

uint64_t GPUTools::GL::ShouldUseGLIReadTextureData(GPUTools::GL *this, const Dispatcher *a2)
{
  return GPUTools::GL::ShouldUseGLIReadTextureData(this, a2);
}

uint64_t GPUTools::GL::GetFramebufferAttachmentInfo()
{
  return GPUTools::GL::GetFramebufferAttachmentInfo();
}

uint64_t GPUTools::GL::dy_get_framebuffer_binding_enum(GPUTools::GL *this, unsigned int a2)
{
  return GPUTools::GL::dy_get_framebuffer_binding_enum(this, a2);
}

uint64_t GPUTools::GL::dy_get_renderbuffer_binding_enum(GPUTools::GL *this, unsigned int a2)
{
  return GPUTools::GL::dy_get_renderbuffer_binding_enum(this, a2);
}

uint64_t GPUTools::GL::CopyProgramActiveUniformBlockBindings(GPUTools::GL *this, const Dispatcher *a2)
{
  return GPUTools::GL::CopyProgramActiveUniformBlockBindings(this, a2);
}

uint64_t GPUTools::FD::Argument::ViewAsGLObjectName(GPUTools::FD::Argument *this)
{
  return GPUTools::FD::Argument::ViewAsGLObjectName(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t __udivti3()
{
  return ___udivti3();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

uint64_t dy_abort()
{
  return _dy_abort();
}

void free(void *a1)
{
}

void glUseProgram(GLuint program)
{
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_posix_memalign(memptr, alignment, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

const char *__cdecl object_getClassName(id a1)
{
  return _object_getClassName(a1);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return _vm_allocate(target_task, address, size, flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

id objc_msgSend_API(void *a1, const char *a2, ...)
{
  return [a1 API];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__backupAndSetupStates(void *a1, const char *a2, ...)
{
  return [a1 _backupAndSetupStates];
}

id objc_msgSend__endUSCSampling(void *a1, const char *a2, ...)
{
  return [a1 _endUSCSampling];
}

id objc_msgSend__generateDrawableId(void *a1, const char *a2, ...)
{
  return [a1 _generateDrawableId];
}

id objc_msgSend__isContextModifiable(void *a1, const char *a2, ...)
{
  return [a1 _isContextModifiable];
}

id objc_msgSend__queryShaderResult(void *a1, const char *a2, ...)
{
  return [a1 _queryShaderResult];
}

id objc_msgSend__replaceColorAttachment(void *a1, const char *a2, ...)
{
  return [a1 _replaceColorAttachment];
}

id objc_msgSend__restoreColorAttachment(void *a1, const char *a2, ...)
{
  return [a1 _restoreColorAttachment];
}

id objc_msgSend__restoreStates(void *a1, const char *a2, ...)
{
  return [a1 _restoreStates];
}

id objc_msgSend__startUSCSampling(void *a1, const char *a2, ...)
{
  return [a1 _startUSCSampling];
}

id objc_msgSend__switchToOriginalFramebuffer(void *a1, const char *a2, ...)
{
  return [a1 _switchToOriginalFramebuffer];
}

id objc_msgSend__switchToWireframeFramebuffer(void *a1, const char *a2, ...)
{
  return [a1 _switchToWireframeFramebuffer];
}

id objc_msgSend__uscSamplingEnded(void *a1, const char *a2, ...)
{
  return [a1 _uscSamplingEnded];
}

id objc_msgSend_anchorPoint(void *a1, const char *a2, ...)
{
  return [a1 anchorPoint];
}

id objc_msgSend_animationDuration(void *a1, const char *a2, ...)
{
  return [a1 animationDuration];
}

id objc_msgSend_animationTimingFunction(void *a1, const char *a2, ...)
{
  return [a1 animationTimingFunction];
}

id objc_msgSend_api(void *a1, const char *a2, ...)
{
  return [a1 api];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_captureSessionInfo(void *a1, const char *a2, ...)
{
  return [a1 captureSessionInfo];
}

id objc_msgSend_captureStore(void *a1, const char *a2, ...)
{
  return [a1 captureStore];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return [a1 completionBlock];
}

id objc_msgSend_contentsScale(void *a1, const char *a2, ...)
{
  return [a1 contentsScale];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_ctxID(void *a1, const char *a2, ...)
{
  return [a1 ctxID];
}

id objc_msgSend_currentContextInfo(void *a1, const char *a2, ...)
{
  return [a1 currentContextInfo];
}

id objc_msgSend_currentExecutionModeFunctionIndex(void *a1, const char *a2, ...)
{
  return [a1 currentExecutionModeFunctionIndex];
}

id objc_msgSend_currentFileFunctionIndex(void *a1, const char *a2, ...)
{
  return [a1 currentFileFunctionIndex];
}

id objc_msgSend_currentRenderbufferDrawableMap(void *a1, const char *a2, ...)
{
  return [a1 currentRenderbufferDrawableMap];
}

id objc_msgSend_currentTopLayer(void *a1, const char *a2, ...)
{
  return [a1 currentTopLayer];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deleteCurrentContext(void *a1, const char *a2, ...)
{
  return [a1 deleteCurrentContext];
}

id objc_msgSend_deviceInfo(void *a1, const char *a2, ...)
{
  return [a1 deviceInfo];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disableActions(void *a1, const char *a2, ...)
{
  return [a1 disableActions];
}

id objc_msgSend_disabledFunctions(void *a1, const char *a2, ...)
{
  return [a1 disabledFunctions];
}

id objc_msgSend_drawableProperties(void *a1, const char *a2, ...)
{
  return [a1 drawableProperties];
}

id objc_msgSend_eaglPlayer(void *a1, const char *a2, ...)
{
  return [a1 eaglPlayer];
}

id objc_msgSend_enableDrawCallPresent(void *a1, const char *a2, ...)
{
  return [a1 enableDrawCallPresent];
}

id objc_msgSend_enableExperimentFinish(void *a1, const char *a2, ...)
{
  return [a1 enableExperimentFinish];
}

id objc_msgSend_enableWireframePresent(void *a1, const char *a2, ...)
{
  return [a1 enableWireframePresent];
}

id objc_msgSend_executePlatformFunction(void *a1, const char *a2, ...)
{
  return [a1 executePlatformFunction];
}

id objc_msgSend_experiment(void *a1, const char *a2, ...)
{
  return [a1 experiment];
}

id objc_msgSend_experimentResultsGenerator(void *a1, const char *a2, ...)
{
  return [a1 experimentResultsGenerator];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return [a1 flush];
}

id objc_msgSend_footprint(void *a1, const char *a2, ...)
{
  return [a1 footprint];
}

id objc_msgSend_fragmentShaderKey(void *a1, const char *a2, ...)
{
  return [a1 fragmentShaderKey];
}

id objc_msgSend_function(void *a1, const char *a2, ...)
{
  return [a1 function];
}

id objc_msgSend_functionPlayer(void *a1, const char *a2, ...)
{
  return [a1 functionPlayer];
}

id objc_msgSend_future(void *a1, const char *a2, ...)
{
  return [a1 future];
}

id objc_msgSend_gliContext(void *a1, const char *a2, ...)
{
  return [a1 gliContext];
}

id objc_msgSend_gliDispatch(void *a1, const char *a2, ...)
{
  return [a1 gliDispatch];
}

id objc_msgSend_guestAppWasLinkedOnApexOrLater(void *a1, const char *a2, ...)
{
  return [a1 guestAppWasLinkedOnApexOrLater];
}

id objc_msgSend_isDone(void *a1, const char *a2, ...)
{
  return [a1 isDone];
}

id objc_msgSend_isFunctionEnabled(void *a1, const char *a2, ...)
{
  return [a1 isFunctionEnabled];
}

id objc_msgSend_loopCount(void *a1, const char *a2, ...)
{
  return [a1 loopCount];
}

id objc_msgSend_mainExecutionMode(void *a1, const char *a2, ...)
{
  return [a1 mainExecutionMode];
}

id objc_msgSend_mainScreenDescriptor(void *a1, const char *a2, ...)
{
  return [a1 mainScreenDescriptor];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_onFrameEnd(void *a1, const char *a2, ...)
{
  return [a1 onFrameEnd];
}

id objc_msgSend_onFrameStart(void *a1, const char *a2, ...)
{
  return [a1 onFrameStart];
}

id objc_msgSend_onGraphicsFunctionEnd(void *a1, const char *a2, ...)
{
  return [a1 onGraphicsFunctionEnd];
}

id objc_msgSend_onPlatformFunctionEnd(void *a1, const char *a2, ...)
{
  return [a1 onPlatformFunctionEnd];
}

id objc_msgSend_overrideTypeStrings(void *a1, const char *a2, ...)
{
  return [a1 overrideTypeStrings];
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return [a1 player];
}

id objc_msgSend_prepareForCaptureExecution(void *a1, const char *a2, ...)
{
  return [a1 prepareForCaptureExecution];
}

id objc_msgSend_prevFileFunctionIndex(void *a1, const char *a2, ...)
{
  return [a1 prevFileFunctionIndex];
}

id objc_msgSend_profilingFlags(void *a1, const char *a2, ...)
{
  return [a1 profilingFlags];
}

id objc_msgSend_queryShaderStart(void *a1, const char *a2, ...)
{
  return [a1 queryShaderStart];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_repeatCount(void *a1, const char *a2, ...)
{
  return [a1 repeatCount];
}

id objc_msgSend_sharegroup(void *a1, const char *a2, ...)
{
  return [a1 sharegroup];
}

id objc_msgSend_shouldCallSuper(void *a1, const char *a2, ...)
{
  return [a1 shouldCallSuper];
}

id objc_msgSend_shouldExecuteGraphicsFunction(void *a1, const char *a2, ...)
{
  return [a1 shouldExecuteGraphicsFunction];
}

id objc_msgSend_shouldReturn(void *a1, const char *a2, ...)
{
  return [a1 shouldReturn];
}

id objc_msgSend_strongDelegate(void *a1, const char *a2, ...)
{
  return [a1 strongDelegate];
}

id objc_msgSend_strongFunctionPlayer(void *a1, const char *a2, ...)
{
  return [a1 strongFunctionPlayer];
}

id objc_msgSend_strongLayerManager(void *a1, const char *a2, ...)
{
  return [a1 strongLayerManager];
}

id objc_msgSend_strongPlaybackEngine(void *a1, const char *a2, ...)
{
  return [a1 strongPlaybackEngine];
}

id objc_msgSend_targetFunctionIndex(void *a1, const char *a2, ...)
{
  return [a1 targetFunctionIndex];
}

id objc_msgSend_traceMode(void *a1, const char *a2, ...)
{
  return [a1 traceMode];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return [a1 transform];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_vertexShaderKey(void *a1, const char *a2, ...)
{
  return [a1 vertexShaderKey];
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return [a1 viewController];
}

id objc_msgSend_warmupCount(void *a1, const char *a2, ...)
{
  return [a1 warmupCount];
}

id objc_msgSend_wireframeLineColor(void *a1, const char *a2, ...)
{
  return [a1 wireframeLineColor];
}

id objc_msgSend_wireframeLineWidth(void *a1, const char *a2, ...)
{
  return [a1 wireframeLineWidth];
}