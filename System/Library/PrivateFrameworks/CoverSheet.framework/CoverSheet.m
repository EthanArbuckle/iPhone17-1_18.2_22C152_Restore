void sub_1D83A1CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a57, 8);
  _Unwind_Resume(a1);
}

void __49__CSDeviceUnblockPolicyEnvironment_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setIsUserRequestedEraseEnabled:", objc_msgSend(v3, "isUserRequestedEraseEnabled"));
  objc_msgSend(v4, "setIsUserFindMyAccountPresent:", objc_msgSend(*(id *)(a1 + 32), "isUserFindMyAccountPresent"));
  objc_msgSend(v4, "setIsDeviceInternetConnectionActive:", objc_msgSend(*(id *)(a1 + 32), "isDeviceInternetConnectionActive"));
  objc_msgSend(v4, "setIsPasscodeGracePeriodUsable:", objc_msgSend(*(id *)(a1 + 32), "isPasscodeGracePeriodUsable"));
}

void sub_1D83B5B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromCoverSheetTransitionType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"none";
  }
  else {
    return off_1E6AD8908[a1 - 1];
  }
}

__n128 CSCoverSheetTransitionContextMake@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)a3 = 0u;
  BSIntervalClip();
  *(void *)a3 = v6;
  __n128 result = *(__n128 *)a1;
  long long v8 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a3 + 8) = *(_OWORD *)a1;
  *(_OWORD *)(a3 + 24) = v8;
  *(void *)(a3 + 40) = a2;
  return result;
}

id NSStringFromCoverSheetTransitionContext(long long *a1)
{
  v2 = [MEMORY[0x1E4F4F718] builderWithObject:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  long long v3 = a1[1];
  long long v9 = *a1;
  long long v10 = v3;
  v7[2] = __NSStringFromCoverSheetTransitionContext_block_invoke;
  v7[3] = &unk_1E6AD88E8;
  id v8 = v2;
  long long v11 = a1[2];
  id v4 = v2;
  [v4 appendBodySectionWithName:@"CSCoverSheetTransitionContext" multilinePrefix:&stru_1F3020248 block:v7];
  v5 = [v4 build];

  return v5;
}

id __NSStringFromCoverSheetTransitionContext_block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendFloat:@"value" withName:*(double *)(a1 + 40)];
  long long v3 = *(void **)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 48);
  long long v8 = *(_OWORD *)(a1 + 64);
  id v4 = NSStringFromInterval();
  id v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, @"interval", v7, v8);

  return (id)[*(id *)(a1 + 32) appendInteger:*(void *)(a1 + 80) withName:@"mode"];
}

void sub_1D83BB068(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D83BC0B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1D83C1CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D83C25BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void SBStaticInitializer()
{
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    if ((SecTaskGetCodeSignStatus(v0) & 0xC000001) != 0x4000001 && (os_variant_has_internal_content() & 1) == 0) {
      SBStaticInitializer_cold_1();
    }
    CFRelease(v1);
  }
}

double CSMainPageListInsetXLandscapePhoneDeviceSpecific()
{
  int v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v3 = 0;
      int v4 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v119 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v119 userInterfaceIdiom] != 1)
    {
      int v3 = 0;
      int v4 = 1;
      goto LABEL_10;
    }
  }
  int v4 = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v120 = [MEMORY[0x1E4F42D90] mainScreen];
      [v120 _referenceBounds];
    }
    int v3 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v27 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v26 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      int v141 = v5 ^ 1;
      int v142 = v4;
      memset(v131, 0, sizeof(v131));
      memset(v130, 0, sizeof(v130));
      memset(v132, 0, sizeof(v132));
      long long v133 = 0uLL;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      int v140 = 0;
      int v127 = 0;
      int v134 = 0;
      uint64_t v123 = 0;
      uint64_t v124 = 0;
      int v135 = 0;
      int v136 = 0;
      uint64_t v122 = 0;
      int v16 = 0;
      int v137 = 0;
      int v138 = 0;
      uint64_t v121 = 0;
      int v17 = 0;
      int v18 = 0;
      int v139 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      double v23 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    int v3 = 0;
  }
LABEL_10:
  int v6 = __sb__runningInSpringBoard();
  int v141 = v3;
  int v142 = v4;
  if (v6)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v7 = 0;
      int v8 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v118 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v118 userInterfaceIdiom] != 1)
    {
      int v7 = 0;
      int v8 = 1;
      goto LABEL_19;
    }
  }
  int v8 = v6 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v110 = [MEMORY[0x1E4F42D90] mainScreen];
      [v110 _referenceBounds];
    }
    int v7 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v29 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      int v138 = v5 ^ 1;
      int v139 = v8;
      memset(v131, 0, sizeof(v131));
      memset(v130, 0, sizeof(v130));
      memset(v132, 0, sizeof(v132));
      long long v133 = 0uLL;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      int v140 = 0;
      int v127 = 0;
      int v134 = 0;
      uint64_t v123 = 0;
      uint64_t v124 = 0;
      int v135 = 0;
      int v136 = 0;
      uint64_t v122 = 0;
      int v16 = 0;
      int v137 = 0;
      uint64_t v121 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      double v23 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    int v7 = 0;
  }
LABEL_19:
  int v9 = __sb__runningInSpringBoard();
  int v138 = v7;
  int v139 = v8;
  if (v9)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v10 = 0;
      int v11 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    v117 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v117 userInterfaceIdiom] != 1)
    {
      int v10 = 0;
      int v11 = 1;
      goto LABEL_28;
    }
  }
  int v11 = v9 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v109 = [MEMORY[0x1E4F42D90] mainScreen];
      [v109 _referenceBounds];
    }
    int v10 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v30 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      int v136 = v5 ^ 1;
      int v137 = v11;
      memset(v131, 0, sizeof(v131));
      memset(v130, 0, sizeof(v130));
      memset(v132, 0, sizeof(v132));
      long long v133 = 0uLL;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      int v140 = 0;
      int v127 = 0;
      int v134 = 0;
      uint64_t v123 = 0;
      uint64_t v124 = 0;
      int v135 = 0;
      uint64_t v121 = 0;
      uint64_t v122 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      double v23 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    int v10 = 0;
  }
LABEL_28:
  int v12 = __sb__runningInSpringBoard();
  int v136 = v10;
  int v137 = v11;
  if (v12)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v1 = 0;
      uint64_t v13 = 0;
      goto LABEL_37;
    }
  }
  else
  {
    v116 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v116 userInterfaceIdiom] != 1)
    {
      uint64_t v1 = 0;
      uint64_t v13 = 1;
      goto LABEL_37;
    }
  }
  uint64_t v13 = v12 ^ 1u;
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v113 = [MEMORY[0x1E4F42D90] mainScreen];
    [v113 _referenceBounds];
  }
  uint64_t v1 = v5 ^ 1;
  BSSizeRoundForScale();
  if (v14 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    int v134 = v5 ^ 1;
    int v135 = v13;
    memset(v131, 0, sizeof(v131));
    memset(v130, 0, sizeof(v130));
    memset(v132, 0, sizeof(v132));
    long long v133 = 0uLL;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    int v140 = 0;
    int v127 = 0;
    uint64_t v123 = 0;
    uint64_t v124 = 0;
    uint64_t v121 = 0;
    uint64_t v122 = 0;
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    double v23 = 0.0;
    goto LABEL_67;
  }
LABEL_37:
  int v15 = __sb__runningInSpringBoard();
  int v134 = v1;
  int v135 = v13;
  if (v15)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v140 = 0;
      uint64_t v0 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    v115 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v115 userInterfaceIdiom] != 1)
    {
      int v140 = 0;
      uint64_t v0 = 1;
      goto LABEL_47;
    }
  }
  uint64_t v0 = v15 ^ 1u;
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v111 = [MEMORY[0x1E4F42D90] mainScreen];
    [v111 _referenceBounds];
  }
  int v140 = v5 ^ 1;
  BSSizeRoundForScale();
  if (v24 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    DWORD2(v133) = 0;
    HIDWORD(v133) = v0;
    memset(v131, 0, sizeof(v131));
    memset(v130, 0, sizeof(v130));
    memset(v132, 0, sizeof(v132));
    *(void *)&long long v133 = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    int v127 = 0;
    uint64_t v123 = 0;
    uint64_t v124 = 0;
    uint64_t v121 = 0;
    uint64_t v122 = 0;
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    double v23 = 0.0;
    goto LABEL_67;
  }
LABEL_47:
  int v25 = __sb__runningInSpringBoard();
  HIDWORD(v133) = v0;
  if (v25)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)((char *)&v133 + 4) = 0;
      goto LABEL_178;
    }
  }
  else
  {
    v114 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v114 userInterfaceIdiom] != 1)
    {
      *(void *)((char *)&v133 + 4) = 0x100000000;
      goto LABEL_178;
    }
  }
  DWORD2(v133) = v25 ^ 1;
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v108 = [MEMORY[0x1E4F42D90] mainScreen];
    [v108 _referenceBounds];
  }
  DWORD1(v133) = v5 ^ 1;
  BSSizeRoundForScale();
  if (v32 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    memset(v131, 0, sizeof(v131));
    memset(v130, 0, sizeof(v130));
    memset(v132, 0, sizeof(v132));
    LODWORD(v133) = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    int v127 = 0;
    uint64_t v123 = 0;
    uint64_t v124 = 0;
    uint64_t v121 = 0;
    uint64_t v122 = 0;
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    double v23 = 0.0;
    goto LABEL_67;
  }
LABEL_178:
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_180;
    }
LABEL_186:
    memset(v131, 0, sizeof(v131));
    memset(v130, 0, sizeof(v130));
    memset(v132, 0, sizeof(v132));
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    int v127 = 0;
    uint64_t v123 = 0;
    uint64_t v124 = 0;
    uint64_t v121 = 0;
    uint64_t v122 = 0;
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    double v23 = 0.0;
    LODWORD(v133) = v5 ^ 1;
    goto LABEL_67;
  }
  v112 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v112 userInterfaceIdiom] == 1) {
    goto LABEL_186;
  }
LABEL_180:
  LODWORD(v133) = v5 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_184:
    *(void *)v132 = 0;
    goto LABEL_194;
  }
  int v33 = __sb__runningInSpringBoard();
  if (v33)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_184;
    }
  }
  else
  {
    v106 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v106 userInterfaceIdiom])
    {
      *(void *)v132 = 1;
      goto LABEL_194;
    }
  }
  *(_DWORD *)v132 = v33 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v99 = [MEMORY[0x1E4F42D90] mainScreen];
      [v99 _referenceBounds];
    }
    *(_DWORD *)&v132[4] = v5 ^ 1;
    BSSizeRoundForScale();
    if (v36 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      memset(v131, 0, sizeof(v131));
      *(_DWORD *)&v132[8] = 0;
      memset(v130, 0, sizeof(v130));
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      int v127 = 0;
      uint64_t v123 = 0;
      uint64_t v124 = 0;
      uint64_t v121 = 0;
      uint64_t v122 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      double v23 = 136.0;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v132[4] = 0;
  }
LABEL_194:
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v131[36] = 0;
      *(_DWORD *)&v132[8] = 0;
      goto LABEL_204;
    }
  }
  else
  {
    v107 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v107 userInterfaceIdiom])
    {
      *(_DWORD *)&v131[36] = 0;
      *(_DWORD *)&v132[8] = 1;
      goto LABEL_204;
    }
  }
  *(_DWORD *)&v132[8] = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v102 = [MEMORY[0x1E4F42D90] mainScreen];
      [v102 _referenceBounds];
    }
    *(_DWORD *)&v131[36] = v5 ^ 1;
    BSSizeRoundForScale();
    if (v34 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_208;
    }
  }
  else
  {
    *(_DWORD *)&v131[36] = 0;
  }
LABEL_204:
  if (_SBF_Private_IsD94Like())
  {
    memset(v131, 0, 36);
    memset(v130, 0, sizeof(v130));
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    int v127 = 0;
    uint64_t v123 = 0;
    uint64_t v124 = 0;
    uint64_t v121 = 0;
    uint64_t v122 = 0;
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    double v23 = 129.0;
    goto LABEL_67;
  }
LABEL_208:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_212:
    *(void *)&v131[28] = 0;
    goto LABEL_222;
  }
  int v35 = __sb__runningInSpringBoard();
  if (v35)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_212;
    }
  }
  else
  {
    v103 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v103 userInterfaceIdiom])
    {
      *(_DWORD *)&v131[28] = 0;
      *(_DWORD *)&v131[32] = 1;
      goto LABEL_222;
    }
  }
  *(_DWORD *)&v131[32] = v35 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v94 = [MEMORY[0x1E4F42D90] mainScreen];
      [v94 _referenceBounds];
    }
    *(_DWORD *)&v131[28] = v5 ^ 1;
    BSSizeRoundForScale();
    if (v41 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      memset(v131, 0, 28);
      memset(v130, 0, sizeof(v130));
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      int v127 = 0;
      uint64_t v123 = 0;
      uint64_t v124 = 0;
      uint64_t v121 = 0;
      uint64_t v122 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      double v23 = 124.0;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v131[28] = 0;
  }
LABEL_222:
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v131[24] = 0;
      *(_DWORD *)&v131[16] = 0;
      goto LABEL_232;
    }
  }
  else
  {
    v105 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v105 userInterfaceIdiom])
    {
      *(_DWORD *)&v131[16] = 0;
      *(_DWORD *)&v131[24] = 1;
      goto LABEL_232;
    }
  }
  *(_DWORD *)&v131[24] = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v98 = [MEMORY[0x1E4F42D90] mainScreen];
      [v98 _referenceBounds];
    }
    *(_DWORD *)&v131[16] = v5 ^ 1;
    BSSizeRoundForScale();
    if (v37 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_236;
    }
  }
  else
  {
    *(_DWORD *)&v131[16] = 0;
  }
LABEL_232:
  if (_SBF_Private_IsD64Like())
  {
    *(_DWORD *)&v131[20] = 0;
    *(_OWORD *)v131 = 0uLL;
    memset(v130, 0, sizeof(v130));
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    int v127 = 0;
    uint64_t v123 = 0;
    uint64_t v124 = 0;
    uint64_t v121 = 0;
    uint64_t v122 = 0;
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    double v23 = 118.0;
    goto LABEL_67;
  }
LABEL_236:
  int v38 = __sb__runningInSpringBoard();
  if (v38)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v131[20] = 0;
      *(_DWORD *)&v131[12] = 0;
      goto LABEL_246;
    }
  }
  else
  {
    v104 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v104 userInterfaceIdiom])
    {
      *(_DWORD *)&v131[12] = 0;
      *(_DWORD *)&v131[20] = 1;
      goto LABEL_246;
    }
  }
  *(_DWORD *)&v131[20] = v38 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v39 = __sb__runningInSpringBoard();
    if (v39)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v95 = [MEMORY[0x1E4F42D90] mainScreen];
      [v95 _referenceBounds];
    }
    uint64_t v5 = v39 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v131[12] = v5;
    if (v40 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      *(void *)v131 = 0;
      memset(v130, 0, sizeof(v130));
      *(_DWORD *)&v131[8] = 0;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      int v127 = 0;
      uint64_t v123 = 0;
      uint64_t v124 = 0;
      uint64_t v121 = 0;
      uint64_t v122 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      double v23 = 124.0;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v131[12] = 0;
  }
LABEL_246:
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v131 = 0;
      *(_DWORD *)v130 = 0;
      goto LABEL_256;
    }
  }
  else
  {
    v101 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v101 userInterfaceIdiom])
    {
      *(_DWORD *)v130 = 0;
      *(_DWORD *)v131 = 1;
      goto LABEL_256;
    }
  }
  *(_DWORD *)v131 = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v93 = [MEMORY[0x1E4F42D90] mainScreen];
      [v93 _referenceBounds];
    }
    *(_DWORD *)v130 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v42 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_266;
    }
  }
  else
  {
    *(_DWORD *)v130 = 0;
  }
LABEL_256:
  if (_SBF_Private_IsD54())
  {
    *(void *)&v131[4] = 0;
    *(void *)&v130[4] = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    int v127 = 0;
    uint64_t v123 = 0;
    uint64_t v124 = 0;
    uint64_t v121 = 0;
    uint64_t v122 = 0;
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    double v23 = 118.0;
    goto LABEL_67;
  }
LABEL_266:
  int v43 = __sb__runningInSpringBoard();
  if (v43)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v131[4] = 0;
      goto LABEL_276;
    }
  }
  else
  {
    v100 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v100 userInterfaceIdiom])
    {
      *(_DWORD *)&v131[4] = 0;
      *(_DWORD *)&v131[8] = 1;
      goto LABEL_276;
    }
  }
  *(_DWORD *)&v131[8] = v43 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v44 = __sb__runningInSpringBoard();
    if (v44)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v90 = [MEMORY[0x1E4F42D90] mainScreen];
      [v90 _referenceBounds];
    }
    uint64_t v5 = v44 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v131[4] = v5;
    if (v45 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(void *)&v130[4] = 0;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      int v127 = 0;
      uint64_t v123 = 0;
      uint64_t v124 = 0;
      uint64_t v121 = 0;
      uint64_t v122 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      double v23 = 118.0;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v131[4] = 0;
  }
LABEL_276:
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v130[4] = 0;
      goto LABEL_286;
    }
  }
  else
  {
    v97 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v97 userInterfaceIdiom])
    {
      *(_DWORD *)&v130[4] = 0;
      *(_DWORD *)&v130[8] = 1;
      goto LABEL_286;
    }
  }
  *(_DWORD *)&v130[8] = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v89 = [MEMORY[0x1E4F42D90] mainScreen];
      [v89 _referenceBounds];
    }
    *(_DWORD *)&v130[4] = v5 ^ 1;
    BSSizeRoundForScale();
    if (v46 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_295;
    }
  }
  else
  {
    *(_DWORD *)&v130[4] = 0;
  }
LABEL_286:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    int v127 = 0;
    uint64_t v123 = 0;
    uint64_t v124 = 0;
    uint64_t v121 = 0;
    uint64_t v122 = 0;
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    double v23 = 118.0;
    goto LABEL_67;
  }
LABEL_295:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_299:
    uint64_t v128 = 0;
    goto LABEL_306;
  }
  int v47 = __sb__runningInSpringBoard();
  if (v47)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_299;
    }
  }
  else
  {
    v92 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v92 userInterfaceIdiom])
    {
      uint64_t v128 = 0x100000000;
      goto LABEL_306;
    }
  }
  HIDWORD(v128) = v47 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v48 = __sb__runningInSpringBoard();
    if (v48)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v81 = [MEMORY[0x1E4F42D90] mainScreen];
      [v81 _referenceBounds];
    }
    uint64_t v5 = v48 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v128) = v5;
    if (v53 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      uint64_t v129 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      int v127 = 0;
      uint64_t v123 = 0;
      uint64_t v124 = 0;
      uint64_t v121 = 0;
      uint64_t v122 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      double v23 = 144.0;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v128) = 0;
  }
LABEL_306:
  int v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v129) = 0;
      uint64_t v5 = 0;
      goto LABEL_316;
    }
  }
  else
  {
    v96 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v96 userInterfaceIdiom])
    {
      uint64_t v5 = 0;
      HIDWORD(v129) = 1;
      goto LABEL_316;
    }
  }
  HIDWORD(v129) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v50 = __sb__runningInSpringBoard();
    if (v50)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v86 = [MEMORY[0x1E4F42D90] mainScreen];
      [v86 _referenceBounds];
    }
    uint64_t v5 = v50 ^ 1u;
    BSSizeRoundForScale();
    if (v51 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_320;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
LABEL_316:
  if (_SBF_Private_IsD93Like())
  {
    LODWORD(v129) = v5;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    int v127 = 0;
    uint64_t v123 = 0;
    uint64_t v124 = 0;
    uint64_t v121 = 0;
    uint64_t v122 = 0;
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    double v23 = 93.0;
    goto LABEL_67;
  }
LABEL_320:
  LODWORD(v129) = v5;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_324:
    uint64_t v126 = 0;
    goto LABEL_334;
  }
  int v52 = __sb__runningInSpringBoard();
  if (v52)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_324;
    }
  }
  else
  {
    v87 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v87 userInterfaceIdiom])
    {
      uint64_t v126 = 0x100000000;
      goto LABEL_334;
    }
  }
  HIDWORD(v126) = v52 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v0 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v0 _referenceBounds];
    }
    v83 = (void *)v0;
    LODWORD(v126) = v5 ^ 1;
    BSSizeRoundForScale();
    if (v59 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v127 = 0;
      uint64_t v125 = 0;
      uint64_t v123 = 0;
      uint64_t v124 = 0;
      uint64_t v121 = 0;
      uint64_t v122 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      double v23 = 135.0;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v126) = 0;
  }
LABEL_334:
  uint64_t v5 = __sb__runningInSpringBoard();
  uint64_t v0 = (uint64_t)&off_1D8504000;
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v127 = 0;
      HIDWORD(v125) = 0;
      goto LABEL_344;
    }
  }
  else
  {
    v91 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v91 userInterfaceIdiom])
    {
      HIDWORD(v125) = 0;
      int v127 = 1;
      goto LABEL_344;
    }
  }
  int v127 = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v80 = [MEMORY[0x1E4F42D90] mainScreen];
      [v80 _referenceBounds];
    }
    HIDWORD(v125) = v5 ^ 1;
    BSSizeRoundForScale();
    if (v54 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_348;
    }
  }
  else
  {
    HIDWORD(v125) = 0;
  }
LABEL_344:
  if (_SBF_Private_IsD63Like())
  {
    LODWORD(v125) = 0;
    uint64_t v123 = 0;
    uint64_t v124 = 0;
    uint64_t v121 = 0;
    uint64_t v122 = 0;
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    double v23 = 87.0;
    goto LABEL_67;
  }
LABEL_348:
  int v55 = __sb__runningInSpringBoard();
  if (v55)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v125) = 0;
      LODWORD(v123) = 0;
      goto LABEL_358;
    }
  }
  else
  {
    v88 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v88 userInterfaceIdiom])
    {
      LODWORD(v123) = 0;
      LODWORD(v125) = 1;
      goto LABEL_358;
    }
  }
  LODWORD(v125) = v55 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v56 = __sb__runningInSpringBoard();
    if (v56)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v13 _referenceBounds];
    }
    v84 = (void *)v13;
    uint64_t v5 = v56 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v123) = v5;
    if (v57 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      uint64_t v124 = 0;
      HIDWORD(v123) = 0;
      uint64_t v121 = 0;
      uint64_t v122 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      uint64_t v58 = 0x405F000000000000;
LABEL_373:
      double v23 = *(double *)&v58;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v123) = 0;
  }
LABEL_358:
  uint64_t v5 = __sb__runningInSpringBoard();
  uint64_t v1 = (uint64_t)&off_1D8504000;
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v124 = 0;
      goto LABEL_368;
    }
  }
  else
  {
    v85 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v85 userInterfaceIdiom])
    {
      uint64_t v124 = 0x100000000;
      goto LABEL_368;
    }
  }
  HIDWORD(v124) = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v78 = [MEMORY[0x1E4F42D90] mainScreen];
      [v78 _referenceBounds];
    }
    LODWORD(v124) = v5 ^ 1;
    BSSizeRoundForScale();
    if (v60 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_379;
    }
  }
  else
  {
    LODWORD(v124) = 0;
  }
LABEL_368:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    HIDWORD(v123) = 0;
    uint64_t v121 = 0;
    uint64_t v122 = 0;
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    double v23 = 118.0;
    goto LABEL_67;
  }
LABEL_379:
  int v61 = __sb__runningInSpringBoard();
  if (v61)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v123) = 0;
      HIDWORD(v122) = 0;
      goto LABEL_389;
    }
  }
  else
  {
    v82 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v82 userInterfaceIdiom])
    {
      HIDWORD(v122) = 0;
      HIDWORD(v123) = 1;
      goto LABEL_389;
    }
  }
  HIDWORD(v123) = v61 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v77 = [MEMORY[0x1E4F42D90] mainScreen];
      [v77 _referenceBounds];
    }
    HIDWORD(v122) = v5 ^ 1;
    BSSizeRoundForScale();
    if (v62 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      LODWORD(v122) = 0;
      int v16 = 0;
      uint64_t v121 = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      double v23 = 135.0;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v122) = 0;
  }
LABEL_389:
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v122) = 0;
      int v16 = 0;
      goto LABEL_399;
    }
  }
  else
  {
    v79 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v79 userInterfaceIdiom])
    {
      int v16 = 0;
      LODWORD(v122) = 1;
      goto LABEL_399;
    }
  }
  LODWORD(v122) = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v76 = [MEMORY[0x1E4F42D90] mainScreen];
      [v76 _referenceBounds];
    }
    int v16 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v63 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_406;
    }
  }
  else
  {
    int v16 = 0;
  }
LABEL_399:
  if (_SBF_Private_IsD53())
  {
LABEL_400:
    uint64_t v121 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    double v23 = 87.0;
    goto LABEL_67;
  }
LABEL_406:
  if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
  {
    uint64_t v121 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    double v23 = 118.0;
    goto LABEL_67;
  }
  if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16()) {
    goto LABEL_400;
  }
  double v23 = 118.0;
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    uint64_t v121 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    goto LABEL_67;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    uint64_t v121 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
LABEL_415:
    double v23 = 87.0;
    goto LABEL_67;
  }
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v121 = 0;
      goto LABEL_426;
    }
  }
  else
  {
    v75 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v75 userInterfaceIdiom])
    {
      uint64_t v121 = 0x100000000;
      goto LABEL_426;
    }
  }
  HIDWORD(v121) = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v0 = __sb__runningInSpringBoard();
    if (v0)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v72 = [MEMORY[0x1E4F42D90] mainScreen];
      [v72 _referenceBounds];
    }
    LODWORD(v121) = v0 ^ 1;
    BSSizeRoundForScale();
    if (v67 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v121) = 0;
  }
LABEL_426:
  int v64 = __sb__runningInSpringBoard();
  if (v64)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v17 = 0;
      int v18 = 0;
      goto LABEL_436;
    }
  }
  else
  {
    v74 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v74 userInterfaceIdiom])
    {
      int v18 = 0;
      int v17 = 1;
      goto LABEL_436;
    }
  }
  int v17 = v64 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v0 = __sb__runningInSpringBoard();
    if (v0)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v71 = [MEMORY[0x1E4F42D90] mainScreen];
      [v71 _referenceBounds];
    }
    int v18 = v0 ^ 1;
    BSSizeRoundForScale();
    if (v68 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      goto LABEL_415;
    }
  }
  else
  {
    int v18 = 0;
  }
LABEL_436:
  uint64_t v0 = __sb__runningInSpringBoard();
  if (v0)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v19 = 0;
      int v20 = 0;
      goto LABEL_446;
    }
  }
  else
  {
    v73 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v73 userInterfaceIdiom])
    {
      int v20 = 0;
      int v19 = 1;
      goto LABEL_446;
    }
  }
  int v19 = v0 ^ 1;
  uint64_t v0 = __sb__runningInSpringBoard();
  if (v0)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v5 _referenceBounds];
  }
  int v20 = v0 ^ 1;
  BSSizeRoundForScale();
  if (v65 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
  {
    int v21 = 0;
    int v22 = 0;
    uint64_t v66 = 0x4046000000000000;
    goto LABEL_453;
  }
LABEL_446:
  uint64_t v1 = __sb__runningInSpringBoard();
  if (v1)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v21 = 0;
      int v22 = 0;
      uint64_t v66 = 0x4044000000000000;
LABEL_453:
      double v23 = *(double *)&v66;
      goto LABEL_67;
    }
    goto LABEL_460;
  }
  uint64_t v0 = [MEMORY[0x1E4F42948] currentDevice];
  if ([(id)v0 userInterfaceIdiom])
  {
    int v22 = 0;
    int v21 = 1;
    uint64_t v58 = 0x4044000000000000;
    goto LABEL_373;
  }
LABEL_460:
  int v21 = v1 ^ 1;
  int v69 = __sb__runningInSpringBoard();
  if (v69)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v1 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v1 _referenceBounds];
  }
  int v22 = v69 ^ 1;
  BSSizeRoundForScale();
  if (v70 < *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    double v23 = 40.0;
  }
  else {
    double v23 = 69.0;
  }
LABEL_67:
  if (v22) {

  }
  if (v21) {
  if (v20)
  }

  if (v19) {
  if (v18)
  }

  if (v17) {
  if (v121)
  }

  if (HIDWORD(v121)) {
  if (v16)
  }

  if (v122) {
  if (HIDWORD(v122))
  }

  if (HIDWORD(v123)) {
  if (v124)
  }

  if (HIDWORD(v124)) {
  if (v123)
  }

  if (v125) {
  if (HIDWORD(v125))
  }

  if (v127) {
  if (v126)
  }

  if (HIDWORD(v126)) {
  if (v129)
  }

  if (HIDWORD(v129)) {
  if (v128)
  }

  if (HIDWORD(v128)) {
  if (*(_DWORD *)&v130[4])
  }

  if (*(_DWORD *)&v130[8]) {
  if (*(_DWORD *)&v131[4])
  }

  if (*(_DWORD *)&v131[8]) {
  if (*(_DWORD *)v130)
  }

  if (*(_DWORD *)v131) {
  if (*(_DWORD *)&v131[12])
  }

  if (*(_DWORD *)&v131[20]) {
  if (*(_DWORD *)&v131[16])
  }

  if (*(_DWORD *)&v131[24]) {
  if (*(_DWORD *)&v131[28])
  }

  if (*(_DWORD *)&v131[32]) {
  if (*(_DWORD *)&v131[36])
  }

  if (*(_DWORD *)&v132[8]) {
  if (*(_DWORD *)&v132[4])
  }

  if (*(_DWORD *)v132) {
  if (v133)
  }

  if (DWORD1(v133)) {
  if (DWORD2(v133))
  }

  if (v140) {
  if (HIDWORD(v133))
  }
  {

    if (!v134) {
      goto LABEL_157;
    }
  }
  else if (!v134)
  {
LABEL_157:
    if (v135) {
      goto LABEL_158;
    }
    goto LABEL_168;
  }

  if (v135)
  {
LABEL_158:

    if (!v136) {
      goto LABEL_159;
    }
    goto LABEL_169;
  }
LABEL_168:
  if (!v136)
  {
LABEL_159:
    if (v137) {
      goto LABEL_160;
    }
    goto LABEL_170;
  }
LABEL_169:

  if (v137)
  {
LABEL_160:

    if (!v138) {
      goto LABEL_161;
    }
    goto LABEL_171;
  }
LABEL_170:
  if (!v138)
  {
LABEL_161:
    if (v139) {
      goto LABEL_162;
    }
    goto LABEL_172;
  }
LABEL_171:

  if (v139)
  {
LABEL_162:

    if (!v141) {
      goto LABEL_163;
    }
LABEL_173:

    if (!v142) {
      return v23;
    }
    goto LABEL_164;
  }
LABEL_172:
  if (v141) {
    goto LABEL_173;
  }
LABEL_163:
  if (v142) {
LABEL_164:
  }

  return v23;
}

void sub_1D83CA53C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D83CFD70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D83D22BC(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;
  objc_destroyWeak(v5);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_1D83D5AC0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 144));
  _Unwind_Resume(a1);
}

id getCSProminentLayoutControllerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCSProminentLayoutControllerClass_softClass;
  uint64_t v7 = getCSProminentLayoutControllerClass_softClass;
  if (!getCSProminentLayoutControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCSProminentLayoutControllerClass_block_invoke;
    v3[3] = &unk_1E6AD94F0;
    v3[4] = &v4;
    __getCSProminentLayoutControllerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1D83D5DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D83DBFE0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

id __BSSafeCast(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (a2)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

void sub_1D83E081C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1D83E89D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D83EB618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D83ED844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D83F271C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id a31)
{
}

void sub_1D83F5778(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1D83F6234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D83F6810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D83F7344(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_1D83F7AB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D83F8424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
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

Class __getCSProminentLayoutControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoverSheetKitLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __CoverSheetKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6AD9510;
    uint64_t v5 = 0;
    CoverSheetKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoverSheetKitLibraryCore_frameworkLibrary) {
    __getCSProminentLayoutControllerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CSProminentLayoutController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCSProminentLayoutControllerClass_block_invoke_cold_2();
  }
  getCSProminentLayoutControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoverSheetKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoverSheetKitLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

void sub_1D840B2C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D840BC00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
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

void sub_1D840C9C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1D842BC90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t CSFeatureEnabled(uint64_t a1)
{
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 8:
      goto LABEL_5;
    case 7:
      if (_os_feature_enabled_impl())
      {
        uint64_t result = 1;
      }
      else
      {
LABEL_5:
        uint64_t result = _os_feature_enabled_impl();
      }
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t CSAutobahnEnabledForPlatform()
{
  if (CSAutobahnEnabledForPlatform_onceToken != -1) {
    dispatch_once(&CSAutobahnEnabledForPlatform_onceToken, &__block_literal_global_5);
  }
  return CSAutobahnEnabledForPlatform_enabled;
}

uint64_t __CSAutobahnEnabledForPlatform_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  uint64_t result = CSFeatureEnabled(2 * ((v1 & 0xFFFFFFFFFFFFFFFBLL) == 1));
  CSAutobahnEnabledForPlatform_enabled = result;
  return result;
}

void sub_1D8434FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id tribeca_supported_text()
{
  if (tribeca_supported_text_token != -1) {
    dispatch_once(&tribeca_supported_text_token, &__block_literal_global_102);
  }
  uint64_t v0 = (void *)tribeca_supported_text_text;

  return v0;
}

void __tribeca_supported_text_block_invoke()
{
  if (!aks_bak_get_beacon())
  {
    uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28B50]), "_initUniqueWithPath:", @"/System/Library/PrivateFrameworks/FindMyBeaconingSupport.framework", 0);
    uint64_t v1 = v0;
    if (v0)
    {
      uint64_t v2 = [v0 localizedStringForKey:@"E786CC8A-FAD0-49DB-9460-F27F248521CD" value:&stru_1F3020248 table:0];
      id v3 = v2;
      if (v2)
      {
        if ([v2 length]) {
          objc_storeStrong((id *)&tribeca_supported_text_text, v3);
        }
      }
    }
  }
}

BOOL -[CSMagSafeAccessory _blocksWalletAnimationForNFCtype:](CSMagSafeAccessory *self, SEL a2, unsigned __int8 a3)
{
  return a3 == 67;
}

uint64_t CSMagSafeAccessoryTypeForSBSAccessoryType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return 0;
  }
  else {
    return qword_1D8505A50[a1 - 1];
  }
}

__CFString *NSStringFromCSCameraPrewarmingBackgroundLaunchTarget(uint64_t a1)
{
  uint64_t v1 = @"None";
  if (a1 == 1) {
    uint64_t v1 = @"Application";
  }
  if (a1 == 2) {
    return @"Extension";
  }
  else {
    return v1;
  }
}

__CFString *NSStringFromCoverSheetCapability(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __NSStringFromCoverSheetCapability_block_invoke;
  double v14 = &unk_1E6AD9A40;
  id v3 = v2;
  id v15 = v3;
  uint64_t v4 = &v11;
  uint64_t v5 = v4;
  if (a1)
  {
    char v16 = 0;
    uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
    v6.i16[0] = vaddlv_u8(v6);
    int v7 = v6.i32[0];
    if (v6.i32[0])
    {
      unint64_t v8 = 0;
      do
      {
        if (((1 << v8) & a1) != 0)
        {
          ((void (*)(uint64_t *))v13)(v5);
          if (v16) {
            break;
          }
          --v7;
        }
        if (v8 > 0x3E) {
          break;
        }
        ++v8;
      }
      while (v7 > 0);
    }

    if ((~a1 & 0x38) == 0) {
      objc_msgSend(v3, "addObject:", @"Unlock", v11, v12);
    }
  }
  else
  {
  }
  if (objc_msgSend(v3, "count", v11, v12))
  {
    uint64_t v9 = [v3 componentsJoinedByString:@", "];
  }
  else
  {
    uint64_t v9 = @"(none)";
  }

  return v9;
}

void __NSStringFromCoverSheetCapability_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 < 0x2000)
  {
    if (a2 <= 127)
    {
      if (a2 <= 7)
      {
        if (a2 == 2)
        {
          uint64_t v2 = *(void **)(a1 + 32);
          id v3 = @"Siri";
          goto LABEL_54;
        }
        if (a2 == 4)
        {
          uint64_t v2 = *(void **)(a1 + 32);
          id v3 = @"Camera";
          goto LABEL_54;
        }
      }
      else
      {
        switch(a2)
        {
          case 8:
            uint64_t v2 = *(void **)(a1 + 32);
            id v3 = @"TouchID";
            goto LABEL_54;
          case 16:
            uint64_t v2 = *(void **)(a1 + 32);
            id v3 = @"PreArm";
            goto LABEL_54;
          case 64:
            uint64_t v2 = *(void **)(a1 + 32);
            id v3 = @"TodayCenter";
            goto LABEL_54;
        }
      }
    }
    else if (a2 > 1023)
    {
      switch(a2)
      {
        case 1024:
          uint64_t v2 = *(void **)(a1 + 32);
          id v3 = @"Continuity";
          goto LABEL_54;
        case 2048:
          uint64_t v2 = *(void **)(a1 + 32);
          id v3 = @"Logout";
          goto LABEL_54;
        case 4096:
          uint64_t v2 = *(void **)(a1 + 32);
          id v3 = @"DismissCoverSheet";
          goto LABEL_54;
      }
    }
    else
    {
      switch(a2)
      {
        case 128:
          uint64_t v2 = *(void **)(a1 + 32);
          id v3 = @"ControlCenter";
          goto LABEL_54;
        case 256:
          uint64_t v2 = *(void **)(a1 + 32);
          id v3 = @"LivePhotos";
          goto LABEL_54;
        case 512:
          uint64_t v2 = *(void **)(a1 + 32);
          id v3 = @"MediaControls";
          goto LABEL_54;
      }
    }
  }
  else if (a2 >= 0x100000)
  {
    if (a2 >= 0x800000)
    {
      switch(a2)
      {
        case 0x800000:
          uint64_t v2 = *(void **)(a1 + 32);
          id v3 = @"PosterSwitcher";
          goto LABEL_54;
        case 0x1000000:
          uint64_t v2 = *(void **)(a1 + 32);
          id v3 = @"LaunchFromWidget";
          goto LABEL_54;
        case 0x8000000:
          uint64_t v2 = *(void **)(a1 + 32);
          id v3 = @"Inherit";
          goto LABEL_54;
      }
    }
    else
    {
      switch(a2)
      {
        case 0x100000:
          uint64_t v2 = *(void **)(a1 + 32);
          id v3 = @"AccessoryPresentation";
          goto LABEL_54;
        case 0x200000:
          uint64_t v2 = *(void **)(a1 + 32);
          id v3 = @"CoverSheetSpotlight";
          goto LABEL_54;
        case 0x400000:
          uint64_t v2 = *(void **)(a1 + 32);
          id v3 = @"FocusActivityButton";
          goto LABEL_54;
      }
    }
  }
  else if (a2 >= 0x10000)
  {
    switch(a2)
    {
      case 0x10000:
        uint64_t v2 = *(void **)(a1 + 32);
        id v3 = @"NotificationReveal";
        goto LABEL_54;
      case 0x20000:
        uint64_t v2 = *(void **)(a1 + 32);
        id v3 = @"NotificationInteract";
        goto LABEL_54;
      case 0x80000:
        uint64_t v2 = *(void **)(a1 + 32);
        id v3 = @"HostedRemoteContent";
        goto LABEL_54;
    }
  }
  else
  {
    switch(a2)
    {
      case 0x2000:
        uint64_t v2 = *(void **)(a1 + 32);
        id v3 = @"QuickNote";
        goto LABEL_54;
      case 0x4000:
        uint64_t v2 = *(void **)(a1 + 32);
        id v3 = @"Screenshot";
        goto LABEL_54;
      case 0x8000:
        uint64_t v2 = *(void **)(a1 + 32);
        id v3 = @"ProudLockUpdates";
LABEL_54:
        [v2 addObject:v3];
        return;
    }
  }
  uint64_t v4 = *(void **)(a1 + 32);
  objc_msgSend(NSString, "stringWithFormat:", @"Other Capability: %lu", a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 addObject:v5];
}

__CFString *NSStringFromCoverSheetNotificationBehavior(unint64_t a1)
{
  if (a1 > 4) {
    return @"(none)";
  }
  else {
    return off_1E6AD9A80[a1];
  }
}

__CFString *NSStringFromCoverSheetScrollingStrategy(unint64_t a1)
{
  if (a1 > 3) {
    return @"(none)";
  }
  else {
    return off_1E6AD9A60[a1];
  }
}

__CFString *NSStringFromCoverSheetProximityDetectionMode(unint64_t a1)
{
  if (a1 > 2) {
    return @"(none)";
  }
  else {
    return off_1E6AD9AA8[a1];
  }
}

void sub_1D843F228(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v2 - 144), 8);
  objc_destroyWeak((id *)(v2 - 96));
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

void sub_1D843FACC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

id NSStringFromCSTeachableMomentCallToActionLabelState(uint64_t a1)
{
  if (a1 == 1)
  {
    uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v3 = v2;
    uint64_t v4 = @"SWIPE_UP_TO_OPEN";
    id v5 = @"CoverSheetCommon";
  }
  else
  {
    if (a1) {
      goto LABEL_6;
    }
    uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v3 = v2;
    uint64_t v4 = @"SWIPE_UP_TO_UNLOCK";
    id v5 = @"CoverSheet";
  }
  uint64_t v1 = [v2 localizedStringForKey:v4 value:&stru_1F3020248 table:v5];

LABEL_6:

  return v1;
}

float64_t CubicAnimationControlPoints5ByScalingWithFactor@<D0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X8>, double a3@<D0>)
{
  float64x2_t v3 = vmulq_n_f64(a1[1], a3);
  *a2 = vmulq_n_f64(*a1, a3);
  a2[1] = v3;
  float64_t result = a1[2].f64[0] * a3;
  a2[2].f64[0] = result;
  return result;
}

id CSRingColorForPowerStatus(void *a1)
{
  id v1 = a1;
  char v2 = [v1 powerStatus];
  BOOL v3 = UIAccessibilityDarkerSystemColorsEnabled();
  if ((v2 & 4) != 0)
  {
    id v5 = (void *)MEMORY[0x1E4F428B8];
    if (!v3)
    {
      uint64_t v6 = [MEMORY[0x1E4F428B8] systemYellowColor];
      goto LABEL_16;
    }
    double v7 = 0.0431372549;
    double v8 = 1.0;
    double v9 = 1.0;
    goto LABEL_13;
  }
  if ((v2 & 2) != 0)
  {
    id v5 = (void *)MEMORY[0x1E4F428B8];
    if (v3)
    {
      double v8 = 0.984313725;
      double v7 = 0.0274509804;
      double v9 = 0.0;
LABEL_13:
      uint64_t v6 = [v5 colorWithRed:v8 green:v9 blue:v7 alpha:1.0];
      goto LABEL_16;
    }
    uint64_t v6 = [MEMORY[0x1E4F428B8] systemRedColor];
  }
  else
  {
    int v4 = [v1 chargeState];
    id v5 = (void *)MEMORY[0x1E4F428B8];
    if ((v2 & 1) == 0 && v4 != 2)
    {
      uint64_t v6 = [MEMORY[0x1E4F428B8] whiteColor];
      goto LABEL_16;
    }
    if (v3)
    {
      double v9 = 0.862745098;
      double v7 = 0.392156863;
      double v8 = 0.0;
      goto LABEL_13;
    }
    uint64_t v6 = [MEMORY[0x1E4F428B8] systemGreenColor];
  }
LABEL_16:
  uint64_t v10 = (void *)v6;

  return v10;
}

CSMagSafePowerStatus *CSMagSafePowerStatusForBatteryState(char a1, unsigned int a2, double a3)
{
  uint64_t v6 = objc_alloc_init(CSMagSafePowerStatus);
  if (a1)
  {
    uint64_t v7 = 4;
  }
  else if ((double)[MEMORY[0x1E4F42E28] lowBatteryLevel] >= a3)
  {
    uint64_t v7 = 2;
  }
  else
  {
    uint64_t v7 = a2;
  }
  [(CSMagSafePowerStatus *)v6 setPowerStatus:v7];
  [(CSMagSafePowerStatus *)v6 setPowerPercent:a3];

  return v6;
}

uint64_t CSMagSafeRingPowerStatusForBatteryState(char a1, unsigned int a2, double a3)
{
  if (a1) {
    return 4;
  }
  if ((double)[MEMORY[0x1E4F42E28] lowBatteryLevel] >= a3) {
    return 2;
  }
  return a2;
}

__CFString *NSStringFromCoverSheetEventType(unint64_t a1)
{
  if (a1 > 0x29) {
    return @"(unknown)";
  }
  else {
    return off_1E6AD9BA0[a1];
  }
}

BOOL CSEventIsButtonType(uint64_t a1)
{
  return (unint64_t)(a1 - 27) < 7;
}

unint64_t CSEventIsStateless(unint64_t a1)
{
  return (a1 > 0x29) | (0xC000000000uLL >> a1) & 1;
}

BOOL CSCoverSheetEventIsVolumeOrHeadsetButtonType(uint64_t a1)
{
  return (unint64_t)(a1 - 30) < 4;
}

uint64_t CSEventShouldBeLogged(unint64_t a1)
{
  return (a1 > 0x15) | (0x1EFFF8u >> a1) & 1;
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1D845495C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

__CFString *NSStringFromCoverSheetComponentType(unint64_t a1)
{
  if (a1 > 0x1B) {
    return @"(none)";
  }
  else {
    return off_1E6AD9E68[a1];
  }
}

__CFString *NSStringFromTransitionModifiers(char a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v3 = v2;
  if ((a1 & 2) != 0)
  {
    [v2 addObject:@"update"];
    if ((a1 & 4) == 0)
    {
LABEL_3:
      if ((a1 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((a1 & 4) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:@"stretch"];
  if ((a1 & 8) == 0)
  {
LABEL_4:
    if ((a1 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v3 addObject:@"targetOffset"];
  if ((a1 & 0x10) == 0)
  {
LABEL_5:
    if ((a1 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 addObject:@"targetScale"];
  if ((a1 & 0x20) == 0)
  {
LABEL_6:
    if ((a1 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_14:
  [v3 addObject:@"blur"];
  if ((a1 & 0x40) != 0) {
LABEL_7:
  }
    [v3 addObject:@"level"];
LABEL_8:
  if ([v3 count])
  {
    uint64_t v4 = [v3 componentsJoinedByString:@"|"];
  }
  else
  {
    uint64_t v4 = @"none";
  }

  return v4;
}

uint64_t CSComponentTransitionInputsMake@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>, double a7@<D4>)
{
  *(double *)a2 = a3;
  *(double *)(a2 + 8) = a4;
  *(double *)(a2 + 16) = a5;
  *(double *)(a2 + 24) = a6;
  *(double *)(a2 + 32) = a7;
  *(void *)(a2 + 40) = result;
  return result;
}

uint64_t ComponentTransitionInputsEqualToComponentTransitionInputs(uint64_t a1, uint64_t a2)
{
  uint64_t result = BSFloatEqualToFloat();
  if (result)
  {
    uint64_t result = BSFloatEqualToFloat();
    if (result)
    {
      uint64_t result = BSPointEqualToPoint();
      if (result) {
        return *(void *)(a1 + 40) == *(void *)(a2 + 40);
      }
    }
  }
  return result;
}

id NSStringFromComponentTransitionInputs(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v3 = objc_msgSend(NSString, "stringWithFormat:", @"duration: '%f'", *(void *)a1);
  [v2 addObject:v3];

  uint64_t v4 = NSString;
  id v5 = NSStringFromCGPoint(*(CGPoint *)(a1 + 8));
  uint64_t v6 = [v4 stringWithFormat:@"targetOffset: '%@'", v5];
  [v2 addObject:v6];

  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"targetScale: '%f'", *(void *)(a1 + 24));
  [v2 addObject:v7];

  double v8 = objc_msgSend(NSString, "stringWithFormat:", @"blurRadius: '%f'", *(void *)(a1 + 32));
  [v2 addObject:v8];

  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"level: '%lu'", *(void *)(a1 + 40));
  [v2 addObject:v9];

  uint64_t v10 = [v2 componentsJoinedByString:@"; "];

  return v10;
}

void sub_1D8456F34(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D84669D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return objc_opt_class();
}

void sub_1D8473FF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_1D84863B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return objc_opt_class();
}

uint64_t CSAdjustTargetContentOffset(void *a1)
{
  return [a1 contentInset];
}

id CSListItemProvidingGetAllProviders()
{
  uint64_t v0 = objc_alloc_init(CSListItemDiscoveryProvider);
  id v1 = +[CSActivityManager sharedInstance];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CAA0], "orderedSetWithObjects:", v1, v0, 0);

  return v2;
}

void sub_1D8498D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromCoverSheetRegionRole(unint64_t a1)
{
  if (a1 > 3) {
    return @"(unknown)";
  }
  else {
    return off_1E6ADA518[a1];
  }
}

void sub_1D849A89C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D849AC94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D849B9EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D849BF40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D849C0B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getAAUIDeviceLocatorServiceClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAAUIDeviceLocatorServiceClass_softClass;
  uint64_t v7 = getAAUIDeviceLocatorServiceClass_softClass;
  if (!getAAUIDeviceLocatorServiceClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAAUIDeviceLocatorServiceClass_block_invoke;
    v3[3] = &unk_1E6AD94F0;
    v3[4] = &v4;
    __getAAUIDeviceLocatorServiceClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1D849C290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D849C3CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D849C4C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D849CB74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D849CE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAAUIDeviceLocatorStateDidChangeNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AppleAccountUILibrary();
  uint64_t result = dlsym(v2, "AAUIDeviceLocatorStateDidChangeNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAAUIDeviceLocatorStateDidChangeNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

uint64_t AppleAccountUILibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!AppleAccountUILibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __AppleAccountUILibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E6ADA680;
    uint64_t v4 = 0;
    AppleAccountUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = AppleAccountUILibraryCore_frameworkLibrary;
  if (!AppleAccountUILibraryCore_frameworkLibrary) {
    AppleAccountUILibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __AppleAccountUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleAccountUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAAUIDeviceLocatorServiceClass_block_invoke(uint64_t a1)
{
  AppleAccountUILibrary();
  Class result = objc_getClass("AAUIDeviceLocatorService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAAUIDeviceLocatorServiceClass_block_invoke_cold_1();
  }
  getAAUIDeviceLocatorServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAAUIDeviceLocatorConfirmationUtilitiesContextClass_block_invoke(uint64_t a1)
{
  AppleAccountUILibrary();
  Class result = objc_getClass("AAUIDeviceLocatorConfirmationUtilitiesContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAAUIDeviceLocatorConfirmationUtilitiesContextClass_block_invoke_cold_1();
  }
  getAAUIDeviceLocatorConfirmationUtilitiesContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24);
  return result;
}

Class __getAAFMIPAuthenticateRequestClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AppleAccountLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __AppleAccountLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6ADA698;
    uint64_t v5 = 0;
    AppleAccountLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppleAccountLibraryCore_frameworkLibrary) {
    __getAAFMIPAuthenticateRequestClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("AAFMIPAuthenticateRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAAFMIPAuthenticateRequestClass_block_invoke_cold_2();
  }
  getAAFMIPAuthenticateRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppleAccountLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleAccountLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_0_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

BOOL CSBackgroundStyleIsDarkAffectingLegibility(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 6;
}

id CSGetLegibilitySettingsForBackgroundStyle(uint64_t a1)
{
  if ((a1 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    id v1 = objc_alloc(MEMORY[0x1E4F43228]);
    uint64_t v2 = [MEMORY[0x1E4F428B8] whiteColor];
    long long v3 = (void *)[v1 initWithStyle:1 contentColor:v2];
  }
  else
  {
    long long v3 = 0;
  }

  return v3;
}

void sub_1D84ACEEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1D84AD5A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromWidgetPresentationMode(unint64_t a1)
{
  if (a1 > 3) {
    return @"Invalid Mode Defined";
  }
  else {
    return off_1E6ADA918[a1];
  }
}

void sub_1D84AF3A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_1D84B0CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CSChargePercentageLabelForBattery(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 percentCharge];
  long long v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  if (![v1 isInternal])
  {
    int v8 = [v1 isCharging];
    long long v4 = NSString;
    if (v8) {
      uint64_t v9 = @"BATTERY_CHARGE_PERCENTAGE";
    }
    else {
      uint64_t v9 = @"BATTERY_CHARGE_REMAINING";
    }
    uint64_t v5 = [v3 localizedStringForKey:v9 value:&stru_1F3020248 table:@"CoverSheet"];
    uint64_t v6 = (void *)MEMORY[0x1E4F4F9C8];
    double v7 = (double)v2;
    goto LABEL_9;
  }
  if (v2 == 100 || objc_msgSend(v1, "sb_supportsDetailedBatteryMetrics"))
  {
    long long v4 = NSString;
    uint64_t v5 = [v3 localizedStringForKey:@"BATTERY_CHARGE_PERCENTAGE" value:&stru_1F3020248 table:@"CoverSheet"];
    uint64_t v6 = (void *)MEMORY[0x1E4F4F9C8];
    double v7 = (double)v2;
LABEL_9:
    uint64_t v10 = [v6 localizedBatteryDetailTextForBatteryLevel:v7];
    uint64_t v11 = objc_msgSend(v4, "stringWithFormat:", v5, v10);

    goto LABEL_10;
  }
  uint64_t v11 = [v3 localizedStringForKey:@"BATTERY_CHARGING" value:&stru_1F3020248 table:@"CoverSheet"];
LABEL_10:

  return v11;
}

id CSSimpleChargePercentageLabelForBattery(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x1E4F28EE0];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  long long v4 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v3 setLocale:v4];

  [v3 setNumberStyle:3];
  uint64_t v5 = NSNumber;
  uint64_t v6 = [v2 percentCharge];

  double v7 = [v5 numberWithDouble:(double)v6 / 100.0];
  int v8 = [v3 stringFromNumber:v7];

  return v8;
}

void sub_1D84B7DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D84B8AE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
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

void CSUpdateStatusBarBackgroundComponent(void *a1)
{
  id v1 = a1;
  [v1 distanceFromBarToContent];
  [v1 scrollingContentInset];
  [v1 updateAppearanceForStatusBarBackgroundHidden:BSFloatLessThanOrEqualToFloat() ^ 1];
}

id __stringsFromTouches(void *a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = NSString;
        id v11 = *(id *)(*((void *)&v25 + 1) + 8 * i);
        id v12 = v4;
        unint64_t v13 = [v11 phase];
        if (v13 >= 8)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Unhandled (%ld)", v13);
          double v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          double v14 = off_1E6ADAA38[v13];
        }
        [v11 force];
        uint64_t v16 = v15;
        [v11 locationInView:v12];
        CGFloat v18 = v17;
        CGFloat v20 = v19;

        v32.x = v18;
        v32.y = v20;
        int v21 = NSStringFromCGPoint(v32);
        int v22 = [v10 stringWithFormat:@"<UITouch:%p phase:%@ force: %f, loc: %@>", v11, v14, v16, v21];

        [v5 addObject:v22];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  return v5;
}

void sub_1D84BED50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1D84C14B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D84C2218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *location)
{
  objc_destroyWeak(v12);
  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(a10);
  objc_destroyWeak((id *)(v15 - 152));
  objc_destroyWeak((id *)(v15 - 144));
  objc_destroyWeak((id *)(v15 - 136));
  _Unwind_Resume(a1);
}

void sub_1D84C2F78(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

__CFString *NSStringForCSPosterSwitcherPresentationNotReadyReason(unint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown - %lu)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E6ADAC70[a1];
  }

  return v1;
}

void sub_1D84D857C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D84D8640(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D84D9EF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D84DA1E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

__CFString *NSStringFromCSHostableEntityContentMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"None";
  }
  else {
    return off_1E6ADAD98[a1 - 1];
  }
}

__CFString *NSStringFromCoverSheetActionType(unint64_t a1)
{
  if (a1 > 0xD) {
    return @"(unknown)";
  }
  else {
    return off_1E6ADAE08[a1];
  }
}

void sub_1D84E6FC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void SBStaticInitializer_cold_1()
{
}

void __getCSProminentLayoutControllerClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *CoverSheetKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CSCoverSheetViewController.m", 256, @"%s", *a1);

  __break(1u);
}

void __getCSProminentLayoutControllerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getCSProminentLayoutControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CSCoverSheetViewController.m", 257, @"Unable to find class %s", "CSProminentLayoutController");

  __break(1u);
}

void AppleAccountUILibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *AppleAccountUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CSDeviceBlockViewController.m", 35, @"%s", *a1);

  __break(1u);
}

void __getAAUIDeviceLocatorServiceClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getAAUIDeviceLocatorServiceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CSDeviceBlockViewController.m", 37, @"Unable to find class %s", "AAUIDeviceLocatorService");

  __break(1u);
}

void __getAAUIDeviceLocatorConfirmationUtilitiesContextClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getAAUIDeviceLocatorConfirmationUtilitiesContextClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CSDeviceBlockViewController.m", 39, @"Unable to find class %s", "AAUIDeviceLocatorConfirmationUtilitiesContext");

  __break(1u);
}

void __getAAFMIPAuthenticateRequestClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *AppleAccountLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CSDeviceBlockViewController.m", 36, @"%s", *a1);

  __break(1u);
}

void __getAAFMIPAuthenticateRequestClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getAAFMIPAuthenticateRequestClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CSDeviceBlockViewController.m", 40, @"Unable to find class %s", "AAFMIPAuthenticateRequest");

  __break(1u);
}

uint64_t BKSHIDEventTransferTouchesToDifferentCAContext()
{
  return MEMORY[0x1F410BF20]();
}

uint64_t BKSHIDServicesCancelTouchesOnMainDisplay()
{
  return MEMORY[0x1F410BF60]();
}

uint64_t BSDeserializeCGRectFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C228]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1F410C270]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1F410C288]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1F410C2A8]();
}

uint64_t BSEqualArrays()
{
  return MEMORY[0x1F410C2C8]();
}

uint64_t BSEqualBools()
{
  return MEMORY[0x1F410C2D0]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1F410C2E8]();
}

uint64_t BSEqualSets()
{
  return MEMORY[0x1F410C2F0]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1F410C2F8]();
}

uint64_t BSFloatByLinearlyInterpolatingFloats()
{
  return MEMORY[0x1F410C318]();
}

uint64_t BSFloatCeilForScale()
{
  return MEMORY[0x1F410C320]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1F410C328]();
}

uint64_t BSFloatFloorForScale()
{
  return MEMORY[0x1F410C330]();
}

uint64_t BSFloatGreaterThanFloat()
{
  return MEMORY[0x1F410C338]();
}

uint64_t BSFloatGreaterThanOrEqualToFloat()
{
  return MEMORY[0x1F410C340]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x1F410C348]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1F410C350]();
}

uint64_t BSFloatLessThanFloat()
{
  return MEMORY[0x1F410C358]();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x1F410C360]();
}

uint64_t BSFloatRoundForScale()
{
  return MEMORY[0x1F410C368]();
}

uint64_t BSInterfaceOrientationIsLandscape()
{
  return MEMORY[0x1F410C3A0]();
}

uint64_t BSIntervalClip()
{
  return MEMORY[0x1F410C3C8]();
}

uint64_t BSIntervalFractionForValue()
{
  return MEMORY[0x1F410C3D0]();
}

uint64_t BSIntervalOrder()
{
  return MEMORY[0x1F410C3F8]();
}

uint64_t BSIntervalSubIntervalValueForValue()
{
  return MEMORY[0x1F410C400]();
}

uint64_t BSIntervalValueForFraction()
{
  return MEMORY[0x1F410C408]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1F410C420]();
}

uint64_t BSPointEqualToPoint()
{
  return MEMORY[0x1F410C4D0]();
}

uint64_t BSPointRoundForScale()
{
  return MEMORY[0x1F410C4E0]();
}

uint64_t BSRectEqualToRect()
{
  return MEMORY[0x1F410C530]();
}

uint64_t BSRectGetCenter()
{
  return MEMORY[0x1F410C538]();
}

uint64_t BSRectRoundForScale()
{
  return MEMORY[0x1F410C540]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x1F410C548]();
}

uint64_t BSSerializeCGRectToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C598]();
}

uint64_t BSSettingFlagDescription()
{
  return MEMORY[0x1F410C5D8]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x1F410C5E0]();
}

uint64_t BSSettingFlagIfYes()
{
  return MEMORY[0x1F410C5E8]();
}

uint64_t BSSettingFlagIsExplicitNo()
{
  return MEMORY[0x1F410C5F0]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x1F410C5F8]();
}

uint64_t BSSizeRoundForScale()
{
  return MEMORY[0x1F410C630]();
}

uint64_t BSStringFromBOOL()
{
  return MEMORY[0x1F410C650]();
}

uint64_t BSUIConstrainValueToIntervalWithRubberBand()
{
  return MEMORY[0x1F410C6F8]();
}

uint64_t BSUIInvertRubberBandValueForInterval()
{
  return MEMORY[0x1F410C708]();
}

uint64_t BSUIVibrancyMapBias()
{
  return MEMORY[0x1F410C718]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x1F40F4AC8](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

uint64_t CALayerGetRenderId()
{
  return MEMORY[0x1F40F4BE8]();
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

uint64_t CCUIDefaultExpandedContentModuleWidth()
{
  return MEMORY[0x1F4113058]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x1F40DA3A0]();
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

void CGPathRelease(CGPathRef path)
{
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

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CHSWidgetFamilyMaskFromWidgetFamily()
{
  return MEMORY[0x1F41117C0]();
}

uint64_t DNDResolvedDimsLockScreenSetting()
{
  return MEMORY[0x1F4117640]();
}

uint64_t IOAccessoryManagerGetServiceWithPrimaryPort()
{
  return MEMORY[0x1F417A6D8]();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

uint64_t MTStringFromMaterialRecipe()
{
  return MEMORY[0x1F412C680]();
}

uint64_t NCStringFromLongLookPresentationTrigger()
{
  return MEMORY[0x1F4167458]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1F4102AF0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4102AF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t NSStringFromIdleTimerDuration()
{
  return MEMORY[0x1F415BAD8]();
}

uint64_t NSStringFromIdleWarnMode()
{
  return MEMORY[0x1F415BAE0]();
}

uint64_t NSStringFromInterval()
{
  return MEMORY[0x1F410C6D0]();
}

uint64_t NSStringFromPRUISwitcherLayoutMode()
{
  return MEMORY[0x1F4145BD0]();
}

uint64_t NSStringFromPreferredNotificationListMode()
{
  return MEMORY[0x1F415BFB0]();
}

uint64_t NSStringFromSBFIdleTimerMode()
{
  return MEMORY[0x1F415BAE8]();
}

uint64_t NSStringFromSBSRemoteContentDismissType()
{
  return MEMORY[0x1F415BFF0]();
}

uint64_t NSStringFromSBUIBiometricEvent()
{
  return MEMORY[0x1F415C550]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t NSStringFromUnlockSource()
{
  return MEMORY[0x1F415C508]();
}

uint64_t PBUIIrisWallpaperPlaybackStateDescription()
{
  return MEMORY[0x1F4139FE0]();
}

uint64_t PRUISwitcherLayoutTransitionAnimationSettings()
{
  return MEMORY[0x1F4145BD8]();
}

uint64_t SBFAudioCategoriesDisablingVolumeHUDUnion()
{
  return MEMORY[0x1F415BB20]();
}

uint64_t SBFEffectiveArtworkSubtype()
{
  return MEMORY[0x1F415BB68]();
}

uint64_t SBFEffectiveDeviceClass()
{
  return MEMORY[0x1F415BB70]();
}

uint64_t SBFEffectiveHomeButtonType()
{
  return MEMORY[0x1F415BB80]();
}

uint64_t SBFInterfaceOrientationDescription()
{
  return MEMORY[0x1F415BBC0]();
}

uint64_t SBFMainScreenScale()
{
  return MEMORY[0x1F415BC58]();
}

uint64_t SBFStringForAppearState()
{
  return MEMORY[0x1F415BCA0]();
}

uint64_t SBFStringForBSInterfaceOrientation()
{
  return MEMORY[0x1F415BCB0]();
}

uint64_t SBFTransformForScalingAboutPointInSuperview()
{
  return MEMORY[0x1F415BCE8]();
}

uint64_t SBFTransformFromOrientationToOrientation()
{
  return MEMORY[0x1F415BCF0]();
}

uint64_t SBFWindowForViewControllerTransition()
{
  return MEMORY[0x1F415BCF8]();
}

uint64_t SBLogCommon()
{
  return MEMORY[0x1F415C108]();
}

uint64_t SBLogCoverSheet()
{
  return MEMORY[0x1F415C110]();
}

uint64_t SBLogCoverSheetActivities()
{
  return MEMORY[0x1F415C118]();
}

uint64_t SBLogCoverSheetWidgets()
{
  return MEMORY[0x1F415C120]();
}

uint64_t SBLogDashBoard()
{
  return MEMORY[0x1F415C128]();
}

uint64_t SBLogDashBoardScrollGestures()
{
  return MEMORY[0x1F415C140]();
}

uint64_t SBLogDashBoardTelemetrySignposts()
{
  return MEMORY[0x1F415C148]();
}

uint64_t SBLogDoNotDisturbBedtime()
{
  return MEMORY[0x1F415C178]();
}

uint64_t SBLogIdleTimer()
{
  return MEMORY[0x1F415C1C8]();
}

uint64_t SBLogLiveRendering()
{
  return MEMORY[0x1F415BD00]();
}

uint64_t SBLogLockScreenMesaHomeButtonPasscodeRecognizer()
{
  return MEMORY[0x1F415C200]();
}

uint64_t SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer()
{
  return MEMORY[0x1F415C208]();
}

uint64_t SBLogSpotlight()
{
  return MEMORY[0x1F415C280]();
}

uint64_t SBUIConvertUnlockSourceToBacklightChangeSource()
{
  return MEMORY[0x1F415C528]();
}

uint64_t SBUICurrentPasscodeStyleForUser()
{
  return MEMORY[0x1F415C640]();
}

uint64_t SBUIGraphicsQuality()
{
  return MEMORY[0x1F415C648]();
}

uint64_t SBUIProudLockContainerViewControllerConfigurationDefault()
{
  return MEMORY[0x1F415C668]();
}

uint64_t SBUIUnlockSourceIsUserAction()
{
  return MEMORY[0x1F415C548]();
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

uint32_t SecTaskGetCodeSignStatus(SecTaskRef task)
{
  return MEMORY[0x1F40F7180](task);
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1F4102B28]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1F4102B38]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1F4102B40]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x1F4102B48]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x1F4102B58]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4102BC0](category);
}

uint64_t UIDistanceBetweenRects()
{
  return MEMORY[0x1F4102BD8]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4102C40]();
}

uint64_t UIIntegralTransform()
{
  return MEMORY[0x1F4102C98]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x1F4102D50]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1F4102D60]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1F4102D68]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x1F4102D70]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x1F4102D78]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1F4102D80]();
}

void UIRectFill(CGRect rect)
{
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4102DB8]();
}

uint64_t XBInterfaceOrientationMaskForInterfaceOrientation()
{
  return MEMORY[0x1F415B2F8]();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x1F41788E8]();
}

uint64_t _AXSAttentionAwarenessFeaturesEnabled()
{
  return MEMORY[0x1F4178940]();
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x1F410C6E8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1F40E7328](commaSeparatedKeysString, firstValue);
}

uint64_t _SBFLoggingMethodProem()
{
  return MEMORY[0x1F415BD30]();
}

uint64_t _SBF_Private_IsD16()
{
  return MEMORY[0x1F415BD40]();
}

uint64_t _SBF_Private_IsD17()
{
  return MEMORY[0x1F415BD48]();
}

uint64_t _SBF_Private_IsD33OrSimilarDevice()
{
  return MEMORY[0x1F415BD50]();
}

uint64_t _SBF_Private_IsD52OrSimilarDevice()
{
  return MEMORY[0x1F415BD58]();
}

uint64_t _SBF_Private_IsD52ZoomedOrSimilarDevice()
{
  return MEMORY[0x1F415BD60]();
}

uint64_t _SBF_Private_IsD53()
{
  return MEMORY[0x1F415BD68]();
}

uint64_t _SBF_Private_IsD54()
{
  return MEMORY[0x1F415BD70]();
}

uint64_t _SBF_Private_IsD63()
{
  return MEMORY[0x1F415BD78]();
}

uint64_t _SBF_Private_IsD63Like()
{
  return MEMORY[0x1F415BD80]();
}

uint64_t _SBF_Private_IsD64()
{
  return MEMORY[0x1F415BD88]();
}

uint64_t _SBF_Private_IsD64Like()
{
  return MEMORY[0x1F415BD90]();
}

uint64_t _SBF_Private_IsD93Like()
{
  return MEMORY[0x1F415BD98]();
}

uint64_t _SBF_Private_IsD94Like()
{
  return MEMORY[0x1F415BDA0]();
}

uint64_t _SBF_Private_IsN84OrSimilarDevice()
{
  return MEMORY[0x1F415BDA8]();
}

uint64_t _SBF_Private_IsN84ZoomedOrSimilarDevice()
{
  return MEMORY[0x1F415BDB0]();
}

uint64_t _SBUIInterpolatedLegibilitySettings()
{
  return MEMORY[0x1F415C6C0]();
}

uint64_t _UIAccessibilityReduceWhitePoint()
{
  return MEMORY[0x1F4102E70]();
}

uint64_t _UISceneSettingsDiffActionPerformChangesWithTransitionContext()
{
  return MEMORY[0x1F4102F40]();
}

uint64_t _UISystemGestureLocationInView()
{
  return MEMORY[0x1F4102FB0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __sb__mainScreenReferenceBounds()
{
  return MEMORY[0x1F415C4D0]();
}

uint64_t __sb__runningInSpringBoard()
{
  return MEMORY[0x1F415C4E0]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1F410C6F0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t aks_bak_get_beacon()
{
  return MEMORY[0x1F410A570]();
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

uint64_t convertTensionAndFrictionToDampingRatioAndResponse()
{
  return MEMORY[0x1F415BDC8]();
}

uint64_t ct_green_tea_logging_enabled()
{
  return MEMORY[0x1F417A390]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
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

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
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

uint64_t self
{
  return MEMORY[0x1F41817D0]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

float sinf(float a1)
{
  MEMORY[0x1F40CE060](a1);
  return result;
}

long double tan(long double __x)
{
  MEMORY[0x1F40CE420](__x);
  return result;
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}