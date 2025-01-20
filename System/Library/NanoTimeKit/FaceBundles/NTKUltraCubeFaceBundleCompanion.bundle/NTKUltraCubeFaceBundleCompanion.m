void sub_4CE0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_4CFC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (v5)
  {
    [WeakRetained setInitialPreviewState:3];
    [v8 _setPreview:v5 animated:0];
  }
  else
  {
    [WeakRetained setInitialPreviewState:2];
    v9 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_2B694((uint64_t)v6, v9);
    }
  }
}

id sub_5BB0(uint64_t a1)
{
  double v1 = 0.2;
  if (!*(unsigned char *)(a1 + 48)) {
    double v1 = 0.0;
  }
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_5C4C;
  v3[3] = &unk_48C68;
  v3[4] = *(void *)(a1 + 32);
  v3[5] = *(void *)(a1 + 40);
  return +[UIView animateWithDuration:v3 animations:v1];
}

id sub_5C4C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 144) setAlpha:*(double *)(a1 + 40)];
}

id sub_5EA8(uint64_t a1, int a2)
{
  if (a2) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  return [*(id *)(a1 + 32) _setCropValidationState:v2 animated:*(unsigned __int8 *)(a1 + 40)];
}

void sub_61A4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 _ultracubePreviewViewControllerWantsToCancel:*(void *)(a1 + 32)];
}

void sub_6370(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 _ultracubePreviewViewControllerWantsToDelete:*(void *)(a1 + 32)];
}

void sub_65CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_65EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = [WeakRetained view];
    [v7 setUserInteractionEnabled:0];

    v8 = (void *)v6[21];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_66EC;
    v9[3] = &unk_48C40;
    objc_copyWeak(&v10, v4);
    objc_msgSend(v8, "ultracube_getOptimizedPreviewWithCompletion:", v9);
    objc_destroyWeak(&v10);
  }
}

void sub_66D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_66EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = [WeakRetained view];
  [v8 setUserInteractionEnabled:1];

  if (v5)
  {
    [WeakRetained _setPreview:v5 animated:0];
  }
  else
  {
    v9 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_2B70C((uint64_t)v6, v9);
    }
  }
}

void sub_73A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_73E8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_73F8(uint64_t a1)
{
}

void sub_7400(void *a1, void *a2, uint64_t a3, int a4, void *a5)
{
  id v9 = a2;
  uint64_t v10 = [a5 objectForKeyedSubscript:PHImageErrorKey];
  uint64_t v11 = *(void *)(a1[5] + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    v13 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1[4] + 16);
      uint64_t v15 = *(void *)(*(void *)(a1[5] + 8) + 40);
      int v16 = 136315650;
      v17 = "-[NTKCompanionUltraCubeImageDataDescriptor _initDataAndOrientationFromAsset]_block_invoke";
      __int16 v18 = 2112;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v15;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%s: Failed to get image data for asset %@, error %@", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    *(_DWORD *)(*(void *)(a1[7] + 8) + 24) = a4;
  }
}

void sub_80C8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 _randomSampleResourceDirectoryPath];
  id v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "New gallery UltraCube face created with directory %@", (uint8_t *)&v6, 0xCu);
  }

  [v3 setResourceDirectory:v4];
}

BOOL sub_8768(id a1, NSURL *a2, NSError *a3)
{
  id v3 = a3;
  v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_2B784((uint64_t)v3, v4);
  }

  return 1;
}

void sub_963C(id a1, NTKCPhotoListCell *a2, unint64_t a3, BOOL *a4)
{
}

void sub_97BC(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [*(id *)(a1 + 32) collectionView];
  v4 = [v3 indexPathForCell:*(void *)(a1 + 40)];
  id v5 = [v4 item];
  id v6 = *(id *)(a1 + 48);

  if (v5 == v6)
  {
    [*(id *)(a1 + 40) setPhoto:v9];
    if (v9)
    {
      [v9 size];
      objc_msgSend(*(id *)(a1 + 40), "setCrop:", 0.0, 0.0, v7, v8);
    }
  }
}

void sub_A314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_A338(uint64_t a1)
{
  double v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 customUltraCubeControllerDidFinish:v3];
}

void sub_A3AC(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained face];
    [v5 setResourceDirectory:v8];

    uint64_t v6 = v4[1];
    double v7 = [v4 navigationItem];
    [v7 setLeftBarButtonItem:v6];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

id sub_A550(uint64_t a1, void *a2)
{
  return [a2 setSelected:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t sub_A620(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "addPhotosFromUIImagePicker:");
  [*(id *)(a1 + 32) _updateButtons];
  id v2 = [*(id *)(a1 + 32) collectionView];
  [v2 reloadData];

  return 0;
}

id sub_A918(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 96) = 1;
  return [*(id *)(a1 + 32) _deletePressed];
}

id sub_A934(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 32);
  id v5 = +[NSIndexPath indexPathForItem:a2 inSection:0];
  [v4 addObject:v5];

  uint64_t v6 = *(void **)(*(void *)(a1 + 40) + 104);

  return [v6 deletePhotoAtIndex:a2];
}

void sub_AFB4(id a1)
{
  uint64_t v1 = +[NTKFontLoader fontDescriptorForSectName:@"__NYNumerals" fromMachO:&dword_0];
  id v2 = (void *)qword_58E30;
  qword_58E30 = v1;

  qword_58E38 = +[NTKFontLoader fontDescriptorForSectName:@"__NYNumeralsO" fromMachO:&dword_0];

  _objc_release_x1();
}

void sub_B0AC(id a1)
{
  uint64_t v1 = +[NTKFontLoader fontDescriptorForSectName:@"__SFNumerals" fromMachO:&dword_0];
  id v2 = (void *)qword_58E48;
  qword_58E48 = v1;

  qword_58E50 = +[NTKFontLoader fontDescriptorForSectName:@"__SFNumeralsO" fromMachO:&dword_0];

  _objc_release_x1();
}

void sub_B1A4(id a1)
{
  v15[0] = UIFontFeatureTypeIdentifierKey;
  v15[1] = UIFontFeatureSelectorIdentifierKey;
  v16[0] = &off_4B728;
  v16[1] = &off_4B740;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  v12 = v1;
  UIFontDescriptorAttributeName v13 = UIFontDescriptorFeatureSettingsAttribute;
  id v2 = +[NSArray arrayWithObjects:&v12 count:1];
  uint64_t v14 = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];

  uint64_t v4 = +[NTKFontLoader fontDescriptorForSectName:@"__Tokyo" fromMachO:&dword_0];
  id v5 = (void *)qword_58E60;
  qword_58E60 = v4;

  uint64_t v6 = [(id)qword_58E60 fontDescriptorByAddingAttributes:v3];
  double v7 = (void *)qword_58E60;
  qword_58E60 = v6;

  uint64_t v8 = +[NTKFontLoader fontDescriptorForSectName:@"__TokyoO" fromMachO:&dword_0];
  id v9 = (void *)qword_58E68;
  qword_58E68 = v8;

  uint64_t v10 = [(id)qword_58E68 fontDescriptorByAddingAttributes:v3];
  uint64_t v11 = (void *)qword_58E68;
  qword_58E68 = v10;
}

uint64_t sub_F14C(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void sub_1275C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) selectedIndexPath];

  if (v2)
  {
    if ([*(id *)(a1 + 32) layoutDirection]) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 16;
    }
    id v5 = [*(id *)(a1 + 32) collectionView];
    uint64_t v4 = [*(id *)(a1 + 32) selectedIndexPath];
    [v5 scrollToItemAtIndexPath:v4 atScrollPosition:v3 animated:0];
  }
}

void sub_12D9C(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) dataSource];
    id v4 = [v3 infoForItemAtIndexPath:*(void *)(a1 + 40)];

    [v4 currentLevel];
    objc_msgSend(*(id *)(a1 + 48), "setValue:");
    objc_msgSend(*(id *)(a1 + 48), "setIsUserModifying:", objc_msgSend(v4, "enabled"));
  }
}

void sub_1303C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionView];
  [v2 scrollToItemAtIndexPath:*(void *)(a1 + 40) atScrollPosition:*(void *)(a1 + 48) animated:0];
}

id sub_13094(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsAnimatingScroll:0];
}

void sub_133D8(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  id v4 = a2;
  [v3 setFill];
  id v5 = (CGContext *)[v4 CGContext];

  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v8 = 0;
  uint64_t v9 = 0;

  CGContextFillEllipseInRect(v5, *(CGRect *)&v8);
}

void sub_15EB0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t _NTKUltraCubeFiller::_NTKUltraCubeFiller(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  *(_DWORD *)(a1 + 16) = a4;
  *(_DWORD *)(a1 + 20) = a5;
  *(_DWORD *)(a1 + 24) = a4 + 22;
  *(_DWORD *)(a1 + 28) = a5 + 22;
  *((unsigned char *)&__token.__r_.__value_.__s + 23) = 12;
  strcpy((char *)&__token, "/dev/urandom");
  std::random_device::random_device(&v108, &__token);
  if (SHIBYTE(__token.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__token.__r_.__value_.__l.__data_);
  }
  std::random_device::result_type v6 = std::random_device::operator()(&v108);
  *(_DWORD *)(a1 + 32) = v6;
  uint64_t v7 = 1;
  for (uint64_t i = 9; i != 632; ++i)
  {
    int v9 = 1812433253 * (v6 ^ (v6 >> 30));
    std::random_device::result_type v6 = v9 + v7;
    *(_DWORD *)(a1 + 4 * i) = i + v9 - 8;
    ++v7;
  }
  *(void *)(a1 + 2528) = 0;
  std::random_device::~random_device(&v108);
  uint64_t v10 = 0;
  *(_OWORD *)(a1 + 2696) = 0u;
  *(_OWORD *)(a1 + 2712) = 0u;
  v102 = (void **)(a1 + 2704);
  *(_OWORD *)(a1 + 2664) = 0u;
  *(_OWORD *)(a1 + 2680) = 0u;
  *(_OWORD *)(a1 + 2632) = 0u;
  *(_OWORD *)(a1 + 2648) = 0u;
  *(_OWORD *)(a1 + 2600) = 0u;
  *(_OWORD *)(a1 + 2616) = 0u;
  *(_OWORD *)(a1 + 2568) = 0u;
  *(_OWORD *)(a1 + 2584) = 0u;
  *(_OWORD *)(a1 + 2536) = 0u;
  *(_OWORD *)(a1 + 2552) = 0u;
  __asm { FMOV            V0.2D, #21.0 }
  float64x2_t v106 = _Q0;
  *(_DWORD *)(a1 + 2728) = 0;
  while (2)
  {
    uint64_t v16 = a1 + 24 * v10;
    v17 = (char **)(v16 + 2632);
    __int16 v18 = (char **)(v16 + 2648);
    uint64_t v19 = *(unsigned char **)(v16 + 2632);
    if (*(void *)(v16 + 2648) - (void)v19 <= 0x87uLL)
    {
      uint64_t v20 = v10;
      uint64_t v21 = a1 + 24 * v10;
      v22 = *(unsigned char **)(v21 + 2640);
      v23 = (char *)operator new(0x88uLL);
      v24 = &v23[(v22 - v19) & 0xFFFFFFFFFFFFFFFCLL];
      v25 = v24;
      if (v22 != v19)
      {
        v25 = &v23[(v22 - v19) & 0xFFFFFFFFFFFFFFFCLL];
        do
        {
          int v26 = *((_DWORD *)v22 - 1);
          v22 -= 4;
          *((_DWORD *)v25 - 1) = v26;
          v25 -= 4;
        }
        while (v22 != v19);
      }
      const char *v17 = v25;
      *(void *)(v21 + 2640) = v24;
      *__int16 v18 = v23 + 136;
      uint64_t v10 = v20;
      if (v19) {
        operator delete(v19);
      }
    }
    int v27 = 0;
    uint64_t v100 = v10 + 1;
    int v101 = v10;
    double v105 = (double)((int)v10 + 1);
    v28 = (char **)(a1 + 24 * v10 + 2640);
    v29 = *v28;
    do
    {
      __double2 v31 = __sincos_stret((double)v27 * 6.28318531 / 17.0);
      v30.f64[0] = v31.__cosval;
      v30.f64[1] = v31.__sinval;
      int32x2_t v32 = vmovn_s64(vcvtq_s64_f64(vmulq_n_f64(vmulq_f64(v30, v106), v105)));
      if (v29 < *v18)
      {
        *((_WORD *)v29 + 1) = v32.i16[2];
        *(_WORD *)v29 = v32.i16[0];
        v29 += 4;
        goto LABEL_15;
      }
      v33 = *v17;
      uint64_t v34 = (v29 - *v17) >> 2;
      unint64_t v35 = v34 + 1;
      if ((unint64_t)(v34 + 1) >> 62) {
        sub_18550();
      }
      uint64_t v36 = *v18 - v33;
      if (v36 >> 1 > v35) {
        unint64_t v35 = v36 >> 1;
      }
      if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v37 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v37 = v35;
      }
      if (v37)
      {
        if (v37 >> 62) {
          sub_18478();
        }
        int32x2_t v103 = v32;
        v38 = (char *)operator new(4 * v37);
        int32x2_t v32 = v103;
      }
      else
      {
        v38 = 0;
      }
      v39 = &v38[4 * v34];
      *((_WORD *)v39 + 1) = v32.i16[2];
      *(_WORD *)v39 = v32.i16[0];
      if (v29 == v33)
      {
        v42 = v29;
        const char *v17 = v39;
        v29 = v39 + 4;
        *v28 = v39 + 4;
        *__int16 v18 = &v38[4 * v37];
        if (!v42) {
          goto LABEL_15;
        }
LABEL_33:
        operator delete(v42);
        goto LABEL_15;
      }
      v40 = &v38[4 * v34];
      do
      {
        int v41 = *((_DWORD *)v29 - 1);
        v29 -= 4;
        *((_DWORD *)v40 - 1) = v41;
        v40 -= 4;
      }
      while (v29 != v33);
      v42 = *v17;
      const char *v17 = v40;
      v29 = v39 + 4;
      *v28 = v39 + 4;
      *__int16 v18 = &v38[4 * v37];
      if (v42) {
        goto LABEL_33;
      }
LABEL_15:
      *v28 = v29;
      ++v27;
    }
    while (v27 != 17);
    for (int j = 0; j != 17; ++j)
    {
      __double2 v46 = __sincos_stret((double)j * 6.28318531 / 17.0);
      v45.f64[0] = v46.__cosval;
      v45.f64[1] = v46.__sinval;
      int32x2_t v47 = vmovn_s64(vcvtq_s64_f64(vmulq_n_f64(vmulq_f64(v45, v106), (double)(2 * v101 + 5))));
      if (v29 < *v18)
      {
        *((_WORD *)v29 + 1) = v47.i16[2];
        *(_WORD *)v29 = v47.i16[0];
        v44 = v29 + 4;
        goto LABEL_36;
      }
      v48 = *v17;
      uint64_t v49 = (v29 - *v17) >> 2;
      unint64_t v50 = v49 + 1;
      if ((unint64_t)(v49 + 1) >> 62) {
        sub_18550();
      }
      uint64_t v51 = *v18 - v48;
      if (v51 >> 1 > v50) {
        unint64_t v50 = v51 >> 1;
      }
      if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v52 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v52 = v50;
      }
      if (v52)
      {
        if (v52 >> 62) {
          sub_18478();
        }
        int32x2_t v104 = v47;
        v53 = (char *)operator new(4 * v52);
        int32x2_t v47 = v104;
      }
      else
      {
        v53 = 0;
      }
      v54 = &v53[4 * v49];
      v55 = &v53[4 * v52];
      *((_WORD *)v54 + 1) = v47.i16[2];
      *(_WORD *)v54 = v47.i16[0];
      v44 = v54 + 4;
      if (v29 == v48)
      {
        const char *v17 = v54;
        *v28 = v44;
        *__int16 v18 = v55;
LABEL_53:
        operator delete(v29);
        goto LABEL_36;
      }
      do
      {
        int v56 = *((_DWORD *)v29 - 1);
        v29 -= 4;
        *((_DWORD *)v54 - 1) = v56;
        v54 -= 4;
      }
      while (v29 != v48);
      v29 = *v17;
      const char *v17 = v54;
      *v28 = v44;
      *__int16 v18 = v55;
      if (v29) {
        goto LABEL_53;
      }
LABEL_36:
      *v28 = v44;
      v29 = v44;
    }
    uint64_t v10 = v100;
    if (v100 != 3) {
      continue;
    }
    break;
  }
  v57 = *(unsigned char **)(a1 + 2704);
  if (*(void *)(a1 + 2720) - (void)v57 <= 0x1E3uLL)
  {
    v58 = *(unsigned char **)(a1 + 2712);
    v59 = (char *)operator new(0x1E4uLL);
    uint64_t v60 = v58 - v57;
    v61 = &v59[(v58 - v57) & 0xFFFFFFFFFFFFFFFCLL];
    v62 = v61;
    if (v58 != v57)
    {
      if ((unint64_t)(v60 - 4) < 0x2C)
      {
        v62 = &v59[(v58 - v57) & 0xFFFFFFFFFFFFFFFCLL];
        goto LABEL_62;
      }
      v62 = &v59[(v58 - v57) & 0xFFFFFFFFFFFFFFFCLL];
      if ((unint64_t)(v58 - &v59[v60 & 0xFFFFFFFFFFFFFFFCLL]) < 0x20) {
        goto LABEL_110;
      }
      uint64_t v63 = v60 >> 2;
      unint64_t v64 = ((unint64_t)(v60 - 4) >> 2) + 1;
      uint64_t v65 = 4 * (v64 & 0x7FFFFFFFFFFFFFF8);
      v66 = &v58[-v65];
      v62 = &v61[-v65];
      v67 = &v59[4 * v63 - 16];
      v68 = (long long *)(v58 - 16);
      uint64_t v69 = v64 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v70 = *v68;
        *((_OWORD *)v67 - 1) = *(v68 - 1);
        *(_OWORD *)v67 = v70;
        v67 -= 32;
        v68 -= 2;
        v69 -= 8;
      }
      while (v69);
      v58 = v66;
      if (v64 != (v64 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_110:
        do
        {
LABEL_62:
          int v71 = *((_DWORD *)v58 - 1);
          v58 -= 4;
          *((_DWORD *)v62 - 1) = v71;
          v62 -= 4;
        }
        while (v58 != v57);
      }
    }
    *(void *)(a1 + 2704) = v62;
    *(void *)(a1 + 2712) = v61;
    *(void *)(a1 + 2720) = v59 + 484;
    if (v57) {
      operator delete(v57);
    }
  }
  int v72 = 0;
  v73 = *(float **)(a1 + 2712);
  while (2)
  {
    int v74 = 0;
    int v107 = v72;
    float v75 = fabsf((float)(v72 - 5));
    float v76 = (float)(v75 * 0.17273) * (float)(v75 * 0.17273);
    while (2)
    {
      while (1)
      {
        float v77 = fabsf((float)(v74 - 5));
        float v78 = sqrtf(v76 + (float)((float)(v77 * 0.17273) * (float)(v77 * 0.17273)));
        float v79 = v78 <= 1.0 ? 1.0 - v78 : 0.0;
        unint64_t v80 = *(void *)(a1 + 2720);
        if ((unint64_t)v73 >= v80) {
          break;
        }
        *v73++ = v79;
        *(void *)(a1 + 2712) = v73;
        if (++v74 == 11) {
          goto LABEL_66;
        }
      }
      v81 = (float *)*v102;
      uint64_t v82 = (char *)v73 - (unsigned char *)*v102;
      uint64_t v83 = v82 >> 2;
      unint64_t v84 = (v82 >> 2) + 1;
      if (v84 >> 62) {
        sub_18550();
      }
      uint64_t v85 = v80 - (void)v81;
      if (v85 >> 1 > v84) {
        unint64_t v84 = v85 >> 1;
      }
      if ((unint64_t)v85 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v86 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v86 = v84;
      }
      if (!v86)
      {
        v87 = 0;
        v88 = (float *)(4 * v83);
        *(float *)(4 * v83) = v79;
        uint64_t v89 = 4 * v83 + 4;
        if (v73 == v81) {
          goto LABEL_87;
        }
LABEL_84:
        unint64_t v90 = (char *)(v73 - 1) - (char *)v81;
        if (v90 >= 0xBC)
        {
          if (&v87[v82 - 4 - (v90 & 0xFFFFFFFFFFFFFFFCLL)] > &v87[v82 - 4])
          {
            v91 = v73;
          }
          else if ((float *)((char *)v73 - (v90 & 0xFFFFFFFFFFFFFFFCLL) - 4) > v73 - 1)
          {
            v91 = v73;
          }
          else if ((unint64_t)((char *)v73 - v87 - v82) >= 0x20)
          {
            uint64_t v93 = (v90 >> 2) + 1;
            uint64_t v94 = 4 * (v93 & 0x7FFFFFFFFFFFFFF8);
            v91 = &v73[v94 / 0xFFFFFFFFFFFFFFFCLL];
            v88 = (float *)((char *)v88 - v94);
            v95 = &v87[4 * v83 - 16];
            v96 = v73 - 4;
            uint64_t v97 = v93 & 0x7FFFFFFFFFFFFFF8;
            do
            {
              long long v98 = *(_OWORD *)v96;
              *(v95 - 1) = *((_OWORD *)v96 - 1);
              _OWORD *v95 = v98;
              v95 -= 2;
              v96 -= 8;
              v97 -= 8;
            }
            while (v97);
            if (v93 == (v93 & 0x7FFFFFFFFFFFFFF8)) {
              goto LABEL_87;
            }
          }
          else
          {
            v91 = v73;
          }
        }
        else
        {
          v91 = v73;
        }
        do
        {
          int v92 = *((_DWORD *)v91-- - 1);
          *((_DWORD *)v88-- - 1) = v92;
        }
        while (v91 != v81);
        goto LABEL_87;
      }
      if (v86 >> 62) {
        sub_18478();
      }
      v87 = operator new(4 * v86);
      v88 = (float *)&v87[4 * v83];
      float *v88 = v79;
      uint64_t v89 = (uint64_t)(v88 + 1);
      if (v73 != v81) {
        goto LABEL_84;
      }
LABEL_87:
      *(void *)(a1 + 2704) = v88;
      *(void *)(a1 + 2712) = v89;
      *(void *)(a1 + 2720) = &v87[4 * v86];
      if (v81) {
        operator delete(v81);
      }
      v73 = (float *)v89;
      *(void *)(a1 + 2712) = v89;
      if (++v74 != 11) {
        continue;
      }
      break;
    }
LABEL_66:
    int v72 = v107 + 1;
    if (v107 != 10) {
      continue;
    }
    return a1;
  }
}

void sub_16668(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void **a9, uint64_t a10, uint64_t a11, void **a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, std::random_device a20,std::random_device a21,uint64_t a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  v29 = *a12;
  if (*a12)
  {
    v27[339] = v29;
    operator delete(v29);
    float64x2_t v30 = (void *)v27[335];
    if (!v30)
    {
LABEL_3:
      __double2 v31 = (void *)v27[332];
      if (!v31) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    float64x2_t v30 = (void *)v27[335];
    if (!v30) {
      goto LABEL_3;
    }
  }
  v27[336] = v30;
  operator delete(v30);
  __double2 v31 = (void *)v27[332];
  if (!v31)
  {
LABEL_4:
    int32x2_t v32 = (void *)v27[329];
    if (!v32) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v27[333] = v31;
  operator delete(v31);
  int32x2_t v32 = (void *)v27[329];
  if (!v32)
  {
LABEL_5:
    v33 = (void *)v27[326];
    if (!v33) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  v27[330] = v32;
  operator delete(v32);
  v33 = (void *)v27[326];
  if (!v33)
  {
LABEL_6:
    uint64_t v34 = (void *)v27[323];
    if (!v34) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  v27[327] = v33;
  operator delete(v33);
  uint64_t v34 = (void *)v27[323];
  if (!v34)
  {
LABEL_7:
    unint64_t v35 = (void *)v27[320];
    if (!v35) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  v27[324] = v34;
  operator delete(v34);
  unint64_t v35 = (void *)v27[320];
  if (!v35)
  {
LABEL_8:
    uint64_t v36 = *a9;
    if (!*a9) {
LABEL_18:
    }
      _Unwind_Resume(exception_object);
LABEL_17:
    v27[318] = v36;
    operator delete(v36);
    goto LABEL_18;
  }
LABEL_16:
  v27[321] = v35;
  operator delete(v35);
  uint64_t v36 = *a9;
  if (!*a9) {
    goto LABEL_18;
  }
  goto LABEL_17;
}

BOOL _NTKUltraCubeFiller::isLocationOpen(uint64_t a1, int a2)
{
  uint64_t v2 = *(int *)(a1 + 24);
  uint64_t v3 = (unsigned char *)(*(void *)(a1 + 2560) + (int)v2 * (a2 >> 16) + (__int16)a2);
  if (*v3) {
    return 0;
  }
  int v5 = v3[-v2] == 1;
  if (v3[-v2] == 1) {
    int v6 = 2;
  }
  else {
    int v6 = 1;
  }
  if (v3[~v2] == 1) {
    int v5 = v6;
  }
  if (v3[1 - (int)v2] == 1) {
    ++v5;
  }
  if (v3[v2] == 1) {
    ++v5;
  }
  uint64_t v7 = &v3[v2];
  if (*(v7 - 1) == 1) {
    ++v5;
  }
  if (v7[1] == 1) {
    unsigned int v8 = v5 + 1;
  }
  else {
    unsigned int v8 = v5;
  }
  if (*(v3 - 1) == 1) {
    ++v8;
  }
  if (v3[1] == 1) {
    unsigned int v9 = v8 + 1;
  }
  else {
    unsigned int v9 = v8;
  }
  return v9 > 2;
}

void _NTKUltraCubeFiller::setup(_NTKUltraCubeFiller *this)
{
  uint64_t v2 = *((unsigned int *)this + 4);
  int v79 = *((_DWORD *)this + 5);
  int v3 = *((_DWORD *)this + 6);
  size_t v4 = *((int *)this + 7) * (uint64_t)v3;
  int v5 = (char *)*((void *)this + 321);
  int v6 = (char *)*((void *)this + 320);
  unint64_t v7 = v5 - v6;
  if (v4 <= v5 - v6)
  {
    if (v4 < v5 - v6) {
      *((void *)this + 321) = &v6[v4];
    }
  }
  else
  {
    uint64_t v8 = *((void *)this + 322);
    if (v8 - (uint64_t)v5 >= v4 - (v5 - v6))
    {
      bzero(*((void **)this + 321), v4 - (v5 - v6));
      *((void *)this + 321) = &v6[v4];
      goto LABEL_33;
    }
    int v82 = *((_DWORD *)this + 6);
    if ((v4 & 0x80000000) != 0) {
      sub_18550();
    }
    unint64_t v9 = v8 - (void)v6;
    uint64_t v10 = 2 * v9;
    if (2 * v9 <= v4) {
      uint64_t v10 = *((int *)this + 7) * (uint64_t)v3;
    }
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v11 = v10;
    }
    v12 = operator new(v11);
    UIFontDescriptorAttributeName v13 = (char *)v12 + v11;
    unint64_t v80 = (char *)v12 + v4;
    bzero((char *)v12 + v7, v4 - (v5 - v6));
    if (v5 != v6)
    {
      if (v7 < 8)
      {
        uint64_t v14 = (char *)v12 + v7;
        int v3 = v82;
        goto LABEL_29;
      }
      uint64_t v14 = (char *)v12 + v7;
      int v3 = v82;
      if ((unint64_t)(v6 - (unsigned char *)v12) >= 0x20)
      {
        if (v7 < 0x20)
        {
          unint64_t v15 = 0;
          goto LABEL_24;
        }
        unint64_t v15 = v7 & 0xFFFFFFFFFFFFFFE0;
        uint64_t v16 = v5 - 16;
        v17 = (char *)v12 + v5 - 16 - v6;
        unint64_t v18 = v7 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v19 = *(_OWORD *)v16;
          *((_OWORD *)v17 - 1) = *((_OWORD *)v16 - 1);
          *(_OWORD *)v17 = v19;
          v17 -= 32;
          v16 -= 32;
          v18 -= 32;
        }
        while (v18);
        if (v7 == v15) {
          goto LABEL_31;
        }
        if ((v7 & 0x18) != 0)
        {
LABEL_24:
          v14 -= v7 & 0xFFFFFFFFFFFFFFF8;
          uint64_t v20 = &v5[-v15 - 8];
          uint64_t v21 = (char *)(v20 - v6);
          unint64_t v22 = v15 - (v7 & 0xFFFFFFFFFFFFFFF8);
          do
          {
            uint64_t v23 = *(void *)v20;
            v20 -= 8;
            *(void *)&v21[(void)v12] = v23;
            v21 -= 8;
            v22 += 8;
          }
          while (v22);
          v5 -= v7 & 0xFFFFFFFFFFFFFFF8;
          if (v7 != (v7 & 0xFFFFFFFFFFFFFFF8)) {
            goto LABEL_29;
          }
LABEL_31:
          int v5 = v6;
          *((void *)this + 320) = v12;
          *((void *)this + 321) = v80;
          *((void *)this + 322) = v13;
          if (!v6) {
            goto LABEL_33;
          }
          goto LABEL_32;
        }
        v14 -= v15;
        v5 -= v15;
      }
LABEL_29:
      v24 = v14 - 1;
      do
      {
        char v25 = *--v5;
        *v24-- = v25;
      }
      while (v5 != v6);
      goto LABEL_31;
    }
    int v3 = v82;
    *((void *)this + 320) = (char *)v12 + v7;
    *((void *)this + 321) = v80;
    *((void *)this + 322) = v13;
    if (v5) {
LABEL_32:
    }
      operator delete(v5);
  }
LABEL_33:
  uint64_t v26 = *((void *)this + 323);
  unint64_t v27 = (*((void *)this + 324) - v26) >> 4;
  if (v4 <= v27)
  {
    if (v4 < v27) {
      *((void *)this + 324) = v26 + 16 * v4;
    }
  }
  else
  {
    sub_18568((char **)this + 323, v4 - v27);
  }
  v28 = (char *)*((void *)this + 326);
  unint64_t v29 = (uint64_t)(*((void *)this + 327) - (void)v28) >> 4;
  if (v4 <= v29)
  {
    if (v4 < v29) {
      *((void *)this + 327) = &v28[16 * v4];
    }
  }
  else
  {
    sub_18568((char **)this + 326, v4 - v29);
    v28 = (char *)*((void *)this + 326);
  }
  float64x2_t v30 = (char *)*((void *)this + 323);
  uint64_t v31 = *(void *)this;
  uint64_t v32 = *((void *)this + 1);
  v33 = (char *)*((void *)this + 320);
  bzero(v33, v4);
  bzero(v28, 16 * (int)v4);
  bzero(v30, 16 * (int)v4);
  if (v79 >= 1 && (int)v2 >= 1)
  {
    int v35 = 0;
    uint64_t v36 = 11 * v3 + 11;
    unint64_t v37 = &v33[v36];
    uint64_t v38 = 16 * v36;
    v39 = &v30[16 * v36];
    v40 = &v28[v38];
    __asm
    {
      FMOV            V0.4S, #-1.0
      FMOV            V1.4S, #3.0
    }
    do
    {
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v48 = -352;
      do
      {
        if (*(unsigned __int8 *)(v32 + v47) <= 5u)
        {
          v37[v47] = 1;
          float32x4_t v49 = vminnmq_f32(vmaxnmq_f32(vcvtq_f32_f16(*(float16x4_t *)(v31 + 8 * v47)), _Q0), _Q1);
          uint64_t v50 = 16 * v47;
          v49.i32[3] = 1.0;
          *(float32x4_t *)&v39[v50] = v49;
          *(float32x4_t *)&v40[v50] = v49;
        }
        ++v47;
        v46 -= 8;
        v48 -= 16;
      }
      while (v2 != v47);
      v32 += v2;
      v37 += v47 + 22;
      v39 -= v48;
      v40 -= v48;
      ++v35;
      v31 -= v46;
    }
    while (v35 != v79);
  }
  uint64_t v83 = (void *)((char *)this + 2536);
  uint64_t v51 = (unsigned char *)*((void *)this + 317);
  if (v4 > (uint64_t)(*((void *)this + 319) - (void)v51) >> 2)
  {
    if ((v4 & 0x80000000) != 0) {
LABEL_102:
    }
      sub_18550();
    unint64_t v52 = (unsigned char *)*((void *)this + 318);
    size_t v53 = 4 * v4;
    v54 = (char *)operator new(v53);
    v55 = &v54[(v52 - v51) & 0xFFFFFFFFFFFFFFFCLL];
    int v56 = v55;
    if (v52 != v51)
    {
      int v56 = &v54[(v52 - v51) & 0xFFFFFFFFFFFFFFFCLL];
      do
      {
        int v57 = *((_DWORD *)v52 - 1);
        v52 -= 4;
        *((_DWORD *)v56 - 1) = v57;
        v56 -= 4;
      }
      while (v52 != v51);
    }
    *((void *)this + 317) = v56;
    *((void *)this + 318) = v55;
    *((void *)this + 319) = &v54[v53];
    if (v51) {
      operator delete(v51);
    }
  }
  if (v79 >= 1 && (int)v2 >= 1)
  {
    for (int i = 0; i != v79; ++i)
    {
      int v59 = 0;
      __int16 v60 = i + 11;
      do
      {
        uint64_t v62 = *((int *)this + 6);
        uint64_t v63 = (unsigned char *)(*((void *)this + 320) + (__int16)(v59 + 11) + (int)v62 * v60);
        if (!*v63)
        {
          int v64 = v63[-v62] == 1;
          if (v63[-v62] == 1) {
            int v65 = 2;
          }
          else {
            int v65 = 1;
          }
          if (v63[~v62] == 1) {
            int v64 = v65;
          }
          if (v63[1 - (int)v62] == 1) {
            ++v64;
          }
          if (v63[v62] == 1) {
            ++v64;
          }
          if (v63[v62 - 1] == 1) {
            ++v64;
          }
          if (v63[v62 + 1] == 1) {
            int v66 = v64 + 1;
          }
          else {
            int v66 = v64;
          }
          if (*(v63 - 1) == 1) {
            ++v66;
          }
          unsigned int v67 = v63[1] == 1 ? v66 + 1 : v66;
          if (v67 >= 3)
          {
            _Q0.i32[0] = v59 + 11;
            _Q0.i32[1] = i + 11;
            v68 = (_WORD *)*((void *)this + 318);
            unint64_t v69 = *((void *)this + 319);
            if ((unint64_t)v68 < v69)
            {
              v68[1] = v60;
              _WORD *v68 = _Q0.i16[0];
              v61 = v68 + 2;
            }
            else
            {
              long long v70 = (_WORD *)*v83;
              uint64_t v71 = ((uint64_t)v68 - *v83) >> 2;
              unint64_t v72 = v71 + 1;
              if ((unint64_t)(v71 + 1) >> 62) {
                goto LABEL_102;
              }
              uint64_t v73 = v69 - (void)v70;
              if (v73 >> 1 > v72) {
                unint64_t v72 = v73 >> 1;
              }
              if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v74 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v74 = v72;
              }
              if (v74)
              {
                float32x4_t v81 = _Q0;
                if (v74 >> 62) {
                  sub_18478();
                }
                float v75 = (char *)operator new(4 * v74);
                _Q0 = v81;
              }
              else
              {
                float v75 = 0;
              }
              float v76 = &v75[4 * v71];
              *((_WORD *)v76 + 1) = _Q0.i16[2];
              *(_WORD *)float v76 = _Q0.i16[0];
              float v77 = v76;
              if (v68 != v70)
              {
                do
                {
                  int v78 = *((_DWORD *)v68 - 1);
                  v68 -= 2;
                  *((_DWORD *)v77 - 1) = v78;
                  v77 -= 4;
                }
                while (v68 != v70);
                v68 = (_WORD *)*v83;
              }
              *((void *)this + 317) = v77;
              v61 = v76 + 4;
              *((void *)this + 318) = v76 + 4;
              *((void *)this + 319) = &v75[4 * v74];
              if (v68) {
                operator delete(v68);
              }
            }
            *((void *)this + 318) = v61;
          }
        }
        ++v59;
      }
      while (v59 != v2);
    }
  }
}

float _NTKUltraCubeFiller::consider(uint64_t a1, __int32 a2, __int32 a3, uint32x4_t a4, uint16x4_t a5)
{
  *(int32x2_t *)a4.i8 = vdup_n_s32(0xFFFBu);
  a5.i32[0] = a3;
  uint32x4_t v5 = vaddw_u16(a4, a5);
  __int16 v6 = v5.i16[0];
  float result = -1.0;
  if (v5.i16[0] >= 22)
  {
    int v8 = v5.i16[2];
    if (v5.i16[2] >= 22)
    {
      uint64_t v9 = *(int *)(a1 + 24);
      v5.i64[0] = 0x600000006;
      uint32x4_t v10 = vaddw_u16(v5, a5);
      if ((int)v9 - 22 > v10.i16[0] && *(_DWORD *)(a1 + 28) - 22 > v10.i16[2])
      {
        uint64_t v11 = 0;
        int v12 = 0;
        v10.i32[0] = a2;
        unsigned int v13 = v6;
        *(int32x2_t *)v10.i8 = vadd_s32((int32x2_t)*(_OWORD *)&vmovl_u16(*(uint16x4_t *)v10.i8), vdup_n_s32(0xFFFBu));
        uint64_t v14 = *(void *)(a1 + 2560);
        uint64_t v15 = (int)v9 * v8;
        int v16 = v9 * v10.i16[2];
        uint64_t v17 = 16 * v15 + 16 * v13;
        uint64_t v18 = v15 + v13;
        uint64_t v19 = *(void *)(a1 + 2704);
        uint64_t v20 = ((uint64_t)((unint64_t)v10.u32[0] << 48) >> 44) + 16 * v16;
        uint64_t v21 = *(void *)(a1 + 2584) + 160;
        uint64_t v22 = v18 + 10;
        uint64_t v23 = v10.i16[0] + (uint64_t)v16 + 5;
        v10.i32[0] = 0;
        do
        {
          v24 = (float *)(v19 + v11);
          uint64_t v25 = v21 + v17;
          uint64_t v26 = v21 + v20;
          uint64_t v27 = v14 + v23;
          if (*(float *)(v19 + v11) > 0.0)
          {
            if (!*(unsigned char *)(v14 + v22 - 10)) {
              return result;
            }
            if (*(unsigned char *)(v27 - 5))
            {
              float32x4_t v28 = vsubq_f32(*(float32x4_t *)(v25 - 160), *(float32x4_t *)(v26 - 160));
              float32x4_t v29 = vmulq_f32(v28, v28);
              ++v12;
              *(float *)v10.i32 = *(float *)v10.i32
                                + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v29, 2), vaddq_f32(v29, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v29.f32, 1))).f32[0];
            }
          }
          if (v24[1] > 0.0)
          {
            if (!*(unsigned char *)(v14 + v22 - 9)) {
              return result;
            }
            if (*(unsigned char *)(v27 - 4))
            {
              float32x4_t v30 = vsubq_f32(*(float32x4_t *)(v25 - 144), *(float32x4_t *)(v26 - 144));
              float32x4_t v31 = vmulq_f32(v30, v30);
              ++v12;
              *(float *)v10.i32 = *(float *)v10.i32
                                + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v31, 2), vaddq_f32(v31, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v31.f32, 1))).f32[0];
            }
          }
          uint64_t v32 = v21 + v17;
          uint64_t v33 = v21 + v20;
          uint64_t v34 = v14 + v23;
          if (v24[2] > 0.0)
          {
            if (!*(unsigned char *)(v14 + v22 - 8)) {
              return result;
            }
            if (*(unsigned char *)(v34 - 3))
            {
              float32x4_t v35 = vsubq_f32(*(float32x4_t *)(v32 - 128), *(float32x4_t *)(v33 - 128));
              float32x4_t v36 = vmulq_f32(v35, v35);
              ++v12;
              *(float *)v10.i32 = *(float *)v10.i32
                                + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v36, 2), vaddq_f32(v36, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 1))).f32[0];
            }
          }
          if (v24[3] > 0.0)
          {
            if (!*(unsigned char *)(v14 + v22 - 7)) {
              return result;
            }
            if (*(unsigned char *)(v34 - 2))
            {
              float32x4_t v37 = vsubq_f32(*(float32x4_t *)(v32 - 112), *(float32x4_t *)(v33 - 112));
              float32x4_t v38 = vmulq_f32(v37, v37);
              ++v12;
              *(float *)v10.i32 = *(float *)v10.i32
                                + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v38, 2), vaddq_f32(v38, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 1))).f32[0];
            }
          }
          uint64_t v39 = v21 + v17;
          uint64_t v40 = v21 + v20;
          if (v24[4] > 0.0)
          {
            if (!*(unsigned char *)(v14 + v22 - 6)) {
              return result;
            }
            if (*(unsigned char *)(v14 + v23 - 1))
            {
              float32x4_t v41 = vsubq_f32(*(float32x4_t *)(v39 - 96), *(float32x4_t *)(v40 - 96));
              float32x4_t v42 = vmulq_f32(v41, v41);
              ++v12;
              *(float *)v10.i32 = *(float *)v10.i32
                                + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v42, 2), vaddq_f32(v42, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v42.f32, 1))).f32[0];
            }
          }
          if (v24[5] > 0.0)
          {
            if (!*(unsigned char *)(v14 + v22 - 5)) {
              return result;
            }
            if (*(unsigned char *)(v14 + v23))
            {
              float32x4_t v43 = vsubq_f32(*(float32x4_t *)(v39 - 80), *(float32x4_t *)(v40 - 80));
              float32x4_t v44 = vmulq_f32(v43, v43);
              ++v12;
              *(float *)v10.i32 = *(float *)v10.i32
                                + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v44, 2), vaddq_f32(v44, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v44.f32, 1))).f32[0];
            }
          }
          uint64_t v45 = v21 + v17;
          uint64_t v46 = v21 + v20;
          uint64_t v47 = v14 + v23;
          if (v24[6] > 0.0)
          {
            if (!*(unsigned char *)(v14 + v22 - 4)) {
              return result;
            }
            if (*(unsigned char *)(v47 + 1))
            {
              float32x4_t v48 = vsubq_f32(*(float32x4_t *)(v45 - 64), *(float32x4_t *)(v46 - 64));
              float32x4_t v49 = vmulq_f32(v48, v48);
              ++v12;
              *(float *)v10.i32 = *(float *)v10.i32
                                + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v49, 2), vaddq_f32(v49, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v49.f32, 1))).f32[0];
            }
          }
          if (v24[7] > 0.0)
          {
            if (!*(unsigned char *)(v14 + v22 - 3)) {
              return result;
            }
            if (*(unsigned char *)(v47 + 2))
            {
              float32x4_t v50 = vsubq_f32(*(float32x4_t *)(v45 - 48), *(float32x4_t *)(v46 - 48));
              float32x4_t v51 = vmulq_f32(v50, v50);
              ++v12;
              *(float *)v10.i32 = *(float *)v10.i32
                                + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v51, 2), vaddq_f32(v51, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v51.f32, 1))).f32[0];
            }
          }
          uint64_t v52 = v21 + v17;
          uint64_t v53 = v21 + v20;
          uint64_t v54 = v14 + v23;
          if (v24[8] > 0.0)
          {
            if (!*(unsigned char *)(v14 + v22 - 2)) {
              return result;
            }
            if (*(unsigned char *)(v54 + 3))
            {
              float32x4_t v55 = vsubq_f32(*(float32x4_t *)(v52 - 32), *(float32x4_t *)(v53 - 32));
              float32x4_t v56 = vmulq_f32(v55, v55);
              ++v12;
              *(float *)v10.i32 = *(float *)v10.i32
                                + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v56, 2), vaddq_f32(v56, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v56.f32, 1))).f32[0];
            }
          }
          if (v24[9] > 0.0)
          {
            if (!*(unsigned char *)(v14 + v22 - 1)) {
              return result;
            }
            if (*(unsigned char *)(v54 + 4))
            {
              float32x4_t v57 = vsubq_f32(*(float32x4_t *)(v52 - 16), *(float32x4_t *)(v53 - 16));
              float32x4_t v58 = vmulq_f32(v57, v57);
              ++v12;
              *(float *)v10.i32 = *(float *)v10.i32
                                + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v58, 2), vaddq_f32(v58, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v58.f32, 1))).f32[0];
            }
          }
          if (v24[10] > 0.0)
          {
            if (!*(unsigned char *)(v14 + v22)) {
              return result;
            }
            if (*(unsigned char *)(v14 + v23 + 5))
            {
              float32x4_t v59 = vsubq_f32(*(float32x4_t *)(v21 + v17), *(float32x4_t *)(v21 + v20));
              float32x4_t v60 = vmulq_f32(v59, v59);
              ++v12;
              *(float *)v10.i32 = *(float *)v10.i32
                                + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v60, 2), vaddq_f32(v60, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v60.f32, 1))).f32[0];
            }
          }
          v11 += 44;
          v21 += 16 * v9;
          v14 += v9;
        }
        while (v11 != 484);
        return *(float *)v10.i32 / (float)v12;
      }
    }
  }
  return result;
}

BOOL _NTKUltraCubeFiller::considerR1(uint64_t a1, int a2, int a3)
{
  if (a3 << 16 < 720896) {
    return 0;
  }
  BOOL result = 0;
  if (a3 >= 720896)
  {
    int v5 = *(_DWORD *)(a1 + 24);
    int v6 = a3 >> 16;
    if ((__int16)a3 < v5 - 11 && v6 < *(_DWORD *)(a1 + 28) - 11)
    {
      uint64_t v8 = *(void *)(a1 + 2560);
      if (*(unsigned char *)(v8 + v5 * v6 + (__int16)a3)) {
        return *(unsigned char *)(v8 + v5 * (a2 >> 16) + (__int16)a2) == 0;
      }
      return 0;
    }
  }
  return result;
}

void _NTKUltraCubeFiller::patch(uint64_t a1, __int32 a2, __int32 a3, double a4, uint16x4_t a5, uint16x4_t a6, uint32x4_t a7)
{
  int v8 = 0;
  a5.i32[0] = a2;
  uint32x4_t v9 = vmovl_u16(a5);
  a6.i32[0] = a3;
  *(int32x2_t *)a7.i8 = vdup_n_s32(0xFFFBu);
  int v10 = *(_DWORD *)(a1 + 28);
  uint64_t v11 = *(int *)(a1 + 24);
  int32x2_t v12 = (int32x2_t)vaddw_u16(a7, a6).u64[0];
  int32x2_t v13 = (int32x2_t)vaddw_u16(a7, a5).u64[0];
  uint64_t v14 = *(void *)(a1 + 2584);
  uint64_t v15 = *(void *)(a1 + 2560);
  __int16 v16 = v12.i16[0];
  int32x2_t v17 = vmul_s32(vdup_n_s32(v11), vshr_n_s32(vshl_n_s32(vzip2_s32(v12, v13), 0x10uLL), 0x10uLL));
  uint64_t v18 = v14 + 16 * v17.i32[0] + 16 * v16;
  uint64_t v19 = (uint64_t)((unint64_t)v13.u32[0] << 48) >> 44;
  uint64_t v20 = v14 + v19 + 16 * v17.i32[1];
  uint64_t v21 = *(void *)(a1 + 2608) + v19 + 16 * v17.i32[1];
  uint64_t v22 = *(float **)(a1 + 2704);
  uint64_t v23 = 16 * ((int)v11 - 11);
  do
  {
    uint64_t v24 = 0;
    do
    {
      if (*v22 > 0.0)
      {
        float32x4_t v25 = vmlaq_n_f32(*(float32x4_t *)(v21 + v24), *(float32x4_t *)(v18 + v24), *v22);
        float32x4_t v26 = vmulq_n_f32(v25, 1.0 / v25.f32[3]);
        v26.i32[3] = 1.0;
        *(float32x4_t *)(v21 + v24) = v25;
        *(float32x4_t *)(v20 + v24) = v26;
      }
      ++v22;
      v24 += 16;
    }
    while (v24 != 176);
    v18 += v23 + v24;
    v20 += v23 + v24;
    v21 += v23 + v24;
    ++v8;
  }
  while (v8 != 11);
  uint64_t v27 = v15 + (int)v11 * (v9.i16[2] - 1) + (__int16)a2;
  *(unsigned char *)(v27 + 1) = 1;
  *(_WORD *)(v27 - 1) = 257;
  uint64_t v28 = v27 + v11 - 3;
  *(_WORD *)(v28 + 2) = 257;
  v28 += 2;
  *(unsigned char *)(v28 + 2) = 1;
  uint64_t v29 = v28 + v11 - 3;
  *(unsigned char *)(v29 + 5) = 1;
  *(_WORD *)(v29 + 3) = 257;
  int32x2_t v30 = vadd_s32(*(int32x2_t *)v9.i8, vdup_n_s32(0xFFFEu));
  int8x8_t v31 = (int8x8_t)vadd_s32(*(int32x2_t *)v9.i8, (int32x2_t)0x200000002);
  int32x2_t v32 = vshr_n_s32(vshl_n_s32((int32x2_t)0x20000000BLL, 0x10uLL), 0x10uLL);
  v33.i32[1] = v30.i32[1];
  v33.i32[0] = 11;
  int32x2_t v34 = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v32, vshr_n_s32(vshl_n_s32(v30, 0x10uLL), 0x10uLL)), 0), v33, (int8x8_t)v30);
  int32x2_t v35 = vdup_lane_s32(vcgt_s32(v32, vshr_n_s32(vshl_n_s32(vdup_lane_s32(v34, 1), 0x10uLL), 0x10uLL)), 0);
  v32.i32[0] = v11 - 11;
  v33.i32[0] = v31.i16[0];
  int8x8_t v36 = (int8x8_t)vmovl_s16((int16x4_t)vcgt_s32(v32, (int32x2_t)v33)).u64[0];
  v33.i32[1] = v31.i32[1];
  v33.i32[0] = v11 - 12;
  int8x8_t v37 = vbsl_s8(v36, v31, v33);
  uint64_t v38 = v34.u32[0] | 0xB00000000;
  int8x8_t v39 = vbsl_s8((int8x8_t)v35, (int8x8_t)v38, (int8x8_t)v34);
  v35.i32[0] = v37.i16[2];
  LODWORD(v38) = v10 - 11;
  int8x8_t v40 = (int8x8_t)vmovl_s16((int16x4_t)vcgt_s32((int32x2_t)v38, v35)).u64[0];
  LODWORD(v38) = v37.i32[0];
  HIDWORD(v38) = v10 - 12;
  int8x8_t v41 = vbsl_s8(v40, v37, (int8x8_t)v38);
  unsigned int v42 = v39.i16[2];
  int v43 = v41.i16[2];
  int v44 = v41.i16[0];
  unsigned int v68 = v39.i16[0];
  if (v39.i16[2] <= v41.i16[2] && v39.i16[0] <= v41.i16[0])
  {
    uint64_t v46 = (void *)(a1 + 2536);
    if (v39.i16[2] > v41.i16[2]) {
      int v43 = v39.i16[2];
    }
    int v67 = v43;
    do
    {
      unsigned int v48 = v68;
      do
      {
        uint64_t v50 = *(int *)(a1 + 24);
        float32x4_t v51 = (unsigned char *)(*(void *)(a1 + 2560) + (int)v50 * (__int16)v42 + (__int16)v48);
        if (!*v51)
        {
          int v52 = v51[-v50] == 1;
          if (v51[-v50] == 1) {
            int v53 = 2;
          }
          else {
            int v53 = 1;
          }
          if (v51[~v50] == 1) {
            int v52 = v53;
          }
          if (v51[1 - (int)v50] == 1) {
            ++v52;
          }
          if (v51[v50] == 1) {
            ++v52;
          }
          if (v51[v50 - 1] == 1) {
            ++v52;
          }
          if (v51[v50 + 1] == 1) {
            unsigned int v54 = v52 + 1;
          }
          else {
            unsigned int v54 = v52;
          }
          if (*(v51 - 1) == 1) {
            ++v54;
          }
          if (v51[1] == 1) {
            unsigned int v55 = v54 + 1;
          }
          else {
            unsigned int v55 = v54;
          }
          if (v55 >= 3)
          {
            v9.i64[0] = __PAIR64__(v42, v48);
            float32x4_t v56 = *(_WORD **)(a1 + 2544);
            unint64_t v57 = *(void *)(a1 + 2552);
            if ((unint64_t)v56 < v57)
            {
              v56[1] = v42;
              *float32x4_t v56 = v48;
              float32x4_t v49 = v56 + 2;
            }
            else
            {
              float32x4_t v58 = (_WORD *)*v46;
              uint64_t v59 = ((uint64_t)v56 - *v46) >> 2;
              unint64_t v60 = v59 + 1;
              if ((unint64_t)(v59 + 1) >> 62) {
                sub_18550();
              }
              uint64_t v61 = v57 - (void)v58;
              if (v61 >> 1 > v60) {
                unint64_t v60 = v61 >> 1;
              }
              if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v62 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v62 = v60;
              }
              if (v62)
              {
                uint32x4_t v69 = v9;
                if (v62 >> 62) {
                  sub_18478();
                }
                uint64_t v63 = (char *)operator new(4 * v62);
                uint32x4_t v9 = v69;
              }
              else
              {
                uint64_t v63 = 0;
              }
              int v64 = &v63[4 * v59];
              *((_WORD *)v64 + 1) = v9.i16[2];
              *(_WORD *)int v64 = v9.i16[0];
              int v65 = v64;
              if (v56 != v58)
              {
                do
                {
                  int v66 = *((_DWORD *)v56 - 1);
                  v56 -= 2;
                  *((_DWORD *)v65 - 1) = v66;
                  v65 -= 4;
                }
                while (v56 != v58);
                float32x4_t v56 = (_WORD *)*v46;
              }
              *(void *)(a1 + 2536) = v65;
              float32x4_t v49 = v64 + 4;
              *(void *)(a1 + 2544) = v64 + 4;
              *(void *)(a1 + 2552) = &v63[4 * v62];
              if (v56) {
                operator delete(v56);
              }
            }
            *(void *)(a1 + 2544) = v49;
          }
        }
        BOOL v47 = v48++ == v44;
      }
      while (!v47);
      BOOL v47 = v42++ == v67;
    }
    while (!v47);
  }
  ++*(_DWORD *)(a1 + 2728);
}

void _NTKUltraCubeFiller::patchR1(uint64_t a1, __int32 a2, int a3, uint16x4_t a4, double a5, double a6, int32x2_t a7)
{
  a4.i32[0] = a2;
  int v9 = *(_DWORD *)(a1 + 24);
  int v8 = *(_DWORD *)(a1 + 28);
  uint64_t v10 = *(void *)(a1 + 2584);
  uint64_t v11 = *(void *)(a1 + 2560);
  int v12 = v9 * SHIWORD(a2);
  uint64_t v13 = 16 * v12;
  uint64_t v14 = 16 * (__int16)a2;
  uint64_t v15 = *(void *)(a1 + 2608) + v13;
  float32x4_t v16 = vaddq_f32(*(float32x4_t *)(v10 + 16 * v9 * (a3 >> 16) + 16 * (__int16)a3), *(float32x4_t *)(v15 + v14));
  float32x4_t v17 = vmulq_n_f32(v16, 1.0 / v16.f32[3]);
  v17.i32[3] = 1.0;
  *(float32x4_t *)(v15 + v14) = v16;
  *(float32x4_t *)(v10 + v13 + v14) = v17;
  *(unsigned char *)(v11 + v12 + (__int16)a2) = 1;
  v16.i64[0] = 0xFFFF0000FFFFLL;
  uint32x4_t v18 = vaddw_u16((uint32x4_t)v16, a4);
  a7.i32[0] = 11;
  int32x2_t v19 = vshr_n_s32(vshl_n_s32(a7, 0x10uLL), 0x10uLL);
  uint32x4_t v20 = v18;
  v20.i32[0] = 11;
  *(int8x8_t *)v18.i8 = vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v19, vshr_n_s32(vshl_n_s32(*(int32x2_t *)v18.i8, 0x10uLL), 0x10uLL)), 0), *(int8x8_t *)v20.i8, *(int8x8_t *)v18.i8);
  v20.i64[0] = 0x100000001;
  *(int32x2_t *)v17.f32 = vdup_lane_s32(vcgt_s32(v19, vshr_n_s32(vshl_n_s32(vdup_lane_s32(*(int32x2_t *)v18.i8, 1), 0x10uLL), 0x10uLL)), 0);
  uint32x4_t v24 = vaddw_u16(v20, a4);
  v19.i32[0] = v24.i16[0];
  v20.i32[0] = v9 - 11;
  int8x8_t v21 = (int8x8_t)vmovl_s16((int16x4_t)vcgt_s32(*(int32x2_t *)v20.i8, v19)).u64[0];
  v20.i32[1] = v24.i32[1];
  v20.i32[0] = v9 - 12;
  *(int8x8_t *)v24.i8 = vbsl_s8(v21, *(int8x8_t *)v24.i8, *(int8x8_t *)v20.i8);
  uint64_t v22 = v18.u32[0] | 0xB00000000;
  int8x8_t v23 = vbsl_s8(*(int8x8_t *)v17.f32, (int8x8_t)v22, *(int8x8_t *)v18.i8);
  v17.i32[0] = v24.i16[2];
  LODWORD(v22) = v8 - 11;
  v17.i64[0] = vmovl_s16((int16x4_t)vcgt_s32((int32x2_t)v22, *(int32x2_t *)v17.f32)).u64[0];
  LODWORD(v22) = v24.i32[0];
  HIDWORD(v22) = v8 - 12;
  *(int8x8_t *)v24.i8 = vbsl_s8(*(int8x8_t *)v17.f32, *(int8x8_t *)v24.i8, (int8x8_t)v22);
  unsigned int v25 = v23.i16[2];
  int v26 = v24.i16[2];
  int v27 = v24.i16[0];
  unsigned int v51 = v23.i16[0];
  if (v23.i16[2] <= v24.i16[2] && v23.i16[0] <= v24.i16[0])
  {
    uint64_t v29 = (void *)(a1 + 2536);
    if (v23.i16[2] > v24.i16[2]) {
      int v26 = v23.i16[2];
    }
    int v50 = v26;
    do
    {
      unsigned int v31 = v51;
      do
      {
        uint64_t v33 = *(int *)(a1 + 24);
        int32x2_t v34 = (unsigned char *)(*(void *)(a1 + 2560) + (int)v33 * (__int16)v25 + (__int16)v31);
        if (!*v34)
        {
          int v35 = v34[-v33] == 1;
          if (v34[-v33] == 1) {
            int v36 = 2;
          }
          else {
            int v36 = 1;
          }
          if (v34[~v33] == 1) {
            int v35 = v36;
          }
          if (v34[1 - (int)v33] == 1) {
            ++v35;
          }
          if (v34[v33] == 1) {
            ++v35;
          }
          if (v34[v33 - 1] == 1) {
            ++v35;
          }
          if (v34[v33 + 1] == 1) {
            unsigned int v37 = v35 + 1;
          }
          else {
            unsigned int v37 = v35;
          }
          if (*(v34 - 1) == 1) {
            ++v37;
          }
          if (v34[1] == 1) {
            unsigned int v38 = v37 + 1;
          }
          else {
            unsigned int v38 = v37;
          }
          if (v38 >= 3)
          {
            v24.i64[0] = __PAIR64__(v25, v31);
            int8x8_t v39 = *(_WORD **)(a1 + 2544);
            unint64_t v40 = *(void *)(a1 + 2552);
            if ((unint64_t)v39 < v40)
            {
              v39[1] = v25;
              _WORD *v39 = v31;
              int32x2_t v32 = v39 + 2;
            }
            else
            {
              int8x8_t v41 = (_WORD *)*v29;
              uint64_t v42 = ((uint64_t)v39 - *v29) >> 2;
              unint64_t v43 = v42 + 1;
              if ((unint64_t)(v42 + 1) >> 62) {
                sub_18550();
              }
              uint64_t v44 = v40 - (void)v41;
              if (v44 >> 1 > v43) {
                unint64_t v43 = v44 >> 1;
              }
              if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v45 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v45 = v43;
              }
              if (v45)
              {
                uint32x4_t v52 = v24;
                if (v45 >> 62) {
                  sub_18478();
                }
                uint64_t v46 = (char *)operator new(4 * v45);
                uint32x4_t v24 = v52;
              }
              else
              {
                uint64_t v46 = 0;
              }
              BOOL v47 = &v46[4 * v42];
              *((_WORD *)v47 + 1) = v24.i16[2];
              *(_WORD *)BOOL v47 = v24.i16[0];
              unsigned int v48 = v47;
              if (v39 != v41)
              {
                do
                {
                  int v49 = *((_DWORD *)v39 - 1);
                  v39 -= 2;
                  *((_DWORD *)v48 - 1) = v49;
                  v48 -= 4;
                }
                while (v39 != v41);
                int8x8_t v39 = (_WORD *)*v29;
              }
              *(void *)(a1 + 2536) = v48;
              int32x2_t v32 = v47 + 4;
              *(void *)(a1 + 2544) = v47 + 4;
              *(void *)(a1 + 2552) = &v46[4 * v45];
              if (v39) {
                operator delete(v39);
              }
            }
            *(void *)(a1 + 2544) = v32;
          }
        }
        BOOL v30 = v31++ == v27;
      }
      while (!v30);
      BOOL v30 = v25++ == v50;
    }
    while (!v30);
  }
  ++*(_DWORD *)(a1 + 2728);
}

uint64_t _NTKUltraCubeFiller::tryResolve(uint64_t a1, __int32 a2, uint32x4_t a3, double a4, uint16x4_t a5, double a6, __n128 a7)
{
  a3.i32[0] = a2;
  uint64_t v10 = a1 + 32;
  uint64_t v11 = *(void *)(a1 + 2528);
  unint64_t v12 = (v11 + 1) % 0x270uLL;
  uint64_t v13 = 4 * v11;
  LODWORD(v11) = *(_DWORD *)(a1 + 32 + 4 * ((v11 + 397) % 0x270uLL)) ^ ((*(_DWORD *)(a1 + 32 + 4 * v12) & 0x7FFFFFFE | *(_DWORD *)(a1 + 32 + 4 * v11) & 0x80000000) >> 1) ^ ((int)(*(_DWORD *)(a1 + 32 + 4 * v12) << 31) >> 31) & 0x9908B0DF;
  *(_DWORD *)(a1 + 32 + v13) = v11;
  uint32x4_t v14 = vmovl_u16(*(uint16x4_t *)a3.i8);
  *(void *)(a1 + 2528) = v12;
  LODWORD(v11) = ((v11 ^ (v11 >> 11)) << 7) & 0x9D2C5680 ^ v11 ^ (v11 >> 11);
  uint64_t v15 = a1
      + 24
      * (((v11 << 15) & 0xEFC60000 ^ v11 ^ (((v11 << 15) & 0xEFC60000 ^ v11) >> 18))
       % 3);
  float32x4_t v16 = *(unsigned __int16 **)(v15 + 2632);
  float32x4_t v17 = *(unsigned __int16 **)(v15 + 2640);
  a7.n128_u64[0] = 0xFFFF0000FFFFLL;
  v7.i32[0] = 1900671690;
  if (v16 != v17)
  {
    uint32x4_t v35 = v14;
    do
    {
      a3.i16[0] = *v16;
      a3.i16[2] = v16[1];
      *(int32x2_t *)a3.i8 = vadd_s32(*(int32x2_t *)a3.i8, *(int32x2_t *)v14.i8);
      int8x8_t v36 = *(int8x8_t *)a3.i8;
      __n128 v37 = a7;
      HIWORD(v41) = a3.i16[2];
      LOWORD(v41) = a3.i16[0];
      *(float *)a3.i32 = _NTKUltraCubeFiller::consider(a1, a2, v41, a3, *(uint16x4_t *)&a4);
      a5 = (uint16x4_t)v36;
      a7.n128_u64[1] = v37.n128_u64[1];
      uint32x4_t v14 = v35;
      BOOL v18 = *(float *)a3.i32 >= 0.0;
      BOOL v19 = *(float *)a3.i32 < v7.f32[0];
      BOOL v20 = !v18 || !v19;
      if (v18 && v19) {
        unsigned int v21 = -1;
      }
      else {
        unsigned int v21 = 0;
      }
      a4 = COERCE_DOUBLE(vdup_n_s32(v21));
      a7.n128_u64[0] = (unint64_t)vbsl_s8(*(int8x8_t *)&a4, v36, (int8x8_t)v37.n128_u64[0]);
      if (!v20) {
        v7.f32[0] = *(float *)a3.i32;
      }
      v16 += 2;
    }
    while (v16 != v17);
  }
  if ((a7.n128_u16[0] & 0x8000) == 0)
  {
    HIWORD(v40) = a7.n128_u16[2];
    LOWORD(v40) = a7.n128_u16[0];
    _NTKUltraCubeFiller::patch(a1, a2, v40, *(double *)a3.i64, *(uint16x4_t *)&a4, a5, v14);
    return 1;
  }
  for (uint64_t i = 0; i != 32; i += 4)
  {
    a3.i16[0] = *(_WORD *)((char *)&unk_44390 + i);
    a3.i16[2] = *(_WORD *)((char *)&unk_44390 + i + 2);
    *(int32x2_t *)a3.i8 = vadd_s32(*(int32x2_t *)a3.i8, *(int32x2_t *)v14.i8);
    HIWORD(v39) = a3.i16[2];
    LOWORD(v39) = a3.i16[0];
    if (v39 << 16 >= 720896)
    {
      int v23 = *(_DWORD *)(a1 + 24);
      int v24 = v39 >> 16;
      if (v39 >= 720896 && a3.i16[0] < v23 - 11 && v24 < *(_DWORD *)(a1 + 28) - 11)
      {
        uint64_t v27 = *(void *)(a1 + 2560);
        if (*(unsigned char *)(v27 + v24 * v23 + a3.i16[0]))
        {
          if (!*(unsigned char *)(v27 + v23 * (a2 >> 16) + (__int16)a2))
          {
            uint64_t v28 = 4 * v12;
            int v29 = *(_DWORD *)(v10 + 4 * v12);
            unint64_t v30 = v12 + 397;
            unint64_t v12 = (v12 + 1) % 0x270;
            unsigned int v31 = *(_DWORD *)(v10 + 4 * (v30 % 0x270)) ^ ((*(_DWORD *)(v10 + 4 * v12) & 0x7FFFFFFE | v29 & 0x80000000) >> 1) ^ ((int)(*(_DWORD *)(v10 + 4 * v12) << 31) >> 31) & 0x9908B0DF;
            *(_DWORD *)(v10 + v28) = v31;
            *(void *)(a1 + 2528) = v12;
            unsigned int v32 = ((v31 ^ (v31 >> 11)) << 7) & 0x9D2C5680 ^ v31 ^ (v31 >> 11);
            unsigned int v33 = ((v32 << 15) & 0xEFC60000 ^ v32 ^ (((v32 << 15) & 0xEFC60000 ^ v32) >> 18)) % 0x3E8;
            *(float *)&a4 = (float)v33;
            a5 = (uint16x4_t)vmovl_s16((int16x4_t)vcgt_f32(v7, *(float32x2_t *)&a4)).u64[0];
            a7.n128_u64[0] = (unint64_t)vbsl_s8((int8x8_t)a5, *(int8x8_t *)a3.i8, (int8x8_t)a7.n128_u64[0]);
            if (v7.f32[0] > (float)v33) {
              v7.f32[0] = (float)v33;
            }
          }
        }
      }
    }
  }
  if ((a7.n128_u16[0] & 0x8000) == 0)
  {
    HIWORD(v38) = a7.n128_u16[2];
    LOWORD(v38) = a7.n128_u16[0];
    _NTKUltraCubeFiller::patchR1(a1, a2, v38, *(uint16x4_t *)a3.i8, a4, *(double *)&a5, *(int32x2_t *)v14.i8);
    return 1;
  }
  return 0;
}

uint64_t _NTKUltraCubeFiller::resolve(uint64_t this, uint32x4_t a2, double a3, uint16x4_t a4, double a5, __n128 a6)
{
  int v6 = *(unsigned __int16 **)(this + 2544);
  float32x2_t v7 = *(unsigned __int16 **)(this + 2536);
  if (v6 != v7)
  {
    int v8 = (void *)this;
    int v9 = *(_DWORD *)(this + 24);
    uint64_t v10 = this + 32;
    uint64_t v11 = *(void *)(this + 2560);
    do
    {
      uint64_t v12 = v8[316];
      unint64_t v13 = (v12 + 1) % 0x270uLL;
      uint64_t v14 = 4 * v12;
      LODWORD(v12) = *(_DWORD *)(v10 + 4 * ((v12 + 397) % 0x270uLL)) ^ ((*(_DWORD *)(v10 + 4 * v13) & 0x7FFFFFFE | *(_DWORD *)(v10 + 4 * v12) & 0x80000000) >> 1) ^ ((int)(*(_DWORD *)(v10 + 4 * v13) << 31) >> 31) & 0x9908B0DF;
      *(_DWORD *)(v10 + v14) = v12;
      v8[316] = v13;
      LODWORD(v12) = ((v12 ^ (v12 >> 11)) << 7) & 0x9D2C5680 ^ v12 ^ (v12 >> 11);
      uint64_t v15 = &v7[2
              * (((v12 << 15) & 0xEFC60000 ^ v12 ^ (((v12 << 15) & 0xEFC60000 ^ v12) >> 18))
               % ((unint64_t)((char *)v6 - (char *)v7) >> 2))];
      a2.i16[0] = *v15;
      a2.i16[2] = v15[1];
      int64_t v16 = (char *)v6 - (char *)(v15 + 2);
      if (v6 != v15 + 2)
      {
        uint32x4_t v17 = a2;
        this = (uint64_t)memmove(v15, v15 + 2, (char *)v6 - (char *)(v15 + 2));
        a2 = v17;
      }
      int v6 = (unsigned __int16 *)((char *)v15 + v16);
      v8[318] = (char *)v15 + v16;
      if (*(unsigned char *)(v11 + v9 * a2.i16[2] + a2.i16[0]) != 1)
      {
        HIWORD(v18) = a2.i16[2];
        LOWORD(v18) = a2.i16[0];
        this = _NTKUltraCubeFiller::tryResolve((uint64_t)v8, v18, a2, a3, a4, a5, a6);
        int v6 = (unsigned __int16 *)v8[318];
      }
      float32x2_t v7 = (unsigned __int16 *)v8[317];
    }
    while (v6 != v7);
  }
  return this;
}

CGImageRef _NTKUltraCubeFiller::result(_NTKUltraCubeFiller *this)
{
  int v2 = *((_DWORD *)this + 4);
  size_t v3 = *((int *)this + 5);
  int v4 = *((_DWORD *)this + 6);
  id v5 = [objc_alloc((Class)NSMutableData) initWithLength:8 * v2 * (int)v3];
  uint64_t v6 = *((void *)this + 323);
  id v7 = v5;
  int v8 = (float16x4_t *)[v7 mutableBytes];
  if ((int)v3 >= 1 && v2 >= 1)
  {
    uint64_t v10 = v8;
    int v11 = 0;
    uint64_t v12 = v6 + 176 * v4 + 176;
    do
    {
      int v13 = v2;
      do
      {
        CLKUIConvertToXRSRGBfFromRGBf();
        *v10++ = vcvt_f16_f32(v14);
        v12 += 16;
        --v13;
      }
      while (v13);
      v12 += 352;
      ++v11;
    }
    while (v11 != v3);
  }
  uint64_t v15 = CGDataProviderCreateWithCFData((CFDataRef)v7);
  int64_t v16 = CGColorSpaceCreateWithName(kCGColorSpaceExtendedSRGB);
  CGImageRef v17 = CGImageCreate(v2, v3, 0x10uLL, 0x40uLL, 8 * v2, v16, 0x1101u, v15, 0, 0, kCGRenderingIntentDefault);
  CGDataProviderRelease(v15);
  CGColorSpaceRelease(v16);

  return v17;
}

void sub_180FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1810C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CGImageRef NTKUltraCubeCreateContentFillForRGBA16f(uint64_t a1, uint64_t a2, int a3, int a4)
{
  _NTKUltraCubeFiller::_NTKUltraCubeFiller((uint64_t)v11, a1, a2, a3, a4);
  _NTKUltraCubeFiller::setup((_NTKUltraCubeFiller *)v11);
  _NTKUltraCubeFiller::resolve((uint64_t)v11, v4, v5, v6, v7, v8);
  CGImageRef v9 = _NTKUltraCubeFiller::result((_NTKUltraCubeFiller *)v11);
  sub_184AC(v11);
  return v9;
}

void sub_18180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

CGImageRef NTKUltraCubeCreateContentFillForCGImage(CGImage *a1, CGImage *a2)
{
  CGImageRef v2 = 0;
  if (a1)
  {
    if (a2)
    {
      unsigned int Width = CGImageGetWidth(a1);
      int Height = CGImageGetHeight(a1);
      CGImageRef v2 = 0;
      if (Width - 8193 >= 0xFFFFE036)
      {
        int v7 = Height;
        if (Height >= 55 && Height <= 0x2000)
        {
          if (Width == CGImageGetWidth(a2) && v7 == CGImageGetHeight(a2))
          {
            __n128 v8 = malloc_type_malloc(8 * v7 * Width, 0x100004000313F17uLL);
            CGImageRef v9 = CGColorSpaceCreateWithName(kCGColorSpaceExtendedLinearSRGB);
            uint64_t v10 = CGBitmapContextCreate(v8, Width, v7, 0x10uLL, 8 * Width, v9, 0x1101u);
            CGColorSpaceRelease(v9);
            CGContextSetInterpolationQuality(v10, kCGInterpolationHigh);
            v21.origin.x = 0.0;
            v21.origin.y = 0.0;
            v21.size.width = (double)(int)Width;
            v21.size.height = (double)v7;
            CGContextDrawImage(v10, v21, a1);
            CGContextRelease(v10);
            int v11 = malloc_type_malloc(v7 * Width, 0x100004077774924uLL);
            uint64_t v12 = CGColorSpaceCreateWithName(kCGColorSpaceGenericGray);
            int v13 = CGBitmapContextCreate(v11, Width, v7, 8uLL, Width, v12, 0);
            CGColorSpaceRelease(v12);
            CGContextSetInterpolationQuality(v13, kCGInterpolationHigh);
            v22.origin.x = 0.0;
            v22.origin.y = 0.0;
            v22.size.width = (double)(int)Width;
            v22.size.height = (double)v7;
            CGContextDrawImage(v13, v22, a2);
            CGContextRelease(v13);
            _NTKUltraCubeFiller::_NTKUltraCubeFiller((uint64_t)v20, (uint64_t)v8, (uint64_t)v11, Width, v7);
            _NTKUltraCubeFiller::setup((_NTKUltraCubeFiller *)v20);
            _NTKUltraCubeFiller::resolve((uint64_t)v20, v14, v15, v16, v17, v18);
            CGImageRef v2 = _NTKUltraCubeFiller::result((_NTKUltraCubeFiller *)v20);
            sub_184AC(v20);
            free(v8);
            free(v11);
          }
          else
          {
            return 0;
          }
        }
      }
    }
  }
  return v2;
}

void sub_183D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_184AC((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_183E8(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_18444(exception, a1);
}

void sub_18430(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_18444(std::logic_error *a1, const char *a2)
{
  BOOL result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_18478()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *sub_184AC(void *a1)
{
  CGImageRef v2 = (void *)a1[338];
  if (v2)
  {
    a1[339] = v2;
    operator delete(v2);
  }
  size_t v3 = (void *)a1[335];
  if (v3)
  {
    a1[336] = v3;
    operator delete(v3);
  }
  uint32x4_t v4 = (void *)a1[332];
  if (v4)
  {
    a1[333] = v4;
    operator delete(v4);
  }
  double v5 = (void *)a1[329];
  if (v5)
  {
    a1[330] = v5;
    operator delete(v5);
  }
  uint16x4_t v6 = (void *)a1[326];
  if (v6)
  {
    a1[327] = v6;
    operator delete(v6);
  }
  int v7 = (void *)a1[323];
  if (v7)
  {
    a1[324] = v7;
    operator delete(v7);
  }
  __n128 v8 = (void *)a1[320];
  if (v8)
  {
    a1[321] = v8;
    operator delete(v8);
  }
  CGImageRef v9 = (void *)a1[317];
  if (v9)
  {
    a1[318] = v9;
    operator delete(v9);
  }
  return a1;
}

void sub_18550()
{
}

void sub_18568(char **a1, unint64_t a2)
{
  double v5 = a1[1];
  uint32x4_t v4 = a1[2];
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
    uint16x4_t v6 = *a1;
    uint64_t v7 = (v5 - *a1) >> 4;
    unint64_t v8 = v7 + a2;
    if ((v7 + a2) >> 60) {
      sub_18550();
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
        sub_18478();
      }
      int v11 = (char *)operator new(16 * v10);
    }
    else
    {
      int v11 = 0;
    }
    int v13 = &v11[16 * v7];
    size_t v14 = 16 * a2;
    double v15 = &v11[16 * v10];
    bzero(v13, v14);
    uint16x4_t v16 = &v13[v14];
    if (v5 != v6)
    {
      do
      {
        long long v17 = *((_OWORD *)v5 - 1);
        v5 -= 16;
        *((_OWORD *)v13 - 1) = v17;
        v13 -= 16;
      }
      while (v5 != v6);
      double v5 = *a1;
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

void sub_19744(id a1)
{
  size_t v3 = &off_4B8D8;
  CFStringRef v4 = @"custom";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];
  CGImageRef v2 = (void *)qword_58E98;
  qword_58E98 = v1;
}

id sub_19CC4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addFace];
}

uint64_t sub_1B274()
{
  memset(&v2, 0, sizeof(v2));
  NTKImagePresentationTransform();
  CGAffineTransformInvert(&v2, &v1);
  return NTKImagePresentationSize();
}

uint64_t sub_1B2E8()
{
  return NTKImagePresentationSize();
}

uint64_t sub_1B350()
{
  NTKCGImagePropertyOrientationToUIImageOrientation();

  return sub_1B274();
}

uint64_t sub_1B390()
{
  return NTKImagePresentationSize();
}

void sub_1B3FC(CGImage *a1, uint64_t a2, uint64_t a3, void *a4, int *a5, int *a6, int *a7)
{
  CGImageGetWidth(a1);
  CGImageGetHeight(a1);
  sub_1B274();
  sub_1B274();
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  int v12 = (int)v8;
  int v25 = (int)v8;
  int v13 = (int)v10;
  ColorSpace = CGImageGetColorSpace(a1);
  int NumberOfComponents = CGColorSpaceGetNumberOfComponents(ColorSpace);
  int v16 = 8 * NumberOfComponents + 14;
  if ((NumberOfComponents & 0x10000000) == 0) {
    int v16 = (8 * NumberOfComponents) | 7;
  }
  int v17 = (v16 >> 3) * v12;
  memset(&v35, 0, sizeof(v35));
  NTKImagePresentationTransform();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  NTKImagePresentationTransform();
  memset(&v31, 0, sizeof(v31));
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformInvert(&t2, &t1);
  CGAffineTransform t1 = v35;
  CGAffineTransformConcat(&v31, &t1, &t2);
  id v18 = +[NSMutableData dataWithLength:v17 * v13];
  id v19 = [v18 mutableBytes];
  size_t BitsPerComponent = CGImageGetBitsPerComponent(a1);
  CGRect v21 = CGImageGetColorSpace(a1);
  uint32_t AlphaInfo = CGImageGetAlphaInfo(a1);
  int v23 = CGBitmapContextCreate(v19, v12, v13, BitsPerComponent, v17, v21, AlphaInfo);
  CGAffineTransform v37 = v31;
  CGContextSaveGState(v23);
  memset(&t1, 0, sizeof(t1));
  sub_1B6B0(a1, &v37, (uint64_t)&t1);
  memset(&v37, 0, sizeof(v37));
  CGAffineTransform transform = t1;
  CGAffineTransformInvert(&v37, &transform);
  CGAffineTransform transform = t1;
  CGContextConcatCTM(v23, &transform);
  CGAffineTransform transform = v37;
  v39.origin.x = 0.0;
  v39.origin.y = 0.0;
  v39.size.width = v9;
  v39.size.height = v11;
  CGRect v40 = CGRectApplyAffineTransform(v39, &transform);
  CGContextDrawImage(v23, v40, a1);
  CGContextRestoreGState(v23);
  CGContextRelease(v23);
  id v24 = v18;
  *a4 = v24;
  *a5 = v25;
  *a6 = v13;
  *a7 = v17;
}

CGFloat sub_1B6B0@<D0>(CGImage *a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  CGFloat Height = (double)CGImageGetHeight(a1);
  long long v6 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)a3 = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)(a3 + 16) = v7;
  long long v8 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)(a3 + 32) = v8;
  *(_OWORD *)&t1.a = v6;
  *(_OWORD *)&t1.c = v7;
  *(_OWORD *)&t1.tx = v8;
  t2.b = 0.0;
  t2.c = 0.0;
  t2.a = 1.0;
  *(_OWORD *)&t2.d = xmmword_44270;
  t2.ty = Height;
  CGAffineTransformConcat((CGAffineTransform *)a3, &t1, &t2);
  long long v9 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a3;
  *(_OWORD *)&t2.c = v9;
  *(_OWORD *)&t2.tx = *(_OWORD *)(a3 + 32);
  long long v10 = a2[1];
  *(_OWORD *)&v15.a = *a2;
  *(_OWORD *)&v15.c = v10;
  *(_OWORD *)&v15.tx = a2[2];
  CGAffineTransformConcat(&t1, &t2, &v15);
  long long v11 = *(_OWORD *)&t1.c;
  *(_OWORD *)a3 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a3 + 16) = v11;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)&t1.tx;
  long long v12 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a3;
  *(_OWORD *)&t2.c = v12;
  *(_OWORD *)&t2.tx = *(_OWORD *)(a3 + 32);
  v15.b = 0.0;
  v15.c = 0.0;
  v15.a = 1.0;
  *(_OWORD *)&v15.d = xmmword_44270;
  v15.ty = Height;
  CGAffineTransformConcat(&t1, &t2, &v15);
  long long v13 = *(_OWORD *)&t1.c;
  *(_OWORD *)a3 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a3 + 16) = v13;
  CGFloat result = t1.tx;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)&t1.tx;
  return result;
}

CGContextRef sub_1B7C8(size_t a1, size_t a2, CGColorSpace *a3, uint32_t a4, void *a5)
{
  id v9 = a5;
  size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(a3);
  if (a4) {
    uint64_t v11 = (NumberOfComponents & 0x1FFFFFFFFFFFFFFFLL) + 1;
  }
  else {
    uint64_t v11 = NumberOfComponents & 0x1FFFFFFFFFFFFFFFLL;
  }
  id v12 = v9;
  id v13 = [v12 mutableBytes];

  return CGBitmapContextCreate(v13, a1, a2, 8uLL, v11 * a1, a3, a4);
}

CGImageDestination *sub_1B86C(void *a1, double a2)
{
  id v3 = a1;
  CFStringRef v4 = +[NSMutableData data];
  double v5 = [UTTypeHEIC identifier];
  long long v6 = CGImageDestinationCreateWithData(v4, v5, 1uLL, 0);

  if (v6)
  {
    [v3 imageOrientation];
    uint64_t v7 = NTKUIImageOrientationToCGImagePropertyOrientation();
    v14[0] = &__kCFBooleanTrue;
    v13[0] = kCGImageDestinationUseHardwareAcceleration;
    v13[1] = kCGImagePropertyOrientation;
    long long v8 = +[NSNumber numberWithUnsignedInt:v7];
    v14[1] = v8;
    v13[2] = kCGImageDestinationLossyCompressionQuality;
    id v9 = +[NSNumber numberWithDouble:a2];
    v14[2] = v9;
    CFDictionaryRef v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

    CGImageDestinationAddImage(v6, (CGImageRef)[v3 CGImage], v10);
    CGImageDestinationFinalize(v6);
    CFRelease(v6);
    if ([(__CFData *)v4 length]) {
      uint64_t v11 = v4;
    }
    else {
      uint64_t v11 = 0;
    }
    long long v6 = v11;
  }

  return v6;
}

void sub_1BA84(id a1)
{
  id v1 = [[NTKUltraCubeUserState alloc] _init];
  uint64_t v2 = qword_58EA8;
  qword_58EA8 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

id NTKUltraCubeComputeFaceRectsForCGImage(uint64_t a1, uint64_t a2)
{
  CFStringRef v4 = objc_opt_new();
  id v6 = [objc_alloc((Class)VNImageRequestHandler) initWithCGImage:a1 orientation:a2 options:&__NSDictionary0__struct];
  uint64_t v7 = objc_opt_new();
  long long v32 = v7;
  long long v8 = +[NSArray arrayWithObjects:&v32 count:1];
  id v30 = 0;
  unsigned int v9 = [v6 performRequests:v8 error:&v30];
  id v10 = v30;

  if (v9)
  {
    int v23 = v7;
    id v24 = v5;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v11 = [v7 results];
    id v12 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          int v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v16 boundingBox];
            v25[0] = v19;
            *(double *)&v25[1] = 1.0 - (v17 + v18);
            v25[2] = v20;
            *(double *)&v25[3] = v18;
            CGRect v21 = +[NSValue valueWithBytes:v25 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
            [v4 addObject:v21];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v13);
    }

    double v5 = v24;
    uint64_t v7 = v23;
  }

  return v4;
}

uint64_t NTKUltraCubeComputeThresholdSegmentation(uint64_t a1, uint64_t a2, void *a3, void *a4, int *a5, int *a6, unsigned int *a7)
{
  id v12 = a3;
  int v16 = +[AVDepthData depthDataFromDictionaryRepresentation:v12 error:0];
  int v66 = a5;
  int v67 = a6;
  int v65 = a4;
  id v68 = v12;
  if (v16)
  {
    double v17 = v13;
    double v18 = +[CIImage imageWithCGImage:a1];
    uint64_t v19 = +[CIImage imageWithDepthData:v16];
    uint64_t v20 = (void *)v19;
    CGRect v21 = 0;
    int v22 = 1;
    if (v18 && v19)
    {
      uint64_t v63 = a7;
      int v23 = +[CIFilter filterWithName:@"CIColorControls"];
      [v23 setValue:v18 forKey:kCIInputImageKey];
      [v23 setValue:&off_4B9B0 forKey:kCIInputBrightnessKey];
      id v24 = +[CIFilter filterWithName:@"CIPortraitEffectStage"];
      if (v24)
      {
        int v25 = [v23 outputImage];
        [v24 setValue:v25 forKey:kCIInputImageKey];

        [v24 setValue:v20 forKey:@"inputDisparity"];
        [v24 setValue:v18 forKey:@"inputFullSizeImage"];
        long long v26 = [v24 outputImage];
        CGRect v21 = +[UIImage imageWithCIImage:v26];

        int v22 = 0;
      }
      else
      {
        CGRect v21 = 0;
      }

      a7 = v63;
    }

    id v13 = v17;
    id v12 = v68;
  }
  else
  {
    CGRect v21 = 0;
    int v22 = 1;
  }

  if (v22 || !v21)
  {

    CGAffineTransform v35 = 0;
    goto LABEL_26;
  }
  [v21 size];
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  int v31 = (int)v27;
  int v32 = (int)v29;
  [v21 scale];
  CGFloat v34 = v33;
  v69.width = v28;
  v69.height = v30;
  UIGraphicsBeginImageContextWithOptions(v69, 1, v34);
  objc_msgSend(v21, "drawInRect:", 0.0, 0.0, (double)v31, (double)v32);
  CGAffineTransform v35 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  if (!v35)
  {
LABEL_26:

    uint64_t v61 = 0;
    goto LABEL_27;
  }
  int v64 = a7;
  unsigned int v36 = (v31 + 7) & 0xFFFFFFF8;
  id v37 = +[NSMutableData dataWithLength:(int)(4 * v36 * v32)];
  int v38 = (unsigned __int8 *)[v37 mutableBytes];
  CGRect v39 = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
  CGRect v40 = CGBitmapContextCreate(v38, v31, v32, 8uLL, (int)(4 * v36), v39, 1u);
  CGColorSpaceRelease(v39);
  CGContextSetInterpolationQuality(v40, kCGInterpolationHigh);
  id v41 = v35;
  uint64_t v42 = (CGImage *)[v41 CGImage];
  v70.origin.x = 0.0;
  v70.origin.y = 0.0;
  v70.size.width = (double)v31;
  v70.size.height = (double)v32;
  CGContextDrawImage(v40, v70, v42);
  CGContextRelease(v40);

  uint64_t v43 = v36 * v32;
  id v44 = +[NSMutableData dataWithLength:(int)v43];
  unint64_t v45 = [v44 mutableBytes];
  if ((int)v43 >= 1)
  {
    uint64_t v46 = v38 + 2;
    do
    {
      unsigned int v47 = *(v46 - 2);
      BOOL v48 = v47 > 2;
      float v49 = (float)(int)(v47 - 2);
      unsigned int v50 = *(v46 - 1);
      float v51 = v49 * 0.00083373;
      if (!v48) {
        float v51 = 0.0;
      }
      BOOL v48 = v50 > 2;
      float v52 = (float)(int)(v50 - 2);
      unsigned int v54 = *v46;
      v46 += 4;
      unsigned int v53 = v54;
      float v55 = v52 * 0.0028047;
      if (!v48) {
        float v55 = 0.0;
      }
      BOOL v56 = v53 >= 2;
      int v57 = v53 - 2;
      float v58 = (float)v57 * 0.00028314;
      if (v57 == 0 || !v56) {
        float v58 = 0.0;
      }
      int v59 = (int)(float)((float)((float)((float)(v51 + v55) + v58) * 3400.0) + 0.5);
      if (v59 >= 255) {
        LOBYTE(v59) = -1;
      }
      *v45++ = v59;
      --v43;
    }
    while (v43);
  }
  id v60 = v44;
  *int v65 = v60;
  int *v66 = v31;
  int *v67 = v32;
  *int v64 = v36;

  uint64_t v61 = 1;
  id v12 = v68;
LABEL_27:

  return v61;
}

CFStringRef NSStringForSegmentationType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"None";
  }
  else {
    return off_49200[a1 - 1];
  }
}

id NTKUltraCubePixelBufferForObservation(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v1 confidence];
    float v3 = v2;
    id v4 = [v1 pixelBuffer];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = [v1 instanceSegmentationMask];
      [v5 confidence];
      float v3 = v6;

      uint64_t v7 = [v1 instanceSegmentationMask];
      id v4 = [v7 pixelBuffer];
    }
    else
    {
      id v4 = 0;
      float v3 = -1.0;
    }
  }
  long long v8 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    uint64_t v11 = "NTKUltraCubePixelBufferForObservation";
    __int16 v12 = 2048;
    double v13 = v3;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%s: observation with a confidence of (%f)", (uint8_t *)&v10, 0x16u);
  }

  return v4;
}

id VNRequestForSegmentationType(uint64_t a1, uint64_t a2)
{
  if (a1 != 3 && a1 != 2 && a1 != 1)
  {
    id v4 = 0;
    goto LABEL_11;
  }
  float v3 = objc_opt_new();
  id v4 = v3;
  if (!a2)
  {
    uint64_t v5 = 1;
    goto LABEL_9;
  }
  if (a2 == 1)
  {
    uint64_t v5 = 0;
LABEL_9:
    [v3 setQualityLevel:v5];
  }
  [v4 setOutputPixelFormat:1278226488];
LABEL_11:

  return v4;
}

unsigned char *NTKUltraCubeMemCpyAndSubtract(unsigned char *result, char *a2, uint64_t a3)
{
  if (a3 >= 1)
  {
    float v3 = &a2[a3];
    do
    {
      char v4 = *a2++;
      *result++ = ~v4;
    }
    while (a2 < v3);
  }
  return result;
}

__CVBuffer *NTKUltraCubeResizePixelBufferIfNeeded(__CVBuffer *a1, void *a2, CGFloat a3, CGFloat a4)
{
  id v7 = a2;
  double Width = (double)CVPixelBufferGetWidth(a1);
  double Height = (double)CVPixelBufferGetHeight(a1);
  int v10 = _NTKLoggingObjectForDomain();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (a3 == Width && a4 == Height)
  {
    if (v11)
    {
      *(_DWORD *)buf = 136315138;
      double v27 = "NTKUltraCubeResizePixelBufferIfNeeded";
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%s: sizes match; no resize needed", buf, 0xCu);
    }

    CVPixelBufferRetain(a1);
  }
  else
  {
    if (v11)
    {
      v32.width = Width;
      v32.height = Height;
      double v13 = NSStringFromCGSize(v32);
      v33.width = a3;
      v33.height = a4;
      uint64_t v14 = NSStringFromCGSize(v33);
      *(_DWORD *)buf = 136315650;
      double v27 = "NTKUltraCubeResizePixelBufferIfNeeded";
      __int16 v28 = 2112;
      double v29 = v13;
      __int16 v30 = 2112;
      int v31 = v14;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%s: size mismatch; scaling pixel buffer from %@ to %@",
        buf,
        0x20u);
    }
    CGAffineTransform v15 = +[CIImage imageWithCVImageBuffer:a1];
    [v15 extent];
    CGFloat v16 = a3 / CGRectGetWidth(v34);
    [v15 extent];
    CGFloat v17 = CGRectGetHeight(v35);
    CGAffineTransformMakeScale(&v25, v16, a4 / v17);
    double v18 = [v15 imageByApplyingTransform:&v25];

    CVPixelBufferRef pixelBufferOut = 0;
    [v18 extent];
    size_t v19 = (unint64_t)CGRectGetWidth(v36);
    [v18 extent];
    size_t v20 = (unint64_t)CGRectGetHeight(v37);
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
    CVPixelBufferCreate(0, v19, v20, PixelFormatType, 0, &pixelBufferOut);
    if (pixelBufferOut)
    {
      objc_msgSend(v7, "render:toCVPixelBuffer:", v18);
    }
    else
    {
      int v22 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        double v27 = "NTKUltraCubeResizePixelBufferIfNeeded";
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "%s: failed to resize; output resized pixelBuffer was NULL",
          buf,
          0xCu);
      }
    }
    a1 = pixelBufferOut;
  }
  return a1;
}

id NTKUltraCubeComputeSegmentation(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, _DWORD *a8, _DWORD *a9, _DWORD *a10, unsigned __int8 a11)
{
  id v15 = a1;
  CGFloat v16 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a2 - 1) > 2) {
      CFStringRef v17 = @"None";
    }
    else {
      CFStringRef v17 = off_49200[a2 - 1];
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "NTKUltraCubeComputeSegmentation";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v17;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "%s: requesting segmentation of type: %@", buf, 0x16u);
  }

  if (!a2)
  {
    size_t v19 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "NTKUltraCubeComputeSegmentation";
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "%s: segmentation type none is not supported", buf, 0xCu);
    }
    id v28 = 0;
    goto LABEL_25;
  }
  uint64_t v18 = VNRequestForSegmentationType(a2, a3);
  size_t v19 = v18;
  if (!v18)
  {
    int v23 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "NTKUltraCubeComputeSegmentation";
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "%s: VNRequest is nil.", buf, 0xCu);
    }
    id v28 = 0;
    goto LABEL_24;
  }
  int v59 = a7;
  int v20 = a11;
  uint64_t v69 = v18;
  CGRect v21 = +[NSArray arrayWithObjects:&v69 count:1];
  id v65 = 0;
  unsigned int v22 = [v15 performRequests:v21 error:&v65];
  int v23 = v65;

  if (!v22)
  {
    id v24 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      double v29 = (objc_class *)objc_opt_class();
      long long v26 = NSStringFromClass(v29);
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "NTKUltraCubeComputeSegmentation";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v26;
      double v27 = "%s: Failed to perform %{public}@";
      goto LABEL_20;
    }
LABEL_21:
    id v28 = 0;
    goto LABEL_22;
  }
  id v24 = _NTKLoggingObjectForDomain();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    if (v25)
    {
      long long v26 = [v23 localizedDescription];
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "NTKUltraCubeComputeSegmentation";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v26;
      double v27 = "%s: failed request; error — %@";
LABEL_20:
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, v27, buf, 0x16u);

      goto LABEL_21;
    }
    goto LABEL_21;
  }
  if (v25)
  {
    CGSize v32 = [v19 results];
    id v33 = [v32 count];
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "NTKUltraCubeComputeSegmentation";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v33;
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "%s: successful request; returned (%ld) results", buf, 0x16u);
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v24 = [v19 results];
  id v28 = [v24 countByEnumeratingWithState:&v61 objects:v68 count:16];
  if (!v28) {
    goto LABEL_22;
  }
  BOOL v56 = a8;
  id v57 = v15;
  uint64_t v34 = *(void *)v62;
  while (2)
  {
    for (uint64_t i = 0; i != v28; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v62 != v34) {
        objc_enumerationMutation(v24);
      }
      CGRect v36 = (__CVBuffer *)NTKUltraCubePixelBufferForObservation(*(void **)(*((void *)&v61 + 1) + 8 * i));
      CGRect v37 = _NTKLoggingObjectForDomain();
      BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
      if (!v36)
      {
        if (!v38) {
          goto LABEL_42;
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "NTKUltraCubeComputeSegmentation";
        CGRect v39 = v37;
        CGRect v40 = "%s: nil pixel buffer in observation";
        goto LABEL_41;
      }
      if (v38)
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "NTKUltraCubeComputeSegmentation";
        _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "%s: observation contains pixel buffer; resize to output aspect ratio; copy data",
          buf,
          0xCu);
      }

      if (CVPixelBufferGetPixelFormatType(v36) == 1278226488)
      {
        NTKCGImagePropertyOrientationToUIImageOrientation();
        long long v67 = 0u;
        memset(buf, 0, sizeof(buf));
        NTKImagePresentationTransform();
        NTKImagePresentationSize();
        CGFloat v42 = v41;
        CGFloat v44 = v43;
        unint64_t v45 = +[CIContext context];
        uint64_t v46 = NTKUltraCubeResizePixelBufferIfNeeded(v36, v45, v42, v44);

        int Width = CVPixelBufferGetWidth(v46);
        size_t Height = CVPixelBufferGetHeight(v46);
        size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v46);
        CVPixelBufferLockBaseAddress(v46, 1uLL);
        BaseAddress = (char *)CVPixelBufferGetBaseAddress(v46);
        int v58 = Height;
        uint64_t v50 = BytesPerRow * Height;
        id v51 = [objc_alloc((Class)NSMutableData) initWithLength:BytesPerRow * Height];
        float v52 = [v51 mutableBytes];
        if (a2 == 3)
        {
          int v23 = 0;
          id v15 = v57;
          if (v50 >= 1)
          {
            unsigned int v53 = &BaseAddress[v50];
            do
            {
              char v54 = *BaseAddress++;
              *v52++ = ~v54;
            }
            while (BaseAddress < v53);
          }
        }
        else
        {
          memcpy(v52, BaseAddress, BytesPerRow * Height);
          int v23 = 0;
          id v15 = v57;
        }
        id v28 = &dword_0 + 1;
        CVPixelBufferUnlockBaseAddress(v46, 1uLL);
        CVPixelBufferRelease(v46);
        id v55 = v51;
        void *v59 = v55;
        *BOOL v56 = Width;
        *a9 = v58;
        *a10 = BytesPerRow;

        goto LABEL_52;
      }
      CGRect v37 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "NTKUltraCubeComputeSegmentation";
        CGRect v39 = v37;
        CGRect v40 = "%s: unexpected pixelFormatType in pixel buffer";
LABEL_41:
        _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, v40, buf, 0xCu);
      }
LABEL_42:
    }
    id v28 = [v24 countByEnumeratingWithState:&v61 objects:v68 count:16];
    if (v28) {
      continue;
    }
    break;
  }
  int v23 = 0;
  id v15 = v57;
LABEL_52:
  int v20 = a11;
LABEL_22:

  if (v20)
  {
    __int16 v30 = +[VNSession globalSession];
    [v30 releaseCachedResources];
  }
LABEL_24:

LABEL_25:
  return v28;
}

void sub_1D9F8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1DA14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1DA24(uint64_t a1)
{
}

void sub_1DA2C(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 56);
  }
  else
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v4)
    {
      uint64_t v5 = +[NSFileManager defaultManager];
      [v5 removeItemAtPath:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) error:0];

      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = 0;

      uint64_t v4 = 0;
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1DB44;
  block[3] = &unk_49220;
  uint64_t v8 = *(void *)(a1 + 32);
  char v14 = a2;
  block[4] = v8;
  uint64_t v13 = v4;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v10;
  long long v12 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_1DB44(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = *(unsigned char *)(a1 + 64);
  [*(id *)(a1 + 32) setState:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setGalleryPreviewResourceDirectory:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) galleryPreviewResourceDirectory];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void sub_1DBD8(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) firstObject];
  if (v2)
  {
    uint64_t v3 = NTKPhotosCreateResourceDirectory();
    uint64_t v4 = *(void *)(a1[6] + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    if (*(void *)(*(void *)(a1[6] + 8) + 40))
    {
      uint64_t v6 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:v2];
      if ([v6 isInResourceDirectory])
      {
        id v7 = [v6 photo];
        uint64_t v8 = sub_1DDBC(v7, *(void **)(*(void *)(a1[6] + 8) + 40));

        if (v8)
        {
LABEL_5:
          id v9 = [v8 encodeAsDictionary];
          long long v12 = v9;
          long long v10 = +[NSArray arrayWithObjects:&v12 count:1];

          NTKPhotosWriteImageListWithVersion();
          (*(void (**)(void))(a1[5] + 16))();

LABEL_11:
          goto LABEL_12;
        }
      }
      else
      {
        uint64_t v8 = sub_1DFC0(v6, *(void **)(*(void *)(a1[6] + 8) + 40));
        if (v8) {
          goto LABEL_5;
        }
      }
      (*(void (**)(void))(a1[5] + 16))();
      goto LABEL_11;
    }
    BOOL v11 = *(void (**)(void))(a1[5] + 16);
  }
  else
  {
    BOOL v11 = *(void (**)(void))(a1[5] + 16);
  }
  v11();
LABEL_12:
}

id sub_1DDBC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v3 baseImageURL];
    int v16 = 138412546;
    CFStringRef v17 = v6;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "_linkUltraCubePhoto: linking existing photo %@ into the new resource directory %@", (uint8_t *)&v16, 0x16u);
  }
  id v7 = [v3 copy];
  uint64_t v8 = [v3 baseImageURL];
  id v9 = NTKPhotosLinkURL();

  if (v9)
  {
    [v7 setBaseImageURL:v9];
    long long v10 = [v3 maskImageURL];

    if (v10)
    {
      BOOL v11 = [v3 maskImageURL];
      NTKPhotosLinkURL();
      id v12 = (id)objc_claimAutoreleasedReturnValue();

      if (!v12) {
        goto LABEL_12;
      }
      [v7 setMaskImageURL:v12];
    }
    uint64_t v13 = [v3 backgroundImageURL];

    if (v13)
    {
      char v14 = [v3 backgroundImageURL];
      NTKPhotosLinkURL();
      id v12 = (id)objc_claimAutoreleasedReturnValue();

      if (!v12) {
        goto LABEL_12;
      }
      [v7 setBackgroundImageURL:v12];
    }
    id v12 = v7;
  }
  else
  {
    id v12 = 0;
  }
LABEL_12:

  return v12;
}

id sub_1DFC0(void *a1, void *a2)
{
  id v3 = a1;
  id v192 = a2;
  id v4 = [NTKCompanionUltraCubeImageDataDescriptor alloc];
  v195 = v3;
  uint64_t v5 = [v3 asset];
  uint64_t v6 = [(NTKCompanionUltraCubeImageDataDescriptor *)v4 initWithAsset:v5];

  if (![(NTKCompanionUltraCubeImageDataDescriptor *)v6 isValid])
  {
    id v14 = 0;
    goto LABEL_120;
  }
  v191 = v6;
  id v7 = [v195 layout];
  [v7 crop];
  BOOL IsEmpty = CGRectIsEmpty(v204);

  if (IsEmpty)
  {
    id v9 = [(NTKCompanionUltraCubeImageDataDescriptor *)v6 segmentation];
    int v10 = [v9 hasAuxiliaryDictionary];
    if (v10)
    {
      BOOL v11 = (CGImage *)[v9 auxiliaryMaskImage];
      id v12 = v6;
      uint64_t v13 = [[NTKUltraCubePreviewCoveragePercentageValidator alloc] initWithMaskImage:v11 orientation:[(NTKCompanionUltraCubeImageDataDescriptor *)v6 orientation]];
      CGImageRelease(v11);
    }
    else
    {
      uint64_t v13 = 0;
      id v12 = v191;
    }
    id v15 = [(NTKCompanionUltraCubeImageDataDescriptor *)v12 faceRects];
    [(NTKCompanionUltraCubeImageDataDescriptor *)v191 presentationSize];
    __int16 v18 = sub_21454(v15, v10, v13, v16, v17);
    [v195 setLayout:v18];
  }
  id v19 = v191;
  id v178 = v195;
  id v179 = v192;
  v177 = v19;
  v187 = [(NTKCompanionUltraCubeImageDataDescriptor *)v19 segmentation];
  if ([v187 hasAuxiliaryDictionary])
  {
    int v20 = [v187 auxiliaryDictionaryDescription];
    id v21 = [v20 isThresholdMask];

    image = (CGImage *)[v187 auxiliaryMaskImage];
    if (!image)
    {
      unsigned int v22 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.a) = 0;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "_saveEditedPhoto: Cannot create mask image", (uint8_t *)&buf, 2u);
      }

      id v14 = 0;
      goto LABEL_119;
    }
  }
  else
  {
    id v21 = 0;
    image = 0;
  }
  int v23 = v177;
  id v190 = v178;
  id v185 = v179;
  int CanEncodeHEIC = NTKPhotosCanEncodeHEIC();
  id v24 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    if (image) {
      BOOL v25 = "masked";
    }
    else {
      BOOL v25 = "flat";
    }
    long long v26 = [(NTKCompanionUltraCubeImageDataDescriptor *)v23 asset];
    uint64_t v27 = [v26 localIdentifier];
    id v28 = (void *)v27;
    double v29 = "jpg";
    LODWORD(buf.a) = 136315906;
    *(void *)((char *)&buf.a + 4) = v25;
    WORD2(buf.b) = 2112;
    if (CanEncodeHEIC) {
      double v29 = "heic";
    }
    *(void *)((char *)&buf.b + 6) = v27;
    HIWORD(buf.c) = 2080;
    *(void *)&buf.d = v29;
    LOWORD(buf.tx) = 2112;
    *(void *)((char *)&buf.tx + 2) = v185;
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "_saveEditedPhoto: saving %s portrait for %@ as %s file in %@", (uint8_t *)&buf, 0x2Au);
  }
  v196 = objc_opt_new();
  __int16 v30 = +[NSUUID UUID];
  v180 = [v30 UUIDString];

  int v31 = @"jpg";
  if (CanEncodeHEIC)
  {
    int v31 = @"heic";
    CGSize v32 = (id *)&UTTypeHEIC;
  }
  else
  {
    CGSize v32 = (id *)&UTTypeJPEG;
  }
  v176 = v31;
  id v33 = *v32;
  uint64_t v34 = [(NTKCompanionUltraCubeImageDataDescriptor *)v23 asset];
  CGRect v35 = [v34 localIdentifier];
  [v196 setLocalIdentifier:v35];

  CGRect v36 = [(NTKCompanionUltraCubeImageDataDescriptor *)v23 asset];
  CGRect v37 = objc_msgSend(v36, "ntk_modificationDate");
  [v196 setModificationDate:v37];

  BOOL v38 = [v190 layout];
  [v38 crop];
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  CGFloat v46 = v45;

  sub_235B8(v40, v42, v44, v46, 1.075);
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  [(NTKCompanionUltraCubeImageDataDescriptor *)v23 presentationSize];
  double v56 = v55;
  double v58 = v57;
  BOOL v59 = v52 <= v55;
  double v60 = v54;
  double v181 = v52;
  if (!v59)
  {
    long long v61 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      long long v62 = +[NSString stringWithFormat:@"{ %.2f, %.2f, %.2f, %.2f }", *(void *)&v48, *(void *)&v50, *(void *)&v52, *(void *)&v54];
      long long v63 = +[NSString stringWithFormat:@"{ %.2f, %.2f, %.2f, %.2f }", 0, 0, *(void *)&v56, *(void *)&v58];
      LODWORD(buf.a) = 138412546;
      *(void *)((char *)&buf.a + 4) = v62;
      WORD2(buf.b) = 2112;
      *(void *)((char *)&buf.b + 6) = v63;
      _os_log_impl(&dword_0, v61, OS_LOG_TYPE_DEFAULT, "ensureRectIsWithinRect: %@ is outside %@", (uint8_t *)&buf, 0x16u);
    }
    double v60 = v54 * (v58 / v54);
    double v181 = v56;
  }
  if (v54 <= v58)
  {
    double rect = v60;
  }
  else
  {
    long long v64 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      id v65 = +[NSString stringWithFormat:@"{ %.2f, %.2f, %.2f, %.2f }", *(void *)&v48, *(void *)&v50, *(void *)&v52, *(void *)&v54];
      int v66 = +[NSString stringWithFormat:@"{ %.2f, %.2f, %.2f, %.2f }", 0, 0, *(void *)&v56, *(void *)&v58];
      LODWORD(buf.a) = 138412546;
      *(void *)((char *)&buf.a + 4) = v65;
      WORD2(buf.b) = 2112;
      *(void *)((char *)&buf.b + 6) = v66;
      _os_log_impl(&dword_0, v64, OS_LOG_TYPE_DEFAULT, "ensureRectIsWithinRect: %@ is outside %@", (uint8_t *)&buf, 0x16u);
    }
    double v181 = v56 / v52 * v181;
    double rect = v58;
  }
  if (v48 < 0.0 || (double v67 = v48, v48 + v52 > v56 + 0.0))
  {
    id v68 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v69 = +[NSString stringWithFormat:@"{ %.2f, %.2f, %.2f, %.2f }", *(void *)&v48, *(void *)&v50, *(void *)&v52, *(void *)&v54];
      CGRect v70 = +[NSString stringWithFormat:@"{ %.2f, %.2f, %.2f, %.2f }", 0, 0, *(void *)&v56, *(void *)&v58];
      LODWORD(buf.a) = 138412546;
      *(void *)((char *)&buf.a + 4) = v69;
      WORD2(buf.b) = 2112;
      *(void *)((char *)&buf.b + 6) = v70;
      _os_log_impl(&dword_0, v68, OS_LOG_TYPE_DEFAULT, "ensureRectIsWithinRect: %@ is outside %@", (uint8_t *)&buf, 0x16u);
    }
    if (v48 >= 0.0) {
      double v71 = v48;
    }
    else {
      double v71 = 0.0;
    }
    if (v71 >= v56 + 0.0 - v52) {
      double v67 = v56 + 0.0 - v52;
    }
    else {
      double v67 = v71;
    }
  }
  if (v50 < 0.0 || v50 + v54 > v58 + 0.0)
  {
    unint64_t v72 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v73 = +[NSString stringWithFormat:@"{ %.2f, %.2f, %.2f, %.2f }", *(void *)&v48, *(void *)&v50, *(void *)&v52, *(void *)&v54];
      unint64_t v74 = +[NSString stringWithFormat:@"{ %.2f, %.2f, %.2f, %.2f }", 0, 0, *(void *)&v56, *(void *)&v58];
      LODWORD(buf.a) = 138412546;
      *(void *)((char *)&buf.a + 4) = v73;
      WORD2(buf.b) = 2112;
      *(void *)((char *)&buf.b + 6) = v74;
      _os_log_impl(&dword_0, v72, OS_LOG_TYPE_DEFAULT, "ensureRectIsWithinRect: %@ is outside %@", (uint8_t *)&buf, 0x16u);
    }
    if (v50 >= 0.0) {
      double v75 = v50;
    }
    else {
      double v75 = 0.0;
    }
    if (v75 >= v58 + 0.0 - v54) {
      double v50 = v58 + 0.0 - v54;
    }
    else {
      double v50 = v75;
    }
  }
  [v196 setParallaxScale:1.075];
  uint64_t v76 = image != 0;
  float v77 = +[NSString stringWithFormat:@"base_%@.%@", v180, v176];
  v175 = [v185 stringByAppendingPathComponent:v77];

  int v78 = +[NSURL fileURLWithPath:v175];
  int v79 = v23;
  id v184 = v33;
  id v186 = v78;
  v193 = v79;
  [(NTKCompanionUltraCubeImageDataDescriptor *)v79 orientation];
  uint64_t v80 = NTKCGImagePropertyOrientationToUIImageOrientation();
  id v81 = objc_alloc((Class)NTKCompanionImageDataScaler);
  [(NTKCompanionUltraCubeImageDataDescriptor *)v193 presentationSize];
  double v83 = v82;
  double v85 = v84;
  unint64_t v86 = [(NTKCompanionUltraCubeImageDataDescriptor *)v193 data];
  double v87 = (double)((uint64_t)rint(v67) & ~v76);
  double v88 = (double)((uint64_t)rint(v50) & ~v76);
  id v89 = objc_msgSend(v81, "initWithSize:crop:data:orientation:type:outputSize:", v86, v80, v184, v83, v85, v87, v88, v181, rect, 480.0);

  if (v89)
  {
    v198.a = 0.0;
    *(void *)&v198.b = &v198;
    *(void *)&v198.c = 0x3032000000;
    *(void *)&v198.d = sub_1DA14;
    *(void *)&v198.tdouble x = sub_1DA24;
    v198.tdouble y = 0.0;
    dispatch_semaphore_t v90 = dispatch_semaphore_create(0);
    *(void *)&buf.a = _NSConcreteStackBlock;
    *(void *)&buf.b = 3221225472;
    *(void *)&buf.c = sub_2383C;
    *(void *)&buf.d = &unk_49428;
    *(void *)&buf.tdouble x = v186;
    v200 = &v198;
    v91 = v90;
    *(void *)&buf.tdouble y = v91;
    [v89 cropAndScaleWithCompletion:&buf];
    dispatch_semaphore_wait(v91, 0xFFFFFFFFFFFFFFFFLL);
    id v188 = *(id *)(*(void *)&v198.b + 40);

    _Block_object_dispose(&v198, 8);
  }
  else
  {
    id v188 = 0;
  }

  if (v188)
  {
    int v92 = [v190 layout];
    [v92 crop];
    objc_msgSend(v196, "setOriginalCrop:");

    [v196 setBaseImageURL:v186];
    objc_msgSend(v196, "setUserAdjusted:", objc_msgSend(v190, "isUserAdjusted"));
    [v196 setParallaxFlat:v21];
    [(NTKCompanionUltraCubeImageDataDescriptor *)v193 orientation];
    uint64_t v93 = NTKCGImagePropertyOrientationToUIImageOrientation();
    unsigned int v94 = [(NTKCompanionUltraCubeImageDataDescriptor *)v193 orientation];
    id v95 = [v188 imageOrientation];
    BOOL v96 = image == 0;
    if ((id)v93 == v95) {
      BOOL v96 = 1;
    }
    if (v96)
    {
      v110 = 0;
    }
    else
    {
      uint64_t v97 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
      {
        id v98 = [v188 imageOrientation];
        LODWORD(buf.a) = 134218240;
        *(void *)((char *)&buf.a + 4) = v93;
        WORD2(buf.b) = 2048;
        *(void *)((char *)&buf.b + 6) = v98;
        _os_log_impl(&dword_0, v97, OS_LOG_TYPE_DEFAULT, "saved jpeg has changed orientation; adjusting the mask from %ld to %ld",
          (uint8_t *)&buf,
          0x16u);
      }

      id v99 = [v188 imageOrientation];
      LODWORD(v198.a) = 0;
      LODWORD(v202.a) = 0;
      LODWORD(v197.a) = 0;
      buf.a = 0.0;
      sub_1B3FC(image, v93, (uint64_t)v99, &buf, (int *)&v198, (int *)&v202, (int *)&v197);
      CFDataRef v100 = (const __CFData *)*(id *)&buf.a;
      int v101 = CGDataProviderCreateWithCFData(v100);
      size_t a_low = SLODWORD(v202.a);
      size_t v172 = SLODWORD(v198.a);
      size_t BitsPerComponent = CGImageGetBitsPerComponent(image);
      size_t BitsPerPixel = CGImageGetBitsPerPixel(image);
      size_t v104 = SLODWORD(v197.a);
      ColorSpace = CGImageGetColorSpace(image);
      CGBitmapInfo BitmapInfo = CGImageGetBitmapInfo(image);
      decode = CGImageGetDecode(image);
      BOOL shouldInterpolate = CGImageGetShouldInterpolate(image);
      CGColorRenderingIntent RenderingIntent = CGImageGetRenderingIntent(image);

      v110 = CGImageCreate(v172, a_low, BitsPerComponent, BitsPerPixel, v104, ColorSpace, BitmapInfo, v101, decode, shouldInterpolate, RenderingIntent);
      CGDataProviderRelease(v101);
      [v188 imageOrientation];
      unsigned int v94 = NTKUIImageOrientationToCGImagePropertyOrientation();
    }
    if (v110) {
      v111 = v110;
    }
    else {
      v111 = image;
    }
    [v196 setMaskImageURL:0];
    if (!v111)
    {
      id v182 = 0;
      goto LABEL_99;
    }
    size_t Width = CGImageGetWidth(image);
    [(NTKCompanionUltraCubeImageDataDescriptor *)v193 storedSize];
    CGAffineTransformMakeScale(&v197, (double)Width / v113, (double)Width / v113);
    v205.origin.double x = v87;
    v205.origin.double y = v88;
    v205.size.width = v181;
    v205.size.double height = rect;
    CGRect v206 = CGRectApplyAffineTransform(v205, &v197);
    double x = v206.origin.x;
    double y = v206.origin.y;
    double v116 = v206.size.width;
    double height = v206.size.height;
    v118 = +[NSString stringWithFormat:@"mask_%@.png", v180];
    v119 = [v185 stringByAppendingPathComponent:v118];

    v120 = +[NSURL fileURLWithPath:v119];
    if (height * 0.8 >= v116) {
      double v121 = v116;
    }
    else {
      double v121 = height * 0.8;
    }
    if (v116 / 0.8 >= height) {
      double v122 = height;
    }
    else {
      double v122 = v116 / 0.8;
    }
    if (v121 <= v122)
    {
      double v124 = rint(v122);
      double v123 = ceil(v124 * 480.0 / 600.0);
    }
    else
    {
      double v123 = rint(v121);
      double v124 = ceil(v123 * 600.0 / 480.0);
    }
    CGImageGetWidth(v111);
    CGImageGetHeight(v111);
    id v183 = (id)NTKCGImagePropertyOrientationToUIImageOrientation();
    memset(&buf, 0, sizeof(buf));
    NTKImagePresentationTransform();
    CGAffineTransformInvert(&buf, &v198);
    CGAffineTransform v202 = buf;
    v207.origin.double x = rint(x + fmax((v116 - v121) * 0.5, 0.0));
    v207.origin.double y = rint(y + fmax((height - v122) * 0.5, 0.0));
    v207.size.width = v123;
    v207.size.double height = v124;
    CGRect v208 = CGRectApplyAffineTransform(v207, &v202);
    v125 = CGImageCreateWithImageInRect(v111, v208);
    if (v125)
    {
      v126 = +[NSMutableData data];
      v127 = [UTTypePNG identifier];
      v128 = CGImageDestinationCreateWithData(v126, v127, 1uLL, 0);

      if (v128)
      {
        Mutable = CGImageMetadataCreateMutable();
        if (Mutable)
        {
          v130 = +[NSString stringWithFormat:@"%ld", v94];
          CGImageMetadataSetValueWithPath(Mutable, 0, @"tiff:Orientation", v130);
          v201[0] = kCGImageDestinationImageMaxPixelSize;
          v131 = +[NSNumber numberWithDouble:600.0];
          v201[1] = kCGImageDestinationUseHardwareAcceleration;
          *(void *)&v202.a = v131;
          *(void *)&v202.b = &__kCFBooleanTrue;
          CFDictionaryRef v132 = +[NSDictionary dictionaryWithObjects:&v202 forKeys:v201 count:2];

          CGImageDestinationAddImageAndMetadata(v128, v125, Mutable, v132);
          CGImageDestinationFinalize(v128);
          CFRelease(Mutable);
        }
        else
        {

          v130 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v202.a) = 0;
            _os_log_impl(&dword_0, v130, OS_LOG_TYPE_DEFAULT, "cropScaleMask: cannot create metadataRef", (uint8_t *)&v202, 2u);
          }
          v126 = 0;
        }

        CFRelease(v128);
        CFRelease(v125);
        if (v126)
        {
          v136 = CGDataProviderCreateWithCFData(v126);
          v137 = CGImageCreateWithPNGDataProvider(v136, 0, 0, kCGRenderingIntentDefault);
          id v135 = +[UIImage imageWithCGImage:v137 scale:v183 orientation:1.0];
          CGDataProviderRelease(v136);
          CGImageRelease(v137);
        }
        else
        {
          id v135 = 0;
        }
        goto LABEL_96;
      }

      v134 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v202.a) = 0;
        _os_log_impl(&dword_0, v134, OS_LOG_TYPE_DEFAULT, "cropScaleMask: cannot create imageDestinationRef", (uint8_t *)&v202, 2u);
      }

      CFRelease(v125);
    }
    else
    {
      v133 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v202.a) = 0;
        _os_log_impl(&dword_0, v133, OS_LOG_TYPE_DEFAULT, "cropScaleMask: cannot create croppedImageRef", (uint8_t *)&v202, 2u);
      }
    }
    id v135 = 0;
    v126 = 0;
LABEL_96:
    id v182 = v135;
    CGImageRelease(v110);
    v138 = sub_236B4(v126, v120);
    if (v138)
    {

LABEL_114:
      id v14 = 0;
LABEL_117:

      goto LABEL_118;
    }
    [v196 setMaskImageURL:v120];

LABEL_99:
    [v196 setBaseImageZorder:0.0];
    v139 = [v190 layout];
    [v139 timeElementZorder];
    objc_msgSend(v196, "setTimeElementZorder:");

    v140 = [v190 layout];
    [v140 maskedImageZorder];
    objc_msgSend(v196, "setMaskedImageZorder:");

    if (v182)
    {
      id v141 = v188;
      v142 = (CGImage *)[v141 CGImage];
      id v143 = v182;
      ContentFillForCGImage = NTKUltraCubeCreateContentFillForCGImage(v142, (CGImage *)[v143 CGImage]);
      +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", ContentFillForCGImage, [v141 imageOrientation], 1.0);
      v119 = (UIImage *)objc_claimAutoreleasedReturnValue();
      CGImageRelease(ContentFillForCGImage);
      id v145 = v141;
      v146 = sub_232E0((CGImage *)[v145 CGImage], (CGImage *)objc_msgSend(v143, "CGImage"));
      v120 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v146, [v145 imageOrientation], 1.0);
      CGImageRelease(v146);
      if (!ContentFillForCGImage || !v146)
      {
        v147 = (UIImage *)v145;

        [v196 setTimeElementZorder:2.0];
        [v196 setMaskedImageZorder:1.0];
        v148 = [v196 maskImageURL];
        v149 = _NTKLoggingObjectForDomain();
        if (os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.a) = 138412290;
          *(void *)((char *)&buf.a + 4) = v148;
          _os_log_impl(&dword_0, v149, OS_LOG_TYPE_DEFAULT, "Creating content fill failed; removing %@",
            (uint8_t *)&buf,
            0xCu);
        }

        v150 = +[NSFileManager defaultManager];
        [v150 removeItemAtURL:v148 error:0];

        [v196 setMaskImageURL:0];
        v120 = 0;
        v119 = v147;
      }
    }
    else
    {
      v119 = 0;
      v120 = 0;
    }
    [v196 setBackgroundImageURL:0];
    if (v119 && v120)
    {
      v151 = +[NSString stringWithFormat:@"back_%@.%@", v180, v176];
      v152 = [v185 stringByAppendingPathComponent:v151];

      v153 = +[NSURL fileURLWithPath:v152];
      if (CanEncodeHEIC) {
        sub_1B86C(v119, 0.9);
      }
      else {
      v156 = UIImageJPEGRepresentation(v119, 0.85);
      }
      v157 = sub_236B4(v156, v153);
      if (v157)
      {

        goto LABEL_114;
      }
      [v196 setBackgroundImageURL:v153];

      id v158 = v120;
      id v159 = v188;
      v160 = (CGImage *)[v158 CGImage];
      v161 = [(UIImage *)v119 CGImage];

      v162 = CGImageGetColorSpace(v160);
      int v163 = CGImageGetWidth(v160);
      int v164 = CGImageGetHeight(v160);
      v165 = CGBitmapContextCreate(0, v163, v164, 8uLL, 4 * v163, v162, 1u);
      id v166 = +[UIColor colorWithWhite:0.5 alpha:1.0];
      CGContextSetFillColorWithColor(v165, (CGColorRef)[v166 CGColor]);

      v209.origin.double x = 0.0;
      v209.origin.double y = 0.0;
      v209.size.width = (double)v163;
      v209.size.double height = (double)v164;
      CGContextFillRect(v165, v209);
      CGContextSetInterpolationQuality(v165, kCGInterpolationHigh);
      CGContextSetBlendMode(v165, kCGBlendModeMultiply);
      v210.origin.double x = 0.0;
      v210.origin.double y = 0.0;
      v210.size.width = (double)v163;
      v210.size.double height = (double)v164;
      CGContextDrawImage(v165, v210, v161);
      CGContextSetBlendMode(v165, kCGBlendModeNormal);
      v211.origin.double x = 0.0;
      v211.origin.double y = 0.0;
      v211.size.width = (double)v163;
      v211.size.double height = (double)v164;
      CGContextDrawImage(v165, v211, v160);
      v167 = CGBitmapContextCreateImage(v165);
      CGContextRelease(v165);
      +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v167, [v158 imageOrientation], 1.0);
      id v155 = (id)objc_claimAutoreleasedReturnValue();
      CGImageRelease(v167);
    }
    else
    {
      id v155 = v188;
    }
    CLKUIComputeDimmingRequiredToObtainImageAPL();
    [v196 setImageAOTBrightness:v168];

    v169 = [v190 layout];
    [v169 baseline];
    objc_msgSend(v196, "setTimeElementUnitBaseline:");

    [v196 setTimeElementUnitHeight:0.241116751];
    id v14 = v196;
    goto LABEL_117;
  }
  id v14 = 0;
LABEL_118:

  CGImageRelease(image);
LABEL_119:

  uint64_t v6 = v191;
LABEL_120:

  return v14;
}

void sub_1F778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

uint64_t sub_1F9A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1F9B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) resourceDirectory];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_1FA10(uint64_t a1)
{
  uint64_t v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  uint64_t v8 = sub_1FB50;
  id v9 = &unk_49310;
  id v2 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v2;
  id v3 = objc_retainBlock(&v6);
  id v4 = NTKPhotosCreateResourceDirectory();
  if (v4)
  {
    id v5 = objc_msgSend(*(id *)(a1 + 32), "_copyOrTranscodePhotosTo:", v4, v6, v7, v8, v9, v10);
    if (v5 && (NTKPhotosWriteImageListWithVersion() & 1) != 0)
    {
      [*(id *)(a1 + 32) _reinitializeWithImageList:v5 andResourceDirectory:v4];
      ((void (*)(void ***, uint64_t, void *))v3[2])(v3, 1, v4);
    }
    else
    {
      ((void (*)(void ***, void, void))v3[2])(v3, 0, 0);
    }
  }
  else
  {
    ((void (*)(void ***, void, void))v3[2])(v3, 0, 0);
  }
}

void sub_1FB50(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    uint64_t v7 = 1;
  }
  else
  {
    if (v5)
    {
      uint64_t v8 = +[NSFileManager defaultManager];
      [v8 removeItemAtPath:v6 error:0];

      uint64_t v6 = 0;
    }
    uint64_t v7 = 0;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1FC50;
  v11[3] = &unk_492E8;
  uint64_t v14 = v7;
  id v9 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v6;
  id v13 = v9;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

uint64_t sub_1FC50(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setResourceDirectory:*(void *)(a1 + 40)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

uint64_t sub_201E4(void *a1)
{
  if (!a1) {
    return 1;
  }
  id v1 = a1;
  id v2 = [v1 pixelWidth];
  id v3 = [v1 pixelHeight];

  if ((void)v3 * (void)v2 <= 0xE4E1C0uLL) {
    return 1;
  }
  else {
    return 2;
  }
}

uint64_t sub_20A44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_20A58(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_20A6C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_20A80(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 24);
    id v5 = [*(id *)(a1 + 40) asset];
    uint64_t v6 = [v5 localIdentifier];
    [v4 setObject:v3 forKey:v6];
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_20B80;
  v9[3] = &unk_492C0;
  id v7 = *(id *)(a1 + 48);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

uint64_t sub_20B80(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_20CF4(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    *(_DWORD *)CGAffineTransform buf = 134217984;
    uint64_t v21 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "previewOfLibraryPhotoAtIndex:%ld", buf, 0xCu);
  }

  unint64_t v4 = *(void *)(a1 + 48);
  if ((v4 & 0x8000000000000000) != 0
    || v4 >= (unint64_t)[*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_20FB8;
    block[3] = &unk_49298;
    id v19 = *(id *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    id v5 = v19;
  }
  else if ([*(id *)(a1 + 32) _ensurePreviewEditSessionIsLoadedForPhotoAtIndex:*(void *)(a1 + 48) computeCrop:1])
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndexedSubscript:*(void *)(a1 + 48)];
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = (void *)v6[4];
    id v8 = [v6 device];
    id v9 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v5];
    id v10 = objc_msgSend(v7, "ultracubeCropPreviewForDevice:subsampleFactor:", v8, (double)(unint64_t)objc_msgSend(v9, "subsampleFactor"));

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_20FE8;
    void v13[3] = &unk_492C0;
    id v11 = *(id *)(a1 + 40);
    id v14 = v10;
    id v15 = v11;
    id v12 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    void v16[2] = sub_20FD0;
    v16[3] = &unk_49298;
    id v17 = *(id *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);
    id v5 = v17;
  }
}

uint64_t sub_20FB8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_20FD0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_20FE8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void sub_210C0(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    *(_DWORD *)CGAffineTransform buf = 134217984;
    uint64_t v29 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "resetCropOfPhotoAtIndex:%ld", buf, 0xCu);
  }

  unint64_t v4 = *(void *)(a1 + 48);
  if ((v4 & 0x8000000000000000) != 0
    || v4 >= (unint64_t)[*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_21424;
    block[3] = &unk_49298;
    id v27 = *(id *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    id v5 = v27;
  }
  else if ([*(id *)(a1 + 32) _ensurePreviewEditSessionIsLoadedForPhotoAtIndex:*(void *)(a1 + 48) computeCrop:0])
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndexedSubscript:*(void *)(a1 + 48)];
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v5];
    id v7 = *(id *)(*(void *)(a1 + 32) + 32);
    id v8 = [v7 photoImageMasked];
    BOOL v9 = v8 != 0;

    id v10 = [v7 faceRects];
    id v11 = [v7 previewValidator];
    [v7 presentationSize];
    id v14 = sub_21454(v10, v9, v11, v12, v13);

    [*(id *)(*(void *)(a1 + 32) + 32) setLayout:v14];
    [*(id *)(*(void *)(a1 + 32) + 32) setUserAdjusted:0];
    id v15 = *(void **)(a1 + 32);
    double v16 = (void *)v15[4];
    id v17 = [v15 device];
    __int16 v18 = objc_msgSend(v16, "ultracubeCropPreviewForDevice:subsampleFactor:", v17, (double)(unint64_t)objc_msgSend(v6, "subsampleFactor"));

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_21C40;
    v21[3] = &unk_492C0;
    id v19 = *(id *)(a1 + 40);
    id v22 = v18;
    id v23 = v19;
    id v20 = v18;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v21);
  }
  else
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_2143C;
    v24[3] = &unk_49298;
    id v25 = *(id *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v24);
    id v5 = v25;
  }
}

uint64_t sub_21424(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2143C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

_NTKLayoutDescriptor *sub_21454(void *a1, int a2, void *a3, double a4, double a5)
{
  id v9 = a1;
  id v10 = a3;
  if (![v9 count]) {
    goto LABEL_33;
  }
  double v12 = 0.241116751 * 0.9 * 0.71;
  double v13 = 0.328125 - v12;
  double v14 = (1.075 + -1.0) * 0.5;
  double v111 = a4;
  double v112 = a5;
  if (!a2) {
    goto LABEL_57;
  }
  double v109 = 0.328125 - v12;
  double v15 = NTKUltraCubeComputeIdealCoverageUnitCropUpOrientation(v9, v10, a4, a5, 0.12345, v13, 0.7531, v12, v14, v11, 480.0, 600.0);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  sub_235B8(v15, v16, v18, v20, 1.075);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v108 = v28;
  v116.origin.double x = v15;
  v116.origin.double y = v17;
  v116.size.width = v19;
  v116.size.double height = v21;
  if (CGRectIsEmpty(v116)
    || (v23 >= -0.00000011920929 ? (BOOL v29 = v25 < -0.00000011920929) : (BOOL v29 = 1),
        v29 || v23 + v27 + -0.00000011920929 > 1.0))
  {
    __int16 v30 = 0;
  }
  else if (v25 + v108 + -0.00000011920929 > 1.0)
  {
    __int16 v30 = 0;
  }
  else
  {
    __int16 v30 = objc_alloc_init(_NTKLayoutDescriptor);
    -[_NTKLayoutDescriptor setCrop:](v30, "setCrop:", v15, v17, v19, v21);
    [(_NTKLayoutDescriptor *)v30 setBaseline:0.328125];
    [(_NTKLayoutDescriptor *)v30 setTimeElementZorder:1.0];
    [(_NTKLayoutDescriptor *)v30 setMaskedImageZorder:2.0];
  }
  int v31 = _NTKLoggingObjectForDomain();
  a4 = v111;
  a5 = v112;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    [(_NTKLayoutDescriptor *)v30 crop];
    CGRect v36 = +[NSString stringWithFormat:@"{ %.2f, %.2f, %.2f, %.2f }", v32, v33, v34, v35];
    LODWORD(buf.a) = 138412290;
    *(void *)((char *)&buf.a + 4) = v36;
    _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "portraitLayoutDynamic: ideal rect == %@", (uint8_t *)&buf, 0xCu);
  }
  double v14 = (1.075 + -1.0) * 0.5;
  double v12 = 0.241116751 * 0.9 * 0.71;
  double v13 = v109;
  if (!v30)
  {
LABEL_57:
    NTKUltraCubeComputeTimeAboveUnitCropUpOrientation(v9, a4, a5, 0.12345, v13, 0.7531, v12, v14, v11, 480.0, 600.0);
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    sub_235B8(v37, v39, v41, v43, 1.075);
    double v46 = v45;
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;
    v117.origin.double x = v38;
    v117.origin.double y = v40;
    v117.size.width = v42;
    v117.size.double height = v44;
    if (CGRectIsEmpty(v117)
      || (v46 >= -0.00000011920929 ? (BOOL v53 = v48 < -0.00000011920929) : (BOOL v53 = 1),
          v53 || v46 + v50 + -0.00000011920929 > 1.0))
    {
      __int16 v30 = 0;
    }
    else if (v48 + v52 + -0.00000011920929 > 1.0)
    {
      __int16 v30 = 0;
    }
    else
    {
      __int16 v30 = objc_alloc_init(_NTKLayoutDescriptor);
      -[_NTKLayoutDescriptor setCrop:](v30, "setCrop:", v38, v40, v42, v44);
      [(_NTKLayoutDescriptor *)v30 setBaseline:0.328125];
      [(_NTKLayoutDescriptor *)v30 setTimeElementZorder:2.0];
      [(_NTKLayoutDescriptor *)v30 setMaskedImageZorder:1.0];
    }
    double v54 = _NTKLoggingObjectForDomain();
    a4 = v111;
    a5 = v112;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      [(_NTKLayoutDescriptor *)v30 crop];
      BOOL v59 = +[NSString stringWithFormat:@"{ %.2f, %.2f, %.2f, %.2f }", v55, v56, v57, v58];
      LODWORD(buf.a) = 138412290;
      *(void *)((char *)&buf.a + 4) = v59;
      _os_log_impl(&dword_0, v54, OS_LOG_TYPE_DEFAULT, "portraitLayoutDynamic: top rect == %@", (uint8_t *)&buf, 0xCu);
    }
    if (!v30)
    {
      double v61 = NTKUltraCubeComputeTimeBelowUnitCropUpOrientation(v9, v111, v112, 0.12345, 0.803571429 - 0.241116751 * 0.9 * 0.71, 0.7531, 0.241116751 * 0.9 * 0.71, (1.075 + -1.0) * 0.5, v60, 480.0, 600.0);
      double v63 = v62;
      double v65 = v64;
      double v67 = v66;
      sub_235B8(v61, v62, v64, v66, 1.075);
      double v69 = v68;
      double v71 = v70;
      double v73 = v72;
      double v110 = v74;
      v118.origin.double x = v61;
      v118.origin.double y = v63;
      v118.size.width = v65;
      v118.size.double height = v67;
      if (CGRectIsEmpty(v118)
        || (v69 >= -0.00000011920929 ? (BOOL v75 = v71 < -0.00000011920929) : (BOOL v75 = 1),
            v75 || v69 + v73 + -0.00000011920929 > 1.0))
      {
        __int16 v30 = 0;
        a4 = v111;
      }
      else
      {
        if (v71 + v110 + -0.00000011920929 > 1.0)
        {
          __int16 v30 = 0;
        }
        else
        {
          __int16 v30 = objc_alloc_init(_NTKLayoutDescriptor);
          -[_NTKLayoutDescriptor setCrop:](v30, "setCrop:", v61, v63, v65, v67);
          [(_NTKLayoutDescriptor *)v30 setBaseline:0.803571429];
          [(_NTKLayoutDescriptor *)v30 setTimeElementZorder:2.0];
          [(_NTKLayoutDescriptor *)v30 setMaskedImageZorder:1.0];
        }
        a4 = v111;
      }
      uint64_t v76 = _NTKLoggingObjectForDomain();
      a5 = v112;
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        [(_NTKLayoutDescriptor *)v30 crop];
        id v81 = +[NSString stringWithFormat:@"{ %.2f, %.2f, %.2f, %.2f }", v77, v78, v79, v80];
        LODWORD(buf.a) = 138412290;
        *(void *)((char *)&buf.a + 4) = v81;
        _os_log_impl(&dword_0, v76, OS_LOG_TYPE_DEFAULT, "portraitLayoutDynamic: bottom rect == %@", (uint8_t *)&buf, 0xCu);
      }
      if (!v30)
      {
LABEL_33:
        if (a5 * 0.8 >= a4) {
          double v82 = a4;
        }
        else {
          double v82 = a5 * 0.8;
        }
        double v83 = fmax((a4 - v82) * 0.5, 0.0);
        if (a4 / 0.8 >= a5) {
          double v84 = a5;
        }
        else {
          double v84 = a4 / 0.8;
        }
        sub_235B8(v83, fmax((a5 - v84) * 0.5, 0.0), v82, v84, 1.0 / 1.075);
        CGFloat v86 = v85;
        CGFloat v88 = v87;
        CGFloat v90 = v89;
        CGFloat v92 = v91;
        __int16 v30 = objc_alloc_init(_NTKLayoutDescriptor);
        CGAffineTransformMakeScale(&buf, 1.0 / a4, 1.0 / a5);
        v119.origin.double x = v86;
        v119.origin.double y = v88;
        v119.size.width = v90;
        v119.size.double height = v92;
        CGRect v120 = CGRectApplyAffineTransform(v119, &buf);
        -[_NTKLayoutDescriptor setCrop:](v30, "setCrop:", v120.origin.x, v120.origin.y, v120.size.width, v120.size.height);
        [(_NTKLayoutDescriptor *)v30 setBaseline:0.803571429];
        [(_NTKLayoutDescriptor *)v30 setTimeElementZorder:2.0];
        [(_NTKLayoutDescriptor *)v30 setMaskedImageZorder:1.0];
        uint64_t v93 = _NTKLoggingObjectForDomain();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          [(_NTKLayoutDescriptor *)v30 crop];
          id v98 = +[NSString stringWithFormat:@"{ %.2f, %.2f, %.2f, %.2f }", v94, v95, v96, v97];
          LODWORD(buf.a) = 138412290;
          *(void *)((char *)&buf.a + 4) = v98;
          _os_log_impl(&dword_0, v93, OS_LOG_TYPE_DEFAULT, "portraitLayoutDynamic: fallback rect == %@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
  }
  [(_NTKLayoutDescriptor *)v30 crop];
  CGFloat v100 = v99;
  CGFloat v102 = v101;
  CGFloat v104 = v103;
  CGFloat v106 = v105;
  CGAffineTransformMakeScale(&v113, a4, a5);
  v121.origin.double x = v100;
  v121.origin.double y = v102;
  v121.size.width = v104;
  v121.size.double height = v106;
  CGRect v122 = CGRectApplyAffineTransform(v121, &v113);
  -[_NTKLayoutDescriptor setCrop:](v30, "setCrop:", v122.origin.x, v122.origin.y, v122.size.width, v122.size.height);

  return v30;
}

uint64_t sub_21C40(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void sub_22A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22A4C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:a2];
  if ([v6 isInResourceDirectory])
  {
    id v7 = [v6 photo];
    sub_1DDBC(v7, *(void **)(a1 + 40));
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    id v8 = v12;
  }
  else
  {
    id v8 = sub_1DFC0(v6, *(void **)(a1 + 40));
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  id v13 = v8;
  if (v8)
  {
    double v11 = [v8 encodeAsDictionary];
    [v10 addObject:v11];
  }
  else
  {
    *(void *)(v9 + 40) = 0;

    *a4 = 1;
  }
}

CGImageRef sub_232E0(CGImage *a1, CGImage *a2)
{
  ColorSpace = CGImageGetColorSpace(a1);
  int Width = CGImageGetWidth(a1);
  int Height = CGImageGetHeight(a1);
  id v7 = CGBitmapContextCreate(0, Width, Height, 8uLL, 4 * Width, ColorSpace, 1u);
  v10.origin.double x = 0.0;
  v10.origin.double y = 0.0;
  v10.size.width = (double)Width;
  v10.size.double height = (double)Height;
  CGContextClipToMask(v7, v10, a2);
  CGContextSetInterpolationQuality(v7, kCGInterpolationHigh);
  v11.origin.double x = 0.0;
  v11.origin.double y = 0.0;
  v11.size.width = (double)Width;
  v11.size.double height = (double)Height;
  CGContextDrawImage(v7, v11, a1);
  CGImageRef Image = CGBitmapContextCreateImage(v7);
  CGContextRelease(v7);
  return Image;
}

void sub_23440(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = objc_msgSend(objc_alloc((Class)NTKCompanionImageDataScaler), "initWithSize:crop:data:orientation:outputSize:", v6, a3, (double)(unint64_t)objc_msgSend(v5, "pixelWidth"), (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "pixelHeight"), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), 480.0, 600.0);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_23548;
  v8[3] = &unk_493D8;
  id v9 = *(id *)(a1 + 40);
  [v7 cropAndScaleWithCompletion:v8];
}

void sub_23548(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    a2 = +[UIImage imageWithData:a2 scale:1.0];
  }
  id v3 = (id)a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_235B8(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CGFloat v10 = a1 + a3 * 0.5;
  CGFloat v11 = a2 + a4 * 0.5;
  CGAffineTransformMakeTranslation(&v22, -v10, -v11);
  v23.origin.CGFloat x = a1;
  v23.origin.CGFloat y = a2;
  v23.size.CGFloat width = a3;
  v23.size.CGFloat height = a4;
  CGRect v24 = CGRectApplyAffineTransform(v23, &v22);
  CGFloat x = v24.origin.x;
  CGFloat y = v24.origin.y;
  CGFloat width = v24.size.width;
  CGFloat height = v24.size.height;
  CGAffineTransformMakeScale(&v21, a5, a5);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGRect v26 = CGRectApplyAffineTransform(v25, &v21);
  CGFloat v16 = v26.origin.x;
  CGFloat v17 = v26.origin.y;
  CGFloat v18 = v26.size.width;
  CGFloat v19 = v26.size.height;
  CGAffineTransformMakeTranslation(&v20, v10, v11);
  v27.origin.CGFloat x = v16;
  v27.origin.CGFloat y = v17;
  v27.size.CGFloat width = v18;
  v27.size.CGFloat height = v19;
  CGRectApplyAffineTransform(v27, &v20);
}

id sub_236B4(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CGAffineTransform buf = 134218242;
    id v11 = [v3 length];
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Saving %ld bytes to %@", buf, 0x16u);
  }

  id v9 = 0;
  [v3 writeToURL:v4 options:0 error:&v9];
  id v6 = v9;
  if (v6)
  {
    id v7 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CGAffineTransform buf = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "saveImageToFile: cannot save data to %@, error = %@", buf, 0x16u);
    }
  }

  return v6;
}

void sub_2383C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = sub_236B4(v3, *(void **)(a1 + 32));
    if (!v4)
    {
      uint64_t v5 = +[UIImage imageWithData:v8 scale:1.0];
      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id sub_2473C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyColorRamp:colorRampAmount:monochromeColorMatrix:", a2, a3);
}

char *createCumulativeData(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  unint64_t v6 = a2 + 1;
  id v7 = (char *)malloc_type_malloc(4 * (a2 + 1) * (a3 + 1), 0xEC77E5F4uLL);
  id v8 = v5;
  id v9 = (char *)[v8 bytes];
  uint64_t v10 = 4 * a2;
  if (a2 != -1) {
    bzero(v7, v10 + 4);
  }
  if (a3 != -1)
  {
    uint64_t v11 = -1;
    __int16 v12 = v7;
    do
    {
      _DWORD *v12 = 0;
      ++v11;
      __int16 v12 = (_DWORD *)((char *)v12 + v10 + 4);
    }
    while (a3 != v11);
    if ((unint64_t)(a3 + 1) >= 2)
    {
      id v13 = &v7[4 * v6];
      double v14 = &v9[a2 + 2];
      uint64_t v15 = 1;
      CGFloat v16 = v7;
      CGFloat v17 = v7;
      CGFloat v18 = &v7[4 * a2 + 8];
      do
      {
        v17 += 4;
        if (v6 >= 2)
        {
          uint64_t v19 = 0;
          uint64_t v20 = a2;
          do
          {
            int v21 = *v14++;
            *(_DWORD *)&v18[v19] = *(_DWORD *)&v13[v19] + v21 + *(_DWORD *)&v17[v19] - *(_DWORD *)&v16[v19];
            v19 += 4;
            --v20;
          }
          while (v20);
          v17 += v19;
          v16 += v19;
          v13 += v19;
          v18 += v19;
        }
        ++v14;
        v18 += 4;
        v13 += 4;
        v16 += 4;
      }
      while (v15++ != a3);
    }
  }

  return v7;
}

void sub_2640C(void *a1)
{
  id v9 = a1;
  [v9 bounds];
  double v2 = v1 * 0.5;
  id v3 = [v9 contentView];
  id v4 = [v3 layer];
  [v4 setCornerRadius:v2];

  id v5 = [v9 contentView];
  unint64_t v6 = [v5 layer];
  [v6 setMasksToBounds:1];

  id v7 = +[UIColor colorWithWhite:0.0 alpha:0.5];
  id v8 = [v9 contentView];
  [v8 setBackgroundColor:v7];

  [v9 _setupContainerButton];
}

uint64_t NTK_PUHapticsAllowed()
{
  if (qword_58EC0 != -1) {
    dispatch_once(&qword_58EC0, &stru_49490);
  }
  return byte_58EB8;
}

void sub_26C04(id a1)
{
  byte_58EB8 = MGGetBoolAnswer();
}

void NTKUltraCubeComputeTimeAboveUnitCropUpOrientation(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  double v24 = sub_27C74(a1, 0.2, 0.05);
  double v25 = v24 - v22 * a8;
  if (v25 >= 0.0)
  {
    double v26 = v21;
    double v27 = a8 + a8 + 1.0;
    double v28 = v26 - v23 * a8;
    double v29 = v25 + v27 * v22;
    if (v28 >= 0.0 && v29 <= 1.0 && v28 + v27 * v23 <= 1.0) {
      sub_27DE4(a2, a3, a10 / a11, a8, 0.5, a5 + a7, v24 + v22 * 0.5, v26);
    }
  }
}

double sub_27C74(void *a1, double a2, double a3)
{
  id v5 = a1;
  if ([v5 count])
  {
    unint64_t v6 = [v5 objectAtIndexedSubscript:0];
    [v6 rectValue];
    double x = v7 + v8 * -0.15;
    double width = v8 * 1.3;
    double y = v11 - v12 * a2;
    double v14 = a2 + a3 + 1.0;
    double height = v14 * v12;

    if ((unint64_t)[v5 count] >= 2)
    {
      unint64_t v16 = 1;
      double v26 = v14;
      double v27 = a2;
      do
      {
        CGFloat v17 = objc_msgSend(v5, "objectAtIndexedSubscript:", v16, *(void *)&v26);
        [v17 rectValue];
        CGFloat v20 = v18 + v19 * -0.15;
        CGFloat r2 = v19 * 1.3;
        CGFloat v23 = v21 - v22 * a2;
        CGFloat v24 = v26 * v22;

        v29.origin.double x = x;
        v29.origin.double y = y;
        v29.size.double width = width;
        v29.size.double height = height;
        v31.origin.double x = v20;
        v31.origin.double y = v23;
        v31.size.double width = r2;
        v31.size.double height = v24;
        a2 = v27;
        CGRect v30 = CGRectUnion(v29, v31);
        double x = v30.origin.x;
        double y = v30.origin.y;
        double width = v30.size.width;
        double height = v30.size.height;
        ++v16;
      }
      while ((unint64_t)[v5 count] > v16);
    }
  }
  else
  {
    double x = CGRectNull.origin.x;
  }

  return x;
}

double sub_27DE4(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v9 = a7 / (a5 + a4);
  if (v9 >= (1.0 - a7) / (1.0 - a5 + a4)) {
    double v9 = (1.0 - a7) / (1.0 - a5 + a4);
  }
  double v10 = a1 / a2 * (v9 / a3);
  double v11 = a8 / (a6 + a4);
  double v12 = (1.0 - a8) / (1.0 - a6 + a4);
  if (v11 < v12) {
    double v12 = v11;
  }
  if (v12 < v10) {
    double v9 = v9 * (v12 / v10);
  }
  return a7 - a5 * v9;
}

double NTKUltraCubeComputeTimeBelowUnitCropUpOrientation(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  id v21 = a1;
  double v25 = sub_27C74(v21, 0.05, 0.05);
  double v26 = v25 - v23 * a8;
  if (v26 < 0.0) {
    goto LABEL_31;
  }
  double v27 = v22;
  double v28 = v23;
  double v29 = v24;
  double v30 = a8 + a8 + 1.0;
  double v31 = v27 - v24 * a8;
  double v32 = v26 + v30 * v23;
  BOOL v33 = v31 < 0.0 || v32 > 1.0;
  if (v33 || v31 + v30 * v24 > 1.0) {
    goto LABEL_31;
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  double v51 = a5 * 0.3;
  id v35 = v21;
  id v36 = [v35 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v53;
    double v39 = 1.0;
    do
    {
      for (uint64_t i = 0; i != v37; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v53 != v38) {
          objc_enumerationMutation(v35);
        }
        [*(id *)(*((void *)&v52 + 1) + 8 * i) rectValue];
        if (v41 + v42 * 0.3 < v39) {
          double v39 = v41 + v42 * 0.3;
        }
      }
      id v37 = [v35 countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v37);
  }
  else
  {
    double v39 = 1.0;
  }

  double x = sub_27DE4(a2, a3, a10 / a11, a8, 0.5, v51, v25 + v28 * 0.5, v39);
  BOOL v47 = x > v25 || v43 > v27;
  BOOL v48 = v47 || x + v44 < v25 + v28;
  if (v48 || v43 + v45 < v27 + v29) {
LABEL_31:
  }
    double x = CGRectNull.origin.x;

  return x;
}

double NTKUltraCubeComputeIdealCoverageUnitCropUpOrientation(void *a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  id v24 = a2;
  double v28 = sub_27C74(a1, 0.0, 0.2);
  double v29 = v28 - v26 * a9;
  if (v29 < 0.0
    || ((double v30 = v25, v31 = a9 + a9 + 1.0, v32 = v25 - v27 * a9, v33 = v29 + v31 * v26, v32 >= 0.0)
      ? (BOOL v34 = v33 > 1.0)
      : (BOOL v34 = 1),
        !v34 ? (BOOL v35 = v32 + v31 * v27 > 1.0) : (BOOL v35 = 1),
        v35))
  {
    double x = CGRectNull.origin.x;
  }
  else
  {
    double v100 = a9 + a9 + 1.0;
    double v93 = a5;
    double v94 = a7;
    double v37 = a8;
    double v38 = a6 + a8;
    double v39 = v28 + v26 * 0.5;
    double v40 = (v39 + 0.0) / (a9 + 0.5);
    double v41 = (1.0 - v39) / (a9 + 0.5);
    if (v40 >= v41) {
      double v42 = v41;
    }
    else {
      double v42 = v40;
    }
    double v43 = a3 / a4 * (v42 / (a11 / a12));
    double v103 = a6 + a8;
    if (1.0 / (a9 * 2.0 + 1.0) >= v25 / (v38 + a9)) {
      double v44 = v25 / (v38 + a9);
    }
    else {
      double v44 = 1.0 / (a9 * 2.0 + 1.0);
    }
    if (v43 <= v44) {
      double v44 = a3 / a4 * (v42 / (a11 / a12));
    }
    else {
      double v42 = v42 * (v44 / v43);
    }
    double v45 = v28 + (v26 - v42) * 0.5;
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double height = CGRectNull.size.height;
    if (v45 > v28
      || ((v48 = v25 - v44 * v103, v112 = v28 + v26, v48 <= v25) ? (BOOL v49 = v45 + v42 < v28 + v26) : (BOOL v49 = 1), v49))
    {
      double v84 = CGRectNull.origin.x;
      double v85 = CGRectNull.origin.y;
      double width = CGRectNull.size.width;
      double v86 = width;
      double v87 = CGRectNull.size.height;
      double v91 = CGRectNull.origin.x;
    }
    else
    {
      double v105 = 8.0 / a4;
      double v99 = 1.0 - 8.0 / a3;
      double v111 = v25 + v27;
      double v50 = 1.0;
      double v102 = a9 + 1.0;
      CGFloat v88 = CGRectNull.size.height;
      double v89 = CGRectNull.size.width;
      double width = v89;
      CGFloat v90 = CGRectNull.origin.y;
      double v91 = CGRectNull.origin.x;
      double v86 = v89;
      double v87 = v88;
      double v84 = CGRectNull.origin.x;
      double v85 = v90;
      double v109 = v25;
      double v110 = v28;
      double v101 = v26;
      double v107 = a9;
      double v92 = v37;
      do
      {
        if (v48 + v44 < v111) {
          break;
        }
        double v52 = v48 <= v50 - v44 * v102 ? v48 : v50 - v44 * v102;
        double v53 = v45 - v42 * a9;
        double v104 = v42;
        if (v53 < 0.0
          || ((v54 = v53 + v100 * v42, v55 = v52 - v44 * a9, v55 >= 0.0) ? (BOOL v56 = v54 > v50) : (BOOL v56 = 1), v56))
        {
          double v67 = v44;
        }
        else
        {
          double v95 = height;
          double v96 = width;
          double v97 = y;
          double v98 = x;
          double v106 = -v44;
          double v57 = v100 * v44;
          double v58 = v45 + v42;
          double v59 = v45 + v93 * v42;
          double v60 = v94 * v42;
          double v61 = v37 * v44;
          while (1)
          {
            if (v57 + v55 > v50 || v45 > v28 || v52 > v30 || v58 < v112 || v44 + v52 < v111)
            {
              double v67 = v44;
LABEL_54:
              a9 = v107;
              double v37 = v92;
              double y = v97;
              double x = v98;
              double height = v95;
              double width = v96;
              goto LABEL_81;
            }
            double v66 = v45;
            double v67 = v44;
            objc_msgSend(v24, "coverageOfTimeLabel:", v59, v52 + a6 * v44, v60, v61);
            if (v68 < 0.185) {
              break;
            }
            double v52 = v52 - v105;
            double v55 = v52 + v106 * v107;
            double v30 = v109;
            double v28 = v110;
            double v50 = 1.0;
            double v45 = v66;
            double v44 = v67;
            if (v55 < 0.0) {
              goto LABEL_54;
            }
          }
          double y = v97;
          double x = v98;
          double height = v95;
          double width = v96;
          if (v68 >= 0.0925)
          {
            double x = v66;
            double y = v52;
            double width = v104;
            double height = v67;
          }
          else
          {
            BOOL v69 = v68 <= 0.0;
            if (v68 <= 0.0) {
              double v70 = v84;
            }
            else {
              double v70 = v66;
            }
            double v71 = v85;
            if (!v69) {
              double v71 = v52;
            }
            double v84 = v70;
            double v85 = v71;
            if (v69) {
              double v72 = v86;
            }
            else {
              double v72 = v104;
            }
            double v73 = v87;
            if (!v69) {
              double v73 = v67;
            }
            double v86 = v72;
            double v87 = v73;
            if (v69) {
              double v74 = v66;
            }
            else {
              double v74 = v91;
            }
            double v75 = v90;
            if (v69) {
              double v75 = v52;
            }
            CGFloat v90 = v75;
            double v91 = v74;
            if (v69) {
              double v76 = v104;
            }
            else {
              double v76 = v89;
            }
            double v77 = v88;
            if (v69) {
              double v77 = v67;
            }
            CGFloat v88 = v77;
            double v89 = v76;
          }
          a9 = v107;
          double v37 = v92;
        }
LABEL_81:
        v113.origin.double x = x;
        v113.origin.double y = y;
        v113.size.double width = width;
        v113.size.double height = height;
        if (!CGRectIsEmpty(v113)) {
          break;
        }
        double v42 = v99 * v104;
        double v44 = v99 * v67;
        double v30 = v109;
        double v28 = v110;
        double v48 = v109 - v99 * v67 * v103;
        double v45 = v110 + (v101 - v99 * v104) * 0.5;
        BOOL v78 = v45 > v110 || v48 > v109;
        BOOL v79 = v78 || v45 + v99 * v104 < v112;
        double v50 = 1.0;
      }
      while (!v79);
    }
    v114.origin.double x = x;
    v114.origin.double y = y;
    v114.size.double width = width;
    v114.size.double height = height;
    BOOL IsEmpty = CGRectIsEmpty(v114);
    if (IsEmpty)
    {
      double x = v84;
      double y = v85;
      CGFloat v81 = v86;
    }
    else
    {
      CGFloat v81 = width;
    }
    if (IsEmpty) {
      CGFloat v82 = v87;
    }
    else {
      CGFloat v82 = height;
    }
    v115.origin.double x = x;
    v115.origin.double y = y;
    v115.size.double width = v81;
    v115.size.double height = v82;
    if (CGRectIsEmpty(v115)) {
      double x = v91;
    }
  }

  return x;
}

BOOL sub_286C0(id a1, NTKUltraCubeContentEditOption *a2)
{
  return [(NTKUltraCubeContentEditOption *)a2 ultracubeContent] == 0;
}

void sub_28DBC(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 face];
  [v4 setResourceDirectory:v3];
}

void sub_28E1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 32) photosCount];
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    id v6 = v3;
  }
  else
  {
    double v7 = (void *)v5[2];
    id v6 = v3;
    if (v7)
    {
      id v6 = v7;

      double v8 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v6;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "setSelectedOptions: empty editor; resetting the resource directory back to the saved gallery version (%@)",
          (uint8_t *)&v10,
          0xCu);
      }

      id v5 = *(void **)(a1 + 32);
    }
  }
  double v9 = [v5 face];
  [v9 setResourceDirectory:v6];
}

uint64_t sub_290E8(uint64_t a1)
{
  return 0;
}

void sub_29424(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 32) photosCount];
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    id v6 = v3;
  }
  else
  {
    double v7 = (void *)v5[2];
    id v6 = v3;
    if (v7)
    {
      id v6 = v7;

      double v8 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        id v14 = v6;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "_setPhotos: empty editor; resetting the resource directory back to the saved gallery version (%@)",
          (uint8_t *)&v13,
          0xCu);
      }

      id v5 = *(void **)(a1 + 32);
    }
  }
  double v9 = [v5 face];
  [v9 setResourceDirectory:v6];

  int v10 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [*(id *)(a1 + 32) face];
    double v12 = [v11 resourceDirectory];
    int v13 = 138412290;
    id v14 = v12;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "updated preview directory for custom face to %@", (uint8_t *)&v13, 0xCu);
  }
}

void sub_29790(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) _updateUltraCubeSection];
    id v4 = [*(id *)(a1 + 32) face];
    [v4 setResourceDirectory:v3];

    id v5 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) face];
      double v7 = [v6 resourceDirectory];
      int v9 = 138412290;
      int v10 = v7;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "finalizeWithCompletion: new face resource directory is %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
}

id sub_29DE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (char *)[v3 unsignedIntegerValue];
  if ((unint64_t)(v4 - 1) > 3)
  {
    id v6 = 0;
  }
  else
  {
    id v5 = v4;
    id v6 = objc_opt_new();
    double v7 = [v3 stringValue];
    [v6 setIdentifier:v7];

    uint64_t v8 = +[NTKCompanionUltraCubeTimePlacementDataSource _labelTextForOption:v5 disambiguateLayers:*(unsigned __int8 *)(a1 + 32)];
    [v6 setLocalizedName:v8];

    int v9 = +[NTKCompanionUltraCubeTimePlacementDataSource _imageForOption:v5];
    objc_msgSend(v6, "setNtk_icon:", v9);

    objc_msgSend(v6, "setNtk_option:", v5);
    [v6 setEnabled:1];
  }

  return v6;
}

id sub_2ABC4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setDefaultLayoutRule:*(void *)(a1 + 40) forState:a2];
}

void sub_2ABD4(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) defaultLayoutRuleForState:a2];
  [v4 setVerticalLayout:3];
  [v4 setHorizontalLayout:1];
  [*(id *)(a1 + 32) setDefaultLayoutRule:v4 forState:a2];
  [v4 referenceFrame];
  CLKRectCenteredXInRectForDevice();
  objc_msgSend(v4, "setReferenceFrame:");
}

void sub_2B694(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Ultracube couldn't get preview %@", (uint8_t *)&v2, 0xCu);
}

void sub_2B70C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Ultracube couldn't get reset preview %@", (uint8_t *)&v2, 0xCu);
}

void sub_2B784(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "error enumerating UltraCube bundle resource directories: %@", (uint8_t *)&v2, 0xCu);
}

void sub_2B7FC(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Couldn't save preview at index %lu", (uint8_t *)&v2, 0xCu);
}

void sub_2B874(void *a1, void *a2, NSObject *a3)
{
  id v5 = [a1 resourceDirectoryURL];
  id v6 = [v5 lastPathComponent];
  double v7 = [a2 objectForKeyedSubscript:@"localIdentifier"];
  int v8 = 138412546;
  int v9 = v6;
  __int16 v10 = 2112;
  id v11 = v7;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: invalid image list item: %@", (uint8_t *)&v8, 0x16u);
}

void sub_2B954()
{
  sub_15E9C();
  sub_15EB0(&dword_0, v0, v1, "%s: bad color edit option: %@", v2, v3, v4, v5, 2u);
}

void sub_2B9C8()
{
  sub_15E9C();
  sub_15EB0(&dword_0, v0, v1, "%s: bad time alignment edit option: %@", v2, v3, v4, v5, 2u);
}

void sub_2BA3C()
{
  sub_15E9C();
  sub_15EB0(&dword_0, v0, v1, "%s: bad color effect edit option: %@", v2, v3, v4, v5, 2u);
}

void sub_2BAB0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "NTKUltraCubePhoto decodeFromDictionary: bad dictionary: %@", (uint8_t *)&v2, 0xCu);
}

void sub_2BB28(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Image List Item validation failed: %@", (uint8_t *)&v2, 0xCu);
}

void sub_2BBA0(void *a1, void *a2, NSObject *a3)
{
  int v5 = 134218240;
  id v6 = [a1 count];
  __int16 v7 = 2048;
  id v8 = [a2 count];
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "_fetchAssetsForNewPhotos: could only retrieve %ld assets for %ld local identifiers", (uint8_t *)&v5, 0x16u);
}

uint64_t BPSBridgeTintColor()
{
  return _BPSBridgeTintColor();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return _CGAffineTransformConcat(retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return _CGAffineTransformInvert(retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformScale(retstr, t, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return _CGBitmapContextCreate(data, width, height, bitsPerComponent, bytesPerRow, space, bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return _CGBitmapContextCreateImage(context);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return _CGColorSpaceGetNumberOfComponents(space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return _CGDataProviderCreateWithCFData(data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return _CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, bitmapInfo, provider, decode, shouldInterpolate, intent);
}

CGImageRef CGImageCreateCopy(CGImageRef image)
{
  return _CGImageCreateCopy(image);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return _CGImageCreateWithImageInRect(image, rect);
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return _CGImageCreateWithPNGDataProvider(source, decode, shouldInterpolate, intent);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

void CGImageDestinationAddImageAndMetadata(CGImageDestinationRef idst, CGImageRef image, CGImageMetadataRef metadata, CFDictionaryRef options)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return _CGImageDestinationCreateWithData(data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return _CGImageDestinationFinalize(idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return _CGImageGetAlphaInfo(image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return _CGImageGetBitmapInfo(image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return _CGImageGetBitsPerComponent(image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return _CGImageGetBitsPerPixel(image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return _CGImageGetColorSpace(image);
}

const CGFloat *__cdecl CGImageGetDecode(CGImageRef image)
{
  return _CGImageGetDecode(image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return _CGImageGetHeight(image);
}

CGColorRenderingIntent CGImageGetRenderingIntent(CGImageRef image)
{
  return _CGImageGetRenderingIntent(image);
}

BOOL CGImageGetShouldInterpolate(CGImageRef image)
{
  return _CGImageGetShouldInterpolate(image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return _CGImageGetWidth(image);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return _CGImageMetadataCreateMutable();
}

BOOL CGImageMetadataSetValueWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CFTypeRef value)
{
  return _CGImageMetadataSetValueWithPath(metadata, parent, path, value);
}

void CGImageRelease(CGImageRef image)
{
}

CFDictionaryRef CGImageSourceCopyAuxiliaryDataInfoAtIndex(CGImageSourceRef isrc, size_t index, CFStringRef auxiliaryImageDataType)
{
  return _CGImageSourceCopyAuxiliaryDataInfoAtIndex(isrc, index, auxiliaryImageDataType);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCreateImageAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithData(data, options);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  return _CGRectApplyAffineTransform(rect, t);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectOffset(rect, dx, dy);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

uint64_t CLKRectCenteredXInRectForDevice()
{
  return _CLKRectCenteredXInRectForDevice();
}

uint64_t CLKRectEqualsRect()
{
  return _CLKRectEqualsRect();
}

uint64_t CLKRoundForDevice()
{
  return _CLKRoundForDevice();
}

uint64_t CLKUIComputeDimmingRequiredToObtainImageAPL()
{
  return _CLKUIComputeDimmingRequiredToObtainImageAPL();
}

uint64_t CLKUIConvertToXRSRGBfFromRGBf()
{
  return _CLKUIConvertToXRSRGBfFromRGBf();
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return _CVPixelBufferCreate(allocator, width, height, pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBaseAddress(pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBytesPerRow(pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetHeight(pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetPixelFormatType(pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetWidth(pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return _CVPixelBufferLockBaseAddress(pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return _CVPixelBufferRetain(texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return _CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NTKAllUtilityLargeNarrowComplicationTypes()
{
  return _NTKAllUtilityLargeNarrowComplicationTypes();
}

uint64_t NTKAnalyzePhoto()
{
  return _NTKAnalyzePhoto();
}

uint64_t NTKCActionColor()
{
  return _NTKCActionColor();
}

uint64_t NTKCCustomizationLocalizedFormat()
{
  return _NTKCCustomizationLocalizedFormat();
}

uint64_t NTKCCustomizationLocalizedString()
{
  return _NTKCCustomizationLocalizedString();
}

uint64_t NTKCGImagePropertyOrientationToUIImageOrientation()
{
  return _NTKCGImagePropertyOrientationToUIImageOrientation();
}

uint64_t NTKClockFaceLocalizedString()
{
  return _NTKClockFaceLocalizedString();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return _NTKComplicationSlotDescriptor();
}

uint64_t NTKComplicationTypeRankedListWithDefaultTypes()
{
  return _NTKComplicationTypeRankedListWithDefaultTypes();
}

uint64_t NTKDefaultMonochromeColorMatrix()
{
  return _NTKDefaultMonochromeColorMatrix();
}

uint64_t NTKEnableAODVibrancy()
{
  return _NTKEnableAODVibrancy();
}

uint64_t NTKEnumerateComplicationStates()
{
  return _NTKEnumerateComplicationStates();
}

uint64_t NTKEqualObjects()
{
  return _NTKEqualObjects();
}

uint64_t NTKEqualStrings()
{
  return _NTKEqualStrings();
}

uint64_t NTKGenerateMonochromeColorMatrixFromImage()
{
  return _NTKGenerateMonochromeColorMatrixFromImage();
}

uint64_t NTKImageNamed()
{
  return _NTKImageNamed();
}

uint64_t NTKImagePresentationSize()
{
  return _NTKImagePresentationSize();
}

uint64_t NTKImagePresentationTransform()
{
  return _NTKImagePresentationTransform();
}

uint64_t NTKInternalBuild()
{
  return _NTKInternalBuild();
}

uint64_t NTKPHAssetsForLocalIdentifiers()
{
  return _NTKPHAssetsForLocalIdentifiers();
}

uint64_t NTKPhotosCanEncodeHEIC()
{
  return _NTKPhotosCanEncodeHEIC();
}

uint64_t NTKPhotosCreateResourceDirectory()
{
  return _NTKPhotosCreateResourceDirectory();
}

uint64_t NTKPhotosImageForURL()
{
  return _NTKPhotosImageForURL();
}

uint64_t NTKPhotosLinkURL()
{
  return _NTKPhotosLinkURL();
}

uint64_t NTKPhotosWriteImageListWithVersion()
{
  return _NTKPhotosWriteImageListWithVersion();
}

uint64_t NTKSmoothstep()
{
  return _NTKSmoothstep();
}

uint64_t NTKUIImageOrientationToCGImagePropertyOrientation()
{
  return _NTKUIImageOrientationToCGImagePropertyOrientation();
}

uint64_t NTKValidateDictionaryValue()
{
  return _NTKValidateDictionaryValue();
}

uint64_t NTKWrappedDateComplicationType()
{
  return _NTKWrappedDateComplicationType();
}

uint64_t PXClamp()
{
  return _PXClamp();
}

uint64_t PXRectGetCenter()
{
  return _PXRectGetCenter();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return _UIImageJPEGRepresentation(image, compressionQuality);
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return _UIRectCenteredIntegralRectScale();
}

uint64_t UIRectGetCenter()
{
  return _UIRectGetCenter();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NTKLoggingObjectForDomain()
{
  return __NTKLoggingObjectForDomain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return std::random_device::random_device(this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return std::random_device::operator()(this);
}

void operator delete(void *__p)
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
  return ___cxa_allocate_exception(thrown_size);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return _arc4random();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return [a1 CGContext];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_CGImageSource(void *a1, const char *a2, ...)
{
  return [a1 CGImageSource];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__KVOScrollViewKeys(void *a1, const char *a2, ...)
{
  return [a1 _KVOScrollViewKeys];
}

id objc_msgSend__allPhotosSelected(void *a1, const char *a2, ...)
{
  return [a1 _allPhotosSelected];
}

id objc_msgSend__applyColorEffect(void *a1, const char *a2, ...)
{
  return [a1 _applyColorEffect];
}

id objc_msgSend__applyContentEffect(void *a1, const char *a2, ...)
{
  return [a1 _applyContentEffect];
}

id objc_msgSend__applyPause(void *a1, const char *a2, ...)
{
  return [a1 _applyPause];
}

id objc_msgSend__classifyImage(void *a1, const char *a2, ...)
{
  return [a1 _classifyImage];
}

id objc_msgSend__clearDeprecationWarning(void *a1, const char *a2, ...)
{
  return [a1 _clearDeprecationWarning];
}

id objc_msgSend__cloneActiveContentView(void *a1, const char *a2, ...)
{
  return [a1 _cloneActiveContentView];
}

id objc_msgSend__computeSegmentationAuxiliaryDictionary(void *a1, const char *a2, ...)
{
  return [a1 _computeSegmentationAuxiliaryDictionary];
}

id objc_msgSend__computeThresholdAuxiliaryDictionaryIfEnabled(void *a1, const char *a2, ...)
{
  return [a1 _computeThresholdAuxiliaryDictionaryIfEnabled];
}

id objc_msgSend__currentOverrideDate(void *a1, const char *a2, ...)
{
  return [a1 _currentOverrideDate];
}

id objc_msgSend__currentSelectAllButton(void *a1, const char *a2, ...)
{
  return [a1 _currentSelectAllButton];
}

id objc_msgSend__defaultTextInsets(void *a1, const char *a2, ...)
{
  return [a1 _defaultTextInsets];
}

id objc_msgSend__digitalTimeLabelStyle(void *a1, const char *a2, ...)
{
  return [a1 _digitalTimeLabelStyle];
}

id objc_msgSend__extractDisparityData(void *a1, const char *a2, ...)
{
  return [a1 _extractDisparityData];
}

id objc_msgSend__extractPortraitEffectsMatteIfSupported(void *a1, const char *a2, ...)
{
  return [a1 _extractPortraitEffectsMatteIfSupported];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__fetchAssetsForResourceDirectoryPhotos(void *a1, const char *a2, ...)
{
  return [a1 _fetchAssetsForResourceDirectoryPhotos];
}

id objc_msgSend__hideLoadingSpinner(void *a1, const char *a2, ...)
{
  return [a1 _hideLoadingSpinner];
}

id objc_msgSend__hideNoPhotoUI(void *a1, const char *a2, ...)
{
  return [a1 _hideNoPhotoUI];
}

id objc_msgSend__hideShadowsAndGradients(void *a1, const char *a2, ...)
{
  return [a1 _hideShadowsAndGradients];
}

id objc_msgSend__identifySegmentationType(void *a1, const char *a2, ...)
{
  return [a1 _identifySegmentationType];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend__initDataAndOrientationFromAsset(void *a1, const char *a2, ...)
{
  return [a1 _initDataAndOrientationFromAsset];
}

id objc_msgSend__initFaceRectsByComputing(void *a1, const char *a2, ...)
{
  return [a1 _initFaceRectsByComputing];
}

id objc_msgSend__initFaceRectsFromAsset(void *a1, const char *a2, ...)
{
  return [a1 _initFaceRectsFromAsset];
}

id objc_msgSend__layoutImageView(void *a1, const char *a2, ...)
{
  return [a1 _layoutImageView];
}

id objc_msgSend__layoutSubLayers(void *a1, const char *a2, ...)
{
  return [a1 _layoutSubLayers];
}

id objc_msgSend__loadActiveViewIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _loadActiveViewIfNeeded];
}

id objc_msgSend__loadFaceRegions(void *a1, const char *a2, ...)
{
  return [a1 _loadFaceRegions];
}

id objc_msgSend__loadInitialCropPreview(void *a1, const char *a2, ...)
{
  return [a1 _loadInitialCropPreview];
}

id objc_msgSend__performFeedbackIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _performFeedbackIfNeeded];
}

id objc_msgSend__randomSampleResourceDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 _randomSampleResourceDirectoryPath];
}

id objc_msgSend__refreshActionRowContent(void *a1, const char *a2, ...)
{
  return [a1 _refreshActionRowContent];
}

id objc_msgSend__reorderViewsForPhoto(void *a1, const char *a2, ...)
{
  return [a1 _reorderViewsForPhoto];
}

id objc_msgSend__resourceDirectorySnapshotKey(void *a1, const char *a2, ...)
{
  return [a1 _resourceDirectorySnapshotKey];
}

id objc_msgSend__retrieveAuxiliaryDictionary(void *a1, const char *a2, ...)
{
  return [a1 _retrieveAuxiliaryDictionary];
}

id objc_msgSend__scrollToSelectedIndexPath(void *a1, const char *a2, ...)
{
  return [a1 _scrollToSelectedIndexPath];
}

id objc_msgSend__selectAllPhotos(void *a1, const char *a2, ...)
{
  return [a1 _selectAllPhotos];
}

id objc_msgSend__setDeprecationWarning(void *a1, const char *a2, ...)
{
  return [a1 _setDeprecationWarning];
}

id objc_msgSend__setup(void *a1, const char *a2, ...)
{
  return [a1 _setup];
}

id objc_msgSend__setupCellBackgroundImagesIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _setupCellBackgroundImagesIfNeeded];
}

id objc_msgSend__setupContainerButton(void *a1, const char *a2, ...)
{
  return [a1 _setupContainerButton];
}

id objc_msgSend__setupEventHandler(void *a1, const char *a2, ...)
{
  return [a1 _setupEventHandler];
}

id objc_msgSend__setupImageView(void *a1, const char *a2, ...)
{
  return [a1 _setupImageView];
}

id objc_msgSend__setupLayers(void *a1, const char *a2, ...)
{
  return [a1 _setupLayers];
}

id objc_msgSend__showLoadingLabel(void *a1, const char *a2, ...)
{
  return [a1 _showLoadingLabel];
}

id objc_msgSend__showNoPhotoUI(void *a1, const char *a2, ...)
{
  return [a1 _showNoPhotoUI];
}

id objc_msgSend__showShadowsAndGradients(void *a1, const char *a2, ...)
{
  return [a1 _showShadowsAndGradients];
}

id objc_msgSend__unloadActiveViews(void *a1, const char *a2, ...)
{
  return [a1 _unloadActiveViews];
}

id objc_msgSend__updateAddButton(void *a1, const char *a2, ...)
{
  return [a1 _updateAddButton];
}

id objc_msgSend__updateAllButtonStates(void *a1, const char *a2, ...)
{
  return [a1 _updateAllButtonStates];
}

id objc_msgSend__updateBadgeLayout(void *a1, const char *a2, ...)
{
  return [a1 _updateBadgeLayout];
}

id objc_msgSend__updateButtons(void *a1, const char *a2, ...)
{
  return [a1 _updateButtons];
}

id objc_msgSend__updateButtonsForSelectionChanged(void *a1, const char *a2, ...)
{
  return [a1 _updateButtonsForSelectionChanged];
}

id objc_msgSend__updateContents(void *a1, const char *a2, ...)
{
  return [a1 _updateContents];
}

id objc_msgSend__updateDoneButtonEnabledState(void *a1, const char *a2, ...)
{
  return [a1 _updateDoneButtonEnabledState];
}

id objc_msgSend__updateImage(void *a1, const char *a2, ...)
{
  return [a1 _updateImage];
}

id objc_msgSend__updateImageView(void *a1, const char *a2, ...)
{
  return [a1 _updateImageView];
}

id objc_msgSend__updateRingVisibility(void *a1, const char *a2, ...)
{
  return [a1 _updateRingVisibility];
}

id objc_msgSend__updateSelectedInfo(void *a1, const char *a2, ...)
{
  return [a1 _updateSelectedInfo];
}

id objc_msgSend__updateShareButton(void *a1, const char *a2, ...)
{
  return [a1 _updateShareButton];
}

id objc_msgSend__updateSubviewColors(void *a1, const char *a2, ...)
{
  return [a1 _updateSubviewColors];
}

id objc_msgSend__updateSubviewValues(void *a1, const char *a2, ...)
{
  return [a1 _updateSubviewValues];
}

id objc_msgSend__updateTitle(void *a1, const char *a2, ...)
{
  return [a1 _updateTitle];
}

id objc_msgSend__updateTransform(void *a1, const char *a2, ...)
{
  return [a1 _updateTransform];
}

id objc_msgSend__updateUltraCubeSection(void *a1, const char *a2, ...)
{
  return [a1 _updateUltraCubeSection];
}

id objc_msgSend__updateValueLabelVisibility(void *a1, const char *a2, ...)
{
  return [a1 _updateValueLabelVisibility];
}

id objc_msgSend__updateViewLayout(void *a1, const char *a2, ...)
{
  return [a1 _updateViewLayout];
}

id objc_msgSend_actionRow(void *a1, const char *a2, ...)
{
  return [a1 actionRow];
}

id objc_msgSend_addButton(void *a1, const char *a2, ...)
{
  return [a1 addButton];
}

id objc_msgSend_addSpinner(void *a1, const char *a2, ...)
{
  return [a1 addSpinner];
}

id objc_msgSend_adjustmentKey(void *a1, const char *a2, ...)
{
  return [a1 adjustmentKey];
}

id objc_msgSend_adjustmentLabelPlatterAlpha(void *a1, const char *a2, ...)
{
  return [a1 adjustmentLabelPlatterAlpha];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_alwaysShowValueWhenAdjustmentIsSelected(void *a1, const char *a2, ...)
{
  return [a1 alwaysShowValueWhenAdjustmentIsSelected];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_areaHistogramFilter(void *a1, const char *a2, ...)
{
  return [a1 areaHistogramFilter];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return [a1 ascender];
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return [a1 asset];
}

id objc_msgSend_attributeKey(void *a1, const char *a2, ...)
{
  return [a1 attributeKey];
}

id objc_msgSend_auxiliaryDictionary(void *a1, const char *a2, ...)
{
  return [a1 auxiliaryDictionary];
}

id objc_msgSend_auxiliaryDictionaryDescription(void *a1, const char *a2, ...)
{
  return [a1 auxiliaryDictionaryDescription];
}

id objc_msgSend_auxiliaryMaskImage(void *a1, const char *a2, ...)
{
  return [a1 auxiliaryMaskImage];
}

id objc_msgSend_backgroundContainerView(void *a1, const char *a2, ...)
{
  return [a1 backgroundContainerView];
}

id objc_msgSend_backgroundImage(void *a1, const char *a2, ...)
{
  return [a1 backgroundImage];
}

id objc_msgSend_backgroundImageURL(void *a1, const char *a2, ...)
{
  return [a1 backgroundImageURL];
}

id objc_msgSend_backgroundLayer(void *a1, const char *a2, ...)
{
  return [a1 backgroundLayer];
}

id objc_msgSend_badgeView(void *a1, const char *a2, ...)
{
  return [a1 badgeView];
}

id objc_msgSend_baseImageURL(void *a1, const char *a2, ...)
{
  return [a1 baseImageURL];
}

id objc_msgSend_baseline(void *a1, const char *a2, ...)
{
  return [a1 baseline];
}

id objc_msgSend_bgBrightness(void *a1, const char *a2, ...)
{
  return [a1 bgBrightness];
}

id objc_msgSend_bgHue(void *a1, const char *a2, ...)
{
  return [a1 bgHue];
}

id objc_msgSend_bgSaturation(void *a1, const char *a2, ...)
{
  return [a1 bgSaturation];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_boundingBox(void *a1, const char *a2, ...)
{
  return [a1 boundingBox];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return [a1 bundlePath];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_bytesPerRow(void *a1, const char *a2, ...)
{
  return [a1 bytesPerRow];
}

id objc_msgSend_canAddFace(void *a1, const char *a2, ...)
{
  return [a1 canAddFace];
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return [a1 capHeight];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_centerX(void *a1, const char *a2, ...)
{
  return [a1 centerX];
}

id objc_msgSend_centerY(void *a1, const char *a2, ...)
{
  return [a1 centerY];
}

id objc_msgSend_centeredView(void *a1, const char *a2, ...)
{
  return [a1 centeredView];
}

id objc_msgSend_circularIndicatorView(void *a1, const char *a2, ...)
{
  return [a1 circularIndicatorView];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_collection(void *a1, const char *a2, ...)
{
  return [a1 collection];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return [a1 collectionView];
}

id objc_msgSend_collectionViewLayout(void *a1, const char *a2, ...)
{
  return [a1 collectionViewLayout];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_colorEffect(void *a1, const char *a2, ...)
{
  return [a1 colorEffect];
}

id objc_msgSend_colorPalette(void *a1, const char *a2, ...)
{
  return [a1 colorPalette];
}

id objc_msgSend_complicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 complicationContainerView];
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return [a1 confidence];
}

id objc_msgSend_configureWithOpaqueBackground(void *a1, const char *a2, ...)
{
  return [a1 configureWithOpaqueBackground];
}

id objc_msgSend_containerButton(void *a1, const char *a2, ...)
{
  return [a1 containerButton];
}

id objc_msgSend_contentEffect(void *a1, const char *a2, ...)
{
  return [a1 contentEffect];
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return [a1 contentInset];
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return [a1 contentOffset];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_controlSize(void *a1, const char *a2, ...)
{
  return [a1 controlSize];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_crop(void *a1, const char *a2, ...)
{
  return [a1 crop];
}

id objc_msgSend_cropRect(void *a1, const char *a2, ...)
{
  return [a1 cropRect];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentLevel(void *a1, const char *a2, ...)
{
  return [a1 currentLevel];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentPreview(void *a1, const char *a2, ...)
{
  return [a1 currentPreview];
}

id objc_msgSend_currentValue(void *a1, const char *a2, ...)
{
  return [a1 currentValue];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return [a1 dataSource];
}

id objc_msgSend_dateComplicationFont(void *a1, const char *a2, ...)
{
  return [a1 dateComplicationFont];
}

id objc_msgSend_dateComplicationFrame(void *a1, const char *a2, ...)
{
  return [a1 dateComplicationFrame];
}

id objc_msgSend_defaultAnalysis(void *a1, const char *a2, ...)
{
  return [a1 defaultAnalysis];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultConfiguration];
}

id objc_msgSend_defaultLevel(void *a1, const char *a2, ...)
{
  return [a1 defaultLevel];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultValue(void *a1, const char *a2, ...)
{
  return [a1 defaultValue];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return [a1 descender];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didInteractWithCropView(void *a1, const char *a2, ...)
{
  return [a1 didInteractWithCropView];
}

id objc_msgSend_didPerformHapticFeedback(void *a1, const char *a2, ...)
{
  return [a1 didPerformHapticFeedback];
}

id objc_msgSend_disableActions(void *a1, const char *a2, ...)
{
  return [a1 disableActions];
}

id objc_msgSend_displayMappedValue(void *a1, const char *a2, ...)
{
  return [a1 displayMappedValue];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_editOptionSections(void *a1, const char *a2, ...)
{
  return [a1 editOptionSections];
}

id objc_msgSend_editor(void *a1, const char *a2, ...)
{
  return [a1 editor];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_encodeAsDictionary(void *a1, const char *a2, ...)
{
  return [a1 encodeAsDictionary];
}

id objc_msgSend_extent(void *a1, const char *a2, ...)
{
  return [a1 extent];
}

id objc_msgSend_externalAssets(void *a1, const char *a2, ...)
{
  return [a1 externalAssets];
}

id objc_msgSend_face(void *a1, const char *a2, ...)
{
  return [a1 face];
}

id objc_msgSend_faceDate(void *a1, const char *a2, ...)
{
  return [a1 faceDate];
}

id objc_msgSend_faceRects(void *a1, const char *a2, ...)
{
  return [a1 faceRects];
}

id objc_msgSend_faceVC(void *a1, const char *a2, ...)
{
  return [a1 faceVC];
}

id objc_msgSend_faceView(void *a1, const char *a2, ...)
{
  return [a1 faceView];
}

id objc_msgSend_feedbackGenerator(void *a1, const char *a2, ...)
{
  return [a1 feedbackGenerator];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_filters(void *a1, const char *a2, ...)
{
  return [a1 filters];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flexibleSpaceItem(void *a1, const char *a2, ...)
{
  return [a1 flexibleSpaceItem];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fontDescriptor];
}

id objc_msgSend_foregroundContainerView(void *a1, const char *a2, ...)
{
  return [a1 foregroundContainerView];
}

id objc_msgSend_foregroundImage(void *a1, const char *a2, ...)
{
  return [a1 foregroundImage];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_formatter(void *a1, const char *a2, ...)
{
  return [a1 formatter];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_galleryPreviewResourceDirectory(void *a1, const char *a2, ...)
{
  return [a1 galleryPreviewResourceDirectory];
}

id objc_msgSend_globalSession(void *a1, const char *a2, ...)
{
  return [a1 globalSession];
}

id objc_msgSend_hasAnimal(void *a1, const char *a2, ...)
{
  return [a1 hasAnimal];
}

id objc_msgSend_hasAuxiliaryDictionary(void *a1, const char *a2, ...)
{
  return [a1 hasAuxiliaryDictionary];
}

id objc_msgSend_hasChanges(void *a1, const char *a2, ...)
{
  return [a1 hasChanges];
}

id objc_msgSend_hasCityscape(void *a1, const char *a2, ...)
{
  return [a1 hasCityscape];
}

id objc_msgSend_hasNature(void *a1, const char *a2, ...)
{
  return [a1 hasNature];
}

id objc_msgSend_hasPeople(void *a1, const char *a2, ...)
{
  return [a1 hasPeople];
}

id objc_msgSend_hasSampleResourceDirectory(void *a1, const char *a2, ...)
{
  return [a1 hasSampleResourceDirectory];
}

id objc_msgSend_hasUserEverAddedFaceToLibrary(void *a1, const char *a2, ...)
{
  return [a1 hasUserEverAddedFaceToLibrary];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_iconName(void *a1, const char *a2, ...)
{
  return [a1 iconName];
}

id objc_msgSend_idealViewHeight(void *a1, const char *a2, ...)
{
  return [a1 idealViewHeight];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identityLevel(void *a1, const char *a2, ...)
{
  return [a1 identityLevel];
}

id objc_msgSend_identityValue(void *a1, const char *a2, ...)
{
  return [a1 identityValue];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageFilters(void *a1, const char *a2, ...)
{
  return [a1 imageFilters];
}

id objc_msgSend_imageList(void *a1, const char *a2, ...)
{
  return [a1 imageList];
}

id objc_msgSend_imageName(void *a1, const char *a2, ...)
{
  return [a1 imageName];
}

id objc_msgSend_imageOrientation(void *a1, const char *a2, ...)
{
  return [a1 imageOrientation];
}

id objc_msgSend_imageSource(void *a1, const char *a2, ...)
{
  return [a1 imageSource];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_imagesFilter(void *a1, const char *a2, ...)
{
  return [a1 imagesFilter];
}

id objc_msgSend_inGallery(void *a1, const char *a2, ...)
{
  return [a1 inGallery];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return [a1 index];
}

id objc_msgSend_indexPath(void *a1, const char *a2, ...)
{
  return [a1 indexPath];
}

id objc_msgSend_indexPathsForVisibleItems(void *a1, const char *a2, ...)
{
  return [a1 indexPathsForVisibleItems];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_instanceSegmentationMask(void *a1, const char *a2, ...)
{
  return [a1 instanceSegmentationMask];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidateComplicationLayout(void *a1, const char *a2, ...)
{
  return [a1 invalidateComplicationLayout];
}

id objc_msgSend_invalidateDigitalTimeLabelStyle(void *a1, const char *a2, ...)
{
  return [a1 invalidateDigitalTimeLabelStyle];
}

id objc_msgSend_invalidateLayout(void *a1, const char *a2, ...)
{
  return [a1 invalidateLayout];
}

id objc_msgSend_isAnimatingScroll(void *a1, const char *a2, ...)
{
  return [a1 isAnimatingScroll];
}

id objc_msgSend_isComplexBackground(void *a1, const char *a2, ...)
{
  return [a1 isComplexBackground];
}

id objc_msgSend_isDecelerating(void *a1, const char *a2, ...)
{
  return [a1 isDecelerating];
}

id objc_msgSend_isDragging(void *a1, const char *a2, ...)
{
  return [a1 isDragging];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return [a1 isEditing];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isFrozen(void *a1, const char *a2, ...)
{
  return [a1 isFrozen];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isInResourceDirectory(void *a1, const char *a2, ...)
{
  return [a1 isInResourceDirectory];
}

id objc_msgSend_isMultitoneOption(void *a1, const char *a2, ...)
{
  return [a1 isMultitoneOption];
}

id objc_msgSend_isOriginalColor(void *a1, const char *a2, ...)
{
  return [a1 isOriginalColor];
}

id objc_msgSend_isParallaxFlat(void *a1, const char *a2, ...)
{
  return [a1 isParallaxFlat];
}

id objc_msgSend_isRevertable(void *a1, const char *a2, ...)
{
  return [a1 isRevertable];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return [a1 isSelected];
}

id objc_msgSend_isThresholdMask(void *a1, const char *a2, ...)
{
  return [a1 isThresholdMask];
}

id objc_msgSend_isTimeElementFront(void *a1, const char *a2, ...)
{
  return [a1 isTimeElementFront];
}

id objc_msgSend_isTracking(void *a1, const char *a2, ...)
{
  return [a1 isTracking];
}

id objc_msgSend_isUserAdjusted(void *a1, const char *a2, ...)
{
  return [a1 isUserAdjusted];
}

id objc_msgSend_isUserModifying(void *a1, const char *a2, ...)
{
  return [a1 isUserModifying];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_isValidConfigurationToAddToLibrary(void *a1, const char *a2, ...)
{
  return [a1 isValidConfigurationToAddToLibrary];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return [a1 item];
}

id objc_msgSend_labelFontSize(void *a1, const char *a2, ...)
{
  return [a1 labelFontSize];
}

id objc_msgSend_lastAdjustedLevel(void *a1, const char *a2, ...)
{
  return [a1 lastAdjustedLevel];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layout(void *a1, const char *a2, ...)
{
  return [a1 layout];
}

id objc_msgSend_layoutDirection(void *a1, const char *a2, ...)
{
  return [a1 layoutDirection];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_layoutRule(void *a1, const char *a2, ...)
{
  return [a1 layoutRule];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localIdentifier];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_localizedSectionName(void *a1, const char *a2, ...)
{
  return [a1 localizedSectionName];
}

id objc_msgSend_localizedUppercaseString(void *a1, const char *a2, ...)
{
  return [a1 localizedUppercaseString];
}

id objc_msgSend_mask(void *a1, const char *a2, ...)
{
  return [a1 mask];
}

id objc_msgSend_maskImageURL(void *a1, const char *a2, ...)
{
  return [a1 maskImageURL];
}

id objc_msgSend_maskedImageZorder(void *a1, const char *a2, ...)
{
  return [a1 maskedImageZorder];
}

id objc_msgSend_maskedPhoto(void *a1, const char *a2, ...)
{
  return [a1 maskedPhoto];
}

id objc_msgSend_maxValue(void *a1, const char *a2, ...)
{
  return [a1 maxValue];
}

id objc_msgSend_maximumLevel(void *a1, const char *a2, ...)
{
  return [a1 maximumLevel];
}

id objc_msgSend_maximumValue(void *a1, const char *a2, ...)
{
  return [a1 maximumValue];
}

id objc_msgSend_maximumZoomRatio(void *a1, const char *a2, ...)
{
  return [a1 maximumZoomRatio];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_minValue(void *a1, const char *a2, ...)
{
  return [a1 minValue];
}

id objc_msgSend_minimumDisplaySize(void *a1, const char *a2, ...)
{
  return [a1 minimumDisplaySize];
}

id objc_msgSend_minimumLevel(void *a1, const char *a2, ...)
{
  return [a1 minimumLevel];
}

id objc_msgSend_minimumValue(void *a1, const char *a2, ...)
{
  return [a1 minimumValue];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return [a1 modificationDate];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return [a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_numberOfSections(void *a1, const char *a2, ...)
{
  return [a1 numberOfSections];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_optionName(void *a1, const char *a2, ...)
{
  return [a1 optionName];
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return [a1 orientation];
}

id objc_msgSend_originalColorName(void *a1, const char *a2, ...)
{
  return [a1 originalColorName];
}

id objc_msgSend_originalCrop(void *a1, const char *a2, ...)
{
  return [a1 originalCrop];
}

id objc_msgSend_outputImage(void *a1, const char *a2, ...)
{
  return [a1 outputImage];
}

id objc_msgSend_palette(void *a1, const char *a2, ...)
{
  return [a1 palette];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_performFeedback(void *a1, const char *a2, ...)
{
  return [a1 performFeedback];
}

id objc_msgSend_photo(void *a1, const char *a2, ...)
{
  return [a1 photo];
}

id objc_msgSend_photoImage(void *a1, const char *a2, ...)
{
  return [a1 photoImage];
}

id objc_msgSend_photoImageMasked(void *a1, const char *a2, ...)
{
  return [a1 photoImageMasked];
}

id objc_msgSend_photosCount(void *a1, const char *a2, ...)
{
  return [a1 photosCount];
}

id objc_msgSend_pigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 pigmentEditOption];
}

id objc_msgSend_pixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 pixelBuffer];
}

id objc_msgSend_pixelHeight(void *a1, const char *a2, ...)
{
  return [a1 pixelHeight];
}

id objc_msgSend_pixelWidth(void *a1, const char *a2, ...)
{
  return [a1 pixelWidth];
}

id objc_msgSend_placeholderTextColor(void *a1, const char *a2, ...)
{
  return [a1 placeholderTextColor];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return [a1 position];
}

id objc_msgSend_prepare(void *a1, const char *a2, ...)
{
  return [a1 prepare];
}

id objc_msgSend_prepareFeedback(void *a1, const char *a2, ...)
{
  return [a1 prepareFeedback];
}

id objc_msgSend_presentationSize(void *a1, const char *a2, ...)
{
  return [a1 presentationSize];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_previewProvider(void *a1, const char *a2, ...)
{
  return [a1 previewProvider];
}

id objc_msgSend_previewValidator(void *a1, const char *a2, ...)
{
  return [a1 previewValidator];
}

id objc_msgSend_progressLayer(void *a1, const char *a2, ...)
{
  return [a1 progressLayer];
}

id objc_msgSend_rectValue(void *a1, const char *a2, ...)
{
  return [a1 rectValue];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return [a1 redColor];
}

id objc_msgSend_referenceFrame(void *a1, const char *a2, ...)
{
  return [a1 referenceFrame];
}

id objc_msgSend_releaseCachedResources(void *a1, const char *a2, ...)
{
  return [a1 releaseCachedResources];
}

id objc_msgSend_reloadActionRow(void *a1, const char *a2, ...)
{
  return [a1 reloadActionRow];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_reloadVisibleCells(void *a1, const char *a2, ...)
{
  return [a1 reloadVisibleCells];
}

id objc_msgSend_removeAllIndexes(void *a1, const char *a2, ...)
{
  return [a1 removeAllIndexes];
}

id objc_msgSend_removeColorRamp(void *a1, const char *a2, ...)
{
  return [a1 removeColorRamp];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_resetToDefault(void *a1, const char *a2, ...)
{
  return [a1 resetToDefault];
}

id objc_msgSend_resetToDefaults(void *a1, const char *a2, ...)
{
  return [a1 resetToDefaults];
}

id objc_msgSend_resourceDirectory(void *a1, const char *a2, ...)
{
  return [a1 resourceDirectory];
}

id objc_msgSend_resourceDirectoryURL(void *a1, const char *a2, ...)
{
  return [a1 resourceDirectoryURL];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 reuseIdentifier];
}

id objc_msgSend_ringColor(void *a1, const char *a2, ...)
{
  return [a1 ringColor];
}

id objc_msgSend_rows(void *a1, const char *a2, ...)
{
  return [a1 rows];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 safeAreaInsets];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_screenCornerRadius(void *a1, const char *a2, ...)
{
  return [a1 screenCornerRadius];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_scrollDirection(void *a1, const char *a2, ...)
{
  return [a1 scrollDirection];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_segmentation(void *a1, const char *a2, ...)
{
  return [a1 segmentation];
}

id objc_msgSend_selectedAdjustmentInfo(void *a1, const char *a2, ...)
{
  return [a1 selectedAdjustmentInfo];
}

id objc_msgSend_selectedIndexPath(void *a1, const char *a2, ...)
{
  return [a1 selectedIndexPath];
}

id objc_msgSend_selectedOption(void *a1, const char *a2, ...)
{
  return [a1 selectedOption];
}

id objc_msgSend_selectedOptions(void *a1, const char *a2, ...)
{
  return [a1 selectedOptions];
}

id objc_msgSend_selectedOptionsForCustomEditModes(void *a1, const char *a2, ...)
{
  return [a1 selectedOptionsForCustomEditModes];
}

id objc_msgSend_selectionChanged(void *a1, const char *a2, ...)
{
  return [a1 selectionChanged];
}

id objc_msgSend_selectionFeedbackGenerator(void *a1, const char *a2, ...)
{
  return [a1 selectionFeedbackGenerator];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return [a1 setFill];
}

id objc_msgSend_setFrameUsingCurrentStyle(void *a1, const char *a2, ...)
{
  return [a1 setFrameUsingCurrentStyle];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_settingKey(void *a1, const char *a2, ...)
{
  return [a1 settingKey];
}

id objc_msgSend_shadowBrightness(void *a1, const char *a2, ...)
{
  return [a1 shadowBrightness];
}

id objc_msgSend_shadowHue(void *a1, const char *a2, ...)
{
  return [a1 shadowHue];
}

id objc_msgSend_shadowSaturation(void *a1, const char *a2, ...)
{
  return [a1 shadowSaturation];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedPhotoLibrary(void *a1, const char *a2, ...)
{
  return [a1 sharedPhotoLibrary];
}

id objc_msgSend_shouldDisplayControlValues(void *a1, const char *a2, ...)
{
  return [a1 shouldDisplayControlValues];
}

id objc_msgSend_shouldDisplayMappedValues(void *a1, const char *a2, ...)
{
  return [a1 shouldDisplayMappedValues];
}

id objc_msgSend_shouldDisplayValueLabel(void *a1, const char *a2, ...)
{
  return [a1 shouldDisplayValueLabel];
}

id objc_msgSend_shouldShowCircularRing(void *a1, const char *a2, ...)
{
  return [a1 shouldShowCircularRing];
}

id objc_msgSend_shouldShowValueLabel(void *a1, const char *a2, ...)
{
  return [a1 shouldShowValueLabel];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeClass(void *a1, const char *a2, ...)
{
  return [a1 sizeClass];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stateToContentMap(void *a1, const char *a2, ...)
{
  return [a1 stateToContentMap];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_storedSize(void *a1, const char *a2, ...)
{
  return [a1 storedSize];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_strokeColor(void *a1, const char *a2, ...)
{
  return [a1 strokeColor];
}

id objc_msgSend_strokeEnd(void *a1, const char *a2, ...)
{
  return [a1 strokeEnd];
}

id objc_msgSend_strokeWidth(void *a1, const char *a2, ...)
{
  return [a1 strokeWidth];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_subsampleFactor(void *a1, const char *a2, ...)
{
  return [a1 subsampleFactor];
}

id objc_msgSend_supportedComplicationSlots(void *a1, const char *a2, ...)
{
  return [a1 supportedComplicationSlots];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return [a1 systemYellowColor];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_tickMarkCount(void *a1, const char *a2, ...)
{
  return [a1 tickMarkCount];
}

id objc_msgSend_timeElementShadowColor(void *a1, const char *a2, ...)
{
  return [a1 timeElementShadowColor];
}

id objc_msgSend_timeElementUnitBaseline(void *a1, const char *a2, ...)
{
  return [a1 timeElementUnitBaseline];
}

id objc_msgSend_timeElementUnitHeight(void *a1, const char *a2, ...)
{
  return [a1 timeElementUnitHeight];
}

id objc_msgSend_timeElementZorder(void *a1, const char *a2, ...)
{
  return [a1 timeElementZorder];
}

id objc_msgSend_timeFormatter(void *a1, const char *a2, ...)
{
  return [a1 timeFormatter];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeLabelPosition(void *a1, const char *a2, ...)
{
  return [a1 timeLabelPosition];
}

id objc_msgSend_timeOffset(void *a1, const char *a2, ...)
{
  return [a1 timeOffset];
}

id objc_msgSend_toolbarItems(void *a1, const char *a2, ...)
{
  return [a1 toolbarItems];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_typeface(void *a1, const char *a2, ...)
{
  return [a1 typeface];
}

id objc_msgSend_ultracubeContent(void *a1, const char *a2, ...)
{
  return [a1 ultracubeContent];
}

id objc_msgSend_ultracubePhotosEditor(void *a1, const char *a2, ...)
{
  return [a1 ultracubePhotosEditor];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userState(void *a1, const char *a2, ...)
{
  return [a1 userState];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_valueLabel(void *a1, const char *a2, ...)
{
  return [a1 valueLabel];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return [a1 visibleCells];
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 weakToStrongObjectsMapTable];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}

id objc_msgSend_zoomScale(void *a1, const char *a2, ...)
{
  return [a1 zoomScale];
}