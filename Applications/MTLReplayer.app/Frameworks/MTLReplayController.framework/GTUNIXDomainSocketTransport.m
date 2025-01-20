@interface GTUNIXDomainSocketTransport
@end

@implementation GTUNIXDomainSocketTransport

id __38__GTUNIXDomainSocketTransport_connect__block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[52])
  {
    uint64_t v3 = 32;
LABEL_3:
    [*(id *)(a1 + 40) setError:[GTError_replayer errorWithDomain:@"DYErrorDomain" code:v3 userInfo:0]];
    uint64_t v4 = 0;
LABEL_6:
    v5 = +[NSNumber numberWithBool:v4];
    v6 = *(void **)(a1 + 40);
    return [v6 setResult:v5];
  }
  if ([v2 connected])
  {
    uint64_t v4 = 1;
    goto LABEL_6;
  }
  id v8 = [*(id *)(*(void *)(a1 + 32) + 8) filePathURL];
  if (*(void *)(*(void *)(a1 + 32) + 8)) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    uint64_t v3 = 257;
    goto LABEL_3;
  }
  id v10 = [v8 path];
  v11 = *(_DWORD **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  if (v11[65] == 2)
  {
    return [v11 _connectServer:v10 future:v12];
  }
  else
  {
    return [v11 _connectClient:v10 future:v12];
  }
}

unsigned char *__53__GTUNIXDomainSocketTransport__connectServer_future___block_invoke(uint64_t a1)
{
  close(*(_DWORD *)(a1 + 48));
  dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 264));
  *(void *)(*(void *)(a1 + 32) + 264) = 0;
  result = *(unsigned char **)(a1 + 32);
  if (result[52])
  {
    [*(id *)(a1 + 40) setError:[result error]];
    uint64_t v3 = +[NSNumber numberWithBool:0];
    uint64_t v4 = *(void **)(a1 + 40);
    return [v4 setResult:v3];
  }
  return result;
}

id __53__GTUNIXDomainSocketTransport__connectServer_future___block_invoke_2(uint64_t a1)
{
  id result = (id)dispatch_source_testcancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 264));
  if (!result)
  {
    socklen_t v9 = 106;
    uint64_t v3 = accept(*(_DWORD *)(a1 + 48), &v10, &v9);
    if (v3 == -1)
    {
      v7 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
      id v8 = *(void **)(a1 + 40);
      v6 = (id *)(a1 + 40);
      [v8 setError:v7];
      v5 = +[NSNumber numberWithBool:0];
    }
    else
    {
      uint64_t v4 = v3;
      dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 264));
      [*(id *)(a1 + 32) runWithSocket:v4];
      v5 = +[NSNumber numberWithBool:1];
      v6 = (id *)(a1 + 40);
    }
    return [*v6 setResult:v5];
  }
  return result;
}

void *__38__GTUNIXDomainSocketTransport_setUrl___block_invoke(void *result)
{
  v1 = *(void **)(result[5] + 8);
  if ((void *)result[4] != v1)
  {
    v2 = result;

    id result = (id)v2[4];
    *(void *)(v2[5] + 8) = result;
  }
  return result;
}

@end