@interface CallObjectPurgedCallback
@end

@implementation CallObjectPurgedCallback

void __figXPCConnection_CallObjectPurgedCallback_block_invoke(uint64_t a1)
{
  xpc_object_t array = xpc_dictionary_get_array(*(xpc_object_t *)(a1 + 32), ".ObjectIDs");
  int64_t int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), ".PurgeIdentifier");
  if (array)
  {
    int64_t v4 = int64;
    if (xpc_array_get_count(array))
    {
      size_t v5 = 0;
      do
      {
        uint64_t int64 = (void *)xpc_array_get_uint64(array, v5);
        id v7 = FigCFWeakReferenceTableCopyValue(*(void *)(*(void *)(*(void *)(a1 + 40) + 16) + 112), uint64);
        if (v7)
        {
          v8 = v7;
          (*(void (**)(id, int64_t))(*(void *)(*(void *)(a1 + 40) + 16) + 72))(v7, v4);
          CFRelease(v8);
        }
        ++v5;
      }
      while (v5 < xpc_array_get_count(array));
    }
  }
  FigXPCRelease(*(xpc_object_t *)(a1 + 32));
  v9 = *(const void **)(a1 + 40);
  if (v9)
  {
    CFRelease(v9);
  }
}

@end