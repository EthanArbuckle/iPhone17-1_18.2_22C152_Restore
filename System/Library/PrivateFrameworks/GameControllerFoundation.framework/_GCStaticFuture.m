@interface _GCStaticFuture
- _initCancelled;
- (id)_initWithError:(void *)a1;
- (id)_initWithResult:(void *)a1;
@end

@implementation _GCStaticFuture

- (id)_initWithResult:(void *)a1
{
  id v4 = a2;
  v5 = v4;
  if (a1)
  {
    if (!v4)
    {
      v8 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithResult_, a1, @"GCFuture.mm", 1172, @"Invalid parameter not satisfying: %s", "result != nil");
    }
    v9.receiver = a1;
    v9.super_class = (Class)GCFuture;
    id v6 = objc_msgSendSuper2(&v9, sel_init);
    *((_DWORD *)v6 + 2) = 0;
    *((unsigned char *)v6 + 12) = -2;
    *((unsigned char *)v6 + 12) = 2;
    objc_storeStrong((id *)v6 + 2, a2);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_initWithError:(void *)a1
{
  id v4 = a2;
  v5 = v4;
  if (a1)
  {
    if (!v4)
    {
      v8 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithError_, a1, @"GCFuture.mm", 1186, @"Invalid parameter not satisfying: %s", "error != nil");
    }
    v9.receiver = a1;
    v9.super_class = (Class)GCFuture;
    id v6 = objc_msgSendSuper2(&v9, sel_init);
    *((_DWORD *)v6 + 2) = 0;
    *((unsigned char *)v6 + 12) = -2;
    *((unsigned char *)v6 + 12) = 1;
    objc_storeStrong((id *)v6 + 2, a2);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- _initCancelled
{
  _DWORD *v1;
  void *v2;
  objc_super v4;

  if (!a1) {
    return 0;
  }
  v4.receiver = a1;
  v4.super_class = (Class)GCFuture;
  v1 = objc_msgSendSuper2(&v4, sel_init);
  v1[2] = 0;
  *((unsigned char *)v1 + 12) = -2;
  *((unsigned char *)v1 + 12) = 0;
  v2 = (void *)*((void *)v1 + 2);
  *((void *)v1 + 2) = 0;

  return v1;
}

@end