@interface LSHandlerPrefRemoveAllWithBundleID
@end

@implementation LSHandlerPrefRemoveAllWithBundleID

void ___LSHandlerPrefRemoveAllWithBundleID_block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v22 = 0;
  v19 = 0;
  id v20 = 0;
  char v21 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v2 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v3 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v19, v2, 0);

  if (!v3)
  {
    v5 = _LSDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      +[_LSDServiceDomain defaultServiceDomain]();
      v16 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v19, v16, 0);

      if (v17) {
        id v18 = 0;
      }
      else {
        id v18 = v22;
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = v15;
      __int16 v25 = 2112;
      id v26 = v18;
      _os_log_error_impl(&dword_182959000, v5, OS_LOG_TYPE_ERROR, "Error getting the database context when removing handler prefs for %@: %@", buf, 0x16u);
    }
    uint64_t v6 = *(void *)(a1 + 48);
    +[_LSDServiceDomain defaultServiceDomain]();
    v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v19, v7, 0);

    if (v8) {
      id v9 = 0;
    }
    else {
      id v9 = v22;
    }
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v9);
    goto LABEL_12;
  }
  StringForCFString = (_LSDatabase *)_LSDatabaseGetStringForCFString(*v3, *(const __CFString **)(a1 + 32), 0);
  if (!StringForCFString)
  {
    v10 = _LSDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v11;
      _os_log_impl(&dword_182959000, v10, OS_LOG_TYPE_INFO, "Unable to remove all prefs with bundleID %{public}@, returning kLSApplicationNotFoundErr", buf, 0xCu);
    }

    uint64_t v12 = *(void *)(a1 + 48);
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10814, (uint64_t)"_LSHandlerPrefRemoveAllWithBundleID_block_invoke", 1149, 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v9);
LABEL_12:

    goto LABEL_13;
  }
  LSHandlerPref::RemoveRoleHandlersMatchingBundleID((LSHandlerPref *)*v3, StringForCFString);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_13:
  if (v19 && v21) {
    _LSContextDestroy(v19);
  }
  id v13 = v20;
  v19 = 0;
  id v20 = 0;

  char v21 = 0;
  id v14 = v22;
  id v22 = 0;
}

uint64_t ___LSHandlerPrefRemoveAllWithBundleID_block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void ___LSHandlerPrefRemoveAllWithBundleID_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _LSDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    ___LSHandlerPrefRemoveAllWithBundleID_block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void ___LSHandlerPrefRemoveAllWithBundleID_block_invoke_63(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = _LSDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      ___LSHandlerPrefRemoveAllWithBundleID_block_invoke_63_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void ___LSHandlerPrefRemoveAllWithBundleID_block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_182959000, v0, v1, "XPC error removing handler prefs for %@: %@");
}

void ___LSHandlerPrefRemoveAllWithBundleID_block_invoke_63_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_182959000, v0, v1, "Error removing handler prefs for %@: %@");
}

@end