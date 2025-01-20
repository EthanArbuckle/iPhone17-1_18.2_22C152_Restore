void sub_21B5A6A28()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:7];
  v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v3 = (void *)qword_267C58B30;
  qword_267C58B30 = v2;
}

void sub_21B5A7AE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5A7FF8()
{
  v4[6] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:6];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)qword_267C58B40;
  qword_267C58B40 = v2;
}

void sub_21B5A88D8(void *a1)
{
}

void sub_21B5A8D7C()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:7];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v3 = (void *)qword_267C58B50;
  qword_267C58B50 = v2;
}

void sub_21B5A934C()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:7];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v3 = (void *)qword_267C58B60;
  qword_267C58B60 = v2;
}

void sub_21B5A9AD8()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:7];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v3 = (void *)qword_267C58B70;
  qword_267C58B70 = v2;
}

void sub_21B5AA498()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:7];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v3 = (void *)qword_267C58B80;
  qword_267C58B80 = v2;
}

void sub_21B5AAAC8()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:9];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9, v10, v11);
  v3 = (void *)qword_267C58B90;
  qword_267C58B90 = v2;
}

void sub_21B5AB018()
{
  v4[6] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:6];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)qword_267C58BA0;
  qword_267C58BA0 = v2;
}

void sub_21B5AC5C0()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:7];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v3 = (void *)qword_267C58BB0;
  qword_267C58BB0 = v2;
}

void sub_21B5AC6C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5AC804(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5AC818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5AC830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5AC910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B5AC9D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5ACAE8(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_21B5ACB0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5ACB28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5ACB44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5ACB5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5ACB78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5ACB90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5ACC10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5ACC24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5ACCB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5ACCD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5ACCE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5ACE58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5ACF24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5AD0B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5AD150(void *a1)
{
}

void sub_21B5AD234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5AD248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5AD260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5AD444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5AD458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5AD468(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5AD478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5AD854()
{
  v4[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)qword_267C58BC0;
  qword_267C58BC0 = v2;
}

void sub_21B5AF184()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:7];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v3 = (void *)qword_267C58BD0;
  qword_267C58BD0 = v2;
}

void sub_21B5AFE98()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:7];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v3 = (void *)qword_267C58BE0;
  qword_267C58BE0 = v2;
}

void sub_21B5B06E8()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:3];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v3 = (void *)qword_267C58BF0;
  qword_267C58BF0 = v2;
}

void sub_21B5B18A4()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:7];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v3 = (void *)qword_267C58C00;
  qword_267C58C00 = v2;
}

void sub_21B5B6204(_Unwind_Exception *a1)
{
}

void sub_21B5B6214(_Unwind_Exception *a1)
{
}

void sub_21B5B6224(_Unwind_Exception *exception_object)
{
}

uint64_t sub_21B5BDEBC(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  memset(&v10[1], 0, sizeof(CMTime));
  if (v4) {
    [v4 timestamp];
  }
  memset(v10, 0, 24);
  if (v5) {
    [v5 timestamp];
  }
  CMTime time1 = v10[0];
  CMTime v8 = v10[1];
  uint64_t v6 = CMTimeCompare(&time1, &v8);

  return v6;
}

void sub_21B5BE3FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v18 = v11;
  if (a2 == 1)
  {
    id v12 = objc_begin_catch(exception_object);
    uint64_t v13 = NSString;
    v17 = [v12 description];
    v14 = [v13 stringWithFormat:@"Cannot add track to stream: %@"];

    uint64_t v15 = [MEMORY[0x263F087E8] movWriterInterfaceErrorWithMessage:v14 code:2];
    v16 = *(void **)(v10 + v18);
    *(void *)(v10 + v18) = v15;

    objc_end_catch();
    JUMPOUT(0x21B5BE3D8);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B5BEB64(_Unwind_Exception *a1)
{
}

void sub_21B5BEB74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5BEB88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5BEB9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id obj)
{
}

void sub_21B5BEBC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id obj)
{
}

void sub_21B5BEC5C(uint64_t a1, __CVBuffer *a2)
{
  id v5 = [*(id *)(a1 + 32) arrayFrom3x3Matrix:*(void *)(a1 + 40)];
  CVBufferSetAttachment(a2, (CFStringRef)*MEMORY[0x263F01028], v5, kCVAttachmentMode_ShouldPropagate);
  id v4 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  CVBufferSetAttachment(a2, @"ExposureTime", v4, kCVAttachmentMode_ShouldPropagate);
}

void sub_21B5BF120(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5BF134(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5BF14C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5BF160(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5BF174(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5BF368(_Unwind_Exception *a1)
{
}

void sub_21B5BF564(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5BF754(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5BF970(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5BFA28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C0F4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C0F60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C0F74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C0F88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C0F9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C0FB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C0FC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C0FD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C0FEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C1000(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C1144(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C1158(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C116C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C1184(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C14B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C14C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C14DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C14F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C1504(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C1518(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C152C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C1544(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21B5C1558(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 608);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:a2];
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 608) objectForKeyedSubscript:v6];

  if (v7) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v8 == 0;
  }
  if (v9)
  {
    if (v7) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10)
    {
      uint64_t v11 = -1;
    }
    else if (v7 | v8)
    {
      uint64_t v11 = [(id)v7 compare:v8];
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

void sub_21B5C1D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_21B5C1DA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B5C2018()
{
  v2[15] = *MEMORY[0x263EF8340];
  v2[0] = @"com.apple.reality.kind.data.imu800";
  v2[1] = @"com.apple.reality.kind.data.accelerometer";
  v2[2] = @"com.apple.reality.kind.data.gyroscope";
  v2[3] = @"com.apple.reality.kind.data.motion";
  v2[4] = @"com.apple.reality.kind.data.als";
  v2[5] = @"com.apple.reality.kind.data.wifi";
  v2[6] = @"com.apple.reality.kind.data.compass";
  v2[7] = @"RawAccelerometer";
  v2[8] = @"RawGyroscope";
  v2[9] = @"ALS";
  v2[10] = @"WiFi";
  v2[11] = @"Compass";
  v2[12] = @"Motion";
  v2[13] = @"com.apple.reality.kind.data.devicemotion";
  v2[14] = @"Location";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:15];
  v1 = (void *)qword_267C58C20;
  qword_267C58C20 = v0;
}

void sub_21B5C271C()
{
  v4[6] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  void v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:6];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)qword_267C58C30;
  qword_267C58C30 = v2;
}

id sub_21B5C3BD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4 = [MEMORY[0x263F087E8] appleCV3DMOVKitErrorWithDomain:@"com.apple.AppleCV3DMOVKit.readererror" message:a3 code:a4];
  NSLog(&cfstr_ErrorMovreader.isa, v4);
  return v4;
}

id sub_21B5C3C44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4 = [MEMORY[0x263F087E8] appleCV3DMOVKitErrorWithDomain:@"com.apple.AppleCV3DMOVKit.readerwarning" message:a3 code:a4];
  NSLog(&cfstr_WarningMovread.isa, v4);
  return v4;
}

id sub_21B5C3CB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4 = [MEMORY[0x263F087E8] appleCV3DMOVKitErrorWithDomain:@"com.apple.AppleCV3DMOVKit.writererror" message:a3 code:a4];
  NSLog(&cfstr_ErrorMovwriter.isa, v4);
  return v4;
}

id sub_21B5C3D1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4 = [MEMORY[0x263F087E8] appleCV3DMOVKitErrorWithDomain:@"com.apple.AppleCV3DMOVKit.writerwarning" message:a3 code:a4];
  NSLog(&cfstr_WarningMovwrit.isa, v4);
  return v4;
}

id sub_21B5C3D88(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = v8;
  if (v8)
  {
    uint64_t v13 = *MEMORY[0x263F08320];
    v14[0] = v8;
    BOOL v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  }
  else
  {
    BOOL v10 = 0;
  }
  uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:v7 code:a5 userInfo:v10];

  return v11;
}

void sub_21B5C3F2C()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:7];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v3 = (void *)qword_267C58C40;
  qword_267C58C40 = v2;
}

void sub_21B5C4654()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:7];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v3 = (void *)qword_267C58C60;
  qword_267C58C60 = v2;
}

void sub_21B5C4AC0()
{
}

void sub_21B5C4AD4(std::string *a1@<X8>)
{
  CFStringRef v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    CFStringRef v3 = v2;
    sub_21B5C5A3C(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21B5C4B30(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C4B48(std::string *a1@<X8>)
{
  CFStringRef v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    CFStringRef v3 = v2;
    sub_21B5C5A3C(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21B5C4BA4(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C4BBC(std::string *a1@<X8>)
{
  CFStringRef v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    CFStringRef v3 = v2;
    sub_21B5C5A3C(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21B5C4C18(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C4C30(std::string *a1@<X8>)
{
  CFStringRef v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    CFStringRef v3 = v2;
    sub_21B5C5A3C(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21B5C4C8C(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C4CA4(std::string *a1@<X8>)
{
  CFStringRef v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    CFStringRef v3 = v2;
    sub_21B5C5A3C(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21B5C4D00(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C4D18(std::string *a1@<X8>)
{
  CFStringRef v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    CFStringRef v3 = v2;
    sub_21B5C5A3C(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21B5C4D74(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C4D8C(std::string *a1@<X8>)
{
  CFStringRef v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    CFStringRef v3 = v2;
    sub_21B5C5A3C(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21B5C4DE8(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C4E00(uint64_t a1@<X8>)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  CFStringRef v2 = (const __CFString *)MGGetStringAnswer();
  CFStringRef v10 = v2;
  if (!v2)
  {
    std::string::value_type v4 = 0;
    goto LABEL_5;
  }
  CFStringRef v3 = v2;
  sub_21B5C5A3C(v2, &v8);
  CFRelease(v3);
  std::string::value_type v4 = v9;
  if (!v9)
  {
LABEL_5:
    char v7 = 10;
    __int16 v6 = 28271;
    std::string::size_type v5 = 0x69746375646F7250;
    goto LABEL_6;
  }
  std::string::size_type v5 = v8.__r_.__value_.__r.__words[0];
  __int16 v6 = v8.__r_.__value_.__r.__words[1];
  std::string::value_type v4 = v8.__r_.__value_.__s.__data_[10];
  CFStringRef v10 = *(const __CFString **)((char *)&v8.__r_.__value_.__r.__words[1] + 3);
  int v11 = *(_DWORD *)((char *)&v8.__r_.__value_.__r.__words[2] + 3);
  char v7 = HIBYTE(v8.__r_.__value_.__r.__words[2]);
LABEL_6:
  *(void *)a1 = v5;
  *(_WORD *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 10) = v4;
  *(void *)(a1 + 11) = v10;
  *(_DWORD *)(a1 + 19) = v11;
  *(unsigned char *)(a1 + 23) = v7;
  *(unsigned char *)(a1 + 24) = 1;
}

void sub_21B5C4EEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  if (a2) {
    sub_21B5AD150(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21B5C4F10()
{
  return MGGetSInt64Answer();
}

uint64_t sub_21B5C4F38()
{
  uint64_t v0 = (const void *)MGCopyAnswer();
  if (!v0) {
    return 0;
  }
  v1 = v0;
  CFRelease(v0);
  return (v1 == (const void *)*MEMORY[0x263EFFB40]) | 0x100u;
}

uint64_t sub_21B5C4FA8()
{
  uint64_t v0 = (const void *)MGCopyAnswer();
  if (!v0) {
    return 0;
  }
  v1 = v0;
  CFRelease(v0);
  return (v1 == (const void *)*MEMORY[0x263EFFB40]) | 0x100u;
}

uint64_t sub_21B5C5018()
{
  uint64_t v0 = (const void *)MGCopyAnswer();
  if (!v0) {
    return 0;
  }
  v1 = v0;
  CFRelease(v0);
  return (v1 == (const void *)*MEMORY[0x263EFFB40]) | 0x100u;
}

uint64_t sub_21B5C5088()
{
  return MGGetSInt32Answer() | 0x100000000;
}

void sub_21B5C50B4(std::string *a1@<X8>)
{
  CFStringRef v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    CFStringRef v3 = v2;
    sub_21B5C5A3C(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21B5C5110(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21B5C5128(uint64_t a1@<X8>)
{
  CFStringRef v2 = (const __CFString *)MGGetStringAnswer();
  CFStringRef v46 = v2;
  if (!v2 || (CFStringRef v3 = v2, sub_21B5C5A3C(v2, &__p), CFRelease(v3), !v45))
  {
    *(unsigned char *)a1 = 0;
    *(unsigned char *)(a1 + 24) = 0;
    return;
  }
  std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  std::string::size_type v5 = 0;
  if (size)
  {
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    v41 = 0;
    v42 = 0;
    v43 = 0;
    char v7 = (std::string *)((char *)p_p + size);
    while (1)
    {
      std::string v8 = v7;
      if (p_p != v7)
      {
        std::string v8 = p_p;
        while (v8->__r_.__value_.__s.__data_[0] != 58)
        {
          std::string v8 = (std::string *)((char *)v8 + 1);
          if (v8 == v7)
          {
            std::string v8 = v7;
            break;
          }
        }
      }
      unint64_t v9 = (char *)v8 - (char *)p_p;
      if (v8 != p_p) {
        break;
      }
      std::string v8 = p_p;
LABEL_11:
      p_p = (std::string *)((char *)&v8->__r_.__value_.__l.__data_ + 1);
      if (v8 == v7)
      {
        v39 = v43;
        BOOL v40 = v45 != 0;
        *(void *)a1 = v41;
        *(void *)(a1 + 8) = v5;
        *(void *)(a1 + 16) = v39;
        *(unsigned char *)(a1 + 24) = 1;
        if (!v40) {
          return;
        }
        goto LABEL_71;
      }
    }
    if (v5 >= v43)
    {
      unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((v5 - (char *)v41) >> 3);
      unint64_t v12 = v11 + 1;
      if (v11 + 1 > 0xAAAAAAAAAAAAAAALL) {
        sub_21B5C57E8();
      }
      if (0x5555555555555556 * ((v43 - (char *)v41) >> 3) > v12) {
        unint64_t v12 = 0x5555555555555556 * ((v43 - (char *)v41) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * ((v43 - (char *)v41) >> 3) >= 0x555555555555555) {
        unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v13 = v12;
      }
      v50 = &v43;
      if (v13)
      {
        if (v13 > 0xAAAAAAAAAAAAAAALL) {
          sub_21B5C577C();
        }
        CFStringRef v14 = (const __CFString *)operator new(24 * v13);
      }
      else
      {
        CFStringRef v14 = 0;
      }
      v24 = (char *)v14 + 24 * v11;
      CFStringRef v46 = v14;
      v47 = v24;
      v48 = v24;
      v49 = (char *)v14 + 24 * v13;
      if (v9 > 0x7FFFFFFFFFFFFFF7) {
        sub_21B5C56D4();
      }
      if (v9 <= 0x16)
      {
        v24[23] = v9;
        goto LABEL_54;
      }
      uint64_t v25 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v9 | 7) != 0x17) {
        uint64_t v25 = v9 | 7;
      }
      uint64_t v26 = v25 + 1;
      v27 = (char *)operator new(v25 + 1);
      *((void *)v24 + 1) = v9;
      *((void *)v24 + 2) = v26 | 0x8000000000000000;
      *(void *)v24 = v27;
      v24 = v27;
      if (v9 >= 0x20 && (unint64_t)(v27 - (char *)p_p) >= 0x20)
      {
        v28 = (std::string *)((char *)p_p + (v9 & 0xFFFFFFFFFFFFFFE0));
        v29 = &v27[v9 & 0xFFFFFFFFFFFFFFE0];
        v30 = v27 + 16;
        v31 = &p_p->__r_.__value_.__r.__words[2];
        unint64_t v32 = v9 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v33 = *(_OWORD *)v31;
          *(v30 - 1) = *((_OWORD *)v31 - 1);
          _OWORD *v30 = v33;
          v30 += 2;
          v31 += 4;
          v32 -= 32;
        }
        while (v32);
        if (v9 != (v9 & 0x7FFFFFFFFFFFFFE0))
        {
          do
          {
LABEL_55:
            std::string::value_type v34 = v28->__r_.__value_.__s.__data_[0];
            v28 = (std::string *)((char *)v28 + 1);
            *v29++ = v34;
          }
          while (v28 != v8);
        }
        char *v29 = 0;
        v35 = v47;
        std::string::size_type v5 = v48 + 24;
        v36 = v42;
        if (v42 == v41)
        {
          v41 = (void **)v47;
          v43 = v49;
        }
        else
        {
          do
          {
            long long v37 = *(_OWORD *)(v36 - 3);
            *((void *)v35 - 1) = *(v36 - 1);
            *(_OWORD *)(v35 - 24) = v37;
            v35 -= 24;
            *(v36 - 2) = 0;
            *(v36 - 1) = 0;
            *(v36 - 3) = 0;
            v36 -= 3;
          }
          while (v36 != v41);
          v36 = v41;
          v38 = v42;
          v41 = (void **)v35;
          v43 = v49;
          while (v38 != v36)
          {
            if (*((char *)v38 - 1) < 0) {
              operator delete(*(v38 - 3));
            }
            v38 -= 3;
          }
        }
        if (v36) {
          operator delete(v36);
        }
        v42 = (void **)v5;
        goto LABEL_11;
      }
LABEL_54:
      v28 = p_p;
      v29 = v24;
      goto LABEL_55;
    }
    if (v9 > 0x7FFFFFFFFFFFFFF7) {
      sub_21B5C56D4();
    }
    if (v9 > 0x16)
    {
      uint64_t v15 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v9 | 7) != 0x17) {
        uint64_t v15 = v9 | 7;
      }
      uint64_t v16 = v15 + 1;
      CFStringRef v10 = (char *)operator new(v15 + 1);
      *((void *)v5 + 1) = v9;
      *((void *)v5 + 2) = v16 | 0x8000000000000000;
      *(void *)std::string::size_type v5 = v10;
      if (v9 >= 0x20 && (unint64_t)(v10 - (char *)p_p) >= 0x20)
      {
        v17 = (std::string *)((char *)p_p + (v9 & 0xFFFFFFFFFFFFFFE0));
        uint64_t v18 = &v10[v9 & 0xFFFFFFFFFFFFFFE0];
        v19 = v10 + 16;
        v20 = &p_p->__r_.__value_.__r.__words[2];
        unint64_t v21 = v9 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v22 = *(_OWORD *)v20;
          *(v19 - 1) = *((_OWORD *)v20 - 1);
          _OWORD *v19 = v22;
          v19 += 2;
          v20 += 4;
          v21 -= 32;
        }
        while (v21);
        if (v9 == (v9 & 0x7FFFFFFFFFFFFFE0)) {
          goto LABEL_41;
        }
        goto LABEL_40;
      }
    }
    else
    {
      v5[23] = v9;
      CFStringRef v10 = v5;
    }
    v17 = p_p;
    uint64_t v18 = v10;
    do
    {
LABEL_40:
      std::string::value_type v23 = v17->__r_.__value_.__s.__data_[0];
      v17 = (std::string *)((char *)v17 + 1);
      *v18++ = v23;
    }
    while (v17 != v8);
LABEL_41:
    *uint64_t v18 = 0;
    v5 += 24;
    v42 = (void **)v5;
    goto LABEL_11;
  }
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = 1;
LABEL_71:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_21B5C5588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  sub_21B5C57B0((const void **)va);
  _Unwind_Resume(a1);
}

void sub_21B5C559C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18, int a19, __int16 a20,char a21,char a22)
{
  if (a18)
  {
    if (a17 < 0) {
      operator delete(__p);
    }
  }
  _Unwind_Resume(a1);
}

void **sub_21B5C55F0(void **a1)
{
  CFStringRef v2 = (void **)*a1;
  if (*a1)
  {
    CFStringRef v3 = (void **)a1[1];
    std::string::value_type v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        if (*((char *)v3 - 1) < 0) {
          operator delete(*(v3 - 3));
        }
        v3 -= 3;
      }
      while (v3 != v2);
      std::string::value_type v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_21B5C5664()
{
  uint64_t v0 = (const void *)MGCopyAnswer();
  if (!v0) {
    return 0;
  }
  v1 = v0;
  CFRelease(v0);
  return (v1 == (const void *)*MEMORY[0x263EFFB40]) | 0x100u;
}

void sub_21B5C56D4()
{
}

void sub_21B5C56EC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_21B5C5748(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2643ABE58, MEMORY[0x263F8C060]);
}

void sub_21B5C5734(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_21B5C5748(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_21B5C577C()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

const void **sub_21B5C57B0(const void **a1)
{
  CFStringRef v2 = *a1;
  *a1 = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_21B5C57E8()
{
}

uint64_t sub_21B5C5800(uint64_t a1)
{
  CFStringRef v3 = *(void ***)(a1 + 8);
  CFStringRef v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      std::string::size_type v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        std::string::size_type v5 = *(void ***)(a1 + 16);
      }
      CFStringRef v2 = v5;
    }
    while (v5 != v3);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_21B5C5868(uint64_t a1@<X0>, char *a2@<X8>)
{
  (*(void (**)(void **__return_ptr))(*(void *)a1 + 32))(__p);
  if (!v18)
  {
    a2[23] = 7;
    strcpy(a2, "Unknown");
    return;
  }
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 112))(a1);
  BOOL v6 = (v4 & 0xFF00000000) == 0 || v4 != 1;
  int v7 = (char)v17;
  if ((v17 & 0x80u) == 0) {
    size_t v8 = v17;
  }
  else {
    size_t v8 = (size_t)__p[1];
  }
  if (v6) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = 5;
  }
  unint64_t v10 = v8 + v9;
  if (v8 + v9 >= 0x7FFFFFFFFFFFFFF8) {
    sub_21B5C56D4();
  }
  if (v10 > 0x16)
  {
    uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v13 = v10 | 7;
    }
    uint64_t v14 = v13 + 1;
    uint64_t v15 = (char *)operator new(v13 + 1);
    *((void *)a2 + 1) = v10;
    *((void *)a2 + 2) = v14 | 0x8000000000000000;
    *(void *)a2 = v15;
    a2 = v15;
    if (!v8) {
      goto LABEL_21;
    }
    goto LABEL_17;
  }
  *((void *)a2 + 1) = 0;
  *((void *)a2 + 2) = 0;
  *(void *)a2 = 0;
  a2[23] = v10;
  if (v8)
  {
LABEL_17:
    if (v7 >= 0) {
      unint64_t v11 = __p;
    }
    else {
      unint64_t v11 = (void **)__p[0];
    }
    memmove(a2, v11, v8);
  }
LABEL_21:
  unint64_t v12 = &a2[v8];
  if (!v6)
  {
    v12[4] = 77;
    *(_DWORD *)unint64_t v12 = 1230196831;
  }
  v12[v9] = 0;
  if (v7 < 0)
  {
    if (v18) {
      operator delete(__p[0]);
    }
  }
}

void sub_21B5C5A14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a15)
  {
    if (a14 < 0) {
      operator delete(__p);
    }
  }
  _Unwind_Resume(exception_object);
}

const __CFString *sub_21B5C5A3C@<X0>(const __CFString *result@<X0>, std::string *a2@<X8>)
{
  if (!result) {
    goto LABEL_8;
  }
  CFStringRef v3 = result;
  result = (const __CFString *)CFStringGetLength(result);
  if (result)
  {
    CFIndex v4 = (CFIndex)result;
    CFIndex usedBufLen = 0;
    v9.location = 0;
    v9.length = (CFIndex)result;
    result = (const __CFString *)CFStringGetBytes(v3, v9, 0x8000100u, 0, 0, 0, 0, &usedBufLen);
    if ((uint64_t)result > 0)
    {
      memset(&v7, 0, sizeof(v7));
      if (usedBufLen)
      {
        std::string::append(&v7, usedBufLen, 0);
        CFIndex v5 = usedBufLen;
        if ((v7.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          BOOL v6 = &v7;
        }
        else {
          BOOL v6 = (std::string *)v7.__r_.__value_.__r.__words[0];
        }
      }
      else
      {
        CFIndex v5 = 0;
        BOOL v6 = &v7;
      }
      v10.location = 0;
      v10.length = v4;
      result = (const __CFString *)CFStringGetBytes(v3, v10, 0x8000100u, 0, 0, (UInt8 *)v6, v5, 0);
      *a2 = v7;
      goto LABEL_12;
    }
LABEL_8:
    a2->__r_.__value_.__s.__data_[0] = 0;
    a2[1].__r_.__value_.__s.__data_[0] = 0;
    return result;
  }
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
LABEL_12:
  a2[1].__r_.__value_.__s.__data_[0] = 1;
  return result;
}

void sub_21B5C5B64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

uint64_t CFCopySystemVersionString()
{
  return MEMORY[0x270EE47A8]();
}

void CFRelease(CFTypeRef cf)
{
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CMTime *__cdecl CMClockMakeHostTimeFromSystemUnits(CMTime *__return_ptr retstr, uint64_t hostTime)
{
  return (CMTime *)MEMORY[0x270EE7AB8](retstr, hostTime);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x270EE7B10](desc);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x270EE7DD0](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x270EE7E20](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x270EE7E38](retstr, *(void *)&preferredTimescale, seconds);
}

OSStatus CMVideoFormatDescriptionCreate(CFAllocatorRef allocator, CMVideoCodecType codecType, int32_t width, int32_t height, CFDictionaryRef extensions, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x270EE7FA8](allocator, *(void *)&codecType, *(void *)&width, *(void *)&height, extensions, formatDescriptionOut);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x270EE9FC8](buffer, *(void *)&attachmentMode);
}

CFDictionaryRef CVBufferGetAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x270EE9FD8](buffer, *(void *)&attachmentMode);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

void CVBufferSetAttachments(CVBufferRef buffer, CFDictionaryRef theAttachments, CVAttachmentMode attachmentMode)
{
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA168](allocator, width, height, *(void *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1D0](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x270F95FF0]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F984B0](this, __n, __c);
}

void std::terminate(void)
{
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

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  MEMORY[0x270ED7E20]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

uint64_t mach_get_times()
{
  return MEMORY[0x270EDA170]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

void objc_exception_throw(id exception)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int uname(utsname *a1)
{
  return MEMORY[0x270EDB998](a1);
}