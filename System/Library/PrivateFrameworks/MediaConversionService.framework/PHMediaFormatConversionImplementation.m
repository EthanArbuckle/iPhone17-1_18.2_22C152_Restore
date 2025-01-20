@interface PHMediaFormatConversionImplementation
@end

@implementation PHMediaFormatConversionImplementation

void __112__PHMediaFormatConversionImplementation_MediaConversionService_performImageConversionRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a2 == 1)
  {
    [*(id *)(a1 + 32) setDestination:*(void *)(a1 + 40)];
    v9 = *(void **)(a1 + 32);
    uint64_t v10 = 4;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v8;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Image format conversion failed: %@", (uint8_t *)&v11, 0xCu);
    }
    [*(id *)(a1 + 32) setError:v8];
    v9 = *(void **)(a1 + 32);
    uint64_t v10 = 5;
  }
  [v9 setStatus:v10];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __133__PHMediaFormatConversionImplementation_MediaConversionService_submitSinglePassVideoConversionRequest_destination_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [*(id *)(a1 + 32) stopObserving];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (a2 == 1)
    {
      [WeakRetained setStatus:4];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v6;
        _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Video format conversion failed: %@", buf, 0xCu);
      }
      [v8 setStatus:5];
      if (a2 == 4)
      {
        v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v12 = *MEMORY[0x1E4F28A50];
        id v13 = v6;
        uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
        uint64_t v11 = [v9 errorWithDomain:@"PHMediaFormatConversionErrorDomain" code:3 userInfo:v10];

        id v6 = (id)v11;
      }
      [v8 setError:v6];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __136__PHMediaFormatConversionImplementation_MediaConversionService_submitNonSinglePassVideoConversionRequest_destination_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (a2 == 1)
    {
      [WeakRetained setDestination:*(void *)(a1 + 32)];
      [v8 setStatus:4];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v6;
        _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Video format conversion failed: %@", buf, 0xCu);
      }
      [v8 setStatus:5];
      if (a2 == 4)
      {
        v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v12 = *MEMORY[0x1E4F28A50];
        id v13 = v6;
        uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
        uint64_t v11 = [v9 errorWithDomain:@"PHMediaFormatConversionErrorDomain" code:3 userInfo:v10];

        id v6 = (id)v11;
      }
      [v8 setError:v6];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end