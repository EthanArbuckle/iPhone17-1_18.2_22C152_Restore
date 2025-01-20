uint64_t sub_2180EE5F4()
{
  return 3;
}

BOOL sub_2180EE5FC(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_length(a1, a2, a3);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  v6 = objc_opt_class();
  unint64_t v9 = objc_msgSend_im_maxBigmojiCount(v6, v7, v8);
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  v12 = objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x263F08708], v10, v11);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_2180EE734;
  v17[3] = &unk_2643006C0;
  id v13 = v12;
  id v18 = v13;
  v19 = &v21;
  unint64_t v20 = v9;
  objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(a1, v14, 0, v5, 2, v17);
  BOOL v15 = v22[3] - 1 < v9;

  _Block_object_dispose(&v21, 8);
  return v15;
}

void sub_2180EE71C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2180EE734(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  objc_msgSend_stringByTrimmingCharactersInSet_(a2, (const char *)a2, a1[4]);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_length(v15, v9, v10);
  v12 = v15;
  if (v11)
  {
    if (CEMStringIsSingleEmoji())
    {
      ++*(void *)(*(void *)(a1[5] + 8) + 24);
      v12 = v15;
    }
    else
    {
      uint64_t v14 = 0;
      v12 = v15;
      do
      {
        if (objc_msgSend_characterAtIndex_(v12, v13, v14) != 65532)
        {
          *(void *)(*(void *)(a1[5] + 8) + 24) = 0;
          *a7 = 1;
        }
        ++v14;
        v12 = v15;
      }
      while (v11 != v14);
    }
    if (*(void *)(*(void *)(a1[5] + 8) + 24) > (unint64_t)a1[6]) {
      *a7 = 1;
    }
  }
}

uint64_t sub_2180F0D30(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend__updateBubbleOpacity(*(void **)(a1 + 32), a2, a3);
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t sub_2180F1558(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t _IMDispatchQueueBlockCompare(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9A6D0](a1, sel_compare_, a2);
}

void sub_2180F1B9C(uint64_t a1)
{
  v2 = [_IMDispatchQueueBlock alloc];
  uint64_t v4 = (const char *)objc_msgSend_initWithBlock_key_priority_fifo_(v2, v3, *(void *)(a1 + 64), *(void *)(a1 + 32), *(void *)(a1 + 72), *(void *)(*(void *)(a1 + 40) + 8));
  uint64_t v5 = *(void *)(a1 + 32);
  value = (char *)v4;
  if (v5)
  {
    v6 = objc_msgSend_objectForKey_(*(void **)(a1 + 48), v4, v5);

    if (v6) {
      objc_msgSend_raise_format_(MEMORY[0x263EFF940], v7, *MEMORY[0x263EFF4A0], @"Tried to add block for key %@ which IMDispatchQueue already contains.", *(void *)(a1 + 32));
    }
    objc_msgSend_setObject_forKey_(*(void **)(a1 + 48), v7, (uint64_t)value, *(void *)(a1 + 32));
    uint64_t v4 = value;
  }
  CFBinaryHeapAddValue(*(CFBinaryHeapRef *)(a1 + 56), v4);
  ++*(void *)(*(void *)(a1 + 40) + 8);
}

void sub_2180F1C70(uint64_t a1)
{
  uint64_t v8 = 0;
  unint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_2180F1D98;
  v12 = sub_2180F1DC4;
  id v13 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2180F1DCC;
  block[3] = &unk_264300760;
  v2 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  v7 = &v8;
  dispatch_sync(v2, block);
  uint64_t v3 = v9[5];
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }

  _Block_object_dispose(&v8, 8);
}

void sub_2180F1D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2180F1D98(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x21D462460](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_2180F1DC4(uint64_t a1)
{
}

void sub_2180F1DCC(uint64_t a1)
{
  v2 = CFBinaryHeapGetMinimum(*(CFBinaryHeapRef *)(a1 + 32));
  if (v2)
  {
    id v14 = v2;
    v7 = objc_msgSend_key(v2, v3, v4);
    if (v7) {
      objc_msgSend_removeObjectForKey_(*(void **)(a1 + 40), v5, (uint64_t)v7);
    }
    uint64_t v8 = objc_msgSend_block(v14, v5, v6);
    uint64_t v11 = objc_msgSend_copy(v8, v9, v10);
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    CFBinaryHeapRemoveMinimumValue(*(CFBinaryHeapRef *)(a1 + 32));
    v2 = v14;
  }
}

void sub_2180F1FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2180F1FE8(uint64_t a1, const char *a2)
{
  objc_msgSend_objectForKey_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40));
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = objc_msgSend_block(v11, v3, v4);
  uint64_t v8 = objc_msgSend_copy(v5, v6, v7);
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void sub_2180F2170(uint64_t a1, const char *a2)
{
  uint64_t v3 = objc_msgSend_objectForKey_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40));
  if (v3)
  {
    id v6 = v3;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend_priority(v3, v4, v5);
    uint64_t v3 = v6;
  }
}

uint64_t sub_2180F22FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2180F230C(uint64_t a1)
{
}

void sub_2180F2314(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_allKeys(*(void **)(a1 + 32), a2, a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_msgSend_copy(v9, v4, v5);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void sub_2180F2484(uint64_t a1, const char *a2)
{
  uint64_t v3 = objc_msgSend_objectForKey_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3 != 0;
}

void sub_2180F25B0(uint64_t a1, const char *a2)
{
  objc_msgSend_objectForKey_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancel(v6, v3, v4);
  objc_msgSend_removeObjectForKey_(*(void **)(a1 + 32), v5, *(void *)(a1 + 40));
}

uint64_t sub_2180F26E8(uint64_t a1)
{
  CFBinaryHeapRemoveAllValues(*(CFBinaryHeapRef *)(a1 + 32));
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(*(void **)(a1 + 40), v2, (uint64_t)&unk_26C918ED8);
  uint64_t v4 = *(void *)(a1 + 40);
  return MEMORY[0x270F9A6D0](v4, sel_removeAllObjects, v3);
}

uint64_t sub_2180F2734(uint64_t a1, const char *a2, void *a3)
{
  return objc_msgSend_cancel(a3, a2, (uint64_t)a3);
}

uint64_t sub_2180F2FBC(void *a1)
{
  id v1 = a1;
  return MEMORY[0x270F9A6D0](v1, sel_CGImage, v2);
}

void sub_2180F3724(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 136));
  objc_destroyWeak((id *)(v3 - 128));
  _Unwind_Resume(a1);
}

void sub_2180F37AC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 64);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = sub_2180F389C;
  id v9 = &unk_264300820;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  objc_copyWeak(&v11, (id *)(a1 + 56));
  objc_msgSend_playAfterDelay_completion_(v2, v4, (uint64_t)&v6, v3);
  objc_msgSend_setPlaying_(*(void **)(a1 + 40), v5, 1, v6, v7, v8, v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
}

void sub_2180F387C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2180F389C(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2) {
    objc_msgSend_audioPlayerDidFinishPlaying_(WeakRetained, v4, (uint64_t)v5);
  }
}

void sub_2180F3908(id *a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2180F3A28;
  v6[3] = &unk_264300848;
  id v7 = a1[4];
  v10[1] = a1[8];
  objc_copyWeak(&v9, a1 + 6);
  objc_copyWeak(v10, a1 + 7);
  id v8 = a1[5];
  uint64_t v2 = (void (**)(void))MEMORY[0x21D462460](v6);
  if (objc_msgSend_shouldUseSpeaker(a1[5], v3, v4)) {
    v2[2](v2);
  }
  else {
    objc_msgSend_playListenSound_(a1[5], v5, (uint64_t)v2);
  }

  objc_destroyWeak(v10);
  objc_destroyWeak(&v9);
}

void sub_2180F3A0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2180F3A28(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 64);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = sub_2180F3B18;
  id v9 = &unk_264300820;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  objc_copyWeak(&v11, (id *)(a1 + 56));
  objc_msgSend_playAfterDelay_completion_(v2, v4, (uint64_t)&v6, v3);
  objc_msgSend_setPlaying_(*(void **)(a1 + 40), v5, 1, v6, v7, v8, v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
}

void sub_2180F3AF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2180F3B18(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2) {
    objc_msgSend_audioPlayerDidFinishPlaying_(WeakRetained, v4, (uint64_t)v5);
  }
}

void sub_2180F3D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2180F3DA0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2180F3DB0(uint64_t a1)
{
}

uint64_t sub_2180F3DB8(uint64_t a1, const char *a2, uint64_t a3)
{
  if (objc_msgSend_isActive(*(void **)(a1 + 32), a2, a3))
  {
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (!v6)
    {
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t shouldUseAVPlayer = objc_msgSend_shouldUseAVPlayer(*(void **)(a1 + 40), v4, v5);
      uint64_t v10 = objc_msgSend_audioPlayerWithContentsOfURL_shouldUseAVPlayer_(IMAudioPlayer, v9, v7, shouldUseAVPlayer);
      uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      objc_msgSend_setDelegate_(*(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v13, *(void *)(a1 + 40));
      objc_msgSend_setAudioPlayer_(*(void **)(a1 + 40), v14, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
      uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    return objc_msgSend_prepareToPlay(v6, v4, v5);
  }
  else
  {
    v16 = *(void **)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 48);
    return objc_msgSend__notifyPlayerDidPrepareAudioURL_successfully_(v16, v4, v17, 0);
  }
}

uint64_t sub_2180F43A0(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_stop(*(void **)(a1 + 32), a2, a3);
}

void sub_2180F4598(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_2180F45B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend_setListenAudioPlayer_(WeakRetained, (const char *)WeakRetained, 0);
    id v3 = v6;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v4 = (*(uint64_t (**)(uint64_t, id))(v4 + 16))(v4, v3);
    id v3 = v6;
  }
  return MEMORY[0x270F9A758](v4, v3);
}

uint64_t sub_2180F4C88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__handleAVPlayerItemStateChange, a3);
}

void *sub_2180F4FC4()
{
  uint64_t result = (void *)MEMORY[0x21D462110]("CMTimeGetSeconds", @"CoreMedia");
  off_267BC0108 = result;
  return result;
}

void *sub_2180F5158()
{
  uint64_t result = (void *)MEMORY[0x21D462110]("CMTimeCompare", @"CoreMedia");
  off_267BC0118 = result;
  return result;
}

void *sub_2180F5188()
{
  uint64_t result = (void *)MEMORY[0x21D462110]("CMTimeGetSeconds", @"CoreMedia");
  off_267BC0128 = result;
  return result;
}

uint64_t sub_2180F53A8(uint64_t a1, const char *a2, uint64_t a3)
{
  *(void *)(*(void *)(a1 + 32) + 32) = 3;
  uint64_t v4 = objc_msgSend_name(*(void **)(a1 + 40), a2, a3);
  uint64_t isEqualToString = objc_msgSend_isEqualToString_(v4, v5, *MEMORY[0x263EFA050]);

  uint64_t v7 = *(void *)(a1 + 32);
  return MEMORY[0x270F9A6D0](v7, sel__notifyPlayerDidFinishSuccessfully_, isEqualToString);
}

void sub_2180F6A68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(id **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4 + 2);
  uint64_t v7 = objc_msgSend_layoutEngine_transcriptItemAtIndex_(WeakRetained, v6, *(void *)(a1 + 32), a2);
  objc_msgSend__makeDrawableForTranscriptItem_(v4, v8, (uint64_t)v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_addObject_(*(void **)(a1 + 40), v9, (uint64_t)v10);
}

BOOL IMBalloonDescriptorEqualsBalloonDescriptor(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2
      && a1[1] == a2[1]
      && a1[2] == a2[2]
      && *((void *)a1 + 1) == *((void *)a2 + 1)
      && *((void *)a1 + 2) == *((void *)a2 + 2)
      && a1[24] == a2[24]
      && a1[25] == a2[25];
}

__CFString *NSStringFromIMBalloonVisibleOrientation(uint64_t a1)
{
  id v1 = @"IMBalloonVisibleOrientationRight";
  if (a1 != 1) {
    id v1 = 0;
  }
  if (a1) {
    return v1;
  }
  else {
    return @"IMBalloonVisibleOrientationLeft";
  }
}

__CFString *NSStringFromIMTranscriptOrientation(unsigned int a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_264300928[a1];
  }
}

__CFString *NSStringFromIMBalloonShape(unsigned int a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_264300940[a1];
  }
}

__CFString *NSStringFromIMTailShape(unsigned int a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_264300958[a1];
  }
}

__CFString *NSStringFromIMBalloonStyle(int a1)
{
  id v1 = @"IMBalloonStyleStroked";
  if (a1 != 1) {
    id v1 = 0;
  }
  if (a1) {
    return v1;
  }
  else {
    return @"IMBalloonStyleFilled";
  }
}

id NSStringFromIMRectCorner(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_string(MEMORY[0x263F089D8], a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = v4;
  if (a1 == -1)
  {
    if (objc_msgSend_length(v4, v5, v6)) {
      objc_msgSend_appendFormat_(v7, v8, @"|%@", @"IMRectCornerAllCorners");
    }
    else {
      objc_msgSend_appendString_(v7, v8, @"IMRectCornerAllCorners");
    }
  }

  id v9 = v7;
  uint64_t v12 = v9;
  if (a1)
  {
    if (objc_msgSend_length(v9, v10, v11)) {
      objc_msgSend_appendFormat_(v12, v13, @"|%@", @"IMRectCornerTopLeft");
    }
    else {
      objc_msgSend_appendString_(v12, v13, @"IMRectCornerTopLeft");
    }
  }

  id v14 = v12;
  uint64_t v17 = v14;
  if ((a1 & 2) != 0)
  {
    if (objc_msgSend_length(v14, v15, v16)) {
      objc_msgSend_appendFormat_(v17, v18, @"|%@", @"IMRectCornerTopRight");
    }
    else {
      objc_msgSend_appendString_(v17, v18, @"IMRectCornerTopRight");
    }
  }

  id v19 = v17;
  v22 = v19;
  if ((a1 & 4) != 0)
  {
    if (objc_msgSend_length(v19, v20, v21)) {
      objc_msgSend_appendFormat_(v22, v23, @"|%@", @"IMRectCornerBottomLeft");
    }
    else {
      objc_msgSend_appendString_(v22, v23, @"IMRectCornerBottomLeft");
    }
  }

  id v24 = v22;
  v27 = v24;
  if ((a1 & 8) != 0)
  {
    if (objc_msgSend_length(v24, v25, v26)) {
      objc_msgSend_appendFormat_(v27, v28, @"|%@", @"IMRectCornerBottomRight");
    }
    else {
      objc_msgSend_appendString_(v27, v28, @"IMRectCornerBottomRight");
    }
  }

  return v27;
}

id NSStringFromIMBalloonAttributes(int a1, const char *a2, uint64_t a3)
{
  objc_msgSend_string(MEMORY[0x263F089D8], a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = v4;
  if (!a1)
  {
    if (objc_msgSend_length(v4, v5, v6)) {
      objc_msgSend_appendFormat_(v7, v8, @"|%@", @"IMBalloonAttributeNone");
    }
    else {
      objc_msgSend_appendString_(v7, v8, @"IMBalloonAttributeNone");
    }
  }

  id v9 = v7;
  uint64_t v12 = v9;
  if (a1 && (a1 & 2) != 0)
  {
    if (objc_msgSend_length(v9, v10, v11)) {
      objc_msgSend_appendFormat_(v12, v13, @"|%@", @"IMBalloonAttributeIsOpaque");
    }
    else {
      objc_msgSend_appendString_(v12, v13, @"IMBalloonAttributeIsOpaque");
    }
  }

  id v14 = v12;
  uint64_t v17 = v14;
  if (a1 && (a1 & 4) != 0)
  {
    if (objc_msgSend_length(v14, v15, v16)) {
      objc_msgSend_appendFormat_(v17, v18, @"|%@", @"IMBalloonAttributeUseLargeAsset");
    }
    else {
      objc_msgSend_appendString_(v17, v18, @"IMBalloonAttributeUseLargeAsset");
    }
  }

  return v17;
}

id NSStringFromIMBalloonDescriptor(char *a1)
{
  uint64_t v2 = NSString;
  unint64_t v3 = *a1;
  if (v3 > 2) {
    id v4 = 0;
  }
  else {
    id v4 = off_264300940[v3];
  }
  unint64_t v5 = a1[1];
  if (v5 > 2) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = off_264300958[v5];
  }
  if (a1[1]) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  id v8 = @"IMBalloonStyleStroked";
  if (a1[2] != 1) {
    id v8 = 0;
  }
  if (a1[2]) {
    id v9 = v8;
  }
  else {
    id v9 = @"IMBalloonStyleFilled";
  }
  uint64_t v10 = *((void *)a1 + 1);
  uint64_t v11 = @"IMBalloonVisibleOrientationRight";
  if (v10 != 1) {
    uint64_t v11 = 0;
  }
  if (v10) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = @"IMBalloonVisibleOrientationLeft";
  }
  int v13 = a1[24];
  id v14 = v12;
  id v15 = v9;
  uint64_t v16 = NSStringFromIMColorType(v13);
  id v19 = NSStringFromIMRectCorner(*((void *)a1 + 2), v17, v18);
  v22 = NSStringFromIMBalloonAttributes(a1[25], v20, v21);
  id v24 = objc_msgSend_stringWithFormat_(v2, v23, @"IMBalloonDescriptor_t = Shape:%@, TailShape:%@ (HasTail:%@), BalloonStyle:%@, BalloonOrientation:%@, BalloonColor:%@, BalloonCorners:%@, BalloonAttributes:%@", v4, v6, v7, v15, v14, v16, v19, v22);

  return v24;
}

uint64_t sub_2180F73FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F08D40], sel_value_withObjCType_, a3);
}

uint64_t sub_2180F7410@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *a2 = 0u;
  a2[1] = 0u;
  return MEMORY[0x270F9A6D0](a1, sel_getValue_size_, a2);
}

id IMSharedUIBundle()
{
  if (qword_267BC0140 != -1) {
    dispatch_once(&qword_267BC0140, &unk_26C918F18);
  }
  v0 = (void *)qword_267BC0138;
  return v0;
}

uint64_t sub_2180F7478(uint64_t a1, const char *a2)
{
  uint64_t v2 = objc_msgSend_bundleWithIdentifier_(MEMORY[0x263F086E0], a2, @"com.apple.messages.IMSharedUI");
  uint64_t v3 = qword_267BC0138;
  qword_267BC0138 = v2;
  return MEMORY[0x270F9A758](v2, v3);
}

uint64_t IMAnonymizeContentAndContacts()
{
  return byte_267BC0148;
}

void IMSetAnonymizeContentAndContacts(int a1)
{
  if (byte_267BC0148 != a1)
  {
    byte_267BC0148 = a1;
    dispatch_async(MEMORY[0x263EF83A0], &unk_26C919018);
  }
}

void sub_2180F74F8(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_(v4, v3, @"IMAnonymizeContentAndContactsDidChangeNotification", 0);
}

id IMURLForResourceFromSharedUIBundle(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  unint64_t v5 = IMSharedUIBundle();
  uint64_t v7 = objc_msgSend_URLForResource_withExtension_(v5, v6, (uint64_t)v4, v3);

  return v7;
}

uint64_t sub_2180F7618()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x263F4AC88], "IMSharedUI.transcript");
  uint64_t v1 = qword_267BC0150;
  qword_267BC0150 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t sub_2180F76B4()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x263F4AC88], "IMSharedUI.fsm");
  uint64_t v1 = qword_267BC0160;
  qword_267BC0160 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t sub_2180F7750()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x263F4AC88], "IMSharedUI.audio");
  uint64_t v1 = qword_267BC0170;
  qword_267BC0170 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t sub_2180F77EC()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x263F4AC88], "IMSharedUI.utilities");
  uint64_t v1 = qword_267BC0180;
  qword_267BC0180 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id sub_2180F785C(uint64_t a1, void *a2, uint64_t a3)
{
  if (objc_msgSend_userInterfaceStyle(a2, (const char *)a2, a3) == 2)
  {
    if (qword_267BC0198 != -1) {
      dispatch_once(&qword_267BC0198, &unk_26C918FD8);
    }
    id v3 = &qword_267BC0190;
  }
  else
  {
    if (qword_267BC01A8 != -1) {
      dispatch_once(&qword_267BC01A8, &unk_26C918FF8);
    }
    id v3 = &qword_267BC01A0;
  }
  id v4 = (void *)*v3;
  return v4;
}

uint64_t sub_2180F78F8(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], a2, a3, 0.149019608, 0.149019608, 0.160784314, 1.0);
  uint64_t v4 = qword_267BC0190;
  qword_267BC0190 = v3;
  return MEMORY[0x270F9A758](v3, v4);
}

uint64_t sub_2180F7950(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], a2, a3, 0.898039216, 0.898039216, 0.917647059, 1.0);
  uint64_t v4 = qword_267BC01A0;
  qword_267BC01A0 = v3;
  return MEMORY[0x270F9A758](v3, v4);
}

id sub_2180F7AC4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_userInterfaceStyle(a2, (const char *)a2, a3);
  if ((unint64_t)v3 >= 2)
  {
    if (v3 != (void *)2) {
      goto LABEL_6;
    }
    objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v4, v5, 0.168627451, 0.168627451, 0.180392157, 1.0);
  }
  else
  {
    objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v4, v5, 0.894117647, 0.894117647, 0.901960784, 1.0);
  uint64_t v3 = };
LABEL_6:
  return v3;
}

id sub_2180F7B54(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_userInterfaceStyle(a2, (const char *)a2, a3);
  if ((unint64_t)v3 >= 2)
  {
    if (v3 != (void *)2) {
      goto LABEL_6;
    }
    objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v4, v5, 0.619607843, 0.619607843, 0.619607843, 1.0);
  }
  else
  {
    objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v4, v5, 0.498039216, 0.498039216, 0.517647059, 1.0);
  uint64_t v3 = };
LABEL_6:
  return v3;
}

uint64_t sub_2180F7BD4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  uint64_t v7 = (void *)qword_267BC01B0;
  if (!qword_267BC01B0)
  {
    uint64_t v8 = objc_msgSend_autoupdatingCurrentCalendar(MEMORY[0x263EFF8F0], v4, v5);
    id v9 = (void *)qword_267BC01B0;
    qword_267BC01B0 = v8;

    uint64_t v7 = (void *)qword_267BC01B0;
  }
  uint64_t v10 = objc_msgSend_components_fromDate_(v7, v4, 28, a1);
  uint64_t v12 = objc_msgSend_components_fromDate_((void *)qword_267BC01B0, v11, 28, v6);
  uint64_t v14 = objc_msgSend_isEqual_(v10, v13, (uint64_t)v12) ^ 1;

  return v14;
}

id sub_2180F7C7C(void *a1, const char *a2, uint64_t a3)
{
  if (qword_267BC01B8 != -1) {
    dispatch_once(&qword_267BC01B8, &unk_26C918F58);
  }
  uint64_t v5 = objc_msgSend_numberWithInteger_(NSNumber, a2, a3);
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_((void *)qword_267BC01C0, v6, (uint64_t)v5);
  if (!v8)
  {
    uint64_t v8 = objc_msgSend__im_createDateFormatterForTimestampFormat_(a1, v7, a3);
    objc_msgSend_setObject_forKeyedSubscript_((void *)qword_267BC01C0, v9, (uint64_t)v8, v5);
  }
  uint64_t v10 = objc_msgSend_stringFromDate_(v8, v7, (uint64_t)a1);

  return v10;
}

uint64_t sub_2180F7D60(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, a3);
  uint64_t v4 = qword_267BC01C0;
  qword_267BC01C0 = v3;
  return MEMORY[0x270F9A758](v3, v4);
}

id sub_2180F7DA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  switch(a3)
  {
    case 0:
      uint64_t v3 = 1;
      goto LABEL_6;
    case 1:
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      uint64_t v3 = 1;
      break;
    case 2:
      uint64_t v3 = 0;
LABEL_6:
      uint64_t v4 = 1;
      uint64_t v5 = 1;
      break;
    case 3:
      uint64_t v5 = 1;
      uint64_t v3 = 2;
      uint64_t v4 = 1;
      break;
    default:
      uint64_t v3 = 0;
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      break;
  }
  id v6 = objc_alloc_init(MEMORY[0x263F08790]);
  objc_msgSend_setDoesRelativeDateFormatting_(v6, v7, v4);
  objc_msgSend_setDateStyle_(v6, v8, v5);
  objc_msgSend_setTimeStyle_(v6, v9, v3);
  return v6;
}

id IMAttachmentLogSubtype()
{
  if (qword_267BC01D0 != -1) {
    dispatch_once(&qword_267BC01D0, &unk_26C918F78);
  }
  os_log_t v0 = (void *)qword_267BC01C8;
  return v0;
}

uint64_t sub_2180F7EDC()
{
  os_log_t v0 = os_log_create("com.apple.messages", "IMAttachment");
  uint64_t v1 = qword_267BC01C8;
  qword_267BC01C8 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t sub_2180F7F20(void *a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_2180F80D8;
  v25[3] = &unk_264300898;
  uint64_t v3 = v2;
  uint64_t v26 = v3;
  objc_msgSend_loadValuesAsynchronouslyForKeys_completionHandler_(a1, v4, (uint64_t)&unk_26C91C428, v25);
  dispatch_semaphore_wait(v3, 0x3B9ACA00uLL);
  uint64_t v5 = (void *)MEMORY[0x263EFA748];
  uint64_t v7 = objc_msgSend_metadataForFormat_(a1, v6, *MEMORY[0x263EF9DE0]);
  id v9 = objc_msgSend_metadataItemsFromArray_withKey_keySpace_(v5, v8, (uint64_t)v7, @"LOOP", *MEMORY[0x263EF9E90]);

  if (!objc_msgSend_count(v9, v10, v11))
  {
LABEL_7:
    uint64_t v21 = 0;
    goto LABEL_8;
  }
  int v24 = 0;
  int v13 = objc_msgSend_objectAtIndexedSubscript_(v9, v12, 0);
  uint64_t v16 = objc_msgSend_dataValue(v13, v14, v15);
  uint64_t v18 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v17, (uint64_t)&v24, 4);
  char isEqualToData = objc_msgSend_isEqualToData_(v16, v19, (uint64_t)v18);

  if ((isEqualToData & 1) == 0)
  {
    v22 = IMAttachmentLogSubtype();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_2180FA8AC(v22);
    }

    goto LABEL_7;
  }
  uint64_t v21 = 1;
LABEL_8:

  return v21;
}

intptr_t sub_2180F80D8(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

__CFString *NSStringFromIMColorType(int a1)
{
  uint64_t v1 = a1 + 2;
  if (v1 > 8) {
    return 0;
  }
  else {
    return off_2643009A0[v1];
  }
}

uint64_t sub_2180F8B84()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  uint64_t v1 = qword_267BC01D8;
  qword_267BC01D8 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_2180F90F8(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (!qword_267BC01E8)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = objc_msgSend__createSingleton__im(v4, v2, v3);
    objc_msgSend___setSingleton__im_(v4, v6, (uint64_t)v5);
  }
  objc_sync_exit(obj);
}

void sub_2180F917C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t sub_2180F91E4()
{
  dispatch_queue_t v0 = dispatch_queue_create("IMAudioSessionControllerQueue", 0);
  uint64_t v1 = qword_267BC01F8;
  qword_267BC01F8 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_2180F9424(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_audio(IMSharedUILogs, a2, a3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = *(unsigned __int8 *)(a1 + 56);
    int v6 = *(unsigned __int8 *)(a1 + 57);
    uint64_t v7 = (void *)MEMORY[0x21D462460](*(void *)(a1 + 40));
    *(_DWORD *)buf = 67109632;
    int v20 = v5;
    __int16 v21 = 1024;
    int v22 = v6;
    __int16 v23 = 2048;
    int v24 = v7;
    _os_log_impl(&dword_2180ED000, v4, OS_LOG_TYPE_INFO, "dispatching setActive:%d shouldUseSpeaker:%d completion:%p", buf, 0x18u);
  }
  int v8 = *(unsigned __int8 *)(a1 + 56);
  if (v8 != objc_msgSend_isActive(*(void **)(a1 + 32), v9, v10)
    || *(unsigned char *)(a1 + 56) && (uint64_t v13 = *(void *)(a1 + 48), v13 != objc_msgSend_options(*(void **)(a1 + 32), v11, v12))
    || objc_msgSend_isDirty(*(void **)(a1 + 32), v11, v12))
  {
    if (*(unsigned char *)(a1 + 56))
    {
      objc_msgSend_configureAudioSessionWithOptions_(*(void **)(a1 + 32), v11, *(void *)(a1 + 48));
      BOOL v14 = *(unsigned char *)(a1 + 56) != 0;
    }
    else
    {
      BOOL v14 = 0;
    }
    objc_msgSend_setActive_(*(void **)(a1 + 32), v11, v14);
    objc_msgSend_setOptions_(*(void **)(a1 + 32), v15, *(void *)(a1 + 48));
    objc_msgSend_setDirty_(*(void **)(a1 + 32), v16, 0);
  }
  if (*(void *)(a1 + 40))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2180F9604;
    block[3] = &unk_264300710;
    id v18 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t sub_2180F9604(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2180F9FB0(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    int v5 = objc_msgSend_audio(IMSharedUILogs, v3, v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_2180FABAC();
    }

    objc_end_catch();
    JUMPOUT(0x2180F9F68);
  }
  _Unwind_Resume(exception_object);
}

void sub_2180FA020(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2180FA8AC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2180ED000, log, OS_LOG_TYPE_ERROR, "AVAsset found LOOP metadata with unexpected contents, assuming non-looping", v1, 2u);
}

void sub_2180FA8F0(int a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = objc_msgSend_outputDataSources(a2, (const char *)a2, (uint64_t)a3);
  v6[0] = 67109378;
  v6[1] = a1;
  __int16 v7 = 2112;
  int v8 = v5;
  _os_log_error_impl(&dword_2180ED000, a3, OS_LOG_TYPE_ERROR, "AudioSessionController: configureAudioSession using speaker = %d, %@", (uint8_t *)v6, 0x12u);
}

void sub_2180FA9A4()
{
  sub_2180FA03C();
  sub_2180FA020(&dword_2180ED000, v0, v1, "AudioSessionController: Failed setting activation context:%@", v2, v3, v4, v5, v6);
}

void sub_2180FAA0C()
{
  sub_2180FA03C();
  sub_2180FA020(&dword_2180ED000, v0, v1, "AudioSessionController: Failed setting the category:%@", v2, v3, v4, v5, v6);
}

void sub_2180FAA74()
{
  sub_2180FA03C();
  sub_2180FA020(&dword_2180ED000, v0, v1, "AudioSessionController: Failed setting the mode:%@", v2, v3, v4, v5, v6);
}

void sub_2180FAADC()
{
  sub_2180FA03C();
  sub_2180FA020(&dword_2180ED000, v0, v1, "AudioSessionController: Failed to activate audio session: %@", v2, v3, v4, v5, v6);
}

void sub_2180FAB44()
{
  sub_2180FA03C();
  sub_2180FA020(&dword_2180ED000, v0, v1, "AudioSessionController: Failed to deactivate audio session: %@", v2, v3, v4, v5, v6);
}

void sub_2180FABAC()
{
  sub_2180FA03C();
  sub_2180FA020(&dword_2180ED000, v0, v1, "Exception deactivating audio session: %@", v2, v3, v4, v5, v6);
}

void sub_2180FAC14(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2180ED000, log, OS_LOG_TYPE_ERROR, "IMAudioPlayer deallocated while playing, completion block won't be called.", v1, 2u);
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x270EFB950](retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x270EFB978](retstr, t, tx, ty, tz);
}

uint64_t CEMStringIsSingleEmoji()
{
  return MEMORY[0x270F18C68]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

void CFBinaryHeapAddValue(CFBinaryHeapRef heap, const void *value)
{
}

CFBinaryHeapRef CFBinaryHeapCreate(CFAllocatorRef allocator, CFIndex capacity, const CFBinaryHeapCallBacks *callBacks, const CFBinaryHeapCompareContext *compareContext)
{
  return (CFBinaryHeapRef)MEMORY[0x270EE44B8](allocator, capacity, callBacks, compareContext);
}

const void *__cdecl CFBinaryHeapGetMinimum(CFBinaryHeapRef heap)
{
  return (const void *)MEMORY[0x270EE44C8](heap);
}

void CFBinaryHeapRemoveAllValues(CFBinaryHeapRef heap)
{
}

void CFBinaryHeapRemoveMinimumValue(CFBinaryHeapRef heap)
{
}

void CFRelease(CFTypeRef cf)
{
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x270EE5CC0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5D68](space);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextRelease(CGContextRef c)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x270EE6690](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

void CGImageRelease(CGImageRef image)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x270F3CBC8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _IMWarn()
{
  return MEMORY[0x270F3CBF0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}