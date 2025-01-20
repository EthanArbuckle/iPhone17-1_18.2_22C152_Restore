@interface FigFlatToNSDictionaryWrapper
- (BOOL)_ensureFlatDictionaryIsInitialized;
- (FigFlatToNSDictionaryWrapper)initWithFlatDictionary:(OpaqueFigFlatDictionary *)a3 keySpec:(OpaqueFigFlatDictionaryKeySpec *)a4;
- (FigFlatToNSDictionaryWrapper)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (id)initLazilyWithFlatDictionaryBacking:(void *)a3 exportedKeySpec:(void *)a4 deallocatorBlock:(id)a5;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)arrayForFlatDictionaryArrayDataKey:(uint64_t)a1;
- (void)dealloc;
@end

@implementation FigFlatToNSDictionaryWrapper

- (void)dealloc
{
  flatDictionary = self->_flatDictionary;
  if (flatDictionary) {
    CFRelease(flatDictionary);
  }
  keySpec = self->_keySpec;
  if (keySpec) {
    CFRelease(keySpec);
  }
  deallocatorBlock = (void (**)(void))self->_deallocatorBlock;
  if (deallocatorBlock)
  {
    if (self->_exportedKeySpec)
    {
      deallocatorBlock[2]();
      deallocatorBlock = (void (**)(void))self->_deallocatorBlock;
    }
    if (self->_dictionaryBacking)
    {
      deallocatorBlock[2]();
      deallocatorBlock = (void (**)(void))self->_deallocatorBlock;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)FigFlatToNSDictionaryWrapper;
  [(FigFlatToNSDictionaryWrapper *)&v6 dealloc];
}

- (id)initLazilyWithFlatDictionaryBacking:(void *)a3 exportedKeySpec:(void *)a4 deallocatorBlock:(id)a5
{
  v5 = 0;
  if (a3)
  {
    if (a4)
    {
      if (a5)
      {
        v11.receiver = self;
        v11.super_class = (Class)FigFlatToNSDictionaryWrapper;
        v9 = [(FigFlatToNSDictionaryWrapper *)&v11 init];
        v5 = v9;
        if (v9)
        {
          v9->_dictionaryBacking = a3;
          v9->_exportedKeySpec = a4;
          v9->_deallocatorBlock = (id)[a5 copy];
          v5->_lazyInitializationMutex._os_unfair_lock_opaque = 0;
        }
      }
    }
  }
  return v5;
}

- (FigFlatToNSDictionaryWrapper)initWithFlatDictionary:(OpaqueFigFlatDictionary *)a3 keySpec:(OpaqueFigFlatDictionaryKeySpec *)a4
{
  v4 = 0;
  if (a3)
  {
    if (a4)
    {
      v8.receiver = self;
      v8.super_class = (Class)FigFlatToNSDictionaryWrapper;
      v4 = [(FigFlatToNSDictionaryWrapper *)&v8 init];
      if (v4)
      {
        v4->_flatDictionary = (OpaqueFigFlatDictionary *)CFRetain(a3);
        v4->_keySpec = (OpaqueFigFlatDictionaryKeySpec *)CFRetain(a4);
        v4->_keySpace = FigFlatDictionaryKeySpecGetKeySpace((uint64_t)a4);
        v4->_lazyInitializationMutex._os_unfair_lock_opaque = 0;
      }
    }
  }
  return v4;
}

- (FigFlatToNSDictionaryWrapper)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
}

- (BOOL)_ensureFlatDictionaryIsInitialized
{
  if (!a1) {
    return 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2)
  {
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v4 = FigFlatDictionaryKeySpecReconstructFromBinary((const __CFAllocator *)*MEMORY[0x1E4F1CF80], *(int **)(a1 + 40));
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 8) = FigFlatDictionaryCreateFromBacking((uint64_t)v3, v3, v4, *(_DWORD **)(a1 + 32));
    *(_DWORD *)(a1 + 24) = FigFlatDictionaryKeySpecGetKeySpace(*(void *)(a1 + 16));
    uint64_t v2 = *(void *)(a1 + 8);
  }
  BOOL v5 = v2 != 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  return v5;
}

- (unint64_t)count
{
  if (-[FigFlatToNSDictionaryWrapper _ensureFlatDictionaryIsInitialized]((uint64_t)self)) {
    return FigFlatDictionaryGetCountOfKeysWithValues((uint64_t)self->_flatDictionary, v3);
  }
  else {
    return 0;
  }
}

- (id)objectForKey:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!-[FigFlatToNSDictionaryWrapper _ensureFlatDictionaryIsInitialized]((uint64_t)self)) {
    return 0;
  }
  id result = (id)objc_msgSend(a3, "cStringUsingEncoding:", objc_msgSend(a3, "fastestEncoding"));
  if (result)
  {
    id result = (id)FigFlatDictionaryKeyLookupFromIdentifier(self->_keySpace, (uint64_t)result);
    if (result)
    {
      id v6 = result;
      switch(FigFlatDictionaryKeyGetValueType((uint64_t)result))
      {
        case 1u:
          v7 = NSNumber;
          uint64_t Bool = FigFlatDictionaryGetBool((uint64_t)self->_flatDictionary, (uint64_t)v6, 0);
          id result = (id)[v7 numberWithUnsignedChar:Bool];
          break;
        case 2u:
          v9 = NSNumber;
          uint64_t Int16 = FigFlatDictionaryGetInt16((uint64_t)self->_flatDictionary, (uint64_t)v6, 0);
          id result = (id)[v9 numberWithShort:Int16];
          break;
        case 3u:
          objc_super v11 = NSNumber;
          uint64_t Int32 = FigFlatDictionaryGetInt32((uint64_t)self->_flatDictionary, (uint64_t)v6, 0);
          id result = (id)[v11 numberWithInt:Int32];
          break;
        case 4u:
          v13 = NSNumber;
          uint64_t Int64 = FigFlatDictionaryGetInt64((uint64_t)self->_flatDictionary, (uint64_t)v6, 0);
          id result = (id)[v13 numberWithLongLong:Int64];
          break;
        case 5u:
          v15 = NSNumber;
          *(float *)&double v16 = FigFlatDictionaryGetFloat32((uint64_t)self->_flatDictionary, (uint64_t)v6, 0);
          id result = (id)[v15 numberWithFloat:v16];
          break;
        case 6u:
          v17 = NSNumber;
          double Float64 = FigFlatDictionaryGetFloat64((uint64_t)self->_flatDictionary, (uint64_t)v6, 0);
          id result = (id)[v17 numberWithDouble:Float64];
          break;
        case 7u:
          LODWORD(v24.value) = 0;
          FigFlatDictionaryGetStringSize((uint64_t)self->_flatDictionary, (uint64_t)v6, &v24, 0);
          if ((LODWORD(v24.value) - 1024) <= 0xFFFFFC00) {
            return 0;
          }
          v19 = (char *)&time - ((LODWORD(v24.value) + 15) & 0x1FFFFFFF0);
          LODWORD(time.value) = v24.value;
          FigFlatDictionaryGetString((uint64_t)self->_flatDictionary, (uint64_t)v6, 0, v19, (unsigned int *)&time);
          id result = (id)[NSString stringWithUTF8String:v19];
          break;
        case 8u:
          LODWORD(v24.value) = 0;
          FigFlatDictionaryGetDataSize((uint64_t)self->_flatDictionary, (uint64_t)v6, (int *)&v24, 0);
          if ((LODWORD(v24.value) - 1024) <= 0xFFFFFC00) {
            return 0;
          }
          v22 = (char *)&time - ((LODWORD(v24.value) + 15) & 0x1FFFFFFF0);
          LODWORD(time.value) = v24.value;
          FigFlatDictionaryGetData((uint64_t)self->_flatDictionary, (uint64_t)v6, 0, v22, (unsigned int *)&time);
          id result = (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:v22 length:LODWORD(time.value)];
          break;
        case 9u:
          id result = -[FigFlatToNSDictionaryWrapper arrayForFlatDictionaryArrayDataKey:]((uint64_t)self, (uint64_t)v6);
          break;
        case 0xAu:
          memset(&v24, 0, sizeof(v24));
          FigFlatDictionaryGetCMTime((uint64_t)self->_flatDictionary, (uint64_t)v6, 0, &v24);
          CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
          CMTime time = v24;
          id result = CMTimeCopyAsDictionary(&time, v20);
          break;
        case 0xBu:
          v27.origin.x = FigFlatDictionaryGetCGRect((uint64_t)self->_flatDictionary, (uint64_t)v6, 0);
          CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v27);
          id result = DictionaryRepresentation;
          break;
        default:
          return 0;
      }
    }
  }
  return result;
}

- (void)arrayForFlatDictionaryArrayDataKey:(uint64_t)a1
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int ArrayDataType = FigFlatDictionaryGetArrayDataType(*(void *)(a1 + 8), a2);
  unsigned int v36 = 0;
  FigFlatDictionaryGetDataSize(*(void *)(a1 + 8), a2, (int *)&v36, 0);
  BOOL v5 = 0;
  switch(ArrayDataType)
  {
    case 1:
      uint64_t v6 = v36;
      if ((int)v36 < 1) {
        goto LABEL_38;
      }
      v7 = (unsigned __int8 *)&time - ((v36 + 15) & 0x1FFFFFFF0);
      FigFlatDictionaryGetData(*(void *)(a1 + 8), a2, 0, v7, &v36);
      BOOL v5 = (void *)[MEMORY[0x1E4F1CA48] array];
      do
      {
        unsigned int v8 = *v7++;
        objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithBool:", v8));
        --v6;
      }
      while (v6);
      break;
    case 2:
      if (v36 < 2) {
        goto LABEL_38;
      }
      unint64_t v9 = (unint64_t)v36 >> 1;
      v10 = (__int16 *)((char *)&time - ((2 * v9 + 15) & 0x1FFFFFFF0));
      FigFlatDictionaryGetData(*(void *)(a1 + 8), a2, 0, v10, &v36);
      BOOL v5 = (void *)[MEMORY[0x1E4F1CA48] array];
      if (v9 <= 1) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = v9;
      }
      do
      {
        unsigned int v12 = *v10++;
        objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithShort:", v12));
        --v11;
      }
      while (v11);
      break;
    case 3:
      if (v36 < 4) {
        goto LABEL_38;
      }
      unint64_t v17 = (unint64_t)v36 >> 2;
      v18 = (unsigned int *)((char *)&time - ((4 * v17 + 15) & 0x1FFFFFFF0));
      FigFlatDictionaryGetData(*(void *)(a1 + 8), a2, 0, v18, &v36);
      BOOL v5 = (void *)[MEMORY[0x1E4F1CA48] array];
      if (v17 <= 1) {
        uint64_t v19 = 1;
      }
      else {
        uint64_t v19 = v17;
      }
      do
      {
        unsigned int v20 = *v18++;
        objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v20));
        --v19;
      }
      while (v19);
      break;
    case 4:
      if (v36 < 8) {
        goto LABEL_38;
      }
      unint64_t v21 = (unint64_t)v36 >> 3;
      v22 = (CMTimeValue *)((char *)&time.value - ((8 * v21 + 15) & 0x1FFFFFFF0));
      FigFlatDictionaryGetData(*(void *)(a1 + 8), a2, 0, v22, &v36);
      BOOL v5 = (void *)[MEMORY[0x1E4F1CA48] array];
      if (v21 <= 1) {
        uint64_t v23 = 1;
      }
      else {
        uint64_t v23 = v21;
      }
      do
      {
        uint64_t v24 = *v22++;
        objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithLongLong:", v24));
        --v23;
      }
      while (v23);
      break;
    case 5:
      if (v36 < 4) {
        goto LABEL_38;
      }
      unint64_t v25 = (unint64_t)v36 >> 2;
      v26 = (int *)((char *)&time - ((4 * v25 + 15) & 0x1FFFFFFF0));
      FigFlatDictionaryGetData(*(void *)(a1 + 8), a2, 0, v26, &v36);
      BOOL v5 = (void *)[MEMORY[0x1E4F1CA48] array];
      if (v25 <= 1) {
        uint64_t v28 = 1;
      }
      else {
        uint64_t v28 = v25;
      }
      do
      {
        int v29 = *v26++;
        LODWORD(v27) = v29;
        objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v27));
        --v28;
      }
      while (v28);
      break;
    case 6:
      if (v36 < 8) {
        goto LABEL_38;
      }
      unint64_t v13 = (unint64_t)v36 >> 3;
      v14 = (double *)((char *)&time.value - ((8 * v13 + 15) & 0x1FFFFFFF0));
      FigFlatDictionaryGetData(*(void *)(a1 + 8), a2, 0, v14, &v36);
      BOOL v5 = (void *)[MEMORY[0x1E4F1CA48] array];
      if (v13 <= 1) {
        uint64_t v15 = 1;
      }
      else {
        uint64_t v15 = v13;
      }
      do
      {
        double v16 = *v14++;
        objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", v16));
        --v15;
      }
      while (v15);
      break;
    case 10:
      if (v36 >= 0x18)
      {
        unsigned int v30 = v36 / 0x18;
        v31 = (CMTime *)((char *)&time - ((24 * (v36 / 0x18) + 15) & 0x3FFFFFFF0));
        FigFlatDictionaryGetData(*(void *)(a1 + 8), a2, 0, v31, &v36);
        BOOL v5 = (void *)[MEMORY[0x1E4F1CA48] array];
        CFAllocatorRef v32 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        if (v30 <= 1) {
          uint64_t v33 = 1;
        }
        else {
          uint64_t v33 = v30;
        }
        do
        {
          CMTime time = *v31;
          objc_msgSend(v5, "addObject:", CMTimeCopyAsDictionary(&time, v32));
          ++v31;
          --v33;
        }
        while (v33);
      }
      else
      {
LABEL_38:
        BOOL v5 = (void *)MEMORY[0x1E4F1CBF0];
      }
      break;
    default:
      return v5;
  }
  return v5;
}

- (id)keyEnumerator
{
  if (!-[FigFlatToNSDictionaryWrapper _ensureFlatDictionaryIsInitialized]((uint64_t)self))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  int8x8_t v3 = [[FigFlatToNSDictionaryWrapperKeyEnumerator alloc] initWithFlatDictionary:self->_flatDictionary];
  return v3;
}

@end