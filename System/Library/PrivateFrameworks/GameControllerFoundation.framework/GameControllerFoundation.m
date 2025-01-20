void sub_20AD09FC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, NSErrorUserInfoKey a12, NSErrorUserInfoKey a13, NSErrorUserInfoKey a14, uint64_t a15, __CFString *a16, uint64_t a17)
{
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;

  if (a2)
  {
    if (a2 == 2)
    {
      v20 = objc_begin_catch(exception_object);
      if (v17)
      {
        a12 = NSLocalizedDescriptionKey;
        v21 = [*(id *)(v19 + 456) stringWithFormat:@"Invalid '%@' definition."];
        a15 = (uint64_t)v21;
        a16 = @"Model build failed.  This is a #BUG.";
        a13 = NSLocalizedFailureReasonErrorKey;
        a14 = NSUnderlyingErrorKey;
        v22 = objc_msgSend(v20, "gc_error");
        a17 = (uint64_t)v22;
        v23 = +[NSDictionary dictionaryWithObjects:&a15 forKeys:&a12 count:3];
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v23);
        *v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_end_catch();
      JUMPOUT(0x20AD09DF0);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_20AD0A978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void *IOGCFastPathClientInterfacePrepareObjCVtbl(uint64_t a1, uint64_t a2)
{
  id v3 = (id)objc_opt_class();
  objc_sync_enter(v3);
  v4 = objc_getAssociatedObject(v3, &unk_26BEED4B0);
  if (!v4)
  {
    v4 = (void *)[objc_alloc((Class)&off_26BEEE0C0) initWithLength:96];
    objc_setAssociatedObject(v3, &unk_26BEED4B0, v4, (void *)0x301);
  }
  id v5 = v4;
  v6 = (void *)[v5 mutableBytes];

  objc_sync_exit(v3);
  if (!*v6)
  {
    void *v6 = a2;
    v6[1] = queryInterface_0;
    v6[2] = addRef_0;
    v6[3] = release_0;
    v6[4] = 1;
    v6[5] = __IOGCFastPathClientInterfaceObjCThunk_CopyDescription;
    v6[6] = __IOGCFastPathClientInterfaceObjCThunk_Open;
    v6[7] = __IOGCFastPathClientInterfaceObjCThunk_Close;
    v6[8] = __IOGCFastPathClientInterfaceObjCThunk_GetClientProperty;
    v6[9] = __IOGCFastPathClientInterfaceObjCThunk_SetClientProperty;
    v6[10] = __IOGCFastPathClientInterfaceObjCThunk_CreateControlQueue;
    v6[11] = __IOGCFastPathClientInterfaceObjCThunk_CreateInputQueue;
  }
  return v6;
}

void sub_20AD0ACCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CFTypeRef __IOGCFastPathClientInterfaceObjCThunk_CopyDescription(void **a1)
{
  v1 = (char *)a1 - **a1;
  v2 = [v1 description];
  CFTypeRef v3 = CFRetain(v2);

  return v3;
}

uint64_t __IOGCFastPathClientInterfaceObjCThunk_Open(void **a1, uint64_t a2)
{
  return [(char *)a1 - **a1 open:a2];
}

uint64_t __IOGCFastPathClientInterfaceObjCThunk_Close(void **a1, uint64_t a2)
{
  return [(char *)a1 - **a1 close:a2];
}

uint64_t __IOGCFastPathClientInterfaceObjCThunk_GetClientProperty(void **a1, uint64_t a2)
{
  return [(char *)a1 - **a1 getProperty:a2];
}

uint64_t __IOGCFastPathClientInterfaceObjCThunk_SetClientProperty(void **a1, uint64_t a2, uint64_t a3)
{
  return [(char *)a1 - **a1 setProperty:a2 value:a3];
}

uint64_t __IOGCFastPathClientInterfaceObjCThunk_CreateControlQueue(void **a1)
{
  return objc_msgSend((char *)a1 - **a1, "createControlQueueWithOptions:object:");
}

uint64_t __IOGCFastPathClientInterfaceObjCThunk_CreateInputQueue(void **a1)
{
  return objc_msgSend((char *)a1 - **a1, "createInputQueueWithOptions:object:");
}

void *IOGCFastPathControlQueueInterfacePrepareObjCVtbl(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = (id)objc_opt_class();
  objc_sync_enter(v4);
  id v5 = objc_getAssociatedObject(v4, &unk_26BEED510);
  if (!v5)
  {
    id v5 = (void *)[objc_alloc((Class)&off_26BEEE0C0) initWithLength:96];
    objc_setAssociatedObject(v4, &unk_26BEED510, v5, (void *)0x301);
  }
  id v6 = v5;
  v7 = (void *)[v6 mutableBytes];

  objc_sync_exit(v4);
  if (!*v7)
  {
    void *v7 = a2;
    v7[1] = queryInterface_0;
    v7[2] = addRef_0;
    v7[3] = release_0;
    v7[4] = 1;
    v7[5] = __IOGCFastPathControlQueueInterfaceObjCThunk_CopyDescription;
    v7[6] = __IOGCFastPathControlQueueInterfaceObjCThunk_GetProperty;
    v7[7] = __IOGCFastPathControlQueueInterfaceObjCThunk_SetProperty;
    v7[8] = __IOGCFastPathControlQueueInterfaceObjCThunk_GetActivePosition;
    v7[9] = __IOGCFastPathControlQueueInterfaceObjCThunk_GetReadPosition;
    v7[10] = __IOGCFastPathControlQueueInterfaceObjCThunk_ResetPosition;
    v7[11] = __IOGCFastPathControlQueueInterfaceObjCThunk_GetSampleWithOptions;
  }

  return v7;
}

void sub_20AD0AF18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CFTypeRef __IOGCFastPathControlQueueInterfaceObjCThunk_CopyDescription(void **a1)
{
  v1 = (char *)a1 - **a1;
  v2 = [v1 description];
  CFTypeRef v3 = CFRetain(v2);

  return v3;
}

uint64_t __IOGCFastPathControlQueueInterfaceObjCThunk_GetProperty(void **a1, uint64_t a2)
{
  return [(char *)a1 - **a1 getProperty:a2];
}

uint64_t __IOGCFastPathControlQueueInterfaceObjCThunk_SetProperty(void **a1, uint64_t a2, uint64_t a3)
{
  return [(char *)a1 - **a1 setProperty:a2 value:a3];
}

uint64_t __IOGCFastPathControlQueueInterfaceObjCThunk_GetActivePosition(void **a1, uint64_t a2)
{
  return [(char *)a1 - **a1 getActivePosition:a2];
}

uint64_t __IOGCFastPathControlQueueInterfaceObjCThunk_GetReadPosition(void **a1, uint64_t a2)
{
  return [(char *)a1 - **a1 getReadPosition:a2];
}

uint64_t __IOGCFastPathControlQueueInterfaceObjCThunk_ResetPosition(void **a1, uint64_t a2)
{
  return [(char *)a1 - **a1 resetPosition:a2];
}

uint64_t __IOGCFastPathControlQueueInterfaceObjCThunk_GetSampleWithOptions(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [(char *)a1 - **a1 get:a2 options:a3 sample:a4];
}

void *IOGCFastPathInputQueueInterfacePrepareObjCVtbl(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = (id)objc_opt_class();
  objc_sync_enter(v4);
  id v5 = objc_getAssociatedObject(v4, &unk_26BEED570);
  if (!v5)
  {
    id v5 = (void *)[objc_alloc((Class)&off_26BEEE0C0) initWithLength:96];
    objc_setAssociatedObject(v4, &unk_26BEED570, v5, (void *)0x301);
  }
  id v6 = v5;
  v7 = (void *)[v6 mutableBytes];

  objc_sync_exit(v4);
  if (!*v7)
  {
    void *v7 = a2;
    v7[1] = queryInterface_0;
    v7[2] = addRef_0;
    v7[3] = release_0;
    v7[4] = 1;
    v7[5] = __IOGCFastPathInputQueueInterfaceObjCThunk_CopyDescription;
    v7[6] = __IOGCFastPathInputQueueInterfaceObjCThunk_InputQueueGetProperty;
    v7[7] = __IOGCFastPathInputQueueInterfaceObjCThunk_InputQueueSetProperty;
    v7[8] = __IOGCFastPathInputQueueInterfaceObjCThunk_GetDataAvailableNotification;
    v7[9] = __IOGCFastPathInputQueueInterfaceObjCThunk_GetLatestSamplePosition;
    v7[10] = __IOGCFastPathInputQueueInterfaceObjCThunk_GetSampleWithOptions;
    v7[11] = 0;
    if (objc_opt_respondsToSelector()) {
      v7[11] = __IOGCFastPathInputQueueInterfaceObjCThunk_CreateReader;
    }
  }

  return v7;
}

void sub_20AD0B188(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CFTypeRef __IOGCFastPathInputQueueInterfaceObjCThunk_CopyDescription(void **a1)
{
  v1 = (char *)a1 - **a1;
  v2 = [v1 description];
  CFTypeRef v3 = CFRetain(v2);

  return v3;
}

uint64_t __IOGCFastPathInputQueueInterfaceObjCThunk_InputQueueGetProperty(void **a1, uint64_t a2)
{
  return [(char *)a1 - **a1 getProperty:a2];
}

uint64_t __IOGCFastPathInputQueueInterfaceObjCThunk_InputQueueSetProperty(void **a1, uint64_t a2, uint64_t a3)
{
  return [(char *)a1 - **a1 setProperty:a2 value:a3];
}

uint64_t __IOGCFastPathInputQueueInterfaceObjCThunk_GetDataAvailableNotification(void **a1, uint64_t a2)
{
  return [(char *)a1 - **a1 getDataAvailableNotification:a2];
}

uint64_t __IOGCFastPathInputQueueInterfaceObjCThunk_GetLatestSamplePosition(void **a1, uint64_t a2)
{
  return [(char *)a1 - **a1 getLatestSamplePosition:a2];
}

uint64_t __IOGCFastPathInputQueueInterfaceObjCThunk_GetSampleWithOptions(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [(char *)a1 - **a1 get:a2 options:a3 sample:a4];
}

uint64_t __IOGCFastPathInputQueueInterfaceObjCThunk_CreateReader(void **a1)
{
  return objc_msgSend((char *)a1 - **a1, "createReaderObject:");
}

void *IOGCFastPathReaderInterfacePrepareObjCVtbl(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = (id)objc_opt_class();
  objc_sync_enter(v4);
  id v5 = objc_getAssociatedObject(v4, &unk_26BEED5D0);
  if (!v5)
  {
    id v5 = (void *)[objc_alloc((Class)&off_26BEEE0C0) initWithLength:88];
    objc_setAssociatedObject(v4, &unk_26BEED5D0, v5, (void *)0x301);
  }
  id v6 = v5;
  v7 = (void *)[v6 mutableBytes];

  objc_sync_exit(v4);
  if (!*v7)
  {
    void *v7 = a2;
    v7[1] = queryInterface_0;
    v7[2] = addRef_0;
    v7[3] = release_0;
    v7[4] = 1;
    v7[5] = __IOGCFastPathReaderInterfaceObjCThunk_CopyDescription;
    v7[6] = __IOGCFastPathReaderInterfaceObjCThunk_Reset;
    v7[7] = __IOGCFastPathReaderInterfaceObjCThunk_GetReadPosition;
    v7[8] = __IOGCFastPathReaderInterfaceObjCThunk_ReadCurrentSample;
    v7[9] = __IOGCFastPathReaderInterfaceObjCThunk_ReadNextSample;
    v7[10] = __IOGCFastPathReaderInterfaceObjCThunk_ReadPreviousSample;
  }

  return v7;
}

void sub_20AD0B3D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CFTypeRef __IOGCFastPathReaderInterfaceObjCThunk_CopyDescription(void **a1)
{
  v1 = (char *)a1 - **a1;
  v2 = [v1 description];
  CFTypeRef v3 = CFRetain(v2);

  return v3;
}

uint64_t __IOGCFastPathReaderInterfaceObjCThunk_Reset(void **a1)
{
  return [(char *)a1 - **a1 reset];
}

uint64_t __IOGCFastPathReaderInterfaceObjCThunk_GetReadPosition(void **a1, uint64_t a2)
{
  return [(char *)a1 - **a1 getReadPosition:a2];
}

uint64_t __IOGCFastPathReaderInterfaceObjCThunk_ReadCurrentSample(void **a1, uint64_t a2)
{
  return [(char *)a1 - **a1 readCurrentSample:a2];
}

uint64_t __IOGCFastPathReaderInterfaceObjCThunk_ReadNextSample(void **a1, uint64_t a2)
{
  return [(char *)a1 - **a1 readNextSample:a2];
}

uint64_t __IOGCFastPathReaderInterfaceObjCThunk_ReadPreviousSample(void **a1, uint64_t a2)
{
  return [(char *)a1 - **a1 readPreviousSample:a2];
}

void *IOGCFastPathSampleContainerInterfacePrepareObjCVtbl(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = (id)objc_opt_class();
  objc_sync_enter(v4);
  id v5 = objc_getAssociatedObject(v4, &unk_26BEED630);
  if (!v5)
  {
    id v5 = (void *)[objc_alloc((Class)&off_26BEEE0C0) initWithLength:232];
    objc_setAssociatedObject(v4, &unk_26BEED630, v5, (void *)0x301);
  }
  id v6 = v5;
  v7 = (void *)[v6 mutableBytes];

  objc_sync_exit(v4);
  if (!*v7)
  {
    void *v7 = a2;
    v7[1] = queryInterface_0;
    v7[2] = addRef_0;
    v7[3] = release_0;
    v7[4] = 1;
    v7[5] = __IOGCFastPathSampleContainerInterfaceObjCThunk_CopyDescription;
    v7[6] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleDestroy;
    v7[7] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleRefresh;
    v7[8] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleCommit;
    v7[9] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetPosition;
    v7[10] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetSequenceID;
    v7[11] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetSubsampleCount;
    v7[12] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetFlags;
    v7[13] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSetFlags;
    v7[14] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetTimestamp;
    v7[15] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSetTimestamp;
    v7[16] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetInteger;
    v7[17] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetDouble;
    v7[18] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSetInteger;
    v7[19] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSetDouble;
    v7[20] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGet2Integer;
    v7[21] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGet2Double;
    v7[22] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSet2Integer;
    v7[23] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSet2Double;
    v7[24] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGet3Integer;
    v7[25] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGet3Double;
    v7[26] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSet3Integer;
    v7[27] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSet3Double;
    v7[28] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetTraceData;
  }

  return v7;
}

void sub_20AD0B718(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CFTypeRef __IOGCFastPathSampleContainerInterfaceObjCThunk_CopyDescription(void **a1)
{
  v1 = (char *)a1 - **a1;
  v2 = [v1 description];
  CFTypeRef v3 = CFRetain(v2);

  return v3;
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleDestroy(void **a1, uint64_t a2)
{
  return [(char *)a1 - **a1 sampleDestroy:a2];
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleRefresh(void **a1, uint64_t a2)
{
  return [(char *)a1 - **a1 sampleRefresh:a2];
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleCommit(void **a1, uint64_t a2)
{
  return [(char *)a1 - **a1 sampleCommit:a2];
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetPosition(void **a1, uint64_t a2)
{
  return [(char *)a1 - **a1 sampleGetPosition:a2];
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetSequenceID(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [(char *)a1 - **a1 sample:a2 getSequenceID:a3 maxID:a4];
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetSubsampleCount(void **a1, uint64_t a2, uint64_t a3)
{
  return [(char *)a1 - **a1 sample:a2 getSubsampleCount:a3];
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetFlags(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [(char *)a1 - **a1 sample:a2 getSubsample:a3 flags:a4];
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSetFlags(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [(char *)a1 - **a1 sample:a2 setSubsample:a3 flags:a4];
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetTimestamp(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return [(char *)a1 - **a1 sample:a2 getSubsample:a3 field:a4 domain:a5 options:a6 timestamp:a7 uncertainty:a8 flags:a9];
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSetTimestamp(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  LODWORD(v10) = a9;
  return [(char *)a1 - **a1 sample:a2 setSubsample:a3 field:a4 domain:a5 options:a6 timestamp:a7 tolerance:a8 flags:v10];
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetInteger(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [(char *)a1 - **a1 sample:a2 getSubsample:a3 field:a4 options:a5 integer:a6];
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetDouble(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [(char *)a1 - **a1 sample:a2 getSubsample:a3 field:a4 options:a5 double:a6];
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSetInteger(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [(char *)a1 - **a1 sample:a2 setSubsample:a3 field:a4 options:a5 integer:a6];
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSetDouble(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend((char *)a1 - **a1, "sample:setSubsample:field:options:double:", a2, a3, a4, a5);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGet2Integer(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return [(char *)a1 - **a1 sample:a2 getSubsample:a3 field:a4 options:a5 integer:a6 :a7];
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGet2Double(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return [(char *)a1 - **a1 sample:a2 getSubsample:a3 field:a4 options:a5 double:a6 :a7];
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSet2Integer(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return [(char *)a1 - **a1 sample:a2 setSubsample:a3 field:a4 options:a5 integer:a6 :a7];
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSet2Double(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend((char *)a1 - **a1, "sample:setSubsample:field:options:double::", a2, a3, a4, a5);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGet3Integer(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return [(char *)a1 - **a1 sample:a2 getSubsample:a3 field:a4 options:a5 integer:a6 :a7 :a8];
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGet3Double(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return [(char *)a1 - **a1 sample:a2 getSubsample:a3 field:a4 options:a5 double:a6 :a7 :a8];
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSet3Integer(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return [(char *)a1 - **a1 sample:a2 setSubsample:a3 field:a4 options:a5 integer:a6 :a7 :a8];
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSet3Double(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend((char *)a1 - **a1, "sample:setSubsample:field:options:double:::", a2, a3, a4, a5);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetTraceData(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [(char *)a1 - **a1 sample:a2 getTraceProviderID:a3 queueID:a4 channel:a5 position:a6];
}

void sub_20AD0BE10(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 80));
  _Unwind_Resume(a1);
}

void sub_20AD0C05C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20AD0CEDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, NSErrorUserInfoKey a12, NSErrorUserInfoKey a13, NSErrorUserInfoKey a14, uint64_t a15, __CFString *a16, uint64_t a17)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v20 = objc_begin_catch(exception_object);
      if (v17)
      {
        a12 = NSLocalizedDescriptionKey;
        v21 = *(void **)(v19 + 456);
        [(id)objc_opt_class() modelClass];
        v22 = [v21 stringWithFormat:@"Invalid '%@' definition."];
        a15 = (uint64_t)v22;
        a16 = @"Model build failed.  This is a #BUG.";
        a13 = NSLocalizedFailureReasonErrorKey;
        a14 = NSUnderlyingErrorKey;
        v23 = objc_msgSend(v20, "gc_error");
        a17 = (uint64_t)v23;
        v24 = +[NSDictionary dictionaryWithObjects:&a15 forKeys:&a12 count:3];
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v24);
        void *v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_end_catch();
      JUMPOUT(0x20AD0CD44);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

id _gc_log_devicedb()
{
  if (_gc_log_devicedb_onceToken != -1) {
    dispatch_once(&_gc_log_devicedb_onceToken, &__block_literal_global);
  }
  v0 = (void *)_gc_log_devicedb_Log;

  return v0;
}

uint64_t ___gc_log_devicedb_block_invoke()
{
  _gc_log_devicedb_Log = (uint64_t)os_log_create("com.apple.gamecontroller.HIDGameControllerMappingsDB", "Common");

  return MEMORY[0x270F9A758]();
}

_GCDisposable *PushValueChangedHandler(void *a1, void *a2, uint64_t a3, int a4)
{
  v7 = a1;
  id v8 = a2;
  v9 = v7 + 5;
  if (v7[5]) {
    v9 = malloc_type_calloc(1uLL, 0x20uLL, 0x10A00406268BE83uLL);
  }
  uint64_t v10 = [v8 copy];
  v11 = (void *)*v9;
  void *v9 = v10;

  v12 = 0;
  v9[1] = a3;
  v9[2] = 0;
  v13 = (void *)v7[4];
  v9[3] = v13;
  void *v13 = v9;
  v7[4] = v9 + 2;
  if (a4)
  {
    v14 = [_GCDisposable alloc];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __PushValueChangedHandler_block_invoke;
    v16[3] = &unk_26BEC3B38;
    v18 = v9;
    v17 = v7;
    v12 = [(_GCDisposable *)v14 initWithCleanupHandler:v16];
  }

  return v12;
}

void __PushValueChangedHandler_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v3 = *(void *)(v2 + 24);
  if (v4) {
    id v5 = (void *)(v4 + 24);
  }
  else {
    id v5 = (void *)(*(void *)(a1 + 32) + 32);
  }
  *id v5 = v3;
  **(void **)(*(void *)(a1 + 40) + 24) = *(void *)(*(void *)(a1 + 40) + 16);
  id v6 = *(void ***)(a1 + 40);
  v7 = *v6;
  void *v6 = 0;

  id v8 = *(void **)(a1 + 40);
  v8[1] = 0x8000000000000000;
  if (v8 != (void *)(*(void *)(a1 + 32) + 40))
  {
    free(v8);
  }
}

void sub_20AD0FB68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,NSErrorUserInfoKey a33,NSErrorUserInfoKey a34,NSErrorUserInfoKey a35,uint64_t a36,__CFString *a37,uint64_t a38)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v38 = objc_begin_catch(exception_object);
      if (a16)
      {
        a33 = NSLocalizedDescriptionKey;
        v39 = +[NSString stringWithFormat:@"Invalid '%@' definition."];
        a36 = (uint64_t)v39;
        a37 = @"Model build failed.  This is a #BUG.";
        a34 = NSLocalizedFailureReasonErrorKey;
        a35 = NSUnderlyingErrorKey;
        v40 = objc_msgSend(v38, "gc_error");
        a38 = (uint64_t)v40;
        v41 = +[NSDictionary dictionaryWithObjects:&a36 forKeys:&a33 count:3];
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v41);
        *a16 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_end_catch();
      JUMPOUT(0x20AD0FA38);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_20AD1232C(_Unwind_Exception *a1)
{
}

void sub_20AD12C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_20AD13568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20AD13D0C(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 64));
  _Unwind_Resume(a1);
}

void sub_20AD13F2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20AD14150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_20AD14518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_20AD146A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_20AD148EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
}

void sub_20AD14D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, os_activity_scope_state_s state)
{
}

void __HIDDevicesMatched(void *a1, io_iterator_t a2)
{
  kern_return_t v14;
  GCHIDDeviceSnapshot *v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  int v19;
  NSObject *v20;
  kern_return_t v21;
  NSObject *v22;
  kern_return_t v23;
  GCHIDDeviceSnapshot *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  kern_return_t v28;
  uint64_t v29;
  char *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *log;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  io_connect_t connect;
  uint64_t entryID;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  _OWORD *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  kern_return_t v50;
  _OWORD v51[8];

  v35 = a1;
  while (1)
  {
    while (1)
    {
      uint64_t v2 = IOIteratorNext(a2);
      if (!v2) {
        break;
      }
      uint64_t v3 = _os_activity_create(&dword_20AD04000, "[Generic Device Manager] Matched Kernel Service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v3, &state);
      entryID = 0;
      memset(v51, 0, sizeof(v51));
      IORegistryEntryGetRegistryEntryID(v2, &entryID);
      MEMORY[0x21052C920](v2, v51);
      uint64_t v4 = _gc_log_generic_device();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v46 = v51;
        v47 = 2048;
        v48 = (const char *)entryID;
        _os_log_debug_impl(&dword_20AD04000, v4, OS_LOG_TYPE_DEBUG, "Matched kernel service <%s %#llx>.", buf, 0x16u);
      }

      CFProperty = (void *)IORegistryEntryCreateCFProperty(v2, @"Transport", kCFAllocatorDefault, 0);
      id v6 = CFProperty;
      if (!CFProperty || ![CFProperty isEqualToString:@"Rapport"])
      {
        id v8 = (void *)IORegistryEntryCreateCFProperty(v2, @"GCSyntheticDevice", kCFAllocatorDefault, 0);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 BOOLValue])
        {
          uint64_t v9 = _gc_log_generic_device();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v46 = v51;
            v47 = 2048;
            v48 = (const char *)entryID;
            _os_log_debug_impl(&dword_20AD04000, v9, OS_LOG_TYPE_DEBUG, "Skipping <%s %#llx>.  Synthetic device.", buf, 0x16u);
          }

          IOObjectRelease(v2);
          goto LABEL_54;
        }
        uint64_t v10 = (void *)IORegistryEntryCreateCFProperty(v2, @"HIDVirtualDevice", kCFAllocatorDefault, 0);
        v40 = (void *)IORegistryEntryCreateCFProperty(v2, @"VendorID", kCFAllocatorDefault, 0);
        v39 = (void *)IORegistryEntryCreateCFProperty(v2, @"ProductID", kCFAllocatorDefault, 0);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v10 BOOLValue])
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v40 unsignedShortValue] == 1118)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && [v39 unsignedShortValue] == 654)
              {
                v11 = _gc_log_generic_device();
                if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315394;
                  v46 = v51;
                  v47 = 2048;
                  v48 = (const char *)entryID;
                  _os_log_debug_impl(&dword_20AD04000, v11, OS_LOG_TYPE_DEBUG, "Skipping <%s %#llx>.  3rd party synthetic device.", buf, 0x16u);
                }

                IOObjectRelease(v2);
                goto LABEL_53;
              }
            }
          }
        }
        v12 = (void *)IORegistryEntryCreateCFProperty(v2, @"GameControllerSupportedHIDDevice", kCFAllocatorDefault, 0);
        if (v12)
        {
          v13 = _gc_log_generic_device();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            v27 = entryID;
            v28 = [v12 BOOLValue];
            *(_DWORD *)buf = 136315650;
            v46 = v51;
            v47 = 2048;
            v48 = (const char *)v27;
            v49 = 1024;
            v50 = v28;
            _os_log_debug_impl(&dword_20AD04000, v13, OS_LOG_TYPE_DEBUG, "Skipping <%s %#llx>.  Already determined game controller support: %{BOOL}d.", buf, 0x1Cu);
          }
          goto LABEL_29;
        }
        connect = 0;
        v14 = IOServiceOpen(v2, mach_task_self_, 0x484944u, &connect);
        if (v14)
        {
          v13 = _gc_log_generic_device();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v46 = v51;
            v47 = 2048;
            v48 = (const char *)entryID;
            v49 = 1024;
            v50 = v14;
            _os_log_error_impl(&dword_20AD04000, v13, OS_LOG_TYPE_ERROR, "<%s %#llx> Failed to open connection: %{mach.errno}d", buf, 0x1Cu);
          }
LABEL_29:

          IOObjectRelease(v2);
LABEL_52:

LABEL_53:
LABEL_54:

          goto LABEL_55;
        }
        v37 = GCLookupService(0, (objc_class *)&unk_26BEE8588, 0, 0);
        if (v37)
        {
          v36 = GCLookupService(0, (objc_class *)&unk_26BEED718, 0, 0);
          v15 = [[GCHIDDeviceSnapshot alloc] initWithService:v2];
          id v38 = objc_msgSend(v37, "hasModelForDevice:");
          v16 = [v38 waitUntilFinished];
          if (v16 < 2)
          {
            v17 = _gc_log_generic_device();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              log = v17;
              v29 = entryID;
              v30 = [v38 error];
              *(_DWORD *)buf = 134218242;
              v46 = (_OWORD *)v29;
              v47 = 2112;
              v48 = v30;
              v17 = log;
              _os_log_error_impl(&dword_20AD04000, log, OS_LOG_TYPE_ERROR, "<IOHIDDevice %#llx> Error checking game controller support: %@", buf, 0x16u);
            }
            goto LABEL_38;
          }
          if (v16 == 2)
          {
            v18 = [v38 result];
            uint64_t v19 = [v18 BOOLValue];

            if (v19)
            {
              id v20 = _gc_log_generic_device();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                v46 = (_OWORD *)entryID;
                _os_log_impl(&dword_20AD04000, v20, OS_LOG_TYPE_DEFAULT, "<IOHIDDevice %#llx> is a supported game controller.  Initiating rematching...", buf, 0xCu);
              }

              v21 = IOConnectSetCFProperty(connect, @"GameControllerSupportedHIDDevice", &__kCFBooleanTrue);
              if (v21)
              {
                v22 = _gc_log_generic_device();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218498;
                  v46 = (_OWORD *)entryID;
                  v47 = 2080;
                  v48 = "GameControllerSupportedHIDDevice";
                  v49 = 1024;
                  v50 = v21;
                  _os_log_error_impl(&dword_20AD04000, v22, OS_LOG_TYPE_ERROR, "<IOHIDDevice %#llx> Error applying '%s' attribute: %{mach.errno}d", buf, 0x1Cu);
                }
              }
              v23 = IOConnectSetCFProperty(connect, @"IOHIDDeviceForceInterfaceRematch", &__kCFBooleanTrue);
              if (v23)
              {
                v17 = _gc_log_generic_device();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218240;
                  v46 = (_OWORD *)entryID;
                  v47 = 1024;
                  LODWORD(v48) = v23;
                  _os_log_error_impl(&dword_20AD04000, v17, OS_LOG_TYPE_ERROR, "<IOHIDDevice %#llx> Error initiating rematching: %{mach.errno}d", buf, 0x12u);
                }
                goto LABEL_38;
              }
            }
            else
            {
              v17 = _gc_log_generic_device();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134217984;
                v46 = (_OWORD *)entryID;
                _os_log_debug_impl(&dword_20AD04000, v17, OS_LOG_TYPE_DEBUG, "<IOHIDDevice %#llx> is NOT a supported game controller.", buf, 0xCu);
              }
LABEL_38:
            }
          }
          v24 = v15;
          v25 = [v38 result];
          GCAnalyticsSendCheckCompatibleHIDDeviceEvent(v36, v24, [v25 BOOLValue]);

          IOServiceClose(connect);
          IOObjectRelease(v2);

          v26 = v37;
        }
        else
        {
          v31 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
          v32 = +[NSString stringWithUTF8String:"void __HIDDevicesMatched(_GCGenericDeviceManager *__strong, io_iterator_t)"];
          [v31 handleFailureInFunction:v32, @"_GCGenericDeviceManager.m", 448, @"In %s, but missing dbService.", "__HIDDevicesMatched" file lineNumber description];

          v33 = _gc_log_generic_device();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            v46 = (_OWORD *)entryID;
            _os_log_error_impl(&dword_20AD04000, v33, OS_LOG_TYPE_ERROR, "<IOHIDDevice %llx> Error checking game controller support: Internal error.", buf, 0xCu);
          }

          IOServiceClose(connect);
          v26 = 0;
          IOObjectRelease(v2);
        }

        goto LABEL_52;
      }
      v7 = _gc_log_generic_device();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v46 = v51;
        v47 = 2048;
        v48 = (const char *)entryID;
        _os_log_debug_impl(&dword_20AD04000, v7, OS_LOG_TYPE_DEBUG, "Skipping <%s %#llx>.  Rapport device.", buf, 0x16u);
      }

      IOObjectRelease(v2);
LABEL_55:

      os_activity_scope_leave(&state);
    }
    if (IOIteratorIsValid(a2)) {
      break;
    }
    MEMORY[0x21052C850](a2);
  }
}

void sub_20AD15710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,os_activity_scope_state_s state)
{
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

id gcfLocalizedStringCache()
{
  if (gcfLocalizedStringCache_onceToken != -1) {
    dispatch_once(&gcfLocalizedStringCache_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)_gcfLocalizedStringCache;

  return v0;
}

void __gcfLocalizedStringCache_block_invoke()
{
  uint64_t v0 = +[NSMutableDictionary dictionary];
  uint64_t v1 = (void *)_gcfLocalizedStringCache;
  _gcfLocalizedStringCache = v0;

  id v3 = +[NSNotificationCenter defaultCenter];
  id v2 = (id)[v3 addObserverForName:NSCurrentLocaleDidChangeNotification object:0 queue:0 usingBlock:&__block_literal_global_4];
}

void __gcfLocalizedStringCache_block_invoke_2()
{
  os_unfair_lock_lock((os_unfair_lock_t)&gcfLocalizedStringCacheLock);
  uint64_t v0 = gcfLocalizedStringCache();
  [v0 removeAllObjects];

  os_unfair_lock_unlock((os_unfair_lock_t)&gcfLocalizedStringCacheLock);
}

id _GCFConvertStringToLocalizedString(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 description];
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&gcfLocalizedStringCacheLock);
    uint64_t v4 = gcfLocalizedStringCache();
    id v3 = [v4 objectForKey:v2];
    if (!v3)
    {
      uint64_t v5 = +[NSBundle GameControllerFoundationBundle];
      id v3 = [v5 localizedStringForKey:v2 value:&stru_26BED82A0 table:@"Localizable"];

      [v4 setObject:v3 forKey:v2];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&gcfLocalizedStringCacheLock);
  }

  return v3;
}

void sub_20AD16068(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20AD168A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20AD16A3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20AD16B1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_20AD16F64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  objc_sync_exit(v26);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_20AD173EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void IOGCFastPathRoyaReplayClientSetProperty(uint64_t a1, void *a2, void *a3)
{
  do
  {
    os_unfair_lock_lock_with_options();
    id v6 = *(id *)(a1 + 72);
    uint64_t v7 = *(void *)(a1 + 80);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v8 = (void *)[v6 mutableCopy];

    [v8 setValue:a3 forKey:a2];
    id v9 = (id)[v8 copy];

    if (a2)
    {
      if ([a2 isEqualToString:@"ProviderID"])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v7 = [a3 unsignedLongLongValue];
        }
      }
    }
    os_unfair_lock_lock_with_options();
    if (*(id *)(a1 + 72) == v6)
    {
      *(void *)(a1 + 72) = v9;
      *(void *)(a1 + 80) = v7;
      id v6 = v9;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
  while (v6 != v9);
}

__IOGCFastPathRoyaReplayClient *IOGCFastPathRoyaReplayClientCreate(const __CFAllocator *a1)
{
  if (a1) {
    CFAllocatorRef v1 = a1;
  }
  else {
    CFAllocatorRef v1 = kCFAllocatorDefault;
  }
  id v2 = [__IOGCFastPathRoyaReplayClient alloc];
  v2->super.allocator = v1;
  v2->super.pluginInterface = (IOCFPlugInInterfaceStruct **)&v2->_IOCFPlugInVTBL;
  v2->super.clientInterface = (IOGCFastPathClientInterface **)&v2->_IOGCFastPathClientVTBL;
  v2->_IOCFPlugInVTBL = (const IOCFPlugInInterfaceStruct *)&RoyaReplayCFPlugInVtable;
  v2->_IOGCFastPathClientVTBL = (const IOGCFastPathClientInterface *)&RoyaReplayClientVtable;
  v2->_lock._os_unfair_lock_opaque = 0;
  v2->_propertyTable = (NSDictionary *)objc_opt_new();
  return v2;
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSetProperty(unsigned int ***a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (char *)a1 - ***a1;
  os_unfair_lock_lock_with_options();
  id v6 = (void *)*((void *)v5 + 16);
  if (!v6)
  {
    id v6 = objc_opt_new();
    *((void *)v5 + 16) = v6;
  }
  [v6 setValue:a3 forKey:a2];
  os_unfair_lock_unlock((os_unfair_lock_t)v5 + 28);
  return 1;
}

uint64_t __IOGCFastPathRoyaReplayInputQueueGetLatestSamplePosition(unsigned int ***a1, void *a2)
{
  id v2 = (char *)a1 - ***a1;
  int v3 = v2 + 146;
  LOWORD(v3) = atomic_load_explicit((atomic_ushort *volatile)v2 + 73, memory_order_acquire);
  int v4 = v2 + 144;
  LOWORD(v4) = atomic_load_explicit((atomic_ushort *volatile)v2 + 72, memory_order_acquire);
  if (v3) {
    BOOL v5 = v3 == v4;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5) {
    return 3758097112;
  }
  uint64_t result = 0;
  *a2 = atomic_load_explicit((atomic_ullong *volatile)v2 + 20, memory_order_acquire);
  return result;
}

uint64_t IOGCFastPathRoyaReplayInputQueueResetEnqueuePosition(uint64_t a1, unint64_t a2)
{
  return 0;
}

uint64_t IOGCFastPathRoyaReplayInputQueueGetMutableSample(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v7 = 3758097127;
  os_unfair_lock_lock_with_options();
  LOWORD(v3) = atomic_load_explicit((atomic_ushort *volatile)(a1 + 144), memory_order_acquire);
  if (v3)
  {
    unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)(a1 + 160), memory_order_acquire);
    unint64_t v9 = atomic_load_explicit((atomic_ullong *volatile)(a1 + 152), memory_order_acquire);
    if (explicit + 1 >= a2 || v9 == a2)
    {
      if (v9 <= a2)
      {
        unint64_t v11 = *(void *)(a1 + 104);
        if (v11 + a2 > explicit)
        {
          uint64_t v12 = a1 + 168 + 24 * (a2 % v11);
          v15 = *(void **)(v12 + 16);
          v13 = (void *)(v12 + 16);
          Instance = v15;
          if (v15)
          {
            _objc_rootRetainCount();
            if (*((unsigned __int16 *)Instance + 8) != v3 || Instance[3] != a2)
            {
              ++Instance[1];
              *((_WORD *)Instance + 8) = v3;
              Instance[3] = a2;
              bzero(Instance + 4, 48 * *((unsigned __int16 *)Instance + 9));
            }
          }
          else
          {
            v17 = (objc_class *)objc_opt_class();
            Instance = class_createInstance(v17, 0x30uLL);
            *((_WORD *)Instance + 9) = 1;
            *((_WORD *)Instance + 8) = v3;
            Instance[1] = 1;
            Instance[3] = a2;
            void *v13 = Instance;
          }
          uint64_t v7 = 0;
          *(void *)a3 = a1 + 96;
          *(void *)(a3 + 8) = a2;
          *(void *)(a3 + 16) = Instance[1];
          *(_WORD *)(a3 + 24) = v3;
          *(unsigned char *)(a3 + 26) = *(unsigned char *)(a3 + 26) & 0xFC | 2;
        }
      }
    }
    else
    {
      uint64_t v7 = 3758097128;
    }
  }
  else
  {
    uint64_t v7 = 3758097112;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 140));
  return v7;
}

uint64_t __IOGCFastPathRoyaReplayInputQueueGetSample(unsigned int ***a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = 3758097112;
  id v6 = (char *)a1 - ***a1;
  LOWORD(v4) = atomic_load_explicit((atomic_ushort *volatile)v6 + 73, memory_order_acquire);
  int v7 = v6 + 144;
  LOWORD(v7) = atomic_load_explicit((atomic_ushort *volatile)v6 + 72, memory_order_acquire);
  if (v4) {
    BOOL v8 = v4 == v7;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)v6 + 20, memory_order_acquire);
    unint64_t v11 = atomic_load_explicit((atomic_ullong *volatile)v6 + 19, memory_order_acquire);
    if (explicit < a2)
    {
      return 3758097128;
    }
    else
    {
      if (v11 > a2) {
        return 3758097127;
      }
      unint64_t v12 = *((void *)v6 + 13);
      if (v12 + a2 <= explicit)
      {
        return 3758097127;
      }
      else
      {
        uint64_t v14 = (uint64_t)&v6[24 * (a2 % v12) + 168];
        os_unfair_lock_lock_with_options();
        uint64_t v15 = *(void *)(v14 + 8);
        if (v15)
        {
          int v16 = *(unsigned __int16 *)(v15 + 16);
          uint64_t v17 = *(void *)(v15 + 8);
          uint64_t v18 = *(void *)(v15 + 24);
        }
        else
        {
          int v16 = 0;
          uint64_t v17 = 0;
          uint64_t v18 = -1;
        }
        os_unfair_lock_unlock((os_unfair_lock_t)v14);
        if (v16 == v4 && v18 == a2)
        {
          uint64_t v5 = 0;
          *(void *)a4 = v6 + 96;
          *(void *)(a4 + 8) = a2;
          *(void *)(a4 + 16) = v17;
          *(_WORD *)(a4 + 24) = v4;
          *(unsigned char *)(a4 + 26) &= 0xFCu;
        }
      }
    }
  }
  return v5;
}

uint64_t IOGCFastPathSampleGetClient4Roya(unsigned int ****a1)
{
  CFAllocatorRef v1 = **a1;
  if (*((_DWORD *)v1 + 9) == 1919908193) {
    return *(uint64_t *)((char *)*a1 - **v1 + 16);
  }
  else {
    return 0;
  }
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleRead(unsigned int ***a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 3758097127;
  if (*(unsigned int ****)a2 != a1) {
    return 3758097090;
  }
  id v6 = (char *)a1 - ***a1;
  int v7 = v6 + 168;
  uint64_t v8 = *(void *)(a2 + 8) % *((void *)v6 + 13);
  if ((*(unsigned char *)(a2 + 26) & 2) == 0)
  {
    int v9 = v6 + 146;
    LOWORD(v9) = atomic_load_explicit((atomic_ushort *volatile)v6 + 73, memory_order_acquire);
    if (*(unsigned __int16 *)(a2 + 24) == v9)
    {
      uint64_t v10 = &v7[24 * v8];
      os_unfair_lock_lock_with_options();
      unint64_t v11 = *((id *)v10 + 1);
      unint64_t v12 = (os_unfair_lock_s *)v10;
      goto LABEL_5;
    }
    return 3758096385;
  }
  int v14 = v6 + 144;
  LOWORD(v14) = atomic_load_explicit((atomic_ushort *volatile)v6 + 72, memory_order_acquire);
  if (*(unsigned __int16 *)(a2 + 24) != v14) {
    return 3758096385;
  }
  os_unfair_lock_lock_with_options();
  unint64_t v11 = *(id *)&v7[24 * v8 + 16];
  unint64_t v12 = (os_unfair_lock_s *)(v6 + 140);
LABEL_5:
  os_unfair_lock_unlock(v12);
  if (v11 && v11[3] == *(void *)(a2 + 8)) {
    uint64_t v3 = (*(uint64_t (**)(uint64_t, void *))(a3 + 16))(a3, v11);
  }

  return v3;
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleReadField(unsigned int ***a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = ____IOGCFastPathRoyaReplayInputQueueSampleReadField_block_invoke;
  v5[3] = &unk_26BEC43D0;
  v5[4] = a3;
  v5[5] = a4;
  return __IOGCFastPathRoyaReplayInputQueueSampleRead(a1, a2, (uint64_t)v5);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleModify(unsigned int ***a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 3758097090;
  if (*(unsigned int ****)a2 == a1 && (*(unsigned char *)(a2 + 26) & 2) != 0)
  {
    uint64_t v5 = (char *)a1 - ***a1;
    int v6 = v5 + 144;
    LOWORD(v6) = atomic_load_explicit((atomic_ushort *volatile)v5 + 72, memory_order_acquire);
    if (*(unsigned __int16 *)(a2 + 24) == v6)
    {
      os_unfair_lock_lock_with_options();
      unint64_t v8 = *(void *)(a2 + 8);
      uint64_t v9 = (uint64_t)&v5[24 * (v8 % *((void *)v5 + 13)) + 168];
      uint64_t v12 = *(void *)(v9 + 16);
      uint64_t v10 = v9 + 16;
      uint64_t v11 = v12;
      uint64_t v3 = 3758097127;
      if (v12 && *(void *)(v11 + 24) == v8) {
        uint64_t v3 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a3 + 16))(a3, &v5[24 * (v8 % *((void *)v5 + 13)) + 168], v10);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)v5 + 35);
    }
    else
    {
      return 3758096385;
    }
  }
  return v3;
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleModifyField(unsigned int ***a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = ____IOGCFastPathRoyaReplayInputQueueSampleModifyField_block_invoke;
  v5[3] = &unk_26BEC43F8;
  v5[4] = a3;
  v5[5] = a4;
  return __IOGCFastPathRoyaReplayInputQueueSampleModify(a1, a2, (uint64_t)v5);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleDestroy(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 != a1) {
    return 3758097090;
  }
  uint64_t result = 0;
  *(unsigned char *)(a2 + 26) &= 0xFCu;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  *(_WORD *)(a2 + 24) = 0;
  return result;
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleCommit(unsigned int ***a1, uint64_t a2)
{
  id v2 = (char *)a1 - ***a1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = ____IOGCFastPathRoyaReplayInputQueueSampleCommit_block_invoke;
  v4[3] = &unk_26BEC4420;
  v4[4] = v2;
  return __IOGCFastPathRoyaReplayInputQueueSampleModify(a1, a2, (uint64_t)v4);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetPosition(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 8);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetSequenceID(unsigned int ***a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetSequenceID_block_invoke;
  v5[3] = &__block_descriptor_48_e56_i16__0____IOGCFastPathRoyaReplayInputQueueEntryStorage_8l;
  v5[4] = a3;
  v5[5] = a4;
  return __IOGCFastPathRoyaReplayInputQueueSampleRead(a1, a2, (uint64_t)v5);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetSubsampleCount(unsigned int ***a1, uint64_t a2, uint64_t a3)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetSubsampleCount_block_invoke;
  v4[3] = &__block_descriptor_40_e56_i16__0____IOGCFastPathRoyaReplayInputQueueEntryStorage_8l;
  v4[4] = a3;
  return __IOGCFastPathRoyaReplayInputQueueSampleRead(a1, a2, (uint64_t)v4);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetFlags(unsigned int ***a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetFlags_block_invoke;
  v5[3] = &__block_descriptor_40_e56_i16__0____IOGCFastPathRoyaReplayInputQueueEntryStorage_8l;
  v5[4] = a4;
  return __IOGCFastPathRoyaReplayInputQueueSampleRead(a1, a2, (uint64_t)v5);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleSetFlags(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetFlags_block_invoke;
  v5[3] = &__block_descriptor_36_e76_i24__0____IOGCFastPathRoyaReplayInputQueueEntry__os_unfair_lock_s_I____8__16l;
  int v6 = a4;
  return __IOGCFastPathRoyaReplayInputQueueSampleModify(a1, a2, (uint64_t)v5);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetTimestamp(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetTimestamp_block_invoke;
  v11[3] = &__block_descriptor_44_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  int v12 = a4;
  int v13 = a5;
  int v14 = a6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetTimestamp_block_invoke_2;
  v10[3] = &__block_descriptor_56_e131_i16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v10[4] = a7;
  v10[5] = a8;
  v10[6] = a9;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = ____IOGCFastPathRoyaReplayInputQueueSampleReadField_block_invoke;
  v15[3] = &unk_26BEC43D0;
  v15[4] = v11;
  v15[5] = v10;
  return __IOGCFastPathRoyaReplayInputQueueSampleRead(a1, a2, (uint64_t)v15);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleSetTimestamp(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8)
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetTimestamp_block_invoke;
  v13[3] = &__block_descriptor_44_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  int v14 = a4;
  int v15 = a5;
  int v16 = a6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetTimestamp_block_invoke_2;
  v9[3] = &__block_descriptor_60_e130_i16__0____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  int v10 = a4;
  int v11 = a5;
  int v12 = a6;
  v9[4] = a7;
  v9[5] = a8;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = ____IOGCFastPathRoyaReplayInputQueueSampleModifyField_block_invoke;
  v17[3] = &unk_26BEC43F8;
  v17[4] = v13;
  v17[5] = v9;
  return __IOGCFastPathRoyaReplayInputQueueSampleModify(a1, a2, (uint64_t)v17);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetInteger(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetInteger_block_invoke;
  v8[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  int v9 = a4;
  int v10 = a5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetInteger_block_invoke_2;
  v7[3] = &__block_descriptor_40_e131_i16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v7[4] = a6;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = ____IOGCFastPathRoyaReplayInputQueueSampleReadField_block_invoke;
  v11[3] = &unk_26BEC43D0;
  void v11[4] = v8;
  v11[5] = v7;
  return __IOGCFastPathRoyaReplayInputQueueSampleRead(a1, a2, (uint64_t)v11);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleSetInteger(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetInteger_block_invoke;
  v10[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  int v11 = a4;
  int v12 = a5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetInteger_block_invoke_2;
  v7[3] = &__block_descriptor_48_e130_i16__0____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  int v8 = a4;
  int v9 = a5;
  v7[4] = a6;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = ____IOGCFastPathRoyaReplayInputQueueSampleModifyField_block_invoke;
  v13[3] = &unk_26BEC43F8;
  void v13[4] = v10;
  v13[5] = v7;
  return __IOGCFastPathRoyaReplayInputQueueSampleModify(a1, a2, (uint64_t)v13);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetDouble(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetDouble_block_invoke;
  v8[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  int v9 = a4;
  int v10 = a5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetDouble_block_invoke_2;
  v7[3] = &__block_descriptor_40_e131_i16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v7[4] = a6;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = ____IOGCFastPathRoyaReplayInputQueueSampleReadField_block_invoke;
  v11[3] = &unk_26BEC43D0;
  void v11[4] = v8;
  v11[5] = v7;
  return __IOGCFastPathRoyaReplayInputQueueSampleRead(a1, a2, (uint64_t)v11);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleSetDouble(unsigned int ***a1, uint64_t a2, double a3, uint64_t a4, int a5, int a6)
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetDouble_block_invoke;
  v10[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  int v11 = a5;
  int v12 = a6;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetDouble_block_invoke_2;
  v7[3] = &__block_descriptor_48_e130_i16__0____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  int v8 = a5;
  int v9 = a6;
  *(double *)&v7[4] = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = ____IOGCFastPathRoyaReplayInputQueueSampleModifyField_block_invoke;
  v13[3] = &unk_26BEC43F8;
  void v13[4] = v10;
  v13[5] = v7;
  return __IOGCFastPathRoyaReplayInputQueueSampleModify(a1, a2, (uint64_t)v13);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetInteger2(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7)
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetInteger2_block_invoke;
  v9[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  int v10 = a4;
  int v11 = a5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetInteger2_block_invoke_2;
  v8[3] = &__block_descriptor_48_e131_i16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  void v8[4] = a6;
  v8[5] = a7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = ____IOGCFastPathRoyaReplayInputQueueSampleReadField_block_invoke;
  v12[3] = &unk_26BEC43D0;
  v12[4] = v9;
  v12[5] = v8;
  return __IOGCFastPathRoyaReplayInputQueueSampleRead(a1, a2, (uint64_t)v12);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleSetInteger2(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7)
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetInteger2_block_invoke;
  v11[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  int v12 = a4;
  int v13 = a5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetInteger2_block_invoke_2;
  v8[3] = &__block_descriptor_56_e130_i16__0____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  int v9 = a4;
  int v10 = a5;
  void v8[4] = a6;
  v8[5] = a7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = ____IOGCFastPathRoyaReplayInputQueueSampleModifyField_block_invoke;
  v14[3] = &unk_26BEC43F8;
  v14[4] = v11;
  v14[5] = v8;
  return __IOGCFastPathRoyaReplayInputQueueSampleModify(a1, a2, (uint64_t)v14);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetDouble2(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7)
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetDouble2_block_invoke;
  v9[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  int v10 = a4;
  int v11 = a5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetDouble2_block_invoke_2;
  v8[3] = &__block_descriptor_48_e131_i16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  void v8[4] = a6;
  v8[5] = a7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = ____IOGCFastPathRoyaReplayInputQueueSampleReadField_block_invoke;
  v12[3] = &unk_26BEC43D0;
  v12[4] = v9;
  v12[5] = v8;
  return __IOGCFastPathRoyaReplayInputQueueSampleRead(a1, a2, (uint64_t)v12);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleSetDouble2(unsigned int ***a1, uint64_t a2, double a3, double a4, uint64_t a5, int a6, int a7)
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetDouble2_block_invoke;
  v11[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  int v12 = a6;
  int v13 = a7;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetDouble2_block_invoke_2;
  v8[3] = &__block_descriptor_56_e130_i16__0____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  int v9 = a6;
  int v10 = a7;
  *(double *)&void v8[4] = a3;
  *(double *)&v8[5] = a4;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = ____IOGCFastPathRoyaReplayInputQueueSampleModifyField_block_invoke;
  v14[3] = &unk_26BEC43F8;
  v14[4] = v11;
  v14[5] = v8;
  return __IOGCFastPathRoyaReplayInputQueueSampleModify(a1, a2, (uint64_t)v14);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetInteger3(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetInteger3_block_invoke;
  v10[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  int v11 = a4;
  int v12 = a5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetInteger3_block_invoke_2;
  v9[3] = &__block_descriptor_56_e131_i16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  void v9[4] = a6;
  v9[5] = a7;
  void v9[6] = a8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = ____IOGCFastPathRoyaReplayInputQueueSampleReadField_block_invoke;
  v13[3] = &unk_26BEC43D0;
  void v13[4] = v10;
  v13[5] = v9;
  return __IOGCFastPathRoyaReplayInputQueueSampleRead(a1, a2, (uint64_t)v13);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleSetInteger3(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetInteger3_block_invoke;
  v12[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  int v13 = a4;
  int v14 = a5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetInteger3_block_invoke_2;
  v9[3] = &__block_descriptor_64_e130_i16__0____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  int v10 = a4;
  int v11 = a5;
  void v9[4] = a6;
  v9[5] = a7;
  void v9[6] = a8;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = ____IOGCFastPathRoyaReplayInputQueueSampleModifyField_block_invoke;
  v15[3] = &unk_26BEC43F8;
  v15[4] = v12;
  v15[5] = v9;
  return __IOGCFastPathRoyaReplayInputQueueSampleModify(a1, a2, (uint64_t)v15);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetDouble3(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetDouble3_block_invoke;
  v10[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  int v11 = a4;
  int v12 = a5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetDouble3_block_invoke_2;
  v9[3] = &__block_descriptor_56_e131_i16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  void v9[4] = a6;
  v9[5] = a7;
  void v9[6] = a8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = ____IOGCFastPathRoyaReplayInputQueueSampleReadField_block_invoke;
  v13[3] = &unk_26BEC43D0;
  void v13[4] = v10;
  v13[5] = v9;
  return __IOGCFastPathRoyaReplayInputQueueSampleRead(a1, a2, (uint64_t)v13);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleSetDouble3(unsigned int ***a1, uint64_t a2, double a3, double a4, double a5, uint64_t a6, int a7, int a8)
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetDouble3_block_invoke;
  v12[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  int v13 = a7;
  int v14 = a8;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetDouble3_block_invoke_2;
  v9[3] = &__block_descriptor_64_e130_i16__0____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  int v10 = a7;
  int v11 = a8;
  *(double *)&void v9[4] = a3;
  *(double *)&v9[5] = a4;
  *(double *)&void v9[6] = a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = ____IOGCFastPathRoyaReplayInputQueueSampleModifyField_block_invoke;
  v15[3] = &unk_26BEC43F8;
  v15[4] = v12;
  v15[5] = v9;
  return __IOGCFastPathRoyaReplayInputQueueSampleModify(a1, a2, (uint64_t)v15);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetTraceData(unsigned int ***a1, uint64_t a2, void *a3, void *a4, _DWORD *a5, void *a6)
{
  int v6 = (char *)a1 - ***a1;
  *a3 = *(void *)(*((void *)v6 + 2) + 40);
  *a4 = v6;
  *a5 = *((_DWORD *)v6 + 34);
  *a6 = *(void *)(a2 + 8);
  return 1;
}

void *IOGCFastPathRoyaReplayInputQueueCreateWithOptions(uint64_t a1, void *a2, void *a3)
{
  int v4 = (void *)[a3 copy];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = [v4 objectForKeyedSubscript:@"QueueCapacity"];
  if (!v6 || (int v7 = (void *)v6, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    return 0;
  }
  int v8 = (void *)[v5 objectForKeyedSubscript:@"QueueChannel"];
  unsigned int v9 = [v7 unsignedIntValue];
  uint64_t v10 = v9;
  if (v9 <= 1) {
    size_t v11 = 0;
  }
  else {
    size_t v11 = 24 * v9 - 24;
  }
  int v12 = (objc_class *)objc_opt_class();
  Instance = class_createInstance(v12, v11);
  Instance[2] = a2;
  Instance[3] = Instance + 11;
  Instance[11] = &RoyaReplayInputQueueVtable;
  Instance[12] = &RoyaReplayInputSampleContainerVtable;
  Instance[13] = v10;
  *((_DWORD *)Instance + 28) = 0;
  Instance[15] = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v14 = [v8 unsignedIntValue];
  }
  else {
    int v14 = -1;
  }
  *((_DWORD *)Instance + 34) = v14;
  *((_DWORD *)Instance + 35) = 0;
  return Instance;
}

uint64_t queryInterface(unsigned int ***a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend((char *)a1 - ***a1, "queryInterface:outInterface:", a2, a3, a4);
}

uint64_t addRef(unsigned int ***a1)
{
  CFAllocatorRef v1 = (char *)a1 - ***a1;
  int v2 = CFGetRetainCount(v1);
  CFRetain(v1);
  return (v2 + 1);
}

uint64_t release(unsigned int ***a1)
{
  CFAllocatorRef v1 = (char *)a1 - ***a1;
  int v2 = CFGetRetainCount(v1);
  CFRelease(v1);
  return (v2 - 1);
}

uint64_t clientProbe()
{
  return 3758097095;
}

uint64_t clientStart()
{
  return 0;
}

uint64_t clientStop()
{
  return 0;
}

uint64_t clientOpen()
{
  return 0;
}

uint64_t clientClose()
{
  return 0;
}

id clientGetProperty(unsigned int ***a1, uint64_t a2)
{
  uint64_t v3 = (char *)a1 - ***a1;
  os_unfair_lock_lock_with_options();
  id v4 = *((id *)v3 + 9);
  os_unfair_lock_unlock((os_unfair_lock_t)v3 + 16);
  id v5 = (id)[v4 objectForKey:a2];

  return v5;
}

uint64_t clientSetProperty()
{
  return 1;
}

uint64_t clientCreateControlQueue()
{
  return 3758097095;
}

uint64_t clientCreateInputQueue()
{
  return 3758097095;
}

id __IOGCFastPathRoyaReplayInputQueueGetProperty(unsigned int ***a1, uint64_t a2)
{
  uint64_t v3 = (char *)a1 - ***a1;
  id v4 = (id)[*((id *)v3 + 15) objectForKey:a2];
  if (!v4)
  {
    os_unfair_lock_lock_with_options();
    id v4 = (id)[*((id *)v3 + 16) objectForKey:a2];
    os_unfair_lock_unlock((os_unfair_lock_t)v3 + 28);
  }

  return v4;
}

NSXPCInterface *GCConfigXPCServiceClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26BEED778];
}

id GCConfigXPCServiceInterface()
{
  uint64_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26BEE8EA0];
  CFAllocatorRef v1 = GCConfigurationAssetManagementServiceXPCInterface();
  [v0 setInterface:v1 forSelector:sel_connectToAssetManagementServiceWithClient_reply_ argumentIndex:0 ofReply:1];

  int v2 = _GCGenericDeviceDBServiceXPCInterface();
  [v0 setInterface:v2 forSelector:sel_connectToGenericDeviceDBServiceWithClient_reply_ argumentIndex:0 ofReply:1];

  return v0;
}

uint64_t _gc_log_localizedstring()
{
  if (_gc_log_localizedstring_onceToken != -1) {
    dispatch_once(&_gc_log_localizedstring_onceToken, &__block_literal_global_3);
  }
  return _gc_log_localizedstring_Log;
}

os_log_t ___gc_log_localizedstring_block_invoke()
{
  os_log_t result = os_log_create("com.apple.gamecontroller", "LocalizedString");
  _gc_log_localizedstring_Log = (uint64_t)result;
  return result;
}

void sub_20AD1E548(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20AD1EBA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20AD1EF68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20AD1F424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __IOServiceMatchingCallback(const void *a1)
{
  CFAllocatorRef v1 = (void (**)(void))_Block_copy(a1);
  v1[2]();
}

void __IOServiceNotificationCallback(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void (**)(id, uint64_t, uint64_t))_Block_copy(a1);
  v6[2](v6, a3, a4);
}

void sub_20AD20F00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, NSErrorUserInfoKey a12, NSErrorUserInfoKey a13, NSErrorUserInfoKey a14, uint64_t a15, __CFString *a16, uint64_t a17)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v20 = objc_begin_catch(exception_object);
      if (v17)
      {
        a12 = NSLocalizedDescriptionKey;
        v21 = [*(id *)(v19 + 456) stringWithFormat:@"Invalid '%@' definition."];
        a15 = (uint64_t)v21;
        a16 = @"Model build failed.  This is a #BUG.";
        a13 = NSLocalizedFailureReasonErrorKey;
        a14 = NSUnderlyingErrorKey;
        v22 = objc_msgSend(v20, "gc_error");
        a17 = (uint64_t)v22;
        v23 = +[NSDictionary dictionaryWithObjects:&a15 forKeys:&a12 count:3];
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v23);
        void *v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_end_catch();
      JUMPOUT(0x20AD20D3CLL);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_20AD23F34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,NSErrorUserInfoKey a23,NSErrorUserInfoKey a24,NSErrorUserInfoKey a25,uint64_t a26,__CFString *a27,uint64_t a28)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v30 = objc_begin_catch(exception_object);
      if (a16)
      {
        a23 = NSLocalizedDescriptionKey;
        v31 = +[NSString stringWithFormat:@"Invalid '%@' definition."];
        a26 = (uint64_t)v31;
        a27 = @"Model build failed.  This is a #BUG.";
        a24 = NSLocalizedFailureReasonErrorKey;
        a25 = NSUnderlyingErrorKey;
        v32 = objc_msgSend(v30, "gc_error");
        a28 = (uint64_t)v32;
        v33 = [*(id *)(v29 + 480) dictionaryWithObjects:&a26 forKeys:&a23 count:3];
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v33);
        *a16 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_end_catch();
      JUMPOUT(0x20AD23F28);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_20AD24D4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,NSErrorUserInfoKey a21,NSErrorUserInfoKey a22,NSErrorUserInfoKey a23,uint64_t a24,__CFString *a25,uint64_t a26)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v29 = objc_begin_catch(exception_object);
      if (a17)
      {
        a21 = NSLocalizedDescriptionKey;
        id v30 = [*(id *)(v27 + 456) stringWithFormat:@"Invalid '%@' definition."];
        a24 = (uint64_t)v30;
        a25 = @"Model build failed.  This is a #BUG.";
        a22 = NSLocalizedFailureReasonErrorKey;
        a23 = NSUnderlyingErrorKey;
        v31 = objc_msgSend(v29, "gc_error");
        a26 = (uint64_t)v31;
        v32 = [*(id *)(v28 + 480) dictionaryWithObjects:&a24 forKeys:&a21 count:3];
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v32);
        *a17 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_end_catch();
      JUMPOUT(0x20AD24D40);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_20AD261F4()
{
}

uint64_t _IOObjectCFRetain(int a1, uint64_t object)
{
  if (IOObjectRetain(object)) {
    return 0;
  }
  else {
    return object;
  }
}

uint64_t _IOObjectCFRelease(int a1, io_object_t object)
{
  return IOObjectRelease(object);
}

id _gc_log_iokit()
{
  if (_gc_log_iokit_onceToken != -1) {
    dispatch_once(&_gc_log_iokit_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)_gc_log_iokit_Log;

  return v0;
}

uint64_t ___gc_log_iokit_block_invoke()
{
  _gc_log_iokit_Log = (uint64_t)os_log_create("com.apple.gamecontroller", "IOKit");

  return MEMORY[0x270F9A758]();
}

uint64_t IOGCDeviceManagerGetTypeID()
{
  return self;
}

__IOGCDeviceManager *IOGCDeviceManagerCreate(const __CFAllocator *a1)
{
  if (a1) {
    CFAllocatorRef v1 = a1;
  }
  else {
    CFAllocatorRef v1 = kCFAllocatorDefault;
  }
  os_log_t result = [__IOGCDeviceManager alloc];
  result->_allocator = v1;
  return result;
}

void IOGCDeviceManagerSetDispatchQueue(uint64_t a1, dispatch_queue_t queue)
{
  if (atomic_load((unsigned __int8 *)(a1 + 16))) {
    IOGCDeviceManagerSetDispatchQueue_cold_1();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  *(_OWORD *)__str = 0u;
  long long v10 = 0u;
  label = dispatch_queue_get_label(queue);
  uint64_t v6 = "";
  if (label) {
    uint64_t v6 = label;
  }
  snprintf(__str, 0x100uLL, "%s.IOGCDeviceManager", v6);
  dispatch_queue_t v7 = dispatch_queue_create_with_target_V2(__str, 0, queue);
  int v8 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = v7;
}

uint64_t IOGCDeviceManagerSetCancelHandler(uint64_t a1, void *aBlock)
{
  *(void *)(a1 + 48) = _Block_copy(aBlock);

  return MEMORY[0x270F9A758]();
}

uint64_t IOGCDeviceManagerActivate(uint64_t result)
{
  if ((atomic_fetch_or((atomic_uchar *volatile)(result + 16), 1u) & 1) == 0)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 40)) {
      IOGCDeviceManagerActivate_cold_1();
    }
    *(void *)(result + 56) = objc_alloc_init(GCIONotificationPort);
    __IOGCDeviceManagerStartMatching(v1);
    int v2 = *(void **)(v1 + 56);
    uint64_t v3 = *(void *)(v1 + 40);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = __IOGCDeviceManagerActivate_block_invoke;
    v4[3] = &unk_26BEC46A8;
    v4[4] = v1;
    return [v2 setQueue:v3 cancellationHandler:v4];
  }
  return result;
}

void __IOGCDeviceManagerStartMatching(uint64_t a1)
{
  kern_return_t v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  io_iterator_t notification;

  uint64_t v2 = *(void *)(a1 + 56);
  if (v2)
  {
    uint64_t v3 = *(const void **)(a1 + 24);
    if (v3)
    {
      if (*(_DWORD *)(a1 + 64))
      {
        IOObjectRelease(*(_DWORD *)(a1 + 64));
        *(_DWORD *)(a1 + 64) = 0;
        uint64_t v2 = *(void *)(a1 + 56);
      }
      notification = 0;
      id v4 = (IONotificationPort *)-[GCIONotificationPort port](v2);
      CFDictionaryRef v5 = (const __CFDictionary *)CFRetain(v3);
      uint64_t v6 = IOServiceAddMatchingNotification(v4, "IOServiceFirstMatch", v5, (IOServiceMatchingCallback)__IOGCDeviceManagerDevicesAdded, (void *)a1, &notification);
      if (v6)
      {
        dispatch_queue_t v7 = v6;
        int v8 = _gc_log_iokit();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          __IOGCDeviceManagerStartMatching_cold_1(a1, v7, v8);
        }
      }
      unsigned int v9 = notification;
      *(_DWORD *)(a1 + 64) = notification;
      __IOGCDeviceManagerHandleDevices(a1, v9, 1, 1);
    }
  }
}

void __IOGCDeviceManagerActivate_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void (***)(void))(v1 + 48);
  *(void *)(v1 + 48) = 0;
  if (v2)
  {
    v2[2](v2);
    _Block_release(v2);
  }
}

void IOGCDeviceManagerCancel(uint64_t a1)
{
  if ((atomic_fetch_or((atomic_uchar *volatile)(a1 + 16), 3u) & 2) == 0)
  {
    io_object_t v2 = *(_DWORD *)(a1 + 64);
    if (v2)
    {
      IOObjectRelease(v2);
      *(_DWORD *)(a1 + 64) = 0;
    }

    *(void *)(a1 + 56) = 0;
  }
}

void IOGCDeviceManagerSetDeviceMatching(uint64_t a1, uint64_t a2)
{
  CFMutableDictionaryRef v4 = IOServiceMatching("IOHIDGCDevice");
  CFMutableDictionaryRef v5 = v4;
  if (a2) {
    [(__CFDictionary *)v4 addEntriesFromDictionary:a2];
  }
  uint64_t v6 = *(const void **)(a1 + 24);
  if (v6) {
    CFRelease(v6);
  }
  *(void *)(a1 + 24) = v5;

  __IOGCDeviceManagerStartMatching(a1);
}

CFSetRef IOGCDeviceManagerCopyDevices(uint64_t a1)
{
  if (!*(void *)(a1 + 56))
  {
    CFSetRef result = *(CFSetRef *)(a1 + 24);
    if (!result) {
      return result;
    }
    io_iterator_t existing = 0;
    CFDictionaryRef v3 = (const __CFDictionary *)CFRetain(result);
    if (IOServiceGetMatchingServices(kIOMainPortDefault, v3, &existing)) {
      return 0;
    }
    __IOGCDeviceManagerHandleDevices(a1, existing, 1, 0);
    IOObjectRelease(existing);
  }
  CFSetRef v4 = *(const __CFSet **)(a1 + 32);
  if (v4) {
    return CFSetCreateCopy(*(CFAllocatorRef *)(a1 + 8), v4);
  }
  return 0;
}

void __IOGCDeviceManagerHandleDevices(uint64_t a1, uint64_t a2, int a3, int a4)
{
  CFSetRef Mutable = CFSetCreateMutable(*(CFAllocatorRef *)(a1 + 8), 0, &kCFTypeSetCallBacks);
  unsigned int v9 = CFSetCreateMutable(*(CFAllocatorRef *)(a1 + 8), 0, &kCFTypeSetCallBacks);
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    if (!a2) {
      goto LABEL_12;
    }
  }
  else
  {
    CFAllocatorRef v18 = *(const __CFAllocator **)(a1 + 8);
    CFIndex Count = CFSetGetCount(Mutable);
    *(void *)(a1 + 32) = CFSetCreateMutable(v18, Count, &kCFTypeSetCallBacks);
    if (!a2) {
      goto LABEL_12;
    }
  }
  *(void *)&long long v10 = 138413058;
  long long v29 = v10;
  while (1)
  {
    while (1)
    {
      uint64_t v12 = IOIteratorNext(a2);
      if (!v12) {
        break;
      }
      uint64_t v13 = v12;
      long long v14 = [[__IOGCDevice alloc] initWithPort:v12 error:0];
      IOObjectRelease(v13);
      if (v14)
      {
        CFSetAddValue(Mutable, v14);
      }
      else
      {
        uint64_t entryID = 0;
        memset(v46, 0, sizeof(v46));
        IORegistryEntryGetRegistryEntryID(v13, &entryID);
        MEMORY[0x21052C920](v13, v46);
        long long v15 = _gc_log_iokit();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = entryID;
          int v17 = [0 code];
          *(_DWORD *)buf = v29;
          uint64_t v39 = a1;
          __int16 v40 = 2080;
          v41 = v46;
          __int16 v42 = 2048;
          uint64_t v43 = v16;
          __int16 v44 = 1024;
          int v45 = v17;
          _os_log_impl(&dword_20AD04000, v15, OS_LOG_TYPE_DEFAULT, "%@ #ERROR Failed to create IOGCDevice for service <%s %#llx>: %{mach.errno}d.", buf, 0x26u);
        }
      }
    }
    if (IOIteratorIsValid(a2)) {
      break;
    }
    MEMORY[0x21052C850](a2);
  }
LABEL_12:
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = ____IOGCDeviceManagerHandleDevices_block_invoke;
  v35[3] = &unk_26BEC46D0;
  v35[4] = a1;
  v35[5] = a1;
  v35[6] = v9;
  [(__CFSet *)Mutable filterUsingPredicate:+[NSPredicate predicateWithBlock:](&off_26BEEE790, "predicateWithBlock:", v35, v29)];
  if (a3)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v20 = *(void **)(a1 + 32);
    uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(const void **)(*((void *)&v31 + 1) + 8 * i);
          if (!CFSetContainsValue(Mutable, v25))
          {
            v26 = *(__CFDictionary **)(a1 + 72);
            if (v26) {
              CFDictionaryRemoveValue(v26, v25);
            }
          }
          CFSetAddValue(v9, v25);
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v22);
    }
  }
  [*(id *)(a1 + 32) minusSet:v9];
  [*(id *)(a1 + 32) unionSet:Mutable];
  if (a4)
  {
    uint64_t v27 = *(void *)(a1 + 80);
    if (v27)
    {
      uint64_t v28 = *(void *)(a1 + 88);
      CFRetain(Mutable);
      CFRetain(v9);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = ____IOGCDeviceManagerHandleDevices_block_invoke_2;
      block[3] = &__block_descriptor_64_e5_v8__0l;
      block[4] = v9;
      block[5] = v27;
      block[6] = v28;
      block[7] = Mutable;
      if (v11) {
        ____IOGCDeviceManagerHandleDevices_block_invoke_2((uint64_t)block);
      }
      else {
        dispatch_async(*(dispatch_queue_t *)(a1 + 40), block);
      }
    }
  }
  CFRelease(v9);
  CFRelease(Mutable);
}

uint64_t IOGCDeviceManagerSetDeviceMatchingCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (atomic_load((unsigned __int8 *)(result + 16))) {
    IOGCDeviceManagerSetDeviceMatchingCallback_cold_1();
  }
  *(void *)(result + 80) = a2;
  *(void *)(result + 88) = a3;
  return result;
}

void __IOGCDeviceManagerDevicesAdded(uint64_t a1, uint64_t a2)
{
}

void __IOGCDeviceManagerStopObservingDevice(uint64_t a1, CFTypeRef cf, int a3)
{
  uint64_t v6 = *(__CFDictionary **)(a1 + 72);
  if (v6) {
    CFDictionaryRemoveValue(v6, cf);
  }
  if (a3)
  {
    CFRetain(cf);
    CFSetRemoveValue(*(CFMutableSetRef *)(a1 + 32), cf);
    dispatch_queue_t v7 = *(void (**)(void, CFTypeRef, void))(a1 + 80);
    if (v7) {
      v7(*(void *)(a1 + 88), cf, 0);
    }
    CFRelease(cf);
  }
}

__IOGCFastPathSimpleReader *IOGCFastPathSimpleReaderCreate(__CFAllocator *a1, void *a2)
{
  CFSetRef v4 = [__IOGCFastPathSimpleReader alloc];
  v4->super.allocator = a1;
  v4->super.queue = (__IOGCFastPathInputQueue *)a2;
  v4->super.readerInterface = (IOGCFastPathReaderInterface **)&v4->_IOGCFastPathReaderVTBL;
  v4->_IOGCFastPathReaderVTBL = (const IOGCFastPathReaderInterface *)&__IOGCFastPathSimpleReaderVtable;
  return v4;
}

uint64_t __IOGCFastPathSimpleReader_QueryInterface(unsigned int ***a1, CFUUIDBytes a2, void *a3)
{
  uint64_t v5 = ***a1;
  CFUUIDRef v6 = CFUUIDCreateFromUUIDBytes(0, a2);
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v6, v7)
    || (CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes(0, 0x6Bu, 0x29u, 0x76u, 0xBCu, 0xFu, 0xD5u, 0x4Bu, 0x35u, 0xAAu, 0x8Cu, 7u, 0x9Du, 0x84u, 0xBEu, 0xAu, 0x4Bu), CFEqual(v6, v8)))
  {
    *a3 = (char *)a1 - v5 + 32;
    CFRetain((char *)a1 - v5);
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = 2147483652;
  }
  CFRelease(v6);
  return v9;
}

uint64_t __IOGCFastPathSimpleReader_AddRef(unsigned int ***a1)
{
  uint64_t v1 = (char *)a1 - ***a1;
  int v2 = CFGetRetainCount(v1);
  CFRetain(v1);
  return (v2 + 1);
}

uint64_t __IOGCFastPathSimpleReader_Release(unsigned int ***a1)
{
  uint64_t v1 = (char *)a1 - ***a1;
  int v2 = CFGetRetainCount(v1);
  CFRelease(v1);
  return (v2 - 1);
}

uint64_t __IOGCFastPathSimpleReader_Reset(unsigned int ***a1)
{
  return IOGCFastPathInputQueueGetLatestSamplePosition(*(uint64_t *)((char *)a1 - ***a1 + 16));
}

uint64_t __IOGCFastPathSimpleReader_GetReadPosition(unsigned int ***a1, void *a2)
{
  *a2 = *(unsigned int ***)((char *)a1 - ***a1 + 40);
  return 0;
}

uint64_t __IOGCFastPathSimpleReader_ReadCurrentSample(unsigned int ***a1, uint64_t a2)
{
  int v2 = (char *)a1 - ***a1;
  return IOGCFastPathInputQueueGetSample(*((void *)v2 + 2), *((void *)v2 + 5), a2);
}

uint64_t __IOGCFastPathSimpleReader_ReadNextSample(unsigned int ***a1, _OWORD *a2)
{
  CFDictionaryRef v3 = (char *)a1 - ***a1;
  memset(v8, 0, sizeof(v8));
  if (a2) {
    CFSetRef v4 = a2;
  }
  else {
    CFSetRef v4 = v8;
  }
  uint64_t Sample = IOGCFastPathInputQueueGetSample(*((void *)v3 + 2), *((void *)v3 + 5) + 1, (uint64_t)v4);
  uint64_t v6 = Sample;
  if (Sample == -536870169)
  {
LABEL_8:
    ++*((void *)v3 + 5);
    return v6;
  }
  if (!Sample)
  {
    if (!a2) {
      IOGCFastPathSampleDestory((uint64_t *)v8);
    }
    goto LABEL_8;
  }
  return v6;
}

uint64_t __IOGCFastPathSimpleReader_ReadPreviousSample(unsigned int ***a1, _OWORD *a2)
{
  int v2 = (char *)a1 - ***a1;
  uint64_t v3 = *((void *)v2 + 5);
  if (!v3) {
    return 3758097127;
  }
  memset(v9, 0, sizeof(v9));
  if (a2) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = v9;
  }
  uint64_t Sample = IOGCFastPathInputQueueGetSample(*((void *)v2 + 2), v3 - 1, (uint64_t)v5);
  uint64_t v7 = Sample;
  if (Sample == -536870169) {
    goto LABEL_9;
  }
  if (!Sample)
  {
    if (!a2) {
      IOGCFastPathSampleDestory((uint64_t *)v9);
    }
LABEL_9:
    --*((void *)v2 + 5);
  }
  return v7;
}

uint64_t GCPrepareIOCFPlugInVtbl(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = objc_opt_class();
  CFSetRef v4 = objc_getAssociatedObject(v3, &unk_26BEED7D8);
  if (!v4)
  {
    CFSetRef v4 = (void *)[objc_alloc((Class)&off_26BEEE0C0) initWithLength:64];
    objc_setAssociatedObject(v3, &unk_26BEED7D8, v4, (void *)0x301);
  }
  id v5 = v4;
  uint64_t v6 = [v5 mutableBytes];

  if (!*(void *)v6)
  {
    *(void *)uint64_t v6 = a2;
    *(void *)(v6 + 8) = queryInterface_0;
    *(void *)(v6 + 16) = addRef_0;
    *(void *)(v6 + 24) = release_0;
    *(_DWORD *)(v6 + 32) = 1;
    *(void *)(v6 + 40) = probe;
    *(void *)(v6 + 48) = start;
    *(void *)(v6 + 56) = stop;
  }
  return v6;
}

uint64_t probe(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [(char *)a1 - **a1 probe:a2 service:a3 outScore:a4];
}

uint64_t start(void **a1, uint64_t a2, uint64_t a3)
{
  return [(char *)a1 - **a1 start:a2 service:a3];
}

uint64_t stop(void **a1)
{
  return [(char *)a1 - **a1 stop];
}

uint64_t IOGCCircularControlQueueMemorySize(unsigned int a1, int a2)
{
  uint64_t result = 0;
  if (a2)
  {
    unsigned int v4 = ((2 * a1 + 14) & 0xFFFFFFF0) + 64;
    if (v4 >= a1)
    {
      uint64_t v5 = 2 * a2 * v4;
      if (v5 > 0xFFFFFFB7) {
        return 0;
      }
      else {
        return v5 + 72;
      }
    }
  }
  return result;
}

uint64_t IOGCCircularControlQueueMemoryInit(unint64_t *a1, uint64_t a2, unsigned int a3, int a4, unint64_t a5)
{
  bzero(a1, a3);
  *(void *)a2 = a5;
  *a1 = a5;
  *(_DWORD *)(a2 + 8) = a3;
  *(_DWORD *)(a2 + 12) = a4;
  *((_DWORD *)a1 + 2) = a3;
  *((_DWORD *)a1 + 3) = a4;
  atomic_store(0, a1 + 2);
  atomic_store(0xFFFFFFFFFFFFFFFFLL, a1 + 3);
  atomic_store(0xFFFFFFFFFFFFFFFFLL, a1 + 4);
  atomic_store(0xFFFFFFFFFFFFFFFFLL, a1 + 5);
  atomic_store(0xFFFFFFFFFFFFFFFFLL, a1 + 6);
  atomic_store(0xFFFFFFFFFFFFFFFFLL, a1 + 7);
  unsigned int v10 = ((2 * a4 + 14) & 0xFFFFFFF0) + 64;
  unsigned int v11 = a3 - 72;
  atomic_store(0xFFFFFFFFFFFFFFFFLL, a1 + 8);
  if (v10 <= a3 - 72)
  {
    unsigned int v12 = 0;
    LODWORD(v13) = v11 / v10;
    if (v11 / v10 <= 1) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = v13;
    }
    do
    {
      long long v14 = (unint64_t *)((char *)a1 + v12 + 72);
      unint64_t *v14 = a5;
      v14[2] = 0;
      v14[3] = -1;
      v14[4] = -1;
      v14[5] = 0;
      v12 += v10;
      void v14[6] = -1;
      v14[7] = -1;
      --v13;
    }
    while (v13);
  }
  return 0;
}

uint64_t IOGCCircularControlQueueInit(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  uint64_t result = 3758097105;
  if (*(void *)a2 == a5 && *(_DWORD *)(a2 + 8) == a3 && *(_DWORD *)(a2 + 12) == a4)
  {
    uint64_t result = 0;
    *(void *)a1 = a2;
    *(void *)(a1 + 8) = a5;
    *(_DWORD *)(a1 + 16) = a3;
    *(_DWORD *)(a1 + 20) = a4;
  }
  return result;
}

uint64_t IOGCCircularControlQueueReset(void *a1, unint64_t a2)
{
  int v2 = (void *)*a1;
  if (*(void *)*a1 != a1[1]) {
    return 3758097105;
  }
  uint64_t result = 0;
  unsigned int v4 = v2 + 2;
  unint64_t v5 = atomic_load_explicit(v2 + 2, memory_order_acquire) + 1;
  uint64_t v6 = &v2[3 * (v5 & 1)];
  atomic_store(0xFFFFFFFFFFFFFFFFLL, v6 + 3);
  atomic_store(a2, v6 + 4);
  atomic_store(0xFFFFFFFFFFFFFFFFLL, v6 + 5);
  atomic_store(v5, v4);
  return result;
}

uint64_t IOGCCircularControlQueueGetNextApplyPosition(void *a1, void *a2)
{
  int v2 = (void *)*a1;
  if (*(void *)*a1 != a1[1]) {
    return 3758097105;
  }
  uint64_t result = 0;
  *a2 = v2[3 * (atomic_load_explicit(v2 + 2, memory_order_acquire) & 1) + 4];
  return result;
}

uint64_t IOGCCircularControlQueueGetLastAppliedPosition(void *a1, void *a2)
{
  int v2 = (void *)*a1;
  if (*(void *)*a1 != a1[1]) {
    return 3758097105;
  }
  uint64_t result = 0;
  *a2 = v2[3 * (atomic_load_explicit(v2 + 2, memory_order_acquire) & 1) + 3];
  return result;
}

uint64_t IOGCCircularControlQueueReadBackwardsFromLatestEnqueued(uint64_t **a1, char a2, uint64_t a3)
{
  uint64_t result = 3758097105;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 0x40000000;
  uint64_t v13 = __IOGCCircularControlQueueReadBackwardsFromLatestEnqueued_block_invoke;
  long long v14 = &unk_26BEC4808;
  uint64_t v15 = a3;
  char v16 = a2;
  unint64_t v5 = *a1;
  uint64_t v6 = (uint64_t *)**a1;
  if (v6 == a1[1])
  {
    int v7 = *((_DWORD *)v5 + 2);
    if (v7 == *((_DWORD *)a1 + 4))
    {
      int v8 = *((_DWORD *)v5 + 3);
      if (v8 == *((_DWORD *)a1 + 5))
      {
        unint64_t explicit = atomic_load_explicit(v5 + 2, memory_order_acquire);
        unsigned int v10 = &v5[3 * (explicit & 1)];
        atomic_load_explicit(v10 + 3, memory_order_acquire);
        unint64_t v11 = atomic_load_explicit(v10 + 4, memory_order_acquire);
        atomic_load_explicit(v10 + 5, memory_order_acquire);
        if (explicit == atomic_load_explicit(v5 + 2, memory_order_acquire))
        {
          int v17 = _NSConcreteStackBlock;
          uint64_t v18 = 0x40000000;
          long long v19 = ___IOGCCircularControlQueueValidateAndAccess_block_invoke;
          long long v20 = &__block_descriptor_tmp_8;
          unsigned int v25 = (v7 - 72) / (2 * ((v8 + 7) & 0xFFFFFFF8) + 64);
          unsigned int v26 = 2 * ((v8 + 7) & 0xFFFFFFF8) + 64;
          uint64_t v21 = v5;
          unint64_t v22 = v11;
          uint64_t v23 = v6;
          unint64_t v24 = explicit;
          int v27 = v7;
          unsigned int v28 = (v8 + 7) & 0xFFFFFFF8;
          int v29 = v8;
          return ((uint64_t (*)(void *))v13)(v12);
        }
        else
        {
          return 3758097109;
        }
      }
    }
  }
  return result;
}

uint64_t __IOGCCircularControlQueueReadBackwardsFromLatestEnqueued_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11, uint64_t a12)
{
  unint64_t v12 = a10;
  if (a10 == -1) {
    return 3758097112;
  }
  if (a10 < a8)
  {
LABEL_9:
    if (*(unsigned char *)(a1 + 40))
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 0x40000000;
      v22[2] = __IOGCCircularControlQueueReadBackwardsFromLatestEnqueued_block_invoke_3;
      v22[3] = &unk_26BEC47E0;
      v22[4] = *(void *)(a1 + 32);
      v22[5] = v12;
      v22[6] = a7;
      unsigned int v18 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(a12 + 16))(a12, a6, v22);
      if (v18 == -536870166) {
        return 3758097136;
      }
      else {
        return v18;
      }
    }
    else
    {
      return 3758097136;
    }
  }
  else
  {
    while (1)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 0x40000000;
      v23[2] = __IOGCCircularControlQueueReadBackwardsFromLatestEnqueued_block_invoke_2;
      v23[3] = &unk_26BEC47B8;
      v23[4] = *(void *)(a1 + 32);
      v23[5] = v12;
      v23[6] = a7;
      v23[7] = a9;
      uint64_t v16 = (*(uint64_t (**)(uint64_t, unint64_t, void *))(a12 + 16))(a12, v12, v23);
      if (v16 != -536870166 && v16 != -536870184) {
        return v16;
      }
      if (--v12 < a8) {
        goto LABEL_9;
      }
    }
  }
}

uint64_t __IOGCCircularControlQueueReadBackwardsFromLatestEnqueued_block_invoke_2(uint64_t a1)
{
  if (!(*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    return 3758097130;
  }
  uint64_t result = 0;
  **(void **)(a1 + 48) = *(void *)(a1 + 40);
  atomic_store(*(void *)(a1 + 40) + 1, *(unint64_t **)(a1 + 56));
  return result;
}

uint64_t __IOGCCircularControlQueueReadBackwardsFromLatestEnqueued_block_invoke_3(uint64_t a1)
{
  if (!(*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    return 3758097130;
  }
  uint64_t result = 0;
  **(void **)(a1 + 48) = *(void *)(a1 + 40);
  return result;
}

uint64_t IOGCCircularControlQueueReadForwardFromNextApply(uint64_t **a1, char a2, uint64_t a3)
{
  uint64_t result = 3758097105;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 0x40000000;
  uint64_t v13 = __IOGCCircularControlQueueReadForwardFromNextApply_block_invoke;
  long long v14 = &unk_26BEC4880;
  uint64_t v15 = a3;
  char v16 = a2;
  unint64_t v5 = *a1;
  uint64_t v6 = (uint64_t *)**a1;
  if (v6 == a1[1])
  {
    int v7 = *((_DWORD *)v5 + 2);
    if (v7 == *((_DWORD *)a1 + 4))
    {
      int v8 = *((_DWORD *)v5 + 3);
      if (v8 == *((_DWORD *)a1 + 5))
      {
        unint64_t explicit = atomic_load_explicit(v5 + 2, memory_order_acquire);
        unsigned int v10 = &v5[3 * (explicit & 1)];
        atomic_load_explicit(v10 + 3, memory_order_acquire);
        unint64_t v11 = atomic_load_explicit(v10 + 4, memory_order_acquire);
        atomic_load_explicit(v10 + 5, memory_order_acquire);
        if (explicit == atomic_load_explicit(v5 + 2, memory_order_acquire))
        {
          int v17 = _NSConcreteStackBlock;
          uint64_t v18 = 0x40000000;
          long long v19 = ___IOGCCircularControlQueueValidateAndAccess_block_invoke;
          long long v20 = &__block_descriptor_tmp_8;
          unsigned int v25 = (v7 - 72) / (2 * ((v8 + 7) & 0xFFFFFFF8) + 64);
          unsigned int v26 = 2 * ((v8 + 7) & 0xFFFFFFF8) + 64;
          uint64_t v21 = v5;
          unint64_t v22 = v11;
          uint64_t v23 = v6;
          unint64_t v24 = explicit;
          int v27 = v7;
          unsigned int v28 = (v8 + 7) & 0xFFFFFFF8;
          int v29 = v8;
          return ((uint64_t (*)(void *))v13)(v12);
        }
        else
        {
          return 3758097109;
        }
      }
    }
  }
  return result;
}

uint64_t __IOGCCircularControlQueueReadForwardFromNextApply_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t result = 3758097112;
  if (a8 != -1 && a10 != -1)
  {
    uint64_t v14 = a8;
    while (1)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 0x40000000;
      v19[2] = __IOGCCircularControlQueueReadForwardFromNextApply_block_invoke_2;
      v19[3] = &unk_26BEC4830;
      v19[4] = *(void *)(a1 + 32);
      v19[5] = v14;
      v19[6] = a7;
      v19[7] = a9;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void *))(a12 + 16))(a12, v14, v19);
      if (result != -536870166 && result != -536870184) {
        break;
      }
      if (++v14 >= a10)
      {
        uint64_t result = 3758097136;
        if (*(unsigned char *)(a1 + 40))
        {
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 0x40000000;
          v18[2] = __IOGCCircularControlQueueReadForwardFromNextApply_block_invoke_3;
          v18[3] = &unk_26BEC4858;
          v18[4] = *(void *)(a1 + 32);
          v18[5] = v14;
          LODWORD(result) = (*(uint64_t (**)(uint64_t, uint64_t, void *))(a12 + 16))(a12, a6, v18);
          if (result == -536870166) {
            return 3758097136;
          }
          else {
            return result;
          }
        }
        return result;
      }
    }
  }
  return result;
}

uint64_t __IOGCCircularControlQueueReadForwardFromNextApply_block_invoke_2(uint64_t a1)
{
  if (!(*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    return 3758097130;
  }
  uint64_t result = 0;
  **(void **)(a1 + 48) = *(void *)(a1 + 40);
  atomic_store(*(void *)(a1 + 40) + 1, *(unint64_t **)(a1 + 56));
  return result;
}

uint64_t __IOGCCircularControlQueueReadForwardFromNextApply_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((*(unsigned int (**)(void, void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), 1, a2, a3))
  {
    return 0;
  }
  else
  {
    return 3758097130;
  }
}

uint64_t IOGCCircularControlQueueReadNext(uint64_t **a1, uint64_t a2)
{
  uint64_t result = 3758097105;
  unsigned int v4 = *a1;
  unint64_t v5 = (uint64_t *)**a1;
  if (v5 == a1[1])
  {
    uint64_t v6 = *((unsigned int *)v4 + 2);
    if (v6 == *((_DWORD *)a1 + 4))
    {
      int v7 = *((_DWORD *)v4 + 3);
      if (v7 == *((_DWORD *)a1 + 5))
      {
        unint64_t explicit = atomic_load_explicit(v4 + 2, memory_order_acquire);
        uint64_t v9 = &v4[3 * (explicit & 1)];
        unint64_t v10 = atomic_load_explicit(v9 + 4, memory_order_acquire);
        if (v10 == -1)
        {
          return 3758097112;
        }
        else
        {
          uint64_t v11 = ((2 * v7 + 14) & 0xFFFFFFF0) + 64;
          unint64_t v12 = (uint64_t **)((char *)v4
                           + v11 * (v10 % (((int)v6 - 72) / v11))
                           + 72);
          if ((char *)v12 + v11 <= (char *)v4 + v6 && *v12 == v5)
          {
            unint64_t v13 = atomic_load_explicit((uint64_t *)((char *)v4+ v11 * (v10 % (((int)v6 - 72) / v11))+ 80), memory_order_acquire) & 1;
            uint64_t result = 3758097112;
            if (v12[3 * v13 + 3] == (uint64_t *)explicit
              && v12[3 * v13 + 4] == (uint64_t *)v10)
            {
              uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t, unint64_t))(a2 + 16))(a2, v10, (unint64_t)v12 + v13 * (unint64_t)((v7 + 7) & 0xFFFFFFF8) + 64);
              if (result)
              {
                uint64_t result = 0;
                v9[3] = v10;
                atomic_store(v10 + 1, (unint64_t *)v9 + 4);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t IOGCCircularControlQueueEntryModify(uint64_t **a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = 3758097105;
  unint64_t v5 = *a1;
  uint64_t v6 = (uint64_t *)**a1;
  if (v6 == a1[1])
  {
    uint64_t v7 = *((unsigned int *)v5 + 2);
    if (v7 == *((_DWORD *)a1 + 4))
    {
      uint64_t v8 = *((unsigned int *)v5 + 3);
      if (v8 == *((_DWORD *)a1 + 5))
      {
        unint64_t explicit = atomic_load_explicit(v5 + 2, memory_order_acquire);
        unint64_t v10 = atomic_load_explicit(&v5[3 * (explicit & 1) + 4], memory_order_acquire);
        if (v10 == -1)
        {
          return 3758097112;
        }
        else
        {
          unsigned int v11 = (v8 + 7) & 0xFFFFFFF8;
          uint64_t v12 = (((int)v7 - 72) / (2 * v11 + 64)) >> 1;
          if (v10 + v12 <= (unint64_t)a2)
          {
            return 3758097128;
          }
          else if ((unint64_t)a2 + v12 <= v10)
          {
            return 3758097127;
          }
          else
          {
            uint64_t v13 = ((2 * v8 + 14) & 0xFFFFFFF0) + 64;
            uint64_t v14 = (uint64_t **)((char *)v5
                             + v13
                             * ((unint64_t)a2 % (((int)v7 - 72) / v13))
                             + 72);
            if ((char *)v14 + v13 <= (char *)v5 + v7 && *v14 == v6)
            {
              unint64_t v15 = atomic_load_explicit((uint64_t *)((char *)v5+ v13* ((unint64_t)a2 % (((int)v7 - 72) / v13))+ 80), memory_order_acquire);
              char v16 = &v14[3 * ((v15 & 1) == 0)];
              v16[2] = (uint64_t *)v15;
              v16[3] = (uint64_t *)explicit;
              void v16[4] = a2;
              (*(void (**)(uint64_t, unint64_t, uint64_t))(a3 + 16))(a3, (unint64_t)v14 + ((v15 & 1) == 0) * (unint64_t)v11 + 64, v8);
              return 0;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t IOGCCircularControlQueueEntryCommitModifications(uint64_t **a1, unint64_t a2)
{
  uint64_t result = 3758097105;
  unsigned int v4 = *a1;
  unint64_t v5 = (uint64_t *)**a1;
  if (v5 != a1[1]) {
    return result;
  }
  uint64_t v6 = *((unsigned int *)v4 + 2);
  if (v6 != *((_DWORD *)a1 + 4)) {
    return result;
  }
  int v7 = *((_DWORD *)v4 + 3);
  if (v7 != *((_DWORD *)a1 + 5)) {
    return result;
  }
  unint64_t explicit = atomic_load_explicit(v4 + 2, memory_order_acquire);
  uint64_t v9 = &v4[3 * (explicit & 1)];
  unint64_t v10 = atomic_load_explicit(v9 + 4, memory_order_acquire);
  unsigned int v11 = v9 + 5;
  unint64_t v12 = atomic_load_explicit(v11, memory_order_acquire);
  if (v10 == -1) {
    return 3758097112;
  }
  unsigned int v13 = ((2 * v7 + 14) & 0xFFFFFFF0) + 64;
  unint64_t v14 = ((int)v6 - 72) / v13;
  uint64_t v15 = v14 >> 1;
  if (v10 + v15 <= a2) {
    return 3758097128;
  }
  if (v15 + a2 <= v10) {
    return 3758097127;
  }
  char v16 = (uint64_t *)((char *)v4 + v13 * (a2 % v14) + 72);
  if ((char *)v16 + v13 <= (char *)v4 + v6 && (uint64_t *)*v16 == v5)
  {
    unint64_t v17 = atomic_load_explicit(v16 + 1, memory_order_acquire) + 1;
    if (v16[3 * (v17 & 1) + 3] != explicit) {
      return 3758097131;
    }
    if (v16[3 * (v17 & 1) + 4] == a2)
    {
      atomic_store(v17, v16 + 1);
      if (v12 != -1 && v12 >= a2) {
        return 0;
      }
      uint64_t result = 0;
      atomic_store(a2, (unint64_t *)v11);
      return result;
    }
    return 3758097112;
  }
  return result;
}

uint64_t IOGCCircularControlQueueEntryResetModifications(uint64_t **a1, unint64_t a2)
{
  uint64_t result = 3758097105;
  unsigned int v4 = *a1;
  unint64_t v5 = (uint64_t *)**a1;
  if (v5 == a1[1])
  {
    uint64_t v6 = *((unsigned int *)v4 + 2);
    if (v6 == *((_DWORD *)a1 + 4))
    {
      size_t v7 = *((unsigned int *)v4 + 3);
      if (v7 == *((_DWORD *)a1 + 5))
      {
        unint64_t explicit = atomic_load_explicit(&v4[3 * (atomic_load_explicit(v4 + 2, memory_order_acquire) & 1) + 4], memory_order_acquire);
        if (explicit == -1)
        {
          return 3758097112;
        }
        else
        {
          unsigned int v9 = (v7 + 7) & 0xFFFFFFF8;
          uint64_t v11 = (((int)v6 - 72) / (2 * v9 + 64)) >> 1;
          if (explicit + v11 <= a2)
          {
            return 3758097128;
          }
          else if (v11 + a2 <= explicit)
          {
            return 3758097127;
          }
          else
          {
            uint64_t v12 = ((2 * v7 + 14) & 0xFFFFFFF0) + 64;
            unsigned int v10 = v6 - 72;
            unsigned int v13 = (uint64_t **)((char *)v4
                             + v12 * (a2 % (((int)v6 - 72) / v12))
                             + 72);
            if ((char *)v13 + v12 <= (char *)v4 + v6 && *v13 == v5)
            {
              unsigned int v14 = atomic_load_explicit((uint64_t *)((char *)v4 + v12 * (a2 % (v10 / v12)) + 80), memory_order_acquire) & 1;
              uint64_t v15 = (uint64_t)&v4[3 * v14 + 11] + v12 * (a2 % (v10 / v12));
              uint64_t v16 = (uint64_t)&v4[3 * (v14 ^ 1) + 11]
                  + v12 * (a2 % (v10 / v12));
              memcpy((char *)v13 + (v14 ^ 1) * (unint64_t)v9 + 64, (char *)v13 + v14 * (unint64_t)v9 + 64, v7);
              uint64_t result = 0;
              *(_OWORD *)uint64_t v16 = *(_OWORD *)v15;
              *(void *)(v16 + 16) = *(void *)(v15 + 16);
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t queryInterface_0(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend((char *)a1 - **a1, "queryInterface:outInterface:", a2, a3, a4);
}

uint64_t addRef_0(void **a1)
{
  uint64_t v1 = (char *)a1 - **a1;
  int v2 = CFGetRetainCount(v1);
  CFRetain(v1);

  return (v2 + 1);
}

uint64_t release_0(void **a1)
{
  uint64_t v1 = (char *)a1 - **a1;
  int v2 = CFGetRetainCount(v1);
  CFRelease(v1);

  return (v2 - 1);
}

void *GCPrepareIUnknownVtbl(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = objc_opt_class();
  unsigned int v4 = objc_getAssociatedObject(v3, &unk_26BEE5D28);
  if (!v4)
  {
    unsigned int v4 = (void *)[objc_alloc((Class)&off_26BEEE0C0) initWithLength:32];
    objc_setAssociatedObject(v3, &unk_26BEE5D28, v4, (void *)0x301);
  }
  id v5 = v4;
  uint64_t v6 = (void *)[v5 mutableBytes];

  if (!*v6)
  {
    void *v6 = a2;
    v6[1] = queryInterface_0;
    v6[2] = addRef_0;
    v6[3] = release_0;
  }
  return v6;
}

id GCConfigurationAssetManagementServiceXPCInterface()
{
  uint64_t v0 = +[NSXPCInterface interfaceWithProtocol:&unk_26BEE7A28];
  uint64_t v1 = objc_opt_class();
  int v2 = +[NSSet setWithObjects:](&off_26BEEB310, "setWithObjects:", v1, objc_opt_class(), 0);
  [v0 setClasses:v2 forSelector:sel_assetsWithReply_ argumentIndex:0 ofReply:1];

  uint64_t v3 = objc_opt_class();
  unsigned int v4 = +[NSSet setWithObjects:](&off_26BEEB310, "setWithObjects:", v3, objc_opt_class(), 0);
  [v0 setClasses:v4 forSelector:sel_currentAsset_withReply_ argumentIndex:0 ofReply:1];

  return v0;
}

void sub_20AD29AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_20AD29C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_20AD2A3AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_20AD2A45C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_20AD2AB7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_20AD2AFA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_20AD2DC80()
{
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void sub_20AD2F87C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void *__Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  uint64_t result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __ProcessHIDElements_block_invoke(uint64_t a1, IOHIDElementRef element)
{
  signed int UsagePage = IOHIDElementGetUsagePage(element);
  signed int Usage = IOHIDElementGetUsage(element);
  IOHIDElementType Type = IOHIDElementGetType(element);
  if (Type - 1 >= 3)
  {
    if (Type != kIOHIDElementTypeCollection) {
      return;
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    IOHIDElementGetChildren(element);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) + 16))(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
LABEL_34:

    return;
  }
  if (UsagePage > 8)
  {
    if (UsagePage == 9 || UsagePage == 12) {
      goto LABEL_27;
    }
  }
  else
  {
    if (UsagePage != 1)
    {
      if (UsagePage != 2 || (Usage - 186) > 0xB || ((1 << (Usage + 70)) & 0xC03) == 0) {
        return;
      }
      goto LABEL_22;
    }
    if (Usage <= 56)
    {
      if ((Usage - 48) >= 9) {
        return;
      }
LABEL_22:
      uint64_t v12 = (id *)(a1 + 32);
      if ([*(id *)(a1 + 32) containsObject:element]) {
        return;
      }
      unsigned int v13 = (id *)(a1 + 40);
      goto LABEL_29;
    }
    if ((Usage - 133) <= 0xE && ((1 << (Usage + 123)) & 0x7801) != 0 || (Usage - 61) < 2)
    {
LABEL_27:
      uint64_t v12 = (id *)(a1 + 32);
      if ([*(id *)(a1 + 32) containsObject:element]) {
        return;
      }
      unsigned int v13 = (id *)(a1 + 56);
      goto LABEL_29;
    }
    if (Usage == 57)
    {
      uint64_t v12 = (id *)(a1 + 32);
      if (([*(id *)(a1 + 32) containsObject:element] & 1) == 0)
      {
        unsigned int v13 = (id *)(a1 + 48);
LABEL_29:
        id v7 = *v13;
        [*v12 addObject:element];
        if (!v7) {
          return;
        }
        for (unint64_t j = 0; j < [v7 count]; ++j)
        {
          uint64_t v15 = [v7 objectAtIndexedSubscript:j];
          uint32_t v16 = IOHIDElementGetUsage(v15);

          if (Usage < v16) {
            break;
          }
        }
        [v7 insertObject:element atIndex:j];
        goto LABEL_34;
      }
    }
  }
}

void __ProcessHIDElements_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  element = a2;
  IOHIDElementSetProperty(element, @"UsageType", &unk_26BEE2218);
  IOHIDElementSetProperty(element, @"UsageTypeIndex", +[NSNumber numberWithUnsignedInteger:a3]);
}

void __ProcessHIDElements_block_invoke_76(uint64_t a1, void *a2, uint64_t a3)
{
  element = a2;
  IOHIDElementSetProperty(element, @"UsageType", &unk_26BEE2230);
  IOHIDElementSetProperty(element, @"UsageTypeIndex", +[NSNumber numberWithUnsignedInteger:a3]);
}

void __ProcessHIDElements_block_invoke_81(uint64_t a1, void *a2, uint64_t a3)
{
  element = a2;
  IOHIDElementSetProperty(element, @"UsageType", &unk_26BEE2248);
  IOHIDElementSetProperty(element, @"UsageTypeIndex", +[NSNumber numberWithUnsignedInteger:a3]);
}

NSXPCInterface *_GCGenericDeviceDBServiceXPCInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26BEEA1E8];
}

void sub_20AD304D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_20AD305E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

id GCHIDDeviceAttributesPredicateFromMatchingDictionary(void *a1, void *a2)
{
  id v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    uint64_t v9 = +[NSString stringWithUTF8String:"NSPredicate * _Nullable GCHIDDeviceAttributesPredicateFromMatchingDictionary(NSDictionary *__strong _Nonnull, NSString *__autoreleasing * _Nullable)"];
    [v8 handleFailureInFunction:v9, @"GCHIDProtocols.m", 14, @"Invalid parameter not satisfying: %@", @"[matching isKindOfClass:NSDictionary.class]" file lineNumber description];
  }
  uint64_t v13 = 0;
  unsigned int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint32_t v16 = __Block_byref_object_copy__6;
  long long v17 = __Block_byref_object_dispose__6;
  id v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __GCHIDDeviceAttributesPredicateFromMatchingDictionary_block_invoke;
  v10[3] = &unk_26BEC4B68;
  uint64_t v12 = &v13;
  id v4 = (id)objc_opt_new();
  id v11 = v4;
  objc_msgSend(v3, "gc_enumerateKeysAndObjectsUsingBlock:", v10);
  uint64_t v5 = [v4 count];
  if (v5 == [v3 count])
  {
    uint64_t v6 = unk_26BEEF5F0(&off_26BEEF7C0, "andPredicateWithSubpredicates:", v4);
  }
  else
  {
    uint64_t v6 = 0;
    if (a2) {
      *a2 = (id) v14[5];
    }
  }

  _Block_object_dispose(&v13, 8);

  return v6;
}

void sub_20AD30D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __GCHIDDeviceAttributesPredicateFromMatchingDictionary_block_invoke(uint64_t a1, void (**a2)(void, void, void), void *a3, unsigned char *a4)
{
  id v7 = a3;
  uint64_t v8 = a2;
  uint64_t v9 = objc_opt_class();
  id v33 = 0;
  uint64_t v10 = ((void (**)(void, uint64_t, id *))a2)[2](v8, v9, &v33);

  id v11 = v33;
  uint64_t v12 = v11;
  if (!v10)
  {
    uint64_t v23 = [v11 localizedFailureReason];
    goto LABEL_18;
  }
  if (![v10 isEqualToString:@"Transport"])
  {
    if ([v10 isEqualToString:@"VendorID"])
    {
      uint64_t v17 = objc_opt_class();
      id v31 = v12;
      unsigned int v14 = v7[2](v7, v17, &v31);
      id v15 = v31;

      if (v14)
      {
        uint32_t v16 = @"vendorID";
        goto LABEL_14;
      }
LABEL_20:
      uint64_t v26 = [v15 localizedFailureReason];
      uint64_t v27 = *(void *)(*(void *)(a1 + 40) + 8);
      unsigned int v28 = *(void **)(v27 + 40);
      *(void *)(v27 + 40) = v26;

      *a4 = 1;
      goto LABEL_15;
    }
    if ([v10 isEqualToString:@"ProductID"])
    {
      uint64_t v18 = objc_opt_class();
      id v30 = v12;
      unsigned int v14 = v7[2](v7, v18, &v30);
      id v15 = v30;

      if (v14)
      {
        uint32_t v16 = @"productID";
        goto LABEL_14;
      }
      goto LABEL_20;
    }
    if ([v10 isEqualToString:@"VersionNumber"])
    {
      uint64_t v19 = objc_opt_class();
      id v29 = v12;
      unsigned int v14 = v7[2](v7, v19, &v29);
      id v15 = v29;

      if (v14)
      {
        uint32_t v16 = @"versionNumber";
        goto LABEL_14;
      }
      goto LABEL_20;
    }
    uint64_t v23 = +[NSString stringWithFormat:@"Unexpected key '%@'.", v10];
LABEL_18:
    uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
    unsigned int v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

    *a4 = 1;
    id v15 = v12;
    goto LABEL_16;
  }
  uint64_t v13 = objc_opt_class();
  id v32 = v12;
  unsigned int v14 = v7[2](v7, v13, &v32);
  id v15 = v32;

  if (!v14) {
    goto LABEL_20;
  }
  uint32_t v16 = @"transport";
LABEL_14:
  long long v20 = +[NSExpression expressionForKeyPath:v16];
  uint64_t v21 = +[NSExpression expressionForConstantValue:v14];
  unint64_t v22 = +[NSComparisonPredicate predicateWithLeftExpression:v20 rightExpression:v21 modifier:0 type:4 options:0];
  [*(id *)(a1 + 32) addObject:v22];

LABEL_15:
LABEL_16:
}

id GCHIDDeviceAttributeKeys()
{
  uint64_t v0 = (void *)GCHIDDeviceAttributeKeys_AllowedKeys;
  if (!GCHIDDeviceAttributeKeys_AllowedKeys)
  {
    uint64_t v1 = [objc_alloc((Class)&off_26BEEB310) initWithArray:&unk_26BEE2868];
    uint64_t v2 = (void *)GCHIDDeviceAttributeKeys_AllowedKeys;
    GCHIDDeviceAttributeKeys_AllowedKeys = v1;

    uint64_t v0 = (void *)GCHIDDeviceAttributeKeys_AllowedKeys;
  }

  return v0;
}

id GCHIDElementAttributeKeys()
{
  uint64_t v0 = (void *)GCHIDElementAttributeKeys_AllowedKeys;
  if (!GCHIDElementAttributeKeys_AllowedKeys)
  {
    uint64_t v1 = [objc_alloc((Class)&off_26BEEB310) initWithArray:&unk_26BEE2880];
    uint64_t v2 = (void *)GCHIDElementAttributeKeys_AllowedKeys;
    GCHIDElementAttributeKeys_AllowedKeys = v1;

    uint64_t v0 = (void *)GCHIDElementAttributeKeys_AllowedKeys;
  }

  return v0;
}

os_log_t gc_log_create_configuration(char *category)
{
  os_log_t v1 = os_log_create("com.apple.gamecontroller.Configuration", category);

  return v1;
}

id _gc_log_configuration()
{
  if (_gc_log_configuration_onceToken != -1) {
    dispatch_once(&_gc_log_configuration_onceToken, &__block_literal_global_11);
  }
  uint64_t v0 = (void *)_gc_log_configuration_Log;

  return v0;
}

uint64_t ___gc_log_configuration_block_invoke()
{
  _gc_log_configuration_Log = (uint64_t)os_log_create("com.apple.gamecontroller.Configuration", "Common");

  return MEMORY[0x270F9A758]();
}

void sub_20AD335C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20AD33758(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20AD33838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_20AD33C80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  objc_sync_exit(v26);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_20AD34108(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _gc_log_runtime_issue()
{
  if (_gc_log_runtime_issue_onceToken != -1) {
    dispatch_once(&_gc_log_runtime_issue_onceToken, &__block_literal_global_12);
  }
  uint64_t v0 = (void *)_gc_log_runtime_issue_Log;

  return v0;
}

uint64_t ___gc_log_runtime_issue_block_invoke()
{
  _gc_log_runtime_issue_Log = (uint64_t)os_log_create("com.apple.gamecontroller", "RuntimeIssues");

  return MEMORY[0x270F9A758]();
}

os_log_t gc_log_create_ipc(char *category)
{
  os_log_t v1 = os_log_create("com.apple.gamecontroller.ipc", category);

  return v1;
}

id _gc_log_ipc()
{
  if (_gc_log_ipc_onceToken != -1) {
    dispatch_once(&_gc_log_ipc_onceToken, &__block_literal_global_5);
  }
  uint64_t v0 = (void *)_gc_log_ipc_Log;

  return v0;
}

uint64_t ___gc_log_ipc_block_invoke()
{
  _gc_log_ipc_Log = (uint64_t)os_log_create("com.apple.gamecontroller.hid", "Common");

  return MEMORY[0x270F9A758]();
}

os_log_t gc_log_create_hid(char *category)
{
  os_log_t v1 = os_log_create("com.apple.gamecontroller.hid", category);

  return v1;
}

id _gc_log_hid()
{
  if (_gc_log_hid_onceToken != -1) {
    dispatch_once(&_gc_log_hid_onceToken, &__block_literal_global_9);
  }
  uint64_t v0 = (void *)_gc_log_hid_Log;

  return v0;
}

uint64_t ___gc_log_hid_block_invoke()
{
  _gc_log_hid_Log = (uint64_t)os_log_create("com.apple.gamecontroller.hid", "Common");

  return MEMORY[0x270F9A758]();
}

id _gc_log_hid_input()
{
  if (_gc_log_hid_input_onceToken != -1) {
    dispatch_once(&_gc_log_hid_input_onceToken, &__block_literal_global_11);
  }
  uint64_t v0 = (void *)_gc_log_hid_input_Log;

  return v0;
}

uint64_t ___gc_log_hid_input_block_invoke()
{
  _gc_log_hid_input_Log = (uint64_t)os_log_create("com.apple.gamecontroller.hid", "Input");

  return MEMORY[0x270F9A758]();
}

os_log_t gc_log_create_device(char *category)
{
  os_log_t v1 = os_log_create("com.apple.gamecontroller.device", category);

  return v1;
}

id _gc_log_device()
{
  if (_gc_log_device_onceToken != -1) {
    dispatch_once(&_gc_log_device_onceToken, &__block_literal_global_15);
  }
  uint64_t v0 = (void *)_gc_log_device_Log;

  return v0;
}

uint64_t ___gc_log_device_block_invoke()
{
  _gc_log_device_Log = (uint64_t)os_log_create("com.apple.gamecontroller.device", "Common");

  return MEMORY[0x270F9A758]();
}

id _gc_log_device_configuration()
{
  if (_gc_log_device_configuration_onceToken != -1) {
    dispatch_once(&_gc_log_device_configuration_onceToken, &__block_literal_global_17);
  }
  uint64_t v0 = (void *)_gc_log_device_configuration_Log;

  return v0;
}

uint64_t ___gc_log_device_configuration_block_invoke()
{
  _gc_log_device_configuration_Log = (uint64_t)os_log_create("com.apple.gamecontroller.device", "Configuration");

  return MEMORY[0x270F9A758]();
}

NSXPCInterface *GCGenericDeviceDriverConfigurationServiceClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26BEE9F50];
}

NSXPCInterface *GCGenericDeviceDriverConfigurationServiceServerInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&unk_26BEED898];
}

void __IOHIDQueueInputElementValueCallback(void *a1, int a2, __IOHIDQueue *a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = v5;
  if (!a2 && v5[1] == a3)
  {
    IOHIDValueRef Value = IOHIDQueueCopyNextValue(a3);
    if (Value)
    {
      uint64_t v9 = Value;
      int v10 = 0;
      *(void *)&long long v8 = 138412802;
      long long v20 = v8;
      while (1)
      {
        if (v10)
        {
          if (++v10 == 20)
          {
            id v11 = _gc_log_hid_input();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
              __IOHIDQueueInputElementValueCallback_cold_1(&v21, v22, v11);
            }

            int v10 = 20;
          }
        }
        else
        {
          IOHIDValueGetTimeStamp(v9);
          [v6[4] count];
          kdebug_trace();
          int v10 = 1;
        }
        Element = IOHIDValueGetElement(v9);
        uint64_t v13 = objc_getProperty(v6, sel_elements, 56, 1);
        unsigned int v14 = [v13 member:Element];
        id v15 = v14;
        if (!v14) {
          break;
        }
        -[GCHIDInputElement valueChanged:](v14, v9);
        if (IOHIDElementGetType(Element) == kIOHIDElementTypeInput_NULL) {
          goto LABEL_14;
        }
        [v6[4] addObject:v15];
LABEL_20:
        CFRelease(v9);

        uint64_t v9 = IOHIDQueueCopyNextValue(a3);
        if (!v9) {
          goto LABEL_23;
        }
      }
      if (IOHIDElementGetType(Element) == kIOHIDElementTypeInput_NULL)
      {
LABEL_14:
        uint64_t v16 = -[GCHIDDeviceInput batchInputElementHandler](v6);
        if (v16)
        {
          id v17 = v6[4];
          uint64_t TimeStamp = IOHIDValueGetTimeStamp(v9);
          (*(void (**)(uint64_t, id, uint64_t))(v16 + 16))(v16, v17, TimeStamp);
        }
        objc_msgSend(v6[4], "removeAllObjects", v20);
      }
      else
      {
        uint64_t v16 = _gc_log_hid_input();
        if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG))
        {
          IOHIDElementCookie Cookie = IOHIDElementGetCookie(Element);
          *(_DWORD *)buf = v20;
          uint64_t v24 = v6;
          __int16 v25 = 1024;
          IOHIDElementCookie v26 = Cookie;
          __int16 v27 = 2112;
          unsigned int v28 = Element;
          _os_log_debug_impl(&dword_20AD04000, (os_log_t)v16, OS_LOG_TYPE_DEBUG, "%@: Element changed: <HIDElement cookie: %u %@>", buf, 0x1Cu);
        }
      }

      goto LABEL_20;
    }
  }
LABEL_23:
}

void sub_20AD34DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_20AD34ED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_20AD34F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_20AD35798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj)
{
}

_DWORD *_gc_state_dictionary_builder(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a2)
  {
    int v5 = *(_DWORD *)(a1 + 16);
    if (v5)
    {
      if (((a2 >> (v5 - 1)) & 1) == 0) {
        return 0;
      }
    }
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(a3 + 16))(a3, a1, v6);
  if (!v7) {
    return 0;
  }
  long long v8 = (void *)v7;
  uint64_t v9 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:200 options:0 error:0];
  uint64_t v10 = [(NSData *)v9 length];

  if (!v9) {
    return 0;
  }
  id v11 = malloc_type_calloc(1uLL, v10 + 200, 0x6C2410FBuLL);
  _DWORD *v11 = 1;
  v11[1] = v10;
  [v8 getCString:v11 + 34 maxLength:64 encoding:4];
  [(NSData *)v9 getBytes:v11 + 50 length:[(NSData *)v9 length]];
  return v11;
}

void __USBDevicesMatched(void *a1, uint64_t a2)
{
  kern_return_t v11;
  IOCFPlugInInterface **v12;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  CFUUIDRef v14;
  CFUUIDBytes v15;
  kern_return_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  kern_return_t v20;
  NSObject *v21;
  kern_return_t v22;
  NSObject *v23;
  kern_return_t v24;
  kern_return_t v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  NSObject *v30;
  const char *v31;
  uint32_t v32;
  NSObject *v33;
  kern_return_t v34;
  io_service_t v35;
  NSObject *v36;
  CFUUIDRef v37;
  CFUUIDRef v38;
  kern_return_t v39;
  IOCFPlugInInterface **v40;
  HRESULT (__cdecl *v41)(void *, REFIID, LPVOID *);
  CFUUIDRef v42;
  CFUUIDBytes v43;
  kern_return_t v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  kern_return_t v48;
  NSObject *v49;
  kern_return_t v50;
  NSObject *v51;
  unsigned __int8 v52;
  kern_return_t v53;
  NSObject *v54;
  NSObject *v56;
  NSObject *v57;
  kern_return_t v58;
  NSObject *v59;
  int v60;
  char v61;
  char v62;
  __int16 v63;
  char v64;
  unsigned __int8 v65;
  uint64_t v66;
  io_iterator_t iterator;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  SInt32 theScore;
  IOCFPlugInInterface **theInterface;
  uint64_t entryID;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  unsigned char *v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  kern_return_t v81;
  unsigned char v82[136];

  id v3 = a1;
  while (2)
  {
    while (1)
    {
      uint64_t v4 = IOIteratorNext(a2);
      if (!v4) {
        break;
      }
      int v5 = _os_activity_create(&dword_20AD04000, "[Logitech Racing Wheel Manager] Matched Kernel Service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v5, &state);
      uint64_t entryID = 0;
      memset(v82, 0, 128);
      IORegistryEntryGetRegistryEntryID(v4, &entryID);
      MEMORY[0x21052C920](v4, v82);
      uint64_t v6 = v3[1];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v77 = v82;
        v78 = 2048;
        v79 = entryID;
        _os_log_debug_impl(&dword_20AD04000, v6, OS_LOG_TYPE_DEBUG, "Matched kernel service <%s %#llx>.", buf, 0x16u);
      }
      CFProperty = (void *)IORegistryEntryCreateCFProperty(v4, @"idVendor", 0, 0);
      long long v8 = (void *)IORegistryEntryCreateCFProperty(v4, @"idProduct", 0, 0);
      if (![CFProperty isEqual:&unk_26BEE2278]
        || ([v8 isEqual:&unk_26BEE22C0] & 1) == 0
        && ([v8 isEqual:&unk_26BEE2290] & 1) == 0)
      {
        uint64_t v18 = v3[1];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v77 = v82;
          v78 = 2048;
          v79 = entryID;
          _os_log_error_impl(&dword_20AD04000, v18, OS_LOG_TYPE_ERROR, "<%s %#llx> Unknown device.", buf, 0x16u);
        }
        goto LABEL_21;
      }
      theInterface = 0;
      theScore = 0;
      CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Du, 0xC7u, 0xB7u, 0x80u, 0x9Eu, 0xC0u, 0x11u, 0xD4u, 0xA5u, 0x4Fu, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
      CFUUIDRef v10 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
      id v11 = IOCreatePlugInInterfaceForService(v4, v9, v10, &theInterface, &theScore);
      if (v11 || (uint64_t v12 = theInterface) == 0)
      {
        uint64_t v19 = v3[1];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v77 = v82;
          v78 = 2048;
          v79 = entryID;
          v80 = 1024;
          v81 = v11;
          _os_log_error_impl(&dword_20AD04000, v19, OS_LOG_TYPE_ERROR, "<%s %#llx> Failed to load IOUSBDeviceUserClient plugin: %{mach.errno}d.", buf, 0x1Cu);
        }
LABEL_21:
        IOObjectRelease(v4);
        goto LABEL_22;
      }
      v71 = 0;
      QueryInterface = (*theInterface)->QueryInterface;
      unsigned int v14 = CFUUIDGetConstantUUIDWithBytes(0, 0x5Cu, 0x81u, 0x87u, 0xD0u, 0x9Eu, 0xF3u, 0x11u, 0xD4u, 0x8Bu, 0x45u, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
      id v15 = CFUUIDGetUUIDBytes(v14);
      uint64_t v16 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t *))QueryInterface)(v12, *(void *)&v15.byte0, *(void *)&v15.byte8, &v71);
      if (v16)
      {
        id v17 = v3[1];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v77 = v82;
          v78 = 2048;
          v79 = entryID;
          v80 = 1024;
          v81 = v16;
          _os_log_error_impl(&dword_20AD04000, v17, OS_LOG_TYPE_ERROR, "<%s %#llx> Failed to obtain IOUSBDeviceInterface from IOUSBDeviceUserClient plugin: %i.", buf, 0x1Cu);
        }
        ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
        IOObjectRelease(v4);
        goto LABEL_22;
      }
      IOObjectRelease(v4);
      ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
      theInterface = 0;
      long long v20 = (*(uint64_t (**)(uint64_t))(*(void *)v71 + 64))(v71);
      if (v20)
      {
        uint8_t v21 = v3[1];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v77 = v82;
          v78 = 2048;
          v79 = entryID;
          v80 = 1024;
          v81 = v20;
          _os_log_error_impl(&dword_20AD04000, v21, OS_LOG_TYPE_ERROR, "<%s %#llx> Device USBDeviceOpen failed: %{mach.errno}d.", buf, 0x1Cu);
        }
        (*(void (**)(uint64_t))(*(void *)v71 + 24))(v71);
        goto LABEL_22;
      }
      v70 = 0;
      unint64_t v22 = (*(uint64_t (**)(uint64_t, char *))(*(void *)v71 + 152))(v71, &v70);
      if (v22)
      {
        uint64_t v23 = v3[1];
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          goto LABEL_69;
        }
        *(_DWORD *)buf = 136315650;
        v77 = v82;
        v78 = 2048;
        v79 = entryID;
        v80 = 1024;
        v81 = v22;
        id v30 = v23;
        id v31 = "<%s %#llx> Device GetNumberOfConfigurations failed: %{mach.errno}d.";
        id v32 = 28;
LABEL_46:
        _os_log_error_impl(&dword_20AD04000, v30, OS_LOG_TYPE_ERROR, v31, buf, v32);
        goto LABEL_69;
      }
      if (!v70)
      {
        id v29 = v3[1];
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          goto LABEL_69;
        }
        *(_DWORD *)buf = 136315394;
        v77 = v82;
        v78 = 2048;
        v79 = entryID;
        id v30 = v29;
        id v31 = "<%s %#llx> Device returned 0 configurations.";
        id v32 = 22;
        goto LABEL_46;
      }
      v69 = 0;
      uint64_t v24 = (*(uint64_t (**)(uint64_t, void, uint64_t *))(*(void *)v71 + 168))(v71, 0, &v69);
      if (v24 || !v69)
      {
        id v33 = v3[1];
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          goto LABEL_69;
        }
        *(_DWORD *)buf = 136315650;
        v77 = v82;
        v78 = 2048;
        v79 = entryID;
        v80 = 1024;
        v81 = v24;
        __int16 v27 = v33;
        unsigned int v28 = "<%s %#llx> Device GetConfigurationDescriptorPtr failed: %{mach.errno}d.";
        goto LABEL_60;
      }
      __int16 v25 = (*(uint64_t (**)(uint64_t, void))(*(void *)v71 + 184))(v71, *(unsigned __int8 *)(v69 + 5));
      if (v25)
      {
        IOHIDElementCookie v26 = v3[1];
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          goto LABEL_69;
        }
        *(_DWORD *)buf = 136315650;
        v77 = v82;
        v78 = 2048;
        v79 = entryID;
        v80 = 1024;
        v81 = v25;
        __int16 v27 = v26;
        unsigned int v28 = "<%s %#llx> Device SetConfiguration failed: %{mach.errno}d.";
LABEL_60:
        _os_log_error_impl(&dword_20AD04000, v27, OS_LOG_TYPE_ERROR, v28, buf, 0x1Cu);
LABEL_69:
        (*(void (**)(uint64_t))(*(void *)v71 + 72))(v71);
        (*(void (**)(uint64_t))(*(void *)v71 + 24))(v71);
        goto LABEL_22;
      }
      v68 = -1;
      iterator = 0;
      long long v34 = (*(uint64_t (**)(uint64_t, uint64_t *, io_iterator_t *))(*(void *)v71 + 224))(v71, &v68, &iterator);
      if (v34 || !iterator)
      {
        v36 = v3[1];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v77 = v82;
          v78 = 2048;
          v79 = entryID;
          v80 = 1024;
          v81 = v34;
          _os_log_error_impl(&dword_20AD04000, v36, OS_LOG_TYPE_ERROR, "<%s %#llx> Device CreateInterfaceIterator failed: %{mach.errno}d.", buf, 0x1Cu);
        }
        goto LABEL_69;
      }
      while (1)
      {
        v35 = IOIteratorNext(iterator);
        if (v35 || IOIteratorIsValid(a2)) {
          break;
        }
        MEMORY[0x21052C850](a2);
      }
      IOObjectRelease(iterator);
      if (!v35)
      {
        v46 = v3[1];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v77 = v82;
          v78 = 2048;
          v79 = entryID;
          _os_log_error_impl(&dword_20AD04000, v46, OS_LOG_TYPE_ERROR, "<%s %#llx> No device interfaces found.", buf, 0x16u);
        }
        goto LABEL_69;
      }
      v37 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Du, 0x97u, 0x86u, 0xC6u, 0x9Eu, 0xF3u, 0x11u, 0xD4u, 0xADu, 0x51u, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
      id v38 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
      uint64_t v39 = IOCreatePlugInInterfaceForService(v35, v37, v38, &theInterface, &theScore);
      if (v39 || (__int16 v40 = theInterface) == 0)
      {
        v47 = v3[1];
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v77 = v82;
          v78 = 2048;
          v79 = entryID;
          v80 = 1024;
          v81 = v39;
          _os_log_error_impl(&dword_20AD04000, v47, OS_LOG_TYPE_ERROR, "<%s %#llx> Failed to load IOUSBInterfaceUserClient plugin: %{mach.errno}d.", buf, 0x1Cu);
        }
        IOObjectRelease(v35);
        goto LABEL_69;
      }
      v66 = 0;
      v41 = (*theInterface)->QueryInterface;
      __int16 v42 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0x87u, 0x52u, 0x66u, 0x3Bu, 0xC0u, 0x7Bu, 0x4Bu, 0xAEu, 0x95u, 0x84u, 0x22u, 3u, 0x2Fu, 0xABu, 0x9Cu, 0x5Au);
      uint64_t v43 = CFUUIDGetUUIDBytes(v42);
      __int16 v44 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t *))v41)(v40, *(void *)&v43.byte0, *(void *)&v43.byte8, &v66);
      if (v44)
      {
        int v45 = v3[1];
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v77 = v82;
          v78 = 2048;
          v79 = entryID;
          v80 = 1024;
          v81 = v44;
          _os_log_error_impl(&dword_20AD04000, v45, OS_LOG_TYPE_ERROR, "<%s %#llx> Failed to obtain IOUSBInterfaceInterface from IOUSBDeviceUserClient plugin: %i.", buf, 0x1Cu);
        }
        ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
        IOObjectRelease(v35);
        goto LABEL_69;
      }
      IOObjectRelease(v35);
      ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
      theInterface = 0;
      v48 = (*(uint64_t (**)(uint64_t))(*(void *)v66 + 352))(v66);
      if (v48)
      {
        v49 = v3[1];
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v77 = v82;
          v78 = 2048;
          v79 = entryID;
          v80 = 1024;
          v81 = v48;
          _os_log_error_impl(&dword_20AD04000, v49, OS_LOG_TYPE_ERROR, "<%s %#llx> Interface USBInterfaceOpenSeize failed: %{mach.errno}d.", buf, 0x1Cu);
        }
        (*(void (**)(uint64_t))(*(void *)v66 + 24))(v66);
        goto LABEL_69;
      }
      v65 = 0;
      v50 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(*(void *)v66 + 152))(v66, &v65);
      if (v50)
      {
        v51 = v3[1];
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v77 = v82;
          v78 = 2048;
          v79 = entryID;
          v80 = 1024;
          v81 = v50;
          _os_log_error_impl(&dword_20AD04000, v51, OS_LOG_TYPE_ERROR, "<%s %#llx> Interface GetNumEndpoints failed: %{mach.errno}d.", buf, 0x1Cu);
        }
        goto LABEL_86;
      }
      if (!v65)
      {
        v57 = v3[1];
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v77 = v82;
          v78 = 2048;
          v79 = entryID;
          _os_log_error_impl(&dword_20AD04000, v57, OS_LOG_TYPE_ERROR, "<%s %#llx> Interface returned 0 endpoints.", buf, 0x16u);
        }
        goto LABEL_86;
      }
      v52 = 0;
      while (1)
      {
        v64 = 0;
        v63 = 0;
        v62 = 0;
        LOWORD(v60) = 0;
        v53 = (*(uint64_t (**)(uint64_t, void, char *, char *, __int16 *, int *, char *))(*(void *)v66 + 208))(v66, v52, &v64, (char *)&v63 + 1, &v63, &v60, &v62);
        if (v53)
        {
          v54 = v3[1];
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v77 = v82;
            v78 = 2048;
            v79 = entryID;
            v80 = 1024;
            v81 = v53;
            _os_log_error_impl(&dword_20AD04000, v54, OS_LOG_TYPE_ERROR, "<%s %#llx> Interface GetPipeProperties failed: %{mach.errno}d.", buf, 0x1Cu);
          }
          goto LABEL_83;
        }
        if (v63 == 3 || v64 == 0) {
          break;
        }
LABEL_83:
        if (v65 <= ++v52) {
          goto LABEL_84;
        }
      }
      if (HIBYTE(v63) == 255)
      {
LABEL_84:
        v56 = v3[1];
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v77 = v82;
          v78 = 2048;
          v79 = entryID;
          _os_log_error_impl(&dword_20AD04000, v56, OS_LOG_TYPE_ERROR, "<%s %#llx> Interrupt pipe not found.", buf, 0x16u);
        }
        goto LABEL_86;
      }
      v61 = 66;
      v60 = 16842767;
      v58 = (*(uint64_t (**)(uint64_t))(*(void *)v66 + 256))(v66);
      v59 = v3[1];
      if (v58)
      {
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v77 = v82;
          v78 = 2048;
          v79 = entryID;
          v80 = 1024;
          v81 = v58;
          _os_log_error_impl(&dword_20AD04000, v59, OS_LOG_TYPE_ERROR, "<%s %#llx> Error issuing mode switch command: %{mach.errno}d", buf, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v77 = v82;
        v78 = 2048;
        v79 = entryID;
        _os_log_impl(&dword_20AD04000, v59, OS_LOG_TYPE_DEFAULT, "<%s %#llx> Issued mode switch command (G92x -> G92x/HID++).", buf, 0x16u);
      }
LABEL_86:
      (*(void (**)(uint64_t))(*(void *)v66 + 72))(v66);
      (*(void (**)(uint64_t))(*(void *)v66 + 24))(v66);
      (*(void (**)(uint64_t))(*(void *)v71 + 72))(v71);
      (*(void (**)(uint64_t))(*(void *)v71 + 24))(v71);
LABEL_22:

      os_activity_scope_leave(&state);
    }
    if (!IOIteratorIsValid(a2))
    {
      MEMORY[0x21052C850](a2);
      continue;
    }
    break;
  }
}

void sub_20AD3718C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void __HIDDevicesMatched_0(void *a1, uint64_t a2)
{
  id v3 = a1;
  *(void *)&long long v4 = 136315650;
  long long v28 = v4;
  while (1)
  {
    while (1)
    {
      uint64_t v5 = IOIteratorNext(a2);
      if (!v5) {
        break;
      }
      uint64_t v6 = _os_activity_create(&dword_20AD04000, "[Logitech Racing Wheel Manager] Matched Kernel Service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v6, &state);
      uint64_t entryID = 0;
      memset(v39, 0, sizeof(v39));
      IORegistryEntryGetRegistryEntryID(v5, &entryID);
      MEMORY[0x21052C920](v5, v39);
      uint64_t v7 = v3[1];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        long long v34 = v39;
        __int16 v35 = 2048;
        uint64_t v36 = entryID;
        _os_log_debug_impl(&dword_20AD04000, v7, OS_LOG_TYPE_DEBUG, "Matched kernel service <%s %#llx>.", buf, 0x16u);
      }
      long long v8 = IOHIDDeviceCreate(kCFAllocatorDefault, v5);
      if (v8)
      {
        IOObjectRelease(v5);
        IOReturn v9 = IOHIDDeviceOpen(v8, 0);
        if (v9)
        {
          CFUUIDRef v10 = v3[1];
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v28;
            long long v34 = v39;
            __int16 v35 = 2048;
            uint64_t v36 = entryID;
            __int16 v37 = 1024;
            IOReturn v38 = v9;
            _os_log_error_impl(&dword_20AD04000, v10, OS_LOG_TYPE_ERROR, "<%s %#llx> Failed to open device: %{mach.errno}d", buf, 0x1Cu);
          }
          CFRelease(v8);
          goto LABEL_43;
        }
        uint64_t v12 = IOHIDDeviceGetProperty(v8, @"VendorID");
        uint64_t v13 = IOHIDDeviceGetProperty(v8, @"ProductID");
        if ([v12 isEqual:&unk_26BEE2278]
          && [v13 isEqual:&unk_26BEE22A8])
        {
          *(void *)report = 0x1010709F830;
          IOReturn v14 = IOHIDDeviceSetReport(v8, kIOHIDReportTypeOutput, 48, report, 8);
          if (v14)
          {
            id v15 = v3[1];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v28;
              long long v34 = v39;
              __int16 v35 = 2048;
              uint64_t v36 = entryID;
              __int16 v37 = 1024;
              IOReturn v38 = v14;
              _os_log_error_impl(&dword_20AD04000, v15, OS_LOG_TYPE_ERROR, "<%s %#llx> Error issuing mode switch command: %{mach.errno}d", buf, 0x1Cu);
            }
          }
          uint64_t v16 = v3[1];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            long long v34 = v39;
            __int16 v35 = 2048;
            uint64_t v36 = entryID;
            id v17 = v16;
            uint64_t v18 = "<%s %#llx> Issued mode switch command (G923/PS -> G923/Classic).";
            goto LABEL_39;
          }
          goto LABEL_42;
        }
        if (objc_msgSend(v12, "isEqual:", &unk_26BEE2278, v28)
          && [v13 isEqual:&unk_26BEE22D8])
        {
          report[4] = 1;
          *(_DWORD *)report = 84539440;
          IOReturn v19 = IOHIDDeviceSetReport(v8, kIOHIDReportTypeOutput, 48, report, 5);
          if (v19)
          {
            long long v20 = v3[1];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v28;
              long long v34 = v39;
              __int16 v35 = 2048;
              uint64_t v36 = entryID;
              __int16 v37 = 1024;
              IOReturn v38 = v19;
              _os_log_error_impl(&dword_20AD04000, v20, OS_LOG_TYPE_ERROR, "<%s %#llx> Error issuing mode switch command: %{mach.errno}d", buf, 0x1Cu);
            }
          }
          uint8_t v21 = v3[1];
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_42;
          }
          *(_DWORD *)buf = 136315394;
          long long v34 = v39;
          __int16 v35 = 2048;
          uint64_t v36 = entryID;
          id v17 = v21;
          uint64_t v18 = "<%s %#llx> Issued mode switch command (G29/PS4 -> G29/Classic).";
        }
        else
        {
          if (![v12 isEqual:&unk_26BEE2278]
            || ![v13 isEqual:&unk_26BEE22F0])
          {
            __int16 v27 = v3[1];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              long long v34 = v39;
              __int16 v35 = 2048;
              uint64_t v36 = entryID;
              _os_log_error_impl(&dword_20AD04000, v27, OS_LOG_TYPE_ERROR, "<%s %#llx> Unknown device.", buf, 0x16u);
            }
            goto LABEL_42;
          }
          *(void *)report = 0x10000002000921;
          *(_DWORD *)id v29 = 17107448;
          IOReturn v22 = IOHIDDeviceSetReport(v8, kIOHIDReportTypeOutput, 33, report, 8);
          if (v22)
          {
            uint64_t v23 = v3[1];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v28;
              long long v34 = v39;
              __int16 v35 = 2048;
              uint64_t v36 = entryID;
              __int16 v37 = 1024;
              IOReturn v38 = v22;
              _os_log_error_impl(&dword_20AD04000, v23, OS_LOG_TYPE_ERROR, "<%s %#llx> Error issuing mode switch command: %{mach.errno}d", buf, 0x1Cu);
            }
          }
          IOReturn v24 = IOHIDDeviceSetReport(v8, kIOHIDReportTypeOutput, v29[0], v29, 4);
          if (v24)
          {
            __int16 v25 = v3[1];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v28;
              long long v34 = v39;
              __int16 v35 = 2048;
              uint64_t v36 = entryID;
              __int16 v37 = 1024;
              IOReturn v38 = v24;
              _os_log_error_impl(&dword_20AD04000, v25, OS_LOG_TYPE_ERROR, "<%s %#llx> Error issuing mode switch command: %{mach.errno}d", buf, 0x1Cu);
            }
          }
          IOHIDElementCookie v26 = v3[1];
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
LABEL_42:
            IOHIDDeviceClose(v8, 0);
            CFRelease(v8);

            goto LABEL_43;
          }
          *(_DWORD *)buf = 136315394;
          long long v34 = v39;
          __int16 v35 = 2048;
          uint64_t v36 = entryID;
          id v17 = v26;
          uint64_t v18 = "<%s %#llx> Issued mode switch command (G29/PS3 -> G29/Classic).";
        }
LABEL_39:
        _os_log_debug_impl(&dword_20AD04000, v17, OS_LOG_TYPE_DEBUG, v18, buf, 0x16u);
        goto LABEL_42;
      }
      id v11 = v3[1];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        long long v34 = v39;
        __int16 v35 = 2048;
        uint64_t v36 = entryID;
        _os_log_error_impl(&dword_20AD04000, v11, OS_LOG_TYPE_ERROR, "<%s %#llx> Failed to create IOHIDDevice.", buf, 0x16u);
      }
      IOObjectRelease(v5);
LABEL_43:
      os_activity_scope_leave(&state);
    }
    if (IOIteratorIsValid(a2)) {
      break;
    }
    MEMORY[0x21052C850](a2);
  }
}

void sub_20AD378F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state)
{
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 8u);
}

void *IOGCDeviceInterfacePrepareObjCVtbl(uint64_t a1, uint64_t a2)
{
  id v3 = objc_opt_class();
  long long v4 = objc_getAssociatedObject(v3, &unk_26BEED8F8);
  if (!v4)
  {
    long long v4 = (void *)[objc_alloc((Class)&off_26BEEE0C0) initWithLength:64];
    objc_setAssociatedObject(v3, &unk_26BEED8F8, v4, (void *)0x301);
  }
  id v5 = v4;
  uint64_t v6 = (void *)[v5 mutableBytes];

  if (!*v6)
  {
    void *v6 = a2;
    v6[1] = queryInterface_0;
    v6[2] = addRef_0;
    v6[3] = release_0;
    v6[4] = openDevice;
    v6[5] = closeDevice;
    v6[6] = getProperty;
    v6[7] = setProperty;
  }
  return v6;
}

uint64_t openDevice(void **a1, uint64_t a2)
{
  return [(char *)a1 - **a1 open:a2];
}

uint64_t closeDevice(void **a1, uint64_t a2)
{
  return [(char *)a1 - **a1 close:a2];
}

uint64_t getProperty(void **a1, uint64_t a2)
{
  return [(char *)a1 - **a1 getProperty:a2];
}

uint64_t setProperty(void **a1, uint64_t a2, uint64_t a3)
{
  return [(char *)a1 - **a1 setProperty:a2 value:a3];
}

uint64_t IOGCFastPathClientGetTypeID()
{
  return self;
}

__IOGCFastPathClient *IOGCFastPathClientCreateWithPlugInInterface(const __CFAllocator *a1, io_object_t a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    size_t InstanceSize = class_getInstanceSize(v6);
    long long v8 = (__IOGCFastPathClient *)CFAllocatorAllocate(a1, InstanceSize, 0);
    if (!v8) {
      return v8;
    }
    uint64_t v9 = (objc_class *)objc_opt_class();
    long long v8 = (__IOGCFastPathClient *)objc_constructInstance(v9, v8);
    v8->allocator = (__CFAllocator *)CFRetain(a1);
    if (!a2) {
      goto LABEL_11;
    }
  }
  else
  {
    long long v8 = [__IOGCFastPathClient alloc];
    if (!a2) {
      goto LABEL_11;
    }
  }
  if (IOObjectRetain(a2))
  {
    CFUUIDRef v10 = _gc_log_iokit();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      IOGCFastPathClientCreateWithPlugInInterface_cold_4();
    }
    goto LABEL_9;
  }
  v8->service = a2;
LABEL_11:
  id v11 = *(uint64_t (**)(uint64_t, void, void, IOCFPlugInInterfaceStruct ***))(*(void *)a3 + 8);
  CFUUIDRef v12 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  CFUUIDBytes v13 = CFUUIDGetUUIDBytes(v12);
  p_pluginInterface = &v8->pluginInterface;
  if ((v11(a3, *(void *)&v13.byte0, *(void *)&v13.byte8, &v8->pluginInterface) & 0x80000000) != 0
    || (id v15 = *p_pluginInterface) == 0)
  {
    uint64_t v23 = _gc_log_iokit();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      IOGCFastPathClientCreateWithPlugInInterface_cold_1();
    }
    goto LABEL_9;
  }
  QueryInterface = (*v15)->QueryInterface;
  CFUUIDRef v17 = CFUUIDGetConstantUUIDWithBytes(0, 0xD2u, 0x4Au, 0x24u, 0x86u, 0x3Bu, 0xCDu, 0x4Eu, 0x96u, 0xB6u, 6u, 0x34u, 0xE1u, 0x5Fu, 0xD6u, 0x66u, 0x5Cu);
  CFUUIDBytes v18 = CFUUIDGetUUIDBytes(v17);
  if ((((uint64_t (*)(IOCFPlugInInterfaceStruct **, void, void, IOGCFastPathClientInterface ***))QueryInterface)(v15, *(void *)&v18.byte0, *(void *)&v18.byte8, &v8->clientInterface) & 0x80000000) != 0|| !v8->clientInterface)
  {
    IOReturn v24 = _gc_log_iokit();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      IOGCFastPathClientCreateWithPlugInInterface_cold_2();
    }
    goto LABEL_9;
  }
  if ((**p_pluginInterface)->version != 1)
  {
    __int16 v25 = _gc_log_iokit();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      IOGCFastPathClientCreateWithPlugInInterface_cold_3();
    }
LABEL_9:

    return 0;
  }
  CFNumberRef Property = (const __CFNumber *)IOGCFastPathClientGetProperty((uint64_t)v8, @"ProviderID");
  if (Property)
  {
    CFNumberRef v20 = Property;
    CFTypeID v21 = CFGetTypeID(Property);
    if (v21 == CFNumberGetTypeID()) {
      CFNumberGetValue(v20, kCFNumberSInt64Type, &v8->providerID);
    }
  }
  return v8;
}

CFTypeRef IOGCFastPathClientGetProperty(uint64_t a1, const void *a2)
{
  CFTypeRef result = (CFTypeRef)(*(uint64_t (**)(void))(**(void **)(a1 + 32) + 64))(*(void *)(a1 + 32));
  if (a2 && !result)
  {
    if (CFEqual(a2, @"ProviderID"))
    {
      uint64_t entryID = 0;
      IORegistryEntryGetRegistryEntryID(*(_DWORD *)(a1 + 16), &entryID);
    }
    else
    {
      if (!CFEqual(a2, @"ClientID")) {
        return 0;
      }
      uint64_t entryID = a1;
    }
    CFNumberRef v5 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 8), kCFNumberSInt64Type, &entryID);
    return CFAutorelease(v5);
  }
  return result;
}

__IOGCFastPathClient *IOGCFastPathClientCreate(const __CFAllocator *a1, io_object_t a2)
{
  kern_return_t v12;
  IOCFPlugInInterfaceStruct **pluginInterface;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  CFUUIDRef v15;
  CFUUIDBytes v16;
  kern_return_t v17;
  CFNumberRef Property;
  CFNumberRef v19;
  CFTypeID v20;
  CFStringRef v21;
  NSObject *v22;
  const char *v23;
  kern_return_t v24;
  NSObject *v25;
  uint64_t entryID;
  SInt32 theScore;
  uint8_t buf[4];
  CFStringRef v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  kern_return_t v33;

  if (!a2) {
    return 0;
  }
  theScore = 0;
  if (a1)
  {
    long long v4 = (objc_class *)objc_opt_class();
    size_t InstanceSize = class_getInstanceSize(v4);
    uint64_t v6 = (__IOGCFastPathClient *)CFAllocatorAllocate(a1, InstanceSize, 0);
    if (!v6) {
      return v6;
    }
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v6 = (__IOGCFastPathClient *)objc_constructInstance(v7, v6);
    v6->allocator = (__CFAllocator *)CFRetain(a1);
  }
  else
  {
    uint64_t v6 = [__IOGCFastPathClient alloc];
  }
  if (IOObjectRetain(a2))
  {
    long long v8 = _gc_log_iokit();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      IOGCFastPathClientCreate_cold_2();
    }
    goto LABEL_9;
  }
  v6->service = a2;
  CFUUIDRef v10 = CFUUIDGetConstantUUIDWithBytes(0, 0xF2u, 0x5Fu, 0xF3u, 0xC2u, 0x33u, 0xFu, 0x4Bu, 0x52u, 0x82u, 7u, 0xA0u, 0xD6u, 0xF2u, 0x3Du, 0xF0u, 0xCDu);
  CFUUIDRef v11 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  CFUUIDRef v12 = IOCreatePlugInInterfaceForService(a2, v10, v11, &v6->pluginInterface, &theScore);
  if (v12)
  {
    IOReturn v24 = v12;
    uint64_t entryID = 0;
    CFTypeID v21 = IOObjectCopyClass(a2);
    IORegistryEntryGetRegistryEntryID(a2, &entryID);
    IOReturn v22 = _gc_log_iokit();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v29 = v21;
      id v30 = 2048;
      id v31 = entryID;
      id v32 = 1024;
      id v33 = v24;
      uint64_t v23 = "[IOGCFastPathClient] #Error instantiating 'IOGCFastPathType' plugin object for <%@ '%#010llx'>: %{mach.errno}d";
LABEL_27:
      _os_log_error_impl(&dword_20AD04000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0x1Cu);
      if (!v21) {
        goto LABEL_9;
      }
      goto LABEL_23;
    }
LABEL_22:
    if (!v21)
    {
LABEL_9:

      return 0;
    }
LABEL_23:
    CFRelease(v21);
    goto LABEL_9;
  }
  pluginInterface = v6->pluginInterface;
  QueryInterface = (*pluginInterface)->QueryInterface;
  id v15 = CFUUIDGetConstantUUIDWithBytes(0, 0xD2u, 0x4Au, 0x24u, 0x86u, 0x3Bu, 0xCDu, 0x4Eu, 0x96u, 0xB6u, 6u, 0x34u, 0xE1u, 0x5Fu, 0xD6u, 0x66u, 0x5Cu);
  uint64_t v16 = CFUUIDGetUUIDBytes(v15);
  CFUUIDRef v17 = ((uint64_t (*)(IOCFPlugInInterfaceStruct **, void, void, IOGCFastPathClientInterface ***))QueryInterface)(pluginInterface, *(void *)&v16.byte0, *(void *)&v16.byte8, &v6->clientInterface);
  if (v17 < 0 || !v6->clientInterface)
  {
    uint64_t entryID = 0;
    CFTypeID v21 = IOObjectCopyClass(a2);
    IORegistryEntryGetRegistryEntryID(a2, &entryID);
    IOReturn v22 = _gc_log_iokit();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v29 = v21;
      id v30 = 2048;
      id v31 = entryID;
      id v32 = 1024;
      id v33 = v17;
      uint64_t v23 = "[IOGCFastPathClient] #Error obtaining 'IOGFastPathClientInterface' from 'IOGCFastPathType' plugin object for"
            " <%@ '%#010llx'>: %d";
      goto LABEL_27;
    }
    goto LABEL_22;
  }
  if ((*v6->pluginInterface)->version != 1)
  {
    __int16 v25 = _gc_log_iokit();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      IOGCFastPathClientCreate_cold_1();
    }
    goto LABEL_9;
  }
  CFNumberRef Property = (const __CFNumber *)IOGCFastPathClientGetProperty((uint64_t)v6, @"ProviderID");
  if (Property)
  {
    IOReturn v19 = Property;
    CFNumberRef v20 = CFGetTypeID(Property);
    if (v20 == CFNumberGetTypeID()) {
      CFNumberGetValue(v19, kCFNumberSInt64Type, &v6->providerID);
    }
  }
  return v6;
}

uint64_t IOGCFastPathClientGetPlugInInterface(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t IOGCFastPathClientGetService(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

uint64_t IOGCFastPathClientOpen(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 32) + 48))(*(void *)(a1 + 32));
}

uint64_t IOGCFastPathClientClose(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 32) + 56))(*(void *)(a1 + 32));
}

uint64_t IOGCFastPathClientSetProperty(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 32) + 72))(*(void *)(a1 + 32));
}

uint64_t IOGCFastPathControlQueueGetTypeID()
{
  return self;
}

__IOGCFastPathControlQueue *IOGCFastPathControlQueueCreateWithOptions(const __CFAllocator *a1, void *a2, uint64_t a3)
{
  if (!a2) {
    return 0;
  }
  uint64_t v5 = a2[4];
  uint64_t v24 = 0;
  int v6 = (*(uint64_t (**)(uint64_t, const __CFAllocator *, uint64_t, uint64_t *))(*(void *)v5 + 80))(v5, a1, a3, &v24);
  if (v6 < 0 || !v24)
  {
    CFTypeID v21 = _gc_log_iokit();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v26 = v6;
      _os_log_impl(&dword_20AD04000, v21, OS_LOG_TYPE_INFO, "#Error creating control queue object: %d", buf, 8u);
    }
    return 0;
  }
  if (!a1)
  {
    uint64_t v9 = [__IOGCFastPathControlQueue alloc];
    goto LABEL_8;
  }
  uint64_t v7 = (objc_class *)objc_opt_class();
  size_t InstanceSize = class_getInstanceSize(v7);
  uint64_t v9 = (__IOGCFastPathControlQueue *)CFAllocatorAllocate(a1, InstanceSize, 0);
  if (v9)
  {
    CFUUIDRef v10 = (objc_class *)objc_opt_class();
    uint64_t v9 = (__IOGCFastPathControlQueue *)objc_constructInstance(v10, v9);
    v9->allocator = (__CFAllocator *)CFRetain(a1);
LABEL_8:
    v9->client = (__IOGCFastPathClient *)a2;
    uint64_t v11 = v24;
    CFUUIDRef v12 = *(uint64_t (**)(uint64_t, void, void, IOGCFastPathControlQueueInterface ***))(*(void *)v24 + 8);
    CFUUIDRef v13 = CFUUIDGetConstantUUIDWithBytes(0, 0x5Du, 0xF3u, 0x6Au, 0xD7u, 0xDDu, 0x2Bu, 0x49u, 0xBEu, 0xB3u, 0xFu, 0xF0u, 0xFAu, 0xEAu, 0x2Cu, 0xD7u, 0x74u);
    CFUUIDBytes v14 = CFUUIDGetUUIDBytes(v13);
    p_queueInterface = &v9->queueInterface;
    int v16 = v12(v11, *(void *)&v14.byte0, *(void *)&v14.byte8, &v9->queueInterface);
    (*(void (**)(uint64_t))(*(void *)v24 + 24))(v24);
    if (v16 < 0 || !*p_queueInterface)
    {
      CFUUIDBytes v18 = _gc_log_iokit();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
LABEL_19:

        return 0;
      }
      *(_DWORD *)buf = 67109120;
      int v26 = v16;
      IOReturn v19 = "#Error obtaining 'kIOGFastPathControlQueueInterface' from control queue object: %d";
      CFNumberRef v20 = v18;
    }
    else
    {
      if (*((_WORD *)**p_queueInterface + 16) == 1) {
        return v9;
      }
      IOReturn v22 = _gc_log_iokit();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
        goto LABEL_19;
      }
      int v23 = *((unsigned __int16 *)**p_queueInterface + 16);
      *(_DWORD *)buf = 67109120;
      int v26 = v23;
      IOReturn v19 = "The 'kIOGFastPathControlQueueInterface' obtained from plugin reader object is an unsupported version: %d";
      CFNumberRef v20 = v22;
    }
    _os_log_impl(&dword_20AD04000, v20, OS_LOG_TYPE_INFO, v19, buf, 8u);
    goto LABEL_19;
  }
  return v9;
}

__IOGCFastPathControlQueue *IOGCFastPathControlQueueCreate(const __CFAllocator *a1, void *a2, uint64_t a3, uint64_t a4)
{
  v8[0] = @"QueueChannel";
  v8[1] = @"QueueCapacity";
  v9[0] = +[NSNumber numberWithUnsignedInt:](&off_26BEEDE78, "numberWithUnsignedInt:");
  v9[1] = +[NSNumber numberWithUnsignedLong:a4];
  return IOGCFastPathControlQueueCreateWithOptions(a1, a2, (uint64_t)+[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2]);
}

uint64_t IOGCFastPathControlQueueGetPlugInInterface(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t IOGCFastPathControlQueueGetClient(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t IOGCFastPathControlQueueGetProperty(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 48))(*(void *)(a1 + 24));
}

uint64_t IOGCFastPathControlQueueSetProperty(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 56))(*(void *)(a1 + 24));
}

uint64_t IOGCFastPathControlQueueGetActivePosition(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 64))(*(void *)(a1 + 24));
}

uint64_t IOGCFastPathControlQueueGetReadPosition(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 72))(*(void *)(a1 + 24));
}

uint64_t IOGCFastPathControlQueueResetPosition(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 80))(*(void *)(a1 + 24));
}

uint64_t IOGCFastPathControlQueueGetSample(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t))(**(void **)(a1 + 24) + 88))(*(void *)(a1 + 24), a2, 0, a3);
}

uint64_t IOGCFastPathInputQueueGetTypeID()
{
  return self;
}

__IOGCFastPathInputQueue *IOGCFastPathInputQueueCreateWithOptions(const __CFAllocator *a1, void *a2, CFDictionaryRef theDict)
{
  if (!a2) {
    return 0;
  }
  int valuePtr = 0;
  if (theDict)
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"QueueChannel");
    if (Value)
    {
      CFNumberRef v7 = Value;
      CFTypeID v8 = CFGetTypeID(Value);
      if (v8 == CFNumberGetTypeID()) {
        CFNumberGetValue(v7, kCFNumberSInt32Type, &valuePtr);
      }
    }
  }
  kdebug_trace();
  uint64_t v9 = a2[4];
  uint64_t v26 = 0;
  if (((*(uint64_t (**)(uint64_t, const __CFAllocator *, CFDictionaryRef, uint64_t *))(*(void *)v9 + 88))(v9, a1, theDict, &v26) & 0x80000000) != 0|| !v26)
  {
    uint64_t v24 = _gc_log_iokit();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      IOGCFastPathInputQueueCreateWithOptions_cold_1();
    }
LABEL_28:
    CFUUIDRef v12 = 0;
    goto LABEL_18;
  }
  if (!a1)
  {
    CFUUIDRef v12 = [__IOGCFastPathInputQueue alloc];
LABEL_12:
    v12->client = (__IOGCFastPathClient *)a2;
    uint64_t v14 = v26;
    id v15 = *(uint64_t (**)(uint64_t, void, void, IOGCFastPathInputQueueInterface ***))(*(void *)v26 + 8);
    CFUUIDRef v16 = CFUUIDGetConstantUUIDWithBytes(0, 0x19u, 0x43u, 0x1Bu, 0xCFu, 0xBBu, 0xEFu, 0x43u, 0x5Bu, 0x9Cu, 0x57u, 0xB3u, 0xF3u, 0x48u, 6u, 0x86u, 0x2Du);
    CFUUIDBytes v17 = CFUUIDGetUUIDBytes(v16);
    p_queueInterface = &v12->queueInterface;
    LODWORD(v14) = v15(v14, *(void *)&v17.byte0, *(void *)&v17.byte8, &v12->queueInterface);
    (*(void (**)(uint64_t))(*(void *)v26 + 24))(v26);
    if ((v14 & 0x80000000) != 0 || !*p_queueInterface)
    {
      int v23 = _gc_log_iokit();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        IOGCFastPathInputQueueCreateWithOptions_cold_2();
      }
    }
    else
    {
      if ((**p_queueInterface)->var4 == 1)
      {
        CFNumberRef Property = (const __CFNumber *)IOGCFastPathInputQueueGetProperty((uint64_t)v12, @"QueueID");
        if (Property)
        {
          CFNumberRef v20 = Property;
          CFTypeID v21 = CFGetTypeID(Property);
          if (v21 == CFNumberGetTypeID()) {
            CFNumberGetValue(v20, kCFNumberSInt64Type, &v12->queueID);
          }
        }
        goto LABEL_18;
      }
      __int16 v25 = _gc_log_iokit();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        IOGCFastPathInputQueueCreateWithOptions_cold_3();
      }
    }

    goto LABEL_28;
  }
  CFUUIDRef v10 = (objc_class *)objc_opt_class();
  size_t InstanceSize = class_getInstanceSize(v10);
  CFUUIDRef v12 = (__IOGCFastPathInputQueue *)CFAllocatorAllocate(a1, InstanceSize, 0);
  if (v12)
  {
    CFUUIDRef v13 = (objc_class *)objc_opt_class();
    CFUUIDRef v12 = (__IOGCFastPathInputQueue *)objc_constructInstance(v13, v12);
    v12->allocator = (__CFAllocator *)CFRetain(a1);
    goto LABEL_12;
  }
LABEL_18:
  kdebug_trace();
  return v12;
}

CFTypeRef IOGCFastPathInputQueueGetProperty(uint64_t a1, const void *a2)
{
  CFTypeRef result = (CFTypeRef)(*(uint64_t (**)(void))(**(void **)(a1 + 24) + 48))(*(void *)(a1 + 24));
  if (a2 && !result)
  {
    if (CFEqual(a2, @"QueueID"))
    {
      uint64_t valuePtr = a1;
      CFNumberRef v5 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 8), kCFNumberSInt64Type, &valuePtr);
      return CFAutorelease(v5);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

__IOGCFastPathInputQueue *IOGCFastPathInputQueueCreateWithDuration(const __CFAllocator *a1, void *a2, double a3)
{
  v7[0] = @"QueueChannel";
  v7[1] = @"QueueDuration";
  v8[0] = +[NSNumber numberWithUnsignedInt:](&off_26BEEDE78, "numberWithUnsignedInt:");
  v8[1] = +[NSNumber numberWithDouble:a3];
  return IOGCFastPathInputQueueCreateWithOptions(a1, a2, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2]);
}

uint64_t IOGCFastPathInputQueueGetPlugInInterface(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t IOGCFastPathInputQueueGetClient(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t IOGCFastPathInputQueueSetProperty(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 56))(*(void *)(a1 + 24));
}

uint64_t IOGCFastPathInputQueueRegisterDataAvailableCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(result + 80)) {
    IOGCFastPathInputQueueRegisterDataAvailableCallback_cold_1();
  }
  *(void *)(result + 56) = a2;
  *(void *)(result + 64) = a3;
  return result;
}

void IOGCFastPathInputQueueSetDispatchQueue(uint64_t a1, dispatch_object_t object)
{
  if (*(unsigned char *)(a1 + 80)) {
    IOGCFastPathInputQueueSetDispatchQueue_cold_1();
  }
  long long v4 = *(NSObject **)(a1 + 40);
  if (v4) {
    dispatch_release(v4);
  }
  *(void *)(a1 + 40) = object;
  if (object)
  {
    dispatch_retain(object);
  }
}

void *IOGCFastPathInputQueueSetCancelHandler(uint64_t a1, void *aBlock)
{
  if (*(unsigned char *)(a1 + 80)) {
    IOGCFastPathInputQueueSetCancelHandler_cold_1();
  }
  long long v4 = *(const void **)(a1 + 48);
  if (v4) {
    _Block_release(v4);
  }
  CFTypeRef result = _Block_copy(aBlock);
  *(void *)(a1 + 48) = result;
  return result;
}

uint64_t IOGCFastPathInputQueueActivate(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 80)) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v3 = 3758097112;
  int v7 = 0;
  if (*(void *)(a1 + 40))
  {
    if (*(void *)(a1 + 56))
    {
      uint64_t v4 = (*(uint64_t (**)(uint64_t, int *))(*(void *)v2 + 64))(v2, &v7);
      if (v4)
      {
        uint64_t v3 = v4;
      }
      else
      {
        CFNumberRef v5 = dispatch_mach_create();
        *(void *)(a1 + 72) = v5;
        if (v5)
        {
          dispatch_retain(v5);
          dispatch_mach_connect();
          uint64_t v3 = 0;
          *(unsigned char *)(a1 + 80) = 1;
          return v3;
        }
        uint64_t v3 = 3758097097;
      }
    }
    if (v7) {
      (*(void (**)(uint64_t, void))(*(void *)v2 + 64))(v2, 0);
    }
  }
  return v3;
}

void __IOGCFastPathInputQueueActivate_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 8)
  {
    dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 72));
    *(void *)(*(void *)(a1 + 32) + 72) = 0;
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 48);
    if (v3)
    {
      (*(void (**)(void))(v3 + 16))();
      _Block_release(*(const void **)(*(void *)(a1 + 32) + 48));
      *(void *)(*(void *)(a1 + 32) + 48) = 0;
    }
  }
  else if (a2 == 2)
  {
    dispatch_mach_msg_get_msg();
    kdebug_trace();
    (*(void (**)(void))(*(void *)(a1 + 32) + 56))(*(void *)(*(void *)(a1 + 32) + 64));
    kdebug_trace();
  }
}

uint64_t IOGCFastPathInputQueueCancel(uint64_t result)
{
  if (!*(unsigned char *)(result + 80)) {
    IOGCFastPathInputQueueCancel_cold_1();
  }
  uint64_t v1 = result;
  if (!*(unsigned char *)(result + 81))
  {
    CFTypeRef result = dispatch_mach_cancel();
    *(unsigned char *)(v1 + 81) = 1;
  }
  return result;
}

uint64_t IOGCFastPathInputQueueGetLatestSamplePosition(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 72))(*(void *)(a1 + 24));
}

uint64_t IOGCFastPathInputQueueGetSampleWithOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a1 + 24);
  kdebug_trace();
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v7 + 80))(v7, a2, a3, a4);
  kdebug_trace();
  return v8;
}

uint64_t IOGCFastPathInputQueueGetSample(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return IOGCFastPathInputQueueGetSampleWithOptions(a1, a2, 0, a3);
}

uint64_t IOGCFastPathQueueGetTypeID()
{
  return self;
}

uint64_t IOGCFastPathQueueGetPlugInInterface(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t IOGCFastPathQueueGetClient(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t IOGCFastPathQueueSetProperty(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 56))(*(void *)(a1 + 24));
}

uint64_t IOGCFastPathReaderGetTypeID()
{
  return self;
}

__IOGCFastPathReader *IOGCFastPathReaderCreate(const __CFAllocator *a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v4 = a2[3];
  kdebug_trace();
  CFNumberRef v5 = *(uint64_t (**)(uint64_t, const __CFAllocator *, uint64_t *))(*(void *)v4 + 88);
  if (v5)
  {
    uint64_t v21 = 0;
    if ((v5(v4, a1, &v21) & 0x80000000) != 0 || !v21)
    {
      IOReturn v19 = _gc_log_iokit();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        IOGCFastPathReaderCreate_cold_1();
      }
    }
    else
    {
      if (!a1)
      {
        uint64_t v11 = [__IOGCFastPathReader alloc];
LABEL_10:
        v11->queue = (__IOGCFastPathInputQueue *)a2;
        uint64_t v12 = v21;
        CFUUIDRef v13 = *(uint64_t (**)(uint64_t, void, void, IOGCFastPathReaderInterface ***))(*(void *)v21 + 8);
        CFUUIDRef v14 = CFUUIDGetConstantUUIDWithBytes(0, 0x6Bu, 0x29u, 0x76u, 0xBCu, 0xFu, 0xD5u, 0x4Bu, 0x35u, 0xAAu, 0x8Cu, 7u, 0x9Du, 0x84u, 0xBEu, 0xAu, 0x4Bu);
        CFUUIDBytes v15 = CFUUIDGetUUIDBytes(v14);
        p_readerInterface = &v11->readerInterface;
        LODWORD(v12) = v13(v12, *(void *)&v15.byte0, *(void *)&v15.byte8, &v11->readerInterface);
        (*(void (**)(uint64_t))(*(void *)v21 + 24))(v21);
        if ((v12 & 0x80000000) != 0 || !*p_readerInterface)
        {
          CFUUIDBytes v18 = _gc_log_iokit();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            IOGCFastPathReaderCreate_cold_2();
          }
        }
        else
        {
          if ((**p_readerInterface)->var4 == 1) {
            goto LABEL_13;
          }
          CFNumberRef v20 = _gc_log_iokit();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            IOGCFastPathReaderCreate_cold_3();
          }
        }

        goto LABEL_22;
      }
      int v6 = (objc_class *)objc_opt_class();
      size_t InstanceSize = class_getInstanceSize(v6);
      uint64_t v8 = CFAllocatorAllocate(a1, InstanceSize, 0);
      if (v8)
      {
        uint64_t v9 = v8;
        CFUUIDRef v10 = (objc_class *)objc_opt_class();
        uint64_t v11 = (__IOGCFastPathReader *)objc_constructInstance(v10, v9);
        v11->allocator = (__CFAllocator *)CFRetain(a1);
        goto LABEL_10;
      }
    }
LABEL_22:
    kdebug_trace();
    return 0;
  }
  uint64_t v11 = (__IOGCFastPathReader *)IOGCFastPathSimpleReaderCreate(a1, a2);
LABEL_13:
  kdebug_trace();
  return v11;
}

uint64_t IOGCFastPathReaderGetPlugInInterface(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t IOGCFastPathReaderGetQueue(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t IOGCFastPathReaderReset(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  if (kdebug_is_enabled())
  {
    uint64_t v5 = -1;
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v1 + 56))(v1, &v5);
    kdebug_trace();
    uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 48))(v1);
    uint64_t v5 = -1;
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v1 + 56))(v1, &v5);
    kdebug_trace();
    return v4;
  }
  else
  {
    uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)v1 + 48);
    return v2(v1);
  }
}

uint64_t IOGCFastPathReaderReadCurrentSample(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  if (kdebug_is_enabled())
  {
    uint64_t v7 = -1;
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v3 + 56))(v3, &v7);
    kdebug_trace();
    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v3 + 64))(v3, a2);
    uint64_t v7 = -1;
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v3 + 56))(v3, &v7);
    kdebug_trace();
    return v6;
  }
  else
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)v3 + 64);
    return v4(v3, a2);
  }
}

uint64_t IOGCFastPathReaderReadNextSample(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  if (kdebug_is_enabled())
  {
    uint64_t v7 = -1;
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v3 + 56))(v3, &v7);
    kdebug_trace();
    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v3 + 72))(v3, a2);
    uint64_t v7 = -1;
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v3 + 56))(v3, &v7);
    kdebug_trace();
    return v6;
  }
  else
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)v3 + 72);
    return v4(v3, a2);
  }
}

uint64_t IOGCFastPathReaderReadPreviousSample(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  if (kdebug_is_enabled())
  {
    uint64_t v7 = -1;
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v3 + 56))(v3, &v7);
    kdebug_trace();
    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v3 + 80))(v3, a2);
    uint64_t v7 = -1;
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v3 + 56))(v3, &v7);
    kdebug_trace();
    return v6;
  }
  else
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)v3 + 80);
    return v4(v3, a2);
  }
}

uint64_t IOGCFastPathReaderInitializeSampleBuffer(uint64_t a1, void *a2)
{
  *a2 = 0;
  return 0;
}

uint64_t IOGCFastPathReaderFinalizeSampleBuffer(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (*a2) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 48))(result);
  }
  return result;
}

uint64_t IOGCFastPathSampleDestory(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, a1);
  }
  else {
    return 3758097090;
  }
}

uint64_t IOGCFastPathSampleGetPosition(void *a1)
{
  return (*(uint64_t (**)(void, void *))(*(void *)*a1 + 72))(*a1, a1);
}

uint64_t IOGCFastPathSampleGetSequenceID(void *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void *, uint64_t, uint64_t))(*(void *)*a1 + 80))(*a1, a1, a2, a3);
}

uint64_t IOGCFastPathSampleGetSubsampleCount(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void *, uint64_t))(*(void *)*a1 + 88))(*a1, a1, a2);
}

uint64_t IOGCFastPathSampleGetFlags(void *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void *, uint64_t, uint64_t))(*(void *)*a1 + 96))(*a1, a1, a2, a3);
}

uint64_t IOGCFastPathSampleSetFlags(void *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void *, uint64_t, uint64_t))(*(void *)*a1 + 104))(*a1, a1, a2, a3);
}

uint64_t IOGCFastPathSampleGetTimestamp(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = *a1;
  if (!kdebug_is_enabled()) {
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v16 + 112))(v16, a1, a2, a3, a4, a5, a6, a7, a8);
  }
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  int v20 = 0;
  uint64_t v19 = -1;
  (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(void *)v16 + 224))(v16, a1, &v22, &v21, &v20, &v19);
  kdebug_trace();
  uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v16 + 112))(v16, a1, a2, a3, a4, a5, a6, a7, a8);
  kdebug_trace();
  return v18;
}

uint64_t IOGCFastPathSampleSetTimestamp(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = *a1;
  if (!kdebug_is_enabled()) {
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _DWORD))(*(void *)v14 + 120))(v14, a1, a2, a3, a4, a5, a6, a7, 0);
  }
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  int v18 = 0;
  uint64_t v17 = -1;
  (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(void *)v14 + 224))(v14, a1, &v20, &v19, &v18, &v17);
  kdebug_trace();
  uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _DWORD))(*(void *)v14 + 120))(v14, a1, a2, a3, a4, a5, a6, a7, 0);
  kdebug_trace();
  return v16;
}

uint64_t IOGCFastPathSampleGetInteger(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *a1;
  if (kdebug_is_enabled())
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    int v15 = 0;
    uint64_t v14 = -1;
    (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(void *)v10 + 224))(v10, a1, &v17, &v16, &v15, &v14);
    kdebug_trace();
    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v10 + 128))(v10, a1, a2, a3, a4, a5);
    kdebug_trace();
    return v13;
  }
  else
  {
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v10 + 128);
    return v11(v10, a1, a2, a3, a4, a5);
  }
}

uint64_t IOGCFastPathSampleGetDouble(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *a1;
  if (kdebug_is_enabled())
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    int v15 = 0;
    uint64_t v14 = -1;
    (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(void *)v10 + 224))(v10, a1, &v17, &v16, &v15, &v14);
    kdebug_trace();
    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v10 + 136))(v10, a1, a2, a3, a4, a5);
    kdebug_trace();
    return v13;
  }
  else
  {
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v10 + 136);
    return v11(v10, a1, a2, a3, a4, a5);
  }
}

uint64_t IOGCFastPathSampleSetInteger(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *a1;
  if (kdebug_is_enabled())
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    int v15 = 0;
    uint64_t v14 = -1;
    (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(void *)v10 + 224))(v10, a1, &v17, &v16, &v15, &v14);
    kdebug_trace();
    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v10 + 144))(v10, a1, a2, a3, a4, a5);
    kdebug_trace();
    return v13;
  }
  else
  {
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v10 + 144);
    return v11(v10, a1, a2, a3, a4, a5);
  }
}

uint64_t IOGCFastPathSampleSetDouble(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v10 = *a1;
  if (kdebug_is_enabled())
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    int v16 = 0;
    uint64_t v15 = -1;
    (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(void *)v10 + 224))(v10, a1, &v18, &v17, &v16, &v15);
    kdebug_trace();
    uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, double))(*(void *)v10 + 152))(v10, a1, a2, a3, a4, a5);
    kdebug_trace();
    return v14;
  }
  else
  {
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, __n128))(*(void *)v10 + 152);
    v11.n128_f64[0] = a5;
    return v12(v10, a1, a2, a3, a4, v11);
  }
}

uint64_t IOGCFastPathSampleGet2Integer(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = *a1;
  if (kdebug_is_enabled())
  {
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    int v17 = 0;
    uint64_t v16 = -1;
    (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(void *)v12 + 224))(v12, a1, &v19, &v18, &v17, &v16);
    kdebug_trace();
    uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v12 + 160))(v12, a1, a2, a3, a4, a5, a6);
    kdebug_trace();
    return v15;
  }
  else
  {
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v12 + 160);
    return v13(v12, a1, a2, a3, a4, a5, a6);
  }
}

uint64_t IOGCFastPathSampleGet2Double(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = *a1;
  if (kdebug_is_enabled())
  {
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    int v17 = 0;
    uint64_t v16 = -1;
    (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(void *)v12 + 224))(v12, a1, &v19, &v18, &v17, &v16);
    kdebug_trace();
    uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v12 + 168))(v12, a1, a2, a3, a4, a5, a6);
    kdebug_trace();
    return v15;
  }
  else
  {
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v12 + 168);
    return v13(v12, a1, a2, a3, a4, a5, a6);
  }
}

uint64_t IOGCFastPathSampleSetInteger2(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = *a1;
  if (kdebug_is_enabled())
  {
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    int v17 = 0;
    uint64_t v16 = -1;
    (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(void *)v12 + 224))(v12, a1, &v19, &v18, &v17, &v16);
    kdebug_trace();
    uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v12 + 176))(v12, a1, a2, a3, a4, a5, a6);
    kdebug_trace();
    return v15;
  }
  else
  {
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v12 + 176);
    return v13(v12, a1, a2, a3, a4, a5, a6);
  }
}

uint64_t IOGCFastPathSampleSetDouble2(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  uint64_t v12 = *a1;
  if (kdebug_is_enabled())
  {
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    int v19 = 0;
    uint64_t v18 = -1;
    (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(void *)v12 + 224))(v12, a1, &v21, &v20, &v19, &v18);
    kdebug_trace();
    uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, double, double))(*(void *)v12 + 184))(v12, a1, a2, a3, a4, a5, a6);
    kdebug_trace();
    return v17;
  }
  else
  {
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, __n128, __n128))(*(void *)v12
                                                                                                  + 184);
    v13.n128_f64[0] = a5;
    v14.n128_f64[0] = a6;
    return v15(v12, a1, a2, a3, a4, v13, v14);
  }
}

uint64_t IOGCFastPathSampleGet3Integer(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = *a1;
  if (kdebug_is_enabled())
  {
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    int v19 = 0;
    uint64_t v18 = -1;
    (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(void *)v14 + 224))(v14, a1, &v21, &v20, &v19, &v18);
    kdebug_trace();
    uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v14 + 192))(v14, a1, a2, a3, a4, a5, a6, a7);
    kdebug_trace();
    return v17;
  }
  else
  {
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v14 + 192);
    return v15(v14, a1, a2, a3, a4, a5, a6, a7);
  }
}

uint64_t IOGCFastPathSampleGet3Double(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = *a1;
  if (kdebug_is_enabled())
  {
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    int v19 = 0;
    uint64_t v18 = -1;
    (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(void *)v14 + 224))(v14, a1, &v21, &v20, &v19, &v18);
    kdebug_trace();
    uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v14 + 200))(v14, a1, a2, a3, a4, a5, a6, a7);
    kdebug_trace();
    return v17;
  }
  else
  {
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v14 + 200);
    return v15(v14, a1, a2, a3, a4, a5, a6, a7);
  }
}

uint64_t IOGCFastPathSampleSetInteger3(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = *a1;
  if (kdebug_is_enabled())
  {
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    int v19 = 0;
    uint64_t v18 = -1;
    (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(void *)v14 + 224))(v14, a1, &v21, &v20, &v19, &v18);
    kdebug_trace();
    uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v14 + 208))(v14, a1, a2, a3, a4, a5, a6, a7);
    kdebug_trace();
    return v17;
  }
  else
  {
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v14 + 208);
    return v15(v14, a1, a2, a3, a4, a5, a6, a7);
  }
}

uint64_t IOGCFastPathSampleSetDouble3(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7)
{
  uint64_t v14 = *a1;
  if (kdebug_is_enabled())
  {
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    int v22 = 0;
    uint64_t v21 = -1;
    (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(void *)v14 + 224))(v14, a1, &v24, &v23, &v22, &v21);
    kdebug_trace();
    uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, double, double, double))(*(void *)v14 + 216))(v14, a1, a2, a3, a4, a5, a6, a7);
    kdebug_trace();
    return v20;
  }
  else
  {
    uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, __n128, __n128, __n128))(*(void *)v14 + 216);
    v15.n128_f64[0] = a5;
    v16.n128_f64[0] = a6;
    v17.n128_f64[0] = a7;
    return v18(v14, a1, a2, a3, a4, v15, v16, v17);
  }
}

uint64_t IOGCFastPathSampleCommit(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (kdebug_is_enabled())
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    int v7 = 0;
    uint64_t v6 = -1;
    (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(void *)v2 + 224))(v2, a1, &v9, &v8, &v7, &v6);
    kdebug_trace();
    uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 64))(v2, a1);
    kdebug_trace();
    return v5;
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 64);
    return v3(v2, a1);
  }
}

uint64_t IOGCFastPathSampleRefresh(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (kdebug_is_enabled())
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    int v7 = 0;
    uint64_t v6 = -1;
    (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(void *)v2 + 224))(v2, a1, &v9, &v8, &v7, &v6);
    kdebug_trace();
    uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 56))(v2, a1);
    kdebug_trace();
    return v5;
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 56);
    return v3(v2, a1);
  }
}

uint64_t IOGCFastPathSampleGetHostTimestamp(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return IOGCFastPathSampleGetTimestamp(a1, 0, 3, 1, 0, a3, 0, 0);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_20AD3C554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void ConnectToDriverService(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  __n128 v11 = v10;
  if (&unk_26BEE7B48 == v7)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __ConnectToDriverService_block_invoke;
    v15[3] = &unk_26BEC4C78;
    uint64_t v12 = &v16;
    id v16 = v10;
    [v8 connectToAssetManagementServiceWithClient:v9 reply:v15];
  }
  else
  {
    if (&unk_26BEE8588 != v7) {
      ConnectToDriverService_cold_1((uint64_t)v7);
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __ConnectToDriverService_block_invoke_2;
    v13[3] = &unk_26BEC4CA0;
    uint64_t v12 = &v14;
    id v14 = v10;
    [v8 connectToGenericDeviceDBServiceWithClient:v9 reply:v13];
  }
}

uint64_t __ConnectToDriverService_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __ConnectToDriverService_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id GCLookupService(void *a1, objc_class *a2, uint64_t a3, int a4)
{
  id v7 = [a1 serviceFor:a2 client:a3];
  if (!v7)
  {
    uint64_t v8 = FallbackProvider;
    id v7 = [(id)FallbackProvider serviceFor:a2 client:a3];
    if (!v7 && a4 != 0)
    {
      if (object_isClass(a2))
      {
        uint64_t v12 = NSStringFromClass(a2);
      }
      else
      {
        if (objc_opt_isKindOfClass()) {
          +[NSString stringWithUTF8String:protocol_getName(a2)];
        }
        else {
        uint64_t v12 = [(objc_class *)a2 description];
        }
      }
      uint64_t v13 = v12;
      id v14 = (objc_class *)objc_opt_class();
      __n128 v15 = NSStringFromClass(v14);
      uint64_t v16 = +[NSString stringWithFormat:@"<%@ %p> returned nil for required dependency '%@'.", v15, v8, v13];

      id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];
      objc_exception_throw(v17);
    }
  }

  return v7;
}

void GCLookupSetFallbackProvider(id obj)
{
}

id GCLookupDispatchWorkloop(void *a1, int a2)
{
  return GCLookupService(a1, (objc_class *)&unk_26BEED6B8, 0, a2);
}

void sub_20AD3D61C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_20AD3E29C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
}

void sub_20AD3E358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_20AD3F1E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,NSErrorUserInfoKey a33,NSErrorUserInfoKey a34,NSErrorUserInfoKey a35,uint64_t a36,__CFString *a37,uint64_t a38)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v38 = objc_begin_catch(exception_object);
      if (a17)
      {
        a33 = NSLocalizedDescriptionKey;
        uint64_t v39 = +[NSString stringWithFormat:@"Invalid '%@' definition."];
        a36 = (uint64_t)v39;
        a37 = @"Model build failed.  This is a #BUG.";
        a34 = NSLocalizedFailureReasonErrorKey;
        a35 = NSUnderlyingErrorKey;
        __int16 v40 = objc_msgSend(v38, "gc_error");
        a38 = (uint64_t)v40;
        v41 = +[NSDictionary dictionaryWithObjects:&a36 forKeys:&a33 count:3];
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v41);
        *a17 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_end_catch();
      JUMPOUT(0x20AD3EFF4);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

__CFString *NSStringFromGCHIDElementUsageType(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_26BEC4D68[a1];
  }
}

void Observer::runAndFree(Observer *this, GCFuture *a2)
{
  uint64_t v3 = a2;
  tqe_prev = this->pointers.tqe_prev;
  this->_handler = (_scaleType *)v3;
  BYTE1(this->var0) |= 1u;
  uint64_t v6 = v3;
  if (tqe_prev)
  {
    CFRetain(v3);
    BYTE1(this->var0) |= 2u;
    dispatch_async((dispatch_queue_t)this->pointers.tqe_prev, this->pointers.tqe_next);
  }
  else
  {
    ((void (*)(void))this->pointers.tqe_next->pointers.tqe_next)();
    Observer::_CleanupInvocationAndFree(this, v5);
  }
}

void sub_20AD4046C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void Observer::_CleanupInvocationAndFree(Observer *this, Observer *a2)
{
  char v3 = BYTE1(this->var0);
  if ((v3 & 2) != 0)
  {
    CFRelease(this->_handler);
    char v3 = BYTE1(this->var0) & 0xFD;
  }
  BYTE1(this->var0) = v3 & 0xFE;
  this->_handler = 0;
  tqe_next = this->pointers.tqe_next;
  this->pointers.tqe_next = 0;
}

void sub_20AD4056C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD407F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD408C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD40990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD40A88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD40B60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD40C2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD40CD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD40D78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id __immutablePlaceholderFuture(void)
{
  if (__immutablePlaceholderFuture(void)::onceToken != -1) {
    dispatch_once(&__immutablePlaceholderFuture(void)::onceToken, &__block_literal_global_359);
  }
  uint64_t v0 = (void *)__immutablePlaceholderFuture(void)::placeholder;

  return v0;
}

void sub_20AD40FFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD410AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD411A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD41218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD41310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD4136C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD4145C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD414E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD415B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  a11.super_class = (Class)GCFuture;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_20AD41820(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD41E3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD42374(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD42450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20AD424C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20AD4273C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __GCFUTURE_IS_CALLING_OUT_TO_AN_OBSERVER__(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

void sub_20AD4287C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_20AD428F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20AD429B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_20AD42A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20AD42AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_20AD42B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20AD42BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_20AD42F7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD430A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_20AD43294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD43370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20AD43520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD43640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_20AD43808(_Unwind_Exception *a1)
{
  id v7 = v6;

  _Unwind_Resume(a1);
}

void sub_20AD439E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD43AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_20AD43C10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD43CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20AD43E14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD43EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_20AD44074(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD4413C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20AD442B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD443AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_20AD444EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD445A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20AD4471C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD44814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_20AD4498C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD44A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20AD44C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_20AD44D68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD44F08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL ContinuationList::addOrInvokeContinuation_takesLock(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  uint64_t v6 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = (Observer *)v6[2](v6);
  id v9 = v8;
  if (v7)
  {
    v8->_handler = 0;
    **(void **)(a1 + 8) = v8;
    *(void *)(a1 + 8) = v8;
    os_unfair_lock_unlock(&v5->_lock);
  }
  else
  {
    os_unfair_lock_unlock(&v5->_lock);
    Observer::runAndFree(v9, v5);
  }

  return v7 != 0;
}

void sub_20AD44FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *Observer::Create(void *a1, void *a2, char a3, dispatch_qos_class_t a4, int a5)
{
  id v9 = a1;
  uint64_t v26 = 0;
  __int16 v27 = 1;
  id v28 = 0;
  id v29 = a2;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3321888768;
  v20[2] = ___ZN8Observer6CreateEU13block_pointerFv13GCFutureStateP11objc_objectP7NSErrorEPU28objcproto17OS_dispatch_queue8NSObjectj11qos_class_ti_block_invoke;
  v20[3] = &unk_26BEE2728;
  uint64_t v22 = 0;
  __int16 v23 = 1;
  id v24 = 0;
  id v25 = v29;
  id v21 = v9;
  id v10 = v9;
  uint64_t v11 = [v20 copy];
  uint64_t v12 = (void *)v11;
  if ((a3 & 2) != 0)
  {
    dispatch_block_flags_t v15 = DISPATCH_BLOCK_DETACHED;
    if (a4 == QOS_CLASS_UNSPECIFIED)
    {
LABEL_7:
      dispatch_block_t v16 = dispatch_block_create(v15, v12);
LABEL_10:
      id v14 = v16;

      goto LABEL_11;
    }
LABEL_9:
    dispatch_block_t v16 = dispatch_block_create_with_qos_class(v15, a4, a5, v12);
    goto LABEL_10;
  }
  int v13 = a3 & 4;
  id v14 = (void *)v11;
  if (v13 | a4)
  {
    if (v13) {
      dispatch_block_flags_t v15 = DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT;
    }
    else {
      dispatch_block_flags_t v15 = 0;
    }
    if (a4 == QOS_CLASS_UNSPECIFIED) {
      goto LABEL_7;
    }
    goto LABEL_9;
  }
LABEL_11:
  id v17 = _Block_copy(v14);
  uint64_t v18 = (void *)v12[7];
  v12[7] = v17;

  Continuation::~Continuation((Continuation *)&v22);
  Continuation::~Continuation((Continuation *)&v26);
  return v12 + 5;
}

void sub_20AD45190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, Observer *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  Observer::~Observer(v19);
  Observer::~Observer((Observer *)&a19);
  _Unwind_Resume(a1);
}

void sub_20AD45274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ContinuationList::drainContinuations_takesLock(ContinuationList *this, GCFuture *a2)
{
  char v3 = a2;
  p_lock = &v3->_lock;
  os_unfair_lock_lock_with_options();
  v9[0] = 0;
  v9[1] = (Observer *)v9;
  tqh_first = (Observer **)this->_continuations.tqh_first;
  if (this->_continuations.tqh_first)
  {
    *(ContinuationList *)id v9 = *this;
    this->_continuations.tqh_first = 0;
    tqh_first = &this->_continuations.tqh_first;
  }
  this->_continuations.tqh_last = tqh_first;
  os_unfair_lock_unlock(p_lock);
  for (uint64_t i = v9[0]; v9[0]; uint64_t i = v9[0])
  {
    while (i)
    {
      handler = (Observer *)i->_handler;
      Observer::runAndFree(i, v3);
      uint64_t i = handler;
    }
    v9[0] = 0;
    v9[1] = (Observer *)v9;
    os_unfair_lock_lock_with_options();
    p_tqh_first = (Observer **)this->_continuations.tqh_first;
    if (this->_continuations.tqh_first)
    {
      *(ContinuationList *)id v9 = *this;
      this->_continuations.tqh_first = 0;
      p_tqh_first = &this->_continuations.tqh_first;
    }
    this->_continuations.tqh_last = p_tqh_first;
    os_unfair_lock_unlock(p_lock);
  }
}

void sub_20AD45368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD4565C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD4577C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD45830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD459B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD45A40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD45AE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD45B5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20AD45BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20AD46160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD46388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);

  _Block_object_dispose((const void *)(v24 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void sub_20AD466C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD468CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);

  _Block_object_dispose((const void *)(v24 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20AD46C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_20AD46D1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD46FB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD470F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_20AD472B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD47438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD47550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD47620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  a11.super_class = (Class)GCPromise;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_20AD47734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD477E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20AD4788C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL17__creatorFrameKeyv_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&__creatorFrameKey(void)::key, 0);
}

uint64_t ___ZL28__immutablePlaceholderFuturev_block_invoke()
{
  __immutablePlaceholderFuture(void)::placeholder = [_GCPlaceholderFuture alloc];

  return MEMORY[0x270F9A758]();
}

void ___ZN8Observer6CreateEU13block_pointerFv13GCFutureStateP11objc_objectP7NSErrorEPU28objcproto17OS_dispatch_queue8NSObjectj11qos_class_ti_block_invoke(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 49) & 1) == 0) {
    ___ZN8Observer6CreateEU13block_pointerFv13GCFutureStateP11objc_objectP7NSErrorEPU28objcproto17OS_dispatch_queue8NSObjectj11qos_class_ti_block_invoke_cold_1();
  }
  uint64_t v2 = (Observer *)(a1 + 40);
  char v3 = (id *)Continuation::future((Continuation *)(a1 + 40));
  uint64_t v4 = v3;
  if (*((unsigned char *)v3 + 12) == 2) {
    id v5 = v3[2];
  }
  else {
    id v5 = 0;
  }

  if (*((unsigned char *)v4 + 12) == 1) {
    id v6 = v4[2];
  }
  else {
    id v6 = 0;
  }

  __GCFUTURE_IS_CALLING_OUT_TO_AN_OBSERVER__(*(void *)(a1 + 32));
  if (*(void *)(a1 + 64))
  {
    Observer::_CleanupInvocationAndFree(v2, v7);
  }
}

id Continuation::future(Continuation *this)
{
  if (*((unsigned char *)this + 9)) {
    return *(id *)this;
  }
  else {
    return 0;
  }
}

id __copy_helper_block_ea8_40c13_ZTS8Observer(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 49))
  {
    _os_assert_log();
    uint64_t v4 = _os_crash();
    __copy_helper_block_ea8_40c13_ZTS8Observer_cold_1(v4);
  }
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) &= 0xFCu;
  *(void *)(a1 + 56) = 0;
  id result = *(id *)(a2 + 64);
  *(void *)(a1 + 64) = result;
  return result;
}

void __destroy_helper_block_ea8_40c13_ZTS8Observer(uint64_t a1)
{
  uint64_t v2 = (Continuation *)(a1 + 40);

  Continuation::~Continuation(v2);
}

void Observer::~Observer(Observer *this)
{
  Continuation::~Continuation((Continuation *)this);
}

void Continuation::~Continuation(Continuation *this)
{
  if (*((unsigned char *)this + 9))
  {
    _os_assert_log();
    uint64_t v1 = _os_crash();
    Continuation::~Continuation(v1);
  }
  *(void *)this = 0;
}

void sub_20AD49578(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,NSErrorUserInfoKey a41,NSErrorUserInfoKey a42,NSErrorUserInfoKey a43,uint64_t a44,__CFString *a45,uint64_t a46)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v47 = objc_begin_catch(exception_object);
      if (a17)
      {
        a41 = NSLocalizedDescriptionKey;
        v48 = +[NSString stringWithFormat:@"Invalid '%@' definition."];
        a44 = (uint64_t)v48;
        a45 = @"Model build failed.  This is a #BUG.";
        a42 = NSLocalizedFailureReasonErrorKey;
        a43 = NSUnderlyingErrorKey;
        v49 = objc_msgSend(v47, "gc_error");
        a46 = (uint64_t)v49;
        v50 = [*(id *)(v46 + 480) dictionaryWithObjects:&a44 forKeys:&a41 count:3];
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v50);
        *a17 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_end_catch();
      JUMPOUT(0x20AD48CC4);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

id _gc_log_generic_device()
{
  if (_gc_log_generic_device_onceToken != -1) {
    dispatch_once(&_gc_log_generic_device_onceToken, &__block_literal_global_15);
  }
  uint64_t v0 = (void *)_gc_log_generic_device_Log;

  return v0;
}

uint64_t ___gc_log_generic_device_block_invoke()
{
  _gc_log_generic_device_Log = gc_log_create_device("Generic");

  return MEMORY[0x270F9A758]();
}

void GCAnalyticsSendCheckCompatibleHIDDeviceEvent(void *a1, void *a2, char a3)
{
  id v5 = a1;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3254779904;
  void v7[2] = __GCAnalyticsSendCheckCompatibleHIDDeviceEvent_block_invoke;
  v7[3] = &__block_descriptor_48_e8_32n11_8_8_s0_t8w1_e30___NSObject_OS_xpc_object__8__0l;
  id v8 = a2;
  char v9 = a3;
  id v6 = a2;
  [v5 sendEvent:@"com.apple.GameController.ConfiguredDevice.CheckCompatibleHIDDevice" withXPCPayloadBuilder:v7];
}

void sub_20AD4BE0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

xpc_object_t __GCAnalyticsSendCheckCompatibleHIDDeviceEvent_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) vendorID];
  uint64_t v3 = [v2 unsignedShortValue];

  uint64_t v4 = [*(id *)(a1 + 32) productID];
  uint64_t v5 = [v4 unsignedShortValue];

  id v6 = [*(id *)(a1 + 32) versionNumber];
  unsigned int v7 = [v6 unsignedShortValue];

  *(_OWORD *)keys = xmmword_26BEC5060;
  long long v30 = *(_OWORD *)off_26BEC5070;
  id v8 = [*(id *)(a1 + 32) vendorID];
  values[0] = xpc_uint64_create([v8 unsignedIntegerValue]);
  char v9 = [*(id *)(a1 + 32) productID];
  values[1] = xpc_uint64_create([v9 unsignedIntegerValue]);
  id v10 = [*(id *)(a1 + 32) versionNumber];
  values[2] = xpc_uint64_create([v10 unsignedIntegerValue]);
  values[3] = xpc_BOOL_create(*(unsigned char *)(a1 + 40));

  xpc_object_t v11 = xpc_dictionary_create((const char *const *)keys, values, 4uLL);
  if (v11)
  {
    id v12 = +[NSString stringWithFormat:@"v%05hu_p%05hu", v3, v5];
    int v13 = (const char *)[v12 UTF8String];
    if (v13) {
      xpc_dictionary_set_string(v11, "VendorProductID", v13);
    }
    id v14 = +[NSString stringWithFormat:@"v%05hu_p%05hu_r%05hu", v3, v5, v7];
    dispatch_block_flags_t v15 = (const char *)[v14 UTF8String];
    if (v15) {
      xpc_dictionary_set_string(v11, "VendorProductVersionID", v15);
    }
    dispatch_block_t v16 = [*(id *)(a1 + 32) transport];
    if (![v16 length] || !objc_msgSend(v16, "caseInsensitiveCompare:", @"null"))
    {

      dispatch_block_t v16 = 0;
    }
    id v17 = v16;
    uint64_t v18 = (const char *)[v17 UTF8String];
    if (v18) {
      xpc_dictionary_set_string(v11, "Transport", v18);
    }
    int v19 = [*(id *)(a1 + 32) manufacturer];
    if (![v19 length]
      || ![v19 caseInsensitiveCompare:@"null"]
      || ![v19 caseInsensitiveCompare:@"unknown"])
    {

      int v19 = 0;
    }
    id v20 = v19;
    id v21 = (const char *)[v20 UTF8String];
    if (v21) {
      xpc_dictionary_set_string(v11, "Manufacturer", v21);
    }
    uint64_t v22 = [*(id *)(a1 + 32) product];
    if (![v22 length]
      || ![v22 caseInsensitiveCompare:@"null"]
      || ![v22 caseInsensitiveCompare:@"unknown"])
    {

      uint64_t v22 = 0;
    }
    id v23 = v22;
    uint64_t v24 = (const char *)[v23 UTF8String];
    if (v24) {
      xpc_dictionary_set_string(v11, "Product", v24);
    }
    id v25 = v11;
  }
  for (uint64_t i = 3; i != -1; --i)

  return v11;
}

id __copy_helper_block_e8_32n11_8_8_s0_t8w1(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a2 + 32);
  *(void *)(a1 + 32) = result;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return result;
}

void __destroy_helper_block_e8_32n4_8_s0(uint64_t a1)
{
}

void sub_20AD4C8DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, NSErrorUserInfoKey a12, NSErrorUserInfoKey a13, NSErrorUserInfoKey a14, uint64_t a15, __CFString *a16, uint64_t a17)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v20 = objc_begin_catch(exception_object);
      if (v18)
      {
        a12 = NSLocalizedDescriptionKey;
        id v21 = [*(id *)(v19 + 456) stringWithFormat:@"Invalid '%@' definition."];
        a15 = (uint64_t)v21;
        a16 = @"Model build failed.  This is a #BUG.";
        a13 = NSLocalizedFailureReasonErrorKey;
        a14 = NSUnderlyingErrorKey;
        uint64_t v22 = objc_msgSend(v20, "gc_error");
        a17 = (uint64_t)v22;
        id v23 = +[NSDictionary dictionaryWithObjects:&a15 forKeys:&a12 count:3];
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v23);
        void *v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_end_catch();
      JUMPOUT(0x20AD4C8D0);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_20AD4D524(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,NSErrorUserInfoKey a33,NSErrorUserInfoKey a34,NSErrorUserInfoKey a35,uint64_t a36,__CFString *a37,uint64_t a38)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v38 = objc_begin_catch(exception_object);
      if (a16)
      {
        a33 = NSLocalizedDescriptionKey;
        uint64_t v39 = +[NSString stringWithFormat:@"Invalid '%@' definition."];
        a36 = (uint64_t)v39;
        a37 = @"Model build failed.  This is a #BUG.";
        a34 = NSLocalizedFailureReasonErrorKey;
        a35 = NSUnderlyingErrorKey;
        __int16 v40 = objc_msgSend(v38, "gc_error");
        a38 = (uint64_t)v40;
        v41 = +[NSDictionary dictionaryWithObjects:&a36 forKeys:&a33 count:3];
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v41);
        *a16 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_end_catch();
      JUMPOUT(0x20AD4D3F4);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void sub_20AD50508(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,NSErrorUserInfoKey a33,NSErrorUserInfoKey a34,NSErrorUserInfoKey a35,uint64_t a36,__CFString *a37,uint64_t a38)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v38 = objc_begin_catch(exception_object);
      if (a16)
      {
        a33 = NSLocalizedDescriptionKey;
        uint64_t v39 = +[NSString stringWithFormat:@"Invalid '%@' definition."];
        a36 = (uint64_t)v39;
        a37 = @"Model build failed.  This is a #BUG.";
        a34 = NSLocalizedFailureReasonErrorKey;
        a35 = NSUnderlyingErrorKey;
        __int16 v40 = objc_msgSend(v38, "gc_error");
        a38 = (uint64_t)v40;
        v41 = +[NSDictionary dictionaryWithObjects:&a36 forKeys:&a33 count:3];
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v41);
        *a16 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_end_catch();
      JUMPOUT(0x20AD503D8);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void sub_20AD52620(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,NSErrorUserInfoKey a49,NSErrorUserInfoKey a50,NSErrorUserInfoKey a51,uint64_t a52,__CFString *a53,uint64_t a54)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v54 = objc_begin_catch(exception_object);
      if (a16)
      {
        a49 = NSLocalizedDescriptionKey;
        v55 = +[NSString stringWithFormat:@"Invalid '%@' definition."];
        a52 = (uint64_t)v55;
        a53 = @"Model build failed.  This is a #BUG.";
        a50 = NSLocalizedFailureReasonErrorKey;
        a51 = NSUnderlyingErrorKey;
        v56 = objc_msgSend(v54, "gc_error");
        a54 = (uint64_t)v56;
        v57 = +[NSDictionary dictionaryWithObjects:&a52 forKeys:&a49 count:3];
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v57);
        *a16 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_end_catch();
      JUMPOUT(0x20AD522A4);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

uint64_t IOGCDeviceGetTypeID()
{
  return self;
}

void *IOGCDeviceCreate(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v3 = [__IOGCDevice alloc];
  v3->_allocator = kCFAllocatorDefault;
  uint64_t v4 = [(__IOGCDevice *)v3 initWithPort:a2 error:&v9];
  if (!v4)
  {
    unsigned int v7 = _gc_log_iokit();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      IOGCDeviceCreate_cold_1(&v9, v7);
    }
    return 0;
  }
  uint64_t v5 = (void *)v4;
  if (!_IOGCDeviceGetPlugInInterface(v4))
  {
    id v8 = _gc_log_iokit();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      IOGCDeviceCreate_cold_2(v8);
    }

    return 0;
  }
  return v5;
}

uint64_t _IOGCDeviceGetPlugInInterface(uint64_t a1)
{
  kern_return_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, void, void, uint64_t);
  CFUUIDRef v9;
  CFUUIDBytes v10;
  kern_return_t v11;
  CFStringRef v12;
  NSObject *v13;
  const char *v14;
  kern_return_t v15;
  uint64_t entryID;
  SInt32 theScore;
  uint8_t buf[4];
  CFStringRef v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  kern_return_t v23;

  theScore = 0;
  io_object_t v2 = -[GCIOObject port](a1);
  if (!*(void *)(a1 + 32)
    && (CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes(0, 0x21u, 0x7Du, 0x5Bu, 0xADu, 0xABu, 0x5Eu, 0x43u, 0x23u, 0x9Cu, 0, 0x2Au, 0xE4u, 0x88u, 0xD5u, 0xDAu, 0x87u), v4 = CFUUIDGetConstantUUIDWithBytes(0,
               0xC2u,
               0x44u,
               0xE8u,
               0x58u,
               0x10u,
               0x9Cu,
               0x11u,
               0xD4u,
               0x91u,
               0xD4u,
               0,
               0x50u,
               0xE4u,
               0xC6u,
               0x42u,
               0x6Fu),
        (uint64_t v5 = IOCreatePlugInInterfaceForService(v2, v3, v4, (IOCFPlugInInterface ***)(a1 + 32), &theScore)) != 0))
  {
    dispatch_block_flags_t v15 = v5;
    uint64_t entryID = 0;
    id v12 = IOObjectCopyClass(v2);
    IORegistryEntryGetRegistryEntryID(v2, &entryID);
    int v13 = _gc_log_iokit();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v19 = v12;
      id v20 = 2048;
      id v21 = entryID;
      uint64_t v22 = 1024;
      id v23 = v15;
      id v14 = "#Error instantiating 'kIOGCDeviceTypeID' CFPlugIn for <%@ '%#010llx'>: %{mach.errno}d";
      goto LABEL_11;
    }
  }
  else
  {
    id result = *(void *)(a1 + 40);
    if (result) {
      return result;
    }
    unsigned int v7 = *(void *)(a1 + 32);
    id v8 = *(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)v7 + 8);
    uint64_t v9 = CFUUIDGetConstantUUIDWithBytes(0, 0x3Au, 0xE7u, 0x17u, 0x8Eu, 0xEAu, 0x88u, 0x44u, 0x2Cu, 0x8Cu, 0xE9u, 0x8Fu, 0x85u, 0xBBu, 0xD5u, 0x67u, 0xDAu);
    id v10 = CFUUIDGetUUIDBytes(v9);
    xpc_object_t v11 = v8(v7, *(void *)&v10.byte0, *(void *)&v10.byte8, a1 + 40);
    if ((v11 & 0x80000000) == 0)
    {
      id result = *(void *)(a1 + 40);
      if (result) {
        return result;
      }
    }
    uint64_t entryID = 0;
    id v12 = IOObjectCopyClass(v2);
    IORegistryEntryGetRegistryEntryID(v2, &entryID);
    int v13 = _gc_log_iokit();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v19 = v12;
      id v20 = 2048;
      id v21 = entryID;
      uint64_t v22 = 1024;
      id v23 = v11;
      id v14 = "#Error obtaining 'kIOGCDeviceInterfaceID' from 'kIOGCDeviceTypeID' CFPlugIn for <%@ '%#010llx'>: %d";
LABEL_11:
      _os_log_impl(&dword_20AD04000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0x1Cu);
    }
  }
  if (v12) {
    CFRelease(v12);
  }
  return 0;
}

uint64_t IOGCDeviceOpen(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 40) + 32))(*(void *)(a1 + 40));
}

uint64_t IOGCDeviceClose(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 40) + 40))(*(void *)(a1 + 40));
}

uint64_t IOGCDeviceGetProperty(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 40) + 48))(*(void *)(a1 + 40));
}

uint64_t IOGCDeviceSetProperty(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 40) + 56))(*(void *)(a1 + 40));
}

uint64_t __IOHIDDeviceRemovedNotification(uint64_t result, uint64_t a2, int a3)
{
  if (a3 == -536870896)
  {
    uint64_t v4 = result;
    IOObjectRelease(*(_DWORD *)(result + 88));
    *(_DWORD *)(v4 + 88) = 0;
    uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t))(v4 + 72);
    uint64_t v6 = *(void *)(v4 + 80);
    return v5(v6, 0, v4);
  }
  return result;
}

void IOGCDeviceSetDispatchQueue(uint64_t a1, dispatch_queue_t queue)
{
  if (atomic_load((unsigned __int8 *)(a1 + 92))) {
    IOGCDeviceSetDispatchQueue_cold_1();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  *(_OWORD *)__str = 0u;
  long long v10 = 0u;
  label = dispatch_queue_get_label(queue);
  uint64_t v6 = "";
  if (label) {
    uint64_t v6 = label;
  }
  snprintf(__str, 0x100uLL, "%s.IOGCDevice", v6);
  dispatch_queue_t v7 = dispatch_queue_create_with_target_V2(__str, 0, queue);
  id v8 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v7;
}

void *IOGCDeviceSetCancelHandler(uint64_t a1, const void *a2)
{
  id result = _Block_copy(a2);
  *(void *)(a1 + 56) = result;
  return result;
}

uint64_t IOGCDeviceActivate(uint64_t result)
{
  if ((atomic_fetch_or((atomic_uchar *volatile)(result + 92), 1u) & 1) == 0)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 48)) {
      IOGCDeviceActivate_cold_1();
    }
    io_object_t v2 = objc_alloc_init(GCIONotificationPort);
    *(void *)(v1 + 64) = v2;
    uint64_t v3 = *(void *)(v1 + 48);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __IOGCDeviceActivate_block_invoke;
    v6[3] = &unk_26BEC46A8;
    v6[4] = v1;
    id result = [(GCIONotificationPort *)v2 setQueue:v3 cancellationHandler:v6];
    if (*(void *)(v1 + 72))
    {
      uint64_t v4 = (IONotificationPort *)-[GCIONotificationPort port](*(void *)(v1 + 64));
      io_service_t v5 = -[GCIOObject port](v1);
      return IOServiceAddInterestNotification(v4, v5, "IOGeneralInterest", (IOServiceInterestCallback)__IOHIDDeviceRemovedNotification, (void *)v1, (io_object_t *)(v1 + 88));
    }
  }
  return result;
}

uint64_t __IOGCDeviceActivate_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void IOGCDeviceCancel(uint64_t a1)
{
  if ((atomic_fetch_or((atomic_uchar *volatile)(a1 + 92), 3u) & 2) == 0)
  {
    io_object_t v2 = *(_DWORD *)(a1 + 88);
    if (v2)
    {
      IOObjectRelease(v2);
      *(_DWORD *)(a1 + 88) = 0;
    }
    uint64_t v3 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;
  }
}

uint64_t IOGCDeviceSetRemovalCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (atomic_load((unsigned __int8 *)(result + 92))) {
    IOGCDeviceSetRemovalCallback_cold_1();
  }
  *(void *)(result + 72) = a2;
  *(void *)(result + 80) = a3;
  return result;
}

uint64_t IOCircularDataQueueInitFixed(uint64_t a1, uint64_t a2, unint64_t a3, int a4, uint64_t a5)
{
  if (HIDWORD(a3)) {
    return 3758097090;
  }
  uint64_t result = 0;
  *(void *)a2 = a5;
  *(void *)a1 = a5;
  *(_DWORD *)(a2 + 8) = a3;
  *(_DWORD *)(a2 + 12) = a4;
  *(_DWORD *)(a1 + 8) = a3;
  *(_DWORD *)(a1 + 12) = a4;
  atomic_store(1uLL, (unint64_t *)(a1 + 16));
  atomic_store(1uLL, (unint64_t *)(a1 + 24));
  atomic_store(0, (unint64_t *)(a1 + 32));
  atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(a1 + 40));
  atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(a1 + 48));
  atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(a1 + 56));
  return result;
}

uint64_t IOCircularDataQueueGetStartingPosition(uint64_t a1, void *a2)
{
  uint64_t result = 3758097095;
  if (*(_DWORD *)(a1 + 12))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4 == -1)
    {
      return 3758097112;
    }
    else
    {
      uint64_t result = 0;
      *a2 = v4;
    }
  }
  return result;
}

uint64_t IOCircularDataQueueGetLatestPosition(uint64_t a1, unint64_t *a2)
{
  uint64_t result = 3758097095;
  if (*(_DWORD *)(a1 + 12))
  {
    unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)(a1 + 48), memory_order_acquire);
    if (explicit == -1)
    {
      return 3758097112;
    }
    else
    {
      uint64_t result = 0;
      *a2 = explicit;
    }
  }
  return result;
}

uint64_t IOCircularDataQueueReset(uint64_t a1, unint64_t a2)
{
  uint64_t result = 3758097109;
  if (a2 == -1) {
    return 3758097090;
  }
  unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)(a1 + 16), memory_order_acquire);
  if (explicit == atomic_load_explicit((atomic_ullong *volatile)(a1 + 24), memory_order_acquire))
  {
    unint64_t v5 = explicit;
    atomic_compare_exchange_strong((atomic_ullong *volatile)(a1 + 24), &v5, explicit + 1);
    if (v5 == explicit)
    {
      if ((uint64_t)atomic_load_explicit((atomic_ullong *volatile)(a1 + 32), memory_order_acquire) <= 0)
      {
        if (*(_DWORD *)(a1 + 12))
        {
          uint64_t result = 0;
          atomic_store(a2, (unint64_t *)(a1 + 40));
          atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(a1 + 48));
          atomic_store(a2, (unint64_t *)(a1 + 56));
        }
        else
        {
          uint64_t result = 3758097095;
        }
        ++explicit;
      }
      atomic_store(explicit, (unint64_t *)(a1 + 16));
    }
  }
  return result;
}

uint64_t IOCircularDataQueueEnqueueCopy(unint64_t a1, uint64_t a2, void *__src, size_t __n)
{
  uint64_t result = 3758097090;
  uint64_t v6 = *(unsigned int *)(a1 + 8);
  if (v6 != *(_DWORD *)(a2 + 8)) {
    return 3758097105;
  }
  uint64_t v7 = *(unsigned int *)(a1 + 12);
  if (v7 != *(_DWORD *)(a2 + 12)) {
    return 3758097105;
  }
  if (__n <= 0xFFFFFFC7)
  {
    atomic_fetch_add((atomic_ullong *volatile)(a1 + 32), 1uLL);
    unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)(a1 + 16), memory_order_acquire);
    if (explicit == atomic_load_explicit((atomic_ullong *volatile)(a1 + 24), memory_order_acquire))
    {
      if (v7)
      {
        if (v7 >= __n)
        {
          unint64_t v9 = atomic_load_explicit((atomic_ullong *volatile)(a1 + 56), memory_order_acquire);
          if (v9 == -1)
          {
            uint64_t result = 3758097112;
            goto LABEL_23;
          }
          unint64_t v10 = (v7 + 63) & 0x1FFFFFFF8;
          unint64_t v11 = (v6 - 64) / v10;
          unint64_t v12 = a1 + 64 + v9 % v11 * v10;
          unint64_t v13 = a1 + v6;
          if (v12 < a1 || v12 >= v13) {
            goto LABEL_23;
          }
          unint64_t v15 = v9;
          atomic_compare_exchange_strong((atomic_ullong *volatile)(a1 + 56), &v15, v9 + 1);
          if (v15 == v9)
          {
            atomic_store(v9, (unint64_t *)(v12 + 40));
            *(void *)unint64_t v12 = *(void *)a1;
            atomic_store(explicit, (unint64_t *)(v12 + 8));
            atomic_store(v9 - 1, (unint64_t *)(v12 + 16));
            atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(v12 + 24));
            *(_DWORD *)(v12 + 48) = __n;
            memcpy((void *)(v12 + 56), __src, __n);
            atomic_store(v9, (unint64_t *)(v12 + 32));
            if (v9) {
              atomic_store(v9, (unint64_t *)(a1 + 64 + (v9 - 1) % v11 * v10 + 24));
            }
            unint64_t v16 = atomic_load_explicit((atomic_ullong *volatile)(a1 + 48), memory_order_acquire);
            if (v16 == -1 || v9 > v16)
            {
              uint64_t result = 0;
              atomic_compare_exchange_strong((atomic_ullong *volatile)(a1 + 48), &v16, v9);
            }
            else
            {
              uint64_t result = 0;
            }
            goto LABEL_23;
          }
          goto LABEL_22;
        }
      }
      else
      {
        uint64_t result = 3758097095;
      }
LABEL_23:
      atomic_fetch_add((atomic_ullong *volatile)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
      return result;
    }
    atomic_fetch_add((atomic_ullong *volatile)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
LABEL_22:
    uint64_t result = 3758097109;
    goto LABEL_23;
  }
  return result;
}

uint64_t IOCircularDataQueueCursorReset(uint64_t a1, unint64_t *a2, unint64_t a3)
{
  uint64_t result = 3758097095;
  if (*(_DWORD *)(a1 + 12))
  {
    unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)(a1 + 16), memory_order_acquire);
    unint64_t v6 = atomic_load_explicit((atomic_ullong *volatile)(a1 + 40), memory_order_acquire);
    unint64_t v7 = atomic_load_explicit((atomic_ullong *volatile)(a1 + 48), memory_order_acquire);
    if (v7 == -1)
    {
      return 3758097112;
    }
    else if (v6 > a3)
    {
      return 3758097127;
    }
    else if (v7 < a3)
    {
      return 3758097128;
    }
    else
    {
      uint64_t result = 0;
      *a2 = explicit;
      a2[1] = a3;
    }
  }
  return result;
}

uint64_t IOCircularDataQueueCursorResetLatest(uint64_t a1, unint64_t *a2)
{
  uint64_t result = 3758097095;
  unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)(a1 + 16), memory_order_acquire);
  if (*(_DWORD *)(a1 + 12))
  {
    unint64_t v5 = atomic_load_explicit((atomic_ullong *volatile)(a1 + 48), memory_order_acquire);
    if (v5 == -1)
    {
      return 3758097112;
    }
    else
    {
      uint64_t result = 0;
      *a2 = explicit;
      a2[1] = v5;
    }
  }
  return result;
}

uint64_t IOCircularDataQueueCursorMovePrevious(uint64_t a1, void *a2)
{
  uint64_t result = 3758097095;
  if (*a2 != atomic_load_explicit((atomic_ullong *volatile)(a1 + 16), memory_order_acquire)) {
    return 3758097131;
  }
  if (*(_DWORD *)(a1 + 12))
  {
    unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)(a1 + 40), memory_order_acquire);
    if (atomic_load_explicit((atomic_ullong *volatile)(a1 + 48), memory_order_acquire) == -1)
    {
      return 3758097112;
    }
    else
    {
      unint64_t v5 = a2[1];
      if (v5 <= explicit)
      {
        return 3758097127;
      }
      else
      {
        uint64_t result = 0;
        a2[1] = v5 - 1;
      }
    }
  }
  return result;
}

uint64_t IOCircularDataQueueCursorMoveNext(uint64_t a1, void *a2)
{
  uint64_t result = 3758097095;
  if (*a2 != atomic_load_explicit((atomic_ullong *volatile)(a1 + 16), memory_order_acquire)) {
    return 3758097131;
  }
  if (*(_DWORD *)(a1 + 12))
  {
    unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)(a1 + 48), memory_order_acquire);
    if (explicit == -1)
    {
      return 3758097112;
    }
    else
    {
      unint64_t v5 = a2[1];
      if (v5 >= explicit)
      {
        return 3758097128;
      }
      else
      {
        uint64_t result = 0;
        a2[1] = v5 + 1;
      }
    }
  }
  return result;
}

uint64_t IOCircularDataQueueCursorAccess(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  uint64_t v3 = *(unsigned int *)(a1 + 12);
  unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)(a1 + 16), memory_order_acquire);
  unint64_t v6 = atomic_load_explicit((atomic_ullong *volatile)(a1 + 48), memory_order_acquire);
  if (*a2 != explicit) {
    return 3758097131;
  }
  unint64_t v7 = a2[1];
  if (v7 > v6) {
    return 3758097128;
  }
  if (!v3) {
    return 3758097095;
  }
  unint64_t v8 = v7 % ((v4 - 64) / ((v3 + 63) & 0x1FFFFFFF8uLL)) * ((v3 + 63) & 0x1FFFFFFF8);
  uint64_t v9 = 3758097090;
  if ((v8 & 0x8000000000000000) == 0)
  {
    unint64_t v10 = a1 + v8 + 64;
    if (v10 < a1 + v4)
    {
      if (*(void *)v10 != *(void *)a1) {
        return 3758097105;
      }
      if (atomic_load_explicit((atomic_ullong *volatile)(v10 + 8), memory_order_acquire) == explicit)
      {
        unint64_t v11 = atomic_load_explicit((atomic_ullong *volatile)(v10 + 32), memory_order_acquire);
        if (v11 != atomic_load_explicit((atomic_ullong *volatile)(v10 + 40), memory_order_acquire)) {
          return 3758097127;
        }
        uint64_t v9 = 3758097127;
        if (v11 == a2[1])
        {
          (*(void (**)(uint64_t, unint64_t, void))(a3 + 16))(a3, v10 + 56, *(unsigned int *)(v10 + 48));
          return 0;
        }
        return v9;
      }
      return 3758097131;
    }
  }
  return v9;
}

void OUTLINED_FUNCTION_1_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_20AD589A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, NSErrorUserInfoKey a19, NSErrorUserInfoKey a20,NSErrorUserInfoKey a21,uint64_t a22,__CFString *a23,uint64_t a24)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v27 = objc_begin_catch(exception_object);
      if (v25)
      {
        a19 = NSLocalizedDescriptionKey;
        id v28 = +[NSString stringWithFormat:@"Invalid '%@' definition."];
        a22 = (uint64_t)v28;
        a23 = @"Model build failed.  This is a #BUG.";
        a20 = NSLocalizedFailureReasonErrorKey;
        a21 = NSUnderlyingErrorKey;
        id v29 = objc_msgSend(v27, "gc_error");
        a24 = (uint64_t)v29;
        long long v30 = [*(id *)(v26 + 480) dictionaryWithObjects:&a22 forKeys:&a19 count:3];
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v30);
        void *v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_end_catch();
      JUMPOUT(0x20AD58994);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_20AD58E9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20AD594A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
}

void sub_20AD59654(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t OUTLINED_FUNCTION_2_4(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void sub_20AD5A034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

void sub_20AD5AA94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20AD5AC58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20AD5AD10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_20AD5AE70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20AD5AF28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_20AD5DDC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_20AD5E3A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void OUTLINED_FUNCTION_0_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_20AD5E6DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20AD5E8F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_20AD5EEE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

void IOGCDeviceManagerSetDispatchQueue_cold_1()
{
  qword_2676829E8 = (uint64_t)"BUG IN GameControllerFoundation: Already activated.";
  qword_267682A18 = (uint64_t)"IOGCDeviceManager";
  __break(1u);
}

void IOGCDeviceManagerActivate_cold_1()
{
  qword_2676829E8 = (uint64_t)"BUG IN GameControllerFoundation: Queue not set.";
  qword_267682A18 = (uint64_t)"IOGCDeviceManager";
  __break(1u);
}

void __IOGCDeviceManagerStartMatching_cold_1(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_20AD04000, log, OS_LOG_TYPE_ERROR, "%@ IOServiceAddMatchingNotification failed: %{mach.errno}d", (uint8_t *)&v3, 0x12u);
}

void IOGCDeviceManagerSetDeviceMatchingCallback_cold_1()
{
  qword_2676829E8 = (uint64_t)"BUG IN GameControllerFoundation: Already activated.";
  qword_267682A18 = (uint64_t)"IOGCDeviceManager";
  __break(1u);
}

void __IOHIDQueueInputElementValueCallback_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_20AD04000, log, OS_LOG_TYPE_DEBUG, "#WARNING IOHIDQueue is full, events may have been dropped!", buf, 2u);
}

void IOGCFastPathClientCreateWithPlugInInterface_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5(&dword_20AD04000, v0, v1, "[IOGCFastPathClient] #Error obtaining 'kIOCFPlugInInterface' from %p: %d", v2, v3);
}

void IOGCFastPathClientCreateWithPlugInInterface_cold_2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5(&dword_20AD04000, v0, v1, "[IOGCFastPathClient] #Error obtaining 'IOGFastPathClientInterface' from %p: %d", v2, v3);
}

void IOGCFastPathClientCreateWithPlugInInterface_cold_3()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_4(&dword_20AD04000, v0, v1, "[IOGCFastPathClient] The 'IOGFastPathClientInterface' obtained from the plugin object is an unsupported version: %d", v2, v3, v4, v5, v6);
}

void IOGCFastPathClientCreateWithPlugInInterface_cold_4()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_20AD04000, v0, v1, "[IOGCFastPathClient] #Error retaining service port: %{mach.errno}d", v2, v3, v4, v5, v6);
}

void IOGCFastPathClientCreate_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_4(&dword_20AD04000, v0, v1, "[IOGCFastPathClient] The 'IOGFastPathClientInterface' obtained from the plugin object is an unsupported version: %d", v2, v3, v4, v5, v6);
}

void IOGCFastPathClientCreate_cold_2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_20AD04000, v0, v1, "[IOGCFastPathClient] #Error retaining service port: %{mach.errno}d", v2, v3, v4, v5, v6);
}

void IOGCFastPathInputQueueCreateWithOptions_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_20AD04000, v0, v1, "[IOGCFastPathInputQueue] #Error creating queue plugin object: %d", v2, v3, v4, v5, v6);
}

void IOGCFastPathInputQueueCreateWithOptions_cold_2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_20AD04000, v0, v1, "[IOGCFastPathInputQueue] #Error obtaining 'IOGFastPathQueueInterface' from queue plugin object: %d", v2, v3, v4, v5, v6);
}

void IOGCFastPathInputQueueCreateWithOptions_cold_3()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_4(&dword_20AD04000, v0, v1, "The 'IOGFastPathQueueInterface' obtained from the queue plugin object is an unsupported version: %d", v2, v3, v4, v5, v6);
}

void IOGCFastPathInputQueueRegisterDataAvailableCallback_cold_1()
{
  qword_2676829E8 = (uint64_t)"BUG IN CLIENT OF IOGCFastPathInputQueue: Queue has already been activated";
  __break(1u);
}

void IOGCFastPathInputQueueSetDispatchQueue_cold_1()
{
  qword_2676829E8 = (uint64_t)"BUG IN CLIENT OF IOGCFastPathInputQueue: Queue has already been activated";
  __break(1u);
}

void IOGCFastPathInputQueueSetCancelHandler_cold_1()
{
  qword_2676829E8 = (uint64_t)"BUG IN CLIENT OF IOGCFastPathInputQueue: Queue has already been activated";
  __break(1u);
}

void IOGCFastPathInputQueueCancel_cold_1()
{
  qword_2676829E8 = (uint64_t)"BUG IN CLIENT OF IOGCFastPathInputQueue: Queue has not been activated";
  __break(1u);
}

void IOGCFastPathReaderCreate_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_20AD04000, v0, v1, "[IOGCFastPathReader] #Error creating reader plugin object: %d", v2, v3, v4, v5, v6);
}

void IOGCFastPathReaderCreate_cold_2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_20AD04000, v0, v1, "[IOGCFastPathReader] #Error obtaining 'IOGCFastPathReaderInterface' from reader plugin object: %d", v2, v3, v4, v5, v6);
}

void IOGCFastPathReaderCreate_cold_3()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_4(&dword_20AD04000, v0, v1, "[IOGCFastPathReader] The 'IOGCFastPathReaderInterface' obtained from the reader plugin object is an unsupported version: %d", v2, v3, v4, v5, v6);
}

void ConnectToDriverService_cold_1(uint64_t a1)
{
  uint64_t v2 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
  uint64_t v3 = +[NSString stringWithUTF8String:"void ConnectToDriverService(Protocol *__strong, __strong id<GCConfigXPCServiceInterface>, __strong id, void (^__strong)(__strong id, NSError *__strong))"];
  [v2 handleFailureInFunction:v3, @"GCConfigXPCServiceConnection.m", 66, @"Unknown service: %@", a1 file lineNumber description];

  __break(1u);
}

void ___ZN8Observer6CreateEU13block_pointerFv13GCFutureStateP11objc_objectP7NSErrorEPU28objcproto17OS_dispatch_queue8NSObjectj11qos_class_ti_block_invoke_cold_1()
{
}

void IOGCDeviceCreate_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_20AD04000, a2, OS_LOG_TYPE_ERROR, "IOGCDevice creation failed: %@", (uint8_t *)&v3, 0xCu);
}

void IOGCDeviceCreate_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20AD04000, log, OS_LOG_TYPE_ERROR, "IOGCDevice creation failed.", v1, 2u);
}

void IOGCDeviceSetDispatchQueue_cold_1()
{
  qword_2676829E8 = (uint64_t)"BUG IN CLIENT OF IOGCDevice: Already activated.";
  __break(1u);
}

void IOGCDeviceActivate_cold_1()
{
  qword_2676829E8 = (uint64_t)"BUG IN CLIENT OF IOGCDevice: A queue must be set before activation.";
  __break(1u);
}

void IOGCDeviceSetRemovalCallback_cold_1()
{
  qword_2676829E8 = (uint64_t)"BUG IN CLIENT OF IOGCDevice: Already activated.";
  __break(1u);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x270EE4A20](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x270EE4F48](theSet, value);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x270EE4F58](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x270EE4F70](theSet);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x270EE4F80](theSet, value);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x270EE5480](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x270EE5498](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x270EE54A8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CFDataRef IOCFSerialize(CFTypeRef object, CFOptionFlags options)
{
  return (CFDataRef)MEMORY[0x270EF3EF0](object, options);
}

CFTypeRef IOCFUnserializeBinary(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x270EF3F00](buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectMapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x270EF3F58](*(void *)&connect, *(void *)&memoryType, *(void *)&intoTask, atAddress, ofSize, *(void *)&options);
}

kern_return_t IOConnectSetCFProperty(io_connect_t connect, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x270EF3F70](*(void *)&connect, propertyName, property);
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x270EF3FC8](*(void *)&service, pluginType, interfaceType, theInterface, theScore);
}

kern_return_t IODestroyPlugInInterface(IOCFPlugInInterface **interface)
{
  return MEMORY[0x270EF4008](interface);
}

IOReturn IOHIDDeviceClose(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x270EF4050](device, *(void *)&options);
}

CFArrayRef IOHIDDeviceCopyMatchingElements(IOHIDDeviceRef device, CFDictionaryRef matching, IOOptionBits options)
{
  return (CFArrayRef)MEMORY[0x270EF4060](device, matching, *(void *)&options);
}

IOHIDDeviceRef IOHIDDeviceCreate(CFAllocatorRef allocator, io_service_t service)
{
  return (IOHIDDeviceRef)MEMORY[0x270EF4070](allocator, *(void *)&service);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4078](device, key);
}

io_service_t IOHIDDeviceGetService(IOHIDDeviceRef device)
{
  return MEMORY[0x270EF4090](device);
}

IOReturn IOHIDDeviceGetValue(IOHIDDeviceRef device, IOHIDElementRef element, IOHIDValueRef *pValue)
{
  return MEMORY[0x270EF4098](device, element, pValue);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x270EF40A0](device, *(void *)&options);
}

IOReturn IOHIDDeviceSetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength)
{
  return MEMORY[0x270EF40F0](device, *(void *)&reportType, reportID, report, reportLength);
}

CFArrayRef IOHIDElementGetChildren(IOHIDElementRef element)
{
  return (CFArrayRef)MEMORY[0x270EF4110](element);
}

IOHIDElementCollectionType IOHIDElementGetCollectionType(IOHIDElementRef element)
{
  return MEMORY[0x270EF4118](element);
}

IOHIDElementCookie IOHIDElementGetCookie(IOHIDElementRef element)
{
  return MEMORY[0x270EF4120](element);
}

IOHIDDeviceRef IOHIDElementGetDevice(IOHIDElementRef element)
{
  return (IOHIDDeviceRef)MEMORY[0x270EF4128](element);
}

CFIndex IOHIDElementGetLogicalMax(IOHIDElementRef element)
{
  return MEMORY[0x270EF4130](element);
}

CFIndex IOHIDElementGetLogicalMin(IOHIDElementRef element)
{
  return MEMORY[0x270EF4138](element);
}

CFStringRef IOHIDElementGetName(IOHIDElementRef element)
{
  return (CFStringRef)MEMORY[0x270EF4140](element);
}

CFIndex IOHIDElementGetPhysicalMax(IOHIDElementRef element)
{
  return MEMORY[0x270EF4150](element);
}

CFIndex IOHIDElementGetPhysicalMin(IOHIDElementRef element)
{
  return MEMORY[0x270EF4158](element);
}

CFTypeRef IOHIDElementGetProperty(IOHIDElementRef element, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4160](element, key);
}

uint32_t IOHIDElementGetReportCount(IOHIDElementRef element)
{
  return MEMORY[0x270EF4168](element);
}

IOHIDElementType IOHIDElementGetType(IOHIDElementRef element)
{
  return MEMORY[0x270EF4180](element);
}

CFTypeID IOHIDElementGetTypeID(void)
{
  return MEMORY[0x270EF4188]();
}

uint32_t IOHIDElementGetUsage(IOHIDElementRef element)
{
  return MEMORY[0x270EF41A0](element);
}

uint32_t IOHIDElementGetUsagePage(IOHIDElementRef element)
{
  return MEMORY[0x270EF41A8](element);
}

Boolean IOHIDElementHasNullState(IOHIDElementRef element)
{
  return MEMORY[0x270EF41B0](element);
}

Boolean IOHIDElementHasPreferredState(IOHIDElementRef element)
{
  return MEMORY[0x270EF41B8](element);
}

Boolean IOHIDElementIsArray(IOHIDElementRef element)
{
  return MEMORY[0x270EF41C0](element);
}

Boolean IOHIDElementIsNonLinear(IOHIDElementRef element)
{
  return MEMORY[0x270EF41C8](element);
}

Boolean IOHIDElementIsRelative(IOHIDElementRef element)
{
  return MEMORY[0x270EF41D0](element);
}

Boolean IOHIDElementIsWrapping(IOHIDElementRef element)
{
  return MEMORY[0x270EF41D8](element);
}

Boolean IOHIDElementSetProperty(IOHIDElementRef element, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x270EF41E0](element, key, property);
}

void IOHIDQueueActivate(IOHIDQueueRef queue)
{
}

void IOHIDQueueAddElement(IOHIDQueueRef queue, IOHIDElementRef element)
{
}

void IOHIDQueueCancel(IOHIDQueueRef queue)
{
}

IOHIDValueRef IOHIDQueueCopyNextValue(IOHIDQueueRef queue)
{
  return (IOHIDValueRef)MEMORY[0x270EF4600](queue);
}

IOHIDQueueRef IOHIDQueueCreate(CFAllocatorRef allocator, IOHIDDeviceRef device, CFIndex depth, IOOptionBits options)
{
  return (IOHIDQueueRef)MEMORY[0x270EF4608](allocator, device, depth, *(void *)&options);
}

IOHIDDeviceRef IOHIDQueueGetDevice(IOHIDQueueRef queue)
{
  return (IOHIDDeviceRef)MEMORY[0x270EF4610](queue);
}

void IOHIDQueueRegisterValueAvailableCallback(IOHIDQueueRef queue, IOHIDCallback callback, void *context)
{
}

void IOHIDQueueRemoveElement(IOHIDQueueRef queue, IOHIDElementRef element)
{
}

void IOHIDQueueSetCancelHandler(IOHIDQueueRef queue, dispatch_block_t handler)
{
}

void IOHIDQueueSetDispatchQueue(IOHIDQueueRef queue, dispatch_queue_t dispatchQueue)
{
}

void IOHIDQueueStart(IOHIDQueueRef queue)
{
}

void IOHIDQueueStop(IOHIDQueueRef queue)
{
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4658](service, key);
}

CFTypeRef IOHIDServiceClientGetRegistryID(IOHIDServiceClientRef service)
{
  return (CFTypeRef)MEMORY[0x270EF4660](service);
}

const uint8_t *__cdecl IOHIDValueGetBytePtr(IOHIDValueRef value)
{
  return (const uint8_t *)MEMORY[0x270EF4758](value);
}

IOHIDElementRef IOHIDValueGetElement(IOHIDValueRef value)
{
  return (IOHIDElementRef)MEMORY[0x270EF4760](value);
}

CFIndex IOHIDValueGetIntegerValue(IOHIDValueRef value)
{
  return MEMORY[0x270EF4768](value);
}

CFIndex IOHIDValueGetLength(IOHIDValueRef value)
{
  return MEMORY[0x270EF4770](value);
}

double_t IOHIDValueGetScaledValue(IOHIDValueRef value, IOHIDValueScaleType type)
{
  MEMORY[0x270EF4778](value, *(void *)&type);
  return result;
}

uint64_t IOHIDValueGetTimeStamp(IOHIDValueRef value)
{
  return MEMORY[0x270EF4780](value);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x270EF4788](*(void *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x270EF47C8](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x270EF47E0](*(void *)&object, className);
}

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return (CFStringRef)MEMORY[0x270EF47F0](*(void *)&object);
}

kern_return_t IOObjectGetClass(io_object_t object, io_name_t className)
{
  return MEMORY[0x270EF4800](*(void *)&object, className);
}

BOOLean_t IOObjectIsEqualTo(io_object_t object, io_object_t anObject)
{
  return MEMORY[0x270EF4818](*(void *)&object, *(void *)&anObject);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x270EF4828](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x270EF49D0](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x270EF4A08](*(void *)&entry, name);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x270EF4A38](*(void *)&entry, entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x270EF4A60](*(void *)&entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x270EF4A80](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x270EF4A88](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x270EF2C18](proto);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x270EE55A0]();
}

uint64_t _IOHIDQueueCopyElements()
{
  return MEMORY[0x270EF4BD0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t _objc_rootRetainCount()
{
  return MEMORY[0x270F9A3E8]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

uint64_t _os_assert_log()
{
  return MEMORY[0x270ED8050]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

void bzero(void *a1, size_t a2)
{
}

id class_createInstance(Class cls, size_t extraBytes)
{
  return (id)MEMORY[0x270F9A448](cls, extraBytes);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x270F9A468](cls);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9280](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

uint64_t dispatch_block_create_with_voucher()
{
  return MEMORY[0x270ED9288]();
}

uint64_t dispatch_block_create_with_voucher_and_qos_class()
{
  return MEMORY[0x270ED9290]();
}

void dispatch_block_perform(dispatch_block_flags_t flags, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x270ED9310]();
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

uint64_t dispatch_mach_cancel()
{
  return MEMORY[0x270ED93C8]();
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x270ED93D0]();
}

uint64_t dispatch_mach_create()
{
  return MEMORY[0x270ED93D8]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x270ED93F8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9440](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x270ED9470](queue);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x270ED9478](queue, relative_priority_ptr);
}

uint64_t dispatch_queue_set_label_nocopy()
{
  return MEMORY[0x270ED9488]();
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

uint64_t dispatch_workloop_copy_current()
{
  return MEMORY[0x270ED95C0]();
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x270ED95C8](label);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x270ED95D0](label);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x270ED9610](a1, a2);
}

uint64_t dyld_image_header_containing_address()
{
  return MEMORY[0x270ED96D0]();
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x270ED96D8]();
}

void free(void *a1)
{
}

uint64_t kdebug_is_enabled()
{
  return MEMORY[0x270ED9F48]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x270EDA180](*(void *)&target_task, size, offset, *(void *)&permission, object_handle, *(void *)&parent_entry);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x270EDA200](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x270EDA2A8](*(void *)&target_task, address, size, mask, *(void *)&flags, *(void *)&object, offset, *(void *)&copy);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
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

id objc_constructInstance(Class cls, void *bytes)
{
  return (id)MEMORY[0x270F9A5B8](cls, bytes);
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void *__cdecl objc_destructInstance(id obj)
{
  return (void *)MEMORY[0x270F9A600](obj);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty(id self, SEL _cmd, ptrdiff_t offset, id newValue, BOOL atomic, char shouldCopy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL object_isClass(id obj)
{
  return MEMORY[0x270F9AA68](obj);
}

Class object_setClass(id a1, Class a2)
{
  return (Class)MEMORY[0x270F9AA70](a1, a2);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x270EDAAD0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD90](audittoken, buffer, *(void *)&buffersize);
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x270F9AAD0](p);
}

int pthread_get_qos_class_np(pthread_t __pthread, qos_class_t *__qos_class, int *__relative_priority)
{
  return MEMORY[0x270EDAEC8](__pthread, __qos_class, __relative_priority);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDAEF0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDAF18](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x270F9AAE0](sel);
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x270F9AAE8](str);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

uint64_t voucher_copy()
{
  return MEMORY[0x270EDBAD8]();
}

uint64_t xpc_activity_add_eligibility_changed_handler()
{
  return MEMORY[0x270EDBCA0]();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

uint64_t xpc_activity_remove_eligibility_changed_handler()
{
  return MEMORY[0x270EDBCC8]();
}

uint64_t xpc_activity_set_completion_status()
{
  return MEMORY[0x270EDBCD8]();
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x270EDBCE8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCF0](activity);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDBD20]();
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x270EDBDD8](value);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

uint64_t xpc_dictionary_copy_mach_send()
{
  return MEMORY[0x270EDC000]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC040](xdict, key);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x270EDC048]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x270EDC128]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x270EDC218](xint);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x270EDC430](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x270EDC440](xuint);
}