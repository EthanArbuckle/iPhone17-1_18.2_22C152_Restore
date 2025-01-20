@interface _CTFontFallbacksArray
- (id).cxx_construct;
- (id)objectAtIndex:(unint64_t)a3;
- (uint64_t)objectAtIndex:(int)a3 shouldLock:(int)a4 addRanges:;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation _CTFontFallbacksArray

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CTFontFallbacksArray;
  [(_CTFontFallbacksArray *)&v3 dealloc];
}

- (unint64_t)count
{
  return self->_count;
}

- (uint64_t)objectAtIndex:(int)a3 shouldLock:(int)a4 addRanges:
{
  if (!a1) {
    return 0;
  }
  if (a3) {
    os_unfair_lock_lock_with_options();
  }
  unint64_t v8 = 0x1EB2CD000uLL;
  uint64_t v9 = [*(id *)(a1 + 48) objectAtIndex:a2];
  unint64_t v10 = 0x1E4F1C000uLL;
  if (v9 != [MEMORY[0x1E4F1CA98] null])
  {
    if (a3) {
      goto LABEL_102;
    }
    return v9;
  }
  int v74 = a4;
  if (a3) {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
  uint64_t v75 = *(void *)(a1 + 16);
  id v76 = (id)0xAAAAAAAAAAAAAAAALL;
  v11 = (TDescriptor **)[*(id *)(a1 + 40) objectAtIndex:a2];
  uint64_t v12 = *(void *)(a1 + 24);
  int v13 = *(_DWORD *)(a1 + 64);
  v78 = (void *)0xAAAAAAAAAAAAAAAALL;
  id v79 = v11;
  v14 = v11[5];
  if ((*((_DWORD *)v14 + 4) & 0x80000000) == 0) {
    TDescriptor::InitBaseFont(v11[5], 0, 0.0);
  }
  explicit = (atomic_ullong *)atomic_load_explicit((atomic_ullong *volatile)v14 + 4, memory_order_acquire);
  v78 = explicit;
  if (!explicit)
  {
    v16 = (TDescriptor **)(id)atomic_load_explicit((atomic_ullong *volatile)&v79, memory_order_acquire);
    TDescriptor::CreateMatchingDescriptor(v16[5], 0, 0.0, 0, (atomic_ullong *)&v81);

    if (!atomic_load_explicit((atomic_ullong *volatile)&v79, memory_order_acquire))
    {
      v81.isa = v11;
      id v76 = (id)atomic_exchange((atomic_ullong *volatile)&v81, 0);

      unint64_t v8 = 0x1EB2CD000;
      goto LABEL_71;
    }
    v17 = (TDescriptor **)(id)atomic_load_explicit((atomic_ullong *volatile)&v79, memory_order_acquire);
    v18 = v17;
    v19 = v17[5];
    if ((*((_DWORD *)v19 + 4) & 0x80000000) == 0) {
      TDescriptor::InitBaseFont(v17[5], 0, 0.0);
    }
    explicit = (atomic_ullong *)atomic_load_explicit((atomic_ullong *volatile)v19 + 4, memory_order_acquire);
    v78 = explicit;

    unint64_t v8 = 0x1EB2CD000;
    if (!explicit)
    {
      v81.isa = v11;
      id v76 = (id)atomic_exchange((atomic_ullong *volatile)&v81, 0);
      isa = v81.isa;
      goto LABEL_70;
    }
  }
  id v77 = (id)0xAAAAAAAAAAAAAAAALL;
  v85[0] = 0;
  if (!v12)
  {
LABEL_59:
    id v77 = (id)atomic_exchange((atomic_ullong *volatile)v85, 0);
    goto LABEL_60;
  }
  double v20 = TBaseFont::TraitsDistance(explicit, (const TTraitsValues *)v12);
  if (v20 <= 0.000001 || (double v21 = v20, (*(unsigned int (**)(atomic_ullong *))(*explicit + 712))(explicit)))
  {
    id v77 = 0;
    goto LABEL_60;
  }
  id v84 = (id)0xAAAAAAAAAAAAAAAALL;
  (*(void (**)(id *__return_ptr, atomic_ullong *, __CFString *))(*explicit + 72))(&v84, explicit, @"CTFontSyntheticFamilyName");
  if (!atomic_load_explicit((atomic_ullong *volatile)&v84, memory_order_acquire))
  {
LABEL_58:

    goto LABEL_59;
  }
  id v83 = 0;
  CopyPostScriptNamesForFamily((const __CFString *)atomic_load_explicit((atomic_ullong *volatile)&v84, memory_order_acquire), 0, &v81);

  CFArrayRef v22 = (const __CFArray *)(id)atomic_load_explicit((atomic_ullong *volatile)&v83, memory_order_acquire);
  if (v22)
  {
    CFArrayRef v23 = v22;
    CFIndex Count = CFArrayGetCount(v22);

    if (Count >= 2)
    {
      id v82 = 0;
      CFArrayRef v25 = (const __CFArray *)atomic_load_explicit((atomic_ullong *volatile)&v83, memory_order_acquire);
      if (v25)
      {
        CFArrayRef theArray = (CFArrayRef)CFArrayGetCount(v25);
        if (theArray)
        {
          for (CFIndex i = 0; theArray != (CFArrayRef)i; ++i)
          {
            CFArrayRef v27 = v25;
            ValueAtIndex = (__CFString *)CFArrayGetValueAtIndex(v25, i);
            CopyAttributeForSystemFont(ValueAtIndex, @"NSCTFontTraitsAttribute", (const __CFString **)&v81);
            CFDictionaryRef v29 = (const __CFDictionary *)atomic_exchange((atomic_ullong *volatile)&v81, 0);

            if (v29)
            {
              __CFString v81 = *(__CFString *)ymmword_184BA8A68;
              TTraitsValues::TTraitsValues((TTraitsValues *)&v81, v29);
              float64x2_t v30 = vsubq_f64(*(float64x2_t *)&v81.info, *(float64x2_t *)(v12 + 8));
              double v31 = vaddvq_f64(vmulq_f64(v30, v30))
                  + (*(double *)&v81.length - *(double *)(v12 + 24)) * (*(double *)&v81.length - *(double *)(v12 + 24));
              if (v31 <= 0.000001)
              {
                TDescriptorSource::TDescriptorSource((TDescriptorSource *)&v80);
                uint64_t v69 = *MEMORY[0x1E4F1CFC8];
                TDescriptorSource::CopyFontDescriptorPerPostScriptName(&v80, ValueAtIndex, 0x43uLL, 9, 0, &v77);

                goto LABEL_105;
              }
              if (v21 - v31 > 0.000001)
              {
                TCFRef<__CTFont const*>::Retain((atomic_ullong *)&v82, ValueAtIndex);
                double v21 = v31;
              }
            }

            CFArrayRef v25 = v27;
          }
        }
      }
      if (atomic_load_explicit((atomic_ullong *volatile)&v82, memory_order_acquire))
      {
        TDescriptorSource::TDescriptorSource((TDescriptorSource *)&v81);
        CFStringRef v32 = (const __CFString *)atomic_load_explicit((atomic_ullong *volatile)&v82, memory_order_acquire);
        uint64_t v69 = *MEMORY[0x1E4F1CFC8];
        TDescriptorSource::CopyFontDescriptorPerPostScriptName((atomic_ullong **)&v81, v32, 0x43uLL, 9, 0, &v77);
LABEL_105:
        unint64_t v8 = 0x1EB2CD000;
        unint64_t v10 = 0x1E4F1C000;

        goto LABEL_106;
      }

      unint64_t v10 = 0x1E4F1C000uLL;
    }
  }
  else
  {
  }
  if (qword_1EB2CDB18 != -1) {
    dispatch_once_f(&qword_1EB2CDB18, 0, (dispatch_function_t)TFallbacksSource::GetCache(void)::{lambda(void *)#1}::__invoke);
  }
  int v33 = dword_1EB2CDAB4;
  if (v33 != GetLocaleChangedCount())
  {
    objc_msgSend((id)atomic_load_explicit((atomic_ullong *volatile)qword_1EB2CDB10, memory_order_acquire), "removeAllObjects");
    dword_1EB2CDAB4 = GetLocaleChangedCount();
  }
  id v82 = (id)qword_1EB2CDB10;
  TFallbacksSource::CopyDescriptorsForFamily((atomic_ullong **)&v82, (const __CFString *)atomic_load_explicit((atomic_ullong *volatile)&v84, memory_order_acquire), (atomic_ullong *)&v81);

  CFArrayRef v34 = (const __CFArray *)(id)atomic_load_explicit((atomic_ullong *volatile)&v83, memory_order_acquire);
  if (!v34)
  {

LABEL_57:
    unint64_t v8 = 0x1EB2CD000uLL;
    goto LABEL_58;
  }
  CFArrayRef v35 = v34;
  CFIndex v36 = CFArrayGetCount(v34);

  if (v36 < 2) {
    goto LABEL_57;
  }
  CFArrayRef theArraya = (const __CFArray *)atomic_load_explicit((atomic_ullong *volatile)&v83, memory_order_acquire);
  if (!theArraya) {
    goto LABEL_57;
  }
  v71 = (__CFString *)CFArrayGetCount(theArraya);
  if (!v71) {
    goto LABEL_57;
  }
  CFIndex v37 = 0;
  v70 = (TDescriptor **)*MEMORY[0x1E4F1D260];
  while (1)
  {
    v38 = (TDescriptor **)CFArrayGetValueAtIndex(theArraya, v37);
    if (v38 == v70) {
      goto LABEL_54;
    }
    v39 = v38;
    v40 = v38[5];
    if ((*((_DWORD *)v40 + 4) & 0x80000000) == 0) {
      TDescriptor::InitBaseFont(v38[5], 0, 0.0);
    }
    v41 = (atomic_ullong *)atomic_load_explicit((atomic_ullong *volatile)v40 + 4, memory_order_acquire);
    if (!v41 || explicit == v41) {
      goto LABEL_54;
    }
    double v43 = TBaseFont::TraitsDistance(v41, (const TTraitsValues *)v12);
    if (v43 <= 0.000001) {
      break;
    }
    double v44 = v43;
    if (v21 - v43 > 0.000001)
    {
      TCFRef<__CTFont const*>::Retain((atomic_ullong *)v85, v39);
      double v21 = v44;
    }
LABEL_54:
    if (v71 == (__CFString *)++v37) {
      goto LABEL_57;
    }
  }
  v81.isa = v39;
  id v77 = (id)atomic_exchange((atomic_ullong *volatile)&v81, 0);

  unint64_t v8 = 0x1EB2CD000;
LABEL_106:

LABEL_60:
  if (atomic_load_explicit((atomic_ullong *volatile)&v77, memory_order_acquire))
  {
    v45 = (TDescriptor **)(id)atomic_load_explicit((atomic_ullong *volatile)&v77, memory_order_acquire);
    v46 = v45;
    v47 = v45[5];
    if ((*((_DWORD *)v47 + 4) & 0x80000000) == 0) {
      TDescriptor::InitBaseFont(v45[5], 0, 0.0);
    }
    v48 = (atomic_ullong *)atomic_load_explicit((atomic_ullong *volatile)v47 + 4, memory_order_acquire);

    if (v48)
    {
      if ((*(uint64_t (**)(atomic_ullong *, uint64_t))(*v48 + 32))(v48, v75))
      {
        v49 = (TBaseFont *)operator new(0x258uLL, MEMORY[0x1E4FBA2D0]);
        if (v49) {
          TBaseFont::TBaseFont(v49, v48);
        }
        v78 = v49;
        TCFBase_NEW<CTFontDescriptor,TBaseFont const*&>((uint64_t *)&v78, &v81);
      }
      else
      {
        TCFRef<__CTFont const*>::Retain((atomic_ullong *)&v79, (id)atomic_load_explicit((atomic_ullong *volatile)&v77, memory_order_acquire));
      }
    }
  }
  TDescriptorSource::CopyPossibleSystemUIFontDescriptor((atomic_ullong *)&v79, v13, &v76);
  isa = v77;
LABEL_70:

LABEL_71:
  if (a3) {
    os_unfair_lock_lock_with_options();
  }
  uint64_t v9 = objc_msgSend(*(id *)(a1 + *(int *)(v8 + 916)), "objectAtIndex:", a2, v69);
  if (v9 == [*(id *)(v10 + 2712) null])
  {
    v51 = (TDescriptor **)(id)atomic_load_explicit((atomic_ullong *volatile)&v76, memory_order_acquire);
    v52 = v51;
    v53 = v51[5];
    if ((*((_DWORD *)v53 + 4) & 0x80000000) == 0) {
      TDescriptor::InitBaseFont(v51[5], 0, 0.0);
    }
    unint64_t v54 = atomic_load_explicit((atomic_ullong *volatile)v53 + 4, memory_order_acquire);

    if (v54
      && ((*(uint64_t (**)(unint64_t, void))(*(void *)v54 + 32))(v54, *(void *)(a1 + 16)) & 1) == 0)
    {
      v55 = (TDescriptorSource *)os_unfair_lock_lock_with_options();
      unint64_t v56 = *(void *)(a1 + 56);
      TDescriptorSource::EnsureFontFallbacksCache(v55);
      uint64_t CharRangeMapForKey = TFontFallbacks::GetCharRangeMapForKey((TFontFallbacks *)TDescriptorSource::sFontFallbacksCache, v56);
      if (v74)
      {
        uint64_t v58 = CharRangeMapForKey;
        if ((*(unsigned int (**)(unint64_t))(*(void *)v54 + 16))(v54) == 1414743620
          && ((*(uint64_t (**)(unint64_t))(*(void *)v54 + 840))(v54) & 1) == 0)
        {
          v81.isa = (void *)0xAAAAAAAAAAAAAAAALL;
          (*(void (**)(__CFString *__return_ptr, unint64_t))(*(void *)v54 + 504))(&v81, v54);
          for (CFIndex j = 0; ; ++j)
          {
            CFArrayRef v60 = (const __CFArray *)(id)atomic_load_explicit((atomic_ullong *volatile)&v81, memory_order_acquire);
            CFArrayRef v61 = v60;
            CFIndex v62 = v60 ? CFArrayGetCount(v60) : 0;

            if (j >= v62) {
              break;
            }
            CFArrayRef v63 = (const __CFArray *)(id)atomic_load_explicit((atomic_ullong *volatile)&v81, memory_order_acquire);
            CFArrayRef v64 = v63;
            if (v63) {
              v65 = CFArrayGetValueAtIndex(v63, j);
            }
            else {
              v65 = 0;
            }

            uint64_t v66 = *((void *)v65 + 5);
            if ((*(_DWORD *)(v66 + 16) & 0x80000000) == 0) {
              TDescriptor::InitBaseFont(*((TDescriptor **)v65 + 5), 0, 0.0);
            }
            unint64_t v67 = atomic_load_explicit((atomic_ullong *volatile)(v66 + 32), memory_order_acquire);
            if (v67
              && ((*(uint64_t (**)(unint64_t, void))(*(void *)v67 + 32))(v67, *(void *)(a1 + 16)) & 1) == 0)
            {
              v85[0] = (id)0xAAAAAAAAAAAAAAAALL;
              (*(void (**)(id *__return_ptr, unint64_t))(*(void *)v67 + 176))(v85, v67);
              if (!atomic_load_explicit((atomic_ullong *volatile)v85, memory_order_acquire))
              {
                id v84 = (id)0xAAAAAAAAAAAAAAAALL;
                (*(void (**)(id *__return_ptr, unint64_t))(*(void *)v67 + 184))(&v84, v67);
                CharRangeToDescriptorMap::AddRangesForDescriptorIndex(v58, (const __CFCharacterSet *)atomic_load_explicit((atomic_ullong *volatile)&v84, memory_order_acquire), 100 * a2 + j);
              }
            }
          }

          unint64_t v8 = 0x1EB2CD000uLL;
        }
        else
        {
          v81.isa = (void *)0xAAAAAAAAAAAAAAAALL;
          (*(void (**)(__CFString *__return_ptr, unint64_t))(*(void *)v54 + 184))(&v81, v54);
          CharRangeToDescriptorMap::AddRangesForDescriptorIndex(v58, (const __CFCharacterSet *)atomic_load_explicit((atomic_ullong *volatile)&v81, memory_order_acquire), a2);
        }
      }
      os_unfair_lock_unlock(&TDescriptorSource::sFontFallbacksLock);
    }
    uint64_t v9 = atomic_load_explicit((atomic_ullong *volatile)&v76, memory_order_acquire);
    [*(id *)(a1 + *(int *)(v8 + 916)) replaceObjectAtIndex:a2 withObject:v9];
  }

  if (a3) {
LABEL_102:
  }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  return v9;
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)-[_CTFontFallbacksArray objectAtIndex:shouldLock:addRanges:]((uint64_t)self, a3, 1, 1);
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  for (; length; --length)
    *a3++ = (id)-[_CTFontFallbacksArray objectAtIndex:shouldLock:addRanges:]((uint64_t)self, location++, 0, 0);

  os_unfair_lock_unlock(&p_lock->fLock);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)_CTFontFallbacksArray;
  return [(_CTFontFallbacksArray *)&v6 countByEnumeratingWithState:a3 objects:a4 count:1];
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

@end