@interface JavaUtilConcurrentConcurrentHashMap_Traverser
+ (const)__metadata;
- (JavaUtilConcurrentConcurrentHashMap_Traverser)initWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (id)advance;
- (void)dealloc;
- (void)pushStateWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)recoverStateWithInt:(int)a3;
@end

@implementation JavaUtilConcurrentConcurrentHashMap_Traverser

- (id)advance
{
  v3 = (id *)(a1 + 16);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    unint64_t v4 = *(void *)(v2 + 32);
    if (v4)
    {
LABEL_3:
      v5 = v3;
      v6 = (void *)v4;
      goto LABEL_25;
    }
  }
  v7 = (uint64_t *)(a1 + 8);
  while (*(_DWORD *)(a1 + 44) < *(_DWORD *)(a1 + 48))
  {
    v8 = (_DWORD *)*v7;
    if (!*v7) {
      break;
    }
    int v9 = v8[2];
    int v10 = *(_DWORD *)(a1 + 40);
    if (v9 <= v10 || v10 < 0) {
      break;
    }
    v11 = JavaUtilConcurrentConcurrentHashMap_tabAtWithJavaUtilConcurrentConcurrentHashMap_NodeArray_withInt_(*v7, *(_DWORD *)(a1 + 40));
    unint64_t v4 = (unint64_t)v11;
    if (v11 && (v11[2] & 0x80000000) != 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_28;
        }
        JreStrongAssign((id *)(a1 + 8), *(void **)(v4 + 40));
        sub_1001BFD34(a1, v8, v10, v9);
        unint64_t v4 = 0;
        goto LABEL_18;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
LABEL_28:
        }
          JreThrowClassCastException();
        unint64_t v4 = atomic_load((unint64_t *)(v4 + 48));
      }
      else
      {
        unint64_t v4 = 0;
      }
    }
    if (*(void *)(a1 + 24))
    {
      sub_1001BFDDC((char *)a1, v9);
    }
    else
    {
      int v12 = *(_DWORD *)(a1 + 52) + v10;
      *(_DWORD *)(a1 + 40) = v12;
      if (v12 >= v9)
      {
        int v13 = *(_DWORD *)(a1 + 44) + 1;
        *(_DWORD *)(a1 + 40) = v13;
        *(_DWORD *)(a1 + 44) = v13;
      }
    }
LABEL_18:
    if (v4) {
      goto LABEL_3;
    }
  }
  v5 = v3;
  v6 = 0;
LABEL_25:
  return JreStrongAssign(v5, v6);
}

- (JavaUtilConcurrentConcurrentHashMap_Traverser)initWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  self->index_ = a5;
  self->baseIndex_ = a5;
  self->baseLimit_ = a6;
  self->baseSize_ = a4;
  JreStrongAssign((id *)&self->next_, 0);
  return self;
}

- (void)pushStateWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

- (void)recoverStateWithInt:(int)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentConcurrentHashMap_Traverser;
  [(JavaUtilConcurrentConcurrentHashMap_Traverser *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041FA30;
}

@end