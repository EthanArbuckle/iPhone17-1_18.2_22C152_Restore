uint64_t RecapLibraryCore()
{
  if (!RecapLibraryCore_frameworkLibrary) {
    RecapLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return RecapLibraryCore_frameworkLibrary;
}

uint64_t RecapLibraryCore_0()
{
  if (!RecapLibraryCore_frameworkLibrary_0) {
    RecapLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  return RecapLibraryCore_frameworkLibrary_0;
}

uint64_t RecapLibraryCore_1()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = RecapLibraryCore_frameworkLibrary_1;
  uint64_t v5 = RecapLibraryCore_frameworkLibrary_1;
  if (!RecapLibraryCore_frameworkLibrary_1)
  {
    long long v6 = xmmword_264CC11F8;
    long long v7 = *(_OWORD *)&off_264CC1208;
    v3[3] = _sl_dlopen();
    RecapLibraryCore_frameworkLibrary_1 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_236D0CCB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t RecapLibraryCore_2()
{
  if (!RecapLibraryCore_frameworkLibrary_2) {
    RecapLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  return RecapLibraryCore_frameworkLibrary_2;
}

uint64_t RecapLibraryCore_3()
{
  if (!RecapLibraryCore_frameworkLibrary_3) {
    RecapLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  }
  return RecapLibraryCore_frameworkLibrary_3;
}

uint64_t RecapLibraryCore_4()
{
  if (!RecapLibraryCore_frameworkLibrary_4) {
    RecapLibraryCore_frameworkLibrary_4 = _sl_dlopen();
  }
  return RecapLibraryCore_frameworkLibrary_4;
}

void sub_236D0D320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getRCPSyntheticEventStreamClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getRCPSyntheticEventStreamClass_softClass;
  uint64_t v7 = getRCPSyntheticEventStreamClass_softClass;
  if (!getRCPSyntheticEventStreamClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getRCPSyntheticEventStreamClass_block_invoke;
    v3[3] = &unk_264CC1198;
    v3[4] = &v4;
    __getRCPSyntheticEventStreamClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_236D0D4B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __RecapLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  RecapLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getRCPPlayerPlaybackOptionsClass_block_invoke(uint64_t a1)
{
  RecapLibrary();
  Class result = objc_getClass("RCPPlayerPlaybackOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRCPPlayerPlaybackOptionsClass_block_invoke_cold_1();
  }
  getRCPPlayerPlaybackOptionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void RecapLibrary()
{
  if (!RecapLibraryCore())
  {
    uint64_t v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getRCPInlinePlayerClass_block_invoke(uint64_t a1)
{
  RecapLibrary();
  Class result = objc_getClass("RCPInlinePlayer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRCPInlinePlayerClass_block_invoke_cold_1();
  }
  getRCPInlinePlayerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getRCPSyntheticEventStreamClass_block_invoke(uint64_t a1)
{
  RecapLibrary();
  Class result = objc_getClass("RCPSyntheticEventStream");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRCPSyntheticEventStreamClass_block_invoke_cold_1();
  }
  getRCPSyntheticEventStreamClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_236D0DA4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __RecapLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  RecapLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getRCPSyntheticEventStreamClass_block_invoke_0(uint64_t a1)
{
  if (!RecapLibraryCore_0())
  {
    v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("RCPSyntheticEventStream");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRCPSyntheticEventStreamClass_block_invoke_cold_1();
  }
  getRCPSyntheticEventStreamClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

double CRNViewFrameInWindow(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 window];

  if (v2)
  {
    [v1 bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    v11 = [v1 window];
    v12 = [v11 screen];
    v13 = [v12 fixedCoordinateSpace];
    objc_msgSend(v1, "convertRect:toCoordinateSpace:", v13, v4, v6, v8, v10);
    double v15 = v14;
  }
  else
  {
    [v1 frame];
    double v15 = v16;
  }

  return v15;
}

double CRNContentSizeAlongAxis(void *a1, uint64_t a2)
{
  [a1 contentSize];
  if (a2 != 1) {
    return v4;
  }
  return result;
}

double CRNSizeAlongAxis(uint64_t a1, double a2, double a3)
{
  if (a1 != 1) {
    return a3;
  }
  return result;
}

double CRNContentSizeInDirection(void *a1, uint64_t a2)
{
  uint64_t v2 = a2 - 1;
  [a1 contentSize];
  if ((v2 & 0xFFFFFFFFFFFFFFFALL) != 0) {
    return v4;
  }
  return result;
}

uint64_t CRNAxisFromScrollDirection(uint64_t a1)
{
  if (((a1 - 1) & 0xFFFFFFFFFFFFFFFALL) != 0) {
    return 2;
  }
  else {
    return 1;
  }
}

uint64_t CRNPredominantAxisOfContentOf(void *a1)
{
  [a1 contentSize];
  if (v1 > v2) {
    return 1;
  }
  else {
    return 2 * (v1 < v2);
  }
}

uint64_t CRNQuadrantOfContentOffsetFor(void *a1)
{
  id v1 = a1;
  [v1 contentSize];
  if (v2 <= v3)
  {
    double v9 = v2;
    double v10 = v3;
    [v1 contentOffset];
    double v12 = v11;
    double v5 = v13;
    [v1 contentSize];
    if (v9 >= v10)
    {
      uint64_t v7 = 4;
      uint64_t v8 = 3;
      double v5 = v12;
    }
    else
    {
      double v6 = v14;
      uint64_t v7 = 4;
      uint64_t v8 = 3;
    }
  }
  else
  {
    [v1 contentOffset];
    double v5 = v4;
    [v1 contentSize];
    uint64_t v7 = 1;
    uint64_t v8 = 2;
  }
  if (v5 >= v6 * 0.5) {
    uint64_t v15 = v8;
  }
  else {
    uint64_t v15 = v7;
  }

  return v15;
}

uint64_t CRNOppositeDirectionFrom(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return 4;
  }
  else {
    return qword_236D11260[a1 - 1];
  }
}

double CRNCGRectGetMidpoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

double CRNCGRectGetMidpointAlongSide(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  switch(a1)
  {
    case 0:
      double MinX = CGRectGetMinX(*(CGRect *)&a2);
      goto LABEL_6;
    case 1:
      double MidX = CGRectGetMidX(*(CGRect *)&a2);
      v12.origin.x = a2;
      v12.origin.y = a3;
      v12.size.width = a4;
      v12.size.height = a5;
      CGRectGetMinY(v12);
      return MidX;
    case 2:
      double MinX = CGRectGetMaxX(*(CGRect *)&a2);
      goto LABEL_6;
    case 3:
      double MidX = CGRectGetMidX(*(CGRect *)&a2);
      v14.origin.x = a2;
      v14.origin.y = a3;
      v14.size.width = a4;
      v14.size.height = a5;
      CGRectGetMaxY(v14);
      return MidX;
    case 4:
    case 5:
      double MinX = CGRectGetMidX(*(CGRect *)&a2);
LABEL_6:
      double MidX = MinX;
      v13.origin.x = a2;
      v13.origin.y = a3;
      v13.size.width = a4;
      v13.size.height = a5;
      CGRectGetMidY(v13);
      break;
    default:
      return MidX;
  }
  return MidX;
}

double CRNCGPointAdvanceInDirectionByAmount(uint64_t a1, double result, double a3, double a4)
{
  switch(a1)
  {
    case 1:
      double result = result + a4;
      break;
    case 2:
      double result = result - a4;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t __RecapLibraryCore_block_invoke_1(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  RecapLibraryCore_frameworkLibrary_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t RecapLibrary_0()
{
  uint64_t v0 = RecapLibraryCore_1();
  if (!v0)
  {
    double v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getRCPInlinePlayerClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getRCPInlinePlayerClass_softClass_0;
  uint64_t v7 = getRCPInlinePlayerClass_softClass_0;
  if (!getRCPInlinePlayerClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getRCPInlinePlayerClass_block_invoke_0;
    v3[3] = &unk_264CC1198;
    v3[4] = &v4;
    __getRCPInlinePlayerClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_236D0EEC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRCPInlinePlayerClass_block_invoke_0(uint64_t a1)
{
  RecapLibrary_0();
  Class result = objc_getClass("RCPInlinePlayer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRCPInlinePlayerClass_block_invoke_cold_1();
  }
  getRCPInlinePlayerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getRCPEventStreamClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getRCPEventStreamClass_softClass;
  uint64_t v7 = getRCPEventStreamClass_softClass;
  if (!getRCPEventStreamClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getRCPEventStreamClass_block_invoke;
    v3[3] = &unk_264CC1198;
    v3[4] = &v4;
    __getRCPEventStreamClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_236D0F000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRCPEventStreamClass_block_invoke(uint64_t a1)
{
  RecapLibrary_0();
  Class result = objc_getClass("RCPEventStream");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRCPEventStreamClass_block_invoke_cold_1();
  }
  getRCPEventStreamClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getRCPSyntheticEventStreamClass_0()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getRCPSyntheticEventStreamClass_softClass_1;
  uint64_t v7 = getRCPSyntheticEventStreamClass_softClass_1;
  if (!getRCPSyntheticEventStreamClass_softClass_1)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getRCPSyntheticEventStreamClass_block_invoke_1;
    v3[3] = &unk_264CC1198;
    v3[4] = &v4;
    __getRCPSyntheticEventStreamClass_block_invoke_1((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_236D0F13C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRCPSyntheticEventStreamClass_block_invoke_1(uint64_t a1)
{
  RecapLibrary_0();
  Class result = objc_getClass("RCPSyntheticEventStream");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRCPSyntheticEventStreamClass_block_invoke_cold_1();
  }
  getRCPSyntheticEventStreamClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getRCPPlayerPlaybackOptionsClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getRCPPlayerPlaybackOptionsClass_softClass_0;
  uint64_t v7 = getRCPPlayerPlaybackOptionsClass_softClass_0;
  if (!getRCPPlayerPlaybackOptionsClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getRCPPlayerPlaybackOptionsClass_block_invoke_0;
    v3[3] = &unk_264CC1198;
    v3[4] = &v4;
    __getRCPPlayerPlaybackOptionsClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_236D0F278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRCPPlayerPlaybackOptionsClass_block_invoke_0(uint64_t a1)
{
  RecapLibrary_0();
  Class result = objc_getClass("RCPPlayerPlaybackOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRCPPlayerPlaybackOptionsClass_block_invoke_cold_1();
  }
  getRCPPlayerPlaybackOptionsClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getRCPEventSenderPropertiesClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getRCPEventSenderPropertiesClass_softClass;
  uint64_t v7 = getRCPEventSenderPropertiesClass_softClass;
  if (!getRCPEventSenderPropertiesClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getRCPEventSenderPropertiesClass_block_invoke;
    v3[3] = &unk_264CC1198;
    v3[4] = &v4;
    __getRCPEventSenderPropertiesClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_236D0F3B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRCPEventSenderPropertiesClass_block_invoke(uint64_t a1)
{
  RecapLibrary_0();
  Class result = objc_getClass("RCPEventSenderProperties");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRCPEventSenderPropertiesClass_block_invoke_cold_1();
  }
  getRCPEventSenderPropertiesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_236D0F958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __RecapLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  RecapLibraryCore_frameworkLibrary_2 = result;
  return result;
}

Class __getRCPSyntheticEventStreamClass_block_invoke_2(uint64_t a1)
{
  if (!RecapLibraryCore_2())
  {
    double v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("RCPSyntheticEventStream");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRCPSyntheticEventStreamClass_block_invoke_cold_1();
  }
  getRCPSyntheticEventStreamClass_softClass_2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_236D0FD28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __RecapLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  RecapLibraryCore_frameworkLibrary_3 = result;
  return result;
}

Class __getRCPSyntheticEventStreamClass_block_invoke_3(uint64_t a1)
{
  if (!RecapLibraryCore_3())
  {
    double v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("RCPSyntheticEventStream");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRCPSyntheticEventStreamClass_block_invoke_cold_1();
  }
  getRCPSyntheticEventStreamClass_softClass_3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_236D10234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __RecapLibraryCore_block_invoke_4()
{
  uint64_t result = _sl_dlopen();
  RecapLibraryCore_frameworkLibrary_4 = result;
  return result;
}

Class __getRCPSyntheticEventStreamClass_block_invoke_4(uint64_t a1)
{
  if (!RecapLibraryCore_4())
  {
    double v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("RCPSyntheticEventStream");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRCPSyntheticEventStreamClass_block_invoke_cold_1();
  }
  getRCPSyntheticEventStreamClass_softClass_4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __getRCPPlayerPlaybackOptionsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getRCPInlinePlayerClass_block_invoke_cold_1(v0);
}

void __getRCPInlinePlayerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getRCPSyntheticEventStreamClass_block_invoke_cold_1(v0);
}

void __getRCPSyntheticEventStreamClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getRCPEventStreamClass_block_invoke_cold_1(v0);
}

void __getRCPEventStreamClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getRCPEventSenderPropertiesClass_block_invoke_cold_1(v0);
}

void __getRCPEventSenderPropertiesClass_block_invoke_cold_1()
{
  abort_report_np();
  CGRectGetMaxX(v0);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}