@interface PKMetalResourceHandlerBuffer
- (id)initWithSize:(void *)a3 options:(void *)a4 device:(char)a5 purgeable:;
- (void)addReusableBuffer:(uint64_t)a1;
- (void)newBufferWithLength:(const void *)a3 bytes:(unint64_t *)a4 outOffset:(void *)a5 outReusableMetalBuffer:;
@end

@implementation PKMetalResourceHandlerBuffer

- (id)initWithSize:(void *)a3 options:(void *)a4 device:(char)a5 purgeable:
{
  id v10 = a4;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)PKMetalResourceHandlerBuffer;
    v11 = (id *)objc_msgSendSuper2(&v18, sel_init);
    a1 = v11;
    if (v11)
    {
      v11[4] = a2;
      v11[5] = a3;
      objc_storeStrong(v11 + 1, a4);
      *((unsigned char *)a1 + 48) = a5;
      uint64_t v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
      id v13 = a1[7];
      a1[7] = (id)v12;

      char v14 = 1;
      do
      {
        char v15 = v14;
        v16 = -[PKMetalBuffer initWithDevice:length:bytes:options:]([PKMetalBuffer alloc], a1[1], (uint64_t)a1[4], 0, (uint64_t)a1[5]);
        [a1[7] addObject:v16];

        char v14 = 0;
      }
      while ((v15 & 1) != 0);
    }
  }

  return a1;
}

- (void)newBufferWithLength:(const void *)a3 bytes:(unint64_t *)a4 outOffset:(void *)a5 outReusableMetalBuffer:
{
  if (!a1) {
    return 0;
  }
  unint64_t v10 = *(void *)(a1 + 32);
  if (v10 >= a2)
  {
    unint64_t v11 = v10 - *(void *)(a1 + 24);
    if (a2 <= v10 >> 2 || v11 >= a2)
    {
      id v13 = *(void **)(a1 + 16);
      if (v13 && v11 >= a2)
      {
        char v14 = 0;
        if (!a3)
        {
LABEL_27:
          char v15 = v13;
          unint64_t v16 = *(void *)(a1 + 24);
          *(void *)(a1 + 24) = (unint64_t)((double)v16 + ceil((double)a2 * 0.0625) * 16.0);
          goto LABEL_28;
        }
LABEL_24:
        if (v13) {
          v22 = (void *)v13[3];
        }
        else {
          v22 = 0;
        }
        id v23 = v22;
        uint64_t v24 = [v23 contents];

        memcpy((void *)(v24 + *(void *)(a1 + 24)), a3, a2);
        id v13 = *(void **)(a1 + 16);
        goto LABEL_27;
      }
      if (*(unsigned char *)(a1 + 48))
      {
        [v13 unlock];
        char v14 = *(void **)(a1 + 16);
        if (!v14) {
          goto LABEL_16;
        }
      }
      else
      {
        char v14 = *(void **)(a1 + 16);
        if (!v13)
        {
LABEL_16:
          if ([*(id *)(a1 + 56) count])
          {
            uint64_t v18 = [*(id *)(a1 + 56) lastObject];
            v19 = *(void **)(a1 + 16);
            *(void *)(a1 + 16) = v18;

            [*(id *)(a1 + 56) removeLastObject];
          }
          else
          {
            v20 = -[PKMetalBuffer initWithDevice:length:bytes:options:]([PKMetalBuffer alloc], *(void **)(a1 + 8), *(void *)(a1 + 32), 0, *(void *)(a1 + 40));
            v21 = *(void **)(a1 + 16);
            *(void *)(a1 + 16) = v20;
          }
          if (*(unsigned char *)(a1 + 48)) {
            [*(id *)(a1 + 16) lock];
          }
          *(void *)(a1 + 24) = 0;
          id v13 = *(void **)(a1 + 16);
          if (!a3) {
            goto LABEL_27;
          }
          goto LABEL_24;
        }
      }
      id v17 = v14;
      goto LABEL_16;
    }
  }
  char v15 = -[PKMetalBuffer initWithDevice:length:bytes:options:]([PKMetalBuffer alloc], *(void **)(a1 + 8), a2, (uint64_t)a3, *(void *)(a1 + 40));
  char v14 = 0;
  unint64_t v16 = 0;
LABEL_28:
  *a4 = v16;
  if (a5) {
    *a5 = v14;
  }

  return v15;
}

- (void)addReusableBuffer:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && (unint64_t)[*(id *)(a1 + 56) count] <= 7) {
    [*(id *)(a1 + 56) addObject:v3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reusableBuffers, 0);
  objc_storeStrong((id *)&self->_buffer, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end