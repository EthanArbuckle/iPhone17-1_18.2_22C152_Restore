@interface MTMutableTimer(HFAdditions)
- (void)hf_moveToRoom:()HFAdditions withMediaProfileContainer:;
@end

@implementation MTMutableTimer(HFAdditions)

- (void)hf_moveToRoom:()HFAdditions withMediaProfileContainer:
{
  v28[1] = *MEMORY[0x263EF8340];
  v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(v7, "hf_home");
  v9 = objc_msgSend(a1, "hf_targetAccessoryInHome:", v8);
  v10 = [v9 room];
  int v11 = [v10 isEqual:v6];

  if (v11)
  {
    v12 = HFLogForCategory(4uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = a1;
      __int16 v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "Not moving timer: %@ since it is already in room: %@ ", buf, 0x16u);
    }
  }
  else
  {
    v13 = [v7 accessories];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __71__MTMutableTimer_HFAdditions__hf_moveToRoom_withMediaProfileContainer___block_invoke;
    v19[3] = &unk_26408D968;
    v14 = v6;
    v20 = v14;
    v15 = objc_msgSend(v13, "na_firstObjectPassingTest:", v19);

    if (v15)
    {
      v16 = COTimerSiriContextTargetReferenceForAccessory();
      uint64_t v27 = *MEMORY[0x263F33F30];
      v28[0] = v16;
      v17 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
      [a1 setSiriContext:v17];

      v18 = HFLogForCategory(4uLL);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v22 = a1;
        __int16 v23 = 2112;
        v24 = v14;
        __int16 v25 = 2112;
        v26 = v15;
        _os_log_impl(&dword_20B986000, v18, OS_LOG_TYPE_DEFAULT, "Moved timer: %@ to room: %@ using targetReferenceAccessory: %@", buf, 0x20u);
      }
    }
    else
    {
      v16 = HFLogForCategory(4uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v22 = a1;
        __int16 v23 = 2112;
        v24 = v14;
        _os_log_error_impl(&dword_20B986000, v16, OS_LOG_TYPE_ERROR, "Error moving timer: %@ to room: %@ since there is no targetReferenceAccessory for that room", buf, 0x16u);
      }
    }

    v12 = v20;
  }
}

@end