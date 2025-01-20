uint64_t CPS_LOG_CHANNEL_PREFIXClipUIServices()
{
  if (CPS_LOG_CHANNEL_PREFIXClipUIServices_onceToken != -1) {
    dispatch_once(&CPS_LOG_CHANNEL_PREFIXClipUIServices_onceToken, &__block_literal_global_0);
  }
  return CPS_LOG_CHANNEL_PREFIXClipUIServices_log;
}

void sub_1D858F984(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sendResult(void *a1, void *a2)
{
  id v7 = a1;
  v3 = a2;
  v4 = (void *)MEMORY[0x1E4F42A80];
  uint64_t v5 = [v7 CGImage];
  [v7 scale];
  v6 = objc_msgSend(v4, "imageWithCGImage:scale:orientation:", v5, 0);
  v3[2](v3, v6, [v7 placeholder]);
}

void sub_1D858FA9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D858FBEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1D858FCE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id makeAppStoreImageView()
{
  id v0 = objc_alloc(MEMORY[0x1E4F42AA0]);
  v1 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"appstore"];
  v2 = (void *)[v0 initWithImage:v1];

  v3 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F43880] scale:2];
  [v2 setPreferredSymbolConfiguration:v3];

  LODWORD(v4) = 1148846080;
  [v2 setContentHuggingPriority:0 forAxis:v4];
  LODWORD(v5) = 1148846080;
  [v2 setContentHuggingPriority:1 forAxis:v5];
  [v2 setContentMode:4];
  v6 = makeVibrant(v2, 1);

  return v6;
}

id makeVibrant(void *a1, uint64_t a2)
{
  v25[4] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F427D8];
  id v4 = a1;
  v24 = [v3 effectWithStyle:8];
  v23 = [MEMORY[0x1E4F42FE8] effectForBlurEffect:v24 style:a2];
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v23];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v17 = v5;
  v6 = [v5 contentView];
  [v6 addSubview:v4];
  v18 = (void *)MEMORY[0x1E4F28DC8];
  v22 = [v4 centerXAnchor];
  v21 = [v6 centerXAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v25[0] = v20;
  v19 = [v4 centerYAnchor];
  id v7 = [v6 centerYAnchor];
  v8 = [v19 constraintEqualToAnchor:v7];
  v25[1] = v8;
  v9 = [v4 leadingAnchor];
  v10 = [v6 leadingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v25[2] = v11;
  v12 = [v4 topAnchor];

  v13 = [v6 topAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v25[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
  [v18 activateConstraints:v15];

  return v17;
}

id makeChevronImageView()
{
  id v0 = objc_alloc(MEMORY[0x1E4F42AA0]);
  v1 = [MEMORY[0x1E4F42A80] systemImageNamed:@"chevron.forward"];
  v2 = (void *)[v0 initWithImage:v1];

  v3 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*MEMORY[0x1E4F43880] variant:1024];
  id v4 = [MEMORY[0x1E4F42A98] configurationWithFont:v3 scale:1];

  [v2 setPreferredSymbolConfiguration:v4];
  LODWORD(v5) = 1148846080;
  [v2 setContentHuggingPriority:0 forAxis:v5];
  LODWORD(v6) = 1148846080;
  [v2 setContentHuggingPriority:1 forAxis:v6];
  id v7 = makeVibrant(v2, 2);

  return v7;
}

void sub_1D8591164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D859170C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D85919E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D8591AF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D8592FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D85935C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1D85939E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1D8595CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPRXCardPreferredSizeClassForContainerBoundsSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)ProxCardKitLibrary();
  result = dlsym(v2, "PRXCardPreferredSizeClassForContainerBounds");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPRXCardPreferredSizeClassForContainerBoundsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

uint64_t ProxCardKitLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!ProxCardKitLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __ProxCardKitLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E6AE9068;
    uint64_t v4 = 0;
    ProxCardKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = ProxCardKitLibraryCore_frameworkLibrary;
  if (!ProxCardKitLibraryCore_frameworkLibrary) {
    ProxCardKitLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __ProxCardKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ProxCardKitLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getPRXCardPreferredSizeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)ProxCardKitLibrary();
  uint64_t result = dlsym(v2, "PRXCardPreferredSize");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPRXCardPreferredSizeSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t viewContainsAccessibilityElement(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  if (v3 && v4)
  {
    if (v3 == v4 || (objc_opt_respondsToSelector() & 1) != 0 && ([v5 isEqual:v3] & 1) != 0)
    {
      uint64_t v6 = 1;
    }
    else
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v7 = [v5 superview];
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          uint64_t v6 = 0;
          goto LABEL_13;
        }
        uint64_t v7 = [v5 accessibilityContainer];
      }
      v8 = (void *)v7;
      uint64_t v6 = viewContainsAccessibilityElement(v3, v7);
    }
  }
LABEL_13:

  return v6;
}

void sub_1D8598E08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D8598F04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D8598FFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D8599070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D85990E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D85991D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D85994C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D85995F8(_Unwind_Exception *exception_object)
{
}

void sub_1D85996AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D85997AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D8599A00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id inlineCardButtonFont(NSString *a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v1 = a1;
  id v2 = (id)*MEMORY[0x1E4F437B0];
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v2, v1) == NSOrderedAscending)
  {
    id v3 = (NSString *)v2;

    v1 = v3;
  }
  id v4 = [MEMORY[0x1E4F42F80] traitCollectionWithPreferredContentSizeCategory:v1];
  uint64_t v14 = *MEMORY[0x1E4F43940];
  uint64_t v5 = [NSNumber numberWithDouble:*MEMORY[0x1E4F43930]];
  v15[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];

  uint64_t v7 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438C8] compatibleWithTraitCollection:v4];
  uint64_t v12 = *MEMORY[0x1E4F43848];
  v13 = v6;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v9 = [v7 fontDescriptorByAddingAttributes:v8];

  v10 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v9 size:0.0];

  return v10;
}

void sub_1D8599C60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D859A18C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{
  _Unwind_Resume(a1);
}

void sub_1D859AFE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _Unwind_Exception *exception_objecta, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,void *a35,void *a36,void *a37,void *a38,void *a39,void *a40,void *a41,void *a42,void *a43,void *a44,void *a45,void *a46,void *a47,void *a48,void *a49,void *a50,void *a51,void *a52,void *a53,void *a54,void *a55,void *a56,void *a57,void *a58,void *a59,void *a60,void *a61,void *a62,void *a63)
{
  _Unwind_Resume(a1);
}

void sub_1D859B7C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D859C338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,_Unwind_Exception *exception_object,void *a35)
{
  _Unwind_Resume(a1);
}

void sub_1D859C91C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D859CD28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D859CDEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D859CF3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1D859D0B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D859D100()
{
}

void sub_1D859D198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D859D244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D859D38C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D859D52C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D859D8D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D859DB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1D859DDB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D859DFA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D859E3D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D859E4E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1D859E7D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1D859E888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D859E984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D859ED18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D859EF28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D859EFB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D859F2D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1D859F518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D859F5F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D859F710(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D859F840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D859F8EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D859F99C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D859FB34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D859FCC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D859FEF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D85A0004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D85A00B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D85A02F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D85A051C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D85A0608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D85A074C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D85A084C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

Class ___ZL36getUNNotificationSettingsCenterClassv_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  if (!UserNotificationsSettingsLibraryCore(char **)::frameworkLibrary)
  {
    v7[1] = (void *)MEMORY[0x1E4F143A8];
    v7[2] = (void *)3221225472;
    v7[3] = ___ZL36UserNotificationsSettingsLibraryCorePPc_block_invoke;
    v7[4] = &__block_descriptor_40_e5_v8__0l;
    v7[5] = v7;
    long long v8 = xmmword_1E6AE9358;
    uint64_t v9 = 0;
    UserNotificationsSettingsLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  if (!UserNotificationsSettingsLibraryCore(char **)::frameworkLibrary)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"void *UserNotificationsSettingsLibrary()"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"CPSLaunchContentViewController.mm", 44, @"%s", v7[0]);

    goto LABEL_10;
  }
  if (v7[0]) {
    free(v7[0]);
  }
  Class result = objc_getClass("UNNotificationSettingsCenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"Class getUNNotificationSettingsCenterClass()_block_invoke"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"CPSLaunchContentViewController.mm", 45, @"Unable to find class %s", "UNNotificationSettingsCenter");

LABEL_10:
    __break(1u);
  }
  getUNNotificationSettingsCenterClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1D85A0CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL36UserNotificationsSettingsLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UserNotificationsSettingsLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

Class ___ZL30getAMSAuthenticateOptionsClassv_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  if (!AppleMediaServicesLibraryCore(char **)::frameworkLibrary)
  {
    v7[1] = (void *)MEMORY[0x1E4F143A8];
    v7[2] = (void *)3221225472;
    v7[3] = ___ZL29AppleMediaServicesLibraryCorePPc_block_invoke;
    v7[4] = &__block_descriptor_40_e5_v8__0l;
    v7[5] = v7;
    long long v8 = xmmword_1E6AE9370;
    uint64_t v9 = 0;
    AppleMediaServicesLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  if (!AppleMediaServicesLibraryCore(char **)::frameworkLibrary)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"void *AppleMediaServicesLibrary()"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"CPSLaunchContentViewController.mm", 47, @"%s", v7[0]);

    goto LABEL_10;
  }
  if (v7[0]) {
    free(v7[0]);
  }
  Class result = objc_getClass("AMSAuthenticateOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"Class getAMSAuthenticateOptionsClass()_block_invoke"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"CPSLaunchContentViewController.mm", 48, @"Unable to find class %s", "AMSAuthenticateOptions");

LABEL_10:
    __break(1u);
  }
  getAMSAuthenticateOptionsClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1D85A0F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL29AppleMediaServicesLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleMediaServicesLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

void *___ZL44getCCUIAppLaunchOriginControlCenterSymbolLocv_block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!ControlCenterUIKitLibraryCore(char **)::frameworkLibrary)
  {
    v5[1] = (void *)MEMORY[0x1E4F143A8];
    v5[2] = (void *)3221225472;
    v5[3] = ___ZL29ControlCenterUIKitLibraryCorePPc_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E6AE9388;
    uint64_t v7 = 0;
    ControlCenterUIKitLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  uint64_t v2 = (void *)ControlCenterUIKitLibraryCore(char **)::frameworkLibrary;
  if (!ControlCenterUIKitLibraryCore(char **)::frameworkLibrary)
  {
    a1 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v2 = [NSString stringWithUTF8String:"void *ControlCenterUIKitLibrary()"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, @"CPSLaunchContentViewController.mm", 41, @"%s", v5[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v3 = v5[0];
  if (v5[0]) {
LABEL_7:
  }
    free(v3);
  uint64_t result = dlsym(v2, "CCUIAppLaunchOriginControlCenter");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  getCCUIAppLaunchOriginControlCenterSymbolLoc(void)::ptr = *(void *)(*(void *)(a1[4] + 8) + 24);
  return result;
}

void sub_1D85A11DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL29ControlCenterUIKitLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ControlCenterUIKitLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

void sub_1D85A2E38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void ProxCardKitLibrary_0()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!ProxCardKitLibraryCore_frameworkLibrary_0)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __ProxCardKitLibraryCore_block_invoke_0;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E6AE94D0;
    uint64_t v2 = 0;
    ProxCardKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!ProxCardKitLibraryCore_frameworkLibrary_0) {
    ProxCardKitLibrary_cold_1_0(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

void sub_1D85A5E4C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t __ProxCardKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  ProxCardKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getPRXFlowConfigurationClass_block_invoke(uint64_t a1)
{
  ProxCardKitLibrary_0();
  Class result = objc_getClass("PRXFlowConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRXFlowConfigurationClass_block_invoke_cold_1();
  }
  getPRXFlowConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPRXCardContainerViewControllerClass_block_invoke(uint64_t a1)
{
  ProxCardKitLibrary_0();
  Class result = objc_getClass("PRXCardContainerViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRXCardContainerViewControllerClass_block_invoke_cold_1();
  }
  getPRXCardContainerViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1D85A6D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCIImageClass_block_invoke(uint64_t a1)
{
  CoreImageLibrary();
  Class result = objc_getClass("CIImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCIImageClass_block_invoke_cold_1();
  }
  getCIImageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreImageLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!CoreImageLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __CoreImageLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E6AE9538;
    uint64_t v4 = 0;
    CoreImageLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = CoreImageLibraryCore_frameworkLibrary;
  if (!CoreImageLibraryCore_frameworkLibrary) {
    CoreImageLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __CoreImageLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreImageLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCIVectorClass_block_invoke(uint64_t a1)
{
  CoreImageLibrary();
  Class result = objc_getClass("CIVector");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCIVectorClass_block_invoke_cold_1();
  }
  getCIVectorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCIFilterClass_block_invoke(uint64_t a1)
{
  CoreImageLibrary();
  Class result = objc_getClass("CIFilter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCIFilterClass_block_invoke_cold_1();
  }
  getCIFilterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCIInputImageKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreImageLibrary();
  Class result = dlsym(v2, "kCIInputImageKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCIInputImageKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCIInputExtentKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreImageLibrary();
  Class result = dlsym(v2, "kCIInputExtentKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCIInputExtentKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ProxCardKitLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *ProxCardKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CPSProxCardAutoSizingView.m", 10, @"%s", *a1);

  __break(1u);
}

void ProxCardKitLibrary_cold_1_0(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *ProxCardKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CPSInlineCardViewController.m", 16, @"%s", *a1);

  __break(1u);
}

void __getPRXFlowConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRXFlowConfigurationClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CPSInlineCardViewController.m", 17, @"Unable to find class %s", "PRXFlowConfiguration");

  __break(1u);
}

void __getPRXCardContainerViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRXCardContainerViewControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CPSInlineCardViewController.m", 18, @"Unable to find class %s", "PRXCardContainerViewController");

  __break(1u);
}

void __getCIImageClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCIImageClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CPSUIImageExtras.m", 9, @"Unable to find class %s", "CIImage");

  __break(1u);
}

void CoreImageLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *CoreImageLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CPSUIImageExtras.m", 8, @"%s", *a1);

  __break(1u);
}

void __getCIVectorClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCIVectorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CPSUIImageExtras.m", 10, @"Unable to find class %s", "CIVector");

  __break(1u);
}

void __getCIFilterClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCIFilterClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CPSUIImageExtras.m", 11, @"Unable to find class %s", "CIFilter");

  __break(1u);
  AudioServicesCreateSystemSoundID(v2, v3);
}

OSStatus AudioServicesCreateSystemSoundID(CFURLRef inFileURL, SystemSoundID *outSystemSoundID)
{
  return MEMORY[0x1F40D4E10](inFileURL, outSystemSoundID);
}

OSStatus AudioServicesDisposeSystemSoundID(SystemSoundID inSystemSoundID)
{
  return MEMORY[0x1F40D4E28](*(void *)&inSystemSoundID);
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return MEMORY[0x1F40D4E48]();
}

uint64_t BSUIConstrainValueWithRubberBand()
{
  return MEMORY[0x1F410C700]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t CPSUsesDemoProgressFill()
{
  return MEMORY[0x1F4111B80]();
}

MKCoordinateRegion MKCoordinateRegionForMapRect(MKMapRect rect)
{
  MEMORY[0x1F40ECE18]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.span.longitudeDelta = v4;
  result.span.latitudeDelta = v3;
  result.center.longitude = v2;
  result.center.latitude = v1;
  return result;
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  MEMORY[0x1F40ECE48]((__n128)coordinate, *(__n128 *)&coordinate.longitude);
  result.y = v2;
  result.x = v1;
  return result;
}

MKMapRect MKMapRectUnion(MKMapRect rect1, MKMapRect rect2)
{
  MEMORY[0x1F40ECEA0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL UIAccessibilityButtonShapesEnabled(void)
{
  return MEMORY[0x1F4102B18]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1F4102B38]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1F4102B40]();
}

BOOL UIAccessibilityPrefersCrossFadeTransitions(void)
{
  return MEMORY[0x1F4102B68]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1F4102BB8](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4102BC0](category);
}

uint64_t UIPointRoundToScale()
{
  return MEMORY[0x1F4102D40]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x1F4102E10]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CPSLocalizedString()
{
  return MEMORY[0x1F4111B88]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t cps_networkUnavailableErrorLocalizedDescription()
{
  return MEMORY[0x1F4111B90]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1F40F3938](path);
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x1F40F39A8]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}