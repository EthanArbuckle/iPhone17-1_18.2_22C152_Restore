@interface NWURLSessionReadRequest
- (void)putData:(char)a3 complete:;
- (void)putError:(uint64_t)a1;
- (void)tryFulfillRequest;
@end

@implementation NWURLSessionReadRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong(&self->_awaitingData, 0);
}

- (void)putData:(char)a3 complete:
{
  v5 = a2;
  if (a1)
  {
    data2 = v5;
    if (v5)
    {
      v6 = *(void **)(a1 + 40);
      if (v6)
      {
        v7 = v6;
        dispatch_data_t concat = dispatch_data_create_concat(v7, data2);
        v9 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = concat;
      }
      else
      {
        v10 = v5;
        v7 = *(NSObject **)(a1 + 40);
        *(void *)(a1 + 40) = v10;
      }
    }
    *(unsigned char *)(a1 + 8) = a3;
    -[NWURLSessionReadRequest tryFulfillRequest](a1);
    v5 = data2;
  }
}

- (void)tryFulfillRequest
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    if (*(void *)(a1 + 48))
    {
      dispatch_data_t data = v1;
      objc_setProperty_nonatomic_copy((id)a1, v15, 0, 32);
      ((void (*)(dispatch_data_t, void, void, void))data[2].isa)(data, 0, 0, *(void *)(a1 + 48));
    }
    else
    {
      if (!*(unsigned char *)(a1 + 8))
      {
        id v9 = *(id *)(a1 + 40);
        if (!v9) {
          return;
        }
        v10 = v9;
        size_t size = dispatch_data_get_size(*(dispatch_data_t *)(a1 + 40));
        size_t v12 = *(void *)(a1 + 16);

        if (size <= v12) {
          return;
        }
      }
      dispatch_data_t data = (dispatch_data_t)*(id *)(a1 + 40);
      v3 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0;

      if (data)
      {
        size_t v4 = dispatch_data_get_size(data);
        size_t v5 = *(void *)(a1 + 24);
        if (v4 > v5)
        {
          dispatch_data_t subrange = dispatch_data_create_subrange(data, v5, 0xFFFFFFFFFFFFFFFFLL);
          v7 = *(void **)(a1 + 40);
          *(void *)(a1 + 40) = subrange;

          dispatch_data_t v8 = dispatch_data_create_subrange(data, 0, *(void *)(a1 + 24));
          dispatch_data_t data = v8;
        }
      }
      else
      {
        dispatch_data_t data = 0;
      }
      v13 = (void (**)(void))*(id *)(a1 + 32);
      objc_setProperty_nonatomic_copy((id)a1, v14, 0, 32);
      v13[2](v13);
    }
  }
}

- (void)putError:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    size_t v4 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = 0;

    if (!*(unsigned char *)(a1 + 8) && !*(void *)(a1 + 48))
    {
      objc_storeStrong((id *)(a1 + 48), a2);
      -[NWURLSessionReadRequest tryFulfillRequest](a1);
    }
  }
}

@end