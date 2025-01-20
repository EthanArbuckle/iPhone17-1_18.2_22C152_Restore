BOOL DOCUsePadIdiomForTraits(void *a1)
{
  return !DOCUsePhoneIdiomForTraits(a1);
}

BOOL DOCUsePhoneIdiomForTraits(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (!v1)
  {
    v3 = [MEMORY[0x263F82B60] mainScreen];
    v2 = [v3 traitCollection];
  }
  if ([v2 userInterfaceIdiom] == -1)
  {
    id v4 = [v2 traitCollectionByModifyingTraits:&__block_literal_global_183];
  }
  else
  {
    id v4 = v2;
  }
  v5 = v4;

  BOOL v6 = [v5 userInterfaceIdiom] == 0;
  return v6;
}

void sub_21361F714(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL DOCScreenSizePad12_9()
{
  if (_DOCMainScreenClass__DOCMainScreenClass_OnceToken != -1) {
    dispatch_once(&_DOCMainScreenClass__DOCMainScreenClass_OnceToken, &__block_literal_global_25);
  }
  return _DOCMainScreenClass__DOCMainScreenClass == 11;
}

void sub_2136210A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return v0;
}

void sub_213622B6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t DOCIsInternalBuild()
{
  if (DOCIsInternalBuild_onceToken != -1) {
    dispatch_once(&DOCIsInternalBuild_onceToken, &__block_literal_global_40);
  }
  return DOCIsInternalBuild__isInternal;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

CGFloat DOCAdaptSizeToRect(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6, double a7, double a8)
{
  if (a6 == 0.0 || a7 == 0.0) {
    return a2;
  }
  double v13 = a8;
  if (a8 == 0.0)
  {
    v16 = [MEMORY[0x263F82B60] mainScreen];
    v17 = [v16 traitCollection];
    [v17 displayScale];
    double v13 = v18;

    if (v13 == 0.0) {
      double v13 = 1.0;
    }
  }
  v27.origin.x = a2;
  v27.origin.y = a3;
  v27.size.width = a4;
  v27.size.height = a5;
  double v19 = CGRectGetWidth(v27) / a6;
  v28.origin.x = a2;
  v28.origin.y = a3;
  v28.size.width = a4;
  v28.size.height = a5;
  double v20 = CGRectGetHeight(v28) / a7;
  if (a1 == 1)
  {
    double v21 = fmax(v19, v20);
  }
  else
  {
    double v21 = 1.0;
    if (!a1) {
      double v21 = fmin(v19, v20);
    }
  }
  CGFloat v23 = ceil(v13 * (a6 * v21)) / v13;
  CGFloat v24 = ceil(v13 * (a7 * v21)) / v13;
  v29.origin.x = a2;
  v29.origin.y = a3;
  v29.size.width = a4;
  v29.size.height = a5;
  double Width = CGRectGetWidth(v29);
  v30.origin.x = a2;
  v30.origin.y = a3;
  v30.size.width = v23;
  v30.size.height = v24;
  double v22 = a2 + floor(v13 * ((Width - CGRectGetWidth(v30)) * 0.5)) / v13;
  v31.origin.x = a2;
  v31.origin.y = a3;
  v31.size.width = a4;
  v31.size.height = a5;
  CGRectGetHeight(v31);
  v32.origin.x = v22;
  v32.origin.y = a3;
  v32.size.width = v23;
  v32.size.height = v24;
  CGRectGetHeight(v32);
  return v22;
}

id DOCFocusGroupIdentifierBrowserFromConfiguration(void *a1)
{
  id v1 = NSString;
  v2 = [a1 sceneIdentifier];
  v3 = [v1 stringWithFormat:@"%@%@", @"DOCFocusGroupIdentifierBrowser", v2];

  return v3;
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

BOOL DOCDebugMenuEnabled()
{
  if (DOCIsInternalBuild_onceToken != -1) {
    dispatch_once(&DOCIsInternalBuild_onceToken, &__block_literal_global_40);
  }
  if (!DOCIsInternalBuild__isInternal) {
    return 0;
  }
  if (DOCDebugMenuEnabled_onceToken != -1) {
    dispatch_once(&DOCDebugMenuEnabled_onceToken, &__block_literal_global_43);
  }
  return DOCDebugMenuEnabled__debugMenuEnabled != 0;
}

void __DOCDebugMenuEnabled_block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  DOCDebugMenuEnabled__debugMenuEnabled = [v0 BOOLForKey:@"DOCDebugMenuEnabled"];
}

uint64_t __DOCIsInternalBuild_block_invoke()
{
  uint64_t result = os_variant_has_internal_ui();
  DOCIsInternalBuild__isInternal = result;
  return result;
}

void sub_213626174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Block_object_dispose((const void *)(v35 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_213626650(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_213626904(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_213627EC0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_213627FD8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2136289D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_2136290F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213629608(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213629C48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_213629D4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21362A140(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_21362B1FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_21362BD9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21362BE88(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21362CCE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_21362D2EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21362DB6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21362DC50(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21362DD30(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21362E838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21362FD78(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_21363011C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213630500(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 96));
  _Unwind_Resume(a1);
}

void sub_21363335C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __DOCViewServiceRecoveryAttemptTimeThreshold_block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v0 doubleForKey:@"DOCViewServiceResetRecoveryThreshold"];
  double v2 = v1;

  if (v2 > 0.0) {
    DOCViewServiceRecoveryAttemptTimeThreshold_interval = *(void *)&v2;
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_2136351E4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_213636B68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213636E68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_21363E460(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t doc_smartfolder_create_tables_initial(void *a1, void *a2)
{
  id v3 = a1;
  if ([v3 execute:@"CREATE TABLE filenames( fp_folder_id TEXT NOT NULL, fp_folder_item BLOB NOT NULL, file_name TEXT NOT NULL, last_hit_date DOUBLE NOT NULL, frecency_at_last_hit_date DOUBLE NOT NULL)"]&& objc_msgSend(v3, "execute:", @"CREATE INDEX filename_index ON filenames (fp_folder_id)")&& objc_msgSend(v3, "execute:", @"CREATE INDEX filename_last_hit_date_index ON filenames (last_hit_date)")&& objc_msgSend(v3, "execute:", @"CREATE TABLE filetypes( fp_folder_id TEXT NOT NULL, fp_folder_item BLOB NOT NULL, file_type TEXT NOT NULL, last_hit_date DOUBLE NOT NULL, frecency_at_last_hit_date DOUBLE NOT NULL)")&& objc_msgSend(v3, "execute:", @"CREATE INDEX filetype_index ON filetypes (fp_folder_id)")&& objc_msgSend(v3, "execute:", @"CREATE INDEX filetype_last_hit_date_index ON filetypes (last_hit_date)")&& objc_msgSend(v3,
                       "execute:",
                       @"CREATE TABLE hotfolders( app_bundle_id TEXT NOT NULL, fp_folder_id TEXT NOT NULL, fp_folder_item BLOB NOT NULL, event_type INTEGER NOT NULL, last_hit_date DOUBLE NOT NULL, frecency_at_last_hit_date DOUBLE NOT NULL)")
    && [v3 execute:@"CREATE INDEX app_identifier ON hotfolders (app_bundle_id)"]
    && [v3 execute:@"CREATE INDEX _last_hit_date_index ON hotfolders (last_hit_date)"])
  {
    uint64_t v4 = [v3 setUserVersion:1];
  }
  else
  {
    uint64_t v4 = 0;
  }
  if (a2 && (v4 & 1) == 0)
  {
    *a2 = [v3 lastError];
  }

  return v4;
}

void sub_21363EE8C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21363FE60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_11(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_7_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_9_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_2136448EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213645AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_213645F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_213646304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

CGFloat DOCCenterSizeInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  CGFloat v9 = CGRectGetMidX(*(CGRect *)&a1) - a5 * 0.5;
  v11.origin.x = a1;
  v11.origin.y = a2;
  v11.size.width = a3;
  v11.size.height = a4;
  CGRectGetMidY(v11);
  return v9;
}

id DOCErrorNoLocationAvailableError(void *a1)
{
  v15[2] = *MEMORY[0x263EF8340];
  id v1 = a1;
  double v2 = NSString;
  id v3 = _DocumentManagerBundle();
  uint64_t v4 = v3;
  if (v1)
  {
    uint64_t v5 = [v3 localizedStringForKey:@"No location available to save “%@”." value:@"No location available to save “%@”." table:@"Localizable"];
    objc_msgSend(v2, "stringWithFormat:", v5, v1);
  }
  else
  {
    uint64_t v5 = [v3 localizedStringForKey:@"No location available to save this document." value:@"No location available to save this document." table:@"Localizable"];
    objc_msgSend(v2, "stringWithFormat:", v5, 0);
  BOOL v6 = };

  v7 = _DocumentManagerBundle();
  v8 = [v7 localizedStringForKey:@"Enable at least one location to be able to save documents." value:@"Enable at least one location to be able to save documents." table:@"Localizable"];

  CGFloat v9 = (void *)MEMORY[0x263F087E8];
  uint64_t v10 = *MEMORY[0x263F08348];
  v14[0] = *MEMORY[0x263F08320];
  v14[1] = v10;
  v15[0] = v6;
  v15[1] = v8;
  CGRect v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  uint64_t v12 = [v9 errorWithDomain:@"com.apple.DocumentManager" code:2 userInfo:v11];

  return v12;
}

id DOCFrameworkBundle()
{
  if (DOCFrameworkBundle_onceToken != -1) {
    dispatch_once(&DOCFrameworkBundle_onceToken, &__block_literal_global_9);
  }
  id v0 = (void *)DOCFrameworkBundle_DOCBundle;
  return v0;
}

uint64_t __DOCFrameworkBundle_block_invoke()
{
  Class v0 = NSClassFromString(&cfstr_Uidocumentbrow_12.isa);
  if (v0)
  {
    uint64_t v1 = [MEMORY[0x263F086E0] bundleForClass:v0];
    uint64_t v2 = DOCFrameworkBundle_DOCBundle;
    DOCFrameworkBundle_DOCBundle = v1;
  }
  else
  {
    id v3 = (void *)DOCFrameworkBundle_DOCBundle;
    DOCFrameworkBundle_DOCBundle = 0;

    BOOL v6 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"NSBundle * _Nonnull DOCFrameworkBundle(void)_block_invoke"];
    [v6 handleFailureInFunction:v4 file:@"DOCUtilities.m" lineNumber:59 description:@"Fatal error: Could not determine NSBundle for DocumentManager framework"];

    uint64_t v2 = (uint64_t)v6;
  }
  return MEMORY[0x270F9A758](v1, v2);
}

uint64_t _DOCMainScreenClass()
{
  if (_DOCMainScreenClass__DOCMainScreenClass_OnceToken != -1) {
    dispatch_once(&_DOCMainScreenClass__DOCMainScreenClass_OnceToken, &__block_literal_global_25);
  }
  return _DOCMainScreenClass__DOCMainScreenClass;
}

double _DOCMainScreenSize()
{
  if (_DOCMainScreenSize__DOCMainScreenSize_OnceToken != -1) {
    dispatch_once(&_DOCMainScreenSize__DOCMainScreenSize_OnceToken, &__block_literal_global_30);
  }
  return *(double *)&_DOCMainScreenSize__DOCMainScreenSize_0;
}

BOOL DOCScreenSizeSEPhone()
{
  if (_DOCMainScreenClass__DOCMainScreenClass_OnceToken != -1) {
    dispatch_once(&_DOCMainScreenClass__DOCMainScreenClass_OnceToken, &__block_literal_global_25);
  }
  return _DOCMainScreenClass__DOCMainScreenClass == 5;
}

BOOL DOCScreenSizePad()
{
  return !DOCUsePhoneIdiomForTraits(0);
}

BOOL DOCSizeIsFullScreenSize(double a1, double a2)
{
  double v4 = _DOCMainScreenSize();
  return a1 * a2 == v4 * v5;
}

uint64_t DOCDeviceHasHomeButton()
{
  if (DOCDeviceHasHomeButton_onceToken != -1) {
    dispatch_once(&DOCDeviceHasHomeButton_onceToken, &__block_literal_global_33);
  }
  return DOCDeviceHasHomeButton_hasHomeButton;
}

uint64_t __DOCDeviceHasHomeButton_block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  DOCDeviceHasHomeButton_hasHomeButton = result != 2;
  return result;
}

uint64_t DOCAssertWithIntenalBuildAlert(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  v29[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ((a1 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F08320];
    v29[0] = v12;
    v16 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
    v17 = [v15 errorWithDomain:@"com.apple.DocumentManager" code:1 userInfo:v16];

    double v18 = (NSObject **)MEMORY[0x263F3AC88];
    double v19 = *MEMORY[0x263F3AC88];
    if (!*MEMORY[0x263F3AC88])
    {
      DOCInitLogging();
      double v19 = *v18;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      DOCAssertWithIntenalBuildAlert_cold_1(v19, v17);
    }
    if (DOCIsInternalBuild_onceToken != -1) {
      dispatch_once(&DOCIsInternalBuild_onceToken, &__block_literal_global_40);
    }
    if (DOCIsInternalBuild__isInternal)
    {
      id v20 = v14;
      if (!v20)
      {
        double v21 = +[DOCUISession keyWindow];
        id v20 = [v21 rootViewController];
      }
      id v25 = v17;
      id v26 = v11;
      id v27 = v13;
      id v22 = v20;
      DOCRunInMainThread();

      CGFloat v23 = v25;
    }
    else
    {
      if (!a2)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v22 = [MEMORY[0x263F08690] currentHandler];
      CGFloat v23 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL DOCAssertWithIntenalBuildAlert(BOOL, BOOL, NSString *__strong _Nonnull, NSString *__strong _Nonnull, NSString *__strong _Nonnull, UIViewController * _Nullable __strong)");
      [v22 handleFailureInFunction:v23 file:@"DOCUtilities.m" lineNumber:221 description:v13];
    }

    goto LABEL_15;
  }
LABEL_16:

  return a1;
}

void __DOCAssertWithIntenalBuildAlert_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __DOCAssertWithIntenalBuildAlert_block_invoke_2;
  v4[3] = &unk_2641B24A0;
  char v6 = *(unsigned char *)(a1 + 64);
  id v3 = *(void **)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  DOCPresentAlertForErrorWithForceHandler(v1, v2, 0, 0, 0, v3, 0, v4);
}

void DOCPresentAlertForErrorWithForceHandler(void *a1, void *a2, void *a3, int a4, uint64_t a5, void *a6, void *a7, void *a8)
{
  id v31 = a1;
  id v13 = a2;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  double v18 = +[DOCErrorStore augmentedErrorForError:v31];
  if (v18) {
    double v19 = v18;
  }
  else {
    double v19 = v31;
  }
  id v20 = v19;

  if (v13)
  {
    id v21 = v13;
  }
  else
  {
    id v21 = [v20 localizedDescription];
  }
  id v22 = v21;
  CGFloat v23 = [v20 localizedFailureReason];
  CGFloat v24 = v23;
  if (v23)
  {
    id v25 = v23;
  }
  else
  {
    id v26 = [v20 localizedRecoverySuggestion];
    id v27 = v26;
    if (!v13 || v26)
    {
      id v28 = v26;
    }
    else
    {
      id v28 = [v20 localizedDescription];
    }
    id v25 = v28;
  }
  DOCPresentAlert(v22, v25, a4, a5, v17, v16, v15, v14);
}

void __DOCAssertWithIntenalBuildAlert_block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v2 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL DOCAssertWithIntenalBuildAlert(BOOL, BOOL, NSString *__strong _Nonnull, NSString *__strong _Nonnull, NSString *__strong _Nonnull, UIViewController * _Nullable __strong)_block_invoke_2");
    [v3 handleFailureInFunction:v2 file:@"DOCUtilities.m" lineNumber:213 description:*(void *)(a1 + 32)];
  }
}

id DOCIgnoringExceptionsWhileTrying(void *a1)
{
  uint64_t v1 = a1;
  v1[2]();

  return 0;
}

void sub_213649374(void *a1)
{
  id v1 = objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x213649350);
}

void DOCPresentAlert(void *a1, void *a2, int a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  id v14 = a2;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = a6;
  id v19 = a1;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v41 = v14;
  id v20 = +[DOCAlertController alertControllerWithTitle:v19 message:v14 preferredStyle:1];

  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __DOCPresentAlert_block_invoke;
  v49[3] = &unk_2641B1080;
  id v21 = v17;
  id v50 = v21;
  id v22 = (void *)MEMORY[0x21668E400](v49);
  CGFloat v23 = (void *)MEMORY[0x263F82400];
  CGFloat v24 = _DocumentManagerBundle();
  id v25 = v24;
  if (a3)
  {
    id v26 = [v24 localizedStringForKey:@"Cancel" value:@"Cancel" table:@"Localizable"];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __DOCPresentAlert_block_invoke_2;
    v47[3] = &unk_2641B2510;
    id v27 = &v48;
    id v48 = v22;
    id v28 = v47;
    CGRect v29 = v23;
    CGRect v30 = v26;
    uint64_t v31 = 1;
  }
  else
  {
    id v26 = [v24 localizedStringForKey:@"OK" value:@"OK" table:@"Localizable"];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __DOCPresentAlert_block_invoke_3;
    v45[3] = &unk_2641B2510;
    id v27 = &v46;
    id v46 = v22;
    id v28 = v45;
    CGRect v29 = v23;
    CGRect v30 = v26;
    uint64_t v31 = 0;
  }
  CGRect v32 = objc_msgSend(v29, "actionWithTitle:style:handler:", v30, v31, v28, a4);
  [v20 addAction:v32];

  if (v16 && [v15 length])
  {
    v33 = (void *)MEMORY[0x263F82400];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __DOCPresentAlert_block_invoke_4;
    v42[3] = &unk_2641B2538;
    id v43 = v16;
    id v44 = v22;
    v34 = [v33 actionWithTitle:v15 style:v40 handler:v42];
    [v20 addAction:v34];

    uint64_t v35 = v43;
  }
  else
  {
    uint64_t v35 = [v20 actions];
    v36 = [v35 lastObject];
    [v20 setPreferredAction:v36];
  }
  v37 = (NSObject **)MEMORY[0x263F3AC88];
  v38 = *MEMORY[0x263F3AC88];
  if (!*MEMORY[0x263F3AC88])
  {
    DOCInitLogging();
    v38 = *v37;
  }
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
    DOCPresentAlert_cold_1((uint64_t)v41, v38);
  }
  [v18 presentViewController:v20 animated:1 completion:0];
}

void DOCPresentAlertForError(void *a1, void *a2)
{
}

BOOL DOCIsNetworkReachable()
{
  Class v0 = [MEMORY[0x263F14420] sharedDefaultEvaluator];
  id v1 = [v0 path];
  uint64_t v2 = [v1 status];

  unint64_t v3 = v2 & 0xFFFFFFFFFFFFFFFDLL;
  if ((v2 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    double v4 = (NSObject **)MEMORY[0x263F3AC28];
    id v5 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      id v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21361D000, v5, OS_LOG_TYPE_DEFAULT, "Network is not reachable", v7, 2u);
    }
  }
  return v3 == 1;
}

void DOCAlertUserTheNetworkIsNotReachable(void *a1)
{
  id v1 = a1;
  uint64_t v2 = _DocumentManagerBundle();
  id v5 = [v2 localizedStringForKey:@"You’re Offline" value:@"You’re Offline" table:@"Localizable"];

  unint64_t v3 = _DocumentManagerBundle();
  double v4 = [v3 localizedStringForKey:@"Check your Internet connection, then try again.", @"Check your Internet connection, then try again.", @"Localizable" value table];

  DOCPresentAlert(v5, v4, 0, 0, 0, v1, 0, 0);
}

void DOCAlertUserTrashedFileCanNotBeOpened(void *a1, void *a2)
{
  unint64_t v3 = NSString;
  id v4 = a2;
  id v5 = a1;
  char v6 = _DocumentManagerBundle();
  v7 = [v6 localizedStringForKey:@"The document “%@” can’t be opened because it’s in Recently Deleted." value:@"The document “%@” can’t be opened because it’s in Recently Deleted." table:@"Localizable"];
  objc_msgSend(v3, "stringWithFormat:", v7, v5);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = NSString;
  CGFloat v9 = _DocumentManagerBundle();
  uint64_t v10 = [v9 localizedStringForKey:@"To use this item, tap and hold on the item and choose Recover.", @"To use this item, tap and hold on the item and choose Recover.", @"Localizable" value table];
  id v11 = [v8 stringWithFormat:v10];

  DOCPresentAlert(v12, v11, 0, 0, 0, v4, 0, 0);
}

void DOCAlertItemIsNotReadable(void *a1, int a2, void *a3)
{
  id v5 = NSString;
  id v6 = a3;
  id v7 = a1;
  v8 = _DocumentManagerBundle();
  CGFloat v9 = v8;
  if (a2) {
    uint64_t v10 = @"The folder “%@” can’t be opened because you don’t have permission to see its contents.";
  }
  else {
    uint64_t v10 = @"The document “%@” can’t be opened because you don’t have permission to see its contents.";
  }
  id v11 = [v8 localizedStringForKey:v10 value:v10 table:@"Localizable"];
  objc_msgSend(v5, "stringWithFormat:", v11, v7);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  DOCPresentAlert(0, v12, 0, 0, 0, v6, 0, 0);
}

uint64_t DOCFirstResponderIsKeyInput()
{
  Class v0 = [MEMORY[0x263F828A0] activeKeyboard];
  id v1 = [v0 targetWindow];
  uint64_t v2 = [v1 firstResponder];

  uint64_t v3 = [v2 conformsToProtocol:&unk_26C435898];
  return v3;
}

uint64_t __DOCPresentAlert_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __DOCPresentAlert_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __DOCPresentAlert_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __DOCPresentAlert_block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void sub_213649ED0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21364A4FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21364A69C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21364A9CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21364ADC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21364B11C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21364B460(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void DOCAssertWithIntenalBuildAlert_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  id v4 = [a2 localizedDescription];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_21361D000, v3, OS_LOG_TYPE_FAULT, "Error: %@", (uint8_t *)&v5, 0xCu);
}

void DOCPresentAlert_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "void DOCPresentAlert(NSString *__strong, NSString * _Nullable __strong, BOOL, UIAlertActionStyle, NSString * _Nul"
       "lable __strong, UIViewController *__strong, void (^ _Nullable __strong)(void), void (^ _Nullable __strong)(void))";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_21361D000, a2, OS_LOG_TYPE_DEBUG, "%s: prompting user with message: %@", (uint8_t *)&v2, 0x16u);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F38](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t DOCInitLogging()
{
  return MEMORY[0x270F26B48]();
}

uint64_t DOCLocalizedDisplayName()
{
  return MEMORY[0x270F26B50]();
}

uint64_t DOCNodeFromCoder()
{
  return MEMORY[0x270F26B58]();
}

uint64_t DOCProviderDomainIDIsDefaultSharedServer()
{
  return MEMORY[0x270F26B60]();
}

uint64_t DOCProviderDomainIDIsRemovable()
{
  return MEMORY[0x270F26B70]();
}

uint64_t DOCRunInMainThread()
{
  return MEMORY[0x270F26B88]();
}

uint64_t DOCTagFromFPTag()
{
  return MEMORY[0x270F26B90]();
}

uint64_t FPDocumentURLFromBookmarkableString()
{
  return MEMORY[0x270EEBA70]();
}

uint64_t FPIsCloudDocsWithFPFSEnabled()
{
  return MEMORY[0x270EEBB08]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F82BC8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x270EF2C18](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x270F82C48]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F82CD0](category);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _DocumentManagerBundle()
{
  return MEMORY[0x270F26BB0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
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

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
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
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
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
  return MEMORY[0x270ED95A8](when, delta);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9AB8](a1, a2, a3, *(void *)&a4);
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x270EDAB48]();
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x270EDB298]();
}

uint64_t sandbox_extension_update_file()
{
  return MEMORY[0x270EDB2E0]();
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}