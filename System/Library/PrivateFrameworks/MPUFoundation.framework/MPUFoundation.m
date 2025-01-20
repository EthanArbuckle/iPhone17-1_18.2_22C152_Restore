id MPULocalizedString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t vars8;

  v1 = (void *)MEMORY[0x263F086E0];
  v2 = a1;
  v3 = [v1 mediaPlayerUIBundle];
  v4 = [v3 localizedStringForKey:v2 value:&stru_26DABBB08 table:@"MediaPlayerUI"];

  return v4;
}

id _MPUHTMLStringFromXMLString(uint64_t a1, int a2)
{
  v3 = [NSString stringWithUTF8String:a1];
  v4 = v3;
  if (a2)
  {
    id v5 = [v3 lowercaseString];
  }
  else
  {
    id v5 = v3;
  }
  v6 = v5;

  return v6;
}

id _MPUHTMLDefaultDelegateFontByAddingTraits(void *a1, int a2, double a3)
{
  id v5 = a1;
  v6 = objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v5, "symbolicTraits") | a2);

  v7 = [MEMORY[0x263F1C658] fontWithDescriptor:v6 size:a3];

  return v7;
}

id MPUHTMLEscapedLyricsML(void *a1)
{
  v1 = (void *)MEMORY[0x263EFFA08];
  id v2 = a1;
  v3 = objc_msgSend(v1, "setWithObjects:", @"b", @"strong", @"i", @"em", @"br", 0);
  v4 = _MPUHTMLEscapedLyricsML(v2, v3, &__block_literal_global);

  return v4;
}

id _MPUHTMLEscapedLyricsML(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v22 = a2;
  v6 = a3;
  v7 = [MEMORY[0x263F08708] newlineCharacterSet];
  v18 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v21 = (void *)[v18 mutableCopy];
  [v21 addCharactersInString:@">"];
  v19 = v7;
  v20 = (void *)[v7 mutableCopy];
  [v20 addCharactersInString:@">"];
  v8 = [MEMORY[0x263F08B08] scannerWithString:v5];
  [v8 setCharactersToBeSkipped:0];
  id v9 = objc_alloc_init(MEMORY[0x263F089D8]);
  if (([v8 isAtEnd] & 1) == 0)
  {
    do
    {
      id v24 = 0;
      [v8 scanUpToString:@"<" intoString:&v24];
      id v10 = v24;
      if (v10)
      {
        v11 = v6[2](v6, v10);
        [v9 appendString:v11];
      }
      uint64_t v12 = [v8 scanLocation];
      id v13 = 0;
      if ([v8 scanString:@"<" intoString:0]
        && (int v14 = [v8 scanString:@"/" intoString:0],
            id v23 = 0,
            [v8 scanUpToCharactersFromSet:v21 intoString:&v23],
            id v13 = v23,
            [v22 containsObject:v13])
        && ([v8 scanUpToCharactersFromSet:v20 intoString:0],
            [v8 scanString:@">" intoString:0]))
      {
        [v9 appendString:@"<"];
        if (v14) {
          [v9 appendString:@"/"];
        }
        [v9 appendString:v13];
        [v9 appendString:@">"];
      }
      else
      {
        v15 = objc_msgSend(v5, "substringWithRange:", v12, objc_msgSend(v8, "scanLocation") - v12);
        v16 = _MPUHTMLEscapedLyricsMLEntities(v15);
        [v9 appendString:v16];
      }
    }
    while (![v8 isAtEnd]);
  }

  return v9;
}

id __MPUHTMLEscapedLyricsML_block_invoke(uint64_t a1, void *a2)
{
  return _MPUHTMLEscapedLyricsMLEntities(a2);
}

id _MPUHTMLEscapedLyricsMLEntities(void *a1)
{
  v1 = (void *)[a1 mutableCopy];
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&", @"&amp;",
    0,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"<", @"&lt;",
    0,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @">", @"&gt;",
    0,
    0,
    [v1 length]);

  return v1;
}

id MPUHTMLEscapedDescriptionML(void *a1)
{
  v1 = (void *)MEMORY[0x263EFFA08];
  id v2 = a1;
  v3 = objc_msgSend(v1, "setWithObjects:", @"b", @"strong", @"i", @"em", @"br", 0);
  v4 = _MPUHTMLEscapedLyricsML(v2, v3, &__block_literal_global_196);

  return v4;
}

id __MPUHTMLEscapedDescriptionML_block_invoke(uint64_t a1, void *a2)
{
  id v2 = _MPUHTMLEscapedLyricsMLEntities(a2);
  v3 = (void *)[v2 mutableCopy];

  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"\n", @"<br>", 0, 0, objc_msgSend(v3, "length"));

  return v3;
}

uint64_t _MPUHTMLParserStateStartElement(void *a1, const char *a2, uint64_t a3)
{
  return [a1 _startElement:a2 attrs:a3];
}

uint64_t _MPUHTMLParserStateEndElement(void *a1, const char *a2)
{
  return [a1 _endElement:a2];
}

uint64_t _MPUHTMLParserStateCharacters(void *a1, const char *a2, uint64_t a3)
{
  return [a1 _characters:a2 length:a3];
}

xmlEntityPtr _MPUHTMLParserStateGetEntity(int a1, xmlChar *name)
{
  return xmlGetPredefinedEntity(name);
}

uint64_t _MPUHTMLParserStateError(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return [a1 _error:1 msg:a2 args:&a9];
}

uint64_t _MPUHTMLParserStateFatal(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return [a1 _error:2 msg:a2 args:&a9];
}

void sub_226BC53C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  _Unwind_Resume(a1);
}

void sub_226BC5454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226BC56BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *__p,uint64_t a23)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<MPU::LayoutInterpolator::EntriesContainer>::insert(uint64_t *a1, uint64_t a2, unint64_t a3)
{
  v4 = (char *)a2;
  uint64_t v7 = *a1;
  unint64_t v6 = a1[1];
  uint64_t v8 = (a2 - *a1) >> 5;
  unint64_t v11 = a1[2];
  uint64_t v9 = (uint64_t)(a1 + 2);
  unint64_t v10 = v11;
  if (v6 >= v11)
  {
    unint64_t v12 = ((uint64_t)(v6 - v7) >> 5) + 1;
    if (v12 >> 59) {
      std::vector<MPU::LayoutInterpolator::Entry>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v13 = v10 - v7;
    if (v13 >> 4 > v12) {
      unint64_t v12 = v13 >> 4;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v14 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v12;
    }
    uint64_t v21 = v9;
    if (v14) {
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::EntriesContainer>>(v9, v14);
    }
    else {
      v15 = 0;
    }
    v17 = v15;
    v18 = &v15[32 * v8];
    v19 = v18;
    v20 = &v15[32 * v14];
    std::__split_buffer<MPU::LayoutInterpolator::EntriesContainer>::push_back[abi:ne180100](&v17, a3);
    v4 = (char *)std::vector<MPU::LayoutInterpolator::EntriesContainer>::__swap_out_circular_buffer(a1, &v17, v4);
    std::__split_buffer<MPU::LayoutInterpolator::EntriesContainer>::~__split_buffer((uint64_t)&v17);
  }
  else if (a2 == v6)
  {
    std::vector<MPU::LayoutInterpolator::EntriesContainer>::__construct_one_at_end[abi:ne180100]<MPU::LayoutInterpolator::EntriesContainer const&>((uint64_t)a1, a3);
  }
  else
  {
    std::vector<MPU::LayoutInterpolator::EntriesContainer>::__move_range((uint64_t)a1, a2, v6, a2 + 32);
    if ((unint64_t)v4 <= a3) {
      a3 += 32 * (a1[1] > a3);
    }
    if (v4 != (char *)a3) {
      std::vector<MPU::LayoutInterpolator::Entry>::__assign_with_size[abi:ne180100]<MPU::LayoutInterpolator::Entry*,MPU::LayoutInterpolator::Entry*>(v4, *(char **)a3, *(void *)(a3 + 8), (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 4);
    }
    *(void *)(v7 + 32 * v8 + 24) = *(void *)(a3 + 24);
  }
  return v4;
}

void sub_226BC5840(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<MPU::LayoutInterpolator::EntriesContainer>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_226BC5B2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

double MPULayoutInterpolatorScaledValueFromTraitEnvironment(void *a1, void *a2, double a3)
{
  id v5 = a2;
  [a1 valueForReferenceMetric:a3];
  double v7 = v6;
  uint64_t v8 = [v5 traitCollection];
  [v8 displayScale];
  double v10 = v9;

  double v11 = MPUFloatRoundForScale(v7, v10);
  return v11;
}

void sub_226BC5C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226BC5FEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,uint64_t a27,void *a28,uint64_t a29)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_226BC61EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  v15 = *(void **)v13;
  if (*(void *)v13)
  {
    *(void *)(v13 + 8) = v15;
    operator delete(v15);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<MPU::Point3D>::insert(uint64_t a1, char *__src, unint64_t a3)
{
  unint64_t v3 = a3;
  v4 = __src;
  double v6 = *(char **)(a1 + 8);
  uint64_t v8 = a1 + 16;
  unint64_t v7 = *(void *)(a1 + 16);
  if ((unint64_t)v6 >= v7)
  {
    uint64_t v13 = *(char **)a1;
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v6[-*(void *)a1] >> 3) + 1;
    if (v14 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<MPU::LayoutInterpolator::Entry>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = __src - v13;
    int64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((__src - v13) >> 3);
    unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (void)v13) >> 3);
    if (2 * v17 > v14) {
      unint64_t v14 = 2 * v17;
    }
    if (v17 >= 0x555555555555555) {
      unint64_t v18 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v18 = v14;
    }
    uint64_t v33 = a1 + 16;
    if (v18) {
      v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MPU::Point3D>>(a1 + 16, v18);
    }
    else {
      v19 = 0;
    }
    id v22 = &v19[24 * v16];
    __p = v19;
    v30 = v22;
    v31 = v22;
    v32 = &v19[24 * v18];
    if (v16 == v18)
    {
      if (v15 < 1)
      {
        if (v13 == v4) {
          unint64_t v24 = 1;
        }
        else {
          unint64_t v24 = 2 * v16;
        }
        v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MPU::Point3D>>(v8, v24);
        id v22 = &v25[24 * (v24 >> 2)];
        __p = v25;
        v30 = v22;
        v32 = &v25[24 * v26];
        if (v19) {
          operator delete(v19);
        }
      }
      else
      {
        uint64_t v23 = v16 + 2;
        if (v16 >= -1) {
          uint64_t v23 = v16 + 1;
        }
        v22 -= 24 * (v23 >> 1);
        v30 = v22;
      }
    }
    long long v27 = *(_OWORD *)v3;
    *((void *)v22 + 2) = *(void *)(v3 + 16);
    *(_OWORD *)id v22 = v27;
    v31 = v22 + 24;
    v4 = (char *)std::vector<MPU::Point3D>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v4);
    if (v31 != v30) {
      v31 = &v30[(v31 - v30 - 24) % 0x18uLL];
    }
    if (__p) {
      operator delete(__p);
    }
  }
  else if (__src == v6)
  {
    long long v21 = *(_OWORD *)a3;
    *((void *)__src + 2) = *(void *)(a3 + 16);
    *(_OWORD *)__src = v21;
    *(void *)(a1 + 8) = __src + 24;
  }
  else
  {
    double v9 = __src + 24;
    double v10 = v6 - 24;
    uint64_t v11 = *(void *)(a1 + 8);
    while (v10 < v6)
    {
      long long v12 = *(_OWORD *)v10;
      *(void *)(v11 + 16) = *((void *)v10 + 2);
      *(_OWORD *)uint64_t v11 = v12;
      v11 += 24;
      v10 += 24;
    }
    *(void *)(a1 + 8) = v11;
    if (v6 != v9) {
      memmove(__src + 24, __src, v6 - v9);
    }
    if ((unint64_t)v4 <= v3) {
      v3 += 24 * (*(void *)(a1 + 8) > v3);
    }
    long long v20 = *(_OWORD *)v3;
    *((void *)v4 + 2) = *(void *)(v3 + 16);
    *(_OWORD *)v4 = v20;
  }
  return v4;
}

void sub_226BC6498(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    double v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    double v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2647D0AD0, MEMORY[0x263F8C060]);
}

void sub_226BC6694(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void __clang_call_terminate(void *a1)
{
}

void std::vector<MPU::LayoutInterpolator::EntriesContainer>::__assign_with_size[abi:ne180100]<MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = a1 + 16;
  uint64_t v9 = *(void *)a1;
  if (a4 > (uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 5)
  {
    std::vector<MPU::LayoutInterpolator::EntriesContainer>::__vdeallocate((uint64_t *)a1);
    if (a4 >> 59) {
      std::vector<MPU::LayoutInterpolator::Entry>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = *(void *)(a1 + 16) - *(void *)a1;
    uint64_t v11 = v10 >> 4;
    if (v10 >> 4 <= a4) {
      uint64_t v11 = a4;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v12 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    std::vector<MPU::LayoutInterpolator::EntriesContainer>::__vallocate[abi:ne180100]((void *)a1, v12);
    uint64_t v13 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*>(v8, a2, a3, *(void **)(a1 + 8));
    goto LABEL_11;
  }
  unint64_t v14 = (*(void *)(a1 + 8) - v9) >> 5;
  if (v14 < a4)
  {
    uint64_t v15 = a2 + 32 * v14;
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *>((int)&v22, a2, v15, v9);
    uint64_t v13 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*>(v8, v15, a3, *(void **)(a1 + 8));
LABEL_11:
    *(void *)(a1 + 8) = v13;
    return;
  }
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *>((int)&v23, a2, a3, v9);
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)(a1 + 8);
  if (v18 != v16)
  {
    uint64_t v19 = *(void *)(a1 + 8);
    do
    {
      long long v21 = *(void **)(v19 - 32);
      v19 -= 32;
      long long v20 = v21;
      if (v21)
      {
        *(void *)(v18 - 24) = v20;
        operator delete(v20);
      }
      uint64_t v18 = v19;
    }
    while (v19 != v17);
  }
  *(void *)(a1 + 8) = v17;
}

void sub_226BC6870(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_226BC6878(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void std::vector<MPU::LayoutInterpolator::EntriesContainer>::__vdeallocate(uint64_t *a1)
{
  if (*a1)
  {
    std::vector<MPU::LayoutInterpolator::EntriesContainer>::__clear[abi:ne180100](a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

char *std::vector<MPU::LayoutInterpolator::EntriesContainer>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::vector<MPU::LayoutInterpolator::Entry>::__throw_length_error[abi:ne180100]();
  }
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::EntriesContainer>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

void *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*>(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      void *v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      std::vector<MPU::LayoutInterpolator::Entry>::__init_with_size[abi:ne180100]<MPU::LayoutInterpolator::Entry*,MPU::LayoutInterpolator::Entry*>(v4, *(const void **)v6, *(void *)(v6 + 8), (uint64_t)(*(void *)(v6 + 8) - *(void *)v6) >> 4);
      v4[3] = *(void *)(v6 + 24);
      uint64_t v4 = v11 + 4;
      v11 += 4;
      v6 += 32;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,MPU::LayoutInterpolator::EntriesContainer*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_226BC69A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *std::vector<MPU::LayoutInterpolator::Entry>::__init_with_size[abi:ne180100]<MPU::LayoutInterpolator::Entry*,MPU::LayoutInterpolator::Entry*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    result = std::vector<MPU::LayoutInterpolator::Entry>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_226BC6A1C(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<MPU::LayoutInterpolator::Entry>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<MPU::LayoutInterpolator::Entry>::__throw_length_error[abi:ne180100]();
  }
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::Entry>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void std::vector<MPU::LayoutInterpolator::Entry>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::Entry>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,MPU::LayoutInterpolator::EntriesContainer*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,MPU::LayoutInterpolator::EntriesContainer*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,MPU::LayoutInterpolator::EntriesContainer*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  if (v1 != v2)
  {
    uint64_t v3 = **(void **)(a1 + 16);
    do
    {
      size_t v5 = *(void **)(v3 - 32);
      v3 -= 32;
      uint64_t v4 = v5;
      if (v5)
      {
        *(void *)(v1 - 24) = v4;
        operator delete(v4);
      }
      uint64_t v1 = v3;
    }
    while (v3 != v2);
  }
}

uint64_t std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *>(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      if (v5 != a4) {
        std::vector<MPU::LayoutInterpolator::Entry>::__assign_with_size[abi:ne180100]<MPU::LayoutInterpolator::Entry*,MPU::LayoutInterpolator::Entry*>((char *)a4, *(char **)v5, *(void *)(v5 + 8), (uint64_t)(*(void *)(v5 + 8) - *(void *)v5) >> 4);
      }
      *(void *)(a4 + 24) = *(void *)(v5 + 24);
      v5 += 32;
      a4 += 32;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

char *std::vector<MPU::LayoutInterpolator::Entry>::__assign_with_size[abi:ne180100]<MPU::LayoutInterpolator::Entry*,MPU::LayoutInterpolator::Entry*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  char v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 4)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      void *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 60) {
      std::vector<MPU::LayoutInterpolator::Entry>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 3;
    if (v8 >> 3 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    result = std::vector<MPU::LayoutInterpolator::Entry>::__vallocate[abi:ne180100](v7, v11);
    uint64_t v13 = (char *)v7[1];
    unint64_t v12 = (void **)(v7 + 1);
    char v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      uint64_t v18 = v9;
      uint64_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  unint64_t v12 = (void **)(result + 8);
  unint64_t v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 4;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  uint64_t v16 = &__src[16 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    char v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    uint64_t v18 = v9;
    uint64_t v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *unint64_t v12 = &v9[v17];
  return result;
}

void std::vector<MPU::LayoutInterpolator::EntriesContainer>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      uint64_t v6 = *(void **)(v4 - 32);
      v4 -= 32;
      uint64_t v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 24) = v5;
        operator delete(v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::EntriesContainer>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
}

double std::vector<MPU::LayoutInterpolator::EntriesContainer>::__construct_one_at_end[abi:ne180100]<MPU::LayoutInterpolator::EntriesContainer const&>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  *(void *)uint64_t v4 = 0;
  *(void *)(v4 + 8) = 0;
  *(void *)(v4 + 16) = 0;
  std::vector<MPU::LayoutInterpolator::Entry>::__init_with_size[abi:ne180100]<MPU::LayoutInterpolator::Entry*,MPU::LayoutInterpolator::Entry*>((void *)v4, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 4);
  double result = *(double *)(a2 + 24);
  *(double *)(v4 + 24) = result;
  *(void *)(a1 + 8) = v4 + 32;
  return result;
}

void sub_226BC6DC8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<MPU::LayoutInterpolator::EntriesContainer>::__move_range(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = a2 + v6 - a4;
  uint64_t v8 = (void *)v6;
  if (v7 < a3)
  {
    unint64_t v9 = v7;
    uint64_t v8 = *(void **)(a1 + 8);
    do
    {
      void *v8 = 0;
      v8[1] = 0;
      v8[2] = 0;
      *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
      v8[2] = *(void *)(v9 + 16);
      *(void *)unint64_t v9 = 0;
      *(void *)(v9 + 8) = 0;
      *(void *)(v9 + 16) = 0;
      void v8[3] = *(void *)(v9 + 24);
      v8 += 4;
      v9 += 32;
    }
    while (v9 < a3);
  }
  *(void *)(a1 + 8) = v8;
  return std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_backward_loop<std::_ClassicAlgPolicy>,std::__move_backward_trivial>,MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *,0>(a2, v7, v6);
}

double std::__split_buffer<MPU::LayoutInterpolator::EntriesContainer>::push_back[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v4 = (__n128 *)a1[2];
  if (v4 == (__n128 *)a1[3])
  {
    uint64_t v6 = *a1;
    uint64_t v5 = (__n128 *)a1[1];
    uint64_t v7 = (uint64_t)v5 - *a1;
    if ((unint64_t)v5 <= *a1)
    {
      uint64_t v15 = (uint64_t)v4 - v6;
      BOOL v14 = v15 == 0;
      uint64_t v16 = v15 >> 4;
      if (v14) {
        unint64_t v17 = 1;
      }
      else {
        unint64_t v17 = v16;
      }
      uint64_t v31 = a1[4];
      uint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::EntriesContainer>>(v31, v17);
      long long v20 = &v18[32 * (v17 >> 2)];
      unint64_t v21 = a1[1];
      unint64_t v22 = a1[2] - v21;
      if (v22)
      {
        char v23 = &v20[v22];
        unint64_t v24 = &v18[32 * (v17 >> 2)];
        do
        {
          *(void *)unint64_t v24 = 0;
          *((void *)v24 + 1) = 0;
          *((void *)v24 + 2) = 0;
          *(_OWORD *)unint64_t v24 = *(_OWORD *)v21;
          *((void *)v24 + 2) = *(void *)(v21 + 16);
          *(void *)unint64_t v21 = 0;
          *(void *)(v21 + 8) = 0;
          *(void *)(v21 + 16) = 0;
          *((void *)v24 + 3) = *(void *)(v21 + 24);
          v24 += 32;
          v21 += 32;
        }
        while (v24 != v23);
        int64x2_t v25 = *(int64x2_t *)(a1 + 1);
      }
      else
      {
        int64x2_t v25 = vdupq_n_s64(v21);
        char v23 = &v18[32 * (v17 >> 2)];
      }
      uint64_t v28 = *a1;
      *a1 = v18;
      a1[1] = v20;
      int64x2_t v29 = v25;
      uint64_t v26 = a1[3];
      a1[2] = v23;
      a1[3] = &v18[32 * v19];
      uint64_t v30 = v26;
      std::__split_buffer<MPU::LayoutInterpolator::EntriesContainer>::~__split_buffer((uint64_t)&v28);
      uint64_t v4 = (__n128 *)a1[2];
    }
    else
    {
      uint64_t v8 = v7 >> 5;
      BOOL v9 = v7 >> 5 < -1;
      uint64_t v10 = (v7 >> 5) + 2;
      if (v9) {
        unint64_t v11 = v10;
      }
      else {
        unint64_t v11 = v8 + 1;
      }
      unint64_t v12 = v11 >> 1;
      std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *,0>(v5, v4, (uint64_t)&v5[-2 * (v11 >> 1)]);
      uint64_t v4 = v13;
      a1[1] -= 32 * v12;
      a1[2] = v13;
    }
  }
  v4->n128_u64[0] = 0;
  v4->n128_u64[1] = 0;
  v4[1].n128_u64[0] = 0;
  std::vector<MPU::LayoutInterpolator::Entry>::__init_with_size[abi:ne180100]<MPU::LayoutInterpolator::Entry*,MPU::LayoutInterpolator::Entry*>(v4, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 4);
  double result = *(double *)(a2 + 24);
  v4[1].n128_f64[1] = result;
  a1[2] += 32;
  return result;
}

uint64_t std::vector<MPU::LayoutInterpolator::EntriesContainer>::__swap_out_circular_buffer(uint64_t *a1, void *a2, void *a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = (uint64_t)(a1 + 2);
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,std::reverse_iterator<MPU::LayoutInterpolator::EntriesContainer*>,std::reverse_iterator<MPU::LayoutInterpolator::EntriesContainer*>,std::reverse_iterator<MPU::LayoutInterpolator::EntriesContainer*>>((uint64_t)(a1 + 2), (uint64_t)a3, a3, *a1, (void *)*a1, v6, v6);
  a2[1] = v8;
  a2[2] = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*>(v7, (uint64_t)a3, a1[1], (void *)a2[2]);
  uint64_t v9 = *a1;
  *a1 = a2[1];
  a2[1] = v9;
  uint64_t v10 = a1[1];
  a1[1] = a2[2];
  a2[2] = v10;
  uint64_t v11 = a1[2];
  a1[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return v6;
}

uint64_t std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_backward_loop<std::_ClassicAlgPolicy>,std::__move_backward_trivial>,MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *,0>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 != a1)
  {
    uint64_t v6 = a2;
    do
    {
      std::vector<MPU::LayoutInterpolator::Entry>::__move_assign(a3 - 32, (__n128 *)(v6 - 32));
      *(void *)(a3 - 8) = *(void *)(v6 - 8);
      a3 -= 32;
      v6 -= 32;
    }
    while (v6 != a1);
  }
  return a2;
}

__n128 std::vector<MPU::LayoutInterpolator::Entry>::__move_assign(uint64_t a1, __n128 *a2)
{
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    *(void *)(a1 + 8) = v4;
    operator delete(v4);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
  __n128 result = *a2;
  *(__n128 *)a1 = *a2;
  *(void *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  return result;
}

__n128 *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *,0>(__n128 *a1, __n128 *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  if (a1 == a2) {
    return a1;
  }
  uint64_t v5 = a2;
  do
  {
    std::vector<MPU::LayoutInterpolator::Entry>::__move_assign(a3, v4);
    *(void *)(a3 + 24) = v4[1].n128_u64[1];
    a3 += 32;
    v4 += 2;
  }
  while (v4 != v5);
  return v5;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,std::reverse_iterator<MPU::LayoutInterpolator::EntriesContainer*>,std::reverse_iterator<MPU::LayoutInterpolator::EntriesContainer*>,std::reverse_iterator<MPU::LayoutInterpolator::EntriesContainer*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 32) = 0;
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      long long v8 = *((_OWORD *)a3 - 2);
      a3 -= 4;
      *(_OWORD *)(v7 - 32) = v8;
      *(void *)(v7 - 16) = a3[2];
      a3[1] = 0;
      a3[2] = 0;
      *a3 = 0;
      *(void *)(v7 - 8) = a3[3];
      uint64_t v7 = *((void *)&v14 + 1) - 32;
      *((void *)&v14 + 1) -= 32;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,std::reverse_iterator<MPU::LayoutInterpolator::EntriesContainer*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

void *std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*>(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a4;
  uint64_t v9 = a4;
  long long v8 = a4;
  v6[0] = a1;
  v6[1] = &v8;
  v6[2] = &v9;
  if (a2 != a3)
  {
    do
    {
      void *v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      *(_OWORD *)uint64_t v4 = *(_OWORD *)a2;
      v4[2] = *(void *)(a2 + 16);
      *(void *)a2 = 0;
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      v4[3] = *(void *)(a2 + 24);
      v4 += 4;
      a2 += 32;
    }
    while (a2 != a3);
    uint64_t v9 = v4;
  }
  char v7 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,MPU::LayoutInterpolator::EntriesContainer*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v6);
  return v4;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,std::reverse_iterator<MPU::LayoutInterpolator::EntriesContainer*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,std::reverse_iterator<MPU::LayoutInterpolator::EntriesContainer*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,std::reverse_iterator<MPU::LayoutInterpolator::EntriesContainer*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(void **)v1;
    if (*(void *)v1)
    {
      *(void *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 32;
  }
}

uint64_t std::__split_buffer<MPU::LayoutInterpolator::EntriesContainer>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<MPU::LayoutInterpolator::EntriesContainer>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    uint64_t v5 = *(void **)(v2 - 32);
    *(void *)(a1 + 16) = v2 - 32;
    if (v5)
    {
      *(void *)(v2 - 24) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 32;
    }
  }
}

void *std::vector<MPU::Point3D>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  uint64_t v5 = *(void **)(a2 + 8);
  uint64_t v6 = (char *)*a1;
  char v7 = v5;
  if (*a1 != __src)
  {
    long long v8 = __src;
    uint64_t v9 = *(void *)(a2 + 8);
    do
    {
      long long v10 = *(_OWORD *)(v8 - 24);
      char v7 = (void *)(v9 - 24);
      *(void *)(v9 - 8) = *((void *)v8 - 1);
      *(_OWORD *)(v9 - 24) = v10;
      v8 -= 24;
      v9 -= 24;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  uint64_t v11 = a1[1];
  uint64_t v12 = *(void *)(a2 + 16);
  int64_t v13 = v11 - __src;
  if (v11 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v11 - __src);
    char v7 = *(void **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v12 + v13;
  long long v14 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v14;
  uint64_t v15 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v15;
  uint64_t v16 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v16;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<MPU::Point3D>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

__n128 std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *,0>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, __n128 *a5, double *a6)
{
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *>((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a6);
  double v12 = a6[1];
  result.n128_f64[0] = (v12 - a5->n128_f64[1]) * (v12 - a5->n128_f64[1])
                     + (*a6 - a5->n128_f64[0]) * (*a6 - a5->n128_f64[0]);
  if (result.n128_f64[0] < (v12 - a4->n128_f64[1]) * (v12 - a4->n128_f64[1])
                          + (*a6 - a4->n128_f64[0]) * (*a6 - a4->n128_f64[0]))
  {
    unint64_t v14 = a4[1].n128_u64[0];
    __n128 result = *a4;
    unint64_t v15 = a5[1].n128_u64[0];
    *a4 = *a5;
    a4[1].n128_u64[0] = v15;
    *a5 = result;
    a5[1].n128_u64[0] = v14;
    double v16 = a6[1];
    result.n128_f64[0] = (v16 - a4->n128_f64[1]) * (v16 - a4->n128_f64[1])
                       + (*a6 - a4->n128_f64[0]) * (*a6 - a4->n128_f64[0]);
    if (result.n128_f64[0] < (v16 - a3->n128_f64[1]) * (v16 - a3->n128_f64[1])
                            + (*a6 - a3->n128_f64[0]) * (*a6 - a3->n128_f64[0]))
    {
      unint64_t v17 = a3[1].n128_u64[0];
      __n128 result = *a3;
      unint64_t v18 = a4[1].n128_u64[0];
      *a3 = *a4;
      a3[1].n128_u64[0] = v18;
      *a4 = result;
      a4[1].n128_u64[0] = v17;
      double v19 = a6[1];
      result.n128_f64[0] = (v19 - a3->n128_f64[1]) * (v19 - a3->n128_f64[1])
                         + (*a6 - a3->n128_f64[0]) * (*a6 - a3->n128_f64[0]);
      if (result.n128_f64[0] < (v19 - a2->n128_f64[1]) * (v19 - a2->n128_f64[1])
                              + (*a6 - a2->n128_f64[0]) * (*a6 - a2->n128_f64[0]))
      {
        unint64_t v20 = a2[1].n128_u64[0];
        __n128 result = *a2;
        unint64_t v21 = a3[1].n128_u64[0];
        *a2 = *a3;
        a2[1].n128_u64[0] = v21;
        *a3 = result;
        a3[1].n128_u64[0] = v20;
        double v22 = a6[1];
        result.n128_f64[0] = (v22 - a2->n128_f64[1]) * (v22 - a2->n128_f64[1])
                           + (*a6 - a2->n128_f64[0]) * (*a6 - a2->n128_f64[0]);
        if (result.n128_f64[0] < (v22 - a1->n128_f64[1]) * (v22 - a1->n128_f64[1])
                                + (*a6 - a1->n128_f64[0]) * (*a6 - a1->n128_f64[0]))
        {
          unint64_t v23 = a1[1].n128_u64[0];
          __n128 result = *a1;
          unint64_t v24 = a2[1].n128_u64[0];
          *a1 = *a2;
          a1[1].n128_u64[0] = v24;
          *a2 = result;
          a2[1].n128_u64[0] = v23;
        }
      }
    }
  }
  return result;
}

long long *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *>(long long *result, double *a2, double *a3, double *a4)
{
  double v4 = a4[1];
  double v5 = (v4 - a2[1]) * (v4 - a2[1]) + (*a4 - *a2) * (*a4 - *a2);
  double v6 = (v4 - a3[1]) * (v4 - a3[1]) + (*a4 - *a3) * (*a4 - *a3);
  if (v5 >= (v4 - *((double *)result + 1)) * (v4 - *((double *)result + 1))
           + (*a4 - *(double *)result) * (*a4 - *(double *)result))
  {
    if (v6 < v5)
    {
      uint64_t v10 = *((void *)a2 + 2);
      long long v11 = *(_OWORD *)a2;
      uint64_t v12 = *((void *)a3 + 2);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *((void *)a2 + 2) = v12;
      *(_OWORD *)a3 = v11;
      *((void *)a3 + 2) = v10;
      double v13 = a4[1];
      if ((v13 - a2[1]) * (v13 - a2[1]) + (*a4 - *a2) * (*a4 - *a2) < (v13 - *((double *)result + 1))
                                                                     * (v13 - *((double *)result + 1))
                                                                     + (*a4 - *(double *)result)
                                                                     * (*a4 - *(double *)result))
      {
        uint64_t v14 = *((void *)result + 2);
        long long v15 = *result;
        uint64_t v16 = *((void *)a2 + 2);
        char *result = *(_OWORD *)a2;
        *((void *)result + 2) = v16;
        *(_OWORD *)a2 = v15;
        *((void *)a2 + 2) = v14;
      }
    }
  }
  else
  {
    if (v6 >= v5)
    {
      uint64_t v17 = *((void *)result + 2);
      long long v18 = *result;
      uint64_t v19 = *((void *)a2 + 2);
      char *result = *(_OWORD *)a2;
      *((void *)result + 2) = v19;
      *(_OWORD *)a2 = v18;
      *((void *)a2 + 2) = v17;
      double v20 = a4[1];
      if ((v20 - a3[1]) * (v20 - a3[1]) + (*a4 - *a3) * (*a4 - *a3) >= (v20 - a2[1]) * (v20 - a2[1])
                                                                      + (*a4 - *a2) * (*a4 - *a2))
        return result;
      uint64_t v7 = *((void *)a2 + 2);
      long long v8 = *(_OWORD *)a2;
      uint64_t v21 = *((void *)a3 + 2);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *((void *)a2 + 2) = v21;
    }
    else
    {
      uint64_t v7 = *((void *)result + 2);
      long long v8 = *result;
      uint64_t v9 = *((void *)a3 + 2);
      char *result = *(_OWORD *)a3;
      *((void *)result + 2) = v9;
    }
    *(_OWORD *)a3 = v8;
    *((void *)a3 + 2) = v7;
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *>(uint64_t a1, uint64_t a2, double *a3)
{
  uint64_t v6 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v6)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      long long v8 = (long long *)(a2 - 24);
      double v9 = a3[1];
      if ((v9 - *(double *)(a2 - 16)) * (v9 - *(double *)(a2 - 16))
         + (*a3 - *(double *)(a2 - 24)) * (*a3 - *(double *)(a2 - 24)) < (v9 - *(double *)(a1 + 8))
                                                                       * (v9 - *(double *)(a1 + 8))
                                                                       + (*a3 - *(double *)a1) * (*a3 - *(double *)a1))
      {
        uint64_t v10 = *(void *)(a1 + 16);
        long long v11 = *(_OWORD *)a1;
        uint64_t v12 = *(void *)(a2 - 8);
        *(_OWORD *)a1 = *v8;
        *(void *)(a1 + 16) = v12;
        long long *v8 = v11;
        *(void *)(a2 - 8) = v10;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(MPULayoutInterpolator *)(long long *)a1 _sortPointsFor3DInterpolation:(double *)(a2 - 24) usingQueriedPoint:a3];
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *>(a1, a1 + 24, a1 + 48, a2 - 24, a3);
      return 1;
    case 5uLL:
      std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *,0>((__n128 *)a1, (__n128 *)(a1 + 24), (__n128 *)(a1 + 48), (__n128 *)(a1 + 72), (__n128 *)(a2 - 24), a3);
      return 1;
    default:
      double v13 = (double *)(a1 + 48);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(MPULayoutInterpolator *)(long long *)a1 _sortPointsFor3DInterpolation:(double *)(a1 + 48) usingQueriedPoint:a3];
      uint64_t v14 = a1 + 72;
      if (a1 + 72 == a2) {
        return 1;
      }
      uint64_t v15 = 0;
      int v16 = 0;
      break;
  }
  while (1)
  {
    double v17 = *(double *)v14;
    long long v18 = *(_OWORD *)(v14 + 8);
    double v19 = a3[1];
    if ((v19 - *(double *)&v18) * (v19 - *(double *)&v18) + (*a3 - *(double *)v14) * (*a3 - *(double *)v14) < (v19 - v13[1]) * (v19 - v13[1]) + (*a3 - *v13) * (*a3 - *v13))
    {
      uint64_t v20 = v15;
      while (1)
      {
        uint64_t v21 = a1 + v20;
        *(_OWORD *)(v21 + 72) = *(_OWORD *)(a1 + v20 + 48);
        *(void *)(v21 + 88) = *(void *)(a1 + v20 + 64);
        if (v20 == -48) {
          break;
        }
        double v22 = a3[1];
        v20 -= 24;
        if ((v22 - *(double *)&v18) * (v22 - *(double *)&v18) + (*a3 - v17) * (*a3 - v17) >= (v22
                                                                                             - *(double *)(v21 + 32))
                                                                                            * (v22
                                                                                             - *(double *)(v21 + 32))
                                                                                            + (*a3
                                                                                             - *(double *)(v21 + 24))
                                                                                            * (*a3
                                                                                             - *(double *)(v21 + 24)))
        {
          uint64_t v23 = a1 + v20 + 72;
          goto LABEL_12;
        }
      }
      uint64_t v23 = a1;
LABEL_12:
      *(double *)uint64_t v23 = v17;
      *(_OWORD *)(v23 + 8) = v18;
      if (++v16 == 8) {
        return v14 + 24 == a2;
      }
    }
    double v13 = (double *)v14;
    v15 += 24;
    v14 += 24;
    if (v14 == a2) {
      return 1;
    }
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double *a5)
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(MPULayoutInterpolator *)(long long *)a1 _sortPointsFor3DInterpolation:(double *)a3 usingQueriedPoint:a5];
  double v10 = a5[1];
  result.n128_f64[0] = (v10 - *(double *)(a4 + 8)) * (v10 - *(double *)(a4 + 8))
                     + (*a5 - *(double *)a4) * (*a5 - *(double *)a4);
  if (result.n128_f64[0] < (v10 - *(double *)(a3 + 8)) * (v10 - *(double *)(a3 + 8))
                          + (*a5 - *(double *)a3) * (*a5 - *(double *)a3))
  {
    uint64_t v12 = *(void *)(a3 + 16);
    __n128 result = *(__n128 *)a3;
    uint64_t v13 = *(void *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(void *)(a3 + 16) = v13;
    *(__n128 *)a4 = result;
    *(void *)(a4 + 16) = v12;
    double v14 = a5[1];
    result.n128_f64[0] = (v14 - *(double *)(a3 + 8)) * (v14 - *(double *)(a3 + 8))
                       + (*a5 - *(double *)a3) * (*a5 - *(double *)a3);
    if (result.n128_f64[0] < (v14 - *(double *)(a2 + 8)) * (v14 - *(double *)(a2 + 8))
                            + (*a5 - *(double *)a2) * (*a5 - *(double *)a2))
    {
      uint64_t v15 = *(void *)(a2 + 16);
      __n128 result = *(__n128 *)a2;
      uint64_t v16 = *(void *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(void *)(a2 + 16) = v16;
      *(__n128 *)a3 = result;
      *(void *)(a3 + 16) = v15;
      double v17 = a5[1];
      result.n128_f64[0] = (v17 - *(double *)(a2 + 8)) * (v17 - *(double *)(a2 + 8))
                         + (*a5 - *(double *)a2) * (*a5 - *(double *)a2);
      if (result.n128_f64[0] < (v17 - *(double *)(a1 + 8)) * (v17 - *(double *)(a1 + 8))
                              + (*a5 - *(double *)a1) * (*a5 - *(double *)a1))
      {
        uint64_t v18 = *(void *)(a1 + 16);
        __n128 result = *(__n128 *)a1;
        uint64_t v19 = *(void *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = v19;
        *(__n128 *)a2 = result;
        *(void *)(a2 + 16) = v18;
      }
    }
  }
  return result;
}

void std::vector<MPU::LayoutInterpolator::EntriesContainer>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<MPU::LayoutInterpolator::EntriesContainer>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

double *MPU::Point3D::Point3D(double *this, double a2, double a3, double a4)
{
  *this = a2;
  this[1] = a3;
  this[2] = a4;
  return this;
}

{
  *this = a2;
  this[1] = a3;
  this[2] = a4;
  return this;
}

BOOL MPU::Point3D::operator==(double *a1, double *a2)
{
  if (!MPUFloatEqualToFloat(*a1, *a2) || !MPUFloatEqualToFloat(a1[1], a2[1])) {
    return 0;
  }
  double v4 = a1[2];
  double v5 = a2[2];

  return MPUFloatEqualToFloat(v4, v5);
}

BOOL MPU::Point3D::operator!=(double *a1, double *a2)
{
  return !MPU::Point3D::operator==(a1, a2);
}

BOOL MPU::Point3D::resolveEquationOfPlaneDefinedByFirstThreePointsInVector(double **a1, double *a2, double *a3, double *a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  double v15 = **a1;
  double v16 = (*a1)[1];
  double v17 = (*a1)[2];
  double v18 = (*a1)[4];
  double v19 = (*a1)[5];
  double v20 = (*a1)[6];
  double v21 = (*a1)[7];
  double v22 = (*a1)[8];
  double v34 = (*a1)[3];
  return MPU::_ResolveEquationOfPlaneDefinedBy3DPoints(a2, a3, a4, v15, v16, v17, v34, v18, v19, a11, a12, v20, v21, v22)|| MPU::_ResolveEquationOfPlaneDefinedBy3DPoints(a2, a3, a4, v15,
           v16,
           v17,
           v20,
           v21,
           v22,
           v23,
           v24,
           v34,
           v18,
           v19)
      || MPU::_ResolveEquationOfPlaneDefinedBy3DPoints(a2, a3, a4, v34, v18, v19, v15, v16, v17, v25, v26, v20, v21, v22)|| MPU::_ResolveEquationOfPlaneDefinedBy3DPoints(a2, a3, a4, v34,
           v18,
           v19,
           v20,
           v21,
           v22,
           v27,
           v28,
           v15,
           v16,
           v17)
      || MPU::_ResolveEquationOfPlaneDefinedBy3DPoints(a2, a3, a4, v20, v21, v22, v15, v16, v17, v29, v30, v34, v18, v19)|| MPU::_ResolveEquationOfPlaneDefinedBy3DPoints(a2, a3, a4, v20,
           v21,
           v22,
           v34,
           v18,
           v19,
           v31,
           v32,
           v15,
           v16,
           v17);
}

BOOL MPU::_ResolveEquationOfPlaneDefinedBy3DPoints(double *a1, double *a2, double *a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14)
{
  double v26 = a8 - a5;
  if (MPUFloatEqualToFloat(a8 - a5, 0.0)) {
    return 0;
  }
  double v28 = a13 - a8;
  double v29 = a7 - a4;
  double v30 = -v28 / v26;
  double v31 = a12 - a7 + v30 * (a7 - a4);
  BOOL v32 = MPUFloatEqualToFloat(v31, 0.0);
  if (!v32)
  {
    double v33 = (a14 - a9 + v30 * (a9 - a6)) / v31;
    if (a1) {
      *a1 = v33;
    }
    double v34 = (a9 - a6 - v33 * v29) / v26;
    if (a2) {
      *a2 = v34;
    }
    if (a3) {
      *a3 = a6 - v33 * a4 - v34 * a5;
    }
  }
  return !v32;
}

void sub_226BC913C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCTFontDescriptorTextStyleRegularSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreTextLibrary();
  __n128 result = dlsym(v2, "kCTFontDescriptorTextStyleRegular");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCTFontDescriptorTextStyleRegularSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreTextLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!CoreTextLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __CoreTextLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2647D0C00;
    uint64_t v5 = 0;
    CoreTextLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = CoreTextLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!CoreTextLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __CoreTextLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreTextLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getkCTFontDescriptorTextStyleEmphasizedSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreTextLibrary();
  uint64_t result = dlsym(v2, "kCTFontDescriptorTextStyleEmphasized");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCTFontDescriptorTextStyleEmphasizedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL MPUFloatEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a2, a1) < 0.00000011920929;
}

BOOL MPUFloatGreaterThanOrEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a2, a1) < 0.00000011920929 || a1 > a2;
}

BOOL MPUFloatLessThanOrEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a2, a1) < 0.00000011920929 || a1 < a2;
}

double MPUFloatGetSafeScaleForValue(double result)
{
  if (vabdd_f64(0.0, result) < 0.00000011920929)
  {
    uint64_t v1 = [MEMORY[0x263F1C920] mainScreen];
    [v1 scale];
    double v3 = v2;

    return v3;
  }
  return result;
}

double MPUFloatFloorForScale(double a1, double a2)
{
  double SafeScaleForValue = MPUFloatGetSafeScaleForValue(a2);
  return floor(SafeScaleForValue * a1) / SafeScaleForValue;
}

double MPUFloatRoundForScale(double a1, double a2)
{
  double SafeScaleForValue = MPUFloatGetSafeScaleForValue(a2);
  return round(SafeScaleForValue * a1) / SafeScaleForValue;
}

double MPUFloatCeilForScale(double a1, double a2)
{
  double SafeScaleForValue = MPUFloatGetSafeScaleForValue(a2);
  return ceil(SafeScaleForValue * a1) / SafeScaleForValue;
}

BOOL MPUPointEqualToPoint(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a3, a1) < 0.00000011920929;
  return vabdd_f64(a4, a2) < 0.00000011920929 && v4;
}

BOOL MPUSizeEqualToSize(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a3, a1) < 0.00000011920929;
  return vabdd_f64(a4, a2) < 0.00000011920929 && v4;
}

CGFloat MPURectByApplyingUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v16 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v17 = [v16 userInterfaceLayoutDirection];

  if (v17 == 1)
  {
    v22.origin.x = a5;
    v22.origin.y = a6;
    v22.size.width = a7;
    v22.size.height = a8;
    double MaxX = CGRectGetMaxX(v22);
    v23.origin.x = a1;
    v23.origin.y = a2;
    v23.size.width = a3;
    v23.size.height = a4;
    double v19 = MaxX - CGRectGetMinX(v23);
    v24.origin.x = a1;
    v24.origin.y = a2;
    v24.size.width = a3;
    v24.size.height = a4;
    double v20 = v19 - CGRectGetWidth(v24);
    v25.origin.x = a1;
    v25.origin.y = a2;
    v25.size.width = a3;
    v25.size.height = a4;
    CGRectGetMinY(v25);
    v26.origin.x = a1;
    v26.origin.y = a2;
    v26.size.width = a3;
    v26.size.height = a4;
    CGRectGetWidth(v26);
    v27.origin.x = a1;
    v27.origin.y = a2;
    v27.size.width = a3;
    v27.size.height = a4;
    CGRectGetHeight(v27);
    return v20;
  }
  return a1;
}

CGFloat MPURectByRemovingUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v16 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v17 = [v16 userInterfaceLayoutDirection];

  if (v17 == 1)
  {
    v21.origin.x = a5;
    v21.origin.y = a6;
    v21.size.width = a7;
    v21.size.height = a8;
    double MaxX = CGRectGetMaxX(v21);
    v22.origin.x = a1;
    v22.origin.y = a2;
    v22.size.width = a3;
    v22.size.height = a4;
    double v19 = MaxX - CGRectGetMaxX(v22);
    v23.origin.x = a1;
    v23.origin.y = a2;
    v23.size.width = a3;
    v23.size.height = a4;
    CGRectGetMinY(v23);
    v24.origin.x = a1;
    v24.origin.y = a2;
    v24.size.width = a3;
    v24.size.height = a4;
    CGRectGetWidth(v24);
    v25.origin.x = a1;
    v25.origin.y = a2;
    v25.size.width = a3;
    v25.size.height = a4;
    CGRectGetHeight(v25);
    return v19;
  }
  return a1;
}

BOOL MPURectEqualToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return vabdd_f64(a5, a1) < 0.00000011920929
      && vabdd_f64(a6, a2) < 0.00000011920929
      && vabdd_f64(a7, a3) < 0.00000011920929
      && vabdd_f64(a8, a4) < 0.00000011920929;
}

double MPUBalancedEdgeInsets(double a1, double a2, double a3)
{
  if (a1 >= a3) {
    return a1;
  }
  else {
    return a3;
  }
}

double MPUEdgeInsetsOutsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 - a6;
}

CGFloat MPUEdgeInsetsRectInsets(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGFloat v18 = a6 - a2;
  CGRectGetMaxY(*(CGRect *)&a1);
  v19.origin.x = a5;
  v19.origin.y = a6;
  v19.size.width = a7;
  v19.size.height = a8;
  CGRectGetMaxY(v19);
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  CGRectGetMaxX(v20);
  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  CGRectGetMaxX(v21);
  return v18;
}

double MPUInsetsFromRectToRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v22.origin.x = a5;
  v22.origin.y = a6;
  v22.size.width = a7;
  v22.size.height = a8;
  double MinY = CGRectGetMinY(v22);
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.width = a3;
  v23.size.height = a4;
  double v21 = MinY - CGRectGetMinY(v23);
  v24.origin.x = a5;
  v24.origin.y = a6;
  v24.size.width = a7;
  v24.size.height = a8;
  CGRectGetMinX(v24);
  v25.origin.x = a1;
  v25.origin.y = a2;
  v25.size.width = a3;
  v25.size.height = a4;
  CGRectGetMinX(v25);
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  CGRectGetHeight(v26);
  v27.origin.x = a5;
  v27.origin.y = a6;
  v27.size.width = a7;
  v27.size.height = a8;
  CGRectGetHeight(v27);
  v28.origin.x = a1;
  v28.origin.y = a2;
  v28.size.width = a3;
  v28.size.height = a4;
  CGRectGetWidth(v28);
  v29.origin.x = a5;
  v29.origin.y = a6;
  v29.size.width = a7;
  v29.size.height = a8;
  CGRectGetWidth(v29);
  return v21;
}

double MPULayoutLinearRelationMake(double a1, double a2, double a3, double a4)
{
  return (a4 - a2) / (a3 - a1);
}

double MPULayoutLinearRelationEvaluate(double a1, double a2, double a3)
{
  return a2 + a1 * a3;
}

uint64_t MPU::LayoutInterpolator::_EntriesContainerMakeInsertionError@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D2>)
{
  *(_DWORD *)a3 = 0;
  uint64_t v10 = a3 + 8;
  std::string::basic_string[abi:ne180100]<0>((void *)(a3 + 8), "");
  *(_DWORD *)a3 = a2;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v18);
  switch(a2)
  {
    case 1:
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"Found perfect duplicate entry while trying to insert ", 53);
      MPU::LayoutInterpolator::_EntriesContainerAppendEntryDescriptionToStringStream(a4, a1, v18);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)". ", 2);
      long long v11 = "Doing nothing.";
      uint64_t v12 = 14;
      goto LABEL_7;
    case 2:
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"Error: Found inconsistent duplicate entry while trying to insert ", 65);
      MPU::LayoutInterpolator::_EntriesContainerAppendEntryDescriptionToStringStream(a4, a1, v18);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)". ", 2);
      uint64_t v13 = "Already have ";
      uint64_t v14 = 13;
      goto LABEL_6;
    case 3:
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"Error: Attempting to insert ", 28);
      MPU::LayoutInterpolator::_EntriesContainerAppendEntryDescriptionToStringStream(a4, a1, v18);
      uint64_t v13 = " with a specified secondary reference metric with another entry present that does not have a specified secon"
            "dary reference metric: ";
      uint64_t v14 = 131;
      goto LABEL_6;
    case 4:
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"Error: Attempting to insert ", 28);
      MPU::LayoutInterpolator::_EntriesContainerAppendEntryDescriptionToStringStream(a4, a1, v18);
      uint64_t v13 = " without a specified secondary reference metric with another entry present that does have a specified second"
            "ary reference metric: ";
      uint64_t v14 = 130;
LABEL_6:
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)v13, v14);
      MPU::LayoutInterpolator::_EntriesContainerAppendEntryDescriptionToStringStream(a5, a1, v18);
      long long v11 = ".";
      uint64_t v12 = 1;
LABEL_7:
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)v11, v12);
      break;
    default:
      break;
  }
  std::stringbuf::str();
  if (*(char *)(a3 + 31) < 0) {
    operator delete(*(void **)v10);
  }
  *(_OWORD *)uint64_t v10 = v16;
  *(void *)(v10 + 16) = v17;
  v18[0] = *MEMORY[0x263F8C2C8];
  *(void *)((char *)v18 + *(void *)(v18[0] - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  v18[1] = MEMORY[0x263F8C318] + 16;
  if (v19 < 0) {
    operator delete((void *)v18[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x22A6639E0](&v20);
}

void sub_226BCA950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::ostringstream::~ostringstream((uint64_t)va);
  if (*(char *)(v5 + 31) < 0) {
    operator delete(*v4);
  }
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C340] + 64;
  *(void *)(a1 + 112) = MEMORY[0x263F8C340] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  uint64_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 8));
  uint64_t v6 = MEMORY[0x263F8C340] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)a1 = v6;
  *(void *)(a1 + 112) = v2;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_226BCAB00(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x22A6639E0](v1);
  _Unwind_Resume(a1);
}

void *MPU::LayoutInterpolator::_EntriesContainerAppendEntryDescriptionToStringStream(double a1, uint64_t a2, void *a3)
{
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a3, (uint64_t)"(referenceMetric: ", 18);
  std::ostream::operator<<();
  if (!MPUFloatEqualToFloat(a1, -1.13427449e38))
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a3, (uint64_t)", secondaryReferenceMetric: ", 28);
    std::ostream::operator<<();
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a3, (uint64_t)", value: ", 9);
  uint64_t v5 = (void *)std::ostream::operator<<();

  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)")", 1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2C8];
  uint64_t v3 = *MEMORY[0x263F8C2C8];
  *(void *)a1 = *MEMORY[0x263F8C2C8];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x22A6639E0](a1 + 112);
  return a1;
}

uint64_t MPU::LayoutInterpolator::EntriesContainer::EntriesContainer(uint64_t this, double a2)
{
  *(void *)this = 0;
  *(void *)(this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(double *)(this + 24) = a2;
  return this;
}

{
  *(void *)this = 0;
  *(void *)(this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(double *)(this + 24) = a2;
  return this;
}

void *MPU::LayoutInterpolator::EntriesContainer::copyEntriesVector@<X0>(MPU::LayoutInterpolator::EntriesContainer *this@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return std::vector<MPU::LayoutInterpolator::Entry>::__init_with_size[abi:ne180100]<MPU::LayoutInterpolator::Entry*,MPU::LayoutInterpolator::Entry*>(a2, *(const void **)this, *((void *)this + 1), (uint64_t)(*((void *)this + 1) - *(void *)this) >> 4);
}

uint64_t MPU::LayoutInterpolator::EntriesContainer::entriesCount(MPU::LayoutInterpolator::EntriesContainer *this)
{
  return (uint64_t)(*((void *)this + 1) - *(void *)this) >> 4;
}

double MPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric(MPU::LayoutInterpolator::EntriesContainer *this)
{
  return *((double *)this + 3);
}

void MPU::LayoutInterpolator::EntriesContainer::insertEntry(MPU::LayoutInterpolator::EntriesContainer *this@<X0>, Entry a2@<0:D0, 8:D1>, uint64_t a3@<X8>)
{
  double var1 = a2.var1;
  double var0 = a2.var0;
  Entry v25 = a2;
  *(_DWORD *)a3 = 0;
  uint64_t v7 = a3 + 8;
  std::string::basic_string[abi:ne180100]<0>((void *)(a3 + 8), "");
  uint64_t v9 = *(void *)this;
  uint64_t v8 = *((void *)this + 1);
  if (MPUFloatEqualToFloat(var0, -1.13427449e38))
  {
    if (v8 == v9) {
      goto LABEL_15;
    }
    double v11 = **(double **)this;
    double v10 = *(double *)(*(void *)this + 8);
    if (MPUFloatEqualToFloat(v11, -1.13427449e38))
    {
      if (MPUFloatEqualToFloat(v10, var1)) {
        int v12 = 1;
      }
      else {
        int v12 = 2;
      }
      MPU::LayoutInterpolator::_EntriesContainerMakeInsertionError((uint64_t)this, v12, (uint64_t)&v22, var0, v11);
    }
    else
    {
      MPU::LayoutInterpolator::_EntriesContainerMakeInsertionError((uint64_t)this, 4, (uint64_t)&v22, var0, v11);
    }
  }
  else
  {
    if (v8 == v9) {
      goto LABEL_15;
    }
    double v13 = **(double **)this;
    if (!MPUFloatEqualToFloat(v13, -1.13427449e38)) {
      goto LABEL_15;
    }
    MPU::LayoutInterpolator::_EntriesContainerMakeInsertionError((uint64_t)this, 3, (uint64_t)&v22, var0, v13);
  }
  *(_DWORD *)a3 = v22;
  if (*(char *)(a3 + 31) < 0) {
    operator delete(*(void **)v7);
  }
  *(_OWORD *)uint64_t v7 = v23;
  *(void *)(v7 + 16) = v24;
LABEL_15:
  if (!*(_DWORD *)a3)
  {
    double v15 = *(double **)this;
    uint64_t v14 = (double *)*((void *)this + 1);
    if (v14 == *(double **)this)
    {
      double v15 = (double *)*((void *)this + 1);
    }
    else
    {
      unint64_t v16 = ((uint64_t)v14 - *(void *)this) >> 4;
      do
      {
        unint64_t v17 = v16 >> 1;
        CGFloat v18 = &v15[2 * (v16 >> 1)];
        double v20 = *v18;
        char v19 = v18 + 2;
        v16 += ~(v16 >> 1);
        if (v20 < var0) {
          double v15 = v19;
        }
        else {
          unint64_t v16 = v17;
        }
      }
      while (v16);
    }
    if (v14 == v15 || !MPUFloatEqualToFloat(*v15, var0))
    {
      std::vector<MPU::LayoutInterpolator::Entry>::insert((uint64_t)this, (char *)v15, (char *)&v25);
    }
    else
    {
      if (MPUFloatEqualToFloat(v15[1], v25.var1)) {
        int v21 = 1;
      }
      else {
        int v21 = 2;
      }
      MPU::LayoutInterpolator::_EntriesContainerMakeInsertionError((uint64_t)this, v21, (uint64_t)&v22, v25.var0, *v15);
      *(_DWORD *)a3 = v22;
      if (*(char *)(a3 + 31) < 0) {
        operator delete(*(void **)v7);
      }
      *(_OWORD *)uint64_t v7 = v23;
      *(void *)(v7 + 16) = v24;
    }
  }
}

char *std::vector<MPU::LayoutInterpolator::Entry>::insert(uint64_t a1, char *__src, char *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = __src;
  uint64_t v6 = *(char **)(a1 + 8);
  uint64_t v8 = a1 + 16;
  unint64_t v7 = *(void *)(a1 + 16);
  if ((unint64_t)v6 >= v7)
  {
    double v13 = *(char **)a1;
    unint64_t v14 = ((uint64_t)&v6[-*(void *)a1] >> 4) + 1;
    if (v14 >> 60) {
      std::vector<MPU::LayoutInterpolator::Entry>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = __src - v13;
    uint64_t v16 = (__src - v13) >> 4;
    uint64_t v17 = v7 - (void)v13;
    if (v17 >> 3 > v14) {
      unint64_t v14 = v17 >> 3;
    }
    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v18 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v18 = v14;
    }
    uint64_t v30 = a1 + 16;
    if (v18) {
      char v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::Entry>>(a1 + 16, v18);
    }
    else {
      char v19 = 0;
    }
    double v20 = &v19[16 * v16];
    __p = v19;
    CGRect v27 = v20;
    CGRect v28 = v20;
    CGRect v29 = &v19[16 * v18];
    if (v16 == v18)
    {
      if (v15 < 1)
      {
        if (v13 == v4) {
          unint64_t v22 = 1;
        }
        else {
          unint64_t v22 = v15 >> 3;
        }
        long long v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::Entry>>(v8, v22);
        double v20 = &v23[16 * (v22 >> 2)];
        __p = v23;
        CGRect v27 = v20;
        CGRect v29 = &v23[16 * v24];
        if (v19) {
          operator delete(v19);
        }
      }
      else
      {
        unint64_t v21 = v16 + 2;
        if (v16 >= -1) {
          unint64_t v21 = v16 + 1;
        }
        v20 -= 16 * (v21 >> 1);
        CGRect v27 = v20;
      }
    }
    *(_OWORD *)double v20 = *(_OWORD *)v3;
    CGRect v28 = v20 + 16;
    uint64_t v4 = (char *)std::vector<MPU::LayoutInterpolator::Entry>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v4);
    if (v28 != v27) {
      v28 += (v27 - v28 + 15) & 0xFFFFFFFFFFFFFFF0;
    }
    if (__p) {
      operator delete(__p);
    }
  }
  else if (__src == v6)
  {
    *(_OWORD *)__src = *(_OWORD *)a3;
    *(void *)(a1 + 8) = __src + 16;
  }
  else
  {
    uint64_t v9 = __src + 16;
    double v10 = v6 - 16;
    double v11 = *(_OWORD **)(a1 + 8);
    while (v10 < v6)
    {
      long long v12 = *(_OWORD *)v10;
      v10 += 16;
      *v11++ = v12;
    }
    *(void *)(a1 + 8) = v11;
    if (v6 != v9) {
      memmove(&v6[-16 * ((v6 - v9) >> 4)], __src, v6 - v9);
    }
    if (v4 <= v3) {
      v3 += 16 * (*(void *)(a1 + 8) > (unint64_t)v3);
    }
    *(_OWORD *)uint64_t v4 = *(_OWORD *)v3;
  }
  return v4;
}

void sub_226BCB1A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

double MPU::LayoutInterpolator::EntriesContainer::valueForSecondaryReferenceMetric(double **this, double a2)
{
  uint64_t v3 = *this;
  uint64_t v2 = this[1];
  unint64_t v4 = ((char *)v2 - (char *)*this) >> 4;
  if (v4 == 1) {
    return v3[1];
  }
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x18uLL);
    std::string::basic_string[abi:ne180100]<0>(exception, "Can't query value from empty entries container.");
  }
  if (v2 == v3) {
    goto LABEL_11;
  }
  do
  {
    unint64_t v7 = v4 >> 1;
    uint64_t v8 = &v3[2 * (v4 >> 1)];
    double v10 = *v8;
    uint64_t v9 = v8 + 2;
    v4 += ~(v4 >> 1);
    if (v10 < a2) {
      uint64_t v3 = v9;
    }
    else {
      unint64_t v4 = v7;
    }
  }
  while (v4);
  if (v3 == v2)
  {
LABEL_11:
    double v12 = *(v2 - 4);
    double v13 = *(v2 - 3);
    double v14 = *(v2 - 2);
    double v15 = *(v2 - 1);
  }
  else
  {
    if (MPUFloatEqualToFloat(*v3, a2)) {
      return v3[1];
    }
    if (v3 == *this)
    {
      double v12 = *v3;
      double v13 = v3[1];
      double v14 = v3[2];
      double v15 = v3[3];
    }
    else
    {
      double v12 = *(v3 - 2);
      double v13 = *(v3 - 1);
      double v14 = *v3;
      double v15 = v3[1];
    }
  }
  double v16 = MPULayoutLinearRelationMake(v12, v13, v14, v15);

  return MPULayoutLinearRelationEvaluate(v16, v17, a2);
}

void sub_226BCB2F4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22A663940](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      double v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x22A663950](v13);
  return a1;
}

void sub_226BCB448(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x22A663950](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x226BCB428);
}

void sub_226BCB49C(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      double v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_226BCB61C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void *std::vector<MPU::LayoutInterpolator::Entry>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  uint64_t v5 = *(void **)(a2 + 8);
  uint64_t v6 = (char *)*a1;
  size_t v7 = v5;
  if (*a1 != __src)
  {
    size_t v8 = __src;
    uint64_t v9 = *(void *)(a2 + 8);
    do
    {
      size_t v7 = (void *)(v9 - 16);
      *(_OWORD *)(v9 - 16) = *((_OWORD *)v8 - 1);
      v8 -= 16;
      v9 -= 16;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  double v10 = a1[1];
  uint64_t v11 = *(void *)(a2 + 16);
  int64_t v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    size_t v7 = *(void **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v11 + v12;
  double v13 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v13;
  uint64_t v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v14;
  uint64_t v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v15;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

void sub_226BCE38C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t _MPUStackViewApplyLayoutToItem(uint64_t a1, void *a2, uint64_t a3, float64x2_t a4, float64_t a5)
{
  double v6 = (double)a3;
  double v7 = -(double)a3;
  if (a3 >= 0) {
    double v7 = (double)a3;
  }
  float64x2_t v8 = vaddq_f64(*(float64x2_t *)(a1 + 96), *(float64x2_t *)(a1 + 96));
  double v9 = *(double *)a1 - v6 * v8.f64[0];
  double v10 = *(double *)(a1 + 8) - vmuld_lane_f64(v6, v8, 1);
  float64x2_t v11 = vmulq_n_f64(*(float64x2_t *)(a1 + 72), v7);
  __asm { FMOV            V5.2D, #0.5 }
  float64x2_t v16 = vmulq_f64(vmulq_n_f64(v8, v7), _Q5);
  float64x2_t v17 = vsubq_f64(vnegq_f64(v11), v16);
  float64x2_t v18 = vaddq_f64(v16, v11);
  a4.f64[1] = a5;
  float64x2_t v19 = vmlaq_f64(v17, vaddq_f64(vmulq_f64(a4, _Q5), _Q5), vaddq_f64((float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v17), (int8x16_t)vnegq_f64(v17), (int8x16_t)v17), (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v18), (int8x16_t)vnegq_f64(v18), (int8x16_t)v18)));
  int32x2_t v20 = vdup_n_s32(a3 < 0);
  v21.i64[0] = v20.u32[0];
  v21.i64[1] = v20.u32[1];
  uint64_t v22 = MEMORY[0x263F00148];
  float64x2_t v23 = vaddq_f64(*(float64x2_t *)(a1 + 48), (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v21, 0x3FuLL)), (int8x16_t)vnegq_f64(v19), (int8x16_t)v19));
  if (!*(unsigned char *)(a1 + 64))
  {
    if (!*(unsigned char *)(a1 + 65)) {
      goto LABEL_9;
    }
    double v24 = *(double *)(a1 + 88);
    v27.f64[0] = v23.f64[0];
LABEL_8:
    float v28 = (v23.f64[1] - v10 * 0.5) * v24;
    v27.f64[1] = v10 * 0.5 + roundf(v28) / v24;
    float64x2_t v41 = v27;
    goto LABEL_10;
  }
  double v24 = *(double *)(a1 + 88);
  float v25 = (v23.f64[0] - v9 * 0.5) * v24;
  double v26 = roundf(v25) / v24;
  v27.f64[0] = v9 * 0.5 + v26;
  if (*(unsigned char *)(a1 + 65)) {
    goto LABEL_8;
  }
  v23.f64[0] = v9 * 0.5 + v26;
LABEL_9:
  float64x2_t v41 = v23;
LABEL_10:
  double v29 = *MEMORY[0x263F00148];
  objc_msgSend(a2, "center", *(void *)&v41.f64[0]);
  if (v31 != v41.f64[0] || v30 != v41.f64[1])
  {
    double v33 = [a2 layer];
    [v33 setPosition:*(_OWORD *)&v41];
  }
  double v34 = *(double *)(v22 + 8);
  uint64_t result = [a2 bounds];
  if (v39 != v29 || v36 != v34 || (v37 == v9 ? (BOOL v40 = v38 == v10) : (BOOL v40 = 0), !v40))
  {
    return objc_msgSend(a2, "setBounds:", v29, v34, v9, v10);
  }
  return result;
}

void sub_226BD0C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t MPUContentItemTypeIsContainerType(unint64_t a1)
{
  return (a1 < 0xF) & (0x67F8u >> a1);
}

void sub_226BD35EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

__CFString *MPUFontTextStyleGetDescription(uint64_t a1)
{
  return _MPUFontTextStyleGetDescriptionAndCustomStyleStatus(a1, 0);
}

__CFString *_MPUFontTextStyleGetDescriptionAndCustomStyleStatus(uint64_t a1, char *a2)
{
  switch(a1)
  {
    case 0:
      char v2 = 0;
      uint64_t result = @"body";
      break;
    case 1:
      char v2 = 0;
      uint64_t result = @"headline";
      break;
    case 2:
      char v2 = 0;
      uint64_t result = @"subheadline";
      break;
    case 3:
      char v2 = 0;
      uint64_t result = @"footnote";
      break;
    case 4:
      char v2 = 0;
      uint64_t result = @"caption-1";
      break;
    case 5:
      char v2 = 0;
      uint64_t result = @"caption-2";
      break;
    case 6:
      char v2 = 0;
      uint64_t result = @"title-0";
      break;
    case 7:
      char v2 = 0;
      uint64_t result = @"title-1";
      break;
    case 8:
      char v2 = 0;
      uint64_t result = @"title-2";
      break;
    case 9:
      char v2 = 0;
      uint64_t result = @"title-3";
      break;
    case 10:
      char v2 = 0;
      uint64_t result = @"headline-1";
      break;
    case 11:
      char v2 = 0;
      uint64_t result = @"headline-2";
      break;
    case 12:
      char v2 = 0;
      uint64_t result = @"subheadline-1";
      break;
    case 13:
      char v2 = 0;
      uint64_t result = @"subheadline-2";
      break;
    case 14:
      char v2 = 0;
      uint64_t result = @"callout";
      break;
    case 15:
      char v2 = 0;
      uint64_t result = @"footnote-1";
      break;
    case 16:
      char v2 = 0;
      uint64_t result = @"footnote-2";
      break;
    case 17:
      char v2 = 1;
      uint64_t result = @"subheadline-3";
      break;
    case 18:
      char v2 = 1;
      uint64_t result = @"now-playing-title-1";
      break;
    case 19:
      char v2 = 0;
      uint64_t result = @"music-title-2";
      break;
    case 20:
      char v2 = 0;
      uint64_t result = @"music-title-2-multiline";
      break;
    case 21:
      char v2 = 1;
      uint64_t result = @"page-header";
      break;
    case 22:
      char v2 = 1;
      uint64_t result = @"page-header-large";
      break;
    case 23:
      char v2 = 1;
      uint64_t result = @"page-header-mid-large";
      break;
    case 24:
      char v2 = 1;
      uint64_t result = @"page-header-small";
      break;
    case 25:
      char v2 = 1;
      uint64_t result = @"page-header-compact-supertitle";
      break;
    case 26:
      char v2 = 1;
      uint64_t result = @"page-header-compact-subtitle";
      break;
    case 27:
      char v2 = 1;
      uint64_t result = @"page-header-regular-subtitle";
      break;
    default:
      BOOL v4 = a1 == 1000;
      if (a1 == 1000) {
        uint64_t result = @"system-font";
      }
      else {
        uint64_t result = 0;
      }
      char v2 = v4;
      break;
  }
  if (a2) {
    *a2 = v2;
  }
  return result;
}

__CFString *MPUFontWeightGetDescription(unint64_t a1)
{
  if (a1 > 8) {
    return 0;
  }
  else {
    return off_2647D0FB0[a1];
  }
}

__CFString *MPUFontLeadingAdjustmentGetDescription(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_2647D0FF8[a1];
  }
}

void sub_226BD4FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCTFontDescriptorTextStyleHeavySymbolLoc_block_invoke(uint64_t a1)
{
  char v2 = (void *)CoreTextLibrary_0();
  uint64_t result = dlsym(v2, "kCTFontDescriptorTextStyleHeavy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCTFontDescriptorTextStyleHeavySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreTextLibrary_0()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!CoreTextLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __CoreTextLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2647D0F98;
    uint64_t v5 = 0;
    CoreTextLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = CoreTextLibraryCore_frameworkLibrary_0;
  uint64_t v1 = (void *)v3[0];
  if (!CoreTextLibraryCore_frameworkLibrary_0)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __CoreTextLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  CoreTextLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getkCTFontDescriptorTextStyleBoldSymbolLoc_block_invoke(uint64_t a1)
{
  char v2 = (void *)CoreTextLibrary_0();
  uint64_t result = dlsym(v2, "kCTFontDescriptorTextStyleBold");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCTFontDescriptorTextStyleBoldSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCTFontDescriptorTextStyleSemiboldSymbolLoc_block_invoke(uint64_t a1)
{
  char v2 = (void *)CoreTextLibrary_0();
  uint64_t result = dlsym(v2, "kCTFontDescriptorTextStyleSemibold");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCTFontDescriptorTextStyleSemiboldSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCTFontDescriptorTextStyleMediumSymbolLoc_block_invoke(uint64_t a1)
{
  char v2 = (void *)CoreTextLibrary_0();
  uint64_t result = dlsym(v2, "kCTFontDescriptorTextStyleMedium");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCTFontDescriptorTextStyleMediumSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCTFontDescriptorTextStyleRegularSymbolLoc_block_invoke_0(uint64_t a1)
{
  char v2 = (void *)CoreTextLibrary_0();
  uint64_t result = dlsym(v2, "kCTFontDescriptorTextStyleRegular");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCTFontDescriptorTextStyleRegularSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCTFontDescriptorTextStyleLightSymbolLoc_block_invoke(uint64_t a1)
{
  char v2 = (void *)CoreTextLibrary_0();
  uint64_t result = dlsym(v2, "kCTFontDescriptorTextStyleLight");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCTFontDescriptorTextStyleLightSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCTFontDescriptorTextStyleUltraLightSymbolLoc_block_invoke(uint64_t a1)
{
  char v2 = (void *)CoreTextLibrary_0();
  uint64_t result = dlsym(v2, "kCTFontDescriptorTextStyleUltraLight");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCTFontDescriptorTextStyleUltraLightSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCTFontDescriptorTextStyleThinSymbolLoc_block_invoke(uint64_t a1)
{
  char v2 = (void *)CoreTextLibrary_0();
  uint64_t result = dlsym(v2, "kCTFontDescriptorTextStyleThin");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCTFontDescriptorTextStyleThinSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_226BD82EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226BD836C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

uint64_t MPUNowPlayingIndicatorPlaybackStateFromMPPlaybackState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return 0;
  }
  else {
    return qword_226BDEFC8[a1 - 1];
  }
}

void sub_226BDAC30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x270EFB950](retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x270EFB960](retstr, t, angle, x, y, z);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x270EE5970](t1, t2);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x270EF2A80](retstr, table);
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x270EF2B30](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

void NSMapRemove(NSMapTable *table, const void *key)
{
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x270EF2B60](enumerator, key, value);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x270F05F80]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x270F06220]();
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F06240]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x270EE57C8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98790]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

htmlDocPtr htmlSAXParseDoc(const xmlChar *cur, const char *encoding, htmlSAXHandlerPtr sax, void *userData)
{
  return (htmlDocPtr)MEMORY[0x270F9BAC8](cur, encoding, sax, userData);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

xmlChar *__cdecl xmlCharStrndup(const char *cur, int len)
{
  return (xmlChar *)MEMORY[0x270F9BB90](cur, *(void *)&len);
}

void xmlCleanupParser(void)
{
}

const char *__cdecl xmlGetCharEncodingName(xmlCharEncoding enc)
{
  return (const char *)MEMORY[0x270F9BCD0](*(void *)&enc);
}

xmlEntityPtr xmlGetPredefinedEntity(const xmlChar *name)
{
  return (xmlEntityPtr)MEMORY[0x270F9BD28](name);
}