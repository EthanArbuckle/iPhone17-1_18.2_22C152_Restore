@interface FulfillOnDemandResource
@end

@implementation FulfillOnDemandResource

void ___FulfillOnDemandResource_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = [NSString stringWithFormat:@"Failed to fulfill on-demand resource: %@", *(void *)(a1 + 32)];
    v5 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v4;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] %@, error: %@", buf, 0x16u);
    }

    uint64_t v6 = _PHResourceLocalAvailabilityRequestError(1, v3, v4);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    v4 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v11 = v9;
      _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest] Did fulfill on-demand resource: %@", buf, 0xCu);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end