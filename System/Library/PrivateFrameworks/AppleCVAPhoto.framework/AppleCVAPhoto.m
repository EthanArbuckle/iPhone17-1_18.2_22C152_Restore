void sub_1BA814A04()
{
  void *v0;
  uint64_t vars8;

  v0 = (void *)MEMORY[0x1BA9F15D0]();
}

void sub_1BA814A2C()
{
  v0 = (void *)MEMORY[0x1BA9F15D0]();
}

void sub_1BA814A54()
{
  v0 = (void *)MEMORY[0x1BA9F15D0]();
}

void sub_1BA814A7C()
{
  v0 = (void *)MEMORY[0x1BA9F15D0]();
}

void sub_1BA814AA4()
{
  v0 = (void *)MEMORY[0x1BA9F15D0]();
}

void sub_1BA814ACC()
{
  v0 = (void *)MEMORY[0x1BA9F15D0]();
}

void sub_1BA814AF4()
{
  v0 = (void *)MEMORY[0x1BA9F15D0]();
}

void sub_1BA814B1C()
{
  v0 = (void *)MEMORY[0x1BA9F15D0]();
}

void sub_1BA814B44()
{
  v0 = (void *)MEMORY[0x1BA9F15D0]();
}

void sub_1BA814B6C()
{
  v0 = (void *)MEMORY[0x1BA9F15D0]();
}

void sub_1BA814B94()
{
  v0 = (void *)MEMORY[0x1BA9F15D0]();
}

void sub_1BA814BBC()
{
  v0 = (void *)MEMORY[0x1BA9F15D0]();
}

void sub_1BA814BE4()
{
  v0 = (void *)MEMORY[0x1BA9F15D0]();
}

void sub_1BA814C0C()
{
  v0 = (void *)MEMORY[0x1BA9F15D0]();
}

void sub_1BA814C34()
{
  v0 = (void *)MEMORY[0x1BA9F15D0]();
}

void sub_1BA814ECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)CVADisparityPostprocessingRequest;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA814EF8(void *a1)
{
}

void sub_1BA8150D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1BA815274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8153F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8154D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)CVAMattingRequest;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA815678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA81574C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA815890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)CVAPortraitRequest;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA8159BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA815AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)CVAPortraitRequest_StageLight;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA815C18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA816010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)CVAPortraitGenericRequestCubeImpl;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA8160C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1BA8161CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1BA8161F4(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v21 = &unk_1F142EE30;
  unint64_t v22 = a1 | (unint64_t)(a4 << 32);
  id v23 = a5;
  v24 = &v21;
  v26 = v25;
  v25[0] = &unk_1F142EE30;
  v25[1] = v22;
  id v10 = v23;
  v25[2] = v10;
  sub_1BA81673C((uint64_t)&v21);
  if (a2 && a1)
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28760];
    if (v9)
    {
      uint64_t v13 = *MEMORY[0x1E4F28A50];
      v19[0] = @"Error Reason";
      v19[1] = v13;
      v20[0] = v10;
      v20[1] = v9;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
      v15 = [v11 errorWithDomain:v12 code:(int)a4 userInfo:v14];
    }
    else
    {
      v17 = @"Error Reason";
      id v18 = v10;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      v15 = [v11 errorWithDomain:v12 code:(int)a4 userInfo:v14];
    }
    *a2 = v15;
  }
  if (!v26)
  {
    sub_1BA816504();
    __break(1u);
  }
  (*(void (**)(void *))(*v26 + 48))(v26);
  if (v26 == v25)
  {
    (*(void (**)(void *))(v25[0] + 32))(v25);
  }
  else if (v26)
  {
    (*(void (**)(void))(*v26 + 40))();
  }

  return a1;
}

void sub_1BA816450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);

  sub_1BA81651C(va);
  _Unwind_Resume(a1);
}

uint64_t sub_1BA816504()
{
  return sub_1BA81651C();
}

uint64_t sub_1BA81651C(void *a1)
{
  uint64_t v2 = a1[3];
  if (v2)
  {
    (*(void (**)(uint64_t))(*(void *)v2 + 48))(v2);
    v3 = (void *)a1[3];
    if (v3 == a1)
    {
      (*(void (**)(void *))(*a1 + 32))(a1);
    }
    else if (v3)
    {
      (*(void (**)(void *))(*v3 + 40))(v3);
    }
    return (uint64_t)a1;
  }
  else
  {
    uint64_t result = sub_1BA816504();
    __break(1u);
  }
  return result;
}

void sub_1BA8165D4(_Unwind_Exception *exception_object)
{
  v3 = (void *)v1[3];
  if (v3 == v1)
  {
    (*(void (**)(void *))(*v1 + 32))(v1);
    _Unwind_Resume(exception_object);
  }
  if (v3) {
    (*(void (**)(void *))(*v3 + 40))(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_1BA816644(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 8))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v2 = *(_DWORD *)(a1 + 12);
      uint64_t v3 = *(void *)(a1 + 16);
      v4[0] = 67109378;
      v4[1] = v2;
      __int16 v5 = 2112;
      uint64_t v6 = v3;
      _os_log_impl(&dword_1BA813000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "> > > CVAPhoto error = %d, %@", (uint8_t *)v4, 0x12u);
    }
  }
}

void sub_1BA816700(id *a1)
{
  operator delete(a1);
}

void sub_1BA81673C(uint64_t a1)
{
}

id sub_1BA816744(uint64_t a1, void *a2)
{
  *a2 = &unk_1F142EE30;
  a2[1] = *(void *)(a1 + 8);
  id result = *(id *)(a1 + 16);
  a2[2] = result;
  return result;
}

void *sub_1BA816794(uint64_t a1)
{
  int v2 = operator new(0x18uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  v4 = *(void **)(a1 + 16);
  void *v2 = &unk_1F142EE30;
  v2[1] = v3;
  v2[2] = v4;
  return v2;
}

void sub_1BA8167EC(uint64_t a1)
{
  JUMPOUT(0x1BA9F12C0);
}

uint64_t sub_1BA816838(uint64_t a1)
{
  return a1;
}

void sub_1BA8169CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA816BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)CVADisparityPostprocessingResult_Impl;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA816D08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA816D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)CVAMattingResult_Impl;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA816E54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA816EE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)CVAPortraitResult_Impl;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA816FBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA817078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_1BA81708C(double *a1)
{
  double v1 = *a1;
  double v2 = sqrt(a1[1] * a1[1] + v1 * v1 + a1[2] * a1[2] + a1[3] * a1[3]);
  if (v2 < 0.00000011920929)
  {
    __int16 v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"CVAQuaternion cva::normalized(const CVAQuaternion &)"];
    [v5 handleFailureInFunction:v6 file:@"CVAQuaternion.mm" lineNumber:14 description:@"Unable to normalize quaternion"];

    double v1 = *a1;
  }
  return v1 / v2;
}

void sub_1BA81715C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_1BA817178(double *a1, double *a2)
{
  double v4 = sqrt(a1[1] * a1[1] + *a1 * *a1 + a1[2] * a1[2] + a1[3] * a1[3]);
  if (v4 < 0.999999881 || v4 > 1.00000012)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = objc_msgSend(NSString, "stringWithUTF8String:", "double cva::distance(const CVAQuaternion &, const CVAQuaternion &)");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"CVAQuaternion.mm", 75, @"Quaternion has length %.3e != 1.0", sqrt(a1[1] * a1[1] + *a1 * *a1 + a1[2] * a1[2] + a1[3] * a1[3]));
  }
  double v6 = *a2;
  double v7 = a2[1];
  double v8 = a2[2];
  double v9 = a2[3];
  double v10 = sqrt(v7 * v7 + v6 * v6 + v8 * v8 + v9 * v9);
  if (v10 < 0.999999881 || v10 > 1.00000012)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = objc_msgSend(NSString, "stringWithUTF8String:", "double cva::distance(const CVAQuaternion &, const CVAQuaternion &)");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"CVAQuaternion.mm", 79, @"Quaternion has length %.3e != 1.0", sqrt(a2[1] * a2[1] + *a2 * *a2 + a2[2] * a2[2] + a2[3] * a2[3]));

    double v6 = *a2;
    double v7 = a2[1];
    double v8 = a2[2];
    double v9 = a2[3];
  }
  return 1.0 - (a1[1] * v7 + *a1 * v6 + a1[2] * v8 + a1[3] * v9);
}

void sub_1BA81734C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA81750C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_1E9F768F8);
  _Unwind_Resume(a1);
}

void sub_1BA817D04(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_1E9F76628);
  _Unwind_Resume(a1);
}

void sub_1BA817EB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA817FFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA818120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8181B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8182BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8183A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA818408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8184D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA818660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA818724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA818A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1BA818C68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA818CF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA818D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA818E3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA81909C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA81922C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8192C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8198D8(_Unwind_Exception *a1)
{
  uint64_t v12 = v5;
  double v6 = v3;

  std::mutex::~mutex(v4);
  if (*(unsigned char *)(v2 + 56)) {
    *(unsigned char *)(v2 + 56) = 0;
  }
  double v8 = *(char **)(v2 + 32);
  if (v8)
  {
    do
    {
      double v10 = *(char **)v8;
      v11 = (std::__shared_weak_count *)*((void *)v8 + 6);
      if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
      if (v8[39] < 0) {
        operator delete(*((void **)v8 + 2));
      }
      operator delete(v8);
      double v8 = v10;
    }
    while (v10);
  }
  double v9 = *v12;
  void *v12 = 0;
  if (v9) {
    operator delete(v9);
  }
  MEMORY[0x1BA9F12C0](v2, 0x10A0C4075515932);

  _Unwind_Resume(a1);
}

void sub_1BA81A95C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, CFTypeRef a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,CFTypeRef a22,CFTypeRef cf,CFTypeRef a24,CFTypeRef a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,void *a31,uint64_t a32,void *a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61)
{
  if (cf) {
    CFRelease(cf);
  }
  if (a24) {
    CFRelease(a24);
  }
  if (a25) {
    CFRelease(a25);
  }

  if (a15) {
    CFRelease(a15);
  }
  if (a2 == 2)
  {
    id v65 = objc_begin_catch(a1);
    v66 = v65;
    if (a21)
    {
      *a21 = [v65 error];
    }
    [v66 log];

    objc_end_catch();
    JUMPOUT(0x1BA81A890);
  }

  _Block_object_dispose(&a41, 8);
  sub_1BA81651C(&a61);
  JUMPOUT(0x1BA81ACA8);
}

void sub_1BA81AB58()
{
  JUMPOUT(0x1BA81AB88);
}

void sub_1BA81AB90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (a64 == &a61)
  {
    (*(void (**)(uint64_t *))(a61 + 32))(&a61);
    _Unwind_Resume(a1);
  }
  if (a64)
  {
    (*(void (**)(void))(*a64 + 40))();
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x1BA81ACD8);
}

void sub_1BA81AC88()
{
}

void sub_1BA81AC90()
{
}

void sub_1BA81ACE4(void *a1, CVPixelBufferRef pixelBuffer)
{
  v15[4] = *MEMORY[0x1E4F143B8];
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  uint64_t v7 = *MEMORY[0x1E4F24D20];
  v15[0] = MEMORY[0x1E4F1CC08];
  uint64_t v8 = *MEMORY[0x1E4F24D70];
  v14[0] = v7;
  v14[1] = v8;
  double v9 = [NSNumber numberWithUnsignedInt:PixelFormatType];
  v15[1] = v9;
  v14[2] = *MEMORY[0x1E4F24E10];
  double v10 = [NSNumber numberWithUnsignedLong:Width];
  v15[2] = v10;
  v14[3] = *MEMORY[0x1E4F24D08];
  v11 = [NSNumber numberWithUnsignedLong:Height];
  v15[3] = v11;
  CFDictionaryRef v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];

  CVPixelBufferRef v13 = 0;
  CVPixelBufferCreate(0, Width, Height, PixelFormatType, v12, &v13);
  *a1 = v13;
}

void sub_1BA81AE68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1BA81AEA4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1BA81AEB4(uint64_t a1)
{
}

void sub_1BA81AEBC(uint64_t a1, int a2, int a3, id obj)
{
}

void sub_1BA81AED0(void *a1)
{
  if (a1[7])
  {
    uint64_t v2 = [CVAPortraitResult_Impl alloc];
    uint64_t v3 = [*(id *)(*(void *)(a1[8] + 8) + 40) mattingResult];
    uint64_t v4 = a1[9];
    [*(id *)(*(void *)(a1[8] + 8) + 40) portraitStability];
    int v6 = v5;
    [*(id *)(*(void *)(a1[8] + 8) + 40) relightingStability];
    LODWORD(v8) = v7;
    LODWORD(v9) = v6;
    CFDictionaryRef v12 = [(CVAPortraitResult_Impl *)v2 initWithMattingResult:v3 portraitPixelBuffer:v4 portraitStability:v9 relightingStability:v8];

    (*(void (**)(void))(a1[7] + 16))();
    uint64_t v10 = *(void *)(a1[8] + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;
  }
}

void sub_1BA81AFD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

const void **sub_1BA81AFF0(const void **a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  uint64_t v4 = *a1;
  *a1 = cf;
  if (v4) {
    CFRelease(v4);
  }
  return a1;
}

uint64_t sub_1BA81B034(uint64_t result)
{
  *(unsigned char *)(**(void **)(result + 8) + 456) = 0;
  return result;
}

uint64_t sub_1BA81B04C(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1F142EDD8;
  a2[1] = v2;
  return result;
}

void *sub_1BA81B070(uint64_t a1)
{
  id result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *id result = &unk_1F142EDD8;
  result[1] = v3;
  return result;
}

void sub_1BA81B0B8()
{
}

void sub_1BA81B91C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  __cxa_guard_abort(&qword_1E9F76990);
  _Unwind_Resume(a1);
}

void sub_1BA81CDCC()
{
  objc_end_catch();
  JUMPOUT(0x1BA81CDD8);
}

void sub_1BA81CDE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t *a34)
{
  if (a34 == &a31)
  {
    (*(void (**)(uint64_t *))(a31 + 32))(&a31);
    _Unwind_Resume(a1);
  }
  if (a34)
  {
    (*(void (**)(void))(*a34 + 40))();
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

void sub_1BA81CE64(uint64_t a1, uint64_t a2)
{
  if ((byte_1E9F76C09 & 1) == 0)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76578, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1E9F76578))
    {
      sub_1BA81ED8C();
      __cxa_atexit((void (*)(void *))sub_1BA81F3B8, &xmmword_1E9F76580, &dword_1BA813000);
      __cxa_guard_release(&qword_1E9F76578);
    }
    uint64_t v4 = sub_1BA81FA70(a2, a2);
    int v5 = v4;
    int v7 = (char *)v4[6];
    unint64_t v6 = v4[7];
    if ((unint64_t)v7 >= v6)
    {
      double v9 = (char *)v4[5];
      uint64_t v10 = (v7 - v9) >> 3;
      unint64_t v11 = v10 + 1;
      if ((unint64_t)(v10 + 1) >> 61) {
        abort();
      }
      uint64_t v12 = v6 - (void)v9;
      if (v12 >> 2 > v11) {
        unint64_t v11 = v12 >> 2;
      }
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v13 = v11;
      }
      if (v13)
      {
        if (v13 >> 61) {
          sub_1BA81F974();
        }
        v14 = operator new(8 * v13);
      }
      else
      {
        v14 = 0;
      }
      v15 = &v14[8 * v10];
      v16 = &v14[8 * v13];
      void *v15 = a1;
      double v8 = v15 + 1;
      if (v7 == v9)
      {
        double v9 = v7;
      }
      else
      {
        unint64_t v17 = v7 - v9 - 8;
        if (v17 < 0x58) {
          goto LABEL_40;
        }
        if ((unint64_t)(v9 - v14) < 0x20) {
          goto LABEL_40;
        }
        uint64_t v18 = (v17 >> 3) + 1;
        v19 = &v14[8 * v10 - 16];
        v20 = v7 - 16;
        uint64_t v21 = v18 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v22 = *(_OWORD *)v20;
          *(v19 - 1) = *((_OWORD *)v20 - 1);
          _OWORD *v19 = v22;
          v19 -= 2;
          v20 -= 32;
          v21 -= 4;
        }
        while (v21);
        v15 -= v18 & 0x3FFFFFFFFFFFFFFCLL;
        v7 -= 8 * (v18 & 0x3FFFFFFFFFFFFFFCLL);
        if (v18 != (v18 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_40:
          do
          {
            uint64_t v23 = *((void *)v7 - 1);
            v7 -= 8;
            *--v15 = v23;
          }
          while (v7 != v9);
          double v9 = (char *)v5[5];
        }
      }
      v5[5] = v15;
      v5[6] = v8;
      v5[7] = v16;
      if (v9) {
        operator delete(v9);
      }
    }
    else
    {
      *(void *)int v7 = a1;
      double v8 = v7 + 8;
    }
    v5[6] = v8;
    if (byte_1E9F76620)
    {
      if (*(char *)(a2 + 23) >= 0) {
        uint64_t v24 = a2;
      }
      else {
        uint64_t v24 = *(void *)a2;
      }
      NSLog(&cfstr_FileconfigRegi.isa, v24);
      NSLog(&cfstr_FileconfigSing.isa, &xmmword_1E9F76580);
      v25 = sub_1BA81FA70(a2, a2);
      NSLog(&cfstr_FileconfigSing_0.isa, (uint64_t)(v25[6] - v25[5]) >> 3);
    }
    v26 = (void *)qword_1E9F765F8;
    qword_1E9F765F8 = 0;

    sub_1BA81D108();
  }
}

void sub_1BA81D0F0(_Unwind_Exception *a1)
{
}

void sub_1BA81D108()
{
  uint64_t v174 = *MEMORY[0x1E4F143B8];
  if ((byte_1E9F76C09 & 1) == 0)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76578, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1E9F76578))
    {
      sub_1BA81ED8C();
      __cxa_atexit((void (*)(void *))sub_1BA81F3B8, &xmmword_1E9F76580, &dword_1BA813000);
      __cxa_guard_release(&qword_1E9F76578);
    }
    if (!qword_1E9F765F8)
    {
      v150 = sub_1BA81F66C();
      if (byte_1E9F76620) {
        NSLog(&cfstr_FileconfigChec.isa, &xmmword_1E9F76580, v150);
      }
      if (byte_1E9F76C09 == 1 || (sub_1BA81F66C(), (uint64_t v2 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        id v7 = 0;
      }
      else
      {
        uint64_t v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2];
        id v170 = 0;
        uint64_t v4 = *MEMORY[0x1E4F1C530];
        *(void *)&long long __dst = 0;
        [v3 getResourceValue:&v170 forKey:v4 error:&__dst];
        id v5 = v170;
        unint64_t v6 = v5;
        if ((void)__dst) {
          id v7 = 0;
        }
        else {
          id v7 = v5;
        }

        if (v7)
        {
          id v155 = v7;
          if (!qword_1E9F765F8 || (objc_msgSend(v7, "isEqual:") & 1) == 0)
          {
            objc_storeStrong((id *)&qword_1E9F765F8, v7);
            if (qword_1E9F765E8)
            {
              double v8 = (void **)qword_1E9F765E0;
              if (qword_1E9F765E0)
              {
                do
                {
                  uint64_t v12 = (void **)*v8;
                  if (*((char *)v8 + 39) < 0) {
                    operator delete(v8[2]);
                  }
                  operator delete(v8);
                  double v8 = v12;
                }
                while (v12);
              }
              qword_1E9F765E0 = 0;
              uint64_t v9 = *((void *)&xmmword_1E9F765D0 + 1);
              if (*((void *)&xmmword_1E9F765D0 + 1))
              {
                uint64_t v10 = 0;
                do
                  *(void *)(xmmword_1E9F765D0 + 8 * v10++) = 0;
                while (v9 != v10);
              }
              qword_1E9F765E8 = 0;
            }
            if (byte_1E9F76620) {
              NSLog(&cfstr_FileconfigRelo.isa, &xmmword_1E9F76580, v150);
            }
            uint64_t v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v150];
            id v169 = 0;
            v147 = (void *)v11;
            v148 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v11 options:0 error:&v169];
            id v149 = v169;
            if (v149)
            {
              if (byte_1E9F76620) {
                NSLog(&cfstr_FileconfigChec_0.isa, v149);
              }
LABEL_332:

              goto LABEL_11;
            }
            long long v167 = 0u;
            long long v168 = 0u;
            long long v165 = 0u;
            long long v166 = 0u;
            id obj = v148;
            uint64_t v154 = [obj countByEnumeratingWithState:&v165 objects:v173 count:16];
            if (!v154) {
              goto LABEL_331;
            }
            uint64_t v153 = *(void *)v166;
            uint64_t v146 = *MEMORY[0x1E4F28A48];
LABEL_33:
            uint64_t v160 = 0;
LABEL_34:
            if (*(void *)v166 != v153) {
              objc_enumerationMutation(obj);
            }
            unint64_t v13 = *(void **)(*((void *)&v165 + 1) + 8 * v160);
            if ([v13 rangeOfString:@"/"] == 0x7FFFFFFFFFFFFFFFLL)
            {
              id v14 = v13;
            }
            else
            {
              v15 = [v13 componentsSeparatedByString:@"/"];
              v16 = [v15 objectAtIndexedSubscript:0];

              unint64_t v17 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
              id v14 = [v16 stringByTrimmingCharactersInSet:v17];
            }
            id v161 = [obj objectForKey:v13];
            id v159 = v14;
            if ([v13 rangeOfString:@"/ color"] != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v18 = objc_msgSend(v161, "substringWithRange:", 1, 2);
              v19 = objc_msgSend(v161, "substringWithRange:", 3, 2);
              v20 = objc_msgSend(v161, "substringWithRange:", 5, 2);
              LODWORD(v170) = 0;
              uint64_t v21 = [MEMORY[0x1E4F28FE8] scannerWithString:v18];
              [v21 scanHexInt:&v170];

              LODWORD(__dst) = 0;
              long long v22 = [MEMORY[0x1E4F28FE8] scannerWithString:v19];
              [v22 scanHexInt:&__dst];

              unsigned int v164 = 0;
              uint64_t v23 = [MEMORY[0x1E4F28FE8] scannerWithString:v20];
              [v23 scanHexInt:&v164];

              uint64_t v24 = [MEMORY[0x1E4F1E008] colorWithRed:(float)((float)v170 / 255.0) green:(float)((float)__dst / 255.0) blue:(float)((float)v164 / 255.0) alpha:1.0];

              id v161 = (id)v24;
            }
            if (![v14 length] || objc_msgSend(v14, "characterAtIndex:", 0) != 46)
            {
              v156 = [v14 componentsSeparatedByString:@"."];
              v30 = [v156 objectAtIndexedSubscript:0];
              v31 = [v156 objectAtIndexedSubscript:1];
              id v32 = v30;
              v33 = (const char *)[v32 UTF8String];
              size_t v34 = strlen(v33);
              if (v34 > 0x7FFFFFFFFFFFFFF7) {
                abort();
              }
              size_t v35 = v34;
              if (v34 >= 0x17)
              {
                uint64_t v37 = (v34 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v34 | 7) != 0x17) {
                  uint64_t v37 = v34 | 7;
                }
                uint64_t v38 = v37 + 1;
                p_dst = (long long *)operator new(v37 + 1);
                *((void *)&__dst + 1) = v35;
                int64_t v163 = v38 | 0x8000000000000000;
                *(void *)&long long __dst = p_dst;
              }
              else
              {
                HIBYTE(v163) = v34;
                p_dst = &__dst;
                if (!v34) {
                  goto LABEL_55;
                }
              }
              memmove(p_dst, v33, v35);
LABEL_55:
              *((unsigned char *)p_dst + v35) = 0;
              int v39 = SHIBYTE(v163);
              v40 = (void *)__dst;
              if (v163 >= 0) {
                v41 = (uint64_t *)&__dst;
              }
              else {
                v41 = (uint64_t *)__dst;
              }
              if (v163 >= 0) {
                unint64_t v42 = HIBYTE(v163);
              }
              else {
                unint64_t v42 = *((void *)&__dst + 1);
              }
              unint64_t v43 = sub_1BA81EF84(v41, v42);
              unint64_t v44 = v43;
              unint64_t v45 = *((void *)&xmmword_1E9F76580 + 1);
              if (*((void *)&xmmword_1E9F76580 + 1))
              {
                uint8x8_t v46 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&xmmword_1E9F76580 + 8));
                v46.i16[0] = vaddlv_u8(v46);
                if (v46.u32[0] > 1uLL)
                {
                  unint64_t v1 = v43;
                  if (v43 >= *((void *)&xmmword_1E9F76580 + 1)) {
                    unint64_t v1 = v43 % *((void *)&xmmword_1E9F76580 + 1);
                  }
                }
                else
                {
                  unint64_t v1 = (*((void *)&xmmword_1E9F76580 + 1) - 1) & v43;
                }
                v47 = *(void ***)(xmmword_1E9F76580 + 8 * v1);
                if (v47)
                {
                  v48 = (unsigned __int8 *)*v47;
                  if (*v47)
                  {
                    if (v46.u32[0] < 2uLL)
                    {
                      uint64_t v49 = *((void *)&xmmword_1E9F76580 + 1) - 1;
                      while (1)
                      {
                        uint64_t v54 = *((void *)v48 + 1);
                        if (v54 == v44)
                        {
                          uint64_t v55 = v48[39];
                          if ((v55 & 0x80u) == 0) {
                            uint64_t v56 = v48[39];
                          }
                          else {
                            uint64_t v56 = *((void *)v48 + 3);
                          }
                          if (v56 == v42)
                          {
                            if ((v55 & 0x80) != 0)
                            {
                              uint64_t v151 = v49;
                              int v58 = memcmp(*((const void **)v48 + 2), v41, *((void *)v48 + 3));
                              uint64_t v49 = v151;
                              if (!v58) {
                                goto LABEL_101;
                              }
                            }
                            else
                            {
                              if (!v48[39]) {
                                goto LABEL_101;
                              }
                              uint64_t v57 = 0;
                              while (v48[v57 + 16] == *((unsigned __int8 *)v41 + v57))
                              {
                                if (v55 == ++v57) {
                                  goto LABEL_101;
                                }
                              }
                            }
                          }
                        }
                        else if ((v54 & v49) != v1)
                        {
                          goto LABEL_103;
                        }
                        v48 = *(unsigned __int8 **)v48;
                        if (!v48) {
                          goto LABEL_103;
                        }
                      }
                    }
                    do
                    {
                      unint64_t v50 = *((void *)v48 + 1);
                      if (v50 == v44)
                      {
                        uint64_t v51 = v48[39];
                        if ((v51 & 0x80u) == 0) {
                          uint64_t v52 = v48[39];
                        }
                        else {
                          uint64_t v52 = *((void *)v48 + 3);
                        }
                        if (v52 == v42)
                        {
                          if ((v51 & 0x80) != 0)
                          {
                            if (!memcmp(*((const void **)v48 + 2), v41, *((void *)v48 + 3)))
                            {
LABEL_101:
                              id v7 = v155;
                              p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___CVALightRequest + 56);
                              id v14 = v159;
                              if (v39 < 0) {
                                operator delete(v40);
                              }
                              goto LABEL_319;
                            }
                          }
                          else
                          {
                            if (!v48[39]) {
                              goto LABEL_101;
                            }
                            uint64_t v53 = 0;
                            while (v48[v53 + 16] == *((unsigned __int8 *)v41 + v53))
                            {
                              if (v51 == ++v53) {
                                goto LABEL_101;
                              }
                            }
                          }
                        }
                      }
                      else
                      {
                        if (v50 >= v45) {
                          v50 %= v45;
                        }
                        if (v50 != v1) {
                          break;
                        }
                      }
                      v48 = *(unsigned __int8 **)v48;
                    }
                    while (v48);
                  }
                }
              }
LABEL_103:
              v48 = (unsigned __int8 *)operator new(0x40uLL);
              id v170 = v48;
              v171 = &qword_1E9F76590;
              *(void *)v48 = 0;
              *((void *)v48 + 1) = v44;
              *((_OWORD *)v48 + 1) = __dst;
              int64_t v60 = v163;
              long long __dst = 0uLL;
              int64_t v163 = 0;
              *((void *)v48 + 4) = v60;
              *((void *)v48 + 5) = 0;
              *((void *)v48 + 6) = 0;
              *((void *)v48 + 7) = 0;
              char v172 = 1;
              float v61 = (float)(unint64_t)(qword_1E9F76598 + 1);
              id v7 = v155;
              if (!v45 || (float)(*(float *)&dword_1E9F765A0 * (float)v45) < v61)
              {
                BOOL v62 = v45 < 3 || (v45 & (v45 - 1)) != 0;
                unint64_t v72 = v62 | (2 * v45);
                unint64_t v73 = vcvtps_u32_f32(v61 / *(float *)&dword_1E9F765A0);
                if (v72 <= v73) {
                  size_t prime = v73;
                }
                else {
                  size_t prime = v72;
                }
                if (prime == 1)
                {
                  size_t prime = 2;
                }
                else if ((prime & (prime - 1)) != 0)
                {
                  size_t prime = std::__next_prime(prime);
                  unint64_t v45 = *((void *)&xmmword_1E9F76580 + 1);
                }
                if (prime > v45) {
                  goto LABEL_129;
                }
                if (prime < v45)
                {
                  unint64_t v75 = vcvtps_u32_f32((float)(unint64_t)qword_1E9F76598 / *(float *)&dword_1E9F765A0);
                  if (v45 < 3
                    || (uint8x8_t v76 = (uint8x8_t)vcnt_s8((int8x8_t)v45), v76.i16[0] = vaddlv_u8(v76), v76.u32[0] > 1uLL))
                  {
                    unint64_t v75 = std::__next_prime(v75);
                  }
                  else
                  {
                    uint64_t v77 = 1 << -(char)__clz(v75 - 1);
                    if (v75 >= 2) {
                      unint64_t v75 = v77;
                    }
                  }
                  if (prime <= v75) {
                    size_t prime = v75;
                  }
                  if (prime < v45) {
LABEL_129:
                  }
                    sub_1BA81F724(prime);
                }
                unint64_t v45 = *((void *)&xmmword_1E9F76580 + 1);
                if ((*((void *)&xmmword_1E9F76580 + 1) & (*((void *)&xmmword_1E9F76580 + 1) - 1)) != 0)
                {
                  if (v44 >= *((void *)&xmmword_1E9F76580 + 1)) {
                    unint64_t v1 = v44 % *((void *)&xmmword_1E9F76580 + 1);
                  }
                  else {
                    unint64_t v1 = v44;
                  }
                }
                else
                {
                  unint64_t v1 = (*((void *)&xmmword_1E9F76580 + 1) - 1) & v44;
                }
              }
              uint64_t v136 = xmmword_1E9F76580;
              v137 = *(void **)(xmmword_1E9F76580 + 8 * v1);
              p_inst_props = &OBJC_PROTOCOL___CVALightRequest.inst_props;
              id v14 = v159;
              if (v137)
              {
                *(void *)v48 = *v137;
                goto LABEL_317;
              }
              *(void *)v48 = qword_1E9F76590;
              qword_1E9F76590 = (uint64_t)v48;
              *(void *)(v136 + 8 * v1) = &qword_1E9F76590;
              if (*(void *)v48)
              {
                unint64_t v138 = *(void *)(*(void *)v48 + 8);
                if ((v45 & (v45 - 1)) != 0)
                {
                  if (v138 >= v45) {
                    v138 %= v45;
                  }
                }
                else
                {
                  v138 &= v45 - 1;
                }
                v137 = (void *)(xmmword_1E9F76580 + 8 * v138);
LABEL_317:
                void *v137 = v48;
              }
              ++qword_1E9F76598;
LABEL_319:
              unint64_t v1 = *((void *)v48 + 5);
              unint64_t v0 = *((void *)v48 + 6);
              while (v1 != v0)
              {
                id WeakRetained = objc_loadWeakRetained((id *)v1);
                BOOL v141 = WeakRetained == 0;

                if (!v141)
                {
                  id v142 = objc_loadWeakRetained((id *)v1);
                  v143 = [v142 valueForKey:v31];

                  if (v143)
                  {
                    id v144 = objc_loadWeakRetained((id *)v1);
                    [v144 setValue:v161 forKey:v31];
                  }
                  else
                  {
                    if (byte_1E9F76620)
                    {
                      id v145 = objc_loadWeakRetained((id *)v1);
                      NSLog(&cfstr_FileconfigChec_3.isa, v145, v31, v146);
                    }
                    v139 = p_inst_props[191];
                    p_inst_props[191] = 0;
                  }
                }
                v1 += 8;
              }

              goto LABEL_329;
            }
            id v25 = [v14 substringFromIndex:1];
            v26 = (const char *)[v25 UTF8String];
            size_t v27 = strlen(v26);
            if (v27 > 0x7FFFFFFFFFFFFFF7) {
              abort();
            }
            size_t v28 = v27;
            if (v27 >= 0x17)
            {
              uint64_t v63 = (v27 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v27 | 7) != 0x17) {
                uint64_t v63 = v27 | 7;
              }
              uint64_t v64 = v63 + 1;
              v29 = (long long *)operator new(v63 + 1);
              *((void *)&__dst + 1) = v28;
              int64_t v163 = v64 | 0x8000000000000000;
              *(void *)&long long __dst = v29;
            }
            else
            {
              HIBYTE(v163) = v27;
              v29 = &__dst;
              if (!v27)
              {
LABEL_111:
                *((unsigned char *)v29 + v28) = 0;

                if (v163 >= 0) {
                  id v65 = (uint64_t *)&__dst;
                }
                else {
                  id v65 = (uint64_t *)__dst;
                }
                if (v163 >= 0) {
                  unint64_t v66 = HIBYTE(v163);
                }
                else {
                  unint64_t v66 = *((void *)&__dst + 1);
                }
                unint64_t v67 = sub_1BA81EF84(v65, v66);
                unint64_t v68 = qword_1E9F765B0;
                if (!qword_1E9F765B0) {
                  goto LABEL_296;
                }
                unint64_t v69 = v67;
                uint8x8_t v70 = (uint8x8_t)vcnt_s8((int8x8_t)qword_1E9F765B0);
                v70.i16[0] = vaddlv_u8(v70);
                if (v70.u32[0] > 1uLL)
                {
                  unint64_t v71 = v67;
                  if (v67 >= qword_1E9F765B0) {
                    unint64_t v71 = v67 % qword_1E9F765B0;
                  }
                }
                else
                {
                  unint64_t v71 = (qword_1E9F765B0 - 1) & v67;
                }
                v78 = *(uint64_t ***)(qword_1E9F765A8 + 8 * v71);
                if (!v78) {
                  goto LABEL_296;
                }
                v79 = *v78;
                if (!*v78) {
                  goto LABEL_296;
                }
                if (v70.u32[0] < 2uLL)
                {
                  uint64_t v80 = qword_1E9F765B0 - 1;
                  while (1)
                  {
                    uint64_t v85 = v79[1];
                    if (v85 == v69)
                    {
                      uint64_t v86 = *((unsigned __int8 *)v79 + 39);
                      if ((v86 & 0x80u) == 0) {
                        uint64_t v87 = *((unsigned __int8 *)v79 + 39);
                      }
                      else {
                        uint64_t v87 = v79[3];
                      }
                      if (v87 == v66)
                      {
                        if ((v86 & 0x80) != 0)
                        {
                          if (!memcmp((const void *)v79[2], v65, v79[3])) {
                            goto LABEL_175;
                          }
                        }
                        else
                        {
                          if (!*((unsigned char *)v79 + 39)) {
                            goto LABEL_175;
                          }
                          uint64_t v88 = 0;
                          while (*((unsigned __int8 *)v79 + v88 + 16) == *((unsigned __int8 *)v65 + v88))
                          {
                            if (v86 == ++v88) {
                              goto LABEL_174;
                            }
                          }
                        }
                      }
                    }
                    else if ((v85 & v80) != v71)
                    {
                      goto LABEL_296;
                    }
                    v79 = (uint64_t *)*v79;
                    if (!v79) {
                      goto LABEL_296;
                    }
                  }
                }
                while (1)
                {
                  unint64_t v81 = v79[1];
                  if (v81 == v69)
                  {
                    uint64_t v82 = *((unsigned __int8 *)v79 + 39);
                    if ((v82 & 0x80u) == 0) {
                      uint64_t v83 = *((unsigned __int8 *)v79 + 39);
                    }
                    else {
                      uint64_t v83 = v79[3];
                    }
                    if (v83 == v66)
                    {
                      if ((v82 & 0x80) == 0)
                      {
                        if (*((unsigned char *)v79 + 39))
                        {
                          uint64_t v84 = 0;
                          do
                          {
                            if (*((unsigned __int8 *)v79 + v84 + 16) != *((unsigned __int8 *)v65 + v84)) {
                              goto LABEL_143;
                            }
                            ++v84;
                          }
                          while (v82 != v84);
LABEL_174:
                          if (!v79)
                          {
LABEL_296:
                            if (byte_1E9F76621) {
                              NSLog(&cfstr_FileconfigChec_1.isa, v65);
                            }
                            goto LABEL_298;
                          }
                        }
LABEL_175:
                        v89 = (id **)v79[5];
                        v157 = (id **)v79[6];
                        if (v89 == v157) {
                          goto LABEL_298;
                        }
                        while (2)
                        {
                          objc_storeStrong(*v89, v161);
                          int v90 = SHIBYTE(v163);
                          long long v91 = __dst;
                          if (v163 >= 0) {
                            v92 = (uint64_t *)&__dst;
                          }
                          else {
                            v92 = (uint64_t *)__dst;
                          }
                          if (v163 >= 0) {
                            unint64_t v93 = HIBYTE(v163);
                          }
                          else {
                            unint64_t v93 = *((void *)&__dst + 1);
                          }
                          unint64_t v94 = sub_1BA81EF84(v92, v93);
                          unint64_t v95 = v94;
                          unint64_t v1 = *((void *)&xmmword_1E9F765D0 + 1);
                          if (*((void *)&xmmword_1E9F765D0 + 1))
                          {
                            uint8x8_t v96 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&xmmword_1E9F765D0 + 8));
                            v96.i16[0] = vaddlv_u8(v96);
                            if (v96.u32[0] > 1uLL)
                            {
                              unint64_t v0 = v94;
                              if (v94 >= *((void *)&xmmword_1E9F765D0 + 1)) {
                                unint64_t v0 = v94 % *((void *)&xmmword_1E9F765D0 + 1);
                              }
                            }
                            else
                            {
                              unint64_t v0 = (*((void *)&xmmword_1E9F765D0 + 1) - 1) & v94;
                            }
                            v97 = *(uint64_t ***)(xmmword_1E9F765D0 + 8 * v0);
                            if (v97)
                            {
                              v98 = *v97;
                              if (*v97)
                              {
                                if (v96.u32[0] < 2uLL)
                                {
                                  uint64_t v99 = *((void *)&xmmword_1E9F765D0 + 1) - 1;
                                  while (1)
                                  {
                                    uint64_t v105 = v98[1];
                                    if (v105 == v95)
                                    {
                                      uint64_t v106 = *((unsigned __int8 *)v98 + 39);
                                      if ((v106 & 0x80u) == 0) {
                                        uint64_t v107 = *((unsigned __int8 *)v98 + 39);
                                      }
                                      else {
                                        uint64_t v107 = v98[3];
                                      }
                                      if (v107 == v93)
                                      {
                                        v108 = (const void **)(v98 + 2);
                                        if ((v106 & 0x80) != 0)
                                        {
                                          uint64_t v152 = v99;
                                          int v110 = memcmp(*v108, v92, v98[3]);
                                          uint64_t v99 = v152;
                                          if (!v110) {
                                            goto LABEL_179;
                                          }
                                        }
                                        else
                                        {
                                          if (!*((unsigned char *)v98 + 39)) {
                                            goto LABEL_179;
                                          }
                                          v109 = v92;
                                          while (*(unsigned __int8 *)v108 == *(unsigned __int8 *)v109)
                                          {
                                            v108 = (const void **)((char *)v108 + 1);
                                            v109 = (uint64_t *)((char *)v109 + 1);
                                            if (!--v106) {
                                              goto LABEL_179;
                                            }
                                          }
                                        }
                                      }
                                    }
                                    else if ((v105 & v99) != v0)
                                    {
                                      goto LABEL_227;
                                    }
                                    v98 = (uint64_t *)*v98;
                                    if (!v98) {
                                      goto LABEL_227;
                                    }
                                  }
                                }
                                do
                                {
                                  unint64_t v100 = v98[1];
                                  if (v100 == v95)
                                  {
                                    uint64_t v101 = *((unsigned __int8 *)v98 + 39);
                                    if ((v101 & 0x80u) == 0) {
                                      uint64_t v102 = *((unsigned __int8 *)v98 + 39);
                                    }
                                    else {
                                      uint64_t v102 = v98[3];
                                    }
                                    if (v102 == v93)
                                    {
                                      v103 = (const void **)(v98 + 2);
                                      if ((v101 & 0x80) != 0)
                                      {
                                        if (!memcmp(*v103, v92, v98[3])) {
                                          goto LABEL_179;
                                        }
                                      }
                                      else
                                      {
                                        if (!*((unsigned char *)v98 + 39)) {
                                          goto LABEL_179;
                                        }
                                        v104 = v92;
                                        while (*(unsigned __int8 *)v103 == *(unsigned __int8 *)v104)
                                        {
                                          v103 = (const void **)((char *)v103 + 1);
                                          v104 = (uint64_t *)((char *)v104 + 1);
                                          if (!--v101) {
                                            goto LABEL_179;
                                          }
                                        }
                                      }
                                    }
                                  }
                                  else
                                  {
                                    if (v100 >= v1) {
                                      v100 %= v1;
                                    }
                                    if (v100 != v0) {
                                      break;
                                    }
                                  }
                                  v98 = (uint64_t *)*v98;
                                }
                                while (v98);
                              }
                            }
                          }
LABEL_227:
                          v111 = operator new(0x28uLL);
                          id v170 = v111;
                          v171 = &qword_1E9F765E0;
                          char v172 = 0;
                          void *v111 = 0;
                          v111[1] = v95;
                          if (v90 < 0)
                          {
                            sub_1BA81F984((unsigned char *)v111 + 16, (void *)v91, *((unint64_t *)&v91 + 1));
                          }
                          else
                          {
                            *((_OWORD *)v111 + 1) = __dst;
                            v111[4] = v163;
                          }
                          char v172 = 1;
                          float v112 = (float)(unint64_t)(qword_1E9F765E8 + 1);
                          if (!v1 || (float)(*(float *)&dword_1E9F765F0 * (float)v1) < v112)
                          {
                            BOOL v113 = (v1 & (v1 - 1)) != 0;
                            if (v1 < 3) {
                              BOOL v113 = 1;
                            }
                            unint64_t v114 = v113 | (2 * v1);
                            unint64_t v115 = vcvtps_u32_f32(v112 / *(float *)&dword_1E9F765F0);
                            if (v114 <= v115) {
                              size_t v116 = v115;
                            }
                            else {
                              size_t v116 = v114;
                            }
                            if (v116 == 1)
                            {
                              size_t v116 = 2;
                            }
                            else if ((v116 & (v116 - 1)) != 0)
                            {
                              size_t v116 = std::__next_prime(v116);
                            }
                            unint64_t v1 = *((void *)&xmmword_1E9F765D0 + 1);
                            if (v116 > *((void *)&xmmword_1E9F765D0 + 1))
                            {
LABEL_242:
                              if (v116 >> 61) {
                                sub_1BA81F974();
                              }
                              v117 = operator new(8 * v116);
                              v118 = (void *)xmmword_1E9F765D0;
                              *(void *)&xmmword_1E9F765D0 = v117;
                              if (v118) {
                                operator delete(v118);
                              }
                              uint64_t v119 = 0;
                              *((void *)&xmmword_1E9F765D0 + 1) = v116;
                              do
                                *(void *)(xmmword_1E9F765D0 + 8 * v119++) = 0;
                              while (v116 != v119);
                              v120 = (void **)qword_1E9F765E0;
                              if (!qword_1E9F765E0) {
                                goto LABEL_266;
                              }
                              size_t v121 = *(void *)(qword_1E9F765E0 + 8);
                              size_t v122 = v116 - 1;
                              if ((v116 & (v116 - 1)) == 0)
                              {
                                size_t v123 = v121 & v122;
                                *(void *)(xmmword_1E9F765D0 + 8 * v123) = &qword_1E9F765E0;
                                for (i = *v120; *v120; i = *v120)
                                {
                                  size_t v125 = i[1] & v122;
                                  if (v125 == v123)
                                  {
                                    v120 = (void **)i;
                                  }
                                  else if (*(void *)(xmmword_1E9F765D0 + 8 * v125))
                                  {
                                    *v120 = (void *)*i;
                                    uint64_t v126 = 8 * v125;
                                    void *i = **(void **)(xmmword_1E9F765D0 + v126);
                                    **(void **)(xmmword_1E9F765D0 + v126) = i;
                                  }
                                  else
                                  {
                                    *(void *)(xmmword_1E9F765D0 + 8 * v125) = v120;
                                    v120 = (void **)i;
                                    size_t v123 = v125;
                                  }
                                }
                                goto LABEL_266;
                              }
                              if (v121 >= v116) {
                                v121 %= v116;
                              }
                              *(void *)(xmmword_1E9F765D0 + 8 * v121) = &qword_1E9F765E0;
                              v130 = *v120;
                              if (!*v120)
                              {
LABEL_266:
                                unint64_t v1 = v116;
                                goto LABEL_267;
                              }
                              while (2)
                              {
                                size_t v132 = v130[1];
                                if (v132 >= v116) {
                                  v132 %= v116;
                                }
                                if (v132 != v121)
                                {
                                  if (!*(void *)(xmmword_1E9F765D0 + 8 * v132))
                                  {
                                    *(void *)(xmmword_1E9F765D0 + 8 * v132) = v120;
LABEL_271:
                                    v120 = (void **)v130;
                                    v130 = (void *)*v130;
                                    size_t v121 = v132;
                                    if (!v130) {
                                      goto LABEL_266;
                                    }
                                    continue;
                                  }
                                  *v120 = (void *)*v130;
                                  uint64_t v131 = 8 * v132;
                                  void *v130 = **(void **)(xmmword_1E9F765D0 + v131);
                                  **(void **)(xmmword_1E9F765D0 + v131) = v130;
                                  v130 = v120;
                                }
                                break;
                              }
                              size_t v132 = v121;
                              goto LABEL_271;
                            }
                            if (v116 < *((void *)&xmmword_1E9F765D0 + 1))
                            {
                              unint64_t v127 = vcvtps_u32_f32((float)(unint64_t)qword_1E9F765E8 / *(float *)&dword_1E9F765F0);
                              if (*((void *)&xmmword_1E9F765D0 + 1) < 3uLL
                                || (uint8x8_t v128 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&xmmword_1E9F765D0 + 8)),
                                    v128.i16[0] = vaddlv_u8(v128),
                                    v128.u32[0] > 1uLL))
                              {
                                unint64_t v127 = std::__next_prime(v127);
                              }
                              else
                              {
                                uint64_t v129 = 1 << -(char)__clz(v127 - 1);
                                if (v127 >= 2) {
                                  unint64_t v127 = v129;
                                }
                              }
                              if (v116 <= v127) {
                                size_t v116 = v127;
                              }
                              if (v116 >= v1)
                              {
                                unint64_t v1 = *((void *)&xmmword_1E9F765D0 + 1);
                              }
                              else
                              {
                                if (v116) {
                                  goto LABEL_242;
                                }
                                v135 = (void *)xmmword_1E9F765D0;
                                *(void *)&xmmword_1E9F765D0 = 0;
                                if (v135) {
                                  operator delete(v135);
                                }
                                unint64_t v1 = 0;
                                *((void *)&xmmword_1E9F765D0 + 1) = 0;
                              }
                            }
LABEL_267:
                            if ((v1 & (v1 - 1)) != 0)
                            {
                              if (v95 >= v1) {
                                unint64_t v0 = v95 % v1;
                              }
                              else {
                                unint64_t v0 = v95;
                              }
                            }
                            else
                            {
                              unint64_t v0 = (v1 - 1) & v95;
                            }
                          }
                          v133 = *(void **)(xmmword_1E9F765D0 + 8 * v0);
                          if (v133)
                          {
                            *(void *)id v170 = *v133;
                            void *v133 = v170;
                          }
                          else
                          {
                            *(void *)id v170 = qword_1E9F765E0;
                            qword_1E9F765E0 = (uint64_t)v170;
                            *(void *)(xmmword_1E9F765D0 + 8 * v0) = &qword_1E9F765E0;
                            if (*(void *)v170)
                            {
                              unint64_t v134 = *(void *)(*(void *)v170 + 8);
                              if ((v1 & (v1 - 1)) != 0)
                              {
                                if (v134 >= v1) {
                                  v134 %= v1;
                                }
                              }
                              else
                              {
                                v134 &= v1 - 1;
                              }
                              *(void *)(xmmword_1E9F765D0 + 8 * v134) = v170;
                            }
                          }
                          ++qword_1E9F765E8;
LABEL_179:
                          ++v89;
                          id v7 = v155;
                          id v14 = v159;
                          if (v89 != v157) {
                            continue;
                          }
                          break;
                        }
LABEL_298:
                        if (SHIBYTE(v163) < 0) {
                          operator delete((void *)__dst);
                        }
LABEL_329:

                        if (++v160 == v154)
                        {
                          uint64_t v154 = [obj countByEnumeratingWithState:&v165 objects:v173 count:16];
                          if (!v154)
                          {
LABEL_331:

                            goto LABEL_332;
                          }
                          goto LABEL_33;
                        }
                        goto LABEL_34;
                      }
                      if (!memcmp((const void *)v79[2], v65, v79[3])) {
                        goto LABEL_175;
                      }
                    }
                  }
                  else
                  {
                    if (v81 >= v68) {
                      v81 %= v68;
                    }
                    if (v81 != v71) {
                      goto LABEL_296;
                    }
                  }
LABEL_143:
                  v79 = (uint64_t *)*v79;
                  if (!v79) {
                    goto LABEL_296;
                  }
                }
              }
            }
            memmove(v29, v26, v28);
            goto LABEL_111;
          }
        }
      }
LABEL_11:
    }
  }
}

void sub_1BA81E504(_Unwind_Exception *a1)
{
}

void sub_1BA81E51C()
{
  objc_end_catch();
  JUMPOUT(0x1BA81E74CLL);
}

void sub_1BA81E548()
{
}

void sub_1BA81E550()
{
}

void sub_1BA81E558()
{
}

void sub_1BA81E564()
{
}

void sub_1BA81E56C()
{
}

void sub_1BA81E574()
{
  JUMPOUT(0x1BA81E73CLL);
}

void sub_1BA81E58C()
{
}

void sub_1BA81E594()
{
}

void sub_1BA81E59C()
{
}

void sub_1BA81E5A4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41)
{
  sub_1BA81FA20(&a41);
  if (a30 < 0) {
    operator delete(__p);
  }

  JUMPOUT(0x1BA81E74CLL);
}

void sub_1BA81E678()
{
  if (v0 < 0) {
    operator delete(v3);
  }

  JUMPOUT(0x1BA81E74CLL);
}

void sub_1BA81E68C()
{
}

void sub_1BA81E694()
{
  JUMPOUT(0x1BA81E74CLL);
}

void sub_1BA81E6A0()
{
}

void sub_1BA81E6A8()
{
  JUMPOUT(0x1BA81E714);
}

void sub_1BA81E6B4()
{
}

void sub_1BA81E6C0()
{
  JUMPOUT(0x1BA81E714);
}

void sub_1BA81E6CC()
{
  JUMPOUT(0x1BA81E74CLL);
}

void sub_1BA81E6D4()
{
}

void sub_1BA81E6DC()
{
  JUMPOUT(0x1BA81E74CLL);
}

void sub_1BA81E6E8()
{
  JUMPOUT(0x1BA81E6F4);
}

BOOL sub_1BA81E754(char *__s)
{
  if (byte_1E9F76C09) {
    return 0;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76578, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76578))
  {
    sub_1BA81ED8C();
    __cxa_atexit((void (*)(void *))sub_1BA81F3B8, &xmmword_1E9F76580, &dword_1BA813000);
    __cxa_guard_release(&qword_1E9F76578);
  }
  size_t v3 = strlen(__s);
  if (v3 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  size_t v4 = v3;
  if (v3 >= 0x17)
  {
    uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17) {
      uint64_t v6 = v3 | 7;
    }
    uint64_t v7 = v6 + 1;
    p_dst = operator new(v6 + 1);
    size_t v31 = v4;
    int64_t v32 = v7 | 0x8000000000000000;
    long long __dst = p_dst;
    goto LABEL_11;
  }
  HIBYTE(v32) = v3;
  p_dst = &__dst;
  if (v3) {
LABEL_11:
  }
    memcpy(p_dst, __s, v4);
  *((unsigned char *)p_dst + v4) = 0;
  int v8 = SHIBYTE(v32);
  uint64_t v9 = __dst;
  if (v32 >= 0) {
    uint64_t v10 = (uint64_t *)&__dst;
  }
  else {
    uint64_t v10 = __dst;
  }
  if (v32 >= 0) {
    unint64_t v11 = HIBYTE(v32);
  }
  else {
    unint64_t v11 = v31;
  }
  unint64_t v12 = sub_1BA81EF84(v10, v11);
  unint64_t v13 = *((void *)&xmmword_1E9F765D0 + 1);
  if (!*((void *)&xmmword_1E9F765D0 + 1)) {
    goto LABEL_59;
  }
  unint64_t v14 = v12;
  uint8x8_t v15 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&xmmword_1E9F765D0 + 8));
  v15.i16[0] = vaddlv_u8(v15);
  if (v15.u32[0] > 1uLL)
  {
    unint64_t v16 = v12;
    if (v12 >= *((void *)&xmmword_1E9F765D0 + 1)) {
      unint64_t v16 = v12 % *((void *)&xmmword_1E9F765D0 + 1);
    }
  }
  else
  {
    unint64_t v16 = (*((void *)&xmmword_1E9F765D0 + 1) - 1) & v12;
  }
  unint64_t v17 = *(uint64_t ***)(xmmword_1E9F765D0 + 8 * v16);
  if (!v17 || (uint64_t v18 = *v17) == 0)
  {
LABEL_59:
    v20 = 0;
    goto LABEL_60;
  }
  if (v15.u32[0] < 2uLL)
  {
    uint64_t v19 = *((void *)&xmmword_1E9F765D0 + 1) - 1;
    while (1)
    {
      uint64_t v25 = v18[1];
      if (v14 == v25)
      {
        uint64_t v26 = *((unsigned __int8 *)v18 + 39);
        if ((v26 & 0x80u) == 0) {
          uint64_t v27 = *((unsigned __int8 *)v18 + 39);
        }
        else {
          uint64_t v27 = v18[3];
        }
        if (v27 == v11)
        {
          if ((v26 & 0x80) != 0)
          {
            if (!memcmp((const void *)v18[2], v10, v18[3])) {
              goto LABEL_58;
            }
          }
          else
          {
            if (!*((unsigned char *)v18 + 39)) {
              goto LABEL_58;
            }
            uint64_t v28 = 0;
            while (*((unsigned __int8 *)v18 + v28 + 16) == *((unsigned __int8 *)v10 + v28))
            {
              if (v26 == ++v28) {
                goto LABEL_58;
              }
            }
          }
        }
      }
      else if ((v25 & v19) != v16)
      {
        goto LABEL_59;
      }
      v20 = 0;
      uint64_t v18 = (uint64_t *)*v18;
      if (!v18) {
        goto LABEL_60;
      }
    }
  }
  while (1)
  {
    unint64_t v21 = v18[1];
    if (v14 != v21)
    {
      if (v21 >= v13) {
        v21 %= v13;
      }
      if (v21 != v16) {
        goto LABEL_59;
      }
      goto LABEL_28;
    }
    uint64_t v22 = *((unsigned __int8 *)v18 + 39);
    if ((v22 & 0x80u) == 0) {
      uint64_t v23 = *((unsigned __int8 *)v18 + 39);
    }
    else {
      uint64_t v23 = v18[3];
    }
    if (v23 != v11) {
      goto LABEL_28;
    }
    if ((v22 & 0x80) != 0) {
      break;
    }
    if (!*((unsigned char *)v18 + 39)) {
      goto LABEL_58;
    }
    uint64_t v24 = 0;
    while (*((unsigned __int8 *)v18 + v24 + 16) == *((unsigned __int8 *)v10 + v24))
    {
      if (v22 == ++v24) {
        goto LABEL_58;
      }
    }
LABEL_28:
    v20 = 0;
    uint64_t v18 = (uint64_t *)*v18;
    if (!v18) {
      goto LABEL_60;
    }
  }
  if (memcmp((const void *)v18[2], v10, v18[3])) {
    goto LABEL_28;
  }
LABEL_58:
  v20 = v18;
LABEL_60:
  BOOL v1 = v20 != 0;
  if (v8 < 0) {
    operator delete(v9);
  }
  return v1;
}

void sub_1BA81EA48(_Unwind_Exception *a1)
{
}

uint64_t sub_1BA81EA60(uint64_t result, float a2)
{
  *(float *)(*(void *)(result + 32) + 8) = a2;
  return result;
}

uint64_t sub_1BA81EA6C(uint64_t a1)
{
  switch(a1)
  {
    case 0:
    case 1:
    case 3:
      uint64_t v5 = 0;
      uint64_t v7 = 0;
      uint64_t v3 = 0;
      uint64_t v4 = 1;
      return (v7 << 48) | (v3 << 56) | (v7 << 40) | v5 | v4;
    case 2:
      uint64_t v4 = 0;
      uint64_t v7 = 0;
      uint64_t v3 = 0;
      uint64_t v5 = 0x100000000;
      return (v7 << 48) | (v3 << 56) | (v7 << 40) | v5 | v4;
    case 4:
    case 6:
    case 12:
    case 13:
    case 15:
    case 16:
    case 18:
      uint64_t v5 = 0;
      uint64_t v3 = 0;
      uint64_t v4 = 1;
      goto LABEL_14;
    case 5:
    case 7:
    case 9:
    case 10:
    case 11:
    case 14:
    case 17:
    case 19:
    case 23:
    case 26:
    case 30:
    case 46:
    case 47:
      uint64_t v4 = 0;
      uint64_t v3 = 0;
      uint64_t v5 = 0x100000000;
      goto LABEL_14;
    case 8:
      uint64_t v5 = 0;
      uint64_t v3 = 0;
      uint64_t v7 = 1;
      uint64_t v4 = 2;
      return (v7 << 48) | (v3 << 56) | (v7 << 40) | v5 | v4;
    case 20:
      uint64_t v5 = 0;
      uint64_t v3 = 0;
      goto LABEL_22;
    case 21:
      uint64_t v3 = 0;
      uint64_t v5 = 0x100000000;
LABEL_22:
      uint64_t v7 = 1;
      uint64_t v4 = 3;
      return (v7 << 48) | (v3 << 56) | (v7 << 40) | v5 | v4;
    case 22:
    case 24:
    case 25:
    case 27:
    case 28:
    case 29:
    case 31:
    case 32:
    case 34:
    case 35:
    case 36:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 48:
    case 49:
      uint64_t v3 = (unint64_t)(a1 - 39) < 0xA && ((0x23Fu >> (a1 - 39)) & 1) != 0 || a1 == 49;
      uint64_t v5 = 0;
      uint64_t v4 = a1 != 44 && a1 != 49;
      goto LABEL_14;
    case 33:
    case 37:
      uint64_t v5 = 0;
      uint64_t v4 = 0;
      uint64_t v3 = 0;
LABEL_14:
      uint64_t v7 = 1;
      break;
    case 50:
      syslog(3, "CVAVideoPipelineDevice_UniqueCount isn't a valid device", v1, v2);
      abort();
    default:
      uint64_t v5 = 0;
      uint64_t v4 = 0;
      uint64_t v7 = 0;
      uint64_t v3 = 0;
      break;
  }
  return (v7 << 48) | (v3 << 56) | (v7 << 40) | v5 | v4;
}

void sub_1BA81ECAC(void *a1, __CVBuffer *a2)
{
  id v3 = a1;
  uint64_t v4 = NSString;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a2);
  __int16 v9 = bswap32(PixelFormatType) >> 16;
  v8[1] = BYTE2(PixelFormatType);
  v8[0] = HIBYTE(PixelFormatType);
  char v10 = 0;
  uint64_t v6 = [NSString stringWithCString:v8 encoding:4];
  size_t Width = CVPixelBufferGetWidth(a2);
  [v4 stringWithFormat:@"%@ (%@) = %zux%zu", v3, v6, Width, CVPixelBufferGetHeight(a2)];
}

void sub_1BA81ED70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA81ED8C()
{
  xmmword_1E9F76580 = 0u;
  *(_OWORD *)&qword_1E9F76590 = 0u;
  dword_1E9F765A0 = 1065353216;
  *(_OWORD *)&qword_1E9F765A8 = 0u;
  *(_OWORD *)&qword_1E9F765B8 = 0u;
  dword_1E9F765C8 = 1065353216;
  xmmword_1E9F765D0 = 0u;
  *(_OWORD *)&qword_1E9F765E0 = 0u;
  dword_1E9F765F0 = 1065353216;
  *(_OWORD *)&qword_1E9F765F8 = 0u;
  *(_OWORD *)&qword_1E9F76608 = 0u;
  *(_OWORD *)((char *)&qword_1E9F76610 + 2) = 0u;
  int v0 = +[CVAPreferenceManager defaults];
  id v10 = v0;
  if (v0)
  {
    int v1 = [v0 BOOLForKey:@"CVAPhotoLogConfig"];
    byte_1E9F76620 = v1;
    if (v1) {
      LOBYTE(v1) = [v10 BOOLForKey:@"CVAPhotoLogConfigStaticVars"];
    }
    byte_1E9F76621 = v1;
  }
  uint64_t v2 = (void *)qword_1E9F76610;
  qword_1E9F76610 = @"/System/Library/PrivateFrameworks/AppleCVAPhoto.framework/Resources/";

  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = [v3 contentsOfDirectoryAtPath:qword_1E9F76610 error:0];

  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self ENDSWITH '.persistent.config.txt'"];
  uint64_t v6 = [v4 filteredArrayUsingPredicate:v5];
  uint64_t v7 = (void *)qword_1E9F76600;
  qword_1E9F76600 = v6;

  uint64_t v8 = [(id)qword_1E9F76600 sortedArrayUsingSelector:sel_compare_];
  __int16 v9 = (void *)qword_1E9F76600;
  qword_1E9F76600 = v8;
}

void sub_1BA81EEFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  unint64_t v13 = v12;

  sub_1BA81F564();
  sub_1BA81F5E0();
  sub_1BA81F4B8((uint64_t)v10);
  _Unwind_Resume(a1);
}

unint64_t sub_1BA81EF84(uint64_t *a1, unint64_t a2)
{
  if (a2 > 0x20)
  {
    if (a2 <= 0x40)
    {
      uint64_t v5 = *(uint64_t *)((char *)a1 + a2 - 16);
      uint64_t v6 = *a1 - 0x3C5A37A36834CED9 * (v5 + a2);
      uint64_t v8 = a1[2];
      uint64_t v7 = a1[3];
      uint64_t v9 = __ROR8__(v6 + v7, 52);
      uint64_t v10 = v6 + a1[1];
      uint64_t v11 = __ROR8__(v10, 7);
      uint64_t v12 = v10 + v8;
      uint64_t v13 = *(uint64_t *)((char *)a1 + a2 - 32) + v8;
      uint64_t v14 = *(uint64_t *)((char *)a1 + a2 - 8) + v7;
      uint64_t v15 = __ROR8__(v14 + v13, 52);
      uint64_t v16 = v11 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v5 + a2), 37) + v9;
      uint64_t v17 = __ROR8__(v13, 37);
      uint64_t v18 = *(uint64_t *)((char *)a1 + a2 - 24) + v13;
      uint64_t v19 = __ROR8__(v18, 7);
      uint64_t v20 = v16 + __ROR8__(v12, 31);
      uint64_t v21 = v18 + v5;
      uint64_t v22 = v21 + v14;
      unint64_t v23 = 0x9AE16A3B2F90404FLL;
      unint64_t v24 = 0xC3A5C85C97CB3127 * (v22 + v20) - 0x651E95C4D06FBFB1 * (v12 + v7 + v17 + v19 + v15 + __ROR8__(v21, 31));
      unint64_t v25 = v20 - 0x3C5A37A36834CED9 * (v24 ^ (v24 >> 47));
      return (v25 ^ (v25 >> 47)) * v23;
    }
    unint64_t v32 = 0x9DDFEA08EB382D69;
    uint64_t v33 = *(uint64_t *)((char *)a1 + a2 - 48);
    uint64_t v34 = *(uint64_t *)((char *)a1 + a2 - 40);
    uint64_t v35 = *(uint64_t *)((char *)a1 + a2 - 24);
    uint64_t v37 = *(uint64_t *)((char *)a1 + a2 - 64);
    uint64_t v36 = *(uint64_t *)((char *)a1 + a2 - 56);
    uint64_t v38 = *(uint64_t *)((char *)a1 + a2 - 16);
    uint64_t v39 = *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v40 = v36 + v38;
    unint64_t v41 = 0x9DDFEA08EB382D69
        * (v35 ^ ((0x9DDFEA08EB382D69 * (v35 ^ (v33 + a2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v35 ^ (v33 + a2))));
    unint64_t v42 = 0x9DDFEA08EB382D69 * (v41 ^ (v41 >> 47));
    unint64_t v43 = v37 + a2 + v36 + v33;
    uint64_t v44 = v43 + v34;
    unint64_t v45 = __ROR8__(v43, 44) + v37 + a2 + __ROR8__(v34 + v37 + a2 - 0x622015F714C7D297 * (v41 ^ (v41 >> 47)), 21);
    uint64_t v46 = v36 + v38 + *(uint64_t *)((char *)a1 + a2 - 32) - 0x4B6D499041670D8DLL;
    uint64_t v47 = v46 + v35 + v38;
    uint64_t v48 = __ROR8__(v47, 44);
    uint64_t v49 = v47 + v39;
    uint64_t v50 = v48 + v46 + __ROR8__(v46 + v34 + v39, 21);
    uint64_t v52 = *a1;
    uint64_t v51 = a1 + 4;
    unint64_t v53 = v52 - 0x4B6D499041670D8DLL * v34;
    uint64_t v54 = -(uint64_t)((a2 - 1) & 0xFFFFFFFFFFFFFFC0);
    do
    {
      uint64_t v55 = *(v51 - 3);
      uint64_t v56 = v53 + v44 + v40 + v55;
      uint64_t v57 = v51[2];
      uint64_t v58 = v51[3];
      uint64_t v59 = v51[1];
      unint64_t v40 = v59 + v44 - 0x4B6D499041670D8DLL * __ROR8__(v40 + v45 + v57, 42);
      uint64_t v60 = v42 + v49;
      uint64_t v61 = *(v51 - 2);
      uint64_t v62 = *(v51 - 1);
      uint64_t v63 = *(v51 - 4) - 0x4B6D499041670D8DLL * v45;
      uint64_t v64 = v63 + v49 + v62;
      uint64_t v65 = v63 + v55 + v61;
      uint64_t v44 = v65 + v62;
      uint64_t v66 = __ROR8__(v65, 44) + v63;
      unint64_t v67 = (0xB492B66FBE98F273 * __ROR8__(v56, 37)) ^ v50;
      unint64_t v53 = 0xB492B66FBE98F273 * __ROR8__(v60, 33);
      unint64_t v45 = v66 + __ROR8__(v64 + v67, 21);
      unint64_t v68 = v53 + v50 + *v51;
      uint64_t v49 = v68 + v59 + v57 + v58;
      uint64_t v50 = __ROR8__(v68 + v59 + v57, 44) + v68 + __ROR8__(v40 + v61 + v68 + v58, 21);
      v51 += 8;
      unint64_t v42 = v67;
      v54 += 64;
    }
    while (v54);
    unint64_t v69 = v53
        - 0x622015F714C7D297
        * ((0x9DDFEA08EB382D69
          * (v50 ^ ((0x9DDFEA08EB382D69 * (v50 ^ v45)) >> 47) ^ (0x9DDFEA08EB382D69 * (v50 ^ v45)))) ^ ((0x9DDFEA08EB382D69 * (v50 ^ ((0x9DDFEA08EB382D69 * (v50 ^ v45)) >> 47) ^ (0x9DDFEA08EB382D69 * (v50 ^ v45)))) >> 47));
    unint64_t v70 = 0x9DDFEA08EB382D69
        * (v69 ^ (v67
                - 0x4B6D499041670D8DLL * (v40 ^ (v40 >> 47))
                - 0x622015F714C7D297
                * ((0x9DDFEA08EB382D69
                  * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) ^ ((0x9DDFEA08EB382D69 * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) >> 47))));
    unint64_t v71 = 0x9DDFEA08EB382D69 * (v69 ^ (v70 >> 47) ^ v70);
    goto LABEL_13;
  }
  if (a2 > 0x10)
  {
    uint64_t v26 = a1[1];
    unint64_t v27 = 0xB492B66FBE98F273 * *a1;
    uint64_t v28 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8), 30) + __ROR8__(v27 - v26, 43);
    unint64_t v29 = v27 + a2 + __ROR8__(v26 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v23 = 0x9DDFEA08EB382D69;
    unint64_t v30 = 0x9DDFEA08EB382D69 * ((v28 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a1 + a2 - 16)) ^ v29);
    unint64_t v31 = v29 ^ (v30 >> 47) ^ v30;
LABEL_8:
    unint64_t v25 = 0x9DDFEA08EB382D69 * v31;
    return (v25 ^ (v25 >> 47)) * v23;
  }
  if (a2 >= 9)
  {
    uint64_t v2 = *(uint64_t *)((char *)a1 + a2 - 8);
    uint64_t v3 = __ROR8__(v2 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) ^ ((0x9DDFEA08EB382D69 * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) >> 47))) ^ v2;
  }
  if (a2 >= 4)
  {
    uint64_t v72 = *(unsigned int *)((char *)a1 + a2 - 4);
    unint64_t v23 = 0x9DDFEA08EB382D69;
    unint64_t v73 = 0x9DDFEA08EB382D69 * (((8 * *(_DWORD *)a1) + a2) ^ v72);
    unint64_t v31 = v72 ^ (v73 >> 47) ^ v73;
    goto LABEL_8;
  }
  unint64_t v32 = 0x9AE16A3B2F90404FLL;
  if (a2)
  {
    unint64_t v71 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                   * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
LABEL_13:
    v32 *= v71 ^ (v71 >> 47);
  }
  return v32;
}

uint64_t sub_1BA81F3B8(uint64_t a1)
{
  byte_1E9F76C09 = 1;

  uint64_t v2 = *(void ***)(a1 + 96);
  if (v2)
  {
    do
    {
      uint64_t v7 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      uint64_t v2 = v7;
    }
    while (v7);
  }
  uint64_t v3 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = 0;
  if (v3) {
    operator delete(v3);
  }
  uint64_t v4 = *(char **)(a1 + 56);
  if (v4)
  {
    do
    {
      uint64_t v8 = *(char **)v4;
      uint64_t v9 = (void *)*((void *)v4 + 5);
      if (v9)
      {
        *((void *)v4 + 6) = v9;
        operator delete(v9);
      }
      if (v4[39] < 0) {
        operator delete(*((void **)v4 + 2));
      }
      operator delete(v4);
      uint64_t v4 = v8;
    }
    while (v8);
  }
  uint64_t v5 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = 0;
  if (v5) {
    operator delete(v5);
  }

  return sub_1BA81F4B8(a1);
}

uint64_t sub_1BA81F4B8(uint64_t a1)
{
  uint64_t v2 = *(char **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v5 = *(char **)v2;
      uint64_t v6 = (id *)*((void *)v2 + 5);
      if (v6)
      {
        uint64_t v7 = (id *)*((void *)v2 + 6);
        uint64_t v8 = (void *)*((void *)v2 + 5);
        if (v7 != v6)
        {
          do
            objc_destroyWeak(--v7);
          while (v7 != v6);
          uint64_t v8 = (void *)*((void *)v2 + 5);
        }
        *((void *)v2 + 6) = v6;
        operator delete(v8);
      }
      if (v2[39] < 0) {
        operator delete(*((void **)v2 + 2));
      }
      operator delete(v2);
      uint64_t v2 = v5;
    }
    while (v5);
  }
  uint64_t v3 = *(void **)a1;
  *(void *)a1 = 0;
  if (v3) {
    operator delete(v3);
  }
  return a1;
}

void sub_1BA81F564()
{
  int v0 = (void **)qword_1E9F765E0;
  if (qword_1E9F765E0)
  {
    do
    {
      uint64_t v2 = (void **)*v0;
      if (*((char *)v0 + 39) < 0) {
        operator delete(v0[2]);
      }
      operator delete(v0);
      int v0 = v2;
    }
    while (v2);
  }
  int v1 = (void *)xmmword_1E9F765D0;
  *(void *)&xmmword_1E9F765D0 = 0;
  if (v1)
  {
    operator delete(v1);
  }
}

void sub_1BA81F5E0()
{
  int v0 = (char *)qword_1E9F765B8;
  if (qword_1E9F765B8)
  {
    do
    {
      uint64_t v2 = *(char **)v0;
      uint64_t v3 = (void *)*((void *)v0 + 5);
      if (v3)
      {
        *((void *)v0 + 6) = v3;
        operator delete(v3);
      }
      if (v0[39] < 0) {
        operator delete(*((void **)v0 + 2));
      }
      operator delete(v0);
      int v0 = v2;
    }
    while (v2);
  }
  int v1 = (void *)qword_1E9F765A8;
  qword_1E9F765A8 = 0;
  if (v1)
  {
    operator delete(v1);
  }
}

id sub_1BA81F66C()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76578, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76578))
  {
    sub_1BA81ED8C();
    __cxa_atexit((void (*)(void *))sub_1BA81F3B8, &xmmword_1E9F76580, &dword_1BA813000);
    __cxa_guard_release(&qword_1E9F76578);
  }
  int v0 = (void *)qword_1E9F76618;
  if (qword_1E9F76608) {
    int v0 = (void *)qword_1E9F76608;
  }
  id v1 = v0;

  return v1;
}

void sub_1BA81F70C(_Unwind_Exception *a1)
{
}

void sub_1BA81F724(unint64_t a1)
{
  if (!a1)
  {
    uint64_t v12 = (void *)xmmword_1E9F76580;
    *(void *)&xmmword_1E9F76580 = 0;
    if (v12) {
      operator delete(v12);
    }
    *((void *)&xmmword_1E9F76580 + 1) = 0;
    return;
  }
  if (a1 >> 61) {
    sub_1BA81F974();
  }
  uint64_t v2 = operator new(8 * a1);
  uint64_t v3 = (void *)xmmword_1E9F76580;
  *(void *)&xmmword_1E9F76580 = v2;
  if (v3) {
    operator delete(v3);
  }
  uint64_t v4 = 0;
  *((void *)&xmmword_1E9F76580 + 1) = a1;
  do
    *(void *)(xmmword_1E9F76580 + 8 * v4++) = 0;
  while (a1 != v4);
  uint64_t v5 = (void **)qword_1E9F76590;
  if (qword_1E9F76590)
  {
    unint64_t v6 = *(void *)(qword_1E9F76590 + 8);
    unint64_t v7 = a1 - 1;
    if ((a1 & (a1 - 1)) == 0)
    {
      uint64_t v8 = v6 & v7;
      *(void *)(xmmword_1E9F76580 + 8 * v8) = &qword_1E9F76590;
      while (1)
      {
        uint64_t v9 = *v5;
        if (!*v5) {
          break;
        }
        uint64_t v10 = v9[1] & v7;
        if (v10 == v8)
        {
          uint64_t v5 = (void **)*v5;
        }
        else if (*(void *)(xmmword_1E9F76580 + 8 * v10))
        {
          *uint64_t v5 = (void *)*v9;
          uint64_t v11 = 8 * v10;
          void *v9 = **(void **)(xmmword_1E9F76580 + v11);
          **(void **)(xmmword_1E9F76580 + v11) = v9;
        }
        else
        {
          *(void *)(xmmword_1E9F76580 + 8 * v10) = v5;
          uint64_t v5 = (void **)v9;
          uint64_t v8 = v10;
        }
      }
      return;
    }
    if (v6 >= a1) {
      v6 %= a1;
    }
    *(void *)(xmmword_1E9F76580 + 8 * v6) = &qword_1E9F76590;
    for (i = *v5; i; unint64_t v6 = v15)
    {
      unint64_t v15 = i[1];
      if (v15 >= a1) {
        v15 %= a1;
      }
      if (v15 != v6)
      {
        if (!*(void *)(xmmword_1E9F76580 + 8 * v15))
        {
          *(void *)(xmmword_1E9F76580 + 8 * v15) = v5;
          goto LABEL_26;
        }
        *uint64_t v5 = (void *)*i;
        uint64_t v14 = 8 * v15;
        void *i = **(void **)(xmmword_1E9F76580 + v14);
        **(void **)(xmmword_1E9F76580 + v14) = i;
        i = v5;
      }
      unint64_t v15 = v6;
LABEL_26:
      uint64_t v5 = (void **)i;
      i = (void *)*i;
    }
  }
}

uint64_t *sub_1BA81F8E4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16))
    {
      uint64_t v3 = *(id **)(v2 + 40);
      if (v3)
      {
        uint64_t v4 = *(id **)(v2 + 48);
        uint64_t v5 = *(void **)(v2 + 40);
        if (v4 != v3)
        {
          do
            objc_destroyWeak(--v4);
          while (v4 != v3);
          uint64_t v5 = *(void **)(v2 + 40);
        }
        *(void *)(v2 + 48) = v3;
        operator delete(v5);
      }
      if (*(char *)(v2 + 39) < 0) {
        operator delete(*(void **)(v2 + 16));
      }
    }
    operator delete((void *)v2);
  }
  return a1;
}

void sub_1BA81F974()
{
}

void *sub_1BA81F984(unsigned char *__dst, void *__src, unint64_t a3)
{
  uint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      abort();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
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

uint64_t *sub_1BA81FA20(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16) && *(char *)(v2 + 39) < 0) {
      operator delete(*(void **)(v2 + 16));
    }
    operator delete((void *)v2);
  }
  return a1;
}

void *sub_1BA81FA70(uint64_t a1, uint64_t a2)
{
  int v4 = *(char *)(a1 + 23);
  if (v4 >= 0) {
    uint64_t v5 = (uint64_t *)a1;
  }
  else {
    uint64_t v5 = *(uint64_t **)a1;
  }
  if (v4 >= 0) {
    unint64_t v6 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    unint64_t v6 = *(void *)(a1 + 8);
  }
  unint64_t v7 = sub_1BA81EF84(v5, v6);
  unint64_t v8 = v7;
  unint64_t v9 = qword_1E9F765B0;
  if (qword_1E9F765B0)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)qword_1E9F765B0);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v2 = v7;
      if (v7 >= qword_1E9F765B0) {
        unint64_t v2 = v7 % qword_1E9F765B0;
      }
    }
    else
    {
      unint64_t v2 = (qword_1E9F765B0 - 1) & v7;
    }
    uint64_t v11 = *(void **)(qword_1E9F765A8 + 8 * v2);
    if (v11)
    {
      uint64_t v12 = (void *)*v11;
      if (*v11)
      {
        if (v10.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v17 = v12[1];
            if (v17 == v8)
            {
              uint64_t v18 = *((unsigned __int8 *)v12 + 39);
              if ((v18 & 0x80u) == 0) {
                uint64_t v19 = *((unsigned __int8 *)v12 + 39);
              }
              else {
                uint64_t v19 = v12[3];
              }
              if (v19 == v6)
              {
                if ((v18 & 0x80) != 0)
                {
                  if (!memcmp((const void *)v12[2], v5, v12[3])) {
                    return v12;
                  }
                }
                else
                {
                  if (!*((unsigned char *)v12 + 39)) {
                    return v12;
                  }
                  uint64_t v20 = 0;
                  while (*((unsigned __int8 *)v12 + v20 + 16) == *((unsigned __int8 *)v5 + v20))
                  {
                    if (v18 == ++v20) {
                      return v12;
                    }
                  }
                }
              }
            }
            else if ((v17 & (v9 - 1)) != v2)
            {
              goto LABEL_49;
            }
            uint64_t v12 = (void *)*v12;
            if (!v12) {
              goto LABEL_49;
            }
          }
        }
        do
        {
          unint64_t v13 = v12[1];
          if (v13 == v8)
          {
            uint64_t v14 = *((unsigned __int8 *)v12 + 39);
            if ((v14 & 0x80u) == 0) {
              uint64_t v15 = *((unsigned __int8 *)v12 + 39);
            }
            else {
              uint64_t v15 = v12[3];
            }
            if (v15 == v6)
            {
              if ((v14 & 0x80) != 0)
              {
                if (!memcmp((const void *)v12[2], v5, v12[3])) {
                  return v12;
                }
              }
              else
              {
                if (!*((unsigned char *)v12 + 39)) {
                  return v12;
                }
                uint64_t v16 = 0;
                while (*((unsigned __int8 *)v12 + v16 + 16) == *((unsigned __int8 *)v5 + v16))
                {
                  if (v14 == ++v16) {
                    return v12;
                  }
                }
              }
            }
          }
          else
          {
            if (v13 >= v9) {
              v13 %= v9;
            }
            if (v13 != v2) {
              break;
            }
          }
          uint64_t v12 = (void *)*v12;
        }
        while (v12);
      }
    }
  }
LABEL_49:
  uint64_t v21 = operator new(0x40uLL);
  void *v21 = 0;
  v21[1] = v8;
  uint64_t v22 = v21 + 2;
  if (*(char *)(a2 + 23) < 0)
  {
    sub_1BA81F984(v22, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)uint64_t v22 = *(_OWORD *)a2;
    v21[4] = *(void *)(a2 + 16);
  }
  v21[5] = 0;
  v21[6] = 0;
  v21[7] = 0;
  float v23 = (float)(unint64_t)(qword_1E9F765C0 + 1);
  if (!v9 || (float)(*(float *)&dword_1E9F765C8 * (float)v9) < v23)
  {
    BOOL v24 = 1;
    if (v9 >= 3) {
      BOOL v24 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v25 = v24 | (2 * v9);
    unint64_t v26 = vcvtps_u32_f32(v23 / *(float *)&dword_1E9F765C8);
    if (v25 <= v26) {
      unint64_t prime = v26;
    }
    else {
      unint64_t prime = v25;
    }
    if (prime == 1)
    {
      unint64_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      unint64_t prime = std::__next_prime(prime);
    }
    unint64_t v9 = qword_1E9F765B0;
    if (prime <= qword_1E9F765B0)
    {
      if (prime >= qword_1E9F765B0) {
        goto LABEL_89;
      }
      unint64_t v38 = vcvtps_u32_f32((float)(unint64_t)qword_1E9F765C0 / *(float *)&dword_1E9F765C8);
      if ((unint64_t)qword_1E9F765B0 < 3
        || (uint8x8_t v39 = (uint8x8_t)vcnt_s8((int8x8_t)qword_1E9F765B0), v39.i16[0] = vaddlv_u8(v39), v39.u32[0] > 1uLL))
      {
        unint64_t v38 = std::__next_prime(v38);
      }
      else
      {
        uint64_t v40 = 1 << -(char)__clz(v38 - 1);
        if (v38 >= 2) {
          unint64_t v38 = v40;
        }
      }
      if (prime <= v38) {
        unint64_t prime = v38;
      }
      if (prime >= v9)
      {
        unint64_t v9 = qword_1E9F765B0;
LABEL_89:
        if ((v9 & (v9 - 1)) != 0)
        {
          if (v8 >= v9) {
            unint64_t v2 = v8 % v9;
          }
          else {
            unint64_t v2 = v8;
          }
        }
        else
        {
          unint64_t v2 = (v9 - 1) & v8;
        }
        goto LABEL_102;
      }
      if (!prime)
      {
        uint64_t v47 = (void *)qword_1E9F765A8;
        qword_1E9F765A8 = 0;
        if (v47) {
          operator delete(v47);
        }
        unint64_t v9 = 0;
        qword_1E9F765B0 = 0;
        goto LABEL_89;
      }
    }
    if (prime >> 61) {
      sub_1BA81F974();
    }
    uint64_t v28 = operator new(8 * prime);
    unint64_t v29 = (void *)qword_1E9F765A8;
    qword_1E9F765A8 = (uint64_t)v28;
    if (v29) {
      operator delete(v29);
    }
    uint64_t v30 = 0;
    qword_1E9F765B0 = prime;
    do
      *(void *)(qword_1E9F765A8 + 8 * v30++) = 0;
    while (prime != v30);
    unint64_t v31 = (void **)qword_1E9F765B8;
    if (!qword_1E9F765B8)
    {
LABEL_88:
      unint64_t v9 = prime;
      goto LABEL_89;
    }
    unint64_t v32 = *(void *)(qword_1E9F765B8 + 8);
    unint64_t v33 = prime - 1;
    if ((prime & (prime - 1)) == 0)
    {
      unint64_t v34 = v32 & v33;
      *(void *)(qword_1E9F765A8 + 8 * v34) = &qword_1E9F765B8;
      for (i = *v31; *v31; i = *v31)
      {
        unint64_t v36 = i[1] & v33;
        if (v36 == v34)
        {
          unint64_t v31 = (void **)i;
        }
        else if (*(void *)(qword_1E9F765A8 + 8 * v36))
        {
          void *v31 = (void *)*i;
          uint64_t v37 = 8 * v36;
          void *i = **(void **)(qword_1E9F765A8 + v37);
          **(void **)(qword_1E9F765A8 + v37) = i;
        }
        else
        {
          *(void *)(qword_1E9F765A8 + 8 * v36) = v31;
          unint64_t v31 = (void **)i;
          unint64_t v34 = v36;
        }
      }
      goto LABEL_88;
    }
    if (v32 >= prime) {
      v32 %= prime;
    }
    *(void *)(qword_1E9F765A8 + 8 * v32) = &qword_1E9F765B8;
    unint64_t v41 = *v31;
    if (!*v31) {
      goto LABEL_88;
    }
    while (1)
    {
      unint64_t v43 = v41[1];
      if (v43 >= prime) {
        v43 %= prime;
      }
      if (v43 != v32)
      {
        if (!*(void *)(qword_1E9F765A8 + 8 * v43))
        {
          *(void *)(qword_1E9F765A8 + 8 * v43) = v31;
          goto LABEL_93;
        }
        void *v31 = (void *)*v41;
        uint64_t v42 = 8 * v43;
        void *v41 = **(void **)(qword_1E9F765A8 + v42);
        **(void **)(qword_1E9F765A8 + v42) = v41;
        unint64_t v41 = v31;
      }
      unint64_t v43 = v32;
LABEL_93:
      unint64_t v31 = (void **)v41;
      unint64_t v41 = (void *)*v41;
      unint64_t v32 = v43;
      if (!v41) {
        goto LABEL_88;
      }
    }
  }
LABEL_102:
  uint64_t v44 = *(void **)(qword_1E9F765A8 + 8 * v2);
  if (v44)
  {
    void *v21 = *v44;
    *uint64_t v44 = v21;
  }
  else
  {
    void *v21 = qword_1E9F765B8;
    qword_1E9F765B8 = (uint64_t)v21;
    *(void *)(qword_1E9F765A8 + 8 * v2) = &qword_1E9F765B8;
    if (*v21)
    {
      unint64_t v45 = *(void *)(*v21 + 8);
      if ((v9 & (v9 - 1)) != 0)
      {
        if (v45 >= v9) {
          v45 %= v9;
        }
      }
      else
      {
        v45 &= v9 - 1;
      }
      *(void *)(qword_1E9F765A8 + 8 * v45) = v21;
    }
  }
  uint64_t v12 = v21;
  ++qword_1E9F765C0;
  return v12;
}

void sub_1BA82001C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1BA820034((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_1BA820034(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16))
    {
      uint64_t v3 = *(void **)(v2 + 40);
      if (v3)
      {
        *(void *)(v2 + 48) = v3;
        operator delete(v3);
      }
      if (*(char *)(v2 + 39) < 0) {
        operator delete(*(void **)(v2 + 16));
      }
    }
    operator delete((void *)v2);
  }
  return a1;
}

void sub_1BA820224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA820414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA820578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8206D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA820B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,void *a30,uint64_t a31,void *a32,void *a33)
{
  _Unwind_Resume(a1);
}

void sub_1BA820CA4(uint64_t a1)
{
  sub_1BA83AEEC(*(void *)(*(void *)(a1 + 32) + 504));
  uint64_t v2 = [*(id *)(a1 + 40) destinationColorPixelBuffer];
  int v3 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v4 = [*(id *)(a1 + 48) canonicalDisparityPixelBuffer];
  uint64_t v5 = [*(id *)(a1 + 40) mattingRequest];
  unint64_t v6 = [v5 disparityPostprocessingRequest];
  [v6 fixedPointDisparityPixelBuffer];
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 24) rawShiftInvalidThreshold];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = **(unsigned int **)(v8 + 360);
  sub_1BA81EA6C([*(id *)(v8 + 24) videoPipelineDevice]);
  [*(id *)(*(void *)(a1 + 32) + 384) primaryCaptureRect];
  if (v3) {
    +[CVAPortraitVideoPipeline_Impl drawDisparity:v4 onColor:v2 canonical:1 rawShiftInvalidThreshold:v7 focusMachineState:v9 offsetX:0 offsetY:0];
  }

  [*(id *)(a1 + 40) destinationColorPixelBuffer];
  if (*(void *)(a1 + 64))
  {
    uint8x8_t v10 = [*(id *)(a1 + 40) parentGenericRequestFrom];
    if (v10)
    {

LABEL_7:
      uint64_t v12 = (void (**)(void, void, void, void))MEMORY[0x1BA9F1850](*(void *)(a1 + 64));
      unint64_t v13 = [*(id *)(a1 + 40) parentGenericRequestFrom];
      uint64_t v14 = [*(id *)(a1 + 40) parentGenericRequestTo];
      ((void (**)(void, void *, void *, void))v12)[2](v12, v13, v14, *(void *)(a1 + 56));

      goto LABEL_8;
    }
    uint64_t v11 = [*(id *)(a1 + 40) parentGenericRequestTo];

    if (v11) {
      goto LABEL_7;
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
LABEL_8:
  if (*(_DWORD *)(*(void *)(a1 + 32) + 304))
  {
    uint64_t v15 = *(void *)(a1 + 72);
    v16.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
    syslog(4, "sdofTime : %lld  %lld (diff : %lld)", v15, v16.__d_.__rep_ / 1000, v16.__d_.__rep_ / 1000 - v15);
  }
}

void sub_1BA820E8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA82122C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  __cxa_guard_abort(&qword_1E9F76940);

  _Unwind_Resume(a1);
}

void sub_1BA821308(uint64_t a1)
{
  sub_1BA83AEEC(*(void *)(*(void *)(a1 + 32) + 504));
  uint64_t v2 = [*(id *)(a1 + 40) destinationColorPixelBuffer];
  int v3 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v4 = [*(id *)(a1 + 48) canonicalDisparityPixelBuffer];
  id v14 = [*(id *)(a1 + 40) mattingRequest];
  uint64_t v5 = [v14 disparityPostprocessingRequest];
  [v5 fixedPointDisparityPixelBuffer];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 24) rawShiftInvalidThreshold];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = **(unsigned int **)(v7 + 360);
  sub_1BA81EA6C([*(id *)(v7 + 24) videoPipelineDevice]);
  [*(id *)(*(void *)(a1 + 32) + 384) primaryCaptureRect];
  if (v3) {
    +[CVAPortraitVideoPipeline_Impl drawDisparity:v4 onColor:v2 canonical:1 rawShiftInvalidThreshold:v6 focusMachineState:v8 offsetX:0 offsetY:0];
  }

  [*(id *)(a1 + 40) destinationColorPixelBuffer];
  if (*(void *)(a1 + 64))
  {
    uint64_t v9 = [*(id *)(a1 + 40) parentGenericRequestFrom];
    if (v9)
    {

LABEL_8:
      uint64_t v15 = (void (**)(id, void *, void *, void))MEMORY[0x1BA9F1850](*(void *)(a1 + 64));
      uint64_t v11 = [*(id *)(a1 + 40) parentGenericRequestFrom];
      uint64_t v12 = [*(id *)(a1 + 40) parentGenericRequestTo];
      v15[2](v15, v11, v12, *(void *)(a1 + 56));

      return;
    }
    uint8x8_t v10 = [*(id *)(a1 + 40) parentGenericRequestTo];

    if (v10) {
      goto LABEL_8;
    }
    unint64_t v13 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v13();
  }
}

void sub_1BA8214F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA821C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,void *a25,void *a26,void *a27,uint64_t a28,void *a29)
{
  _Unwind_Resume(a1);
}

void sub_1BA821D58(uint64_t a1)
{
  sub_1BA83AEEC(*(void *)(*(void *)(a1 + 32) + 504));
  uint64_t v2 = [*(id *)(a1 + 40) destinationColorPixelBuffer];
  int v3 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v4 = [*(id *)(a1 + 48) canonicalDisparityPixelBuffer];
  uint64_t v5 = [*(id *)(a1 + 40) mattingRequest];
  uint64_t v6 = [v5 disparityPostprocessingRequest];
  [v6 fixedPointDisparityPixelBuffer];
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 24) rawShiftInvalidThreshold];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = **(unsigned int **)(v8 + 360);
  sub_1BA81EA6C([*(id *)(v8 + 24) videoPipelineDevice]);
  [*(id *)(*(void *)(a1 + 32) + 384) primaryCaptureRect];
  if (v3) {
    +[CVAPortraitVideoPipeline_Impl drawDisparity:v4 onColor:v2 canonical:1 rawShiftInvalidThreshold:v7 focusMachineState:v9 offsetX:0 offsetY:0];
  }

  [*(id *)(a1 + 40) destinationColorPixelBuffer];
  if (*(void *)(a1 + 64))
  {
    uint8x8_t v10 = [*(id *)(a1 + 40) parentGenericRequestFrom];
    if (v10)
    {

LABEL_7:
      uint64_t v12 = (void (**)(void, void, void, void))MEMORY[0x1BA9F1850](*(void *)(a1 + 64));
      unint64_t v13 = [*(id *)(a1 + 40) parentGenericRequestFrom];
      id v14 = [*(id *)(a1 + 40) parentGenericRequestTo];
      ((void (**)(void, void *, void *, void))v12)[2](v12, v13, v14, *(void *)(a1 + 56));

      goto LABEL_8;
    }
    uint64_t v11 = [*(id *)(a1 + 40) parentGenericRequestTo];

    if (v11) {
      goto LABEL_7;
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
LABEL_8:
  if (*(_DWORD *)(*(void *)(a1 + 32) + 304))
  {
    uint64_t v15 = *(void *)(a1 + 72);
    v16.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
    syslog(4, "sdofTime : %lld  %lld (diff : %lld)", v15, v16.__d_.__rep_ / 1000, v16.__d_.__rep_ / 1000 - v15);
  }
}

void sub_1BA821F40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1BA821F74()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76718, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76718))
  {
    id v1 = +[CVAPreferenceManager defaults];
    char v2 = [v1 BOOLForKey:@"CVAPhotoLogTransitionData"];

    byte_1E9F76998 = v2;
    __cxa_guard_release(&qword_1E9F76718);
  }
  return byte_1E9F76998;
}

void sub_1BA821FF8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_1E9F76718);
  _Unwind_Resume(a1);
}

void sub_1BA8229D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1BA822B6C(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

uint64_t sub_1BA822B8C(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

void sub_1BA82318C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA82323C(float *a1, float *a2, float *a3, float *a4, void *a5)
{
  uint64_t v9 = [a5 objectForKeyedSubscript:@"FinalCropRectFromSource"];
  if (v9)
  {
    unint64_t v29 = v9;
    uint8x8_t v10 = [v9 objectForKeyedSubscript:@"X"];
    [v10 floatValue];
    float v12 = v11;
    unint64_t v13 = [v29 objectForKeyedSubscript:@"Y"];
    [v13 floatValue];
    float v15 = v14;
    std::chrono::system_clock::time_point v16 = [v29 objectForKeyedSubscript:@"Width"];
    [v16 floatValue];
    float v18 = v17;
    uint64_t v19 = [v29 objectForKeyedSubscript:@"Height"];
    [v19 floatValue];
    double v20 = v12;
    double v21 = v15;
    double v22 = v18;
    double v24 = v23;

    uint64_t v9 = v29;
  }
  else
  {
    double v22 = 1.0;
    double v20 = 0.0;
    double v21 = 0.0;
    double v24 = 1.0;
  }
  float v25 = (*a1 - v20) / v22;
  *a1 = v25;
  float v26 = (*a2 - v21) / v24;
  *a2 = v26;
  float v27 = *a3 / v22;
  *a3 = v27;
  float v28 = *a4 / v24;
  *a4 = v28;
}

void sub_1BA8233D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA825404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,void *a36)
{
  __cxa_guard_abort(&qword_1E9F76640);
  sub_1BA825818(&STACK[0x2B0]);
  unint64_t v38 = (void *)STACK[0x360];
  if (STACK[0x360])
  {
    STACK[0x368] = (unint64_t)v38;
    operator delete(v38);
  }

  _Unwind_Resume(a1);
}

void *sub_1BA825694(void *result, char *__src, char *a3, size_t __sz)
{
  uint64_t v6 = __src;
  uint64_t v7 = result;
  uint64_t v8 = result[2];
  uint64_t v9 = (char *)*result;
  if (__sz > (v8 - *result) >> 2)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (__sz >> 62) {
      goto LABEL_22;
    }
    uint64_t v10 = v8 >> 1;
    if (v8 >> 1 <= __sz) {
      uint64_t v10 = __sz;
    }
    BOOL v11 = (unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL;
    unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
    if (!v11) {
      unint64_t v12 = v10;
    }
    if (v12 >> 62) {
LABEL_22:
    }
      abort();
    uint64_t v13 = 4 * v12;
    uint64_t result = operator new(4 * v12);
    uint64_t v9 = (char *)result;
    *uint64_t v7 = result;
    v7[1] = result;
    v7[2] = (char *)result + v13;
    size_t v14 = a3 - v6;
    if (v14) {
      uint64_t result = memcpy(result, v6, v14);
    }
    float v15 = (void **)(v7 + 1);
    goto LABEL_21;
  }
  float v15 = (void **)(result + 1);
  std::chrono::system_clock::time_point v16 = (unsigned char *)result[1];
  unint64_t v17 = (v16 - v9) >> 2;
  if (v17 >= __sz)
  {
    size_t v14 = a3 - __src;
    if (a3 == __src) {
      goto LABEL_21;
    }
    uint64_t v19 = (void *)*result;
LABEL_20:
    uint64_t result = memmove(v19, __src, v14);
    goto LABEL_21;
  }
  float v18 = &__src[4 * v17];
  if (v16 != v9)
  {
    uint64_t result = memmove((void *)*result, __src, v16 - v9);
    uint64_t v9 = (char *)*v15;
  }
  size_t v14 = a3 - v18;
  if (v14)
  {
    uint64_t v19 = v9;
    __src = v18;
    goto LABEL_20;
  }
LABEL_21:
  void *v15 = &v9[v14];
  return result;
}

uint64_t sub_1BA8257D8(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

uint64_t sub_1BA8257F8(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

void *sub_1BA825818(void *a1)
{
  char v2 = (void *)a1[9];
  if (v2)
  {
    a1[10] = v2;
    operator delete(v2);
  }
  int v3 = (void *)a1[6];
  if (v3)
  {
    a1[7] = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_1BA825FF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_1BA8261A4(void *a1)
{
  id v1 = a1;
  if (([v1 length] & 0xF) != 0)
  {
    BOOL v2 = 0;
  }
  else
  {
    int v3 = [v1 length] & 0xF;
    long double v4 = cbrt((double)v3);
    BOOL v2 = (int)v4 * (int)v4 * (int)v4 == v3;
  }

  return v2;
}

void sub_1BA82620C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8265C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA827038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8272B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA827D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA827E08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)CVAPortraitVideoPipeline_Impl;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA82953C(_Unwind_Exception *a1)
{
  uint64_t v7 = v4;

  _Unwind_Resume(a1);
}

void sub_1BA829998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA829BA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA82AC04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA830E48(_Unwind_Exception *a1)
{
  sub_1BA831AFC((void *)STACK[0x248]);
  _Unwind_Resume(a1);
}

id sub_1BA831804(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long double v4 = [**(id **)a1 objectForKey:v3];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      goto LABEL_21;
    }
  }
  uint64_t v6 = [**(id **)(a1 + 8) objectForKeyedSubscript:v3];
  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
LABEL_13:
      id v5 = 0;
      goto LABEL_20;
    }
    int v15 = 138412290;
    id v16 = v3;
    BOOL v11 = MEMORY[0x1E4F14500];
    unint64_t v12 = "No value for parameter %@";
    uint32_t v13 = 12;
LABEL_25:
    _os_log_error_impl(&dword_1BA813000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v15, v13);
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    uint64_t v8 = [v7 objectForKeyedSubscript:&unk_1F143F9D0];
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:**(void **)(a1 + 16)];
    uint64_t v10 = [v7 objectForKeyedSubscript:v9];

    if (v10)
    {
      id v5 = v10;
    }
    else if (v8)
    {
      id v5 = v8;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412290;
        id v16 = v3;
        _os_log_error_impl(&dword_1BA813000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "No value for parameter %@", (uint8_t *)&v15, 0xCu);
      }
      id v5 = 0;
    }

    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    LOWORD(v15) = 0;
    BOOL v11 = MEMORY[0x1E4F14500];
    unint64_t v12 = "Unknown parameter type";
    uint32_t v13 = 2;
    goto LABEL_25;
  }
  id v5 = v6;
LABEL_20:

LABEL_21:

  return v5;
}

void sub_1BA831AA4(_Unwind_Exception *a1)
{
  id v7 = v6;

  _Unwind_Resume(a1);
}

void sub_1BA831AFC(void *a1)
{
  if (a1)
  {
    sub_1BA831AFC(*a1);
    sub_1BA831AFC(a1[1]);
    operator delete(a1);
  }
}

double sub_1BA831B54(double *a1)
{
  double v1 = *a1;
  double v2 = sqrt(a1[1] * a1[1] + v1 * v1 + a1[2] * a1[2]);
  if (v2 < 0.00000011920929)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"CVAVector cva::normalized(const CVAVector &)"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"CVAVector.mm", 15, @"Unable to normalize vector (%.3e %.3e %.3e)", *(void *)a1, *((void *)a1 + 1), *((void *)a1 + 2));

    double v1 = *a1;
  }
  return v1 / v2;
}

void sub_1BA831C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA831F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA83210C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA832520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA83289C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1BA832B78((id *)va);

  _Unwind_Resume(a1);
}

void sub_1BA8328CC(void **a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v36 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = v13;
  id v18 = v14;
  id v19 = v15;
  double v20 = sub_1BA861EB8(v36, v17, v19, a6, v16);
  if (!v20 || a6 && *a6)
  {
    id v21 = 0;
  }
  else
  {
    id v34 = v18;
    id v35 = v16;
    id v22 = objc_alloc_init(MEMORY[0x1E4F35208]);
    [v22 setThreadGroupSizeIsMultipleOfThreadExecutionWidth:1];
    [v22 setComputeFunction:v20];
    [v22 setPipelineLibrary:v17];
    id v37 = 0;
    uint64_t v23 = [v18 newComputePipelineStateWithDescriptor:v22 error:&v37];
    id v24 = v37;
    float v25 = v24;
    unint64_t v33 = (void *)v23;
    if (v24) {
      BOOL v26 = 1;
    }
    else {
      BOOL v26 = v23 == 0;
    }
    uint64_t v27 = v26;
    float v28 = NSString;
    unint64_t v29 = [NSString stringWithFormat:@"Unable to create function (%@): %@", v19, v24];
    uint64_t v30 = [v28 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "id<MTLComputePipelineState> computeKernel(__strong id<MTLLibrary> _Nonnull, __strong id<MTLPipelineLibrarySPI> _Nonnull, __strong id<MTLDeviceSPI> _Nonnull, NSString *__strong _Nonnull, NSError *__autoreleasing * _Nullable, MTLFunctionConstantValues * _Nullable __strong)", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/metal/MetalHelpers.mm", 126, v29];
    sub_1BA8161F4(v27, a6, v25, 4294944382, v30);

    if (v27)
    {
      id v21 = 0;
      unint64_t v31 = v33;
      id v18 = v34;
    }
    else
    {
      unint64_t v31 = v33;
      id v21 = v33;
      id v18 = v34;
    }

    id v16 = v35;
  }

  unint64_t v32 = *a1;
  *a1 = v21;
}

void sub_1BA832AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, id a17)
{
  _Unwind_Resume(a1);
}

id *sub_1BA832B78(id *a1)
{
  return a1;
}

void sub_1BA832C1C(void *a1, void *a2)
{
  id v18 = a1;
  int v3 = [v18 count];
  long double v4 = [v18 objectAtIndexedSubscript:0];
  int v5 = [v4 count];
  if (v3 < 1)
  {
    BOOL v11 = v4;
  }
  else if (v5 <= 0)
  {
    uint64_t v16 = 0;
    uint64_t v17 = v3;
    do
    {
      BOOL v11 = [v18 objectAtIndexedSubscript:v16];

      ++v16;
      long double v4 = v11;
    }
    while (v17 != v16);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = v3;
    uint64_t v9 = v5;
    uint64_t v10 = 4 * v3;
    do
    {
      BOOL v11 = [v18 objectAtIndexedSubscript:v7];

      uint64_t v12 = 0;
      uint64_t v13 = v6;
      do
      {
        id v14 = [v11 objectAtIndexedSubscript:v12];
        [v14 floatValue];
        *(_DWORD *)(*a2 + v13) = v15;

        ++v12;
        v13 += v10;
      }
      while (v9 != v12);
      ++v7;
      v6 += 4;
      long double v4 = v11;
    }
    while (v7 != v8);
  }
}

void sub_1BA832D70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA832DB8(void *a1, void *a2, _OWORD **a3)
{
  id v30 = a1;
  id v5 = a2;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 32);
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 48);
  uint64_t v9 = *a3;
  _OWORD *v9 = *MEMORY[0x1E4F149A0];
  v9[1] = v6;
  v9[2] = v7;
  v9[3] = v8;
  uint64_t v10 = operator new(0x24uLL);
  v31[1] = (char *)v10 + 36;
  v31[2] = (char *)v10 + 36;
  _OWORD *v10 = 0u;
  v10[1] = 0u;
  *((_DWORD *)v10 + 8) = 0;
  v31[0] = v10;
  sub_1BA832C1C(v30, v31);
  BOOL v11 = *a3;
  _DWORD *v11 = *(_DWORD *)v10;
  v11[1] = *((_DWORD *)v10 + 1);
  v11[2] = *((_DWORD *)v10 + 2);
  v11[4] = *((_DWORD *)v10 + 3);
  v11[5] = *((_DWORD *)v10 + 4);
  v11[6] = *((_DWORD *)v10 + 5);
  v11[8] = *((_DWORD *)v10 + 6);
  v11[9] = *((_DWORD *)v10 + 7);
  v11[10] = *((_DWORD *)v10 + 8);
  unint64_t v12 = [v5 count];
  unint64_t v13 = v12;
  if (v12)
  {
    if (v12 >> 62) {
      abort();
    }
    id v14 = (long long *)operator new(4 * v12);
    bzero(v14, 4 * v13);
  }
  else
  {
    id v14 = 0;
  }
  id v15 = v5;
  for (unint64_t i = 0; i < objc_msgSend(v15, "count", v30); ++i)
  {
    uint64_t v17 = [v15 objectAtIndexedSubscript:i];
    [v17 floatValue];
    *((_DWORD *)v14 + i) = v18;
  }
  if (v13)
  {
    id v19 = *a3;
    if (v13 > 7 && (unint64_t)((char *)v19 - (char *)v14 + 48) >= 0x20)
    {
      unint64_t v20 = v13 & 0xFFFFFFFFFFFFFFF8;
      BOOL v26 = v19 + 4;
      uint64_t v27 = v14 + 1;
      unint64_t v28 = v13 & 0xFFFFFFFFFFFFFFF8;
      do
      {
        long long v29 = *v27;
        *(v26 - 1) = *(v27 - 1);
        _OWORD *v26 = v29;
        v26 += 2;
        v27 += 2;
        v28 -= 8;
      }
      while (v28);
      if (v13 == v20) {
        goto LABEL_20;
      }
    }
    else
    {
      unint64_t v20 = 0;
    }
    unint64_t v21 = v13 - v20;
    uint64_t v22 = 4 * v20;
    uint64_t v23 = (_DWORD *)((char *)v19 + v22 + 48);
    id v24 = (int *)((char *)v14 + v22);
    do
    {
      int v25 = *v24++;
      *v23++ = v25;
      --v21;
    }
    while (v21);
LABEL_20:
    operator delete(v14);
    goto LABEL_21;
  }
  if (v14) {
    goto LABEL_20;
  }
LABEL_21:
  operator delete(v10);
}

void sub_1BA832FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  operator delete(v9);

  _Unwind_Resume(a1);
}

uint64_t sub_1BA83302C(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 200));
  *(void *)(a1 + 200) = 0;
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 192));
  *(void *)(a1 + 192) = 0;
  double v2 = *(void **)(a1 + 256);
  if (v2)
  {
    *(void *)(a1 + 264) = v2;
    operator delete(v2);
  }
  int v3 = *(void **)(a1 + 208);
  if (v3)
  {
    *(void *)(a1 + 216) = v3;
    operator delete(v3);
  }
  long double v4 = *(void **)(a1 + 72);
  if (v4)
  {
    *(void *)(a1 + 80) = v4;
    operator delete(v4);
  }
  id v5 = *(void **)(a1 + 48);
  if (v5)
  {
    *(void *)(a1 + 56) = v5;
    operator delete(v5);
  }
  return a1;
}

uint64_t sub_1BA8330A8(uint64_t a1, CVPixelBufferRef pixelBuffer, uint64_t a3, float a4, float a5, float a6)
{
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  BaseAddress = (float *)CVPixelBufferGetBaseAddress(pixelBuffer);
  CVPixelBufferGetHeight(pixelBuffer);
  CVPixelBufferGetWidth(pixelBuffer);
  pixelBuffera = pixelBuffer;
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  uint64_t v16 = (float *)(a1 + 304);
  bzero((void *)(a1 + 304), 0x400uLL);
  if (Height && Width)
  {
    uint64_t v17 = 0;
    int v18 = 0;
    int v19 = 0;
    do
    {
      unint64_t v20 = BaseAddress;
      size_t v21 = Width;
      do
      {
        float v22 = *v20;
        if (*v20 >= 2048.0)
        {
          ++v19;
        }
        else
        {
          float v23 = *(float *)(a1 + 112);
          float v24 = *(float *)(a1 + 116);
          if (v22 >= v23 && v22 < v24)
          {
            unint64_t v26 = (unint64_t)(float)((float)((float)(v22 - v23) * 256.0) / (float)(v24 - v23));
            v16[v26] = v16[v26] + 1.0;
            float v22 = *v20;
          }
          if ((float)(a4 - v22) > 0.0) {
            ++v18;
          }
        }
        ++v20;
        --v21;
      }
      while (v21);
      ++v17;
      BaseAddress = (float *)((char *)BaseAddress + BytesPerRow);
    }
    while (v17 != Height);
  }
  else
  {
    int v19 = 0;
    int v18 = 0;
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffera, 1uLL);
  *(_DWORD *)(a1 + 1328) = 872415232;
  float v27 = 0.00000011921;
  for (uint64_t i = 304; i != 1328; i += 4)
  {
    float v27 = v27 + *(float *)(a1 + i);
    *(float *)(a1 + 1328) = v27;
  }
  float v29 = *v16 / v27;
  float *v16 = v29;
  for (uint64_t j = 308; j != 1328; j += 4)
  {
    float v29 = v29 + (float)(*(float *)(a1 + j) / *(float *)(a1 + 1328));
    *(float *)(a1 + j) = v29;
  }
  if (*(float *)(a1 + 1328) <= 0.00000011921) {
    bzero((void *)(a1 + 304), 0x400uLL);
  }
  unint64_t v31 = 0;
  float v32 = (float)(Height * Width);
  float v33 = (float)v19 / v32;
  float v34 = *(float *)(a1 + 112);
  float v35 = *(float *)(a1 + 116);
  float v36 = (float)v18 / v32;
  do
  {
    if (*(float *)(a1 + 4 * v31 + 304) > *(float *)(a1 + 180)) {
      break;
    }
    ++v31;
  }
  while (v31 != 256);
  CVPixelBufferLockBaseAddress(pixelBuffera, 1uLL);
  id v37 = (float32x4_t *)CVPixelBufferGetBaseAddress(pixelBuffera);
  size_t v38 = CVPixelBufferGetHeight(pixelBuffera);
  size_t v39 = CVPixelBufferGetWidth(pixelBuffera);
  size_t v40 = CVPixelBufferGetBytesPerRow(pixelBuffera);
  uint64_t v228 = a3;
  if (v38 && v39)
  {
    *(float *)v41.i32 = v34 + (float)((float)((float)v31 * 0.0039062) * (float)(v35 - v34));
    if (v39 >= 8)
    {
      uint64_t v52 = 0;
      int v42 = 0;
      float32x4_t v53 = (float32x4_t)vdupq_lane_s32(v41, 0);
      uint64_t v54 = v37 + 1;
      f32 = v37[2 * (v39 >> 3)].f32;
      float v44 = 0.0;
      v56.i64[0] = 0x4500000045000000;
      v56.i64[1] = 0x4500000045000000;
      v57.i64[0] = 0x8000000080000000;
      v57.i64[1] = 0x8000000080000000;
      do
      {
        int32x4_t v58 = 0uLL;
        int32x4_t v59 = (int32x4_t)v42;
        uint64_t v60 = v54;
        unint64_t v61 = v39 & 0xFFFFFFFFFFFFFFF8;
        do
        {
          float32x4_t v62 = v60[-1];
          int32x4_t v63 = (int32x4_t)vbicq_s8((int8x16_t)vcgeq_f32(v62, v53), (int8x16_t)vcgeq_f32(v62, v56));
          int32x4_t v64 = (int32x4_t)vbicq_s8((int8x16_t)vcgeq_f32(*v60, v53), (int8x16_t)vcgeq_f32(*v60, v56));
          int32x4_t v59 = vsubq_s32(v59, v63);
          int32x4_t v58 = vsubq_s32(v58, v64);
          int8x16_t v65 = vbslq_s8((int8x16_t)v63, (int8x16_t)v62, v57);
          int8x16_t v66 = vbslq_s8((int8x16_t)v64, *(int8x16_t *)v60, v57);
          float v44 = (float)((float)((float)((float)((float)((float)((float)(v44 + *(float *)v65.i32) + *(float *)&v65.i32[1])
                                                      + *(float *)&v65.i32[2])
                                              + *(float *)&v65.i32[3])
                                      + *(float *)v66.i32)
                              + *(float *)&v66.i32[1])
                      + *(float *)&v66.i32[2])
              + *(float *)&v66.i32[3];
          v60 += 2;
          v61 -= 8;
        }
        while (v61);
        int v42 = vaddvq_s32(vaddq_s32(v58, v59));
        if (v39 != (v39 & 0xFFFFFFFFFFFFFFF8))
        {
          unint64_t v67 = f32;
          size_t v68 = v39 - (v39 & 0xFFFFFFFFFFFFFFF8);
          do
          {
            float v69 = *v67++;
            float v70 = v69;
            v42 += v69 < 2048.0 && v69 >= *(float *)v41.i32;
            if (v69 >= 2048.0 || v69 < *(float *)v41.i32) {
              float v70 = -0.0;
            }
            float v44 = v44 + v70;
            --v68;
          }
          while (v68);
        }
        ++v52;
        uint64_t v54 = (float32x4_t *)((char *)v54 + v40);
        f32 = (float *)((char *)f32 + v40);
      }
      while (v52 != v38);
    }
    else
    {
      int v42 = 0;
      unint64_t v43 = &v37->f32[3];
      float v44 = 0.0;
      do
      {
        float v45 = *(v43 - 3);
        v42 += v45 < 2048.0 && v45 >= *(float *)v41.i32;
        if (v45 >= 2048.0 || v45 < *(float *)v41.i32) {
          float v45 = -0.0;
        }
        float v44 = v44 + v45;
        if (v39 != 1)
        {
          float v46 = *(v43 - 2);
          v42 += v46 < 2048.0 && v46 >= *(float *)v41.i32;
          if (v46 >= 2048.0 || v46 < *(float *)v41.i32) {
            float v46 = -0.0;
          }
          float v44 = v44 + v46;
          if (v39 != 2)
          {
            float v47 = *(v43 - 1);
            v42 += v47 < 2048.0 && v47 >= *(float *)v41.i32;
            if (v47 >= 2048.0 || v47 < *(float *)v41.i32) {
              float v47 = -0.0;
            }
            float v44 = v44 + v47;
            if (v39 != 3)
            {
              float v48 = *v43;
              v42 += *v43 < 2048.0 && *v43 >= *(float *)v41.i32;
              if (*v43 >= 2048.0 || *v43 < *(float *)v41.i32) {
                float v48 = -0.0;
              }
              float v44 = v44 + v48;
              if (v39 != 4)
              {
                float v49 = v43[1];
                v42 += v49 < 2048.0 && v49 >= *(float *)v41.i32;
                if (v49 >= 2048.0 || v49 < *(float *)v41.i32) {
                  float v49 = -0.0;
                }
                float v44 = v44 + v49;
                if (v39 != 5)
                {
                  float v50 = v43[2];
                  v42 += v50 < 2048.0 && v50 >= *(float *)v41.i32;
                  if (v50 >= 2048.0 || v50 < *(float *)v41.i32) {
                    float v50 = -0.0;
                  }
                  float v44 = v44 + v50;
                  if (v39 != 6)
                  {
                    float v51 = v43[3];
                    v42 += v51 < 2048.0 && v51 >= *(float *)v41.i32;
                    if (v51 >= 2048.0 || v51 < *(float *)v41.i32) {
                      float v51 = -0.0;
                    }
                    float v44 = v44 + v51;
                  }
                }
              }
            }
          }
        }
        unint64_t v43 = (float *)((char *)v43 + v40);
        --v38;
      }
      while (v38);
    }
    CVPixelBufferUnlockBaseAddress(pixelBuffera, 1uLL);
    if (v42)
    {
      float v71 = v44 / (float)v42;
      goto LABEL_68;
    }
  }
  else
  {
    CVPixelBufferUnlockBaseAddress(pixelBuffera, 1uLL);
  }
  float v71 = 2048.0;
LABEL_68:
  sub_1BA834168((float *)a1, a1 + 304, a6, *(float *)(a1 + 112), *(float *)(a1 + 116), a4, a5, *(float *)(a1 + 176));
  int v73 = v72;
  if (!*(unsigned char *)(a1 + 188))
  {
    float v99 = 0.0;
    float v100 = 0.0;
    uint64_t v101 = a3;
    goto LABEL_145;
  }
  CVPixelBufferLockBaseAddress(pixelBuffera, 1uLL);
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(a1 + 192), 0);
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(a1 + 200), 0);
  v74 = (float32x4_t *)CVPixelBufferGetBaseAddress(pixelBuffera);
  size_t v75 = CVPixelBufferGetHeight(pixelBuffera);
  size_t v76 = CVPixelBufferGetWidth(pixelBuffera);
  size_t v77 = CVPixelBufferGetBytesPerRow(pixelBuffera);
  v78 = (int8x16_t *)CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 192));
  src.data = v78;
  src.height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 192));
  src.width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 192));
  size_t v79 = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 192));
  src.rowBytes = v79;
  dest.data = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 200));
  dest.height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 200));
  dest.width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 200));
  dest.rowBytes = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 200));
  if (v75 && v76)
  {
    *(float *)v80.i32 = a4 + -0.6;
    unint64_t v81 = v76 & 0xFFFFFFFFFFFFFFF8;
    if (v76 <= 7)
    {
      unint64_t v82 = 0;
      uint64_t v83 = &v74->f32[3];
      uint64_t v84 = &v78->i8[3];
      size_t v85 = v75;
      do
      {
        float v86 = *(v83 - 3);
        uint64_t v87 = v86 >= *(float *)v80.i32 && v86 < 2048.0;
        *(v84 - 3) = v87;
        v82 += v87;
        if (v76 != 1)
        {
          float v88 = *(v83 - 2);
          uint64_t v89 = v88 >= *(float *)v80.i32 && (unint64_t)(v88 < 2048.0);
          *(v84 - 2) = v89;
          v82 += v89;
          if (v76 != 2)
          {
            float v90 = *(v83 - 1);
            uint64_t v91 = v90 >= *(float *)v80.i32 && (unint64_t)(v90 < 2048.0);
            *(v84 - 1) = v91;
            v82 += v91;
            if (v76 != 3)
            {
              uint64_t v92 = *v83 >= *(float *)v80.i32 && (unint64_t)(*v83 < 2048.0);
              *uint64_t v84 = v92;
              v82 += v92;
              if (v76 != 4)
              {
                float v93 = v83[1];
                uint64_t v94 = v93 >= *(float *)v80.i32 && (unint64_t)(v93 < 2048.0);
                v84[1] = v94;
                v82 += v94;
                if (v76 != 5)
                {
                  float v95 = v83[2];
                  uint64_t v96 = v95 >= *(float *)v80.i32 && (unint64_t)(v95 < 2048.0);
                  v84[2] = v96;
                  v82 += v96;
                  if (v76 != 6)
                  {
                    float v97 = v83[3];
                    uint64_t v98 = v97 >= *(float *)v80.i32 && v97 < 2048.0;
                    v84[3] = v98;
                    v82 += v98;
                  }
                }
              }
            }
          }
        }
        uint64_t v83 = (float *)((char *)v83 + v77);
        v84 += v79;
        --v85;
      }
      while (v85);
LABEL_138:
      vImageMin_Planar8(&src, &dest, 0, 0, 0, 3uLL, 3uLL, 0);
      data = (int8x16_t *)dest.data;
      if (v76 < 8)
      {
        uint64_t v174 = 0;
        unint64_t v175 = 0;
        uint64_t v101 = v228;
        v104 = pixelBuffera;
        do
        {
          v176 = data;
          size_t v177 = v76;
          do
          {
            unsigned int v178 = v176->u8[0];
            v176 = (int8x16_t *)((char *)v176 + 1);
            v175 += v178;
            --v177;
          }
          while (v177);
          ++v174;
          data = (int8x16_t *)((char *)data + dest.rowBytes);
        }
        while (v174 != v75);
LABEL_143:
        float v102 = (float)v82;
        float v103 = (float)v175;
        goto LABEL_144;
      }
      uint64_t v206 = 0;
      unint64_t v175 = 0;
      uint64_t v101 = v228;
      v104 = pixelBuffera;
      while (v76 >= 0x10)
      {
        int64x2_t v214 = 0uLL;
        int64x2_t v215 = (int64x2_t)v175;
        v216 = data;
        unint64_t v217 = v76 & 0xFFFFFFFFFFFFFFF0;
        int64x2_t v218 = 0uLL;
        int64x2_t v219 = 0uLL;
        int64x2_t v220 = 0uLL;
        int64x2_t v172 = 0uLL;
        int64x2_t v221 = 0uLL;
        int64x2_t v222 = 0uLL;
        do
        {
          int8x16_t v223 = *v216++;
          uint32x4_t v224 = (uint32x4_t)vqtbl1q_s8(v223, (int8x16_t)xmmword_1BA86C160);
          uint32x4_t v225 = (uint32x4_t)vqtbl1q_s8(v223, (int8x16_t)xmmword_1BA86C170);
          uint32x4_t v226 = (uint32x4_t)vqtbl1q_s8(v223, (int8x16_t)xmmword_1BA86C180);
          uint32x4_t v227 = (uint32x4_t)vqtbl1q_s8(v223, (int8x16_t)xmmword_1BA86C190);
          int64x2_t v214 = (int64x2_t)vaddw_high_u32((uint64x2_t)v214, v225);
          int64x2_t v219 = (int64x2_t)vaddw_high_u32((uint64x2_t)v219, v224);
          int64x2_t v218 = (int64x2_t)vaddw_u32((uint64x2_t)v218, *(uint32x2_t *)v224.i8);
          int64x2_t v215 = (int64x2_t)vaddw_u32((uint64x2_t)v215, *(uint32x2_t *)v225.i8);
          int64x2_t v220 = (int64x2_t)vaddw_u32((uint64x2_t)v220, *(uint32x2_t *)v226.i8);
          int64x2_t v172 = (int64x2_t)vaddw_high_u32((uint64x2_t)v172, v226);
          int64x2_t v221 = (int64x2_t)vaddw_u32((uint64x2_t)v221, *(uint32x2_t *)v227.i8);
          int64x2_t v222 = (int64x2_t)vaddw_high_u32((uint64x2_t)v222, v227);
          v217 -= 16;
        }
        while (v217);
        unint64_t v175 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v215, v220), vaddq_s64(v218, v221)), vaddq_s64(vaddq_s64(v214, v172), vaddq_s64(v219, v222))));
        if (v76 == (v76 & 0xFFFFFFFFFFFFFFF0)) {
          goto LABEL_170;
        }
        unint64_t v207 = v76 & 0xFFFFFFFFFFFFFFF0;
        unint64_t v213 = v76 & 0xFFFFFFFFFFFFFFF0;
        if ((v76 & 8) != 0) {
          goto LABEL_173;
        }
        do
LABEL_181:
          v175 += data->u8[v213++];
        while (v76 != v213);
LABEL_170:
        ++v206;
        data = (int8x16_t *)((char *)data + dest.rowBytes);
        if (v206 == v75) {
          goto LABEL_143;
        }
      }
      unint64_t v207 = 0;
LABEL_173:
      int64x2_t v208 = 0uLL;
      int64x2_t v209 = (int64x2_t)v175;
      int64x2_t v210 = 0uLL;
      int64x2_t v211 = 0uLL;
      do
      {
        v172.i64[0] = *(uint64_t *)((char *)data->i64 + v207);
        uint32x4_t v212 = (uint32x4_t)vqtbl1q_s8((int8x16_t)v172, (int8x16_t)xmmword_1BA86C160);
        int64x2_t v172 = (int64x2_t)vqtbl1q_s8((int8x16_t)v172, (int8x16_t)xmmword_1BA86C170);
        int64x2_t v211 = (int64x2_t)vaddw_high_u32((uint64x2_t)v211, v212);
        int64x2_t v208 = (int64x2_t)vaddw_high_u32((uint64x2_t)v208, (uint32x4_t)v172);
        int64x2_t v210 = (int64x2_t)vaddw_u32((uint64x2_t)v210, *(uint32x2_t *)v212.i8);
        int64x2_t v209 = (int64x2_t)vaddw_u32((uint64x2_t)v209, *(uint32x2_t *)v172.i8);
        v207 += 8;
      }
      while (v81 != v207);
      unint64_t v175 = vaddvq_s64(vaddq_s64(vaddq_s64(v209, v210), vaddq_s64(v208, v211)));
      unint64_t v213 = v76 & 0xFFFFFFFFFFFFFFF8;
      if (v76 == v81) {
        goto LABEL_170;
      }
      goto LABEL_181;
    }
    uint64_t v105 = 4 * v76;
    float32x4_t v106 = (float32x4_t)vdupq_lane_s32(v80, 0);
    if (v76 < 0x10)
    {
      uint64_t v107 = 0;
      unint64_t v82 = 0;
      v108.i64[0] = 0x4500000045000000;
      v108.i64[1] = 0x4500000045000000;
      int8x16_t v109 = (int8x16_t)vdupq_n_s64(1uLL);
      int v110 = v74;
      v111 = v78;
      while (1)
      {
        float v112 = (float32x4_t *)((char *)v74 + v107 * v77);
        BOOL v113 = (int8x8_t *)&v78->i8[v79 * v107];
        if (v113 < (int8x8_t *)((char *)v74 + v105 + v107 * v77) && v112 < (float32x4_t *)&v78->i8[v76 + v79 * v107]) {
          break;
        }
        int8x8_t v115 = vmovn_s16((int16x8_t)vbicq_s8(vmvnq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgeq_f32(*v112, v108), (int16x8_t)vcgeq_f32(v112[1], v108))), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v106, *v112), (int16x8_t)vcgtq_f32(v106, v112[1]))));
        *BOOL v113 = vand_s8(v115, (int8x8_t)0x101010101010101);
        v116.i64[0] = v115.u8[4];
        v116.i64[1] = v115.u8[5];
        int64x2_t v117 = (int64x2_t)vandq_s8(v116, v109);
        v116.i64[0] = v115.u8[6];
        v116.i64[1] = v115.u8[7];
        int64x2_t v118 = (int64x2_t)vandq_s8(v116, v109);
        v116.i64[0] = v115.u8[2];
        v116.i64[1] = v115.u8[3];
        int64x2_t v119 = (int64x2_t)vandq_s8(v116, v109);
        v116.i64[0] = v115.u8[0];
        v116.i64[1] = v115.u8[1];
        unint64_t v82 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64((int64x2_t)v82, (int64x2_t)vandq_s8(v116, v109)), v117), vaddq_s64(v119, v118)));
        unint64_t v120 = v76 & 0xFFFFFFFFFFFFFFF8;
        if (v76 != v81) {
          goto LABEL_113;
        }
LABEL_106:
        ++v107;
        v111 = (int8x16_t *)((char *)v111 + v79);
        int v110 = (float32x4_t *)((char *)v110 + v77);
        if (v107 == v75) {
          goto LABEL_138;
        }
      }
      unint64_t v120 = 0;
LABEL_113:
      size_t v121 = v76 - v120;
      size_t v122 = &v111->i8[v120];
      size_t v123 = &v110->f32[v120];
      do
      {
        float v124 = *v123++;
        LODWORD(v125) = v124 < 2048.0;
        if (v124 >= *(float *)v80.i32) {
          uint64_t v125 = v125;
        }
        else {
          uint64_t v125 = 0;
        }
        *v122++ = v125;
        v82 += v125;
        --v121;
      }
      while (v121);
      goto LABEL_106;
    }
    uint64_t v126 = 0;
    unint64_t v82 = 0;
    v127.i64[0] = 0x4500000045000000;
    v127.i64[1] = 0x4500000045000000;
    v128.i64[0] = 0x101010101010101;
    v128.i64[1] = 0x101010101010101;
    int8x16_t v129 = (int8x16_t)vdupq_n_s64(1uLL);
    v130 = v74;
    uint64_t v131 = v78;
    while (&v78->i8[v79 * v126] >= (char *)v74 + v105 + v126 * v77
         || (char *)v74 + v126 * v77 >= &v78->i8[v76 + v79 * v126])
    {
      int64x2_t v133 = 0uLL;
      int64x2_t v134 = (int64x2_t)v82;
      v135 = v130;
      uint64_t v136 = v131;
      unint64_t v137 = v76 & 0xFFFFFFFFFFFFFFF0;
      int64x2_t v138 = 0uLL;
      int64x2_t v139 = 0uLL;
      int64x2_t v140 = 0uLL;
      int64x2_t v141 = 0uLL;
      int64x2_t v142 = 0uLL;
      int64x2_t v143 = 0uLL;
      do
      {
        int8x16_t v144 = vbicq_s8(vmvnq_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgeq_f32(*v135, v127), (int16x8_t)vcgeq_f32(v135[1], v127)), (int8x16_t)vuzp1q_s16((int16x8_t)vcgeq_f32(v135[2], v127), (int16x8_t)vcgeq_f32(v135[3], v127)))), vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v106, *v135), (int16x8_t)vcgtq_f32(v106, v135[1])), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v106, v135[2]), (int16x8_t)vcgtq_f32(v106, v135[3]))));
        v145.i64[0] = v144.u8[0];
        v145.i64[1] = v144.u8[1];
        int64x2_t v146 = (int64x2_t)vandq_s8(v145, v129);
        v145.i64[0] = v144.u8[2];
        v145.i64[1] = v144.u8[3];
        int64x2_t v147 = (int64x2_t)vandq_s8(v145, v129);
        v145.i64[0] = v144.u8[4];
        v145.i64[1] = v144.u8[5];
        int64x2_t v148 = (int64x2_t)vandq_s8(v145, v129);
        v145.i64[0] = v144.u8[6];
        v145.i64[1] = v144.u8[7];
        int64x2_t v149 = (int64x2_t)vandq_s8(v145, v129);
        v145.i64[0] = v144.u8[8];
        v145.i64[1] = v144.u8[9];
        int64x2_t v150 = (int64x2_t)vandq_s8(v145, v129);
        v145.i64[0] = v144.u8[10];
        v145.i64[1] = v144.u8[11];
        int64x2_t v151 = (int64x2_t)vandq_s8(v145, v129);
        v145.i64[0] = v144.u8[12];
        v145.i64[1] = v144.u8[13];
        int64x2_t v152 = (int64x2_t)vandq_s8(v145, v129);
        v145.i64[0] = v144.u8[14];
        v145.i64[1] = v144.u8[15];
        int64x2_t v143 = vaddq_s64(v143, (int64x2_t)vandq_s8(v145, v129));
        int64x2_t v142 = vaddq_s64(v142, v152);
        *v136++ = vandq_s8(v144, v128);
        int64x2_t v141 = vaddq_s64(v141, v151);
        int64x2_t v140 = vaddq_s64(v140, v150);
        int64x2_t v139 = vaddq_s64(v139, v149);
        int64x2_t v138 = vaddq_s64(v138, v148);
        int64x2_t v133 = vaddq_s64(v133, v147);
        int64x2_t v134 = vaddq_s64(v134, v146);
        v135 += 4;
        v137 -= 16;
      }
      while (v137);
      uint64_t v153 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v134, v140), vaddq_s64(v138, v142)), vaddq_s64(vaddq_s64(v133, v141), vaddq_s64(v139, v143))));
      unint64_t v82 = v153;
      if (v76 != (v76 & 0xFFFFFFFFFFFFFFF0))
      {
        unint64_t k = v76 & 0xFFFFFFFFFFFFFFF0;
        if ((v76 & 8) == 0) {
          goto LABEL_133;
        }
        int64x2_t v154 = 0uLL;
        int64x2_t v155 = (int64x2_t)(unint64_t)v153;
        unint64_t v156 = v105 & 0xFFFFFFFFFFFFFFC0;
        unint64_t v157 = v76 & 0xFFFFFFFFFFFFFFF0;
        int64x2_t v158 = 0uLL;
        int64x2_t v159 = 0uLL;
        do
        {
          int8x8_t v160 = vmovn_s16((int16x8_t)vbicq_s8(vmvnq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgeq_f32(*(float32x4_t *)((char *)v130 + v156), v127), (int16x8_t)vcgeq_f32(*(float32x4_t *)((char *)v130 + v156 + 16), v127))), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v106, *(float32x4_t *)((char *)v130 + v156)), (int16x8_t)vcgtq_f32(v106, *(float32x4_t *)((char *)v130 + v156 + 16)))));
          *(int8x8_t *)&v131->i8[v157] = vand_s8(v160, (int8x8_t)0x101010101010101);
          int8x16_t v161 = (int8x16_t)vdupq_n_s64(1uLL);
          v162.i64[0] = v160.u8[0];
          v162.i64[1] = v160.u8[1];
          int8x16_t v163 = v162;
          v162.i64[0] = v160.u8[2];
          v162.i64[1] = v160.u8[3];
          int8x16_t v164 = v162;
          v162.i64[0] = v160.u8[4];
          v162.i64[1] = v160.u8[5];
          unsigned int v165 = v160.u8[6];
          unsigned int v166 = v160.u8[7];
          int64x2_t v167 = (int64x2_t)vandq_s8(v164, v161);
          int64x2_t v168 = (int64x2_t)vandq_s8(v162, v161);
          v162.i64[0] = v165;
          v162.i64[1] = v166;
          int64x2_t v159 = vaddq_s64(v159, (int64x2_t)vandq_s8(v162, v161));
          int64x2_t v158 = vaddq_s64(v158, v168);
          int64x2_t v154 = vaddq_s64(v154, v167);
          int64x2_t v155 = vaddq_s64(v155, (int64x2_t)vandq_s8(v163, v161));
          v157 += 8;
          v156 += 32;
        }
        while (v81 != v157);
        unint64_t v82 = vaddvq_s64(vaddq_s64(vaddq_s64(v155, v158), vaddq_s64(v154, v159)));
        unint64_t k = v76 & 0xFFFFFFFFFFFFFFF8;
        if (v76 != v81) {
          goto LABEL_133;
        }
      }
LABEL_120:
      ++v126;
      uint64_t v131 = (int8x16_t *)((char *)v131 + v79);
      v130 = (float32x4_t *)((char *)v130 + v77);
      if (v126 == v75) {
        goto LABEL_138;
      }
    }
    for (unint64_t k = 0; k != v76; ++k)
    {
LABEL_133:
      float v170 = v130->f32[k];
      uint64_t v171 = v170 >= *(float *)v80.i32 && v170 < 2048.0;
      v131->i8[k] = v171;
      v82 += v171;
    }
    goto LABEL_120;
  }
  vImageMin_Planar8(&src, &dest, 0, 0, 0, 3uLL, 3uLL, 0);
  float v102 = 0.0;
  float v103 = 0.0;
  uint64_t v101 = v228;
  v104 = pixelBuffera;
LABEL_144:
  float v179 = (float)v75 * (float)v76;
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 200), 0);
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 192), 0);
  CVPixelBufferUnlockBaseAddress(v104, 1uLL);
  float v100 = v103 / v179;
  float v99 = v102 / v179;
LABEL_145:
  if (*(int *)(a1 + 184) <= 0)
  {
    *(float *)(a1 + 8) = v36;
    *(float *)(a1 + 16) = v33;
  }
  else
  {
    *(float *)(a1 + 8) = (float)(v36 * *(float *)(a1 + 120))
                       + (float)((float)(1.0 - *(float *)(a1 + 120)) * *(float *)(a1 + 8));
    *(float *)(a1 + 16) = *(float *)(a1 + 16) + (float)(*(float *)(a1 + 1352) * (float)(v33 - *(float *)(a1 + 16)));
  }
  uint64_t v180 = *(int *)(a1 + 236);
  uint64_t v181 = *(void *)(a1 + 208);
  *(_DWORD *)(v181 + 4 * v180) = *(_DWORD *)v101;
  unint64_t v182 = v180 + 1;
  unint64_t v183 = (*(void *)(a1 + 216) - v181) >> 2;
  unint64_t v184 = v182 % v183;
  *(_DWORD *)(a1 + 236) = v184;
  int v185 = *(_DWORD *)(a1 + 232);
  if (v185 == v184) {
    int v185 = ((int)v184 + 1) % v183;
  }
  *(_DWORD *)(a1 + 232) = v185;
  if (v185 == v184)
  {
    *(void *)(a1 + 240) = 0;
  }
  else
  {
    float v186 = 0.0;
    int v187 = -1;
    float v188 = 0.0;
    do
    {
      int v189 = v187 + 2;
      float v190 = *(float *)(v181 + 4 * v185);
      float v191 = v190 - v188;
      float v188 = v188 + (float)((float)(v190 - v188) / (float)(v187 + 2));
      float v186 = v186 + (float)(v191 * (float)(v190 - v188));
      int v185 = (v185 + 1) % v183;
      ++v187;
    }
    while (v185 != v184);
    *(_DWORD *)(a1 + 240) = v189;
    *(float *)(a1 + 244) = v188;
    if (v187) {
      *(float *)(a1 + 248) = v186 / (float)v187;
    }
  }
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a1 + 248);
  uint64_t v192 = *(int *)(a1 + 284);
  uint64_t v193 = *(void *)(a1 + 256);
  *(_DWORD *)(v193 + 4 * v192) = *(_DWORD *)(a1 + 16);
  unint64_t v194 = v192 + 1;
  unint64_t v195 = (*(void *)(a1 + 264) - v193) >> 2;
  unint64_t v196 = v194 % v195;
  *(_DWORD *)(a1 + 284) = v196;
  int v197 = *(_DWORD *)(a1 + 280);
  if (v197 == v196) {
    int v197 = ((int)v196 + 1) % v195;
  }
  *(_DWORD *)(a1 + 280) = v197;
  if (v197 == v196)
  {
    *(void *)(a1 + 288) = 0;
  }
  else
  {
    float v198 = 0.0;
    int v199 = -1;
    float v200 = 0.0;
    do
    {
      int v201 = v199 + 2;
      float v202 = *(float *)(v193 + 4 * v197);
      float v203 = v202 - v200;
      float v200 = v200 + (float)((float)(v202 - v200) / (float)(v199 + 2));
      float v198 = v198 + (float)(v203 * (float)(v202 - v200));
      int v197 = (v197 + 1) % v195;
      ++v199;
    }
    while (v197 != v196);
    *(_DWORD *)(a1 + 288) = v201;
    *(float *)(a1 + 292) = v200;
    if (v199) {
      *(float *)(a1 + 296) = v198 / (float)v199;
    }
  }
  int v204 = *(_DWORD *)(a1 + 296);
  *(_DWORD *)(a1 + 32) = v73;
  *(float *)(a1 + 36) = v71;
  *(_DWORD *)(a1 + 20) = v204;
  *(float *)(a1 + 24) = v100;
  *(float *)(a1 + 28) = v99;
  *(_DWORD *)(a1 + 12) = v19;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)v101;
  if (a1 + 48 != v101 + 8) {
    sub_1BA825694((void *)(a1 + 48), *(char **)(v101 + 8), *(char **)(v101 + 16), (uint64_t)(*(void *)(v101 + 16) - *(void *)(v101 + 8)) >> 2);
  }
  if (a1 + 72 != v101 + 32) {
    sub_1BA825694((void *)(a1 + 72), *(char **)(v101 + 32), *(char **)(v101 + 40), (uint64_t)(*(void *)(v101 + 40) - *(void *)(v101 + 32)) >> 2);
  }
  ++*(_DWORD *)(a1 + 184);
  return a1;
}

void sub_1BA834168(float *a1, uint64_t a2, float a3, float a4, float a5, float a6, float a7, float a8)
{
  float v8 = a5 - a4;
  if ((int)(float)((float)((float)(a6 - a4) * 256.0) / v8) <= 0xFF)
  {
    LODWORD(v9) = (int)(float)((float)((float)(fminf(a7, 0.25) - a4) * 256.0) / v8);
    if (v9 <= 0xFF)
    {
      if (a6 > -0.00000011921 && a6 < 0.0) {
        float v11 = -0.00000011921;
      }
      else {
        float v11 = a6;
      }
      if (a6 >= 0.00000011921 || a6 < 0.0) {
        float v13 = v11;
      }
      else {
        float v13 = 0.00000011921;
      }
      float v14 = (float)(1.0 / v13) + a8;
      BOOL v15 = v14 > -0.00000011921 && v14 < 0.0;
      float v16 = 1.0 / v14;
      if (v15) {
        float v16 = -8388600.0;
      }
      if (v14 < 0.00000011921 && v14 >= 0.0) {
        float v16 = 8388600.0;
      }
      uint64_t v18 = (int)(float)((float)((float)(v13 - a4) * 256.0) / v8);
      int v19 = (int)(float)((float)((float)(v16 - a4) * 256.0) / v8);
      uint64_t v9 = (int)v9 <= v19 ? v19 : v9;
      if ((v18 & 0x80000000) == 0
        && v18 <= 0xFF
        && v9 <= 0xFF
        && v9 < v18)
      {
        uint64_t v22 = -(uint64_t)(int)(float)((float)(a3 * 256.0) / v8);
        float v23 = 1.0;
        do
        {
          if (v22 + v18 >= 0) {
            float v24 = *(float *)(a2 + 4 * (v22 + v18));
          }
          else {
            float v24 = 0.0;
          }
          float v23 = fminf(fminf(fmaxf(*(float *)(a2 + 4 * v18) - v24, 0.00000011921), 1.0), v23);
        }
        while (v18-- > v9);
        float v26 = powf(1.0 - v23, 30.0);
        float v27 = a1[336];
        if (v27 >= 0.0)
        {
          float v28 = (float)(v26 * a1[334]) + (float)((float)(1.0 - a1[334]) * v27);
          a1[336] = v28;
          float v29 = a1[337];
          if (vabds_f32(v29, v28) <= a1[335]) {
            return;
          }
          float v26 = (float)(v28 * a1[333]) + (float)((float)(1.0 - a1[333]) * v29);
        }
        else
        {
          a1[336] = v26;
        }
        a1[337] = v26;
      }
    }
  }
}

uint64_t sub_1BA83434C(uint64_t a1, CVPixelBufferRef pixelBuffer, uint64_t a3, float a4, float a5, float a6)
{
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  BaseAddress = (short float *)CVPixelBufferGetBaseAddress(pixelBuffer);
  CVPixelBufferGetHeight(pixelBuffer);
  CVPixelBufferGetWidth(pixelBuffer);
  pixelBuffera = pixelBuffer;
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  float v16 = (float *)(a1 + 304);
  bzero((void *)(a1 + 304), 0x400uLL);
  if (Height && Width)
  {
    uint64_t v17 = 0;
    int v18 = 0;
    int v19 = 0;
    do
    {
      unint64_t v20 = BaseAddress;
      size_t v21 = Width;
      do
      {
        _H5 = *v20;
        if (*v20 >= COERCE_SHORT_FLOAT(26624))
        {
          ++v19;
        }
        else
        {
          __asm { FCVT            S2, H5 }
          float v27 = *(float *)(a1 + 112);
          float v28 = *(float *)(a1 + 116);
          if (v27 <= _S2 && v28 > _S2)
          {
            unint64_t v30 = (unint64_t)(float)((float)((float)(_S2 - v27) * 256.0) / (float)(v28 - v27));
            v16[v30] = v16[v30] + 1.0;
          }
          if ((float)(a4 - _S2) > 0.0) {
            ++v18;
          }
        }
        ++v20;
        --v21;
      }
      while (v21);
      ++v17;
      BaseAddress = (short float *)((char *)BaseAddress + BytesPerRow);
    }
    while (v17 != Height);
  }
  else
  {
    int v19 = 0;
    int v18 = 0;
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffera, 1uLL);
  *(_DWORD *)(a1 + 1328) = 872415232;
  float v31 = 0.00000011921;
  for (uint64_t i = 304; i != 1328; i += 4)
  {
    float v31 = v31 + *(float *)(a1 + i);
    *(float *)(a1 + 1328) = v31;
  }
  float v33 = *v16 / v31;
  float *v16 = v33;
  for (uint64_t j = 308; j != 1328; j += 4)
  {
    float v33 = v33 + (float)(*(float *)(a1 + j) / *(float *)(a1 + 1328));
    *(float *)(a1 + j) = v33;
  }
  if (*(float *)(a1 + 1328) <= 0.00000011921) {
    bzero((void *)(a1 + 304), 0x400uLL);
  }
  unint64_t v35 = 0;
  float v36 = (float)(Height * Width);
  float v37 = (float)v19 / v36;
  float v38 = *(float *)(a1 + 112);
  float v39 = *(float *)(a1 + 116);
  float v40 = (float)v18 / v36;
  do
  {
    if (*(float *)(a1 + 4 * v35 + 304) > *(float *)(a1 + 180)) {
      break;
    }
    ++v35;
  }
  while (v35 != 256);
  CVPixelBufferLockBaseAddress(pixelBuffera, 1uLL);
  int32x2_t v41 = (char *)CVPixelBufferGetBaseAddress(pixelBuffera);
  size_t v42 = CVPixelBufferGetHeight(pixelBuffera);
  size_t v43 = CVPixelBufferGetWidth(pixelBuffera);
  size_t v44 = CVPixelBufferGetBytesPerRow(pixelBuffera);
  uint64_t v265 = a3;
  if (v42 && v43)
  {
    *(float *)v45.i32 = v38 + (float)((float)((float)v35 * 0.0039062) * (float)(v39 - v38));
    if (v43 >= 8)
    {
      uint64_t v70 = 0;
      int v46 = 0;
      float32x4_t v71 = (float32x4_t)vdupq_lane_s32(v45, 0);
      int v72 = (float16x4_t *)(v41 + 8);
      int v73 = (short float *)&v41[16 * (v43 >> 3)];
      float v48 = 0.0;
      v74.i64[0] = 0x100000001;
      v74.i64[1] = 0x100000001;
      v75.i64[0] = 0x8000000080000000;
      v75.i64[1] = 0x8000000080000000;
      do
      {
        int32x4_t v76 = 0uLL;
        int32x4_t v77 = (int32x4_t)v46;
        v78 = v72;
        unint64_t v79 = v43 & 0xFFFFFFFFFFFFFFF8;
        do
        {
          float16x4_t v80 = v78[-1];
          float32x4_t v81 = vcvtq_f32_f16(v80);
          float32x4_t v82 = vcvtq_f32_f16(*v78);
          int8x8_t v83 = (int8x8_t)vcge_f16(v80, (float16x4_t)0x6800680068006800);
          int8x8_t v84 = (int8x8_t)vcge_f16(*v78, (float16x4_t)0x6800680068006800);
          int32x4_t v85 = vcgeq_f32(v81, v71);
          int32x4_t v86 = vcgeq_f32(v82, v71);
          int32x4_t v77 = vaddq_s32(v77, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16((uint16x4_t)vbic_s8((int8x8_t)vmovn_s32(v85), v83)), v74));
          int32x4_t v76 = vaddq_s32(v76, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16((uint16x4_t)vbic_s8((int8x8_t)vmovn_s32(v86), v84)), v74));
          int8x16_t v87 = vbslq_s8(vandq_s8((int8x16_t)vmovl_s16((int16x4_t)vmvn_s8(v83)), (int8x16_t)v85), (int8x16_t)v81, v75);
          int8x16_t v88 = vbslq_s8(vandq_s8((int8x16_t)vmovl_s16((int16x4_t)vmvn_s8(v84)), (int8x16_t)v86), (int8x16_t)v82, v75);
          float v48 = (float)((float)((float)((float)((float)((float)((float)(v48 + *(float *)v87.i32) + *(float *)&v87.i32[1])
                                                      + *(float *)&v87.i32[2])
                                              + *(float *)&v87.i32[3])
                                      + *(float *)v88.i32)
                              + *(float *)&v88.i32[1])
                      + *(float *)&v88.i32[2])
              + *(float *)&v88.i32[3];
          v78 += 2;
          v79 -= 8;
        }
        while (v79);
        int v46 = vaddvq_s32(vaddq_s32(v76, v77));
        if (v43 != (v43 & 0xFFFFFFFFFFFFFFF8))
        {
          uint64_t v89 = v73;
          size_t v90 = v43 - (v43 & 0xFFFFFFFFFFFFFFF8);
          do
          {
            short float v91 = *v89++;
            _H7 = v91;
            __asm { FCVT            S16, H7 }
            v46 += v91 < COERCE_SHORT_FLOAT(26624) && *(float *)v45.i32 <= _S16;
            if (v91 < COERCE_SHORT_FLOAT(26624) && *(float *)v45.i32 <= _S16) {
              float v94 = _S16;
            }
            else {
              float v94 = -0.0;
            }
            float v48 = v48 + v94;
            --v90;
          }
          while (v90);
        }
        ++v70;
        int v72 = (float16x4_t *)((char *)v72 + v44);
        int v73 = (short float *)((char *)v73 + v44);
      }
      while (v70 != v42);
    }
    else
    {
      int v46 = 0;
      float v47 = (short float *)(v41 + 6);
      float v48 = 0.0;
      do
      {
        _H3 = *(v47 - 3);
        __asm { FCVT            S4, H3 }
        v46 += _H3 < COERCE_SHORT_FLOAT(26624) && *(float *)v45.i32 <= _S4;
        if (_H3 < COERCE_SHORT_FLOAT(26624) && *(float *)v45.i32 <= _S4) {
          float v51 = _S4;
        }
        else {
          float v51 = -0.0;
        }
        float v48 = v48 + v51;
        if (v43 != 1)
        {
          _H3 = *(v47 - 2);
          __asm { FCVT            S4, H3 }
          v46 += _H3 < COERCE_SHORT_FLOAT(26624) && *(float *)v45.i32 <= _S4;
          float v54 = _H3 < COERCE_SHORT_FLOAT(26624) && *(float *)v45.i32 <= _S4 ? _S4 : -0.0;
          float v48 = v48 + v54;
          if (v43 != 2)
          {
            _H3 = *(v47 - 1);
            __asm { FCVT            S4, H3 }
            v46 += _H3 < COERCE_SHORT_FLOAT(26624) && *(float *)v45.i32 <= _S4;
            float v57 = _H3 < COERCE_SHORT_FLOAT(26624) && *(float *)v45.i32 <= _S4 ? _S4 : -0.0;
            float v48 = v48 + v57;
            if (v43 != 3)
            {
              _H3 = *v47;
              __asm { FCVT            S4, H3 }
              v46 += *v47 < COERCE_SHORT_FLOAT(26624) && *(float *)v45.i32 <= _S4;
              float v60 = *v47 < COERCE_SHORT_FLOAT(26624) && *(float *)v45.i32 <= _S4 ? _S4 : -0.0;
              float v48 = v48 + v60;
              if (v43 != 4)
              {
                _H3 = v47[1];
                __asm { FCVT            S4, H3 }
                v46 += _H3 < COERCE_SHORT_FLOAT(26624) && *(float *)v45.i32 <= _S4;
                float v63 = _H3 < COERCE_SHORT_FLOAT(26624) && *(float *)v45.i32 <= _S4 ? _S4 : -0.0;
                float v48 = v48 + v63;
                if (v43 != 5)
                {
                  _H3 = v47[2];
                  __asm { FCVT            S4, H3 }
                  v46 += _H3 < COERCE_SHORT_FLOAT(26624) && *(float *)v45.i32 <= _S4;
                  float v66 = _H3 < COERCE_SHORT_FLOAT(26624) && *(float *)v45.i32 <= _S4 ? _S4 : -0.0;
                  float v48 = v48 + v66;
                  if (v43 != 6)
                  {
                    _H3 = v47[3];
                    __asm { FCVT            S4, H3 }
                    v46 += _H3 < COERCE_SHORT_FLOAT(26624) && *(float *)v45.i32 <= _S4;
                    if (_H3 < COERCE_SHORT_FLOAT(26624) && *(float *)v45.i32 <= _S4) {
                      float v69 = _S4;
                    }
                    else {
                      float v69 = -0.0;
                    }
                    float v48 = v48 + v69;
                  }
                }
              }
            }
          }
        }
        float v47 = (short float *)((char *)v47 + v44);
        --v42;
      }
      while (v42);
    }
    CVPixelBufferUnlockBaseAddress(pixelBuffera, 1uLL);
    if (v46)
    {
      float v95 = v48 / (float)v46;
      goto LABEL_75;
    }
  }
  else
  {
    CVPixelBufferUnlockBaseAddress(pixelBuffera, 1uLL);
  }
  float v95 = 2048.0;
LABEL_75:
  sub_1BA834168((float *)a1, a1 + 304, a6, *(float *)(a1 + 112), *(float *)(a1 + 116), a4, a5, *(float *)(a1 + 176));
  int v97 = v96;
  if (!*(unsigned char *)(a1 + 188))
  {
    float v131 = 0.0;
    float v132 = 0.0;
    uint64_t v133 = a3;
    goto LABEL_152;
  }
  CVPixelBufferLockBaseAddress(pixelBuffera, 1uLL);
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(a1 + 192), 0);
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(a1 + 200), 0);
  uint64_t v98 = (char *)CVPixelBufferGetBaseAddress(pixelBuffera);
  size_t v99 = CVPixelBufferGetHeight(pixelBuffera);
  size_t v100 = CVPixelBufferGetWidth(pixelBuffera);
  size_t v101 = CVPixelBufferGetBytesPerRow(pixelBuffera);
  float v102 = (int8x16_t *)CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 192));
  src.data = v102;
  src.height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 192));
  src.width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 192));
  size_t v103 = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 192));
  src.rowBytes = v103;
  dest.data = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 200));
  dest.height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 200));
  dest.width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 200));
  dest.rowBytes = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 200));
  if (v99 && v100)
  {
    *(float *)v104.i32 = a4 + -0.6;
    unint64_t v105 = v100 & 0xFFFFFFFFFFFFFFF8;
    if (v100 <= 7)
    {
      unint64_t v106 = 0;
      uint64_t v107 = (short float *)(v98 + 6);
      float32x4_t v108 = &v102->i8[3];
      size_t v109 = v99;
      do
      {
        _H2 = *(v107 - 3);
        __asm { FCVT            S3, H2 }
        uint64_t v112 = *(float *)v104.i32 <= _S3 && _H2 < COERCE_SHORT_FLOAT(26624);
        *(v108 - 3) = v112;
        v106 += v112;
        if (v100 != 1)
        {
          _H2 = *(v107 - 2);
          __asm { FCVT            S3, H2 }
          uint64_t v115 = *(float *)v104.i32 <= _S3 && (unint64_t)(_H2 < COERCE_SHORT_FLOAT(26624));
          *(v108 - 2) = v115;
          v106 += v115;
          if (v100 != 2)
          {
            _H2 = *(v107 - 1);
            __asm { FCVT            S3, H2 }
            uint64_t v118 = *(float *)v104.i32 <= _S3 && (unint64_t)(_H2 < COERCE_SHORT_FLOAT(26624));
            *(v108 - 1) = v118;
            v106 += v118;
            if (v100 != 3)
            {
              _H2 = *v107;
              __asm { FCVT            S3, H2 }
              uint64_t v121 = *(float *)v104.i32 <= _S3 && (unint64_t)(*v107 < COERCE_SHORT_FLOAT(26624));
              *float32x4_t v108 = v121;
              v106 += v121;
              if (v100 != 4)
              {
                _H2 = v107[1];
                __asm { FCVT            S3, H2 }
                uint64_t v124 = *(float *)v104.i32 <= _S3 && (unint64_t)(_H2 < COERCE_SHORT_FLOAT(26624));
                v108[1] = v124;
                v106 += v124;
                if (v100 != 5)
                {
                  _H2 = v107[2];
                  __asm { FCVT            S3, H2 }
                  uint64_t v127 = *(float *)v104.i32 <= _S3 && (unint64_t)(_H2 < COERCE_SHORT_FLOAT(26624));
                  v108[2] = v127;
                  v106 += v127;
                  if (v100 != 6)
                  {
                    _H2 = v107[3];
                    __asm { FCVT            S3, H2 }
                    uint64_t v130 = *(float *)v104.i32 <= _S3 && _H2 < COERCE_SHORT_FLOAT(26624);
                    v108[3] = v130;
                    v106 += v130;
                  }
                }
              }
            }
          }
        }
        uint64_t v107 = (short float *)((char *)v107 + v101);
        v108 += v103;
        --v109;
      }
      while (v109);
LABEL_145:
      vImageMin_Planar8(&src, &dest, 0, 0, 0, 3uLL, 3uLL, 0);
      data = (int8x16_t *)dest.data;
      if (v100 < 8)
      {
        uint64_t v211 = 0;
        unint64_t v212 = 0;
        uint64_t v133 = v265;
        uint64_t v136 = pixelBuffera;
        do
        {
          unint64_t v213 = data;
          size_t v214 = v100;
          do
          {
            unsigned int v215 = v213->u8[0];
            unint64_t v213 = (int8x16_t *)((char *)v213 + 1);
            v212 += v215;
            --v214;
          }
          while (v214);
          ++v211;
          data = (int8x16_t *)((char *)data + dest.rowBytes);
        }
        while (v211 != v99);
LABEL_150:
        float v134 = (float)v106;
        float v135 = (float)v212;
        goto LABEL_151;
      }
      uint64_t v243 = 0;
      unint64_t v212 = 0;
      uint64_t v133 = v265;
      uint64_t v136 = pixelBuffera;
      while (v100 >= 0x10)
      {
        int64x2_t v251 = 0uLL;
        int64x2_t v252 = (int64x2_t)v212;
        v253 = data;
        unint64_t v254 = v100 & 0xFFFFFFFFFFFFFFF0;
        int64x2_t v255 = 0uLL;
        int64x2_t v256 = 0uLL;
        int64x2_t v257 = 0uLL;
        int64x2_t v209 = 0uLL;
        int64x2_t v258 = 0uLL;
        int64x2_t v259 = 0uLL;
        do
        {
          int8x16_t v260 = *v253++;
          uint32x4_t v261 = (uint32x4_t)vqtbl1q_s8(v260, (int8x16_t)xmmword_1BA86C160);
          uint32x4_t v262 = (uint32x4_t)vqtbl1q_s8(v260, (int8x16_t)xmmword_1BA86C170);
          uint32x4_t v263 = (uint32x4_t)vqtbl1q_s8(v260, (int8x16_t)xmmword_1BA86C180);
          uint32x4_t v264 = (uint32x4_t)vqtbl1q_s8(v260, (int8x16_t)xmmword_1BA86C190);
          int64x2_t v251 = (int64x2_t)vaddw_high_u32((uint64x2_t)v251, v262);
          int64x2_t v256 = (int64x2_t)vaddw_high_u32((uint64x2_t)v256, v261);
          int64x2_t v255 = (int64x2_t)vaddw_u32((uint64x2_t)v255, *(uint32x2_t *)v261.i8);
          int64x2_t v252 = (int64x2_t)vaddw_u32((uint64x2_t)v252, *(uint32x2_t *)v262.i8);
          int64x2_t v257 = (int64x2_t)vaddw_u32((uint64x2_t)v257, *(uint32x2_t *)v263.i8);
          int64x2_t v209 = (int64x2_t)vaddw_high_u32((uint64x2_t)v209, v263);
          int64x2_t v258 = (int64x2_t)vaddw_u32((uint64x2_t)v258, *(uint32x2_t *)v264.i8);
          int64x2_t v259 = (int64x2_t)vaddw_high_u32((uint64x2_t)v259, v264);
          v254 -= 16;
        }
        while (v254);
        unint64_t v212 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v252, v257), vaddq_s64(v255, v258)), vaddq_s64(vaddq_s64(v251, v209), vaddq_s64(v256, v259))));
        if (v100 == (v100 & 0xFFFFFFFFFFFFFFF0)) {
          goto LABEL_177;
        }
        unint64_t v244 = v100 & 0xFFFFFFFFFFFFFFF0;
        unint64_t v250 = v100 & 0xFFFFFFFFFFFFFFF0;
        if ((v100 & 8) != 0) {
          goto LABEL_180;
        }
        do
LABEL_188:
          v212 += data->u8[v250++];
        while (v100 != v250);
LABEL_177:
        ++v243;
        data = (int8x16_t *)((char *)data + dest.rowBytes);
        if (v243 == v99) {
          goto LABEL_150;
        }
      }
      unint64_t v244 = 0;
LABEL_180:
      int64x2_t v245 = 0uLL;
      int64x2_t v246 = (int64x2_t)v212;
      int64x2_t v247 = 0uLL;
      int64x2_t v248 = 0uLL;
      do
      {
        v209.i64[0] = *(uint64_t *)((char *)data->i64 + v244);
        uint32x4_t v249 = (uint32x4_t)vqtbl1q_s8((int8x16_t)v209, (int8x16_t)xmmword_1BA86C160);
        int64x2_t v209 = (int64x2_t)vqtbl1q_s8((int8x16_t)v209, (int8x16_t)xmmword_1BA86C170);
        int64x2_t v248 = (int64x2_t)vaddw_high_u32((uint64x2_t)v248, v249);
        int64x2_t v245 = (int64x2_t)vaddw_high_u32((uint64x2_t)v245, (uint32x4_t)v209);
        int64x2_t v247 = (int64x2_t)vaddw_u32((uint64x2_t)v247, *(uint32x2_t *)v249.i8);
        int64x2_t v246 = (int64x2_t)vaddw_u32((uint64x2_t)v246, *(uint32x2_t *)v209.i8);
        v244 += 8;
      }
      while (v105 != v244);
      unint64_t v212 = vaddvq_s64(vaddq_s64(vaddq_s64(v246, v247), vaddq_s64(v245, v248)));
      unint64_t v250 = v100 & 0xFFFFFFFFFFFFFFF8;
      if (v100 == v105) {
        goto LABEL_177;
      }
      goto LABEL_188;
    }
    uint64_t v137 = 2 * v100;
    float32x4_t v138 = (float32x4_t)vdupq_lane_s32(v104, 0);
    if (v100 < 0x10)
    {
      uint64_t v139 = 0;
      unint64_t v106 = 0;
      v140.i64[0] = 0x6800680068006800;
      v140.i64[1] = 0x6800680068006800;
      int8x16_t v141 = (int8x16_t)vdupq_n_s64(1uLL);
      int64x2_t v142 = v98;
      int64x2_t v143 = v102;
      while (1)
      {
        int8x16_t v144 = (float16x8_t *)&v98[v139 * v101];
        int8x16_t v145 = (int8x8_t *)&v102->i8[v103 * v139];
        if (v145 < (int8x8_t *)&v98[v137 + v139 * v101] && v144 < (float16x8_t *)&v102->i8[v100 + v103 * v139]) {
          break;
        }
        int8x8_t v147 = vmovn_s16((int16x8_t)vbicq_s8(vmvnq_s8((int8x16_t)vcgeq_f16(*v144, v140)), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v138, vcvtq_f32_f16(*(float16x4_t *)v144->i8)), (int16x8_t)vcgtq_f32(v138, vcvt_hight_f32_f16(*v144)))));
        *int8x16_t v145 = vand_s8(v147, (int8x8_t)0x101010101010101);
        v148.i64[0] = v147.u8[4];
        v148.i64[1] = v147.u8[5];
        int64x2_t v149 = (int64x2_t)vandq_s8(v148, v141);
        v148.i64[0] = v147.u8[6];
        v148.i64[1] = v147.u8[7];
        int64x2_t v150 = (int64x2_t)vandq_s8(v148, v141);
        v148.i64[0] = v147.u8[2];
        v148.i64[1] = v147.u8[3];
        int64x2_t v151 = (int64x2_t)vandq_s8(v148, v141);
        v148.i64[0] = v147.u8[0];
        v148.i64[1] = v147.u8[1];
        unint64_t v106 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64((int64x2_t)v106, (int64x2_t)vandq_s8(v148, v141)), v149), vaddq_s64(v151, v150)));
        unint64_t v152 = v100 & 0xFFFFFFFFFFFFFFF8;
        if (v100 != v105) {
          goto LABEL_120;
        }
LABEL_113:
        ++v139;
        int64x2_t v143 = (int8x16_t *)((char *)v143 + v103);
        v142 += v101;
        if (v139 == v99) {
          goto LABEL_145;
        }
      }
      unint64_t v152 = 0;
LABEL_120:
      size_t v153 = v100 - v152;
      int64x2_t v154 = &v143->i8[v152];
      int64x2_t v155 = (short float *)&v142[2 * v152];
      do
      {
        short float v156 = *v155++;
        _H6 = v156;
        __asm { FCVT            S7, H6 }
        LODWORD(v159) = v156 < COERCE_SHORT_FLOAT(26624);
        if (*(float *)v104.i32 <= _S7) {
          uint64_t v159 = v159;
        }
        else {
          uint64_t v159 = 0;
        }
        *v154++ = v159;
        v106 += v159;
        --v153;
      }
      while (v153);
      goto LABEL_113;
    }
    uint64_t v160 = 0;
    unint64_t v106 = 0;
    v161.i64[0] = 0x6800680068006800;
    v161.i64[1] = 0x6800680068006800;
    v162.i64[0] = 0x101010101010101;
    v162.i64[1] = 0x101010101010101;
    int8x16_t v163 = (int8x16_t)vdupq_n_s64(1uLL);
    int8x16_t v164 = (float16x8_t *)v98;
    unsigned int v165 = v102;
    while (&v102->i8[v103 * v160] >= &v98[v137 + v160 * v101] || &v98[v160 * v101] >= &v102->i8[v100 + v103 * v160])
    {
      int64x2_t v167 = 0uLL;
      int64x2_t v168 = (int64x2_t)v106;
      id v169 = v164;
      float v170 = v165;
      unint64_t v171 = v100 & 0xFFFFFFFFFFFFFFF0;
      int64x2_t v172 = 0uLL;
      int64x2_t v173 = 0uLL;
      int64x2_t v174 = 0uLL;
      int64x2_t v175 = 0uLL;
      int64x2_t v176 = 0uLL;
      int64x2_t v177 = 0uLL;
      do
      {
        float16x8_t v179 = *v169;
        float16x8_t v178 = v169[1];
        v169 += 2;
        int8x16_t v180 = vbicq_s8(vmvnq_s8(vuzp1q_s8((int8x16_t)vcgeq_f16(v179, v161), (int8x16_t)vcgeq_f16(v178, v161))), vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v138, vcvtq_f32_f16(*(float16x4_t *)v179.i8)), (int16x8_t)vcgtq_f32(v138, vcvt_hight_f32_f16(v179))), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v138, vcvtq_f32_f16(*(float16x4_t *)v178.i8)), (int16x8_t)vcgtq_f32(v138, vcvt_hight_f32_f16(v178)))));
        v181.i64[0] = v180.u8[0];
        v181.i64[1] = v180.u8[1];
        int64x2_t v182 = (int64x2_t)vandq_s8(v181, v163);
        v181.i64[0] = v180.u8[2];
        v181.i64[1] = v180.u8[3];
        int64x2_t v183 = (int64x2_t)vandq_s8(v181, v163);
        v181.i64[0] = v180.u8[4];
        v181.i64[1] = v180.u8[5];
        int64x2_t v184 = (int64x2_t)vandq_s8(v181, v163);
        v181.i64[0] = v180.u8[6];
        v181.i64[1] = v180.u8[7];
        int64x2_t v185 = (int64x2_t)vandq_s8(v181, v163);
        v181.i64[0] = v180.u8[8];
        v181.i64[1] = v180.u8[9];
        int64x2_t v186 = (int64x2_t)vandq_s8(v181, v163);
        v181.i64[0] = v180.u8[10];
        v181.i64[1] = v180.u8[11];
        int64x2_t v187 = (int64x2_t)vandq_s8(v181, v163);
        v181.i64[0] = v180.u8[12];
        v181.i64[1] = v180.u8[13];
        int64x2_t v188 = (int64x2_t)vandq_s8(v181, v163);
        v181.i64[0] = v180.u8[14];
        v181.i64[1] = v180.u8[15];
        int64x2_t v177 = vaddq_s64(v177, (int64x2_t)vandq_s8(v181, v163));
        int64x2_t v176 = vaddq_s64(v176, v188);
        *v170++ = vandq_s8(v180, v162);
        int64x2_t v175 = vaddq_s64(v175, v187);
        int64x2_t v174 = vaddq_s64(v174, v186);
        int64x2_t v173 = vaddq_s64(v173, v185);
        int64x2_t v172 = vaddq_s64(v172, v184);
        int64x2_t v167 = vaddq_s64(v167, v183);
        int64x2_t v168 = vaddq_s64(v168, v182);
        v171 -= 16;
      }
      while (v171);
      uint64_t v189 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v168, v174), vaddq_s64(v172, v176)), vaddq_s64(vaddq_s64(v167, v175), vaddq_s64(v173, v177))));
      unint64_t v106 = v189;
      if (v100 != (v100 & 0xFFFFFFFFFFFFFFF0))
      {
        unint64_t k = v100 & 0xFFFFFFFFFFFFFFF0;
        if ((v100 & 8) == 0) {
          goto LABEL_140;
        }
        int64x2_t v190 = 0uLL;
        int64x2_t v191 = (int64x2_t)(unint64_t)v189;
        unint64_t v192 = v137 & 0xFFFFFFFFFFFFFFE0;
        unint64_t v193 = v100 & 0xFFFFFFFFFFFFFFF0;
        int64x2_t v194 = 0uLL;
        int64x2_t v195 = 0uLL;
        do
        {
          int8x8_t v196 = vmovn_s16((int16x8_t)vbicq_s8(vmvnq_s8((int8x16_t)vcgeq_f16(*(float16x8_t *)((char *)v164 + v192), v161)), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v138, vcvtq_f32_f16(*(float16x4_t *)&v164->i8[v192])), (int16x8_t)vcgtq_f32(v138, vcvt_hight_f32_f16(*(float16x8_t *)((char *)v164 + v192))))));
          *(int8x8_t *)&v165->i8[v193] = vand_s8(v196, (int8x8_t)0x101010101010101);
          int8x16_t v197 = (int8x16_t)vdupq_n_s64(1uLL);
          v198.i64[0] = v196.u8[0];
          v198.i64[1] = v196.u8[1];
          int8x16_t v199 = v198;
          v198.i64[0] = v196.u8[2];
          v198.i64[1] = v196.u8[3];
          int8x16_t v200 = v198;
          v198.i64[0] = v196.u8[4];
          v198.i64[1] = v196.u8[5];
          unsigned int v201 = v196.u8[6];
          unsigned int v202 = v196.u8[7];
          int64x2_t v203 = (int64x2_t)vandq_s8(v200, v197);
          int64x2_t v204 = (int64x2_t)vandq_s8(v198, v197);
          v198.i64[0] = v201;
          v198.i64[1] = v202;
          int64x2_t v195 = vaddq_s64(v195, (int64x2_t)vandq_s8(v198, v197));
          int64x2_t v194 = vaddq_s64(v194, v204);
          int64x2_t v190 = vaddq_s64(v190, v203);
          int64x2_t v191 = vaddq_s64(v191, (int64x2_t)vandq_s8(v199, v197));
          v193 += 8;
          v192 += 16;
        }
        while (v105 != v193);
        unint64_t v106 = vaddvq_s64(vaddq_s64(vaddq_s64(v191, v194), vaddq_s64(v190, v195)));
        unint64_t k = v100 & 0xFFFFFFFFFFFFFFF8;
        if (v100 != v105) {
          goto LABEL_140;
        }
      }
LABEL_127:
      ++v160;
      unsigned int v165 = (int8x16_t *)((char *)v165 + v103);
      int8x16_t v164 = (float16x8_t *)((char *)v164 + v101);
      if (v160 == v99) {
        goto LABEL_145;
      }
    }
    for (unint64_t k = 0; k != v100; ++k)
    {
LABEL_140:
      _H6 = *(short float *)&v164->i16[k];
      __asm { FCVT            S7, H6 }
      uint64_t v208 = *(float *)v104.i32 <= _S7 && _H6 < COERCE_SHORT_FLOAT(26624);
      v165->i8[k] = v208;
      v106 += v208;
    }
    goto LABEL_127;
  }
  vImageMin_Planar8(&src, &dest, 0, 0, 0, 3uLL, 3uLL, 0);
  float v134 = 0.0;
  float v135 = 0.0;
  uint64_t v133 = v265;
  uint64_t v136 = pixelBuffera;
LABEL_151:
  float v216 = (float)v99 * (float)v100;
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 200), 0);
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 192), 0);
  CVPixelBufferUnlockBaseAddress(v136, 1uLL);
  float v132 = v135 / v216;
  float v131 = v134 / v216;
LABEL_152:
  if (*(int *)(a1 + 184) <= 0)
  {
    *(float *)(a1 + 8) = v40;
    *(float *)(a1 + 16) = v37;
  }
  else
  {
    *(float *)(a1 + 8) = (float)(v40 * *(float *)(a1 + 120))
                       + (float)((float)(1.0 - *(float *)(a1 + 120)) * *(float *)(a1 + 8));
    *(float *)(a1 + 16) = *(float *)(a1 + 16) + (float)(*(float *)(a1 + 1352) * (float)(v37 - *(float *)(a1 + 16)));
  }
  uint64_t v217 = *(int *)(a1 + 236);
  uint64_t v218 = *(void *)(a1 + 208);
  *(_DWORD *)(v218 + 4 * v217) = *(_DWORD *)v133;
  unint64_t v219 = v217 + 1;
  unint64_t v220 = (*(void *)(a1 + 216) - v218) >> 2;
  unint64_t v221 = v219 % v220;
  *(_DWORD *)(a1 + 236) = v221;
  int v222 = *(_DWORD *)(a1 + 232);
  if (v222 == v221) {
    int v222 = ((int)v221 + 1) % v220;
  }
  *(_DWORD *)(a1 + 232) = v222;
  if (v222 == v221)
  {
    *(void *)(a1 + 240) = 0;
  }
  else
  {
    float v223 = 0.0;
    int v224 = -1;
    float v225 = 0.0;
    do
    {
      int v226 = v224 + 2;
      float v227 = *(float *)(v218 + 4 * v222);
      float v228 = v227 - v225;
      float v225 = v225 + (float)((float)(v227 - v225) / (float)(v224 + 2));
      float v223 = v223 + (float)(v228 * (float)(v227 - v225));
      int v222 = (v222 + 1) % v220;
      ++v224;
    }
    while (v222 != v221);
    *(_DWORD *)(a1 + 240) = v226;
    *(float *)(a1 + 244) = v225;
    if (v224) {
      *(float *)(a1 + 248) = v223 / (float)v224;
    }
  }
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a1 + 248);
  uint64_t v229 = *(int *)(a1 + 284);
  uint64_t v230 = *(void *)(a1 + 256);
  *(_DWORD *)(v230 + 4 * v229) = *(_DWORD *)(a1 + 16);
  unint64_t v231 = v229 + 1;
  unint64_t v232 = (*(void *)(a1 + 264) - v230) >> 2;
  unint64_t v233 = v231 % v232;
  *(_DWORD *)(a1 + 284) = v233;
  int v234 = *(_DWORD *)(a1 + 280);
  if (v234 == v233) {
    int v234 = ((int)v233 + 1) % v232;
  }
  *(_DWORD *)(a1 + 280) = v234;
  if (v234 == v233)
  {
    *(void *)(a1 + 288) = 0;
  }
  else
  {
    float v235 = 0.0;
    int v236 = -1;
    float v237 = 0.0;
    do
    {
      int v238 = v236 + 2;
      float v239 = *(float *)(v230 + 4 * v234);
      float v240 = v239 - v237;
      float v237 = v237 + (float)((float)(v239 - v237) / (float)(v236 + 2));
      float v235 = v235 + (float)(v240 * (float)(v239 - v237));
      int v234 = (v234 + 1) % v232;
      ++v236;
    }
    while (v234 != v233);
    *(_DWORD *)(a1 + 288) = v238;
    *(float *)(a1 + 292) = v237;
    if (v236) {
      *(float *)(a1 + 296) = v235 / (float)v236;
    }
  }
  int v241 = *(_DWORD *)(a1 + 296);
  *(_DWORD *)(a1 + 32) = v97;
  *(float *)(a1 + 36) = v95;
  *(_DWORD *)(a1 + 20) = v241;
  *(float *)(a1 + 24) = v132;
  *(float *)(a1 + 28) = v131;
  *(_DWORD *)(a1 + 12) = v19;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)v133;
  if (a1 + 48 != v133 + 8) {
    sub_1BA825694((void *)(a1 + 48), *(char **)(v133 + 8), *(char **)(v133 + 16), (uint64_t)(*(void *)(v133 + 16) - *(void *)(v133 + 8)) >> 2);
  }
  if (a1 + 72 != v133 + 32) {
    sub_1BA825694((void *)(a1 + 72), *(char **)(v133 + 32), *(char **)(v133 + 40), (uint64_t)(*(void *)(v133 + 40) - *(void *)(v133 + 32)) >> 2);
  }
  ++*(_DWORD *)(a1 + 184);
  return a1;
}

void sub_1BA8356A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA835850(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA835A4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA835DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA8360A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA83651C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,CFTypeRef a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,CFTypeRef cf)
{
  _Block_object_dispose(&a30, 8);
  CFTypeRef v43 = cf;
  cf = 0;
  if (v43) {
    CFRelease(v43);
  }
  _Block_object_dispose((const void *)(v41 - 160), 8);
  size_t v44 = *(const void **)(v41 - 112);
  *(void *)(v41 - 112) = 0;
  if (v44) {
    CFRelease(v44);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_1BA83660C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0;
  *(void *)(result + 48) = v2;
  return result;
}

void sub_1BA83661C(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 48);
  *(void *)(a1 + 48) = 0;
  if (v2) {
    CFRelease(v2);
  }
}

void sub_1BA836634(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(const void **)(v4 + 48);
  *(void *)(v4 + 48) = 0;
  if (v5) {
    CFRelease(v5);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  long long v7 = *(const void **)(v6 + 48);
  *(void *)(v6 + 48) = 0;
  if (v7) {
    CFRelease(v7);
  }
  float v8 = *(NSObject **)(a1 + 32);
  if (!v8) {
    float v8 = *(NSObject **)(*(void *)(a1 + 40) + 48);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1BA836728;
  block[3] = &unk_1E6228528;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 72);
  id v12 = v9;
  uint64_t v13 = v10;
  block[4] = *(void *)(a1 + 40);
  dispatch_async(v8, block);
}

intptr_t sub_1BA836728(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(const void **)(v3 + 48);
  *(void *)(v3 + 48) = 0;
  if (v4) {
    CFRelease(v4);
  }
  id v5 = *(NSObject **)(a1[4] + 56);

  return dispatch_semaphore_signal(v5);
}

void sub_1BA836960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA836B28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA836CAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA837034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA837370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA8376B8(_Unwind_Exception *a1, uint64_t a2, void *a3, void *a4, ...)
{
  va_start(va, a4);
  sub_1BA83770C((id *)va);

  _Unwind_Resume(a1);
}

id *sub_1BA83770C(id *a1)
{
  return a1;
}

void sub_1BA837A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1BA837EF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA838080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8381C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8383F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA838904(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

id sub_1BA838930(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  float v8 = *(void **)(**a1 + 8);
  id v9 = sub_1BA86216C(a2, a3, a4);
  uint64_t v10 = (void *)[v8 newTextureWithDescriptor:v9];

  if (!v10)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:*a1[1], **a1, @"CVAFilterGuided.mm", 607, @"[_Nonnull id<MTLDeviceSPI newTextureWithDescriptor:textureDescriptor(%lu, %lu, %lu)] is nil", a2, a3, a4 object file lineNumber description];
  }

  return v10;
}

void sub_1BA838A14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA838EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  __cxa_guard_abort(&qword_1E9F769B8);

  _Unwind_Resume(a1);
}

void sub_1BA839048(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8391A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA8392CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA839F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1BA83AA8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,void *a28,void *a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34)
{
  sub_1BA832B78(&a34);

  operator delete(v35);
  _Unwind_Resume(a1);
}

void sub_1BA83AB2C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)a1 || *(unsigned char *)(a1 + 1))
  {
    if (!*(void *)(a1 + 144))
    {
      uint64_t v7 = sub_1BA83AD10(v5);
      float v8 = *(void **)(a1 + 144);
      *(void *)(a1 + 144) = v7;

      uint64_t v9 = sub_1BA83AD10(v5);
      uint64_t v10 = *(void **)(a1 + 152);
      *(void *)(a1 + 152) = v9;
    }
    float v11 = [v6 commandBuffer];
    [v11 setLabel:@"perf profiler"];
    id v12 = [v11 blitCommandEncoder];
    uint64_t v13 = *(void **)(a1 + 144);
    memset(v20, 0, sizeof(v20));
    uint64_t v14 = [v13 width];
    uint64_t v15 = [*(id *)(a1 + 144) height];
    v19[0] = v14;
    v19[1] = v15;
    void v19[2] = 1;
    uint64_t v16 = *(void *)(a1 + 152);
    memset(v18, 0, sizeof(v18));
    [v12 copyFromTexture:v13 sourceSlice:0 sourceLevel:0 sourceOrigin:v20 sourceSize:v19 toTexture:v16 destinationSlice:0 destinationLevel:0 destinationOrigin:v18];
    [v12 endEncoding];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_1BA83AE4C;
    v17[3] = &unk_1E6228570;
    v17[4] = a1;
    [v11 addCompletedHandler:v17];
    [v11 commit];
    ++*(void *)(a1 + 8);
  }
}

void sub_1BA83ACD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1BA83AD10(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:70 width:2 height:2 mipmapped:0];
  [v2 setUsage:3];
  uint64_t v3 = (void *)[v1 newTextureWithDescriptor:v2];

  long long v8 = xmmword_1BA86C250;
  memset(v5, 0, sizeof(v5));
  int64x2_t v6 = vdupq_n_s64(2uLL);
  uint64_t v7 = 1;
  [v3 replaceRegion:v5 mipmapLevel:0 slice:0 withBytes:&v8 bytesPerRow:8 bytesPerImage:16];

  return v3;
}

void sub_1BA83AE14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA83AE4C(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  std::mutex::lock((std::mutex *)(v3 + 80));
  [v5 GPUEndTime];
  if (!*(unsigned char *)(v3 + 56)) {
    *(unsigned char *)(v3 + 56) = 1;
  }
  *(void *)(v3 + 64) = v4;
  *(void *)(v3 + 72) = 0;
  std::mutex::unlock((std::mutex *)(v3 + 80));
}

void sub_1BA83AEC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  std::mutex::unlock(v10);

  _Unwind_Resume(a1);
}

void sub_1BA83AEEC(uint64_t a1)
{
  if (!*(unsigned char *)a1 && !*(unsigned char *)(a1 + 1)) {
    return;
  }
  std::mutex::lock((std::mutex *)(a1 + 80));
  HIBYTE(v56) = 9;
  strcpy((char *)&__s2, "Total GPU");
  uint64_t v3 = (uint64_t *)(a1 + 16);
  unint64_t v4 = sub_1BA81EF84((uint64_t *)&__s2, 9uLL);
  unint64_t v5 = v4;
  unint64_t v6 = *(void *)(a1 + 24);
  if (v6)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v1 = v4;
      if (v4 >= v6) {
        unint64_t v1 = v4 % v6;
      }
    }
    else
    {
      unint64_t v1 = (v6 - 1) & v4;
    }
    long long v8 = *(void ***)(*v3 + 8 * v1);
    if (v8)
    {
      uint64_t v9 = (unsigned __int8 *)*v8;
      if (*v8)
      {
        if (v7.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v10 = *((void *)v9 + 1);
            if (v10 == v5)
            {
              uint64_t v11 = v9[39];
              if ((v11 & 0x80u) == 0) {
                uint64_t v12 = v9[39];
              }
              else {
                uint64_t v12 = *((void *)v9 + 3);
              }
              if (v12 == 9)
              {
                if ((v11 & 0x80) != 0)
                {
                  if (!memcmp(*((const void **)v9 + 2), &__s2, *((void *)v9 + 3))) {
                    goto LABEL_85;
                  }
                }
                else
                {
                  if (!v9[39]) {
                    goto LABEL_85;
                  }
                  uint64_t v13 = 0;
                  while (v9[v13 + 16] == *((unsigned __int8 *)&__s2 + v13))
                  {
                    if (v11 == ++v13) {
                      goto LABEL_85;
                    }
                  }
                }
              }
            }
            else if ((v10 & (v6 - 1)) != v1)
            {
              goto LABEL_47;
            }
            uint64_t v9 = *(unsigned __int8 **)v9;
            if (!v9) {
              goto LABEL_47;
            }
          }
        }
        do
        {
          unint64_t v14 = *((void *)v9 + 1);
          if (v14 == v5)
          {
            uint64_t v15 = v9[39];
            if ((v15 & 0x80u) == 0) {
              uint64_t v16 = v9[39];
            }
            else {
              uint64_t v16 = *((void *)v9 + 3);
            }
            if (v16 == 9)
            {
              if ((v15 & 0x80) != 0)
              {
                if (!memcmp(*((const void **)v9 + 2), &__s2, *((void *)v9 + 3))) {
                  goto LABEL_85;
                }
              }
              else
              {
                if (!v9[39]) {
                  goto LABEL_85;
                }
                uint64_t v17 = 0;
                while (v9[v17 + 16] == *((unsigned __int8 *)&__s2 + v17))
                {
                  if (v15 == ++v17) {
                    goto LABEL_85;
                  }
                }
              }
            }
          }
          else
          {
            if (v14 >= v6) {
              v14 %= v6;
            }
            if (v14 != v1) {
              break;
            }
          }
          uint64_t v9 = *(unsigned __int8 **)v9;
        }
        while (v9);
      }
    }
  }
LABEL_47:
  uint64_t v9 = (unsigned __int8 *)operator new(0x38uLL);
  int v18 = (void *)(a1 + 32);
  float v57 = v9;
  uint64_t v58 = a1 + 32;
  *(void *)uint64_t v9 = 0;
  *((void *)v9 + 1) = v5;
  *((_OWORD *)v9 + 1) = __s2;
  uint64_t v19 = v56;
  long long __s2 = 0uLL;
  uint64_t v56 = 0;
  *((void *)v9 + 5) = 0;
  *((void *)v9 + 6) = 0;
  *((void *)v9 + 4) = v19;
  char v59 = 1;
  float v20 = (float)(unint64_t)(*(void *)(a1 + 40) + 1);
  float v21 = *(float *)(a1 + 48);
  if (!v6 || (float)(v21 * (float)v6) < v20)
  {
    BOOL v22 = 1;
    if (v6 >= 3) {
      BOOL v22 = (v6 & (v6 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v6);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      size_t prime = v24;
    }
    else {
      size_t prime = v23;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
      unint64_t v6 = *(void *)(a1 + 24);
    }
    if (prime > v6) {
      goto LABEL_59;
    }
    if (prime < v6)
    {
      unint64_t v26 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 40) / *(float *)(a1 + 48));
      if (v6 < 3 || (uint8x8_t v27 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v27.i16[0] = vaddlv_u8(v27), v27.u32[0] > 1uLL))
      {
        unint64_t v26 = std::__next_prime(v26);
      }
      else
      {
        uint64_t v28 = 1 << -(char)__clz(v26 - 1);
        if (v26 >= 2) {
          unint64_t v26 = v28;
        }
      }
      if (prime <= v26) {
        size_t prime = v26;
      }
      if (prime < v6) {
LABEL_59:
      }
        sub_1BA83B840(a1 + 16, prime);
    }
    unint64_t v6 = *(void *)(a1 + 24);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v5 >= v6) {
        unint64_t v1 = v5 % v6;
      }
      else {
        unint64_t v1 = v5;
      }
    }
    else
    {
      unint64_t v1 = (v6 - 1) & v5;
    }
  }
  uint64_t v29 = *v3;
  unint64_t v30 = *(void **)(*v3 + 8 * v1);
  if (v30)
  {
    *(void *)uint64_t v9 = *v30;
LABEL_83:
    void *v30 = v9;
    goto LABEL_84;
  }
  *(void *)uint64_t v9 = *v18;
  *int v18 = v9;
  *(void *)(v29 + 8 * v1) = v18;
  if (*(void *)v9)
  {
    unint64_t v31 = *(void *)(*(void *)v9 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v31 >= v6) {
        v31 %= v6;
      }
    }
    else
    {
      v31 &= v6 - 1;
    }
    unint64_t v30 = (void *)(*v3 + 8 * v31);
    goto LABEL_83;
  }
LABEL_84:
  ++*(void *)(a1 + 40);
LABEL_85:
  float v32 = (double *)*((void *)v9 + 5);
  if (!v32)
  {
    float v33 = operator new(0x68uLL);
    v33[1] = 0;
    v33[2] = 0;
    void *v33 = &unk_1F142F220;
    sub_1BA83B608(v33 + 3, 100);
    float v34 = (std::__shared_weak_count *)*((void *)v9 + 6);
    *((void *)v9 + 5) = v33 + 3;
    *((void *)v9 + 6) = v33;
    if (v34 && !atomic_fetch_add(&v34->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
    float v32 = (double *)*((void *)v9 + 5);
  }
  float v36 = *(double **)v32;
  unint64_t v35 = (double *)*((void *)v32 + 1);
  uint64_t v37 = ((uint64_t)v35 - *(void *)v32) >> 3;
  float v38 = (void *)*((void *)v32 + 4);
  if ((void *)v37 != v38)
  {
    size_t v44 = (void *)*((void *)v32 + 3);
    *size_t v44 = *(void *)(a1 + 72);
    int32x2_t v45 = (double *)(v44 + 1);
    if (v45 == v35) {
      int v46 = v36;
    }
    else {
      int v46 = v45;
    }
    uint64_t v47 = (uint64_t)v38 + 1;
    *((void *)v32 + 3) = v46;
    *((void *)v32 + 4) = v47;
    CFTypeRef v43 = v32 + 6;
    double v39 = *(double *)(a1 + 72);
    if (v37 == v47) {
      goto LABEL_101;
    }
    double v50 = *v43;
    if (*v43 > v39)
    {
      if (v47)
      {
        uint64_t v52 = &v36[v47];
        if (*((void *)v32 + 2))
        {
LABEL_115:
          double v49 = v50 - (v50 - v39) / (double)(unint64_t)(v52 - v36);
          goto LABEL_120;
        }
      }
      else
      {
        uint64_t v52 = v36;
      }
      v36 += v47;
      goto LABEL_115;
    }
    if (*v43 >= v39) {
      goto LABEL_121;
    }
    if (v47)
    {
      float32x4_t v53 = &v36[v47];
      if (*((void *)v32 + 2))
      {
LABEL_118:
        double v51 = (v39 - v50) / (double)(unint64_t)(v53 - v36);
        goto LABEL_119;
      }
    }
    else
    {
      float32x4_t v53 = v36;
    }
    v36 += v47;
    goto LABEL_118;
  }
  double v39 = *(double *)(a1 + 72);
  if (v35 != v36)
  {
    float v40 = (double *)*((void *)v32 + 3);
    double *v40 = v39;
    uint64_t v41 = v40 + 1;
    if (v41 == v35) {
      size_t v42 = v36;
    }
    else {
      size_t v42 = v41;
    }
    *((void *)v32 + 2) = v42;
    *((void *)v32 + 3) = v42;
    double v39 = *(double *)(a1 + 72);
  }
  CFTypeRef v43 = v32 + 6;
LABEL_101:
  double v48 = **((double **)v32 + 2);
  if (v48 > v39)
  {
    double v49 = *v43 - (v48 - v39) / (double)(unint64_t)(v37 - 1);
LABEL_120:
    *CFTypeRef v43 = v49;
    double v39 = *(double *)(a1 + 72);
    goto LABEL_121;
  }
  if (v48 < v39)
  {
    double v50 = (v39 - v48) / (double)(unint64_t)(v37 - 1);
    double v51 = *v43;
LABEL_119:
    double v49 = v50 + v51;
    goto LABEL_120;
  }
LABEL_121:
  ++*((void *)v32 + 7);
  v32[8] = v39 + v32[8];
  uint64_t v54 = *((void *)v9 + 5);
  if (*(unsigned char *)a1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s = %.1lf ms%s", "Total GPU", *(double *)(v54 + 48) * 1000.0, "");
  }
  if (*(unsigned char *)(a1 + 1))
  {
    NSLog(&cfstr_CvaphotoProfil.isa, *(void *)(a1 + 8), "Total GPU", v39 * 1000.0, "");
    NSLog(&cfstr_CvaphotoProfil_0.isa, *(void *)(a1 + 8), "Total GPU", *(double *)(v54 + 64) / (double)*(unint64_t *)(v54 + 56) * 1000.0, "");
  }

  std::mutex::unlock((std::mutex *)(a1 + 80));
}

void sub_1BA83B5C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  std::__shared_weak_count::~__shared_weak_count(v17);
  operator delete(v19);
  std::mutex::unlock(v16);
  _Unwind_Resume(a1);
}

void sub_1BA83B608(void *a1, int a2)
{
  if (a2 <= -2)
  {
    std::logic_error::logic_error(&v6, "circular_buffer");
    v6.__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
    abort();
  }
  uint64_t v3 = a2 + 1;
  if (a2 == -1)
  {
    unint64_t v4 = 0;
    unint64_t v5 = 0;
    a1[4] = 0;
  }
  else
  {
    unint64_t v4 = operator new(8 * (a2 + 1));
    a1[4] = 0;
    unint64_t v5 = (char *)operator new(8 * v3);
  }
  *a1 = v5;
  a1[1] = &v5[8 * v3];
  a1[2] = v5;
  a1[3] = v5;
  a1[7] = 0;
  a1[8] = 0;
  a1[6] = 0;
  if (v4)
  {
    operator delete(v4);
  }
}

void sub_1BA83B70C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1BA83B734((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1BA83B734(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = *(void **)a1;
  uint64_t v6 = v3 - v2;
  unint64_t v7 = (unint64_t)(v3 - (void)v5) >> 3;
  if (v4 < v6 >> 3) {
    unint64_t v7 = 0;
  }
  *(void *)(a1 + 16) = v2 + 8 * (v4 - v7);
  if (v5) {
    operator delete(v5);
  }
  return a1;
}

void sub_1BA83B790(void *a1)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = a1[5];
  uint64_t v4 = a1[7];
  unint64_t v5 = (void *)a1[3];
  uint64_t v6 = v3 - v2;
  unint64_t v7 = (unint64_t)(v3 - (void)v5) >> 3;
  if (v4 < v6 >> 3) {
    unint64_t v7 = 0;
  }
  a1[5] = v2 + 8 * (v4 - v7);
  if (v5) {
    operator delete(v5);
  }
}

void sub_1BA83B7CC(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F142F220;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1BA9F12C0);
}

void sub_1BA83B820(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F142F220;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1BA83B840(uint64_t a1, unint64_t a2)
{
  if (!a2)
  {
    uint64_t v15 = *(void **)a1;
    *(void *)a1 = 0;
    if (v15) {
      operator delete(v15);
    }
    *(void *)(a1 + 8) = 0;
    return;
  }
  if (a2 >> 61) {
    sub_1BA81F974();
  }
  uint64_t v4 = operator new(8 * a2);
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
  uint64_t v8 = a1 + 16;
  unint64_t v7 = *(void **)(a1 + 16);
  if (v7)
  {
    unint64_t v9 = v7[1];
    unint64_t v10 = a2 - 1;
    if ((a2 & (a2 - 1)) == 0)
    {
      uint64_t v11 = v9 & v10;
      *(void *)(*(void *)a1 + 8 * v11) = v8;
      while (1)
      {
        uint64_t v12 = (void *)*v7;
        if (!*v7) {
          break;
        }
        uint64_t v13 = v12[1] & v10;
        if (v13 == v11)
        {
          unint64_t v7 = (void *)*v7;
        }
        else if (*(void *)(*(void *)a1 + 8 * v13))
        {
          *unint64_t v7 = *v12;
          uint64_t v14 = 8 * v13;
          void *v12 = **(void **)(*(void *)a1 + v14);
          **(void **)(*(void *)a1 + v14) = v12;
        }
        else
        {
          *(void *)(*(void *)a1 + 8 * v13) = v7;
          unint64_t v7 = v12;
          uint64_t v11 = v13;
        }
      }
      return;
    }
    if (v9 >= a2) {
      v9 %= a2;
    }
    *(void *)(*(void *)a1 + 8 * v9) = v8;
    uint64_t v16 = (void *)*v7;
    if (*v7)
    {
      do
      {
        unint64_t v18 = v16[1];
        if (v18 >= a2) {
          v18 %= a2;
        }
        if (v18 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v18))
          {
            *(void *)(*(void *)a1 + 8 * v18) = v7;
            goto LABEL_26;
          }
          *unint64_t v7 = *v16;
          uint64_t v17 = 8 * v18;
          void *v16 = **(void **)(*(void *)a1 + v17);
          **(void **)(*(void *)a1 + v17) = v16;
          uint64_t v16 = v7;
        }
        unint64_t v18 = v9;
LABEL_26:
        unint64_t v7 = v16;
        uint64_t v16 = (void *)*v16;
        unint64_t v9 = v18;
      }
      while (v16);
    }
  }
}

uint64_t *sub_1BA83B9E4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16))
    {
      uint64_t v3 = *(std::__shared_weak_count **)(v2 + 48);
      if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
        if ((*(char *)(v2 + 39) & 0x80000000) == 0) {
          goto LABEL_7;
        }
        goto LABEL_6;
      }
      if (*(char *)(v2 + 39) < 0) {
LABEL_6:
      }
        operator delete(*(void **)(v2 + 16));
    }
LABEL_7:
    operator delete((void *)v2);
  }
  return a1;
}

void sub_1BA83BA90(uint64_t a1, uint64_t a2, double a3)
{
  if (!*(unsigned char *)a1 && !*(unsigned char *)(a1 + 1)) {
    return;
  }
  unint64_t v6 = a1 + 80;
  std::mutex::lock((std::mutex *)(a1 + 80));
  unint64_t v7 = (void *)(a1 + 16);
  char v8 = *(unsigned char *)(a2 + 23);
  int v9 = v8;
  unint64_t v10 = *(void *)(a2 + 8);
  __vImage_Buffer src = *(uint64_t **)a2;
  if (v8 >= 0) {
    uint64_t v11 = (uint64_t *)a2;
  }
  else {
    uint64_t v11 = *(uint64_t **)a2;
  }
  if (v8 >= 0) {
    unint64_t v12 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    unint64_t v12 = *(void *)(a2 + 8);
  }
  unint64_t v13 = sub_1BA81EF84(v11, v12);
  unint64_t v14 = v13;
  unint64_t v15 = *(void *)(a1 + 24);
  if (v15)
  {
    uint8x8_t v16 = (uint8x8_t)vcnt_s8((int8x8_t)v15);
    v16.i16[0] = vaddlv_u8(v16);
    if (v16.u32[0] > 1uLL)
    {
      unint64_t v6 = v13;
      if (v13 >= v15) {
        unint64_t v6 = v13 % v15;
      }
    }
    else
    {
      unint64_t v6 = (v15 - 1) & v13;
    }
    uint64_t v17 = *(void **)(*v7 + 8 * v6);
    if (v17)
    {
      unint64_t v18 = (void *)*v17;
      if (*v17)
      {
        if (v16.u32[0] < 2uLL)
        {
          unint64_t v19 = v15 - 1;
          while (1)
          {
            uint64_t v24 = v18[1];
            if (v24 == v14)
            {
              uint64_t v25 = *((unsigned __int8 *)v18 + 39);
              if ((v25 & 0x80u) == 0) {
                uint64_t v26 = *((unsigned __int8 *)v18 + 39);
              }
              else {
                uint64_t v26 = v18[3];
              }
              if (v26 == v12)
              {
                if ((v25 & 0x80) != 0)
                {
                  unint64_t v81 = v19;
                  int v28 = memcmp((const void *)v18[2], v11, v18[3]);
                  unint64_t v19 = v81;
                  if (!v28) {
                    goto LABEL_93;
                  }
                }
                else
                {
                  if (!*((unsigned char *)v18 + 39)) {
                    goto LABEL_93;
                  }
                  uint64_t v27 = 0;
                  while (*((unsigned __int8 *)v18 + v27 + 16) == *((unsigned __int8 *)v11 + v27))
                  {
                    if (v25 == ++v27) {
                      goto LABEL_93;
                    }
                  }
                }
              }
            }
            else if ((v24 & v19) != v6)
            {
              goto LABEL_51;
            }
            unint64_t v18 = (void *)*v18;
            if (!v18) {
              goto LABEL_51;
            }
          }
        }
        do
        {
          unint64_t v20 = v18[1];
          if (v20 == v14)
          {
            uint64_t v21 = *((unsigned __int8 *)v18 + 39);
            if ((v21 & 0x80u) == 0) {
              uint64_t v22 = *((unsigned __int8 *)v18 + 39);
            }
            else {
              uint64_t v22 = v18[3];
            }
            if (v22 == v12)
            {
              if ((v21 & 0x80) != 0)
              {
                if (!memcmp((const void *)v18[2], v11, v18[3])) {
                  goto LABEL_93;
                }
              }
              else
              {
                if (!*((unsigned char *)v18 + 39)) {
                  goto LABEL_93;
                }
                uint64_t v23 = 0;
                while (*((unsigned __int8 *)v18 + v23 + 16) == *((unsigned __int8 *)v11 + v23))
                {
                  if (v21 == ++v23) {
                    goto LABEL_93;
                  }
                }
              }
            }
          }
          else
          {
            if (v20 >= v15) {
              v20 %= v15;
            }
            if (v20 != v6) {
              break;
            }
          }
          unint64_t v18 = (void *)*v18;
        }
        while (v18);
      }
LABEL_51:
      unint64_t v7 = (void *)(a1 + 16);
    }
  }
  uint64_t v29 = operator new(0x38uLL);
  unint64_t v30 = (void *)(a1 + 32);
  unint64_t v31 = v29 + 2;
  void *v29 = 0;
  v29[1] = v14;
  if (v9 < 0)
  {
    sub_1BA81F984(v31, __src, v10);
  }
  else
  {
    *(_OWORD *)unint64_t v31 = *(_OWORD *)a2;
    v29[4] = *(void *)(a2 + 16);
  }
  v29[5] = 0;
  v29[6] = 0;
  float v32 = (float)(unint64_t)(*(void *)(a1 + 40) + 1);
  float v33 = *(float *)(a1 + 48);
  if (!v15 || (float)(v33 * (float)v15) < v32)
  {
    BOOL v34 = 1;
    if (v15 >= 3) {
      BOOL v34 = (v15 & (v15 - 1)) != 0;
    }
    unint64_t v35 = v34 | (2 * v15);
    unint64_t v36 = vcvtps_u32_f32(v32 / v33);
    if (v35 <= v36) {
      size_t prime = v36;
    }
    else {
      size_t prime = v35;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
    }
    int8x8_t v38 = *(int8x8_t *)(a1 + 24);
    if (prime > *(void *)&v38) {
      goto LABEL_67;
    }
    if (prime < *(void *)&v38)
    {
      unint64_t v39 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 40) / *(float *)(a1 + 48));
      if (*(void *)&v38 < 3uLL || (uint8x8_t v40 = (uint8x8_t)vcnt_s8(v38), v40.i16[0] = vaddlv_u8(v40), v40.u32[0] > 1uLL))
      {
        unint64_t v39 = std::__next_prime(v39);
      }
      else
      {
        uint64_t v41 = 1 << -(char)__clz(v39 - 1);
        if (v39 >= 2) {
          unint64_t v39 = v41;
        }
      }
      if (prime <= v39) {
        size_t prime = v39;
      }
      if (prime < *(void *)&v38) {
LABEL_67:
      }
        sub_1BA83B840((uint64_t)v7, prime);
    }
    unint64_t v15 = *(void *)(a1 + 24);
    if ((v15 & (v15 - 1)) != 0)
    {
      if (v14 >= v15) {
        unint64_t v6 = v14 % v15;
      }
      else {
        unint64_t v6 = v14;
      }
    }
    else
    {
      unint64_t v6 = (v15 - 1) & v14;
    }
  }
  size_t v42 = *(void **)(*v7 + 8 * v6);
  if (v42)
  {
    void *v29 = *v42;
    *size_t v42 = v29;
  }
  else
  {
    void *v29 = *v30;
    void *v30 = v29;
    *(void *)(*v7 + 8 * v6) = v30;
    if (*v29)
    {
      unint64_t v43 = *(void *)(*v29 + 8);
      if ((v15 & (v15 - 1)) != 0)
      {
        if (v43 >= v15) {
          v43 %= v15;
        }
      }
      else
      {
        v43 &= v15 - 1;
      }
      *(void *)(*v7 + 8 * v43) = v29;
    }
  }
  unint64_t v18 = v29;
  ++*(void *)(a1 + 40);
LABEL_93:
  if (!v18[5])
  {
    uint64_t v56 = operator new(0x68uLL);
    v56[1] = 0;
    v56[2] = 0;
    *uint64_t v56 = &unk_1F142F220;
    sub_1BA83B608(v56 + 3, 100);
    float v57 = (std::__shared_weak_count *)v18[6];
    v18[5] = v56 + 3;
    v18[6] = v56;
    if (v57)
    {
      if (!atomic_fetch_add(&v57->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
        std::__shared_weak_count::__release_weak(v57);
      }
    }
  }
  if (!*(unsigned char *)(a1 + 56))
  {
    NSLog(&cfstr_CvaphotoBeginp.isa);
    abort();
  }
  double v44 = a3 - *(double *)(a1 + 64);
  uint64_t v45 = v18[5];
  int v46 = *(double **)v45;
  uint64_t v47 = *(double **)(v45 + 8);
  uint64_t v48 = ((uint64_t)v47 - *(void *)v45) >> 3;
  uint64_t v49 = *(void *)(v45 + 32);
  if (v44 >= 0.0)
  {
    if (v48 == v49)
    {
      if (v47 != v46)
      {
        float32x4_t v53 = *(double **)(v45 + 24);
        *float32x4_t v53 = v44;
        uint64_t v54 = v53 + 1;
        if (v54 != v47) {
          int v46 = v54;
        }
        *(void *)(v45 + 16) = v46;
        *(void *)(v45 + 24) = v46;
      }
      uint64_t v55 = (double *)(v45 + 48);
LABEL_121:
      double v68 = **(double **)(v45 + 16);
      if (v68 > v44)
      {
        double v69 = *v55 - (v68 - v44) / (double)(unint64_t)(v48 - 1);
LABEL_159:
        *uint64_t v55 = v69;
        goto LABEL_160;
      }
      if (v68 < v44)
      {
        double v72 = (v44 - v68) / (double)(unint64_t)(v48 - 1);
        double v73 = *v55;
LABEL_158:
        double v69 = v72 + v73;
        goto LABEL_159;
      }
LABEL_160:
      ++*(void *)(v45 + 56);
      *(double *)(v45 + 64) = v44 + *(double *)(v45 + 64);
      *(double *)(a1 + 72) = v44 + *(double *)(a1 + 72);
      if (!*(unsigned char *)(a1 + 56)) {
        *(unsigned char *)(a1 + 56) = 1;
      }
      *(double *)(a1 + 64) = a3;
      double v78 = v44 * 1000.0;
      unint64_t v79 = "";
      goto LABEL_163;
    }
    int32x4_t v64 = *(double **)(v45 + 24);
    *int32x4_t v64 = v44;
    int8x16_t v65 = v64 + 1;
    if (v65 == v47) {
      float v66 = v46;
    }
    else {
      float v66 = v65;
    }
    uint64_t v67 = v49 + 1;
    *(void *)(v45 + 24) = v66;
    *(void *)(v45 + 32) = v67;
    uint64_t v55 = (double *)(v45 + 48);
    if (v48 == v67) {
      goto LABEL_121;
    }
    double v72 = *v55;
    if (*v55 > v44)
    {
      if (v67)
      {
        int8x16_t v75 = &v46[v67];
        if (*(void *)(v45 + 16))
        {
LABEL_148:
          double v69 = v72 - (v72 - v44) / (double)(unint64_t)(v75 - v46);
          goto LABEL_159;
        }
      }
      else
      {
        int8x16_t v75 = v46;
      }
      v46 += v67;
      goto LABEL_148;
    }
    if (*v55 >= v44) {
      goto LABEL_160;
    }
    if (v67)
    {
      int32x4_t v77 = &v46[v67];
      if (*(void *)(v45 + 16))
      {
LABEL_157:
        double v73 = (v44 - v72) / (double)(unint64_t)(v77 - v46);
        goto LABEL_158;
      }
    }
    else
    {
      int32x4_t v77 = v46;
    }
    v46 += v67;
    goto LABEL_157;
  }
  if (v48 != v49)
  {
    uint64_t v58 = *(void **)(v45 + 24);
    *uint64_t v58 = 0;
    char v59 = (double *)(v58 + 1);
    if (v59 == v47) {
      float v60 = v46;
    }
    else {
      float v60 = v59;
    }
    uint64_t v61 = v49 + 1;
    *(void *)(v45 + 24) = v60;
    *(void *)(v45 + 32) = v61;
    uint64_t v52 = (double *)(v45 + 48);
    if (v48 == v61) {
      goto LABEL_115;
    }
    double v70 = *v52;
    if (*v52 > 0.0)
    {
      if (v61)
      {
        int8x16_t v74 = &v46[v61];
        if (*(void *)(v45 + 16))
        {
LABEL_145:
          double v63 = v70 - v70 / (double)(unint64_t)(v74 - v46);
          goto LABEL_153;
        }
      }
      else
      {
        int8x16_t v74 = v46;
      }
      v46 += v61;
      goto LABEL_145;
    }
    if (*v52 >= 0.0) {
      goto LABEL_154;
    }
    if (v61)
    {
      int32x4_t v76 = &v46[v61];
      if (*(void *)(v45 + 16))
      {
LABEL_151:
        double v71 = (0.0 - v70) / (double)(unint64_t)(v76 - v46);
        goto LABEL_152;
      }
    }
    else
    {
      int32x4_t v76 = v46;
    }
    v46 += v61;
    goto LABEL_151;
  }
  if (v47 != v46)
  {
    double v50 = *(void **)(v45 + 24);
    *double v50 = 0;
    double v51 = (double *)(v50 + 1);
    if (v51 != v47) {
      int v46 = v51;
    }
    *(void *)(v45 + 16) = v46;
    *(void *)(v45 + 24) = v46;
  }
  uint64_t v52 = (double *)(v45 + 48);
LABEL_115:
  double v62 = **(double **)(v45 + 16);
  if (v62 > 0.0)
  {
    double v63 = *v52 - v62 / (double)(unint64_t)(v48 - 1);
LABEL_153:
    *uint64_t v52 = v63;
    goto LABEL_154;
  }
  if (v62 < 0.0)
  {
    double v70 = (0.0 - v62) / (double)(unint64_t)(v48 - 1);
    double v71 = *v52;
LABEL_152:
    double v63 = v70 + v71;
    goto LABEL_153;
  }
LABEL_154:
  ++*(void *)(v45 + 56);
  double v78 = 0.0;
  *(double *)(v45 + 64) = *(double *)(v45 + 64) + 0.0;
  unint64_t v79 = ", overlapped";
LABEL_163:
  if (*(char *)(a2 + 23) < 0) {
    a2 = *(void *)a2;
  }
  uint64_t v80 = v18[5];
  if (*(unsigned char *)a1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s = %.1lf ms%s", a2, *(double *)(v80 + 48) * 1000.0, v79);
  }
  if (*(unsigned char *)(a1 + 1))
  {
    NSLog(&cfstr_CvaphotoProfil.isa, *(void *)(a1 + 8), a2, *(void *)&v78, v79);
    NSLog(&cfstr_CvaphotoProfil_0.isa, *(void *)(a1 + 8), a2, *(double *)(v80 + 64) / (double)*(unint64_t *)(v80 + 56) * 1000.0, v79);
  }

  std::mutex::unlock((std::mutex *)(a1 + 80));
}

void sub_1BA83C330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::mutex *a17, uint64_t a18)
{
}

void sub_1BA83C68C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA83C950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA83CF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  __cxa_guard_abort(&qword_1E9F766A0);
  _Unwind_Resume(a1);
}

void sub_1BA83D1B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA83D560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA83EFCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *__p,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45)
{
  __cxa_guard_abort(&qword_1E9F76BB0);
  _Unwind_Resume(a1);
}

uint64_t sub_1BA83F330(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1BA83F340(uint64_t a1)
{
}

void sub_1BA83F348(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([(id)qword_1E9F76B68 BOOLValue])
  {
    uint64_t v4 = **(void **)(a1 + 64);
    if (*(unsigned char *)(v4 + 1040))
    {
      if ((byte_1E9F76BB8 & 1) == 0)
      {
        unint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v5 createDirectoryAtPath:@"/tmp/_relit_model" withIntermediateDirectories:1 attributes:0 error:0];

        byte_1E9F76BB8 = 1;
        uint64_t v4 = **(void **)(a1 + 64);
      }
      unint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"/tmp/_relit_model/tc_dot_%04d.png", *(void *)(v4 + 376));
      NSLog(&stru_1F1433048.isa, v6);
      [**(id **)(a1 + 64) saveTexture:*(void *)(**(void **)(a1 + 64) + 80) toImage:v6];
    }
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 72));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 80));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 88));
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 40);
  [v3 GPUEndTime];
  char v18 = 11;
  strcpy((char *)__p, "Relight GPU");
  sub_1BA83BA90(v7, (uint64_t)__p, v8);
  if (v18 < 0)
  {
    operator delete(__p[0]);
    int v9 = *(NSObject **)(a1 + 40);
    if (v9) {
      goto LABEL_8;
    }
LABEL_10:
    int v9 = *(NSObject **)(*(void *)(a1 + 32) + 888);
    goto LABEL_8;
  }
  int v9 = *(NSObject **)(a1 + 40);
  if (!v9) {
    goto LABEL_10;
  }
LABEL_8:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1BA83F5A0;
  block[3] = &unk_1E62285D0;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 96);
  uint64_t v12 = *(void *)(a1 + 56);
  id v14 = v10;
  uint64_t v15 = v12;
  uint64_t v16 = v11;
  dispatch_async(v9, block);
}

void sub_1BA83F568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  _Unwind_Resume(a1);
}

intptr_t sub_1BA83F5A0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
  id v3 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return dispatch_semaphore_signal(v3);
}

void sub_1BA83F6D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA83F850(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA83FD00(_Unwind_Exception *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);

  sub_1BA81651C(va);
  _Unwind_Resume(a1);
}

void sub_1BA83FE38()
{
  int v0 = dlopen("/System/Library/PrivateFrameworks/AppleCVA.framework/AppleCVA", 4);
  if (!v0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dlopen \"/System/Library/PrivateFrameworks/AppleCVA.framework/AppleCVA\"";
    goto LABEL_127;
  }
  unint64_t v1 = v0;
  uint64_t v2 = (uint64_t (*)(void))dlsym(v0, "CVAFaceTrackingGetAPIVersion");
  off_1E9F767E8 = v2;
  if (!v2)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dlsym func for CVAFaceTrackingGetAPIVersion";
    goto LABEL_127;
  }
  if ((int)v2() <= 14)
  {
    uint64_t v3 = off_1E9F767E8();
    NSLog(&cfstr_Cvafacetrackin_0.isa, 15, v3);
    goto LABEL_128;
  }
  unint64_t v6 = (uint64_t *)dlsym(v1, "kCVAFaceTracking_HoleFilledMesh");
  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dlsym ptr for kCVAFaceTracking_HoleFilledMesh";
    goto LABEL_127;
  }
  qword_1E9F76810 = *v6;
  if (!qword_1E9F76810)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dereference dlsym ptr for kCVAFaceTracking_HoleFilledMesh";
    goto LABEL_127;
  }
  uint64_t v7 = (uint64_t *)dlsym(v1, "kCVAFaceTracking_TriangulatedMesh");
  if (!v7)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dlsym ptr for kCVAFaceTracking_TriangulatedMesh";
    goto LABEL_127;
  }
  qword_1E9F76830 = *v7;
  if (!qword_1E9F76830)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dereference dlsym ptr for kCVAFaceTracking_TriangulatedMesh";
    goto LABEL_127;
  }
  off_1E9F767E0 = dlsym(v1, "CVAFaceTrackingCopySemantics");
  if (!off_1E9F767E0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dlsym func for CVAFaceTrackingCopySemantics";
    goto LABEL_127;
  }
  double v8 = (uint64_t *)dlsym(v1, "kCVAFaceTracking_Mesh");
  if (!v8)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dlsym ptr for kCVAFaceTracking_Mesh";
    goto LABEL_127;
  }
  qword_1E9F767A0 = *v8;
  if (!qword_1E9F767A0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dereference dlsym ptr for kCVAFaceTracking_Mesh";
    goto LABEL_127;
  }
  int v9 = (uint64_t *)dlsym(v1, "kCVAFaceTracking_MeshTriIndices");
  if (!v9)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dlsym ptr for kCVAFaceTracking_MeshTriIndices";
    goto LABEL_127;
  }
  qword_1E9F76818 = *v9;
  if (!qword_1E9F76818)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dereference dlsym ptr for kCVAFaceTracking_MeshTriIndices";
    goto LABEL_127;
  }
  id v10 = (uint64_t *)dlsym(v1, "kCVAFaceTracking_MeshQuadIndices");
  if (!v10)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dlsym ptr for kCVAFaceTracking_MeshQuadIndices";
    goto LABEL_127;
  }
  qword_1E9F76820 = *v10;
  if (!qword_1E9F76820)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dereference dlsym ptr for kCVAFaceTracking_MeshQuadIndices";
    goto LABEL_127;
  }
  uint64_t v11 = (uint64_t *)dlsym(v1, "kCVAFaceTracking_MeshTexcoords");
  if (!v11)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dlsym ptr for kCVAFaceTracking_MeshTexcoords";
    goto LABEL_127;
  }
  qword_1E9F76808 = *v11;
  if (!qword_1E9F76808)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dereference dlsym ptr for kCVAFaceTracking_MeshTexcoords";
    goto LABEL_127;
  }
  uint64_t v12 = (uint64_t *)dlsym(v1, "kCVAFaceTracking_LandmarkNames");
  if (!v12)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dlsym ptr for kCVAFaceTracking_LandmarkNames";
    goto LABEL_127;
  }
  qword_1E9F76800 = *v12;
  if (!qword_1E9F76800)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dereference dlsym ptr for kCVAFaceTracking_LandmarkNames";
    goto LABEL_127;
  }
  unint64_t v13 = (uint64_t *)dlsym(v1, "kCVAFaceTracking_TrackedFacesArray");
  if (!v13)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dlsym ptr for kCVAFaceTracking_TrackedFacesArray";
    goto LABEL_127;
  }
  qword_1E9F76840 = *v13;
  if (!qword_1E9F76840)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dereference dlsym ptr for kCVAFaceTracking_TrackedFacesArray";
    goto LABEL_127;
  }
  id v14 = (uint64_t *)dlsym(v1, "kCVAFaceTracking_Confidence");
  if (!v14)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dlsym ptr for kCVAFaceTracking_Confidence";
    goto LABEL_127;
  }
  qword_1E9F767C0 = *v14;
  if (!qword_1E9F767C0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dereference dlsym ptr for kCVAFaceTracking_Confidence";
    goto LABEL_127;
  }
  uint64_t v15 = (uint64_t *)dlsym(v1, "kCVAFaceTracking_CameraColor");
  if (!v15)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dlsym ptr for kCVAFaceTracking_CameraColor";
    goto LABEL_127;
  }
  qword_1E9F767F0 = *v15;
  if (!qword_1E9F767F0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dereference dlsym ptr for kCVAFaceTracking_CameraColor";
    goto LABEL_127;
  }
  uint64_t v16 = (uint64_t *)dlsym(v1, "kCVAFaceTracking_Intrinsics");
  if (!v16)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dlsym ptr for kCVAFaceTracking_Intrinsics";
    goto LABEL_127;
  }
  qword_1E9F767D0 = *v16;
  if (!qword_1E9F767D0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dereference dlsym ptr for kCVAFaceTracking_Intrinsics";
    goto LABEL_127;
  }
  uint64_t v17 = (uint64_t *)dlsym(v1, "kCVAFaceTracking_Extrinsics");
  if (!v17)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dlsym ptr for kCVAFaceTracking_Extrinsics";
    goto LABEL_127;
  }
  qword_1E9F767C8 = *v17;
  if (!qword_1E9F767C8)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dereference dlsym ptr for kCVAFaceTracking_Extrinsics";
    goto LABEL_127;
  }
  char v18 = (uint64_t *)dlsym(v1, "kCVAFaceTracking_Rotation");
  if (!v18)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dlsym ptr for kCVAFaceTracking_Rotation";
    goto LABEL_127;
  }
  qword_1E9F767B8 = *v18;
  if (!qword_1E9F767B8)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dereference dlsym ptr for kCVAFaceTracking_Rotation";
    goto LABEL_127;
  }
  unint64_t v19 = (uint64_t *)dlsym(v1, "kCVAFaceTracking_Translation");
  if (!v19)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dlsym ptr for kCVAFaceTracking_Translation";
    goto LABEL_127;
  }
  qword_1E9F767F8 = *v19;
  if (!qword_1E9F767F8)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dereference dlsym ptr for kCVAFaceTracking_Translation";
    goto LABEL_127;
  }
  unint64_t v20 = (uint64_t *)dlsym(v1, "kCVAFaceTracking_SmoothData");
  if (!v20)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dlsym ptr for kCVAFaceTracking_SmoothData";
    goto LABEL_127;
  }
  qword_1E9F767D8 = *v20;
  if (!qword_1E9F767D8)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dereference dlsym ptr for kCVAFaceTracking_SmoothData";
    goto LABEL_127;
  }
  uint64_t v21 = (uint64_t *)dlsym(v1, "kCVAFaceTracking_Pose");
  if (!v21)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dlsym ptr for kCVAFaceTracking_Pose";
    goto LABEL_127;
  }
  qword_1E9F767A8 = *v21;
  if (!qword_1E9F767A8)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dereference dlsym ptr for kCVAFaceTracking_Pose";
    goto LABEL_127;
  }
  uint64_t v22 = (uint64_t *)dlsym(v1, "kCVAFaceTracking_Geometry");
  if (!v22)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dlsym ptr for kCVAFaceTracking_Geometry";
    goto LABEL_127;
  }
  qword_1E9F767B0 = *v22;
  if (!qword_1E9F767B0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dereference dlsym ptr for kCVAFaceTracking_Geometry";
    goto LABEL_127;
  }
  uint64_t v23 = (uint64_t *)dlsym(v1, "kCVAFaceTracking_GeometryVertices");
  if (!v23)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dlsym ptr for kCVAFaceTracking_GeometryVertices";
    goto LABEL_127;
  }
  qword_1E9F76828 = *v23;
  if (!qword_1E9F76828)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dereference dlsym ptr for kCVAFaceTracking_GeometryVertices";
    goto LABEL_127;
  }
  uint64_t v24 = (uint64_t *)dlsym(v1, "kCVAFaceTracking_GeometryLandmarks");
  if (!v24)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dlsym ptr for kCVAFaceTracking_GeometryLandmarks";
    goto LABEL_127;
  }
  qword_1E9F76838 = *v24;
  if (qword_1E9F76838)
  {
    byte_1E9F768A8 = 1;
    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    unint64_t v5 = "> > > CVAPhoto failed to dereference dlsym ptr for kCVAFaceTracking_GeometryLandmarks";
LABEL_127:
    _os_log_impl(&dword_1BA813000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
  }
LABEL_128:
  if ((byte_1E9F768A8 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA813000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "> > > CVAPhoto has detected incompatible CVAFaceTracking's API. Face effects are disabled.", buf, 2u);
  }
}

void sub_1BA840A3C(uint64_t a1)
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(uint64_t **)(a1 + 8);
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 376);
  if (!v4)
  {
    float v5 = 0.0;
    if (*(unsigned char *)(v3 + 1041)) {
      float v5 = 1.0;
    }
    *(float *)(v3 + 864) = v5;
    uint64_t v3 = *v2;
    uint64_t v4 = *(void *)(*v2 + 376);
  }
  if (v4 > 2)
  {
    unint64_t v6 = (void *)(v3 + 1048);
    uint64_t v7 = *(void *)(v3 + 1048);
    double v8 = *(unsigned char **)(v3 + 1056);
    int v9 = *(unsigned char **)(v3 + 1080);
    if (&v8[-v7] == v9)
    {
      if (v8 != (unsigned char *)v7)
      {
        id v10 = *(unsigned char **)(v3 + 1072);
        unsigned char *v10 = *(unsigned char *)(v3 + 1041);
        uint64_t v11 = v10 + 1;
        if (v11 == v8) {
          uint64_t v12 = (unsigned char *)v7;
        }
        else {
          uint64_t v12 = v11;
        }
        v6[2] = v12;
        v6[3] = v12;
      }
    }
    else
    {
      unint64_t v13 = *(unsigned char **)(v3 + 1072);
      *unint64_t v13 = *(unsigned char *)(v3 + 1041);
      id v14 = v13 + 1;
      if (v14 == v8) {
        uint64_t v15 = (unsigned char *)v7;
      }
      else {
        uint64_t v15 = v14;
      }
      v6[3] = v15;
      v6[4] = v9 + 1;
    }
  }
  uint64_t v16 = *(uint64_t **)(a1 + 8);
  uint64_t v17 = *v16;
  if (*(unsigned char *)(*v16 + 1041))
  {
    uint64_t v18 = v17 + 1088;
    uint64_t v19 = v17 + 976;
    uint64_t v21 = *(_DWORD **)(v18 + 8);
    unint64_t v20 = *(_DWORD **)(v18 + 16);
    uint64_t v22 = v20 - v21;
    uint64_t v23 = *(void *)(v18 + 40);
    if (v22 == v23)
    {
      if (v20 != v21)
      {
        uint64_t v24 = *(_DWORD **)(v18 + 32);
        *uint64_t v24 = *(_DWORD *)(v19 + 56);
        uint64_t v25 = v24 + 1;
        if (v25 == v20) {
          uint64_t v26 = v21;
        }
        else {
          uint64_t v26 = v25;
        }
        *(void *)(v18 + 24) = v26;
        *(void *)(v18 + 32) = v26;
      }
      uint64_t v27 = (float *)(v18 + 52);
      BOOL v28 = 1;
LABEL_31:
      float v38 = **(float **)(v18 + 24);
      float v39 = *(float *)(v19 + 56);
      if (v38 <= v39)
      {
        if (v38 >= v39)
        {
          float v40 = *v27;
          goto LABEL_79;
        }
        float v40 = *v27 + (float)((float)(v39 - v38) / (float)(unint64_t)(v22 - 1));
      }
      else
      {
        float v40 = *v27 - (float)((float)(v38 - v39) / (float)(unint64_t)(v22 - 1));
      }
      goto LABEL_78;
    }
    BOOL v34 = *(_DWORD **)(v18 + 32);
    *BOOL v34 = *(_DWORD *)(v19 + 56);
    unint64_t v35 = v34 + 1;
    if (v35 == v20) {
      unint64_t v36 = v21;
    }
    else {
      unint64_t v36 = v35;
    }
    uint64_t v37 = v23 + 1;
    *(void *)(v18 + 32) = v36;
    *(void *)(v18 + 40) = v23 + 1;
    uint64_t v27 = (float *)(v18 + 52);
    BOOL v28 = v22 == v37;
    if (v22 == v37) {
      goto LABEL_31;
    }
    float v40 = *v27;
    float v39 = *(float *)(v19 + 56);
    if (*v27 > v39)
    {
      float v41 = v40 - v39;
      if (v37)
      {
        size_t v42 = &v21[v37];
        if (*(void *)(v18 + 24))
        {
LABEL_74:
          float v40 = v40 - (float)(v41 / (float)(unint64_t)(v42 - v21));
LABEL_78:
          *uint64_t v27 = v40;
          float v39 = *(float *)(v19 + 56);
LABEL_79:
          float v55 = *(float *)(v18 + 56);
          float v56 = *(float *)(v18 + 60) + (float)((float)(v39 - v40) * (float)(v39 - v55));
          *(float *)(v18 + 60) = v56;
          if (v28)
          {
            float v57 = v56 - (float)((float)(**(float **)(v18 + 24) - v40) * (float)(**(float **)(v18 + 24) - v55));
            *(float *)(v18 + 60) = v57;
            if (v57 < 0.0) {
              *(_DWORD *)(v18 + 60) = 0;
            }
          }
          *(float *)(v18 + 56) = v40;
          goto LABEL_83;
        }
      }
      else
      {
        size_t v42 = v21;
      }
      v21 += v37;
      goto LABEL_74;
    }
    if (*v27 >= v39) {
      goto LABEL_79;
    }
    float v53 = v39 - v40;
    if (v37)
    {
      uint64_t v54 = &v21[v37];
      if (*(void *)(v18 + 24))
      {
LABEL_77:
        float v40 = v40 + (float)(v53 / (float)(unint64_t)(v54 - v21));
        goto LABEL_78;
      }
    }
    else
    {
      uint64_t v54 = v21;
    }
    v21 += v37;
    goto LABEL_77;
  }
  sub_1BA841104((uint64_t)&v79, 5);
  char v87 = 0;
  uint64_t v29 = v83;
  uint64_t v92 = v83;
  unint64_t v31 = (int *)v79;
  unint64_t v30 = v80;
  uint64_t v32 = (char *)v80 - (unsigned char *)v79;
  if ((char *)v80 - (unsigned char *)v79 < 0)
  {
    std::logic_error::logic_error(&v86, "circular_buffer");
    v86.__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
    abort();
  }
  if (v80 == v79) {
    float v33 = 0;
  }
  else {
    float v33 = (char *)operator new((char *)v80 - (unsigned char *)v79);
  }
  __p = v33;
  uint64_t v89 = &v33[4 * (v32 >> 2)];
  size_t v90 = v33;
  unint64_t v43 = v33;
  if (v29)
  {
    double v44 = v81;
    unint64_t v43 = v33;
    if (v81)
    {
      uint64_t v45 = v82;
      unint64_t v43 = v33;
      do
      {
        int v46 = *v44++;
        *(_DWORD *)unint64_t v43 = v46;
        v43 += 4;
        if (v44 == v30) {
          double v44 = v31;
        }
      }
      while (v44 != v45 && v44 != 0);
    }
  }
  if (v43 == &v33[4 * (v32 >> 2)]) {
    uint64_t v48 = v33;
  }
  else {
    uint64_t v48 = v43;
  }
  short float v91 = v48;
  int v93 = v84;
  uint64_t v94 = v85;
  char v87 = 1;
  uint64_t v49 = **(void **)(a1 + 8) + 1088;
  double v50 = (void **)(**(void **)(a1 + 8) + 1096);
  if (*(unsigned char *)v49)
  {
    sub_1BA84120C(v50, &__p);
    *(_DWORD *)(v49 + 52) = v93;
    *(void *)(v49 + 56) = v94;
    if (!v87) {
      goto LABEL_63;
    }
LABEL_58:
    unint64_t v51 = (unint64_t)(v89 - (unsigned char *)__p) >> 2;
    if (v92 < (v89 - v90) >> 2) {
      unint64_t v51 = 0;
    }
    v90 += 4 * (v92 - v51);
    if (__p) {
      operator delete(__p);
    }
    char v87 = 0;
    goto LABEL_63;
  }
  sub_1BA841364(v50, (int **)&__p);
  *(_DWORD *)(v49 + 52) = v93;
  *(void *)(v49 + 56) = v94;
  *(unsigned char *)uint64_t v49 = 1;
  if (v87) {
    goto LABEL_58;
  }
LABEL_63:
  unint64_t v52 = (unint64_t)((char *)v80 - (unsigned char *)v79) >> 2;
  if (v83 < v80 - v81) {
    unint64_t v52 = 0;
  }
  v81 += v83 - v52;
  if (v79) {
    operator delete(v79);
  }
LABEL_83:
  uint64_t v58 = **(void **)(a1 + 8);
  char v59 = *(unsigned char **)(v58 + 1056);
  float v60 = *(unsigned char **)(v58 + 1080);
  if (&v59[-*(void *)(v58 + 1048)] == v60)
  {
    uint64_t v61 = *(void *)(v58 + 1128);
    if (v61)
    {
      uint64_t v62 = *(void *)(v58 + 1096);
      uint64_t v63 = v62 + 4 * v61;
      uint64_t v64 = v62;
      if (*(void *)(v58 + 1112))
      {
LABEL_89:
        unint64_t v65 = ((v63 - v64) >> 2) - (v61 == (*(void *)(v58 + 1104) - v62) >> 2);
        if (v65 >= 2 && (float)(*(float *)(v58 + 1148) / (float)(v65 - 1)) > 0.0049) {
          goto LABEL_91;
        }
        goto LABEL_92;
      }
    }
    else
    {
      uint64_t v62 = *(void *)(v58 + 1096);
      uint64_t v63 = v62;
    }
    uint64_t v64 = v62 + 4 * v61;
    goto LABEL_89;
  }
LABEL_92:
  if (!v60) {
    goto LABEL_103;
  }
  double v69 = *(unsigned char **)(v58 + 1064);
  if (!v69) {
    goto LABEL_103;
  }
  while (*v69)
  {
    if (v69 + 1 == v59) {
      double v69 = *(unsigned char **)(v58 + 1048);
    }
    else {
      ++v69;
    }
    if (v69) {
      BOOL v70 = v69 == *(unsigned char **)(v58 + 1072);
    }
    else {
      BOOL v70 = 1;
    }
    if (v70) {
      goto LABEL_103;
    }
  }
LABEL_91:
  uint64_t v66 = *(void *)(v58 + 376);
  uint64_t v67 = [*(id *)(v58 + 48) proxyToFaceEffectLerpNumFrames];
  double v68 = *(uint64_t **)(a1 + 8);
  *(void *)(*v68 + 384) = v67 + v66;
  uint64_t v58 = *v68;
LABEL_103:
  if (*(void *)(v58 + 376) >= *(void *)(v58 + 384))
  {
    *(void *)(v58 + 384) = 0;
  }
  else
  {
    uint64_t v71 = v58 + 976;
    double v72 = *(void **)(v58 + 976);
    *(void *)(v58 + 976) = 0;

    double v73 = *(void **)(v71 + 8);
    *(void *)(v71 + 8) = 0;

    int8x16_t v74 = *(void **)(v71 + 16);
    *(void *)(v71 + 16) = 0;

    int8x16_t v75 = *(void **)(v71 + 24);
    *(void *)(v71 + 24) = 0;

    int32x4_t v76 = *(void **)(v71 + 32);
    *(void *)(v71 + 32) = 0;

    int32x4_t v77 = *(void **)(v71 + 40);
    *(void *)(v71 + 40) = 0;

    double v78 = *(void **)(v71 + 48);
    *(void *)(v71 + 48) = 0;

    *(_DWORD *)(v71 + 56) = 0;
    *(unsigned char *)(**(void **)(a1 + 8) + 1040) = 0;
  }
}

void sub_1BA841104(uint64_t a1, int a2)
{
  v5[4] = 0;
  if (a2 <= -2)
  {
    std::logic_error::logic_error(&v6, "circular_buffer");
    v6.__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
    abort();
  }
  uint64_t v3 = a2 + 1;
  if (a2 == -1) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = (int *)operator new(4 * (a2 + 1));
  }
  v5[0] = v4;
  v5[1] = &v4[v3];
  v5[2] = v4;
  void v5[3] = v4;
  sub_1BA841364((void *)a1, v5);
  *(_DWORD *)(a1 + 44) = 0;
  *(void *)(a1 + 48) = 0;
  if (v4)
  {
    operator delete(v4);
  }
}

void sub_1BA8411E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1BA84146C((uint64_t)va);
  _Unwind_Resume(a1);
}

void **sub_1BA84120C(void **a1, void **a2)
{
  if (a1 != a2)
  {
    float v5 = (char *)*a2;
    uint64_t v4 = (char *)a2[1];
    uint64_t v6 = v4 - (unsigned char *)*a2;
    if (v6 < 0)
    {
      std::logic_error::logic_error(&v23, "circular_buffer");
      v23.__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
      abort();
    }
    if (v4 == v5) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = (char *)operator new(v4 - (unsigned char *)*a2);
    }
    double v8 = v7;
    if (a2[4])
    {
      int v9 = (int *)a2[2];
      double v8 = v7;
      if (v9)
      {
        id v10 = (int *)a2[3];
        double v8 = v7;
        do
        {
          int v11 = *v9++;
          *(_DWORD *)double v8 = v11;
          v8 += 4;
          if (v9 == (int *)v4) {
            int v9 = (int *)v5;
          }
        }
        while (v9 != v10 && v9 != 0);
      }
    }
    uint64_t v13 = v6 >> 2;
    uint64_t v15 = a1[1];
    id v14 = a1[2];
    uint64_t v16 = (uint64_t)a1[4];
    uint64_t v17 = *a1;
    uint64_t v18 = v15 - v14;
    unint64_t v19 = (unint64_t)(v15 - (unsigned char *)*a1) >> 2;
    if (v16 < v18 >> 2) {
      unint64_t v19 = 0;
    }
    a1[2] = &v14[4 * (v16 - v19)];
    if (v17) {
      operator delete(v17);
    }
    unint64_t v20 = &v7[4 * v13];
    *a1 = v7;
    a1[1] = v20;
    if (v20 == v8) {
      uint64_t v21 = v7;
    }
    else {
      uint64_t v21 = v8;
    }
    a1[2] = v7;
    a1[3] = v21;
    a1[4] = (void *)((v8 - v7) >> 2);
  }
  return a1;
}

void *sub_1BA841364(void *a1, int **a2)
{
  a1[4] = a2[4];
  uint64_t v3 = a2[1];
  int64_t v4 = (char *)v3 - (char *)*a2;
  if (v4 < 0)
  {
    std::logic_error::logic_error(&v18, "circular_buffer");
    v18.__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
    abort();
  }
  uint64_t v6 = v4 >> 2;
  if (v3 == *a2) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = operator new(v4);
  }
  double v8 = &v7[v6];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v7;
  int v9 = v7;
  if (a2[4])
  {
    id v10 = a2[2];
    int v9 = v7;
    if (v10)
    {
      int v11 = a2[3];
      int v9 = v7;
      uint64_t v13 = *a2;
      uint64_t v12 = a2[1];
      do
      {
        int v14 = *v10++;
        *v9++ = v14;
        if (v10 == v12) {
          id v10 = v13;
        }
      }
      while (v10 != v11 && v10 != 0);
    }
  }
  if (v9 == v8) {
    uint64_t v16 = v7;
  }
  else {
    uint64_t v16 = v9;
  }
  a1[3] = v16;
  return a1;
}

uint64_t sub_1BA84146C(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 32);
  float v5 = *(void **)a1;
  uint64_t v6 = v3 - v2;
  unint64_t v7 = (unint64_t)(v3 - (void)v5) >> 2;
  if (v4 < v6 >> 2) {
    unint64_t v7 = 0;
  }
  *(void *)(a1 + 16) = v2 + 4 * (v4 - v7);
  if (v5) {
    operator delete(v5);
  }
  return a1;
}

uint64_t sub_1BA8414CC(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1F142EE78;
  a2[1] = v2;
  return result;
}

void *sub_1BA8414F0(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1F142EE78;
  result[1] = v3;
  return result;
}

void sub_1BA841538()
{
}

void sub_1BA84169C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA84180C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA84197C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA841DA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  __cxa_guard_abort(&qword_1E9F76AF0);

  _Unwind_Resume(a1);
}

void sub_1BA841F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA842518(_Unwind_Exception *a1)
{
}

void sub_1BA842530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a23 < 0)
  {
    operator delete(__p);
    if (a17 < 0)
    {
LABEL_5:
      operator delete(a12);
      if ((a29 & 0x80000000) == 0) {
LABEL_9:
      }
        _Unwind_Resume(a1);
LABEL_8:
      operator delete(a24);
      _Unwind_Resume(a1);
    }
  }
  else if (a17 < 0)
  {
    goto LABEL_5;
  }
  if ((a29 & 0x80000000) == 0) {
    goto LABEL_9;
  }
  goto LABEL_8;
}

void sub_1BA8429CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  _Unwind_Resume(a1);
}

void sub_1BA844314(_Unwind_Exception *a1)
{
}

void sub_1BA8443C8(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 - 153) < 0) {
    operator delete(*(void **)(v1 - 176));
  }
  _Unwind_Resume(exception_object);
}

void sub_1BA844408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA844C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA844DFC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1BA8450A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA8454D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA845534(int a1, void *a2)
{
}

void sub_1BA845608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA846AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1BA846C50(uint64_t a1)
{
  if (*(unsigned char *)a1)
  {
    uint64_t v3 = *(void *)(a1 + 16);
    uint64_t v2 = *(void *)(a1 + 24);
    uint64_t v4 = *(void *)(a1 + 40);
    float v5 = *(void **)(a1 + 8);
    uint64_t v6 = v3 - v2;
    unint64_t v7 = (unint64_t)(v3 - (void)v5) >> 2;
    if (v4 < v6 >> 2) {
      unint64_t v7 = 0;
    }
    *(void *)(a1 + 24) = v2 + 4 * (v4 - v7);
    if (v5) {
      operator delete(v5);
    }
    *(unsigned char *)a1 = 0;
  }
  return a1;
}

void **sub_1BA846CB4(void **a1)
{
  uint64_t v2 = (char *)*a1;
  if (*a1)
  {
    uint64_t v3 = (char *)a1[1];
    uint64_t v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        float v5 = (void *)*((void *)v3 - 1);
        v3 -= 8;
      }
      while (v3 != v2);
      uint64_t v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void sub_1BA846E48(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_1E9F769E0);
  _Unwind_Resume(a1);
}

void sub_1BA846F10(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BA847C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20)
{
  if (v20)
  {
    for (; v27 != v20; v27 -= 3)
    {
    }
    operator delete(v20);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_1BA847E98(uint64_t a1)
{
  return a1;
}

void sub_1BA848290(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_1E9F769D0);
  _Unwind_Resume(a1);
}

void sub_1BA8482B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1BA848474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA84849C(uint64_t a1@<X0>, __CVBuffer *a2@<X1>, int a3@<W2>, void *a4@<X3>, uint64_t a5@<X8>, float a6@<S0>)
{
  uint64_t v222 = *MEMORY[0x1E4F143B8];
  if (sub_1BA849834())
  {
    if (*(_DWORD *)(a1 + 80)) {
      uint64_t v12 = @"FOCUSMODE_REGION, ";
    }
    else {
      uint64_t v12 = @"FOCUSMODE_GLOBAL_DISPARITY_HISTOGRAM, ";
    }
    uint64_t v13 = v12;
    int v14 = [(__CFString *)v13 stringByAppendingString:*(&off_1E6228650 + *(unsigned int *)(a1 + 104))];

    uint64_t v15 = @"no";
    if (a3) {
      uint64_t v15 = @"yes";
    }
    [NSString stringWithFormat:@"facesArray.len=%ld, useFaceAsFocus=%@", (uint64_t)(a4[1] - *a4) >> 4, v15];
  }
  if (!*(_DWORD *)(a1 + 80))
  {
    for (unint64_t i = 0; i != 256; ++i)
    {
      if (*(float *)(a1 + 4 * i + 116) > 0.85) {
        break;
      }
    }
    float v34 = *(float *)(a1 + 1152)
        + (float)((float)((float)i * 0.0039062) * (float)(*(float *)(a1 + 1156) - *(float *)(a1 + 1152)));
    if (*(float *)a1 < 2048.0) {
      float v34 = *(float *)a1 + (float)((float)(v34 - *(float *)a1) * 0.2);
    }
    *(float *)a1 = v34;
    goto LABEL_251;
  }
  int v206 = a3;
  unint64_t v207 = a4;
  if (sub_1BA849834())
  {
    objc_msgSend(NSString, "stringWithFormat:", @"input._foregroundPercentile = %d%%", (int)(float)(*(float *)(a1 + 1148) * 100.0));
  }
  float v16 = *(float *)(a1 + 1148);
  float v17 = *(float *)(a1 + 1152);
  float v18 = *(float *)(a1 + 1156);
  int Width = CVPixelBufferGetWidth(a2);
  int Height = CVPixelBufferGetHeight(a2);
  float v21 = *(float *)(a1 + 84);
  float v22 = *(float *)(a1 + 88);
  float v23 = *(float *)(a1 + 92);
  float v24 = (float)Width;
  int v25 = (int)(float)(v21 * (float)Width);
  float v26 = (float)Height;
  int v27 = (int)(float)(v22 * (float)Height);
  if (v23 <= 0.0 || (float v28 = *(float *)(a1 + 96), v28 <= 0.0))
  {
    int v35 = Height + Width;
    if (Height + Width < 0 != __OFADD__(Height, Width)) {
      ++v35;
    }
    int v36 = (int)((double)(v35 >> 1) * 0.1);
    unsigned int v29 = (v25 - v36) & ~((v25 - v36) >> 31);
    signed int v37 = v36 + v25;
    if (v37 >= Width) {
      unsigned int v30 = Width;
    }
    else {
      unsigned int v30 = v37;
    }
    unsigned int v31 = (v27 - v36) & ~((v27 - v36) >> 31);
    int v38 = v36 + v27;
    if (v38 >= Height) {
      int v32 = Height;
    }
    else {
      int v32 = v38;
    }
    float v21 = (float)(int)v29 / v24;
    float v22 = (float)(int)v31 / v26;
    float v23 = (float)((float)(int)v29 + (float)(int)v30) / v24;
    float v28 = (float)((float)(int)v31 + (float)v32) / v26;
  }
  else
  {
    unsigned int v29 = v25 & ~(v25 >> 31);
    if ((int)(float)((float)(v21 + v23) * v24) >= Width) {
      unsigned int v30 = Width;
    }
    else {
      unsigned int v30 = (int)(float)((float)(v21 + v23) * v24);
    }
    unsigned int v31 = v27 & ~(v27 >> 31);
    if ((int)(float)((float)(v22 + v28) * v26) >= Height) {
      int v32 = Height;
    }
    else {
      int v32 = (int)(float)((float)(v22 + v28) * v26);
    }
  }
  double v39 = v28;
  double v40 = v23;
  double v41 = v22;
  double v42 = v21;
  int v43 = *(_DWORD *)(a1 + 104);
  if (v43 != 2)
  {
    if (!*(unsigned char *)(a1 + 1216))
    {
      sub_1BA849834();
      CVPixelBufferLockBaseAddress(a2, 1uLL);
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a2);
      CVPixelBufferGetHeight(a2);
      CVPixelBufferGetWidth(a2);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a2);
      unsigned int v47 = 0;
      float v46 = 0.0;
      if ((int)v31 < v32 && (int)v29 < (int)v30)
      {
        uint64_t v63 = v31;
        unint64_t v64 = v30 - (unint64_t)v29;
        if (v64 >= 8)
        {
          unsigned int v47 = 0;
          unint64_t v106 = (float32x4_t *)&BaseAddress[4 * v29 + BytesPerRow * v31];
          uint64_t v107 = v106 + 1;
          f32 = v106[2 * (v64 >> 3)].f32;
          v109.i64[0] = 0x4500000045000000;
          v109.i64[1] = 0x4500000045000000;
          v110.i64[0] = 0x8000000080000000;
          v110.i64[1] = 0x8000000080000000;
          do
          {
            int32x4_t v111 = 0uLL;
            int32x4_t v112 = (int32x4_t)v47;
            BOOL v113 = v107;
            unint64_t v114 = v64 & 0xFFFFFFFFFFFFFFF8;
            do
            {
              float32x4_t v115 = v113[-1];
              int8x16_t v116 = (int8x16_t)vcgeq_f32(v115, v109);
              int8x16_t v117 = (int8x16_t)vcgeq_f32(*v113, v109);
              int32x4_t v112 = vsubq_s32(v112, (int32x4_t)vmvnq_s8(v116));
              int32x4_t v111 = vsubq_s32(v111, (int32x4_t)vmvnq_s8(v117));
              int8x16_t v118 = vbslq_s8(v116, v110, (int8x16_t)v115);
              int8x16_t v119 = vbslq_s8(v117, v110, *(int8x16_t *)v113);
              float v46 = (float)((float)((float)((float)((float)((float)((float)(v46 + *(float *)v118.i32)
                                                                  + *(float *)&v118.i32[1])
                                                          + *(float *)&v118.i32[2])
                                                  + *(float *)&v118.i32[3])
                                          + *(float *)v119.i32)
                                  + *(float *)&v119.i32[1])
                          + *(float *)&v119.i32[2])
                  + *(float *)&v119.i32[3];
              v113 += 2;
              v114 -= 8;
            }
            while (v114);
            unsigned int v47 = vaddvq_s32(vaddq_s32(v111, v112));
            if (v64 != (v64 & 0xFFFFFFFFFFFFFFF8))
            {
              unint64_t v120 = f32;
              unint64_t v121 = v64 - (v64 & 0xFFFFFFFFFFFFFFF8);
              do
              {
                float v122 = *v120++;
                float v123 = v122;
                if (v122 >= 2048.0) {
                  float v123 = -0.0;
                }
                else {
                  ++v47;
                }
                float v46 = v46 + v123;
                --v121;
              }
              while (v121);
            }
            ++v63;
            uint64_t v107 = (float32x4_t *)((char *)v107 + BytesPerRow);
            f32 = (float *)((char *)f32 + BytesPerRow);
          }
          while (v63 != v32);
        }
        else
        {
          unsigned int v47 = 0;
          unint64_t v65 = (float *)&BaseAddress[4 * v29 + BytesPerRow * v31];
          do
          {
            uint64_t v66 = v65;
            unint64_t v67 = v30 - (unint64_t)v29;
            do
            {
              float v68 = *v66++;
              float v69 = v68;
              if (v68 >= 2048.0) {
                float v69 = -0.0;
              }
              else {
                ++v47;
              }
              float v46 = v46 + v69;
              --v67;
            }
            while (v67);
            ++v63;
            unint64_t v65 = (float *)((char *)v65 + BytesPerRow);
          }
          while (v63 != v32);
        }
      }
      goto LABEL_111;
    }
    if (v43 == 1)
    {
      sub_1BA84E1F4((uint64_t)a2, v42, v41, v40, v39);
      float v46 = v48;
      if (sub_1BA849834())
      {
        uint64_t v49 = [NSString stringWithFormat:@"Portrait.framework focus dist, gray rect: %f (N/A)", v46];
LABEL_95:
      }
    }
    else
    {
      sub_1BA84E3EC((uint64_t)a2, a1 + 1220, v42, v41, v40, v39);
      float v46 = v101;
      if (sub_1BA849834())
      {
        uint64_t v49 = [NSString stringWithFormat:@"Portrait.framework focus dist, gray rect: %f (%f)", v46, *(float *)(a1 + 1220)];
        goto LABEL_95;
      }
    }
    unsigned int v47 = 0;
    *(float *)(a1 + 1220) = v46;
    goto LABEL_112;
  }
  if (!*(unsigned char *)(a1 + 1216))
  {
    if (sub_1BA849834())
    {
      objc_msgSend(NSString, "stringWithFormat:", @"p%d%% of white region", (int)(float)(v16 * 100.0));
    }
    bzero(v217, 0x400uLL);
    CVPixelBufferLockBaseAddress(a2, 1uLL);
    double v50 = (char *)CVPixelBufferGetBaseAddress(a2);
    CVPixelBufferGetHeight(a2);
    CVPixelBufferGetWidth(a2);
    size_t v51 = CVPixelBufferGetBytesPerRow(a2);
    float v52 = v18 - v17;
    if ((int)v31 < v32 && (int)v29 < (int)v30)
    {
      uint64_t v53 = v31;
      uint64_t v54 = (float *)&v50[4 * v29 + v51 * v31];
      do
      {
        float v55 = v54;
        unint64_t v56 = v30 - (unint64_t)v29;
        do
        {
          float v57 = *v55;
          if (*v55 < 2048.0 && v57 >= v17 && v57 < v18)
          {
            unint64_t v60 = 4 * (unint64_t)(float)((float)((float)(v57 - v17) * 256.0) / v52);
            *(float *)((char *)v217 + v60) = *(float *)((char *)v217 + v60) + 1.0;
          }
          ++v55;
          --v56;
        }
        while (v56);
        ++v53;
        uint64_t v54 = (float *)((char *)v54 + v51);
      }
      while (v53 != v32);
    }
    CVPixelBufferUnlockBaseAddress(a2, 1uLL);
    uint64_t v70 = 0;
    float v219 = 0.00000011921;
    double v71 = 3.18618444e-58;
    do
    {
      *(float *)&double v71 = *(float *)&v71 + *(float *)((char *)v217 + v70);
      float v219 = *(float *)&v71;
      v70 += 4;
    }
    while (v70 != 1024);
    float v72 = *(float *)v217 / *(float *)&v71;
    *(float *)uint64_t v217 = v72;
    for (uint64_t j = 4; j != 1024; j += 4)
    {
      float v72 = v72 + (float)(*(float *)((char *)v217 + j) / v219);
      *(float *)((char *)v217 + j) = v72;
    }
    *(float *)&double v71 = v219;
    if (v219 <= 0.00000011921)
    {
      syslog(7, "Face percentile failed: bad data?", v71);
      size_t v103 = *(unsigned char **)(a1 + 24);
      float v102 = *(unsigned char **)(a1 + 32);
      size_t v104 = v102 - v103;
      if (v102 == v103)
      {
        unint64_t v105 = 0;
      }
      else
      {
        if ((v104 & 0x8000000000000000) != 0) {
          abort();
        }
        unint64_t v105 = operator new(v102 - v103);
        memcpy(v105, v103, v104);
      }
      int64x2_t v191 = *(unsigned char **)(a1 + 48);
      v205 = *(unsigned char **)(a1 + 56);
      size_t v192 = v205 - v191;
      if (v205 == v191) {
        goto LABEL_249;
      }
      if ((v192 & 0x8000000000000000) != 0) {
        abort();
      }
      unint64_t v193 = operator new(v205 - v191);
      goto LABEL_248;
    }
    for (unint64_t k = 0; k != 256; ++k)
    {
      if (*((float *)v217 + k) > v16) {
        break;
      }
    }
    CVPixelBufferLockBaseAddress(a2, 1uLL);
    int8x16_t v75 = (char *)CVPixelBufferGetBaseAddress(a2);
    CVPixelBufferGetHeight(a2);
    CVPixelBufferGetWidth(a2);
    size_t v76 = CVPixelBufferGetBytesPerRow(a2);
    unsigned int v47 = 0;
    float v46 = 0.0;
    if ((int)v31 < v32 && (int)v29 < (int)v30)
    {
      unsigned int v47 = 0;
      *(float *)v77.i32 = v17 + (float)((float)((float)k * 0.0039062) * v52);
      uint64_t v78 = v31;
      unint64_t v79 = v30 - (unint64_t)v29;
      size_t v80 = v76 * v31;
      unint64_t v81 = (float32x4_t *)&v75[4 * v29 + v80];
      float32x4_t v82 = &v75[v80];
      float32x4_t v83 = (float32x4_t)vdupq_lane_s32(v77, 0);
      int v84 = v81 + 1;
      v85.i64[0] = 0x4500000045000000;
      v85.i64[1] = 0x4500000045000000;
      v86.i64[0] = 0x8000000080000000;
      v86.i64[1] = 0x8000000080000000;
      while (v79 >= 8)
      {
        int32x4_t v88 = 0uLL;
        int32x4_t v89 = (int32x4_t)v47;
        size_t v90 = v84;
        unint64_t v91 = v79 & 0xFFFFFFFFFFFFFFF8;
        do
        {
          float32x4_t v92 = v90[-1];
          int32x4_t v93 = (int32x4_t)vbicq_s8((int8x16_t)vcgeq_f32(v92, v83), (int8x16_t)vcgeq_f32(v92, v85));
          int32x4_t v94 = (int32x4_t)vbicq_s8((int8x16_t)vcgeq_f32(*v90, v83), (int8x16_t)vcgeq_f32(*v90, v85));
          int32x4_t v89 = vsubq_s32(v89, v93);
          int32x4_t v88 = vsubq_s32(v88, v94);
          int8x16_t v95 = vbslq_s8((int8x16_t)v93, (int8x16_t)v92, v86);
          int8x16_t v96 = vbslq_s8((int8x16_t)v94, *(int8x16_t *)v90, v86);
          float v46 = (float)((float)((float)((float)((float)((float)((float)(v46 + *(float *)v95.i32) + *(float *)&v95.i32[1])
                                                      + *(float *)&v95.i32[2])
                                              + *(float *)&v95.i32[3])
                                      + *(float *)v96.i32)
                              + *(float *)&v96.i32[1])
                      + *(float *)&v96.i32[2])
              + *(float *)&v96.i32[3];
          v90 += 2;
          v91 -= 8;
        }
        while (v91);
        unsigned int v47 = vaddvq_s32(vaddq_s32(v88, v89));
        unint64_t v87 = (v79 & 0xFFFFFFFFFFFFFFF8) + v29;
        if (v79 != (v79 & 0xFFFFFFFFFFFFFFF8)) {
          goto LABEL_88;
        }
LABEL_82:
        ++v78;
        int v84 = (float32x4_t *)((char *)v84 + v76);
        v82 += v76;
        if (v78 == v32) {
          goto LABEL_111;
        }
      }
      unint64_t v87 = v29;
LABEL_88:
      unint64_t v97 = v30 - v87;
      uint64_t v98 = (float *)&v82[4 * v87];
      do
      {
        float v99 = *v98++;
        float v100 = v99;
        v47 += v99 < 2048.0 && v99 >= *(float *)v77.i32;
        if (v99 >= 2048.0 || v99 < *(float *)v77.i32) {
          float v100 = -0.0;
        }
        float v46 = v46 + v100;
        --v97;
      }
      while (v97);
      goto LABEL_82;
    }
LABEL_111:
    CVPixelBufferUnlockBaseAddress(a2, 1uLL);
    goto LABEL_112;
  }
  double v44 = (float *)(a1 + 1220);
  sub_1BA84E3EC((uint64_t)a2, a1 + 1220, v42, v41, v40, v39);
  float v46 = v45;
  if (sub_1BA849834())
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Portrait.framework focus dist (gray rect: %f (%f)"), v46, *v44;
  }
  unsigned int v47 = 0;
  *double v44 = v46;
LABEL_112:
  uint64_t v124 = v207;
  int v125 = *(unsigned __int8 *)(a1 + 1216);
  if (!*(unsigned char *)(a1 + 1216))
  {
    if (v47) {
      float v46 = v46 / (float)(int)v47;
    }
    else {
      float v46 = *(float *)a1;
    }
  }
  *(_DWORD *)(a1 + 1144) = 1157627904;
  *(void *)(a1 + 32) = *(void *)(a1 + 24);
  *(void *)(a1 + 56) = *(void *)(a1 + 48);
  uint64_t v126 = (long long *)*v207;
  uint64_t v127 = (long long *)v207[1];
  if (v127 == (long long *)*v207)
  {
LABEL_225:
    if (v124[1] == *v124)
    {
      int v182 = *(_DWORD *)(a1 + 72);
      if (*(_DWORD *)(a1 + 112) >= v182 + 1) {
        int v181 = v182 + 1;
      }
      else {
        int v181 = *(_DWORD *)(a1 + 112);
      }
    }
    else
    {
      int v181 = 0;
    }
    *(_DWORD *)(a1 + 72) = v181;
    if (sub_1BA849834())
    {
      objc_msgSend(NSString, "stringWithFormat:", @"maxFramesWithoutFace = %d", *(unsigned int *)(a1 + 112));

      objc_msgSend(NSString, "stringWithFormat:", @"framesWithoutFace = %d", *(unsigned int *)(a1 + 72));
    }
    float v183 = *(float *)a1;
    if (*(float *)a1 >= 2048.0)
    {
      uint64_t v185 = a1 + 84;
    }
    else
    {
      int v184 = *(_DWORD *)(a1 + 72);
      uint64_t v185 = a1 + 84;
      if (v184 >= 1 && v184 < *(_DWORD *)(a1 + 112)) {
        goto LABEL_241;
      }
      float v186 = *(float *)(a1 + 108);
      if (*(unsigned char *)(a1 + 1216) && v46 < v183)
      {
        float v186 = v186 * 0.1;
        *(float *)(a1 + 108) = v186;
      }
      float v46 = v183 + (float)((float)(v46 - v183) * v186);
    }
    *(float *)a1 = v46;
LABEL_241:
    *(void *)uint64_t v185 = 0;
    *(void *)(v185 + 8) = 0;
    *(_DWORD *)(v185 + 24) = 0;
    *(void *)(v185 + 16) = 0;
    int64x2_t v188 = *(unsigned char **)(a1 + 24);
    int64x2_t v187 = *(unsigned char **)(a1 + 32);
    size_t v189 = v187 - v188;
    if (v187 == v188)
    {
      unint64_t v105 = 0;
    }
    else
    {
      if ((v189 & 0x8000000000000000) != 0) {
        abort();
      }
      unint64_t v105 = operator new(v187 - v188);
      memcpy(v105, v188, v189);
    }
    int64x2_t v191 = *(unsigned char **)(a1 + 48);
    int64x2_t v190 = *(unsigned char **)(a1 + 56);
    size_t v192 = v190 - v191;
    if (v190 == v191) {
      goto LABEL_249;
    }
    if ((v192 & 0x8000000000000000) != 0) {
      abort();
    }
    unint64_t v193 = operator new(v190 - v191);
LABEL_248:
    int64x2_t v194 = v193;
    memcpy(v193, v191, v192);
    operator delete(v194);
LABEL_249:
    if (v105) {
      operator delete(v105);
    }
LABEL_251:
    *(_OWORD *)a5 = *(_OWORD *)a1;
    *(_DWORD *)(a5 + 16) = *(_DWORD *)(a1 + 16);
    *(void *)(a5 + 32) = 0;
    *(void *)(a5 + 40) = 0;
    *(void *)(a5 + 24) = 0;
    int8x8_t v196 = *(unsigned char **)(a1 + 24);
    int64x2_t v195 = *(unsigned char **)(a1 + 32);
    int64_t v197 = v195 - v196;
    if (v195 != v196)
    {
      if (v197 < 0) {
        abort();
      }
      int8x16_t v198 = (char *)operator new(v195 - v196);
      *(void *)(a5 + 24) = v198;
      int8x16_t v199 = &v198[4 * (v197 >> 2)];
      *(void *)(a5 + 40) = v199;
      memcpy(v198, v196, v197);
      *(void *)(a5 + 32) = v199;
    }
    *(void *)(a5 + 48) = 0;
    *(void *)(a5 + 56) = 0;
    *(void *)(a5 + 64) = 0;
    unsigned int v201 = *(unsigned char **)(a1 + 48);
    int8x16_t v200 = *(unsigned char **)(a1 + 56);
    int64_t v202 = v200 - v201;
    if (v200 != v201)
    {
      if (v202 < 0) {
        abort();
      }
      int64x2_t v203 = (char *)operator new(v200 - v201);
      *(void *)(a5 + 48) = v203;
      int64x2_t v204 = &v203[4 * (v202 >> 2)];
      *(void *)(a5 + 64) = v204;
      memcpy(v203, v201, v202);
      *(void *)(a5 + 56) = v204;
    }
    *(_DWORD *)(a5 + 72) = *(_DWORD *)(a1 + 72);
    return;
  }
  size_t v214 = a2;
  float v212 = v17;
  float v213 = v16;
  float v211 = v18;
  int8x16_t v128 = (uint64_t (***)(void))operator new(0x28uLL);
  int8x16_t v129 = (uint64_t (**)(void))&unk_1F142EF98;
  *int8x16_t v128 = (uint64_t (**)(void))&unk_1F142EF98;
  v128[1] = (uint64_t (**)(void))&v214;
  v128[2] = (uint64_t (**)(void))&v212;
  v128[3] = (uint64_t (**)(void))&v211;
  v128[4] = (uint64_t (**)(void))&v213;
  unint64_t v221 = v128;
  if (!v125)
  {
    uint64_t v208 = 0;
    int64x2_t v209 = 0;
    uint64_t v210 = 0;
LABEL_126:
    uint64_t v130 = v129[2]();
LABEL_127:
    uint64_t v218 = (void *)v130;
    goto LABEL_128;
  }
  v217[0] = &unk_1F142EF50;
  v217[1] = &v214;
  v217[2] = a1;
  uint64_t v218 = v217;
  sub_1BA8498DC(v217, v220);
  if (v218 == v217)
  {
    (*(void (**)(void *))(v217[0] + 32))(v217);
  }
  else if (v218)
  {
    (*(void (**)(void))(*v218 + 40))();
  }
  uint64_t v130 = (uint64_t)v221;
  int64x2_t v209 = 0;
  uint64_t v210 = 0;
  uint64_t v208 = 0;
  uint64_t v126 = (long long *)*v207;
  uint64_t v127 = (long long *)v207[1];
  if (!v221) {
    goto LABEL_127;
  }
  if (v221 != v220)
  {
    int8x16_t v129 = *v221;
    goto LABEL_126;
  }
  uint64_t v218 = v217;
  (*(void (**)(void *, void *))(v220[0] + 24))(v220, v217);
LABEL_128:
  unsigned int v215 = &v208;
  if (v126 == v127)
  {
LABEL_131:
    if (v218 == v217)
    {
      (*(void (**)(void *))(v217[0] + 32))(v217);
    }
    else if (v218)
    {
      (*(void (**)(void))(*v218 + 40))();
    }
    if (v221 == v220)
    {
      (*(void (**)(void *))(v220[0] + 32))(v220);
    }
    else if (v221)
    {
      (*v221)[5]();
    }
    float v134 = v208;
    uint64_t v133 = v209;
    if (v208 == v209) {
      goto LABEL_162;
    }
    float v135 = 0.0;
    uint64_t v136 = v208;
    do
    {
      if (v136[2] > v135) {
        float v135 = v136[2];
      }
      v136 += 3;
    }
    while (v136 != v209);
    float v137 = (float)(v135 * a6) + -0.00000011921;
    float32x4_t v138 = v208;
    while (v138[2] >= v137)
    {
      v138 += 3;
      if (v138 == v209)
      {
        float32x4_t v138 = v209;
        goto LABEL_154;
      }
    }
    if (v138 != v209)
    {
      for (m = v138 + 3; m != v133; m += 3)
      {
        if (m[2] >= v137)
        {
          *float32x4_t v138 = *m;
          v138[1] = m[1];
          v138[2] = m[2];
          v138 += 3;
        }
      }
    }
LABEL_154:
    if (v134 == v138)
    {
LABEL_162:
      float v145 = *(float *)(a1 + 1144);
      if (v145 < 2048.0)
      {
        uint64_t v124 = v207;
        int v146 = v206;
        if (v145 > 3.4028e38)
        {
          *(_DWORD *)(a1 + 1144) = 2139095039;
          float v145 = 3.4028e38;
        }
        goto LABEL_214;
      }
      *(_DWORD *)(a1 + 1144) = 1157627904;
      float v145 = 2048.0;
    }
    else
    {
      float v140 = 3.4028e38;
      int8x16_t v141 = v134;
      do
      {
        float v142 = *v141;
        v141 += 3;
        float v143 = v142;
        if (v142 < v140) {
          float v140 = v143;
        }
      }
      while (v141 != v138);
      float v144 = *(float *)(a1 + 1144);
      if (v144 >= 2048.0)
      {
        if (v140 > 1.7014e38) {
          float v140 = 2048.0;
        }
      }
      else if (v140 >= v144)
      {
        goto LABEL_171;
      }
      *(float *)(a1 + 1144) = v140;
      do
      {
LABEL_171:
        int64x2_t v149 = *(char **)(a1 + 32);
        unint64_t v148 = *(void *)(a1 + 40);
        if ((unint64_t)v149 >= v148)
        {
          int64x2_t v151 = *(char **)(a1 + 24);
          uint64_t v152 = (v149 - v151) >> 2;
          unint64_t v153 = v152 + 1;
          if ((unint64_t)(v152 + 1) >> 62) {
            goto LABEL_263;
          }
          uint64_t v154 = v148 - (void)v151;
          if (v154 >> 1 > v153) {
            unint64_t v153 = v154 >> 1;
          }
          if ((unint64_t)v154 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v155 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v155 = v153;
          }
          if (v155)
          {
            if (v155 >> 62) {
              goto LABEL_264;
            }
            short float v156 = operator new(4 * v155);
          }
          else
          {
            short float v156 = 0;
          }
          unint64_t v157 = &v156[4 * v152];
          *unint64_t v157 = *(_DWORD *)v134;
          int64x2_t v150 = v157 + 1;
          if (v149 != v151)
          {
            unint64_t v158 = v149 - 4 - v151;
            if (v158 < 0x2C) {
              goto LABEL_273;
            }
            if ((unint64_t)(v151 - v156) < 0x20) {
              goto LABEL_273;
            }
            uint64_t v159 = (v158 >> 2) + 1;
            uint64_t v160 = &v156[4 * v152 - 16];
            float16x8_t v161 = v149 - 16;
            uint64_t v162 = v159 & 0x7FFFFFFFFFFFFFF8;
            do
            {
              long long v163 = *(_OWORD *)v161;
              *(v160 - 1) = *((_OWORD *)v161 - 1);
              *uint64_t v160 = v163;
              v160 -= 2;
              v161 -= 32;
              v162 -= 8;
            }
            while (v162);
            v157 -= v159 & 0x7FFFFFFFFFFFFFF8;
            v149 -= 4 * (v159 & 0x7FFFFFFFFFFFFFF8);
            if (v159 != (v159 & 0x7FFFFFFFFFFFFFF8))
            {
LABEL_273:
              do
              {
                int v164 = *((_DWORD *)v149 - 1);
                v149 -= 4;
                *--unint64_t v157 = v164;
              }
              while (v149 != v151);
            }
          }
          *(void *)(a1 + 24) = v157;
          *(void *)(a1 + 32) = v150;
          *(void *)(a1 + 40) = &v156[4 * v155];
          if (v151) {
            operator delete(v151);
          }
        }
        else
        {
          *(float *)int64x2_t v149 = *v134;
          int64x2_t v150 = v149 + 4;
        }
        *(void *)(a1 + 32) = v150;
        unsigned int v166 = *(char **)(a1 + 56);
        unint64_t v165 = *(void *)(a1 + 64);
        if ((unint64_t)v166 < v165)
        {
          *(float *)unsigned int v166 = v134[1];
          int8x8_t v147 = v166 + 4;
        }
        else
        {
          int64x2_t v167 = *(char **)(a1 + 48);
          uint64_t v168 = (v166 - v167) >> 2;
          unint64_t v169 = v168 + 1;
          if ((unint64_t)(v168 + 1) >> 62) {
LABEL_263:
          }
            abort();
          uint64_t v170 = v165 - (void)v167;
          if (v170 >> 1 > v169) {
            unint64_t v169 = v170 >> 1;
          }
          if ((unint64_t)v170 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v171 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v171 = v169;
          }
          if (v171)
          {
            if (v171 >> 62) {
LABEL_264:
            }
              sub_1BA81F974();
            int64x2_t v172 = operator new(4 * v171);
          }
          else
          {
            int64x2_t v172 = 0;
          }
          int64x2_t v173 = &v172[4 * v168];
          *int64x2_t v173 = *((_DWORD *)v134 + 1);
          int8x8_t v147 = v173 + 1;
          if (v166 != v167)
          {
            unint64_t v174 = v166 - 4 - v167;
            if (v174 < 0x2C) {
              goto LABEL_274;
            }
            if ((unint64_t)(v167 - v172) < 0x20) {
              goto LABEL_274;
            }
            uint64_t v175 = (v174 >> 2) + 1;
            int64x2_t v176 = &v172[4 * v168 - 16];
            int64x2_t v177 = v166 - 16;
            uint64_t v178 = v175 & 0x7FFFFFFFFFFFFFF8;
            do
            {
              long long v179 = *(_OWORD *)v177;
              *(v176 - 1) = *((_OWORD *)v177 - 1);
              _OWORD *v176 = v179;
              v176 -= 2;
              v177 -= 32;
              v178 -= 8;
            }
            while (v178);
            v173 -= v175 & 0x7FFFFFFFFFFFFFF8;
            v166 -= 4 * (v175 & 0x7FFFFFFFFFFFFFF8);
            if (v175 != (v175 & 0x7FFFFFFFFFFFFFF8))
            {
LABEL_274:
              do
              {
                int v180 = *((_DWORD *)v166 - 1);
                v166 -= 4;
                *--int64x2_t v173 = v180;
              }
              while (v166 != v167);
            }
          }
          *(void *)(a1 + 48) = v173;
          *(void *)(a1 + 56) = v147;
          *(void *)(a1 + 64) = &v172[4 * v171];
          if (v167) {
            operator delete(v167);
          }
        }
        *(void *)(a1 + 56) = v147;
        v134 += 3;
      }
      while (v134 != v138);
      float v145 = *(float *)(a1 + 1144);
      float v134 = v208;
    }
    uint64_t v124 = v207;
    int v146 = v206;
LABEL_214:
    if (v134)
    {
      int64x2_t v209 = v134;
      operator delete(v134);
    }
    if (v146 && v145 < 2048.0)
    {
      if (sub_1BA849834())
      {
        if (*(unsigned char *)(a1 + 1216)) {
          objc_msgSend(NSString, "stringWithFormat:", @"Portrait.framework focus dist from black rect: %f", v145);
        }
        else {
          objc_msgSend(NSString, "stringWithFormat:", @"Classic focus dist from black rect p%d%% %f", (int)(float)(v16 * 100.0), v145);
        }
      }
      float v46 = v145;
      uint64_t v124 = v207;
    }
    goto LABEL_225;
  }
  while (1)
  {
    long long v216 = *v126;
    if (!v218) {
      break;
    }
    LODWORD(v216) = (*(float (**)(void *, long long *))(*v218 + 48))(v218, &v216);
    *(void *)((char *)&v216 + 4) = __PAIR64__(v132, v131);
    sub_1BA849B44((char ***)&v215, (uint64_t *)&v216);
    if (++v126 == v127) {
      goto LABEL_131;
    }
  }
  sub_1BA816504();
  __break(1u);
}

void sub_1BA849794(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  if (v24)
  {
    operator delete(v24);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1BA849834()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76720, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76720))
  {
    uint64_t v1 = +[CVAPreferenceManager defaults];
    char v2 = [v1 BOOLForKey:@"CVAPhotoDebugDrawAutofocus"];

    byte_1E9F76518 = v2;
    __cxa_guard_release(&qword_1E9F76720);
  }
  return byte_1E9F76518;
}

void sub_1BA8498B8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_1E9F76720);
  _Unwind_Resume(a1);
}

void *sub_1BA8498DC(void *result, void *a2)
{
  v6[3] = *MEMORY[0x1E4F143B8];
  if (a2 != result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)result[3];
    float v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

char ***sub_1BA849B44(char ***a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  uint64_t v6 = (*a1)[1];
  unint64_t v5 = (unint64_t)(*a1)[2];
  if ((unint64_t)v6 >= v5)
  {
    int v9 = *v4;
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v6 - *v4) >> 2);
    unint64_t v11 = v10 + 1;
    if (v10 + 1 > 0x1555555555555555) {
      abort();
    }
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - (void)v9) >> 2);
    if (2 * v12 > v11) {
      unint64_t v11 = 2 * v12;
    }
    if (v12 >= 0xAAAAAAAAAAAAAAALL) {
      unint64_t v13 = 0x1555555555555555;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13)
    {
      if (v13 > 0x1555555555555555) {
        sub_1BA81F974();
      }
      int v14 = (char *)operator new(12 * v13);
    }
    else
    {
      int v14 = 0;
    }
    uint64_t v15 = &v14[12 * v10];
    *(void *)uint64_t v15 = *a2;
    *((_DWORD *)v15 + 2) = *((_DWORD *)a2 + 2);
    double v8 = v15 + 12;
    if (v6 != v9)
    {
      do
      {
        uint64_t v16 = *(void *)(v6 - 12);
        v6 -= 12;
        int v17 = *((_DWORD *)v6 + 2);
        *(void *)(v15 - 12) = v16;
        v15 -= 12;
        *((_DWORD *)v15 + 2) = v17;
      }
      while (v6 != v9);
      uint64_t v6 = *v4;
    }
    void *v4 = v15;
    v4[1] = v8;
    _DWORD v4[2] = &v14[12 * v13];
    if (v6) {
      operator delete(v6);
    }
  }
  else
  {
    uint64_t v7 = *a2;
    *((_DWORD *)v6 + 2) = *((_DWORD *)a2 + 2);
    *(void *)uint64_t v6 = v7;
    double v8 = v6 + 12;
  }
  v4[1] = v8;
  return a1;
}

void *sub_1BA849C84(void *a1)
{
  char v2 = (void *)a1[3];
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

void sub_1BA849D08(uint64_t a1, float *a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_1BA84E3EC(**(void **)(a1 + 8), v2 + 1220, *a2, a2[1], a2[2], a2[3]);
  *(_DWORD *)(v2 + 1220) = v3;
}

__n128 sub_1BA849D68(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1F142EF50;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 sub_1BA849D90(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_1F142EF50;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

void sub_1BA849DDC()
{
}

uint64_t sub_1BA849DF4(uint64_t a1, float32x2_t *a2)
{
  float32x2_t v3 = *a2;
  float32x2_t v41 = a2[1];
  unsigned int Width = CVPixelBufferGetWidth(**(CVPixelBufferRef **)(a1 + 8));
  unsigned int Height = CVPixelBufferGetHeight(**(CVPixelBufferRef **)(a1 + 8));
  float32x2_t v6 = vcvt_f32_s32((int32x2_t)__PAIR64__(Height, Width));
  int32x2_t v43 = vmax_s32(vcvt_s32_f32(vmul_f32(v3, v6)), 0);
  int32x2_t v42 = vmin_s32(vcvt_s32_f32(vmul_f32(vadd_f32(v3, v41), v6)), (int32x2_t)__PAIR64__(Height, Width));
  bzero(v44, 0x400uLL);
  CVPixelBufferLockBaseAddress(**(CVPixelBufferRef **)(a1 + 8), 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(**(CVPixelBufferRef **)(a1 + 8));
  CVPixelBufferGetHeight(**(CVPixelBufferRef **)(a1 + 8));
  CVPixelBufferGetWidth(**(CVPixelBufferRef **)(a1 + 8));
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(**(CVPixelBufferRef **)(a1 + 8));
  uint64_t v9 = v43.u32[1];
  if (v43.i32[1] < v42.i32[1] && v43.i32[0] < v42.i32[0])
  {
    unsigned int v31 = (float *)&BaseAddress[4 * v43.u32[0] + BytesPerRow * v43.u32[1]];
    uint64_t v32 = v43.u32[1];
    do
    {
      float v33 = v31;
      unint64_t v34 = v42.u32[0] - (unint64_t)v43.u32[0];
      do
      {
        float v35 = *v33;
        if (*v33 < 2048.0)
        {
          float v36 = **(float **)(a1 + 16);
          float v37 = **(float **)(a1 + 24);
          if (v35 >= v36 && v35 < v37)
          {
            unint64_t v39 = (unint64_t)(float)((float)((float)(v35 - v36) * 256.0) / (float)(v37 - v36));
            v44[v39] = v44[v39] + 1.0;
          }
        }
        ++v33;
        --v34;
      }
      while (v34);
      ++v32;
      unsigned int v31 = (float *)((char *)v31 + BytesPerRow);
    }
    while (v32 != v42.u32[1]);
  }
  CVPixelBufferUnlockBaseAddress(**(CVPixelBufferRef **)(a1 + 8), 1uLL);
  uint64_t v11 = 0;
  float v45 = 0.00000011921;
  float v12 = 0.00000011921;
  do
  {
    float v12 = v12 + v44[v11];
    float v45 = v12;
    ++v11;
  }
  while (v11 != 256);
  float v13 = v44[0] / v12;
  v44[0] = v13;
  for (uint64_t i = 1; i != 256; ++i)
  {
    float v13 = v13 + (float)(v44[i] / v45);
    v44[i] = v13;
  }
  unint64_t v15 = 0;
  float v16 = **(float **)(a1 + 16);
  float v17 = **(float **)(a1 + 24);
  do
  {
    if (v44[v15] > **(float **)(a1 + 32)) {
      break;
    }
    ++v15;
  }
  while (v15 != 256);
  CVPixelBufferLockBaseAddress(**(CVPixelBufferRef **)(a1 + 8), 1uLL);
  float v18 = (char *)CVPixelBufferGetBaseAddress(**(CVPixelBufferRef **)(a1 + 8));
  CVPixelBufferGetHeight(**(CVPixelBufferRef **)(a1 + 8));
  CVPixelBufferGetWidth(**(CVPixelBufferRef **)(a1 + 8));
  size_t v19 = CVPixelBufferGetBytesPerRow(**(CVPixelBufferRef **)(a1 + 8));
  float v20 = 0.0;
  if (v43.i32[1] < v42.i32[1] && v43.i32[0] < v42.i32[0])
  {
    int v21 = 0;
    int v22 = 0;
    float v23 = (float *)&v18[4 * v43.u32[0] + v19 * v43.u32[1]];
    do
    {
      float v24 = v23;
      unint64_t v25 = v42.u32[0] - (unint64_t)v43.u32[0];
      do
      {
        float v26 = *v24++;
        float v27 = v26;
        float v28 = v20 + v26;
        if (v26 < 2048.0) {
          int v29 = v22;
        }
        else {
          int v29 = v22 + 1;
        }
        BOOL v30 = v27 >= 2048.0 || v27 <= (float)(v16 + (float)((float)((float)v15 * 0.0039062) * (float)(v17 - v16)));
        if (v30) {
          int v22 = v29;
        }
        if (!v30)
        {
          float v20 = v28;
          ++v21;
        }
        --v25;
      }
      while (v25);
      ++v9;
      float v23 = (float *)((char *)v23 + v19);
    }
    while (v9 != v42.u32[1]);
  }
  return CVPixelBufferUnlockBaseAddress(**(CVPixelBufferRef **)(a1 + 8), 1uLL);
}

__n128 sub_1BA84A1B8(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1F142EF98;
  __n128 result = *(__n128 *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 sub_1BA84A1E8(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x28uLL);
  *(void *)uint64_t v2 = &unk_1F142EF98;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  return result;
}

void sub_1BA84A23C()
{
}

void sub_1BA84A254(uint64_t a1@<X0>, __CVBuffer *a2@<X1>, int a3@<W2>, void *a4@<X3>, uint64_t a5@<X8>, float a6@<S0>)
{
  uint64_t v233 = *MEMORY[0x1E4F143B8];
  if (sub_1BA849834())
  {
    if (*(_DWORD *)(a1 + 80)) {
      float v12 = @"FOCUSMODE_REGION, ";
    }
    else {
      float v12 = @"FOCUSMODE_GLOBAL_DISPARITY_HISTOGRAM, ";
    }
    float v13 = v12;
    int v14 = [(__CFString *)v13 stringByAppendingString:*(&off_1E6228650 + *(unsigned int *)(a1 + 104))];

    unint64_t v15 = @"no";
    if (a3) {
      unint64_t v15 = @"yes";
    }
    [NSString stringWithFormat:@"facesArray.len=%ld, useFaceAsFocus=%@", (uint64_t)(a4[1] - *a4) >> 4, v15];
  }
  if (!*(_DWORD *)(a1 + 80))
  {
    for (unint64_t i = 0; i != 256; ++i)
    {
      if (*(float *)(a1 + 4 * i + 116) > 0.85) {
        break;
      }
    }
    float v34 = *(float *)(a1 + 1152)
        + (float)((float)((float)i * 0.0039062) * (float)(*(float *)(a1 + 1156) - *(float *)(a1 + 1152)));
    if (*(float *)a1 < 2048.0) {
      float v34 = *(float *)a1 + (float)((float)(v34 - *(float *)a1) * 0.2);
    }
    *(float *)a1 = v34;
    goto LABEL_245;
  }
  int v217 = a3;
  uint64_t v218 = a4;
  if (sub_1BA849834())
  {
    objc_msgSend(NSString, "stringWithFormat:", @"input._foregroundPercentile = %d%%", (int)(float)(*(float *)(a1 + 1148) * 100.0));
  }
  float v16 = *(float *)(a1 + 1148);
  float v17 = *(float *)(a1 + 1152);
  float v18 = *(float *)(a1 + 1156);
  int Width = CVPixelBufferGetWidth(a2);
  int Height = CVPixelBufferGetHeight(a2);
  float v21 = *(float *)(a1 + 84);
  float v22 = *(float *)(a1 + 88);
  float v23 = *(float *)(a1 + 92);
  float v24 = (float)Width;
  int v25 = (int)(float)(v21 * (float)Width);
  float v26 = (float)Height;
  int v27 = (int)(float)(v22 * (float)Height);
  if (v23 <= 0.0 || (float v28 = *(float *)(a1 + 96), v28 <= 0.0))
  {
    int v35 = Height + Width;
    if (Height + Width < 0 != __OFADD__(Height, Width)) {
      ++v35;
    }
    int v36 = (int)((double)(v35 >> 1) * 0.1);
    unsigned int v29 = (v25 - v36) & ~((v25 - v36) >> 31);
    signed int v37 = v36 + v25;
    if (v37 >= Width) {
      unsigned int v30 = Width;
    }
    else {
      unsigned int v30 = v37;
    }
    unsigned int v31 = (v27 - v36) & ~((v27 - v36) >> 31);
    int v38 = v36 + v27;
    if (v38 >= Height) {
      int v32 = Height;
    }
    else {
      int v32 = v38;
    }
    float v21 = (float)(int)v29 / v24;
    float v22 = (float)(int)v31 / v26;
    float v23 = (float)((float)(int)v29 + (float)(int)v30) / v24;
    float v28 = (float)((float)(int)v31 + (float)v32) / v26;
  }
  else
  {
    unsigned int v29 = v25 & ~(v25 >> 31);
    if ((int)(float)((float)(v21 + v23) * v24) >= Width) {
      unsigned int v30 = Width;
    }
    else {
      unsigned int v30 = (int)(float)((float)(v21 + v23) * v24);
    }
    unsigned int v31 = v27 & ~(v27 >> 31);
    if ((int)(float)((float)(v22 + v28) * v26) >= Height) {
      int v32 = Height;
    }
    else {
      int v32 = (int)(float)((float)(v22 + v28) * v26);
    }
  }
  double v39 = v28;
  double v40 = v23;
  double v41 = v22;
  double v42 = v21;
  int v43 = *(_DWORD *)(a1 + 104);
  if (v43 != 2)
  {
    if (*(unsigned char *)(a1 + 1216))
    {
      if (v43 == 1)
      {
        sub_1BA84E1F4((uint64_t)a2, v42, v41, v40, v39);
        float v46 = v48;
        if (sub_1BA849834())
        {
          uint64_t v49 = [NSString stringWithFormat:@"Portrait.framework focus dist, gray rect: %f (N/A)", v46];
LABEL_101:
        }
      }
      else
      {
        sub_1BA84E3EC((uint64_t)a2, a1 + 1220, v42, v41, v40, v39);
        float v46 = v130;
        if (sub_1BA849834())
        {
          uint64_t v49 = [NSString stringWithFormat:@"Portrait.framework focus dist, gray rect: %f (%f)", v46, *(float *)(a1 + 1220)];
          goto LABEL_101;
        }
      }
      unsigned int v47 = 0;
      *(float *)(a1 + 1220) = v46;
      goto LABEL_103;
    }
    sub_1BA849834();
    CVPixelBufferLockBaseAddress(a2, 1uLL);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a2);
    CVPixelBufferGetHeight(a2);
    CVPixelBufferGetWidth(a2);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a2);
    unsigned int v47 = 0;
    float v46 = 0.0;
    if ((int)v31 >= v32 || (int)v29 >= (int)v30) {
      goto LABEL_98;
    }
    unsigned int v47 = 0;
    uint64_t v68 = v31;
    unint64_t v69 = v30 - (unint64_t)v29;
    size_t v70 = BytesPerRow * v31;
    double v71 = (float16x4_t *)&BaseAddress[2 * v29 + v70];
    float v72 = &BaseAddress[v70];
    double v73 = v71 + 1;
    v74.i64[0] = 0x100000001;
    v74.i64[1] = 0x100000001;
    v75.i64[0] = 0x8000000080000000;
    v75.i64[1] = 0x8000000080000000;
    while (v69 >= 8)
    {
      int32x4_t v77 = 0uLL;
      int32x4_t v78 = (int32x4_t)v47;
      unint64_t v79 = v73;
      unint64_t v80 = v69 & 0xFFFFFFFFFFFFFFF8;
      do
      {
        float16x4_t v81 = v79[-1];
        int8x16_t v82 = (int8x16_t)vcvtq_f32_f16(v81);
        int16x4_t v83 = (int16x4_t)vmvn_s8((int8x8_t)vcge_f16(v81, (float16x4_t)0x6800680068006800));
        int16x4_t v84 = (int16x4_t)vmvn_s8((int8x8_t)vcge_f16(*v79, (float16x4_t)0x6800680068006800));
        int32x4_t v78 = vaddq_s32(v78, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16((uint16x4_t)v83), v74));
        int32x4_t v77 = vaddq_s32(v77, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16((uint16x4_t)v84), v74));
        int8x16_t v85 = vbslq_s8((int8x16_t)vmovl_s16(v83), v82, v75);
        int8x16_t v86 = vbslq_s8((int8x16_t)vmovl_s16(v84), (int8x16_t)vcvtq_f32_f16(*v79), v75);
        float v46 = (float)((float)((float)((float)((float)((float)((float)(v46 + *(float *)v85.i32) + *(float *)&v85.i32[1])
                                                    + *(float *)&v85.i32[2])
                                            + *(float *)&v85.i32[3])
                                    + *(float *)v86.i32)
                            + *(float *)&v86.i32[1])
                    + *(float *)&v86.i32[2])
            + *(float *)&v86.i32[3];
        v79 += 2;
        v80 -= 8;
      }
      while (v80);
      unsigned int v47 = vaddvq_s32(vaddq_s32(v77, v78));
      unint64_t v76 = (v69 & 0xFFFFFFFFFFFFFFF8) + v29;
      if (v69 != (v69 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_69;
      }
LABEL_63:
      ++v68;
      double v73 = (float16x4_t *)((char *)v73 + BytesPerRow);
      v72 += BytesPerRow;
      if (v68 == v32) {
        goto LABEL_98;
      }
    }
    unint64_t v76 = v29;
LABEL_69:
    unint64_t v87 = v30 - v76;
    int32x4_t v88 = (short float *)&v72[2 * v76];
    do
    {
      short float v89 = *v88++;
      _H5 = v89;
      __asm { FCVT            S6, H5 }
      if (v89 >= COERCE_SHORT_FLOAT(26624))
      {
        float v92 = -0.0;
      }
      else
      {
        ++v47;
        float v92 = _S6;
      }
      float v46 = v46 + v92;
      --v87;
    }
    while (v87);
    goto LABEL_63;
  }
  if (!*(unsigned char *)(a1 + 1216))
  {
    if (sub_1BA849834())
    {
      objc_msgSend(NSString, "stringWithFormat:", @"p%d%% of white region", (int)(float)(v16 * 100.0));
    }
    bzero(v228, 0x400uLL);
    CVPixelBufferLockBaseAddress(a2, 1uLL);
    double v50 = (char *)CVPixelBufferGetBaseAddress(a2);
    CVPixelBufferGetHeight(a2);
    CVPixelBufferGetWidth(a2);
    size_t v51 = CVPixelBufferGetBytesPerRow(a2);
    float v52 = v18 - v17;
    if ((int)v31 < v32 && (int)v29 < (int)v30)
    {
      uint64_t v53 = v31;
      uint64_t v54 = (short float *)&v50[2 * v29 + v51 * v31];
      do
      {
        float v55 = v54;
        unint64_t v56 = v30 - (unint64_t)v29;
        do
        {
          _H3 = *v55;
          __asm { FCVT            S2, H3 }
          if (*v55 < COERCE_SHORT_FLOAT(26624) && v17 <= _S2 && v18 > _S2)
          {
            unint64_t v65 = 4 * (unint64_t)(float)((float)((float)(_S2 - v17) * 256.0) / v52);
            *(float *)((char *)v228 + v65) = *(float *)((char *)v228 + v65) + 1.0;
          }
          ++v55;
          --v56;
        }
        while (v56);
        ++v53;
        uint64_t v54 = (short float *)((char *)v54 + v51);
      }
      while (v53 != v32);
    }
    CVPixelBufferUnlockBaseAddress(a2, 1uLL);
    uint64_t v93 = 0;
    float v230 = 0.00000011921;
    double v94 = 3.18618444e-58;
    do
    {
      *(float *)&double v94 = *(float *)&v94 + *(float *)((char *)v228 + v93);
      float v230 = *(float *)&v94;
      v93 += 4;
    }
    while (v93 != 1024);
    float v95 = *(float *)v228 / *(float *)&v94;
    *(float *)float v228 = v95;
    for (uint64_t j = 4; j != 1024; j += 4)
    {
      float v95 = v95 + (float)(*(float *)((char *)v228 + j) / v230);
      *(float *)((char *)v228 + j) = v95;
    }
    *(float *)&double v94 = v230;
    if (v230 <= 0.00000011921)
    {
      syslog(7, "Face percentile failed: bad data?", v94);
      size_t v189 = *(unsigned char **)(a1 + 24);
      int64x2_t v188 = *(unsigned char **)(a1 + 32);
      size_t v190 = v188 - v189;
      if (v188 == v189)
      {
        int64x2_t v191 = 0;
      }
      else
      {
        if ((v190 & 0x8000000000000000) != 0) {
          abort();
        }
        int64x2_t v191 = operator new(v188 - v189);
        memcpy(v191, v189, v190);
      }
      int64_t v202 = *(unsigned char **)(a1 + 48);
      long long v216 = *(unsigned char **)(a1 + 56);
      size_t v203 = v216 - v202;
      if (v216 == v202) {
        goto LABEL_243;
      }
      if ((v203 & 0x8000000000000000) != 0) {
        abort();
      }
      int64x2_t v204 = operator new(v216 - v202);
      goto LABEL_242;
    }
    for (unint64_t k = 0; k != 256; ++k)
    {
      if (*((float *)v228 + k) > v16) {
        break;
      }
    }
    CVPixelBufferLockBaseAddress(a2, 1uLL);
    uint64_t v98 = (char *)CVPixelBufferGetBaseAddress(a2);
    CVPixelBufferGetHeight(a2);
    CVPixelBufferGetWidth(a2);
    size_t v99 = CVPixelBufferGetBytesPerRow(a2);
    unsigned int v47 = 0;
    float v46 = 0.0;
    if ((int)v31 < v32 && (int)v29 < (int)v30)
    {
      unsigned int v47 = 0;
      *(float *)v100.i32 = v17 + (float)((float)((float)k * 0.0039062) * v52);
      uint64_t v101 = v31;
      unint64_t v102 = v30 - (unint64_t)v29;
      size_t v103 = v99 * v31;
      size_t v104 = (float16x4_t *)&v98[2 * v29 + v103];
      unint64_t v105 = &v98[v103];
      float32x4_t v106 = (float32x4_t)vdupq_lane_s32(v100, 0);
      uint64_t v107 = v104 + 1;
      v108.i64[0] = 0x100000001;
      v108.i64[1] = 0x100000001;
      v109.i64[0] = 0x8000000080000000;
      v109.i64[1] = 0x8000000080000000;
      while (v102 >= 8)
      {
        int32x4_t v111 = 0uLL;
        int32x4_t v112 = (int32x4_t)v47;
        BOOL v113 = v107;
        unint64_t v114 = v102 & 0xFFFFFFFFFFFFFFF8;
        do
        {
          float16x4_t v115 = v113[-1];
          float32x4_t v116 = vcvtq_f32_f16(v115);
          float32x4_t v117 = vcvtq_f32_f16(*v113);
          int8x8_t v118 = (int8x8_t)vcge_f16(v115, (float16x4_t)0x6800680068006800);
          int8x8_t v119 = (int8x8_t)vcge_f16(*v113, (float16x4_t)0x6800680068006800);
          int32x4_t v120 = vcgeq_f32(v116, v106);
          int32x4_t v121 = vcgeq_f32(v117, v106);
          int32x4_t v112 = vaddq_s32(v112, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16((uint16x4_t)vbic_s8((int8x8_t)vmovn_s32(v120), v118)), v108));
          int32x4_t v111 = vaddq_s32(v111, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16((uint16x4_t)vbic_s8((int8x8_t)vmovn_s32(v121), v119)), v108));
          int8x16_t v122 = vbslq_s8(vandq_s8((int8x16_t)vmovl_s16((int16x4_t)vmvn_s8(v118)), (int8x16_t)v120), (int8x16_t)v116, v109);
          int8x16_t v123 = vbslq_s8(vandq_s8((int8x16_t)vmovl_s16((int16x4_t)vmvn_s8(v119)), (int8x16_t)v121), (int8x16_t)v117, v109);
          float v46 = (float)((float)((float)((float)((float)((float)((float)(v46 + *(float *)v122.i32)
                                                              + *(float *)&v122.i32[1])
                                                      + *(float *)&v122.i32[2])
                                              + *(float *)&v122.i32[3])
                                      + *(float *)v123.i32)
                              + *(float *)&v123.i32[1])
                      + *(float *)&v123.i32[2])
              + *(float *)&v123.i32[3];
          v113 += 2;
          v114 -= 8;
        }
        while (v114);
        unsigned int v47 = vaddvq_s32(vaddq_s32(v111, v112));
        unint64_t v110 = (v102 & 0xFFFFFFFFFFFFFFF8) + v29;
        if (v102 != (v102 & 0xFFFFFFFFFFFFFFF8)) {
          goto LABEL_92;
        }
LABEL_86:
        ++v101;
        uint64_t v107 = (float16x4_t *)((char *)v107 + v99);
        v105 += v99;
        if (v101 == v32) {
          goto LABEL_98;
        }
      }
      unint64_t v110 = v29;
LABEL_92:
      unint64_t v124 = v30 - v110;
      int v125 = (short float *)&v105[2 * v110];
      do
      {
        short float v126 = *v125++;
        _H7 = v126;
        __asm { FCVT            S16, H7 }
        v47 += v126 < COERCE_SHORT_FLOAT(26624) && *(float *)v100.i32 <= _S16;
        if (v126 < COERCE_SHORT_FLOAT(26624) && *(float *)v100.i32 <= _S16) {
          float v129 = _S16;
        }
        else {
          float v129 = -0.0;
        }
        float v46 = v46 + v129;
        --v124;
      }
      while (v124);
      goto LABEL_86;
    }
LABEL_98:
    CVPixelBufferUnlockBaseAddress(a2, 1uLL);
    goto LABEL_103;
  }
  double v44 = (float *)(a1 + 1220);
  sub_1BA84E3EC((uint64_t)a2, a1 + 1220, v42, v41, v40, v39);
  float v46 = v45;
  if (sub_1BA849834())
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Portrait.framework focus dist (gray rect: %f (%f)"), v46, *v44;
  }
  unsigned int v47 = 0;
  *double v44 = v46;
LABEL_103:
  unsigned int v131 = v218;
  int v132 = *(unsigned __int8 *)(a1 + 1216);
  if (!*(unsigned char *)(a1 + 1216))
  {
    if (v47) {
      float v46 = v46 / (float)(int)v47;
    }
    else {
      float v46 = *(float *)a1;
    }
  }
  *(_DWORD *)(a1 + 1144) = 1157627904;
  *(void *)(a1 + 32) = *(void *)(a1 + 24);
  *(void *)(a1 + 56) = *(void *)(a1 + 48);
  uint64_t v133 = (long long *)*v218;
  float v134 = (long long *)v218[1];
  if (v134 == (long long *)*v218)
  {
LABEL_219:
    if (v131[1] == *v131)
    {
      int v193 = *(_DWORD *)(a1 + 72);
      if (*(_DWORD *)(a1 + 112) >= v193 + 1) {
        int v192 = v193 + 1;
      }
      else {
        int v192 = *(_DWORD *)(a1 + 112);
      }
    }
    else
    {
      int v192 = 0;
    }
    *(_DWORD *)(a1 + 72) = v192;
    if (sub_1BA849834())
    {
      objc_msgSend(NSString, "stringWithFormat:", @"maxFramesWithoutFace = %d", *(unsigned int *)(a1 + 112));

      objc_msgSend(NSString, "stringWithFormat:", @"framesWithoutFace = %d", *(unsigned int *)(a1 + 72));
    }
    float v194 = *(float *)a1;
    if (*(float *)a1 >= 2048.0)
    {
      uint64_t v196 = a1 + 84;
    }
    else
    {
      int v195 = *(_DWORD *)(a1 + 72);
      uint64_t v196 = a1 + 84;
      if (v195 >= 1 && v195 < *(_DWORD *)(a1 + 112)) {
        goto LABEL_235;
      }
      float v197 = *(float *)(a1 + 108);
      if (*(unsigned char *)(a1 + 1216) && v46 < v194)
      {
        float v197 = v197 * 0.1;
        *(float *)(a1 + 108) = v197;
      }
      float v46 = v194 + (float)((float)(v46 - v194) * v197);
    }
    *(float *)a1 = v46;
LABEL_235:
    *(void *)uint64_t v196 = 0;
    *(void *)(v196 + 8) = 0;
    *(_DWORD *)(v196 + 24) = 0;
    *(void *)(v196 + 16) = 0;
    int8x16_t v199 = *(unsigned char **)(a1 + 24);
    int8x16_t v198 = *(unsigned char **)(a1 + 32);
    size_t v200 = v198 - v199;
    if (v198 == v199)
    {
      int64x2_t v191 = 0;
    }
    else
    {
      if ((v200 & 0x8000000000000000) != 0) {
        abort();
      }
      int64x2_t v191 = operator new(v198 - v199);
      memcpy(v191, v199, v200);
    }
    int64_t v202 = *(unsigned char **)(a1 + 48);
    unsigned int v201 = *(unsigned char **)(a1 + 56);
    size_t v203 = v201 - v202;
    if (v201 == v202) {
      goto LABEL_243;
    }
    if ((v203 & 0x8000000000000000) != 0) {
      abort();
    }
    int64x2_t v204 = operator new(v201 - v202);
LABEL_242:
    v205 = v204;
    memcpy(v204, v202, v203);
    operator delete(v205);
LABEL_243:
    if (v191) {
      operator delete(v191);
    }
LABEL_245:
    *(_OWORD *)a5 = *(_OWORD *)a1;
    *(_DWORD *)(a5 + 16) = *(_DWORD *)(a1 + 16);
    *(void *)(a5 + 32) = 0;
    *(void *)(a5 + 40) = 0;
    *(void *)(a5 + 24) = 0;
    unint64_t v207 = *(unsigned char **)(a1 + 24);
    int v206 = *(unsigned char **)(a1 + 32);
    int64_t v208 = v206 - v207;
    if (v206 != v207)
    {
      if (v208 < 0) {
        abort();
      }
      int64x2_t v209 = (char *)operator new(v206 - v207);
      *(void *)(a5 + 24) = v209;
      uint64_t v210 = &v209[4 * (v208 >> 2)];
      *(void *)(a5 + 40) = v210;
      memcpy(v209, v207, v208);
      *(void *)(a5 + 32) = v210;
    }
    *(void *)(a5 + 48) = 0;
    *(void *)(a5 + 56) = 0;
    *(void *)(a5 + 64) = 0;
    float v212 = *(unsigned char **)(a1 + 48);
    float v211 = *(unsigned char **)(a1 + 56);
    int64_t v213 = v211 - v212;
    if (v211 != v212)
    {
      if (v213 < 0) {
        abort();
      }
      size_t v214 = (char *)operator new(v211 - v212);
      *(void *)(a5 + 48) = v214;
      unsigned int v215 = &v214[4 * (v213 >> 2)];
      *(void *)(a5 + 64) = v215;
      memcpy(v214, v212, v213);
      *(void *)(a5 + 56) = v215;
    }
    *(_DWORD *)(a5 + 72) = *(_DWORD *)(a1 + 72);
    return;
  }
  float v225 = a2;
  float v223 = v17;
  float v224 = v16;
  float v222 = v18;
  float v135 = (uint64_t (***)(void))operator new(0x28uLL);
  uint64_t v136 = (uint64_t (**)(void))&unk_1F142EF08;
  float32x4_t *v135 = (uint64_t (**)(void))&unk_1F142EF08;
  v135[1] = (uint64_t (**)(void))&v225;
  v135[2] = (uint64_t (**)(void))&v223;
  v135[3] = (uint64_t (**)(void))&v222;
  v135[4] = (uint64_t (**)(void))&v224;
  unint64_t v232 = v135;
  if (!v132)
  {
    float v219 = 0;
    unint64_t v220 = 0;
    uint64_t v221 = 0;
LABEL_117:
    uint64_t v137 = v136[2]();
LABEL_118:
    uint64_t v229 = (void *)v137;
    goto LABEL_119;
  }
  v228[0] = &unk_1F142EEC0;
  v228[1] = &v225;
  v228[2] = a1;
  uint64_t v229 = v228;
  sub_1BA8498DC(v228, v231);
  if (v229 == v228)
  {
    (*(void (**)(void *))(v228[0] + 32))(v228);
  }
  else if (v229)
  {
    (*(void (**)(void))(*v229 + 40))();
  }
  uint64_t v137 = (uint64_t)v232;
  unint64_t v220 = 0;
  uint64_t v221 = 0;
  float v219 = 0;
  uint64_t v133 = (long long *)*v218;
  float v134 = (long long *)v218[1];
  if (!v232) {
    goto LABEL_118;
  }
  if (v232 != v231)
  {
    uint64_t v136 = *v232;
    goto LABEL_117;
  }
  uint64_t v229 = v228;
  (*(void (**)(void *, void *))(v231[0] + 24))(v231, v228);
LABEL_119:
  int v226 = &v219;
  if (v133 == v134)
  {
LABEL_122:
    if (v229 == v228)
    {
      (*(void (**)(void *))(v228[0] + 32))(v228);
    }
    else if (v229)
    {
      (*(void (**)(void))(*v229 + 40))();
    }
    if (v232 == v231)
    {
      (*(void (**)(void *))(v231[0] + 32))(v231);
    }
    else if (v232)
    {
      (*v232)[5]();
    }
    int8x16_t v141 = v219;
    float v140 = v220;
    if (v219 == v220) {
      goto LABEL_153;
    }
    float v142 = 0.0;
    float v143 = v219;
    do
    {
      if (v143[2] > v142) {
        float v142 = v143[2];
      }
      v143 += 3;
    }
    while (v143 != v220);
    float v144 = (float)(v142 * a6) + -0.00000011921;
    float v145 = v219;
    while (v145[2] >= v144)
    {
      v145 += 3;
      if (v145 == v220)
      {
        float v145 = v220;
        goto LABEL_145;
      }
    }
    if (v145 != v220)
    {
      for (m = v145 + 3; m != v140; m += 3)
      {
        if (m[2] >= v144)
        {
          *float v145 = *m;
          v145[1] = m[1];
          v145[2] = m[2];
          v145 += 3;
        }
      }
    }
LABEL_145:
    if (v141 == v145)
    {
LABEL_153:
      float v152 = *(float *)(a1 + 1144);
      if (v152 < 2048.0)
      {
        unsigned int v131 = v218;
        int v153 = v217;
        if (v152 > 3.4028e38)
        {
          *(_DWORD *)(a1 + 1144) = 2139095039;
          float v152 = 3.4028e38;
        }
        goto LABEL_205;
      }
      *(_DWORD *)(a1 + 1144) = 1157627904;
      float v152 = 2048.0;
    }
    else
    {
      float v147 = 3.4028e38;
      unint64_t v148 = v141;
      do
      {
        float v149 = *v148;
        v148 += 3;
        float v150 = v149;
        if (v149 < v147) {
          float v147 = v150;
        }
      }
      while (v148 != v145);
      float v151 = *(float *)(a1 + 1144);
      if (v151 >= 2048.0)
      {
        if (v147 > 1.7014e38) {
          float v147 = 2048.0;
        }
      }
      else if (v147 >= v151)
      {
        goto LABEL_162;
      }
      *(float *)(a1 + 1144) = v147;
      do
      {
LABEL_162:
        short float v156 = *(char **)(a1 + 32);
        unint64_t v155 = *(void *)(a1 + 40);
        if ((unint64_t)v156 >= v155)
        {
          unint64_t v158 = *(char **)(a1 + 24);
          uint64_t v159 = (v156 - v158) >> 2;
          unint64_t v160 = v159 + 1;
          if ((unint64_t)(v159 + 1) >> 62) {
            goto LABEL_257;
          }
          uint64_t v161 = v155 - (void)v158;
          if (v161 >> 1 > v160) {
            unint64_t v160 = v161 >> 1;
          }
          if ((unint64_t)v161 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v162 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v162 = v160;
          }
          if (v162)
          {
            if (v162 >> 62) {
              goto LABEL_258;
            }
            long long v163 = operator new(4 * v162);
          }
          else
          {
            long long v163 = 0;
          }
          int v164 = &v163[4 * v159];
          *int v164 = *(_DWORD *)v141;
          unint64_t v157 = v164 + 1;
          if (v156 != v158)
          {
            unint64_t v165 = v156 - 4 - v158;
            if (v165 < 0x2C) {
              goto LABEL_267;
            }
            if ((unint64_t)(v158 - v163) < 0x20) {
              goto LABEL_267;
            }
            uint64_t v166 = (v165 >> 2) + 1;
            int64x2_t v167 = &v163[4 * v159 - 16];
            uint64_t v168 = v156 - 16;
            uint64_t v169 = v166 & 0x7FFFFFFFFFFFFFF8;
            do
            {
              long long v170 = *(_OWORD *)v168;
              *(v167 - 1) = *((_OWORD *)v168 - 1);
              *int64x2_t v167 = v170;
              v167 -= 2;
              v168 -= 32;
              v169 -= 8;
            }
            while (v169);
            v164 -= v166 & 0x7FFFFFFFFFFFFFF8;
            v156 -= 4 * (v166 & 0x7FFFFFFFFFFFFFF8);
            if (v166 != (v166 & 0x7FFFFFFFFFFFFFF8))
            {
LABEL_267:
              do
              {
                int v171 = *((_DWORD *)v156 - 1);
                v156 -= 4;
                *--int v164 = v171;
              }
              while (v156 != v158);
            }
          }
          *(void *)(a1 + 24) = v164;
          *(void *)(a1 + 32) = v157;
          *(void *)(a1 + 40) = &v163[4 * v162];
          if (v158) {
            operator delete(v158);
          }
        }
        else
        {
          *(float *)short float v156 = *v141;
          unint64_t v157 = v156 + 4;
        }
        *(void *)(a1 + 32) = v157;
        int64x2_t v173 = *(char **)(a1 + 56);
        unint64_t v172 = *(void *)(a1 + 64);
        if ((unint64_t)v173 < v172)
        {
          *(float *)int64x2_t v173 = v141[1];
          uint64_t v154 = v173 + 4;
        }
        else
        {
          unint64_t v174 = *(char **)(a1 + 48);
          uint64_t v175 = (v173 - v174) >> 2;
          unint64_t v176 = v175 + 1;
          if ((unint64_t)(v175 + 1) >> 62) {
LABEL_257:
          }
            abort();
          uint64_t v177 = v172 - (void)v174;
          if (v177 >> 1 > v176) {
            unint64_t v176 = v177 >> 1;
          }
          if ((unint64_t)v177 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v178 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v178 = v176;
          }
          if (v178)
          {
            if (v178 >> 62) {
LABEL_258:
            }
              sub_1BA81F974();
            long long v179 = operator new(4 * v178);
          }
          else
          {
            long long v179 = 0;
          }
          int v180 = &v179[4 * v175];
          *int v180 = *((_DWORD *)v141 + 1);
          uint64_t v154 = v180 + 1;
          if (v173 != v174)
          {
            unint64_t v181 = v173 - 4 - v174;
            if (v181 < 0x2C) {
              goto LABEL_268;
            }
            if ((unint64_t)(v174 - v179) < 0x20) {
              goto LABEL_268;
            }
            uint64_t v182 = (v181 >> 2) + 1;
            float v183 = &v179[4 * v175 - 16];
            int v184 = v173 - 16;
            uint64_t v185 = v182 & 0x7FFFFFFFFFFFFFF8;
            do
            {
              long long v186 = *(_OWORD *)v184;
              *(v183 - 1) = *((_OWORD *)v184 - 1);
              *float v183 = v186;
              v183 -= 2;
              v184 -= 32;
              v185 -= 8;
            }
            while (v185);
            v180 -= v182 & 0x7FFFFFFFFFFFFFF8;
            v173 -= 4 * (v182 & 0x7FFFFFFFFFFFFFF8);
            if (v182 != (v182 & 0x7FFFFFFFFFFFFFF8))
            {
LABEL_268:
              do
              {
                int v187 = *((_DWORD *)v173 - 1);
                v173 -= 4;
                *--int v180 = v187;
              }
              while (v173 != v174);
            }
          }
          *(void *)(a1 + 48) = v180;
          *(void *)(a1 + 56) = v154;
          *(void *)(a1 + 64) = &v179[4 * v178];
          if (v174) {
            operator delete(v174);
          }
        }
        *(void *)(a1 + 56) = v154;
        v141 += 3;
      }
      while (v141 != v145);
      float v152 = *(float *)(a1 + 1144);
      int8x16_t v141 = v219;
    }
    unsigned int v131 = v218;
    int v153 = v217;
LABEL_205:
    if (v141)
    {
      unint64_t v220 = v141;
      operator delete(v141);
    }
    if (v153 && v152 < 2048.0)
    {
      if (sub_1BA849834())
      {
        if (*(unsigned char *)(a1 + 1216)) {
          objc_msgSend(NSString, "stringWithFormat:", @"Portrait.framework focus dist from black rect: %f", v152);
        }
        else {
          objc_msgSend(NSString, "stringWithFormat:", @"Classic focus dist from black rect p%d%% %f", (int)(float)(v16 * 100.0), v152);
        }
      }
      float v46 = v152;
      unsigned int v131 = v218;
    }
    goto LABEL_219;
  }
  while (1)
  {
    long long v227 = *v133;
    if (!v229) {
      break;
    }
    LODWORD(v227) = (*(float (**)(void *, long long *))(*v229 + 48))(v229, &v227);
    *(void *)((char *)&v227 + 4) = __PAIR64__(v139, v138);
    sub_1BA849B44((char ***)&v226, (uint64_t *)&v227);
    if (++v133 == v134) {
      goto LABEL_122;
    }
  }
  sub_1BA816504();
  __break(1u);
}

void sub_1BA84B584(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  if (v24)
  {
    operator delete(v24);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_1BA84B624(uint64_t a1, float *a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_1BA84E3EC(**(void **)(a1 + 8), v2 + 1220, *a2, a2[1], a2[2], a2[3]);
  *(_DWORD *)(v2 + 1220) = v3;
}

__n128 sub_1BA84B684(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1F142EEC0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 sub_1BA84B6AC(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_1F142EEC0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

void sub_1BA84B6F8()
{
}

uint64_t sub_1BA84B710(uint64_t a1, float32x2_t *a2)
{
  float32x2_t v3 = *a2;
  float32x2_t v44 = a2[1];
  unsigned int Width = CVPixelBufferGetWidth(**(CVPixelBufferRef **)(a1 + 8));
  unsigned int Height = CVPixelBufferGetHeight(**(CVPixelBufferRef **)(a1 + 8));
  float32x2_t v6 = vcvt_f32_s32((int32x2_t)__PAIR64__(Height, Width));
  int32x2_t v46 = vmax_s32(vcvt_s32_f32(vmul_f32(v3, v6)), 0);
  int32x2_t v45 = vmin_s32(vcvt_s32_f32(vmul_f32(vadd_f32(v3, v44), v6)), (int32x2_t)__PAIR64__(Height, Width));
  bzero(v47, 0x400uLL);
  CVPixelBufferLockBaseAddress(**(CVPixelBufferRef **)(a1 + 8), 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(**(CVPixelBufferRef **)(a1 + 8));
  CVPixelBufferGetHeight(**(CVPixelBufferRef **)(a1 + 8));
  CVPixelBufferGetWidth(**(CVPixelBufferRef **)(a1 + 8));
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(**(CVPixelBufferRef **)(a1 + 8));
  uint64_t v9 = v46.u32[1];
  if (v46.i32[1] < v45.i32[1] && v46.i32[0] < v45.i32[0])
  {
    float v33 = (short float *)&BaseAddress[2 * v46.u32[0] + BytesPerRow * v46.u32[1]];
    uint64_t v34 = v46.u32[1];
    do
    {
      int v35 = v33;
      unint64_t v36 = v45.u32[0] - (unint64_t)v46.u32[0];
      do
      {
        _H4 = *v35;
        if (*v35 < COERCE_SHORT_FLOAT(26624))
        {
          __asm { FCVT            S2, H4 }
          float v39 = **(float **)(a1 + 16);
          float v40 = **(float **)(a1 + 24);
          if (v39 <= _S2 && v40 > _S2)
          {
            unint64_t v42 = (unint64_t)(float)((float)((float)(_S2 - v39) * 256.0) / (float)(v40 - v39));
            v47[v42] = v47[v42] + 1.0;
          }
        }
        ++v35;
        --v36;
      }
      while (v36);
      ++v34;
      float v33 = (short float *)((char *)v33 + BytesPerRow);
    }
    while (v34 != v45.u32[1]);
  }
  CVPixelBufferUnlockBaseAddress(**(CVPixelBufferRef **)(a1 + 8), 1uLL);
  uint64_t v11 = 0;
  float v48 = 0.00000011921;
  float v12 = 0.00000011921;
  do
  {
    float v12 = v12 + v47[v11];
    float v48 = v12;
    ++v11;
  }
  while (v11 != 256);
  float v13 = v47[0] / v12;
  v47[0] = v13;
  for (uint64_t i = 1; i != 256; ++i)
  {
    float v13 = v13 + (float)(v47[i] / v48);
    v47[i] = v13;
  }
  unint64_t v15 = 0;
  float v16 = **(float **)(a1 + 16);
  float v17 = **(float **)(a1 + 24);
  do
  {
    if (v47[v15] > **(float **)(a1 + 32)) {
      break;
    }
    ++v15;
  }
  while (v15 != 256);
  CVPixelBufferLockBaseAddress(**(CVPixelBufferRef **)(a1 + 8), 1uLL);
  float v18 = (char *)CVPixelBufferGetBaseAddress(**(CVPixelBufferRef **)(a1 + 8));
  CVPixelBufferGetHeight(**(CVPixelBufferRef **)(a1 + 8));
  CVPixelBufferGetWidth(**(CVPixelBufferRef **)(a1 + 8));
  size_t v19 = CVPixelBufferGetBytesPerRow(**(CVPixelBufferRef **)(a1 + 8));
  float v20 = 0.0;
  if (v46.i32[1] < v45.i32[1] && v46.i32[0] < v45.i32[0])
  {
    int v21 = 0;
    int v22 = 0;
    float v23 = (short float *)&v18[2 * v46.u32[0] + v19 * v46.u32[1]];
    do
    {
      float v24 = v23;
      unint64_t v25 = v45.u32[0] - (unint64_t)v46.u32[0];
      do
      {
        _H2 = *v24;
        __asm { FCVT            S3, H2 }
        if (*v24 < COERCE_SHORT_FLOAT(26624)) {
          int v31 = v22;
        }
        else {
          int v31 = v22 + 1;
        }
        if (*v24 < COERCE_SHORT_FLOAT(26624)
          && (float)(v16 + (float)((float)((float)v15 * 0.0039062) * (float)(v17 - v16))) < _S3)
        {
          float v20 = v20 + _S3;
          ++v21;
        }
        else
        {
          int v22 = v31;
        }
        ++v24;
        --v25;
      }
      while (v25);
      ++v9;
      float v23 = (short float *)((char *)v23 + v19);
    }
    while (v9 != v45.u32[1]);
  }
  return CVPixelBufferUnlockBaseAddress(**(CVPixelBufferRef **)(a1 + 8), 1uLL);
}

__n128 sub_1BA84BAE4(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1F142EF08;
  __n128 result = *(__n128 *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 sub_1BA84BB14(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x28uLL);
  *(void *)uint64_t v2 = &unk_1F142EF08;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  return result;
}

void sub_1BA84BB68()
{
}

void sub_1BA84BB80(CVPixelBufferRef pixelBuffer@<X1>, float *a2@<X0>, int a3@<W2>, uint64_t a4@<X8>)
{
  float v8 = a2[288];
  float v9 = a2[289];
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  BaseAddress = (float *)CVPixelBufferGetBaseAddress(pixelBuffer);
  CVPixelBufferGetHeight(pixelBuffer);
  CVPixelBufferGetWidth(pixelBuffer);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  int v14 = a2 + 29;
  bzero(a2 + 29, 0x400uLL);
  float v15 = 0.0;
  if (Height && Width)
  {
    for (uint64_t i = 0; i != Height; ++i)
    {
      float v17 = BaseAddress;
      size_t v18 = Width;
      do
      {
        float v19 = *v17;
        if (*v17 < 2048.0)
        {
          if (v19 >= v8 && v19 < v9)
          {
            unint64_t v21 = (unint64_t)(float)((float)((float)(v19 - v8) * 256.0) / (float)(v9 - v8));
            v14[v21] = v14[v21] + 1.0;
            float v19 = *v17;
          }
          float v15 = v15 + fmaxf(*a2 - v19, 0.0);
        }
        ++v17;
        --v18;
      }
      while (v18);
      BaseAddress = (float *)((char *)BaseAddress + BytesPerRow);
    }
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  a2[285] = 0.00000011921;
  float v22 = 0.00000011921;
  for (uint64_t j = 29; j != 285; ++j)
  {
    float v22 = v22 + a2[j];
    a2[285] = v22;
  }
  float v24 = *v14 / v22;
  float *v14 = v24;
  for (uint64_t k = 30; k != 285; ++k)
  {
    float v24 = v24 + (float)(a2[k] / a2[285]);
    a2[k] = v24;
  }
  if (a2[285] <= 0.00000011921) {
    bzero(a2 + 29, 0x400uLL);
  }
  for (unint64_t m = 0; m != 256; ++m)
  {
    if (a2[m + 29] > 0.1) {
      break;
    }
  }
  float v27 = v8 + (float)((float)((float)m * 0.0039062) * (float)(v9 - v8));
  float v28 = a2[2];
  if (v28 < 2048.0) {
    float v27 = v28 + (float)((float)(v27 - v28) * 0.2);
  }
  a2[2] = v27;
  float v29 = v15 / (float)(Height * Width);
  float v30 = a2[4];
  if (v30 >= 0.0) {
    float v29 = (float)(v29 * a2[290]) + (float)((float)(1.0 - a2[290]) * v30);
  }
  a2[4] = v29;
  if (a3 == 1)
  {
    double v32 = 1.0 / *a2;
    float v33 = a2[299] + a2[298] * v32;
    float v34 = v32 + v33;
    float v31 = *a2 + (float)(-1.0 / v34);
  }
  else
  {
    float v31 = 0.0;
    if (!a3) {
      float v31 = fmaxf(a2[293], fminf(a2[292], (float)(v29 - a2[295]) * a2[296]))
    }
          + fmaxf(fminf(a2[294] - a2[292], (float)(v29 - a2[297]) * a2[300]), 0.0);
  }
  float v35 = *a2;
  float v36 = 0.0;
  float v37 = fminf(fminf(v27, fmaxf(*a2 + (float)(v31 * -2.0), 0.0)), 0.25);
  a2[1] = v31;
  a2[2] = v37;
  if (v35 < 2048.0 && v35 > 0.0)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76730, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1E9F76730))
    {
      LODWORD(v58) = 1053609165;
      qword_1E9F76740 = [NSNumber numberWithFloat:v58];
      __cxa_guard_release(&qword_1E9F76730);
    }
    if ((byte_1E9F76738 & 1) == 0)
    {
      __p = operator new(0x28uLL);
      long long v60 = xmmword_1BA86C130;
      strcpy((char *)__p, "disparityMarginDeltaDepthInMeters");
      sub_1BA81CE64((uint64_t)&qword_1E9F76740, (uint64_t)&__p);
      if (SHIBYTE(v60) < 0) {
        operator delete(__p);
      }
      byte_1E9F76738 = 1;
    }
    float v38 = 1.0 / *a2;
    [(id)qword_1E9F76740 floatValue];
    float v36 = vabds_f32(1.0 / (float)(v38 + v39), 1.0 / v38);
  }
  a2[3] = v36;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76728, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76728))
  {
    unint64_t v56 = +[CVAPreferenceManager defaults];
    char v57 = [v56 BOOLForKey:@"CVAPhotoDebugDrawAutofocusDisparityCells"];

    byte_1E9F76BB9 = v57;
    __cxa_guard_release(&qword_1E9F76728);
  }
  if (byte_1E9F76BB9)
  {
    float v40 = *a2;
    if (*a2 < 2048.0 || ((v41 = v40 - a2[1], float v42 = v40 - a2[3], v41 >= 2048.0) ? (v43 = v42 < 2048.0) : (v43 = 1), v43))
    {
      CVPixelBufferGetWidth(pixelBuffer);
      CVPixelBufferGetHeight(pixelBuffer);
      CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
      CVPixelBufferGetBaseAddress(pixelBuffer);
      CVPixelBufferGetHeight(pixelBuffer);
      CVPixelBufferGetWidth(pixelBuffer);
      CVPixelBufferGetBytesPerRow(pixelBuffer);
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
    }
  }
  if (sub_1BA849834())
  {
    float v44 = *a2 - a2[1];
    float v45 = *a2 - a2[3];
    objc_msgSend(NSString, "stringWithFormat:", @"canonicalBgDisp = %5.3f", a2[2]);

    objc_msgSend(NSString, "stringWithFormat:", @"canonicalFgDisp = %5.3f", *a2);
    objc_msgSend(NSString, "stringWithFormat:", @"nonlinearCanonicalFgDispMargin = %5.3f", a2[1]);

    objc_msgSend(NSString, "stringWithFormat:", @"nonlinearCutoffDisp = %5.3f", v44);
    objc_msgSend(NSString, "stringWithFormat:", @"linearZCanonicalFgDispMargin = %5.3f", a2[3]);

    objc_msgSend(NSString, "stringWithFormat:", @"linearZCutoffDisp = %5.3f", v45);
  }
  *(_OWORD *)a4 = *(_OWORD *)a2;
  *(float *)(a4 + 16) = a2[4];
  *(void *)(a4 + 32) = 0;
  *(void *)(a4 + 40) = 0;
  *(void *)(a4 + 24) = 0;
  unsigned int v47 = (unsigned char *)*((void *)a2 + 3);
  int32x2_t v46 = (unsigned char *)*((void *)a2 + 4);
  int64_t v48 = v46 - v47;
  if (v46 != v47)
  {
    if (v48 < 0) {
      abort();
    }
    uint64_t v49 = (char *)operator new(v46 - v47);
    *(void *)(a4 + 24) = v49;
    double v50 = &v49[4 * (v48 >> 2)];
    *(void *)(a4 + 40) = v50;
    memcpy(v49, v47, v48);
    *(void *)(a4 + 32) = v50;
  }
  *(void *)(a4 + 48) = 0;
  *(void *)(a4 + 56) = 0;
  *(void *)(a4 + 64) = 0;
  float v52 = (unsigned char *)*((void *)a2 + 6);
  size_t v51 = (unsigned char *)*((void *)a2 + 7);
  int64_t v53 = v51 - v52;
  if (v51 != v52)
  {
    if (v53 < 0) {
      abort();
    }
    uint64_t v54 = (char *)operator new(v51 - v52);
    *(void *)(a4 + 48) = v54;
    float v55 = &v54[4 * (v53 >> 2)];
    *(void *)(a4 + 64) = v55;
    memcpy(v54, v52, v53);
    *(void *)(a4 + 56) = v55;
  }
  *(float *)(a4 + 72) = a2[18];
}

void sub_1BA84C23C(_Unwind_Exception *a1)
{
}

void sub_1BA84C270(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1BA84C2A0(CVPixelBufferRef pixelBuffer@<X1>, float *a2@<X0>, int a3@<W2>, uint64_t a4@<X8>)
{
  float v8 = a2[288];
  float v9 = a2[289];
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  BaseAddress = (short float *)CVPixelBufferGetBaseAddress(pixelBuffer);
  CVPixelBufferGetHeight(pixelBuffer);
  CVPixelBufferGetWidth(pixelBuffer);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  int v14 = a2 + 29;
  bzero(a2 + 29, 0x400uLL);
  float v15 = 0.0;
  if (Height && Width)
  {
    for (uint64_t i = 0; i != Height; ++i)
    {
      float v17 = BaseAddress;
      size_t v18 = Width;
      do
      {
        _H5 = *v17;
        if (*v17 < COERCE_SHORT_FLOAT(26624))
        {
          __asm { FCVT            S4, H5 }
          if (v8 <= _S4 && v9 > _S4)
          {
            unint64_t v26 = (unint64_t)(float)((float)((float)(_S4 - v8) * 256.0) / (float)(v9 - v8));
            v14[v26] = v14[v26] + 1.0;
          }
          float v15 = v15 + fmaxf(*a2 - _S4, 0.0);
        }
        ++v17;
        --v18;
      }
      while (v18);
      BaseAddress = (short float *)((char *)BaseAddress + BytesPerRow);
    }
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  a2[285] = 0.00000011921;
  float v27 = 0.00000011921;
  for (uint64_t j = 29; j != 285; ++j)
  {
    float v27 = v27 + a2[j];
    a2[285] = v27;
  }
  float v29 = *v14 / v27;
  float *v14 = v29;
  for (uint64_t k = 30; k != 285; ++k)
  {
    float v29 = v29 + (float)(a2[k] / a2[285]);
    a2[k] = v29;
  }
  if (a2[285] <= 0.00000011921) {
    bzero(a2 + 29, 0x400uLL);
  }
  for (unint64_t m = 0; m != 256; ++m)
  {
    if (a2[m + 29] > 0.1) {
      break;
    }
  }
  float v32 = v8 + (float)((float)((float)m * 0.0039062) * (float)(v9 - v8));
  float v33 = a2[2];
  if (v33 < 2048.0) {
    float v32 = v33 + (float)((float)(v32 - v33) * 0.2);
  }
  a2[2] = v32;
  float v34 = v15 / (float)(Height * Width);
  float v35 = a2[4];
  if (v35 >= 0.0) {
    float v34 = (float)(v34 * a2[290]) + (float)((float)(1.0 - a2[290]) * v35);
  }
  a2[4] = v34;
  if (a3 == 1)
  {
    double v37 = 1.0 / *a2;
    float v38 = a2[299] + a2[298] * v37;
    float v39 = v37 + v38;
    float v36 = *a2 + (float)(-1.0 / v39);
  }
  else
  {
    float v36 = 0.0;
    if (!a3) {
      float v36 = fmaxf(a2[293], fminf(a2[292], (float)(v34 - a2[295]) * a2[296]))
    }
          + fmaxf(fminf(a2[294] - a2[292], (float)(v34 - a2[297]) * a2[300]), 0.0);
  }
  float v40 = *a2;
  float v41 = 0.0;
  float v42 = fminf(fminf(v32, fmaxf(*a2 + (float)(v36 * -2.0), 0.0)), 0.25);
  a2[1] = v36;
  a2[2] = v42;
  if (v40 < 2048.0 && v40 > 0.0)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76798, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1E9F76798))
    {
      LODWORD(v63) = 1053609165;
      qword_1E9F768C0 = [NSNumber numberWithFloat:v63];
      __cxa_guard_release(&qword_1E9F76798);
    }
    if ((byte_1E9F768B8 & 1) == 0)
    {
      __p = operator new(0x28uLL);
      long long v65 = xmmword_1BA86C130;
      strcpy((char *)__p, "disparityMarginDeltaDepthInMeters");
      sub_1BA81CE64((uint64_t)&qword_1E9F768C0, (uint64_t)&__p);
      if (SHIBYTE(v65) < 0) {
        operator delete(__p);
      }
      byte_1E9F768B8 = 1;
    }
    float v43 = 1.0 / *a2;
    [(id)qword_1E9F768C0 floatValue];
    float v41 = vabds_f32(1.0 / (float)(v43 + v44), 1.0 / v43);
  }
  a2[3] = v41;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76790, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76790))
  {
    uint64_t v61 = +[CVAPreferenceManager defaults];
    char v62 = [v61 BOOLForKey:@"CVAPhotoDebugDrawAutofocusDisparityCells"];

    byte_1E9F76BC1 = v62;
    __cxa_guard_release(&qword_1E9F76790);
  }
  if (byte_1E9F76BC1)
  {
    float v45 = *a2;
    if (*a2 < 2048.0 || ((float v46 = v45 - a2[1], v47 = v45 - a2[3], v46 >= 2048.0) ? (v48 = v47 < 2048.0) : (v48 = 1), v48))
    {
      CVPixelBufferGetWidth(pixelBuffer);
      CVPixelBufferGetHeight(pixelBuffer);
      CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
      CVPixelBufferGetBaseAddress(pixelBuffer);
      CVPixelBufferGetHeight(pixelBuffer);
      CVPixelBufferGetWidth(pixelBuffer);
      CVPixelBufferGetBytesPerRow(pixelBuffer);
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
    }
  }
  if (sub_1BA849834())
  {
    float v49 = *a2 - a2[1];
    float v50 = *a2 - a2[3];
    objc_msgSend(NSString, "stringWithFormat:", @"canonicalBgDisp = %5.3f", a2[2]);

    objc_msgSend(NSString, "stringWithFormat:", @"canonicalFgDisp = %5.3f", *a2);
    objc_msgSend(NSString, "stringWithFormat:", @"nonlinearCanonicalFgDispMargin = %5.3f", a2[1]);

    objc_msgSend(NSString, "stringWithFormat:", @"nonlinearCutoffDisp = %5.3f", v49);
    objc_msgSend(NSString, "stringWithFormat:", @"linearZCanonicalFgDispMargin = %5.3f", a2[3]);

    objc_msgSend(NSString, "stringWithFormat:", @"linearZCutoffDisp = %5.3f", v50);
  }
  *(_OWORD *)a4 = *(_OWORD *)a2;
  *(float *)(a4 + 16) = a2[4];
  *(void *)(a4 + 32) = 0;
  *(void *)(a4 + 40) = 0;
  *(void *)(a4 + 24) = 0;
  float v52 = (unsigned char *)*((void *)a2 + 3);
  size_t v51 = (unsigned char *)*((void *)a2 + 4);
  int64_t v53 = v51 - v52;
  if (v51 != v52)
  {
    if (v53 < 0) {
      abort();
    }
    uint64_t v54 = (char *)operator new(v51 - v52);
    *(void *)(a4 + 24) = v54;
    float v55 = &v54[4 * (v53 >> 2)];
    *(void *)(a4 + 40) = v55;
    memcpy(v54, v52, v53);
    *(void *)(a4 + 32) = v55;
  }
  *(void *)(a4 + 48) = 0;
  *(void *)(a4 + 56) = 0;
  *(void *)(a4 + 64) = 0;
  char v57 = (unsigned char *)*((void *)a2 + 6);
  unint64_t v56 = (unsigned char *)*((void *)a2 + 7);
  int64_t v58 = v56 - v57;
  if (v56 != v57)
  {
    if (v58 < 0) {
      abort();
    }
    char v59 = (char *)operator new(v56 - v57);
    *(void *)(a4 + 48) = v59;
    long long v60 = &v59[4 * (v58 >> 2)];
    *(void *)(a4 + 64) = v60;
    memcpy(v59, v57, v58);
    *(void *)(a4 + 56) = v60;
  }
  *(float *)(a4 + 72) = a2[18];
}

void sub_1BA84C960(_Unwind_Exception *a1)
{
}

void sub_1BA84C994(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1BA84CA20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ImageSaverRegistrator;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA84CB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  unint64_t v10 = v9;

  a9.super_class = (Class)FileConfigRegistrator;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA84CB40(void *a1)
{
  id v57 = a1;
  if (!v57 || (byte_1E9F76C09 & 1) != 0) {
    goto LABEL_78;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76578, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76578))
  {
    sub_1BA81ED8C();
    __cxa_atexit((void (*)(void *))sub_1BA81F3B8, &xmmword_1E9F76580, &dword_1BA813000);
    __cxa_guard_release(&qword_1E9F76578);
  }
  uint64_t v1 = v57;
  if (byte_1E9F76620)
  {
    NSLog(&cfstr_FileconfigUnre.isa, v57);
    uint64_t v1 = v57;
  }
  id v2 = v1;
  float32x2_t v3 = (const char *)[v2 UTF8String];
  size_t v4 = strlen(v3);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    p_dst = operator new(v7 + 1);
    size_t v59 = v5;
    int64_t v60 = v8 | 0x8000000000000000;
    long long __dst = p_dst;
    goto LABEL_13;
  }
  HIBYTE(v60) = v4;
  p_dst = &__dst;
  if (v4) {
LABEL_13:
  }
    memmove(p_dst, v3, v5);
  *((unsigned char *)p_dst + v5) = 0;
  int v9 = SHIBYTE(v60);
  unint64_t v10 = __dst;
  if (v60 >= 0) {
    uint64_t v11 = (uint64_t *)&__dst;
  }
  else {
    uint64_t v11 = __dst;
  }
  if (v60 >= 0) {
    unint64_t v12 = HIBYTE(v60);
  }
  else {
    unint64_t v12 = v59;
  }
  unint64_t v13 = sub_1BA81EF84(v11, v12);
  unint64_t v14 = *((void *)&xmmword_1E9F76580 + 1);
  if (!*((void *)&xmmword_1E9F76580 + 1)) {
    goto LABEL_74;
  }
  unint64_t v15 = v13;
  uint8x8_t v16 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&xmmword_1E9F76580 + 8));
  v16.i16[0] = vaddlv_u8(v16);
  if (v16.u32[0] > 1uLL)
  {
    unint64_t v17 = v13;
    if (v13 >= *((void *)&xmmword_1E9F76580 + 1)) {
      unint64_t v17 = v13 % *((void *)&xmmword_1E9F76580 + 1);
    }
  }
  else
  {
    unint64_t v17 = (*((void *)&xmmword_1E9F76580 + 1) - 1) & v13;
  }
  size_t v18 = *(uint64_t ***)(xmmword_1E9F76580 + 8 * v17);
  if (!v18 || (float v19 = *v18) == 0)
  {
LABEL_74:
    if (byte_1E9F76620) {
      NSLog(&cfstr_FileconfigUnre_0.isa, v2);
    }
    goto LABEL_76;
  }
  if (v16.u32[0] < 2uLL)
  {
    uint64_t v20 = *((void *)&xmmword_1E9F76580 + 1) - 1;
    while (1)
    {
      uint64_t v25 = v19[1];
      if (v25 == v15)
      {
        uint64_t v26 = *((unsigned __int8 *)v19 + 39);
        if ((v26 & 0x80u) == 0) {
          uint64_t v27 = *((unsigned __int8 *)v19 + 39);
        }
        else {
          uint64_t v27 = v19[3];
        }
        if (v27 == v12)
        {
          if ((v26 & 0x80) != 0)
          {
            if (!memcmp((const void *)v19[2], v11, v19[3])) {
              goto LABEL_62;
            }
          }
          else
          {
            if (!*((unsigned char *)v19 + 39)) {
              goto LABEL_62;
            }
            uint64_t v28 = 0;
            while (*((unsigned __int8 *)v19 + v28 + 16) == *((unsigned __int8 *)v11 + v28))
            {
              if (v26 == ++v28) {
                goto LABEL_61;
              }
            }
          }
        }
      }
      else if ((v25 & v20) != v17)
      {
        goto LABEL_74;
      }
      float v19 = (uint64_t *)*v19;
      if (!v19) {
        goto LABEL_74;
      }
    }
  }
  while (1)
  {
    unint64_t v21 = v19[1];
    if (v21 != v15)
    {
      if (v21 >= v14) {
        v21 %= v14;
      }
      if (v21 != v17) {
        goto LABEL_74;
      }
      goto LABEL_30;
    }
    uint64_t v22 = *((unsigned __int8 *)v19 + 39);
    if ((v22 & 0x80u) == 0) {
      uint64_t v23 = *((unsigned __int8 *)v19 + 39);
    }
    else {
      uint64_t v23 = v19[3];
    }
    if (v23 != v12) {
      goto LABEL_30;
    }
    if ((v22 & 0x80) != 0) {
      break;
    }
    if (!*((unsigned char *)v19 + 39)) {
      goto LABEL_62;
    }
    uint64_t v24 = 0;
    while (*((unsigned __int8 *)v19 + v24 + 16) == *((unsigned __int8 *)v11 + v24))
    {
      if (v22 == ++v24)
      {
LABEL_61:
        if (!v19) {
          goto LABEL_74;
        }
        goto LABEL_62;
      }
    }
LABEL_30:
    float v19 = (uint64_t *)*v19;
    if (!v19) {
      goto LABEL_74;
    }
  }
  if (memcmp((const void *)v19[2], v11, v19[3])) {
    goto LABEL_30;
  }
LABEL_62:
  if (byte_1E9F76620) {
    NSLog(&cfstr_FileconfigUnre_1.isa, v2, (v19[6] - v19[5]) >> 3);
  }
  float v29 = (id *)v19[5];
  float v30 = (id *)v19[6];
  if (v29 != v30)
  {
    while (1)
    {
      id WeakRetained = objc_loadWeakRetained(v29);

      if (!WeakRetained) {
        break;
      }
      if (++v29 == v30)
      {
        float v29 = v30;
        break;
      }
    }
  }
  if (v29 != v30)
  {
    for (uint64_t i = v29 + 1; i != v30; ++i)
    {
      id v33 = objc_loadWeakRetained(i);

      if (v33)
      {
        id v34 = objc_loadWeakRetained(i);
        objc_storeWeak(v29, v34);

        ++v29;
      }
    }
  }
  uint64_t v35 = v19[5];
  float v36 = (id *)v19[6];
  unint64_t v37 = (unint64_t)v29 - v35;
  unint64_t v38 = ((uint64_t)v29 - v35) >> 3;
  unint64_t v39 = ((uint64_t)v36 - v35) >> 3;
  unint64_t v40 = v38 - v39;
  if (v38 <= v39)
  {
    if (v38 < v39)
    {
      uint64_t v54 = (id *)(v35 + 8 * v38);
      while (v36 != v54)
        objc_destroyWeak(--v36);
      v19[6] = (uint64_t)v54;
    }
  }
  else
  {
    uint64_t v41 = v19[7];
    if (v40 <= (v41 - (uint64_t)v36) >> 3)
    {
      float v55 = &v36[v40];
      uint64_t v56 = 8 * v38 - 8 * v39;
      do
      {
        *v36++ = 0;
        v56 -= 8;
      }
      while (v56);
      v19[6] = (uint64_t)v55;
    }
    else
    {
      if ((v37 & 0x8000000000000000) != 0) {
        abort();
      }
      uint64_t v42 = v41 - v35;
      uint64_t v43 = v42 >> 2;
      if (v42 >> 2 <= v38) {
        uint64_t v43 = v38;
      }
      if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v44 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v44 = v43;
      }
      if (v44 >> 61) {
        sub_1BA81F974();
      }
      float v45 = (char *)operator new(8 * v44);
      float v46 = (id *)&v45[8 * v39];
      float v47 = &v45[8 * v38];
      uint64_t v48 = 8 * v38 - 8 * v39;
      float v49 = v46;
      do
      {
        *v49++ = 0;
        v48 -= 8;
      }
      while (v48);
      float v50 = &v45[8 * v44];
      float v52 = (id *)v19[5];
      size_t v51 = (id *)v19[6];
      if (v51 == v52)
      {
        v19[5] = (uint64_t)v46;
        v19[6] = (uint64_t)v47;
        v19[7] = (uint64_t)v50;
      }
      else
      {
        do
          objc_moveWeak(--v46, --v51);
        while (v51 != v52);
        size_t v51 = (id *)v19[5];
        int64_t v53 = (id *)v19[6];
        v19[5] = (uint64_t)v46;
        v19[6] = (uint64_t)v47;
        v19[7] = (uint64_t)v50;
        while (v53 != v51)
          objc_destroyWeak(--v53);
      }
      if (v51) {
        operator delete(v51);
      }
    }
  }
  if (byte_1E9F76620) {
    NSLog(&cfstr_FileconfigUnre_2.isa, v2, (v19[6] - v19[5]) >> 3);
  }
LABEL_76:
  if (v9 < 0) {
    operator delete(v10);
  }
LABEL_78:
}

void sub_1BA84D0A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
  _Unwind_Resume(a1);
}

void sub_1BA84D150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA84D160(id val)
{
  id v2 = objc_initWeak(&location, val);

  if (byte_1E9F76C09) {
    goto LABEL_35;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76578, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76578))
  {
    sub_1BA81ED8C();
    __cxa_atexit((void (*)(void *))sub_1BA81F3B8, &xmmword_1E9F76580, &dword_1BA813000);
    __cxa_guard_release(&qword_1E9F76578);
  }
  id v3 = objc_loadWeakRetained(&location);
  size_t v4 = (objc_class *)objc_opt_class();
  size_t v5 = NSStringFromClass(v4);

  id v6 = v5;
  uint64_t v7 = (const char *)[v6 UTF8String];
  size_t v8 = strlen(v7);
  if (v8 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  int v9 = (void *)v8;
  if (v8 >= 0x17)
  {
    uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v11 = v8 | 7;
    }
    uint64_t v12 = v11 + 1;
    unint64_t v10 = (void **)operator new(v11 + 1);
    __dst[1] = v9;
    unint64_t v37 = v12 | 0x8000000000000000;
    __dst[0] = v10;
    goto LABEL_10;
  }
  HIBYTE(v37) = v8;
  unint64_t v10 = __dst;
  if (v8) {
LABEL_10:
  }
    memmove(v10, v7, (size_t)v9);
  *((unsigned char *)v9 + (void)v10) = 0;
  unint64_t v13 = sub_1BA84D550((uint64_t)__dst, (uint64_t)__dst);
  unint64_t v14 = v13;
  unint64_t v16 = v13[6];
  unint64_t v15 = v13[7];
  if (v16 < v15)
  {
    objc_copyWeak((id *)v13[6], &location);
    unint64_t v17 = (id *)(v16 + 8);
    goto LABEL_29;
  }
  uint64_t v18 = v13[5];
  uint64_t v19 = (uint64_t)(v16 - v18) >> 3;
  if ((unint64_t)(v19 + 1) >> 61) {
    abort();
  }
  uint64_t v20 = v15 - v18;
  uint64_t v21 = v20 >> 2;
  if (v20 >> 2 <= (unint64_t)(v19 + 1)) {
    uint64_t v21 = v19 + 1;
  }
  if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v22 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v22 = v21;
  }
  if (v22)
  {
    if (v22 >> 61) {
      sub_1BA81F974();
    }
    uint64_t v23 = (char *)operator new(8 * v22);
  }
  else
  {
    uint64_t v23 = 0;
  }
  uint64_t v24 = (id *)&v23[8 * v19];
  uint64_t v25 = &v23[8 * v22];
  objc_copyWeak(v24, &location);
  unint64_t v17 = v24 + 1;
  uint64_t v27 = (id *)v14[5];
  uint64_t v26 = (id *)v14[6];
  if (v26 != v27)
  {
    do
      objc_moveWeak(--v24, --v26);
    while (v26 != v27);
    uint64_t v26 = (id *)v14[5];
    uint64_t v28 = (id *)v14[6];
    v14[5] = v24;
    v14[6] = v17;
    v14[7] = v25;
    while (v28 != v26)
      objc_destroyWeak(--v28);
    if (!v26) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  v14[5] = v24;
  v14[6] = v17;
  v14[7] = v25;
  if (v26) {
LABEL_28:
  }
    operator delete(v26);
LABEL_29:
  v14[6] = v17;
  if (byte_1E9F76620)
  {
    id v29 = objc_loadWeakRetained(&location);
    NSLog(&cfstr_FileconfigRegi_0.isa, v29);

    NSLog(&cfstr_FileconfigSing.isa, &xmmword_1E9F76580);
    NSLog(&cfstr_FileconfigSing_1.isa, qword_1E9F76598);
    NSLog(&cfstr_FileconfigClas.isa, v6);
    float v30 = sub_1BA84D550((uint64_t)__dst, (uint64_t)__dst);
    NSLog(&cfstr_FileconfigSing_2.isa, (uint64_t)(v30[6] - v30[5]) >> 3);
    float v31 = sub_1BA84D550((uint64_t)__dst, (uint64_t)__dst);
    float v32 = (id *)v31[5];
    for (uint64_t i = (id *)v31[6]; v32 != i; ++v32)
    {
      id WeakRetained = objc_loadWeakRetained(v32);
      NSLog(&cfstr_FileconfigCont.isa, WeakRetained);
    }
  }
  uint64_t v35 = (void *)qword_1E9F765F8;
  qword_1E9F765F8 = 0;

  if (SHIBYTE(v37) < 0) {
    operator delete(__dst[0]);
  }

LABEL_35:
  objc_destroyWeak(&location);
}

void sub_1BA84D4E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, id location)
{
}

void *sub_1BA84D550(uint64_t a1, uint64_t a2)
{
  int v4 = *(char *)(a1 + 23);
  if (v4 >= 0) {
    size_t v5 = (uint64_t *)a1;
  }
  else {
    size_t v5 = *(uint64_t **)a1;
  }
  if (v4 >= 0) {
    unint64_t v6 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    unint64_t v6 = *(void *)(a1 + 8);
  }
  unint64_t v7 = sub_1BA81EF84(v5, v6);
  unint64_t v8 = v7;
  unint64_t v9 = *((void *)&xmmword_1E9F76580 + 1);
  if (*((void *)&xmmword_1E9F76580 + 1))
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&xmmword_1E9F76580 + 8));
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v2 = v7;
      if (v7 >= *((void *)&xmmword_1E9F76580 + 1)) {
        unint64_t v2 = v7 % *((void *)&xmmword_1E9F76580 + 1);
      }
    }
    else
    {
      unint64_t v2 = (*((void *)&xmmword_1E9F76580 + 1) - 1) & v7;
    }
    uint64_t v11 = *(void **)(xmmword_1E9F76580 + 8 * v2);
    if (v11)
    {
      uint64_t v12 = (void *)*v11;
      if (*v11)
      {
        if (v10.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v17 = v12[1];
            if (v17 == v8)
            {
              uint64_t v18 = *((unsigned __int8 *)v12 + 39);
              if ((v18 & 0x80u) == 0) {
                uint64_t v19 = *((unsigned __int8 *)v12 + 39);
              }
              else {
                uint64_t v19 = v12[3];
              }
              if (v19 == v6)
              {
                if ((v18 & 0x80) != 0)
                {
                  if (!memcmp((const void *)v12[2], v5, v12[3])) {
                    return v12;
                  }
                }
                else
                {
                  if (!*((unsigned char *)v12 + 39)) {
                    return v12;
                  }
                  uint64_t v20 = 0;
                  while (*((unsigned __int8 *)v12 + v20 + 16) == *((unsigned __int8 *)v5 + v20))
                  {
                    if (v18 == ++v20) {
                      return v12;
                    }
                  }
                }
              }
            }
            else if ((v17 & (v9 - 1)) != v2)
            {
              goto LABEL_49;
            }
            uint64_t v12 = (void *)*v12;
            if (!v12) {
              goto LABEL_49;
            }
          }
        }
        do
        {
          unint64_t v13 = v12[1];
          if (v13 == v8)
          {
            uint64_t v14 = *((unsigned __int8 *)v12 + 39);
            if ((v14 & 0x80u) == 0) {
              uint64_t v15 = *((unsigned __int8 *)v12 + 39);
            }
            else {
              uint64_t v15 = v12[3];
            }
            if (v15 == v6)
            {
              if ((v14 & 0x80) != 0)
              {
                if (!memcmp((const void *)v12[2], v5, v12[3])) {
                  return v12;
                }
              }
              else
              {
                if (!*((unsigned char *)v12 + 39)) {
                  return v12;
                }
                uint64_t v16 = 0;
                while (*((unsigned __int8 *)v12 + v16 + 16) == *((unsigned __int8 *)v5 + v16))
                {
                  if (v14 == ++v16) {
                    return v12;
                  }
                }
              }
            }
          }
          else
          {
            if (v13 >= v9) {
              v13 %= v9;
            }
            if (v13 != v2) {
              break;
            }
          }
          uint64_t v12 = (void *)*v12;
        }
        while (v12);
      }
    }
  }
LABEL_49:
  uint64_t v21 = operator new(0x40uLL);
  void *v21 = 0;
  v21[1] = v8;
  unint64_t v22 = v21 + 2;
  if (*(char *)(a2 + 23) < 0)
  {
    sub_1BA81F984(v22, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)unint64_t v22 = *(_OWORD *)a2;
    v21[4] = *(void *)(a2 + 16);
  }
  v21[5] = 0;
  v21[6] = 0;
  v21[7] = 0;
  float v23 = (float)(unint64_t)(qword_1E9F76598 + 1);
  if (!v9 || (float)(*(float *)&dword_1E9F765A0 * (float)v9) < v23)
  {
    BOOL v24 = 1;
    if (v9 >= 3) {
      BOOL v24 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v25 = v24 | (2 * v9);
    unint64_t v26 = vcvtps_u32_f32(v23 / *(float *)&dword_1E9F765A0);
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
    size_t v28 = *((void *)&xmmword_1E9F76580 + 1);
    if (prime > *((void *)&xmmword_1E9F76580 + 1)) {
      goto LABEL_64;
    }
    if (prime < *((void *)&xmmword_1E9F76580 + 1))
    {
      unint64_t v29 = vcvtps_u32_f32((float)(unint64_t)qword_1E9F76598 / *(float *)&dword_1E9F765A0);
      if (*((void *)&xmmword_1E9F76580 + 1) < 3uLL
        || (uint8x8_t v30 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&xmmword_1E9F76580 + 8)),
            v30.i16[0] = vaddlv_u8(v30),
            v30.u32[0] > 1uLL))
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
      if (prime < v28) {
LABEL_64:
      }
        sub_1BA81F724(prime);
    }
    unint64_t v9 = *((void *)&xmmword_1E9F76580 + 1);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= *((void *)&xmmword_1E9F76580 + 1)) {
        unint64_t v2 = v8 % *((void *)&xmmword_1E9F76580 + 1);
      }
      else {
        unint64_t v2 = v8;
      }
    }
    else
    {
      unint64_t v2 = (*((void *)&xmmword_1E9F76580 + 1) - 1) & v8;
    }
  }
  float v32 = *(void **)(xmmword_1E9F76580 + 8 * v2);
  if (v32)
  {
    void *v21 = *v32;
    *float v32 = v21;
  }
  else
  {
    void *v21 = qword_1E9F76590;
    qword_1E9F76590 = (uint64_t)v21;
    *(void *)(xmmword_1E9F76580 + 8 * v2) = &qword_1E9F76590;
    if (*v21)
    {
      unint64_t v33 = *(void *)(*v21 + 8);
      if ((v9 & (v9 - 1)) != 0)
      {
        if (v33 >= v9) {
          v33 %= v9;
        }
      }
      else
      {
        v33 &= v9 - 1;
      }
      *(void *)(xmmword_1E9F76580 + 8 * v33) = v21;
    }
  }
  uint64_t v12 = v21;
  ++qword_1E9F76598;
  return v12;
}

void sub_1BA84D960(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1BA81F8E4((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1BA84D9DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint8x8_t v10 = v9;

  a9.super_class = (Class)ImageSaverAndFileConfigRegistrator;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA84DA7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1BA84DA8C(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1E9F76750 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1BA84DB1C()
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v9[0] = 0;
  uint64_t v12 = 0;
  unint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v0 = qword_1E9F76750;
  uint64_t v15 = qword_1E9F76750;
  if (!qword_1E9F76750)
  {
    v9[1] = (void *)MEMORY[0x1E4F143A8];
    v9[2] = (void *)3221225472;
    v9[3] = sub_1BA84DA8C;
    v9[4] = &unk_1E6228698;
    uint8x8_t v10 = &v12;
    uint64_t v11 = v9;
    long long v16 = xmmword_1E6228670;
    long long v17 = *(_OWORD *)&off_1E6228680;
    v13[3] = _sl_dlopen();
    qword_1E9F76750 = *(void *)(v10[1] + 24);
    uint64_t v0 = v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v0)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *PortraitLibrary(void)"];
    size_t v5 = (void *)v3;
    unint64_t v6 = (void *)v3;
    unint64_t v7 = (void *)v4;
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v4, @"PortraitSoftLinking.m", 11, @"%s", v9[0]);
    unint64_t v8 = v7;
    uint64_t v0 = (uint64_t)v6;

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v1 = v9[0];
  if (v9[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_1BA84DCBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA84DCD8(uint64_t a1)
{
  sub_1BA84DB1C();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PTTexture");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1E9F768E0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    unint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getPTTextureClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PortraitSoftLinking.m", 15, @"Unable to find class %s", "PTTexture");

    __break(1u);
  }
}

id sub_1BA84DDA0()
{
  uint64_t v4 = 0;
  size_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_1E9F768C8;
  uint64_t v7 = qword_1E9F768C8;
  if (!qword_1E9F768C8)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = sub_1BA84DE84;
    v3[3] = &unk_1E62286C0;
    v3[4] = &v4;
    sub_1BA84DE84((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1BA84DE6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA84DE84(uint64_t a1)
{
  sub_1BA84DB1C();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PTRenderPipeline");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1E9F768C8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    unint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getPTRenderPipelineClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PortraitSoftLinking.m", 16, @"Unable to find class %s", "PTRenderPipeline");

    __break(1u);
  }
}

void sub_1BA84DF4C(uint64_t a1)
{
  sub_1BA84DB1C();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PTRenderRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1E9F768D8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    unint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getPTRenderRequestClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PortraitSoftLinking.m", 17, @"Unable to find class %s", "PTRenderRequest");

    __break(1u);
  }
}

void sub_1BA84E014(uint64_t a1)
{
  sub_1BA84DB1C();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PTRenderPipelineDescriptor");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1E9F768D0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    unint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getPTRenderPipelineDescriptorClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PortraitSoftLinking.m", 18, @"Unable to find class %s", "PTRenderPipelineDescriptor");

    __break(1u);
  }
}

void sub_1BA84E0DC(uint64_t a1)
{
  sub_1BA84DB1C();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PTTuningParameters");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1E9F768E8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    unint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getPTTuningParametersClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PortraitSoftLinking.m", 19, @"Unable to find class %s", "PTTuningParameters");

    __break(1u);
  }
}

void *sub_1BA84E1A4(uint64_t a1)
{
  unint64_t v2 = (void *)sub_1BA84DB1C();
  uint64_t result = dlsym(v2, "PTDisparityInNormalizedRectFromPixelBuffer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1E9F76BC8 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1BA84E1F4(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint8x8_t v10 = (void (*)(uint64_t, uint64_t, __n128, __n128, __n128, __n128))off_1E9F76BC8;
  unint64_t v22 = off_1E9F76BC8;
  if (!off_1E9F76BC8)
  {
    uint64_t v11 = (void *)sub_1BA84DB1C();
    void v20[3] = (uint64_t)dlsym(v11, "PTDisparityInNormalizedRectFromPixelBuffer");
    off_1E9F76BC8 = (_UNKNOWN *)v20[3];
    uint8x8_t v10 = (void (*)(uint64_t, uint64_t, __n128, __n128, __n128, __n128))v20[3];
  }
  uint64_t v18 = v10;
  _Block_object_dispose(&v19, 8);
  if (v18)
  {
    v12.n128_f64[0] = a2;
    v13.n128_f64[0] = a3;
    v14.n128_f64[0] = a4;
    v15.n128_f64[0] = a5;
    v18(100, a1, v12, v13, v14, v15);
  }
  else
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v17 = objc_msgSend(NSString, "stringWithUTF8String:", "float soft_PTDisparityInNormalizedRectFromPixelBuffer(PTCinematographyDetectionType, CGRect, CVPixelBufferRef)");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"PortraitSoftLinking.m", 20, @"%s", dlerror());

    __break(1u);
  }
}

void sub_1BA84E384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_1BA84E39C(uint64_t a1)
{
  unint64_t v2 = (void *)sub_1BA84DB1C();
  uint64_t result = dlsym(v2, "PTDisparityInNormalizedRectFromPixelBufferWithPrior");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1E9F76748 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1BA84E3EC(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t v21 = 0;
  unint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  __n128 v12 = (void (*)(uint64_t, uint64_t, uint64_t, __n128, __n128, __n128, __n128))off_1E9F76748;
  BOOL v24 = off_1E9F76748;
  if (!off_1E9F76748)
  {
    __n128 v13 = (void *)sub_1BA84DB1C();
    v22[3] = (uint64_t)dlsym(v13, "PTDisparityInNormalizedRectFromPixelBufferWithPrior");
    off_1E9F76748 = (_UNKNOWN *)v22[3];
    __n128 v12 = (void (*)(uint64_t, uint64_t, uint64_t, __n128, __n128, __n128, __n128))v22[3];
  }
  uint64_t v20 = v12;
  _Block_object_dispose(&v21, 8);
  if (v20)
  {
    v14.n128_f64[0] = a3;
    v15.n128_f64[0] = a4;
    v16.n128_f64[0] = a5;
    v17.n128_f64[0] = a6;
    v20(100, a1, a2, v14, v15, v16, v17);
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v19 = objc_msgSend(NSString, "stringWithUTF8String:", "float soft_PTDisparityInNormalizedRectFromPixelBufferWithPrior(PTCinematographyDetectionType, CGRect, CVPixelBufferRef, const float *)");
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"PortraitSoftLinking.m", 21, @"%s", dlerror());

    __break(1u);
  }
}

void sub_1BA84E58C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1BA84E5A4(uint64_t a1, CVPixelBufferRef pixelBuffer, int a3, __CVBuffer *a4, float a5, float a6)
{
  CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  CVPixelBufferLockBaseAddress(a4, 0);
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)a1, 0);
  BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  __n128 v15 = (float *)CVPixelBufferGetBaseAddress(a4);
  CVPixelBufferGetHeight(a4);
  CVPixelBufferGetWidth(a4);
  size_t v16 = CVPixelBufferGetBytesPerRow(a4);
  __n128 v17 = (float *)CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)a1);
  CVPixelBufferGetHeight(*(CVPixelBufferRef *)a1);
  CVPixelBufferGetWidth(*(CVPixelBufferRef *)a1);
  size_t v18 = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)a1);
  if (Height && Width)
  {
    uint64_t v19 = 0;
    do
    {
      uint64_t v20 = BaseAddress;
      uint64_t v21 = v17;
      unint64_t v22 = v15;
      size_t v23 = Width;
      do
      {
        unsigned int v25 = *v20++;
        float v26 = (float)v25;
        if ((float)a3 <= (float)v25)
        {
          float *v21 = 2048.0;
          float v24 = 2048.0;
        }
        else
        {
          float v24 = (float)(v26 / a5) + a6;
          float *v21 = v24;
          if (v24 < 2048.0) {
            float v24 = fmaxf(*(float *)(a1 + 48) + (float)(v24 / (float)(*(float *)(a1 + 44) * *(float *)(a1 + 40))), 0.0);
          }
        }
        *v22++ = v24;
        ++v21;
        --v23;
      }
      while (v23);
      ++v19;
      __n128 v15 = (float *)((char *)v15 + v16);
      __n128 v17 = (float *)((char *)v17 + v18);
      BaseAddress = (unsigned __int16 *)((char *)BaseAddress + BytesPerRow);
    }
    while (v19 != Height);
  }
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)a1, 0);
  CVPixelBufferUnlockBaseAddress(a4, 0);
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  uint64_t result = sub_1BA84EA64(*(__CVBuffer **)a1, *(__CVBuffer **)(a1 + 8), *(float *)(a1 + 52), *(float *)(a1 + 56), *(float *)(a1 + 60), *(float *)(a1 + 64));
  if (*(float *)(a1 + 52) > 0.0 || *(float *)(a1 + 56) > 0.0 || *(float *)(a1 + 60) > 0.0 || *(float *)(a1 + 64) > 0.0)
  {
    size_t v28 = *(__CVBuffer **)(a1 + 8);
    CVPixelBufferLockBaseAddress(v28, 0);
    CVPixelBufferLockBaseAddress(a4, 0);
    unint64_t v29 = (char *)CVPixelBufferGetBaseAddress(v28);
    size_t v30 = CVPixelBufferGetHeight(v28);
    size_t v31 = CVPixelBufferGetWidth(v28);
    size_t v32 = CVPixelBufferGetBytesPerRow(v28);
    unint64_t v33 = (char *)CVPixelBufferGetBaseAddress(a4);
    CVPixelBufferGetHeight(a4);
    CVPixelBufferGetWidth(a4);
    size_t v34 = CVPixelBufferGetBytesPerRow(a4);
    if (!v30 || !v31)
    {
LABEL_59:
      CVPixelBufferUnlockBaseAddress(a4, 0);
      return CVPixelBufferUnlockBaseAddress(v28, 0);
    }
    if (v31 < 4)
    {
      uint64_t v35 = v33 + 8;
      float v36 = (float *)(v29 + 8);
      do
      {
        float v37 = *(v36 - 2);
        if (v37 >= 100000.0) {
          float v37 = 0.0;
        }
        *(v36 - 2) = v37;
        if (v37 > 0.0) {
          *(v35 - 2) = 1157627904;
        }
        if (v31 != 1)
        {
          float v38 = *(v36 - 1);
          if (v38 >= 100000.0) {
            float v38 = 0.0;
          }
          *(v36 - 1) = v38;
          if (v38 > 0.0) {
            *(v35 - 1) = 1157627904;
          }
          if (v31 != 2)
          {
            float v39 = *v36;
            if (*v36 >= 100000.0) {
              float v39 = 0.0;
            }
            *float v36 = v39;
            if (v39 > 0.0) {
              *uint64_t v35 = 1157627904;
            }
          }
        }
        uint64_t v35 = (_DWORD *)((char *)v35 + v34);
        float v36 = (float *)((char *)v36 + v32);
        --v30;
      }
      while (v30);
      goto LABEL_59;
    }
    uint64_t v40 = 0;
    uint64_t v41 = 4 * v31;
    uint64_t v42 = v33 + 8;
    float32x4_t v43 = (float32x4_t)vdupq_n_s32(0x47C35000u);
    unint64_t v44 = v33;
    float v45 = (int8x16_t *)v29;
    while (&v29[v40 * v32] < &v33[v41 + v40 * v34] && &v33[v40 * v34] < &v29[v41 + v40 * v32])
    {
      for (unint64_t i = 0; i != v31; ++i)
      {
LABEL_55:
        float v53 = *(float *)&v45->i32[i];
        if (v53 >= 100000.0) {
          float v53 = 0.0;
        }
        *(float *)&v45->i32[i] = v53;
        if (v53 > 0.0) {
          *(_DWORD *)&v44[4 * i] = 1157627904;
        }
      }
LABEL_35:
      ++v40;
      float v45 = (int8x16_t *)((char *)v45 + v32);
      uint64_t v42 = (_DWORD *)((char *)v42 + v34);
      v44 += v34;
      if (v40 == v30) {
        goto LABEL_59;
      }
    }
    float v47 = v42;
    unint64_t v48 = v31 & 0xFFFFFFFFFFFFFFFCLL;
    float v49 = v45;
    while (1)
    {
      float32x4_t v50 = (float32x4_t)vbicq_s8(*v49, (int8x16_t)vcgeq_f32(*(float32x4_t *)v49, v43));
      *float v49 = (int8x16_t)v50;
      int16x4_t v51 = vmovn_s32(vcgtzq_f32(v50));
      if (v51.i8[0])
      {
        *(v47 - 2) = 1157627904;
        if ((v51.i8[2] & 1) == 0)
        {
LABEL_45:
          if ((v51.i8[4] & 1) == 0) {
            goto LABEL_46;
          }
          goto LABEL_50;
        }
      }
      else if ((v51.i8[2] & 1) == 0)
      {
        goto LABEL_45;
      }
      *(v47 - 1) = 1157627904;
      if ((v51.i8[4] & 1) == 0)
      {
LABEL_46:
        if (v51.i8[6]) {
          goto LABEL_51;
        }
        goto LABEL_42;
      }
LABEL_50:
      _DWORD *v47 = 1157627904;
      if (v51.i8[6]) {
LABEL_51:
      }
        v47[1] = 1157627904;
LABEL_42:
      ++v49;
      v47 += 4;
      v48 -= 4;
      if (!v48)
      {
        unint64_t i = v31 & 0xFFFFFFFFFFFFFFFCLL;
        if (v31 == (v31 & 0xFFFFFFFFFFFFFFFCLL)) {
          goto LABEL_35;
        }
        goto LABEL_55;
      }
    }
  }
  return result;
}

uint64_t sub_1BA84EA64(__CVBuffer *a1, __CVBuffer *a2, float a3, float a4, float a5, float a6)
{
  CVPixelBufferLockBaseAddress(a1, 1uLL);
  CVPixelBufferLockBaseAddress(a2, 0);
  BaseAddress = (float *)CVPixelBufferGetBaseAddress(a2);
  CVPixelBufferGetHeight(a2);
  CVPixelBufferGetWidth(a2);
  pixelBuffer = a2;
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a2);
  int64_t v58 = (float *)CVPixelBufferGetBaseAddress(a1);
  size_t Height = CVPixelBufferGetHeight(a1);
  size_t Width = CVPixelBufferGetWidth(a1);
  id v57 = a1;
  size_t v15 = CVPixelBufferGetBytesPerRow(a1);
  uint64_t __sz = 4 * Width;
  if (Height)
  {
    uint64_t v16 = 0;
    BOOL v18 = a4 <= 0.0 || Width == 0;
    BOOL v19 = a3 <= 0.0 || (int)Width < 1;
    char v20 = v19;
    uint64_t v21 = v58;
    unint64_t v22 = BaseAddress;
    while (1)
    {
      if (!Width) {
        goto LABEL_15;
      }
      bzero((char *)BaseAddress + BytesPerRow * v16, __sz);
      if (!v18) {
        break;
      }
LABEL_18:
      if ((v20 & 1) == 0)
      {
        size_t v23 = (char *)v58 + v16 * v15;
        float v24 = 100000.0;
        for (uint64_t i = Width + 1; i > 1; --i)
        {
          uint64_t v27 = (i - 2);
          float v24 = v24 + a3;
          float v28 = *(float *)&v23[4 * v27];
          if (v28 >= 2048.0)
          {
            float v26 = 100000.0;
          }
          else
          {
            if (v24 >= v28)
            {
              float v24 = *(float *)&v23[4 * v27];
              continue;
            }
            float v26 = v28 - v24;
          }
          *(float *)((char *)&BaseAddress[v27] + BytesPerRow * v16) = v26;
        }
      }
LABEL_15:
      ++v16;
      unint64_t v22 = (float *)((char *)v22 + BytesPerRow);
      uint64_t v21 = (float *)((char *)v21 + v15);
      if (v16 == Height) {
        goto LABEL_35;
      }
    }
    float v29 = 100000.0;
    size_t v30 = v21;
    size_t v31 = v22;
    size_t v32 = Width;
    while (1)
    {
      float v29 = v29 + a4;
      float v34 = *v30;
      if (*v30 >= 2048.0)
      {
        float v33 = 100000.0;
      }
      else
      {
        if (v29 >= v34)
        {
          float v29 = *v30;
          goto LABEL_30;
        }
        float v33 = v34 - v29;
      }
      float *v31 = v33;
LABEL_30:
      ++v31;
      ++v30;
      if (!--v32) {
        goto LABEL_18;
      }
    }
  }
LABEL_35:
  if (a5 > 0.0 && Width)
  {
    if (Width >> 62) {
      goto LABEL_66;
    }
    uint64_t v35 = operator new(__sz);
    memset_pattern16(v35, &unk_1BA86C260, __sz);
    if (Height)
    {
      uint64_t v36 = 0;
      float v37 = v58;
      float v38 = BaseAddress;
      do
      {
        float v39 = (float *)v35;
        uint64_t v40 = v37;
        uint64_t v41 = v38;
        size_t v42 = Width;
        do
        {
          float v43 = *v39 + a5;
          *float v39 = v43;
          float v44 = *v40;
          if (*v40 >= 2048.0)
          {
            float *v41 = 100000.0;
          }
          else if (v43 >= v44)
          {
            *float v39 = v44;
            float *v41 = 0.0;
          }
          else
          {
            float *v41 = v44 - v43;
          }
          ++v41;
          ++v40;
          ++v39;
          --v42;
        }
        while (v42);
        ++v36;
        float v38 = (float *)((char *)v38 + BytesPerRow);
        float v37 = (float *)((char *)v37 + v15);
      }
      while (v36 != Height);
    }
    operator delete(v35);
  }
  if (a6 <= 0.0 || !Width) {
    goto LABEL_63;
  }
  if (Width >> 62) {
LABEL_66:
  }
    abort();
  float v45 = operator new(__sz);
  memset_pattern16(v45, &unk_1BA86C260, __sz);
  if ((int)Height >= 1)
  {
    uint64_t v46 = (Height - 1);
    float v47 = (float *)((char *)BaseAddress + BytesPerRow * v46);
    unint64_t v48 = (float *)((char *)v58 + v15 * v46);
    do
    {
      float v49 = (float *)v45;
      float32x4_t v50 = v48;
      int16x4_t v51 = v47;
      size_t v52 = Width;
      do
      {
        float v53 = *v49 + a5;
        *float v49 = v53;
        float v54 = *v50;
        if (*v50 >= 2048.0)
        {
          *int16x4_t v51 = 100000.0;
        }
        else if (v53 >= v54)
        {
          *float v49 = v54;
          *int16x4_t v51 = 0.0;
        }
        else
        {
          *int16x4_t v51 = v54 - v53;
        }
        ++v51;
        ++v50;
        ++v49;
        --v52;
      }
      while (v52);
      float v47 = (float *)((char *)v47 - BytesPerRow);
      unint64_t v48 = (float *)((char *)v48 - v15);
      BOOL v19 = v46-- <= 0;
    }
    while (!v19);
  }
  operator delete(v45);
LABEL_63:
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);

  return CVPixelBufferUnlockBaseAddress(v57, 1uLL);
}

uint64_t sub_1BA84EE70(uint64_t a1, CVPixelBufferRef pixelBuffer, int a3, __CVBuffer *a4, float a5, float a6)
{
  CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  CVPixelBufferLockBaseAddress(a4, 0);
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)a1, 0);
  BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  size_t v15 = (short float *)CVPixelBufferGetBaseAddress(a4);
  CVPixelBufferGetHeight(a4);
  CVPixelBufferGetWidth(a4);
  size_t v16 = CVPixelBufferGetBytesPerRow(a4);
  __n128 v17 = (float *)CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)a1);
  CVPixelBufferGetHeight(*(CVPixelBufferRef *)a1);
  CVPixelBufferGetWidth(*(CVPixelBufferRef *)a1);
  size_t v18 = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)a1);
  if (Height && Width)
  {
    uint64_t v19 = 0;
    do
    {
      char v20 = BaseAddress;
      uint64_t v21 = v17;
      unint64_t v22 = v15;
      size_t v23 = Width;
      do
      {
        unsigned int v29 = *v20++;
        float v30 = (float)v29;
        if ((float)a3 <= (float)v29)
        {
          float *v21 = 2048.0;
          _S3 = 2048.0;
LABEL_7:
          __asm { FCVT            H3, S3 }
          goto LABEL_8;
        }
        _S3 = (float)(v30 / a5) + a6;
        float *v21 = _S3;
        if (_S3 >= 2048.0) {
          goto LABEL_7;
        }
        _S3 = *(float *)(a1 + 48) + (float)(_S3 / (float)(*(float *)(a1 + 44) * *(float *)(a1 + 40)));
        __asm { FCVT            H3, S3 }
        _H3 = fmaxl(*(short float *)&_S3, COERCE_SHORT_FLOAT(0));
LABEL_8:
        *v22++ = _H3;
        ++v21;
        --v23;
      }
      while (v23);
      ++v19;
      size_t v15 = (short float *)((char *)v15 + v16);
      __n128 v17 = (float *)((char *)v17 + v18);
      BaseAddress = (unsigned __int16 *)((char *)BaseAddress + BytesPerRow);
    }
    while (v19 != Height);
  }
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)a1, 0);
  CVPixelBufferUnlockBaseAddress(a4, 0);
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  uint64_t result = sub_1BA84EA64(*(__CVBuffer **)a1, *(__CVBuffer **)(a1 + 8), *(float *)(a1 + 52), *(float *)(a1 + 56), *(float *)(a1 + 60), *(float *)(a1 + 64));
  if (*(float *)(a1 + 52) > 0.0 || *(float *)(a1 + 56) > 0.0 || *(float *)(a1 + 60) > 0.0 || *(float *)(a1 + 64) > 0.0)
  {
    float v33 = *(__CVBuffer **)(a1 + 8);
    CVPixelBufferLockBaseAddress(v33, 0);
    CVPixelBufferLockBaseAddress(a4, 0);
    float v34 = (char *)CVPixelBufferGetBaseAddress(v33);
    size_t v35 = CVPixelBufferGetHeight(v33);
    size_t v36 = CVPixelBufferGetWidth(v33);
    size_t v37 = CVPixelBufferGetBytesPerRow(v33);
    float v38 = (char *)CVPixelBufferGetBaseAddress(a4);
    CVPixelBufferGetHeight(a4);
    CVPixelBufferGetWidth(a4);
    size_t v39 = CVPixelBufferGetBytesPerRow(a4);
    if (!v35 || !v36)
    {
LABEL_60:
      CVPixelBufferUnlockBaseAddress(a4, 0);
      return CVPixelBufferUnlockBaseAddress(v33, 0);
    }
    if (v36 < 4)
    {
      uint64_t v40 = v38 + 4;
      uint64_t v41 = (float *)(v34 + 8);
      do
      {
        float v42 = *(v41 - 2);
        if (v42 >= 100000.0) {
          float v42 = 0.0;
        }
        *(v41 - 2) = v42;
        if (v42 > 0.0) {
          *(v40 - 2) = 26624;
        }
        if (v36 != 1)
        {
          float v43 = *(v41 - 1);
          if (v43 >= 100000.0) {
            float v43 = 0.0;
          }
          *(v41 - 1) = v43;
          if (v43 > 0.0) {
            *(v40 - 1) = 26624;
          }
          if (v36 != 2)
          {
            float v44 = *v41;
            if (*v41 >= 100000.0) {
              float v44 = 0.0;
            }
            float *v41 = v44;
            if (v44 > 0.0) {
              _WORD *v40 = 26624;
            }
          }
        }
        uint64_t v40 = (_WORD *)((char *)v40 + v39);
        uint64_t v41 = (float *)((char *)v41 + v37);
        --v35;
      }
      while (v35);
      goto LABEL_60;
    }
    uint64_t v45 = 0;
    uint64_t v46 = v38 + 4;
    float32x4_t v47 = (float32x4_t)vdupq_n_s32(0x47C35000u);
    unint64_t v48 = v38;
    float v49 = (int8x16_t *)v34;
    while (&v34[v45 * v37] < &v38[2 * v36 + v45 * v39] && &v38[v45 * v39] < &v34[4 * v36 + v45 * v37])
    {
      for (unint64_t i = 0; i != v36; ++i)
      {
LABEL_56:
        float v57 = *(float *)&v49->i32[i];
        if (v57 >= 100000.0) {
          float v57 = 0.0;
        }
        *(float *)&v49->i32[i] = v57;
        if (v57 > 0.0) {
          *(_WORD *)&v48[2 * i] = 26624;
        }
      }
LABEL_36:
      ++v45;
      float v49 = (int8x16_t *)((char *)v49 + v37);
      uint64_t v46 = (_WORD *)((char *)v46 + v39);
      v48 += v39;
      if (v45 == v35) {
        goto LABEL_60;
      }
    }
    int16x4_t v51 = v46;
    unint64_t v52 = v36 & 0xFFFFFFFFFFFFFFFCLL;
    float v53 = v49;
    while (1)
    {
      float32x4_t v54 = (float32x4_t)vbicq_s8(*v53, (int8x16_t)vcgeq_f32(*(float32x4_t *)v53, v47));
      *float v53 = (int8x16_t)v54;
      int16x4_t v55 = vmovn_s32(vcgtzq_f32(v54));
      if (v55.i8[0])
      {
        *(v51 - 2) = 26624;
        if ((v55.i8[2] & 1) == 0) {
          goto LABEL_46;
        }
      }
      else if ((v55.i8[2] & 1) == 0)
      {
LABEL_46:
        if (v55.i8[4]) {
          goto LABEL_47;
        }
        goto LABEL_51;
      }
      *(v51 - 1) = 26624;
      if (v55.i8[4])
      {
LABEL_47:
        *int16x4_t v51 = 26624;
        if (v55.i8[6]) {
          goto LABEL_52;
        }
        goto LABEL_43;
      }
LABEL_51:
      if (v55.i8[6]) {
LABEL_52:
      }
        v51[1] = 26624;
LABEL_43:
      ++v53;
      v51 += 4;
      v52 -= 4;
      if (!v52)
      {
        unint64_t i = v36 & 0xFFFFFFFFFFFFFFFCLL;
        if (v36 == (v36 & 0xFFFFFFFFFFFFFFFCLL)) {
          goto LABEL_36;
        }
        goto LABEL_56;
      }
    }
  }
  return result;
}

void sub_1BA84F398()
{
  v4[47] = *MEMORY[0x1E4F143B8];
  v3[0] = @"colorWidth";
  v3[1] = @"colorHeight";
  v4[0] = &unk_1F14402D0;
  v4[1] = &unk_1F14402D0;
  v3[2] = @"shiftWidth";
  v3[3] = @"shiftHeight";
  _DWORD v4[2] = &unk_1F14402D0;
  v4[3] = &unk_1F14402D0;
  v3[4] = @"alphaWidth";
  void v3[5] = @"alphaHeight";
  v4[4] = &unk_1F14402D0;
  v4[5] = &unk_1F14402D0;
  v3[6] = @"kernelSize";
  v3[7] = @"guidedFilterUnconfidentWeight";
  v4[6] = &unk_1F14402E8;
  v4[7] = &unk_1F1440A68;
  v3[8] = @"guidedFilterMinDistToDeweight";
  v3[9] = @"referenceShift";
  v4[8] = &unk_1F1440300;
  v4[9] = &unk_1F1440318;
  v3[10] = @"alphaMaxLaplacian";
  v3[11] = @"alphaContrastExponent";
  v4[10] = &unk_1F1440A78;
  v4[11] = &unk_1F1440330;
  v3[12] = @"shiftFilterColorStd";
  v3[13] = @"shiftFilterUpdateRate";
  v4[12] = &unk_1F1440348;
  v4[13] = &unk_1F1440A88;
  v3[14] = @"maxShiftFillingInconsistency";
  v3[15] = @"maxShiftFillingDistFromFg";
  v4[14] = &unk_1F1440360;
  v4[15] = &unk_1F1440300;
  v3[16] = @"maxDistToPushShiftEdgesFwd";
  v3[17] = @"maxDistToPushShiftEdgesRev";
  v4[16] = &unk_1F1440378;
  v4[17] = &unk_1F1440378;
  v3[18] = @"shiftPushingBgToFgShiftDifference";
  v3[19] = @"kCVAVideoMattingProperty_focusMachineVariationThreshold";
  v4[18] = &unk_1F1440390;
  v4[19] = &unk_1F14403A8;
  v3[20] = @"kCVAVideoMattingProperty_focusMachineMinFastFrames";
  v3[21] = @"kCVAVideoMattingDebug_focusMachineState";
  v4[20] = &unk_1F14403A8;
  v4[21] = MEMORY[0x1E4F1CC38];
  v3[22] = @"kCVAVideoMattingProperty_focusThresholdHardness";
  v3[23] = @"width";
  v4[22] = &unk_1F1440A98;
  v4[23] = &unk_1F14402D0;
  v3[24] = @"height";
  v3[25] = @"kCVAFusionProperty_outputRotation";
  v4[24] = &unk_1F14402D0;
  v4[25] = &unk_1F1440378;
  v3[26] = @"bgShiftUpdateRate";
  v3[27] = @"kCVAFusionProperty_bgShiftStatsWindowSize";
  v4[26] = &unk_1F1440AA8;
  v4[27] = &unk_1F14403A8;
  v3[28] = @"kCVAFusionProperty_invalidShiftRatioStatsWindowSize";
  v3[29] = @"cntDeltaShift";
  v4[28] = &unk_1F14403A8;
  v4[29] = &unk_1F14403C0;
  v3[30] = @"minDeltaShift";
  v3[31] = @"maxDeltaShift";
  v4[30] = &unk_1F1440348;
  v4[31] = &unk_1F14403D8;
  v3[32] = @"dsLowThld";
  v3[33] = @"dsLowScale";
  v4[32] = &unk_1F14403F0;
  v4[33] = &unk_1F1440AB8;
  v3[34] = @"dsHighThld";
  v3[35] = @"dsHighScale";
  v4[34] = &unk_1F1440408;
  v4[35] = &unk_1F1440AC8;
  v3[36] = @"kCVAFusionProperty_foregroundPercentile";
  v3[37] = @"kCVAFusionProperty_closeDisparityPercentile";
  v4[36] = &unk_1F1440A88;
  v4[37] = &unk_1F1440AD8;
  v3[38] = @"kCVAFusionProperty_deltaDepth";
  v3[39] = @"kCVAFusionProperty_backgroundSeparationLikelihoodTemporalUpdateRate";
  v4[38] = &unk_1F1440A88;
  v4[39] = &unk_1F1440AA8;
  v3[40] = @"kCVAFusionProperty_backgroundSeparationLikelihoodUpdateRate";
  v3[41] = @"kCVAFusionProperty_backgroundSeparationLikelihoodUpdateThreshold";
  v4[40] = &unk_1F1440AC8;
  v4[41] = &unk_1F1440AA8;
  v3[42] = @"kCVAFusionProperty_invalidShiftRatioUpdateRate";
  v3[43] = @"nearSubjectDisparityScalingFactor";
  v4[42] = &unk_1F1440AE8;
  v4[43] = &unk_1F1440A98;
  v3[44] = @"farSubjectDisparityScalingFactor";
  v3[45] = @"nearFocusDistanceRatioThreshold";
  v4[44] = &unk_1F1440AF8;
  v4[45] = &unk_1F1440B08;
  v3[46] = @"farFocusDistanceRatioThreshold";
  v4[46] = &unk_1F1440B18;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:47];
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.coremedia"];
  unint64_t v2 = (void *)qword_1E9F76570;
  qword_1E9F76570 = v1;

  [(id)qword_1E9F76570 registerDefaults:v0];
}

uint64_t sub_1BA84F794(const __CFString *a1, const __CFString *a2, uint64_t a3)
{
  CFPropertyListRef v4 = CFPreferencesCopyValue(a1, a2, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v4)
  {
    size_t v5 = (void *)v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFStringGetTypeID())
    {
      id v7 = v5;
      if ([v7 compare:@"true" options:1]
        && [v7 compare:@"yes" options:1])
      {
        if ([v7 compare:@"false" options:1]
          && [v7 compare:@"no" options:1]
          && [v7 compare:@"0" options:1])
        {
          if ([v7 intValue]) {
            a3 = [v7 intValue];
          }
        }
        else
        {
          a3 = 0;
        }
      }
      else
      {
        a3 = 1;
      }

      goto LABEL_18;
    }
    CFTypeID v8 = CFGetTypeID(v5);
    if (v8 == CFNumberGetTypeID())
    {
      uint64_t v9 = [v5 intValue];
    }
    else
    {
      CFTypeID v10 = CFGetTypeID(v5);
      if (v10 != CFBooleanGetTypeID())
      {
LABEL_18:
        CFRelease(v5);
        return a3;
      }
      uint64_t v9 = [v5 BOOLValue];
    }
    a3 = v9;
    goto LABEL_18;
  }
  return a3;
}

CVPixelBufferRef *sub_1BA84F8F4(CVPixelBufferRef *a1)
{
  a1[17] = 0;
  CVPixelBufferRelease(a1[18]);
  a1[18] = 0;
  CVPixelBufferRelease(a1[19]);
  a1[19] = 0;
  CVPixelBufferRelease(a1[20]);
  a1[20] = 0;
  CVPixelBufferRelease(a1[21]);
  a1[21] = 0;
  CVPixelBufferRelease(a1[22]);
  a1[22] = 0;
  CVPixelBufferRelease(a1[23]);
  a1[23] = 0;
  CVPixelBufferRelease(a1[24]);
  a1[24] = 0;
  CVPixelBufferRelease(a1[25]);
  a1[25] = 0;
  CVPixelBufferRelease(a1[26]);
  a1[26] = 0;
  CVPixelBufferRelease(a1[27]);
  a1[27] = 0;
  CVPixelBufferRelease(a1[28]);
  a1[28] = 0;
  CVPixelBufferRelease(a1[29]);
  a1[29] = 0;
  return a1;
}

void sub_1BA84F9B4(unsigned __int16 *a1, unsigned __int16 a2, unsigned __int16 a3, int a4, int a5, int a6, int a7, __int16 a8, float a9, float a10, __int16 a11, unsigned __int16 a12, unsigned __int16 a13, void *a14, __CVBuffer *a15, __CVBuffer *a16, _DWORD *a17)
{
  uint64_t v690 = *MEMORY[0x1E4F143B8];
  id v590 = a14;
  *(_DWORD *)a1 = 207622272;
  a1[2] = a2;
  a1[3] = a3;
  a1[4] = a2 - a8;
  a1[5] = a3 - a11;
  a1[6] = a4;
  a1[7] = a5;
  a1[8] = a6;
  a1[9] = a7;
  a1[10] = a12;
  a1[11] = a13;
  *((float *)a1 + 10) = a9;
  int v26 = (unsigned __int16)((a4 + a6 - 1) / a4);
  int v27 = (a5 + a7 - 1) / a5;
  v671 = a1;
  if (a1[12] != v26 || a1[13] != (unsigned __int16)v27)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76BD8, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1E9F76BD8))
    {
      v575 = +[CVAPreferenceManager defaults];
      char v576 = [v575 BOOLForKey:@"singleCamSDoFPreviewLog"];

      byte_1E9F76BD0 = v576;
      __cxa_guard_release(&qword_1E9F76BD8);
    }
    if (byte_1E9F76BD0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v37 = v671[12];
      int v38 = v671[13];
      *(_DWORD *)buf = 136316674;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/FocusStatsPostprocessing.mm";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "process";
      __int16 v678 = 1024;
      *(_DWORD *)v679 = 206;
      *(_WORD *)&v679[4] = 1024;
      *(_DWORD *)&v679[6] = v26;
      __int16 v680 = 1024;
      int v681 = (unsigned __int16)v27;
      __int16 v682 = 1024;
      int v683 = v37;
      __int16 v684 = 1024;
      int v685 = v38;
      _os_log_impl(&dword_1BA813000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SingleCamSDoFPreviewLog: %s::%s line %d: numTiles = %dx%d from per-frame parameters don't match per-device parameters %dx%d\n", buf, 0x34u);
    }
    CVPixelBufferLockBaseAddress(a16, 0);
    BaseAddress = CVPixelBufferGetBaseAddress(a16);
    size_t Height = CVPixelBufferGetHeight(a16);
    CVPixelBufferGetWidth(a16);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a16);
    bzero(BaseAddress, BytesPerRow * Height);
    int v42 = 0;
    CVPixelBufferUnlockBaseAddress(a16, 0);
    goto LABEL_12;
  }
  float v28 = a15;
  float v30 = (__CVBuffer *)*((void *)a1 + 17);
  unsigned int v29 = (__CVBuffer *)*((void *)a1 + 18);
  size_t v31 = (__CVBuffer *)*((void *)a1 + 28);
  id v32 = v590;
  CVPixelBufferLockBaseAddress(a15, 1uLL);
  CVPixelBufferLockBaseAddress(v30, 0);
  CVPixelBufferLockBaseAddress(v29, 0);
  CVPixelBufferLockBaseAddress(v31, 0);
  id v581 = v32;
  v624 = (char *)[v581 bytes];
  v672 = CVPixelBufferGetBaseAddress(a15);
  size_t v673 = CVPixelBufferGetHeight(a15);
  size_t Width = CVPixelBufferGetWidth(a15);
  size_t v675 = CVPixelBufferGetBytesPerRow(a15);
  int v588 = Width;
  int v587 = v673;
  float v33 = (float *)CVPixelBufferGetBaseAddress(v30);
  int v34 = CVPixelBufferGetHeight(v30);
  int v598 = CVPixelBufferGetWidth(v30);
  size_t v35 = CVPixelBufferGetBytesPerRow(v30);
  size_t v36 = (__CVBuffer *)CVPixelBufferGetBaseAddress(v29);
  CVPixelBufferGetHeight(v29);
  CVPixelBufferGetWidth(v29);
  size_t v600 = CVPixelBufferGetBytesPerRow(v29);
  v594 = (char *)CVPixelBufferGetBaseAddress(v31);
  CVPixelBufferGetHeight(v31);
  CVPixelBufferGetWidth(v31);
  size_t v663 = CVPixelBufferGetBytesPerRow(v31);
  v580 = v31;
  *((void *)v671 + 16) = 4286578687;
  *((_OWORD *)v671 + 7) = xmmword_1BA86C230;
  v689 = 0;
  v687 = 0;
  v584 = v30;
  if (CVPixelBufferGetPixelFormatType(a15) == 1278226488)
  {
    *(void *)buf = &unk_1F142F070;
    *(void *)&buf[8] = &v672;
    *(void *)v679 = buf;
    sub_1BA852F78(buf, v688);
    if (*(unsigned char **)v679 == buf)
    {
      (*(void (**)(unsigned char *))(*(void *)buf + 32))(buf);
    }
    else if (*(void *)v679)
    {
      (*(void (**)(void))(**(void **)v679 + 40))();
    }
    float v43 = &unk_1F142F0B8;
  }
  else if (CVPixelBufferGetPixelFormatType(a15) == 1278226534)
  {
    *(void *)buf = &unk_1F142F100;
    *(void *)&buf[8] = &v672;
    *(void *)v679 = buf;
    sub_1BA852F78(buf, v688);
    if (*(unsigned char **)v679 == buf)
    {
      (*(void (**)(unsigned char *))(*(void *)buf + 32))(buf);
    }
    else if (*(void *)v679)
    {
      (*(void (**)(void))(**(void **)v679 + 40))();
    }
    float v43 = &unk_1F142F148;
  }
  else
  {
    if (CVPixelBufferGetPixelFormatType(a15) != 1278226536) {
      goto LABEL_101;
    }
    *(void *)buf = &unk_1F142F190;
    *(void *)&buf[8] = &v672;
    *(void *)v679 = buf;
    sub_1BA852F78(buf, v688);
    if (*(unsigned char **)v679 == buf)
    {
      (*(void (**)(unsigned char *))(*(void *)buf + 32))(buf);
    }
    else if (*(void *)v679)
    {
      (*(void (**)(void))(**(void **)v679 + 40))();
    }
    float v43 = &unk_1F142F1D8;
  }
  *(void *)buf = v43;
  *(void *)v679 = buf;
  sub_1BA8531E0(buf, v686);
  if (*(unsigned char **)v679 == buf)
  {
    (*(void (**)(unsigned char *))(*(void *)buf + 32))(buf);
  }
  else if (*(void *)v679)
  {
    (*(void (**)(void))(**(void **)v679 + 40))();
  }
  v579 = v29;
  if (v34 < 1)
  {
    float v28 = a15;
    goto LABEL_101;
  }
  v592 = v33;
  uint64_t v46 = 0;
  int v47 = 0;
  CVPixelBufferRef v613 = 0;
  CVPixelBufferRef v616 = 0;
  v608 = (char *)(v671 + 120);
  int v48 = (__int16)v671[5];
  float v49 = (float)v587;
  int v50 = v587 - 1;
  CVPixelBufferRef v619 = v36;
  uint64_t __dst = v34 - 1;
  uint64_t v602 = v34;
  do
  {
    int v51 = (__int16)v671[5];
    int v52 = v671[9];
    if (v46 < __dst)
    {
      int v51 = v671[7];
      int v52 = v48;
    }
    int v53 = v52 + v51;
    unsigned int v54 = v671[24];
    LOWORD(v45) = v671[11];
    float v45 = (float)LODWORD(v45);
    int v604 = v53;
    int v55 = (int)(float)((float)((float)((float)v53 + 0.5) * (float)v54) / v45);
    if (v55 >= (int)v54) {
      unint64_t v56 = v671[24];
    }
    else {
      unint64_t v56 = v55;
    }
    uint64_t v606 = v46;
    if (v598 >= 1)
    {
      uint64_t v57 = 0;
      float v58 = (float)v48 + 0.5;
      *(float *)v44.i32 = (float)(v58 * (float)v54) / v45;
      unint64_t v59 = (int)*(float *)v44.i32 & ~((int)*(float *)v44.i32 >> 31);
      v635 = (char *)v59;
      size_t __n = (size_t)v592 + v35 * v46;
      int64_t v60 = (char *)v36 + v600 * v46;
      int v61 = (__int16)v671[4];
      int v631 = v56 - v59;
      uint64_t v62 = v47;
      CVPixelBufferRef v610 = (CVPixelBufferRef)&v594[v663 * v59];
      v628 = v60;
      v658 = (char *)v56;
      while (1)
      {
        double v63 = &v624[8 * v62];
        v44.i16[0] = *(_WORD *)v63;
        int16x4_t v44 = (int16x4_t)vmovl_s16(v44).u64[0];
        LOWORD(v45) = v671[22];
        *(float *)(__n + 4 * v57) = (float)v44.i32[0] / (float)LODWORD(v45);
        int v640 = v63[4];
        v60[v57] = (v640 != 0) << 7;
        int v64 = (__int16)v671[4];
        int v65 = v671[8];
        if (v57 < v598 - 1)
        {
          int v64 = v671[6];
          int v65 = v61;
        }
        unsigned int v66 = v671[23];
        float v45 = (float)v66;
        LOWORD(v58) = v671[10];
        float v58 = (float)LODWORD(v58);
        int v67 = v65 + v64;
        int v68 = (int)(float)((float)((float)((float)v61 + 0.5) * (float)v66) / v58) & ~((int)(float)((float)((float)((float)v61 + 0.5) * (float)v66)
                                                                                                 / v58) >> 31);
        *(float *)v44.i32 = (float)((float)((float)v67 + 0.5) * (float)v66) / v58;
        if ((int)*(float *)v44.i32 >= (int)v66) {
          int v69 = v671[23];
        }
        else {
          int v69 = (int)*(float *)v44.i32;
        }
        uint64_t v647 = v62;
        uint64_t v651 = v57;
        int v643 = v67;
        __vImage_Buffer src = (int)(float)((float)((float)((float)v61 + 0.5) * (float)v66) / v58) & ~((int)(float)((float)((float)((float)v61 + 0.5) * (float)v66) / v58) >> 31);
        if ((int)v56 <= (int)v59) {
          goto LABEL_72;
        }
        int v70 = v59;
        if (v69 <= v68) {
          break;
        }
        uint64_t v71 = 0;
        uint64_t v72 = 0;
        double v73 = v635;
        int8x16_t v74 = (char *)v610 + v68;
        do
        {
          LOWORD(v45) = v671[24];
          float v75 = (float)((float)((float)(int)v73 + 0.5) * v49) / (float)LODWORD(v45);
          int v76 = (int)v75 & ~((int)v75 >> 31);
          if (v76 >= v50) {
            int v76 = v50;
          }
          *(_DWORD *)buf = v76;
          if (!v689) {
            goto LABEL_636;
          }
          uint64_t v77 = (*(uint64_t (**)(void *, unsigned char *))(*v689 + 48))(v689, buf);
          int32x4_t v78 = v74;
          int v79 = __src;
          unint64_t v80 = v671;
          do
          {
            LOWORD(v45) = v80[23];
            float v81 = (float)((float)((float)v79 + 0.5) * (float)v588) / (float)LODWORD(v45);
            int v82 = (int)v81 & ~((int)v81 >> 31);
            if (v82 >= v588 - 1) {
              int v82 = v588 - 1;
            }
            *(void *)buf = v77;
            int v676 = v82;
            if (!v687) {
              goto LABEL_636;
            }
            unsigned int v83 = (*(uint64_t (**)(void *, unsigned char *, int *))(*v687 + 48))(v687, buf, &v676);
            unint64_t v80 = v671;
            if (v83 < *((unsigned __int8 *)v671 + 52)) {
              ++v71;
            }
            uint64_t v84 = (v83 >= *((unsigned __int8 *)v671 + 52)) & (v83 > *((unsigned __int8 *)v671 + 51));
            if (v83 >= *((unsigned __int8 *)v671 + 52) && v83 > *((unsigned __int8 *)v671 + 51)) {
              char v85 = 64;
            }
            else {
              char v85 = 32;
            }
            *v78++ = v85;
            v72 += v84;
            ++v79;
          }
          while (v69 > v79);
          ++v73;
          LODWORD(v56) = v658;
          v74 += v663;
          int v50 = v587 - 1;
        }
        while (v73 != v658);
LABEL_73:
        uint64_t v88 = (v69 - __src) * v631;
        if (v72 == v88)
        {
          uint64_t v89 = v647;
          uint64_t v90 = v651;
          int64_t v60 = v628;
          v628[v651] |= 0x40u;
          size_t v36 = v619;
          LODWORD(v59) = v635;
          if (v640)
          {
            float v91 = *(float *)(__n + 4 * v651);
            float v45 = *((float *)v671 + 28);
            float v58 = *((float *)v671 + 29);
            if (v91 >= v45) {
              float v91 = *((float *)v671 + 28);
            }
            *((float *)v671 + 28) = v91;
            v44.i32[0] = *(_DWORD *)(__n + 4 * v651);
            if (v58 >= *(float *)v44.i32) {
              *(float *)v44.i32 = v58;
            }
            *((_DWORD *)v671 + 29) = v44.i32[0];
            CVPixelBufferRef v616 = (CVPixelBufferRef)((char *)v616 + 1);
          }
        }
        else
        {
          uint64_t v89 = v647;
          uint64_t v90 = v651;
          int64_t v60 = v628;
          char v92 = v628[v651];
          size_t v36 = v619;
          LODWORD(v59) = v635;
          if (v71 == v88)
          {
            v628[v651] = v92 | 0x20;
            int v61 = v643;
            if (v640)
            {
              float v93 = *(float *)(__n + 4 * v651);
              float v45 = *((float *)v671 + 31);
              float v58 = *((float *)v671 + 32);
              if (v93 >= v45) {
                float v93 = *((float *)v671 + 31);
              }
              *((float *)v671 + 31) = v93;
              v44.i32[0] = *(_DWORD *)(__n + 4 * v651);
              if (v58 >= *(float *)v44.i32) {
                *(float *)v44.i32 = v58;
              }
              *((_DWORD *)v671 + 32) = v44.i32[0];
              CVPixelBufferRef v613 = (CVPixelBufferRef)((char *)v613 + 1);
            }
            goto LABEL_44;
          }
          v628[v651] = v92 | 0x10;
        }
        int v61 = v643;
LABEL_44:
        uint64_t v57 = v90 + 1;
        uint64_t v62 = v89 + 1;
        if (v57 == v598)
        {
          int v47 = v62;
          goto LABEL_34;
        }
      }
      do
      {
        LOWORD(v45) = v671[24];
        float v86 = (float)((float)((float)v70 + 0.5) * v49) / (float)LODWORD(v45);
        int v87 = (int)v86 & ~((int)v86 >> 31);
        if (v87 >= v50) {
          int v87 = v50;
        }
        *(_DWORD *)buf = v87;
        if (!v689) {
          goto LABEL_636;
        }
        (*(void (**)(void *, unsigned char *))(*v689 + 48))(v689, buf);
        ++v70;
      }
      while (v56 != v70);
LABEL_72:
      uint64_t v72 = 0;
      uint64_t v71 = 0;
      goto LABEL_73;
    }
LABEL_34:
    uint64_t v46 = v606 + 1;
    int v48 = v604;
  }
  while (v606 + 1 != v602);
  if (!v616)
  {
    float v95 = (float *)(v671 + 62);
    float v30 = v584;
    unsigned int v29 = v579;
    float v28 = a15;
    int8x16_t v96 = v592;
    if (v613)
    {
      float v110 = *((float *)v671 + 32);
      goto LABEL_108;
    }
LABEL_101:
    int v107 = 0;
    goto LABEL_205;
  }
  bzero(v608, 0x400uLL);
  float v95 = (float *)(v671 + 62);
  float v30 = v584;
  unsigned int v29 = v579;
  float v28 = a15;
  int8x16_t v96 = v592;
  if (v598 >= 1)
  {
    uint64_t v97 = 0;
    uint64_t v98 = v36;
    size_t v99 = v592;
    do
    {
      int32x2_t v100 = v98;
      uint64_t v101 = v598;
      unint64_t v102 = v99;
      do
      {
        int v103 = *(unsigned __int8 *)v100;
        int32x2_t v100 = (__CVBuffer *)((char *)v100 + 1);
        if (v103 == 192)
        {
          float v104 = *v102;
          float v105 = *((float *)v671 + 28);
          float v94 = *((float *)v671 + 29);
          if (*v102 >= v105 && v104 < v94) {
            *(float *)&v608[4 * (unint64_t)(float)((float)((float)(v104 - v105) * 256.0) / (float)(v94 - v105))] = *(float *)&v608[4 * (unint64_t)(float)((float)((float)(v104 - v105) * 256.0) / (float)(v94 - v105))] + 1.0;
          }
        }
        ++v102;
        --v101;
      }
      while (v101);
      ++v97;
      size_t v99 = (float *)((char *)v99 + v35);
      uint64_t v98 = (__CVBuffer *)((char *)v98 + v600);
    }
    while (v97 != v602);
  }
  *((_DWORD *)v671 + 30) = 0;
  float v108 = *((float *)v671 + 28);
  CVPixelBufferRef v109 = v613;
  if (!v613)
  {
    *((float *)v671 + 32) = v108;
    *((float *)v671 + 33) = v108;
    *((float *)v671 + 31) = v108;
    CVPixelBufferRef v123 = v616;
    goto LABEL_128;
  }
  if (v108 >= *((float *)v671 + 32)) {
    float v110 = *((float *)v671 + 32);
  }
  else {
    float v110 = *((float *)v671 + 28);
  }
LABEL_108:
  bzero(v608, 0x400uLL);
  if (v598 >= 1)
  {
    for (uint64_t i = 0; i != v602; ++i)
    {
      int32x4_t v112 = v36;
      uint64_t v113 = v598;
      unint64_t v114 = v96;
      do
      {
        int v115 = *(unsigned __int8 *)v112;
        int32x4_t v112 = (__CVBuffer *)((char *)v112 + 1);
        if (v115 == 160)
        {
          float v116 = *v114;
          if (*v114 < v110 && v116 >= *v95)
          {
            unint64_t v117 = 4 * (unint64_t)(float)((float)((float)(v116 - *v95) * 256.0) / (float)(v110 - *v95));
            *(float *)&v608[v117] = *(float *)&v608[v117] + 1.0;
          }
        }
        ++v114;
        --v113;
      }
      while (v113);
      int8x16_t v96 = (float *)((char *)v96 + v35);
      size_t v36 = (__CVBuffer *)((char *)v36 + v600);
    }
  }
  uint64_t v118 = 0;
  *((_DWORD *)v671 + 316) = 872415232;
  float v119 = 0.00000011921;
  do
  {
    float v119 = v119 + *(float *)&v608[v118];
    *((float *)v671 + 316) = v119;
    v118 += 4;
  }
  while (v118 != 1024);
  uint64_t v120 = 0;
  float v121 = *((float *)v671 + 60) / v119;
  *((float *)v671 + 60) = v121;
  int8x16_t v122 = v671 + 122;
  CVPixelBufferRef v123 = v616;
  do
  {
    float v121 = v121 + (float)(*(float *)&v122[v120] / *((float *)v671 + 316));
    *(float *)&v122[v120] = v121;
    v120 += 2;
  }
  while (v120 != 510);
  unint64_t v124 = 0;
  float v125 = *((float *)v671 + 31);
  CVPixelBufferRef v109 = v613;
  do
  {
    if (*(float *)&v608[4 * v124] > *((float *)v671 + 14)) {
      break;
    }
    ++v124;
  }
  while (v124 != 256);
  float v94 = v110 - v125;
  float v108 = v125 + (float)((float)((float)v124 * 0.0039062) * (float)(v110 - v125));
  *((float *)v671 + 33) = v108;
  if (v616)
  {
LABEL_128:
    if (!((unint64_t)v109 | (unint64_t)v123)) {
      goto LABEL_101;
    }
    goto LABEL_129;
  }
  *((float *)v671 + 29) = v108;
  *((float *)v671 + 30) = v108;
  *((float *)v671 + 28) = v108;
  if ((unint64_t)v613 == (unsigned __int128)0) {
    goto LABEL_101;
  }
LABEL_129:
  uint64_t v126 = v671[23];
  LOWORD(v108) = v671[10];
  float v127 = (float)LODWORD(v108);
  int v128 = (__int16)v671[5];
  unsigned int v129 = v671[24];
  float v130 = (float)v129;
  LOWORD(v94) = v671[11];
  float v131 = (float)LODWORD(v94);
  int v132 = (int)(float)((float)((float)((float)v128 + 0.5) * (float)v129) / v131);
  unint64_t v133 = v132 & ~(v132 >> 31);
  int v655 = (__int16)v671[4];
  int v134 = (int)(float)((float)((float)((float)(v671[8] + v655) + 0.5) * (float)v126) / (float)LODWORD(v108));
  if (v134 >= (int)v126) {
    int v135 = v671[23];
  }
  else {
    int v135 = (int)(float)((float)((float)((float)(v671[8] + v655) + 0.5) * (float)v126)
  }
                      / (float)LODWORD(v108));
  int v659 = v135;
  LODWORD(v136) = (int)(float)((float)((float)((float)(v671[9] + v128) + 0.5) * v130) / v131);
  int v648 = v136;
  uint64_t v652 = v671[24];
  if ((int)v136 >= (int)v129) {
    unint64_t v136 = v671[24];
  }
  else {
    unint64_t v136 = v136;
  }
  __srca = (void *)v136;
  if (v132 >= 1)
  {
    uint64_t v137 = 0;
    unsigned int v138 = v594;
    do
    {
      LOWORD(v130) = v671[24];
      float v139 = (float)((float)((float)(int)v137 + 0.5) * (float)v587) / (float)LODWORD(v130);
      *(_DWORD *)buf = (int)v139 & ~((int)v139 >> 31);
      if (!v689) {
        goto LABEL_636;
      }
      uint64_t v140 = (*(uint64_t (**)(void *, unsigned char *))(*v689 + 48))(v689, buf);
      LOWORD(v141) = v671[23];
      if ((_WORD)v141)
      {
        uint64_t v142 = v140;
        unint64_t v143 = 0;
        do
        {
          float v144 = (float)((float)((float)(int)v143 + 0.5) * (float)v588) / (float)(unsigned __int16)v141;
          int v145 = (int)v144 & ~((int)v144 >> 31);
          if (v145 >= v588 - 1) {
            int v145 = v588 - 1;
          }
          *(void *)buf = v142;
          int v676 = v145;
          if (!v687) {
            goto LABEL_636;
          }
          unsigned int v146 = (*(uint64_t (**)(void *, unsigned char *, int *))(*v687 + 48))(v687, buf, &v676);
          if (v146 > *((unsigned __int8 *)v671 + 51) && v146 >= *((unsigned __int8 *)v671 + 52)) {
            char v148 = 64;
          }
          else {
            char v148 = 32;
          }
          v138[v143++] = v148;
          unint64_t v141 = v671[23];
        }
        while (v143 < v141);
      }
      ++v137;
      v138 += v663;
    }
    while (v137 != (char *)v133);
  }
  if ((int)v133 < (int)__srca)
  {
    int v656 = (int)(float)((float)((float)((float)v655 + 0.5) * (float)v126) / v127);
    float v149 = (float)v588;
    if (v134 < v126) {
      uint64_t v126 = v134;
    }
    float v150 = &v594[v663 * v133];
    while (1)
    {
      LOWORD(v130) = v671[24];
      float v151 = (float)((float)((float)(int)v133 + 0.5) * (float)v587) / (float)LODWORD(v130);
      int v152 = (int)v151 & ~((int)v151 >> 31);
      if (v152 >= v587 - 1) {
        int v152 = v587 - 1;
      }
      *(_DWORD *)buf = v152;
      if (!v689) {
        goto LABEL_636;
      }
      uint64_t v153 = (*(uint64_t (**)(void *, unsigned char *))(*v689 + 48))(v689, buf);
      uint64_t v154 = v671;
      if (v656 >= 1) {
        break;
      }
LABEL_170:
      LODWORD(v160) = v154[23];
      uint64_t v161 = v126;
      if (v659 < (int)v160)
      {
        do
        {
          int v162 = (int)(float)((float)((float)((float)(int)v161 + 0.5) * v149) / (float)(unsigned __int16)v160);
          if (v588 - 1 < v162) {
            int v162 = v588 - 1;
          }
          *(void *)buf = v153;
          int v676 = v162;
          if (!v687) {
            goto LABEL_636;
          }
          unsigned int v163 = (*(uint64_t (**)(void *, unsigned char *, int *))(*v687 + 48))(v687, buf, &v676);
          if (v163 > *((unsigned __int8 *)v671 + 51) && v163 >= *((unsigned __int8 *)v671 + 52)) {
            char v165 = 64;
          }
          else {
            char v165 = 32;
          }
          v150[v161++] = v165;
          uint64_t v160 = v671[23];
        }
        while (v161 < v160);
      }
      ++v133;
      v150 += v663;
      if ((void *)v133 == __srca) {
        goto LABEL_182;
      }
    }
    uint64_t v155 = 0;
    while (1)
    {
      LOWORD(v130) = v154[23];
      float v156 = (float)((float)((float)(int)v155 + 0.5) * v149) / (float)LODWORD(v130);
      *(void *)buf = v153;
      int v676 = (int)v156 & ~((int)v156 >> 31);
      if (!v687) {
        break;
      }
      unsigned int v157 = (*(uint64_t (**)(void *, unsigned char *, int *))(*v687 + 48))(v687, buf, &v676);
      uint64_t v154 = v671;
      if (v157 > *((unsigned __int8 *)v671 + 51) && v157 >= *((unsigned __int8 *)v671 + 52)) {
        char v159 = 64;
      }
      else {
        char v159 = 32;
      }
      v150[v155++] = v159;
      if ((v656 & ~(v656 >> 31)) == v155) {
        goto LABEL_170;
      }
    }
LABEL_636:
    sub_1BA816504();
    __break(1u);
  }
LABEL_182:
  LODWORD(v166) = v671[24];
  if ((int)__srca < (int)v166)
  {
    if (v648 >= v652) {
      uint64_t v167 = v652;
    }
    else {
      uint64_t v167 = v648;
    }
    uint64_t v168 = &v594[v663 * v167];
    while (1)
    {
      int v169 = (int)(float)((float)((float)((float)(int)v167 + 0.5) * (float)v587) / (float)(unsigned __int16)v166);
      if (v587 - 1 < v169) {
        int v169 = v587 - 1;
      }
      *(_DWORD *)buf = v169;
      if (!v689) {
        goto LABEL_636;
      }
      uint64_t v170 = (*(uint64_t (**)(void *, unsigned char *))(*v689 + 48))(v689, buf);
      LOWORD(v171) = v671[23];
      if ((_WORD)v171) {
        break;
      }
LABEL_187:
      ++v167;
      uint64_t v166 = v671[24];
      v168 += v663;
      if (v167 >= v166) {
        goto LABEL_204;
      }
    }
    uint64_t v172 = v170;
    unint64_t v173 = 0;
    while (1)
    {
      float v174 = (float)((float)((float)(int)v173 + 0.5) * (float)v588) / (float)(unsigned __int16)v171;
      int v175 = (int)v174 & ~((int)v174 >> 31);
      if (v175 >= v588 - 1) {
        int v175 = v588 - 1;
      }
      *(void *)buf = v172;
      int v676 = v175;
      if (!v687) {
        goto LABEL_636;
      }
      unsigned int v176 = (*(uint64_t (**)(void *, unsigned char *, int *))(*v687 + 48))(v687, buf, &v676);
      if (v176 > *((unsigned __int8 *)v671 + 51) && v176 >= *((unsigned __int8 *)v671 + 52)) {
        char v178 = 64;
      }
      else {
        char v178 = 32;
      }
      v168[v173++] = v178;
      unint64_t v171 = v671[23];
      if (v173 >= v171) {
        goto LABEL_187;
      }
    }
  }
LABEL_204:
  int v107 = 1;
  float v30 = v584;
  unsigned int v29 = v579;
  float v28 = a15;
LABEL_205:
  CVPixelBufferUnlockBaseAddress(v30, 0);
  CVPixelBufferUnlockBaseAddress(v28, 1uLL);
  CVPixelBufferUnlockBaseAddress(v29, 0);
  CVPixelBufferUnlockBaseAddress(v580, 0);
  if (v687 == v686)
  {
    (*(void (**)(void *))(v686[0] + 32))(v686);
  }
  else if (v687)
  {
    (*(void (**)(void))(*v687 + 40))();
  }
  if (v689 == v688)
  {
    (*(void (**)(void *))(v688[0] + 32))(v688);
  }
  else if (v689)
  {
    (*(void (**)(void))(*v689 + 40))();
  }

  if (v107)
  {
    v611 = (__CVBuffer *)*((void *)v671 + 22);
    v614 = (__CVBuffer *)*((void *)v671 + 21);
    v609 = (__CVBuffer *)*((void *)v671 + 23);
    long long v179 = (__CVBuffer *)*((void *)v671 + 25);
    unint64_t v181 = (__CVBuffer *)*((void *)v671 + 26);
    int v180 = (__CVBuffer *)*((void *)v671 + 27);
    uint64_t v182 = (__CVBuffer *)*((void *)v671 + 19);
    v617 = (__CVBuffer *)*((void *)v671 + 20);
    v620 = (__CVBuffer *)*((void *)v671 + 24);
    float v183 = (__CVBuffer *)*((void *)v671 + 17);
    v607 = (__CVBuffer *)*((void *)v671 + 18);
    CVPixelBufferLockBaseAddress(v607, 0);
    CVPixelBufferLockBaseAddress(v617, 0);
    CVPixelBufferLockBaseAddress(v614, 0);
    CVPixelBufferLockBaseAddress(v611, 0);
    CVPixelBufferLockBaseAddress(v609, 0);
    CVPixelBufferLockBaseAddress(v620, 0);
    CVPixelBufferLockBaseAddress(v179, 0);
    CVPixelBufferLockBaseAddress(v181, 0);
    CVPixelBufferLockBaseAddress(v180, 0);
    CVPixelBufferLockBaseAddress(v182, 0);
    CVPixelBufferLockBaseAddress(v183, 0);
    int v184 = (char *)CVPixelBufferGetBaseAddress(v183);
    size_t v605 = CVPixelBufferGetHeight(v183);
    size_t v185 = CVPixelBufferGetWidth(v183);
    size_t v653 = CVPixelBufferGetBytesPerRow(v183);
    v601 = (char *)CVPixelBufferGetBaseAddress(v620);
    size_t v586 = CVPixelBufferGetHeight(v620);
    CVPixelBufferGetWidth(v620);
    size_t v641 = CVPixelBufferGetBytesPerRow(v620);
    v599 = CVPixelBufferGetBaseAddress(v179);
    CVPixelBufferGetHeight(v179);
    CVPixelBufferGetWidth(v179);
    size_t v657 = CVPixelBufferGetBytesPerRow(v179);
    v629 = (char *)CVPixelBufferGetBaseAddress(v181);
    CVPixelBufferGetHeight(v181);
    CVPixelBufferGetWidth(v181);
    size_t v664 = CVPixelBufferGetBytesPerRow(v181);
    v636 = (char *)CVPixelBufferGetBaseAddress(v180);
    CVPixelBufferGetHeight(v180);
    CVPixelBufferGetWidth(v180);
    size_t __srcb = CVPixelBufferGetBytesPerRow(v180);
    long long v186 = (char *)CVPixelBufferGetBaseAddress(v607);
    CVPixelBufferGetHeight(v607);
    CVPixelBufferGetWidth(v607);
    size_t v649 = CVPixelBufferGetBytesPerRow(v607);
    v603 = (char *)CVPixelBufferGetBaseAddress(v617);
    size_t v187 = CVPixelBufferGetHeight(v617);
    CVPixelBufferGetWidth(v617);
    size_t v644 = CVPixelBufferGetBytesPerRow(v617);
    __dsta = (char *)CVPixelBufferGetBaseAddress(v614);
    CVPixelBufferGetHeight(v614);
    CVPixelBufferGetWidth(v614);
    size_t v582 = CVPixelBufferGetBytesPerRow(v614);
    v625 = (char *)CVPixelBufferGetBaseAddress(v611);
    CVPixelBufferGetHeight(v611);
    CVPixelBufferGetWidth(v611);
    CVPixelBufferRef v622 = (CVPixelBufferRef)CVPixelBufferGetBytesPerRow(v611);
    v633 = (char *)CVPixelBufferGetBaseAddress(v609);
    CVPixelBufferGetHeight(v609);
    CVPixelBufferGetWidth(v609);
    size_t v632 = CVPixelBufferGetBytesPerRow(v609);
    v660 = (char *)CVPixelBufferGetBaseAddress(v182);
    size_t v188 = CVPixelBufferGetHeight(v182);
    CVPixelBufferGetWidth(v182);
    v589 = v181;
    v591 = v180;
    v593 = v182;
    v595 = v183;
    size_t v585 = CVPixelBufferGetBytesPerRow(v182);
    bzero(v660, v585 * v188);
    size_t v583 = v644 * v187;
    bzero(v603, v644 * v187);
    if (v605)
    {
      size_t v189 = &v601[v641 + 4];
      size_t v190 = v605;
      int64x2_t v191 = &v603[v644 + 1];
      int v192 = v186;
      int v193 = v184;
      do
      {
        memcpy(v191, v192, v185);
        memcpy(v189, v193, 4 * v185);
        v189 += v641;
        v191 += v644;
        v193 += v653;
        v192 += v649;
        --v190;
      }
      while (v190);
    }
    memcpy(__dsta, v603, v583);
    memcpy(v625, v603, v583);
    memcpy(v633, v603, v583);
    memcpy(v599, v601, v641 * v586);
    memcpy(v629, v601, v641 * v586);
    memcpy(v636, v601, v641 * v586);
    if (v605 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      if (v185 + 1 >= 2)
      {
        uint64_t v194 = 1;
        do
        {
          int v195 = &v603[v194 * v644];
          uint64_t v196 = &v601[v194 * v641];
          float v197 = &v603[(v194 - 1) * v644];
          int8x16_t v198 = &v603[(v194 + 1) * v644];
          uint64_t v199 = 1;
          size_t v200 = &v601[(v194 + 1) * v641];
          do
          {
            int v202 = v195[v199];
            _ZF = v202 != 32 && (v202 & 0x10) == 0;
            if (_ZF)
            {
              uint64_t v201 = v199 + 1;
            }
            else
            {
              uint64_t v204 = v199 - 1;
              uint64_t v205 = 4 * (v199 - 1);
              if (v197[v199 - 1] == 160) {
                float v206 = 1.0;
              }
              else {
                float v206 = 0.0;
              }
              if (v197[v199] == 160) {
                float v207 = 1.0;
              }
              else {
                float v207 = 0.0;
              }
              uint64_t v201 = v199 + 1;
              uint64_t v208 = 4 * (v199 + 1);
              if (v197[v199 + 1] == 160) {
                float v209 = 1.0;
              }
              else {
                float v209 = 0.0;
              }
              float v210 = (float)((float)(*(float *)&v601[4 * v199 + (v194 - 1) * v641] * v207)
                           + (float)(*(float *)&v601[(v194 - 1) * v641 + v205] * v206))
                   + (float)(*(float *)&v601[(v194 - 1) * v641 + v208] * v209);
              if (v195[v204] == 160) {
                float v211 = 1.0;
              }
              else {
                float v211 = 0.0;
              }
              float v212 = v210 + (float)(*(float *)&v196[v205] * v211);
              if (v195[v201] == 160) {
                float v213 = 1.0;
              }
              else {
                float v213 = 0.0;
              }
              float v214 = v212 + (float)(*(float *)&v196[v208] * v213);
              if (v198[v204] == 160) {
                float v215 = 1.0;
              }
              else {
                float v215 = 0.0;
              }
              float v216 = v214 + (float)(*(float *)&v200[v205] * v215);
              if (v198[v199] == 160) {
                float v217 = 1.0;
              }
              else {
                float v217 = 0.0;
              }
              float v218 = v216 + (float)(*(float *)&v200[4 * v199] * v217);
              if (v198[v201] == 160) {
                float v219 = 1.0;
              }
              else {
                float v219 = 0.0;
              }
              float v220 = v218 + (float)(*(float *)&v200[v208] * v219);
              *(float *)&v196[4 * v199] = v220;
              int v221 = v197[v204] == 160;
              if (v197[v199] == 160) {
                ++v221;
              }
              if (v197[v201] == 160) {
                ++v221;
              }
              if (v195[v204] == 160) {
                ++v221;
              }
              if (v195[v201] == 160) {
                ++v221;
              }
              if (v198[v204] == 160) {
                int v222 = v221 + 1;
              }
              else {
                int v222 = v221;
              }
              if (v198[v199] == 160) {
                ++v222;
              }
              if (v198[v201] == 160) {
                ++v222;
              }
              if (v222)
              {
                *(float *)&v196[4 * v199] = v220 / (float)v222;
                v195[v199] = -96;
                ++v660[v194 * v585 + v199];
              }
            }
            uint64_t v199 = v201;
          }
          while (v201 != v185 + 1);
          _ZF = v194++ == v605;
        }
        while (!_ZF);
      }
      long long v227 = v593;
      int v226 = v595;
      float v228 = v591;
      float v230 = v179;
      uint64_t v229 = v589;
      if (v185)
      {
        unint64_t v231 = &v660[v585];
        uint64_t v232 = (uint64_t)v599 + 4 * v185 + 4;
        uint64_t v233 = __dsta + 1;
        uint64_t v234 = (uint64_t)&__dsta[2 * v582 + 1];
        float v235 = &__dsta[v582 + 1];
        uint64_t v236 = 1;
        do
        {
          uint64_t v237 = 0;
          uint64_t v238 = v236++;
          float v239 = v235;
          uint64_t v240 = v234;
          int v241 = v233;
          v242 = (float *)v232;
          uint64_t v243 = v231;
          do
          {
            unint64_t v244 = &v239[v185];
            int v245 = v239[v185 - 1];
            if (v245 == 32 || (v245 & 0x10) != 0)
            {
              int64x2_t v247 = &v241[v185];
              if (v241[v185 - 2] == 160) {
                float v248 = 1.0;
              }
              else {
                float v248 = 0.0;
              }
              if (*(v247 - 1) == 160) {
                float v249 = 1.0;
              }
              else {
                float v249 = 0.0;
              }
              float v250 = (float)(*(v242 - 1) * v249) + (float)(*(v242 - 2) * v248);
              if (*v247 == 160) {
                float v251 = 1.0;
              }
              else {
                float v251 = 0.0;
              }
              float v252 = v250 + (float)(*v242 * v251);
              v253 = (float *)((char *)v242 + v657);
              if (*(v244 - 2) == 160) {
                float v254 = 1.0;
              }
              else {
                float v254 = 0.0;
              }
              float v255 = v252 + (float)(*(float *)((char *)v242 + v657 - 8) * v254);
              if (*v244 == 160) {
                float v256 = 1.0;
              }
              else {
                float v256 = 0.0;
              }
              float v257 = v255 + (float)(*v253 * v256);
              int64x2_t v258 = (float *)((char *)v242 + 2 * v657);
              int64x2_t v259 = (unsigned __int8 *)(v240 + v185);
              if (*(unsigned __int8 *)(v240 + v185 - 2) == 160) {
                float v260 = 1.0;
              }
              else {
                float v260 = 0.0;
              }
              float v261 = v257 + (float)(*(v258 - 2) * v260);
              if (*(v259 - 1) == 160) {
                float v262 = 1.0;
              }
              else {
                float v262 = 0.0;
              }
              float v263 = v261 + (float)(*(v258 - 1) * v262);
              if (*v259 == 160) {
                float v264 = 1.0;
              }
              else {
                float v264 = 0.0;
              }
              float v265 = v263 + (float)(*v258 * v264);
              *(v253 - 1) = v265;
              int v266 = *(v247 - 2) == 160;
              if (*(v247 - 1) == 160) {
                ++v266;
              }
              if (*v247 == 160) {
                int v267 = v266 + 1;
              }
              else {
                int v267 = v266;
              }
              if (*(v244 - 2) == 160) {
                ++v267;
              }
              if (*v244 == 160) {
                ++v267;
              }
              if (*(v259 - 2) == 160) {
                ++v267;
              }
              if (*(v259 - 1) == 160) {
                ++v267;
              }
              if (*v259 == 160) {
                ++v267;
              }
              if (v267)
              {
                *(v253 - 1) = v265 / (float)v267;
                *(v244 - 1) = -96;
                ++v243[v185];
              }
            }
            --v243;
            ++v237;
            --v242;
            --v241;
            --v240;
            --v239;
          }
          while (v185 != v237);
          v231 += v585;
          v232 += v657;
          v233 += v582;
          v234 += v582;
          v235 += v582;
        }
        while (v238 != v605);
        goto LABEL_324;
      }
LABEL_426:
      uint64_t v329 = 0;
      uint64_t v330 = (uint64_t)&v601[v641 + 4];
      uint64_t v331 = (uint64_t)&v636[__srcb + 4];
      uint64_t v332 = (uint64_t)&v629[v664 + 4];
      uint64_t v333 = (uint64_t)v599 + v657 + 4;
      uint64_t v334 = (uint64_t)&v660[v585 + 1];
      while (!v185)
      {
LABEL_427:
        ++v329;
        v184 += v653;
        v186 += v649;
        v330 += v641;
        v331 += __srcb;
        v332 += v664;
        v333 += v657;
        v334 += v585;
        if (v329 == v605) {
          goto LABEL_446;
        }
      }
      uint64_t v335 = 0;
      while (2)
      {
        if (*(unsigned char *)(v334 + v335))
        {
          float v336 = *(float *)(v333 + 4 * v335);
          float v337 = *(float *)(v331 + 4 * v335);
          if (v337 >= *(float *)(v332 + 4 * v335)) {
            float v337 = *(float *)(v332 + 4 * v335);
          }
          if (v336 >= *(float *)(v330 + 4 * v335)) {
            float v336 = *(float *)(v330 + 4 * v335);
          }
          if (v337 < v336) {
            float v336 = v337;
          }
          *(float *)&v184[4 * v335] = v336;
LABEL_437:
          v186[v335] = -96;
        }
        else
        {
          int v338 = v186[v335];
          if (v338 == 32 || (v338 & 0x10) != 0)
          {
            *(_DWORD *)&v184[4 * v335] = *((_DWORD *)v671 + 33);
            goto LABEL_437;
          }
          *(_DWORD *)&v184[4 * v335] = *(_DWORD *)(v330 + 4 * v335);
        }
        if (v185 == ++v335) {
          goto LABEL_427;
        }
        continue;
      }
    }
LABEL_324:
    long long v227 = v593;
    int v226 = v595;
    float v228 = v591;
    float v230 = v179;
    uint64_t v229 = v589;
    if (v605)
    {
      if (v185 + 1 >= 2)
      {
        size_t v268 = v605;
        do
        {
          v269 = &v660[v268 * v585];
          v270 = &v625[v268 * (void)v622];
          v271 = &v629[v268 * v664];
          uint64_t v272 = v268-- + 1;
          v273 = &v625[v268 * (void)v622];
          v274 = &v625[v272 * (void)v622];
          uint64_t v275 = 1;
          v276 = &v629[v272 * v664];
          do
          {
            int v278 = v270[v275];
            if (v278 != 32 && (v278 & 0x10) == 0)
            {
              uint64_t v277 = v275 + 1;
            }
            else
            {
              uint64_t v280 = v275 - 1;
              uint64_t v281 = 4 * (v275 - 1);
              if (v273[v275 - 1] == 160) {
                float v282 = 1.0;
              }
              else {
                float v282 = 0.0;
              }
              if (v273[v275] == 160) {
                float v283 = 1.0;
              }
              else {
                float v283 = 0.0;
              }
              uint64_t v277 = v275 + 1;
              uint64_t v284 = 4 * (v275 + 1);
              if (v273[v275 + 1] == 160) {
                float v285 = 1.0;
              }
              else {
                float v285 = 0.0;
              }
              float v286 = (float)((float)(*(float *)&v629[4 * v275 + v268 * v664] * v283)
                           + (float)(*(float *)&v629[v268 * v664 + v281] * v282))
                   + (float)(*(float *)&v629[v268 * v664 + v284] * v285);
              if (v270[v280] == 160) {
                float v287 = 1.0;
              }
              else {
                float v287 = 0.0;
              }
              float v288 = v286 + (float)(*(float *)&v271[v281] * v287);
              if (v270[v277] == 160) {
                float v289 = 1.0;
              }
              else {
                float v289 = 0.0;
              }
              float v290 = v288 + (float)(*(float *)&v271[v284] * v289);
              if (v274[v280] == 160) {
                float v291 = 1.0;
              }
              else {
                float v291 = 0.0;
              }
              float v292 = v290 + (float)(*(float *)&v276[v281] * v291);
              if (v274[v275] == 160) {
                float v293 = 1.0;
              }
              else {
                float v293 = 0.0;
              }
              float v294 = v292 + (float)(*(float *)&v276[4 * v275] * v293);
              if (v274[v277] == 160) {
                float v295 = 1.0;
              }
              else {
                float v295 = 0.0;
              }
              float v296 = v294 + (float)(*(float *)&v276[v284] * v295);
              *(float *)&v271[4 * v275] = v296;
              int v297 = v273[v280] == 160;
              if (v273[v275] == 160) {
                ++v297;
              }
              if (v273[v277] == 160) {
                ++v297;
              }
              if (v270[v280] == 160) {
                ++v297;
              }
              if (v270[v277] == 160) {
                ++v297;
              }
              if (v274[v280] == 160) {
                int v298 = v297 + 1;
              }
              else {
                int v298 = v297;
              }
              if (v274[v275] == 160) {
                ++v298;
              }
              if (v274[v277] == 160) {
                ++v298;
              }
              if (v298)
              {
                *(float *)&v271[4 * v275] = v296 / (float)v298;
                v270[v275] = -96;
                ++v269[v275];
              }
            }
            uint64_t v275 = v277;
          }
          while (v277 != v185 + 1);
        }
        while (v268);
      }
      if (v185)
      {
        size_t v299 = v605;
        do
        {
          v300 = &v660[v299 * v585];
          v301 = &v633[v299 * v632];
          v302 = &v636[v299 * __srcb];
          uint64_t v303 = v299-- + 1;
          v304 = &v633[v299 * v632];
          v305 = &v633[v303 * v632];
          size_t v306 = v185;
          v307 = &v636[v303 * __srcb];
          do
          {
            int v309 = v301[v306];
            if (v309 != 32 && (v309 & 0x10) == 0)
            {
              size_t v308 = v306 - 1;
            }
            else
            {
              *(_DWORD *)&v302[4 * v306] = 0;
              size_t v308 = v306 - 1;
              uint64_t v311 = 4 * (v306 - 1);
              if (v304[v306 - 1] == 160) {
                float v312 = 1.0;
              }
              else {
                float v312 = 0.0;
              }
              if (v304[v306] == 160) {
                float v313 = 1.0;
              }
              else {
                float v313 = 0.0;
              }
              size_t v314 = v306 + 1;
              uint64_t v315 = 4 * (v306 + 1);
              if (v304[v306 + 1] == 160) {
                float v316 = 1.0;
              }
              else {
                float v316 = 0.0;
              }
              float v317 = (float)((float)(*(float *)&v636[4 * v306 + v299 * __srcb] * v313)
                           + (float)(*(float *)&v636[v299 * __srcb + v311] * v312))
                   + (float)(*(float *)&v636[v299 * __srcb + v315] * v316);
              if (v301[v308] == 160) {
                float v318 = 1.0;
              }
              else {
                float v318 = 0.0;
              }
              float v319 = v317 + (float)(*(float *)&v302[v311] * v318);
              if (v301[v314] == 160) {
                float v320 = 1.0;
              }
              else {
                float v320 = 0.0;
              }
              float v321 = v319 + (float)(*(float *)&v302[v315] * v320);
              if (v305[v308] == 160) {
                float v322 = 1.0;
              }
              else {
                float v322 = 0.0;
              }
              float v323 = v321 + (float)(*(float *)&v307[v311] * v322);
              if (v305[v306] == 160) {
                float v324 = 1.0;
              }
              else {
                float v324 = 0.0;
              }
              float v325 = v323 + (float)(*(float *)&v307[4 * v306] * v324);
              if (v305[v314] == 160) {
                float v326 = 1.0;
              }
              else {
                float v326 = 0.0;
              }
              float v327 = v325 + (float)(*(float *)&v307[v315] * v326);
              *(float *)&v302[4 * v306] = v327;
              int v328 = v304[v308] == 160;
              if (v304[v306] == 160) {
                ++v328;
              }
              if (v304[v314] == 160) {
                ++v328;
              }
              if (v301[v308] == 160) {
                ++v328;
              }
              if (v301[v314] == 160) {
                ++v328;
              }
              if (v305[v308] == 160) {
                ++v328;
              }
              if (v305[v306] == 160) {
                ++v328;
              }
              if (v305[v314] == 160) {
                ++v328;
              }
              if (v328)
              {
                *(float *)&v302[4 * v306] = v327 / (float)v328;
                v301[v306] = -96;
                ++v300[v306];
              }
            }
            size_t v306 = v308;
          }
          while (v308);
        }
        while (v299);
      }
      goto LABEL_426;
    }
LABEL_446:
    CVPixelBufferUnlockBaseAddress(v607, 0);
    CVPixelBufferUnlockBaseAddress(v617, 0);
    CVPixelBufferUnlockBaseAddress(v614, 0);
    CVPixelBufferUnlockBaseAddress(v611, 0);
    CVPixelBufferUnlockBaseAddress(v609, 0);
    CVPixelBufferUnlockBaseAddress(v620, 0);
    CVPixelBufferUnlockBaseAddress(v230, 0);
    CVPixelBufferUnlockBaseAddress(v229, 0);
    CVPixelBufferUnlockBaseAddress(v228, 0);
    CVPixelBufferUnlockBaseAddress(v227, 0);
    CVPixelBufferUnlockBaseAddress(v226, 0);
    v340 = (__CVBuffer *)*((void *)v671 + 24);
    v341 = (__CVBuffer *)*((void *)v671 + 17);
    CVPixelBufferLockBaseAddress(v340, 0);
    CVPixelBufferLockBaseAddress(v341, 0);
    v342 = (float *)CVPixelBufferGetBaseAddress(v341);
    int v343 = CVPixelBufferGetHeight(v341);
    unsigned int v344 = CVPixelBufferGetWidth(v341);
    size_t v345 = CVPixelBufferGetBytesPerRow(v341);
    v346 = (float *)CVPixelBufferGetBaseAddress(v340);
    CVPixelBufferGetHeight(v340);
    CVPixelBufferGetWidth(v340);
    size_t v347 = CVPixelBufferGetBytesPerRow(v340);
    if (v343 >= 1 && (int)v344 >= 1)
    {
      uint64_t v349 = 0;
      float v350 = *((float *)v671 + 27);
      float v351 = *((float *)v671 + 24) + (float)((float)(*((float *)v671 + 21) - *((float *)v671 + 24)) * v350);
      float v352 = *((float *)v671 + 25) + (float)((float)(*((float *)v671 + 22) - *((float *)v671 + 25)) * v350);
      float v353 = *((float *)v671 + 26) + (float)((float)(*((float *)v671 + 23) - *((float *)v671 + 26)) * v350);
      float v354 = (float)(*v671 - 1) * 0.5;
      float v355 = (float)(v671[1] - 1) * 0.5;
      float v356 = sqrtf((float)(v355 * v355) + (float)(v354 * v354));
      int v357 = (__int16)v671[3];
      float v358 = -v355;
      int v359 = (__int16)v671[2];
      float v360 = -v354;
      v348.i32[0] = 2139095039;
      v361 = v346;
      int v362 = v357;
      do
      {
        uint64_t v363 = 0;
        int v364 = v362;
        v362 += v671[7];
        if (v349 >= v343 - 1) {
          int v362 = v671[9] + v357;
        }
        float v365 = v358 + (float)((float)(v364 + v362 - 1) * 0.5);
        float v366 = v365 * v365;
        int v367 = v359;
        do
        {
          int v368 = v367 + v671[6];
          if (v363 >= (int)(v344 - 1)) {
            int v368 = v671[8] + v359;
          }
          float v369 = sqrtf(v366+ (float)((float)(v360 + (float)((float)(v367 + v368 - 1) * 0.5))* (float)(v360 + (float)((float)(v367 + v368 - 1) * 0.5))))/ v356;
          float v370 = (float)(v351 + (float)(v352 * v369)) + (float)(v353 * (float)(v369 * v369));
          if (v370 < *(float *)v348.i32) {
            *(float *)v348.i32 = v370;
          }
          v361[v363++] = v370;
          int v367 = v368;
        }
        while (v344 != v363);
        ++v349;
        v361 = (float *)((char *)v361 + v347);
      }
      while (v349 != v343);
      if (v344 > 7uLL)
      {
        uint64_t v376 = v344;
        float32x4_t v377 = (float32x4_t)vdupq_lane_s32(v348, 0);
        uint64_t v378 = v344 & 7;
        if ((v344 & 7) != 0)
        {
          uint64_t v379 = 0;
          v380 = (float32x4_t *)(v346 + 4);
          v381 = (float32x4_t *)(v342 + 4);
          v382 = v342;
          v383 = v346;
          do
          {
            if ((char *)v342 + v345 * v379 >= (char *)&v346[v376] + v347 * v379
              || (char *)v346 + v347 * v379 >= (char *)&v342[v376] + v345 * v379)
            {
              v385 = v381;
              v386 = v380;
              unint64_t v387 = v344 - (unint64_t)(v344 & 7);
              do
              {
                float32x4_t v388 = vsubq_f32(vaddq_f32(v377, *v385), *v386);
                v385[-1] = vsubq_f32(vaddq_f32(v377, v385[-1]), v386[-1]);
                float32x4_t *v385 = v388;
                v386 += 2;
                v385 += 2;
                v387 -= 8;
              }
              while (v387);
              unint64_t v389 = v344 - (unint64_t)(v344 & 7);
            }
            else
            {
              unint64_t v389 = 0;
            }
            unint64_t v390 = v344 - v389;
            uint64_t v391 = v389;
            v392 = &v383[v389];
            v393 = &v382[v391];
            do
            {
              float v394 = *v392++;
              float *v393 = (float)(*(float *)v348.i32 + *v393) - v394;
              ++v393;
              --v390;
            }
            while (v390);
            ++v379;
            v380 = (float32x4_t *)((char *)v380 + v347);
            v381 = (float32x4_t *)((char *)v381 + v345);
            v383 = (float *)((char *)v383 + v347);
            v382 = (float *)((char *)v382 + v345);
          }
          while (v379 != v343);
        }
        else
        {
          v562 = (float32x4_t *)(v346 + 4);
          v563 = (float32x4_t *)(v342 + 4);
          v564 = v342;
          v565 = v346;
          do
          {
            BOOL v566 = (char *)v342 + v345 * v378 >= (char *)&v346[v376] + v347 * v378
                || (char *)v346 + v347 * v378 >= (char *)&v342[v376] + v345 * v378;
            v567 = v563;
            v568 = v562;
            unint64_t v569 = v344 - (unint64_t)(v344 & 7);
            v570 = v564;
            v571 = v565;
            uint64_t v572 = v344;
            if (v566)
            {
              do
              {
                float32x4_t v573 = vsubq_f32(vaddq_f32(v377, *v567), *v568);
                v567[-1] = vsubq_f32(vaddq_f32(v377, v567[-1]), v568[-1]);
                float32x4_t *v567 = v573;
                v568 += 2;
                v567 += 2;
                v569 -= 8;
              }
              while (v569);
            }
            else
            {
              do
              {
                float v574 = *v571++;
                float *v570 = (float)(*(float *)v348.i32 + *v570) - v574;
                ++v570;
                --v572;
              }
              while (v572);
            }
            ++v378;
            v562 = (float32x4_t *)((char *)v562 + v347);
            v563 = (float32x4_t *)((char *)v563 + v345);
            v565 = (float *)((char *)v565 + v347);
            v564 = (float *)((char *)v564 + v345);
          }
          while (v378 != v343);
        }
      }
      else
      {
        for (uint64_t j = 0; j != v343; ++j)
        {
          v372 = v342;
          v373 = v346;
          uint64_t v374 = v344;
          do
          {
            float v375 = *v373++;
            float *v372 = (float)(*(float *)v348.i32 + *v372) - v375;
            ++v372;
            --v374;
          }
          while (v374);
          v346 = (float *)((char *)v346 + v347);
          v342 = (float *)((char *)v342 + v345);
        }
      }
    }
    CVPixelBufferUnlockBaseAddress(v340, 0);
    CVPixelBufferUnlockBaseAddress(v341, 0);
    v395 = (__CVBuffer *)*((void *)v671 + 17);
    CVPixelBufferLockBaseAddress(v395, 0);
    v396 = (float32x4_t *)CVPixelBufferGetBaseAddress(v395);
    size_t v397 = CVPixelBufferGetHeight(v395);
    size_t v398 = CVPixelBufferGetWidth(v395);
    size_t v399 = CVPixelBufferGetBytesPerRow(v395);
    float v400 = *((float *)v671 + 17);
    float v401 = *((float *)v671 + 18);
    float v402 = v400
         + (float)((float)(v401 - v400)
                 * (float)((float)(a10 - *((float *)v671 + 19)) / (float)(*((float *)v671 + 20) - *((float *)v671 + 19))));
    if (v401 >= v400) {
      float v403 = *((float *)v671 + 17);
    }
    else {
      float v403 = *((float *)v671 + 18);
    }
    if (v400 < v401) {
      float v400 = *((float *)v671 + 18);
    }
    if (v402 < v400) {
      float v400 = v402;
    }
    if (v402 < v403) {
      float v400 = v403;
    }
    if (v397 && v398)
    {
      if (v398 < 4)
      {
        v404 = &v396->f32[2];
        do
        {
          *(v404 - 2) = fmaxf(v400* (float)(*((float *)v671 + 16)+ (float)((float)((float)(*(v404 - 2) - *((float *)v671 + 30)) * *((float *)v671 + 8))/ (float)((float)(*((float *)v671 + 15)* (float)((float)(*((float *)v671 + 7) / *((float *)v671 + 9))* 0.5))* (float)(*((float *)v671 + 7) * *((float *)v671 + 10))))), 0.0);
          if (v398 != 1)
          {
            *(v404 - 1) = fmaxf(v400* (float)(*((float *)v671 + 16)+ (float)((float)((float)(*(v404 - 1) - *((float *)v671 + 30)) * *((float *)v671 + 8))/ (float)((float)(*((float *)v671 + 15)* (float)((float)(*((float *)v671 + 7) / *((float *)v671 + 9))* 0.5))* (float)(*((float *)v671 + 7) * *((float *)v671 + 10))))), 0.0);
            if (v398 != 2) {
              float *v404 = fmaxf(v400* (float)(*((float *)v671 + 16)+ (float)((float)((float)(*v404 - *((float *)v671 + 30)) * *((float *)v671 + 8))/ (float)((float)(*((float *)v671 + 15)* (float)((float)(*((float *)v671 + 7) / *((float *)v671 + 9))* 0.5))* (float)(*((float *)v671 + 7) * *((float *)v671 + 10))))), 0.0);
            }
          }
          v404 = (float *)((char *)v404 + v399);
          --v397;
        }
        while (v397);
        goto LABEL_522;
      }
      uint64_t v405 = 0;
      v406.i64[0] = 0x3F0000003F000000;
      v406.i64[1] = 0x3F0000003F000000;
      v407 = v396;
      while (2)
      {
        unint64_t v408 = 0;
        unint64_t v409 = (unint64_t)v396 + v405 * v399;
        unint64_t v410 = (unint64_t)v396->u64 + 4 * v398 + v405 * v399;
        BOOL v412 = v409 < (unint64_t)(v671 + 22) && (unint64_t)(v671 + 14) < v410;
        BOOL v414 = v409 < (unint64_t)(v671 + 34) && (unint64_t)(v671 + 30) < v410;
        if ((unint64_t)(v671 + 60) < v410 && v409 < (unint64_t)(v671 + 62))
        {
          v423 = (float *)v671;
          goto LABEL_520;
        }
        if (v412)
        {
          v423 = (float *)v671;
          goto LABEL_520;
        }
        v423 = (float *)v671;
        if (v414) {
          goto LABEL_643;
        }
        float32x4_t v416 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)(v671 + 60), 0);
        float32x4_t v417 = *(float32x4_t *)(v671 + 14);
        float32x4_t v418 = (float32x4_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmulq_f32(vmulq_f32(*(float32x4_t *)(v671 + 30), vmulq_f32(vdivq_f32(v417, (float32x4_t)vdupq_laneq_s32((int32x4_t)v417, 2)), v406)), vmulq_laneq_f32(v417, v417, 3)), 0);
        LODWORD(v419) = vshrq_n_u64((uint64x2_t)v417, 0x20uLL).u32[0];
        float32x4_t v420 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)(v671 + 32), 0);
        v421 = v407;
        unint64_t v422 = v398 & 0xFFFFFFFFFFFFFFFCLL;
        do
        {
          float32x4_t *v421 = vmaxnmq_f32(vmulq_n_f32(vaddq_f32(v420, vdivq_f32(vmulq_n_f32(vsubq_f32(*v421, v416), v419), v418)), v400), (float32x4_t)0);
          ++v421;
          v422 -= 4;
        }
        while (v422);
        unint64_t v408 = v398 & 0xFFFFFFFFFFFFFFFCLL;
        v423 = (float *)v671;
        if (v398 != (v398 & 0xFFFFFFFFFFFFFFFCLL))
        {
LABEL_643:
          do
          {
LABEL_520:
            v407->f32[v408] = fmaxf(v400* (float)(v423[16]+ (float)((float)((float)(v407->f32[v408] - v423[30]) * v423[8])/ (float)((float)(v423[15] * (float)((float)(v423[7] / v423[9]) * 0.5))* (float)(v423[7] * v423[10])))), 0.0);
            ++v408;
          }
          while (v398 != v408);
        }
        ++v405;
        v407 = (float32x4_t *)((char *)v407 + v399);
        if (v405 == v397) {
          break;
        }
        continue;
      }
    }
LABEL_522:
    CVPixelBufferUnlockBaseAddress(v395, 0);
    v621 = (__CVBuffer *)*((void *)v671 + 29);
    v623 = (__CVBuffer *)*((void *)v671 + 28);
    v618 = (__CVBuffer *)*((void *)v671 + 17);
    CVPixelBufferLockBaseAddress(v618, 1uLL);
    CVPixelBufferLockBaseAddress(a16, 0);
    CVPixelBufferLockBaseAddress(v623, 0);
    CVPixelBufferLockBaseAddress(v621, 0);
    v424 = (char *)CVPixelBufferGetBaseAddress(v618);
    int v626 = CVPixelBufferGetHeight(v618);
    int v615 = CVPixelBufferGetWidth(v618);
    size_t v425 = CVPixelBufferGetBytesPerRow(v618);
    v426 = (float32x4_t *)CVPixelBufferGetBaseAddress(a16);
    int v427 = CVPixelBufferGetHeight(a16);
    int v428 = CVPixelBufferGetWidth(a16);
    size_t v665 = CVPixelBufferGetBytesPerRow(a16);
    __srcc = (char *)CVPixelBufferGetBaseAddress(v623);
    size_t v429 = CVPixelBufferGetHeight(v623);
    int v612 = CVPixelBufferGetWidth(v623);
    size_t v430 = CVPixelBufferGetBytesPerRow(v623);
    v431 = (unsigned __int8 *)CVPixelBufferGetBaseAddress(v621);
    CVPixelBufferGetHeight(v621);
    CVPixelBufferGetWidth(v621);
    size_t v432 = CVPixelBufferGetBytesPerRow(v621);
    int v642 = v429;
    int v645 = v427;
    memcpy(v431, __srcc, v430 * v429);
    LODWORD(v440) = v671[24];
    v661 = v431;
    if (v671[24])
    {
      v441 = v431;
      unint64_t v442 = 0;
      unsigned int v443 = v671[23];
      do
      {
        if (v443 >= 2)
        {
          uint64_t v444 = 0;
          do
          {
            if (v441[v444] != v441[v444 + 1])
            {
              int v445 = *((unsigned __int8 *)v671 + 50);
              unsigned int v446 = (v444 - v445 + 1) & ~(((int)v444 - v445 + 1) >> 31);
              int v447 = v444 + v445;
              unsigned int v448 = v447 + 1 < v443 ? v447 + 1 : v443;
              if (v446 < v448)
              {
                bzero(&__srcc[v430 * v442 + v446], v448 + ~v446 + 1);
                unsigned int v443 = v671[23];
              }
            }
            ++v444;
          }
          while (v444 < (int)(v443 - 1));
          LODWORD(v440) = v671[24];
        }
        ++v442;
        v441 += v432;
      }
      while (v442 < v440);
    }
    else
    {
      unsigned int v443 = v671[23];
    }
    if (v443)
    {
      if (v430 == 1)
      {
        unint64_t v449 = 0;
        long long v433 = 0uLL;
        v450 = __srcc;
        while (v440 < 2)
        {
LABEL_540:
          ++v449;
          ++v450;
          if (v449 >= v443) {
            goto LABEL_582;
          }
        }
        uint64_t v451 = 0;
        int v452 = 1;
        while (2)
        {
          size_t v453 = v432 * v451++;
          if (v661[v449 + v453] != v661[v449 + v432 * v451])
          {
            int v454 = *((unsigned __int8 *)v671 + 50);
            LODWORD(v455) = v451 + v454;
            unint64_t v455 = (int)v451 + v454 >= v440 ? v440 : v455;
            if (((v451 - v454) & ~(((int)v451 - v454) >> 31)) < v455)
            {
              unint64_t v456 = (v452 - v454) & ~((v452 - v454) >> 31);
              unint64_t v457 = v455 - v456;
              if (v455 - v456 <= 7)
              {
                do
LABEL_566:
                  v450[v456++] = 0;
                while (v456 < v455);
              }
              else
              {
                if (v457 < 0x20)
                {
                  unint64_t v458 = 0;
                  goto LABEL_559;
                }
                unint64_t v458 = v457 & 0xFFFFFFFFFFFFFFE0;
                uint64_t v459 = v440;
                if (v440 >= (unint64_t)(v452 + v454)) {
                  uint64_t v459 = (v452 + v454);
                }
                unint64_t v460 = (v459 - v456) & 0xFFFFFFFFFFFFFFE0;
                v461 = &v450[v456];
                do
                {
                  *(_OWORD *)v461 = 0uLL;
                  *((_OWORD *)v461 + 1) = 0uLL;
                  v461 += 32;
                  v460 -= 32;
                }
                while (v460);
                if (v457 != v458)
                {
                  if ((v457 & 0x18) == 0)
                  {
                    v456 += v458;
                    goto LABEL_566;
                  }
LABEL_559:
                  unint64_t v462 = v457 & 0xFFFFFFFFFFFFFFF8;
                  unint64_t v440 = v440;
                  unint64_t v463 = (v452 + v454);
                  if (v440 >= v463) {
                    unint64_t v440 = v463;
                  }
                  unint64_t v464 = v458 - ((v440 - v456) & 0xFFFFFFFFFFFFFFF8);
                  unint64_t v465 = v458 + v456;
                  do
                  {
                    *(void *)&v450[v465] = 0;
                    v465 += 8;
                    v464 += 8;
                  }
                  while (v464);
                  if (v457 != v462)
                  {
                    v456 += v462;
                    goto LABEL_566;
                  }
                }
              }
              LODWORD(v440) = v671[24];
            }
          }
          ++v452;
          if (v451 >= (int)v440 - 1)
          {
            unsigned int v443 = v671[23];
            goto LABEL_540;
          }
          continue;
        }
      }
      unint64_t v466 = 0;
      v467 = __srcc;
      do
      {
        if (v440 >= 2)
        {
          uint64_t v468 = 0;
          int v469 = 1;
          do
          {
            size_t v470 = v432 * v468++;
            if (v661[v466 + v470] != v661[v466 + v432 * v468])
            {
              int v471 = *((unsigned __int8 *)v671 + 50);
              LODWORD(v472) = v468 + v471;
              unint64_t v472 = (int)v468 + v471 >= v440 ? v440 : v472;
              if (((v468 - v471) & ~(((int)v468 - v471) >> 31)) < v472)
              {
                unint64_t v473 = (v469 - v471) & ~((v469 - v471) >> 31);
                v474 = &v467[v430 * v473];
                do
                {
                  char *v474 = 0;
                  ++v473;
                  v474 += v430;
                }
                while (v473 < v472);
                LODWORD(v440) = v671[24];
              }
            }
            ++v469;
          }
          while (v468 < (int)v440 - 1);
          unsigned int v443 = v671[23];
        }
        ++v466;
        ++v467;
      }
      while (v466 < v443);
    }
LABEL_582:
    if (v645 >= 1)
    {
      v475 = 0;
      int v476 = (__int16)v671[5];
      float v477 = 0.5;
      float v478 = (float)v645;
      LOWORD(v434) = v671[11];
      float v479 = (float)v434;
      float v480 = -0.5;
      float v481 = (float)((float)((float)((float)v476 + 0.5) * (float)v645) / v479) + -0.5;
      float v662 = (float)((float)((float)((float)((float)(v671[9] + v476) + 0.5) * (float)v645) / v479) + -0.5) - v481;
      int v482 = (__int16)v671[4];
      LOWORD(v435) = v671[10];
      float v483 = (float)v435;
      *(float *)&long long v433 = (float)((float)((float)((float)(v671[8] + v482) + 0.5) * (float)v428) / v483) + -0.5;
      float v484 = (float)((float)((float)((float)v482 + 0.5) * (float)v428) / v483) + -0.5;
      float v654 = (float)v626;
      float v650 = (float)(v626 - 1);
      int v485 = v642 - 1;
      *(float *)v436.i32 = (float)v612 / (float)v428;
      *(float *)v437.i32 = *(float *)v436.i32 * 0.5;
      *(float *)v438.i32 = (float)v615 / (float)(*(float *)&v433 - v484);
      *(float *)v439.i32 = (float)((float)(0.5 - v484) * *(float *)v438.i32) + -0.5;
      float32x4_t v486 = (float32x4_t)vdupq_lane_s32(v436, 0);
      float32x4_t v487 = (float32x4_t)vdupq_lane_s32(v437, 0);
      uint32x4_t v488 = (uint32x4_t)vdupq_n_s32((float)((float)v612 + -1.0));
      float32x4_t v489 = (float32x4_t)vdupq_lane_s32(v438, 0);
      float32x4_t v490 = (float32x4_t)vdupq_lane_s32(v439, 0);
      *(float *)&long long v433 = (float)v615 + -1.0;
      float32x4_t v491 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v433, 0);
      int v630 = v428 / 4;
      __asm { FMOV            V28.4S, #1.0 }
      int v495 = (unsigned __int16)v626 - 1;
      int32x4_t v496 = (int32x4_t)vcvtq_u32_f32(_Q28);
      uint32x4_t v497 = vcvtq_u32_f32(v491);
      int v498 = (unsigned __int16)v615 - 1;
      unint64_t v499 = v645;
      uint64_t v500 = v428;
      unsigned int v501 = (unsigned __int16)(v626 - 1);
      float32x4_t v502 = 0uLL;
      int __na = v428;
      float v637 = (float)v645;
      float v634 = v481;
      unint64_t v627 = v645;
      v503.i64[0] = 0x4000000040;
      v503.i64[1] = 0x4000000040;
      v504.i64[0] = 0x2000000020;
      v504.i64[1] = 0x2000000020;
      v505.i64[0] = 0x4500000045000000;
      v505.i64[1] = 0x4500000045000000;
      do
      {
        int v506 = (int)(float)((float)((float)((float)(int)v475 + v477) * (float)v642) / v478) & ~((int)(float)((float)((float)((float)(int)v475 + v477) * (float)v642) / v478) >> 31);
        if (v506 >= v485) {
          int v506 = v485;
        }
        v507 = &__srcc[v430 * v506];
        float v508 = fmaxf((float)((float)((float)((float)((float)(int)v475 - v481) + v477) * v654) / v662) + v480, 0.0);
        if (v508 >= v650) {
          float v509 = v650;
        }
        else {
          float v509 = v508;
        }
        uint64_t v510 = (int)v509;
        v511 = &v424[v425 * v510];
        if ((unsigned __int16)(v510 + 1) >= v501) {
          uint64_t v512 = v501;
        }
        else {
          uint64_t v512 = (unsigned __int16)(v510 + 1);
        }
        float v513 = (float)v510;
        if (v428 < 4)
        {
          unint64_t v514 = 0;
          if (v428 > 0) {
            goto LABEL_599;
          }
        }
        else
        {
          unint64_t v514 = 0;
          v515 = (const float *)(v671 + 32);
          int8x16_t v516 = (int8x16_t)vld1q_dup_f32(v515);
          v517 = v424;
          size_t v518 = v425;
          v519 = &v424[v425 * v512];
          float v520 = (float)(v513 + 1.0) - v509;
          float v646 = v509;
          float v521 = v509 - v513;
          int v522 = v630;
          v523 = v426;
          do
          {
            v524.i32[0] = v514;
            v524.i32[1] = v514 + 1;
            float32x4_t v525 = vcvtq_f32_s32(vmovn_hight_s64(v524, (int64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v514), (int8x16_t)xmmword_1BA86C240)));
            float32x4_t v526 = vminq_f32(v491, vmaxq_f32(vmlaq_f32(v490, v489, v525), v502));
            float32x4_t v527 = (float32x4_t)vcvtq_u32_f32(v526);
            float32x4_t v528 = (float32x4_t)vminq_u32(v497, (uint32x4_t)vaddq_s32(v496, (int32x4_t)v527));
            float32x4_t v529 = vcvtq_f32_u32((uint32x4_t)v527);
            float32x4_t v530 = (float32x4_t)vzip2q_s32((int32x4_t)v527, (int32x4_t)v528);
            uint64_t v531 = 4 * v527.u32[0];
            uint64_t v532 = 4 * v528.u32[0];
            uint64_t v533 = 4 * v527.u32[1];
            uint64_t v534 = 4 * v528.u32[1];
            uint64_t v535 = 4 * v530.u32[0];
            v527.i32[0] = *(_DWORD *)&v511[v531];
            uint64_t v536 = 4 * v530.u32[2];
            v527.i32[1] = *(_DWORD *)&v511[v533];
            v527.i32[2] = *(_DWORD *)&v511[v535];
            uint64_t v537 = 4 * v530.u32[1];
            v527.i32[3] = *(_DWORD *)&v511[v536];
            v528.i32[0] = *(_DWORD *)&v511[v532];
            v528.i32[1] = *(_DWORD *)&v511[v534];
            v530.i32[0] = *(_DWORD *)&v519[v531];
            uint64_t v538 = 4 * v530.u32[3];
            v530.i32[1] = *(_DWORD *)&v519[v533];
            v530.i32[2] = *(_DWORD *)&v519[v535];
            v530.i32[3] = *(_DWORD *)&v519[v536];
            v539.i32[0] = *(_DWORD *)&v519[v532];
            v539.i32[1] = *(_DWORD *)&v519[v534];
            float32x4_t v540 = vsubq_f32(v526, v529);
            float32x4_t v541 = vsubq_f32(_Q28, v540);
            v528.i32[2] = *(_DWORD *)&v511[v537];
            v539.i32[2] = *(_DWORD *)&v519[v537];
            uint32x4_t v542 = vminq_u32(v488, vcvtq_u32_f32(vmlaq_f32(v487, v486, v525)));
            v528.i32[3] = *(_DWORD *)&v511[v538];
            uint64_t v543 = v542.u32[0];
            v539.i32[3] = *(_DWORD *)&v519[v538];
            v542.i32[0] = v542.i32[2];
            LODWORD(v533) = v507[v542.u32[1]];
            v542.i8[0] = v507[v542.u32[2]];
            v542.i32[1] = v507[v542.u32[3]];
            float32x4_t v544 = vmlaq_f32(vmlaq_f32(vmulq_f32(vmulq_n_f32(v541, v520), v527), v528, vmulq_n_f32(v540, v520)), v530, vmulq_n_f32(v541, v521));
            v528.i32[0] = v507[v543];
            v528.i32[1] = v533;
            *(int8x8_t *)&v528.u32[2] = vand_s8(*(int8x8_t *)v542.i8, (int8x8_t)0xFF000000FFLL);
            int8x16_t v545 = (int8x16_t)vmlaq_f32(v544, v539, vmulq_n_f32(v540, v521));
            float32x4_t v546 = (float32x4_t)vandq_s8(v516, (int8x16_t)vceqq_s32((int32x4_t)v528, v503));
            float32x4_t v547 = (float32x4_t)vandq_s8(v545, (int8x16_t)vceqq_s32((int32x4_t)v528, v504));
            int8x16_t v548 = (int8x16_t)vceqzq_s32((int32x4_t)v528);
            float32x4_t v502 = 0uLL;
            *v523++ = vaddq_f32(vaddq_f32(v547, v546), (float32x4_t)vandq_s8(v548, v505));
            v514 += 4;
            --v522;
          }
          while (v522);
          unint64_t v514 = v514;
          v424 = v517;
          size_t v425 = v518;
          int v428 = __na;
          float v477 = 0.5;
          float v478 = v637;
          float v480 = -0.5;
          float v481 = v634;
          int v485 = v642 - 1;
          unint64_t v499 = v627;
          float v509 = v646;
          float v513 = (float)v510;
          if ((int)v514 < __na)
          {
LABEL_599:
            uint64_t v549 = (v510 + 1);
            v550 = &v424[v425 * v549];
            float v551 = (float)(int)v549 - v509;
            float v552 = v509 - v513;
            do
            {
              if (((int)(float)(*(float *)v437.i32 + (float)((float)(int)v514 * *(float *)v436.i32)) & ~((int)(float)(*(float *)v437.i32 + (float)((float)(int)v514 * *(float *)v436.i32)) >> 31)) >= v612 - 1) {
                int v559 = v612 - 1;
              }
              else {
                int v559 = (int)(float)(*(float *)v437.i32 + (float)((float)(int)v514 * *(float *)v436.i32)) & ~((int)(float)(*(float *)v437.i32 + (float)((float)(int)v514 * *(float *)v436.i32)) >> 31);
              }
              float v560 = fmaxf(*(float *)v439.i32 + (float)((float)(int)v514 * *(float *)v438.i32), 0.0);
              if (v560 >= (float)(v615 - 1)) {
                float v560 = (float)(v615 - 1);
              }
              unsigned int v561 = (int)v560;
              if (v495 == v510)
              {
                if (v498 == v561) {
                  float v553 = *(float *)&v511[4 * v561];
                }
                else {
                  float v553 = (float)((float)(v560 - (float)v561) * *(float *)&v511[4 * v561 + 4])
                }
                       + (float)((float)((float)(int)(v561 + 1) - v560) * *(float *)&v511[4 * v561]);
              }
              else if (v498 == v561)
              {
                float v553 = (float)(v552 * *(float *)&v550[4 * (int)v560]) + (float)(v551 * *(float *)&v511[4 * (int)v560]);
              }
              else
              {
                float32x4_t v502 = 0uLL;
                float v553 = (float)((float)((float)((float)(v551 * (float)(v560 - (float)v561))
                                             * *(float *)&v511[4 * v561 + 4])
                                     + (float)((float)(v551 * (float)((float)(int)(v561 + 1) - v560))
                                             * *(float *)&v511[4 * v561]))
                             + (float)((float)(v552 * (float)((float)(int)(v561 + 1) - v560)) * *(float *)&v550[4 * v561]))
                     + (float)((float)(v552 * (float)(v560 - (float)v561)) * *(float *)&v550[4 * v561 + 4]);
              }
              int v554 = v507[v559];
              if (v554 == 64) {
                float v555 = 1.0;
              }
              else {
                float v555 = 0.0;
              }
              if (v554 == 32) {
                float v556 = 1.0;
              }
              else {
                float v556 = 0.0;
              }
              float v557 = (float)(v553 * v556) + (float)(v555 * *((float *)v671 + 16));
              if (v507[v559]) {
                float v558 = 0.0;
              }
              else {
                float v558 = 1.0;
              }
              v426->f32[v514++] = v557 + (float)(v558 * 2048.0);
            }
            while (v500 != v514);
          }
        }
        ++v475;
        v426 = (float32x4_t *)((char *)v426 + v665);
      }
      while (v475 != (char *)v499);
    }
    CVPixelBufferUnlockBaseAddress(v618, 1uLL);
    CVPixelBufferUnlockBaseAddress(a16, 0);
    CVPixelBufferUnlockBaseAddress(v623, 0);
    CVPixelBufferUnlockBaseAddress(v621, 0);
    int v42 = *((_DWORD *)v671 + 16);
  }
  else
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76BE8, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1E9F76BE8))
    {
      v577 = +[CVAPreferenceManager defaults];
      char v578 = [v577 BOOLForKey:@"singleCamSDoFPreviewLog"];

      byte_1E9F76BE0 = v578;
      __cxa_guard_release(&qword_1E9F76BE8);
    }
    if (byte_1E9F76BE0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/FocusStatsPostprocessing.mm";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "process";
      __int16 v678 = 1024;
      *(_DWORD *)v679 = 345;
      _os_log_impl(&dword_1BA813000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SingleCamSDoFPreviewLog: %s::%s line %d: Neither foreground nor background detected. Set uniform disparity.\n", buf, 0x1Cu);
    }
    CVPixelBufferLockBaseAddress(a16, 0);
    float v223 = CVPixelBufferGetBaseAddress(a16);
    size_t v224 = CVPixelBufferGetHeight(a16);
    CVPixelBufferGetWidth(a16);
    size_t v225 = CVPixelBufferGetBytesPerRow(a16);
    bzero(v223, v225 * v224);
    int v42 = 0;
    CVPixelBufferUnlockBaseAddress(a16, 0);
  }
LABEL_12:
  *a17 = v42;
}

void sub_1BA852DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  __cxa_guard_abort(&qword_1E9F76BE8);
  _Unwind_Resume(a1);
}

void *sub_1BA852F78(void *result, void *a2)
{
  v6[3] = *MEMORY[0x1E4F143B8];
  if (a2 != result)
  {
    uint64_t v3 = result;
    CFPropertyListRef v4 = (void *)result[3];
    size_t v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void *sub_1BA8531E0(void *result, void *a2)
{
  v6[3] = *MEMORY[0x1E4F143B8];
  if (a2 != result)
  {
    uint64_t v3 = result;
    CFPropertyListRef v4 = (void *)result[3];
    size_t v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

unsigned int sub_1BA853448(uint64_t a1, void *a2, int *a3)
{
  _H0 = *(_WORD *)(*a2 + 2 * *a3);
  __asm { FCVT            S0, H0 }
  return llroundf(_S0 * 255.0);
}

void sub_1BA853474(uint64_t a1, void *a2)
{
  *a2 = &unk_1F142F1D8;
}

void *sub_1BA853494()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &unk_1F142F1D8;
  return result;
}

void sub_1BA8534CC()
{
}

uint64_t sub_1BA8534E4(uint64_t a1, int *a2)
{
  return **(void **)(a1 + 8) + *(void *)(*(void *)(a1 + 8) + 24) * *a2;
}

uint64_t sub_1BA853504(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1F142F190;
  a2[1] = v2;
  return result;
}

void *sub_1BA853528(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1F142F190;
  result[1] = v3;
  return result;
}

void sub_1BA853570()
{
}

unsigned int sub_1BA853588(uint64_t a1, void *a2, int *a3)
{
  return llroundf(*(float *)(*a2 + 4 * *a3) * 255.0);
}

void sub_1BA8535B0(uint64_t a1, void *a2)
{
  *a2 = &unk_1F142F148;
}

void *sub_1BA8535D0()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &unk_1F142F148;
  return result;
}

void sub_1BA853608()
{
}

uint64_t sub_1BA853620(uint64_t a1, int *a2)
{
  return **(void **)(a1 + 8) + *(void *)(*(void *)(a1 + 8) + 24) * *a2;
}

uint64_t sub_1BA853640(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1F142F100;
  a2[1] = v2;
  return result;
}

void *sub_1BA853664(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1F142F100;
  result[1] = v3;
  return result;
}

void sub_1BA8536AC()
{
}

uint64_t sub_1BA8536C4(uint64_t a1, void *a2, int *a3)
{
  return *(unsigned __int8 *)(*a2 + *a3);
}

void sub_1BA8536DC(uint64_t a1, void *a2)
{
  *a2 = &unk_1F142F0B8;
}

void *sub_1BA8536FC()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &unk_1F142F0B8;
  return result;
}

void sub_1BA853734()
{
}

uint64_t sub_1BA85374C(uint64_t a1, int *a2)
{
  return **(void **)(a1 + 8) + *(void *)(*(void *)(a1 + 8) + 24) * *a2;
}

uint64_t sub_1BA85376C(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1F142F070;
  a2[1] = v2;
  return result;
}

void *sub_1BA853790(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1F142F070;
  result[1] = v3;
  return result;
}

void sub_1BA8537D8()
{
}

void sub_1BA85437C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA854664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA854A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BA854E54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA854E6C(uint64_t a1, uint64_t a2)
{
}

void sub_1BA85507C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA8553E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BA855484(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 56));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 64));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 72));
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (!v2) {
    uint64_t v2 = *(NSObject **)(*(void *)(a1 + 40) + 1024);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1BA85554C;
  block[3] = &unk_1E62288F8;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 80);
  id v6 = v3;
  uint64_t v7 = v4;
  void block[4] = *(void *)(a1 + 40);
  dispatch_async(v2, block);
}

intptr_t sub_1BA85554C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 1032);

  return dispatch_semaphore_signal(v3);
}

void sub_1BA8562C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41,void *a42,void *__p,uint64_t a44,int a45,__int16 a46,char a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51)
{
  __cxa_guard_abort(&qword_1E9F76548);

  _Unwind_Resume(a1);
}

void sub_1BA856548(uint64_t a1, void *a2)
{
  id v3 = a2;
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 56));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 64));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 72));
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 40);
  [v3 GPUEndTime];
  char v13 = 8;
  strcpy((char *)__p, "SDoF GPU");
  sub_1BA83BA90(v4, (uint64_t)__p, v5);
  if (v13 < 0)
  {
    operator delete(__p[0]);
    id v6 = *(NSObject **)(a1 + 40);
    if (v6) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = *(NSObject **)(*(void *)(a1 + 32) + 1024);
    goto LABEL_3;
  }
  id v6 = *(NSObject **)(a1 + 40);
  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1BA8566B0;
  v9[3] = &unk_1E62288F8;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 80);
  id v10 = v7;
  uint64_t v11 = v8;
  v9[4] = *(void *)(a1 + 32);
  dispatch_async(v6, v9);
}

void sub_1BA856688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

intptr_t sub_1BA8566B0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 1032);

  return dispatch_semaphore_signal(v3);
}

void sub_1BA85670C()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  *(_OWORD *)cStr = 0u;
  long long v9 = 0u;
  size_t v7 = 64;
  sysctlbyname("hw.model", cStr, &v7, 0, 0);
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (Mutable)
  {
    CFStringRef v2 = Mutable;
    CFStringAppendCString(Mutable, cStr, 0);
    CFIndex Length = CFStringGetLength(v2);
    if (CFStringHasSuffix(v2, @"AP")) {
      CFIndex v4 = Length - 2;
    }
    else {
      CFIndex v4 = 0;
    }
    if (CFStringHasSuffix(v2, @"DEV")) {
      v5.length = Length - 3;
    }
    else {
      v5.length = v4;
    }
    if (v5.length < 1)
    {
      id v6 = (void *)CFRetain(v2);
    }
    else
    {
      v5.id location = 0;
      id v6 = (void *)CFStringCreateWithSubstring(v0, v2, v5);
    }
    qword_1E9F76898 = (uint64_t)v6;
    CFRelease(v2);
  }
  if (!qword_1E9F76898) {
    qword_1E9F76898 = @"N51";
  }
}

void sub_1BA856B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA856CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1BA857050(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA857594(_Unwind_Exception *a1)
{
}

void sub_1BA8575C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1BA8577B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA857A08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1BA857BB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA857F14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8581E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA85832C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8584EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA858614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA858DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24)
{
  __cxa_guard_abort(&qword_1E9F76520);
  _Unwind_Resume(a1);
}

void sub_1BA858ED8(uint64_t a1, void *a2)
{
  id v3 = a2;
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 56));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 64));
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 40);
  [v3 GPUEndTime];
  char v13 = 14;
  strcpy((char *)__p, "AlphaMatte GPU");
  sub_1BA83BA90(v4, (uint64_t)__p, v5);
  if (v13 < 0)
  {
    operator delete(__p[0]);
    id v6 = *(NSObject **)(a1 + 40);
    if (v6) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = *(NSObject **)(*(void *)(a1 + 32) + 1040);
    goto LABEL_3;
  }
  id v6 = *(NSObject **)(a1 + 40);
  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1BA85903C;
  v9[3] = &unk_1E62288F8;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 72);
  id v10 = v7;
  uint64_t v11 = v8;
  v9[4] = *(void *)(a1 + 32);
  dispatch_async(v6, v9);
}

void sub_1BA859014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

intptr_t sub_1BA85903C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 1048);

  return dispatch_semaphore_signal(v3);
}

void sub_1BA859B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1BA859B90(uint64_t a1, void *a2)
{
  id v3 = a2;
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 56));
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 40);
  [v3 GPUEndTime];
  char v13 = 15;
  strcpy((char *)__p, "DisparityPP GPU");
  sub_1BA83BA90(v4, (uint64_t)__p, v5);
  if (v13 < 0)
  {
    operator delete(__p[0]);
    id v6 = *(NSObject **)(a1 + 40);
    if (v6) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = *(NSObject **)(*(void *)(a1 + 32) + 1040);
    goto LABEL_3;
  }
  id v6 = *(NSObject **)(a1 + 40);
  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1BA859CEC;
  v9[3] = &unk_1E62288F8;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 64);
  id v10 = v7;
  uint64_t v11 = v8;
  v9[4] = *(void *)(a1 + 32);
  dispatch_async(v6, v9);
}

void sub_1BA859CC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

intptr_t sub_1BA859CEC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 1048);

  return dispatch_semaphore_signal(v3);
}

void sub_1BA859EEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA859F48(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 40);
  [a2 GPUEndTime];
  double v5 = v4;
  __p = operator new(0x19uLL);
  long long v12 = xmmword_1BA86C1F0;
  strcpy((char *)__p, "personSegmentationRatio");
  sub_1BA83BA90(v3, (uint64_t)&__p, v5);
  if (SHIBYTE(v12) < 0) {
    operator delete(__p);
  }
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 1096) contents];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1BA85A08C;
  block[3] = &unk_1E62288A8;
  id v7 = *(NSObject **)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = v6;
  dispatch_async(v7, block);
}

void sub_1BA85A070(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1BA85A08C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(float))(result + 16))(**(float **)(a1 + 40));
  }
  return result;
}

void sub_1BA85A254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA85A3D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA85A6A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA85A898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA85A9E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA85AC18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA85AE14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA85AF40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA85B160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA85B288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA85B750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BA85B9B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA85BB90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA85BD08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA85BE84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA85BF8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA85C0C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA85C154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA85C204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA85C2B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA85C364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA85C530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA85C61C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)VideoMattingMetal;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA85E4FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44)
{
  if (__p) {
    operator delete(__p);
  }
  sub_1BA85EAA4(&a27);

  _Unwind_Resume(a1);
}

id sub_1BA85E8F8(id **a1, void *a2, char a3)
{
  id v5 = a2;
  char v8 = a3;
  uint64_t v6 = (void *)[**a1 copy];
  [v6 setConstantValue:&v8 type:53 withName:v5];

  return v6;
}

void sub_1BA85E970(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1BA85E98C(void *a1, uint64_t a2, unint64_t a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a3)
  {
    if (a3 >= 0xAAAAAAAAAAAAAABLL) {
      sub_1BA81F974();
    }
    uint64_t v5 = 3 * a3;
    uint64_t v6 = operator new(24 * a3);
    *a1 = v6;
    a1[1] = v6;
    a1[2] = &v6[v5];
    uint64_t v7 = a2 + v5 * 8;
    do
    {
      char v8 = *(void **)(a2 + 8);
      *uint64_t v6 = *(void *)a2;
      v6[1] = v8;
      v6[2] = *(id *)(a2 + 16);
      v6 += 3;
      a2 += 24;
    }
    while (a2 != v7);
    a1[1] = v6;
  }
  return a1;
}

void *sub_1BA85EA34(void *a1, const void *a2, unint64_t a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a3)
  {
    if (a3 >> 59) {
      abort();
    }
    size_t v5 = 32 * a3;
    uint64_t v6 = (char *)operator new(32 * a3);
    *a1 = v6;
    a1[1] = v6;
    uint64_t v7 = &v6[v5];
    a1[2] = &v6[v5];
    memmove(v6, a2, v5);
    a1[1] = v7;
  }
  return a1;
}

void **sub_1BA85EAA4(void **a1)
{
  uint64_t v2 = (id *)*a1;
  if (*a1)
  {
    uint64_t v3 = (id *)a1[1];
    double v4 = *a1;
    if (v3 != v2)
    {
      do
      {

        v3 -= 3;
      }
      while (v3 != v2);
      double v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void sub_1BA85ED5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA85F01C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA85F220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA85F420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA85F4A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA85F748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA85F86C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA85FC7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  uint64_t v19 = v16;

  _Unwind_Resume(a1);
}

void sub_1BA85FF00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA860044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA860180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA86031C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA860478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA860874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

id *sub_1BA8608CC(id *a1)
{
  return a1;
}

uint64_t sub_1BA860930(uint64_t a1, CVPixelBufferRef pixelBuffer, __CVBuffer *a3)
{
  CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(a1 + 48), 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  CVPixelBufferGetHeight(pixelBuffer);
  CVPixelBufferGetWidth(pixelBuffer);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  char v8 = (char *)CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 48));
  size_t Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 48));
  CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 48));
  size_t v10 = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 48));
  if ((uint64_t)(v10 * Height) >= 1) {
    memset_pattern16(v8, &unk_1BA86C270, 4 * (((v10 * Height) >> 2) - (v10 * Height > 3)) + 4);
  }
  uint64_t v11 = *(int *)(a1 + 32);
  uint64_t v12 = *(int *)(a1 + 8);
  if ((int)v11 < (int)v12)
  {
    uint64_t v13 = *(int *)(a1 + 28);
    uint64_t v14 = *(int *)(a1 + 4);
    if ((int)v13 < (int)v14)
    {
      size_t v15 = v10 * v11;
      uint64_t v16 = v14 - v13;
      if ((unint64_t)(v14 - v13) >= 8)
      {
        uint64_t v61 = 0;
        uint64_t v62 = &v8[4 * v13 + v15];
        uint64_t v63 = (uint64_t)&v8[4 * v13 + 16 + v15];
        int v64 = (long long *)(BaseAddress + 16);
        int v65 = &v8[v15];
        unsigned int v66 = &BaseAddress[-4 * v13];
        do
        {
          uint64_t v67 = v13;
          if ((unint64_t)(&v62[v10 * v61] - &BaseAddress[BytesPerRow * v61]) < 0x20) {
            goto LABEL_42;
          }
          int v68 = v64;
          int v69 = (_OWORD *)v63;
          unint64_t v70 = v16 & 0xFFFFFFFFFFFFFFF8;
          do
          {
            long long v71 = *v68;
            *(v69 - 1) = *(v68 - 1);
            *int v69 = v71;
            v69 += 2;
            v68 += 2;
            v70 -= 8;
          }
          while (v70);
          uint64_t v67 = (v16 & 0xFFFFFFFFFFFFFFF8) + v13;
          if (v16 != (v16 & 0xFFFFFFFFFFFFFFF8))
          {
LABEL_42:
            uint64_t v72 = v14 - v67;
            uint64_t v73 = 4 * v67;
            int8x16_t v74 = &v65[4 * v67];
            float v75 = &v66[v73];
            do
            {
              int v76 = *(_DWORD *)v75;
              v75 += 4;
              *(_DWORD *)int8x16_t v74 = v76;
              v74 += 4;
              --v72;
            }
            while (v72);
          }
          ++v11;
          ++v61;
          v63 += v10;
          int v64 = (long long *)((char *)v64 + BytesPerRow);
          v65 += v10;
          v66 += BytesPerRow;
        }
        while (v11 != v12);
      }
      else
      {
        __n128 v17 = &v8[4 * v13 + v15];
        do
        {
          size_t v18 = (int *)BaseAddress;
          uint64_t v19 = v17;
          uint64_t v20 = v16;
          do
          {
            int v21 = *v18++;
            *(_DWORD *)uint64_t v19 = v21;
            v19 += 4;
            --v20;
          }
          while (v20);
          ++v11;
          v17 += v10;
          BaseAddress += BytesPerRow;
        }
        while (v11 != v12);
      }
    }
  }
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 48), 0);
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  if (*(_DWORD *)(a1 + 12) == *(_DWORD *)(a1 + 20) && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a1 + 24))
  {
    int v22 = 0;
    size_t v23 = a3;
  }
  else
  {
    size_t v23 = *(__CVBuffer **)(a1 + 56);
    int v22 = 1;
  }
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(a1 + 48), 1uLL);
  CVPixelBufferLockBaseAddress(v23, 0);
  src.data = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 48));
  src.height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 48));
  src.width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 48));
  src.rowBytes = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 48));
  v77.data = CVPixelBufferGetBaseAddress(v23);
  v77.height = CVPixelBufferGetHeight(v23);
  v77.width = CVPixelBufferGetWidth(v23);
  v77.rowBytes = CVPixelBufferGetBytesPerRow(v23);
  vImageRotate90_PlanarF(&src, &v77, *(unsigned char *)(a1 + 44), 0.0, 0);
  CVPixelBufferUnlockBaseAddress(v23, 0);
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 48), 1uLL);
  if (v22)
  {
    CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(a1 + 56), 1uLL);
    CVPixelBufferLockBaseAddress(a3, 0);
    float v24 = (char *)CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 56));
    size_t v25 = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 56));
    size_t Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 56));
    size_t v27 = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 56));
    float v28 = (char *)CVPixelBufferGetBaseAddress(a3);
    size_t v29 = CVPixelBufferGetHeight(a3);
    size_t v30 = CVPixelBufferGetWidth(a3);
    size_t v31 = CVPixelBufferGetBytesPerRow(a3);
    if (v29 && v30)
    {
      for (unint64_t i = 0; i != v29; ++i)
      {
        for (unint64_t j = 0; j != v30; ++j)
          *(_DWORD *)&v28[4 * j] = *(_DWORD *)&v24[4
                                                 * (unint64_t)(float)((float)((float)Width / (float)v30)
                                                                           * (float)j)
                                                 + v27
                                                 * (unint64_t)(float)((float)((float)v25 / (float)v29) * (float)i)];
        v28 += v31;
      }
    }
    CVPixelBufferUnlockBaseAddress(a3, 0);
    CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 56), 1uLL);
  }
  CVPixelBufferLockBaseAddress(a3, 0);
  int v34 = (char *)CVPixelBufferGetBaseAddress(a3);
  CVPixelBufferGetHeight(a3);
  CVPixelBufferGetWidth(a3);
  size_t v35 = CVPixelBufferGetBytesPerRow(a3);
  size_t v36 = v35;
  uint64_t v37 = *(unsigned int *)(a1 + 16);
  if ((int)v37 >= 1)
  {
    uint64_t v38 = *(int *)(a1 + 36);
    int v39 = *(_DWORD *)(a1 + 12);
    uint64_t v40 = v39 + ~v38;
    uint64_t v41 = v40 - 1;
    if ((int)v38 <= 0)
    {
      int v51 = v34;
      uint64_t v52 = *(unsigned int *)(a1 + 16);
      do
      {
        *(_DWORD *)&v51[4 * v40] = *(_DWORD *)&v51[4 * v41];
        v51 += v35;
        --v52;
      }
      while (v52);
    }
    else
    {
      uint64_t v42 = 0;
      int v43 = v39 - 1;
      uint64_t v44 = v39 - 1 + ~v38;
      float v45 = &v34[4 * v43];
      uint64_t v46 = v34;
      do
      {
        int v47 = &v34[v36 * v42];
        int v48 = v46;
        float v49 = v45;
        uint64_t v50 = v38;
        do
        {
          *v48++ = *(_DWORD *)&v47[4 * v38];
          *(_DWORD *)float v49 = *(_DWORD *)&v47[4 * v44];
          v49 -= 4;
          --v50;
        }
        while (v50);
        *(_DWORD *)&v47[4 * v40] = *(_DWORD *)&v47[4 * v41];
        ++v42;
        v45 += v36;
        uint64_t v46 = (_DWORD *)((char *)v46 + v36);
      }
      while (v42 != v37);
    }
  }
  LODWORD(v53) = *(_DWORD *)(a1 + 40);
  if ((int)v53 >= 1)
  {
    uint64_t v54 = 0;
    int v55 = -1;
    unint64_t v56 = v34;
    do
    {
      int v57 = *(_DWORD *)(a1 + 16);
      float v58 = &v34[v36 * (v55 + v57)];
      unint64_t v59 = &v34[v36 * (v57 - (int)v53 - 2)];
      memcpy(v56, &v34[v36 * (int)v53], v36);
      memcpy(v58, v59, v36);
      ++v54;
      uint64_t v53 = *(int *)(a1 + 40);
      v56 += v36;
      --v55;
    }
    while (v54 < v53);
    LODWORD(v37) = *(_DWORD *)(a1 + 16);
  }
  memcpy(&v34[v36 * ((int)v37 + ~v53)], &v34[v36 * ((int)v37 + ~v53 - 1)], v36);
  return CVPixelBufferUnlockBaseAddress(a3, 0);
}

uint64_t sub_1BA860EC0(uint64_t a1, CVPixelBufferRef pixelBuffer, __CVBuffer *a3)
{
  CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(a1 + 48), 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  CVPixelBufferGetHeight(pixelBuffer);
  CVPixelBufferGetWidth(pixelBuffer);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  char v8 = (char *)CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 48));
  size_t Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 48));
  CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 48));
  size_t v10 = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 48));
  size_t v11 = v10;
  if ((uint64_t)(v10 * Height) >= 1) {
    memset_pattern16(v8, &unk_1BA86C280, 2 * (((v10 * Height) >> 1) - (v10 * Height != 1)) + 2);
  }
  uint64_t v12 = *(int *)(a1 + 32);
  uint64_t v13 = *(int *)(a1 + 8);
  if ((int)v12 < (int)v13)
  {
    uint64_t v14 = *(int *)(a1 + 28);
    uint64_t v15 = *(int *)(a1 + 4);
    if ((int)v14 < (int)v15)
    {
      size_t v16 = v11 * v12;
      uint64_t v17 = v15 - v14;
      if ((unint64_t)(v15 - v14) >= 0x10)
      {
        uint64_t v62 = 0;
        uint64_t v63 = &v8[2 * v14 + v16];
        uint64_t v64 = (uint64_t)&v8[2 * v14 + 16 + v16];
        int v65 = (long long *)(BaseAddress + 16);
        unsigned int v66 = &v8[v16];
        uint64_t v67 = &BaseAddress[-2 * v14];
        do
        {
          uint64_t v68 = v14;
          if ((unint64_t)(&v63[v11 * v62] - &BaseAddress[BytesPerRow * v62]) < 0x20) {
            goto LABEL_42;
          }
          int v69 = v65;
          unint64_t v70 = (_OWORD *)v64;
          unint64_t v71 = v17 & 0xFFFFFFFFFFFFFFF0;
          do
          {
            long long v72 = *v69;
            *(v70 - 1) = *(v69 - 1);
            *unint64_t v70 = v72;
            v70 += 2;
            v69 += 2;
            v71 -= 16;
          }
          while (v71);
          uint64_t v68 = (v17 & 0xFFFFFFFFFFFFFFF0) + v14;
          if (v17 != (v17 & 0xFFFFFFFFFFFFFFF0))
          {
LABEL_42:
            uint64_t v73 = v15 - v68;
            uint64_t v74 = 2 * v68;
            float v75 = &v66[2 * v68];
            int v76 = &v67[v74];
            do
            {
              __int16 v77 = *(_WORD *)v76;
              v76 += 2;
              *(_WORD *)float v75 = v77;
              v75 += 2;
              --v73;
            }
            while (v73);
          }
          ++v12;
          ++v62;
          v64 += v11;
          int v65 = (long long *)((char *)v65 + BytesPerRow);
          v66 += v11;
          v67 += BytesPerRow;
        }
        while (v12 != v13);
      }
      else
      {
        size_t v18 = &v8[2 * v14 + v16];
        do
        {
          uint64_t v19 = (__int16 *)BaseAddress;
          uint64_t v20 = v18;
          uint64_t v21 = v17;
          do
          {
            __int16 v22 = *v19++;
            *(_WORD *)uint64_t v20 = v22;
            v20 += 2;
            --v21;
          }
          while (v21);
          ++v12;
          v18 += v11;
          BaseAddress += BytesPerRow;
        }
        while (v12 != v13);
      }
    }
  }
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 48), 0);
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  if (*(_DWORD *)(a1 + 12) == *(_DWORD *)(a1 + 20) && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a1 + 24))
  {
    int v23 = 0;
    float v24 = a3;
  }
  else
  {
    float v24 = *(__CVBuffer **)(a1 + 56);
    int v23 = 1;
  }
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(a1 + 48), 1uLL);
  CVPixelBufferLockBaseAddress(v24, 0);
  src.data = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 48));
  src.height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 48));
  src.width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 48));
  src.rowBytes = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 48));
  v78.data = CVPixelBufferGetBaseAddress(v24);
  v78.height = CVPixelBufferGetHeight(v24);
  v78.width = CVPixelBufferGetWidth(v24);
  v78.rowBytes = CVPixelBufferGetBytesPerRow(v24);
  vImageRotate90_Planar16F(&src, &v78, *(unsigned char *)(a1 + 44), 0, 0);
  CVPixelBufferUnlockBaseAddress(v24, 0);
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 48), 1uLL);
  if (v23)
  {
    CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(a1 + 56), 1uLL);
    CVPixelBufferLockBaseAddress(a3, 0);
    size_t v25 = (char *)CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 56));
    size_t v26 = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 56));
    size_t Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 56));
    size_t v28 = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 56));
    size_t v29 = (char *)CVPixelBufferGetBaseAddress(a3);
    size_t v30 = CVPixelBufferGetHeight(a3);
    size_t v31 = CVPixelBufferGetWidth(a3);
    size_t v32 = CVPixelBufferGetBytesPerRow(a3);
    if (v30 && v31)
    {
      for (unint64_t i = 0; i != v30; ++i)
      {
        for (unint64_t j = 0; j != v31; ++j)
          *(_WORD *)&v29[2 * j] = *(_WORD *)&v25[2
                                               * (unint64_t)(float)((float)((float)Width / (float)v31) * (float)j)
                                               + v28
                                               * (unint64_t)(float)((float)((float)v26 / (float)v30) * (float)i)];
        v29 += v32;
      }
    }
    CVPixelBufferUnlockBaseAddress(a3, 0);
    CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 56), 1uLL);
  }
  CVPixelBufferLockBaseAddress(a3, 0);
  size_t v35 = (char *)CVPixelBufferGetBaseAddress(a3);
  CVPixelBufferGetHeight(a3);
  CVPixelBufferGetWidth(a3);
  size_t v36 = CVPixelBufferGetBytesPerRow(a3);
  size_t v37 = v36;
  uint64_t v38 = *(unsigned int *)(a1 + 16);
  if ((int)v38 >= 1)
  {
    uint64_t v39 = *(int *)(a1 + 36);
    int v40 = *(_DWORD *)(a1 + 12);
    uint64_t v41 = v40 + ~v39;
    uint64_t v42 = v41 - 1;
    if ((int)v39 <= 0)
    {
      uint64_t v52 = v35;
      uint64_t v53 = *(unsigned int *)(a1 + 16);
      do
      {
        *(_WORD *)&v52[2 * v41] = *(_WORD *)&v52[2 * v42];
        v52 += v36;
        --v53;
      }
      while (v53);
    }
    else
    {
      uint64_t v43 = 0;
      int v44 = v40 - 1;
      uint64_t v45 = v40 - 1 + ~v39;
      uint64_t v46 = &v35[2 * v44];
      int v47 = v35;
      do
      {
        int v48 = &v35[v37 * v43];
        float v49 = v47;
        uint64_t v50 = v46;
        uint64_t v51 = v39;
        do
        {
          *v49++ = *(_WORD *)&v48[2 * v39];
          *(_WORD *)uint64_t v50 = *(_WORD *)&v48[2 * v45];
          v50 -= 2;
          --v51;
        }
        while (v51);
        *(_WORD *)&v48[2 * v41] = *(_WORD *)&v48[2 * v42];
        ++v43;
        v46 += v37;
        int v47 = (_WORD *)((char *)v47 + v37);
      }
      while (v43 != v38);
    }
  }
  LODWORD(v54) = *(_DWORD *)(a1 + 40);
  if ((int)v54 >= 1)
  {
    uint64_t v55 = 0;
    int v56 = -1;
    int v57 = v35;
    do
    {
      int v58 = *(_DWORD *)(a1 + 16);
      unint64_t v59 = &v35[v37 * (v56 + v58)];
      int64_t v60 = &v35[v37 * (v58 - (int)v54 - 2)];
      memcpy(v57, &v35[v37 * (int)v54], v37);
      memcpy(v59, v60, v37);
      ++v55;
      uint64_t v54 = *(int *)(a1 + 40);
      v57 += v37;
      --v56;
    }
    while (v55 < v54);
    LODWORD(v38) = *(_DWORD *)(a1 + 16);
  }
  memcpy(&v35[v37 * ((int)v38 + ~v54)], &v35[v37 * ((int)v38 + ~v54 - 1)], v37);
  return CVPixelBufferUnlockBaseAddress(a3, 0);
}

void sub_1BA861838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA861A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA861C9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA861DEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA861E2C(uint64_t *a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 threadExecutionWidth];
  unint64_t v4 = [v6 maxTotalThreadsPerThreadgroup];
  unint64_t v5 = [v6 threadExecutionWidth];
  *a1 = v3;
  a1[1] = v4 / v5;
  a1[2] = 1;
}

void sub_1BA861EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_1BA861EB8(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a5;
  if (!v12)
  {
    uint64_t v13 = (void *)[v9 newFunctionWithName:v11];
    uint64_t v19 = NSString;
    uint64_t v20 = [NSString stringWithFormat:@"Unable to create function (%@)", v11];
    uint64_t v21 = [v19 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "id<MTLFunction> functionFromLibrary(__strong id<MTLLibrary> _Nonnull, __strong id<MTLPipelineLibrarySPI> _Nonnull, NSString *__strong _Nonnull, NSError *__autoreleasing * _Nullable, MTLFunctionConstantValues * _Nullable __strong)", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/metal/MetalHelpers.mm", 88, v20];
    sub_1BA8161F4(v13 == 0, a4, 0, 4294944382, v21);

    id v14 = 0;
    id v22 = 0;
    if (!v13) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  id v24 = 0;
  uint64_t v13 = (void *)[v9 newFunctionWithName:v11 constantValues:v12 pipelineLibrary:v10 error:&v24];
  id v14 = v24;
  uint64_t v15 = NSString;
  size_t v16 = [NSString stringWithFormat:@"Unable to create function (%@): %@", v11, v14];
  uint64_t v17 = [v15 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "id<MTLFunction> functionFromLibrary(__strong id<MTLLibrary> _Nonnull, __strong id<MTLPipelineLibrarySPI> _Nonnull, NSString *__strong _Nonnull, NSError *__autoreleasing * _Nullable, MTLFunctionConstantValues * _Nullable __strong)", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/metal/MetalHelpers.mm", 71, v16];
  sub_1BA8161F4(v13 == 0, a4, v14, 4294944382, v17);

  if (v13)
  {
    if (v14)
    {
      id v18 = [v14 description];
      syslog(4, "Metal shader compilation warnings: %s", (const char *)[v18 UTF8String]);
    }
LABEL_6:
    id v22 = v13;
    goto LABEL_8;
  }
  id v22 = 0;
LABEL_8:

  return v22;
}

void sub_1BA862108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1BA86216C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:a1 width:a2 height:a3 mipmapped:0];
  [v3 setUsage:3];
  [v3 setResourceOptions:0];

  return v3;
}

void sub_1BA8621D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1BA8621E4(__CVBuffer *a1)
{
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  uint64_t v3 = PixelFormatType;
  if ((int)PixelFormatType > 1278226535)
  {
    if (PixelFormatType == 1751411059 || PixelFormatType == 1278226536)
    {
      uint64_t v4 = 25;
      goto LABEL_11;
    }
  }
  else
  {
    if (PixelFormatType == 1278226488)
    {
      uint64_t v4 = 10;
      goto LABEL_11;
    }
    if (PixelFormatType == 1278226534)
    {
      uint64_t v4 = 55;
LABEL_11:
      size_t Width = CVPixelBufferGetWidth(a1);
      id v9 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:v4 width:Width height:CVPixelBufferGetHeight(a1) mipmapped:0];
      [v9 setUsage:3];
      [v9 setResourceOptions:0];
      goto LABEL_12;
    }
  }
  unint64_t v5 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  id v6 = [NSNumber numberWithUnsignedInt:v3];
  char v7 = [v5 containsObject:v6];

  if (v7)
  {
    uint64_t v4 = 500;
    goto LABEL_11;
  }
  id v11 = NSString;
  id v12 = objc_msgSend(NSString, "stringWithFormat:", @"Unsupported pixel format type: %i", CVPixelBufferGetPixelFormatType(a1));
  uint64_t v13 = [v11 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "MTLTextureDescriptor *getMTLTextureDescriptor(CVPixelBufferRef _Nonnull)", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/metal/MetalHelpers.mm", 178, v12];
  sub_1BA8161F4(1, 0, 0, 4294944390, v13);

  id v9 = 0;
LABEL_12:

  return v9;
}

void sub_1BA8623B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1BA8623E0(__CVBuffer *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1BA8621E4(a1);
  unint64_t v5 = (void *)[v3 newTextureWithDescriptor:v4 iosurface:CVPixelBufferGetIOSurface(a1) plane:0];

  return v5;
}

void sub_1BA86245C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA862478(uint64_t *a1, __CVBuffer *a2, __CVBuffer *a3, void *a4)
{
  id v17 = a4;
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a2);
  char v8 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  id v9 = [NSNumber numberWithUnsignedInt:PixelFormatType];
  int v10 = [v8 containsObject:v9];
  id v11 = NSString;
  id v12 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  uint64_t v13 = [v11 stringWithFormat:@"Source format should be either of %@ but is %d", v12, PixelFormatType];
  id v14 = [v11 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "std::pair<id<MTLTexture>, id<MTLTexture>> getMTLTextureColorAlpha(const CVPixelBufferRef _Nonnull, const CVPixelBufferRef _Nonnull, __strong id<MTLDevice> _Nonnull)", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/metal/MetalHelpers.mm", 205, v13];
  sub_1BA8161F4(v10 ^ 1u, 0, 0, 4294944390, v14);

  if (v10)
  {
    uint64_t v15 = sub_1BA8623E0(a2, v17);
    uint64_t v16 = sub_1BA8623E0(a3, v17);
    *a1 = v15;
    a1[1] = v16;
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
  }
}

void sub_1BA8625F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  _Unwind_Resume(a1);
}

id sub_1BA862650(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v11 = a1;
  id v12 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:a2 width:a3 height:a4 mipmapped:0];
  [v12 setUsage:3];
  [v12 setResourceOptions:a5];
  uint64_t v13 = (void *)[v11 newTextureWithDescriptor:v12];

  id v14 = NSString;
  uint64_t v15 = [NSString stringWithFormat:@"[_Nonnull id<MTLDeviceSPI newTextureWithDescriptor:textureDescriptor(%lu, %lu, %lu)] is nil", a2, a3, a4];
  uint64_t v16 = [v14 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "id<MTLTexture> metalTexture(__strong id<MTLDeviceSPI> _Nonnull, MTLPixelFormat, NSUInteger, NSUInteger, MTLResourceOptions, NSError *__autoreleasing * _Nullable)", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/metal/MetalHelpers.mm", 237, v15];
  sub_1BA8161F4(v13 == 0, a6, 0, 4294944382, v16);

  return v13;
}

void sub_1BA86278C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1BA8627D0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t v5 = sub_1BA862650(a1, a2, a3, a4, 0, a5);

  return v5;
}

id sub_1BA862804(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    if (![v3 length])
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      id v12 = objc_msgSend(NSString, "stringWithUTF8String:", "id<MTLTexture> lutTextureFromData(NSData *__strong _Nonnull, __strong id<MTLDeviceSPI> _Nonnull)");
      [v11 handleFailureInFunction:v12 file:@"MetalHelpers.mm" lineNumber:331 description:@"Cube data length must not be zero"];
    }
    if (([v3 length] & 3) != 0)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      id v14 = objc_msgSend(NSString, "stringWithUTF8String:", "id<MTLTexture> lutTextureFromData(NSData *__strong _Nonnull, __strong id<MTLDeviceSPI> _Nonnull)");
      [v13 handleFailureInFunction:v14 file:@"MetalHelpers.mm" lineNumber:333 description:@"Cube data length must be a multiple of 4 bytes (rgba8)"];
    }
    unint64_t v5 = (unint64_t)[v3 length] >> 2;
    int v6 = (int)cbrt((double)(int)v5);
    if (v6 * v6 * v6 != v5)
    {
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v16 = objc_msgSend(NSString, "stringWithUTF8String:", "id<MTLTexture> lutTextureFromData(NSData *__strong _Nonnull, __strong id<MTLDeviceSPI> _Nonnull)");
      [v15 handleFailureInFunction:v16 file:@"MetalHelpers.mm" lineNumber:338 description:@"Cube data number of entries must be a perfect cube"];
    }
    id v7 = objc_alloc_init(MEMORY[0x1E4F35330]);
    [v7 setTextureType:7];
    [v7 setHeight:v6];
    [v7 setWidth:v6];
    [v7 setDepth:v6];
    [v7 setPixelFormat:70];
    [v7 setArrayLength:1];
    [v7 setMipmapLevelCount:1];
    char v8 = (void *)[v4 newTextureWithDescriptor:v7];
    memset(v17, 0, 24);
    v17[3] = v6;
    v17[4] = v6;
    void v17[5] = v6;
    objc_msgSend(v8, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v17, 0, 0, objc_msgSend(v3, "bytes", 0, 0, 0, v6, v6, v6), 4 * v6, 4 * v6 * v6);
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void sub_1BA862AB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1BA862B0C(void *result, uint64_t a2, int a3)
{
  id v3 = result;
  if (*(unsigned char *)(a2 + 48))
  {
    result[3] = result;
    *uint64_t result = &unk_1F142EFE0;
  }
  else
  {
    if (a3)
    {
      if (++dword_1E9F76C14 == a3)
      {
        unint64_t v5 = objc_opt_new();
        [v5 setCaptureObject:*(void *)(a2 + 32)];
        int v6 = [MEMORY[0x1E4F351E0] sharedCaptureManager];
        [v6 startCaptureWithDescriptor:v5 error:0];
      }
    }
    uint64_t result = (void *)[*(id *)(a2 + 32) beginScope];
    *(unsigned char *)(a2 + 48) = 1;
    void *v3 = &unk_1F142F028;
    v3[1] = a2;
    v3[2] = &v7;
    v3[3] = v3;
  }
  return result;
}

void sub_1BA862BFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA862C18(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  [*(id *)(v2 + 32) endScope];
  if (dword_1E9F76C14 == **(_DWORD **)(a1 + 16))
  {
    id v3 = [MEMORY[0x1E4F351E0] sharedCaptureManager];
    [v3 stopCapture];
  }
  *(unsigned char *)(v2 + 48) = 0;
}

void sub_1BA862C7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 sub_1BA862C94(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1F142F028;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 sub_1BA862CBC(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_1F142F028;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

void sub_1BA862D08()
{
}

void sub_1BA862D2C(uint64_t a1, void *a2)
{
  *a2 = &unk_1F142EFE0;
}

void *sub_1BA862D4C()
{
  __n128 result = operator new(0x10uLL);
  *__n128 result = &unk_1F142EFE0;
  return result;
}

void sub_1BA862D84()
{
}

void sub_1BA862D9C(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v13 = a1;
  id v7 = a2;
  id v8 = a3;
  id v9 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:a4 width:16 height:12 mipmapped:0];
  int v10 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:a4 width:16 height:12 mipmapped:0];
  [v10 setUsage:3];
  id v11 = (void *)[v7 newTextureWithDescriptor:v9];
  id v12 = (void *)[v7 newTextureWithDescriptor:v10];
  [v13 encodeToCommandBuffer:v8 sourceTexture:v11 destinationTexture:v12];
}

void sub_1BA862EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v16 = v14;

  _Unwind_Resume(a1);
}

void sub_1BA862EEC()
{
}

uint64_t sub_1BA862EF4(uint64_t a1, float *a2, float a3)
{
  if (vabds_f32(*(float *)(a1 + 4), a3) >= *a2)
  {
    *(_DWORD *)a1 = 0;
    *(float *)(a1 + 4) = a3;
    return 1;
  }
  else if (a2[1] <= (float)*(unsigned int *)a1)
  {
    *(_DWORD *)a1 = 0;
    return 0;
  }
  else
  {
    ++*(_DWORD *)a1;
    return 1;
  }
}

uint64_t sub_1BA862F48(uint64_t a1, float *a2, float a3)
{
  if (vabds_f32(*(float *)(a1 + 4), a3) >= *a2)
  {
    int v4 = 0;
    *(float *)(a1 + 4) = a3;
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = 0;
    int v4 = *(_DWORD *)a1 + 1;
  }
  *(_DWORD *)a1 = v4;
  return v3;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1F40D8608](theString, suffix);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA310](info, data, size, releaseData);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

uint64_t CGImageWriteToFile()
{
  return MEMORY[0x1F40DAB18]();
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x1F40DFC78](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x1F40DFC80](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x1F40DFC98](image);
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

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1F40DFD78](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD98](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFDA0](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x1F40DFDC0](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFDC8](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1F40DFE40](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

uint64_t IOSurfaceAcceleratorCreate()
{
  return MEMORY[0x1F4124C48]();
}

uint64_t IOSurfaceAcceleratorTransformSurface()
{
  return MEMORY[0x1F4124C78]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
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

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

void std::length_error::~length_error(std::length_error *this)
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E608](this, __pos, __s, __n);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x1F417ECA0]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1F417EE88](retstr, __val);
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

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1F40C9B60](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
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

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

float acosf(float a1)
{
  MEMORY[0x1F40CA340](a1);
  return result;
}

long double atan(long double __x)
{
  MEMORY[0x1F40CA450](__x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x1F40CA468](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

long double cbrt(long double __x)
{
  MEMORY[0x1F40CA688](__x);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
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

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

float exp2f(float a1)
{
  MEMORY[0x1F40CBFF0](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

float fmodf(float a1, float a2)
{
  MEMORY[0x1F40CC1A8](a1, a2);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

float log2f(float a1)
{
  MEMORY[0x1F40CC8B0](a1);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

void objc_moveWeak(id *to, id *from)
{
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

float tanf(float a1)
{
  MEMORY[0x1F40CE428](a1);
  return result;
}

vImage_Error vImageMin_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, vImagePixelCount kernel_height, vImagePixelCount kernel_width, vImage_Flags flags)
{
  return MEMORY[0x1F40D2AB8](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, kernel_height, kernel_width, *(void *)&flags);
}

vImage_Error vImageRotate90_Planar16F(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, const Pixel_16F backColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2C68](src, dest, rotationConstant, backColor, *(void *)&flags);
}

vImage_Error vImageRotate90_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_F backColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2C80](src, dest, rotationConstant, *(void *)&flags, backColor);
}