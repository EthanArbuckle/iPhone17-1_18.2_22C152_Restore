@interface NSConcretePointerFunctions
+ (BOOL)initializeSlice:(NSSlice *)a3 withOptions:(unint64_t)a4;
+ (void)initializeBackingStore:(NSSlice *)a3 sentinel:(BOOL)a4 weakAutoreleasing:(BOOL)a5 dynamic:(BOOL)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)usesStrongWriteBarrier;
- (BOOL)usesWeakReadAndWriteBarriers;
- (NSConcretePointerFunctions)init;
- (NSConcretePointerFunctions)initWithOptions:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)acquireFunction;
- (void)dealloc;
- (void)descriptionFunction;
- (void)hashFunction;
- (void)isEqualFunction;
- (void)relinquishFunction;
- (void)setAcquireFunction:(void *)a3;
- (void)setDescriptionFunction:(void *)a3;
- (void)setHashFunction:(void *)a3;
- (void)setIsEqualFunction:(void *)a3;
- (void)setRelinquishFunction:(void *)a3;
- (void)setSizeFunction:(void *)a3;
- (void)setUsesStrongWriteBarrier:(BOOL)a3;
- (void)setUsesWeakReadAndWriteBarriers:(BOOL)a3;
- (void)sizeFunction;
@end

@implementation NSConcretePointerFunctions

- (NSConcretePointerFunctions)initWithOptions:(unint64_t)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  memset(v5, 0, sizeof(v5));
  if (([(id)objc_opt_class() initializeSlice:v5 withOptions:a3] & 1) != 0
    || !_CFExecutableLinkedOnOrAfter())
  {
    NSSliceInitWithSlice(&self->slice.items, v5);
  }
  else
  {
    NSLog((NSString *)@"*** An unsupported PointerFunctions configuration was requested, probably for use by NSMapTable, NSHashTable, or NSPointerArray.  The requested configuration %s", "would create only a partially initialized NSPointerFunctions object");
    NSDeallocateObject(self);
    return 0;
  }
  return self;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  NSSliceDealloc((uint64_t)&self->slice);
  v3.receiver = self;
  v3.super_class = (Class)NSConcretePointerFunctions;
  [(NSConcretePointerFunctions *)&v3 dealloc];
}

+ (BOOL)initializeSlice:(NSSlice *)a3 withOptions:(unint64_t)a4
{
  __int16 v4 = a4;
  a3->items = 0;
  uint64_t v6 = a4;
  unint64_t v7 = (unsigned __int16)a4 & 0xFF00;
  unint64_t v8 = a4 & 0xFFFFFFFFFFFF0000;
  if (_CFExecutableLinkedOnOrAfter())
  {
    if (v8 == 0x10000 && (v7 == 256 || v4 <= 5u && ((1 << v4) & 0x26) != 0))
    {
      v9 = "fails due to copyin with opaque personality or opaque or weak memory";
      goto LABEL_13;
    }
    if ((v4 & 0xFD00) == 0 && (v4 > 6u || ((1 << v4) & 0x67) == 0))
    {
      v9 = "fails due to objects with none of strong, weak, or opaque memory\n";
LABEL_13:
      NSLog((NSString *)@"*** An unsupported PointerFunctions configuration was requested, probably for use by NSMapTable, NSHashTable, or NSPointerArray.  The requested configuration %s", v9);
      return 0;
    }
    if (v7 == 1280 && v6 != 2)
    {
      v9 = "fails due to integer personality not using opaque memory\n";
      goto LABEL_13;
    }
  }
  v11 = (NSSliceExternalAcquisitionProperties *)&initializeSlice_withOptions__zeroingWeakMemory;
  switch((char)v4)
  {
    case 0:
      if (v8 == 0x10000)
      {
        if (v7)
        {
          if (v7 != 512)
          {
            v9 = "fails due to strong copyin not used with objects\n";
            goto LABEL_13;
          }
          v12 = (NSSliceExternalAcquisitionProperties *)&initializeSlice_withOptions__strongMemory_copyObjectPointers;
          goto LABEL_30;
        }
        v15 = (NSSliceExternalAcquisitionProperties *)&initializeSlice_withOptions__strongMemory_copyObjects;
      }
      else
      {
        if (v7)
        {
          if (v7 != 512)
          {
LABEL_31:
            v11 = (NSSliceExternalAcquisitionProperties *)&initializeSlice_withOptions__opaqueMemory;
LABEL_32:
            a3->acquisitionProps = v11;
            switch((v7 >> 8))
            {
              case 0u:
              case 2u:
                if (v7) {
                  goto LABEL_34;
                }
                goto LABEL_44;
              case 1u:
                v14 = (NSSliceExternalPersonalityProperties *)&initializeSlice_withOptions__opaquePers;
                goto LABEL_45;
              case 3u:
                v14 = (NSSliceExternalPersonalityProperties *)&initializeSlice_withOptions__cStringPers;
                goto LABEL_45;
              case 4u:
                v14 = (NSSliceExternalPersonalityProperties *)&initializeSlice_withOptions__structPers;
                goto LABEL_45;
              case 5u:
                v14 = (NSSliceExternalPersonalityProperties *)&initializeSlice_withOptions__intPers;
                goto LABEL_45;
              default:
                return 0;
            }
          }
          v12 = (NSSliceExternalAcquisitionProperties *)&initializeSlice_withOptions__strongMemory_objectPointers;
LABEL_30:
          a3->acquisitionProps = v12;
LABEL_34:
          v14 = (NSSliceExternalPersonalityProperties *)&initializeSlice_withOptions__objectPtrPers;
          goto LABEL_45;
        }
        v15 = (NSSliceExternalAcquisitionProperties *)&initializeSlice_withOptions__strongMemory_objects;
      }
      a3->acquisitionProps = v15;
LABEL_44:
      v14 = (NSSliceExternalPersonalityProperties *)&initializeSlice_withOptions__objectPers;
LABEL_45:
      a3->personalityProps = v14;
      return 1;
    case 1:
      goto LABEL_32;
    case 2:
      goto LABEL_31;
    case 3:
      v11 = (NSSliceExternalAcquisitionProperties *)&initializeSlice_withOptions__mallocMemory;
      v13 = (NSSliceExternalAcquisitionProperties *)&initializeSlice_withOptions__mallocMemory_copy;
      goto LABEL_22;
    case 4:
      v11 = (NSSliceExternalAcquisitionProperties *)&initializeSlice_withOptions__machMemory;
      v13 = (NSSliceExternalAcquisitionProperties *)&initializeSlice_withOptions__machMemory_copy;
LABEL_22:
      if (v8 == 0x10000) {
        v11 = v13;
      }
      goto LABEL_32;
    case 5:
      v11 = (NSSliceExternalAcquisitionProperties *)&initializeSlice_withOptions__weakAutoreleasingMemory;
      goto LABEL_32;
    case 6:
      v11 = (NSSliceExternalAcquisitionProperties *)&initializeSlice_withOptions__weakNonautoreleasingMemory;
      goto LABEL_32;
    default:
      return 0;
  }
}

+ (void)initializeBackingStore:(NSSlice *)a3 sentinel:(BOOL)a4 weakAutoreleasing:(BOOL)a5 dynamic:(BOOL)a6
{
  acquisitionProps = a3->acquisitionProps;
  if (*((unsigned char *)acquisitionProps + 1))
  {
    unint64_t v8 = (long long *)&weakBarriers;
    int v9 = *((unsigned __int8 *)acquisitionProps + 2);
    if (a5)
    {
      unint64_t v8 = (long long *)&weakBarriersAutoreleasing;
      v10 = (long long *)&weakBarriersSentinelAutoreleasing;
    }
    else
    {
      v10 = (long long *)&weakBarriersSentinel;
    }
    if (a4) {
      unint64_t v8 = v10;
    }
    if (v9) {
      v11 = v8;
    }
    else {
      v11 = &noWriteBarriers;
    }
    if (a6) {
      goto LABEL_11;
    }
LABEL_15:
    a3->internalProps = (NSSliceInternalProperties *)v11;
    return;
  }
  v11 = &noWriteBarriers;
  if (!a6) {
    goto LABEL_15;
  }
LABEL_11:
  v12 = (NSSliceInternalProperties *)malloc_type_malloc(0x40uLL, 0x1080040E27AD052uLL);
  long long v13 = *v11;
  long long v14 = v11[1];
  long long v15 = v11[3];
  *((_OWORD *)v12 + 2) = v11[2];
  *((_OWORD *)v12 + 3) = v15;
  *(_OWORD *)v12 = v13;
  *((_OWORD *)v12 + 1) = v14;
  internalProps = a3->internalProps;
  if (internalProps) {
    free(internalProps);
  }
  a3->internalProps = v12;
}

- (void)setIsEqualFunction:(void *)a3
{
  personalityProps = self->slice.personalityProps;
  *((void *)personalityProps + 3) = a3;
  *(_WORD *)personalityProps = 0;
}

- (void)setHashFunction:(void *)a3
{
  personalityProps = self->slice.personalityProps;
  *((void *)personalityProps + 2) = a3;
  *(_WORD *)personalityProps = 0;
}

- (void)setDescriptionFunction:(void *)a3
{
  *((void *)self->slice.personalityProps + 4) = a3;
}

- (void)setSizeFunction:(void *)a3
{
  *((void *)self->slice.personalityProps + 1) = a3;
}

- (void)setRelinquishFunction:(void *)a3
{
  *((void *)self->slice.acquisitionProps + 2) = a3;
}

- (NSConcretePointerFunctions)init
{
  return [(NSConcretePointerFunctions *)self initWithOptions:0];
}

- (void)setAcquireFunction:(void *)a3
{
  *((void *)self->slice.acquisitionProps + 1) = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  __int16 v4 = [NSConcretePointerFunctions alloc];
  NSSliceInitWithSlice(&v4->slice.items, &self->slice.items);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (void)setUsesStrongWriteBarrier:(BOOL)a3
{
  acquisitionProps = self->slice.acquisitionProps;
  *((unsigned char *)acquisitionProps + 1) = 0;
  *(unsigned char *)acquisitionProps = a3;
}

- (void)setUsesWeakReadAndWriteBarriers:(BOOL)a3
{
  acquisitionProps = self->slice.acquisitionProps;
  *(unsigned char *)acquisitionProps = 0;
  *((unsigned char *)acquisitionProps + 1) = a3;
}

- (void)sizeFunction
{
  return (void *)*((void *)self->slice.personalityProps + 1);
}

- (void)hashFunction
{
  return (void *)*((void *)self->slice.personalityProps + 2);
}

- (void)isEqualFunction
{
  return (void *)*((void *)self->slice.personalityProps + 3);
}

- (void)descriptionFunction
{
  return (void *)*((void *)self->slice.personalityProps + 4);
}

- (void)acquireFunction
{
  return (void *)*((void *)self->slice.acquisitionProps + 1);
}

- (void)relinquishFunction
{
  return (void *)*((void *)self->slice.acquisitionProps + 2);
}

- (BOOL)usesStrongWriteBarrier
{
  return *(unsigned char *)self->slice.acquisitionProps;
}

- (BOOL)usesWeakReadAndWriteBarriers
{
  return *((unsigned char *)self->slice.acquisitionProps + 1);
}

@end