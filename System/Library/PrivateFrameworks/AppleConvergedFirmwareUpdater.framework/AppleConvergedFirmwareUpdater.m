void ACFURTKitNVRMGenerator::create(void *a1@<X0>, int a2@<W1>, ACFURTKitNVRMGenerator **a3@<X8>)
{
  _DWORD *v6;
  uint64_t v7;
  void *LogInstance;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t vars8;

  v6 = operator new(0x10uLL);
  *(void *)v6 = 0;
  v6[2] = 0;
  *((unsigned char *)v6 + 12) = 0;
  *a3 = (ACFURTKitNVRMGenerator *)v6;
  v7 = ACFURTKitNVRMGenerator::init((uint64_t)v6, a1, a2);
  if ((v7 & 1) == 0)
  {
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)v7);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to initialize nv object\n", v9, v10, v11, v12, v13, (char)"ACFURTKitNVRMGenerator");
    std::unique_ptr<ACFURTKitNVRMGenerator>::reset[abi:ne180100](a3, 0);
  }
}

void sub_22EEFC06C(_Unwind_Exception *a1)
{
  std::unique_ptr<ACFURTKitNVRMGenerator>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void ACFURTKitNVRMGenerator::ACFURTKitNVRMGenerator(ACFURTKitNVRMGenerator *this)
{
  *(void *)this = 0;
  *((_DWORD *)this + 2) = 0;
  *((unsigned char *)this + 12) = 0;
}

{
  *(void *)this = 0;
  *((_DWORD *)this + 2) = 0;
  *((unsigned char *)this + 12) = 0;
}

uint64_t ACFURTKitNVRMGenerator::init(uint64_t a1, void *a2, int a3)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  v6 = (ACFULogging *)operator new(0x30uLL);
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  v7 = *(void **)a1;
  *(void *)a1 = v6;
  if (v7)
  {
    std::default_delete<ACFURTKitNVRMGenerator::RTKitNVRMObj>::operator()[abi:ne180100](a1, v7);
    if (!*(void *)a1)
    {
      v43 = "%s::%s: failed: NVRM allocation failure\n";
      goto LABEL_45;
    }
  }
  if (a2[2] > 0x13uLL)
  {
    v43 = "%s::%s: failed: too many nv items\n";
LABEL_45:
    LogInstance = ACFULogging::getLogInstance(v6);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v43, v45, v46, v47, v48, v49, (char)"ACFURTKitNVRMGenerator");
    return 0;
  }
  *(_DWORD *)(a1 + 8) = a3;
  *(unsigned char *)(a1 + 12) = a3 != 0;
  v10 = (void *)*a2;
  v8 = a2 + 1;
  v9 = v10;
  if (v10 != v8)
  {
    do
    {
      long long __dst = 0uLL;
      v11 = v9 + 4;
      CFDataRef theData = ACFURTKitNVRMGenerator::createDataFromType(v6, (const __CFNumber *)v9[7]);
      if (theData)
      {
        int v12 = *((char *)v9 + 55);
        if (v12 < 0)
        {
          v11 = (const void *)v9[4];
          if (v9[5] >= 8uLL) {
            size_t v13 = 8;
          }
          else {
            size_t v13 = v9[5];
          }
        }
        else if ((v12 & 0xF8) != 0)
        {
          size_t v13 = 8;
        }
        else
        {
          size_t v13 = *((unsigned __int8 *)v9 + 55);
        }
        v26 = (ACFURTKitNVRMGenerator *)memcpy(&__dst, v11, v13);
        HIDWORD(__dst) = ACFURTKitNVRMGenerator::getVariableTypeFlag(v26, (CFTypeRef)v9[7]);
        DWORD2(__dst) = CFDataGetLength(theData);
        v27 = *(void **)a1;
        unint64_t v28 = *(void *)(*(void *)a1 + 32);
        v6 = (ACFULogging *)(*(void *)a1 + 40);
        if (v28 >= *(void *)v6)
        {
          uint64_t v30 = v27[3];
          unint64_t v31 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v28 - v30) >> 3);
          unint64_t v32 = v31 + 1;
          if (v31 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<ACFURTKitNVRMGenerator::RTKitNVRMVariable>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * ((*(void *)v6 - v30) >> 3) > v32) {
            unint64_t v32 = 0x5555555555555556 * ((*(void *)v6 - v30) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((*(void *)v6 - v30) >> 3) >= 0x555555555555555) {
            unint64_t v33 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v33 = v32;
          }
          if (v33) {
            v6 = (ACFULogging *)std::__allocate_at_least[abi:ne180100]<std::allocator<ACFURTKitNVRMGenerator::RTKitNVRMVariable>>((uint64_t)v6, v33);
          }
          else {
            v6 = 0;
          }
          v34 = (char *)v6 + 24 * v31;
          *(_OWORD *)v34 = __dst;
          *((void *)v34 + 2) = theData;
          v36 = (char *)v27[3];
          v35 = (char *)v27[4];
          v37 = v34;
          if (v35 != v36)
          {
            do
            {
              long long v38 = *(_OWORD *)(v35 - 24);
              *((void *)v37 - 1) = *((void *)v35 - 1);
              *(_OWORD *)(v37 - 24) = v38;
              v37 -= 24;
              v35 -= 24;
            }
            while (v35 != v36);
            v35 = (char *)v27[3];
          }
          v29 = v34 + 24;
          v27[3] = v37;
          v27[4] = v34 + 24;
          v27[5] = (char *)v6 + 24 * v33;
          if (v35) {
            operator delete(v35);
          }
        }
        else
        {
          *(_OWORD *)unint64_t v28 = __dst;
          *(void *)(v28 + 16) = theData;
          v29 = (char *)(v28 + 24);
        }
        v27[4] = v29;
      }
      else
      {
        v14 = ACFULogging::getLogInstance(0);
        ACFULogging::handleMessage((uint64_t)v14, 2u, "%s::%s: failed to encode NVRM variable '%s'\n", v15, v16, v17, v18, v19, (char)"ACFURTKitNVRMGenerator");
        v21 = ACFULogging::getLogInstance(v20);
        std::string::basic_string[abi:ne180100]<0>(&v50, "ACFURTKitNVRMGenerator");
        v22 = std::string::append(&v50, "::");
        long long v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
        v51.__r_.__value_.__r.__words[2] = v22->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v51.__r_.__value_.__l.__data_ = v23;
        v22->__r_.__value_.__l.__size_ = 0;
        v22->__r_.__value_.__r.__words[2] = 0;
        v22->__r_.__value_.__r.__words[0] = 0;
        v24 = std::string::append(&v51, "init");
        long long v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
        std::string::size_type v53 = v24->__r_.__value_.__r.__words[2];
        *(_OWORD *)__p = v25;
        v24->__r_.__value_.__l.__size_ = 0;
        v24->__r_.__value_.__r.__words[2] = 0;
        v24->__r_.__value_.__r.__words[0] = 0;
        ACFULogging::handleMessageCFType((uint64_t)v21, (uint64_t *)__p, 2, (uint64_t)"NVRAM variable data:", v9[7]);
        if (SHIBYTE(v53) < 0) {
          operator delete(__p[0]);
        }
        if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v51.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v50.__r_.__value_.__l.__data_);
        }
      }
      v39 = (void *)v9[1];
      if (v39)
      {
        do
        {
          v40 = v39;
          v39 = (void *)*v39;
        }
        while (v39);
      }
      else
      {
        do
        {
          v40 = (void *)v9[2];
          BOOL v41 = *v40 == (void)v9;
          v9 = v40;
        }
        while (!v41);
      }
      v9 = v40;
    }
    while (v40 != v8);
  }
  return 1;
}

void sub_22EEFC450(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::unique_ptr<ACFURTKitNVRMGenerator>::reset[abi:ne180100](ACFURTKitNVRMGenerator **a1, ACFURTKitNVRMGenerator *a2)
{
  v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    ACFURTKitNVRMGenerator::~ACFURTKitNVRMGenerator(v3);
    operator delete(v4);
  }
}

void ACFURTKitNVRMGenerator::create(ACFURTKitNVRMGenerator *this@<X0>, ACFURTKitNVRMGenerator **a2@<X8>)
{
  v5 = operator new(0x10uLL);
  *(void *)v5 = 0;
  v5[2] = 0;
  *((unsigned char *)v5 + 12) = 0;
  *a2 = (ACFURTKitNVRMGenerator *)v5;
  v6 = (ACFULogging *)ACFURTKitNVRMGenerator::init((ACFURTKitNVRMGenerator *)v5, this);
  if ((v6 & 1) == 0)
  {
    LogInstance = ACFULogging::getLogInstance(v6);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to initialize nv object\n", v8, v9, v10, v11, v12, (char)"ACFURTKitNVRMGenerator");
    std::unique_ptr<ACFURTKitNVRMGenerator>::reset[abi:ne180100](a2, 0);
  }
}

void sub_22EEFC584(_Unwind_Exception *a1)
{
  std::unique_ptr<ACFURTKitNVRMGenerator>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

uint64_t ACFURTKitNVRMGenerator::init(ACFURTKitNVRMGenerator *this, const __CFData *a2)
{
  v4 = (ACFULogging *)operator new(0x30uLL);
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  v5 = *(void **)this;
  *(void *)this = v4;
  if (v5
    && (std::default_delete<ACFURTKitNVRMGenerator::RTKitNVRMObj>::operator()[abi:ne180100]((int)this, v5),
        !*(void *)this))
  {
    LogInstance = ACFULogging::getLogInstance(v4);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed: NVRM allocation failure\n", v44, v45, v46, v47, v48, (char)"ACFURTKitNVRMGenerator");
  }
  else if (a2)
  {
    Length = (ACFULogging *)CFDataGetLength(a2);
    *((_DWORD *)this + 2) = Length;
    if (Length)
    {
      *((unsigned char *)this + 12) = 0;
      BytePtr = (unsigned int *)CFDataGetBytePtr(a2);
      unsigned int v8 = *((_DWORD *)this + 2);
      uint64_t v9 = BytePtr[2];
      if (v8 < v9)
      {
        v55 = ACFULogging::getLogInstance((ACFULogging *)BytePtr);
        ACFULogging::handleMessage((uint64_t)v55, 2u, "%s::%s: failed: header length check validation failed\n", v56, v57, v58, v59, v60, (char)"ACFURTKitNVRMGenerator");
      }
      else if (BytePtr[3] == v8)
      {
        if (BytePtr[5] >= 2)
        {
          v67 = ACFULogging::getLogInstance((ACFULogging *)BytePtr);
          ACFULogging::handleMessage((uint64_t)v67, 2u, "%s::%s: failed: unsupported NV flags\n", v68, v69, v70, v71, v72, (char)"ACFURTKitNVRMGenerator");
        }
        else
        {
          uint64_t v10 = (unsigned int *)((char *)BytePtr + v9);
          uint64_t v11 = BytePtr + 6;
          if (BytePtr + 6 >= (unsigned int *)((char *)BytePtr + v9)) {
            return 1;
          }
          CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          while (1)
          {
            long long v73 = *(_OWORD *)v11;
            CFDataRef v13 = CFDataCreate(v12, (const UInt8 *)v11 + 16, v11[2]);
            if (!v13) {
              break;
            }
            CFDataRef v14 = v13;
            uint64_t v15 = *(void **)this;
            unint64_t v16 = *(void *)(*(void *)this + 32);
            unint64_t v17 = *(void *)(*(void *)this + 40);
            if (v16 >= v17)
            {
              uint64_t v18 = v15[3];
              unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16 - v18) >> 3);
              unint64_t v20 = v19 + 1;
              if (v19 + 1 > 0xAAAAAAAAAAAAAAALL) {
                std::vector<ACFURTKitNVRMGenerator::RTKitNVRMVariable>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v17 - v18) >> 3);
              if (2 * v21 > v20) {
                unint64_t v20 = 2 * v21;
              }
              if (v21 >= 0x555555555555555) {
                unint64_t v22 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v22 = v20;
              }
              if (v22) {
                long long v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ACFURTKitNVRMGenerator::RTKitNVRMVariable>>(*(void *)this + 40, v22);
              }
              else {
                long long v23 = 0;
              }
              v24 = &v23[24 * v19];
              *(_OWORD *)v24 = v73;
              *((void *)v24 + 2) = v14;
              v26 = (char *)v15[3];
              long long v25 = (char *)v15[4];
              v27 = v24;
              if (v25 != v26)
              {
                do
                {
                  long long v28 = *(_OWORD *)(v25 - 24);
                  *((void *)v27 - 1) = *((void *)v25 - 1);
                  *(_OWORD *)(v27 - 24) = v28;
                  v27 -= 24;
                  v25 -= 24;
                }
                while (v25 != v26);
                long long v25 = (char *)v15[3];
              }
              v29 = v24 + 24;
              v15[3] = v27;
              v15[4] = v24 + 24;
              v15[5] = &v23[24 * v22];
              if (v25) {
                operator delete(v25);
              }
              v15[4] = v29;
            }
            else
            {
              *(_OWORD *)unint64_t v16 = v73;
              *(void *)(v16 + 16) = v13;
              v15[4] = v16 + 24;
            }
            uint64_t v11 = (unsigned int *)((char *)v11 + v11[2] + 16);
            if (v11 >= v10) {
              return 1;
            }
          }
          unint64_t v31 = ACFULogging::getLogInstance(0);
          ACFULogging::handleMessage((uint64_t)v31, 2u, "%s::%s: failed: could not allocate variable\n", v32, v33, v34, v35, v36, (char)"ACFURTKitNVRMGenerator");
        }
      }
      else
      {
        v61 = ACFULogging::getLogInstance((ACFULogging *)BytePtr);
        ACFULogging::handleMessage((uint64_t)v61, 2u, "%s::%s: failed: max length reservation is not equal to the data buffer\n", v62, v63, v64, v65, v66, (char)"ACFURTKitNVRMGenerator");
      }
    }
    else
    {
      uint64_t v49 = ACFULogging::getLogInstance(Length);
      ACFULogging::handleMessage((uint64_t)v49, 2u, "%s::%s: failed: data buffer is empty\n", v50, v51, v52, v53, v54, (char)"ACFURTKitNVRMGenerator");
    }
  }
  else
  {
    v37 = ACFULogging::getLogInstance(v4);
    ACFULogging::handleMessage((uint64_t)v37, 2u, "%s::%s: failed: bad input parameter\n", v38, v39, v40, v41, v42, (char)"ACFURTKitNVRMGenerator");
  }
  return 0;
}

const __CFData *ACFURTKitNVRMGenerator::copy(const UInt8 **this)
{
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFDataRef v3 = Mutable;
  if (Mutable)
  {
    CFDataAppendBytes(Mutable, *this, 24);
    v4 = (UInt8 *)*this;
    if (*((void *)*this + 4) == *((void *)*this + 3))
    {
      int v6 = 0;
    }
    else
    {
      unint64_t v5 = 0;
      int v6 = 0;
      do
      {
        CFIndex Length = CFDataGetLength(v3);
        v4 = (UInt8 *)*this;
        uint64_t v8 = *((void *)*this + 3);
        if (*(void *)(v8 + 24 * v5 + 16))
        {
          CFIndex v9 = Length;
          CFDataAppendBytes(v3, (const UInt8 *)(v8 + 24 * v5), 16);
          BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*((void *)*this + 3) + 24 * v5 + 16));
          CFIndex v11 = CFDataGetLength(*(CFDataRef *)(*((void *)*this + 3) + 24 * v5 + 16));
          CFDataAppendBytes(v3, BytePtr, v11);
          CFAllocatorRef v12 = CFDataGetBytePtr(v3);
          CFDataRef v13 = (ACFULogging *)CFDataGetLength(v3);
          if (v13 != (ACFULogging *)v9)
          {
            unsigned int v14 = ~v6;
            uint64_t v15 = &v12[v9];
            CFIndex v16 = v9 - (void)v13;
            do
            {
              int v17 = *v15++;
              unsigned int v14 = crc32_table[v14 ^ v17] ^ (v14 >> 8);
            }
            while (!__CFADD__(v16++, 1));
            int v6 = ~v14;
          }
          LogInstance = ACFULogging::getLogInstance(v13);
          ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: checksum: 0x%x\n", v20, v21, v22, v23, v24, (char)"ACFURTKitNVRMGenerator");
          v4 = (UInt8 *)*this;
          uint64_t v8 = *((void *)*this + 3);
        }
        ++v5;
      }
      while (0xAAAAAAAAAAAAAAABLL * ((*((void *)v4 + 4) - v8) >> 3) > v5);
    }
    *(_DWORD *)v4 = 1316386387;
    *((_DWORD *)v4 + 1) = v6;
    long long v25 = (ACFULogging *)CFDataGetLength(v3);
    v26 = *this;
    *((_DWORD *)*this + 2) = v25;
    unsigned int v27 = *((_DWORD *)this + 2);
    if (*((unsigned char *)this + 12) && v27 < v25)
    {
      uint64_t v45 = ACFULogging::getLogInstance(v25);
      ACFULogging::handleMessage((uint64_t)v45, 2u, "%s::%s: length reservation requirements not met (max: %d, actual:%d)\n", v46, v47, v48, v49, v50, (char)"ACFURTKitNVRMGenerator");
    }
    else
    {
      if (v27 <= v25) {
        unsigned int v27 = v25;
      }
      *((_DWORD *)v26 + 3) = v27;
      *((void *)v26 + 2) = 0x100000001;
      v55.location = 0;
      v55.length = 24;
      CFDataReplaceBytes(v3, v55, v26, 24);
      uint64_t v28 = *((unsigned int *)*this + 3);
      CFIndex v29 = CFDataGetLength(v3);
      CFDataIncreaseLength(v3, v28 - v29);
      unint64_t v31 = ACFULogging::getLogInstance(v30);
      std::string::basic_string[abi:ne180100]<0>(&v51, "ACFURTKitNVRMGenerator");
      uint64_t v32 = std::string::append(&v51, "::");
      long long v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
      v52.__r_.__value_.__r.__words[2] = v32->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v52.__r_.__value_.__l.__data_ = v33;
      v32->__r_.__value_.__l.__size_ = 0;
      v32->__r_.__value_.__r.__words[2] = 0;
      v32->__r_.__value_.__r.__words[0] = 0;
      uint64_t v34 = std::string::append(&v52, "copy");
      long long v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
      std::string::size_type v54 = v34->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v35;
      v34->__r_.__value_.__l.__size_ = 0;
      v34->__r_.__value_.__r.__words[2] = 0;
      v34->__r_.__value_.__r.__words[0] = 0;
      uint64_t v36 = CFDataGetBytePtr(v3);
      CFIndex v37 = CFDataGetLength(v3);
      ACFULogging::handleMessageBinary((uint64_t)v31, (uint64_t *)__p, 4, (uint64_t)v36, v37, 0);
      if (SHIBYTE(v54) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v52.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v51.__r_.__value_.__l.__data_);
      }
    }
  }
  else
  {
    uint64_t v39 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v39, 2u, "%s::%s: output NVRM allocation failure\n", v40, v41, v42, v43, v44, (char)"ACFURTKitNVRMGenerator");
  }
  return v3;
}

void sub_22EEFCC44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  if (a19 < 0) {
    operator delete(a14);
  }
  _Unwind_Resume(exception_object);
}

void ACFURTKitNVRMGenerator::crc32(ACFURTKitNVRMGenerator *this, unsigned int *a2, const unsigned __int8 *a3, uint64_t a4)
{
  int v4 = *a2;
  unsigned int v5 = ~*a2;
  *a2 = v5;
  if (a4)
  {
    do
    {
      int v6 = *a3++;
      unsigned int v5 = crc32_table[v5 ^ v6] ^ (v5 >> 8);
      *a2 = v5;
      --a4;
    }
    while (a4);
    int v4 = ~v5;
  }
  *a2 = v4;
}

void ACFURTKitNVRMGenerator::copyDirectData(const UInt8 **this@<X0>, ACFUDataContainer::DirectDataRef **a2@<X8>)
{
  *a2 = 0;
  CFDataRef v3 = ACFURTKitNVRMGenerator::copy(this);
  CFDataRef v4 = v3;
  if (v3)
  {
    CFIndex Length = CFDataGetLength(v3);
    int v6 = malloc(Length);
    if (v6)
    {
      v7 = v6;
      CFIndex v8 = CFDataGetLength(v4);
      CFIndex v9 = (ACFUDataContainer::DirectDataRef *)operator new(0x18uLL);
      ACFUDataContainer::DirectDataRef::DirectDataRef((uint64_t)v9, v7, v8);
      std::unique_ptr<ACFUDataContainer::DirectDataRef>::reset[abi:ne180100](a2, v9);
    }
    else
    {
      LogInstance = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to allocate direct data\n", v11, v12, v13, v14, v15, (char)"ACFURTKitNVRMGenerator");
    }
    CFRelease(v4);
  }
}

void sub_22EEFCD94(_Unwind_Exception *a1)
{
  operator delete(v2);
  std::unique_ptr<ACFUDataContainer::DirectDataRef>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

uint64_t ACFURTKitNVRMGenerator::add(ACFURTKitNVRMGenerator *a1, char *a2, const __CFNumber *cf, char a4)
{
  unsigned int v5 = a2;
  int v6 = a1;
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(void *)(*(void *)a1 + 24);
  uint64_t v7 = *(void *)(*(void *)a1 + 32);
  if (v7 == v8)
  {
LABEL_9:
    DataFromType = ACFURTKitNVRMGenerator::createDataFromType(a1, cf);
    if (DataFromType)
    {
      CFDataRef v15 = DataFromType;
      *(void *)&long long __dst = 0;
      int v16 = v5[23];
      if (v16 < 0)
      {
        uint64_t v24 = v5;
        unsigned int v5 = *(char **)v5;
        unint64_t v23 = *((void *)v24 + 1);
        if (v23 >= 8) {
          size_t v17 = 8;
        }
        else {
          size_t v17 = v23;
        }
      }
      else if ((v16 & 0xF8) != 0)
      {
        size_t v17 = 8;
      }
      else
      {
        size_t v17 = v5[23];
      }
      long long v25 = (ACFURTKitNVRMGenerator *)memcpy(&__dst, v5, v17);
      HIDWORD(__dst) = ACFURTKitNVRMGenerator::getVariableTypeFlag(v25, cf);
      DWORD2(__dst) = CFDataGetLength(v15);
      CFDataRef v58 = v15;
      AMSupportSafeRetain();
      v26 = *(void **)v6;
      unint64_t v27 = *(void *)(*(void *)v6 + 32);
      unint64_t v28 = *(void *)(*(void *)v6 + 40);
      if (v27 >= v28)
      {
        uint64_t v29 = v26[3];
        unint64_t v30 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v27 - v29) >> 3);
        unint64_t v31 = v30 + 1;
        if (v30 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<ACFURTKitNVRMGenerator::RTKitNVRMVariable>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v32 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v28 - v29) >> 3);
        if (2 * v32 > v31) {
          unint64_t v31 = 2 * v32;
        }
        if (v32 >= 0x555555555555555) {
          unint64_t v33 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v33 = v31;
        }
        if (v33) {
          uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ACFURTKitNVRMGenerator::RTKitNVRMVariable>>(*(void *)v6 + 40, v33);
        }
        else {
          uint64_t v34 = 0;
        }
        long long v35 = &v34[24 * v30];
        uint64_t v36 = &v34[24 * v33];
        *(_OWORD *)long long v35 = __dst;
        *((void *)v35 + 2) = v58;
        CFIndex v37 = v35 + 24;
        uint64_t v39 = (char *)v26[3];
        uint64_t v38 = (char *)v26[4];
        if (v38 != v39)
        {
          do
          {
            long long v40 = *(_OWORD *)(v38 - 24);
            *((void *)v35 - 1) = *((void *)v38 - 1);
            *(_OWORD *)(v35 - 24) = v40;
            v35 -= 24;
            v38 -= 24;
          }
          while (v38 != v39);
          uint64_t v38 = (char *)v26[3];
        }
        v26[3] = v35;
        v26[4] = v37;
        v26[5] = v36;
        if (v38) {
          operator delete(v38);
        }
        v26[4] = v37;
      }
      else
      {
        *(_OWORD *)unint64_t v27 = __dst;
        *(void *)(v27 + 16) = v58;
        v26[4] = v27 + 24;
      }
      goto LABEL_46;
    }
LABEL_49:
    LogInstance = ACFULogging::getLogInstance(DataFromType);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to allocate NVRM data\n", v46, v47, v48, v49, v50, (char)"ACFURTKitNVRMGenerator");
    return 0;
  }
  uint64_t v10 = 0;
  int v11 = a2[23];
  if ((unint64_t)((v7 - v8) / 24) <= 1) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = (v7 - v8) / 24;
  }
  while (1)
  {
    uint64_t v13 = v5;
    if (v11 < 0) {
      uint64_t v13 = *(const char **)v5;
    }
    a1 = (ACFURTKitNVRMGenerator *)strncmp((const char *)(v8 + v10), v13, 8uLL);
    if (!a1) {
      break;
    }
    v10 += 24;
    if (!--v12) {
      goto LABEL_9;
    }
  }
  DataFromType = ACFURTKitNVRMGenerator::createDataFromType(a1, cf);
  if (!DataFromType) {
    goto LABEL_49;
  }
  CFDataRef v15 = DataFromType;
  if ((a4 & 1) == 0)
  {
    std::string v51 = ACFULogging::getLogInstance(DataFromType);
    ACFULogging::handleMessage((uint64_t)v51, 2u, "%s::%s: cowardly retreating since overwrite was not requested\n", v52, v53, v54, v55, v56, (char)"ACFURTKitNVRMGenerator");
    uint64_t v43 = 0;
    goto LABEL_47;
  }
  uint64_t v18 = *(void **)(*(void *)(*(void *)v6 + 24) + v10 + 16);
  if (v18)
  {
    CFRelease(v18);
    *(void *)(*(void *)(*(void *)v6 + 24) + v10 + 16) = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)v6 + 24) + v10 + 12) = ACFURTKitNVRMGenerator::getVariableTypeFlag((ACFURTKitNVRMGenerator *)v18, cf);
  int Length = CFDataGetLength(v15);
  uint64_t v20 = (_DWORD *)(*(void *)(*(void *)v6 + 24) + v10);
  v20[2] = Length;
  int v21 = v5[23];
  if (v21 < 0)
  {
    uint64_t v42 = v5;
    unsigned int v5 = *(char **)v5;
    unint64_t v41 = *((void *)v42 + 1);
    if (v41 >= 8) {
      size_t v22 = 8;
    }
    else {
      size_t v22 = v41;
    }
  }
  else if ((v21 & 0xF8) != 0)
  {
    size_t v22 = 8;
  }
  else
  {
    size_t v22 = v5[23];
  }
  memcpy(v20, v5, v22);
  *(void *)(*(void *)(*(void *)v6 + 24) + v10 + 16) = v15;
  AMSupportSafeRetain();
LABEL_46:
  uint64_t v43 = 1;
LABEL_47:
  CFRelease(v15);
  return v43;
}

CFDataRef ACFURTKitNVRMGenerator::createDataFromType(ACFURTKitNVRMGenerator *this, const __CFNumber *cf)
{
  CFNumberRef v2 = cf;
  CFTypeID v3 = CFGetTypeID(cf);
  if (v3 == CFDataGetTypeID())
  {
    AMSupportSafeRetain();
    return v2;
  }
  if (v3 != CFStringGetTypeID())
  {
    if (v3 == CFNumberGetTypeID())
    {
      int valuePtr = 0;
      if (CFNumberGetValue(v2, kCFNumberSInt32Type, &valuePtr))
      {
        CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        p_int valuePtr = (UInt8 *)&valuePtr;
        return CFDataCreate(v6, p_valuePtr, 4);
      }
    }
    else
    {
      TypeID = (ACFULogging *)CFBooleanGetTypeID();
      if ((ACFULogging *)v3 == TypeID)
      {
        *(_DWORD *)bytes = CFBooleanGetValue(v2) != 0;
        CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        p_int valuePtr = bytes;
        return CFDataCreate(v6, p_valuePtr, 4);
      }
      LogInstance = ACFULogging::getLogInstance(TypeID);
      ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: data type is not recognized\n", v10, v11, v12, v13, v14, (char)"ACFURTKitNVRMGenerator");
    }
    return 0;
  }
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  return CFStringCreateExternalRepresentation(v4, (CFStringRef)v2, 0x600u, 0);
}

uint64_t ACFURTKitNVRMGenerator::getVariableTypeFlag(ACFURTKitNVRMGenerator *this, CFTypeRef cf)
{
  CFTypeID v2 = CFGetTypeID(cf);
  if (v2 == CFDataGetTypeID()) {
    return 0x40000;
  }
  if (v2 == CFStringGetTypeID()) {
    return 0x20000;
  }
  if (v2 == CFBooleanGetTypeID()) {
    return 0x10000;
  }
  TypeID = (ACFULogging *)CFNumberGetTypeID();
  if ((ACFULogging *)v2 == TypeID) {
    return 0x10000;
  }
  LogInstance = ACFULogging::getLogInstance(TypeID);
  ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to determine variable type\n", v6, v7, v8, v9, v10, (char)"ACFURTKitNVRMGenerator");
  return 0;
}

void ACFURTKitNVRMGenerator::remove(ACFULogging *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a1;
  CFAllocatorRef v4 = *(char **)(*(void *)a1 + 24);
  unsigned int v5 = *(char **)(*(void *)a1 + 32);
  int64_t v6 = v5 - v4;
  if (v5 == v4)
  {
LABEL_10:
    LogInstance = ACFULogging::getLogInstance(a1);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: key '%s' not found\n", v12, v13, v14, v15, v16, (char)"ACFURTKitNVRMGenerator");
  }
  else
  {
    int v7 = *(char *)(a2 + 23);
    if ((unint64_t)(v6 / 24) <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v6 / 24;
    }
    int64_t v9 = v6 - 24;
    while (1)
    {
      uint64_t v10 = (const char *)a2;
      if (v7 < 0) {
        uint64_t v10 = *(const char **)a2;
      }
      a1 = (ACFULogging *)strncmp(v4, v10, 8uLL);
      if (!a1) {
        break;
      }
      v4 += 24;
      v9 -= 24;
      if (!--v8) {
        goto LABEL_10;
      }
    }
    if (v4 + 24 != v5) {
      a1 = (ACFULogging *)memmove(v4, v4 + 24, v9);
    }
    *(void *)(v3 + 32) = &v4[24 * (v9 / 24)];
    size_t v17 = ACFULogging::getLogInstance(a1);
    ACFULogging::handleMessage((uint64_t)v17, 0, "%s::%s: key '%s' removed\n", v18, v19, v20, v21, v22, (char)"ACFURTKitNVRMGenerator");
  }
}

BOOL ACFURTKitNVRMGenerator::contains(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(const char **)(*(void *)a1 + 24);
  CFTypeID v2 = *(const char **)(*(void *)a1 + 32);
  if (v2 == v3)
  {
    return 0;
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v6 = (v2 - v3) / 24;
    int v7 = *(char *)(a2 + 23);
    if (v6 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = (v2 - v3) / 24;
    }
    BOOL v9 = 1;
    do
    {
      uint64_t v10 = (const char *)a2;
      if (v7 < 0) {
        uint64_t v10 = *(const char **)a2;
      }
      if (!strncmp(v3, v10, 8uLL)) {
        break;
      }
      BOOL v9 = v6 > ++v5;
      v3 += 24;
    }
    while (v8 != v5);
  }
  return v9;
}

void ACFURTKitNVRMGenerator::~ACFURTKitNVRMGenerator(ACFURTKitNVRMGenerator *this)
{
  CFTypeID v2 = *(void **)this;
  uint64_t v3 = *(void *)(*(void *)this + 24);
  if (*(void *)(*(void *)this + 32) != v3)
  {
    unint64_t v4 = 0;
    uint64_t v5 = 16;
    do
    {
      unint64_t v6 = *(const void **)(v3 + v5);
      if (v6)
      {
        CFRelease(v6);
        *(void *)(*(void *)(*(void *)this + 24) + v5) = 0;
        CFTypeID v2 = *(void **)this;
      }
      ++v4;
      uint64_t v3 = v2[3];
      v5 += 24;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((v2[4] - v3) >> 3) > v4);
  }
  *(void *)this = 0;
  std::default_delete<ACFURTKitNVRMGenerator::RTKitNVRMObj>::operator()[abi:ne180100]((int)this, v2);
}

void __clang_call_terminate(void *a1)
{
}

void ACFURTKitNVRMGenerator::log(ACFURTKitNVRMGenerator *this)
{
  uint64_t v1 = *(void *)this;
  uint64_t v2 = *(void *)(*(void *)this + 24);
  if (*(void *)(*(void *)this + 32) != v2)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    do
    {
      if (*(void *)(v2 + v4 + 16))
      {
        LogInstance = ACFULogging::getLogInstance(this);
        ACFUCommon::hexStringFromCFData(*(ACFUCommon **)(*(void *)(*(void *)this + 24) + v4 + 16), 0, 0, 1);
        ACFULogging::handleMessage((uint64_t)LogInstance, 0, "%s::%s: %s: 0x%s\n", v7, v8, v9, v10, v11, (char)"ACFURTKitNVRMGenerator");
        if (v13 < 0) {
          operator delete(__p);
        }
        uint64_t v1 = *(void *)this;
      }
      ++v5;
      uint64_t v2 = *(void *)(v1 + 24);
      v4 += 24;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((*(void *)(v1 + 32) - v2) >> 3) > v5);
  }
}

void sub_22EEFD748(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
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
    unint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    unint64_t v6 = a1;
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
  __cxa_throw(exception, (struct type_info *)off_2649F9440, MEMORY[0x263F8C060]);
}

void sub_22EEFD880(_Unwind_Exception *a1)
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
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::unique_ptr<ACFUDataContainer::DirectDataRef>::reset[abi:ne180100](ACFUDataContainer::DirectDataRef **a1, ACFUDataContainer::DirectDataRef *a2)
{
  uint64_t v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    ACFUDataContainer::DirectDataRef::~DirectDataRef(v3);
    operator delete(v4);
  }
}

void std::vector<ACFURTKitNVRMGenerator::RTKitNVRMVariable>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ACFURTKitNVRMGenerator::RTKitNVRMVariable>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

void std::default_delete<ACFURTKitNVRMGenerator::RTKitNVRMObj>::operator()[abi:ne180100](int a1, void *__p)
{
  if (__p)
  {
    uint64_t v3 = (void *)__p[3];
    if (v3)
    {
      __p[4] = v3;
      operator delete(v3);
    }
    operator delete(__p);
  }
}

void ACFUDiagnostics::create(const __CFString *this@<X0>, const __CFString *a2@<X1>, ACFUDiagnostics **a3@<X8>)
{
  int v3 = (int)a2;
  unint64_t v6 = operator new(0x28uLL);
  _OWORD *v6 = 0u;
  v6[1] = 0u;
  *((unsigned char *)v6 + 32) = 1;
  *a3 = (ACFUDiagnostics *)v6;
  BOOL v7 = ACFUDiagnostics::init((ACFUDiagnostics *)v6, this, v3);
  if (!v7)
  {
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)v7);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to initialize diagnostics object\n", v9, v10, v11, v12, v13, (char)"ACFUDiagnostics");
    std::unique_ptr<ACFUDiagnostics>::reset[abi:ne180100](a3, 0);
  }
}

void sub_22EEFDAA0(_Unwind_Exception *a1)
{
  std::unique_ptr<ACFUDiagnostics>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void ACFUDiagnostics::ACFUDiagnostics(ACFUDiagnostics *this)
{
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((unsigned char *)this + 32) = 1;
}

{
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((unsigned char *)this + 32) = 1;
}

BOOL ACFUDiagnostics::init(ACFUDiagnostics *this, const __CFString *a2, int a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  *((unsigned char *)this + 32) = a3;
  if (!a2) {
    return 1;
  }
  if (a3)
  {
    __t.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
    time_t v32 = std::chrono::system_clock::to_time_t(&__t);
    std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v5 = __t.__d_.__rep_ / 1000 % 1000;
    unint64_t v6 = localtime(&v32);
    strftime(v34, 0x3CuLL, "%Y-%m-%d-%H-%M-%S", v6);
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@/Diagnostics-%s-%u/", a2, v34, v5);
  }
  else
  {
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@/", a2);
  }
  *((void *)this + 3) = v8;
  if (!v8)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to allocate fDebugLogPath\n", v15, v16, v17, v18, v19, (char)"ACFUDiagnostics");
    return 0;
  }
  CFURLRef v10 = CFURLCreateWithString(v7, v8, 0);
  if (!v10)
  {
    uint64_t v20 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v20, 2u, "%s::%s: failed to allocate debugPathToCreate\n", v21, v22, v23, v24, v25, (char)"ACFUDiagnostics");
    return 0;
  }
  CFURLRef v11 = v10;
  uint64_t v12 = (ACFULogging *)MEMORY[0x230FAE6D0]();
  BOOL v9 = v12 == 0;
  if (v12)
  {
    v26 = ACFULogging::getLogInstance(v12);
    ACFULogging::handleMessage((uint64_t)v26, 2u, "%s::%s: failed to create debug directory (status: %d)\n", v27, v28, v29, v30, v31, (char)"ACFUDiagnostics");
  }
  CFRelease(v11);
  return v9;
}

void std::unique_ptr<ACFUDiagnostics>::reset[abi:ne180100](ACFUDiagnostics **a1, ACFUDiagnostics *a2)
{
  int v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    ACFUDiagnostics::~ACFUDiagnostics(v3);
    operator delete(v4);
  }
}

void ACFUDiagnostics::perform(ACFUDiagnostics *this)
{
  uint64_t v1 = *(void *)this;
  if (*(void *)this != *((void *)this + 1))
  {
    uint64_t v2 = this;
    do
    {
      switch(*(unsigned char *)(v1 + 16))
      {
        case 0:
          this = (ACFUDiagnostics *)ACFUDiagnostics::saveLogFile(v2, *(const __CFString **)v1, *(const __CFString **)(v1 + 8));
          if (this) {
            goto LABEL_13;
          }
          goto LABEL_5;
        case 1:
          if (ACFUDiagnostics::saveLogFile(v2, *(const __CFString **)v1, *(const __CFString **)(v1 + 8))) {
            goto LABEL_13;
          }
          goto LABEL_12;
        case 2:
LABEL_5:
          if (ACFUDiagnostics::dumpToIOBuffer(this, *(const __CFString **)v1, *(const void **)(v1 + 8))) {
            goto LABEL_13;
          }
          goto LABEL_12;
        case 3:
          BOOL v9 = (ACFUDiagnostics *)ACFUDiagnostics::saveLogFile(v2, *(const __CFString **)v1, *(const __CFString **)(v1 + 8));
          char v10 = (char)v9;
          if (!ACFUDiagnostics::dumpToIOBuffer(v9, *(const __CFString **)v1, *(const void **)(v1 + 8))
            && (v10 & 1) == 0)
          {
            goto LABEL_12;
          }
LABEL_13:
          ACFUCommon::stringFromCFString(*(const __CFString **)v1, &__p);
          LogInstance = ACFULogging::getLogInstance(v13);
          ACFULogging::handleMessage((uint64_t)LogInstance, 3u, "%s::%s: item %s logged successfully\n", v20, v21, v22, v23, v24, (char)"ACFUDiagnostics");
          break;
        default:
          int v3 = ACFULogging::getLogInstance(this);
          ACFULogging::handleMessage((uint64_t)v3, 2u, "%s::%s: unrecognized action %hhu\n", v4, v5, v6, v7, v8, (char)"ACFUDiagnostics");
LABEL_12:
          ACFUCommon::stringFromCFString(*(const __CFString **)v1, &__p);
          uint64_t v12 = ACFULogging::getLogInstance(v11);
          ACFULogging::handleMessage((uint64_t)v12, 2u, "%s::%s: item %s failed to log\n", v15, v16, v17, v18, v19, (char)"ACFUDiagnostics");
          break;
      }
      if (v26 < 0) {
        operator delete(__p);
      }
      v1 += 24;
    }
    while (v1 != *((void *)v2 + 1));
  }
}

void sub_22EEFDED0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ACFUDiagnostics::saveLogFile(ACFUDiagnostics *this, const __CFString *a2, const __CFString *a3)
{
  int v3 = (ACFULogging *)*((void *)this + 3);
  if (!v3)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: no debug log path provided by restore\n", v26, v27, v28, v29, v30, (char)"ACFUDiagnostics");
    return 0;
  }
  if (!a2 || (CFDataRef v4 = (CFDataRef)a3) == 0)
  {
    uint64_t v31 = ACFULogging::getLogInstance(v3);
    ACFULogging::handleMessage((uint64_t)v31, 2u, "%s::%s: bad parameter: inputs to function are invalid\n", v32, v33, v34, v35, v36, (char)"ACFUDiagnostics");
    return 0;
  }
  uint64_t URLByAppendingStrings = ACFUCommon::createURLByAppendingStrings(v3, a2, a3);
  if (!URLByAppendingStrings)
  {
    CFIndex v37 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v37, 2u, "%s::%s: failed to create output URL\n", v38, v39, v40, v41, v42, (char)"ACFUDiagnostics");
    return 0;
  }
  uint64_t v6 = (const void *)URLByAppendingStrings;
  CFTypeID TypeID = CFDataGetTypeID();
  if (TypeID != CFGetTypeID(v4))
  {
    length[0] = 0;
    length[1] = 0;
    uint64_t v59 = 0;
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    char v10 = (ACFULogging *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@\n", v4);
    CFStringRef v11 = (const __CFString *)v10;
    if (!v10 || (char v10 = (ACFULogging *)CFStringGetLength((CFStringRef)v10), (uint64_t)v10 <= 0))
    {
      uint64_t v43 = ACFULogging::getLogInstance(v10);
      uint64_t v49 = "%s::%s: failed to format object into string\n";
      goto LABEL_34;
    }
    ACFUCommon::stringFromCFString(v11, &v56);
    *(_OWORD *)length = v56;
    uint64_t v59 = v57;
    CFRelease(v11);
    if (SHIBYTE(v59) < 0)
    {
      uint64_t v14 = (CFIndex *)length[0];
      if (length[0])
      {
        CFIndex v13 = length[1];
        if (length[1]) {
          goto LABEL_15;
        }
      }
    }
    else
    {
      CFIndex v13 = HIBYTE(v59);
      if (HIBYTE(v59))
      {
        uint64_t v14 = length;
LABEL_15:
        CFDataRef v4 = CFDataCreate(v9, (const UInt8 *)v14, v13);
        if (v4)
        {
          char v15 = 1;
          goto LABEL_17;
        }
        uint64_t v43 = ACFULogging::getLogInstance(0);
        uint64_t v49 = "%s::%s: failed to allocate data object to write\n";
LABEL_34:
        ACFULogging::handleMessage((uint64_t)v43, 2u, v49, v44, v45, v46, v47, v48, (char)"ACFUDiagnostics");
        CFDataRef v4 = 0;
        char v15 = 0;
LABEL_17:
        if (SHIBYTE(v59) < 0) {
          operator delete((void *)length[0]);
        }
        if ((v15 & 1) == 0) {
          goto LABEL_22;
        }
        goto LABEL_20;
      }
    }
    uint64_t v43 = ACFULogging::getLogInstance(v12);
    uint64_t v49 = "%s::%s: failed to get formatted C string\n";
    goto LABEL_34;
  }
  AMSupportSafeRetain();
  CFIndex v8 = CFDataGetLength(v4);
  if (v8 < 1)
  {
    uint64_t v50 = ACFULogging::getLogInstance((ACFULogging *)v8);
    ACFULogging::handleMessage((uint64_t)v50, 2u, "%s::%s: bad parameter: there is no data in the container\n", v51, v52, v53, v54, v55, (char)"ACFUDiagnostics");
    CFRelease(v6);
    uint64_t v16 = 0;
    goto LABEL_24;
  }
LABEL_20:
  uint64_t v16 = 1;
  uint64_t v17 = (ACFULogging *)AMSupportWriteDataToFileURL();
  if (!v17) {
    goto LABEL_23;
  }
  uint64_t v18 = ACFULogging::getLogInstance(v17);
  ACFULogging::handleMessage((uint64_t)v18, 2u, "%s::%s: failed to write data to output URL (%d)\n", v19, v20, v21, v22, v23, (char)"ACFUDiagnostics");
LABEL_22:
  uint64_t v16 = 0;
LABEL_23:
  CFRelease(v6);
  if (v4) {
LABEL_24:
  }
    CFRelease(v4);
  return v16;
}

void sub_22EEFE1B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL ACFUDiagnostics::dumpToIOBuffer(ACFUDiagnostics *this, const __CFString *a2, const void *a3)
{
  if (!a2 || !a3)
  {
    LogInstance = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: bad parameter: inputs to function are invalid\n", v24, v25, v26, v27, v28, (char)"ACFUDiagnostics");
    return 0;
  }
  CFTypeID TypeID = CFDataGetTypeID();
  uint64_t v6 = (ACFULogging *)CFGetTypeID(a3);
  if ((ACFULogging *)TypeID == v6)
  {
    uint64_t v7 = ACFULogging::getLogInstance(v6);
    std::string::basic_string[abi:ne180100]<0>(&v36, "ACFUDiagnostics");
    CFIndex v8 = std::string::append(&v36, "::");
    long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    v37.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    char v10 = std::string::append(&v37, "dumpToIOBuffer");
    long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
    int64_t v39 = v10->__r_.__value_.__r.__words[2];
    long long v38 = v11;
    v10->__r_.__value_.__l.__size_ = 0;
    v10->__r_.__value_.__r.__words[2] = 0;
    v10->__r_.__value_.__r.__words[0] = 0;
    BytePtr = CFDataGetBytePtr((CFDataRef)a3);
    CFIndex Length = CFDataGetLength((CFDataRef)a3);
    ACFULogging::handleMessageBinary((uint64_t)v7, (uint64_t *)&v38, 3, (uint64_t)BytePtr, Length, 0);
    if (SHIBYTE(v39) < 0) {
      operator delete((void *)v38);
    }
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v37.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v36.__r_.__value_.__l.__data_);
    }
    return 1;
  }
  ACFUCommon::stringFromCFString(a2, &v38);
  if (SHIBYTE(v39) < 0)
  {
    if (!(void)v38 || !*((void *)&v38 + 1)) {
      goto LABEL_32;
    }
LABEL_15:
    char v15 = ACFULogging::getLogInstance(v14);
    std::string::basic_string[abi:ne180100]<0>(&v35, "ACFUDiagnostics");
    uint64_t v16 = std::string::append(&v35, "::");
    long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
    v36.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v17;
    v16->__r_.__value_.__l.__size_ = 0;
    v16->__r_.__value_.__r.__words[2] = 0;
    v16->__r_.__value_.__r.__words[0] = 0;
    uint64_t v18 = std::string::append(&v36, "dumpToIOBuffer");
    long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    v37.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    if (v39 >= 0) {
      uint64_t v20 = &v38;
    }
    else {
      uint64_t v20 = (long long *)v38;
    }
    ACFULogging::handleMessageCFType((uint64_t)v15, (uint64_t *)&v37, 3, (uint64_t)v20, (uint64_t)a3);
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v37.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v36.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v35.__r_.__value_.__l.__data_);
    }
    char v21 = 1;
    goto LABEL_25;
  }
  if (HIBYTE(v39)) {
    goto LABEL_15;
  }
LABEL_32:
  uint64_t v29 = ACFULogging::getLogInstance(v14);
  ACFULogging::handleMessage((uint64_t)v29, 2u, "%s::%s: failed to get formatted C string\n", v30, v31, v32, v33, v34, (char)"ACFUDiagnostics");
  char v21 = 0;
LABEL_25:
  if ((SHIBYTE(v39) & 0x80000000) == 0) {
    return (v21 & 1) != 0;
  }
  operator delete((void *)v38);
  return (v21 & 1) != 0;
}

void sub_22EEFE460(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  if (*(char *)(v30 - 41) < 0) {
    operator delete(*(void **)(v30 - 64));
  }
  _Unwind_Resume(exception_object);
}

uint64_t ACFUDiagnostics::addItem(uint64_t *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = a3;
  uint64_t v9 = a2;
  char v7 = a4;
  unint64_t v5 = a1[1];
  if (v5 >= a1[2])
  {
    uint64_t result = std::vector<ACFUDiagnostics::DiagItem>::__emplace_back_slow_path<__CFString const*&,void const*&,ACFUDiagnostics::DiagAction &>(a1, &v9, &v8, &v7);
  }
  else
  {
    std::vector<ACFUDiagnostics::DiagItem>::__construct_one_at_end[abi:ne180100]<__CFString const*&,void const*&,ACFUDiagnostics::DiagAction &>((uint64_t)a1, &v9, &v8, &v7);
    uint64_t result = v5 + 24;
  }
  a1[1] = result;
  return result;
}

uint64_t ACFUDiagnostics::copyItem(ACFUDiagnostics *this, CFStringRef theString1)
{
  uint64_t v2 = *(void *)this;
  if (*(void *)this == *((void *)this + 1)) {
    return 0;
  }
  while (CFStringCompare(theString1, *(CFStringRef *)v2, 0))
  {
    v2 += 24;
    if (v2 == *((void *)this + 1)) {
      return 0;
    }
  }
  AMSupportSafeRetain();
  return *(void *)(v2 + 8);
}

uint64_t ACFUDiagnostics::copyDiagnosticsPath(ACFUDiagnostics *this)
{
  return AMSupportSafeRetain();
}

void ACFUDiagnostics::createFileDataContainer(ACFULogging *a1@<X0>, uint64_t *a2@<X1>, ACFUDataContainer **a3@<X8>)
{
  *a3 = 0;
  if ((*((char *)a2 + 23) & 0x80000000) == 0)
  {
    if (*((unsigned char *)a2 + 23)) {
      goto LABEL_3;
    }
LABEL_20:
    LogInstance = ACFULogging::getLogInstance(a1);
    char v21 = "%s::%s: file name is empty\n";
LABEL_23:
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v21, v16, v17, v18, v19, v20, (char)"ACFUDiagnostics");
    return;
  }
  if (!a2[1]) {
    goto LABEL_20;
  }
LABEL_3:
  uint64_t v4 = *((void *)a1 + 3);
  if (!v4)
  {
    LogInstance = ACFULogging::getLogInstance(a1);
    char v21 = "%s::%s: debug log path does not exist\n";
    goto LABEL_23;
  }
  if ((*((unsigned char *)a2 + 23) & 0x80) != 0) {
    a2 = (uint64_t *)*a2;
  }
  unint64_t v5 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@/%s", v4, a2);
  uint64_t v6 = v5;
  if (!v5)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    char v21 = "%s::%s: failed to allocate string\n";
    goto LABEL_23;
  }
  ACFUDataContainer::create(v5, (const __CFString *)1, (ACFUDataContainer **)&v29);
  char v7 = (ACFUDataContainer *)v29;
  *(void *)&long long v29 = 0;
  std::unique_ptr<ACFUDataContainer>::reset[abi:ne180100](a3, v7);
  uint64_t v8 = (ACFUDataContainer *)v29;
  *(void *)&long long v29 = 0;
  if (v8)
  {
    ACFUDataContainer::~ACFUDataContainer(v8);
    operator delete(v9);
  }
  if (*a3)
  {
    char v10 = ACFULogging::getLogInstance(v8);
    std::string::basic_string[abi:ne180100]<0>(&v27, "ACFUDiagnostics");
    long long v11 = std::string::append(&v27, "::");
    long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    v28.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    CFIndex v13 = std::string::append(&v28, "createFileDataContainer");
    long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    std::string::size_type v30 = v13->__r_.__value_.__r.__words[2];
    long long v29 = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v10, (uint64_t *)&v29, 4, (uint64_t)"data container created. File path:", (uint64_t)v6);
  }
  else
  {
    uint64_t v22 = ACFULogging::getLogInstance(v8);
    std::string::basic_string[abi:ne180100]<0>(&v27, "ACFUDiagnostics");
    uint64_t v23 = std::string::append(&v27, "::");
    long long v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
    v28.__r_.__value_.__r.__words[2] = v23->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v24;
    v23->__r_.__value_.__l.__size_ = 0;
    v23->__r_.__value_.__r.__words[2] = 0;
    v23->__r_.__value_.__r.__words[0] = 0;
    uint64_t v25 = std::string::append(&v28, "createFileDataContainer");
    long long v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
    std::string::size_type v30 = v25->__r_.__value_.__r.__words[2];
    long long v29 = v26;
    v25->__r_.__value_.__l.__size_ = 0;
    v25->__r_.__value_.__r.__words[2] = 0;
    v25->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v22, (uint64_t *)&v29, 2, (uint64_t)"failed to create data container. File path:", (uint64_t)v6);
  }
  if (SHIBYTE(v30) < 0) {
    operator delete((void *)v29);
  }
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v28.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v27.__r_.__value_.__l.__data_);
  }
  CFRelease(v6);
}

void sub_22EEFE834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (*(char *)(v24 - 41) < 0) {
    operator delete(*(void **)(v24 - 64));
  }
  if (a23 < 0) {
    operator delete(__p);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  std::unique_ptr<ACFUDataContainer>::reset[abi:ne180100](v23, 0);
  _Unwind_Resume(a1);
}

void ACFUDiagnostics::~ACFUDiagnostics(ACFUDiagnostics *this)
{
  uint64_t v2 = (const void *)*((void *)this + 3);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 3) = 0;
  }
  int v3 = (void **)this;
  std::vector<ACFUDiagnostics::DiagItem>::__destroy_vector::operator()[abi:ne180100](&v3);
}

uint64_t ACFUDiagnostics::DiagItem::DiagItem(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  *(unsigned char *)(a1 + 16) = a4;
  AMSupportSafeRetain();
  AMSupportSafeRetain();
  return a1;
}

{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  *(unsigned char *)(a1 + 16) = a4;
  AMSupportSafeRetain();
  AMSupportSafeRetain();
  return a1;
}

__n128 ACFUDiagnostics::DiagItem::DiagItem(uint64_t a1, __n128 *a2)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 2;
  *(unsigned char *)(a1 + 16) = a2[1].n128_u8[0];
  __n128 result = *a2;
  *(__n128 *)a1 = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  return result;
}

{
  __n128 result;

  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 2;
  *(unsigned char *)(a1 + 16) = a2[1].n128_u8[0];
  __n128 result = *a2;
  *(__n128 *)a1 = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  return result;
}

void ACFUDiagnostics::DiagItem::~DiagItem(ACFUDiagnostics::DiagItem *this)
{
  uint64_t v2 = *(const void **)this;
  if (v2)
  {
    CFRelease(v2);
    *(void *)this = 0;
  }
  int v3 = (const void *)*((void *)this + 1);
  if (v3)
  {
    CFRelease(v3);
    *((void *)this + 1) = 0;
  }
}

uint64_t std::vector<ACFUDiagnostics::DiagItem>::__construct_one_at_end[abi:ne180100]<__CFString const*&,void const*&,ACFUDiagnostics::DiagAction &>(uint64_t a1, void *a2, uint64_t *a3, char *a4)
{
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *a3;
  char v7 = *a4;
  *(void *)uint64_t v5 = *a2;
  *(void *)(v5 + 8) = v6;
  *(unsigned char *)(v5 + 16) = v7;
  AMSupportSafeRetain();
  uint64_t result = AMSupportSafeRetain();
  *(void *)(a1 + 8) = v5 + 24;
  return result;
}

void sub_22EEFEA68(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<ACFUDiagnostics::DiagItem>::__emplace_back_slow_path<__CFString const*&,void const*&,ACFUDiagnostics::DiagAction &>(uint64_t *a1, void *a2, uint64_t *a3, char *a4)
{
  uint64_t v5 = *a1;
  unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v7 = v6 + 1;
  if (v6 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<ACFURTKitNVRMGenerator::RTKitNVRMVariable>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v11 = (uint64_t)(a1 + 2);
  unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v5) >> 3);
  if (2 * v12 > v7) {
    unint64_t v7 = 2 * v12;
  }
  if (v12 >= 0x555555555555555) {
    unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v13 = v7;
  }
  uint64_t v24 = a1 + 2;
  long long v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ACFURTKitNVRMGenerator::RTKitNVRMVariable>>(v11, v13);
  char v15 = &v14[24 * v6];
  v21[0] = v14;
  v21[1] = v15;
  uint64_t v22 = v15;
  uint64_t v23 = &v14[24 * v16];
  uint64_t v17 = *a3;
  char v18 = *a4;
  *(void *)char v15 = *a2;
  v15[16] = v18;
  *((void *)v15 + 1) = v17;
  AMSupportSafeRetain();
  AMSupportSafeRetain();
  v22 += 24;
  std::vector<ACFUDiagnostics::DiagItem>::__swap_out_circular_buffer(a1, v21);
  uint64_t v19 = a1[1];
  std::__split_buffer<ACFUDiagnostics::DiagItem>::~__split_buffer((uint64_t)v21);
  return v19;
}

void sub_22EEFEB84(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<ACFUDiagnostics::DiagItem>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *std::vector<ACFUDiagnostics::DiagItem>::__swap_out_circular_buffer(uint64_t *result, void *a2)
{
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  uint64_t v4 = a2[1];
  if (v2 != *result)
  {
    do
    {
      *(void *)(v4 - 24) = 0;
      *(void *)(v4 - 16) = 0;
      v4 -= 24;
      long long v5 = *(_OWORD *)(v2 - 24);
      v2 -= 24;
      *(unsigned char *)(v4 + 16) = 2;
      *(unsigned char *)(v4 + 16) = *(unsigned char *)(v2 + 16);
      *(_OWORD *)uint64_t v4 = v5;
      *(void *)uint64_t v2 = 0;
      *(void *)(v2 + 8) = 0;
    }
    while (v2 != v3);
  }
  a2[1] = v4;
  uint64_t v6 = *result;
  std::logic_error *result = v4;
  a2[1] = v6;
  uint64_t v7 = result[1];
  result[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = result[2];
  result[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<ACFUDiagnostics::DiagItem>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 24;
    ACFUDiagnostics::DiagItem::~DiagItem((ACFUDiagnostics::DiagItem *)(i - 24));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::unique_ptr<ACFUDataContainer>::reset[abi:ne180100](ACFUDataContainer **a1, ACFUDataContainer *a2)
{
  uint64_t v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    ACFUDataContainer::~ACFUDataContainer(v3);
    operator delete(v4);
  }
}

void std::vector<ACFUDiagnostics::DiagItem>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    long long v5 = v2;
    if (v4 != v2)
    {
      do
        ACFUDiagnostics::DiagItem::~DiagItem((ACFUDiagnostics::DiagItem *)(v4 - 24));
      while (v4 != v2);
      long long v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t RestoreStep::operator=(uint64_t a1, uint64_t *a2)
{
  if ((uint64_t *)a1 != a2)
  {
    uint64_t v5 = *a2;
    uint64_t v4 = a2[1];
    if (v4) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v6 = *(std::__shared_weak_count **)(a1 + 8);
    *(void *)a1 = v5;
    *(void *)(a1 + 8) = v4;
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
    *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
    *(unsigned char *)(a1 + 18) = *((unsigned char *)a2 + 18);
  }
  return a1;
}

uint64_t ACFURestore::executeCommand(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  *(unsigned char *)(a1 + 73) = 0;
  *(_DWORD *)(a1 + 76) = 2;
  if (*(void *)(a1 + 40))
  {
    if (!*(unsigned char *)(a1 + 96))
    {
      uint64_t v6 = (void *)(a1 + 32);
      uint64_t v7 = *(void **)(a1 + 32);
      if (v7)
      {
        do
        {
          uint64_t v8 = v7;
          uint64_t v7 = (void *)v7[1];
        }
        while (v7);
      }
      else
      {
        do
        {
          uint64_t v8 = (void *)v6[2];
          BOOL v9 = *v8 == (void)v6;
          uint64_t v6 = v8;
        }
        while (v9);
      }
      *(void *)(a1 + 80) = *(void *)(a1 + 24);
      *(void *)(a1 + 88) = v8;
      *(unsigned char *)(a1 + 96) = 1;
    }
    unsigned __int8 v10 = 0;
    while (1)
    {
      uint64_t v11 = *(void *)(a1 + 80);
      std::string::size_type v12 = *(void *)(v11 + 48);
      v111.__r_.__value_.__r.__words[0] = *(void *)(v11 + 40);
      v111.__r_.__value_.__l.__size_ = v12;
      if (v12) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
      }
      LOWORD(v111.__r_.__value_.__r.__words[2]) = *(_WORD *)(v11 + 56);
      v111.__r_.__value_.__s.__data_[18] = *(unsigned char *)(v11 + 58);
      RestoreStep::operator=(a1 + 48, (uint64_t *)&v111);
      if (v111.__r_.__value_.__l.__size_) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v111.__r_.__value_.__l.__size_);
      }
      ACFURestore::logACFUConfig((ACFURestore *)a1);
      ACFURestore::getStepName(*(_DWORD *)(*(void *)(a1 + 80) + 32), &v111);
      LogInstance = ACFULogging::getLogInstance(v13);
      ACFULogging::handleMessage((uint64_t)LogInstance, 0, "%s::%s: Currently performing: %s\n", v15, v16, v17, v18, v19, (char)"ACFURestore");
      if (!*(unsigned char *)(a1 + 66)) {
        break;
      }
      if (a2 == 1)
      {
        if (*(unsigned char *)(a1 + 9) && !*(unsigned char *)(a1 + 10))
        {
          uint64_t v43 = ACFULogging::getLogInstance(v20);
          ACFULogging::handleMessage((uint64_t)v43, 2u, "%s::%s: command not supported in preflight mode\n", v44, v45, v46, v47, v48, (char)"ACFURestore");
          unsigned __int8 v10 = *(unsigned char *)(a1 + 65);
          *(unsigned char *)(a1 + 73) = v10 + 1;
        }
        else
        {
          if (a3)
          {
            long long v29 = *(const void **)(a1 + 120);
            if (v29)
            {
              CFRelease(v29);
              *(void *)(a1 + 120) = 0;
            }
            *(void *)(a1 + 120) = a3;
            AMSupportSafeRetain();
          }
          uint64_t v21 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
          if (v21)
          {
            std::string::size_type v30 = ACFULogging::getLogInstance((ACFULogging *)v21);
            ACFULogging::handleMessage((uint64_t)v30, 0, "%s::%s: Operation finished successfully! Moving to next step if one exists for this updater! \n", v31, v32, v33, v34, v35, (char)"ACFURestore");
            *(_DWORD *)(a1 + 76) = 0;
            *(unsigned char *)(a1 + 73) = 0;
            ++*(unsigned char *)(a1 + 72);
            unsigned __int8 v10 = *(unsigned char *)(a1 + 65);
            goto LABEL_19;
          }
          unsigned __int8 v10 = *(unsigned char *)(a1 + 65);
        }
      }
      else if (a2)
      {
        std::string v36 = ACFULogging::getLogInstance(v20);
        ACFULogging::handleMessage((uint64_t)v36, 0, "%s::%s: invalid command %d specified\n", v37, v38, v39, v40, v41, (char)"ACFURestore");
        uint64_t v42 = *(void *)(a1 + 104);
        std::string::basic_string[abi:ne180100]<0>(__p, "invalid command specified");
        uint64_t v21 = ACFUError::addError(v42, (uint64_t)__p, 0xFA5uLL, 0);
        if (v108 < 0) {
          operator delete(__p[0]);
        }
        *(_DWORD *)(a1 + 76) = 0;
        *(unsigned char *)(a1 + 8) = 1;
      }
      else
      {
        uint64_t v21 = (uint64_t)(*(void *(**)(uint64_t *__return_ptr, uint64_t))(*(void *)a1 + 24))(&v109, a1);
        if (v110)
        {
          *a4 = v109;
          *(unsigned char *)(a1 + 73) = 0;
          unsigned __int8 v10 = *(unsigned char *)(a1 + 64);
LABEL_19:
          uint64_t v28 = 1;
          goto LABEL_38;
        }
        unsigned __int8 v10 = *(unsigned char *)(a1 + 64);
      }
      uint64_t v49 = ACFULogging::getLogInstance((ACFULogging *)v21);
      ACFULogging::handleMessage((uint64_t)v49, 0, "%s::%s: We ran into some issues on try %d of %d!\n", v50, v51, v52, v53, v54, (char)"ACFURestore");
      unsigned int v55 = ++*(unsigned char *)(a1 + 73);
      if (v55 > v10) {
        int v56 = 1;
      }
      else {
        int v56 = 2;
      }
      *(_DWORD *)(a1 + 76) = v56;
      uint64_t v21 = ACFURestore::collectDebugInfo((ACFURestore *)a1);
      uint64_t v28 = 0;
LABEL_38:
      CFDataRef v58 = *(void **)(a1 + 80);
      uint64_t v57 = *(void *)(a1 + 88);
      int v59 = *(_DWORD *)(a1 + 76);
      if ((void *)v57 == v58 && !v59)
      {
        BOOL v9 = *(unsigned __int8 *)(a1 + 72) == *(unsigned __int8 *)(a1 + 66);
        *(unsigned char *)(a1 + 8) = v9;
        if (v9)
        {
          uint64_t v60 = ACFULogging::getLogInstance((ACFULogging *)v21);
          ACFULogging::handleMessage((uint64_t)v60, 0, "%s::%s: We are finished with all the update steps! ^_^\n", v61, v62, v63, v64, v65, (char)"ACFURestore");
          goto LABEL_62;
        }
        goto LABEL_41;
      }
      switch(v59)
      {
        case 2:
          v74 = ACFULogging::getLogInstance((ACFULogging *)v21);
          ACFULogging::handleMessage((uint64_t)v74, 0, "%s::%s: Current command %s!\n", v75, v76, v77, v78, v79, (char)"ACFURestore");
          if ((v28 & 1) == 0) {
            ACFUError::logError(*(ACFUError **)(a1 + 104));
          }
          break;
        case 1:
          v80 = ACFULogging::getLogInstance((ACFULogging *)v21);
          ACFULogging::handleMessage((uint64_t)v80, 0, "%s::%s: We have exhausted all our allowed attempts! Please file a radar!\n", v81, v82, v83, v84, v85, (char)"ACFURestore");
LABEL_58:
          *(unsigned char *)(a1 + 8) = 1;
          break;
        case 0:
          if (*(unsigned __int8 *)(a1 + 72) == *(unsigned __int8 *)(a1 + 66))
          {
            while (1)
            {
              uint64_t v66 = (void *)v58[1];
              v67 = v58;
              if (v66)
              {
                do
                {
                  CFDataRef v58 = v66;
                  uint64_t v66 = (void *)*v66;
                }
                while (v66);
              }
              else
              {
                do
                {
                  CFDataRef v58 = (void *)v67[2];
                  BOOL v9 = *v58 == (void)v67;
                  v67 = v58;
                }
                while (!v9);
              }
              *(void *)(a1 + 80) = v58;
              if (v58 == (void *)v57) {
                break;
              }
              if (*((unsigned char *)v58 + 58)) {
                goto LABEL_61;
              }
            }
            if (*(unsigned char *)(v57 + 58))
            {
LABEL_61:
              v86 = ACFULogging::getLogInstance((ACFULogging *)v21);
              ACFULogging::handleMessage((uint64_t)v86, 0, "%s::%s: Current step is complete. Moving onto the next restore step\n", v87, v88, v89, v90, v91, (char)"ACFURestore");
              *(unsigned char *)(a1 + 72) = 0;
              break;
            }
            v92 = ACFULogging::getLogInstance((ACFULogging *)v21);
            ACFULogging::handleMessage((uint64_t)v92, 0, "%s::%s: We have completed all enabled restore steps!\n", v93, v94, v95, v96, v97, (char)"ACFURestore");
            goto LABEL_58;
          }
LABEL_41:
          uint64_t v68 = ACFULogging::getLogInstance((ACFULogging *)v21);
          ACFULogging::handleMessage((uint64_t)v68, 0, "%s::%s: [%s] Performing iteration %d of %d\n", v69, v70, v71, v72, v73, (char)"ACFURestore");
          break;
      }
LABEL_62:
      if (SHIBYTE(v111.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v111.__r_.__value_.__l.__data_);
      }
      if (((*(_DWORD *)(a1 + 76) == 2) & ~v28) == 0) {
        return v28;
      }
    }
    uint64_t v22 = ACFULogging::getLogInstance(v20);
    ACFULogging::handleMessage((uint64_t)v22, 0, "%s::%s: This step is not enabled... setting to DONE and moving along.. \n", v23, v24, v25, v26, v27, (char)"ACFURestore");
    *(_DWORD *)(a1 + 76) = 0;
    goto LABEL_19;
  }
  v98 = ACFULogging::getLogInstance((ACFULogging *)a1);
  ACFULogging::handleMessage((uint64_t)v98, 2u, "%s::%s: updater has not initialized update steps\n", v99, v100, v101, v102, v103, (char)"ACFURestore");
  return 0;
}

void sub_22EEFF2E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ACFURestore::getCurrentStepHandle@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(this + 80);
  uint64_t v3 = *(void *)(v2 + 48);
  *(void *)a2 = *(void *)(v2 + 40);
  *(void *)(a2 + 8) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  *(_WORD *)(a2 + 16) = *(_WORD *)(v2 + 56);
  *(unsigned char *)(a2 + 18) = *(unsigned char *)(v2 + 58);
  return this;
}

void ACFURestore::logACFUConfig(ACFURestore *this)
{
  LogInstance = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 0, "%s::%s: ---- Restore State ----\n", v3, v4, v5, v6, v7, (char)"ACFURestore");
  BOOL v9 = ACFULogging::getLogInstance(v8);
  ACFULogging::handleMessage((uint64_t)v9, 0, "%s::%s: Preflight: %s\n", v10, v11, v12, v13, v14, (char)"ACFURestore");
  uint64_t v16 = ACFULogging::getLogInstance(v15);
  ACFULogging::handleMessage((uint64_t)v16, 0, "%s::%s: Booted Update: %s\n", v17, v18, v19, v20, v21, (char)"ACFURestore");
  uint64_t v23 = ACFULogging::getLogInstance(v22);
  ACFULogging::handleMessage((uint64_t)v23, 0, "%s::%s: Post Sealing: %s\n", v24, v25, v26, v27, v28, (char)"ACFURestore");
  std::string::size_type v30 = ACFULogging::getLogInstance(v29);
  ACFULogging::handleMessage((uint64_t)v30, 0, "%s::%s: Internal Build: %s\n", v31, v32, v33, v34, v35, (char)"ACFURestore");
  uint64_t v37 = ACFULogging::getLogInstance(v36);
  ACFURestore::isPreflighted(this);
  ACFULogging::handleMessage((uint64_t)v37, 0, "%s::%s: Cached Ticket: %s\n", v38, v39, v40, v41, v42, (char)"ACFURestore");
  uint64_t v44 = ACFULogging::getLogInstance(v43);
  ACFULogging::handleMessage((uint64_t)v44, 0, "%s::%s: ---- Restore State ----\n", v45, v46, v47, v48, v49, (char)"ACFURestore");
}

void ACFURestore::getStepName(int a1@<W1>, std::string *a2@<X8>)
{
  {
    std::string::basic_string[abi:ne180100]<0>(ACFURestore::getStepName(ACFURestore::UpdateSteps)::UpdateStepString, "Update");
    std::string::basic_string[abi:ne180100]<0>(qword_26864C6E8, "Certify");
    std::string::basic_string[abi:ne180100]<0>(qword_26864C700, "Generic");
    std::string::basic_string[abi:ne180100]<0>(qword_26864C718, "Provision");
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor, 0, &dword_22EEFB000);
  }
  uint64_t v4 = (char *)&ACFURestore::getStepName(ACFURestore::UpdateSteps)::UpdateStepString[3 * a1];
  if (v4[23] < 0)
  {
    uint64_t v5 = *(const std::string::value_type **)v4;
    std::string::size_type v6 = *((void *)v4 + 1);
    std::string::__init_copy_ctor_external(a2, v5, v6);
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)v4;
    a2->__r_.__value_.__r.__words[2] = *((void *)v4 + 2);
  }
}

void sub_22EEFF5D8(_Unwind_Exception *a1)
{
}

uint64_t ACFURestore::isPreflight(ACFURestore *this)
{
  return *((unsigned __int8 *)this + 9);
}

BOOL ACFURestore::isPreflightPersonalization(ACFURestore *this)
{
  return *((unsigned char *)this + 9) && *((unsigned char *)this + 10) != 0;
}

uint64_t ACFURestore::collectDebugInfo(ACFURestore *this)
{
  uint64_t v2 = *((void *)this + 21);
  if (!v2)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: no transport\n", v7, v8, v9, v10, v11, (char)"ACFURestore");
    return 0;
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 20);
  uint64_t v12 = *((void *)this + 19);
  uint64_t v13 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(void *)v2 + 40))(v2, &v12, 1);
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  if (v4) {
    return 0;
  }
  ACFUDiagnostics::perform(*((ACFUDiagnostics **)this + 23));
  return 1;
}

void sub_22EEFF6EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

const char *ACFURestore::cmdAsString(uint64_t a1, int a2)
{
  uint64_t v2 = "Invalid Command";
  if (a2 == 1) {
    uint64_t v2 = "Perform Command";
  }
  if (a2) {
    return v2;
  }
  else {
    return "Query Command";
  }
}

CFComparisonResult ACFURestore::restoreCommand(CFStringRef theString2, const __CFString *a2)
{
  CFComparisonResult result = CFStringCompare(@"queryInfo", theString2, 0);
  if (result)
  {
    if (CFStringCompare(@"performNextStage", theString2, 0)) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 1;
    }
  }
  return result;
}

uint64_t ACFURestore::isRestoreComplete(ACFURestore *this)
{
  return *((unsigned __int8 *)this + 8);
}

uint64_t ACFURestore::isPostSealing(ACFURestore *this)
{
  return *((unsigned __int8 *)this + 11);
}

uint64_t ACFURestore::isInternalBuild(ACFURestore *this)
{
  return *((unsigned __int8 *)this + 12);
}

const __CFDictionary *ACFURestore::isPreflighted(ACFURestore *this)
{
  if (!*((void *)this + 2)) {
    return 0;
  }
  CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 16), @"PreflightTickets");
  if (!result) {
    return result;
  }
  CFDictionaryRef v3 = result;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (TypeID == CFGetTypeID(v3)) {
    return (const __CFDictionary *)(CFDictionaryContainsKey(v3, *((const void **)this + 2)) != 0);
  }
  else {
    return 0;
  }
}

uint64_t ACFURestore::isNeRDOS(ACFURestore *this)
{
  return MEMORY[0x270EDAB60]("com.apple.MobileSoftwareUpdate");
}

uint64_t ACFURestore::getCurrentUpdateStep(ACFURestore *this)
{
  return *(unsigned int *)(*((void *)this + 10) + 32);
}

CFDataRef ACFURestore::copyFDRTrustObjectDigest(ACFURestore *this)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  uint64_t v2 = (ACFULogging *)*((void *)this + 17);
  if (!v2
    || (uint64_t v2 = (ACFULogging *)CFDictionaryContainsKey(v2, @"FDRBootedOSTrustObjectFile"), !v2)
    && (uint64_t v2 = (ACFULogging *)CFDictionaryContainsKey(*((CFDictionaryRef *)this + 17), @"FDRTrustObjectFile"),
        !v2))
  {
    LogInstance = ACFULogging::getLogInstance(v2);
    ACFULogging::handleMessage((uint64_t)LogInstance, 0, "%s::%s: FDR trust object override not required\n", v36, v37, v38, v39, v40, (char)"ACFURestore");
    return 0;
  }
  CFIndex v70 = 0;
  uint64_t v71 = 0;
  CFDictionaryRef v3 = ACFULogging::getLogInstance(v2);
  ACFULogging::handleMessage((uint64_t)v3, 0, "%s::%s: overriding FDR trust object hash from restore options\n", v4, v5, v6, v7, v8, (char)"ACFURestore");
  PeronalizedContentPath = ACFUDataAccess::createPeronalizedContentPath((ACFULogging *)1);
  uint64_t v10 = ACFULogging::getLogInstance(PeronalizedContentPath);
  uint64_t v16 = (uint64_t)v10;
  if (!PeronalizedContentPath)
  {
    ACFULogging::handleMessage((uint64_t)v10, 2u, "%s::%s: failed to get AP ticket path\n", v11, v12, v13, v14, v15, (char)"ACFURestore");
    return 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&v66, "ACFURestore");
  uint64_t v17 = std::string::append(&v66, "::");
  long long v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
  v67.__r_.__value_.__r.__words[2] = v17->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v67.__r_.__value_.__l.__data_ = v18;
  v17->__r_.__value_.__l.__size_ = 0;
  v17->__r_.__value_.__r.__words[2] = 0;
  v17->__r_.__value_.__r.__words[0] = 0;
  uint64_t v19 = std::string::append(&v67, "copyFDRTrustObjectDigest");
  long long v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  std::string::size_type v69 = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType(v16, (uint64_t *)__p, 0, (uint64_t)"AP Ticket Path: ", (uint64_t)PeronalizedContentPath);
  if (SHIBYTE(v69) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v67.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v66.__r_.__value_.__l.__data_);
  }
  CFDataRef FileDatafromFilePath = (const __CFData *)ACFUCommon::createFileDatafromFilePath(PeronalizedContentPath, v21);
  if (!FileDatafromFilePath)
  {
    uint64_t v23 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v23, 0, "%s::%s: looking for AP ticket in updater options dictionary\n", v24, v25, v26, v27, v28, (char)"ACFURestore");
    CFDataRef FileDatafromFilePath = (const __CFData *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 16), @"APTicket");
    long long v29 = (ACFULogging *)AMSupportSafeRetain();
    if (!FileDatafromFilePath)
    {
      uint64_t v42 = ACFULogging::getLogInstance(v29);
      ACFULogging::handleMessage((uint64_t)v42, 2u, "%s::%s: failed to get AP ticket\n", v43, v44, v45, v46, v47, (char)"ACFURestore");
      CFRelease(PeronalizedContentPath);
      return 0;
    }
  }
  BytePtr = CFDataGetBytePtr(FileDatafromFilePath);
  CFIndex Length = CFDataGetLength(FileDatafromFilePath);
  inited = (ACFULogging *)Img4DecodeInitManifest((uint64_t)BytePtr, Length, (uint64_t)v72);
  if (inited)
  {
    uint64_t v48 = ACFULogging::getLogInstance(inited);
    ACFULogging::handleMessage((uint64_t)v48, 2u, "%s::%s: failed to decode manifest object (status: %d)\n", v49, v50, v51, v52, v53, (char)"ACFURestore");
LABEL_25:
    CFDataRef v34 = 0;
    goto LABEL_16;
  }
  Img4DecodeGetObjectPropertyData((uint64_t)v72, 1718903152, 1145525076, &v71, &v70);
  if (v33)
  {
    uint64_t v54 = ACFULogging::getLogInstance(v33);
    ACFULogging::handleMessage((uint64_t)v54, 2u, "%s::%s: failed to decode manifest property object (status: %d)\n", v55, v56, v57, v58, v59, (char)"ACFURestore");
    goto LABEL_25;
  }
  CFDataRef v34 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v71, v70);
  if (!v34)
  {
    uint64_t v60 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v60, 2u, "%s::%s: failed to allocate hash digest\n", v61, v62, v63, v64, v65, (char)"ACFURestore");
    goto LABEL_25;
  }
LABEL_16:
  CFRelease(PeronalizedContentPath);
  CFRelease(FileDatafromFilePath);
  return v34;
}

void sub_22EEFFB50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ACFURestore::getErrorHandle@<X0>(uint64_t this@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(this + 112);
  *a2 = *(void *)(this + 104);
  a2[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

void ACFURestore::~ACFURestore(ACFURestore *this)
{
  *(void *)this = &unk_26E27F9B0;
  uint64_t v2 = (const void *)*((void *)this + 15);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 15) = 0;
  }
  CFDictionaryRef v3 = (const void *)*((void *)this + 16);
  if (v3)
  {
    CFRelease(v3);
    *((void *)this + 16) = 0;
  }
  uint64_t v4 = (const void *)*((void *)this + 17);
  if (v4)
  {
    CFRelease(v4);
    *((void *)this + 17) = 0;
  }
  uint64_t v5 = (const void *)*((void *)this + 41);
  if (v5)
  {
    CFRelease(v5);
    *((void *)this + 41) = 0;
  }
  uint64_t v6 = (const void *)*((void *)this + 2);
  if (v6)
  {
    CFRelease(v6);
    *((void *)this + 2) = 0;
  }
  std::__function::__value_func<ACFUErrorCode ()(std::shared_ptr<ACFUTransport>,std::shared_ptr<ACFUFirmware>)>::~__value_func[abi:ne180100]((void *)this + 37);
  std::__function::__value_func<ACFUErrorCode ()(std::shared_ptr<ACFUTransport>,std::shared_ptr<ACFUFirmware>)>::~__value_func[abi:ne180100]((void *)this + 33);
  uint64_t v7 = (std::__shared_weak_count *)*((void *)this + 24);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  uint64_t v8 = (std::__shared_weak_count *)*((void *)this + 22);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  uint64_t v9 = (std::__shared_weak_count *)*((void *)this + 20);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  uint64_t v10 = (std::__shared_weak_count *)*((void *)this + 14);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  uint64_t v11 = (std::__shared_weak_count *)*((void *)this + 7);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::destroy((uint64_t)this + 24, *((void **)this + 4));
}

void ACFURestore::ACFURestore(ACFURestore *this)
{
  *(void *)this = &unk_26E27F9B0;
  *((void *)this + 4) = 0;
  *((void *)this + 3) = (char *)this + 32;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  *((void *)this + 5) = 0;
  *(_DWORD *)((char *)this + 63) = 0;
  *((_WORD *)this + 36) = 0;
  *((_DWORD *)this + 19) = 2;
  *((void *)this + 10) = 0;
  *((void *)this + 11) = 0;
  *((unsigned char *)this + 96) = 0;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *((_DWORD *)this + 58) = 1;
  *((void *)this + 31) = 0;
  *((void *)this + 32) = 0;
  *((void *)this + 30) = 0;
  *((void *)this + 33) = &unk_26E27FA00;
  *((void *)this + 36) = (char *)this + 264;
  *((void *)this + 37) = &unk_26E27FA90;
  *((void *)this + 40) = (char *)this + 296;
  *((void *)this + 41) = 0;
}

uint64_t ACFURestore::init(ACFURestore *this, const __CFDictionary *a2, const void *a3)
{
  LogInstance = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 3u, "%s::%s: ACFU Version: %s\n", v7, v8, v9, v10, v11, (char)"ACFURestore");
  CFStringRef v68 = @"ACFURestore";
  std::allocate_shared[abi:ne180100]<ACFUError,std::allocator<ACFUError>,__CFString const*,void>(&v68, v69);
  long long v12 = *(_OWORD *)v69;
  v69[0] = 0;
  v69[1] = 0;
  uint64_t v13 = (std::__shared_weak_count *)*((void *)this + 14);
  *(_OWORD *)((char *)this + 104) = v12;
  if (v13)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    if (v69[1]) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v69[1]);
    }
  }
  *((void *)this + 15) = a2;
  AMSupportSafeRetain();
  *((void *)this + 16) = CFDictionaryGetValue(a2, @"Options");
  AMSupportSafeRetain();
  *((void *)this + 17) = CFDictionaryGetValue(a2, @"RestoreOptions");
  AMSupportSafeRetain();
  *((unsigned char *)this + 8) = 0;
  if (CFDictionaryContainsKey(*((CFDictionaryRef *)this + 16), @"RestoreSystemPartition"))
  {
    Value = CFDictionaryGetValue(*((CFDictionaryRef *)this + 16), @"RestoreSystemPartition");
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID != CFGetTypeID(Value)) {
      return 4002;
    }
    *((void *)this + 41) = Value;
    AMSupportSafeRetain();
  }
  else
  {
    *((void *)this + 41) = &stru_26E280B18;
  }
  if (CFDictionaryContainsKey(*((CFDictionaryRef *)this + 16), @"PreflightContext"))
  {
    CFStringRef v16 = (const __CFString *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 16), @"PreflightContext");
    BOOL v19 = v16
       && (CFStringRef v17 = v16, v18 = CFGetTypeID(v16), v18 == CFStringGetTypeID())
       && CFEqual(v17, @"BootedOS");
    *((unsigned char *)this + 9) = v19;
  }
  else
  {
    *((unsigned char *)this + 9) = 0;
  }
  if (CFDictionaryContainsKey(*((CFDictionaryRef *)this + 16), @"BootedUpdate"))
  {
    CFBooleanRef v20 = (const __CFBoolean *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 16), @"BootedUpdate");
    BOOL v23 = v20 && (v21 = v20, v22 = CFGetTypeID(v20), v22 == CFBooleanGetTypeID()) && CFBooleanGetValue(v21) == 1;
    *((unsigned char *)this + 10) = v23;
  }
  else
  {
    *((unsigned char *)this + 10) = 0;
  }
  if (CFDictionaryContainsKey(*((CFDictionaryRef *)this + 16), @"PostFDRSealing"))
  {
    CFBooleanRef v24 = (const __CFBoolean *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 16), @"PostFDRSealing");
    v27 = v24 && (CFBooleanRef v25 = v24, v26 = CFGetTypeID(v24), v26 == CFBooleanGetTypeID()) && CFBooleanGetValue(v25) == 1;
    *((unsigned char *)this + 11) = v27;
  }
  else
  {
    *((unsigned char *)this + 11) = 0;
  }
  if (CFDictionaryContainsKey(*((CFDictionaryRef *)this + 16), @"RestoreInternal"))
  {
    CFBooleanRef v28 = (const __CFBoolean *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 16), @"RestoreInternal");
    v31 = v28 && (v29 = v28, CFTypeID v30 = CFGetTypeID(v28), v30 == CFBooleanGetTypeID()) && CFBooleanGetValue(v29) == 1;
    *((unsigned char *)this + 12) = v31;
  }
  else
  {
    *((unsigned char *)this + 12) = 0;
  }
  *((void *)this + 18) = CFDictionaryGetValue(*((CFDictionaryRef *)this + 16), @"ACFUCertUrl");
  if (CFDictionaryContainsKey(*((CFDictionaryRef *)this + 16), @"ACFUCertUrl"))
  {
    uint64_t v32 = CFDictionaryGetValue(*((CFDictionaryRef *)this + 16), @"ACFUCertUrl");
    if (v32)
    {
      uint64_t v33 = v32;
      CFTypeID v34 = CFGetTypeID(v32);
      if (v34 == CFStringGetTypeID()) {
        uint64_t v35 = v33;
      }
      else {
        uint64_t v35 = 0;
      }
    }
    else
    {
      uint64_t v35 = 0;
    }
    *((void *)this + 18) = v35;
  }
  if (CFDictionaryContainsKey(*((CFDictionaryRef *)this + 16), @"DebugLogPath"))
  {
    CFStringRef v36 = (const __CFString *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 16), @"DebugLogPath");
    CFTypeID v37 = CFGetTypeID(v36);
    uint64_t v38 = (ACFULogging *)CFStringGetTypeID();
    if ((ACFULogging *)v37 != v38)
    {
      uint64_t v39 = ACFULogging::getLogInstance(v38);
      ACFULogging::handleMessage((uint64_t)v39, 2u, "%s::%s: unexpected debug log path type\n", v40, v41, v42, v43, v44, (char)"ACFURestore");
      return 4002;
    }
  }
  else
  {
    CFStringRef v36 = 0;
  }
  ACFUDiagnostics::create(v36, (const __CFString *)1, v69);
  std::shared_ptr<ACFUDiagnostics>::operator=[abi:ne180100]<ACFUDiagnostics,std::default_delete<ACFUDiagnostics>,void>((void *)this + 23, (uint64_t *)v69);
  uint64_t v46 = v69[0];
  v69[0] = 0;
  if (v46)
  {
    ACFUDiagnostics::~ACFUDiagnostics(v46);
    operator delete(v47);
  }
  if (!*((void *)this + 23))
  {
    uint64_t v50 = ACFULogging::getLogInstance(v46);
    ACFULogging::handleMessage((uint64_t)v50, 2u, "%s::%s: failed to setup diagnostics\n", v51, v52, v53, v54, v55, (char)"ACFURestore");
    return 4008;
  }
  if (!a3)
  {
    uint64_t v56 = ACFULogging::getLogInstance(v46);
    ACFULogging::handleMessage((uint64_t)v56, 2u, "%s::%s: ticket key must be provided\n", v57, v58, v59, v60, v61, (char)"ACFURestore");
    return 1;
  }
  CFTypeID v48 = CFStringGetTypeID();
  uint64_t v49 = (ACFULogging *)CFGetTypeID(a3);
  if ((ACFULogging *)v48 != v49)
  {
    uint64_t v62 = ACFULogging::getLogInstance(v49);
    ACFULogging::handleMessage((uint64_t)v62, 2u, "%s::%s: ticket key is of unsupported type\n", v63, v64, v65, v66, v67, (char)"ACFURestore");
    return 1;
  }
  *((void *)this + 2) = a3;
  AMSupportSafeRetain();
  return 0;
}

void sub_22EF001E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ACFUDiagnostics *a13)
{
  if (a13)
  {
    ACFUDiagnostics::~ACFUDiagnostics(a13);
    operator delete(v14);
  }
  _Unwind_Resume(exception_object);
}

void *std::shared_ptr<ACFUDiagnostics>::operator=[abi:ne180100]<ACFUDiagnostics,std::default_delete<ACFUDiagnostics>,void>(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (*a2)
  {
    uint64_t v5 = operator new(0x20uLL);
    void *v5 = &unk_26E27FB60;
    v5[1] = 0;
    v5[2] = 0;
    v5[3] = v4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a2 = 0;
  uint64_t v6 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v5;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  return a1;
}

void ACFURestore::queryCmd(ACFURestore *this@<X0>, uint64_t a2@<X8>)
{
  void *(***v13)(uint64_t (****__return_ptr)(void), void, void, void);
  unsigned int v14;
  ACFULogging *v15;
  std::__shared_weak_count *v16;
  uint64_t (***v17)(void);
  int v18;
  ACFULogging *v19;
  char v20;
  CFDataRef v21;
  const void *v22;
  CFTypeID v23;
  const void *Value;
  const void *v25;
  CFTypeID v26;
  CFTypeID v27;
  char v28;
  void *LogInstance;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void **v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void v51[2];
  char v52;
  void v53[2];
  char v54;
  uint64_t (***v55)(void);
  std::__shared_weak_count *v56;
  int v57;
  void *__p[2];
  char v59;
  void v60[2];
  char v61;

  if (!*((unsigned char *)this + 9))
  {
    uint64_t v13 = (void *(***)(uint64_t (****__return_ptr)(void), void, void, void))*((void *)this + 6);
    if (!v13)
    {
      LogInstance = ACFULogging::getLogInstance(this);
      ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: FATAL: no operation for queryCmd\n", v30, v31, v32, v33, v34, (char)"ACFURestore");
      uint64_t v35 = *((void *)this + 13);
      std::string::basic_string[abi:ne180100]<0>(__p, "FATAL: no operation for queryCmd");
      ACFUError::addError(v35, (uint64_t)__p, 0x3EDuLL, 0);
      if (v59 < 0)
      {
        long long v12 = __p[0];
        goto LABEL_39;
      }
LABEL_35:
      uint64_t v4 = 0;
      goto LABEL_36;
    }
    uint64_t v14 = ACFURestore::isPreflighted(this);
    uint64_t v15 = (ACFULogging *)(**v13)(&v55, v13, 0, v14 ^ 1);
    CFStringRef v17 = v55;
    CFStringRef v16 = v56;
    if (v56)
    {
      atomic_fetch_add_explicit(&v56->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v15 = (ACFULogging *)v56;
      CFTypeID v18 = v57;
      if (v56) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v56);
      }
      if (!v18)
      {
        atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_12:
        BOOL v19 = (ACFULogging *)(**v17)(v17);
        uint64_t v4 = v19;
        if (v16) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v16);
        }
        if (v4)
        {
          CFBooleanRef v20 = 1;
          if (!v16) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
        uint64_t v44 = ACFULogging::getLogInstance(v19);
        ACFULogging::handleMessage((uint64_t)v44, 2u, "%s::%s: failed to create dictionary\n", v45, v46, v47, v48, v49, (char)"ACFURestore");
        uint64_t v50 = *((void *)this + 13);
        std::string::basic_string[abi:ne180100]<0>(v51, "failed to create dictionary");
        ACFUError::addError(v50, (uint64_t)v51, 0xFA0uLL, 0);
        if ((v52 & 0x80000000) == 0)
        {
LABEL_45:
          uint64_t v4 = 0;
          CFBooleanRef v20 = 0;
          if (!v16)
          {
LABEL_17:
            if ((v20 & 1) == 0)
            {
              if (!v4)
              {
LABEL_36:
                CFBooleanRef v28 = 0;
                goto LABEL_32;
              }
              CFRelease(v4);
              goto LABEL_35;
            }
            goto LABEL_18;
          }
LABEL_16:
          std::__shared_weak_count::__release_shared[abi:ne180100](v16);
          goto LABEL_17;
        }
        uint64_t v43 = (void **)v51;
LABEL_44:
        operator delete(*v43);
        goto LABEL_45;
      }
    }
    else
    {
      CFTypeID v18 = v57;
      if (!v57) {
        goto LABEL_12;
      }
    }
    CFStringRef v36 = ACFULogging::getLogInstance(v15);
    ACFULogging::handleMessage((uint64_t)v36, 2u, "%s::%s: failed to perform query step (ret: %d)\n", v37, v38, v39, v40, v41, (char)"ACFURestore");
    uint64_t v42 = *((void *)this + 13);
    std::string::basic_string[abi:ne180100]<0>(v53, "failed to perform query step");
    ACFUError::addError(v42, (uint64_t)v53, v18, 0);
    if ((v54 & 0x80000000) == 0) {
      goto LABEL_45;
    }
    uint64_t v43 = (void **)v53;
    goto LABEL_44;
  }
  uint64_t v4 = (ACFULogging *)(*(uint64_t (**)(ACFURestore *))(*(void *)this + 16))(this);
  if (!v4)
  {
    uint64_t v5 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v5, 2u, "%s::%s: Failed to collect preflight info\n", v6, v7, v8, v9, v10, (char)"ACFURestore");
    uint64_t v11 = *((void *)this + 13);
    std::string::basic_string[abi:ne180100]<0>(v60, "Failed to collect preflight info");
    ACFUError::addError(v11, (uint64_t)v60, 0x3F4uLL, 0);
    if (v61 < 0)
    {
      long long v12 = (void *)v60[0];
LABEL_39:
      operator delete(v12);
      goto LABEL_35;
    }
    goto LABEL_35;
  }
LABEL_18:
  CFBooleanRef v21 = ACFURestore::copyFDRTrustObjectDigest(this);
  if (v21) {
    CFDictionarySetValue(v4, @"ACFU,FDRTrustObjectHash", v21);
  }
  CFTypeID v22 = (const void *)*((void *)this + 17);
  if (v22)
  {
    BOOL v23 = CFGetTypeID(v22);
    if (v23 == CFDictionaryGetTypeID())
    {
      if ((Value = CFDictionaryGetValue(*((CFDictionaryRef *)this + 17), @"FDRAllowUnsealedData"),
            CFBooleanRef v25 = CFDictionaryGetValue(*((CFDictionaryRef *)this + 17), @"FDRSkipSealing"),
            Value)
        && (CFTypeID v26 = CFGetTypeID(Value), v26 == CFBooleanGetTypeID())
        && CFBooleanGetValue((CFBooleanRef)Value)
        || v25 && (BOOL v27 = CFGetTypeID(v25), v27 == CFBooleanGetTypeID()) && CFBooleanGetValue((CFBooleanRef)v25))
      {
        CFDictionarySetValue(v4, @"ACFU,FDRAllowUnsealed", (const void *)*MEMORY[0x263EFFB40]);
      }
    }
  }
  if (v21) {
    CFRelease(v21);
  }
  CFBooleanRef v28 = 1;
LABEL_32:
  *(void *)a2 = v4;
  *(unsigned char *)(a2 + 8) = v28;
}

void sub_22EF00674(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (v32) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ACFURestore::performCmd(ACFURestore *this)
{
  uint64_t v2 = (ACFULogging *)*((void *)this + 6);
  if (!v2)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: FATAL: no operation for performCmd\n", v31, v32, v33, v34, v35, (char)"ACFURestore");
    uint64_t v36 = *((void *)this + 13);
    std::string::basic_string[abi:ne180100]<0>(v67, "FATAL: no operation for performCmd");
    ACFUError::addError(v36, (uint64_t)v67, 0x3EDuLL, 0);
    if (v68 < 0)
    {
      CFStringRef v16 = (void *)v67[0];
      goto LABEL_18;
    }
    return 0;
  }
  int v3 = *(_DWORD *)(*((void *)this + 10) + 32);
  if (v3 == 2)
  {
    CFStringRef v17 = ACFULogging::getLogInstance(v2);
    ACFULogging::handleMessage((uint64_t)v17, 0, "%s::%s: running generic updater step\n", v18, v19, v20, v21, v22, (char)"ACFURestore");
    return 1;
  }
  if (v3 == 1)
  {
    *((void *)this + 25) = *((void *)this + 41);
    uint64_t v6 = *((void *)this + 18);
    *((void *)this + 26) = v6;
    if (!*((void *)this + 28))
    {
      CFTypeID v37 = ACFULogging::getLogInstance(v2);
      ACFULogging::handleMessage((uint64_t)v37, 2u, "%s::%s: Incomplete parameter set for certification (ret: %d)\n", v38, v39, v40, v41, v42, (char)"ACFURestore");
      uint64_t v43 = *((void *)this + 13);
      std::string::basic_string[abi:ne180100]<0>(v62, "Incomplete parameter set for certification");
      ACFUError::addError(v43, (uint64_t)v62, 0x3EDuLL, 0);
      if ((v63 & 0x80000000) == 0) {
        return 0;
      }
      CFStringRef v16 = (void *)v62[0];
      goto LABEL_18;
    }
    if (!v6)
    {
      uint64_t v51 = ACFULogging::getLogInstance(v2);
      ACFULogging::handleMessage((uint64_t)v51, 2u, "%s::%s: No certification URL found for certification step (ret: %d)\n", v52, v53, v54, v55, v56, (char)"ACFURestore");
      uint64_t v57 = *((void *)this + 13);
      std::string::basic_string[abi:ne180100]<0>(v60, "No certification URL found for certification step");
      ACFUError::addError(v57, (uint64_t)v60, 0x3F1uLL, 0);
      if ((v61 & 0x80000000) == 0) {
        return 0;
      }
      CFStringRef v16 = (void *)v60[0];
      goto LABEL_18;
    }
    uint64_t v7 = (ACFULogging *)(*(uint64_t (**)(ACFULogging *))(*(void *)v2 + 32))(v2);
    if (!v7) {
      return 1;
    }
    int v8 = (int)v7;
    uint64_t v9 = ACFULogging::getLogInstance(v7);
    ACFULogging::handleMessage((uint64_t)v9, 2u, "%s::%s: Failed to perform certification step (ret: %d)\n", v10, v11, v12, v13, v14, (char)"ACFURestore");
    uint64_t v15 = *((void *)this + 13);
    std::string::basic_string[abi:ne180100]<0>(v58, "Failed to perform certification step");
    ACFUError::addError(v15, (uint64_t)v58, v8, 0);
    if (v59 < 0)
    {
      CFStringRef v16 = (void *)v58[0];
LABEL_18:
      operator delete(v16);
      return 0;
    }
    return 0;
  }
  if (v3)
  {
    BOOL v23 = ACFULogging::getLogInstance(v2);
    ACFULogging::handleMessage((uint64_t)v23, 0, "%s::%s: running custom updater step with id: %d\n", v24, v25, v26, v27, v28, (char)"ACFURestore");
    return 1;
  }
  memset(v66, 0, 24);
  uint64_t v4 = (ACFULogging *)(*(uint64_t (**)(ACFULogging *, void, char *))(*(void *)v2 + 8))(v2, *((void *)this + 15), (char *)this + 264);
  int v5 = (int)v4;
  if (v4)
  {
    uint64_t v44 = ACFULogging::getLogInstance(v4);
    ACFULogging::handleMessage((uint64_t)v44, 2u, "%s::%s: failed to perform update firmware (ret: %d)\n", v45, v46, v47, v48, v49, (char)"ACFURestore");
    uint64_t v50 = *((void *)this + 13);
    std::string::basic_string[abi:ne180100]<0>(__p, "failed to perform update firmware");
    ACFUError::addError(v50, (uint64_t)__p, v5, 0);
    if (v65 < 0) {
      operator delete(__p[0]);
    }
    std::string::size_type v69 = (void **)v66;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v69);
    return 0;
  }
  std::string::size_type v69 = (void **)v66;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v69);
  return 1;
}

void sub_22EF00A60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void *std::__function::__value_func<ACFUErrorCode ()(std::shared_ptr<ACFUTransport>,std::shared_ptr<ACFUFirmware>)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::destroy(a1, a2[1]);
    uint64_t v4 = (std::__shared_weak_count *)a2[6];
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    operator delete(a2);
  }
}

void *_ZNKSt3__110__function6__funcIN7ACFUROM29UpdateFirmwareActionCallbacks7preBootMUlNS_10shared_ptrI13ACFUTransportEENS4_I12ACFUFirmwareEEE_ENS_9allocatorIS9_EEF13ACFUErrorCodeS6_S8_EE7__cloneEv()
{
  CFDictionaryRef result = operator new(0x10uLL);
  void *result = &unk_26E27FA00;
  return result;
}

void _ZNKSt3__110__function6__funcIN7ACFUROM29UpdateFirmwareActionCallbacks7preBootMUlNS_10shared_ptrI13ACFUTransportEENS4_I12ACFUFirmwareEEE_ENS_9allocatorIS9_EEF13ACFUErrorCodeS6_S8_EE7__cloneEPNS0_6__baseISD_EE(uint64_t a1, void *a2)
{
  *a2 = &unk_26E27FA00;
}

uint64_t _ZNSt3__110__function6__funcIN7ACFUROM29UpdateFirmwareActionCallbacks7preBootMUlNS_10shared_ptrI13ACFUTransportEENS4_I12ACFUFirmwareEEE_ENS_9allocatorIS9_EEF13ACFUErrorCodeS6_S8_EEclEOS6_OS8_(uint64_t a1, void *a2, void *a3)
{
  return _ZNSt3__128__invoke_void_return_wrapperI13ACFUErrorCodeLb0EE6__callB8ne180100IJRN7ACFUROM29UpdateFirmwareActionCallbacks7preBootMUlNS_10shared_ptrI13ACFUTransportEENS6_I12ACFUFirmwareEEE_ES8_SA_EEES1_DpOT_(a1 + 8, a2, a3);
}

uint64_t _ZNKSt3__110__function6__funcIN7ACFUROM29UpdateFirmwareActionCallbacks7preBootMUlNS_10shared_ptrI13ACFUTransportEENS4_I12ACFUFirmwareEEE_ENS_9allocatorIS9_EEF13ACFUErrorCodeS6_S8_EE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIN7ACFUROM29UpdateFirmwareActionCallbacks7preBootMUlNSt3__110shared_ptrI13ACFUTransportEENS2_I12ACFUFirmwareEEE_E))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIN7ACFUROM29UpdateFirmwareActionCallbacks7preBootMUlNS_10shared_ptrI13ACFUTransportEENS4_I12ACFUFirmwareEEE_ENS_9allocatorIS9_EEF13ACFUErrorCodeS6_S8_EE11target_typeEv()
{
  return &_ZTIN7ACFUROM29UpdateFirmwareActionCallbacks7preBootMUlNSt3__110shared_ptrI13ACFUTransportEENS2_I12ACFUFirmwareEEE_E;
}

uint64_t _ZNSt3__128__invoke_void_return_wrapperI13ACFUErrorCodeLb0EE6__callB8ne180100IJRN7ACFUROM29UpdateFirmwareActionCallbacks7preBootMUlNS_10shared_ptrI13ACFUTransportEENS6_I12ACFUFirmwareEEE_ES8_SA_EEES1_DpOT_(uint64_t a1, void *a2, void *a3)
{
  int v3 = (std::__shared_weak_count *)a2[1];
  *a2 = 0;
  a2[1] = 0;
  uint64_t v4 = (std::__shared_weak_count *)a3[1];
  *a3 = 0;
  a3[1] = 0;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  return 0;
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void *_ZNKSt3__110__function6__funcIN7ACFUROM29UpdateFirmwareActionCallbacks7preSaveMUlNS_10shared_ptrI13ACFUTransportEENS4_I12ACFUFirmwareEEE_ENS_9allocatorIS9_EEF13ACFUErrorCodeS6_S8_EE7__cloneEv()
{
  CFDictionaryRef result = operator new(0x10uLL);
  void *result = &unk_26E27FA90;
  return result;
}

void _ZNKSt3__110__function6__funcIN7ACFUROM29UpdateFirmwareActionCallbacks7preSaveMUlNS_10shared_ptrI13ACFUTransportEENS4_I12ACFUFirmwareEEE_ENS_9allocatorIS9_EEF13ACFUErrorCodeS6_S8_EE7__cloneEPNS0_6__baseISD_EE(uint64_t a1, void *a2)
{
  *a2 = &unk_26E27FA90;
}

uint64_t _ZNSt3__110__function6__funcIN7ACFUROM29UpdateFirmwareActionCallbacks7preSaveMUlNS_10shared_ptrI13ACFUTransportEENS4_I12ACFUFirmwareEEE_ENS_9allocatorIS9_EEF13ACFUErrorCodeS6_S8_EEclEOS6_OS8_(uint64_t a1, void *a2, void *a3)
{
  return _ZNSt3__128__invoke_void_return_wrapperI13ACFUErrorCodeLb0EE6__callB8ne180100IJRN7ACFUROM29UpdateFirmwareActionCallbacks7preBootMUlNS_10shared_ptrI13ACFUTransportEENS6_I12ACFUFirmwareEEE_ES8_SA_EEES1_DpOT_(a1 + 8, a2, a3);
}

uint64_t _ZNKSt3__110__function6__funcIN7ACFUROM29UpdateFirmwareActionCallbacks7preSaveMUlNS_10shared_ptrI13ACFUTransportEENS4_I12ACFUFirmwareEEE_ENS_9allocatorIS9_EEF13ACFUErrorCodeS6_S8_EE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIN7ACFUROM29UpdateFirmwareActionCallbacks7preSaveMUlNSt3__110shared_ptrI13ACFUTransportEENS2_I12ACFUFirmwareEEE_E))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIN7ACFUROM29UpdateFirmwareActionCallbacks7preSaveMUlNS_10shared_ptrI13ACFUTransportEENS4_I12ACFUFirmwareEEE_ENS_9allocatorIS9_EEF13ACFUErrorCodeS6_S8_EE11target_typeEv()
{
  return &_ZTIN7ACFUROM29UpdateFirmwareActionCallbacks7preSaveMUlNSt3__110shared_ptrI13ACFUTransportEENS2_I12ACFUFirmwareEEE_E;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  int v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    int v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    int v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void *std::allocate_shared[abi:ne180100]<ACFUError,std::allocator<ACFUError>,__CFString const*,void>@<X0>(const __CFString **a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0x28uLL);
  CFDictionaryRef result = std::__shared_ptr_emplace<ACFUError>::__shared_ptr_emplace[abi:ne180100]<__CFString const*,std::allocator<ACFUError>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_22EF00F34(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<ACFUError>::__shared_ptr_emplace[abi:ne180100]<__CFString const*,std::allocator<ACFUError>,0>(void *a1, const __CFString **a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26E27FB10;
  ACFUError::ACFUError((ACFUError *)(a1 + 3), *a2);
  return a1;
}

void sub_22EF00F94(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<ACFUError>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E27FB10;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ACFUError>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E27FB10;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<ACFUError>::__on_zero_shared(uint64_t a1)
{
}

void std::__shared_ptr_pointer<ACFUDiagnostics  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<ACFUDiagnostics  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(ACFUDiagnostics **)(a1 + 24);
  if (v1)
  {
    ACFUDiagnostics::~ACFUDiagnostics(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<ACFUDiagnostics  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else {
    return 0;
  }
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

void __cxx_global_array_dtor()
{
  for (uint64_t i = 0; i != -96; i -= 24)
  {
    if (*((char *)&ACFURestore::getStepName(ACFURestore::UpdateSteps)::UpdateStepString + i + 95) < 0) {
      operator delete(*(void **)((char *)&ACFURestore::getStepName(ACFURestore::UpdateSteps)::UpdateStepString + i + 72));
    }
  }
}

void ACFUROM::handleFDR(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v110 = 0;
  std::string v111 = 0;
  unint64_t v112 = 0;
  if (a2[1] == *a2)
  {
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)a1);
    uint64_t v11 = 0;
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: missing data classes in request\n", v79, v80, v81, v82, v83, (char)"ACFUROM");
    int v12 = 5001;
    goto LABEL_68;
  }
  uint64_t v9 = (ACFULogging *)(***(void *(****)(long long ***__return_ptr))(a1 + 8))(&v107);
  uint64_t v10 = (void **)v107;
  uint64_t v11 = v108;
  if (v108)
  {
    atomic_fetch_add_explicit(&v108->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v9 = (ACFULogging *)v108;
    int v12 = v109;
    if (v108) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v108);
    }
    if (!v12)
    {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      goto LABEL_8;
    }
LABEL_77:
    uint64_t v84 = ACFULogging::getLogInstance(v9);
    ACFULogging::handleMessage((uint64_t)v84, 2u, "%s::%s: failed to get board params (%d)\n", v85, v86, v87, v88, v89, (char)"ACFUROM");
    goto LABEL_68;
  }
  int v12 = v109;
  if (v109) {
    goto LABEL_77;
  }
LABEL_8:
  uint64_t v13 = (ACFULogging *)ACFUCommon::Parameter::dataLength((ACFUCommon::Parameter *)(v10 + 1));
  uint64_t v14 = v13;
  uint64_t v99 = a5;
  if (v11)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    if (v14 == (ACFULogging *)2)
    {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      goto LABEL_12;
    }
LABEL_78:
    uint64_t v90 = ACFULogging::getLogInstance(v13);
    uint64_t v96 = "%s::%s: unexpected size for ChipID\n";
LABEL_80:
    ACFULogging::handleMessage((uint64_t)v90, 2u, v96, v91, v92, v93, v94, v95, (char)"ACFUROM");
    int v12 = 3011;
    goto LABEL_68;
  }
  if (v13 != (ACFULogging *)2) {
    goto LABEL_78;
  }
LABEL_12:
  uint64_t v15 = (ACFULogging *)ACFUCommon::Parameter::dataLength((ACFUCommon::Parameter *)(v10 + 5));
  CFStringRef v16 = v15;
  if (!v11)
  {
    if (v15 == (ACFULogging *)8) {
      goto LABEL_16;
    }
    goto LABEL_79;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  if (v16 != (ACFULogging *)8)
  {
LABEL_79:
    uint64_t v90 = ACFULogging::getLogInstance(v15);
    a5 = v99;
    uint64_t v96 = "%s::%s: unexpected size for ECID\n";
    goto LABEL_80;
  }
  atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_16:
  ACFUCommon::Parameter::dataBytePtr((ACFUCommon::Parameter *)(v10 + 1));
  if (v11)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ACFUCommon::Parameter::dataBytePtr((ACFUCommon::Parameter *)(v10 + 5));
  CFStringRef v17 = (ACFULogging *)v11;
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  uint64_t v18 = *a2;
  uint64_t v19 = a2[1];
  if (*a2 == v19)
  {
LABEL_67:
    int v12 = 0;
    a5 = v99;
    goto LABEL_68;
  }
  CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  while (1)
  {
    if (*(char *)(v18 + 47) < 0)
    {
      if (!*(void *)(v18 + 32))
      {
LABEL_28:
        uint64_t v27 = ACFULogging::getLogInstance(v17);
        ACFULogging::handleMessage((uint64_t)v27, 0, "%s::%s: Looking for '%s'\n", v28, v29, v30, v31, v32, (char)"ACFUROM");
        goto LABEL_29;
      }
    }
    else if (!*(unsigned char *)(v18 + 47))
    {
      goto LABEL_28;
    }
    uint64_t v20 = ACFULogging::getLogInstance(v17);
    uint64_t v26 = (void *)(v18 + 24);
    if (*(char *)(v18 + 47) < 0) {
      uint64_t v26 = (void *)*v26;
    }
    v98 = v26;
    ACFULogging::handleMessage((uint64_t)v20, 0, "%s::%s: Looking for '%s' with parent '%s'\n", v21, v22, v23, v24, v25, (char)"ACFUROM");
LABEL_29:
    ACFUFDR::getDataLocalCopy(a3, v18, (ACFULogging **)&v107);
    uint64_t v34 = (void **)v107;
    if (v108) {
      break;
    }
    if (v107)
    {
      if (*(char *)(v18 + 47) < 0) {
        uint64_t v35 = *(void *)(v18 + 32);
      }
      else {
        uint64_t v35 = *(unsigned __int8 *)(v18 + 47);
      }
      if (*(unsigned char *)(a3 + 16)) {
        BOOL v42 = v35 == 0;
      }
      else {
        BOOL v42 = 1;
      }
      if (v42) {
        uint64_t v43 = v18;
      }
      else {
        uint64_t v43 = v18 + 24;
      }
      uint64_t v44 = ACFULogging::getLogInstance(v33);
      uint64_t v50 = v43;
      if (*(char *)(v43 + 23) < 0) {
        uint64_t v50 = *(void *)v43;
      }
      uint64_t v97 = v50;
      ACFULogging::handleMessage((uint64_t)v44, 0, "%s::%s: Handling %s\n", v45, v46, v47, v48, v49, (char)"ACFUROM");
      uint64_t v51 = v43;
      if (*(char *)(v43 + 23) < 0) {
        uint64_t v51 = *(void *)v43;
      }
      uint64_t v52 = "combined";
      if (!*(unsigned char *)(a3 + 16)) {
        uint64_t v52 = "raw";
      }
      CFStringRef v53 = CFStringCreateWithFormat(alloc, 0, @"%s-%s.bin", v51, v52, v97, v98);
      if (v53)
      {
        ACFUDiagnostics::addItem(*(uint64_t **)(a1 + 40), (uint64_t)v53, (uint64_t)v34, 1);
        CFRelease(v53);
      }
      else
      {
        uint64_t v54 = ACFULogging::getLogInstance(0);
        ACFULogging::handleMessage((uint64_t)v54, 0, "%s::%s: could not add cal file into diagnostics\n", v55, v56, v57, v58, v59, (char)"ACFUROM");
      }
      uint64_t v60 = *(std::__shared_weak_count **)(a1 + 16);
      uint64_t v105 = *(void *)(a1 + 8);
      v106 = v60;
      if (v60) {
        atomic_fetch_add_explicit(&v60->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      char v61 = *(std::__shared_weak_count **)(a1 + 32);
      uint64_t v103 = *(void *)(a1 + 24);
      v104 = v61;
      if (v61) {
        atomic_fetch_add_explicit(&v61->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      int v12 = std::function<ACFUErrorCode ()(std::shared_ptr<ACFUTransport>,std::shared_ptr<ACFUFirmware>,std::string const&,__CFData const*)>::operator()(a4, (uint64_t)&v105, (uint64_t)&v103, v43, (uint64_t)v34);
      if (v104) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v104);
      }
      uint64_t v62 = (ACFULogging *)v106;
      if (v106) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v106);
      }
      if (v12)
      {
        uint64_t v72 = ACFULogging::getLogInstance(v62);
        a5 = v99;
        ACFULogging::handleMessage((uint64_t)v72, 2u, "%s::%s: failed to handle FDR file\n", v73, v74, v75, v76, v77, (char)"ACFUROM");
        CFRelease(v34);
        goto LABEL_68;
      }
      char v63 = v111;
      if ((unint64_t)v111 >= v112)
      {
        char v65 = (long long *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v110, (long long *)v18);
      }
      else
      {
        if (*(char *)(v18 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(v111, *(const std::string::value_type **)v18, *(void *)(v18 + 8));
        }
        else
        {
          long long v64 = *(_OWORD *)v18;
          v111->__r_.__value_.__r.__words[2] = *(void *)(v18 + 16);
          *(_OWORD *)&v63->__r_.__value_.__l.__data_ = v64;
        }
        char v65 = (long long *)&v63[1];
      }
      std::string v111 = (std::string *)v65;
      CFRelease(v34);
    }
    else
    {
      uint64_t v36 = ACFULogging::getLogInstance(v33);
      ACFULogging::handleMessage((uint64_t)v36, 0, "%s::%s: %s doesn't exist. Skipping...\n", v37, v38, v39, v40, v41, (char)"ACFUROM");
    }
    v18 += 48;
    if (v18 == v19) {
      goto LABEL_67;
    }
  }
  uint64_t v66 = ACFULogging::getLogInstance(v33);
  a5 = v99;
  ACFULogging::handleMessage((uint64_t)v66, 2u, "%s::%s: failed to validate %s\n", v67, v68, v69, v70, v71, (char)"ACFUROM");
  if (v34) {
    CFRelease(v34);
  }
  int v12 = 5002;
LABEL_68:
  memset(&v102, 0, sizeof(v102));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v102, v110, (long long *)v111, 0xAAAAAAAAAAAAAAABLL * (((char *)v111 - (char *)v110) >> 3));
  *(void *)a5 = 0;
  *(void *)(a5 + 8) = 0;
  *(void *)(a5 + 16) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)a5, (long long *)v102.__r_.__value_.__l.__data_, (long long *)v102.__r_.__value_.__l.__size_, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v102.__r_.__value_.__l.__size_ - v102.__r_.__value_.__r.__words[0]) >> 3));
  *(_DWORD *)(a5 + 24) = v12;
  v107 = (long long **)&v102;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v107);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  v107 = &v110;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v107);
}

void sub_22EF017B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void **a26)
{
  if (a15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a15);
  }
  a26 = (void **)(v26 - 112);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a26);
  _Unwind_Resume(a1);
}

uint64_t std::function<ACFUErrorCode ()(std::shared_ptr<ACFUTransport>,std::shared_ptr<ACFUFirmware>,std::string const&,__CFData const*)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = a5;
  uint64_t v5 = *(void *)(a1 + 24);
  if (!v5) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))(*(void *)v5 + 48))(v5, a2, a3, a4, &v7);
}

uint64_t ACFUROM::bootFirmware(ACFUFirmware **this)
{
  BOOL hasValidFirmware = ACFUFirmware::hasValidFirmware(this[3]);
  if (hasValidFirmware)
  {
    uint64_t v3 = this[1];
    uint64_t v4 = (std::__shared_weak_count *)this[4];
    uint64_t v20 = this[3];
    uint64_t v21 = v4;
    if (v4) {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v5 = (*(uint64_t (**)(ACFUFirmware *, ACFUFirmware **))(*(void *)v3 + 16))(v3, &v20);
    std::string::size_type v6 = (ACFULogging *)v21;
    if (v21) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v21);
    }
    if (v5)
    {
      LogInstance = ACFULogging::getLogInstance(v6);
      ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to push firmware (%d)\n", v15, v16, v17, v18, v19, (char)"ACFUROM");
    }
  }
  else
  {
    int v8 = ACFULogging::getLogInstance((ACFULogging *)hasValidFirmware);
    ACFULogging::handleMessage((uint64_t)v8, 2u, "%s::%s: firmware not present to boot\n", v9, v10, v11, v12, v13, (char)"ACFUROM");
    return 1000;
  }
  return v5;
}

void sub_22EF019BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  }
  _Unwind_Resume(exception_object);
}

void ACFUROM::~ACFUROM(ACFUROM *this)
{
  *(void *)this = &unk_26E27FBC0;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 6);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

void ACFUROM::ACFUROM(ACFUROM *this)
{
  *(void *)this = &unk_26E27FBC0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
}

uint64_t ACFUROM::init(void *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v4 = *a2;
  if (!*a2 || !*a3 || !*a4) {
    return 0;
  }
  uint64_t v8 = a2[1];
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v9 = (std::__shared_weak_count *)a1[2];
  a1[1] = v4;
  a1[2] = v8;
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  uint64_t v11 = *a3;
  uint64_t v10 = a3[1];
  if (v10) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v12 = (std::__shared_weak_count *)a1[4];
  a1[3] = v11;
  a1[4] = v10;
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  uint64_t v14 = *a4;
  uint64_t v13 = a4[1];
  if (v13) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v13 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v15 = (std::__shared_weak_count *)a1[6];
  a1[5] = v14;
  a1[6] = v13;
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  return 1;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  operator delete(v1);
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<ACFURTKitNVRMGenerator::RTKitNVRMVariable>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9) {
    uint64_t v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<ACFURTKitNVRMGenerator::RTKitNVRMVariable>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  std::__split_buffer<std::string>::pointer end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    std::__split_buffer<std::string>::pointer end = __v.__end_;
  }
  else
  {
    long long v12 = *a2;
    end->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }
  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  uint64_t v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_22EF01CB8(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      unint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        unint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

std::string *std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(std::string *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    std::string::size_type v6 = result;
    std::vector<std::string>::__vallocate[abi:ne180100](result, a4);
    CFDictionaryRef result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_22EF01F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::string>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<ACFURTKitNVRMGenerator::RTKitNVRMVariable>::__throw_length_error[abi:ne180100]();
  }
  CFDictionaryRef result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ACFURTKitNVRMGenerator::RTKitNVRMVariable>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  uint64_t v4 = this;
  uint64_t v11 = this;
  long long v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    std::string::size_type v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((void *)v6 + 1));
        uint64_t v4 = v12;
      }
      else
      {
        long long v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      std::string::size_type v6 = (long long *)((char *)v6 + 24);
      long long v12 = ++v4;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_22EF0207C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0) {
      operator delete(*(void **)(v1 - 24));
    }
    v1 -= 24;
  }
}

void ACFUFDR::getDataLocalCopy(uint64_t a1@<X0>, uint64_t a2@<X1>, ACFULogging **a3@<X8>)
{
  ACFUError::ACFUError((ACFUError *)v112, @"ACFUFDR");
  std::string v111 = 0;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v107);
  *(_DWORD *)((char *)&v108[1] + *(void *)(v108[0] - 24)) |= 0x4000u;
  LOBYTE(__p[0]) = 48;
  unint64_t v5 = std::operator<<[abi:ne180100]<std::char_traits<char>>(v108, (char *)__p);
  uint64_t v6 = *v5;
  *(uint64_t *)((char *)v5 + *(void *)(*v5 - 24) + 24) = 8;
  *(_DWORD *)((char *)v5 + *(void *)(v6 - 24) + 8) = *(_DWORD *)((unsigned char *)v5 + *(void *)(v6 - 24) + 8) & 0xFFFFFFB5 | 8;
  long long v7 = (void *)std::ostream::operator<<();
  unint64_t v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)"-", 1);
  v104.__r_.__value_.__s.__data_[0] = 48;
  uint64_t v9 = std::operator<<[abi:ne180100]<std::char_traits<char>>(v8, (char *)&v104);
  uint64_t v10 = *v9;
  *(uint64_t *)((char *)v9 + *(void *)(*v9 - 24) + 24) = 16;
  *(_DWORD *)((char *)v9 + *(void *)(v10 - 24) + 8) = *(_DWORD *)((unsigned char *)v9 + *(void *)(v10 - 24) + 8) & 0xFFFFFFB5 | 8;
  std::ostream::operator<<();
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (*(char *)(a2 + 23) >= 0) {
    long long v12 = (const char *)a2;
  }
  else {
    long long v12 = *(const char **)a2;
  }
  CFStringRef v13 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], v12, 0x8000100u);
  uint64_t v14 = *(unsigned __int8 *)(a2 + 47);
  int v15 = (char)v14;
  if ((v14 & 0x80u) != 0) {
    uint64_t v14 = *(void *)(a2 + 32);
  }
  if (v14)
  {
    if (v15 >= 0) {
      uint64_t v16 = (const char *)(a2 + 24);
    }
    else {
      uint64_t v16 = *(const char **)(a2 + 24);
    }
    CFStringRef v17 = CFStringCreateWithCString(v11, v16, 0x8000100u);
  }
  else
  {
    CFStringRef v17 = 0;
  }
  std::stringbuf::str();
  if (v106 >= 0) {
    uint64_t v18 = __p;
  }
  else {
    uint64_t v18 = (void **)__p[0];
  }
  uint64_t v19 = (ACFULogging *)CFStringCreateWithCString(v11, (const char *)v18, 0x8000100u);
  uint64_t v20 = v19;
  if (SHIBYTE(v106) < 0) {
    operator delete(__p[0]);
  }
  if (!v13 || !v20) {
    goto LABEL_84;
  }
  if (!v17)
  {
    uint64_t v21 = *(unsigned __int8 *)(a2 + 47);
    if ((v21 & 0x80u) != 0) {
      uint64_t v21 = *(void *)(a2 + 32);
    }
    if (v21)
    {
LABEL_84:
      LogInstance = ACFULogging::getLogInstance(v19);
      uint64_t v82 = "%s::%s: failed to allocate dataIntance, dataClass, or parentDataClass\n";
LABEL_86:
      ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v82, v77, v78, v79, v80, v81, (char)"ACFUFDR");
      uint64_t v51 = 0;
      uint64_t v34 = 0;
      uint64_t v23 = 0;
      uint64_t v54 = -1;
      goto LABEL_61;
    }
  }
  Mutable = CFDictionaryCreateMutable(v11, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v23 = Mutable;
  if (!Mutable)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    uint64_t v82 = "%s::%s: failed to allocate options dictionary\n";
    goto LABEL_86;
  }
  uint64_t v24 = (const void **)MEMORY[0x263EFFB40];
  if (*(unsigned char *)a1) {
    CFDictionaryAddValue(Mutable, @"CopyAllowRawData", (const void *)*MEMORY[0x263EFFB40]);
  }
  uint64_t v25 = *(const void **)(a1 + 8);
  if (v25) {
    CFDictionaryAddValue(v23, @"APTicket", v25);
  }
  uint64_t v26 = *v24;
  if (*(unsigned char *)(a1 + 16)) {
    CFDictionaryAddValue(v23, @"GetCombined", v26);
  }
  CFDictionaryAddValue(v23, @"CopyAllowUnsealed", v26);
  uint64_t v28 = ACFULogging::getLogInstance(v27);
  std::string::basic_string[abi:ne180100]<0>(&v103, "ACFUFDR");
  uint64_t v29 = std::string::append(&v103, "::");
  long long v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
  v104.__r_.__value_.__r.__words[2] = v29->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v104.__r_.__value_.__l.__data_ = v30;
  v29->__r_.__value_.__l.__size_ = 0;
  v29->__r_.__value_.__r.__words[2] = 0;
  v29->__r_.__value_.__r.__words[0] = 0;
  uint64_t v31 = std::string::append(&v104, "getDataLocalCopy");
  long long v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
  int64_t v106 = v31->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v32;
  v31->__r_.__value_.__l.__size_ = 0;
  v31->__r_.__value_.__r.__words[2] = 0;
  v31->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v28, (uint64_t *)__p, 3, (uint64_t)"FDR Validation Options", (uint64_t)v23);
  if (SHIBYTE(v106) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v104.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v104.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v103.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v103.__r_.__value_.__l.__data_);
  }
  if (v17 && !*(unsigned char *)(a1 + 16)) {
    uint64_t v33 = (ACFULogging *)AMFDRSealingMapCopyLocalDict();
  }
  else {
    uint64_t v33 = (ACFULogging *)AMFDRSealingMapCopyLocalData();
  }
  uint64_t v34 = v33;
  CFTypeRef v35 = v111;
  if (*(unsigned char *)(a1 + 1) && v33 && v111)
  {
    uint64_t v36 = ACFULogging::getLogInstance(v33);
    AMFDRGetTrustError();
    ACFULogging::handleMessage((uint64_t)v36, 3u, "%s::%s: skipping trust error since FDR validation is disabled (Trust Error: 0x%016llx)\n", v37, v38, v39, v40, v41, (char)"ACFUFDR");
    uint64_t v43 = ACFULogging::getLogInstance(v42);
    std::string::basic_string[abi:ne180100]<0>(&v103, "ACFUFDR");
    uint64_t v44 = std::string::append(&v103, "::");
    long long v45 = *(_OWORD *)&v44->__r_.__value_.__l.__data_;
    v104.__r_.__value_.__r.__words[2] = v44->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v104.__r_.__value_.__l.__data_ = v45;
    v44->__r_.__value_.__l.__size_ = 0;
    v44->__r_.__value_.__r.__words[2] = 0;
    v44->__r_.__value_.__r.__words[0] = 0;
    uint64_t v46 = std::string::append(&v104, "getDataLocalCopy");
    long long v47 = *(_OWORD *)&v46->__r_.__value_.__l.__data_;
    int64_t v106 = v46->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v47;
    v46->__r_.__value_.__l.__size_ = 0;
    v46->__r_.__value_.__r.__words[2] = 0;
    v46->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v43, (uint64_t *)__p, 3, (uint64_t)"fdr error: ", (uint64_t)v111);
    if (SHIBYTE(v106) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v104.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v104.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v103.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v103.__r_.__value_.__l.__data_);
    }
    uint64_t v33 = (ACFULogging *)v111;
    if (!v111)
    {
      CFTypeRef v35 = 0;
      if (!v34) {
        goto LABEL_77;
      }
      goto LABEL_52;
    }
    CFRelease(v111);
    CFTypeRef v35 = 0;
    std::string v111 = 0;
  }
  if (!v34)
  {
LABEL_77:
    long long v64 = ACFULogging::getLogInstance(v33);
    ACFULogging::handleMessage((uint64_t)v64, 2u, "%s::%s: failed to get data from local FDR data store\n", v65, v66, v67, v68, v69, (char)"ACFUFDR");
    uint64_t v71 = ACFULogging::getLogInstance(v70);
    std::string::basic_string[abi:ne180100]<0>(&v103, "ACFUFDR");
    uint64_t v72 = std::string::append(&v103, "::");
    long long v73 = *(_OWORD *)&v72->__r_.__value_.__l.__data_;
    v104.__r_.__value_.__r.__words[2] = v72->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v104.__r_.__value_.__l.__data_ = v73;
    v72->__r_.__value_.__l.__size_ = 0;
    v72->__r_.__value_.__r.__words[2] = 0;
    v72->__r_.__value_.__r.__words[0] = 0;
    uint64_t v74 = std::string::append(&v104, "getDataLocalCopy");
    long long v75 = *(_OWORD *)&v74->__r_.__value_.__l.__data_;
    int64_t v106 = v74->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v75;
    v74->__r_.__value_.__l.__size_ = 0;
    v74->__r_.__value_.__r.__words[2] = 0;
    v74->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v71, (uint64_t *)__p, 2, (uint64_t)"fdr error: ", (uint64_t)v111);
    if (SHIBYTE(v106) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v104.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v104.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v103.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v103.__r_.__value_.__l.__data_);
    }
    CFStringRef v53 = (ACFULogging *)AMFDRGetTrustError();
    uint64_t v54 = (uint64_t)v53;
    uint64_t v51 = 0;
    goto LABEL_61;
  }
LABEL_52:
  if (v35) {
    goto LABEL_77;
  }
  if (v17 && !*(unsigned char *)(a1 + 16))
  {
    CFTypeID v48 = CFGetTypeID(v34);
    CFTypeID TypeID = (ACFULogging *)CFDictionaryGetTypeID();
    if ((ACFULogging *)v48 == TypeID)
    {
      Value = (ACFULogging *)CFDictionaryGetValue(v34, v13);
      uint64_t v51 = Value;
      if (Value)
      {
        CFRetain(Value);
        CFTypeID v52 = CFGetTypeID(v51);
        CFStringRef v53 = (ACFULogging *)CFDataGetTypeID();
        if ((ACFULogging *)v52 == v53)
        {
LABEL_58:
          uint64_t v54 = 0;
          goto LABEL_61;
        }
        uint64_t v96 = ACFULogging::getLogInstance(v53);
        ACFULogging::handleMessage((uint64_t)v96, 2u, "%s::%s: Wrong type, expected data\n", v97, v98, v99, v100, v101, (char)"ACFUFDR");
        CFRelease(v51);
      }
      else
      {
        uint64_t v90 = ACFULogging::getLogInstance(0);
        ACFULogging::handleMessage((uint64_t)v90, 2u, "%s::%s: data class %s not present in parent data class %s\n", v91, v92, v93, v94, v95, (char)"ACFUFDR");
      }
LABEL_92:
      uint64_t v51 = 0;
      goto LABEL_58;
    }
    uint64_t v83 = ACFULogging::getLogInstance(TypeID);
    uint64_t v89 = "%s::%s: Wrong type, expected dict\n";
LABEL_89:
    ACFULogging::handleMessage((uint64_t)v83, 2u, v89, v84, v85, v86, v87, v88, (char)"ACFUFDR");
    goto LABEL_92;
  }
  CFTypeID v55 = CFGetTypeID(v34);
  uint64_t v56 = (ACFULogging *)CFDataGetTypeID();
  if ((ACFULogging *)v55 != v56)
  {
    uint64_t v83 = ACFULogging::getLogInstance(v56);
    uint64_t v89 = "%s::%s: Wrong type, expected data\n";
    goto LABEL_89;
  }
  CFStringRef v53 = (ACFULogging *)CFRetain(v34);
  uint64_t v54 = 0;
  uint64_t v51 = v34;
LABEL_61:
  uint64_t v57 = ACFULogging::getLogInstance(v53);
  ACFULogging::handleMessage((uint64_t)v57, 3u, "%s::%s: FDR Trust Result: 0x%016llx\n", v58, v59, v60, v61, v62, (char)"ACFUFDR");
  if (v13) {
    CFRelease(v13);
  }
  if (v17) {
    CFRelease(v17);
  }
  if (v111)
  {
    CFRelease(v111);
    std::string v111 = 0;
  }
  if (v20) {
    CFRelease(v20);
  }
  if (v23) {
    CFRelease(v23);
  }
  if (v34) {
    CFRelease(v34);
  }
  *a3 = v51;
  a3[1] = (ACFULogging *)v54;
  v107[0] = *MEMORY[0x263F8C2B8];
  uint64_t v63 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v107 + *(void *)(v107[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v108[0] = v63;
  v108[1] = MEMORY[0x263F8C318] + 16;
  if (v109 < 0) {
    operator delete((void *)v108[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x230FAED90](&v110);
  ACFUError::~ACFUError((ACFUError *)v112);
}

void sub_22EF02A70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32,char a33)
{
  if (a32 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  if (a19 < 0) {
    operator delete(a14);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a33);
  ACFUError::~ACFUError((ACFUError *)(v33 - 104));
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C328] + 104;
  *(void *)(a1 + 128) = MEMORY[0x263F8C328] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x263F8C328] + 64;
  *(void *)(a1 + 16) = MEMORY[0x263F8C328] + 64;
  unint64_t v5 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + 8) = 0;
  unint64_t v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  uint64_t v9 = MEMORY[0x263F8C328] + 24;
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  uint64_t v10 = v5[5];
  uint64_t v11 = v5[4];
  *(void *)(a1 + 16) = v11;
  *(void *)(v3 + *(void *)(v11 - 24)) = v10;
  uint64_t v12 = v5[1];
  *(void *)a1 = v12;
  *(void *)(a1 + *(void *)(v12 - 24)) = v5[6];
  *(void *)a1 = v9;
  *(void *)(a1 + 128) = v2;
  *(void *)(a1 + 16) = v4;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_22EF02DE0(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x230FAED90](v1);
  _Unwind_Resume(a1);
}

void *std::operator<<[abi:ne180100]<std::char_traits<char>>(void *a1, char *a2)
{
  uint64_t v3 = (char *)a1 + *(void *)(*a1 - 24);
  int v4 = *a2;
  if (*((_DWORD *)v3 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
    unint64_t v5 = std::locale::use_facet(&v8, MEMORY[0x263F8C108]);
    int v6 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 32);
    std::locale::~locale(&v8);
    *((_DWORD *)v3 + 36) = v6;
  }
  *((_DWORD *)v3 + 36) = v4;
  return a1;
}

void sub_22EF02EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B8];
  uint64_t v3 = *MEMORY[0x263F8C2B8];
  *(void *)a1 = *MEMORY[0x263F8C2B8];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x230FAED90](a1 + 128);
  return a1;
}

uint64_t ACFUFDR::certifyChip(uint64_t a1, __int16 a2, uint64_t a3, __int16 a4)
{
  valuePtr[0] = a2;
  uint64_t v125 = a3;
  __int16 v124 = a4;
  uint64_t bytes = 0;
  CFTypeRef v123 = 0;
  unint64_t v5 = (ACFULogging *)std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v119);
  CFTypeRef v118 = 0;
  int v6 = *(_DWORD *)(a1 + 32);
  BOOL v7 = v6 == 2 && *(void *)(a1 + 40) == 0;
  uint64_t v8 = MEMORY[0x263F8C2B8];
  if (v7)
  {
    LogInstance = ACFULogging::getLogInstance(v5);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: client sik pubkey must be set for FDR 2.0 certification\n", v98, v99, v100, v101, v102, (char)"ACFUFDR");
    theDict = 0;
    CFURLRef v40 = 0;
    uint64_t v39 = 0;
    goto LABEL_59;
  }
  CCRNGStatus v9 = CCRandomGenerateBytes(&bytes, 8uLL);
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef value = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &bytes);
  CFNumberRef v11 = CFNumberCreate(v10, kCFNumberSInt16Type, valuePtr);
  CFNumberRef v12 = CFNumberCreate(v10, kCFNumberSInt64Type, &v125);
  CFStringRef v13 = CFNumberCreate(v10, kCFNumberSInt16Type, &v124);
  cf = v13;
  if (v11) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14 || v13 == 0 || v9 != 0 || value == 0)
  {
    uint64_t v61 = ACFULogging::getLogInstance(v13);
    ACFULogging::handleMessage((uint64_t)v61, 2u, "%s::%s: failed to setup http header parameters (rngStatus: %d)\n", v62, v63, v64, v65, v66, (char)"ACFUFDR");
    uint64_t v39 = 0;
    CFURLRef v40 = 0;
    theDict = 0;
    if (!value) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
  theDict = CFDictionaryCreateMutable(v10, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!theDict)
  {
    uint64_t v67 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v67, 2u, "%s::%s: failed to allocate extra options dictionary\n", v68, v69, v70, v71, v72, (char)"ACFUFDR");
    uint64_t v39 = 0;
    CFURLRef v40 = 0;
    theDict = 0;
    goto LABEL_52;
  }
  Mutable = CFDictionaryCreateMutable(v10, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v19 = Mutable;
  if (!Mutable)
  {
    long long v73 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v73, 2u, "%s::%s: failed to allocate http header dictionary\n", v74, v75, v76, v77, v78, (char)"ACFUFDR");
    uint64_t v39 = 0;
    CFURLRef v40 = 0;
    goto LABEL_52;
  }
  CFDictionarySetValue(Mutable, @"x-fdr-request-uuid", value);
  CFDictionarySetValue(v19, @"x-fdr-metadata-ECID", v12);
  CFDictionarySetValue(v19, @"x-fdr-metadata-ChipID", v11);
  CFDictionarySetValue(v19, @"x-fdr-metadata-BoardID", cf);
  CFDictionarySetValue(v19, @"x-fdr-attestation", (const void *)*MEMORY[0x263EFFB40]);
  if (v6 == 2)
  {
    uint64_t v21 = (ACFULogging *)std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v114);
    uint64_t v22 = ACFULogging::getLogInstance(v21);
    ACFULogging::handleMessage((uint64_t)v22, 0, "%s::%s: configuring for FDR 2.0 certification\n", v23, v24, v25, v26, v27, (char)"ACFUFDR");
    *(_DWORD *)((char *)&v115[1] + *(void *)(v115[0] - 24)) |= 0x4000u;
    __p.__r_.__value_.__s.__data_[0] = 48;
    uint64_t v28 = std::operator<<[abi:ne180100]<std::char_traits<char>>(v115, (char *)&__p);
    uint64_t v29 = *v28;
    *(uint64_t *)((char *)v28 + *(void *)(*v28 - 24) + 24) = 8;
    *(_DWORD *)((char *)v28 + *(void *)(v29 - 24) + 8) = *(_DWORD *)((unsigned char *)v28 + *(void *)(v29 - 24) + 8) & 0xFFFFFFB5 | 8;
    long long v30 = (void *)std::ostream::operator<<();
    uint64_t v31 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v30, (uint64_t)"-", 1);
    v112.__r_.__value_.__s.__data_[0] = 48;
    long long v32 = std::operator<<[abi:ne180100]<std::char_traits<char>>(v31, (char *)&v112);
    uint64_t v33 = *v32;
    *(uint64_t *)((char *)v32 + *(void *)(*v32 - 24) + 24) = 16;
    *(_DWORD *)((char *)v32 + *(void *)(v33 - 24) + 8) = *(_DWORD *)((unsigned char *)v32 + *(void *)(v33 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::ostream::operator<<();
    std::stringbuf::str();
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    CFTypeRef v35 = (ACFULogging *)CFStringCreateWithCString(v10, (const char *)p_p, 0x8000100u);
    uint64_t v36 = v35;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v36)
    {
      CFDictionarySetValue(v19, @"x-fdr-client-id", v36);
      CFDictionarySetValue(theDict, @"CertifySikPub", *(const void **)(a1 + 40));
      CFRelease(v36);
    }
    else
    {
      std::string v103 = ACFULogging::getLogInstance(v35);
      ACFULogging::handleMessage((uint64_t)v103, 2u, "%s::%s: failed to create client ID\n", v104, v105, v106, v107, v108, (char)"ACFUFDR");
    }
    v114[0] = *(void **)v8;
    uint64_t v37 = *(void *)(v8 + 72);
    *(void **)((char *)v114 + *((void *)v114[0] - 3)) = *(void **)(v8 + 64);
    v115[0] = v37;
    v115[1] = MEMORY[0x263F8C318] + 16;
    if (v116 < 0) {
      operator delete((void *)v115[9]);
    }
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    uint64_t v38 = (ACFULogging *)MEMORY[0x230FAED90](&v117);
    if (!v36) {
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v41 = ACFULogging::getLogInstance(v20);
    ACFULogging::handleMessage((uint64_t)v41, 0, "%s::%s: configuring for FDR 1.0 certification\n", v42, v43, v44, v45, v46, (char)"ACFUFDR");
    CFDictionarySetValue(v19, @"x-fdr-certification-type", @"component");
  }
  long long v47 = ACFULogging::getLogInstance(v38);
  std::string::basic_string[abi:ne180100]<0>(&v112, "ACFUFDR");
  CFTypeID v48 = std::string::append(&v112, "::");
  long long v49 = *(_OWORD *)&v48->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v48->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v49;
  v48->__r_.__value_.__l.__size_ = 0;
  v48->__r_.__value_.__r.__words[2] = 0;
  v48->__r_.__value_.__r.__words[0] = 0;
  uint64_t v50 = std::string::append(&__p, "certifyChip");
  long long v51 = *(_OWORD *)&v50->__r_.__value_.__l.__data_;
  v115[0] = *((void *)&v50->__r_.__value_.__l + 2);
  *(_OWORD *)v114 = v51;
  v50->__r_.__value_.__l.__size_ = 0;
  v50->__r_.__value_.__r.__words[2] = 0;
  v50->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v47, (uint64_t *)v114, 0, (uint64_t)"FDR Certification URL:", *(void *)(a1 + 8));
  if (SHIBYTE(v115[0]) < 0) {
    operator delete(v114[0]);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v112.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v112.__r_.__value_.__l.__data_);
  }
  CFURLRef v40 = CFURLCreateWithString(v10, *(CFStringRef *)(a1 + 8), 0);
  if (v40)
  {
    CFDictionarySetValue(theDict, @"CertifyHeaders", v19);
    CFTypeID v52 = *(const void **)(a1 + 56);
    if (v52) {
      CFDictionarySetValue(theDict, @"CertifyManifestSigCert", v52);
    }
    uint64_t v53 = AMFDRChipCertifyForRestore();
    if (v53)
    {
      if (v118)
      {
        uint64_t v54 = ACFULogging::getLogInstance((ACFULogging *)v53);
        std::string::basic_string[abi:ne180100]<0>(&v112, "ACFUFDR");
        CFTypeID v55 = std::string::append(&v112, "::");
        long long v56 = *(_OWORD *)&v55->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = v55->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v56;
        v55->__r_.__value_.__l.__size_ = 0;
        v55->__r_.__value_.__r.__words[2] = 0;
        v55->__r_.__value_.__r.__words[0] = 0;
        uint64_t v57 = std::string::append(&__p, "certifyChip");
        long long v58 = *(_OWORD *)&v57->__r_.__value_.__l.__data_;
        v115[0] = *((void *)&v57->__r_.__value_.__l + 2);
        *(_OWORD *)v114 = v58;
        v57->__r_.__value_.__l.__size_ = 0;
        v57->__r_.__value_.__r.__words[2] = 0;
        v57->__r_.__value_.__r.__words[0] = 0;
        ACFULogging::handleMessageCFType((uint64_t)v54, (uint64_t *)v114, 0, (uint64_t)"Signed Certificate: ", (uint64_t)v118);
        if (SHIBYTE(v115[0]) < 0) {
          operator delete(v114[0]);
        }
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v112.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v112.__r_.__value_.__l.__data_);
        }
      }
      uint64_t v39 = 1;
    }
    else
    {
      uint64_t v85 = ACFULogging::getLogInstance((ACFULogging *)v53);
      ACFULogging::handleMessage((uint64_t)v85, 2u, "%s::%s: failed to perform certification\n", v86, v87, v88, v89, v90, (char)"ACFUFDR");
      uint64_t v92 = ACFULogging::getLogInstance(v91);
      std::string::basic_string[abi:ne180100]<0>(&v112, "ACFUFDR");
      uint64_t v93 = std::string::append(&v112, "::");
      long long v94 = *(_OWORD *)&v93->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__r.__words[2] = v93->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v94;
      v93->__r_.__value_.__l.__size_ = 0;
      v93->__r_.__value_.__r.__words[2] = 0;
      v93->__r_.__value_.__r.__words[0] = 0;
      uint64_t v95 = std::string::append(&__p, "certifyChip");
      long long v96 = *(_OWORD *)&v95->__r_.__value_.__l.__data_;
      v115[0] = *((void *)&v95->__r_.__value_.__l + 2);
      *(_OWORD *)v114 = v96;
      v95->__r_.__value_.__l.__size_ = 0;
      v95->__r_.__value_.__r.__words[2] = 0;
      v95->__r_.__value_.__r.__words[0] = 0;
      ACFULogging::handleMessageCFType((uint64_t)v92, (uint64_t *)v114, 2, (uint64_t)"Certification Error: ", (uint64_t)v123);
      if (SHIBYTE(v115[0]) < 0) {
        operator delete(v114[0]);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v112.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v112.__r_.__value_.__l.__data_);
      }
      uint64_t v39 = 0;
    }
    goto LABEL_51;
  }
  uint64_t v79 = ACFULogging::getLogInstance(0);
  ACFULogging::handleMessage((uint64_t)v79, 2u, "%s::%s: failed to allocate certification URL\n", v80, v81, v82, v83, v84, (char)"ACFUFDR");
LABEL_31:
  uint64_t v39 = 0;
  CFURLRef v40 = 0;
LABEL_51:
  CFRelease(v19);
LABEL_52:
  CFRelease(value);
LABEL_53:
  if (v11) {
    CFRelease(v11);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v12) {
    CFRelease(v12);
  }
LABEL_59:
  if (v123)
  {
    CFRelease(v123);
    CFTypeRef v123 = 0;
  }
  if (v118)
  {
    CFRelease(v118);
    CFTypeRef v118 = 0;
  }
  if (v40) {
    CFRelease(v40);
  }
  if (theDict) {
    CFRelease(theDict);
  }
  v119[0] = *(void *)v8;
  uint64_t v59 = *(void *)(v8 + 72);
  *(void *)((char *)v119 + *(void *)(v119[0] - 24)) = *(void *)(v8 + 64);
  v119[2] = v59;
  v119[3] = MEMORY[0x263F8C318] + 16;
  if (v120 < 0) {
    operator delete((void *)v119[11]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x230FAED90](&v121);
  return v39;
}

void sub_22EF03AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (a34 < 0) {
    operator delete(__p);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a69);
  _Unwind_Resume(a1);
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x230FAEC10](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      CFAllocatorRef v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
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
  MEMORY[0x230FAEC20](v13);
  return a1;
}

void sub_22EF03C9C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x230FAEC20](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x22EF03C7CLL);
}

void sub_22EF03CF0(_Unwind_Exception *a1)
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
      CFStringRef v13 = v18 >= 0 ? __p : (void **)__p[0];
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

void sub_22EF03E70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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

void ACFUTransport::runCertification(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 2;
}

void ACFUTransport::~ACFUTransport(ACFUTransport *this)
{
  *(void *)this = &unk_26E27FC58;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void ACFUTransport::ACFUTransport(ACFUTransport *this)
{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = &unk_26E27FC58;
}

BOOL ACFUTransport::init(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  if (*a2)
  {
    uint64_t v3 = a2[1];
    if (v3) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v4 = *(std::__shared_weak_count **)(a1 + 16);
    *(void *)(a1 + 8) = v2;
    *(void *)(a1 + 16) = v3;
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
  }
  return v2 != 0;
}

void ACFUDataContainer::ACFUDataContainer(ACFUDataContainer *this)
{
  *(void *)this = 0;
  *((_DWORD *)this + 2) = -1;
  *((void *)this + 2) = 0;
  *((_WORD *)this + 12) = 0;
}

{
  *(void *)this = 0;
  *((_DWORD *)this + 2) = -1;
  *((void *)this + 2) = 0;
  *((_WORD *)this + 12) = 0;
}

uint64_t ACFUDataContainer::DirectDataRef::DirectDataRef(uint64_t this, void *a2, uint64_t a3, char a4)
{
  *(void *)this = a2;
  *(void *)(this + 8) = a3;
  *(unsigned char *)(this + 16) = a4;
  *(unsigned char *)(this + 17) = 1;
  return this;
}

{
  *(void *)this = a2;
  *(void *)(this + 8) = a3;
  *(unsigned char *)(this + 16) = a4;
  *(unsigned char *)(this + 17) = 1;
  return this;
}

uint64_t ACFUDataContainer::DirectDataRef::DirectDataRef(uint64_t this, void *a2, uint64_t a3)
{
  *(void *)this = a2;
  *(void *)(this + 8) = a3;
  *(_WORD *)(this + 16) = 0;
  return this;
}

{
  *(void *)this = a2;
  *(void *)(this + 8) = a3;
  *(_WORD *)(this + 16) = 0;
  return this;
}

uint64_t ACFUDataContainer::DirectDataRef::getDataPtr(ACFUDataContainer::DirectDataRef *this)
{
  return *(void *)this;
}

uint64_t ACFUDataContainer::DirectDataRef::getLength(ACFUDataContainer::DirectDataRef *this)
{
  return *((void *)this + 1);
}

uint64_t ACFUDataContainer::DirectDataRef::isMemMapped(ACFUDataContainer::DirectDataRef *this)
{
  return *((unsigned __int8 *)this + 16);
}

void ACFUDataContainer::DirectDataRef::~DirectDataRef(ACFUDataContainer::DirectDataRef *this)
{
  unint64_t v1 = *(void *)this;
  if (*(void *)this)
  {
    size_t v2 = *((void *)this + 1);
    if (v2)
    {
      if (*((unsigned char *)this + 17))
      {
        if (*((unsigned char *)this + 16))
        {
          if (v1 % sysconf(29))
          {
            unint64_t v3 = sysconf(29);
            unint64_t v4 = sysconf(29);
            LogInstance = ACFULogging::getLogInstance((ACFULogging *)v4);
            v2 += v1 % v4;
            ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: unmaping new length for page alignment (alignedLength: %zu. originalLength: %zu)\n", v6, v7, v8, v9, v10, (char)"ACFUDataContainer");
            unint64_t v1 = v1 / v3 * v3;
          }
          uint64_t v11 = (ACFULogging *)munmap((void *)v1, v2);
          if (v11 == -1)
          {
            int64_t v12 = ACFULogging::getLogInstance(v11);
            CFStringRef v13 = __error();
            strerror(*v13);
            ACFULogging::handleMessage((uint64_t)v12, 2u, "%s::%s: failed to unmap file: (%s)\n", v14, v15, v16, v17, v18, (char)"ACFUDataContainer");
          }
        }
        else
        {
          free(*(void **)this);
        }
      }
    }
  }
}

void ACFUDataContainer::create(ACFUDataContainer *this@<X0>, ACFUDataContainer **a2@<X8>)
{
  unint64_t v5 = operator new(0x20uLL);
  *(void *)unint64_t v5 = 0;
  v5[2] = -1;
  *((void *)v5 + 2) = 0;
  *((_WORD *)v5 + 12) = 0;
  *a2 = (ACFUDataContainer *)v5;
  if ((ACFUDataContainer::init((ACFUDataContainer *)v5, this) & 1) == 0)
  {
    std::unique_ptr<ACFUDataContainer>::reset[abi:ne180100](a2, 0);
    LogInstance = ACFULogging::getLogInstance(v6);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to init data container object\n", v8, v9, v10, v11, v12, (char)"ACFUDataContainer");
  }
}

{
  _DWORD *v5;
  ACFULogging *v6;
  void *LogInstance;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  unint64_t v5 = operator new(0x20uLL);
  *(void *)unint64_t v5 = 0;
  v5[2] = -1;
  *((void *)v5 + 2) = 0;
  *((_WORD *)v5 + 12) = 0;
  *a2 = (ACFUDataContainer *)v5;
  if ((ACFUDataContainer::init((ACFUDataContainer *)v5, this) & 1) == 0)
  {
    std::unique_ptr<ACFUDataContainer>::reset[abi:ne180100](a2, 0);
    LogInstance = ACFULogging::getLogInstance(v6);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to init data container object\n", v8, v9, v10, v11, v12, (char)"ACFUDataContainer");
  }
}

void sub_22EF04260(_Unwind_Exception *a1)
{
  std::unique_ptr<ACFUDataContainer>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

uint64_t ACFUDataContainer::init(ACFUDataContainer *this, const __CFData *a2)
{
  if (a2)
  {
    unint64_t v3 = this;
    CFTypeID TypeID = (ACFUDataContainer *)CFDataGetTypeID();
    this = (ACFUDataContainer *)CFGetTypeID(a2);
    if (TypeID == this)
    {
      this = CFDataCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, a2);
      *(void *)unint64_t v3 = this;
      if (this) {
        return 1;
      }
      uint64_t v6 = "%s::%s: failed to allocate space for file object\n";
    }
    else
    {
      uint64_t v6 = "%s::%s: data is of an unsupported type\n";
    }
  }
  else
  {
    uint64_t v6 = "%s::%s: bad parameter!\n";
  }
  LogInstance = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v6, v8, v9, v10, v11, v12, (char)"ACFUDataContainer");
  return 0;
}

void sub_22EF043C8(_Unwind_Exception *a1)
{
  std::unique_ptr<ACFUDataContainer>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

uint64_t ACFUDataContainer::init(ACFUDataContainer *this, __CFData *a2)
{
  if (a2)
  {
    unint64_t v3 = this;
    CFTypeID TypeID = (ACFUDataContainer *)CFDataGetTypeID();
    this = (ACFUDataContainer *)CFGetTypeID(a2);
    if (TypeID == this)
    {
      this = (ACFUDataContainer *)AMSupportSafeRetain();
      *(void *)unint64_t v3 = this;
      if (this) {
        return 1;
      }
      uint64_t v6 = "%s::%s: failed to allocate space for file object\n";
    }
    else
    {
      uint64_t v6 = "%s::%s: data is of an unsupported type\n";
    }
  }
  else
  {
    uint64_t v6 = "%s::%s: bad parameter!\n";
  }
  LogInstance = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v6, v8, v9, v10, v11, v12, (char)"ACFUDataContainer");
  return 0;
}

void ACFUDataContainer::create(__CFString *this@<X0>, const __CFString *a2@<X1>, ACFUDataContainer **a3@<X8>)
{
  char v3 = (char)a2;
  uint64_t v6 = operator new(0x20uLL);
  *(void *)uint64_t v6 = 0;
  v6[2] = -1;
  *((void *)v6 + 2) = 0;
  *((_WORD *)v6 + 12) = 0;
  *a3 = (ACFUDataContainer *)v6;
  if ((ACFUDataContainer::init((ACFUDataContainer *)v6, this, v3) & 1) == 0)
  {
    std::unique_ptr<ACFUDataContainer>::reset[abi:ne180100](a3, 0);
    LogInstance = ACFULogging::getLogInstance(v7);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to init data container object\n", v9, v10, v11, v12, v13, (char)"ACFUDataContainer");
  }
}

void sub_22EF04530(_Unwind_Exception *a1)
{
  std::unique_ptr<ACFUDataContainer>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

uint64_t ACFUDataContainer::init(ACFUDataContainer *this, __CFString *a2, char a3)
{
  ACFUCommon::stringFromCFString(a2, &v43);
  uint64_t v46 = v44;
  *(_OWORD *)uint64_t v45 = v43;
  if ((SHIBYTE(v44) & 0x80000000) == 0)
  {
    if (HIBYTE(v44))
    {
      uint64_t v7 = (const char *)v45;
      goto LABEL_6;
    }
LABEL_40:
    LogInstance = ACFULogging::getLogInstance(v6);
    uint64_t v41 = "%s::%s: failed to acquire file path string\n";
LABEL_44:
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v41, v36, v37, v38, v39, v40, (char)"ACFUDataContainer");
    goto LABEL_21;
  }
  if (!v45[1]) {
    goto LABEL_40;
  }
  uint64_t v7 = v45[0];
LABEL_6:
  if (access(v7, 0))
  {
    *((unsigned char *)this + 25) = 1;
    if (v46 >= 0) {
      uint64_t v8 = (const char *)v45;
    }
    else {
      uint64_t v8 = v45[0];
    }
    uint64_t v9 = (ACFULogging *)open(v8, 514, 438);
  }
  else
  {
    if (v46 >= 0) {
      uint64_t v10 = (const char *)v45;
    }
    else {
      uint64_t v10 = v45[0];
    }
    if (access(v10, 6))
    {
      if (v46 >= 0) {
        uint64_t v11 = (const char *)v45;
      }
      else {
        uint64_t v11 = v45[0];
      }
      uint64_t v12 = (ACFULogging *)access(v11, 4);
      if (v12)
      {
        uint64_t v13 = ACFULogging::getLogInstance(v12);
        uint64_t v14 = __error();
        strerror(*v14);
        uint64_t v20 = "%s::%s: no read or write permissions to file: (%s)\n";
LABEL_20:
        ACFULogging::handleMessage((uint64_t)v13, 2u, v20, v15, v16, v17, v18, v19, (char)"ACFUDataContainer");
LABEL_21:
        uint64_t v21 = 0;
        goto LABEL_37;
      }
      uint64_t v23 = ACFULogging::getLogInstance(v12);
      ACFULogging::handleMessage((uint64_t)v23, 2u, "%s::%s: no write permissions to file... attempting to open file as read-only\n", v24, v25, v26, v27, v28, (char)"ACFUDataContainer");
      if (v46 >= 0) {
        uint64_t v29 = (const char *)v45;
      }
      else {
        uint64_t v29 = v45[0];
      }
      uint64_t v9 = (ACFULogging *)open(v29, 0);
    }
    else
    {
      *((unsigned char *)this + 25) = 1;
      if (v46 >= 0) {
        uint64_t v22 = (const char *)v45;
      }
      else {
        uint64_t v22 = v45[0];
      }
      uint64_t v9 = (ACFULogging *)open(v22, 2);
    }
  }
  *((_DWORD *)this + 2) = v9;
  if ((v9 & 0x80000000) != 0)
  {
    uint64_t v13 = ACFULogging::getLogInstance(v9);
    uint64_t v42 = __error();
    strerror(*v42);
    uint64_t v20 = "%s::%s: failed to open file error: (%s)\n";
    goto LABEL_20;
  }
  CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], a2);
  *((void *)this + 2) = Copy;
  if (!Copy)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    uint64_t v41 = "%s::%s: failed to create copy of file path\n";
    goto LABEL_44;
  }
  if ((a3 & 1) == 0)
  {
    MutableCFDataRef FileDatafromFilePath = ACFUCommon::createMutableFileDatafromFilePath((ACFUCommon *)a2, v31);
    *(void *)this = MutableFileDatafromFilePath;
    if (MutableFileDatafromFilePath)
    {
      char v32 = 0;
      goto LABEL_36;
    }
    LogInstance = ACFULogging::getLogInstance(0);
    uint64_t v41 = "%s::%s: failed to acquire firmware data from file path\n";
    goto LABEL_44;
  }
  char v32 = 1;
LABEL_36:
  *((unsigned char *)this + 24) = v32;
  uint64_t v21 = 1;
LABEL_37:
  if (SHIBYTE(v46) < 0) {
    operator delete(v45[0]);
  }
  return v21;
}

void sub_22EF047AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

__CFData *ACFUDataContainer::copyData(ACFUDataContainer *this)
{
  if (!*((unsigned char *)this + 24))
  {
    if (*(void *)this)
    {
      AMSupportSafeRetain();
      return *(__CFData **)this;
    }
    else
    {
      LogInstance = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: object does not hold any data\n", v23, v24, v25, v26, v27, (char)"ACFUDataContainer");
      return 0;
    }
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  CFStringRef v2 = (const __CFString *)*((void *)this + 2);
  if (!v2)
  {
    uint64_t v8 = ACFULogging::getLogInstance(0);
    uint64_t v14 = "%s::%s: file path has not been initialized\n";
LABEL_19:
    ACFULogging::handleMessage((uint64_t)v8, 2u, v14, v9, v10, v11, v12, v13, (char)"ACFUDataContainer");
    goto LABEL_21;
  }
  ACFUCommon::stringFromCFString(v2, &v28);
  if (SHIBYTE(v31) < 0) {
    operator delete(__p[0]);
  }
  uint64_t v31 = v29;
  *(_OWORD *)std::string __p = v28;
  if (SHIBYTE(v29) < 0)
  {
    if (__p[1])
    {
      unint64_t v4 = (void **)__p[0];
      goto LABEL_12;
    }
    goto LABEL_18;
  }
  if (!HIBYTE(v29))
  {
LABEL_18:
    uint64_t v8 = ACFULogging::getLogInstance(v3);
    uint64_t v14 = "%s::%s: failed to acquire file path c string\n";
    goto LABEL_19;
  }
  unint64_t v4 = __p;
LABEL_12:
  uint64_t v6 = (ACFULogging *)stat((const char *)v4, &v32);
  if (v6 != -1)
  {
    unint64_t v5 = ACFUDataContainer::copyData(this, 0, v32.st_size);
    goto LABEL_14;
  }
  uint64_t v15 = ACFULogging::getLogInstance(v6);
  uint64_t v16 = __error();
  strerror(*v16);
  ACFULogging::handleMessage((uint64_t)v15, 2u, "%s::%s: failed to obtain file stats: (%s)\n", v17, v18, v19, v20, v21, (char)"ACFUDataContainer");
LABEL_21:
  unint64_t v5 = 0;
LABEL_14:
  if (SHIBYTE(v31) < 0) {
    operator delete(__p[0]);
  }
  return v5;
}

void sub_22EF04958(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

__CFData *ACFUDataContainer::copyData(ACFUDataContainer *this, unsigned int a2, unint64_t a3)
{
  if (!a3)
  {
    LogInstance = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: invalid length value\n", v43, v44, v45, v46, v47, (char)"ACFUDataContainer");
    return 0;
  }
  unint64_t v3 = a3;
  CFIndex Length = (ACFULogging *)ACFUDataContainer::getLength((const __CFString **)this);
  if (!Length)
  {
    CFTypeID v48 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v48, 2u, "%s::%s: failed to get backing length\n", v49, v50, v51, v52, v53, (char)"ACFUDataContainer");
    return 0;
  }
  if ((unint64_t)Length <= a2)
  {
    uint64_t v54 = ACFULogging::getLogInstance(Length);
    ACFULogging::handleMessage((uint64_t)v54, 2u, "%s::%s: offset out of range\n", v55, v56, v57, v58, v59, (char)"ACFUDataContainer");
    return 0;
  }
  uint64_t v7 = a2;
  uint64_t v8 = (char *)Length - a2;
  if ((unint64_t)v8 < v3)
  {
    uint64_t v9 = ACFULogging::getLogInstance(Length);
    ACFULogging::handleMessage((uint64_t)v9, 4u, "%s::%s: reducing requested length %zu -> %zu\n", v10, v11, v12, v13, v14, (char)"ACFUDataContainer");
    unint64_t v3 = (unint64_t)v8;
  }
  if (!*((unsigned char *)this + 24))
  {
    if (*(void *)this)
    {
      Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
      if (Mutable)
      {
        BytePtr = CFDataGetBytePtr(*(CFDataRef *)this);
        CFDataAppendBytes(Mutable, &BytePtr[v7], v3);
        return Mutable;
      }
      uint64_t v38 = ACFULogging::getLogInstance(0);
      uint64_t v37 = "%s::%s: failed to create mutable data in unoptimized path\n";
      goto LABEL_26;
    }
    long long v73 = ACFULogging::getLogInstance(Length);
    ACFULogging::handleMessage((uint64_t)v73, 2u, "%s::%s: object does not hold any data\n", v74, v75, v76, v77, v78, (char)"ACFUDataContainer");
    return 0;
  }
  if ((*((_DWORD *)this + 2) & 0x80000000) != 0)
  {
    uint64_t v60 = ACFULogging::getLogInstance(Length);
    ACFULogging::handleMessage((uint64_t)v60, 2u, "%s::%s: invalid file descriptor\n", v61, v62, v63, v64, v65, (char)"ACFUDataContainer");
    return 0;
  }
  double v15 = (double)(a2 / sysconf(29));
  uint64_t v16 = (ACFULogging *)sysconf(29);
  off_t v17 = (v15 * (double)(uint64_t)v16);
  uint64_t v18 = a2 - v17;
  uint64_t v19 = ACFULogging::getLogInstance(v16);
  ACFULogging::handleMessage((uint64_t)v19, 4u, "%s::%s: paging in new length for page alignment (Requested: %zu. Aligned: %zu)\n", v20, v21, v22, v23, v24, (char)"ACFUDataContainer");
  uint64_t v25 = (UInt8 *)mmap(0, v3 + v18, 1, 2, *((_DWORD *)this + 2), v17);
  if (v25 == (UInt8 *)-1)
  {
    uint64_t v66 = ACFULogging::getLogInstance((ACFULogging *)0xFFFFFFFFFFFFFFFFLL);
    uint64_t v67 = __error();
    strerror(*v67);
    ACFULogging::handleMessage((uint64_t)v66, 2u, "%s::%s: failed to map file: (%s)\n", v68, v69, v70, v71, v72, (char)"ACFUDataContainer");
    return 0;
  }
  uint64_t v26 = v25;
  uint64_t v27 = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  Mutable = v27;
  if (!v27)
  {
    uint64_t v38 = ACFULogging::getLogInstance(0);
    uint64_t v37 = "%s::%s: failed to create mutable data in optimized path\n";
LABEL_26:
    unsigned int v39 = 2;
    goto LABEL_12;
  }
  CFDataAppendBytes(v27, &v26[v18], v3);
  uint64_t v29 = (ACFULogging *)munmap(v26, v3 + v18);
  if (v29 == -1)
  {
    long long v30 = ACFULogging::getLogInstance(v29);
    uint64_t v31 = __error();
    strerror(*v31);
    uint64_t v37 = "%s::%s: failed to un-map file: (%s)\n";
    uint64_t v38 = v30;
    unsigned int v39 = 4;
LABEL_12:
    ACFULogging::handleMessage((uint64_t)v38, v39, v37, v32, v33, v34, v35, v36, (char)"ACFUDataContainer");
  }
  return Mutable;
}

CFIndex ACFUDataContainer::getLength(const __CFString **this)
{
  if (*((unsigned char *)this + 24))
  {
    ACFUCommon::stringFromCFString(this[2], __p);
    if (v14 >= 0) {
      unint64_t v1 = __p;
    }
    else {
      unint64_t v1 = (void **)__p[0];
    }
    CFStringRef v2 = (ACFULogging *)stat((const char *)v1, &v15);
    if (v2 == -1)
    {
      LogInstance = ACFULogging::getLogInstance(v2);
      uint64_t v7 = __error();
      strerror(*v7);
      ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to determine file size for path '%s' (%s)\n", v8, v9, v10, v11, v12, (char)"ACFUDataContainer");
      off_t st_size = 0;
    }
    else
    {
      off_t st_size = v15.st_size;
    }
    if (v14 < 0) {
      operator delete(__p[0]);
    }
    return st_size;
  }
  else
  {
    CFStringRef v4 = *this;
    return CFDataGetLength((CFDataRef)v4);
  }
}

void sub_22EF04D7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ACFUDataContainer::copyDirectData(ACFUDataContainer *this@<X0>, size_t __size@<X2>, unsigned int a3@<W1>, ACFUDataContainer::DirectDataRef **a4@<X8>)
{
  *a4 = 0;
  if (!__size)
  {
    LogInstance = ACFULogging::getLogInstance(this);
    uint64_t v32 = "%s::%s: invalid offset value\n";
    unsigned int v33 = 2;
    goto LABEL_11;
  }
  if (*((unsigned char *)this + 24))
  {
    if ((*((_DWORD *)this + 2) & 0x80000000) != 0)
    {
      uint64_t v34 = ACFULogging::getLogInstance(this);
      ACFULogging::handleMessage((uint64_t)v34, 2u, "%s::%s: invalid file descriptor\n", v35, v36, v37, v38, v39, (char)"ACFUDataContainer");
      return;
    }
    uint64_t v8 = sysconf(29);
    uint64_t v9 = (ACFULogging *)sysconf(29);
    uint64_t v10 = ACFULogging::getLogInstance(v9);
    off_t v11 = ((double)(uint64_t)v9 * (double)(a3 / v8));
    uint64_t v12 = a3 - v11;
    ACFULogging::handleMessage((uint64_t)v10, 4u, "%s::%s: paging in new length for page alignment (Requested: %zu. Aligned: %zu)\n", v13, v14, v15, v16, v17, (char)"ACFUDataContainer");
    uint64_t v18 = (char *)mmap(0, v12 + __size, 1, 1, *((_DWORD *)this + 2), v11);
    if (v18 == (char *)-1)
    {
      uint64_t v40 = ACFULogging::getLogInstance((ACFULogging *)0xFFFFFFFFFFFFFFFFLL);
      uint64_t v41 = __error();
      strerror(*v41);
      ACFULogging::handleMessage((uint64_t)v40, 2u, "%s::%s: failed to map file: (%s)\n", v42, v43, v44, v45, v46, (char)"ACFUDataContainer");
      return;
    }
    uint64_t v19 = operator new(0x18uLL);
    *uint64_t v19 = &v18[v12];
    char v20 = 1;
    goto LABEL_9;
  }
  CFDataRef v21 = *(const __CFData **)this;
  if (!*(void *)this)
  {
    uint64_t v47 = ACFULogging::getLogInstance(this);
    uint64_t v53 = "%s::%s: object does not hold any data\n";
LABEL_18:
    ACFULogging::handleMessage((uint64_t)v47, 2u, v53, v48, v49, v50, v51, v52, (char)"ACFUDataContainer");
    return;
  }
  uint64_t v22 = malloc(__size);
  if (!v22)
  {
    uint64_t v47 = ACFULogging::getLogInstance(0);
    uint64_t v53 = "%s::%s: unable to allocate data\n";
    goto LABEL_18;
  }
  uint64_t v23 = v22;
  BytePtr = CFDataGetBytePtr(v21);
  memcpy(v23, &BytePtr[a3], __size);
  uint64_t v19 = operator new(0x18uLL);
  char v20 = 0;
  *uint64_t v19 = v23;
LABEL_9:
  v19[1] = __size;
  *((unsigned char *)v19 + 16) = v20;
  *((unsigned char *)v19 + 17) = 1;
  std::unique_ptr<ACFUDataContainer::DirectDataRef>::reset[abi:ne180100](a4, (ACFUDataContainer::DirectDataRef *)v19);
  if (*(void *)*a4) {
    return;
  }
  LogInstance = ACFULogging::getLogInstance(v25);
  uint64_t v32 = "%s::%s: failed to create file data\n";
  unsigned int v33 = 4;
LABEL_11:
  ACFULogging::handleMessage((uint64_t)LogInstance, v33, v32, v27, v28, v29, v30, v31, (char)"ACFUDataContainer");
}

void sub_22EF04FE4(_Unwind_Exception *a1)
{
  std::unique_ptr<ACFUDataContainer::DirectDataRef>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

uint64_t ACFUDataContainer::setData(const __CFString **this, __CFData *a2)
{
  if (*((unsigned char *)this + 24))
  {
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)this);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: cannot setData for a memory optimized data container.\n", v19, v20, v21, v22, v23, (char)"ACFUDataContainer");
    return 0;
  }
  CFStringRef v3 = *this;
  if (v3)
  {
    CFRelease(v3);
    *this = 0;
  }
  CFStringRef v4 = (ACFULogging *)AMSupportSafeRetain();
  *this = (const __CFString *)v4;
  if (!v4)
  {
    uint64_t v24 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v24, 2u, "%s::%s: failed obtain new file data\n", v25, v26, v27, v28, v29, (char)"ACFUDataContainer");
    return 0;
  }
  if (!*((unsigned char *)this + 25)) {
    return 1;
  }
  CFStringRef v5 = this[2];
  if (!v5)
  {
    uint64_t v30 = ACFULogging::getLogInstance(v4);
    ACFULogging::handleMessage((uint64_t)v30, 2u, "%s::%s: file path has not been initialized\n", v31, v32, v33, v34, v35, (char)"ACFUDataContainer");
    return 0;
  }
  CFURLRef v6 = CFURLCreateWithString((CFAllocatorRef)*MEMORY[0x263EFFB08], v5, 0);
  if (!v6)
  {
    uint64_t v36 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v36, 2u, "%s::%s: failed to create path url\n", v37, v38, v39, v40, v41, (char)"ACFUDataContainer");
    return 0;
  }
  CFURLRef v7 = v6;
  uint64_t v8 = 1;
  int v9 = AMSupportWriteDataToFileURL();
  CFRelease(v7);
  if (v9)
  {
    off_t v11 = ACFULogging::getLogInstance(v10);
    ACFULogging::handleMessage((uint64_t)v11, 2u, "%s::%s: failed to overwrite file (%d)\n", v12, v13, v14, v15, v16, (char)"ACFUDataContainer");
    return 0;
  }
  return v8;
}

uint64_t ACFUDataContainer::writeData(ACFUDataContainer *this, const __CFData *a2, unsigned int a3)
{
  CFURLRef v6 = (ACFULogging *)std::string::basic_string[abi:ne180100]<0>(__p, "");
  if (!*((unsigned char *)this + 25))
  {
    LogInstance = ACFULogging::getLogInstance(v6);
    uint64_t v49 = "%s::%s: file does not have write permissions\n";
LABEL_35:
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v49, v44, v45, v46, v47, v48, (char)"ACFUDataContainer");
LABEL_40:
    uint64_t v41 = 0;
    goto LABEL_26;
  }
  if (!a2)
  {
    LogInstance = ACFULogging::getLogInstance(v6);
    uint64_t v49 = "%s::%s: invalid file data\n";
    goto LABEL_35;
  }
  if (!*((void *)this + 2))
  {
    LogInstance = ACFULogging::getLogInstance(v6);
    uint64_t v49 = "%s::%s: file path has not been initialized\n";
    goto LABEL_35;
  }
  if ((*((_DWORD *)this + 2) & 0x80000000) != 0)
  {
    LogInstance = ACFULogging::getLogInstance(v6);
    uint64_t v49 = "%s::%s: invalid file descriptor\n";
    goto LABEL_35;
  }
  CFIndex Length = CFDataGetLength(a2);
  if (!Length)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    uint64_t v49 = "%s::%s: invalid length\n";
    goto LABEL_35;
  }
  ACFUCommon::stringFromCFString(*((const __CFString **)this + 2), &v66);
  if (SHIBYTE(v69) < 0) {
    operator delete(__p[0]);
  }
  uint64_t v69 = v67;
  *(_OWORD *)std::string __p = v66;
  if ((SHIBYTE(v67) & 0x80000000) == 0)
  {
    if (HIBYTE(v67))
    {
      int v9 = __p;
      goto LABEL_13;
    }
    goto LABEL_34;
  }
  if (!__p[1])
  {
LABEL_34:
    LogInstance = ACFULogging::getLogInstance(v8);
    uint64_t v49 = "%s::%s: failed to acquire file path c string\n";
    goto LABEL_35;
  }
  int v9 = (void **)__p[0];
LABEL_13:
  uint64_t v10 = (ACFULogging *)stat((const char *)v9, &v70);
  if (v10 == -1)
  {
    uint64_t v50 = ACFULogging::getLogInstance(v10);
    uint64_t v51 = __error();
    strerror(*v51);
    uint64_t v57 = "%s::%s: failed to obtain file stats: (%s)\n";
LABEL_39:
    ACFULogging::handleMessage((uint64_t)v50, 2u, v57, v52, v53, v54, v55, v56, (char)"ACFUDataContainer");
    goto LABEL_40;
  }
  off_t v11 = Length + a3;
  if ((unint64_t)v11 > v70.st_size)
  {
    uint64_t v12 = (ACFULogging *)ftruncate(*((_DWORD *)this + 2), Length + a3);
    if (v12)
    {
      uint64_t v50 = ACFULogging::getLogInstance(v12);
      uint64_t v59 = __error();
      strerror(*v59);
      uint64_t v57 = "%s::%s: failed to increase file length: (%s)\n";
      goto LABEL_39;
    }
  }
  uint64_t v13 = sysconf(29);
  uint64_t v14 = (ACFULogging *)sysconf(29);
  uint64_t v15 = ACFULogging::getLogInstance(v14);
  CFIndex v16 = a3;
  off_t v17 = ((double)(uint64_t)v14 * (double)(a3 / v13));
  uint64_t v18 = a3 - v17;
  size_t v19 = Length + v18;
  ACFULogging::handleMessage((uint64_t)v15, 4u, "%s::%s: paging in new length for page alignment (Requested: %zu. Aligned: %zu)\n", v20, v21, v22, v23, v24, (char)"ACFUDataContainer");
  uint64_t v25 = (UInt8 *)mmap(0, Length + v18, 3, 1, *((_DWORD *)this + 2), v17);
  if (v25 == (UInt8 *)-1)
  {
    uint64_t v50 = ACFULogging::getLogInstance((ACFULogging *)0xFFFFFFFFFFFFFFFFLL);
    uint64_t v58 = __error();
    strerror(*v58);
    uint64_t v57 = "%s::%s: failed to map file: (%s)\n";
    goto LABEL_39;
  }
  uint64_t v26 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], &v25[v18], Length, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  BytePtr = CFDataGetBytePtr(a2);
  CFIndex v28 = CFDataGetLength(a2);
  v71.location = 0;
  v71.length = Length;
  CFDataReplaceBytes(v26, v71, BytePtr, v28);
  uint64_t v29 = (ACFULogging *)munmap(v25, v19);
  if (v29 == -1)
  {
    uint64_t v30 = ACFULogging::getLogInstance(v29);
    uint64_t v31 = __error();
    strerror(*v31);
    ACFULogging::handleMessage((uint64_t)v30, 4u, "%s::%s: failed to un-map file: (%s)\n", v32, v33, v34, v35, v36, (char)"ACFUDataContainer");
  }
  if (*((unsigned char *)this + 24))
  {
LABEL_24:
    uint64_t v41 = 1;
    if (!v26) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (*(void *)this)
  {
    if (CFDataGetLength(*(CFDataRef *)this) < v11)
    {
      uint64_t v37 = *(__CFData **)this;
      CFIndex v38 = CFDataGetLength(*(CFDataRef *)this);
      CFDataIncreaseLength(v37, v11 - v38);
    }
    uint64_t v39 = *(__CFData **)this;
    uint64_t v40 = CFDataGetBytePtr(a2);
    v72.location = v16;
    v72.length = Length;
    CFDataReplaceBytes(v39, v72, v40, Length);
    goto LABEL_24;
  }
  uint64_t v60 = ACFULogging::getLogInstance(0);
  ACFULogging::handleMessage((uint64_t)v60, 2u, "%s::%s: object does not hold any data\n", v61, v62, v63, v64, v65, (char)"ACFUDataContainer");
  uint64_t v41 = 0;
  if (v26) {
LABEL_25:
  }
    CFRelease(v26);
LABEL_26:
  if (SHIBYTE(v69) < 0) {
    operator delete(__p[0]);
  }
  return v41;
}

void sub_22EF05564(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ACFUDataContainer::writeData(uint64_t a1, const void ***a2, unsigned int a3)
{
  CFURLRef v6 = (ACFULogging *)std::string::basic_string[abi:ne180100]<0>(__p, "");
  if (!*(unsigned char *)(a1 + 25))
  {
    LogInstance = ACFULogging::getLogInstance(v6);
    uint64_t v45 = "%s::%s: file does not have write permissions\n";
LABEL_39:
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v45, v40, v41, v42, v43, v44, (char)"ACFUDataContainer");
    goto LABEL_40;
  }
  if (!*a2)
  {
    LogInstance = ACFULogging::getLogInstance(v6);
    uint64_t v45 = "%s::%s: invalid file data\n";
    goto LABEL_39;
  }
  CFURLRef v7 = *(ACFULogging **)(a1 + 16);
  if (!v7)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    uint64_t v45 = "%s::%s: file path has not been initialized\n";
    goto LABEL_39;
  }
  if ((*(_DWORD *)(a1 + 8) & 0x80000000) != 0)
  {
    LogInstance = ACFULogging::getLogInstance(v7);
    uint64_t v45 = "%s::%s: invalid file descriptor\n";
    goto LABEL_39;
  }
  size_t v8 = (size_t)(*a2)[1];
  if (!v8)
  {
    LogInstance = ACFULogging::getLogInstance(v7);
    uint64_t v45 = "%s::%s: invalid length\n";
    goto LABEL_39;
  }
  ACFUCommon::stringFromCFString((const __CFString *)v7, &v56);
  if (SHIBYTE(v59) < 0) {
    operator delete(__p[0]);
  }
  uint64_t v59 = v57;
  *(_OWORD *)std::string __p = v56;
  if ((SHIBYTE(v57) & 0x80000000) == 0)
  {
    if (HIBYTE(v57))
    {
      uint64_t v10 = __p;
      goto LABEL_13;
    }
    goto LABEL_33;
  }
  if (!__p[1])
  {
LABEL_33:
    LogInstance = ACFULogging::getLogInstance(v9);
    uint64_t v45 = "%s::%s: failed to acquire file path c string\n";
    goto LABEL_39;
  }
  uint64_t v10 = (void **)__p[0];
LABEL_13:
  off_t v11 = (ACFULogging *)stat((const char *)v10, &v60);
  if (v11 == -1)
  {
    uint64_t v46 = ACFULogging::getLogInstance(v11);
    uint64_t v47 = __error();
    strerror(*v47);
    uint64_t v53 = "%s::%s: failed to obtain file stats: (%s)\n";
  }
  else
  {
    off_t v12 = v8 + a3;
    if ((unint64_t)v12 > v60.st_size
      && (uint64_t v13 = (ACFULogging *)ftruncate(*(_DWORD *)(a1 + 8), v8 + a3), v13))
    {
      uint64_t v46 = ACFULogging::getLogInstance(v13);
      uint64_t v55 = __error();
      strerror(*v55);
      uint64_t v53 = "%s::%s: failed to increase file length: (%s)\n";
    }
    else
    {
      uint64_t v14 = sysconf(29);
      uint64_t v15 = (ACFULogging *)sysconf(29);
      CFIndex v16 = ACFULogging::getLogInstance(v15);
      CFIndex v17 = a3;
      off_t v18 = ((double)(uint64_t)v15 * (double)(a3 / v14));
      uint64_t v19 = a3 - v18;
      ACFULogging::handleMessage((uint64_t)v16, 4u, "%s::%s: paging in new length for page alignment (Requested: %zu. Aligned: %zu)\n", v20, v21, v22, v23, v24, (char)"ACFUDataContainer");
      uint64_t v25 = (char *)mmap(0, v8 + v19, 3, 1, *(_DWORD *)(a1 + 8), v18);
      uint64_t v26 = v25;
      if (v25 != (char *)-1)
      {
        memcpy(&v25[v19], **a2, v8);
        uint64_t v27 = (ACFULogging *)munmap(v26, v8 + v19);
        if (v27 == -1)
        {
          CFIndex v28 = ACFULogging::getLogInstance(v27);
          uint64_t v29 = __error();
          strerror(*v29);
          ACFULogging::handleMessage((uint64_t)v28, 4u, "%s::%s: failed to un-map file: (%s)\n", v30, v31, v32, v33, v34, (char)"ACFUDataContainer");
        }
        if (*(unsigned char *)(a1 + 24)) {
          goto LABEL_24;
        }
        if (*(void *)a1)
        {
          if (CFDataGetLength(*(CFDataRef *)a1) < v12)
          {
            uint64_t v35 = *(__CFData **)a1;
            CFIndex Length = CFDataGetLength(*(CFDataRef *)a1);
            CFDataIncreaseLength(v35, v12 - Length);
          }
          v61.location = v17;
          v61.length = v8;
          CFDataReplaceBytes(*(CFMutableDataRef *)a1, v61, (const UInt8 *)**a2, v8);
LABEL_24:
          uint64_t v37 = 1;
          goto LABEL_25;
        }
        LogInstance = ACFULogging::getLogInstance(0);
        uint64_t v45 = "%s::%s: object does not hold any data\n";
        goto LABEL_39;
      }
      uint64_t v46 = ACFULogging::getLogInstance((ACFULogging *)0xFFFFFFFFFFFFFFFFLL);
      uint64_t v54 = __error();
      strerror(*v54);
      uint64_t v53 = "%s::%s: failed to map file: (%s)\n";
    }
  }
  ACFULogging::handleMessage((uint64_t)v46, 2u, v53, v48, v49, v50, v51, v52, (char)"ACFUDataContainer");
LABEL_40:
  uint64_t v37 = 0;
LABEL_25:
  if (SHIBYTE(v59) < 0) {
    operator delete(__p[0]);
  }
  return v37;
}

void sub_22EF058C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ACFUDataContainer::writeData(ACFUDataContainer *this, const unsigned __int8 *a2, unsigned int a3, size_t a4)
{
  size_t v8 = (ACFULogging *)std::string::basic_string[abi:ne180100]<0>(__p, "");
  if (!a2 || !a4)
  {
    LogInstance = ACFULogging::getLogInstance(v8);
    uint64_t v46 = "%s::%s: invalid data, length value\n";
LABEL_36:
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v46, v41, v42, v43, v44, v45, (char)"ACFUDataContainer");
    goto LABEL_37;
  }
  int v9 = (ACFULogging *)*((void *)this + 2);
  if (!v9)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    uint64_t v46 = "%s::%s: file path has not been initialized\n";
    goto LABEL_36;
  }
  if ((*((_DWORD *)this + 2) & 0x80000000) != 0)
  {
    LogInstance = ACFULogging::getLogInstance(v9);
    uint64_t v46 = "%s::%s: invalid file descriptor\n";
    goto LABEL_36;
  }
  ACFUCommon::stringFromCFString((const __CFString *)v9, &v57);
  if (SHIBYTE(v60) < 0) {
    operator delete(__p[0]);
  }
  uint64_t v60 = v58;
  *(_OWORD *)std::string __p = v57;
  if ((SHIBYTE(v58) & 0x80000000) == 0)
  {
    if (HIBYTE(v58))
    {
      off_t v11 = __p;
      goto LABEL_12;
    }
    goto LABEL_30;
  }
  if (!__p[1])
  {
LABEL_30:
    LogInstance = ACFULogging::getLogInstance(v10);
    uint64_t v46 = "%s::%s: failed to acquire file path c string\n";
    goto LABEL_36;
  }
  off_t v11 = (void **)__p[0];
LABEL_12:
  off_t v12 = (ACFULogging *)stat((const char *)v11, &v61);
  if (v12 == -1)
  {
    uint64_t v47 = ACFULogging::getLogInstance(v12);
    uint64_t v48 = __error();
    strerror(*v48);
    uint64_t v54 = "%s::%s: failed to obtain file stats: (%s)\n";
  }
  else
  {
    off_t v13 = a4 + a3;
    if ((unint64_t)v13 > v61.st_size
      && (uint64_t v14 = (ACFULogging *)ftruncate(*((_DWORD *)this + 2), a4 + a3), v14))
    {
      uint64_t v47 = ACFULogging::getLogInstance(v14);
      long long v56 = __error();
      strerror(*v56);
      uint64_t v54 = "%s::%s: failed to increase file length: (%s)\n";
    }
    else
    {
      uint64_t v15 = sysconf(29);
      CFIndex v16 = (ACFULogging *)sysconf(29);
      CFIndex v17 = ACFULogging::getLogInstance(v16);
      CFIndex v18 = a3;
      off_t v19 = ((double)(uint64_t)v16 * (double)(a3 / v15));
      uint64_t v20 = a3 - v19;
      ACFULogging::handleMessage((uint64_t)v17, 4u, "%s::%s: paging in new length for page alignment (Requested: %zu. Aligned: %zu)\n", v21, v22, v23, v24, v25, (char)"ACFUDataContainer");
      uint64_t v26 = (char *)mmap(0, v20 + a4, 3, 1, *((_DWORD *)this + 2), v19);
      uint64_t v27 = v26;
      if (v26 != (char *)-1)
      {
        memcpy(&v26[v20], a2, a4);
        CFIndex v28 = (ACFULogging *)munmap(v27, v20 + a4);
        if (v28 == -1)
        {
          uint64_t v29 = ACFULogging::getLogInstance(v28);
          uint64_t v30 = __error();
          strerror(*v30);
          ACFULogging::handleMessage((uint64_t)v29, 4u, "%s::%s: failed to un-map file: (%s)\n", v31, v32, v33, v34, v35, (char)"ACFUDataContainer");
        }
        if (*((unsigned char *)this + 24)) {
          goto LABEL_23;
        }
        if (*(void *)this)
        {
          if (CFDataGetLength(*(CFDataRef *)this) < v13)
          {
            uint64_t v36 = *(__CFData **)this;
            CFIndex Length = CFDataGetLength(*(CFDataRef *)this);
            CFDataIncreaseLength(v36, v13 - Length);
          }
          v62.location = v18;
          v62.length = a4;
          CFDataReplaceBytes(*(CFMutableDataRef *)this, v62, a2, a4);
LABEL_23:
          uint64_t v38 = 1;
          goto LABEL_24;
        }
        LogInstance = ACFULogging::getLogInstance(0);
        uint64_t v46 = "%s::%s: object does not hold any data\n";
        goto LABEL_36;
      }
      uint64_t v47 = ACFULogging::getLogInstance((ACFULogging *)0xFFFFFFFFFFFFFFFFLL);
      uint64_t v55 = __error();
      strerror(*v55);
      uint64_t v54 = "%s::%s: failed to map file: (%s)\n";
    }
  }
  ACFULogging::handleMessage((uint64_t)v47, 2u, v54, v49, v50, v51, v52, v53, (char)"ACFUDataContainer");
LABEL_37:
  uint64_t v38 = 0;
LABEL_24:
  if (SHIBYTE(v60) < 0) {
    operator delete(__p[0]);
  }
  return v38;
}

void sub_22EF05BF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ACFUDataContainer::getData(ACFUDataContainer *this)
{
  if (!*((unsigned char *)this + 24)) {
    return *(void *)this;
  }
  LogInstance = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: cannot aquire reference for a memory optimized data container. Please use copyData() instead\n", v2, v3, v4, v5, v6, (char)"ACFUDataContainer");
  return 0;
}

uint64_t ACFUDataContainer::isOptimized(ACFUDataContainer *this)
{
  return *((unsigned __int8 *)this + 24);
}

void ACFUDataContainer::~ACFUDataContainer(ACFUDataContainer *this)
{
  int v2 = *((_DWORD *)this + 2);
  if ((v2 & 0x80000000) == 0) {
    close(v2);
  }
  if (*(void *)this)
  {
    CFRelease(*(CFTypeRef *)this);
    *(void *)this = 0;
  }
  uint64_t v3 = (const void *)*((void *)this + 2);
  if (v3)
  {
    CFRelease(v3);
    *((void *)this + 2) = 0;
  }
}

uint64_t ACFUCommon::Parameter::Parameter(uint64_t this)
{
  *(void *)this = 0;
  *(unsigned char *)(this + 8) = 0;
  return this;
}

{
  *(void *)this = 0;
  *(unsigned char *)(this + 8) = 0;
  return this;
}

off_t ACFUCommon::getFileSize(ACFUCommon *this, const __CFURL *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  bzero(buffer, 0x400uLL);
  uint64_t v3 = (ACFULogging *)CFURLGetFileSystemRepresentation(this, 1u, buffer, 1024);
  if (!v3)
  {
    LogInstance = ACFULogging::getLogInstance(v3);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to get file system reprensetation\n", v10, v11, v12, v13, v14, (char)"ACFUCommon");
    off_t st_size = 0;
    int v5 = -1;
    goto LABEL_5;
  }
  uint64_t v4 = (ACFULogging *)open((const char *)buffer, 0);
  int v5 = (int)v4;
  if ((v4 & 0x80000000) != 0)
  {
    uint64_t v15 = ACFULogging::getLogInstance(v4);
    CFIndex v16 = __error();
    strerror(*v16);
    ACFULogging::handleMessage((uint64_t)v15, 2u, "%s::%s: failed to open file (%s)\n", v17, v18, v19, v20, v21, (char)"ACFUCommon");
    off_t st_size = 0;
    goto LABEL_5;
  }
  uint64_t v6 = (ACFULogging *)fstat((int)v4, &v28);
  if (v6)
  {
    uint64_t v22 = ACFULogging::getLogInstance(v6);
    ACFULogging::handleMessage((uint64_t)v22, 2u, "%s::%s: failed to get file stats\n", v23, v24, v25, v26, v27, (char)"ACFUCommon");
    off_t st_size = 0;
    if (!v5) {
      return st_size;
    }
    goto LABEL_5;
  }
  off_t st_size = v28.st_size;
  if (v5) {
LABEL_5:
  }
    close(v5);
  return st_size;
}

void ACFUCommon::Parameter::dataAsString(CFDataRef *this@<X0>, int a2@<W1>, void *a3@<X8>)
{
  CFDataRef v5 = *this;
  if (v5)
  {
    BytePtr = CFDataGetBytePtr(v5);
    unsigned int Length = CFDataGetLength(*this);
    size_t v9 = 3 * Length + 1;
    uint64_t v10 = (ACFULogging *)operator new[](v9, MEMORY[0x263F8C180]);
    uint64_t v11 = v10;
    if (BytePtr) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      uint64_t v13 = "BORKED";
    }
    else
    {
      if (3 * Length == -1)
      {
        LogInstance = ACFULogging::getLogInstance(v10);
        ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: invalid destination size indicated\n", v24, v25, v26, v27, v28, (char)"ACFUCommon");
        std::string::basic_string[abi:ne180100]<0>(a3, "BORKED");
LABEL_27:
        operator delete[](v11);
        return;
      }
      unint64_t v14 = Length;
      if (((2 * Length) | 1uLL) > v9) {
        unint64_t v14 = (v9 - 1) >> 1;
      }
      unint64_t v15 = v14 - 1;
      if (a2) {
        LODWORD(v16) = 0;
      }
      else {
        LODWORD(v16) = v15;
      }
      if ((a2 & 1) != 0 || (uint64_t v17 = v10, (v16 & 0x80000000) == 0))
      {
        unint64_t v16 = (int)v16;
        uint64_t v18 = 1;
        if (!a2) {
          uint64_t v18 = -1;
        }
        uint64_t v19 = v10;
        do
        {
          unint64_t v20 = BytePtr[v16];
          char v21 = a0123456789abcd[v20 & 0xF];
          *(unsigned char *)uint64_t v19 = a0123456789abcd[v20 >> 4];
          uint64_t v17 = (ACFULogging *)((char *)v19 + 2);
          *((unsigned char *)v19 + 1) = v21;
          v16 += v18;
          BOOL v22 = (v16 & 0x8000000000000000) == 0;
          if (a2) {
            BOOL v22 = v15 >= v16;
          }
          uint64_t v19 = (ACFULogging *)((char *)v19 + 2);
        }
        while (v22);
      }
      *(unsigned char *)uint64_t v17 = 0;
      uint64_t v13 = (char *)v10;
    }
    std::string::basic_string[abi:ne180100]<0>(a3, v13);
    if (!v11) {
      return;
    }
    goto LABEL_27;
  }
  std::string::basic_string[abi:ne180100]<0>(a3, "");
}

CFIndex ACFUCommon::Parameter::dataLength(ACFUCommon::Parameter *this)
{
  if (*((unsigned char *)this + 8) && (CFDataRef v1 = *(const __CFData **)this) != 0) {
    return CFDataGetLength(v1);
  }
  else {
    return 0;
  }
}

const UInt8 *ACFUCommon::Parameter::dataBytePtr(ACFUCommon::Parameter *this)
{
  if (*((unsigned char *)this + 8) && (CFDataRef v1 = *(const __CFData **)this) != 0) {
    return CFDataGetBytePtr(v1);
  }
  else {
    return 0;
  }
}

void ACFUCommon::Parameter::~Parameter(const void **this)
{
  int v2 = *this;
  if (v2)
  {
    CFRelease(v2);
    *this = 0;
  }
}

uint64_t ACFUCommon::PersonalizeParams::PersonalizeParams(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26E27FCC8;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(unsigned char *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(unsigned char *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  *(unsigned char *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = 0;
  *(unsigned char *)(a1 + 144) = 0;
  *(void *)(a1 + 152) = 0;
  *(unsigned char *)(a1 + 160) = 0;
  *(void *)(a1 + 168) = 0;
  *(void *)(a1 + 184) = 0;
  *(void *)(a1 + 192) = 0;
  uint64_t v3 = (void *)(a1 + 184);
  v3[2] = 0;
  CFDataRef v5 = *(const void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unint64_t v6 = (v4 - *(void *)a2) >> 3;
  *(unsigned char *)(a1 + 176) = 0;
  std::vector<__CFString const*>::__init_with_size[abi:ne180100]<__CFString const**,__CFString const**>(v3, v5, v4, v6);
  return a1;
}

void sub_22EF061A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, const void **a9, const void **a10)
{
  ACFUCommon::Parameter::~Parameter(v11);
  ACFUCommon::Parameter::~Parameter(v10);
  ACFUCommon::Parameter::~Parameter(v18);
  ACFUCommon::Parameter::~Parameter(v17);
  ACFUCommon::Parameter::~Parameter(v16);
  ACFUCommon::Parameter::~Parameter(v15);
  ACFUCommon::Parameter::~Parameter(v14);
  ACFUCommon::Parameter::~Parameter(v13);
  ACFUCommon::Parameter::~Parameter(v12);
  ACFUCommon::Parameter::~Parameter(a9);
  ACFUCommon::Parameter::~Parameter(a10);
  _Unwind_Resume(a1);
}

uint64_t ACFUCommon::PersonalizeParams::getParametersDictionary(ACFUCommon::PersonalizeParams *this)
{
  return (**(uint64_t (***)(ACFUCommon::PersonalizeParams *))this)(this);
}

__CFDictionary *ACFUCommon::PersonalizeParams::copyParametersDictionary(ACFUCommon::PersonalizeParams *this)
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    for (uint64_t i = (CFStringRef *)*((void *)this + 23); i != *((CFStringRef **)this + 24); ++i)
    {
      location = (ACFULogging *)CFStringFind(*i, @",ChipID", 0).location;
      if (location != (ACFULogging *)-1)
      {
        if (*((unsigned char *)this + 16))
        {
          CFStringRef v5 = *i;
          unint64_t v6 = (const void *)*((void *)this + 1);
LABEL_46:
          CFDictionaryAddValue(Mutable, v5, v6);
          continue;
        }
        LogInstance = ACFULogging::getLogInstance(location);
        ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: Missing ChipID\n", v8, v9, v10, v11, v12, (char)"ACFUCommon");
      }
      uint64_t v13 = (ACFULogging *)CFStringFind(*i, @",BoardID", 0).location;
      if (v13 != (ACFULogging *)-1)
      {
        if (*((unsigned char *)this + 32))
        {
          CFStringRef v5 = *i;
          unint64_t v6 = (const void *)*((void *)this + 3);
          goto LABEL_46;
        }
        unint64_t v14 = ACFULogging::getLogInstance(v13);
        ACFULogging::handleMessage((uint64_t)v14, 2u, "%s::%s: Missing BoardID\n", v15, v16, v17, v18, v19, (char)"ACFUCommon");
      }
      unint64_t v20 = (ACFULogging *)CFStringFind(*i, @",SecurityDomain", 0).location;
      if (v20 != (ACFULogging *)-1)
      {
        if (*((unsigned char *)this + 144))
        {
          CFStringRef v5 = *i;
          unint64_t v6 = (const void *)*((void *)this + 17);
          goto LABEL_46;
        }
        char v21 = ACFULogging::getLogInstance(v20);
        ACFULogging::handleMessage((uint64_t)v21, 2u, "%s::%s: Missing SecurityDomain\n", v22, v23, v24, v25, v26, (char)"ACFUCommon");
      }
      uint64_t v27 = (ACFULogging *)CFStringFind(*i, @",ECID", 0).location;
      if (v27 != (ACFULogging *)-1)
      {
        if (*((unsigned char *)this + 48))
        {
          CFStringRef v5 = *i;
          unint64_t v6 = (const void *)*((void *)this + 5);
          goto LABEL_46;
        }
        uint64_t v28 = ACFULogging::getLogInstance(v27);
        ACFULogging::handleMessage((uint64_t)v28, 2u, "%s::%s: Missing ECID\n", v29, v30, v31, v32, v33, (char)"ACFUCommon");
      }
      uint64_t v34 = (ACFULogging *)CFStringFind(*i, @",ProductionMode", 0).location;
      if (v34 != (ACFULogging *)-1)
      {
        if (*((unsigned char *)this + 96))
        {
          CFStringRef v5 = *i;
          unint64_t v6 = (const void *)*((void *)this + 11);
          goto LABEL_46;
        }
        uint64_t v35 = ACFULogging::getLogInstance(v34);
        ACFULogging::handleMessage((uint64_t)v35, 2u, "%s::%s: Missing ProductionMode\n", v36, v37, v38, v39, v40, (char)"ACFUCommon");
      }
      uint64_t v41 = (ACFULogging *)CFStringFind(*i, @",SecurityMode", 0).location;
      if (v41 != (ACFULogging *)-1)
      {
        if (*((unsigned char *)this + 112))
        {
          CFStringRef v5 = *i;
          unint64_t v6 = (const void *)*((void *)this + 13);
          goto LABEL_46;
        }
        uint64_t v42 = ACFULogging::getLogInstance(v41);
        ACFULogging::handleMessage((uint64_t)v42, 2u, "%s::%s: Missing SecurityMode\n", v43, v44, v45, v46, v47, (char)"ACFUCommon");
      }
      uint64_t v48 = (ACFULogging *)CFStringFind(*i, @",UID_MODE", 0).location;
      if (v48 != (ACFULogging *)-1)
      {
        if (*((unsigned char *)this + 128))
        {
          CFStringRef v5 = *i;
          unint64_t v6 = (const void *)*((void *)this + 15);
          goto LABEL_46;
        }
        uint64_t v49 = ACFULogging::getLogInstance(v48);
        ACFULogging::handleMessage((uint64_t)v49, 2u, "%s::%s: Missing UID_MODE\n", v50, v51, v52, v53, v54, (char)"ACFUCommon");
      }
      uint64_t v55 = (ACFULogging *)CFStringFind(*i, @",Nonce", 0).location;
      if (v55 != (ACFULogging *)-1)
      {
        if (*((unsigned char *)this + 64))
        {
          CFStringRef v5 = *i;
          unint64_t v6 = (const void *)*((void *)this + 7);
          goto LABEL_46;
        }
        long long v56 = ACFULogging::getLogInstance(v55);
        ACFULogging::handleMessage((uint64_t)v56, 2u, "%s::%s: Missing NonceHash\n", v57, v58, v59, v60, v61, (char)"ACFUCommon");
      }
      CFRange v62 = (ACFULogging *)CFStringFind(*i, @",RestoreBootNonce", 0).location;
      if (v62 != (ACFULogging *)-1)
      {
        if (*((unsigned char *)this + 80))
        {
          CFStringRef v5 = *i;
          unint64_t v6 = (const void *)*((void *)this + 9);
          goto LABEL_46;
        }
        uint64_t v63 = ACFULogging::getLogInstance(v62);
        ACFULogging::handleMessage((uint64_t)v63, 2u, "%s::%s: Missing BootNonce\n", v64, v65, v66, v67, v68, (char)"ACFUCommon");
      }
      uint64_t v69 = (ACFULogging *)CFStringFind(*i, @",ChipRev", 0).location;
      if (v69 != (ACFULogging *)-1)
      {
        if (*((unsigned char *)this + 176))
        {
          CFStringRef v5 = *i;
          unint64_t v6 = (const void *)*((void *)this + 21);
          goto LABEL_46;
        }
        stat v70 = ACFULogging::getLogInstance(v69);
        ACFULogging::handleMessage((uint64_t)v70, 2u, "%s::%s: Missing ChipRev\n", v71, v72, v73, v74, v75, (char)"ACFUCommon");
      }
      uint64_t v76 = (ACFULogging *)CFStringFind(*i, @",MinEpoch", 0).location;
      if (v76 != (ACFULogging *)-1)
      {
        if (!*((unsigned char *)this + 160))
        {
          uint64_t v77 = ACFULogging::getLogInstance(v76);
          ACFULogging::handleMessage((uint64_t)v77, 2u, "%s::%s: Missing MinEpoch\n", v78, v79, v80, v81, v82, (char)"ACFUCommon");
          continue;
        }
        CFStringRef v5 = *i;
        unint64_t v6 = (const void *)*((void *)this + 19);
        goto LABEL_46;
      }
    }
  }
  else
  {
    uint64_t v83 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v83, 2u, "%s::%s: failed to allocate ouptut dictionary\n", v84, v85, v86, v87, v88, (char)"ACFUCommon");
  }
  return Mutable;
}

BOOL ACFUCommon::PersonalizeParams::hasAllRequiredParameters(ACFUCommon::PersonalizeParams *this)
{
  return *((unsigned char *)this + 16)
      && *((unsigned char *)this + 32)
      && *((unsigned char *)this + 48)
      && *((unsigned char *)this + 80)
      && *((unsigned char *)this + 64)
      && *((unsigned char *)this + 96)
      && *((unsigned char *)this + 112)
      && *((unsigned char *)this + 144) != 0;
}

void ACFUCommon::PersonalizeParams::logParameters(CFDataRef *this)
{
  if (*((unsigned char *)this + 16))
  {
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)this);
    ACFUCommon::Parameter::dataAsString(this + 1, 0, __p);
    ACFULogging::handleMessage((uint64_t)LogInstance, 0, "%s::%s: ChipID: 0x%s\n", v3, v4, v5, v6, v7, (char)"ACFUCommon");
    if (v76 < 0) {
      operator delete(__p[0]);
    }
  }
  if (*((unsigned char *)this + 32))
  {
    uint64_t v8 = ACFULogging::getLogInstance((ACFULogging *)this);
    ACFUCommon::Parameter::dataAsString(this + 3, 0, __p);
    ACFULogging::handleMessage((uint64_t)v8, 0, "%s::%s: BoardID: 0x%s\n", v9, v10, v11, v12, v13, (char)"ACFUCommon");
    if (v76 < 0) {
      operator delete(__p[0]);
    }
  }
  if (*((unsigned char *)this + 48))
  {
    unint64_t v14 = ACFULogging::getLogInstance((ACFULogging *)this);
    ACFUCommon::Parameter::dataAsString(this + 5, 0, __p);
    ACFULogging::handleMessage((uint64_t)v14, 0, "%s::%s: ECID: 0x%s\n", v15, v16, v17, v18, v19, (char)"ACFUCommon");
    if (v76 < 0) {
      operator delete(__p[0]);
    }
  }
  if (*((unsigned char *)this + 80))
  {
    unint64_t v20 = ACFULogging::getLogInstance((ACFULogging *)this);
    ACFUCommon::Parameter::dataAsString(this + 9, 0, __p);
    ACFULogging::handleMessage((uint64_t)v20, 0, "%s::%s: Boot Nonce: 0x%s\n", v21, v22, v23, v24, v25, (char)"ACFUCommon");
    if (v76 < 0) {
      operator delete(__p[0]);
    }
  }
  if (*((unsigned char *)this + 64))
  {
    uint64_t v26 = ACFULogging::getLogInstance((ACFULogging *)this);
    ACFUCommon::Parameter::dataAsString(this + 7, 1, __p);
    ACFULogging::handleMessage((uint64_t)v26, 0, "%s::%s: Boot Nonce Hash: 0x%s\n", v27, v28, v29, v30, v31, (char)"ACFUCommon");
    if (v76 < 0) {
      operator delete(__p[0]);
    }
  }
  if (*((unsigned char *)this + 96))
  {
    uint64_t v32 = ACFULogging::getLogInstance((ACFULogging *)this);
    ACFUCommon::Parameter::dataAsString(this + 11, 0, __p);
    ACFULogging::handleMessage((uint64_t)v32, 0, "%s::%s: Production Mode: 0x%s\n", v33, v34, v35, v36, v37, (char)"ACFUCommon");
    if (v76 < 0) {
      operator delete(__p[0]);
    }
  }
  if (*((unsigned char *)this + 112))
  {
    uint64_t v38 = ACFULogging::getLogInstance((ACFULogging *)this);
    ACFUCommon::Parameter::dataAsString(this + 13, 0, __p);
    ACFULogging::handleMessage((uint64_t)v38, 0, "%s::%s: Security Mode: 0x%s\n", v39, v40, v41, v42, v43, (char)"ACFUCommon");
    if (v76 < 0) {
      operator delete(__p[0]);
    }
  }
  if (*((unsigned char *)this + 128))
  {
    uint64_t v44 = ACFULogging::getLogInstance((ACFULogging *)this);
    ACFUCommon::Parameter::dataAsString(this + 15, 0, __p);
    ACFULogging::handleMessage((uint64_t)v44, 0, "%s::%s: UID Mode: 0x%s\n", v45, v46, v47, v48, v49, (char)"ACFUCommon");
    if (v76 < 0) {
      operator delete(__p[0]);
    }
  }
  if (*((unsigned char *)this + 144))
  {
    uint64_t v50 = ACFULogging::getLogInstance((ACFULogging *)this);
    ACFUCommon::Parameter::dataAsString(this + 17, 0, __p);
    ACFULogging::handleMessage((uint64_t)v50, 0, "%s::%s: Security Domain: 0x%s\n", v51, v52, v53, v54, v55, (char)"ACFUCommon");
    if (v76 < 0) {
      operator delete(__p[0]);
    }
  }
  if (*((unsigned char *)this + 160))
  {
    long long v56 = ACFULogging::getLogInstance((ACFULogging *)this);
    ACFUCommon::Parameter::dataAsString(this + 19, 0, __p);
    ACFULogging::handleMessage((uint64_t)v56, 0, "%s::%s: Minimum Epoch: 0x%s\n", v57, v58, v59, v60, v61, (char)"ACFUCommon");
    if (v76 < 0) {
      operator delete(__p[0]);
    }
  }
  if (*((unsigned char *)this + 176))
  {
    CFRange v62 = ACFULogging::getLogInstance((ACFULogging *)this);
    ACFUCommon::Parameter::dataAsString(this + 21, 0, __p);
    ACFUCommon::PersonalizeParams::getPrettyChipRevision((ACFUCommon::PersonalizeParams *)this, &v74);
    ACFULogging::handleMessage((uint64_t)v62, 0, "%s::%s: Chip Revision: 0x%s (%s)\n", v63, v64, v65, v66, v67, (char)"ACFUCommon");
    if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v74.__r_.__value_.__l.__data_);
    }
    if (v76 < 0) {
      operator delete(__p[0]);
    }
  }
  uint64_t v68 = ACFULogging::getLogInstance((ACFULogging *)this);
  ACFUCommon::PersonalizeParams::getFusingConfig((ACFUCommon::PersonalizeParams *)this, __p);
  ACFULogging::handleMessage((uint64_t)v68, 0, "%s::%s: Fusing Config: %s\n", v69, v70, v71, v72, v73, (char)"ACFUCommon");
  if (v76 < 0) {
    operator delete(__p[0]);
  }
}

void sub_22EF06BA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  if (a24 < 0) {
    operator delete(a19);
  }
  _Unwind_Resume(exception_object);
}

void ACFUCommon::PersonalizeParams::getPrettyChipRevision(ACFUCommon::PersonalizeParams *this@<X0>, std::string *a2@<X8>)
{
  std::string::basic_string[abi:ne180100]<0>(a2, "Unknown");
  __int16 v11 = 0;
  DataAs = ACFUCommon::Parameter::GetDataAsType<unsigned short>((uint64_t)this + 168, &v11);
  if (DataAs)
  {
    std::string::operator=(a2, (v11 >> 4) + 65);
    std::string::push_back(a2, v11 & 0xF | 0x30);
  }
  else
  {
    LogInstance = ACFULogging::getLogInstance(DataAs);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to retrieve chip revision value\n", v6, v7, v8, v9, v10, (char)"ACFUCommon");
  }
}

void sub_22EF06CA8(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void ACFUCommon::PersonalizeParams::getFusingConfig(ACFUCommon::PersonalizeParams *this@<X0>, void *a2@<X8>)
{
  std::string::basic_string[abi:ne180100]<0>(a2, "Unknown");
  __int16 v16 = 0;
  unsigned __int8 v15 = 0;
  if (!*((unsigned char *)this + 96) || !*((unsigned char *)this + 112) || !*((unsigned char *)this + 144)) {
    return;
  }
  DataAs = ACFUCommon::Parameter::GetDataAsType<unsigned char>((uint64_t)this + 88, (unsigned char *)&v16 + 1);
  if ((DataAs & 1) == 0)
  {
    LogInstance = ACFULogging::getLogInstance(DataAs);
    unint64_t v14 = "%s::%s: failed to retrieve production mode value\n";
LABEL_14:
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v14, v9, v10, v11, v12, v13, (char)"ACFUCommon");
    return;
  }
  uint64_t v5 = ACFUCommon::Parameter::GetDataAsType<unsigned char>((uint64_t)this + 104, &v16);
  if ((v5 & 1) == 0)
  {
    LogInstance = ACFULogging::getLogInstance(v5);
    unint64_t v14 = "%s::%s: failed to retrieve security mode value\n";
    goto LABEL_14;
  }
  uint64_t v6 = ACFUCommon::Parameter::GetDataAsType<unsigned char>((uint64_t)this + 136, &v15);
  if ((v6 & 1) == 0)
  {
    LogInstance = ACFULogging::getLogInstance(v6);
    unint64_t v14 = "%s::%s: failed to retrieve security domain value\n";
    goto LABEL_14;
  }
  unsigned int v7 = (2 * v16) | (4 * HIBYTE(v16)) | v15;
  if (v7 <= 7 && ((0x8Bu >> v7) & 1) != 0) {
    MEMORY[0x230FAEBD0](a2, off_2649F94E8[v7]);
  }
}

void sub_22EF06DDC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

const __CFData *ACFUCommon::Parameter::GetDataAsType<unsigned char>(uint64_t a1, unsigned char *a2)
{
  if (!*(unsigned char *)(a1 + 8)) {
    return 0;
  }
  CFDataRef result = *(const __CFData **)a1;
  if (!result) {
    return result;
  }
  BytePtr = CFDataGetBytePtr(result);
  unint64_t Length = CFDataGetLength(*(CFDataRef *)a1);
  if (Length > 1) {
    return 0;
  }
  *a2 = 0;
  memcpy(a2, BytePtr, Length);
  return (const __CFData *)1;
}

const __CFData *ACFUCommon::Parameter::GetDataAsType<unsigned short>(uint64_t a1, _WORD *a2)
{
  if (!*(unsigned char *)(a1 + 8)) {
    return 0;
  }
  CFDataRef result = *(const __CFData **)a1;
  if (!result) {
    return result;
  }
  BytePtr = CFDataGetBytePtr(result);
  unint64_t Length = CFDataGetLength(*(CFDataRef *)a1);
  if (Length > 2) {
    return 0;
  }
  *a2 = 0;
  memcpy(a2, BytePtr, Length);
  return (const __CFData *)1;
}

void ACFUCommon::PersonalizeParams::~PersonalizeParams(ACFUCommon::PersonalizeParams *this)
{
  *(void *)this = &unk_26E27FCC8;
  int v2 = (void *)*((void *)this + 23);
  if (v2)
  {
    *((void *)this + 24) = v2;
    operator delete(v2);
  }
  ACFUCommon::Parameter::~Parameter((const void **)this + 21);
  ACFUCommon::Parameter::~Parameter((const void **)this + 19);
  ACFUCommon::Parameter::~Parameter((const void **)this + 17);
  ACFUCommon::Parameter::~Parameter((const void **)this + 15);
  ACFUCommon::Parameter::~Parameter((const void **)this + 13);
  ACFUCommon::Parameter::~Parameter((const void **)this + 11);
  ACFUCommon::Parameter::~Parameter((const void **)this + 9);
  ACFUCommon::Parameter::~Parameter((const void **)this + 7);
  ACFUCommon::Parameter::~Parameter((const void **)this + 5);
  ACFUCommon::Parameter::~Parameter((const void **)this + 3);
  ACFUCommon::Parameter::~Parameter((const void **)this + 1);
}

{
  void *v1;
  uint64_t vars8;

  ACFUCommon::PersonalizeParams::~PersonalizeParams(this);
  operator delete(v1);
}

uint64_t ACFUCommon::createURLByAppendingStrings(ACFUCommon *this, const __CFString *a2, const __CFString *a3)
{
  if (!this || !a2)
  {
    LogInstance = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed with bad input parameters\n", v13, v14, v15, v16, v17, (char)"ACFUCommon");
    return 0;
  }
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (!Mutable)
  {
    uint64_t v18 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v18, 2u, "%s::%s: failed to allocate strings to join array\n", v19, v20, v21, v22, v23, (char)"ACFUCommon");
    return 0;
  }
  unsigned int v7 = Mutable;
  CFArrayAppendValue(Mutable, this);
  CFArrayAppendValue(v7, a2);
  CFStringRef v8 = CFStringCreateByCombiningStrings(v5, v7, &stru_26E280B18);
  if (v8)
  {
    CFStringRef v9 = v8;
    uint64_t URLFromString = AMSupportCreateURLFromString();
    if (!URLFromString)
    {
      uint64_t v30 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v30, 2u, "%s::%s: failed to create url from string\n", v31, v32, v33, v34, v35, (char)"ACFUCommon");
    }
    CFRelease(v9);
  }
  else
  {
    uint64_t v24 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v24, 2u, "%s::%s: failed to append strings together\n", v25, v26, v27, v28, v29, (char)"ACFUCommon");
    uint64_t URLFromString = 0;
  }
  CFRelease(v7);
  return URLFromString;
}

uint64_t ACFUCommon::createFileDatafromFilePath(ACFUCommon *this, const __CFString *a2)
{
  if (!this)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: no file path provided.\n", v7, v8, v9, v10, v11, (char)"ACFUCommon");
    return 0;
  }
  uint64_t URLFromString = AMSupportCreateURLFromString();
  if (!URLFromString)
  {
    uint64_t v12 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v12, 2u, "%s::%s: failed to create url from string.\n", v13, v14, v15, v16, v17, (char)"ACFUCommon");
    return 0;
  }
  uint64_t v3 = (const void *)URLFromString;
  DataFromFileURL = (ACFULogging *)AMSupportCreateDataFromFileURL();
  if (DataFromFileURL)
  {
    uint64_t v18 = ACFULogging::getLogInstance(DataFromFileURL);
    ACFULogging::handleMessage((uint64_t)v18, 2u, "%s::%s: failed to create file data from file path (status: %u)\n", v19, v20, v21, v22, v23, (char)"ACFUCommon");
  }
  CFRelease(v3);
  return 0;
}

__CFData *ACFUCommon::createMutableFileDatafromFilePath(ACFUCommon *this, const __CFString *a2)
{
  uint64_t v2 = MEMORY[0x270FA5388](this, a2);
  uint64_t v68 = *MEMORY[0x263EF8340];
  bzero(__ptr, 0x1000uLL);
  if (!v2)
  {
    LogInstance = ACFULogging::getLogInstance(v3);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: no file path provided\n", v31, v32, v33, v34, v35, (char)"ACFUCommon");
    return 0;
  }
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t URLFromString = (ACFUCommon *)AMSupportCreateURLFromString();
  if (!URLFromString)
  {
    uint64_t v36 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v36, 2u, "%s::%s: failed to create url from string\n", v37, v38, v39, v40, v41, (char)"ACFUCommon");
    return 0;
  }
  CFURLRef v7 = URLFromString;
  off_t FileSize = ACFUCommon::getFileSize(URLFromString, v6);
  if (FileSize)
  {
    unint64_t v9 = FileSize;
    bzero(v67, 0x400uLL);
    uint64_t v10 = (ACFULogging *)CFURLGetFileSystemRepresentation(v7, 1u, v67, 1024);
    if (v10)
    {
      uint64_t v11 = (ACFULogging *)fopen((const char *)v67, "r");
      if (v11)
      {
        uint64_t v12 = (FILE *)v11;
        Mutable = CFDataCreateMutable(v4, 0);
        if (Mutable)
        {
          while (1)
          {
            uint64_t v14 = v9 >= 0x1000 ? 4096 : v9;
            uint64_t v15 = (ACFULogging *)fread(__ptr, 1uLL, v14, v12);
            if ((ACFULogging *)v14 != v15) {
              break;
            }
            uint64_t v16 = (ACFULogging *)feof(v12);
            if (v16 || (uint64_t v16 = (ACFULogging *)ferror(v12), (v16 & 0x80000000) != 0))
            {
              uint64_t v18 = ACFULogging::getLogInstance(v16);
              ferror(v12);
              ACFULogging::handleMessage((uint64_t)v18, 2u, "%s::%s: file i/o error (code: %d)\n", v19, v20, v21, v22, v23, (char)"ACFUCommon");
              goto LABEL_19;
            }
            CFDataAppendBytes(Mutable, __ptr, v14);
            v9 -= v14;
            if (!v9) {
              goto LABEL_14;
            }
          }
          uint64_t v24 = ACFULogging::getLogInstance(v15);
          ACFULogging::handleMessage((uint64_t)v24, 2u, "%s::%s: read less bytes than required (read: %zu, required: %zu)\n", v25, v26, v27, v28, v29, (char)"ACFUCommon");
LABEL_19:
          CFRelease(Mutable);
          Mutable = 0;
        }
        else
        {
          uint64_t v60 = ACFULogging::getLogInstance(0);
          ACFULogging::handleMessage((uint64_t)v60, 2u, "%s::%s: failed to create mutable data\n", v61, v62, v63, v64, v65, (char)"ACFUCommon");
        }
LABEL_14:
        fclose(v12);
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v48 = ACFULogging::getLogInstance(v10);
      ACFULogging::handleMessage((uint64_t)v48, 2u, "%s::%s: failed to get file system reprensetation\n", v49, v50, v51, v52, v53, (char)"ACFUCommon");
    }
    uint64_t v54 = ACFULogging::getLogInstance(v11);
    ACFULogging::handleMessage((uint64_t)v54, 2u, "%s::%s: bad input file parameters\n", v55, v56, v57, v58, v59, (char)"ACFUCommon");
  }
  else
  {
    uint64_t v42 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v42, 2u, "%s::%s: file is empty (file size: %zu)\n", v43, v44, v45, v46, v47, (char)"ACFUCommon");
  }
  Mutable = 0;
LABEL_15:
  CFRelease(v7);
  return Mutable;
}

void ACFUCommon::parseDebugArgs(ACFUCommon *this@<X0>, const __CFDictionary *a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v81 = 0u;
  if (!this)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: Empty options dict\n", v43, v44, v45, v46, v47, (char)"ACFUCommon");
LABEL_29:
    int v23 = 0;
    int v24 = 4006;
    goto LABEL_30;
  }
  if (!a2)
  {
    uint64_t v48 = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)v48, 2u, "%s::%s: Invalid arguments to parseDebugArgs\n", v49, v50, v51, v52, v53, (char)"ACFUCommon");
    int v23 = 0;
    int v24 = 4005;
    goto LABEL_30;
  }
  CFURLRef v6 = this;
  Value = (ACFULogging *)CFDictionaryGetValue(this, @"Options");
  uint64_t v8 = ACFULogging::getLogInstance(Value);
  if (Value) {
    uint64_t v14 = "%s::%s: Found updater options in dictionary\n";
  }
  else {
    uint64_t v14 = "%s::%s: Assuming updater options dictionary is being passed\n";
  }
  if (Value) {
    CFURLRef v6 = Value;
  }
  ACFULogging::handleMessage((uint64_t)v8, 3u, v14, v9, v10, v11, v12, v13, (char)"ACFUCommon");
  CFTypeID TypeID = CFDictionaryGetTypeID();
  uint64_t v16 = (ACFULogging *)CFGetTypeID(v6);
  if ((ACFULogging *)TypeID != v16)
  {
    uint64_t v54 = ACFULogging::getLogInstance(v16);
    ACFULogging::handleMessage((uint64_t)v54, 2u, "%s::%s: Invalid Type of Updater Options dict\n", v55, v56, v57, v58, v59, (char)"ACFUCommon");
LABEL_32:
    int v23 = 0;
    int v24 = 4002;
    goto LABEL_30;
  }
  CFStringRef v17 = (const __CFString *)CFDictionaryGetValue(v6, @"ACFUDebugArgs");
  if (!v17)
  {
    uint64_t v60 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v60, 2u, "%s::%s: Empty DebugArgs\n", v61, v62, v63, v64, v65, (char)"ACFUCommon");
    goto LABEL_29;
  }
  CFStringRef v18 = v17;
  CFTypeID v19 = CFStringGetTypeID();
  uint64_t v20 = (ACFULogging *)CFGetTypeID(v18);
  if ((ACFULogging *)v19 != v20)
  {
    uint64_t v66 = ACFULogging::getLogInstance(v20);
    ACFULogging::handleMessage((uint64_t)v66, 2u, "%s::%s: Invalid Type of DebugArgs\n", v67, v68, v69, v70, v71, (char)"ACFUCommon");
    goto LABEL_32;
  }
  CString = (ACFULogging *)CFStringGetCString(v18, buffer, 512, 0x8000100u);
  if (CString)
  {
    __stringp = buffer;
    uint64_t v22 = strsep(&__stringp, " ");
    if (v22)
    {
      int v23 = 0;
      int v24 = 4006;
      while (1)
      {
        size_t v25 = strlen((const char *)a2);
        uint64_t v26 = (ACFULogging *)strncmp(v22, (const char *)a2, v25);
        if (!v26)
        {
          BOOL v27 = v22[v25] == 61;
          uint64_t v28 = ACFULogging::getLogInstance(v26);
          if (!v27)
          {
            ACFULogging::handleMessage((uint64_t)v28, 2u, "%s::%s: Invalid token: %s\n", v29, v30, v31, v32, v33, (char)"ACFUCommon");
            goto LABEL_24;
          }
          ACFULogging::handleMessage((uint64_t)v28, 3u, "%s::%s: Token: %s\n", v29, v30, v31, v32, v33, (char)"ACFUCommon");
          uint64_t v34 = strchr(v22, 61);
          if (!v34)
          {
            uint64_t v36 = ACFULogging::getLogInstance(0);
            ACFULogging::handleMessage((uint64_t)v36, 2u, "%s::%s: Missing = for key: %s\n", v37, v38, v39, v40, v41, (char)"ACFUCommon");
            goto LABEL_24;
          }
          std::string::basic_string[abi:ne180100]<0>(&__str, v34 + 1);
          int v35 = std::stoul(&__str, 0, 0);
          if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__str.__r_.__value_.__l.__data_);
          }
          int v24 = 0;
          int v23 = v35;
        }
        uint64_t v22 = strsep(&__stringp, " ");
        if (!v22) {
          goto LABEL_30;
        }
      }
    }
    goto LABEL_29;
  }
  uint64_t v72 = ACFULogging::getLogInstance(CString);
  ACFULogging::handleMessage((uint64_t)v72, 2u, "%s::%s: Failed to get DebugArgs buffer\n", v73, v74, v75, v76, v77, (char)"ACFUCommon");
  int v23 = 0;
LABEL_24:
  int v24 = 4007;
LABEL_30:
  *a3 = v23;
  a3[1] = v24;
}

#error "22EF078E4: call analysis failed (funcsize=34)"

void ACFUCommon::stringFromCFString(const __CFString *this@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (this)
  {
    CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
    CStringPtr = CFStringGetCStringPtr(this, SystemEncoding);
    if (CStringPtr)
    {
      CFURLRef v7 = (char *)CStringPtr;
      uint64_t v8 = 0;
    }
    else
    {
      CFIndex v9 = CFStringGetLength(this) + 1;
      uint64_t v10 = (char *)malloc(v9);
      uint64_t v8 = v10;
      CFURLRef v7 = "";
      if (v10)
      {
        bzero(v10, v9);
        CFStringEncoding v11 = CFStringGetSystemEncoding();
        if (CFStringGetCString(this, v8, v9, v11)) {
          CFURLRef v7 = v8;
        }
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
    CFURLRef v7 = "";
  }
  std::string::basic_string[abi:ne180100]<0>(&v12, v7);
  *(_OWORD *)a2 = v12;
  a2[2] = v13;
  if (v8) {
    free(v8);
  }
}

uint64_t ACFUCommon::hexStringFromCFData(ACFUCommon *this, const __CFData *a2, int a3, int a4)
{
  int v6 = (int)a2;
  CFTypeID TypeID = (ACFULogging *)std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v30);
  if (!this || (CFTypeID v9 = CFGetTypeID(this), TypeID = (ACFULogging *)CFDataGetTypeID(), (ACFULogging *)v9 != TypeID))
  {
    LogInstance = ACFULogging::getLogInstance(TypeID);
    uint64_t v29 = "%s::%s: bad data\n";
LABEL_31:
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v29, v24, v25, v26, v27, v28, (char)"ACFUCommon");
    goto LABEL_25;
  }
  CFIndex Length = CFDataGetLength(this);
  CFIndex v11 = Length;
  if (Length < 0)
  {
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)Length);
    uint64_t v29 = "%s::%s: failed to get length\n";
    goto LABEL_31;
  }
  if (!Length) {
    goto LABEL_25;
  }
  if (!CFDataGetBytePtr(this))
  {
    LogInstance = ACFULogging::getLogInstance(0);
    uint64_t v29 = "%s::%s: failed to get byte ptr\n";
    goto LABEL_31;
  }
  int v12 = v11 - 1;
  if (!v6) {
    int v12 = 0;
  }
  BOOL v13 = v12 >= 0;
  if (!v6) {
    BOOL v13 = v11 > v12;
  }
  if (v13)
  {
    uint64_t v14 = v12;
    if (a4) {
      uint64_t v15 = std::uppercase[abi:ne180100];
    }
    else {
      uint64_t v15 = std::nouppercase[abi:ne180100];
    }
    if (v6) {
      uint64_t v16 = -1;
    }
    else {
      uint64_t v16 = 1;
    }
    do
    {
      v15((uint64_t)v31 + *(void *)(v31[0] - 24));
      v34[0] = 48;
      CFStringRef v17 = std::operator<<[abi:ne180100]<std::char_traits<char>>(v31, v34);
      uint64_t v18 = *v17;
      *(uint64_t *)((char *)v17 + *(void *)(*v17 - 24) + 24) = 2;
      *(_DWORD *)((char *)v17 + *(void *)(v18 - 24) + 8) = *(_DWORD *)((unsigned char *)v17 + *(void *)(v18 - 24) + 8) & 0xFFFFFFB5 | 8;
      std::ostream::operator<<();
      if (a3)
      {
        BOOL v19 = v14 < 1;
        if (!v6) {
          BOOL v19 = v11 - 1 <= v14;
        }
        if (!v19)
        {
          v34[0] = 32;
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)v34, 1);
        }
      }
      v14 += v16;
      BOOL v20 = v14 >= 0;
      if (!v6) {
        BOOL v20 = v11 > v14;
      }
    }
    while (v20);
  }
LABEL_25:
  std::stringbuf::str();
  v30[0] = *MEMORY[0x263F8C2B8];
  uint64_t v21 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v30 + *(void *)(v30[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v31[0] = v21;
  v31[1] = MEMORY[0x263F8C318] + 16;
  if (v32 < 0) {
    operator delete((void *)v31[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x230FAED90](&v33);
}

void sub_22EF07D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::uppercase[abi:ne180100](uint64_t result)
{
  *(_DWORD *)(result + 8) |= 0x4000u;
  return result;
}

uint64_t std::nouppercase[abi:ne180100](uint64_t result)
{
  *(_DWORD *)(result + 8) &= ~0x4000u;
  return result;
}

void ACFUCommon::cfTypeDescription(ACFUCommon *this@<X0>, int a2@<W1>, void *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  CFStringRef v6 = CFCopyTypeIDDescription((CFTypeID)this);
  CFStringRef v7 = v6;
  if (!v6)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to copy type description for type ID %lu\n", v16, v17, v18, v19, v20, (char)"ACFUCommon");
    return;
  }
  if (!a2)
  {
    CFRetain(v6);
    CFStringRef v8 = v7;
    goto LABEL_6;
  }
  CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@ (%lu)", v6, this);
  if (v8)
  {
LABEL_6:
    ACFUCommon::stringFromCFString(v8, &v21);
    *(_OWORD *)a3 = v21;
    a3[2] = v22;
    CFRelease(v8);
    goto LABEL_7;
  }
  CFTypeID v9 = ACFULogging::getLogInstance(0);
  ACFULogging::handleMessage((uint64_t)v9, 2u, "%s::%s: failed to create full description for type ID %lu\n", v10, v11, v12, v13, v14, (char)"ACFUCommon");
LABEL_7:
  CFRelease(v7);
}

void sub_22EF07ECC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

BOOL ACFUCommon::doesPathExist(ACFUCommon *this, const __CFURL *a2)
{
  char v21 = 0;
  uint64_t v3 = (ACFULogging *)MEMORY[0x230FAE6B0](this, &v21);
  if (v3)
  {
    LogInstance = ACFULogging::getLogInstance(v3);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to determine if url exists (%u)\n", v5, v6, v7, v8, v9, (char)"ACFUCommon");
    uint64_t v11 = ACFULogging::getLogInstance(v10);
    std::string::basic_string[abi:ne180100]<0>(&v17, "ACFUCommon");
    uint64_t v12 = std::string::append(&v17, "::");
    long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
    v18.__r_.__value_.__r.__words[2] = v12->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v18.__r_.__value_.__l.__data_ = v13;
    v12->__r_.__value_.__l.__size_ = 0;
    v12->__r_.__value_.__r.__words[2] = 0;
    v12->__r_.__value_.__r.__words[0] = 0;
    uint64_t v14 = std::string::append(&v18, "doesPathExist");
    long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
    std::string::size_type v20 = v14->__r_.__value_.__r.__words[2];
    long long v19 = v15;
    v14->__r_.__value_.__l.__size_ = 0;
    v14->__r_.__value_.__r.__words[2] = 0;
    v14->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v11, (uint64_t *)&v19, 0, (uint64_t)"Path URL: ", (uint64_t)this);
    if (SHIBYTE(v20) < 0) {
      operator delete((void *)v19);
    }
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v18.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v17.__r_.__value_.__l.__data_);
    }
  }
  return v21 == 1;
}

void sub_22EF08014(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (*(char *)(v23 - 41) < 0) {
    operator delete(*(void **)(v23 - 64));
  }
  if (a23 < 0) {
    operator delete(__p);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

BOOL ACFUCommon::isPathWritable(const __CFString *this, const __CFString *a2)
{
  ACFUCommon::stringFromCFString(this, v4);
  if (v5 < 0)
  {
    if (v4[1]) {
      BOOL v2 = access(v4[0], 2) == 0;
    }
    else {
      BOOL v2 = 0;
    }
    operator delete(v4[0]);
  }
  else
  {
    return v5 && access((const char *)v4, 2) == 0;
  }
  return v2;
}

uint64_t ACFUCommon::removeFileWithURL(ACFUCommon *this, const __CFURL *a2)
{
  if (this && (v2 = this, uint64_t v3 = (ACFUCommon *)CFURLGetTypeID(), this = (ACFUCommon *)CFGetTypeID(v2), v3 == this))
  {
    LogInstance = ACFULogging::getLogInstance(this);
    std::string::basic_string[abi:ne180100]<0>(&v23, "ACFUCommon");
    char v5 = std::string::append(&v23, "::");
    long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
    v24.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v24.__r_.__value_.__l.__data_ = v6;
    v5->__r_.__value_.__l.__size_ = 0;
    v5->__r_.__value_.__r.__words[2] = 0;
    v5->__r_.__value_.__r.__words[0] = 0;
    uint64_t v7 = std::string::append(&v24, "removeFileWithURL");
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    std::string::size_type v26 = v7->__r_.__value_.__r.__words[2];
    long long v25 = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)LogInstance, (uint64_t *)&v25, 0, (uint64_t)"Removing file at URL: ", (uint64_t)v2);
    if (SHIBYTE(v26) < 0) {
      operator delete((void *)v25);
    }
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v24.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v23.__r_.__value_.__l.__data_);
    }
    uint64_t v9 = (ACFULogging *)AMSupportRemoveFile();
    if (!v9) {
      return 1;
    }
    uint64_t v10 = ACFULogging::getLogInstance(v9);
    ACFULogging::handleMessage((uint64_t)v10, 2u, "%s::%s: failed to remove file (%u)\n", v11, v12, v13, v14, v15, (char)"ACFUCommon");
  }
  else
  {
    uint64_t v16 = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)v16, 2u, "%s::%s: failed due to unexpected data type\n", v17, v18, v19, v20, v21, (char)"ACFUCommon");
  }
  return 0;
}

void sub_22EF0824C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (*(char *)(v23 - 41) < 0) {
    operator delete(*(void **)(v23 - 64));
  }
  if (a23 < 0) {
    operator delete(__p);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ACFUCommon::createSymlink(ACFUCommon *this, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  v57[2] = *MEMORY[0x263EF8340];
  memset(&v56, 0, sizeof(v56));
  memset(&v55, 0, sizeof(v55));
  memset(&v54, 0, sizeof(v54));
  uint64_t v52 = 0;
  long long v53 = 0uLL;
  memset(&v51, 0, sizeof(v51));
  if (!this || !a2 || !a3)
  {
    LogInstance = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: bad input parameters\n", v45, v46, v47, v48, v49, (char)"ACFUCommon");
    goto LABEL_53;
  }
  ACFUCommon::stringFromCFString((const __CFString *)this, &v50);
  if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v56.__r_.__value_.__l.__data_);
  }
  std::string v56 = v50;
  ACFUCommon::stringFromCFString(a2, &v50);
  if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v55.__r_.__value_.__l.__data_);
  }
  std::string v55 = v50;
  ACFUCommon::stringFromCFString(a3, &v50);
  if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v54.__r_.__value_.__l.__data_);
  }
  std::string v54 = v50;
  if ((v56.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v56.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v56.__r_.__value_.__l.__size_;
  }
  uint64_t v7 = &v50;
  std::string::basic_string[abi:ne180100]((uint64_t)&v50, size + 1);
  if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    uint64_t v7 = (std::string *)v50.__r_.__value_.__r.__words[0];
  }
  if (size)
  {
    if ((v56.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      long long v8 = &v56;
    }
    else {
      long long v8 = (std::string *)v56.__r_.__value_.__r.__words[0];
    }
    memmove(v7, v8, size);
  }
  *(_WORD *)((char *)&v7->__r_.__value_.__l.__data_ + size) = 47;
  if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v9 = &v54;
  }
  else {
    uint64_t v9 = (std::string *)v54.__r_.__value_.__r.__words[0];
  }
  if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v10 = HIBYTE(v54.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v10 = v54.__r_.__value_.__l.__size_;
  }
  uint64_t v11 = std::string::append(&v50, (const std::string::value_type *)v9, v10);
  uint64_t v12 = (void *)v11->__r_.__value_.__r.__words[0];
  v57[0] = v11->__r_.__value_.__l.__size_;
  *(void *)((char *)v57 + 7) = *(std::string::size_type *)((char *)&v11->__r_.__value_.__r.__words[1] + 7);
  char v13 = HIBYTE(v11->__r_.__value_.__r.__words[2]);
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v53) < 0) {
    operator delete(v52);
  }
  uint64_t v52 = v12;
  *(void *)&long long v53 = v57[0];
  *(void *)((char *)&v53 + 7) = *(void *)((char *)v57 + 7);
  HIBYTE(v53) = v13;
  if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v50.__r_.__value_.__l.__data_);
  }
  uint64_t v14 = ACFULogging::getLogInstance((ACFULogging *)v11);
  ACFULogging::handleMessage((uint64_t)v14, 3u, "%s::%s: creating symlink from %s -> %s\n", v15, v16, v17, v18, v19, (char)"ACFUCommon");
  if ((v56.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v20 = &v56;
  }
  else {
    uint64_t v20 = (std::string *)v56.__r_.__value_.__r.__words[0];
  }
  uint64_t v21 = (ACFULogging *)stat((const char *)v20, &v51);
  if (v21)
  {
    uint64_t v22 = __error();
    if (*v22 != 2)
    {
      uint64_t v27 = ACFULogging::getLogInstance((ACFULogging *)v22);
      __error();
      uint64_t v33 = "%s::%s: failed to get stats for path: %d\n";
      goto LABEL_52;
    }
    if ((v56.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v23 = &v56;
    }
    else {
      uint64_t v23 = (std::string *)v56.__r_.__value_.__r.__words[0];
    }
    std::string v24 = (ACFULogging *)mkdir((const char *)v23, 0x1FFu);
    if (v24)
    {
      uint64_t v27 = ACFULogging::getLogInstance(v24);
      __error();
      uint64_t v33 = "%s::%s: failed to create directory: %d\n";
      goto LABEL_52;
    }
    if ((v56.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      long long v25 = &v56;
    }
    else {
      long long v25 = (std::string *)v56.__r_.__value_.__r.__words[0];
    }
    std::string::size_type v26 = (ACFULogging *)chmod((const char *)v25, 0x1FFu);
    if (v26)
    {
      uint64_t v27 = ACFULogging::getLogInstance(v26);
      __error();
      uint64_t v33 = "%s::%s: failed to change directory permissions: %d\n";
LABEL_52:
      ACFULogging::handleMessage((uint64_t)v27, 2u, v33, v28, v29, v30, v31, v32, (char)"ACFUCommon");
LABEL_53:
      uint64_t v37 = 0;
      goto LABEL_67;
    }
  }
  else if ((v51.st_mode & 0x4000) == 0)
  {
    uint64_t v27 = ACFULogging::getLogInstance(v21);
    uint64_t v33 = "%s::%s: path exists but is not a directory: 0x%x\n";
    goto LABEL_52;
  }
  if (v53 >= 0) {
    uint64_t v34 = (const char *)&v52;
  }
  else {
    uint64_t v34 = (const char *)v52;
  }
  int v35 = (ACFULogging *)lstat(v34, &v51);
  if (v35)
  {
    uint64_t v36 = __error();
    if (*v36 != 2)
    {
      uint64_t v27 = ACFULogging::getLogInstance((ACFULogging *)v36);
      __error();
      uint64_t v33 = "%s::%s: failed to get stats for symlink name: %d\n";
      goto LABEL_52;
    }
  }
  else
  {
    if ((v51.st_mode & 0xA000) == 0)
    {
      uint64_t v27 = ACFULogging::getLogInstance(v35);
      uint64_t v33 = "%s::%s: symlink name exists but is not a symlink: 0x%x\n";
      goto LABEL_52;
    }
    if (v53 >= 0) {
      uint64_t v38 = (const char *)&v52;
    }
    else {
      uint64_t v38 = (const char *)v52;
    }
    uint64_t v39 = (ACFULogging *)unlink(v38);
    if (v39)
    {
      uint64_t v27 = ACFULogging::getLogInstance(v39);
      __error();
      uint64_t v33 = "%s::%s: failed to remove existing symlink: %d\n";
      goto LABEL_52;
    }
  }
  if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v40 = &v55;
  }
  else {
    uint64_t v40 = (std::string *)v55.__r_.__value_.__r.__words[0];
  }
  if (v53 >= 0) {
    uint64_t v41 = (const char *)&v52;
  }
  else {
    uint64_t v41 = (const char *)v52;
  }
  uint64_t v42 = (ACFULogging *)symlink((const char *)v40, v41);
  if (v42)
  {
    uint64_t v27 = ACFULogging::getLogInstance(v42);
    __error();
    uint64_t v33 = "%s::%s: failed to create symlink: %d\n";
    goto LABEL_52;
  }
  uint64_t v37 = 1;
LABEL_67:
  if (SHIBYTE(v53) < 0) {
    operator delete(v52);
  }
  if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v54.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v55.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v56.__r_.__value_.__l.__data_);
  }
  return v37;
}

void sub_22EF0875C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v19 - 177) < 0) {
    operator delete(*(void **)(v19 - 200));
  }
  if (*(char *)(v19 - 153) < 0) {
    operator delete(*(void **)(v19 - 176));
  }
  if (*(char *)(v19 - 121) < 0) {
    operator delete(*(void **)(v19 - 144));
  }
  if (*(char *)(v19 - 89) < 0) {
    operator delete(*(void **)(v19 - 112));
  }
  _Unwind_Resume(exception_object);
}

void ACFUCommon::getSystemGroupContainerPath(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v20 = 1;
  CFAllocatorRef v4 = (char *)container_system_group_path_for_identifier();
  if (v4)
  {
    char v5 = (ACFULogging *)std::string::basic_string[abi:ne180100]<0>(&v18, v4);
    *(_OWORD *)a1 = v18;
    a1[2] = v19;
    LogInstance = ACFULogging::getLogInstance(v5);
    ACFULogging::handleMessage((uint64_t)LogInstance, 0, "%s::%s: system group container path: %s\n", v7, v8, v9, v10, v11, (char)"ACFUCommon");
    free(v4);
  }
  else
  {
    uint64_t v12 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v12, 2u, "%s::%s: error getting system group container: %llu\n", v13, v14, v15, v16, v17, (char)"ACFUCommon");
  }
}

void sub_22EF088B4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<__CFString const*>::__init_with_size[abi:ne180100]<__CFString const**,__CFString const**>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    long long v6 = result;
    CFDataRef result = std::vector<__CFString const*>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      CFDataRef result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_22EF08930(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<__CFString const*>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<ACFURTKitNVRMGenerator::RTKitNVRMVariable>::__throw_length_error[abi:ne180100]();
  }
  CFDataRef result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<__CFString const*>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<__CFString const*>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    long long v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000;
    *(void *)a1 = v6;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 23) = a2;
  }
  return a1;
}

void ACFUTimer::create(id a1@<X1>, unsigned int a2@<W0>, void *a3@<X8>)
{
  id v5 = a1;
  long long v6 = operator new(0x20uLL);
  v6[2] = 0;
  v6[3] = 0;
  void *v6 = &unk_26E27FD68;
  v6[1] = 0;
  *((_WORD *)v6 + 12) = 0;
  *a3 = v6;
  if ((ACFUTimer::init((uint64_t)v6, a2, v5) & 1) == 0)
  {
    *a3 = 0;
    uint64_t v7 = (ACFULogging *)(*(uint64_t (**)(void *))(*v6 + 8))(v6);
    LogInstance = ACFULogging::getLogInstance(v7);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to init timer object\n", v9, v10, v11, v12, v13, (char)"ACFUTimer");
  }
}

void sub_22EF08B40(_Unwind_Exception *a1)
{
  void *v2 = 0;

  _Unwind_Resume(a1);
}

uint64_t ACFUTimer::init(uint64_t a1, unsigned int a2, id a3)
{
  id v5 = (ACFULogging *)a3;
  long long v6 = v5;
  if (!a2)
  {
    LogInstance = ACFULogging::getLogInstance(v5);
    long long v25 = "%s::%s: invalid timeout value\n";
LABEL_11:
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v25, v20, v21, v22, v23, v24, (char)"ACFUTimer");
    uint64_t v17 = 0;
    goto LABEL_6;
  }
  if (!v5)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    long long v25 = "%s::%s: invalid timeout callback\n";
    goto LABEL_11;
  }
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.acfu.timer", 0);
  size_t v8 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v7;

  uint64_t v10 = *(NSObject **)(a1 + 16);
  if (!v10)
  {
    LogInstance = ACFULogging::getLogInstance(v9);
    long long v25 = "%s::%s: failed to create dispatch queue\n";
    goto LABEL_11;
  }
  dispatch_source_t v11 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v10);
  uint64_t v12 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v11;

  uint64_t v14 = *(NSObject **)(a1 + 8);
  if (!v14)
  {
    LogInstance = ACFULogging::getLogInstance(v13);
    long long v25 = "%s::%s: failed to create dispatch timer object\n";
    goto LABEL_11;
  }
  dispatch_time_t v15 = dispatch_time(0, 1000000 * a2);
  dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0x1312D00uLL);
  uint64_t v16 = *(NSObject **)(a1 + 8);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3254779904;
  handler[2] = ___ZN9ACFUTimer4initEjU13block_pointerFvvE_block_invoke;
  handler[3] = &__block_descriptor_48_ea8_32bs_e5_v8__0l;
  uint64_t v28 = a1;
  id v27 = v6;
  dispatch_source_set_event_handler(v16, handler);

  uint64_t v17 = 1;
LABEL_6:

  return v17;
}

void sub_22EF08D38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN9ACFUTimer4initEjU13block_pointerFvvE_block_invoke(ACFULogging *a1)
{
  uint64_t v2 = *((void *)a1 + 5);
  LogInstance = ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 3u, "%s::%s: timer fired\n", v4, v5, v6, v7, v8, (char)"ACFUTimer");
  *(_WORD *)(v2 + 24) = 258;
  dispatch_source_cancel(*(dispatch_source_t *)(v2 + 8));
  uint64_t v9 = *(uint64_t (**)(void))(*((void *)a1 + 4) + 16);
  return v9();
}

void __copy_helper_block_ea8_32b(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_ea8_32s(uint64_t a1)
{
}

uint64_t ACFUTimer::startOnQueue(dispatch_queue_t *this)
{
  dispatch_assert_queue_V2(this[2]);
  if (this[1])
  {
    int v3 = *((unsigned __int8 *)this + 24);
    LogInstance = ACFULogging::getLogInstance(v2);
    if (!v3)
    {
      ACFULogging::handleMessage((uint64_t)LogInstance, 3u, "%s::%s: starting timer\n", v5, v6, v7, v8, v9, (char)"ACFUTimer");
      dispatch_resume(this[1]);
      uint64_t result = 1;
      *((_WORD *)this + 12) = 1;
      return result;
    }
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: timer is already running\n", v5, v6, v7, v8, v9, (char)"ACFUTimer");
  }
  else
  {
    dispatch_source_t v11 = ACFULogging::getLogInstance(v2);
    ACFULogging::handleMessage((uint64_t)v11, 2u, "%s::%s: timer is not initialized\n", v12, v13, v14, v15, v16, (char)"ACFUTimer");
  }
  return 0;
}

uint64_t ACFUTimer::start(ACFUTimer *this)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  uint64_t v1 = *((void *)this + 2);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3254779904;
  v4[2] = ___ZN9ACFUTimer5startEv_block_invoke;
  v4[3] = &__block_descriptor_48_ea8_32r_e5_v8__0l;
  v4[4] = &v5;
  v4[5] = this;
  dispatch_sync(v1, v4);
  uint64_t v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t ___ZN9ACFUTimer5startEv_block_invoke(uint64_t a1)
{
  uint64_t result = ACFUTimer::startOnQueue(*(dispatch_queue_t **)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __copy_helper_block_ea8_32r(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_ea8_32r(uint64_t a1)
{
}

void ACFUTimer::stopOnQueue(dispatch_queue_t *this)
{
  dispatch_assert_queue_V2(this[2]);
  if (*((unsigned char *)this + 24) == 1)
  {
    LogInstance = ACFULogging::getLogInstance(v2);
    ACFULogging::handleMessage((uint64_t)LogInstance, 3u, "%s::%s: stopping timer\n", v4, v5, v6, v7, v8, (char)"ACFUTimer");
    dispatch_source_cancel(this[1]);
  }
  *((unsigned char *)this + 24) = 0;
}

void ACFUTimer::stop(ACFUTimer *this)
{
  uint64_t v1 = *((void *)this + 2);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN9ACFUTimer4stopEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = this;
  dispatch_sync(v1, block);
}

void ___ZN9ACFUTimer4stopEv_block_invoke(uint64_t a1)
{
}

uint64_t ACFUTimer::hasFired(ACFUTimer *this)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  uint64_t v1 = *((void *)this + 2);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3254779904;
  v4[2] = ___ZN9ACFUTimer8hasFiredEv_block_invoke;
  v4[3] = &__block_descriptor_48_ea8_32r_e5_v8__0l;
  v4[4] = &v5;
  v4[5] = this;
  dispatch_sync(v1, v4);
  uint64_t v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t ___ZN9ACFUTimer8hasFiredEv_block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(*(void *)(result + 40) + 25);
  return result;
}

void ACFUTimer::~ACFUTimer(ACFUTimer *this)
{
  *(void *)this = &unk_26E27FD68;
  uint64_t v2 = *((void *)this + 2);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN9ACFUTimer4stopEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = this;
  dispatch_sync(v2, block);
}

{
  void *v1;
  uint64_t vars8;

  ACFUTimer::~ACFUTimer(this);
  operator delete(v1);
}

void ACFUFile::ACFUFile(ACFUFile *this)
{
  *(void *)this = &unk_26E27FD98;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((unsigned char *)this + 32) = 1;
}

void ACFUFile::fileVersionLog(ACFUFile *this)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v26 = 0u;
  memset(v25, 0, sizeof(v25));
  CFDataRef v1 = (const __CFData *)(*(uint64_t (**)(ACFUFile *))(*(void *)this + 96))(this);
  if (v1)
  {
    CFDataRef v2 = v1;
    BytePtr = CFDataGetBytePtr(v1);
    CFIndex Length = (ACFULogging *)CFDataGetLength(v2);
    if ((unint64_t)Length > 0x7F)
    {
      LogInstance = ACFULogging::getLogInstance(Length);
      ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: data exceeds local buffer size\n", v20, v21, v22, v23, v24, (char)"ACFUFile");
    }
    else
    {
      if (Length)
      {
        uint64_t v5 = v25;
        do
        {
          char v6 = *BytePtr++;
          *v5++ = v6;
          CFIndex Length = (ACFULogging *)((char *)Length - 1);
        }
        while (Length);
      }
      HIBYTE(v26) = 0;
      uint64_t v7 = ACFULogging::getLogInstance(Length);
      ACFULogging::handleMessage((uint64_t)v7, 0, "%s::%s: Firmware Version: %s\n", v8, v9, v10, v11, v12, (char)"ACFUFile");
    }
    CFRelease(v2);
  }
  else
  {
    uint64_t v13 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v13, 2u, "%s::%s: no data to log\n", v14, v15, v16, v17, v18, (char)"ACFUFile");
  }
}

uint64_t ACFUFile::saveToPath(ACFUFile *this, const __CFURL *a2)
{
  if (!a2)
  {
    LogInstance = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: bad parameters\n", v25, v26, v27, v28, v29, (char)"ACFUFile");
    return 0;
  }
  if (!*((void *)this + 3))
  {
    uint64_t v30 = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)v30, 2u, "%s::%s: file name not specified\n", v31, v32, v33, v34, v35, (char)"ACFUFile");
    return 0;
  }
  int v3 = (ACFUDataContainer *)*((void *)this + 1);
  if (!v3)
  {
    uint64_t v36 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v36, 2u, "%s::%s: no file data?!\n", v37, v38, v39, v40, v41, (char)"ACFUFile");
    return 0;
  }
  isOptimized = (ACFULogging *)ACFUDataContainer::isOptimized(v3);
  if (isOptimized)
  {
    uint64_t v42 = ACFULogging::getLogInstance(isOptimized);
    ACFULogging::handleMessage((uint64_t)v42, 2u, "%s::%s: cannot save data using optimized flow\n", v43, v44, v45, v46, v47, (char)"ACFUFile");
    return 0;
  }
  char v6 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, *((CFStringRef *)this + 3), 0);
  if (!v6)
  {
    uint64_t v48 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v48, 2u, "%s::%s: could not create URL to file\n", v49, v50, v51, v52, v53, (char)"ACFUFile");
    return 0;
  }
  uint64_t v8 = v6;
  if (!ACFUCommon::doesPathExist(v6, v7))
  {
    uint64_t v9 = (ACFULogging *)MEMORY[0x230FAE6D0](v8);
    if (v9)
    {
      uint64_t v72 = ACFULogging::getLogInstance(v9);
      ACFULogging::handleMessage((uint64_t)v72, 2u, "%s::%s: failed to create directory to save firmware (status: %d)\n", v73, v74, v75, v76, v77, (char)"ACFUFile");
      goto LABEL_26;
    }
  }
  if (!ACFUDataContainer::getData(*((ACFUDataContainer **)this + 1)))
  {
    std::string v54 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v54, 2u, "%s::%s: failed to obtain reference of data from data container\n", v55, v56, v57, v58, v59, (char)"ACFUFile");
LABEL_26:
    uint64_t v22 = 0;
    goto LABEL_14;
  }
  uint64_t v10 = (ACFULogging *)AMSupportWriteDataToFileURL();
  if (v10)
  {
    uint64_t v60 = ACFULogging::getLogInstance(v10);
    ACFULogging::handleMessage((uint64_t)v60, 2u, "%s::%s: failed to save file (%d)\n", v61, v62, v63, v64, v65, (char)"ACFUFile");
    goto LABEL_26;
  }
  CFIndex Length = ACFUDataContainer::getLength(*((const __CFString ***)this + 1));
  off_t FileSize = (ACFULogging *)ACFUCommon::getFileSize(v8, v12);
  uint64_t v14 = ACFULogging::getLogInstance(FileSize);
  CFStringRef v15 = CFURLGetString(v8);
  ACFUCommon::stringFromCFString(v15, &__p);
  ACFULogging::handleMessage((uint64_t)v14, 0, "%s::%s: Wrote %zu of %zu bytes to %s\n", v16, v17, v18, v19, v20, (char)"ACFUFile");
  if (v79 < 0) {
    operator delete(__p);
  }
  if ((ACFULogging *)Length != FileSize)
  {
    uint64_t v66 = ACFULogging::getLogInstance(v21);
    ACFULogging::handleMessage((uint64_t)v66, 2u, "%s::%s: Failed to write some or all of data\n", v67, v68, v69, v70, v71, (char)"ACFUFile");
    goto LABEL_26;
  }
  uint64_t v22 = 1;
LABEL_14:
  CFRelease(v8);
  return v22;
}

void sub_22EF09648(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

__CFData *ACFUFile::copyFirmwareContainer(ACFUDataContainer **this)
{
  return ACFUDataContainer::copyData(this[1]);
}

__CFData *ACFUFile::copyFirmwareContainerFromOffset(ACFUDataContainer **this, unsigned int a2, unint64_t a3)
{
  return ACFUDataContainer::copyData(this[1], a2, a3);
}

uint64_t ACFUFile::isFirmwareContainerMutable(ACFUFile *this)
{
  return *((unsigned __int8 *)this + 32);
}

void ACFUFile::~ACFUFile(ACFUFile *this)
{
  *(void *)this = &unk_26E27FD98;
  CFDataRef v2 = (const void *)*((void *)this + 2);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 2) = 0;
  }
  std::unique_ptr<ACFUDataContainer>::reset[abi:ne180100]((ACFUDataContainer **)this + 1, 0);
}

uint64_t ACFUFile::init(ACFUFile *this, const __CFData *a2)
{
  if (!*((void *)this + 3))
  {
    LogInstance = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: no file name specified\n", v12, v13, v14, v15, v16, (char)"ACFUFile");
    return 0;
  }
  if (!a2)
  {
    uint64_t v17 = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)v17, 2u, "%s::%s: bad parameter!\n", v18, v19, v20, v21, v22, (char)"ACFUFile");
    return 0;
  }
  CFTypeID TypeID = CFDataGetTypeID();
  uint64_t v5 = (ACFULogging *)CFGetTypeID(a2);
  if ((ACFULogging *)TypeID != v5)
  {
    uint64_t v23 = ACFULogging::getLogInstance(v5);
    ACFULogging::handleMessage((uint64_t)v23, 2u, "%s::%s: data is of an unsupported type\n", v24, v25, v26, v27, v28, (char)"ACFUFile");
    return 0;
  }
  ACFUDataContainer::create(a2, &v35);
  char v6 = (ACFUDataContainer **)((char *)this + 8);
  CFURLRef v7 = v35;
  uint64_t v35 = 0;
  std::unique_ptr<ACFUDataContainer>::reset[abi:ne180100](v6, v7);
  uint64_t v8 = v35;
  uint64_t v35 = 0;
  if (v8)
  {
    ACFUDataContainer::~ACFUDataContainer(v8);
    operator delete(v9);
  }
  if (!*v6)
  {
    uint64_t v29 = ACFULogging::getLogInstance(v8);
    ACFULogging::handleMessage((uint64_t)v29, 2u, "%s::%s: failed to create data container\n", v30, v31, v32, v33, v34, (char)"ACFUFile");
    return 0;
  }
  return 1;
}

uint64_t ACFUFile::init(ACFUFile *this, __CFData *a2)
{
  if (!*((void *)this + 3))
  {
    LogInstance = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: no file name specified\n", v12, v13, v14, v15, v16, (char)"ACFUFile");
    return 0;
  }
  if (!a2)
  {
    uint64_t v17 = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)v17, 2u, "%s::%s: bad parameter!\n", v18, v19, v20, v21, v22, (char)"ACFUFile");
    return 0;
  }
  CFTypeID TypeID = CFDataGetTypeID();
  uint64_t v5 = (ACFULogging *)CFGetTypeID(a2);
  if ((ACFULogging *)TypeID != v5)
  {
    uint64_t v23 = ACFULogging::getLogInstance(v5);
    ACFULogging::handleMessage((uint64_t)v23, 2u, "%s::%s: data is of an unsupported type\n", v24, v25, v26, v27, v28, (char)"ACFUFile");
    return 0;
  }
  ACFUDataContainer::create(a2, &v35);
  char v6 = (ACFUDataContainer **)((char *)this + 8);
  CFURLRef v7 = v35;
  uint64_t v35 = 0;
  std::unique_ptr<ACFUDataContainer>::reset[abi:ne180100](v6, v7);
  uint64_t v8 = v35;
  uint64_t v35 = 0;
  if (v8)
  {
    ACFUDataContainer::~ACFUDataContainer(v8);
    operator delete(v9);
  }
  if (!*v6)
  {
    uint64_t v29 = ACFULogging::getLogInstance(v8);
    ACFULogging::handleMessage((uint64_t)v29, 2u, "%s::%s: failed to create data container\n", v30, v31, v32, v33, v34, (char)"ACFUFile");
    return 0;
  }
  return 1;
}

BOOL ACFUFile::init(ACFUFile *this, const __CFString *a2, const __CFString *a3)
{
  if (!a2)
  {
    LogInstance = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: bad parameter!\n", v16, v17, v18, v19, v20, (char)"ACFUFile");
    return 0;
  }
  uint64_t v4 = *((void *)this + 3);
  if (!v4)
  {
    uint64_t v21 = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)v21, 2u, "%s::%s: file name does not exist\n", v22, v23, v24, v25, v26, (char)"ACFUFile");
    return 0;
  }
  char v6 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@/%@", a2, v4);
  if (!v6)
  {
    uint64_t v27 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v27, 2u, "%s::%s: failed to create ftab file path\n", v28, v29, v30, v31, v32, (char)"ACFUFile");
    return 0;
  }
  CFURLRef v7 = v6;
  ACFUDataContainer::create(v6, a3, &v39);
  uint64_t v8 = (ACFUDataContainer **)((char *)this + 8);
  uint64_t v9 = v39;
  uint64_t v39 = 0;
  std::unique_ptr<ACFUDataContainer>::reset[abi:ne180100](v8, v9);
  uint64_t v10 = v39;
  uint64_t v39 = 0;
  if (v10)
  {
    ACFUDataContainer::~ACFUDataContainer(v10);
    operator delete(v11);
  }
  uint64_t v12 = *v8;
  BOOL v13 = *v8 != 0;
  if (!v12)
  {
    uint64_t v33 = ACFULogging::getLogInstance(v10);
    ACFULogging::handleMessage((uint64_t)v33, 2u, "%s::%s: failed to create data container\n", v34, v35, v36, v37, v38, (char)"ACFUFile");
  }
  CFRelease(v7);
  return v13;
}

void ACFUTrace::ACFUTrace(ACFUTrace *this)
{
  *(void *)((char *)this + 5) = 0;
  *(void *)this = 0;
}

{
  *(void *)((char *)this + 5) = 0;
  *(void *)this = 0;
}

uint64_t *ACFUTrace::getTrace(ACFUTrace *this)
{
  {
    *(uint64_t *)((char *)&ACFUTrace::getTrace(void)::trace + 5) = 0;
    ACFUTrace::getTrace(void)::trace = 0;
  }
  return &ACFUTrace::getTrace(void)::trace;
}

uint64_t ACFUTrace::init(uint64_t this, int a2, int a3, int a4, char a5)
{
  *(_DWORD *)this = a2;
  *(_DWORD *)(this + 4) = a3;
  *(_DWORD *)(this + 8) = a4;
  *(unsigned char *)(this + 12) = a5;
  return this;
}

void ACFUFirmware::ACFUFirmware(ACFUFirmware *this)
{
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  *(void *)this = &unk_26E27FE20;
  *((void *)this + 1) = (char *)this + 16;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  *((_DWORD *)this + 14) = 1;
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 0;
  *((unsigned char *)this + 80) = 0;
}

uint64_t ACFUFirmware::getManifest(ACFUFirmware *this)
{
  return *((void *)this + 6);
}

uint64_t ACFUFirmware::copyFWContainer(ACFUFirmware *this)
{
  uint64_t v1 = *((void *)this + 4);
  if (v1)
  {
    CFDataRef v2 = *(uint64_t (**)(void))(*(void *)v1 + 40);
    return v2();
  }
  else
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: file not open\n", v5, v6, v7, v8, v9, (char)"ACFUFirmware");
    return 0;
  }
}

__CFData *ACFUFirmware::copyFWContainerFromOffset(ACFUFirmware *this, unsigned int a2, unint64_t a3)
{
  int v3 = (ACFUDataContainer **)*((void *)this + 4);
  if (v3)
  {
    return ACFUFile::copyFirmwareContainerFromOffset(v3, a2, a3);
  }
  else
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: file not open\n", v6, v7, v8, v9, v10, (char)"ACFUFirmware");
    return 0;
  }
}

ACFUFile *ACFUFirmware::isFWContainerMutable(ACFUFirmware *this)
{
  uint64_t result = (ACFUFile *)*((void *)this + 4);
  if (result) {
    return (ACFUFile *)ACFUFile::isFirmwareContainerMutable(result);
  }
  return result;
}

void ACFUFirmware::logFirmwareVersion(ACFUFile **this)
{
}

uint64_t ACFUFirmware::copyFWDataByTag(ACFUFirmware *this, const __CFString *a2)
{
  CFStringRef v18 = a2;
  CFDataRef v2 = (uint64_t (***)(void, void *))*((void *)this + 4);
  if (v2)
  {
    uint64_t v5 = (void *)*((void *)this + 2);
    int v3 = (char *)this + 16;
    uint64_t v4 = v5;
    if (v5)
    {
      uint64_t v6 = v3;
      do
      {
        unint64_t v7 = v4[4];
        BOOL v8 = v7 >= (unint64_t)a2;
        if (v7 >= (unint64_t)a2) {
          uint64_t v9 = v4;
        }
        else {
          uint64_t v9 = v4 + 1;
        }
        if (v8) {
          uint64_t v6 = (char *)v4;
        }
        uint64_t v4 = (void *)*v9;
      }
      while (*v9);
      if (v6 != v3 && *((void *)v6 + 4) <= (unint64_t)a2)
      {
        uint64_t v11 = std::map<__CFString const*,std::string>::at((uint64_t)(v3 - 8), (unint64_t *)&v18);
        return (**v2)(v2, v11);
      }
    }
  }
  else
  {
    LogInstance = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: file not open\n", v13, v14, v15, v16, v17, (char)"ACFUFirmware");
  }
  return 0;
}

void *std::map<__CFString const*,std::string>::at(uint64_t a1, unint64_t *a2)
{
  CFDataRef v2 = *(void **)(a1 + 8);
  if (!v2) {
LABEL_8:
  }
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  unint64_t v3 = *a2;
  while (1)
  {
    while (1)
    {
      unint64_t v4 = v2[4];
      if (v3 >= v4) {
        break;
      }
      CFDataRef v2 = (void *)*v2;
      if (!v2) {
        goto LABEL_8;
      }
    }
    if (v4 >= v3) {
      return v2 + 5;
    }
    CFDataRef v2 = (void *)v2[1];
    if (!v2) {
      goto LABEL_8;
    }
  }
}

uint64_t ACFUFirmware::copyFWDataByFileName(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (****)(void))(a1 + 32);
  if (v1)
  {
    CFDataRef v2 = **v1;
    return v2();
  }
  else
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: file not open\n", v5, v6, v7, v8, v9, (char)"ACFUFirmware");
    return 0;
  }
}

void ACFUFirmware::copyFWDataRefByFileName(uint64_t a1@<X0>, ACFUDataContainer::DirectDataRef **a2@<X8>)
{
  *a2 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    (*(void (**)(ACFUDataContainer::DirectDataRef **__return_ptr))(*(void *)v3 + 8))(&v13);
    unint64_t v4 = v13;
    uint64_t v13 = 0;
    std::unique_ptr<ACFUDataContainer::DirectDataRef>::reset[abi:ne180100](a2, v4);
    uint64_t v5 = v13;
    uint64_t v13 = 0;
    if (v5)
    {
      ACFUDataContainer::DirectDataRef::~DirectDataRef(v5);
      operator delete(v6);
    }
  }
  else
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: file not open\n", v8, v9, v10, v11, v12, (char)"ACFUFirmware");
  }
}

void sub_22EF09EF0(_Unwind_Exception *a1)
{
  std::unique_ptr<ACFUDataContainer::DirectDataRef>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

const void *ACFUFirmware::getMeasureDataWithTag(CFDictionaryRef *this, const __CFString *a2)
{
  if (a2) {
    return CFDictionaryGetValue(this[5], a2);
  }
  else {
    return 0;
  }
}

BOOL ACFUFirmware::hasValidFirmware(ACFUFirmware *this)
{
  return *((void *)this + 4) && *((void *)this + 6) != 0;
}

uint64_t ACFUFirmware::saveFirmware(ACFUFirmware *this, const __CFURL *a2)
{
  if (*((void *)this + 4))
  {
    uint64_t v3 = (ACFUCommon *)*((void *)this + 8);
    if (v3)
    {
      if (!ACFUCommon::doesPathExist(v3, a2)
        && (unint64_t v4 = (ACFULogging *)MEMORY[0x230FAE6D0](*((void *)this + 8)), v4))
      {
        LogInstance = ACFULogging::getLogInstance(v4);
        ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to create directory to save firmware (status: %d)\n", v26, v27, v28, v29, v30, (char)"ACFUFirmware");
        return 1003;
      }
      else
      {
        uint64_t v5 = (ACFULogging *)ACFUFile::saveToPath(*((ACFUFile **)this + 4), *((const __CFURL **)this + 8));
        if (v5)
        {
          return 0;
        }
        else
        {
          uint64_t v19 = ACFULogging::getLogInstance(v5);
          ACFULogging::handleMessage((uint64_t)v19, 2u, "%s::%s: Failed to save packaged firmware file\n", v20, v21, v22, v23, v24, (char)"ACFUFirmware");
          return 1004;
        }
      }
    }
    else
    {
      uint64_t v13 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v13, 2u, "%s::%s: savePath for FW not specified. This needs to be specified.\n", v14, v15, v16, v17, v18, (char)"ACFUFirmware");
      return 1014;
    }
  }
  else
  {
    uint64_t v7 = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)v7, 2u, "%s::%s: fFirmwareFile has not been initialized.\n", v8, v9, v10, v11, v12, (char)"ACFUFirmware");
    return 1000;
  }
}

uint64_t ACFUFirmware::openFirmwareInRestoreOptions(const void **this, CFDictionaryRef theDict)
{
  uint64_t Value = (uint64_t)CFDictionaryGetValue(theDict, this[9]);
  if (!Value)
  {
    uint64_t v6 = 1001;
    uint64_t v8 = "%s::%s: Manifest is not available\n";
LABEL_9:
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)Value);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v8, v10, v11, v12, v13, v14, (char)"ACFUFirmware");
    return v6;
  }
  uint64_t v4 = Value;
  CFTypeID v5 = CFGetTypeID((CFTypeRef)Value);
  uint64_t Value = CFDataGetTypeID();
  if (v5 != Value)
  {
    uint64_t v6 = 4002;
    uint64_t v8 = "%s::%s: Manifest is not present in expected data type\n";
    goto LABEL_9;
  }
  (*((void (**)(const void **, uint64_t))*this + 9))(this, v4);
  uint64_t Value = (*((uint64_t (**)(const void **))*this + 8))(this);
  if ((Value & 1) == 0)
  {
    uint64_t v6 = 1013;
    uint64_t v8 = "%s::%s: Failed to measure firmware\n";
    goto LABEL_9;
  }
  return 0;
}

void ACFUFirmware::~ACFUFirmware(ACFUFirmware *this)
{
  *(void *)this = &unk_26E27FE20;
  CFDataRef v2 = (const void *)*((void *)this + 6);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 6) = 0;
  }
  uint64_t v3 = (const void *)*((void *)this + 8);
  if (v3)
  {
    CFRelease(v3);
    *((void *)this + 8) = 0;
  }
  uint64_t v4 = (const void *)*((void *)this + 9);
  if (v4)
  {
    CFRelease(v4);
    *((void *)this + 9) = 0;
  }
  CFTypeID v5 = (const void *)*((void *)this + 5);
  if (v5)
  {
    CFRelease(v5);
    *((void *)this + 5) = 0;
  }
  uint64_t v6 = *((void *)this + 4);
  *((void *)this + 4) = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 56))(v6);
  }
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)this + 8, *((char **)this + 2));
}

uint64_t ACFUFirmware::getFileSizeByFileName(ACFULogging *a1)
{
  LogInstance = ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: This function has not been implemented\n", v2, v3, v4, v5, v6, (char)"ACFUFirmware");
  return 0;
}

CFDataRef ACFUFirmware::hashData(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v3 = a3;
  uint64_t v38 = *MEMORY[0x263EF8340];
  if ((*(char *)(a2 + 23) & 0x80000000) == 0)
  {
    if (*(unsigned char *)(a2 + 23)) {
      goto LABEL_3;
    }
LABEL_9:
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)a1);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: no firmware file provided\n", v7, v8, v9, v10, v11, (char)"ACFUFirmware");
    return 0;
  }
  if (!*(void *)(a2 + 8)) {
    goto LABEL_9;
  }
LABEL_3:
  if (!a3)
  {
    uint64_t v29 = ACFULogging::getLogInstance((ACFULogging *)a1);
    ACFULogging::handleMessage((uint64_t)v29, 2u, "%s::%s: empty file\n", v30, v31, v32, v33, v34, (char)"ACFUFirmware");
    return 0;
  }
  int v5 = *(_DWORD *)(a1 + 56);
  switch(v5)
  {
    case 2:
      CC_SHA512_Init(&v35);
      break;
    case 1:
      CC_SHA384_Init(&v35);
      break;
    case 0:
      CC_SHA256_Init(&c);
      break;
  }
  int v12 = 0;
  do
  {
    if (v3 >= 0x100000) {
      CC_LONG v13 = 0x100000;
    }
    else {
      CC_LONG v13 = v3;
    }
    uint64_t v14 = (ACFULogging *)(*(void *(**)(unsigned __int8 *__return_ptr))(**(void **)(a1 + 32) + 8))(md);
    uint64_t v15 = *(ACFUDataContainer::DirectDataRef **)md;
    if (!*(void *)md)
    {
      uint64_t v23 = ACFULogging::getLogInstance(v14);
      ACFULogging::handleMessage((uint64_t)v23, 2u, "%s::%s: failed to obtain file data\n", v24, v25, v26, v27, v28, (char)"ACFUFirmware");
      return 0;
    }
    int v16 = *(_DWORD *)(a1 + 56);
    if (v16)
    {
      if (v16 == 1)
      {
        DataPtr = (const void *)ACFUDataContainer::DirectDataRef::getDataPtr(*(ACFUDataContainer::DirectDataRef **)md);
        CC_SHA384_Update(&v35, DataPtr, v13);
      }
      else if (v16 == 2)
      {
        uint64_t v17 = (const void *)ACFUDataContainer::DirectDataRef::getDataPtr(*(ACFUDataContainer::DirectDataRef **)md);
        CC_SHA512_Update(&v35, v17, v13);
      }
    }
    else
    {
      uint64_t v18 = (const void *)ACFUDataContainer::DirectDataRef::getDataPtr(*(ACFUDataContainer::DirectDataRef **)md);
      CC_SHA256_Update(&c, v18, v13);
    }
    v12 += v13;
    v3 -= v13;
    ACFUDataContainer::DirectDataRef::~DirectDataRef(v15);
    operator delete(v20);
  }
  while (v3);
  int v21 = *(_DWORD *)(a1 + 56);
  if (v21 == 2)
  {
    CC_SHA512_Final(md, &v35);
    return CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], md, 64);
  }
  else if (v21 == 1)
  {
    CC_SHA384_Final(md, &v35);
    return CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], md, 48);
  }
  else
  {
    if (v21) {
      return 0;
    }
    CC_SHA256_Final(md, &c);
    return CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], md, 32);
  }
}

void sub_22EF0A528(_Unwind_Exception *exception_object)
{
}

CFDataRef ACFUFirmware::hashData(ACFUFirmware *this, CFDataRef theData)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  int v3 = *((_DWORD *)this + 14);
  switch(v3)
  {
    case 2:
      BytePtr = CFDataGetBytePtr(theData);
      CC_LONG Length = CFDataGetLength(theData);
      uint64_t v11 = CC_SHA512(BytePtr, Length, md);
      if (v11 == md)
      {
        CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFIndex v8 = 64;
        return CFDataCreate(v7, md, v8);
      }
      LogInstance = ACFULogging::getLogInstance((ACFULogging *)v11);
      ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: SHA512 failed\n", v23, v24, v25, v26, v27, (char)"ACFUFirmware");
      break;
    case 1:
      int v12 = CFDataGetBytePtr(theData);
      CC_LONG v13 = CFDataGetLength(theData);
      uint64_t v14 = CC_SHA384(v12, v13, md);
      if (v14 == md)
      {
        CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFIndex v8 = 48;
        return CFDataCreate(v7, md, v8);
      }
      uint64_t v28 = ACFULogging::getLogInstance((ACFULogging *)v14);
      ACFULogging::handleMessage((uint64_t)v28, 2u, "%s::%s: SHA384 failed\n", v29, v30, v31, v32, v33, (char)"ACFUFirmware");
      break;
    case 0:
      uint64_t v4 = CFDataGetBytePtr(theData);
      CC_LONG v5 = CFDataGetLength(theData);
      uint64_t v6 = CC_SHA256(v4, v5, md);
      if (v6 == md)
      {
        CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFIndex v8 = 32;
        return CFDataCreate(v7, md, v8);
      }
      int v16 = ACFULogging::getLogInstance((ACFULogging *)v6);
      ACFULogging::handleMessage((uint64_t)v16, 2u, "%s::%s: SHA256 failed\n", v17, v18, v19, v20, v21, (char)"ACFUFirmware");
      break;
  }
  return 0;
}

void ACFUFirmware::setMeasureDataWithTag(CFMutableDictionaryRef *this, const __CFString *a2, const __CFData *a3)
{
}

BOOL ACFUFirmware::init(uint64_t a1, uint64_t **a2)
{
  int v3 = (uint64_t **)(a1 + 8);
  if (v3 != a2) {
    std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<__CFString const*,std::string>,std::__tree_node<std::__value_type<__CFString const*,std::string>,void *> *,long>>(v3, *a2, a2 + 1);
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *(void *)(a1 + 40) = Mutable;
  if (!Mutable)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: Failed to allocate measurements dict\n", v7, v8, v9, v10, v11, (char)"ACFUFirmware");
  }
  return Mutable != 0;
}

uint64_t ACFUFirmware::init(ACFULogging *Mutable, uint64_t a2)
{
  if (*(void *)(a2 + 40))
  {
    int v3 = Mutable;
    CFMutableDictionaryRef Mutable = *(ACFULogging **)(a2 + 16);
    if (Mutable)
    {
      uint64_t v4 = *(void *)(a2 + 8);
      if (v4)
      {
        *((_DWORD *)v3 + 14) = *(_DWORD *)a2;
        if ((ACFULogging *)((char *)v3 + 8) != (ACFULogging *)(a2 + 24))
        {
          std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<__CFString const*,std::string>,std::__tree_node<std::__value_type<__CFString const*,std::string>,void *> *,long>>((uint64_t **)v3 + 1, *(void **)(a2 + 24), (void *)(a2 + 32));
          uint64_t v4 = *(void *)(a2 + 8);
          CFMutableDictionaryRef Mutable = *(ACFULogging **)(a2 + 16);
        }
        *((void *)v3 + 8) = Mutable;
        *((void *)v3 + 9) = v4;
        AMSupportSafeRetain();
        AMSupportSafeRetain();
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        *((void *)v3 + 5) = Mutable;
        if (Mutable) {
          return 1;
        }
        uint64_t v6 = "%s::%s: Failed to allocate measurements dict\n";
      }
      else
      {
        uint64_t v6 = "%s::%s: No manifest key specified\n";
      }
    }
    else
    {
      uint64_t v6 = "%s::%s: No save path specified\n";
    }
  }
  else
  {
    uint64_t v6 = "%s::%s: invalid tag map parameter\n";
  }
  LogInstance = ACFULogging::getLogInstance(Mutable);
  ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v6, v8, v9, v10, v11, v12, (char)"ACFUFirmware");
  return 0;
}

uint64_t ACFUFirmware::measureFW(ACFUFirmware *this)
{
  uint64_t v1 = (void *)*((void *)this + 1);
  uint64_t v2 = (char *)this + 16;
  if (v1 == (void *)((char *)this + 16)) {
    return 1;
  }
  while (1)
  {
    if (!*((unsigned char *)this + 80))
    {
      CFDataRef v6 = (const __CFData *)ACFUFirmware::copyFWDataByTag(this, (const __CFString *)v1[4]);
      if (v6)
      {
        CFDataRef v7 = v6;
        CFDataRef v8 = ACFUFirmware::hashData(this, v6);
        CFRelease(v7);
        if (!v8) {
          break;
        }
        goto LABEL_16;
      }
      ACFUCommon::stringFromCFString((const __CFString *)v1[4], &__s);
      if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
      {
        if (__s.__r_.__value_.__l.__size_)
        {
          std::string::__init_copy_ctor_external(&v28, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
          goto LABEL_29;
        }
      }
      else if (*((unsigned char *)&__s.__r_.__value_.__s + 23))
      {
        std::string v28 = __s;
        goto LABEL_29;
      }
      uint64_t v10 = (ACFULogging *)std::string::basic_string[abi:ne180100]<0>(&v28, "UNDEF");
LABEL_29:
      if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__s.__r_.__value_.__l.__data_);
      }
      goto LABEL_31;
    }
    unsigned int v4 = (*(uint64_t (**)(ACFUFirmware *, void *))(*(void *)this + 40))(this, v1 + 5);
    if (!v4)
    {
      ACFUCommon::stringFromCFString((const __CFString *)v1[4], &__s);
      if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
      {
        if (__s.__r_.__value_.__l.__size_)
        {
          std::string::__init_copy_ctor_external(&v28, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
          goto LABEL_23;
        }
      }
      else if (*((unsigned char *)&__s.__r_.__value_.__s + 23))
      {
        std::string v28 = __s;
        goto LABEL_23;
      }
      uint64_t v10 = (ACFULogging *)std::string::basic_string[abi:ne180100]<0>(&v28, "UNDEF");
LABEL_23:
      if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__s.__r_.__value_.__l.__data_);
      }
LABEL_31:
      std::string __s = v28;
      LogInstance = ACFULogging::getLogInstance(v10);
      ACFULogging::handleMessage((uint64_t)LogInstance, 3u, "%s::%s: no fw for tag '%s'\n", v12, v13, v14, v15, v16, (char)"ACFUFirmware");
      if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__s.__r_.__value_.__l.__data_);
      }
      goto LABEL_33;
    }
    unsigned int v5 = v4;
    if (*((char *)v1 + 63) < 0) {
      std::string::__init_copy_ctor_external(&v27, (const std::string::value_type *)v1[5], v1[6]);
    }
    else {
      std::string v27 = *(std::string *)(v1 + 5);
    }
    uint64_t v9 = ACFUFirmware::hashData((uint64_t)this, (uint64_t)&v27, v5);
    CFDataRef v8 = v9;
    if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v27.__r_.__value_.__l.__data_);
    }
    if (!v8) {
      break;
    }
LABEL_16:
    CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 5), (const void *)v1[4], v8);
    CFRelease(v8);
LABEL_33:
    uint64_t v17 = (char *)v1[1];
    if (v17)
    {
      do
      {
        uint64_t v18 = v17;
        uint64_t v17 = *(char **)v17;
      }
      while (v17);
    }
    else
    {
      do
      {
        uint64_t v18 = (char *)v1[2];
        BOOL v19 = *(void *)v18 == (void)v1;
        uint64_t v1 = v18;
      }
      while (!v19);
    }
    uint64_t v1 = v18;
    if (v18 == v2) {
      return 1;
    }
  }
  uint64_t v21 = ACFULogging::getLogInstance(v9);
  ACFULogging::handleMessage((uint64_t)v21, 2u, "%s::%s: failed to measure fw\n", v22, v23, v24, v25, v26, (char)"ACFUFirmware");
  return 0;
}

void sub_22EF0ABC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a29 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL ACFUFirmware::setManifest(ACFUFirmware *this, const __CFData *a2)
{
  unsigned int v4 = (const void *)*((void *)this + 6);
  if (v4)
  {
    CFRelease(v4);
    *((void *)this + 6) = 0;
  }
  AMSupportSafeRetain();
  *((void *)this + 6) = a2;
  unsigned int v5 = ACFUFirmware::hashData(this, a2);
  LogInstance = ACFULogging::getLogInstance(v5);
  if (v5)
  {
    ACFULogging::handleMessage((uint64_t)LogInstance, 0, "%s::%s: Manifest digest\n", v7, v8, v9, v10, v11, (char)"ACFUFirmware");
    uint64_t v13 = ACFULogging::getLogInstance(v12);
    std::string::basic_string[abi:ne180100]<0>(&v21, "ACFUFirmware");
    uint64_t v14 = std::string::append(&v21, "::");
    long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
    v22.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v22.__r_.__value_.__l.__data_ = v15;
    v14->__r_.__value_.__l.__size_ = 0;
    v14->__r_.__value_.__r.__words[2] = 0;
    v14->__r_.__value_.__r.__words[0] = 0;
    uint64_t v16 = std::string::append(&v22, "setManifest");
    long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
    std::string::size_type v24 = v16->__r_.__value_.__r.__words[2];
    long long v23 = v17;
    v16->__r_.__value_.__l.__size_ = 0;
    v16->__r_.__value_.__r.__words[2] = 0;
    v16->__r_.__value_.__r.__words[0] = 0;
    BytePtr = CFDataGetBytePtr(v5);
    CFIndex Length = CFDataGetLength(v5);
    ACFULogging::handleMessageBinary((uint64_t)v13, (uint64_t *)&v23, 0, (uint64_t)BytePtr, Length, 1);
    if (SHIBYTE(v24) < 0) {
      operator delete((void *)v23);
    }
    if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v22.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v21.__r_.__value_.__l.__data_);
    }
    CFRelease(v5);
  }
  else
  {
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: Digest of manifest failed\n", v7, v8, v9, v10, v11, (char)"ACFUFirmware");
  }
  return v5 != 0;
}

void sub_22EF0AD80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

void std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy(a1, *(void *)a2);
    std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy(a1, *((void *)a2 + 1));
    if (a2[63] < 0) {
      operator delete(*((void **)a2 + 5));
    }
    operator delete(a2);
  }
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2649F9448, MEMORY[0x263F8C068]);
}

void sub_22EF0AE78(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

uint64_t **std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<__CFString const*,std::string>,std::__tree_node<std::__value_type<__CFString const*,std::string>,void *> *,long>>(uint64_t **result, void *a2, void *a3)
{
  unsigned int v5 = result;
  if (result[2])
  {
    CFDataRef v6 = *result;
    uint64_t v7 = result[1];
    std::logic_error *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1]) {
      uint64_t v8 = (uint64_t *)v6[1];
    }
    else {
      uint64_t v8 = v6;
    }
    uint64_t v14 = result;
    long long v15 = v8;
    uint64_t v16 = v8;
    if (v8)
    {
      long long v15 = std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::_DetachedTreeCache::__detach_next((uint64_t)v8);
      if (a2 != a3)
      {
        uint64_t v9 = a2;
        do
        {
          v8[4] = v9[4];
          std::string::operator=((std::string *)(v8 + 5), (const std::string *)(v9 + 5));
          std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__node_insert_multi(v5, v16);
          uint64_t v8 = v15;
          uint64_t v16 = v15;
          if (v15) {
            long long v15 = std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::_DetachedTreeCache::__detach_next((uint64_t)v15);
          }
          uint64_t v10 = (void *)v9[1];
          if (v10)
          {
            do
            {
              a2 = v10;
              uint64_t v10 = (void *)*v10;
            }
            while (v10);
          }
          else
          {
            do
            {
              a2 = (void *)v9[2];
              BOOL v11 = *a2 == (void)v9;
              uint64_t v9 = a2;
            }
            while (!v11);
          }
          if (!v8) {
            break;
          }
          uint64_t v9 = a2;
        }
        while (a2 != a3);
      }
    }
    uint64_t result = (uint64_t **)std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v14);
  }
  if (a2 != a3)
  {
    do
    {
      uint64_t result = (uint64_t **)std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__emplace_multi<std::pair<__CFString const* const,std::string> const&>((uint64_t)v5, (uint64_t)(a2 + 4));
      uint64_t v12 = (void *)a2[1];
      if (v12)
      {
        do
        {
          uint64_t v13 = v12;
          uint64_t v12 = (void *)*v12;
        }
        while (v12);
      }
      else
      {
        do
        {
          uint64_t v13 = (void *)a2[2];
          BOOL v11 = *v13 == (void)a2;
          a2 = v13;
        }
        while (!v11);
      }
      a2 = v13;
    }
    while (v13 != a3);
  }
  return result;
}

void sub_22EF0B01C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__node_insert_multi(uint64_t **a1, uint64_t *a2)
{
  int v3 = a1 + 1;
  unsigned int v4 = a1[1];
  if (v4)
  {
    do
    {
      while (1)
      {
        int v3 = (uint64_t **)v4;
        if (a2[4] >= (unint64_t)v4[4]) {
          break;
        }
        unsigned int v4 = (uint64_t *)*v4;
        unsigned int v5 = v3;
        if (!*v3) {
          goto LABEL_8;
        }
      }
      unsigned int v4 = (uint64_t *)v4[1];
    }
    while (v4);
    unsigned int v5 = v3 + 1;
  }
  else
  {
    unsigned int v5 = a1 + 1;
  }
LABEL_8:
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__insert_node_at(a1, (uint64_t)v3, v5, a2);
  return a2;
}

uint64_t *std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  unsigned int v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      unsigned int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            uint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            uint64_t v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            void *v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), unsigned int v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            int v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          int v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void *std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 16);
  if (result)
  {
    int v3 = (void *)*result;
    if (*result == a1)
    {
      void *result = 0;
      while (1)
      {
        unsigned int v4 = (void *)result[1];
        if (!v4) {
          break;
        }
        do
        {
          uint64_t result = v4;
          unsigned int v4 = (void *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; int v3 = (void *)result[1])
      {
        do
        {
          uint64_t result = v3;
          int v3 = (void *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy(*(void *)a1, *(char **)(a1 + 16));
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 16);
    if (v3)
    {
      do
      {
        uint64_t v2 = v3;
        uint64_t v3 = *(void *)(v3 + 16);
      }
      while (v3);
      *(void *)(a1 + 8) = v2;
    }
    std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy(*(void *)a1, (char *)v2);
  }
  return a1;
}

uint64_t *std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__emplace_multi<std::pair<__CFString const* const,std::string> const&>(uint64_t a1, uint64_t a2)
{
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__construct_node<std::pair<__CFString const* const,std::string> const&>(a1, a2, (uint64_t)&v7);
  uint64_t v3 = (uint64_t **)(a1 + 8);
  unsigned int v4 = *(uint64_t **)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        uint64_t v3 = (uint64_t **)v4;
        if (v7[4] >= (unint64_t)v4[4]) {
          break;
        }
        unsigned int v4 = (uint64_t *)*v4;
        unsigned int v5 = v3;
        if (!*v3) {
          goto LABEL_8;
        }
      }
      unsigned int v4 = (uint64_t *)v4[1];
    }
    while (v4);
    unsigned int v5 = v3 + 1;
  }
  else
  {
    unsigned int v5 = (uint64_t **)(a1 + 8);
  }
LABEL_8:
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__insert_node_at((uint64_t **)a1, (uint64_t)v3, v5, v7);
  return v7;
}

void std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__construct_node<std::pair<__CFString const* const,std::string> const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  int v6 = (char *)operator new(0x40uLL);
  *(void *)(a3 + 8) = v5;
  *(void *)a3 = v6;
  *(unsigned char *)(a3 + 16) = 0;
  *((void *)v6 + 4) = *(void *)a2;
  uint64_t v7 = (std::string *)(v6 + 40);
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)(a2 + 8), *(void *)(a2 + 16));
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)(a2 + 8);
    v7->__r_.__value_.__r.__words[2] = *(void *)(a2 + 24);
  }
  *(unsigned char *)(a3 + 16) = 1;
}

void sub_22EF0B450(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<__CFString const*,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<__CFString const*,std::string>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 63) < 0) {
      operator delete(__p[5]);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

void ACFUFTABFile::ACFUFTABFile(ACFUFTABFile *this)
{
  ACFUFile::ACFUFile(this);
  *(void *)uint64_t v1 = &unk_26E27FE90;
  *(void *)(v1 + 56) = 0;
  *(void *)(v1 + 48) = 0;
  *(void *)(v1 + 40) = v1 + 48;
  *(_DWORD *)(v1 + 64) = 0;
  *(void *)(v1 + 88) = 0;
  *(void *)(v1 + 80) = 0;
  *(void *)(v1 + 72) = v1 + 80;
}

{
  uint64_t v1;

  ACFUFile::ACFUFile(this);
  *(void *)uint64_t v1 = &unk_26E27FE90;
  *(void *)(v1 + 56) = 0;
  *(void *)(v1 + 48) = 0;
  *(void *)(v1 + 40) = v1 + 48;
  *(_DWORD *)(v1 + 64) = 0;
  *(void *)(v1 + 88) = 0;
  *(void *)(v1 + 80) = 0;
  *(void *)(v1 + 72) = v1 + 80;
}

void ACFUFTABFile::create(const __CFData *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, ACFUFile **a4@<X8>)
{
  int v8 = (ACFUFile *)operator new(0x60uLL);
  ACFUFile::ACFUFile(v8);
  *(void *)int v8 = &unk_26E27FE90;
  *((void *)v8 + 7) = 0;
  *((void *)v8 + 6) = 0;
  *((void *)v8 + 5) = (char *)v8 + 48;
  *((_DWORD *)v8 + 16) = 0;
  *((void *)v8 + 11) = 0;
  *((void *)v8 + 10) = 0;
  *((void *)v8 + 9) = (char *)v8 + 80;
  if ((a2 & 2) != 0)
  {
    ACFUFTABFile::~ACFUFTABFile(v8);
    operator delete(v34);
    uint64_t v36 = "%s::%s: function does not support memory optimization flow\n";
LABEL_16:
    LogInstance = ACFULogging::getLogInstance(v35);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v36, v38, v39, v40, v41, v42, (char)"ACFUFTABFile");
    int v8 = 0;
LABEL_12:
    *a4 = v8;
    return;
  }
  uint64_t v9 = (ACFULogging *)ACFUFTABFile::init(v8, a1);
  if ((v9 & 1) == 0)
  {
    uint64_t v35 = (ACFULogging *)(*(uint64_t (**)(ACFUFile *))(*(void *)v8 + 56))(v8);
    uint64_t v36 = "%s::%s: failed to open file\n";
    goto LABEL_16;
  }
  if (a3 == 0xFFFF)
  {
LABEL_9:
    if (a2 >= 3)
    {
      BOOL v19 = ACFULogging::getLogInstance(v9);
      uint64_t v25 = "%s::%s: invalid optimization mask\n";
      unsigned int v26 = 2;
    }
    else
    {
      *((_DWORD *)v8 + 16) = a2;
      BOOL v19 = ACFULogging::getLogInstance(v9);
      uint64_t v25 = "%s::%s: Object initialized!\n";
      unsigned int v26 = 4;
    }
    ACFULogging::handleMessage((uint64_t)v19, v26, v25, v20, v21, v22, v23, v24, (char)"ACFUFTABFile");
    goto LABEL_12;
  }
  ACFUFTABFile::embeddedFTABFilenamesForChipRevision((ACFUFTABFile *)a3, (uint64_t)v43);
  uint64_t v11 = v43[0];
  uint64_t v12 = v43[1];
  while (1)
  {
    if (v11 == v12)
    {
      uint64_t v13 = ACFULogging::getLogInstance(v10);
      ACFULogging::handleMessage((uint64_t)v13, 4u, "%s::%s: Didn't find a matching embedded ftab\n", v14, v15, v16, v17, v18, (char)"ACFUFTABFile");
      uint64_t v44 = (void **)v43;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v44);
      goto LABEL_9;
    }
    uint64_t v10 = (ACFULogging *)(*(uint64_t (**)(ACFUFile *, uint64_t))(*(void *)v8 + 16))(v8, v11);
    if (v10) {
      break;
    }
    v11 += 24;
  }
  std::string v27 = ACFULogging::getLogInstance(v10);
  ACFULogging::handleMessage((uint64_t)v27, 0, "%s::%s: Using embedded ftab '%s'\n", v28, v29, v30, v31, v32, (char)"ACFUFTABFile");
  uint64_t v33 = (**(uint64_t (***)(void *, uint64_t))v8)(v8, v11);
  ACFUFTABFile::create(v33, a2, 0xFFFFLL);
  uint64_t v44 = (void **)v43;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v44);
  (*(void (**)(ACFUFile *))(*(void *)v8 + 56))(v8);
}

void sub_22EF0B82C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 56))(v1);
  _Unwind_Resume(a1);
}

void ACFUFTABFile::embeddedFTABFilenamesForChipRevision(ACFUFTABFile *this@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  unsigned int v3 = this >> 4;
  if (this >= 0x40)
  {
    LogInstance = ACFULogging::getLogInstance(this);
    uint64_t v48 = "%s::%s: Chip major revision seems unreasonable: %d\n";
LABEL_32:
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v48, v43, v44, v45, v46, v47, (char)"ACFUFTABFile");
    return;
  }
  if ((this & 0xFu) >= 6)
  {
    LogInstance = ACFULogging::getLogInstance(this);
    uint64_t v48 = "%s::%s: Chip minor revision seems unreasonable: %d\n";
    goto LABEL_32;
  }
  unsigned int v4 = (ACFULogging *)snprintf(__str, 5uLL, "_%c%cf", v3 + 97, this & 0xF | 0x30u);
  uint64_t v5 = ACFULogging::getLogInstance(v4);
  ACFULogging::handleMessage((uint64_t)v5, 4u, "%s::%s: %s\n", v6, v7, v8, v9, v10, (char)"ACFUFTABFile");
  std::string::basic_string[abi:ne180100]<0>(__p, __str);
  unint64_t v11 = *(void *)(a2 + 16);
  unint64_t v12 = *(void *)(a2 + 8);
  if (v12 >= v11)
  {
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - *(void *)a2) >> 3);
    unint64_t v15 = v14 + 1;
    if (v14 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<ACFURTKitNVRMGenerator::RTKitNVRMVariable>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - *(void *)a2) >> 3);
    if (2 * v16 > v15) {
      unint64_t v15 = 2 * v16;
    }
    if (v16 >= 0x555555555555555) {
      unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v17 = v15;
    }
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a2 + 16);
    if (v17) {
      uint64_t v18 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<ACFURTKitNVRMGenerator::RTKitNVRMVariable>>(a2 + 16, v17);
    }
    else {
      uint64_t v18 = 0;
    }
    BOOL v19 = v18 + v14;
    __v.__first_ = v18;
    __v.__begin_ = v19;
    __v.__end_cap_.__value_ = &v18[v17];
    long long v20 = *(_OWORD *)__p;
    v19->__r_.__value_.__r.__words[2] = v50;
    *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
    __p[1] = 0;
    std::string::size_type v50 = 0;
    __p[0] = 0;
    __v.__end_ = v19 + 1;
    std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a2, &__v);
    uint64_t v21 = *(void *)(a2 + 8);
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    int v22 = SHIBYTE(v50);
    *(void *)(a2 + 8) = v21;
    if (v22 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    long long v13 = *(_OWORD *)__p;
    *(void *)(v12 + 16) = v50;
    *(_OWORD *)unint64_t v12 = v13;
    *(void *)(a2 + 8) = v12 + 24;
  }
  uint64_t v23 = (ACFULogging *)snprintf(__str, 5uLL, "_%cxf", v3 + 97);
  uint64_t v24 = ACFULogging::getLogInstance(v23);
  ACFULogging::handleMessage((uint64_t)v24, 4u, "%s::%s: %s\n", v25, v26, v27, v28, v29, (char)"ACFUFTABFile");
  std::string::basic_string[abi:ne180100]<0>(__p, __str);
  unint64_t v31 = *(void *)(a2 + 8);
  unint64_t v30 = *(void *)(a2 + 16);
  if (v31 >= v30)
  {
    unint64_t v33 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v31 - *(void *)a2) >> 3);
    unint64_t v34 = v33 + 1;
    if (v33 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<ACFURTKitNVRMGenerator::RTKitNVRMVariable>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v35 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v30 - *(void *)a2) >> 3);
    if (2 * v35 > v34) {
      unint64_t v34 = 2 * v35;
    }
    if (v35 >= 0x555555555555555) {
      unint64_t v36 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v36 = v34;
    }
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a2 + 16);
    if (v36) {
      uint64_t v37 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<ACFURTKitNVRMGenerator::RTKitNVRMVariable>>(a2 + 16, v36);
    }
    else {
      uint64_t v37 = 0;
    }
    uint64_t v38 = v37 + v33;
    __v.__first_ = v37;
    __v.__begin_ = v38;
    __v.__end_cap_.__value_ = &v37[v36];
    long long v39 = *(_OWORD *)__p;
    v38->__r_.__value_.__r.__words[2] = v50;
    *(_OWORD *)&v38->__r_.__value_.__l.__data_ = v39;
    __p[1] = 0;
    std::string::size_type v50 = 0;
    __p[0] = 0;
    __v.__end_ = v38 + 1;
    std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a2, &__v);
    uint64_t v40 = *(void *)(a2 + 8);
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    int v41 = SHIBYTE(v50);
    *(void *)(a2 + 8) = v40;
    if (v41 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    long long v32 = *(_OWORD *)__p;
    *(void *)(v31 + 16) = v50;
    *(_OWORD *)unint64_t v31 = v32;
    *(void *)(a2 + 8) = v31 + 24;
  }
}

void sub_22EF0BBD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *__p, uint64_t a5, int a6, __int16 a7, char a8, char a9, uint64_t a10, std::__split_buffer<std::string> *a11, void *__pa, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19)
{
  if (a17 < 0) {
    operator delete(__pa);
  }
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  _Unwind_Resume(a1);
}

void ACFUFTABFile::create(__CFData *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, ACFUFile **a4@<X8>)
{
  uint64_t v8 = (ACFUFile *)operator new(0x60uLL);
  ACFUFile::ACFUFile(v8);
  *(void *)uint64_t v8 = &unk_26E27FE90;
  *((void *)v8 + 7) = 0;
  *((void *)v8 + 6) = 0;
  *((void *)v8 + 5) = (char *)v8 + 48;
  *((_DWORD *)v8 + 16) = 0;
  *((void *)v8 + 11) = 0;
  *((void *)v8 + 10) = 0;
  *((void *)v8 + 9) = (char *)v8 + 80;
  if ((a2 & 2) != 0)
  {
    ACFUFTABFile::~ACFUFTABFile(v8);
    operator delete(v34);
    unint64_t v36 = "%s::%s: function does not support memory optimization flow\n";
LABEL_16:
    LogInstance = ACFULogging::getLogInstance(v35);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v36, v38, v39, v40, v41, v42, (char)"ACFUFTABFile");
    uint64_t v8 = 0;
LABEL_12:
    *a4 = v8;
    return;
  }
  uint64_t v9 = (ACFULogging *)ACFUFTABFile::init(v8, a1);
  if ((v9 & 1) == 0)
  {
    unint64_t v35 = (ACFULogging *)(*(uint64_t (**)(ACFUFile *))(*(void *)v8 + 56))(v8);
    unint64_t v36 = "%s::%s: failed to open file\n";
    goto LABEL_16;
  }
  if (a3 == 0xFFFF)
  {
LABEL_9:
    if (a2 >= 3)
    {
      BOOL v19 = ACFULogging::getLogInstance(v9);
      uint64_t v25 = "%s::%s: invalid optimization mask\n";
      unsigned int v26 = 2;
    }
    else
    {
      *((_DWORD *)v8 + 16) = a2;
      BOOL v19 = ACFULogging::getLogInstance(v9);
      uint64_t v25 = "%s::%s: Object initialized!\n";
      unsigned int v26 = 4;
    }
    ACFULogging::handleMessage((uint64_t)v19, v26, v25, v20, v21, v22, v23, v24, (char)"ACFUFTABFile");
    goto LABEL_12;
  }
  ACFUFTABFile::embeddedFTABFilenamesForChipRevision((ACFUFTABFile *)a3, (uint64_t)v43);
  uint64_t v11 = v43[0];
  uint64_t v12 = v43[1];
  while (1)
  {
    if (v11 == v12)
    {
      long long v13 = ACFULogging::getLogInstance(v10);
      ACFULogging::handleMessage((uint64_t)v13, 4u, "%s::%s: Didn't find a matching embedded ftab\n", v14, v15, v16, v17, v18, (char)"ACFUFTABFile");
      uint64_t v44 = (void **)v43;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v44);
      goto LABEL_9;
    }
    uint64_t v10 = (ACFULogging *)(*(uint64_t (**)(ACFUFile *, uint64_t))(*(void *)v8 + 16))(v8, v11);
    if (v10) {
      break;
    }
    v11 += 24;
  }
  uint64_t v27 = ACFULogging::getLogInstance(v10);
  ACFULogging::handleMessage((uint64_t)v27, 0, "%s::%s: Using embedded ftab '%s'\n", v28, v29, v30, v31, v32, (char)"ACFUFTABFile");
  CFDataRef v33 = (const __CFData *)(**(uint64_t (***)(void *, uint64_t))v8)(v8, v11);
  ACFUFTABFile::create(v33, a2, 0xFFFF, a4);
  uint64_t v44 = (void **)v43;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v44);
  (*(void (**)(ACFUFile *))(*(void *)v8 + 56))(v8);
}

void sub_22EF0BED8(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 56))(v1);
  _Unwind_Resume(a1);
}

void ACFUFTABFile::create(const __CFString *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, ACFUFile **a4@<X8>)
{
  uint64_t v8 = (ACFUFile *)operator new(0x60uLL);
  ACFUFile::ACFUFile(v8);
  *(void *)uint64_t v8 = &unk_26E27FE90;
  *((void *)v8 + 7) = 0;
  *((void *)v8 + 6) = 0;
  *((void *)v8 + 5) = (char *)v8 + 48;
  *((_DWORD *)v8 + 16) = 0;
  *((void *)v8 + 11) = 0;
  *((void *)v8 + 10) = 0;
  *((void *)v8 + 9) = (char *)v8 + 80;
  if (a2 >= 3)
  {
    ACFUFTABFile::~ACFUFTABFile(v8);
    operator delete(v32);
    unint64_t v34 = "%s::%s: invalid optimization mask\n";
LABEL_14:
    LogInstance = ACFULogging::getLogInstance(v33);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v34, v36, v37, v38, v39, v40, (char)"ACFUFTABFile");
    uint64_t v8 = 0;
    goto LABEL_10;
  }
  uint64_t v9 = ACFUFTABFile::init(v8, a1, (const __CFString *)((a2 >> 1) & 1));
  if ((v9 & 1) == 0)
  {
    CFDataRef v33 = (ACFULogging *)(*(uint64_t (**)(ACFUFile *))(*(void *)v8 + 56))(v8);
    unint64_t v34 = "%s::%s: failed to open file\n";
    goto LABEL_14;
  }
  if (a3 == 0xFFFF)
  {
LABEL_9:
    *((_DWORD *)v8 + 16) = a2;
    BOOL v19 = ACFULogging::getLogInstance((ACFULogging *)v9);
    ACFULogging::handleMessage((uint64_t)v19, 4u, "%s::%s: Object initialized!\n", v20, v21, v22, v23, v24, (char)"ACFUFTABFile");
LABEL_10:
    *a4 = v8;
    return;
  }
  ACFUFTABFile::embeddedFTABFilenamesForChipRevision((ACFUFTABFile *)a3, (uint64_t)v41);
  uint64_t v11 = v41[0];
  uint64_t v12 = v41[1];
  while (1)
  {
    if (v11 == v12)
    {
      long long v13 = ACFULogging::getLogInstance(v10);
      ACFULogging::handleMessage((uint64_t)v13, 4u, "%s::%s: Didn't find a matching embedded ftab\n", v14, v15, v16, v17, v18, (char)"ACFUFTABFile");
      uint64_t v42 = (void **)v41;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v42);
      goto LABEL_9;
    }
    uint64_t v10 = (ACFULogging *)(*(uint64_t (**)(ACFUFile *, uint64_t))(*(void *)v8 + 16))(v8, v11);
    if (v10) {
      break;
    }
    v11 += 24;
  }
  uint64_t v25 = ACFULogging::getLogInstance(v10);
  ACFULogging::handleMessage((uint64_t)v25, 0, "%s::%s: Using embedded ftab '%s'\n", v26, v27, v28, v29, v30, (char)"ACFUFTABFile");
  CFDataRef v31 = (const __CFData *)(**(uint64_t (***)(void *, uint64_t))v8)(v8, v11);
  ACFUFTABFile::create(v31, a2, 0xFFFF, a4);
  uint64_t v42 = (void **)v41;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v42);
  (*(void (**)(ACFUFile *))(*(void *)v8 + 56))(v8);
}

void sub_22EF0C1DC(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 56))(v1);
  _Unwind_Resume(a1);
}

void ACFUFTABFile::createFromHeader(ACFUFTABFile *this@<X0>, ACFUFile **a2@<X8>)
{
  uint64_t v5 = (ACFUFile *)operator new(0x60uLL);
  ACFUFile::ACFUFile(v5);
  *(void *)uint64_t v5 = &unk_26E27FE90;
  *((void *)v5 + 7) = 0;
  *((void *)v5 + 6) = 0;
  *((void *)v5 + 5) = (char *)v5 + 48;
  *((_DWORD *)v5 + 16) = 0;
  *((void *)v5 + 11) = 0;
  *((void *)v5 + 10) = 0;
  *((void *)v5 + 9) = (char *)v5 + 80;
  *a2 = v5;
  uint64_t v6 = (ACFULogging *)ACFUFTABFile::initFromHeader(v5, this);
  if (v6)
  {
    LogInstance = ACFULogging::getLogInstance(v6);
    ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: Object initialized!\n", v8, v9, v10, v11, v12, (char)"ACFUFTABFile");
  }
  else
  {
    *a2 = 0;
    long long v13 = (ACFULogging *)(*(uint64_t (**)(ACFUFile *))(*(void *)v5 + 56))(v5);
    uint64_t v14 = ACFULogging::getLogInstance(v13);
    ACFULogging::handleMessage((uint64_t)v14, 2u, "%s::%s: failed to initialize\n", v15, v16, v17, v18, v19, (char)"ACFUFTABFile");
  }
}

void sub_22EF0C35C(_Unwind_Exception *exception_object)
{
  *uint64_t v1 = 0;
  _Unwind_Resume(exception_object);
}

uint64_t ACFUFTABFile::initFromHeader(ACFUFTABFile *this, const __CFData *a2)
{
  *((void *)this + 3) = @"ftab.bin";
  Requiredoff_t FileSize = (ACFULogging *)ACFUFTABFile::getRequiredFileSize(this, a2);
  LogInstance = ACFULogging::getLogInstance(RequiredFileSize);
  if (!RequiredFileSize)
  {
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to compute required size\n", v6, v7, v8, v9, v10, (char)"ACFUFTABFile");
    return 0;
  }
  ACFULogging::handleMessage((uint64_t)LogInstance, 3u, "%s::%s: required size %llu\n", v6, v7, v8, v9, v10, (char)"ACFUFTABFile");
  MutableCFStringRef Copy = CFDataCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, a2);
  CFDataSetLength(MutableCopy, (CFIndex)RequiredFileSize);
  uint64_t inited = ACFUFile::init(this, MutableCopy);
  if (!inited)
  {
    uint64_t v15 = "%s::%s: firmware file failed to initialize\n";
    goto LABEL_14;
  }
  uint64_t inited = (*(uint64_t (**)(ACFUFTABFile *))(*(void *)this + 88))(this);
  if (!inited)
  {
    uint64_t v15 = "%s::%s: firmware file is invalid\n";
    goto LABEL_14;
  }
  uint64_t inited = ACFUFTABFile::initCache(this);
  if (!inited)
  {
    uint64_t v15 = "%s::%s: failed to initialize file cache\n";
    goto LABEL_14;
  }
  uint64_t inited = ACFUFTABFile::isCacheValid(this);
  if ((inited & 1) == 0)
  {
    uint64_t v15 = "%s::%s: cache is invalid\n";
LABEL_14:
    uint64_t v16 = ACFULogging::getLogInstance((ACFULogging *)inited);
    ACFULogging::handleMessage((uint64_t)v16, 2u, v15, v17, v18, v19, v20, v21, (char)"ACFUFTABFile");
    uint64_t v13 = 0;
    if (!MutableCopy) {
      return v13;
    }
    goto LABEL_7;
  }
  uint64_t v13 = 1;
  if (MutableCopy) {
LABEL_7:
  }
    CFRelease(MutableCopy);
  return v13;
}

uint64_t ACFUFTABFile::setManifest(ACFUDataContainer **this, const __CFData *a2)
{
  return ACFUFTABFile::setManifestOnData(this, a2, 0);
}

uint64_t ACFUFTABFile::setManifestOnData(ACFUDataContainer **this, CFDataRef theData, __CFData **a3)
{
  uint64_t v5 = (ACFUFTABFile *)this;
  if (!a3)
  {
    uint64_t v6 = this[1];
    if (!v6)
    {
      LogInstance = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: file data must be valid or firmware data must be provided\n", v74, v75, v76, v77, v78, (char)"ACFUFTABFile");
      return 0;
    }
    this = (ACFUDataContainer **)ACFUDataContainer::isOptimized(v6);
    if (this)
    {
      char v79 = ACFULogging::getLogInstance((ACFULogging *)this);
      ACFULogging::handleMessage((uint64_t)v79, 2u, "%s::%s: function cannot directly manipulate file data with optimized flow\n", v80, v81, v82, v83, v84, (char)"ACFUFTABFile");
      return 0;
    }
  }
  if (!theData)
  {
    uint64_t v43 = ACFULogging::getLogInstance((ACFULogging *)this);
    ACFULogging::handleMessage((uint64_t)v43, 2u, "%s::%s: no manifest input provided\n", v44, v45, v46, v47, v48, (char)"ACFUFTABFile");
    return 0;
  }
  CFIndex Length = (ACFULogging *)CFDataGetLength(theData);
  if ((uint64_t)Length <= 0)
  {
    uint64_t v49 = ACFULogging::getLogInstance(Length);
    ACFULogging::handleMessage((uint64_t)v49, 2u, "%s::%s: manifest data has no bytes\n", v50, v51, v52, v53, v54, (char)"ACFUFTABFile");
    return 0;
  }
  if (a3)
  {
    if (!*a3)
    {
      uint64_t v55 = ACFULogging::getLogInstance(Length);
      ACFULogging::handleMessage((uint64_t)v55, 2u, "%s::%s: firmware data container is invalid\n", v56, v57, v58, v59, v60, (char)"ACFUFTABFile");
      return 0;
    }
    uint64_t isValidFileData = ACFUFTABFile::isValidFileData(v5, *a3, 0);
    if ((isValidFileData & 1) == 0)
    {
      uint64_t v61 = ACFULogging::getLogInstance((ACFULogging *)isValidFileData);
      ACFULogging::handleMessage((uint64_t)v61, 2u, "%s::%s: firmware data is invalid and does not meet ftab standards\n", v62, v63, v64, v65, v66, (char)"ACFUFTABFile");
      return 0;
    }
    if (*((_DWORD *)v5 + 16) != 1)
    {
      CFDataRef v9 = *a3;
      if (*a3) {
        goto LABEL_11;
      }
      goto LABEL_25;
    }
  }
  else if (*((_DWORD *)v5 + 16) != 1)
  {
    uint64_t isValidFileData = ACFUDataContainer::getData(*((ACFUDataContainer **)v5 + 1));
    CFDataRef v9 = (const __CFData *)isValidFileData;
    if (isValidFileData)
    {
LABEL_11:
      int v10 = *((_DWORD *)CFDataGetBytePtr(v9) + 10);
      CFIndex v11 = CFDataGetLength(theData);
      BytePtr = (UInt8 *)CFDataGetBytePtr(v9);
      if (*((_DWORD *)BytePtr + 5))
      {
        uint64_t v13 = ACFULogging::getLogInstance((ACFULogging *)BytePtr);
        ACFULogging::handleMessage((uint64_t)v13, 0, "%s::%s: manifest existing in FTAB is being deleted\n", v14, v15, v16, v17, v18, (char)"ACFUFTABFile");
        ACFUFTABFile::removeManifestPadding(v19, v9);
        CFIndex v20 = *((unsigned int *)CFDataGetBytePtr(v9) + 4);
        v86.length = *((unsigned int *)CFDataGetBytePtr(v9) + 5);
        v86.location = v20;
        CFDataDeleteBytes(v9, v86);
        *((_DWORD *)CFDataGetBytePtr(v9) + 4) = 0;
        *((_DWORD *)CFDataGetBytePtr(v9) + 5) = 0;
      }
      CFIndex v21 = CFDataGetLength(v9);
      unsigned int v22 = v10 - 1;
      int v23 = *(_DWORD *)&CFDataGetBytePtr(v9)[16 * v22 + 52];
      uint64_t v24 = (ACFULogging *)CFDataGetBytePtr(v9);
      uint64_t v25 = ((*((_DWORD *)v24 + 4 * v22 + 14) + v23) + 3) & 0x1FFFFFFFCLL;
      BOOL v26 = __OFSUB__(v25, v21);
      CFIndex v27 = v25 - v21;
      if (v27 < 0 != v26)
      {
        uint64_t v67 = ACFULogging::getLogInstance(v24);
        ACFULogging::handleMessage((uint64_t)v67, 2u, "%s::%s: something went wrong, extra bytes in file\n", v68, v69, v70, v71, v72, (char)"ACFUFTABFile");
      }
      else
      {
        if (!((v27 < 0) ^ v26 | (v27 == 0)))
        {
          uint64_t v28 = ACFULogging::getLogInstance(v24);
          ACFULogging::handleMessage((uint64_t)v28, 0, "%s::%s: padding %ld byte(s) at the end of ftab\n", v29, v30, v31, v32, v33, (char)"ACFUFTABFile");
          CFDataIncreaseLength(v9, v27);
        }
        *((_DWORD *)CFDataGetBytePtr(v9) + 5) = v11;
        *((_DWORD *)CFDataGetBytePtr(v9) + 4) = v25;
        unint64_t v34 = CFDataGetBytePtr(theData);
        CFDataAppendBytes(v9, v34, v11);
        if (a3)
        {
          CFDataRef v35 = *a3;
          return ACFUFTABFile::isValidFileData(v5, v35, 0);
        }
        if ((*(unsigned int (**)(ACFUFTABFile *))(*(void *)v5 + 88))(v5))
        {
          return ACFUFTABFile::isCacheValid(v5);
        }
      }
      return 0;
    }
LABEL_25:
    uint64_t v37 = ACFULogging::getLogInstance((ACFULogging *)isValidFileData);
    ACFULogging::handleMessage((uint64_t)v37, 2u, "%s::%s: could not obtain file data\n", v38, v39, v40, v41, v42, (char)"ACFUFTABFile");
    return 0;
  }
  return ACFUFTABFile::setManifestToTopOnData(v5, theData, 0);
}

uint64_t ACFUFTABFile::isValidFileData(ACFUFTABFile *this, CFDataRef theData, char a3)
{
  CFDataRef v6 = theData;
  if (!theData)
  {
    uint64_t v8 = (ACFUDataContainer **)((char *)this + 8);
    isOptimized = (ACFUDataContainer *)*((void *)this + 1);
    if (!isOptimized)
    {
      CFDataRef v6 = 0;
      long long v108 = "%s::%s: no file data?!\n";
      goto LABEL_69;
    }
    isOptimized = (ACFUDataContainer *)ACFUDataContainer::isOptimized(isOptimized);
    if (isOptimized)
    {
      if (a3)
      {
        CFDataRef v6 = 0;
        long long v108 = "%s::%s: header only validation unsupported with optimized data\n";
        goto LABEL_69;
      }
      isOptimized = ACFUDataContainer::copyData(*v8, 0, 0x30uLL);
      CFDataRef v6 = isOptimized;
      if (isOptimized)
      {
        isOptimized = (ACFUDataContainer *)CFDataGetBytePtr(isOptimized);
        if (!isOptimized)
        {
LABEL_68:
          long long v108 = "%s::%s: failed to get byte pointer\n";
          goto LABEL_69;
        }
        CFDataRef v9 = (const UInt8 *)isOptimized;
        isOptimized = ACFUDataContainer::copyData(*v8, 16 * *((_DWORD *)isOptimized + 10) + 32, 0x10uLL);
        if (isOptimized)
        {
          int v10 = isOptimized;
          BytePtr = CFDataGetBytePtr(isOptimized);
          if (BytePtr)
          {
            uint64_t v12 = &v9[*((unsigned int *)BytePtr + 1) + *((unsigned int *)BytePtr + 2)];
            CFRelease(v10);
            uint64_t v14 = v9;
            goto LABEL_12;
          }
          CFRelease(v10);
          goto LABEL_68;
        }
        long long v108 = "%s::%s: failed to aquire ftab file header\n";
LABEL_69:
        LogInstance = ACFULogging::getLogInstance(isOptimized);
        ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v108, v110, v111, v112, v113, v114, (char)"ACFUFTABFile");
        std::unique_ptr<ACFUDataContainer>::reset[abi:ne180100](v8, 0);
        goto LABEL_61;
      }
LABEL_64:
      long long v108 = "%s::%s: failed to copy ftab header\n";
      goto LABEL_69;
    }
    isOptimized = ACFUDataContainer::copyData(*v8);
    CFDataRef v6 = isOptimized;
    if (!isOptimized) {
      goto LABEL_64;
    }
  }
  CFDataRef v9 = CFDataGetBytePtr(v6);
  uint64_t v14 = CFDataGetBytePtr(v6);
  CFIndex Length = (ACFULogging *)CFDataGetLength(v6);
  uint64_t v12 = &v14[(void)Length];
LABEL_12:
  if ((unint64_t)(v12 - v14) <= 0x30)
  {
    uint64_t v72 = ACFULogging::getLogInstance(Length);
    ACFULogging::handleMessage((uint64_t)v72, 2u, "%s::%s: file is smaller than the ftab header size\n", v73, v74, v75, v76, v77, (char)"ACFUFTABFile");
    goto LABEL_58;
  }
  uint64_t v15 = *((unsigned int *)v9 + 10);
  unint64_t v16 = (unint64_t)&v14[16 * v15 + 48];
  if (v16 > (unint64_t)v12)
  {
    uint64_t v78 = ACFULogging::getLogInstance(Length);
    ACFULogging::handleMessage((uint64_t)v78, 2u, "%s::%s: header is bigger than the file\n", v79, v80, v81, v82, v83, (char)"ACFUFTABFile");
    goto LABEL_58;
  }
  uint64_t v17 = *((unsigned int *)v9 + 5);
  uint64_t v18 = &v14[*((unsigned int *)v9 + 4)];
  if ((a3 & 1) == 0 && &v18[v17] > v12)
  {
    uint64_t v84 = ACFULogging::getLogInstance(Length);
    ACFULogging::handleMessage((uint64_t)v84, 2u, "%s::%s: manifest present beyond the bounds of the file data\n", v85, v86, v87, v88, v89, (char)"ACFUFTABFile");
    goto LABEL_58;
  }
  if (*((void *)v9 + 4) != 0x62617466736F6B72)
  {
    long long v90 = ACFULogging::getLogInstance(Length);
    ACFULogging::handleMessage((uint64_t)v90, 2u, "%s::%s: invalid FTAB file\n", v91, v92, v93, v94, v95, (char)"ACFUFTABFile");
    goto LABEL_58;
  }
  if ((v15 - 1) >= 0x4F)
  {
    long long v96 = ACFULogging::getLogInstance(Length);
    ACFULogging::handleMessage((uint64_t)v96, 2u, "%s::%s: too many files specified or there are no files. Limit is %d. Num Files: %d\n", v97, v98, v99, v100, v101, (char)"ACFUFTABFile");
    goto LABEL_58;
  }
  if (v17 && (unint64_t)v18 < v16)
  {
    long long v102 = ACFULogging::getLogInstance(Length);
    ACFULogging::handleMessage((uint64_t)v102, 2u, "%s::%s: manifest present in space allocated for header\n", v103, v104, v105, v106, v107, (char)"ACFUFTABFile");
LABEL_58:
    uint64_t v30 = 0;
    if (theData) {
      return 0;
    }
    goto LABEL_59;
  }
  CFDataRef cf = v6;
  if (theData)
  {
    uint64_t v19 = 0;
    unint64_t v20 = 0;
    while (1)
    {
      uint64_t v21 = *(unsigned int *)&CFDataGetBytePtr(theData)[v19 + 52];
      unsigned int v22 = (ACFULogging *)CFDataGetBytePtr(theData);
      if ((a3 & 1) == 0)
      {
        int v23 = &v14[v21 + *(unsigned int *)((char *)v22 + v19 + 56)];
        if (v23 > v12 || (unint64_t)v23 < v16)
        {
          uint64_t v60 = ACFULogging::getLogInstance(v22);
          ACFULogging::handleMessage((uint64_t)v60, 2u, "%s::%s: Payload is out of valid range\n", v61, v62, v63, v64, v65, (char)"ACFUFTABFile");
          goto LABEL_49;
        }
      }
      uint64_t v25 = (ACFULogging *)CFDataGetBytePtr(theData);
      if ((unint64_t)&v14[*(unsigned int *)((char *)v25 + v19 + 52)] < v16) {
        break;
      }
      ++v20;
      v19 += 16;
      if (v20 >= *((unsigned int *)v9 + 10)) {
        return 1;
      }
    }
    uint64_t v36 = ACFULogging::getLogInstance(v25);
    ACFULogging::handleMessage((uint64_t)v36, 2u, "%s::%s: File indicated is within header space\n", v37, v38, v39, v40, v41, (char)"ACFUFTABFile");
LABEL_49:
    uint64_t v30 = 0;
LABEL_50:
    CFDataRef v6 = cf;
    if (theData) {
      return 0;
    }
LABEL_59:
    std::unique_ptr<ACFUDataContainer>::reset[abi:ne180100]((ACFUDataContainer **)this + 1, 0);
    if (v30) {
      CFRelease(v30);
    }
LABEL_61:
    uint64_t v26 = 0;
    if (!v6) {
      return v26;
    }
    goto LABEL_43;
  }
  unsigned int v27 = 0;
  unsigned int v28 = 48;
  do
  {
    uint64_t v29 = ACFUDataContainer::copyData(*((ACFUDataContainer **)this + 1), v28, 0x10uLL);
    uint64_t v30 = v29;
    if (!v29)
    {
      uint64_t v42 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v42, 2u, "%s::%s: failed to acquire ftab file header\n", v43, v44, v45, v46, v47, (char)"ACFUFTABFile");
      goto LABEL_50;
    }
    uint64_t v31 = (unsigned int *)CFDataGetBytePtr(v29);
    if (!v31)
    {
      uint64_t v48 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v48, 2u, "%s::%s: failed to acquire cf data byte pointer\n", v49, v50, v51, v52, v53, (char)"ACFUFTABFile");
      goto LABEL_50;
    }
    uint64_t v32 = &v14[v31[1]];
    if ((a3 & 1) == 0)
    {
      unint64_t v33 = (unint64_t)&v32[v31[2]];
      if (v33 > (unint64_t)v12 || v33 < v16)
      {
        uint64_t v66 = ACFULogging::getLogInstance((ACFULogging *)v31);
        ACFULogging::handleMessage((uint64_t)v66, 2u, "%s::%s: payload is out of valid range\n", v67, v68, v69, v70, v71, (char)"ACFUFTABFile");
        goto LABEL_50;
      }
    }
    if ((unint64_t)v32 < v16)
    {
      uint64_t v54 = ACFULogging::getLogInstance((ACFULogging *)v31);
      ACFULogging::handleMessage((uint64_t)v54, 2u, "%s::%s: file indicated is within header space\n", v55, v56, v57, v58, v59, (char)"ACFUFTABFile");
      goto LABEL_50;
    }
    CFRelease(v30);
    ++v27;
    v28 += 16;
  }
  while (v27 < *((_DWORD *)v9 + 10));
  uint64_t v26 = 1;
  CFDataRef v6 = cf;
  if (!cf) {
    return v26;
  }
LABEL_43:
  CFRelease(v6);
  return v26;
}

uint64_t ACFUFTABFile::setManifestToTopOnData(ACFUFTABFile *this, const __CFData *a2, __CFData **a3)
{
  if (!a3)
  {
    uint64_t v70 = (ACFUDataContainer *)*((void *)this + 1);
    if (!v70)
    {
      LogInstance = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: file data must be valid or firmware data must be provided\n", v125, v126, v127, v128, v129, (char)"ACFUFTABFile");
      return 0;
    }
    isOptimized = (ACFULogging *)ACFUDataContainer::isOptimized(v70);
    if (isOptimized)
    {
      v130 = ACFULogging::getLogInstance(isOptimized);
      ACFULogging::handleMessage((uint64_t)v130, 2u, "%s::%s: function cannot directly manipulate file data with optimized flow\n", v131, v132, v133, v134, v135, (char)"ACFUFTABFile");
      return 0;
    }
    uint64_t Data = ACFUDataContainer::getData(*((ACFUDataContainer **)this + 1));
    CFDataRef v7 = (const __CFData *)Data;
    if (Data) {
      goto LABEL_5;
    }
LABEL_25:
    uint64_t v72 = ACFULogging::getLogInstance((ACFULogging *)Data);
    ACFULogging::handleMessage((uint64_t)v72, 2u, "%s::%s: could not obtain file data\n", v73, v74, v75, v76, v77, (char)"ACFUFTABFile");
    return 0;
  }
  if (!*a3)
  {
    uint64_t v105 = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)v105, 2u, "%s::%s: firmware data container is invalid\n", v106, v107, v108, v109, v110, (char)"ACFUFTABFile");
    return 0;
  }
  uint64_t Data = ACFUFTABFile::isValidFileData(this, *a3, 0);
  if ((Data & 1) == 0)
  {
    uint64_t v111 = ACFULogging::getLogInstance((ACFULogging *)Data);
    ACFULogging::handleMessage((uint64_t)v111, 2u, "%s::%s: firmware data is invalid and does not meet ftab standards\n", v112, v113, v114, v115, v116, (char)"ACFUFTABFile");
    return 0;
  }
  CFDataRef v7 = *a3;
  if (!*a3) {
    goto LABEL_25;
  }
LABEL_5:
  uint64_t v8 = *((unsigned int *)CFDataGetBytePtr(v7) + 10);
  BytePtr = (UInt8 *)CFDataGetBytePtr(v7);
  if (*((_DWORD *)BytePtr + 5))
  {
    int v10 = ACFULogging::getLogInstance((ACFULogging *)BytePtr);
    ACFULogging::handleMessage((uint64_t)v10, 0, "%s::%s: manifest existing in FTAB is being deleted\n", v11, v12, v13, v14, v15, (char)"ACFUFTABFile");
    int v17 = ACFUFTABFile::removeManifestPadding(v16, v7);
    CFIndex v18 = *((unsigned int *)CFDataGetBytePtr(v7) + 4);
    v149.length = *((unsigned int *)CFDataGetBytePtr(v7) + 5);
    v149.location = v18;
    CFDataDeleteBytes(v7, v149);
    if (v17 && v8)
    {
      uint64_t v19 = 0;
      do
      {
        int v20 = *((_DWORD *)CFDataGetBytePtr(v7) + 5);
        uint64_t v21 = CFDataGetBytePtr(v7);
        *(_DWORD *)&v21[v19 + 52] -= v20;
        v19 += 16;
      }
      while (16 * v8 != v19);
    }
    *((_DWORD *)CFDataGetBytePtr(v7) + 4) = 0;
    *((_DWORD *)CFDataGetBytePtr(v7) + 5) = 0;
  }
  CFMutableDataRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (!Mutable)
  {
    uint64_t v99 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v99, 2u, "%s::%s: could not allocate data\n", v100, v101, v102, v103, v104, (char)"ACFUFTABFile");
    return 0;
  }
  v146 = Mutable;
  v142 = CFDataGetBytePtr(v7);
  uint64_t v138 = *((unsigned int *)CFDataGetBytePtr(v7) + 13);
  uint64_t v144 = *(unsigned int *)&CFDataGetBytePtr(v7)[16 * (v8 - 1) + 52];
  uint64_t v143 = *(unsigned int *)&CFDataGetBytePtr(v7)[16 * (v8 - 1) + 56];
  int v23 = *((_DWORD *)CFDataGetBytePtr(v7) + 13);
  unsigned int v24 = ((v23 + 3) & 0xFFFFFFFC) - v23;
  unsigned int v25 = v24 + *((_DWORD *)CFDataGetBytePtr(v7) + 13);
  *((_DWORD *)CFDataGetBytePtr(v7) + 4) = v25;
  CFDataRef theData = a2;
  int Length = CFDataGetLength(a2);
  unsigned int v27 = (UInt8 *)CFDataGetBytePtr(v7);
  *((_DWORD *)v27 + 5) = Length;
  unsigned int v28 = ACFULogging::getLogInstance((ACFULogging *)v27);
  CFDataGetBytePtr(v7);
  CFDataGetBytePtr(v7);
  ACFULogging::handleMessage((uint64_t)v28, 0, "%s::%s: manifestOffset: %u, manifestSize: %u\n", v29, v30, v31, v32, v33, (char)"ACFUFTABFile");
  int v34 = *((_DWORD *)CFDataGetBytePtr(v7) + 4);
  CFDataRef v35 = (UInt8 *)CFDataGetBytePtr(v7);
  int v36 = *((_DWORD *)v35 + 5) + v34;
  CFIndex v37 = v24;
  CFIndex v38 = ((v36 + 3) & 0xFFFFFFFC) - v36;
  uint64_t v39 = ACFULogging::getLogInstance((ACFULogging *)v35);
  int v140 = v23;
  unsigned int v141 = (v23 + 3) & 0xFFFFFFFC;
  ACFULogging::handleMessage((uint64_t)v39, 0, "%s::%s: startOfManifestUnaligned: %ld, startOfManifestAligned: %ld, paddingBeforeManifestStart: %u\n", v40, v41, v42, v43, v44, (char)"ACFUFTABFile");
  uint64_t v46 = ACFULogging::getLogInstance(v45);
  unsigned int v139 = (v36 + 3) & 0xFFFFFFFC;
  int v47 = v36;
  ACFULogging::handleMessage((uint64_t)v46, 0, "%s::%s: endOfManifestUnaligned: %ld, endOfManifestAligned: %ld, paddingAfterManifestEnd: %u\n", v48, v49, v50, v51, v52, (char)"ACFUFTABFile");
  CFIndex v137 = v37;
  if (v8)
  {
    uint64_t v53 = 0;
    CFIndex v136 = ((v36 + 3) & 0xFFFFFFFC) - v36;
    CFIndex v54 = 16 * v8;
    while (1)
    {
      int v55 = *((_DWORD *)CFDataGetBytePtr(v7) + 5);
      uint64_t v56 = CFDataGetBytePtr(v7);
      *(_DWORD *)&v56[v53 + 52] += v136 + v37 + v55;
      if (!a3)
      {
        uint64_t v57 = CFDataGetBytePtr(v7);
        char v148 = 4;
        LODWORD(v147) = *(_DWORD *)&v57[v53 + 48];
        BYTE4(v147) = 0;
        uint64_t v58 = CFDataGetBytePtr(v7);
        uint64_t updated = ACFUFTABFile::updateCache((uint64_t)this, (uint64_t)&v147, *(_DWORD *)&v58[v53 + 52], 0);
        int v60 = updated;
        if ((updated & 1) == 0)
        {
          uint64_t v61 = ACFULogging::getLogInstance((ACFULogging *)updated);
          ACFULogging::handleMessage((uint64_t)v61, 2u, "%s::%s: failed to update cache\n", v62, v63, v64, v65, v66, (char)"ACFUFTABFile");
        }
        if (v148 < 0) {
          operator delete(v147);
        }
        if (!v60) {
          break;
        }
      }
      v53 += 16;
      if (v54 == v53)
      {
        uint64_t v67 = (const __CFString ***)this;
        uint64_t v68 = v146;
        uint64_t v69 = v138;
        CFIndex v38 = v136;
        goto LABEL_27;
      }
    }
    uint64_t v98 = 0;
    uint64_t v68 = v146;
    goto LABEL_46;
  }
  CFIndex v54 = 0;
  uint64_t v67 = (const __CFString ***)this;
  uint64_t v68 = v146;
  uint64_t v69 = v138;
LABEL_27:
  uint64_t v78 = CFDataGetBytePtr(v7);
  CFDataAppendBytes(v68, v78, 48);
  uint64_t v79 = CFDataGetBytePtr(v7);
  CFDataAppendBytes(v68, v79 + 48, v54);
  if (v141 != v140)
  {
    uint64_t v81 = ACFULogging::getLogInstance(v80);
    ACFULogging::handleMessage((uint64_t)v81, 0, "%s::%s: paddingBeforeManifestStart %u bytes\n", v82, v83, v84, v85, v86, (char)"ACFUFTABFile");
    CFDataIncreaseLength(v68, v137);
  }
  uint64_t v87 = CFDataGetBytePtr(theData);
  uint64_t v88 = CFDataGetBytePtr(v7);
  CFDataAppendBytes(v68, v87, *((unsigned int *)v88 + 5));
  if (v139 != v47)
  {
    long long v90 = ACFULogging::getLogInstance(v89);
    ACFULogging::handleMessage((uint64_t)v90, 0, "%s::%s: paddingAfterManifestEnd %u bytes\n", v91, v92, v93, v94, v95, (char)"ACFUFTABFile");
    CFDataIncreaseLength(v68, v38);
  }
  CFDataAppendBytes(v68, &v142[v69], v144 - v69 + v143);
  if (!a3)
  {
    if (ACFUDataContainer::setData(v67[1], v68)
      && ((unsigned int (*)(const __CFString ***))(*v67)[11])(v67))
    {
      uint64_t isCacheValid = ACFUFTABFile::isCacheValid((ACFUFTABFile *)v67);
      goto LABEL_36;
    }
LABEL_45:
    uint64_t v98 = 0;
    goto LABEL_46;
  }
  if (*a3)
  {
    CFRelease(*a3);
    *a3 = 0;
  }
  long long v96 = (__CFData *)AMSupportSafeRetain();
  *a3 = v96;
  if (!v96)
  {
    uint64_t v117 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v117, 2u, "%s::%s: failed obtain new file data\n", v118, v119, v120, v121, v122, (char)"ACFUFTABFile");
    goto LABEL_45;
  }
  uint64_t isCacheValid = ACFUFTABFile::isValidFileData((ACFUFTABFile *)v67, v96, 0);
LABEL_36:
  uint64_t v98 = isCacheValid;
LABEL_46:
  CFRelease(v68);
  return v98;
}

void sub_22EF0D4E0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 - 89) < 0) {
    operator delete(*(void **)(v1 - 112));
  }
  _Unwind_Resume(exception_object);
}

uint64_t ACFUFTABFile::removeManifestPadding(UInt8 *this, CFDataRef theData)
{
  if (theData && (int v3 = *((_DWORD *)CFDataGetBytePtr(theData) + 5), this = (UInt8 *)CFDataGetBytePtr(theData), v3))
  {
    unsigned int v4 = *((_DWORD *)this + 4);
    if (v4 >= *((_DWORD *)CFDataGetBytePtr(theData) + 13))
    {
      unsigned int v17 = *((_DWORD *)CFDataGetBytePtr(theData) + 10) - 1;
      int v18 = *(_DWORD *)&CFDataGetBytePtr(theData)[16 * v17 + 52];
      BytePtr = (ACFULogging *)CFDataGetBytePtr(theData);
      CFIndex v20 = (*((_DWORD *)BytePtr + 4 * v17 + 14) + v18);
      LogInstance = ACFULogging::getLogInstance(BytePtr);
      ACFULogging::handleMessage((uint64_t)LogInstance, 0, "%s::%s: manifest at the end - startOfManifest: %u, endOfFiles: %u, padding: %u\n", v22, v23, v24, v25, v26, (char)"ACFUFTABFile");
      v35.location = v20;
      v35.length = v4 - v20;
      CFDataDeleteBytes(theData, v35);
      unsigned int v27 = CFDataGetBytePtr(theData);
      uint64_t result = 0;
      *((_DWORD *)v27 + 4) = v20;
    }
    else
    {
      uint64_t v5 = (UInt8 *)CFDataGetBytePtr(theData);
      unsigned int v6 = *((_DWORD *)v5 + 13) - (v4 + v3);
      CFDataRef v7 = ACFULogging::getLogInstance((ACFULogging *)v5);
      ACFULogging::handleMessage((uint64_t)v7, 0, "%s::%s: manifest is at top - endOfManifest: %u, startOfFiles: %u, paddingAfterManifestEnd: %u\n", v8, v9, v10, v11, v12, (char)"ACFUFTABFile");
      v34.location = (*((_DWORD *)CFDataGetBytePtr(theData) + 4) + v3);
      v34.length = v6;
      CFDataDeleteBytes(theData, v34);
      if (*((_DWORD *)CFDataGetBytePtr(theData) + 10))
      {
        unint64_t v13 = 0;
        uint64_t v14 = 52;
        do
        {
          uint64_t v15 = CFDataGetBytePtr(theData);
          *(_DWORD *)&v15[v14] -= v6;
          ++v13;
          v14 += 16;
        }
        while (v13 < *((unsigned int *)CFDataGetBytePtr(theData) + 10));
      }
      return 1;
    }
  }
  else
  {
    unsigned int v28 = ACFULogging::getLogInstance((ACFULogging *)this);
    ACFULogging::handleMessage((uint64_t)v28, 2u, "%s::%s: no manifest preset in dataref\n", v29, v30, v31, v32, v33, (char)"ACFUFTABFile");
    return 0;
  }
  return result;
}

BOOL ACFUFTABFile::isCacheValid(ACFUFTABFile *this)
{
  uint64_t v2 = (ACFUDataContainer *)*((void *)this + 1);
  if (!v2)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: no file data?!\n", v36, v37, v38, v39, v40, (char)"ACFUFTABFile");
    return 0;
  }
  int v3 = ACFUDataContainer::copyData(v2, 0, 0x30uLL);
  if (!v3)
  {
    uint64_t v41 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v41, 2u, "%s::%s: failed to copy ftab header\n", v42, v43, v44, v45, v46, (char)"ACFUFTABFile");
    return 0;
  }
  unsigned int v4 = v3;
  BytePtr = CFDataGetBytePtr(v3);
  if (!BytePtr)
  {
    int v47 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v47, 2u, "%s::%s: failed to copy ftab header\n", v48, v49, v50, v51, v52, (char)"ACFUFTABFile");
    BOOL v8 = 0;
    goto LABEL_23;
  }
  uint64_t v6 = *((unsigned int *)BytePtr + 10);
  CFRelease(v4);
  if (*((void *)this + 7) != v6)
  {
    uint64_t v53 = ACFULogging::getLogInstance(v7);
    ACFULogging::handleMessage((uint64_t)v53, 2u, "%s::%s: number of files in cache is invalid\n", v54, v55, v56, v57, v58, (char)"ACFUFTABFile");
    return 0;
  }
  if (!v6) {
    return 1;
  }
  BOOL v8 = 0;
  int v9 = 0;
  unsigned int v10 = 48;
  do
  {
    uint64_t v11 = ACFUDataContainer::copyData(*((ACFUDataContainer **)this + 1), v10, 0x10uLL);
    if (!v11)
    {
      uint64_t v29 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v29, 2u, "%s::%s: failed to copy ftab file header\n", v30, v31, v32, v33, v34, (char)"ACFUFTABFile");
      return 0;
    }
    unsigned int v4 = v11;
    uint64_t v12 = CFDataGetBytePtr(v11);
    char v60 = 4;
    LODWORD(__p) = *(_DWORD *)v12;
    BYTE4(__p) = 0;
    unint64_t v13 = (ACFULogging *)std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::find<std::string>((uint64_t)this + 40, (const void **)&__p);
    if ((ACFUFTABFile *)((char *)this + 48) == v13)
    {
      uint64_t v15 = ACFULogging::getLogInstance(v13);
      ACFULogging::handleMessage((uint64_t)v15, 2u, "%s::%s: cache does not have entry for file %s. Cache is invalid\n", v16, v17, v18, v19, v20, (char)"ACFUFTABFile");
    }
    else
    {
      if (*((_DWORD *)v13 + 15) == *((_DWORD *)v12 + 1))
      {
        if (*((_DWORD *)v13 + 14) == *((_DWORD *)v12 + 2))
        {
          CFRelease(v4);
          unsigned int v4 = 0;
          char v14 = 1;
          goto LABEL_12;
        }
        uint64_t v21 = ACFULogging::getLogInstance(v13);
        unsigned int v27 = "%s::%s: cache does not hold correct size for file %s. Cache size: %d. FTAB size: %d. Cache is invalid\n";
      }
      else
      {
        uint64_t v21 = ACFULogging::getLogInstance(v13);
        unsigned int v27 = "%s::%s: cache does not hold correct offset for file %s. Cache offset: %d. FTAB offset: %d. Cache is invalid\n";
      }
      ACFULogging::handleMessage((uint64_t)v21, 2u, v27, v22, v23, v24, v25, v26, (char)"ACFUFTABFile");
    }
    char v14 = 0;
LABEL_12:
    if (v60 < 0) {
      operator delete(__p);
    }
    if ((v14 & 1) == 0) {
      break;
    }
    BOOL v8 = ++v9 >= v6;
    v10 += 16;
  }
  while (v6 != v9);
  if (!v4) {
    return v8;
  }
LABEL_23:
  CFRelease(v4);
  return v8;
}

void sub_22EF0D9D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ACFUFTABFile::updateCache(uint64_t a1, uint64_t a2, int a3, int a4)
{
  BOOL v8 = (uint64_t **)(a1 + 40);
  int v9 = (ACFULogging *)std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::find<std::string>(a1 + 40, (const void **)a2);
  uint64_t v10 = *(unsigned __int8 *)(a2 + 23);
  if ((v10 & 0x80u) != 0) {
    uint64_t v10 = *(void *)(a2 + 8);
  }
  if (v10 == 4)
  {
    uint64_t v11 = v9;
    uint64_t v12 = (ACFULogging *)(a1 + 48);
    if (!(a4 | a3))
    {
      LogInstance = ACFULogging::getLogInstance(v9);
      if (v12 == v11)
      {
        ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: attempting to delete file from cache that does not exist. File: %s\n", v22, v23, v24, v25, v26, (char)"ACFUFTABFile");
      }
      else
      {
        ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: removing file from FTAB cache. File: %s\n", v22, v23, v24, v25, v26, (char)"ACFUFTABFile");
        std::__tree<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::__map_value_compare<std::string,std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>>>::__erase_unique<std::string>(v8, (const void **)a2);
      }
      return 1;
    }
    if (v12 != v9)
    {
      unint64_t v13 = ACFULogging::getLogInstance(v9);
      ACFULogging::handleMessage((uint64_t)v13, 4u, "%s::%s: ftab cache entry updated. File: %s, offset: %u, size: %u\n", v14, v15, v16, v17, v18, (char)"ACFUFTABFile");
      if (a3)
      {
        uint64_t v40 = (long long *)a2;
        *((_DWORD *)std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v8, (const void **)a2, (uint64_t)&std::piecewise_construct, &v40)+ 15) = a3;
      }
      if (!a4) {
        return 1;
      }
      uint64_t v40 = (long long *)a2;
      uint64_t v19 = v8;
      uint64_t v20 = (const void **)a2;
      goto LABEL_15;
    }
    unsigned int v27 = ACFULogging::getLogInstance(v9);
    if (a3 && a4)
    {
      ACFULogging::handleMessage((uint64_t)v27, 4u, "%s::%s: Adding new file to FTAB cache. File: %s, offset: %u, size: %u\n", v28, v29, v30, v31, v32, (char)"ACFUFTABFile");
      uint64_t v40 = (long long *)a2;
      *((_DWORD *)std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v8, (const void **)a2, (uint64_t)&std::piecewise_construct, &v40)+ 15) = a3;
      uint64_t v40 = (long long *)a2;
      uint64_t v19 = v8;
      uint64_t v20 = (const void **)a2;
LABEL_15:
      *((_DWORD *)std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v19, v20, (uint64_t)&std::piecewise_construct, &v40)+ 14) = a4;
      return 1;
    }
    ACFULogging::handleMessage((uint64_t)v27, 2u, "%s::%s: attempting to add new file to cache, but not both size and offset are provided. File: %s\n", v28, v29, v30, v31, v32, (char)"ACFUFTABFile");
  }
  else
  {
    uint64_t v34 = ACFULogging::getLogInstance(v9);
    ACFULogging::handleMessage((uint64_t)v34, 2u, "%s::%s: specified tag name is invalid! Tag name: %s\n", v35, v36, v37, v38, v39, (char)"ACFUFTABFile");
  }
  return 0;
}

void ACFUFTABFile::copyManifest(ACFUFTABFile *this@<X0>, uint64_t a2@<X8>)
{
  unsigned int v4 = (ACFUDataContainer *)*((void *)this + 1);
  if (!v4)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: file data was invalid\n", v14, v15, v16, v17, v18, (char)"ACFUFTABFile");
LABEL_13:
    uint64_t v10 = 0;
    int v11 = 1;
    goto LABEL_9;
  }
  uint64_t v5 = ACFUDataContainer::copyData(v4, 0, 0x30uLL);
  if (!v5)
  {
    uint64_t v19 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v19, 2u, "%s::%s: failed to copy ftab header\n", v20, v21, v22, v23, v24, (char)"ACFUFTABFile");
    goto LABEL_13;
  }
  uint64_t v6 = v5;
  BytePtr = (ACFULogging *)CFDataGetBytePtr(v5);
  if (!BytePtr)
  {
    int v11 = 1;
    uint64_t v12 = "%s::%s: failed to copy ftab header\n";
    goto LABEL_16;
  }
  unint64_t v8 = *((unsigned int *)BytePtr + 5);
  if (!v8 || (unsigned int v9 = *((_DWORD *)BytePtr + 4)) == 0)
  {
    int v11 = 1001;
    uint64_t v12 = "%s::%s: no manifest found in ftab\n";
LABEL_16:
    uint64_t v25 = ACFULogging::getLogInstance(BytePtr);
    ACFULogging::handleMessage((uint64_t)v25, 2u, v12, v26, v27, v28, v29, v30, (char)"ACFUFTABFile");
    uint64_t v10 = 0;
    goto LABEL_8;
  }
  BytePtr = ACFUDataContainer::copyData(*((ACFUDataContainer **)this + 1), v9, v8);
  if (!BytePtr)
  {
    int v11 = 4000;
    uint64_t v12 = "%s::%s: failed to create manifest data output\n";
    goto LABEL_16;
  }
  uint64_t v10 = BytePtr;
  int v11 = 0;
LABEL_8:
  CFRelease(v6);
LABEL_9:
  *(void *)a2 = v10;
  *(_DWORD *)(a2 + 8) = v11;
}

void ACFUFTABFile::copyManifestRef(ACFUFTABFile *this@<X0>, ACFUDataContainer::DirectDataRef **a2@<X8>)
{
  *a2 = 0;
  unsigned int v4 = (ACFUDataContainer *)*((void *)this + 1);
  if (!v4)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    uint64_t v26 = "%s::%s: file data was invalid\n";
LABEL_14:
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v26, v21, v22, v23, v24, v25, (char)"ACFUFTABFile");
    return;
  }
  uint64_t v5 = ACFUDataContainer::copyData(v4, 0, 0x30uLL);
  uint64_t v6 = v5;
  if (!v5)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    uint64_t v26 = "%s::%s: failed to copy ftab header\n";
    goto LABEL_14;
  }
  BytePtr = (UInt8 *)CFDataGetBytePtr(v5);
  if (BytePtr)
  {
    size_t v8 = *((unsigned int *)BytePtr + 5);
    if (v8 && (unsigned int v9 = *((_DWORD *)BytePtr + 4)) != 0)
    {
      ACFUDataContainer::copyDirectData(*((ACFUDataContainer **)this + 1), v8, v9, &v27);
      uint64_t v10 = v27;
      uint64_t v27 = 0;
      std::unique_ptr<ACFUDataContainer::DirectDataRef>::reset[abi:ne180100](a2, v10);
      int v11 = v27;
      uint64_t v27 = 0;
      if (v11)
      {
        ACFUDataContainer::DirectDataRef::~DirectDataRef(v11);
        operator delete(v12);
      }
      if (*a2) {
        goto LABEL_9;
      }
      unint64_t v13 = ACFULogging::getLogInstance(v11);
      uint64_t v19 = "%s::%s: failed to create manifest data output\n";
    }
    else
    {
      unint64_t v13 = ACFULogging::getLogInstance((ACFULogging *)BytePtr);
      uint64_t v19 = "%s::%s: no manifest found in ftab\n";
    }
  }
  else
  {
    unint64_t v13 = ACFULogging::getLogInstance(0);
    uint64_t v19 = "%s::%s: failed to copy ftab header\n";
  }
  ACFULogging::handleMessage((uint64_t)v13, 2u, v19, v14, v15, v16, v17, v18, (char)"ACFUFTABFile");
LABEL_9:
  CFRelease(v6);
}

void sub_22EF0DEFC(_Unwind_Exception *a1)
{
  std::unique_ptr<ACFUDataContainer::DirectDataRef>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

uint64_t ACFUFTABFile::setBootNonce(ACFUFTABFile *this, uint64_t a2)
{
  int v3 = (ACFUDataContainer *)*((void *)this + 1);
  if (v3)
  {
    isOptimized = (ACFULogging *)ACFUDataContainer::isOptimized(v3);
    if (isOptimized)
    {
      LogInstance = ACFULogging::getLogInstance(isOptimized);
      ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: function is not supported in memory optimized flow. Memory optimized files are read only\n", v22, v23, v24, v25, v26, (char)"ACFUFTABFile");
    }
    else
    {
      CFDataRef Data = (const __CFData *)ACFUDataContainer::getData(*((ACFUDataContainer **)this + 1));
      if (Data)
      {
        BytePtr = (UInt8 *)CFDataGetBytePtr(Data);
        *((void *)BytePtr + 1) = a2;
        size_t v8 = ACFULogging::getLogInstance((ACFULogging *)BytePtr);
        ACFULogging::handleMessage((uint64_t)v8, 0, "%s::%s: Boot nonce set for FTAB. Boot nonce value: %llu\n", v9, v10, v11, v12, v13, (char)"ACFUFTABFile");
        return 1;
      }
      uint64_t v27 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v27, 2u, "%s::%s: could not obtain file data\n", v28, v29, v30, v31, v32, (char)"ACFUFTABFile");
    }
  }
  else
  {
    uint64_t v15 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v15, 2u, "%s::%s: file data was invalid\n", v16, v17, v18, v19, v20, (char)"ACFUFTABFile");
  }
  return 0;
}

uint64_t ACFUFTABFile::getBootNonce(ACFUFTABFile *this)
{
  uint64_t v1 = (ACFUDataContainer *)*((void *)this + 1);
  if (!v1)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: file data was invalid\n", v8, v9, v10, v11, v12, (char)"ACFUFTABFile");
    return 0;
  }
  uint64_t v2 = ACFUDataContainer::copyData(v1, 0, 0x30uLL);
  if (!v2)
  {
    uint64_t v13 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v13, 2u, "%s::%s: failed to copy ftab header\n", v14, v15, v16, v17, v18, (char)"ACFUFTABFile");
    return 0;
  }
  int v3 = v2;
  BytePtr = CFDataGetBytePtr(v2);
  if (BytePtr)
  {
    uint64_t v5 = *((void *)BytePtr + 1);
  }
  else
  {
    uint64_t v19 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v19, 2u, "%s::%s: failed to copy ftab header\n", v20, v21, v22, v23, v24, (char)"ACFUFTABFile");
    uint64_t v5 = 0;
  }
  CFRelease(v3);
  return v5;
}

uint64_t ACFUFTABFile::addNewFileToFTAB(ACFULogging *a1, uint64_t a2, const __CFData *a3)
{
  return ACFUFTABFile::addNewFileToFTABOnData(a1, a2, a3, 0);
}

uint64_t ACFUFTABFile::addNewFileToFTABOnData(ACFULogging *a1, uint64_t a2, CFDataRef theData, CFDataRef *a4)
{
  uint64_t v7 = (uint64_t)a1;
  if (!a4 && !*((void *)a1 + 1))
  {
    LogInstance = ACFULogging::getLogInstance(a1);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: file data must be valid or firmware data must be provided\n", v150, v151, v152, v153, v154, (char)"ACFUFTABFile");
    goto LABEL_90;
  }
  if (!theData)
  {
    uint64_t v89 = ACFULogging::getLogInstance(a1);
    ACFULogging::handleMessage((uint64_t)v89, 2u, "%s::%s: file data provided is not valid\n", v90, v91, v92, v93, v94, (char)"ACFUFTABFile");
    goto LABEL_90;
  }
  int Length = (ACFULogging *)CFDataGetLength(theData);
  if ((uint64_t)Length <= 0)
  {
    uint64_t v95 = ACFULogging::getLogInstance(Length);
    ACFULogging::handleMessage((uint64_t)v95, 2u, "%s::%s: file data has no bytes\n", v96, v97, v98, v99, v100, (char)"ACFUFTABFile");
    goto LABEL_90;
  }
  uint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  if ((v9 & 0x80u) != 0) {
    uint64_t v9 = *(void *)(a2 + 8);
  }
  if (v9 != 4)
  {
    uint64_t v101 = ACFULogging::getLogInstance(Length);
    ACFULogging::handleMessage((uint64_t)v101, 2u, "%s::%s: tag is either larger or smaller than limit %u (size: %lu)\n", v102, v103, v104, v105, v106, (char)"ACFUFTABFile");
    goto LABEL_90;
  }
  uint64_t v10 = (ACFULogging *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v7 + 16))(v7, a2);
  if (v10)
  {
    uint64_t v107 = ACFULogging::getLogInstance(v10);
    ACFULogging::handleMessage((uint64_t)v107, 2u, "%s::%s: cowardly retreating because tag '%s' exists. I refuse to overwrite existing files!\n", v108, v109, v110, v111, v112, (char)"ACFUFTABFile");
    goto LABEL_90;
  }
  if (a4)
  {
    if (*a4)
    {
      uint64_t isValidFileData = ACFUFTABFile::isValidFileData((ACFUFTABFile *)v7, *a4, 0);
      if (isValidFileData)
      {
        CFDataRef v12 = *a4;
        if (*a4) {
          goto LABEL_13;
        }
LABEL_62:
        uint64_t v82 = ACFULogging::getLogInstance((ACFULogging *)isValidFileData);
        ACFULogging::handleMessage((uint64_t)v82, 2u, "%s::%s: could not obtain file data\n", v83, v84, v85, v86, v87, (char)"ACFUFTABFile");
        CFDataRef v75 = 0;
        CFMutableDataRef Mutable = 0;
        goto LABEL_87;
      }
      uint64_t v125 = ACFULogging::getLogInstance((ACFULogging *)isValidFileData);
      ACFULogging::handleMessage((uint64_t)v125, 2u, "%s::%s: firmware data is invalid and does not meet ftab standards\n", v126, v127, v128, v129, v130, (char)"ACFUFTABFile");
    }
    else
    {
      uint64_t v119 = ACFULogging::getLogInstance(v10);
      ACFULogging::handleMessage((uint64_t)v119, 2u, "%s::%s: firmware data container is invalid\n", v120, v121, v122, v123, v124, (char)"ACFUFTABFile");
    }
LABEL_90:
    LOBYTE(v7) = 0;
    return v7 & 1;
  }
  if (ACFUDataContainer::isOptimized(*(ACFUDataContainer **)(v7 + 8)))
  {
    uint64_t v39 = (uint64_t **)(v7 + 72);
    uint64_t v40 = (ACFULogging *)std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::__count_unique<std::string>(v7 + 72, (const void **)a2);
    if (!v40)
    {
      uint64_t v7 = AMSupportSafeRetain();
      __p[0] = (void *)a2;
      std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v39, (const void **)a2, (uint64_t)&std::piecewise_construct, (long long **)__p)[7] = v7;
      LOBYTE(v7) = 1;
      return v7 & 1;
    }
    v167 = ACFULogging::getLogInstance(v40);
    ACFULogging::handleMessage((uint64_t)v167, 2u, "%s::%s: cowardly retreating because tag '%s' exists in runtime MMIO File Data. I refuse to overwrite existing files!\n", v168, v169, v170, v171, v172, (char)"ACFUFTABFile");
    goto LABEL_90;
  }
  uint64_t isValidFileData = ACFUDataContainer::getData(*(ACFUDataContainer **)(v7 + 8));
  CFDataRef v12 = (const __CFData *)isValidFileData;
  if (!isValidFileData) {
    goto LABEL_62;
  }
LABEL_13:
  CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDataRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (!Mutable)
  {
    uint64_t v113 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v113, 2u, "%s::%s: could not allocate data\n", v114, v115, v116, v117, v118, (char)"ACFUFTABFile");
LABEL_81:
    CFDataRef v75 = 0;
    goto LABEL_87;
  }
  BytePtr = CFDataGetBytePtr(v12);
  v177 = &BytePtr[*((unsigned int *)CFDataGetBytePtr(v12) + 13)];
  uint64_t v16 = CFDataGetBytePtr(v12);
  uint64_t v17 = &BytePtr[*(unsigned int *)&v16[16 * (*((_DWORD *)CFDataGetBytePtr(v12) + 10) - 1) + 52]];
  uint64_t v18 = CFDataGetBytePtr(v12);
  v176 = &v17[*(unsigned int *)&v18[16 * (*((_DWORD *)CFDataGetBytePtr(v12) + 10) - 1) + 56]];
  CFDataGetBytePtr(v12);
  char v19 = *(unsigned char *)(a2 + 23);
  if (v19 >= 0) {
    uint64_t v20 = (const char *)a2;
  }
  else {
    uint64_t v20 = *(const char **)a2;
  }
  if (v19 >= 0) {
    size_t v21 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v21 = *(void *)(a2 + 8);
  }
  strncpy(__dst, v20, v21);
  CFDataRef v173 = theData;
  int v182 = CFDataGetLength(theData);
  int v183 = 0;
  uint64_t v22 = (UInt8 *)CFDataGetBytePtr(v12);
  theDataa = Mutable;
  if (!*((_DWORD *)v22 + 5))
  {
    CFDataRef v174 = 0;
    int v30 = 0;
    LODWORD(v32) = 0;
    goto LABEL_29;
  }
  uint64_t v23 = ACFULogging::getLogInstance((ACFULogging *)v22);
  ACFULogging::handleMessage((uint64_t)v23, 0, "%s::%s: manifest existing in FTAB is being deleted\n", v24, v25, v26, v27, v28, (char)"ACFUFTABFile");
  int v30 = ACFUFTABFile::removeManifestPadding(v29, v12);
  uint64_t v31 = &BytePtr[*((unsigned int *)CFDataGetBytePtr(v12) + 4)];
  uint64_t v32 = *((unsigned int *)CFDataGetBytePtr(v12) + 5);
  uint64_t v33 = CFDataGetBytePtr(v12);
  CFDataRef v34 = CFDataCreate(v13, v31, *((unsigned int *)v33 + 5));
  if (!v34)
  {
    uint64_t v131 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v131, 2u, "%s::%s: failed to obtain copy of manifest\n", v132, v133, v134, v135, v136, (char)"ACFUFTABFile");
    goto LABEL_81;
  }
  CFDataRef v174 = v34;
  CFIndex v35 = *((unsigned int *)CFDataGetBytePtr(v12) + 4);
  v184.length = *((unsigned int *)CFDataGetBytePtr(v12) + 5);
  v184.location = v35;
  CFDataDeleteBytes(v12, v184);
  if (v30)
  {
    v177 = &BytePtr[*((unsigned int *)CFDataGetBytePtr(v12) + 13) - v32];
    uint64_t v36 = CFDataGetBytePtr(v12);
    uint64_t v37 = *(unsigned int *)&v36[16 * (*((_DWORD *)CFDataGetBytePtr(v12) + 10) - 1) + 52];
    uint64_t v38 = CFDataGetBytePtr(v12);
    v176 = &BytePtr[v37 - v32 + *(unsigned int *)&v38[16 * (*((_DWORD *)CFDataGetBytePtr(v12) + 10) - 1) + 56]];
  }
  *((_DWORD *)CFDataGetBytePtr(v12) + 5) = 0;
  *((_DWORD *)CFDataGetBytePtr(v12) + 4) = 0;
LABEL_29:
  if (!*((_DWORD *)CFDataGetBytePtr(v12) + 10))
  {
LABEL_48:
    uint64_t v66 = CFDataGetBytePtr(v12);
    int v67 = *(_DWORD *)&v66[16 * (*((_DWORD *)CFDataGetBytePtr(v12) + 10) - 1) + 52];
    uint64_t v68 = CFDataGetBytePtr(v12);
    int v181 = *(_DWORD *)&v68[16 * (*((_DWORD *)CFDataGetBytePtr(v12) + 10) - 1) + 56] + v67;
    uint64_t v69 = CFDataGetBytePtr(v12);
    ++*((_DWORD *)v69 + 10);
    uint64_t v70 = CFDataGetBytePtr(v12);
    CFMutableDataRef Mutable = theDataa;
    CFDataAppendBytes(theDataa, v70, 48);
    uint64_t v71 = CFDataGetBytePtr(v12) + 48;
    uint64_t v72 = CFDataGetBytePtr(v12);
    CFDataAppendBytes(theDataa, v71, 16 * (*((_DWORD *)v72 + 10) - 1));
    CFDataAppendBytes(theDataa, (const UInt8 *)__dst, 16);
    CFDataAppendBytes(theDataa, v177, v176 - v177);
    uint64_t v73 = CFDataGetBytePtr(v173);
    CFIndex v74 = CFDataGetLength(v173);
    CFDataAppendBytes(theDataa, v73, v74);
    if (a4)
    {
      CFDataRef v75 = v174;
      if (*a4)
      {
        CFRelease(*a4);
        *a4 = 0;
      }
      uint64_t v76 = AMSupportSafeRetain();
      *a4 = (CFDataRef)v76;
      if (!v76)
      {
        CFIndex v137 = ACFULogging::getLogInstance(0);
        ACFULogging::handleMessage((uint64_t)v137, 2u, "%s::%s: failed obtain new file data\n", v138, v139, v140, v141, v142, (char)"ACFUFTABFile");
        goto LABEL_87;
      }
      if (!v174)
      {
        CFDataRef v78 = (const __CFData *)v76;
        goto LABEL_66;
      }
      uint64_t v77 = ACFUFTABFile::setManifestOnData((ACFUDataContainer **)v7, v174, a4);
      if (v77)
      {
        CFDataRef v78 = *a4;
LABEL_66:
        char isCacheValid = ACFUFTABFile::isValidFileData((ACFUFTABFile *)v7, v78, 0);
        goto LABEL_67;
      }
      goto LABEL_83;
    }
    uint64_t v79 = ACFUDataContainer::setData(*(const __CFString ***)(v7 + 8), theDataa);
    CFDataRef v75 = v174;
    if (v79)
    {
      uint64_t updated = ACFUFTABFile::updateCache(v7, a2, v181, v182);
      if (updated)
      {
        if (v174)
        {
          uint64_t v77 = ACFUFTABFile::setManifestOnData((ACFUDataContainer **)v7, v174, 0);
          if ((v77 & 1) == 0)
          {
LABEL_83:
            uint64_t v143 = ACFULogging::getLogInstance((ACFULogging *)v77);
            ACFULogging::handleMessage((uint64_t)v143, 2u, "%s::%s: failed to update manifest\n", v144, v145, v146, v147, v148, (char)"ACFUFTABFile");
            goto LABEL_87;
          }
        }
        if ((*(unsigned int (**)(uint64_t))(*(void *)v7 + 88))(v7))
        {
          char isCacheValid = ACFUFTABFile::isCacheValid((ACFUFTABFile *)v7);
LABEL_67:
          LOBYTE(v7) = isCacheValid;
          goto LABEL_68;
        }
      }
      else
      {
        v161 = ACFULogging::getLogInstance((ACFULogging *)updated);
        ACFULogging::handleMessage((uint64_t)v161, 2u, "%s::%s: failed to update cache\n", v162, v163, v164, v165, v166, (char)"ACFUFTABFile");
      }
    }
    else
    {
      v155 = ACFULogging::getLogInstance((ACFULogging *)v79);
      ACFULogging::handleMessage((uint64_t)v155, 2u, "%s::%s: failed to update file data\n", v156, v157, v158, v159, v160, (char)"ACFUFTABFile");
    }
LABEL_87:
    LOBYTE(v7) = 0;
    if (!Mutable)
    {
LABEL_69:
      if (v75) {
        CFRelease(v75);
      }
      return v7 & 1;
    }
LABEL_68:
    CFRelease(Mutable);
    goto LABEL_69;
  }
  uint64_t v41 = 0;
  unint64_t v42 = 0;
  while (1)
  {
    uint64_t v43 = CFDataGetBytePtr(v12);
    *(_DWORD *)&v43[v41 + 52] += 16;
    if (!a4)
    {
      uint64_t v44 = CFDataGetBytePtr(v12);
      char v179 = 4;
      LODWORD(__p[0]) = *(_DWORD *)&v44[v41 + 48];
      BYTE4(__p[0]) = 0;
      uint64_t v45 = CFDataGetBytePtr(v12);
      uint64_t v46 = ACFUFTABFile::updateCache(v7, (uint64_t)__p, *(_DWORD *)&v45[v41 + 52], 0);
      int v47 = v46;
      if (v46)
      {
        int v48 = 0;
      }
      else
      {
        uint64_t v54 = ACFULogging::getLogInstance((ACFULogging *)v46);
        ACFULogging::handleMessage((uint64_t)v54, 2u, "%s::%s: failed to update cache\n", v55, v56, v57, v58, v59, (char)"ACFUFTABFile");
        int v48 = 4;
      }
      if (v179 < 0) {
        operator delete(__p[0]);
      }
      if (!v47) {
        break;
      }
    }
    if (v30)
    {
      uint64_t v49 = CFDataGetBytePtr(v12);
      *(_DWORD *)&v49[v41 + 52] -= v32;
      if (!a4)
      {
        uint64_t v50 = CFDataGetBytePtr(v12);
        char v179 = 4;
        LODWORD(__p[0]) = *(_DWORD *)&v50[v41 + 48];
        BYTE4(__p[0]) = 0;
        uint64_t v51 = CFDataGetBytePtr(v12);
        uint64_t v52 = ACFUFTABFile::updateCache(v7, (uint64_t)__p, *(_DWORD *)&v51[v41 + 52], 0);
        int v53 = v52;
        if (v52)
        {
          int v48 = 0;
        }
        else
        {
          char v60 = ACFULogging::getLogInstance((ACFULogging *)v52);
          ACFULogging::handleMessage((uint64_t)v60, 2u, "%s::%s: failed to update cache\n", v61, v62, v63, v64, v65, (char)"ACFUFTABFile");
          int v48 = 4;
        }
        if (v179 < 0) {
          operator delete(__p[0]);
        }
        if (!v53) {
          break;
        }
      }
    }
    ++v42;
    v41 += 16;
    if (v42 >= *((unsigned int *)CFDataGetBytePtr(v12) + 10)) {
      goto LABEL_48;
    }
  }
  if ((v48 | 4) == 4)
  {
    LOBYTE(v7) = 0;
    CFDataRef v75 = v174;
    CFMutableDataRef Mutable = theDataa;
    goto LABEL_68;
  }
  return v7 & 1;
}

void sub_22EF0EA74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ACFUFTABFile::updateFileInFTAB(ACFUDataContainer **a1, unsigned __int8 *a2, const __CFData *a3)
{
  return ACFUFTABFile::updateFileInFTABOnData(a1, a2, a3, 0);
}

uint64_t ACFUFTABFile::updateFileInFTABOnData(ACFUDataContainer **a1, unsigned __int8 *a2, CFDataRef theData, CFDataRef *a4)
{
  CFDataRef v5 = theData;
  if (!a4 && !a1[1])
  {
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)a1);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: file data must be valid or firmware data must be provided\n", v170, v171, v172, v173, v174, (char)"ACFUFTABFile");
    goto LABEL_29;
  }
  if (!theData)
  {
    uint64_t v127 = ACFULogging::getLogInstance((ACFULogging *)a1);
    ACFULogging::handleMessage((uint64_t)v127, 2u, "%s::%s: file data provided is not valid\n", v128, v129, v130, v131, v132, (char)"ACFUFTABFile");
    goto LABEL_29;
  }
  int Length = (ACFULogging *)CFDataGetLength(theData);
  if ((uint64_t)Length <= 0)
  {
    uint64_t v133 = ACFULogging::getLogInstance(Length);
    ACFULogging::handleMessage((uint64_t)v133, 2u, "%s::%s: input data has no bytes\n", v134, v135, v136, v137, v138, (char)"ACFUFTABFile");
    goto LABEL_29;
  }
  uint64_t v9 = a2[23];
  if ((v9 & 0x80u) != 0) {
    uint64_t v9 = *((void *)a2 + 1);
  }
  if (v9 != 4)
  {
    uint64_t v139 = ACFULogging::getLogInstance(Length);
    ACFULogging::handleMessage((uint64_t)v139, 2u, "%s::%s: tag is either larger or smaller than limit %u (size: %lu)\n", v140, v141, v142, v143, v144, (char)"ACFUFTABFile");
    goto LABEL_29;
  }
  if (a4)
  {
    if (!*a4)
    {
      uint64_t v145 = ACFULogging::getLogInstance(Length);
      ACFULogging::handleMessage((uint64_t)v145, 2u, "%s::%s: firmware data container is invalid\n", v146, v147, v148, v149, v150, (char)"ACFUFTABFile");
      goto LABEL_29;
    }
    uint64_t isValidFileData = ACFUFTABFile::isValidFileData((ACFUFTABFile *)a1, *a4, 0);
    if ((isValidFileData & 1) == 0)
    {
      uint64_t v151 = ACFULogging::getLogInstance((ACFULogging *)isValidFileData);
      ACFULogging::handleMessage((uint64_t)v151, 2u, "%s::%s: firmware data is invalid and does not meet ftab standards\n", v152, v153, v154, v155, v156, (char)"ACFUFTABFile");
      goto LABEL_29;
    }
    CFDataRef v11 = *a4;
    BytePtr = (unsigned int *)CFDataGetBytePtr(*a4);
    if (!BytePtr)
    {
      uint64_t v157 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v157, 2u, "%s::%s: failed to copy ftab header\n", v158, v159, v160, v161, v162, (char)"ACFUFTABFile");
      goto LABEL_29;
    }
    uint64_t v13 = BytePtr[10];
    if (!v13)
    {
      uint64_t v163 = ACFULogging::getLogInstance((ACFULogging *)BytePtr);
      ACFULogging::handleMessage((uint64_t)v163, 2u, "%s::%s: cannot update a file if no files exist\n", v164, v165, v166, v167, v168, (char)"ACFUFTABFile");
      goto LABEL_29;
    }
    uint64_t v14 = 0;
    uint64_t v15 = 16 * v13;
    while (1)
    {
      uint64_t v16 = CFDataGetBytePtr(v11);
      char v208 = 4;
      LODWORD(__s2[0]) = *(_DWORD *)&v16[v14 + 48];
      BYTE4(__s2[0]) = 0;
      int v17 = (char)a2[23];
      unint64_t v18 = v17 >= 0 ? a2[23] : *((void *)a2 + 1);
      char v19 = v17 >= 0 ? a2 : *(unsigned __int8 **)a2;
      size_t v20 = v18 >= 4 ? 4 : v18;
      size_t v21 = (ACFULogging *)memcmp(v19, __s2, v20);
      if (!v21 && v18 == 4) {
        break;
      }
      v14 += 16;
      if (v15 == v14) {
        goto LABEL_28;
      }
    }
    unsigned int v35 = *(_DWORD *)&CFDataGetBytePtr(v11)[v14 + 56];
    unsigned int v36 = *(_DWORD *)&CFDataGetBytePtr(v11)[v14 + 52];
    goto LABEL_39;
  }
  if (!ACFUDataContainer::isOptimized(a1[1]))
  {
    uint64_t Data = ACFUDataContainer::getData(a1[1]);
    if (!Data)
    {
      v175 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v175, 2u, "%s::%s: could not obtain file data\n", v176, v177, v178, v179, v180, (char)"ACFUFTABFile");
      goto LABEL_29;
    }
    CFDataRef v11 = (const __CFData *)Data;
    size_t v21 = (ACFULogging *)(*((uint64_t (**)(ACFUDataContainer **, unsigned __int8 *))*a1 + 2))(a1, a2);
    if ((v21 & 1) == 0)
    {
LABEL_28:
      uint64_t v23 = ACFULogging::getLogInstance(v21);
      ACFULogging::handleMessage((uint64_t)v23, 2u, "%s::%s: cannot update tag '%s' because it does not exist\n", v24, v25, v26, v27, v28, (char)"ACFUFTABFile");
      goto LABEL_29;
    }
    uint64_t v38 = std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::find<std::string>((uint64_t)(a1 + 5), (const void **)a2);
    unsigned int v35 = *(_DWORD *)(v38 + 56);
    unsigned int v36 = *(_DWORD *)(v38 + 60);
LABEL_39:
    CFIndex v39 = v35;
    if (CFDataGetLength(v5) == v35)
    {
      uint64_t v40 = CFDataGetBytePtr(v5);
      v209.location = v36;
      v209.length = v35;
      CFDataReplaceBytes(v11, v209, v40, v35);
      if (a4)
      {
        char isCacheValid = ACFUFTABFile::isValidFileData((ACFUFTABFile *)a1, *a4, 0);
LABEL_51:
        char v29 = isCacheValid;
        goto LABEL_117;
      }
      if ((*((unsigned int (**)(ACFUDataContainer **))*a1 + 11))(a1))
      {
        char isCacheValid = ACFUFTABFile::isCacheValid((ACFUFTABFile *)a1);
        goto LABEL_51;
      }
      goto LABEL_29;
    }
    unint64_t v42 = CFDataGetBytePtr(v11);
    CFDataGetBytePtr(v11);
    uint64_t v43 = (UInt8 *)CFDataGetBytePtr(v11);
    CFDataRef theDataa = v5;
    if (*((_DWORD *)v43 + 5))
    {
      uint64_t v44 = ACFULogging::getLogInstance((ACFULogging *)v43);
      ACFULogging::handleMessage((uint64_t)v44, 0, "%s::%s: manifest existing in FTAB is being deleted\n", v45, v46, v47, v48, v49, (char)"ACFUFTABFile");
      int v51 = ACFUFTABFile::removeManifestPadding(v50, v11);
      uint64_t v52 = &v42[*((unsigned int *)CFDataGetBytePtr(v11) + 4)];
      CFAllocatorRef v53 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      uint64_t v54 = CFDataGetBytePtr(v11);
      CFDataRef v205 = CFDataCreate(v53, v52, *((unsigned int *)v54 + 5));
      if (!v205)
      {
        int v181 = ACFULogging::getLogInstance(0);
        ACFULogging::handleMessage((uint64_t)v181, 2u, "%s::%s: failed to obtain copy of manifest\n", v182, v183, v184, v185, v186, (char)"ACFUFTABFile");
        goto LABEL_29;
      }
      CFIndex v55 = *((unsigned int *)CFDataGetBytePtr(v11) + 4);
      v210.length = *((unsigned int *)CFDataGetBytePtr(v11) + 5);
      v210.location = v55;
      CFDataDeleteBytes(v11, v210);
      if (v51 && *((_DWORD *)CFDataGetBytePtr(v11) + 10))
      {
        unint64_t v56 = 0;
        uint64_t v57 = 52;
        do
        {
          int v58 = *((_DWORD *)CFDataGetBytePtr(v11) + 5);
          uint64_t v59 = CFDataGetBytePtr(v11);
          *(_DWORD *)&v59[v57] -= v58;
          ++v56;
          v57 += 16;
        }
        while (v56 < *((unsigned int *)CFDataGetBytePtr(v11) + 10));
      }
      *((_DWORD *)CFDataGetBytePtr(v11) + 5) = 0;
      *((_DWORD *)CFDataGetBytePtr(v11) + 4) = 0;
      CFDataRef v5 = theDataa;
    }
    else
    {
      CFDataRef v205 = 0;
    }
    if (*((_DWORD *)CFDataGetBytePtr(v11) + 10))
    {
      unint64_t v60 = 0;
      do
      {
        uint64_t v61 = CFDataGetBytePtr(v11);
        char v208 = 4;
        LODWORD(__s2[0]) = *(_DWORD *)&v61[16 * v60 + 48];
        BYTE4(__s2[0]) = 0;
        uint64_t v62 = a2[23];
        if ((v62 & 0x80u) == 0) {
          uint64_t v63 = a2[23];
        }
        else {
          uint64_t v63 = *((void *)a2 + 1);
        }
        if (v63 == 4)
        {
          if ((v62 & 0x80) != 0)
          {
            if (!memcmp(*(const void **)a2, __s2, *((void *)a2 + 1))) {
              break;
            }
          }
          else
          {
            if (!a2[23]) {
              break;
            }
            uint64_t v64 = __s2;
            uint64_t v65 = a2;
            while (*v65 == *(unsigned __int8 *)v64)
            {
              ++v65;
              uint64_t v64 = (long long **)((char *)v64 + 1);
              if (!--v62) {
                goto LABEL_69;
              }
            }
          }
        }
        ++v60;
      }
      while (v60 < *((unsigned int *)CFDataGetBytePtr(v11) + 10));
    }
    else
    {
      LODWORD(v60) = 0;
    }
LABEL_69:
    CFIndex v66 = CFDataGetLength(v5);
    int v67 = CFDataGetLength(v5);
    if (v66 >= v39)
    {
      CFIndex v83 = (v67 - v39);
      CFDataIncreaseLength(v11, v83);
      unsigned int v84 = *((_DWORD *)CFDataGetBytePtr(v11) + 10) - 1;
      if (v84 > v60)
      {
        uint64_t v85 = 16 * v84 + 56;
        while (1)
        {
          CFIndex v86 = (*(_DWORD *)&CFDataGetBytePtr(v11)[v85 - 4] + v83);
          CFIndex v87 = *(unsigned int *)&CFDataGetBytePtr(v11)[v85];
          uint64_t v88 = CFDataGetBytePtr(v11);
          uint64_t v89 = &v88[*(unsigned int *)&CFDataGetBytePtr(v11)[v85 - 4]];
          uint64_t v90 = CFDataGetBytePtr(v11);
          v211.location = v86;
          v211.length = v87;
          CFDataReplaceBytes(v11, v211, v89, *(unsigned int *)&v90[v85]);
          uint64_t v91 = CFDataGetBytePtr(v11);
          *(_DWORD *)&v91[v85 - 4] += v83;
          if (!a4)
          {
            uint64_t v92 = CFDataGetBytePtr(v11);
            char v208 = 4;
            LODWORD(__s2[0]) = *(_DWORD *)&v92[v85 - 8];
            BYTE4(__s2[0]) = 0;
            uint64_t v93 = CFDataGetBytePtr(v11);
            uint64_t updated = ACFUFTABFile::updateCache((uint64_t)a1, (uint64_t)__s2, *(_DWORD *)&v93[v85 - 4], 0);
            int v95 = updated;
            if (updated)
            {
              int v76 = 0;
            }
            else
            {
              uint64_t v96 = ACFULogging::getLogInstance((ACFULogging *)updated);
              ACFULogging::handleMessage((uint64_t)v96, 2u, "%s::%s: could not update ftab cache\n", v97, v98, v99, v100, v101, (char)"ACFUFTABFile");
              int v76 = 4;
            }
            if (v208 < 0) {
              operator delete(__s2[0]);
            }
            if (!v95) {
              break;
            }
          }
          --v84;
          v85 -= 16;
          if (v60 >= v84) {
            goto LABEL_101;
          }
        }
LABEL_111:
        if (v76) {
          goto LABEL_29;
        }
LABEL_112:
        if (!v205 || (uint64_t v119 = ACFUFTABFile::setManifestOnData(a1, v205, 0), (v119 & 1) != 0))
        {
          if ((*((unsigned int (**)(ACFUDataContainer **))*a1 + 11))(a1))
          {
            char v120 = ACFUFTABFile::isCacheValid((ACFUFTABFile *)a1);
            goto LABEL_116;
          }
LABEL_29:
          char v29 = 0;
          goto LABEL_117;
        }
LABEL_128:
        v187 = ACFULogging::getLogInstance((ACFULogging *)v119);
        ACFULogging::handleMessage((uint64_t)v187, 2u, "%s::%s: failed to update manifest\n", v188, v189, v190, v191, v192, (char)"ACFUFTABFile");
        goto LABEL_29;
      }
LABEL_101:
      int v114 = CFDataGetLength(theDataa);
      uint64_t v103 = v60;
      *(_DWORD *)&CFDataGetBytePtr(v11)[16 * v60 + 56] = v114;
      if (a4)
      {
        CFIndex v115 = *(unsigned int *)&CFDataGetBytePtr(v11)[16 * v60 + 52];
        CFIndex v116 = CFDataGetLength(theDataa);
        uint64_t v117 = CFDataGetBytePtr(theDataa);
        CFIndex v118 = CFDataGetLength(theDataa);
        v214.location = v115;
        v214.length = v116;
        CFDataReplaceBytes(v11, v214, v117, v118);
        goto LABEL_103;
      }
      uint64_t v121 = CFDataGetBytePtr(v11);
      char v208 = 4;
      LODWORD(__s2[0]) = *(_DWORD *)&v121[16 * v60 + 48];
      BYTE4(__s2[0]) = 0;
      int v122 = *(_DWORD *)&CFDataGetBytePtr(v11)[16 * v60 + 52];
      int v123 = CFDataGetLength(theDataa);
      uint64_t v124 = ACFUFTABFile::updateCache((uint64_t)a1, (uint64_t)__s2, v122, v123);
      char v125 = v124;
      if (v124)
      {
        int v76 = 0;
      }
      else
      {
        v199 = ACFULogging::getLogInstance((ACFULogging *)v124);
        ACFULogging::handleMessage((uint64_t)v199, 2u, "%s::%s: could not update ftab cache\n", v200, v201, v202, v203, v204, (char)"ACFUFTABFile");
        int v76 = 4;
      }
      if (v208 < 0) {
        operator delete(__s2[0]);
      }
      if ((v125 & 1) == 0) {
        goto LABEL_111;
      }
    }
    else
    {
      CFIndex v68 = (v39 - v67);
      unint64_t v69 = (v60 + 1);
      if (v69 < *((_DWORD *)CFDataGetBytePtr(v11) + 10))
      {
        uint64_t v70 = 16 * (v60 + 1);
        do
        {
          uint64_t v71 = CFDataGetBytePtr(v11);
          *(_DWORD *)&v71[v70 + 52] -= v68;
          if (!a4)
          {
            uint64_t v72 = CFDataGetBytePtr(v11);
            char v208 = 4;
            LODWORD(__s2[0]) = *(_DWORD *)&v72[v70 + 48];
            BYTE4(__s2[0]) = 0;
            uint64_t v73 = CFDataGetBytePtr(v11);
            uint64_t v74 = ACFUFTABFile::updateCache((uint64_t)a1, (uint64_t)__s2, *(_DWORD *)&v73[v70 + 52], 0);
            int v75 = v74;
            if (v74)
            {
              int v76 = 0;
            }
            else
            {
              uint64_t v77 = ACFULogging::getLogInstance((ACFULogging *)v74);
              ACFULogging::handleMessage((uint64_t)v77, 2u, "%s::%s: could not update ftab cache\n", v78, v79, v80, v81, v82, (char)"ACFUFTABFile");
              int v76 = 4;
            }
            if (v208 < 0) {
              operator delete(__s2[0]);
            }
            if (!v75) {
              goto LABEL_111;
            }
          }
          ++v69;
          v70 += 16;
        }
        while (v69 < *((unsigned int *)CFDataGetBytePtr(v11) + 10));
      }
      int v102 = CFDataGetLength(theDataa);
      uint64_t v103 = v60;
      *(_DWORD *)&CFDataGetBytePtr(v11)[16 * v60 + 56] = v102;
      if (!a4)
      {
        uint64_t v104 = CFDataGetBytePtr(v11);
        char v208 = 4;
        LODWORD(__s2[0]) = *(_DWORD *)&v104[16 * v60 + 48];
        BYTE4(__s2[0]) = 0;
        int v105 = *(_DWORD *)&CFDataGetBytePtr(v11)[16 * v60 + 52];
        int v106 = CFDataGetLength(theDataa);
        uint64_t v107 = ACFUFTABFile::updateCache((uint64_t)a1, (uint64_t)__s2, v105, v106);
        int v108 = v107;
        if (v107)
        {
          int v76 = 0;
        }
        else
        {
          v193 = ACFULogging::getLogInstance((ACFULogging *)v107);
          ACFULogging::handleMessage((uint64_t)v193, 2u, "%s::%s: could not update ftab cache\n", v194, v195, v196, v197, v198, (char)"ACFUFTABFile");
          int v76 = 4;
        }
        if (v208 < 0) {
          operator delete(__s2[0]);
        }
        if (!v108) {
          goto LABEL_111;
        }
      }
      uint64_t v109 = *(unsigned int *)&CFDataGetBytePtr(v11)[16 * v60 + 52];
      v212.location = CFDataGetLength(theDataa) + v109;
      v212.length = v68;
      CFDataDeleteBytes(v11, v212);
    }
    CFIndex v110 = *(unsigned int *)&CFDataGetBytePtr(v11)[16 * v103 + 52];
    CFIndex v111 = CFDataGetLength(theDataa);
    uint64_t v112 = CFDataGetBytePtr(theDataa);
    CFIndex v113 = CFDataGetLength(theDataa);
    v213.location = v110;
    v213.length = v111;
    CFDataReplaceBytes(v11, v213, v112, v113);
    if (!a4) {
      goto LABEL_112;
    }
LABEL_103:
    if (!v205 || (uint64_t v119 = ACFUFTABFile::setManifestOnData(a1, v205, a4), (v119 & 1) != 0))
    {
      char v120 = ACFUFTABFile::isValidFileData((ACFUFTABFile *)a1, *a4, 0);
LABEL_116:
      char v29 = v120;
      goto LABEL_117;
    }
    goto LABEL_128;
  }
  int v30 = (uint64_t **)(a1 + 9);
  uint64_t v31 = std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::find<std::string>((uint64_t)(a1 + 9), (const void **)a2);
  if (a1 + 10 != (ACFUDataContainer **)v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(const void **)(v31 + 56);
    if (v33)
    {
      CFRelease(v33);
      *(void *)(v32 + 56) = 0;
    }
  }
  uint64_t v34 = AMSupportSafeRetain();
  __s2[0] = (long long *)a2;
  std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v30, (const void **)a2, (uint64_t)&std::piecewise_construct, __s2)[7] = v34;
  char v29 = 1;
LABEL_117:
  AMSupportSafeRelease();
  return v29 & 1;
}

void sub_22EF0F65C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ACFUFTABFile::removeFileFromFTAB(ACFUDataContainer **a1, uint64_t a2)
{
  int v3 = a1[1];
  if (!v3)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: file data was invalid\n", v48, v49, v50, v51, v52, (char)"ACFUFTABFile");
    return 0;
  }
  isOptimized = (ACFULogging *)ACFUDataContainer::isOptimized(v3);
  if (isOptimized)
  {
    CFAllocatorRef v53 = ACFULogging::getLogInstance(isOptimized);
    ACFULogging::handleMessage((uint64_t)v53, 2u, "%s::%s: function is not supported in memory optimized flow. Memory optimized files are read only\n", v54, v55, v56, v57, v58, (char)"ACFUFTABFile");
    return 0;
  }
  uint64_t v6 = *(unsigned __int8 *)(a2 + 23);
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *(void *)(a2 + 8);
  }
  if (v6 != 4)
  {
    uint64_t v59 = ACFULogging::getLogInstance(isOptimized);
    ACFULogging::handleMessage((uint64_t)v59, 2u, "%s::%s: tag is either larger or smaller than limit %u (size: %lu)\n", v60, v61, v62, v63, v64, (char)"ACFUFTABFile");
    return 0;
  }
  uint64_t v7 = (ACFULogging *)(*((uint64_t (**)(ACFUDataContainer **, uint64_t))*a1 + 2))(a1, a2);
  if ((v7 & 1) == 0)
  {
    uint64_t v65 = ACFULogging::getLogInstance(v7);
    ACFULogging::handleMessage((uint64_t)v65, 2u, "%s::%s: tag '%s' doesn't exist\n", v66, v67, v68, v69, v70, (char)"ACFUFTABFile");
    return 0;
  }
  CFDataRef Data = (const __CFData *)ACFUDataContainer::getData(a1[1]);
  if (!Data)
  {
    uint64_t v71 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v71, 2u, "%s::%s: could not obtain file data\n", v72, v73, v74, v75, v76, (char)"ACFUFTABFile");
    return 0;
  }
  CFDataRef v9 = Data;
  if (*((_DWORD *)CFDataGetBytePtr(Data) + 10))
  {
    uint64_t v10 = 0;
    while (1)
    {
      BytePtr = CFDataGetBytePtr(v9);
      char v84 = 4;
      LODWORD(__s2[0]) = *(_DWORD *)&BytePtr[16 * v10 + 48];
      BYTE4(__s2[0]) = 0;
      uint64_t v12 = *(unsigned __int8 *)(a2 + 23);
      if ((v12 & 0x80u) == 0) {
        uint64_t v13 = *(unsigned __int8 *)(a2 + 23);
      }
      else {
        uint64_t v13 = *(void *)(a2 + 8);
      }
      if (v13 == 4)
      {
        if ((v12 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)a2, __s2, *(void *)(a2 + 8)))
          {
LABEL_24:
            unsigned int v16 = *(_DWORD *)&CFDataGetBytePtr(v9)[16 * v10 + 56];
            if (!v10) {
              goto LABEL_34;
            }
LABEL_25:
            uint64_t v17 = 0;
            while (1)
            {
              unint64_t v18 = CFDataGetBytePtr(v9);
              *(_DWORD *)&v18[v17 + 52] -= 16;
              char v19 = CFDataGetBytePtr(v9);
              char v84 = 4;
              LODWORD(__s2[0]) = *(_DWORD *)&v19[v17 + 48];
              BYTE4(__s2[0]) = 0;
              size_t v20 = CFDataGetBytePtr(v9);
              uint64_t updated = ACFUFTABFile::updateCache((uint64_t)a1, (uint64_t)__s2, *(_DWORD *)&v20[v17 + 52], 0);
              char v22 = updated;
              if ((updated & 1) == 0)
              {
                uint64_t v23 = ACFULogging::getLogInstance((ACFULogging *)updated);
                ACFULogging::handleMessage((uint64_t)v23, 2u, "%s::%s: could not update ftab cache\n", v24, v25, v26, v27, v28, (char)"ACFUFTABFile");
              }
              if (v84 < 0) {
                operator delete(__s2[0]);
              }
              if ((v22 & 1) == 0) {
                return 0;
              }
              v17 += 16;
              if (16 * v10 == v17) {
                goto LABEL_34;
              }
            }
          }
        }
        else
        {
          if (!*(unsigned char *)(a2 + 23)) {
            goto LABEL_24;
          }
          uint64_t v14 = __s2;
          uint64_t v15 = (unsigned __int8 *)a2;
          while (*v15 == *(unsigned __int8 *)v14)
          {
            ++v15;
            uint64_t v14 = (void **)((char *)v14 + 1);
            if (!--v12) {
              goto LABEL_24;
            }
          }
        }
      }
      if (++v10 >= (unint64_t)*((unsigned int *)CFDataGetBytePtr(v9) + 10))
      {
        unsigned int v16 = 0;
        if (!v10) {
          goto LABEL_34;
        }
        goto LABEL_25;
      }
    }
  }
  unsigned int v16 = 0;
  LODWORD(v10) = 0;
LABEL_34:
  uint64_t v29 = 16 * (v10 + 1);
  unsigned int v30 = v10;
  while (1)
  {
    ++v30;
    unsigned int v31 = *((_DWORD *)CFDataGetBytePtr(v9) + 10);
    uint64_t v32 = CFDataGetBytePtr(v9);
    if (v30 >= v31) {
      break;
    }
    *(_DWORD *)&v32[v29 + 52] = *(_DWORD *)&v32[v29 + 52] - v16 - 16;
    uint64_t v33 = CFDataGetBytePtr(v9);
    char v84 = 4;
    LODWORD(__s2[0]) = *(_DWORD *)&v33[v29 + 48];
    BYTE4(__s2[0]) = 0;
    uint64_t v34 = CFDataGetBytePtr(v9);
    uint64_t v35 = ACFUFTABFile::updateCache((uint64_t)a1, (uint64_t)__s2, *(_DWORD *)&v34[v29 + 52], 0);
    char v36 = v35;
    if ((v35 & 1) == 0)
    {
      uint64_t v37 = ACFULogging::getLogInstance((ACFULogging *)v35);
      ACFULogging::handleMessage((uint64_t)v37, 2u, "%s::%s: could not update ftab cache\n", v38, v39, v40, v41, v42, (char)"ACFUFTABFile");
    }
    if (v84 < 0) {
      operator delete(__s2[0]);
    }
    v29 += 16;
    if ((v36 & 1) == 0) {
      return 0;
    }
  }
  --*((_DWORD *)v32 + 10);
  if (*((_DWORD *)CFDataGetBytePtr(v9) + 4))
  {
    unsigned int v43 = *((_DWORD *)CFDataGetBytePtr(v9) + 4);
    if (v43 > *((_DWORD *)CFDataGetBytePtr(v9) + 13))
    {
      uint64_t v44 = CFDataGetBytePtr(v9);
      *((_DWORD *)v44 + 4) = *((_DWORD *)v44 + 4) - v16 - 16;
    }
  }
  v85.location = *(unsigned int *)&CFDataGetBytePtr(v9)[16 * v10 + 52];
  v85.length = v16;
  CFDataDeleteBytes(v9, v85);
  v86.location = 16 * v10 + 48;
  v86.length = 16;
  CFDataDeleteBytes(v9, v86);
  uint64_t v45 = ACFUFTABFile::updateCache((uint64_t)a1, a2, 0, 0);
  if ((v45 & 1) == 0)
  {
    uint64_t v77 = ACFULogging::getLogInstance((ACFULogging *)v45);
    ACFULogging::handleMessage((uint64_t)v77, 2u, "%s::%s: could not remove file entry from ftab cache\n", v78, v79, v80, v81, v82, (char)"ACFUFTABFile");
    return 0;
  }
  uint64_t result = (*((uint64_t (**)(ACFUDataContainer **))*a1 + 11))(a1);
  if (result) {
    return ACFUFTABFile::isCacheValid((ACFUFTABFile *)a1);
  }
  return result;
}

void sub_22EF0FB84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ACFUFTABFile::setFTABValidity(ACFUFTABFile *this, int a2)
{
  int v3 = (ACFUDataContainer *)*((void *)this + 1);
  if (v3)
  {
    isOptimized = (ACFULogging *)ACFUDataContainer::isOptimized(v3);
    if (isOptimized)
    {
      LogInstance = ACFULogging::getLogInstance(isOptimized);
      ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: function is not supported in memory optimized flow. Memory optimized files are read only\n", v15, v16, v17, v18, v19, (char)"ACFUFTABFile");
    }
    else
    {
      CFDataRef Data = (const __CFData *)ACFUDataContainer::getData(*((ACFUDataContainer **)this + 1));
      if (Data)
      {
        *((_DWORD *)CFDataGetBytePtr(Data) + 1) = a2;
        return 1;
      }
      size_t v20 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v20, 2u, "%s::%s: could not obtain file data\n", v21, v22, v23, v24, v25, (char)"ACFUFTABFile");
    }
  }
  else
  {
    uint64_t v8 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v8, 2u, "%s::%s: file data was invalid\n", v9, v10, v11, v12, v13, (char)"ACFUFTABFile");
  }
  return 0;
}

uint64_t ACFUFTABFile::copyFWDataByName(uint64_t a1, uint64_t a2)
{
  isOptimized = (ACFULogging *)ACFUDataContainer::isOptimized(*(ACFUDataContainer **)(a1 + 8));
  if (!isOptimized
    || (isOptimized = (ACFULogging *)std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::find<std::string>(a1 + 72, (const void **)a2), (ACFULogging *)(a1 + 80) == isOptimized))
  {
    if (!*(void *)(a1 + 8))
    {
      LogInstance = ACFULogging::getLogInstance(isOptimized);
      ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: file data was invalid\n", v15, v16, v17, v18, v19, (char)"ACFUFTABFile");
      return 0;
    }
    uint64_t v12 = *(unsigned __int8 *)(a2 + 23);
    if ((v12 & 0x80u) != 0) {
      uint64_t v12 = *(void *)(a2 + 8);
    }
    if (v12 != 4)
    {
      size_t v20 = ACFULogging::getLogInstance(isOptimized);
      ACFULogging::handleMessage((uint64_t)v20, 2u, "%s::%s: specified tag name is invalid!\n", v21, v22, v23, v24, v25, (char)"ACFUFTABFile");
      return 0;
    }
    uint64_t v13 = (unsigned int *)std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::find<std::string>(a1 + 40, (const void **)a2);
    if ((unsigned int *)(a1 + 48) == v13)
    {
      uint64_t v26 = ACFULogging::getLogInstance((ACFULogging *)v13);
      ACFULogging::handleMessage((uint64_t)v26, 2u, "%s::%s: file '%s' does not exist\n", v27, v28, v29, v30, v31, (char)"ACFUFTABFile");
      return 0;
    }
    uint64_t result = (uint64_t)ACFUDataContainer::copyData(*(ACFUDataContainer **)(a1 + 8), v13[15], v13[14]);
    if (!result)
    {
      uint64_t v32 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v32, 2u, "%s::%s: failed to copy file data\n", v33, v34, v35, v36, v37, (char)"ACFUFTABFile");
      return 0;
    }
  }
  else
  {
    uint64_t result = AMSupportSafeRetain();
    if (!result)
    {
      uint64_t v6 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v6, 2u, "%s::%s: failed to retain file data\n", v7, v8, v9, v10, v11, (char)"ACFUFTABFile");
      return 0;
    }
  }
  return result;
}

void ACFUFTABFile::copyFWRefByName(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, unsigned int a4@<W3>, ACFUDataContainer::DirectDataRef **a5@<X8>)
{
  *a5 = 0;
  uint64_t v7 = *(ACFULogging **)(a1 + 8);
  if (!v7)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    uint64_t v34 = "%s::%s: file data was invalid\n";
    goto LABEL_19;
  }
  uint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  if ((v9 & 0x80u) != 0) {
    uint64_t v9 = *(void *)(a2 + 8);
  }
  if (v9 != 4)
  {
    LogInstance = ACFULogging::getLogInstance(v7);
    uint64_t v34 = "%s::%s: specified tag name is invalid!\n";
    goto LABEL_19;
  }
  if (!ACFUDataContainer::isOptimized(v7)
    || (uint64_t v12 = std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::find<std::string>(a1 + 72, (const void **)a2), a1 + 80 == v12))
  {
    uint64_t v24 = (ACFULogging *)std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::find<std::string>(a1 + 40, (const void **)a2);
    if ((ACFULogging *)(a1 + 48) == v24)
    {
      LogInstance = ACFULogging::getLogInstance(v24);
      uint64_t v34 = "%s::%s: file does not exist\n";
    }
    else
    {
      ACFUDataContainer::copyDirectData(*(ACFUDataContainer **)(a1 + 8), a4, *((_DWORD *)v24 + 15) + a3, &v35);
      uint64_t v25 = v35;
      uint64_t v35 = 0;
      std::unique_ptr<ACFUDataContainer::DirectDataRef>::reset[abi:ne180100](a5, v25);
      uint64_t v26 = v35;
      uint64_t v35 = 0;
      if (v26)
      {
        ACFUDataContainer::DirectDataRef::~DirectDataRef(v26);
        operator delete(v27);
      }
      if (*a5) {
        return;
      }
      LogInstance = ACFULogging::getLogInstance(v26);
      uint64_t v34 = "%s::%s: failed to obtain data ref\n";
    }
LABEL_19:
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v34, v29, v30, v31, v32, v33, (char)"ACFUFTABFile");
    return;
  }
  uint64_t v13 = (UInt8 *)malloc(a4);
  if (!v13)
  {
    uint64_t v17 = ACFULogging::getLogInstance(0);
    uint64_t v23 = "%s::%s: failed to allocate data\n";
    goto LABEL_21;
  }
  uint64_t v14 = v13;
  v36.location = a3;
  v36.length = a4;
  CFDataGetBytes(*(CFDataRef *)(v12 + 56), v36, v13);
  uint64_t v15 = (ACFUDataContainer::DirectDataRef *)operator new(0x18uLL);
  ACFUDataContainer::DirectDataRef::DirectDataRef((uint64_t)v15, v14, a4, 0);
  std::unique_ptr<ACFUDataContainer::DirectDataRef>::reset[abi:ne180100](a5, v15);
  if (!*a5)
  {
    uint64_t v17 = ACFULogging::getLogInstance(v16);
    uint64_t v23 = "%s::%s: failed to obtain data ref\n";
LABEL_21:
    ACFULogging::handleMessage((uint64_t)v17, 2u, v23, v18, v19, v20, v21, v22, (char)"ACFUFTABFile");
  }
}

void sub_22EF0FFDC(_Unwind_Exception *a1)
{
  std::unique_ptr<ACFUDataContainer::DirectDataRef>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

CFDataRef ACFUFTABFile::copyFirmwareContainer(ACFUFTABFile *this)
{
  CFDataRef v36 = 0;
  uint64_t v2 = (ACFUDataContainer *)*((void *)this + 1);
  if (!v2)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: file data was invalid\n", v25, v26, v27, v28, v29, (char)"ACFUFTABFile");
    return v36;
  }
  CFDataRef v36 = ACFUDataContainer::copyData(v2);
  if (!v36)
  {
    uint64_t v30 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v30, 2u, "%s::%s: failed to obtain file data\n", v31, v32, v33, v34, v35, (char)"ACFUFTABFile");
    return v36;
  }
  if (ACFUDataContainer::isOptimized(*((ACFUDataContainer **)this + 1)))
  {
    int v3 = (ACFUFTABFile *)*((void *)this + 9);
    if (v3 != (ACFUFTABFile *)((char *)this + 80))
    {
      do
      {
        int v4 = (*(uint64_t (**)(ACFUFTABFile *, uint64_t))(*(void *)this + 16))(this, (uint64_t)v3 + 32);
        CFDataRef v5 = (const __CFData *)*((void *)v3 + 7);
        if (v4)
        {
          uint64_t updated = ACFUFTABFile::updateFileInFTABOnData((ACFUDataContainer **)this, (unsigned __int8 *)v3 + 32, v5, &v36);
          if ((updated & 1) == 0)
          {
            uint64_t v12 = ACFULogging::getLogInstance((ACFULogging *)updated);
            ACFULogging::handleMessage((uint64_t)v12, 2u, "%s::%s: failed to update file\n", v13, v14, v15, v16, v17, (char)"ACFUFTABFile");
            return v36;
          }
        }
        else
        {
          uint64_t v7 = ACFUFTABFile::addNewFileToFTABOnData(this, (uint64_t)v3 + 32, v5, &v36);
          if ((v7 & 1) == 0)
          {
            uint64_t v18 = ACFULogging::getLogInstance((ACFULogging *)v7);
            ACFULogging::handleMessage((uint64_t)v18, 2u, "%s::%s: failed to add new file\n", v19, v20, v21, v22, v23, (char)"ACFUFTABFile");
            return v36;
          }
        }
        uint64_t v8 = (ACFUFTABFile *)*((void *)v3 + 1);
        if (v8)
        {
          do
          {
            uint64_t v9 = v8;
            uint64_t v8 = *(ACFUFTABFile **)v8;
          }
          while (v8);
        }
        else
        {
          do
          {
            uint64_t v9 = (ACFUFTABFile *)*((void *)v3 + 2);
            BOOL v10 = *(void *)v9 == (void)v3;
            int v3 = v9;
          }
          while (!v10);
        }
        int v3 = v9;
      }
      while (v9 != (ACFUFTABFile *)((char *)this + 80));
    }
  }
  return v36;
}

void ACFUFTABFile::prettyLog(ACFUFTABFile *this)
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  uint64_t v2 = (ACFUDataContainer *)*((void *)this + 1);
  if (!v2)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: file data was invalid\n", v91, v92, v93, v94, v95, (char)"ACFUFTABFile");
    return;
  }
  int isOptimized = ACFUDataContainer::isOptimized(v2);
  int v4 = (ACFUDataContainer *)*((void *)this + 1);
  if (isOptimized)
  {
    CFDataRef v5 = ACFUDataContainer::copyData(v4, 0, 0x30uLL);
    if (!v5)
    {
      uint64_t v6 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v6, 2u, "%s::%s: failed to copy ftab header\n", v7, v8, v9, v10, v11, (char)"ACFUFTABFile");
      return;
    }
  }
  else
  {
    CFDataRef v5 = ACFUDataContainer::copyData(v4);
    if (!v5)
    {
      int v102 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v102, 2u, "%s::%s: could not obtain file data\n", v103, v104, v105, v106, v107, (char)"ACFUFTABFile");
      return;
    }
  }
  uint64_t v12 = v5;
  BytePtr = CFDataGetBytePtr(v5);
  uint64_t v14 = BytePtr;
  if (BytePtr)
  {
    int v15 = *((_DWORD *)BytePtr + 10);
    ACFUFile::fileVersionLog(this);
    uint64_t v17 = ACFULogging::getLogInstance(v16);
    ACFULogging::handleMessage((uint64_t)v17, 4u, "%s::%s: =========== FTAB Header ===========\n", v18, v19, v20, v21, v22, (char)"ACFUFTABFile");
    uint64_t v24 = ACFULogging::getLogInstance(v23);
    ACFULogging::handleMessage((uint64_t)v24, 4u, "%s::%s: Generation: %u, Valid: %u, BootNonce: 0x%08llx\n", v25, v26, v27, v28, v29, (char)"ACFUFTABFile");
    uint64_t v31 = ACFULogging::getLogInstance(v30);
    ACFULogging::handleMessage((uint64_t)v31, 4u, "%s::%s: Manifest Offset: %u, Manifest Length: %u, Magic: %s\n", v32, v33, v34, v35, v36, (char)"ACFUFTABFile");
    uint64_t v38 = ACFULogging::getLogInstance(v37);
    ACFULogging::handleMessage((uint64_t)v38, 4u, "%s::%s: Num Files: %u\n", v39, v40, v41, v42, v43, (char)"ACFUFTABFile");
    uint64_t v45 = ACFULogging::getLogInstance(v44);
    ACFULogging::handleMessage((uint64_t)v45, 4u, "%s::%s: =========== FTAB Header ===========\n\n", v46, v47, v48, v49, v50, (char)"ACFUFTABFile");
    uint64_t v52 = ACFULogging::getLogInstance(v51);
    ACFULogging::handleMessage((uint64_t)v52, 4u, "%s::%s: =========== FTAB Payloads ===========\n", v53, v54, v55, v56, v57, (char)"ACFUFTABFile");
    CFRelease(v12);
    if (v15)
    {
      unsigned int v59 = 48;
      while (1)
      {
        uint64_t v60 = ACFUDataContainer::copyData(*((ACFUDataContainer **)this + 1), v59, 0x10uLL);
        uint64_t v61 = v60;
        if (!v60) {
          break;
        }
        uint64_t v62 = (unsigned int *)CFDataGetBytePtr(v60);
        uint64_t v64 = v62[1];
        CC_LONG v63 = v62[2];
        char v113 = 4;
        LODWORD(v112) = *v62;
        BYTE4(v112) = 0;
        uint64_t v66 = &v14[v64];
        uint64_t v65 = ACFULogging::getLogInstance((ACFULogging *)v62);
        ACFULogging::handleMessage((uint64_t)v65, 4u, "%s::%s: Tag: %s :: Offset: 0x%04x Raw address: 0x%lx, size: %u\n", v67, v68, v69, v70, v71, (char)"ACFUFTABFile");
        if ((ACFUDataContainer::isOptimized(*((ACFUDataContainer **)this + 1)) & 1) == 0)
        {
          uint64_t v72 = CC_SHA384(v66, v63, md);
          if (v72 == md)
          {
            uint64_t v73 = ACFULogging::getLogInstance((ACFULogging *)v72);
            std::string::basic_string[abi:ne180100]<0>(&v108, "ACFUFTABFile");
            uint64_t v74 = std::string::append(&v108, "::");
            long long v75 = *(_OWORD *)&v74->__r_.__value_.__l.__data_;
            v109.__r_.__value_.__r.__words[2] = v74->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v109.__r_.__value_.__l.__data_ = v75;
            v74->__r_.__value_.__l.__size_ = 0;
            v74->__r_.__value_.__r.__words[2] = 0;
            v74->__r_.__value_.__r.__words[0] = 0;
            uint64_t v76 = std::string::append(&v109, "prettyLog");
            long long v77 = *(_OWORD *)&v76->__r_.__value_.__l.__data_;
            std::string::size_type v111 = v76->__r_.__value_.__r.__words[2];
            *(_OWORD *)std::string __p = v77;
            v76->__r_.__value_.__l.__size_ = 0;
            v76->__r_.__value_.__r.__words[2] = 0;
            v76->__r_.__value_.__r.__words[0] = 0;
            ACFULogging::handleMessageBinary((uint64_t)v73, (uint64_t *)__p, 4, (uint64_t)md, 0x30uLL, 1);
            if (SHIBYTE(v111) < 0) {
              operator delete(__p[0]);
            }
            if (SHIBYTE(v109.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v109.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v108.__r_.__value_.__l.__data_);
            }
          }
        }
        CFRelease(v61);
        if (v113 < 0) {
          operator delete(v112);
        }
        v59 += 16;
        if (!--v15) {
          goto LABEL_21;
        }
      }
      char v84 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v84, 2u, "%s::%s: failed to copy ftab file header\n", v85, v86, v87, v88, v89, (char)"ACFUFTABFile");
    }
    else
    {
LABEL_21:
      uint64_t v78 = ACFULogging::getLogInstance(v58);
      ACFULogging::handleMessage((uint64_t)v78, 4u, "%s::%s: =========== FTAB Payloads ===========\n\n", v79, v80, v81, v82, v83, (char)"ACFUFTABFile");
    }
  }
  else
  {
    uint64_t v96 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v96, 2u, "%s::%s: failed to copy ftab header\n", v97, v98, v99, v100, v101, (char)"ACFUFTABFile");
    CFRelease(v12);
  }
}

void sub_22EF105D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  if (a34 < 0) {
    operator delete(__p);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a40 < 0) {
    operator delete(a35);
  }
  _Unwind_Resume(exception_object);
}

BOOL ACFUFTABFile::hasFile(ACFULogging *a1, const void **a2)
{
  if (*((void *)a1 + 1)) {
    return std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::__count_unique<std::string>((uint64_t)a1 + 40, a2) != 0;
  }
  LogInstance = ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: file data was invalid\n", v4, v5, v6, v7, v8, (char)"ACFUFTABFile");
  return 0;
}

void ACFUFTABFile::~ACFUFTABFile(ACFUFTABFile *this)
{
  *(void *)this = &unk_26E27FE90;
  uint64_t v2 = (char *)this + 72;
  int v3 = (char *)*((void *)this + 9);
  uint64_t v4 = (char *)this + 80;
  if (v3 != (char *)this + 80)
  {
    do
    {
      uint64_t v5 = (const void *)*((void *)v3 + 7);
      if (v5)
      {
        CFRelease(v5);
        *((void *)v3 + 7) = 0;
      }
      uint64_t v6 = (char *)*((void *)v3 + 1);
      if (v6)
      {
        do
        {
          uint64_t v7 = v6;
          uint64_t v6 = *(char **)v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          uint64_t v7 = (char *)*((void *)v3 + 2);
          BOOL v8 = *(void *)v7 == (void)v3;
          int v3 = v7;
        }
        while (!v8);
      }
      int v3 = v7;
    }
    while (v7 != v4);
  }
  std::__tree<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::__map_value_compare<std::string,std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>>>::destroy((uint64_t)v2, *((char **)this + 10));
  std::__tree<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::__map_value_compare<std::string,std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>>>::destroy((uint64_t)this + 40, *((char **)this + 6));
  ACFUFile::~ACFUFile(this);
}

{
  void *v1;
  uint64_t vars8;

  ACFUFTABFile::~ACFUFTABFile(this);
  operator delete(v1);
}

uint64_t ACFUFTABFile::init(ACFUFTABFile *this, const __CFData *a2)
{
  *((void *)this + 3) = @"ftab.bin";
  uint64_t inited = ACFUFile::init(this, a2);
  if (inited)
  {
    uint64_t inited = (*(uint64_t (**)(ACFUFTABFile *))(*(void *)this + 88))(this);
    if (inited)
    {
      uint64_t inited = ACFUFTABFile::initCache(this);
      if (inited)
      {
        uint64_t inited = ACFUFTABFile::isCacheValid(this);
        if (inited) {
          return 1;
        }
        uint64_t v5 = "%s::%s: cache is invalid\n";
      }
      else
      {
        uint64_t v5 = "%s::%s: failed to initialize file cache\n";
      }
    }
    else
    {
      uint64_t v5 = "%s::%s: firmware file is invalid\n";
    }
  }
  else
  {
    uint64_t v5 = "%s::%s: firmware file failed to initialize\n";
  }
  LogInstance = ACFULogging::getLogInstance((ACFULogging *)inited);
  ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v5, v7, v8, v9, v10, v11, (char)"ACFUFTABFile");
  return 0;
}

uint64_t ACFUFTABFile::initCache(ACFUFTABFile *this)
{
  uint64_t v2 = (ACFULogging *)*((void *)this + 1);
  if (!v2)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: no file data?!\n", v41, v42, v43, v44, v45, (char)"ACFUFTABFile");
    goto LABEL_26;
  }
  if (*((void *)this + 7))
  {
    int v3 = ACFULogging::getLogInstance(v2);
    ACFULogging::handleMessage((uint64_t)v3, 4u, "%s::%s: ftab cache had entries before ftab container was initialized. Clearing cache before moving on.\n", v4, v5, v6, v7, v8, (char)"ACFUFTABFile");
    std::__tree<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::__map_value_compare<std::string,std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>>>::destroy((uint64_t)this + 40, *((char **)this + 6));
    *((void *)this + 5) = (char *)this + 48;
    *((void *)this + 6) = 0;
    *((void *)this + 7) = 0;
    uint64_t v2 = (ACFULogging *)*((void *)this + 1);
  }
  uint64_t v9 = ACFUDataContainer::copyData(v2, 0, 0x30uLL);
  if (!v9)
  {
    uint64_t v46 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v46, 2u, "%s::%s: failed to copy ftab header\n", v47, v48, v49, v50, v51, (char)"ACFUFTABFile");
    goto LABEL_26;
  }
  uint64_t v10 = v9;
  BytePtr = CFDataGetBytePtr(v9);
  if (BytePtr)
  {
    int v12 = *((_DWORD *)BytePtr + 10);
    CFRelease(v10);
    if (v12)
    {
      char v13 = 0;
      int v14 = v12 - 1;
      unsigned int v15 = 48;
      do
      {
        uint64_t v16 = ACFUDataContainer::copyData(*((ACFUDataContainer **)this + 1), v15, 0x10uLL);
        if (!v16)
        {
          uint64_t v28 = ACFULogging::getLogInstance(0);
          ACFULogging::handleMessage((uint64_t)v28, 2u, "%s::%s: failed to copy ftab file header\n", v29, v30, v31, v32, v33, (char)"ACFUFTABFile");
          char v19 = v13;
          return v19 & 1;
        }
        uint64_t v10 = v16;
        uint64_t v17 = CFDataGetBytePtr(v16);
        if (!v17)
        {
          uint64_t v34 = ACFULogging::getLogInstance(0);
          ACFULogging::handleMessage((uint64_t)v34, 2u, "%s::%s: failed to copy file header\n", v35, v36, v37, v38, v39, (char)"ACFUFTABFile");
          char v19 = v13;
          goto LABEL_21;
        }
        char v60 = 4;
        LODWORD(__p) = *(_DWORD *)v17;
        BYTE4(__p) = 0;
        uint64_t updated = ACFUFTABFile::updateCache((uint64_t)this, (uint64_t)&__p, *((_DWORD *)v17 + 1), *((_DWORD *)v17 + 2));
        char v19 = updated;
        if (updated)
        {
          CFRelease(v10);
          uint64_t v10 = 0;
        }
        else
        {
          uint64_t v22 = ACFULogging::getLogInstance((ACFULogging *)updated);
          ACFULogging::handleMessage((uint64_t)v22, 2u, "%s::%s: failed to initialize cache\n", v23, v24, v25, v26, v27, (char)"ACFUFTABFile");
        }
        if (v60 < 0) {
          operator delete(__p);
        }
        if (v14-- != 0) {
          char v21 = v19;
        }
        else {
          char v21 = 0;
        }
        v15 += 16;
        char v13 = 1;
      }
      while ((v21 & 1) != 0);
      if (!v10) {
        return v19 & 1;
      }
      goto LABEL_21;
    }
LABEL_26:
    char v19 = 0;
    return v19 & 1;
  }
  uint64_t v53 = ACFULogging::getLogInstance(0);
  ACFULogging::handleMessage((uint64_t)v53, 2u, "%s::%s: failed to copy ftab header\n", v54, v55, v56, v57, v58, (char)"ACFUFTABFile");
  char v19 = 0;
LABEL_21:
  CFRelease(v10);
  return v19 & 1;
}

void sub_22EF10AAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ACFUFTABFile::init(ACFUFTABFile *this, __CFData *a2)
{
  *((void *)this + 3) = @"ftab.bin";
  uint64_t inited = ACFUFile::init(this, a2);
  if (inited)
  {
    uint64_t inited = (*(uint64_t (**)(ACFUFTABFile *))(*(void *)this + 88))(this);
    if (inited)
    {
      uint64_t inited = ACFUFTABFile::initCache(this);
      if (inited)
      {
        uint64_t inited = ACFUFTABFile::isCacheValid(this);
        if (inited) {
          return 1;
        }
        uint64_t v5 = "%s::%s: cache is invalid\n";
      }
      else
      {
        uint64_t v5 = "%s::%s: failed to initialize file cache\n";
      }
    }
    else
    {
      uint64_t v5 = "%s::%s: firmware file is invalid\n";
    }
  }
  else
  {
    uint64_t v5 = "%s::%s: firmware file failed to initialize\n";
  }
  LogInstance = ACFULogging::getLogInstance((ACFULogging *)inited);
  ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v5, v7, v8, v9, v10, v11, (char)"ACFUFTABFile");
  return 0;
}

uint64_t ACFUFTABFile::init(ACFUFTABFile *this, const __CFString *a2, const __CFString *a3)
{
  *((void *)this + 3) = @"ftab.bin";
  uint64_t inited = ACFUFile::init(this, a2, a3);
  if (inited)
  {
    uint64_t inited = (*(uint64_t (**)(ACFUFTABFile *))(*(void *)this + 88))(this);
    if (inited)
    {
      uint64_t inited = ACFUFTABFile::initCache(this);
      if (inited)
      {
        uint64_t inited = ACFUFTABFile::isCacheValid(this);
        if (inited) {
          return 1;
        }
        uint64_t v6 = "%s::%s: cache is invalid\n";
      }
      else
      {
        uint64_t v6 = "%s::%s: failed to initialize file cache\n";
      }
    }
    else
    {
      uint64_t v6 = "%s::%s: firmware file is invalid\n";
    }
  }
  else
  {
    uint64_t v6 = "%s::%s: firmware file failed to initialize\n";
  }
  LogInstance = ACFULogging::getLogInstance((ACFULogging *)inited);
  ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v6, v8, v9, v10, v11, v12, (char)"ACFUFTABFile");
  return 0;
}

unint64_t ACFUFTABFile::getRequiredFileSize(ACFUFTABFile *this, const __CFData *a2)
{
  uint64_t isValidFileData = (ACFULogging *)ACFUFTABFile::isValidFileData(this, a2, 1);
  if (!isValidFileData)
  {
    uint64_t v8 = "%s::%s: header is invalid\n";
LABEL_11:
    LogInstance = ACFULogging::getLogInstance(isValidFileData);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v8, v10, v11, v12, v13, v14, (char)"ACFUFTABFile");
    return 0;
  }
  uint64_t isValidFileData = (ACFULogging *)CFDataGetBytePtr(a2);
  if (!isValidFileData)
  {
    uint64_t v8 = "%s::%s: failed to get header pointer\n";
    goto LABEL_11;
  }
  uint64_t v4 = isValidFileData;
  unint64_t result = (*((_DWORD *)isValidFileData + 5) + *((_DWORD *)isValidFileData + 4));
  uint64_t v6 = *((unsigned int *)v4 + 10);
  if (v6)
  {
    uint64_t v7 = (_DWORD *)((char *)v4 + 56);
    do
    {
      if (result <= (*v7 + *(v7 - 1))) {
        unint64_t result = (*v7 + *(v7 - 1));
      }
      v7 += 4;
      --v6;
    }
    while (v6);
  }
  return result;
}

uint64_t ACFUFTABFile::isValidFile(ACFUFTABFile *this)
{
  return ACFUFTABFile::isValidFileData(this, 0, 0);
}

ACFULogging *ACFUFTABFile::getFileSizeByFileName(uint64_t a1, const void **a2)
{
  int v3 = *(ACFUDataContainer **)(a1 + 8);
  if (v3)
  {
    if (!ACFUDataContainer::isOptimized(v3)
      || (uint64_t v5 = std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::find<std::string>(a1 + 72, a2), a1 + 80 == v5))
    {
      uint64_t v13 = std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::find<std::string>(a1 + 40, a2);
      if (a1 + 48 != v13) {
        return (ACFULogging *)*(unsigned int *)(v13 + 56);
      }
    }
    else
    {
      unint64_t result = (ACFULogging *)CFDataGetLength(*(CFDataRef *)(v5 + 56));
      if (result) {
        return result;
      }
      LogInstance = ACFULogging::getLogInstance(result);
      ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed obtain file size\n", v8, v9, v10, v11, v12, (char)"ACFUFTABFile");
    }
  }
  else
  {
    uint64_t v14 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v14, 2u, "%s::%s: file data was invalid\n", v15, v16, v17, v18, v19, (char)"ACFUFTABFile");
  }
  return 0;
}

void ACFUFTABFile::getFileOffsetByFileName(ACFUDataContainer **a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = a1[1];
  if (v4)
  {
    if (ACFUDataContainer::isOptimized(a1[1]))
    {
      uint64_t v7 = (ACFULogging *)std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::find<std::string>((uint64_t)(a1 + 9), a2);
      if (a1 + 10 != (ACFUDataContainer **)v7)
      {
        LogInstance = ACFULogging::getLogInstance(v7);
        ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: get offset not supported on dynamically added file %s to MMIO optimized FTAB\n", v9, v10, v11, v12, v13, (char)"ACFUFTABFile");
LABEL_8:
        int v15 = 0;
        BOOL v16 = 0;
        goto LABEL_9;
      }
    }
    uint64_t v14 = std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::find<std::string>((uint64_t)(a1 + 5), a2);
    if (a1 + 6 == (ACFUDataContainer **)v14) {
      goto LABEL_8;
    }
    int v15 = *(_DWORD *)(v14 + 60);
  }
  else
  {
    uint64_t v17 = ACFULogging::getLogInstance((ACFULogging *)a1);
    ACFULogging::handleMessage((uint64_t)v17, 2u, "%s::%s: file data was invalid\n", v18, v19, v20, v21, v22, (char)"ACFUFTABFile");
    int v15 = 0;
  }
  BOOL v16 = v4 != 0;
LABEL_9:
  *(_DWORD *)a3 = v15;
  *(unsigned char *)(a3 + 4) = v16;
}

uint64_t ACFUFTABFile::getVersion(ACFUFTABFile *this)
{
  uint64_t v2 = (ACFULogging *)std::string::basic_string[abi:ne180100]<0>(__p, "bver");
  if (*((void *)this + 1))
  {
    if ((*(unsigned int (**)(ACFUFTABFile *, void **))(*(void *)this + 16))(this, __p))
    {
      uint64_t v3 = (**(uint64_t (***)(ACFUFTABFile *, void **))this)(this, __p);
      goto LABEL_6;
    }
  }
  else
  {
    LogInstance = ACFULogging::getLogInstance(v2);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: file data was invalid\n", v5, v6, v7, v8, v9, (char)"ACFUFTABFile");
  }
  uint64_t v3 = 0;
LABEL_6:
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  return v3;
}

void sub_22EF11010(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__tree<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::__map_value_compare<std::string,std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::__map_value_compare<std::string,std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>>>::destroy(a1, *(void *)a2);
    std::__tree<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::__map_value_compare<std::string,std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>>>::destroy(a1, *((void *)a2 + 1));
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }
}

uint64_t std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::__count_unique<std::string>(uint64_t a1, const void **a2)
{
  uint64_t v2 = *(const void ***)(a1 + 8);
  if (v2)
  {
    uint64_t v4 = a1 + 16;
    uint64_t v5 = 1;
    do
    {
      if (!std::less<std::string>::operator()[abi:ne180100](v4, a2, v2 + 4))
      {
        if (!std::less<std::string>::operator()[abi:ne180100](v4, v2 + 4, a2)) {
          return v5;
        }
        ++v2;
      }
      uint64_t v2 = (const void **)*v2;
    }
    while (v2);
  }
  return 0;
}

BOOL std::less<std::string>::operator()[abi:ne180100](uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

uint64_t *std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, long long **a4)
{
  uint64_t v6 = (uint64_t **)std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::__find_equal<std::string>((uint64_t)a1, &v9, a2);
  unint64_t result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__insert_node_at(a1, v9, v6, v8);
    return v8;
  }
  return result;
}

void *std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::__find_equal<std::string>(uint64_t a1, void *a2, const void **a3)
{
  size_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v8 = (void *)v4;
        uint64_t v9 = (const void **)(v4 + 32);
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        size_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!std::less<std::string>::operator()[abi:ne180100](v7, v9, a3)) {
        break;
      }
      size_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

void std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, long long **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x40uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t v7 = (std::string *)(v6 + 32);
  uint64_t v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)v8, *((void *)v8 + 1));
  }
  else
  {
    long long v9 = *v8;
    *((void *)v6 + 6) = *((void *)v8 + 2);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v9;
  }
  *((void *)v6 + 7) = 0;
  *(unsigned char *)(a3 + 16) = 1;
}

void sub_22EF11340(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,void const*>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,void const*>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 55) < 0) {
      operator delete(__p[4]);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::find<std::string>(uint64_t a1, const void **a2)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 16;
  uint64_t v6 = a1 + 8;
  do
  {
    BOOL v7 = std::less<std::string>::operator()[abi:ne180100](v5, (const void **)(v3 + 32), a2);
    uint64_t v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      uint64_t v8 = (uint64_t *)v3;
      uint64_t v6 = v3;
    }
    uint64_t v3 = *v8;
  }
  while (*v8);
  if (v6 == v2 || std::less<std::string>::operator()[abi:ne180100](v5, a2, (const void **)(v6 + 32))) {
    return v2;
  }
  return v6;
}

uint64_t std::__tree<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::__map_value_compare<std::string,std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>>>::__erase_unique<std::string>(uint64_t **a1, const void **a2)
{
  uint64_t v3 = std::__tree<std::__value_type<std::string,void const*>,std::__map_value_compare<std::string,std::__value_type<std::string,void const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,void const*>>>::find<std::string>((uint64_t)a1, a2);
  if (a1 + 1 == (uint64_t **)v3) {
    return 0;
  }
  std::__tree<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::__map_value_compare<std::string,std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>>>::erase(a1, v3);
  return 1;
}

uint64_t *std::__tree<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::__map_value_compare<std::string,std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>>>::erase(uint64_t **a1, uint64_t a2)
{
  uint64_t v3 = std::__tree<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::__map_value_compare<std::string,std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>>>::__remove_node_pointer(a1, (uint64_t *)a2);
  if (*(char *)(a2 + 55) < 0) {
    operator delete(*(void **)(a2 + 32));
  }
  operator delete((void *)a2);
  return v3;
}

uint64_t *std::__tree<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::__map_value_compare<std::string,std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ACFUFTABFile::CachedFileMetadata>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      uint64_t v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    uint64_t v4 = a2;
    do
    {
      uint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  uint64_t v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      uint64_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      uint64_t v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  uint64_t v6 = (uint64_t **)v3[2];
  BOOL v7 = *v6;
  if (*v6 == v3)
  {
    uint64_t *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      BOOL v7 = 0;
      unint64_t result = (uint64_t *)v2;
    }
    else
    {
      BOOL v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    uint64_t *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      unint64_t result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      uint64_t v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      *uint64_t v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        unint64_t result = v7;
      }
      BOOL v7 = *(uint64_t **)(*v7 + 8);
    }
    int v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      BOOL v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        uint64_t *v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        BOOL v16 = v7;
      }
      else
      {
        int v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      uint64_t v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      uint64_t *v24 = v23;
      goto LABEL_72;
    }
    BOOL v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      uint64_t v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    BOOL v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      unint64_t result = v7;
    }
    BOOL v7 = *(uint64_t **)v12;
  }
  uint64_t v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  uint64_t v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    uint64_t v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    uint64_t *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    uint64_t v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  uint64_t v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

ACFULogging *ACFUDataAccess::createPeronalizedContentPath(ACFULogging *a1)
{
  if (a1 == 1)
  {
    LogInstance = ACFULogging::getLogInstance(a1);
    ACFULogging::handleMessage((uint64_t)LogInstance, 3u, "%s::%s: requesting APTicket file path\n", v9, v10, v11, v12, v13, (char)"ACFUDataAccess");
    uint64_t v7 = 2;
  }
  else
  {
    if (a1)
    {
      uint64_t v25 = ACFULogging::getLogInstance(a1);
      ACFULogging::handleMessage((uint64_t)v25, 2u, "%s::%s: could not determine requested path\n", v26, v27, v28, v29, v30, (char)"ACFUDataAccess");
      return 0;
    }
    uint64_t v1 = ACFULogging::getLogInstance(a1);
    ACFULogging::handleMessage((uint64_t)v1, 3u, "%s::%s: requesting personalized firmware root path\n", v2, v3, v4, v5, v6, (char)"ACFUDataAccess");
    uint64_t v7 = 0;
  }
  id v14 = (id)[MEMORY[0x263F53618] sharedDataAccessor];
  id v47 = 0;
  int v15 = (void *)[v14 copyPathForPersonalizedData:v7 error:&v47];
  id v16 = v47;

  if (v15)
  {
    uint64_t v18 = v15;
    uint64_t v19 = ACFULogging::getLogInstance(v18);
    std::string::basic_string[abi:ne180100]<0>(&v43, "ACFUDataAccess");
    uint64_t v20 = std::string::append(&v43, "::");
    long long v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
    v44.__r_.__value_.__r.__words[2] = v20->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v44.__r_.__value_.__l.__data_ = v21;
    v20->__r_.__value_.__l.__size_ = 0;
    v20->__r_.__value_.__r.__words[2] = 0;
    v20->__r_.__value_.__r.__words[0] = 0;
    uint64_t v22 = std::string::append(&v44, "createPeronalizedContentPath");
    long long v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
    std::string::size_type v46 = v22->__r_.__value_.__r.__words[2];
    long long v45 = v23;
    v22->__r_.__value_.__l.__size_ = 0;
    v22->__r_.__value_.__r.__words[2] = 0;
    v22->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v19, (uint64_t *)&v45, 3, (uint64_t)"path: ", (uint64_t)v18);
    if (SHIBYTE(v46) < 0) {
      operator delete((void *)v45);
    }
    if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v44.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v43.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    uint64_t v31 = ACFULogging::getLogInstance(v17);
    ACFULogging::handleMessage((uint64_t)v31, 2u, "%s::%s: failed to get the required path\n", v32, v33, v34, v35, v36, (char)"ACFUDataAccess");
    uint64_t v38 = ACFULogging::getLogInstance(v37);
    std::string::basic_string[abi:ne180100]<0>(&v43, "ACFUDataAccess");
    uint64_t v39 = std::string::append(&v43, "::");
    long long v40 = *(_OWORD *)&v39->__r_.__value_.__l.__data_;
    v44.__r_.__value_.__r.__words[2] = v39->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v44.__r_.__value_.__l.__data_ = v40;
    v39->__r_.__value_.__l.__size_ = 0;
    v39->__r_.__value_.__r.__words[2] = 0;
    v39->__r_.__value_.__r.__words[0] = 0;
    uint64_t v41 = std::string::append(&v44, "createPeronalizedContentPath");
    long long v42 = *(_OWORD *)&v41->__r_.__value_.__l.__data_;
    std::string::size_type v46 = v41->__r_.__value_.__r.__words[2];
    long long v45 = v42;
    v41->__r_.__value_.__l.__size_ = 0;
    v41->__r_.__value_.__r.__words[2] = 0;
    v41->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v38, (uint64_t *)&v45, 2, (uint64_t)"error details: ", [v16 localizedDescription]);
    if (SHIBYTE(v46) < 0) {
      operator delete((void *)v45);
    }
    if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v44.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v43.__r_.__value_.__l.__data_);
    }
    uint64_t v18 = 0;
  }

  return v18;
}

void sub_22EF11BD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  if (a17 < 0) {
    operator delete(a12);
  }

  _Unwind_Resume(a1);
}

CFStringRef ACFUDataAccess::createPersonalizedFirmwarePath(ACFUDataAccess *this, const __CFString *a2)
{
  PeronalizedContentPath = ACFUDataAccess::createPeronalizedContentPath(0);
  if (PeronalizedContentPath)
  {
    uint64_t v4 = PeronalizedContentPath;
    CFStringRef v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@/%@/", PeronalizedContentPath, this);
    if (!v5)
    {
      LogInstance = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to create path to firmware directory\n", v14, v15, v16, v17, v18, (char)"ACFUDataAccess");
    }
    CFRelease(v4);
  }
  else
  {
    uint64_t v7 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v7, 2u, "%s::%s: failed to get firmware root path\n", v8, v9, v10, v11, v12, (char)"ACFUDataAccess");
    return 0;
  }
  return v5;
}

void RTKitFirmware::RTKitFirmware(RTKitFirmware *this)
{
  ACFUFirmware::ACFUFirmware(this);
  *(void *)uint64_t v1 = &unk_26E27FF20;
  *(_DWORD *)(v1 + 84) = 0;
}

{
  uint64_t v1;

  ACFUFirmware::ACFUFirmware(this);
  *(void *)uint64_t v1 = &unk_26E27FF20;
  *(_DWORD *)(v1 + 84) = 0;
}

void RTKitFirmware::create(uint64_t a1@<X0>, const __CFData *a2@<X1>, uint64_t a3@<X2>, ACFUFirmware **a4@<X8>)
{
  uint64_t v8 = (ACFUFirmware *)operator new(0x58uLL);
  ACFUFirmware::ACFUFirmware(v8);
  *(void *)uint64_t v8 = &unk_26E27FF20;
  *((_DWORD *)v8 + 21) = 0;
  *a4 = v8;
  std::map<__CFString const*,std::string>::map[abi:ne180100](v9, a1);
  LOBYTE(a3) = RTKitFirmware::init((uint64_t)v8, (uint64_t)v9, a2, a3);
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)v9, (char *)v9[1]);
  if ((a3 & 1) == 0)
  {
    *a4 = 0;
    (*(void (**)(ACFUFirmware *))(*(void *)v8 + 56))(v8);
  }
}

void sub_22EF11EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, char *a11)
{
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&a10, a11);
  *uint64_t v12 = 0;
  (*(void (**)(uint64_t))(*(void *)v11 + 56))(v11);
  _Unwind_Resume(a1);
}

uint64_t RTKitFirmware::init(uint64_t a1, uint64_t a2, const __CFData *a3, uint64_t a4)
{
  std::map<__CFString const*,std::string>::map[abi:ne180100]((uint64_t *)v48, a2);
  BOOL v7 = ACFUFirmware::init(a1, v48);
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)v48, (char *)v48[1]);
  if (!v7)
  {
    LogInstance = ACFULogging::getLogInstance(v8);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to initialize base object\n", v29, v30, v31, v32, v33, (char)"RTKitFirmware");
    return 0;
  }
  ACFUFTABFile::create(a3, a4, 0xFFFF, &v46);
  uint64_t v9 = v46;
  std::string::size_type v46 = 0;
  uint64_t v10 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v9;
  if (v10)
  {
    (*(void (**)(uint64_t))(*(void *)v10 + 56))(v10);
    uint64_t v11 = v46;
    std::string::size_type v46 = 0;
    if (v11) {
      (*(void (**)(ACFUFile *))(*(void *)v11 + 56))(v11);
    }
    uint64_t v9 = *(ACFUFile **)(a1 + 32);
  }
  if (!v9)
  {
    uint64_t v34 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v34, 2u, "%s::%s: failed to create firmware\n", v35, v36, v37, v38, v39, (char)"RTKitFirmware");
    return 0;
  }
  ACFUFTABFile::copyManifest(v12, (uint64_t)&v46);
  if (!v47)
  {
    uint64_t v20 = v46;
    *(void *)(a1 + 48) = v46;
    if (v20) {
      goto LABEL_11;
    }
    long long v40 = ACFULogging::getLogInstance(v13);
    ACFULogging::handleMessage((uint64_t)v40, 2u, "%s::%s: failed to create manifest\n", v41, v42, v43, v44, v45, (char)"RTKitFirmware");
    return 0;
  }
  if (v47 != 1001)
  {
    uint64_t v22 = ACFULogging::getLogInstance(v13);
    ACFULogging::handleMessage((uint64_t)v22, 2u, "%s::%s: failed to get manifest, error: %d\n", v23, v24, v25, v26, v27, (char)"RTKitFirmware");
    return 0;
  }
  uint64_t v14 = ACFULogging::getLogInstance(v13);
  ACFULogging::handleMessage((uint64_t)v14, 0, "%s::%s: No manifest present\n", v15, v16, v17, v18, v19, (char)"RTKitFirmware");
  *(void *)(a1 + 48) = 0;
LABEL_11:
  if ((a4 & 2) != 0) {
    *(unsigned char *)(a1 + 80) = 1;
  }
  *(_DWORD *)(a1 + 56) = 1;
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1);
}

void sub_22EF12160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, char *a15)
{
}

void RTKitFirmware::create(uint64_t a1@<X0>, const __CFString *a2@<X1>, uint64_t a3@<X2>, ACFUFirmware **a4@<X8>)
{
  uint64_t v8 = (ACFUFirmware *)operator new(0x58uLL);
  ACFUFirmware::ACFUFirmware(v8);
  *(void *)uint64_t v8 = &unk_26E27FF20;
  *((_DWORD *)v8 + 21) = 0;
  *a4 = v8;
  std::map<__CFString const*,std::string>::map[abi:ne180100](v9, a1);
  LOBYTE(a3) = RTKitFirmware::init((uint64_t)v8, (uint64_t)v9, a2, a3);
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)v9, (char *)v9[1]);
  if ((a3 & 1) == 0)
  {
    *a4 = 0;
    (*(void (**)(ACFUFirmware *))(*(void *)v8 + 56))(v8);
  }
}

void sub_22EF12250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, char *a11)
{
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&a10, a11);
  *uint64_t v12 = 0;
  (*(void (**)(uint64_t))(*(void *)v11 + 56))(v11);
  _Unwind_Resume(a1);
}

uint64_t RTKitFirmware::init(uint64_t a1, uint64_t a2, const __CFString *a3, uint64_t a4)
{
  std::map<__CFString const*,std::string>::map[abi:ne180100]((uint64_t *)v48, a2);
  BOOL v7 = ACFUFirmware::init(a1, v48);
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)v48, (char *)v48[1]);
  if (!v7)
  {
    LogInstance = ACFULogging::getLogInstance(v8);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to initialize base object\n", v29, v30, v31, v32, v33, (char)"RTKitFirmware");
    return 0;
  }
  ACFUFTABFile::create(a3, a4, 0xFFFF, &v46);
  uint64_t v9 = v46;
  std::string::size_type v46 = 0;
  uint64_t v10 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v9;
  if (v10)
  {
    (*(void (**)(uint64_t))(*(void *)v10 + 56))(v10);
    uint64_t v11 = v46;
    std::string::size_type v46 = 0;
    if (v11) {
      (*(void (**)(ACFUFile *))(*(void *)v11 + 56))(v11);
    }
    uint64_t v9 = *(ACFUFile **)(a1 + 32);
  }
  if (!v9)
  {
    uint64_t v34 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v34, 2u, "%s::%s: failed to create firmware\n", v35, v36, v37, v38, v39, (char)"RTKitFirmware");
    return 0;
  }
  ACFUFTABFile::copyManifest(v12, (uint64_t)&v46);
  if (!v47)
  {
    uint64_t v20 = v46;
    *(void *)(a1 + 48) = v46;
    if (v20) {
      goto LABEL_11;
    }
    long long v40 = ACFULogging::getLogInstance(v13);
    ACFULogging::handleMessage((uint64_t)v40, 2u, "%s::%s: failed to create manifest\n", v41, v42, v43, v44, v45, (char)"RTKitFirmware");
    return 0;
  }
  if (v47 != 1001)
  {
    uint64_t v22 = ACFULogging::getLogInstance(v13);
    ACFULogging::handleMessage((uint64_t)v22, 2u, "%s::%s: failed to get manifest, error: %d\n", v23, v24, v25, v26, v27, (char)"RTKitFirmware");
    return 0;
  }
  uint64_t v14 = ACFULogging::getLogInstance(v13);
  ACFULogging::handleMessage((uint64_t)v14, 0, "%s::%s: No manifest present\n", v15, v16, v17, v18, v19, (char)"RTKitFirmware");
  *(void *)(a1 + 48) = 0;
LABEL_11:
  if ((a4 & 2) != 0) {
    *(unsigned char *)(a1 + 80) = 1;
  }
  *(_DWORD *)(a1 + 56) = 1;
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1);
}

void sub_22EF12504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, char *a15)
{
}

uint64_t RTKitFirmware::create@<X0>(uint64_t a1@<X0>, int a2@<W1>, ACFUFirmware **a3@<X8>)
{
  uint64_t v6 = (ACFUFirmware *)operator new(0x58uLL);
  ACFUFirmware::ACFUFirmware(v6);
  *(void *)uint64_t v6 = &unk_26E27FF20;
  *((_DWORD *)v6 + 21) = 0;
  *a3 = v6;
  uint64_t result = RTKitFirmware::init((uint64_t)v6, a1, a2);
  if ((result & 1) == 0)
  {
    *a3 = 0;
    uint64_t v8 = *(uint64_t (**)(ACFUFirmware *))(*(void *)v6 + 56);
    return v8(v6);
  }
  return result;
}

void sub_22EF125DC(_Unwind_Exception *a1)
{
  void *v2 = 0;
  (*(void (**)(uint64_t))(*(void *)v1 + 56))(v1);
  _Unwind_Resume(a1);
}

uint64_t RTKitFirmware::init(uint64_t a1, uint64_t a2, int a3)
{
  if (!*(void *)(a2 + 16))
  {
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)a1);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: No save path specified\n", v8, v9, v10, v11, v12, (char)"RTKitFirmware");
    return 0;
  }
  uint64_t v5 = ACFUFirmware::init((ACFULogging *)a1, a2);
  if ((v5 & 1) == 0)
  {
    uint64_t v13 = ACFULogging::getLogInstance((ACFULogging *)v5);
    ACFULogging::handleMessage((uint64_t)v13, 2u, "%s::%s: Failed to initialize base object\n", v14, v15, v16, v17, v18, (char)"RTKitFirmware");
    return 0;
  }
  *(_DWORD *)(a1 + 84) = a3;
  uint64_t result = 1;
  if ((a3 & 2) != 0) {
    *(unsigned char *)(a1 + 80) = 1;
  }
  return result;
}

CFDataRef RTKitFirmware::copyFirmwareNonce(RTKitFirmware *this)
{
  uint64_t v1 = (ACFUFTABFile *)*((void *)this + 4);
  if (v1
  {
    *(void *)uint64_t bytes = ACFUFTABFile::getBootNonce(v1);
    return CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, 8);
  }
  else
  {
    LogInstance = ACFULogging::getLogInstance(v1);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: Invalid firmware file\n", v4, v5, v6, v7, v8, (char)"RTKitFirmware");
    return 0;
  }
}

uint64_t RTKitFirmware::setFirmwareNonce(RTKitFirmware *this, const __CFData *a2)
{
  int Length = (ACFULogging *)*((void *)this + 4);
  if (!Length
  {
    LogInstance = ACFULogging::getLogInstance(Length);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: Invalid firmware file\n", v8, v9, v10, v11, v12, (char)"RTKitFirmware");
    return 0;
  }
  if (!a2 || (v4 = Length, int Length = (ACFULogging *)CFDataGetLength(a2), Length != (ACFULogging *)8))
  {
    uint64_t v13 = ACFULogging::getLogInstance(Length);
    ACFULogging::handleMessage((uint64_t)v13, 2u, "%s::%s: Bad parameter\n", v14, v15, v16, v17, v18, (char)"RTKitFirmware");
    return 0;
  }
  uint64_t v5 = *(void *)CFDataGetBytePtr(a2);
  return ACFUFTABFile::setBootNonce(v4, v5);
}

uint64_t RTKitFirmware::openFirmwareInRestoreOptions(RTKitFirmware *this, CFDictionaryRef theDict)
{
  uint64_t Value = CFDictionaryGetValue(theDict, @"FirmwareData");
  if (Value)
  {
    uint64_t v5 = Value;
    AMSupportSafeRetain();
    CFTypeID v6 = CFGetTypeID(v5);
    CFTypeID TypeID = (ACFULogging *)CFDataGetTypeID();
    if ((ACFULogging *)v6 == TypeID)
    {
      ACFUFTABFile::create((const __CFData *)v5, *((unsigned int *)this + 21), 0xFFFF, &v30);
      uint64_t v8 = v30;
      uint64_t v30 = 0;
      uint64_t v9 = (ACFULogging *)*((void *)this + 4);
      *((void *)this + 4) = v8;
      if (v9)
      {
        (*(void (**)(ACFULogging *))(*(void *)v9 + 56))(v9);
        uint64_t v9 = v30;
        uint64_t v30 = 0;
        if (v9) {
          uint64_t v9 = (ACFULogging *)(*(uint64_t (**)(ACFULogging *))(*(void *)v9 + 56))(v9);
        }
        uint64_t v8 = (ACFUFile *)*((void *)this + 4);
      }
      if (v8)
      {
        uint64_t v10 = ACFUFirmware::openFirmwareInRestoreOptions((const void **)this, theDict);
      }
      else
      {
        LogInstance = ACFULogging::getLogInstance(v9);
        ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: Failed to open firmware in restore options\n", v25, v26, v27, v28, v29, (char)"RTKitFirmware");
        uint64_t v10 = 1000;
      }
    }
    else
    {
      uint64_t v18 = ACFULogging::getLogInstance(TypeID);
      ACFULogging::handleMessage((uint64_t)v18, 2u, "%s::%s: Unrecognized CF object!\n", v19, v20, v21, v22, v23, (char)"RTKitFirmware");
      uint64_t v10 = 4002;
    }
    CFRelease(v5);
  }
  else
  {
    uint64_t v12 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v12, 2u, "%s::%s: Failed to find firmware in restore options\n", v13, v14, v15, v16, v17, (char)"RTKitFirmware");
    return 4001;
  }
  return v10;
}

uint64_t RTKitFirmware::saveFirmware(RTKitFirmware *this)
{
  uint64_t v2 = (ACFUFTABFile *)*((void *)this + 4);
  if (v2
  {
    uint64_t v3 = ACFUFTABFile::setFTABValidity(v2, 1);
    if (v3)
    {
      if (*((void *)this + 6))
      {
        return ACFUFirmware::saveFirmware(this, v4);
      }
      else
      {
        LogInstance = ACFULogging::getLogInstance((ACFULogging *)v3);
        ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: No manifest provided with firmware. Manifest is required!\n", v19, v20, v21, v22, v23, (char)"RTKitFirmware");
        return 1001;
      }
    }
    else
    {
      uint64_t v12 = ACFULogging::getLogInstance((ACFULogging *)v3);
      ACFULogging::handleMessage((uint64_t)v12, 2u, "%s::%s: Failed to set ftab validity\n", v13, v14, v15, v16, v17, (char)"RTKitFirmware");
      return 1004;
    }
  }
  else
  {
    CFTypeID v6 = ACFULogging::getLogInstance(v2);
    ACFULogging::handleMessage((uint64_t)v6, 2u, "%s::%s: Invalid firmware file\n", v7, v8, v9, v10, v11, (char)"RTKitFirmware");
    return 1000;
  }
}

uint64_t RTKitFirmware::saveFirmwareToPath(RTKitFirmware *this, const __CFURL *a2)
{
  uint64_t v3 = *((void *)this + 4);
  if (!v3)
  {
    if (a2) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v4 = 1005;
    uint64_t v5 = "%s::%s: Invalid save path\n";
    goto LABEL_8;
  }
  if (!a2) {
    goto LABEL_10;
  }
  if (!v3)
  {
LABEL_7:
    uint64_t v4 = 1000;
    uint64_t v5 = "%s::%s: Invalid firmware file\n";
LABEL_8:
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)v3);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v5, v7, v8, v9, v10, v11, (char)"RTKitFirmware");
    return v4;
  }
  uint64_t v3 = ACFUFile::saveToPath((ACFUFile *)v3, a2);
  if ((v3 & 1) == 0)
  {
    uint64_t v4 = 1004;
    uint64_t v5 = "%s::%s: Failed to save firmware to path\n";
    goto LABEL_8;
  }
  return 0;
}

uint64_t RTKitFirmware::setManifest(RTKitFirmware *this, const __CFData *a2)
{
  uint64_t v4 = (ACFUDataContainer **)*((void *)this + 4);
  if (v4
  {
    uint64_t v5 = ACFUFTABFile::setManifest(v4, a2);
    if ((v5 & 1) == 0)
    {
      LogInstance = ACFULogging::getLogInstance((ACFULogging *)v5);
      ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: Failed to set manifest\n", v15, v16, v17, v18, v19, (char)"RTKitFirmware");
      return 0;
    }
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v7 = ACFULogging::getLogInstance((ACFULogging *)v4);
    ACFULogging::handleMessage((uint64_t)v7, 2u, "%s::%s: Invalid firmware file\n", v8, v9, v10, v11, v12, (char)"RTKitFirmware");
    uint64_t v6 = 0;
  }
  ACFUFirmware::setManifest(this, a2);
  return v6;
}

uint64_t RTKitFirmware::getFileSizeByFileName(uint64_t a1)
{
  uint64_t v1 = *(ACFULogging **)(a1 + 32);
  if (v1
  {
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 32);
    return v2();
  }
  else
  {
    LogInstance = ACFULogging::getLogInstance(v1);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: Invalid firmware file\n", v5, v6, v7, v8, v9, (char)"RTKitFirmware");
    return 0;
  }
}

void RTKitFirmware::getFileOffsetByFileName(uint64_t a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  *(_DWORD *)a3 = 0;
  *(unsigned char *)(a3 + 4) = 0;
  uint64_t v3 = *(ACFUDataContainer ***)(a1 + 32);
  if (v3
  {
    ACFUFTABFile::getFileOffsetByFileName(v3, a2, (uint64_t)&v12);
    *(_DWORD *)a3 = v12;
    *(unsigned char *)(a3 + 4) = v13;
  }
  else
  {
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)v3);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: Invalid firmware file\n", v7, v8, v9, v10, v11, (char)"RTKitFirmware");
  }
}

uint64_t RTKitFirmware::updateTagWithData(uint64_t a1, unsigned __int8 *a2, const __CFData *a3)
{
  uint64_t updated = *(void *)(a1 + 32);
  if (!updated
  {
    uint64_t v6 = 1000;
    uint64_t v7 = "%s::%s: Invalid firmware file\n";
LABEL_6:
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)updated);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v7, v9, v10, v11, v12, v13, (char)"RTKitFirmware");
    return v6;
  }
  uint64_t updated = ACFUFTABFile::updateFileInFTAB((ACFUDataContainer **)updated, a2, a3);
  if ((updated & 1) == 0)
  {
    uint64_t v6 = 1017;
    uint64_t v7 = "%s::%s: failed to modify firmware file\n";
    goto LABEL_6;
  }
  return 0;
}

uint64_t RTKitFirmware::addTagWithData(uint64_t a1, uint64_t a2, const __CFData *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3
  {
    uint64_t v6 = 1000;
    uint64_t v7 = "%s::%s: Invalid firmware file\n";
LABEL_6:
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)v3);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v7, v9, v10, v11, v12, v13, (char)"RTKitFirmware");
    return v6;
  }
  uint64_t v3 = ACFUFTABFile::addNewFileToFTAB((ACFULogging *)v3, a2, a3);
  if ((v3 & 1) == 0)
  {
    uint64_t v6 = 1017;
    uint64_t v7 = "%s::%s: failed to modify firmware file\n";
    goto LABEL_6;
  }
  return 0;
}

uint64_t RTKitFirmware::removeTag(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2
  {
    uint64_t v4 = 1000;
    uint64_t v5 = "%s::%s: Invalid firmware file\n";
LABEL_6:
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)v2);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v5, v7, v8, v9, v10, v11, (char)"RTKitFirmware");
    return v4;
  }
  uint64_t v2 = ACFUFTABFile::removeFileFromFTAB((ACFUDataContainer **)v2, a2);
  if ((v2 & 1) == 0)
  {
    uint64_t v4 = 1017;
    uint64_t v5 = "%s::%s: failed to modify firmware file\n";
    goto LABEL_6;
  }
  return 0;
}

void RTKitFirmware::~RTKitFirmware(RTKitFirmware *this)
{
  ACFUFirmware::~ACFUFirmware(this);
  operator delete(v1);
}

uint64_t *std::map<__CFString const*,std::string>::map[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::map<__CFString const*,std::string>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<__CFString const*,std::string>,std::__tree_node<std::__value_type<__CFString const*,std::string>,void *> *,long>>>(a1, *(void **)a2, (void *)(a2 + 8));
  return a1;
}

void sub_22EF131CC(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::map<__CFString const*,std::string>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<__CFString const*,std::string>,std::__tree_node<std::__value_type<__CFString const*,std::string>,void *> *,long>>>(uint64_t *result, void *a2, void *a3)
{
  if (a2 != a3)
  {
    uint64_t v4 = a2;
    uint64_t v5 = (uint64_t **)result;
    uint64_t v6 = result + 1;
    do
    {
      uint64_t result = std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__emplace_hint_unique_key_args<__CFString const*,std::pair<__CFString const* const,std::string> const&>(v5, v6, v4 + 4, (uint64_t)(v4 + 4));
      uint64_t v7 = (void *)v4[1];
      if (v7)
      {
        do
        {
          uint64_t v8 = v7;
          uint64_t v7 = (void *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          uint64_t v8 = (void *)v4[2];
          BOOL v9 = *v8 == (void)v4;
          uint64_t v4 = v8;
        }
        while (!v9);
      }
      uint64_t v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__emplace_hint_unique_key_args<__CFString const*,std::pair<__CFString const* const,std::string> const&>(uint64_t **a1, void *a2, unint64_t *a3, uint64_t a4)
{
  uint64_t v6 = (uint64_t **)std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__find_equal<__CFString const*>(a1, a2, &v10, &v9, a3);
  uint64_t result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__construct_node<std::pair<__CFString const* const,std::string> const&>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__insert_node_at(a1, v10, v6, v8);
    return v8;
  }
  return result;
}

void *std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__find_equal<__CFString const*>(void *a1, void *a2, void *a3, void *a4, unint64_t *a5)
{
  uint64_t v5 = a1 + 1;
  if (a1 + 1 == a2 || (unint64_t v6 = *a5, v7 = a2[4], *a5 < v7))
  {
    uint64_t v8 = *a2;
    if ((void *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      uint64_t v9 = (void *)*a2;
      do
      {
        uint64_t v10 = v9;
        uint64_t v9 = (void *)v9[1];
      }
      while (v9);
    }
    else
    {
      uint64_t v13 = a2;
      do
      {
        uint64_t v10 = (void *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        uint64_t v13 = v10;
      }
      while (v14);
    }
    unint64_t v15 = *a5;
    if (v10[4] < *a5) {
      goto LABEL_17;
    }
    uint64_t v16 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v17 = v16;
          unint64_t v18 = v16[4];
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = (void *)*v17;
          uint64_t v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        uint64_t v5 = v17 + 1;
        uint64_t v16 = (void *)v17[1];
      }
      while (v16);
    }
    else
    {
      uint64_t v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    uint64_t v12 = (void *)a2[1];
    do
    {
      a4 = v12;
      uint64_t v12 = (void *)*v12;
    }
    while (v12);
  }
  else
  {
    uint64_t v19 = a2;
    do
    {
      a4 = (void *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      uint64_t v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= a4[4])
  {
    uint64_t v20 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v21 = v20;
          unint64_t v22 = v20[4];
          if (v6 >= v22) {
            break;
          }
          uint64_t v20 = (void *)*v21;
          uint64_t v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        uint64_t v5 = v21 + 1;
        uint64_t v20 = (void *)v21[1];
      }
      while (v20);
    }
    else
    {
      uint64_t v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

void ACFUSynchronize::Syncher::notifyIf(uint64_t a1, char a2, uint64_t a3)
{
  unint64_t v6 = (std::mutex *)(a1 + 48);
  std::mutex::lock((std::mutex *)(a1 + 48));
  uint64_t v7 = *(void *)(a3 + 24);
  if (!v7) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  if ((*(unsigned int (**)(uint64_t))(*(void *)v7 + 48))(v7))
  {
    ++*(_DWORD *)(a1 + 112);
    if (a2) {
      std::condition_variable::notify_all((std::condition_variable *)a1);
    }
    else {
      std::condition_variable::notify_one((std::condition_variable *)a1);
    }
  }
  std::mutex::unlock(v6);
}

void sub_22EF13544(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void ACFUSynchronize::Syncher::notify(uint64_t a1, char a2, uint64_t a3)
{
  unint64_t v6 = (std::mutex *)(a1 + 48);
  std::mutex::lock((std::mutex *)(a1 + 48));
  ++*(_DWORD *)(a1 + 112);
  uint64_t v7 = *(void *)(a3 + 24);
  if (!v7) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t))(*(void *)v7 + 48))(v7);
  if (a2) {
    std::condition_variable::notify_all((std::condition_variable *)a1);
  }
  else {
    std::condition_variable::notify_one((std::condition_variable *)a1);
  }
  std::mutex::unlock(v6);
}

void sub_22EF135FC(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t ACFUSynchronize::Syncher::wait(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(a1 + 48);
  __lk.__owns_ = 1;
  std::mutex::lock((std::mutex *)(a1 + 48));
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = std::chrono::system_clock::now().__d_.__rep_;
  uint64_t v26 = a1;
  std::__function::__value_func<BOOL ()(void)>::__value_func[abi:ne180100]((uint64_t)v27, a3);
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v7 = rep + 1000000 * a2;
  while (1)
  {
    if (*(int *)(v26 + 112) >= 1)
    {
      if (!v28) {
        goto LABEL_26;
      }
      if ((*(unsigned int (**)(uint64_t))(*(void *)v28 + 48))(v28)) {
        break;
      }
    }
    if (std::chrono::system_clock::now().__d_.__rep_ >= v7) {
      goto LABEL_15;
    }
    if (v7)
    {
      if (v7 < 1)
      {
        if ((unint64_t)v7 >= 0xFFDF3B645A1CAC09)
        {
LABEL_13:
          v8.__d_.__rep_ = 1000 * v7;
          goto LABEL_14;
        }
        v8.__d_.__rep_ = 0x8000000000000000;
      }
      else
      {
        if ((unint64_t)v7 <= 0x20C49BA5E353F7) {
          goto LABEL_13;
        }
        v8.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      v8.__d_.__rep_ = 0;
    }
LABEL_14:
    std::condition_variable::__do_timed_wait((std::condition_variable *)a1, &__lk, v8);
    if (std::chrono::system_clock::now().__d_.__rep_ >= v7)
    {
LABEL_15:
      if (*(int *)(v26 + 112) <= 0)
      {
        uint64_t v10 = (ACFULogging *)std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v27);
      }
      else
      {
        if (!v28) {
LABEL_26:
        }
          std::__throw_bad_function_call[abi:ne180100]();
        int v9 = (*(uint64_t (**)(uint64_t))(*(void *)v28 + 48))(v28);
        uint64_t v10 = (ACFULogging *)std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v27);
        if (v9) {
          goto LABEL_22;
        }
      }
      LogInstance = ACFULogging::getLogInstance(v10);
      ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: event wait timeout\n", v12, v13, v14, v15, v16, (char)"ACFUSynchronize");
      uint64_t v17 = 0;
      goto LABEL_23;
    }
  }
  uint64_t v10 = (ACFULogging *)std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v27);
LABEL_22:
  --*(_DWORD *)(a1 + 112);
  unint64_t v18 = ACFULogging::getLogInstance(v10);
  ACFULogging::handleMessage((uint64_t)v18, 3u, "%s::%s: event notification\n", v19, v20, v21, v22, v23, (char)"ACFUSynchronize");
  uint64_t v17 = 1;
LABEL_23:
  if (__lk.__owns_) {
    std::mutex::unlock(__lk.__m_);
  }
  return v17;
}

#error "22EF1391C: call analysis failed (funcsize=41)"

void *std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t std::__function::__value_func<BOOL ()(void)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t ACFULogging::initLog(ACFULogging *this, CFDictionaryRef theDict, void (*a3)(void *, const char *), void *a4)
{
  if (theDict)
  {
    uint64_t Value = CFDictionaryGetValue(theDict, @"Options");
    if (Value
      && (int v9 = Value, TypeID = CFDictionaryGetTypeID(), TypeID == CFGetTypeID(v9))
      && (CFBooleanRef v11 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v9, @"RestoreInternal")) != 0)
    {
      CFBooleanRef v12 = v11;
      CFTypeID v13 = CFGetTypeID(v11);
      int v14 = 2;
      if (v13 == CFBooleanGetTypeID())
      {
        if (CFBooleanGetValue(v12) == 1) {
          int v14 = 3;
        }
        else {
          int v14 = 2;
        }
      }
    }
    else
    {
      int v14 = 2;
    }
    *((void *)this + 9) = a3;
    *((void *)this + 10) = a4;
    ACFUCommon::parseDebugArgs(theDict, (const __CFDictionary *)"logLevel", &v34);
    uint64_t v16 = v35;
    if (v35 == 4006)
    {
      ACFULogging::getLogInstance(v15);
      ACFULogging::handleMessage((uint64_t)&ACFULogging::getLogInstance(void)::inst, 3u, "%s::%s: Key: %s not found while parsing debugArgs, but this is not error\n", v17, v18, v19, v20, v21, (char)"ACFULogging");
LABEL_16:
      int v22 = v14;
      goto LABEL_17;
    }
    if (v35)
    {
      ACFULogging::getLogInstance(v15);
      ACFULogging::handleMessage((uint64_t)&ACFULogging::getLogInstance(void)::inst, 0, "%s::%s: Failed to parse debugArgs\n", v29, v30, v31, v32, v33, (char)"ACFULogging");
      return v16;
    }
    int v22 = v34;
    if (v34 >= 5)
    {
      ACFULogging::getLogInstance(v15);
      ACFULogging::handleMessage((uint64_t)&ACFULogging::getLogInstance(void)::inst, 3u, "%s::%s: Unexpected value: %u for Key: %s\n", v23, v24, v25, v26, v27, (char)"ACFULogging");
      goto LABEL_16;
    }
  }
  else
  {
    *((void *)this + 9) = a3;
    *((void *)this + 10) = a4;
    int v22 = 2;
  }
LABEL_17:
  uint64_t v16 = 0;
  *((_DWORD *)this + 22) = v22;
  return v16;
}

void *ACFULogging::getLogInstance(ACFULogging *this)
{
  {
    ACFULogging::ACFULogging((ACFULogging *)&ACFULogging::getLogInstance(void)::inst);
    __cxa_atexit((void (*)(void *))ACFULogging::~ACFULogging, &ACFULogging::getLogInstance(void)::inst, &dword_22EEFB000);
  }
  return &ACFULogging::getLogInstance(void)::inst;
}

void ACFULogging::handleMessage(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (*(void *)(a1 + 72))
  {
    if (*(_DWORD *)(a1 + 88) < (signed int)a2) {
      return;
    }
  }
  else if (!os_log_type_enabled(*(os_log_t *)(a1 + 3168), *(os_log_type_t *)(a1 + a2)))
  {
    return;
  }
  std::mutex::lock((std::mutex *)(a1 + 8));
  if (vsnprintf((char *)(a1 + 92), 0xC00uLL, a3, &a9) >= 0xC01) {
    strcpy((char *)(a1 + 3099), "\n------ Internal buffer is too small, truncating bytes! ------\n");
  }
  ACFULogging::log((ACFULogging *)a1, *(os_log_type_t *)(a1 + a2), a1 + 92);
  std::mutex::unlock((std::mutex *)(a1 + 8));
}

void sub_22EF13DA8(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void ACFULogging::ACFULogging(ACFULogging *this)
{
  *(_DWORD *)this = 17830144;
  *((unsigned char *)this + 4) = 2;
  *((void *)this + 1) = 850045863;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((void *)this + 10) = 0;
  *((_DWORD *)this + 22) = 2;
  bzero((char *)this + 92, 0xC00uLL);
  *((void *)this + 396) = 0;
  os_log_t v2 = os_log_create("com.apple.AppleConvergedFirmwareUpdater", "service");
  uint64_t v3 = (void *)*((void *)this + 396);
  *((void *)this + 396) = v2;
}

void ACFULogging::~ACFULogging(ACFULogging *this)
{
  std::mutex::~mutex((std::mutex *)((char *)this + 8));
}

{

  std::mutex::~mutex((std::mutex *)((char *)this + 8));
}

BOOL ACFULogging::shouldLog(uint64_t a1, unsigned int a2)
{
  if (*(void *)(a1 + 72)) {
    return *(_DWORD *)(a1 + 88) >= (int)a2;
  }
  else {
    return os_log_type_enabled(*(os_log_t *)(a1 + 3168), *(os_log_type_t *)(a1 + a2));
  }
}

void ACFULogging::log(ACFULogging *this, os_log_type_t a2, uint64_t type)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (*)(uint64_t, uint64_t))*((void *)this + 9);
  if (v4)
  {
    uint64_t v5 = *((void *)this + 10);
    v4(v5, type);
  }
  else
  {
    std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v7 = *((void *)this + 396);
    if (os_log_type_enabled(v7, a2))
    {
      int v8 = 136315138;
      uint64_t v9 = type;
      _os_log_impl(&dword_22EEFB000, v7, a2, "%s", (uint8_t *)&v8, 0xCu);
    }
  }
}

void ACFULogging::handleMessageBinary(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, unint64_t a5, char a6)
{
  uint64_t v8 = a3;
  uint64_t v10 = a1;
  uint64_t v49 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 72))
  {
    if (*(_DWORD *)(a1 + 88) < (int)a3) {
      return;
    }
  }
  else if (!os_log_type_enabled(*(os_log_t *)(a1 + 3168), *(os_log_type_t *)(a1 + a3)))
  {
    return;
  }
  CFBooleanRef v11 = (std::mutex *)(v10 + 8);
  std::mutex::lock((std::mutex *)(v10 + 8));
  if (a5)
  {
    uint64_t v38 = (std::mutex *)(v10 + 8);
    unint64_t v17 = 0;
    unint64_t v18 = a5 - 224;
    uint64_t v19 = 0xFFFFFFFFLL;
    if (a5 <= 0x3E80)
    {
      unint64_t v18 = 0;
      char v20 = 0;
    }
    else
    {
      uint64_t v19 = 112;
      char v20 = a6;
    }
    char v44 = v20;
    uint64_t v43 = v19;
    unint64_t v39 = v19 + v18;
    uint64_t v40 = v10;
    unint64_t v41 = a5;
    do
    {
      char v21 = v44 ^ 1;
      if (v17 != v43) {
        char v21 = 1;
      }
      if ((v21 & 1) == 0)
      {
        if (*((char *)a2 + 23) >= 0) {
          LOBYTE(v22) = (_BYTE)a2;
        }
        else {
          uint64_t v22 = *a2;
        }
        ACFULogging::handleMessageInternal((char *)v10, v8, "%s -- middle of buffer snipped -- \n", v12, v13, v14, v15, v16, v22);
        unint64_t v17 = v39;
      }
      *(_OWORD *)&v47[16] = 0u;
      long long v48 = 0u;
      if (a5 - v17 >= 0x10) {
        uint64_t v23 = 16;
      }
      else {
        uint64_t v23 = a5 - v17;
      }
      long long v46 = 0uLL;
      *(_OWORD *)int v47 = 0uLL;
      long long v45 = 0uLL;
      if (v23)
      {
        uint64_t v24 = v8;
        uint64_t v25 = (54 - 3 * v23) - 3;
        uint64_t v26 = v23;
        uint64_t v27 = (char *)&v45 + 1;
        uint64_t v28 = (unsigned __int8 *)(a4 + v17);
        do
        {
          unsigned int v29 = *v28++;
          char v30 = a0123456789abcd[v29 & 0xF];
          *(v27 - 1) = a0123456789abcd[(unint64_t)v29 >> 4];
          char *v27 = v30;
          v27[1] = 32;
          v27 += 3;
          v25 += 3;
          --v26;
        }
        while (v26);
        memset(v27 - 1, 32, 3 * (17 - v23));
        for (uint64_t i = 0; i != v23; ++i)
        {
          int v32 = *(unsigned __int8 *)(a4 + v17 + i);
          if ((v32 - 32) >= 0x5F) {
            LOBYTE(v32) = 46;
          }
          *((unsigned char *)&v45 + v25 + i) = v32;
        }
        int v33 = v25 + i;
        uint64_t v34 = v24;
        uint64_t v10 = v40;
        a5 = v41;
      }
      else
      {
        *(_DWORD *)&v47[15] = 538976288;
        *(void *)&long long v35 = 0x2020202020202020;
        *((void *)&v35 + 1) = 0x2020202020202020;
        long long v46 = v35;
        *(_OWORD *)int v47 = v35;
        uint64_t v34 = v8;
        int v33 = 51;
        long long v45 = v35;
      }
      strcpy((char *)&v45 + v33, "\r\n");
      if (*((char *)a2 + 23) >= 0) {
        LOBYTE(v36) = (_BYTE)a2;
      }
      else {
        uint64_t v36 = *a2;
      }
      ACFULogging::handleMessageInternal((char *)v10, v34, "%s %04zx  %s", v12, v13, v14, v15, v16, v36);
      uint64_t v8 = v34;
      v17 += 16;
    }
    while (v17 < a5);
    CFBooleanRef v11 = v38;
    if (v44)
    {
      if (*((char *)a2 + 23) >= 0) {
        LOBYTE(v37) = (_BYTE)a2;
      }
      else {
        uint64_t v37 = *a2;
      }
      ACFULogging::handleMessageInternal((char *)v10, v34, "%s (snipped)\n", v12, v13, v14, v15, v16, v37);
    }
  }
  std::mutex::unlock(v11);
}

void sub_22EF14274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::mutex *a13)
{
}

void ACFULogging::handleMessageInternal(char *a1, int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11 = (uint64_t)(a1 + 92);
  if (vsnprintf(a1 + 92, 0xC00uLL, a3, &a9) >= 0xC01) {
    strcpy(a1 + 3099, "\n------ Internal buffer is too small, truncating bytes! ------\n");
  }
  ACFULogging::log((ACFULogging *)a1, (os_log_type_t)a1[a2], v11);
}

void ACFULogging::handleMessageCFType(uint64_t a1, uint64_t *a2, int a3, uint64_t a4, uint64_t a5)
{
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v28 = 0;
  if (*(void *)(a1 + 72))
  {
    if (*(_DWORD *)(a1 + 88) < a3) {
      return;
    }
  }
  else if (!os_log_type_enabled(*(os_log_t *)(a1 + 3168), *(os_log_type_t *)(a1 + a3)))
  {
    return;
  }
  std::mutex::lock((std::mutex *)(a1 + 8));
  if (a5)
  {
    if (*((char *)a2 + 23) >= 0) {
      uint64_t v15 = a2;
    }
    else {
      uint64_t v15 = (uint64_t *)*a2;
    }
    CFStringRef v16 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%s: %s\n %@\n", v15, a4, a5);
    CFStringRef v17 = v16;
    if (v16)
    {
      ACFUCommon::stringFromCFString(v16, &v25);
      uint64_t v28 = v26;
      *(_OWORD *)std::string __p = v25;
      if (SHIBYTE(v26) < 0)
      {
        if (__p[1]) {
          LOBYTE(v23) = __p[0];
        }
        else {
          uint64_t v23 = (void **)"UNDEF";
        }
      }
      else
      {
        uint64_t v23 = __p;
        if (!HIBYTE(v26)) {
          uint64_t v23 = (void **)"UNDEF";
        }
      }
      ACFULogging::handleMessageInternal((char *)a1, a3, "%s", v18, v19, v20, v21, v22, (char)v23);
      CFRelease(v17);
      goto LABEL_18;
    }
    uint64_t v24 = "%s::%s: failed to format CFString\n";
  }
  else
  {
    uint64_t v24 = "%s::%s: CFType to be printed is NULL\n";
  }
  ACFULogging::handleMessageInternal((char *)a1, 2, v24, v10, v11, v12, v13, v14, (char)"ACFULogging");
LABEL_18:
  std::mutex::unlock((std::mutex *)(a1 + 8));
  if (SHIBYTE(v28) < 0) {
    operator delete(__p[0]);
  }
}

void sub_22EF14498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  std::mutex::unlock(v20);
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void ACFUErrorContainer::ACFUErrorContainer(std::string *this, long long *a2, std::string::size_type a3, std::string::size_type a4)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v7 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v7;
  }
  this[1].__r_.__value_.__r.__words[0] = a3;
  this[1].__r_.__value_.__l.__size_ = a4;
  AMSupportSafeRetain();
}

void sub_22EF14560(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void ACFUErrorContainer::~ACFUErrorContainer(ACFUErrorContainer *this)
{
  os_log_t v2 = (const void *)*((void *)this + 4);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 4) = 0;
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*(void **)this);
  }
}

void ACFUError::ACFUError(ACFUError *this, const __CFString *a2)
{
  *((void *)this + 1) = 0;
  uint64_t v4 = (void ***)((char *)this + 8);
  uint64_t v5 = (void **)operator new(0x18uLL);
  void *v5 = 0;
  v5[1] = 0;
  v5[2] = 0;
  unint64_t v6 = 0;
  std::unique_ptr<std::vector<ACFUErrorContainer>>::reset[abi:ne180100](v4, v5);
  std::unique_ptr<std::vector<ACFUErrorContainer>>::reset[abi:ne180100](&v6, 0);
  *(void *)this = a2;
  AMSupportSafeRetain();
}

void sub_22EF14644(_Unwind_Exception *a1)
{
  std::unique_ptr<std::vector<ACFUErrorContainer>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

CFErrorRef ACFUError::getCFError(ACFUError *this)
{
  if (**((void **)this + 1) == *(void *)(*((void *)this + 1) + 8))
  {
    LogInstance = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: Looks like there is no error present; Nothing to be done here.\n",
      v18,
      v19,
      v20,
      v21,
      v22,
      (char)"ACFUError");
    return 0;
  }
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDataRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v4 = *(void *)(*((void *)this + 1) + 8);
  uint64_t v5 = (const char *)(v4 - 40);
  if (*(char *)(v4 - 17) < 0) {
    uint64_t v5 = *(const char **)v5;
  }
  CFStringRef v6 = CFStringCreateWithCString(v2, v5, 0x8000100u);
  CFStringRef v7 = v6;
  if (v6)
  {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263EFFC48], v6);
    uint64_t v9 = *(void *)(*((void *)this + 1) + 8);
    if (*(void *)(v9 - 8))
    {
      uint64_t v10 = ACFULogging::getLogInstance(v8);
      ACFULogging::handleMessage((uint64_t)v10, 3u, "%s::%s: Populating underlying error\n", v11, v12, v13, v14, v15, (char)"ACFUError");
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263EFFC88], *(const void **)(*(void *)(*((void *)this + 1) + 8) - 8));
      uint64_t v9 = *(void *)(*((void *)this + 1) + 8);
    }
    CFErrorRef v16 = CFErrorCreate(v2, *(CFErrorDomain *)this, *(void *)(v9 - 16), Mutable);
    if (v16)
    {
      if (!Mutable) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    uint64_t v24 = "%s::%s: failed to create CFError object\n";
  }
  else
  {
    uint64_t v24 = "%s::%s: failed to create CFString for error object\n";
  }
  long long v25 = ACFULogging::getLogInstance(0);
  ACFULogging::handleMessage((uint64_t)v25, 2u, v24, v26, v27, v28, v29, v30, (char)"ACFUError");
  CFErrorRef v16 = 0;
  if (Mutable) {
LABEL_9:
  }
    CFRelease(Mutable);
LABEL_10:
  if (v7) {
    CFRelease(v7);
  }
  return v16;
}

void ACFUError::clearError(ACFUError *this)
{
  uint64_t v1 = (uint64_t *)*((void *)this + 1);
  uint64_t v3 = *v1;
  for (uint64_t i = v1[1]; i != v3; ACFUErrorContainer::~ACFUErrorContainer((ACFUErrorContainer *)(i - 40)))
    ;
  v1[1] = v3;
}

uint64_t ACFUError::addError(uint64_t a1, uint64_t a2, std::string::size_type a3, std::string::size_type a4)
{
  std::string::size_type v7 = a4;
  std::string::size_type v8 = a3;
  uint64_t v4 = *(uint64_t **)(a1 + 8);
  unint64_t v5 = v4[1];
  if (v5 >= v4[2])
  {
    uint64_t result = std::vector<ACFUErrorContainer>::__emplace_back_slow_path<std::string const&,long &,__CFError *&>(v4, a2, &v8, &v7);
  }
  else
  {
    std::allocator<ACFUErrorContainer>::construct[abi:ne180100]<ACFUErrorContainer,std::string const&,long &,__CFError *&>(v4 + 16, (std::string *)v4[1], a2, &v8, &v7);
    uint64_t result = v5 + 40;
    v4[1] = v5 + 40;
  }
  v4[1] = result;
  return result;
}

void sub_22EF148DC(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void ACFUError::logError(ACFUError *this)
{
  uint64_t v1 = (uint64_t *)*((void *)this + 1);
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  LogInstance = ACFULogging::getLogInstance(this);
  if (v2 == v3) {
    ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: No error to log. All clear, move along now!\n", v5, v6, v7, v8, v9, (char)"ACFUError");
  }
  else {
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: Error Reason: %s, Error Code: 0x%08lx\n", v5, v6, v7, v8, v9, (char)"ACFUError");
  }
}

BOOL ACFUError::hasError(ACFUError *this)
{
  return *(void *)(*((void *)this + 1) + 8) != **((void **)this + 1);
}

const void *ACFUError::createAppendedDomain(const void **this, const __CFString *a2)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDataRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 3, MEMORY[0x263EFFF70]);
  CFArrayAppendValue(Mutable, *this);
  CFArrayAppendValue(Mutable, a2);
  CFArrayRef Copy = CFArrayCreateCopy(v4, Mutable);
  if (*this)
  {
    CFRelease(*this);
    *this = 0;
  }
  *this = CFStringCreateByCombiningStrings(v4, Copy, @"::");
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (Copy) {
    CFRelease(Copy);
  }
  return *this;
}

void ACFUError::~ACFUError(void ***this)
{
  uint64_t v2 = *this;
  if (v2)
  {
    CFRelease(v2);
    *this = 0;
  }
  std::unique_ptr<std::vector<ACFUErrorContainer>>::reset[abi:ne180100](this + 1, 0);
}

void std::unique_ptr<std::vector<ACFUErrorContainer>>::reset[abi:ne180100](void ***a1, void **a2)
{
  uint64_t v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    uint64_t v3 = v2;
    std::vector<ACFUErrorContainer>::__destroy_vector::operator()[abi:ne180100](&v3);
    operator delete(v2);
  }
}

void std::vector<ACFUErrorContainer>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    CFAllocatorRef v4 = (char *)v1[1];
    uint64_t v5 = v2;
    if (v4 != v2)
    {
      do
        ACFUErrorContainer::~ACFUErrorContainer((ACFUErrorContainer *)(v4 - 40));
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::vector<ACFUErrorContainer>::__emplace_back_slow_path<std::string const&,long &,__CFError *&>(uint64_t *a1, uint64_t a2, std::string::size_type *a3, std::string::size_type *a4)
{
  unint64_t v5 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 3);
  unint64_t v6 = v5 + 1;
  if (v5 + 1 > 0x666666666666666) {
    std::vector<ACFURTKitNVRMGenerator::RTKitNVRMVariable>::__throw_length_error[abi:ne180100]();
  }
  if (0x999999999999999ALL * ((a1[2] - *a1) >> 3) > v6) {
    unint64_t v6 = 0x999999999999999ALL * ((a1[2] - *a1) >> 3);
  }
  if (0xCCCCCCCCCCCCCCCDLL * ((a1[2] - *a1) >> 3) >= 0x333333333333333) {
    unint64_t v10 = 0x666666666666666;
  }
  else {
    unint64_t v10 = v6;
  }
  uint64_t v18 = a1 + 2;
  if (v10) {
    uint64_t v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ACFUErrorContainer>>((uint64_t)(a1 + 2), v10);
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v14 = v11;
  uint64_t v15 = (std::string *)&v11[40 * v5];
  CFStringRef v17 = &v11[40 * v10];
  std::allocator<ACFUErrorContainer>::construct[abi:ne180100]<ACFUErrorContainer,std::string const&,long &,__CFError *&>(a1 + 16, v15, a2, a3, a4);
  CFErrorRef v16 = &v15[1].__r_.__value_.__s.__data_[16];
  std::vector<ACFUErrorContainer>::__swap_out_circular_buffer(a1, &v14);
  uint64_t v12 = a1[1];
  std::__split_buffer<ACFUErrorContainer>::~__split_buffer((uint64_t)&v14);
  return v12;
}

void sub_22EF14C80(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<ACFUErrorContainer>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::allocator<ACFUErrorContainer>::construct[abi:ne180100]<ACFUErrorContainer,std::string const&,long &,__CFError *&>(int a1, std::string *this, uint64_t a3, std::string::size_type *a4, std::string::size_type *a5)
{
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string __p = *(std::string *)a3;
  }
  ACFUErrorContainer::ACFUErrorContainer(this, (long long *)&__p, *a4, *a5);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_22EF14D18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<ACFUErrorContainer>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<ACFUErrorContainer>,std::reverse_iterator<ACFUErrorContainer*>,std::reverse_iterator<ACFUErrorContainer*>,std::reverse_iterator<ACFUErrorContainer*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ACFUErrorContainer>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(40 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<ACFUErrorContainer>,std::reverse_iterator<ACFUErrorContainer*>,std::reverse_iterator<ACFUErrorContainer*>,std::reverse_iterator<ACFUErrorContainer*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a3 != a5)
  {
    uint64_t v10 = 0;
    uint64_t v11 = a7 - 40;
    do
    {
      uint64_t v12 = (std::string *)(v11 + v10);
      uint64_t v13 = (const std::string::value_type **)(a3 + v10 - 40);
      if (*(char *)(a3 + v10 - 17) < 0)
      {
        std::string::__init_copy_ctor_external(v12, *v13, *(void *)(a3 + v10 - 32));
      }
      else
      {
        long long v14 = *(_OWORD *)v13;
        v12->__r_.__value_.__r.__words[2] = *(void *)(a3 + v10 - 24);
        *(_OWORD *)&v12->__r_.__value_.__l.__data_ = v14;
      }
      *(_OWORD *)(v11 + v10 + 24) = *(_OWORD *)(a3 + v10 - 16);
      v10 -= 40;
    }
    while (a3 + v10 != a5);
  }
  return a6;
}

void sub_22EF14EA0(_Unwind_Exception *exception_object)
{
  for (; v2; v2 += 40)
    ACFUErrorContainer::~ACFUErrorContainer((ACFUErrorContainer *)(v1 + v2));
  _Unwind_Resume(exception_object);
}

uint64_t std::__split_buffer<ACFUErrorContainer>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 40;
    ACFUErrorContainer::~ACFUErrorContainer((ACFUErrorContainer *)(i - 40));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void ACFUACIPCTransport::ACFUACIPCTransport(ACFUACIPCTransport *this)
{
  ACFUTransport::ACFUTransport(this);
  *uint64_t v1 = &unk_26E27FF98;
  v1[3] = 0;
  v1[4] = 0;
  v1[5] = 0x800000;
  v1[6] = 0;
  v1[7] = &unk_26E2800D0;
  v1[10] = v1 + 7;
  v1[11] = &unk_26E280160;
  v1[14] = v1 + 11;
  v1[15] = &unk_26E2801F0;
  v1[18] = v1 + 15;
  v1[19] = 0;
}

uint64_t ACFUACIPCTransport::init(uint64_t a1, uint64_t *a2)
{
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.acfu.acipcTransport", 0);
  uint64_t v5 = *(void **)(a1 + 152);
  *(void *)(a1 + 152) = v4;

  if (*(void *)(a1 + 152))
  {
    uint64_t v7 = (std::__shared_weak_count *)a2[1];
    uint64_t v36 = *a2;
    uint64_t v37 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    BOOL v8 = ACFUTransport::init(a1, &v36);
    uint64_t v9 = (ACFULogging *)v37;
    if (v37) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v37);
    }
    if (v8)
    {
      uint64_t v10 = 1;
      goto LABEL_8;
    }
    LogInstance = ACFULogging::getLogInstance(v9);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to init ACFUTransport\n", v31, v32, v33, v34, v35, (char)"ACFUACIPCTransport");
  }
  else
  {
    uint64_t v24 = ACFULogging::getLogInstance(v6);
    ACFULogging::handleMessage((uint64_t)v24, 2u, "%s::%s: failed to create dispatch queue\n", v25, v26, v27, v28, v29, (char)"ACFUACIPCTransport");
  }
  uint64_t v10 = 0;
LABEL_8:
  Trace = (unsigned __int8 *)ACFUTrace::getTrace(v9);
  int v12 = Trace[12];
  uint64_t v13 = ACFUTrace::getTrace((ACFUTrace *)Trace);
  if (v12)
  {
    long long v14 = ACFUTrace::getTrace((ACFUTrace *)v13);
    ACFUTrace::getTrace((ACFUTrace *)v14);
    kdebug_trace();
  }
  else if (*(_DWORD *)v13)
  {
    uint64_t v15 = (ACFUTrace *)ACFULogging::getLogInstance((ACFULogging *)v13);
    CFErrorRef v16 = ACFUTrace::getTrace(v15);
    CFStringRef v17 = ACFUTrace::getTrace((ACFUTrace *)v16);
    ACFUTrace::getTrace((ACFUTrace *)v17);
    ACFULogging::handleMessage((uint64_t)v15, 4u, "%s::%s: TRACE EVENT ACFUTrace::kACFUTraceEventTransportInit: 0x%08x\n", v18, v19, v20, v21, v22, (char)"ACFUACIPCTransport");
  }
  return v10;
}

void sub_22EF15150(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ACFUACIPCTransport::readRegister(ACFULogging *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v16 = 0;
  CFStringRef v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = -536870198;
  if (a2)
  {
    uint64_t v5 = *((void *)a1 + 19);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3254779904;
    block[2] = ___ZN18ACFUACIPCTransport12readRegisterEPP12IOACIPCClassjPhPj_block_invoke;
    block[3] = &__block_descriptor_68_ea8_32r_e5_v8__0l;
    block[4] = &v16;
    void block[5] = a2;
    int v15 = a3;
    block[6] = a4;
    block[7] = a5;
    dispatch_sync(v5, block);
  }
  else
  {
    LogInstance = ACFULogging::getLogInstance(a1);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: null acipcInterface\n", v9, v10, v11, v12, v13, (char)"ACFUACIPCTransport");
  }
  uint64_t v6 = *((unsigned int *)v17 + 6);
  _Block_object_dispose(&v16, 8);
  return v6;
}

void sub_22EF15250(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN18ACFUACIPCTransport12readRegisterEPP12IOACIPCClassjPhPj_block_invoke(uint64_t a1)
{
  uint64_t result = **(void **)(a1 + 40);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void))(*(void *)result + 112))(result, *(unsigned int *)(a1 + 64), *(void *)(a1 + 48), *(void *)(a1 + 56));
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

uint64_t ACFUACIPCTransport::writeRegister(ACFULogging *a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = -536870198;
  if (a2)
  {
    uint64_t v5 = *((void *)a1 + 19);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3254779904;
    block[2] = ___ZN18ACFUACIPCTransport13writeRegisterEPP12IOACIPCClassjPKhj_block_invoke;
    block[3] = &__block_descriptor_64_ea8_32r_e5_v8__0l;
    block[4] = &v17;
    void block[5] = a2;
    block[6] = a4;
    int v15 = a3;
    int v16 = a5;
    dispatch_sync(v5, block);
  }
  else
  {
    LogInstance = ACFULogging::getLogInstance(a1);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: null acipcInterface\n", v9, v10, v11, v12, v13, (char)"ACFUACIPCTransport");
  }
  uint64_t v6 = *((unsigned int *)v18 + 6);
  _Block_object_dispose(&v17, 8);
  return v6;
}

void sub_22EF153B4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN18ACFUACIPCTransport13writeRegisterEPP12IOACIPCClassjPKhj_block_invoke(uint64_t a1)
{
  uint64_t result = **(void **)(a1 + 40);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void))(*(void *)result + 120))(result, *(unsigned int *)(a1 + 56), *(void *)(a1 + 48), *(unsigned int *)(a1 + 60));
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

uint64_t ACFUACIPCTransport::generateBootNonce(ACFULogging *a1, uint64_t a2)
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = -536870198;
  if (a2)
  {
    uint64_t v2 = *((void *)a1 + 19);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3254779904;
    block[2] = ___ZN18ACFUACIPCTransport17generateBootNonceEPP12IOACIPCClass_block_invoke;
    block[3] = &__block_descriptor_48_ea8_32r_e5_v8__0l;
    block[4] = &v12;
    void block[5] = a2;
    dispatch_sync(v2, block);
  }
  else
  {
    LogInstance = ACFULogging::getLogInstance(a1);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: null acipcInterface\n", v6, v7, v8, v9, v10, (char)"ACFUACIPCTransport");
  }
  uint64_t v3 = *((unsigned int *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v3;
}

void sub_22EF15510(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN18ACFUACIPCTransport17generateBootNonceEPP12IOACIPCClass_block_invoke(uint64_t a1)
{
  uint64_t result = **(void **)(a1 + 40);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 104))(result);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

uint64_t ACFUACIPCTransport::acipcIO(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = -536870198;
  uint64_t v6 = *(NSObject **)(a1 + 152);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3254779904;
  block[2] = ___ZN18ACFUACIPCTransport7acipcIOEPP12IOACIPCClassjPvPj14acipcDirection_block_invoke;
  block[3] = &__block_descriptor_72_ea8_32r_e5_v8__0l;
  block[4] = &v12;
  void block[5] = a2;
  void block[6] = a4;
  void block[7] = a5;
  int v10 = a3;
  int v11 = a6;
  dispatch_sync(v6, block);
  uint64_t v7 = *((unsigned int *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t ___ZN18ACFUACIPCTransport7acipcIOEPP12IOACIPCClassjPvPj14acipcDirection_block_invoke(uint64_t a1)
{
  uint64_t result = **(void **)(a1 + 40);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void, void))(*(void *)result + 72))(result, *(unsigned int *)(a1 + 64), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned int *)(a1 + 68));
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

uint64_t ACFUACIPCTransport::loadImageOnBTIStage(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, id a5)
{
  uint64_t v9 = (ACFUTrace *)a5;
  uint64_t v131 = 0;
  uint64_t v132 = &v131;
  uint64_t v133 = 0x2020000000;
  uint64_t v134 = 0;
  uint64_t v127 = 0;
  uint64_t v128 = &v127;
  uint64_t v129 = 0x2020000000;
  uint64_t v130 = 0;
  v125[0] = 0;
  v125[1] = v125;
  v125[2] = 0x2020000000;
  int v126 = 0;
  uint64_t v121 = 0;
  int v122 = &v121;
  uint64_t v123 = 0x2020000000;
  int v124 = -536870198;
  Trace = ACFUTrace::getTrace(v9);
  if (*((unsigned char *)Trace + 12))
  {
    int v11 = ACFUTrace::getTrace((ACFUTrace *)Trace);
    uint64_t v12 = ACFUTrace::getTrace((ACFUTrace *)v11);
    ACFUTrace::getTrace((ACFUTrace *)v12);
    uint64_t v13 = (ACFULogging *)kdebug_trace();
  }
  else
  {
    uint64_t v13 = (ACFULogging *)ACFUTrace::getTrace((ACFUTrace *)Trace);
    if (*(_DWORD *)v13)
    {
      LogInstance = (ACFUTrace *)ACFULogging::getLogInstance(v13);
      int v15 = ACFUTrace::getTrace(LogInstance);
      int v16 = ACFUTrace::getTrace((ACFUTrace *)v15);
      ACFUTrace::getTrace((ACFUTrace *)v16);
      ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: TRACE EVENT BEGIN ACFUTrace::kACFUTraceEventBTI: 0x%08x\n", v17, v18, v19, v20, v21, (char)"ACFUACIPCTransport");
    }
  }
  if (!a2)
  {
    uint64_t v92 = ACFULogging::getLogInstance(v13);
    uint64_t v98 = "%s::%s: null acipcInterface\n";
    goto LABEL_50;
  }
  if (a4)
  {
    if (v9)
    {
      ACFUTimer::create(v9, a4, &valuePtr);
      uint64_t v23 = (ACFUTimer *)valuePtr;
      if (valuePtr)
      {
        uint64_t v24 = (ACFULogging *)ACFUTimer::start((ACFUTimer *)valuePtr);
        if ((v24 & 1) == 0)
        {
          uint64_t v25 = ACFULogging::getLogInstance(v24);
          ACFULogging::handleMessage((uint64_t)v25, 2u, "%s::%s: failed to start BTI stage timer\n", v26, v27, v28, v29, v30, (char)"ACFUACIPCTransport");
          CFDataRef v32 = 0;
LABEL_44:
          uint64_t v72 = 3000;
          goto LABEL_34;
        }
        goto LABEL_12;
      }
      uint64_t v92 = ACFULogging::getLogInstance(v22);
      uint64_t v98 = "%s::%s: failed to create BTI stage timer\n";
    }
    else
    {
      uint64_t v92 = ACFULogging::getLogInstance(v13);
      uint64_t v98 = "%s::%s: invalid timeout callback parameter\n";
    }
LABEL_50:
    uint64_t v23 = 0;
    ACFULogging::handleMessage((uint64_t)v92, 2u, v98, v93, v94, v95, v96, v97, (char)"ACFUACIPCTransport");
    uint64_t v72 = 3000;
    CFDataRef v32 = 0;
    goto LABEL_34;
  }
  uint64_t v23 = 0;
LABEL_12:
  if (*(void *)(a1 + 48)) {
    v33.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
  }
  else {
    v33.__d_.__rep_ = 0;
  }
  uint64_t v34 = *(std::__shared_weak_count **)(a3 + 8);
  CFIndex v118 = *(ACFUFirmware **)a3;
  uint64_t v119 = v34;
  if (v34) {
    atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v35 = *(void *)(a1 + 80);
  if (!v35) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  CFDataRef v32 = (const __CFData *)(*(uint64_t (**)(uint64_t, ACFUFirmware **))(*(void *)v35 + 48))(v35, &v118);
  uint64_t v36 = (ACFULogging *)v119;
  if (v119) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v119);
  }
  if (v32)
  {
    uint64_t v37 = ACFULogging::getLogInstance(v36);
    ACFULogging::handleMessage((uint64_t)v37, 3u, "%s::%s: using client prepared load image (assuming 4k alignment)\n", v38, v39, v40, v41, v42, (char)"ACFUACIPCTransport");
    BytePtr = CFDataGetBytePtr(v32);
    v132[3] = (uint64_t)BytePtr;
    CFIndex Length = CFDataGetLength(v32);
    long long v45 = v128;
  }
  else
  {
    long long v46 = (ACFULogging *)ACFUFirmware::copyFWContainer(*(ACFUFirmware **)a3);
    CFDataRef v32 = v46;
    if (!v46 || (TypeID = CFDataGetTypeID(), long long v46 = (ACFULogging *)CFGetTypeID(v32), (ACFULogging *)TypeID != v46))
    {
      uint64_t v105 = ACFULogging::getLogInstance(v46);
      ACFULogging::handleMessage((uint64_t)v105, 2u, "%s::%s: firmware to push is missing!\n", v106, v107, v108, v109, v110, (char)"ACFUACIPCTransport");
      uint64_t v72 = 1000;
      goto LABEL_34;
    }
    CFIndex v48 = CFDataGetLength(v32);
    v128[3] = (v48 + 4095) & 0xFFFFFFFFFFFFF000;
    uint64_t v49 = ACFUFirmware::isFWContainerMutable(*(ACFUFirmware **)a3);
    if (!v49)
    {
      uint64_t v86 = ACFULogging::getLogInstance(v49);
      ACFULogging::handleMessage((uint64_t)v86, 2u, "%s::%s: unable to handle unexpected input parameters\n", v87, v88, v89, v90, v91, (char)"ACFUACIPCTransport");
      goto LABEL_44;
    }
    uint64_t v50 = ACFULogging::getLogInstance(v49);
    ACFULogging::handleMessage((uint64_t)v50, 0, "%s::%s: padding of %zu bytes required\n", v51, v52, v53, v54, v55, (char)"ACFUACIPCTransport");
    CFDataIncreaseLength(v32, v128[3] - v48);
    CFIndex v56 = CFDataGetLength(v32);
    v128[3] = v56;
    CFIndex Length = (CFIndex)CFDataGetBytePtr(v32);
    long long v45 = v132;
  }
  v45[3] = Length;
  uint64_t v57 = *(NSObject **)(a1 + 152);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3254779904;
  block[2] = ___ZN18ACFUACIPCTransport19loadImageOnBTIStageEPP12IOACIPCClassNSt3__110shared_ptrI12ACFUFirmwareEEjU13block_pointerFvvE_block_invoke;
  block[3] = &__block_descriptor_72_ea8_32r40r48r56r_e5_v8__0l;
  block[4] = &v121;
  void block[5] = &v131;
  void block[6] = &v127;
  void block[7] = v125;
  void block[8] = a2;
  dispatch_sync(v57, block);
  if (*((_DWORD *)v122 + 6))
  {
    uint64_t v99 = ACFULogging::getLogInstance(hasFired);
    ACFULogging::handleMessage((uint64_t)v99, 2u, "%s::%s: failed with error (ret: 0x%08x) (cookie: 0x%08x)\n", v100, v101, v102, v103, v104, (char)"ACFUACIPCTransport");
    uint64_t v72 = 3001;
  }
  else
  {
    if (*(void *)(a1 + 48))
    {
      std::chrono::duration<long long, std::ratio<1, 1000000>>::rep valuePtr = (std::chrono::system_clock::now().__d_.__rep_ - v33.__d_.__rep_) / 1000;
      CFNumberRef v59 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberLongLongType, &valuePtr);
      if (v59)
      {
        CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 48), @"bti", v59);
        CFRelease(v59);
      }
      else
      {
        char v60 = ACFULogging::getLogInstance(0);
        ACFULogging::handleMessage((uint64_t)v60, 2u, "%s::%s: could not collect bti download time data\n", v61, v62, v63, v64, v65, (char)"ACFUACIPCTransport");
      }
    }
    if (v23 && (ACFUTimer::stop(v23), hasFired = (ACFULogging *)ACFUTimer::hasFired(v23), hasFired))
    {
      std::string::size_type v111 = ACFULogging::getLogInstance(hasFired);
      ACFULogging::handleMessage((uint64_t)v111, 2u, "%s::%s: timeout in BTI stage\n", v112, v113, v114, v115, v116, (char)"ACFUACIPCTransport");
      uint64_t v72 = 3030;
    }
    else
    {
      uint64_t v66 = ACFULogging::getLogInstance(hasFired);
      ACFULogging::handleMessage((uint64_t)v66, 0, "%s::%s: BTI stage completed successfully\n", v67, v68, v69, v70, v71, (char)"ACFUACIPCTransport");
      uint64_t v72 = 0;
    }
  }
LABEL_34:
  uint64_t v73 = ACFUTrace::getTrace(v31);
  if (*((unsigned char *)v73 + 12))
  {
    uint64_t v74 = ACFUTrace::getTrace((ACFUTrace *)v73);
    long long v75 = ACFUTrace::getTrace((ACFUTrace *)v74);
    ACFUTrace::getTrace((ACFUTrace *)v75);
    kdebug_trace();
  }
  else
  {
    uint64_t v76 = ACFUTrace::getTrace((ACFUTrace *)v73);
    if (*(_DWORD *)v76)
    {
      long long v77 = (ACFUTrace *)ACFULogging::getLogInstance((ACFULogging *)v76);
      uint64_t v78 = ACFUTrace::getTrace(v77);
      uint64_t v79 = ACFUTrace::getTrace((ACFUTrace *)v78);
      ACFUTrace::getTrace((ACFUTrace *)v79);
      ACFULogging::handleMessage((uint64_t)v77, 4u, "%s::%s: TRACE EVENT END ACFUTrace::kACFUTraceEventBTI: 0x%08x\n", v80, v81, v82, v83, v84, (char)"ACFUACIPCTransport");
    }
  }
  if (v32) {
    CFRelease(v32);
  }
  if (v23) {
    (*(void (**)(ACFUTimer *))(*(void *)v23 + 8))(v23);
  }
  _Block_object_dispose(&v121, 8);
  _Block_object_dispose(v125, 8);
  _Block_object_dispose(&v127, 8);
  _Block_object_dispose(&v131, 8);

  return v72;
}

void sub_22EF15DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v30 - 144), 8);
  _Block_object_dispose((const void *)(v30 - 112), 8);

  _Unwind_Resume(a1);
}

uint64_t ___ZN18ACFUACIPCTransport19loadImageOnBTIStageEPP12IOACIPCClassNSt3__110shared_ptrI12ACFUFirmwareEEjU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  uint64_t result = **(void **)(a1 + 64);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, void, uint64_t, void))(*(void *)result + 88))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), *(void *)(*(void *)(a1 + 56) + 8) + 24, 0);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

void __copy_helper_block_ea8_32r40r48r56r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 8);
  _Block_object_assign((void *)(a1 + 48), *(const void **)(a2 + 48), 8);
  dispatch_queue_t v4 = *(const void **)(a2 + 56);
  _Block_object_assign((void *)(a1 + 56), v4, 8);
}

void __destroy_helper_block_ea8_32r40r48r56r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 56), 8);
  _Block_object_dispose(*(const void **)(a1 + 48), 8);
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  uint64_t v2 = *(const void **)(a1 + 32);
  _Block_object_dispose(v2, 8);
}

uint64_t ACFUACIPCTransport::processOpenForWriteCommand(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v64 = 0;
  char v63 = 4;
  LODWORD(__p[0]) = *(_DWORD *)(a3 + 4);
  BYTE4(__p[0]) = 0;
  v6.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = v6.__d_.__rep_;
  uint64_t v7 = a1 + 4;
  if (a1[4])
  {
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)v6.__d_.__rep_);
    uint64_t v34 = "%s::%s: there is already a file trasfer in progress\n";
LABEL_31:
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v34, v29, v30, v31, v32, v33, (char)"ACFUACIPCTransport");
    goto LABEL_32;
  }
  uint64_t v8 = ACFULogging::getLogInstance((ACFULogging *)v6.__d_.__rep_);
  ACFULogging::handleMessage((uint64_t)v8, 0, "%s::%s: open (write only): %s\n", v9, v10, v11, v12, v13, (char)"ACFUACIPCTransport");
  int v15 = *(_DWORD *)(a3 + 12);
  int v61 = v15;
  if (!v15)
  {
    uint64_t v35 = ACFULogging::getLogInstance(v14);
    ACFULogging::handleMessage((uint64_t)v35, 2u, "%s::%s: invalid file %s with size 0\n", v36, v37, v38, v39, v40, (char)"ACFUACIPCTransport");
    goto LABEL_32;
  }
  uint64_t v16 = a1[18];
  if (!v16) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(std::string *__return_ptr))(*(void *)v16 + 48))(&v59);
  std::string::size_type size = HIBYTE(v59.__r_.__value_.__r.__words[2]);
  if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v59.__r_.__value_.__l.__size_;
  }
  if (size) {
    uint64_t v18 = &v59;
  }
  else {
    uint64_t v18 = (const std::string *)__p;
  }
  std::string::operator=(&v59, v18);
  uint64_t v19 = (ACFULogging *)a1[1];
  if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v57, v59.__r_.__value_.__l.__data_, v59.__r_.__value_.__l.__size_);
  }
  else {
    std::string v57 = v59;
  }
  ACFUDiagnostics::createFileDataContainer(v19, (uint64_t *)&v57, &v58);
  uint64_t v21 = v58;
  uint64_t v64 = v58;
  uint64_t v58 = 0;
  if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v57.__r_.__value_.__l.__data_);
  }
  if (!v21)
  {
    uint64_t v41 = ACFULogging::getLogInstance(v20);
    ACFULogging::handleMessage((uint64_t)v41, 2u, "%s::%s: failed to obtain file container\n", v42, v43, v44, v45, v46, (char)"ACFUACIPCTransport");
  }
  if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v59.__r_.__value_.__l.__data_);
    if (!v21) {
      goto LABEL_32;
    }
  }
  else if (!v21)
  {
    goto LABEL_32;
  }
  LOWORD(v59.__r_.__value_.__l.__data_) = 3073;
  *(_WORD *)&v59.__r_.__value_.__s.__data_[2] = *(unsigned __int8 *)(a3 + 2);
  HIDWORD(v59.__r_.__value_.__r.__words[0]) = *(_DWORD *)(a3 + 4);
  LODWORD(v59.__r_.__value_.__r.__words[1]) = v15;
  LODWORD(v58) = 12;
  uint64_t v22 = (ACFULogging *)ACFUACIPCTransport::acipcIO((uint64_t)a1, a2, 1, (uint64_t)&v59, (uint64_t)&v58, 1);
  if (!v22)
  {
    char v56 = 1;
    uint64_t v58 = 0;
    std::make_unique[abi:ne180100]<ACFUACIPCTransport::FileTransferSession,ACFUACIPCTransport::FileTransferSession::Mode,decltype(nullptr),std::string &,unsigned int &,std::unique_ptr<ACFUDataContainer>,std::chrono::time_point<std::chrono::system_clock,std::chrono::duration<long long,std::ratio<1l,1000000l>>> &>(&v56, (uint64_t)__p, &v61, &v64, &rep, &v59);
    std::string::size_type v24 = v59.__r_.__value_.__r.__words[0];
    v59.__r_.__value_.__r.__words[0] = 0;
    uint64_t v25 = *v7;
    uint64_t *v7 = v24;
    if (v25)
    {
      std::default_delete<ACFUACIPCTransport::FileTransferSession>::operator()[abi:ne180100]((uint64_t)(a1 + 4), v25);
      uint64_t v26 = v59.__r_.__value_.__r.__words[0];
      v59.__r_.__value_.__r.__words[0] = 0;
      if (v26) {
        std::default_delete<ACFUACIPCTransport::FileTransferSession>::operator()[abi:ne180100]((uint64_t)&v59, v26);
      }
      std::string::size_type v24 = *v7;
    }
    if (v24)
    {
      uint64_t v27 = 1;
      goto LABEL_33;
    }
    LogInstance = ACFULogging::getLogInstance(v23);
    uint64_t v34 = "%s::%s: failed to create file transfer session\n";
    goto LABEL_31;
  }
  int v47 = ACFULogging::getLogInstance(v22);
  ACFULogging::handleMessage((uint64_t)v47, 2u, "%s::%s: failed to send response to device error: 0x%x\n", v48, v49, v50, v51, v52, (char)"ACFUACIPCTransport");
LABEL_32:
  uint64_t v27 = 0;
LABEL_33:
  if (v63 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v53 = v64;
  uint64_t v64 = 0;
  if (v53)
  {
    ACFUDataContainer::~ACFUDataContainer(v53);
    operator delete(v54);
  }
  return v27;
}

void sub_22EF162F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (a34 < 0) {
    operator delete(__p);
  }
  uint64_t v36 = *(ACFUDataContainer **)(v34 - 88);
  *(void *)(v34 - 88) = 0;
  if (v36)
  {
    ACFUDataContainer::~ACFUDataContainer(v36);
    operator delete(v37);
  }
  _Unwind_Resume(exception_object);
}

void std::make_unique[abi:ne180100]<ACFUACIPCTransport::FileTransferSession,ACFUACIPCTransport::FileTransferSession::Mode,decltype(nullptr),std::string &,unsigned int &,std::unique_ptr<ACFUDataContainer>,std::chrono::time_point<std::chrono::system_clock,std::chrono::duration<long long,std::ratio<1l,1000000l>>> &>(char *a1@<X0>, uint64_t a2@<X2>, int *a3@<X3>, ACFUDataContainer **a4@<X4>, uint64_t *a5@<X5>, void *a6@<X8>)
{
  uint64_t v12 = operator new(0x48uLL);
  char v13 = *a1;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v19, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v19 = *(std::string *)a2;
  }
  int v14 = *a3;
  int v15 = *a4;
  *a4 = 0;
  uint64_t v18 = v15;
  ACFUACIPCTransport::FileTransferSession::FileTransferSession((uint64_t)v12, v13, &v20, (long long *)&v19, v14, (uint64_t *)&v18, *a5);
  *a6 = v12;
  uint64_t v16 = v18;
  uint64_t v18 = 0;
  if (v16)
  {
    ACFUDataContainer::~ACFUDataContainer(v16);
    operator delete(v17);
  }
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v19.__r_.__value_.__l.__data_);
  }
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
}

void sub_22EF16450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, ACFUDataContainer *a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, std::__shared_weak_count *a19)
{
  if (a19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a19);
  }
  operator delete(v19);
  _Unwind_Resume(a1);
}

uint64_t ACFUACIPCTransport::processOpenForReadCommand(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v58 = 0;
  char v57 = 4;
  LODWORD(__p[0]) = *(_DWORD *)(a4 + 4);
  BYTE4(__p[0]) = 0;
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = (ACFULogging *)std::chrono::system_clock::now().__d_.__rep_;
  LogInstance = ACFULogging::getLogInstance(rep);
  ACFULogging::handleMessage((uint64_t)LogInstance, 0, "%s::%s: open (read only): %s\n", v9, v10, v11, v12, v13, (char)"ACFUACIPCTransport");
  int v15 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    uint64_t v31 = ACFULogging::getLogInstance(v14);
    uint64_t v37 = "%s::%s: there is already a file trasfer in progress\n";
LABEL_31:
    ACFULogging::handleMessage((uint64_t)v31, 2u, v37, v32, v33, v34, v35, v36, (char)"ACFUACIPCTransport");
    goto LABEL_32;
  }
  uint64_t v16 = (ACFUFirmware *)*a3;
  if (!*a3)
  {
    uint64_t v31 = ACFULogging::getLogInstance(0);
    uint64_t v37 = "%s::%s: invalid firmware object when processing open (read) command\n";
    goto LABEL_31;
  }
  if (v57 < 0)
  {
    if (__p[1] != (void *)4) {
      goto LABEL_9;
    }
    uint64_t v17 = (void **)__p[0];
  }
  else
  {
    if (v57 != 4) {
      goto LABEL_9;
    }
    uint64_t v17 = __p;
  }
  if (*(_DWORD *)v17 == 1295273289)
  {
    Manifest = (ACFUDataContainer *)ACFUFirmware::getManifest(v16);
    ACFUDataContainer::create(Manifest, &v52);
    uint64_t v20 = (const __CFString **)v52;
    uint64_t v58 = v52;
    if (v52) {
      goto LABEL_14;
    }
    uint64_t v44 = ACFULogging::getLogInstance(0);
    uint64_t v50 = "%s::%s: manifest (%s) not available\n";
LABEL_35:
    ACFULogging::handleMessage((uint64_t)v44, 2u, v50, v45, v46, v47, v48, v49, (char)"ACFUACIPCTransport");
    goto LABEL_32;
  }
LABEL_9:
  int Length = (*(uint64_t (**)(ACFUFirmware *, void **))(*(void *)v16 + 40))(v16, __p);
  int v55 = Length;
  if (Length) {
    goto LABEL_15;
  }
  uint64_t v19 = *(void *)(a1 + 112);
  if (!v19) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(ACFULogging **__return_ptr))(*(void *)v19 + 48))(&v52);
  uint64_t v20 = (const __CFString **)v52;
  uint64_t v58 = v52;
  if (!v52)
  {
    uint64_t v44 = ACFULogging::getLogInstance(0);
    uint64_t v50 = "%s::%s: file (%s) not available\n";
    goto LABEL_35;
  }
LABEL_14:
  int Length = ACFUDataContainer::getLength(v20);
  int v55 = Length;
LABEL_15:
  LOWORD(v52) = 3073;
  WORD1(v52) = *(unsigned __int8 *)(a4 + 2);
  HIDWORD(v52) = *(_DWORD *)(a4 + 4);
  int v53 = Length;
  int v51 = 12;
  uint64_t v22 = (ACFULogging *)ACFUACIPCTransport::acipcIO(a1, a2, 1, (uint64_t)&v52, (uint64_t)&v51, 1);
  if (!v22)
  {
    LOBYTE(v51) = 0;
    std::make_unique[abi:ne180100]<ACFUACIPCTransport::FileTransferSession,ACFUACIPCTransport::FileTransferSession::Mode,std::shared_ptr<ACFUFirmware> &,std::string &,unsigned int &,std::unique_ptr<ACFUDataContainer>,std::chrono::time_point<std::chrono::system_clock,std::chrono::duration<long long,std::ratio<1l,1000000l>>> &>((char *)&v51, a3, (uint64_t)__p, &v55, &v58, (uint64_t *)&rep, &v52);
    std::string::size_type v24 = v52;
    uint64_t v52 = 0;
    uint64_t v25 = *v15;
    *int v15 = (uint64_t)v24;
    if (v25)
    {
      std::default_delete<ACFUACIPCTransport::FileTransferSession>::operator()[abi:ne180100](a1 + 32, v25);
      uint64_t v26 = v52;
      uint64_t v52 = 0;
      if (v26) {
        std::default_delete<ACFUACIPCTransport::FileTransferSession>::operator()[abi:ne180100]((uint64_t)&v52, (uint64_t)v26);
      }
      std::string::size_type v24 = (ACFULogging *)*v15;
    }
    if (v24)
    {
      uint64_t v27 = 1;
      goto LABEL_22;
    }
    uint64_t v31 = ACFULogging::getLogInstance(v23);
    uint64_t v37 = "%s::%s: failed to create file transfer session\n";
    goto LABEL_31;
  }
  uint64_t v38 = ACFULogging::getLogInstance(v22);
  ACFULogging::handleMessage((uint64_t)v38, 2u, "%s::%s: failed to send response to device error: 0x%x\n", v39, v40, v41, v42, v43, (char)"ACFUACIPCTransport");
LABEL_32:
  uint64_t v27 = 0;
LABEL_22:
  if (v57 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v28 = v58;
  uint64_t v58 = 0;
  if (v28)
  {
    ACFUDataContainer::~ACFUDataContainer(v28);
    operator delete(v29);
  }
  return v27;
}

void sub_22EF167B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  std::string::size_type v24 = *(ACFUDataContainer **)(v22 - 72);
  *(void *)(v22 - 72) = 0;
  if (v24)
  {
    ACFUDataContainer::~ACFUDataContainer(v24);
    operator delete(v25);
  }
  _Unwind_Resume(exception_object);
}

void std::make_unique[abi:ne180100]<ACFUACIPCTransport::FileTransferSession,ACFUACIPCTransport::FileTransferSession::Mode,std::shared_ptr<ACFUFirmware> &,std::string &,unsigned int &,std::unique_ptr<ACFUDataContainer>,std::chrono::time_point<std::chrono::system_clock,std::chrono::duration<long long,std::ratio<1l,1000000l>>> &>(char *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, int *a4@<X3>, ACFUDataContainer **a5@<X4>, uint64_t *a6@<X5>, void *a7@<X8>)
{
  int v14 = operator new(0x48uLL);
  char v15 = *a1;
  uint64_t v16 = (std::__shared_weak_count *)a2[1];
  uint64_t v23 = *a2;
  std::string::size_type v24 = v16;
  if (v16) {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v22, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string v22 = *(std::string *)a3;
  }
  int v17 = *a4;
  uint64_t v18 = *a5;
  *a5 = 0;
  uint64_t v21 = v18;
  ACFUACIPCTransport::FileTransferSession::FileTransferSession((uint64_t)v14, v15, &v23, (long long *)&v22, v17, (uint64_t *)&v21, *a6);
  *a7 = v14;
  uint64_t v19 = v21;
  uint64_t v21 = 0;
  if (v19)
  {
    ACFUDataContainer::~ACFUDataContainer(v19);
    operator delete(v20);
  }
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
}

void sub_22EF168FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, ACFUDataContainer *a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, std::__shared_weak_count *a19)
{
  if (a19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a19);
  }
  operator delete(v19);
  _Unwind_Resume(a1);
}

uint64_t ACFUACIPCTransport::processCloseCommand(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v64 = 4;
  LODWORD(__p[0]) = *(_DWORD *)(a3 + 4);
  BYTE4(__p[0]) = 0;
  LogInstance = ACFULogging::getLogInstance((ACFULogging *)a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 0, "%s::%s: close: %s\n", v7, v8, v9, v10, v11, (char)"ACFUACIPCTransport");
  uint64_t v13 = a1 + 32;
  uint64_t v14 = *(void *)(a1 + 32);
  if (!v14)
  {
    uint64_t v20 = ACFULogging::getLogInstance(v12);
    uint64_t v26 = "%s::%s: invalid file transfer session\n";
    goto LABEL_52;
  }
  uint64_t v15 = *(unsigned __int8 *)(v14 + 47);
  if ((*(char *)(v14 + 47) & 0x80000000) == 0)
  {
    if (*(unsigned char *)(v14 + 47)) {
      goto LABEL_4;
    }
LABEL_19:
    uint64_t v20 = ACFULogging::getLogInstance(v12);
    uint64_t v26 = "%s::%s: file not open\n";
LABEL_52:
    ACFULogging::handleMessage((uint64_t)v20, 2u, v26, v21, v22, v23, v24, v25, (char)"ACFUACIPCTransport");
    goto LABEL_48;
  }
  if (!*(void *)(v14 + 32)) {
    goto LABEL_19;
  }
LABEL_4:
  if ((v15 & 0x80u) == 0) {
    uint64_t v16 = (void *)*(unsigned __int8 *)(v14 + 47);
  }
  else {
    uint64_t v16 = *(void **)(v14 + 32);
  }
  unint64_t v17 = v64;
  if (v64 < 0) {
    unint64_t v17 = (unint64_t)__p[1];
  }
  if (v16 != (void *)v17) {
    goto LABEL_47;
  }
  uint64_t v18 = (const void **)(v14 + 24);
  if (v64 >= 0) {
    uint64_t v19 = __p;
  }
  else {
    uint64_t v19 = (void **)__p[0];
  }
  if ((v15 & 0x80) != 0)
  {
    uint64_t v12 = (ACFULogging *)memcmp(*v18, v19, *(void *)(v14 + 32));
    if (!v12) {
      goto LABEL_21;
    }
LABEL_47:
    uint64_t v42 = ACFULogging::getLogInstance(v12);
    ACFULogging::handleMessage((uint64_t)v42, 2u, "%s::%s: open file %s, received request for file %s\n", v43, v44, v45, v46, v47, (char)"ACFUACIPCTransport");
LABEL_48:
    uint64_t v29 = 0;
LABEL_42:
    uint64_t v28 = *(void *)v13;
    *(void *)uint64_t v13 = 0;
    if (!v28) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
  if (*(unsigned char *)(v14 + 47))
  {
    while (*(unsigned __int8 *)v18 == *(unsigned __int8 *)v19)
    {
      uint64_t v18 = (const void **)((char *)v18 + 1);
      uint64_t v19 = (void **)((char *)v19 + 1);
      if (!--v15) {
        goto LABEL_21;
      }
    }
    goto LABEL_47;
  }
LABEL_21:
  if (*(unsigned char *)v14 == 1)
  {
    if (*(unsigned char *)(a3 + 3) != 1)
    {
      uint64_t v20 = ACFULogging::getLogInstance(v12);
      uint64_t v26 = "%s::%s: invalid file mode for write\n";
      goto LABEL_52;
    }
    if (*(_DWORD *)(v14 + 52) != *(_DWORD *)(v14 + 48))
    {
      uint64_t v54 = ACFULogging::getLogInstance(v12);
      ACFULogging::handleMessage((uint64_t)v54, 2u, "%s::%s: %s: file incomplete: expected %u bytes, but received %u\n", v55, v56, v57, v58, v59, (char)"ACFUACIPCTransport");
      goto LABEL_48;
    }
  }
  else if (!*(unsigned char *)v14 && *(unsigned char *)(a3 + 3))
  {
    uint64_t v20 = ACFULogging::getLogInstance(v12);
    uint64_t v26 = "%s::%s: invalid file mode for read\n";
    goto LABEL_52;
  }
  LOWORD(valuePtr) = 3077;
  WORD1(valuePtr) = *(unsigned __int8 *)(a3 + 2);
  HIDWORD(valuePtr) = *(_DWORD *)(a3 + 4);
  int v62 = 0;
  int v60 = 12;
  uint64_t v27 = (ACFULogging *)ACFUACIPCTransport::acipcIO(a1, a2, 1, (uint64_t)&valuePtr, (uint64_t)&v60, 1);
  if (v27)
  {
    uint64_t v48 = ACFULogging::getLogInstance(v27);
    ACFULogging::handleMessage((uint64_t)v48, 2u, "%s::%s: failed to send response to device error: 0x%x\n", v49, v50, v51, v52, v53, (char)"ACFUACIPCTransport");
    goto LABEL_48;
  }
  if (!*(void *)(a1 + 48))
  {
LABEL_41:
    uint64_t v29 = 1;
    goto LABEL_42;
  }
  uint64_t v28 = *(void *)v13;
  if (!**(unsigned char **)v13)
  {
    std::chrono::duration<long long, std::ratio<1, 1000000>>::rep valuePtr = (std::chrono::system_clock::now().__d_.__rep_ - *(void *)(*(void *)v13 + 64)) / 1000;
    CFAllocatorRef v30 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (v64 >= 0) {
      uint64_t v31 = __p;
    }
    else {
      uint64_t v31 = (void **)__p[0];
    }
    CFStringRef v32 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], (const char *)v31, 0x8000100u);
    CFNumberRef v33 = CFNumberCreate(v30, kCFNumberLongLongType, &valuePtr);
    CFNumberRef v34 = v33;
    if (v32 && v33)
    {
      CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 48), v32, v33);
    }
    else
    {
      uint64_t v35 = ACFULogging::getLogInstance(v33);
      ACFULogging::handleMessage((uint64_t)v35, 2u, "%s::%s: failed to collect download metrics for %s\n", v36, v37, v38, v39, v40, (char)"ACFUACIPCTransport");
      if (!v32) {
        goto LABEL_39;
      }
    }
    CFRelease(v32);
LABEL_39:
    if (v34) {
      CFRelease(v34);
    }
    goto LABEL_41;
  }
  *(void *)uint64_t v13 = 0;
  uint64_t v29 = 1;
LABEL_43:
  std::default_delete<ACFUACIPCTransport::FileTransferSession>::operator()[abi:ne180100](v13, v28);
LABEL_44:
  if (v64 < 0) {
    operator delete(__p[0]);
  }
  return v29;
}

void sub_22EF16D08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL ACFUACIPCTransport::processReadCommand(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v132 = 4;
  LODWORD(__size_4[0]) = *(_DWORD *)(a3 + 4);
  BYTE4(__size_4[0]) = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3)
  {
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)a1);
    uint64_t v16 = "%s::%s: invalid file transfer session\n";
    goto LABEL_52;
  }
  uint64_t v5 = a1;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 47);
  if ((*(char *)(v3 + 47) & 0x80000000) == 0)
  {
    if (*(unsigned char *)(v3 + 47)) {
      goto LABEL_4;
    }
    goto LABEL_16;
  }
  if (!*(void *)(v3 + 32))
  {
LABEL_16:
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)a1);
    uint64_t v16 = "%s::%s: file not open\n";
LABEL_52:
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v16, v11, v12, v13, v14, v15, (char)"ACFUACIPCTransport");
    return 0;
  }
LABEL_4:
  if (*(unsigned char *)v3)
  {
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)a1);
    uint64_t v16 = "%s::%s: invalid file open mode\n";
    goto LABEL_52;
  }
  if ((v6 & 0x80u) == 0) {
    uint64_t v7 = *(unsigned __int8 *)(v3 + 47);
  }
  else {
    uint64_t v7 = *(void *)(v3 + 32);
  }
  if (v7 != 4) {
    goto LABEL_48;
  }
  uint64_t v8 = (const void **)(v3 + 24);
  if ((v6 & 0x80) != 0)
  {
    a1 = memcmp(*v8, __size_4, *(void *)(v3 + 32));
    if (!a1) {
      goto LABEL_18;
    }
LABEL_48:
    uint64_t v103 = ACFULogging::getLogInstance((ACFULogging *)a1);
    ACFULogging::handleMessage((uint64_t)v103, 2u, "%s::%s: open file %s, received request for file %s\n", v104, v105, v106, v107, v108, (char)"ACFUACIPCTransport");
    if (v132 < 0) {
      operator delete(__size_4[0]);
    }
    return 0;
  }
  if (*(unsigned char *)(v3 + 47))
  {
    uint64_t v9 = __size_4;
    while (*(unsigned __int8 *)v8 == *(unsigned __int8 *)v9)
    {
      uint64_t v8 = (const void **)((char *)v8 + 1);
      uint64_t v9 = (void **)((char *)v9 + 1);
      if (!--v6) {
        goto LABEL_18;
      }
    }
    goto LABEL_48;
  }
LABEL_18:
  int64_t v17 = *(unsigned int *)(a3 + 12);
  if ((v17 + *(_DWORD *)(a3 + 8)) > *(_DWORD *)(v3 + 48))
  {
    uint64_t v109 = ACFULogging::getLogInstance((ACFULogging *)a1);
    ACFULogging::handleMessage((uint64_t)v109, 2u, "%s::%s: %s - trying to read from offset %u length %u, but file size is %u\n", v110, v111, v112, v113, v114, (char)"ACFUACIPCTransport");
    return 0;
  }
  if (*(_DWORD *)(v5 + 44))
  {
    uint64_t v18 = ACFULogging::getLogInstance((ACFULogging *)a1);
    ACFULogging::handleMessage((uint64_t)v18, 4u, "%s::%s: Chunking image using paged loading\n", v19, v20, v21, v22, v23, (char)"ACFUACIPCTransport");
    uint64_t v25 = ACFULogging::getLogInstance(v24);
    ACFULogging::handleMessage((uint64_t)v25, 4u, "%s::%s: length: %u, fReadSegmentSize: %u, remains: %lld, offset: %u\n", v26, v27, v28, v29, v30, (char)"ACFUACIPCTransport");
    int v32 = 0;
    while (v17 >= 1)
    {
      unint64_t v33 = *(unsigned int *)(v5 + 44);
      if (v17 < v33) {
        LODWORD(v33) = v17;
      }
      __std::string::size_type size = v33;
      CFNumberRef v34 = ACFULogging::getLogInstance(v31);
      ACFULogging::handleMessage((uint64_t)v34, 4u, "%s::%s: size: %u, remains: %lld\n", v35, v36, v37, v38, v39, (char)"ACFUACIPCTransport");
      uint64_t v40 = *(void *)(v5 + 32);
      uint64_t v41 = *(ACFUDataContainer **)(v40 + 56);
      if (v41) {
        ACFUDataContainer::copyDirectData(v41, __size, *(_DWORD *)(a3 + 8) + v32, &v128);
      }
      else {
        ACFUFirmware::copyFWDataRefByFileName(*(void *)(v40 + 8), &v128);
      }
      uint64_t v42 = v128;
      uint64_t DataPtr = ACFUDataContainer::DirectDataRef::getDataPtr(v128);
      uint64_t v44 = (ACFULogging *)ACFUACIPCTransport::acipcIO(v5, a2, 2, DataPtr, (uint64_t)&__size, 1);
      int v45 = (int)v44;
      if (v44)
      {
        int v61 = ACFULogging::getLogInstance(v44);
        ACFULogging::handleMessage((uint64_t)v61, 2u, "%s::%s: failed to send data to device error: 0x%x\n", v62, v63, v64, v65, v66, (char)"ACFUACIPCTransport");
      }
      else
      {
        uint64_t v46 = __size;
        *(_DWORD *)(*(void *)(v5 + 32) + 52) += __size;
        uint64_t v47 = ACFULogging::getLogInstance(v44);
        ACFULogging::handleMessage((uint64_t)v47, 4u, "%s::%s: sent %u bytes data to device, fFileTransferSession->fileSize: %u\n", v48, v49, v50, v51, v52, (char)"ACFUACIPCTransport");
        uint64_t v54 = ACFULogging::getLogInstance(v53);
        ACFULogging::handleMessage((uint64_t)v54, 0, "%s::%s: sent %u bytes (total: %u)\n", v55, v56, v57, v58, v59, (char)"ACFUACIPCTransport");
        v32 += v46;
        v17 -= v46;
      }
      if (v42)
      {
        ACFUDataContainer::DirectDataRef::~DirectDataRef(v42);
        operator delete(v60);
      }
      if (v45) {
        return 0;
      }
    }
    if (v17)
    {
      long long v75 = ACFULogging::getLogInstance(v31);
      ACFULogging::handleMessage((uint64_t)v75, 2u, "%s::%s: unexpected (too many) amount of bytes were sent to device, bailing\n", v76, v77, v78, v79, v80, (char)"ACFUACIPCTransport");
      return 0;
    }
  }
  else
  {
    __std::string::size_type size = *(_DWORD *)(a3 + 12);
    uint64_t v67 = ACFULogging::getLogInstance((ACFULogging *)a1);
    ACFULogging::handleMessage((uint64_t)v67, 4u, "%s::%s: Paged loading is disabled; sending all bytes of requested data in one segment\n",
      v68,
      v69,
      v70,
      v71,
      v72,
      (char)"ACFUACIPCTransport");
    uint64_t v73 = *(void *)(v5 + 32);
    uint64_t v74 = *(ACFUDataContainer **)(v73 + 56);
    if (v74) {
      ACFUDataContainer::copyDirectData(v74, v17, *(_DWORD *)(a3 + 8), &v128);
    }
    else {
      ACFUFirmware::copyFWDataRefByFileName(*(void *)(v73 + 8), &v128);
    }
    uint64_t v81 = v128;
    uint64_t v82 = ACFUDataContainer::DirectDataRef::getDataPtr(v128);
    uint64_t v83 = (ACFULogging *)ACFUACIPCTransport::acipcIO(v5, a2, 2, v82, (uint64_t)&__size, 1);
    int v84 = (int)v83;
    if (v83)
    {
      uint64_t v121 = ACFULogging::getLogInstance(v83);
      ACFULogging::handleMessage((uint64_t)v121, 2u, "%s::%s: failed to send data to device error: 0x%x\n", v122, v123, v124, v125, v126, (char)"ACFUACIPCTransport");
    }
    else
    {
      *(_DWORD *)(*(void *)(v5 + 32) + 52) += __size;
      uint64_t v85 = ACFULogging::getLogInstance(v83);
      ACFULogging::handleMessage((uint64_t)v85, 4u, "%s::%s: sent %u bytes data to device, fFileTransferSession->fileSize: %u\n", v86, v87, v88, v89, v90, (char)"ACFUACIPCTransport");
      uint64_t v92 = ACFULogging::getLogInstance(v91);
      ACFULogging::handleMessage((uint64_t)v92, 0, "%s::%s: sent %u bytes (total: %u)\n", v93, v94, v95, v96, v97, (char)"ACFUACIPCTransport");
    }
    if (v81)
    {
      ACFUDataContainer::DirectDataRef::~DirectDataRef(v81);
      operator delete(v98);
    }
    if (v84) {
      return 0;
    }
  }
  LOWORD(v128) = 3075;
  WORD1(v128) = *(unsigned __int8 *)(a3 + 2);
  int v100 = *(_DWORD *)(a3 + 12);
  HIDWORD(v128) = *(_DWORD *)(a3 + 4);
  int v129 = v100;
  __std::string::size_type size = 12;
  uint64_t v101 = (ACFULogging *)ACFUACIPCTransport::acipcIO(v5, a2, 1, (uint64_t)&v128, (uint64_t)&__size, 1);
  BOOL v99 = v101 == 0;
  if (v101)
  {
    uint64_t v115 = ACFULogging::getLogInstance(v101);
    ACFULogging::handleMessage((uint64_t)v115, 2u, "%s::%s: failed to send response to device error: 0x%x\n", v116, v117, v118, v119, v120, (char)"ACFUACIPCTransport");
  }
  return v99;
}

void sub_22EF172BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL ACFUACIPCTransport::processWriteCommand(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v94 = 4;
  LODWORD(__s2[0]) = *(_DWORD *)(a3 + 4);
  BYTE4(__s2[0]) = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3)
  {
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)a1);
    int64_t v17 = "%s::%s: invalid file transfer session\n";
    goto LABEL_39;
  }
  if (*(unsigned char *)v3 != 1)
  {
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)a1);
    int64_t v17 = "%s::%s: invalid file open mode\n";
    goto LABEL_39;
  }
  uint64_t v6 = a1;
  uint64_t v7 = *(unsigned __int8 *)(v3 + 47);
  if (*(char *)(v3 + 47) < 0)
  {
    if (*(void *)(v3 + 32)) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
  if (!*(unsigned char *)(v3 + 47))
  {
LABEL_16:
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)a1);
    int64_t v17 = "%s::%s: file not open\n";
LABEL_39:
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v17, v12, v13, v14, v15, v16, (char)"ACFUACIPCTransport");
    return 0;
  }
LABEL_5:
  if ((v7 & 0x80u) == 0) {
    uint64_t v8 = *(unsigned __int8 *)(v3 + 47);
  }
  else {
    uint64_t v8 = *(void *)(v3 + 32);
  }
  if (v8 != 4) {
    goto LABEL_35;
  }
  uint64_t v9 = (const void **)(v3 + 24);
  if ((v7 & 0x80) != 0)
  {
    a1 = memcmp(*v9, __s2, *(void *)(v3 + 32));
    if (a1) {
      goto LABEL_35;
    }
  }
  else if (*(unsigned char *)(v3 + 47))
  {
    uint64_t v10 = __s2;
    while (*(unsigned __int8 *)v9 == *(unsigned __int8 *)v10)
    {
      uint64_t v9 = (const void **)((char *)v9 + 1);
      uint64_t v10 = (void **)((char *)v10 + 1);
      if (!--v7) {
        goto LABEL_18;
      }
    }
LABEL_35:
    int v61 = ACFULogging::getLogInstance((ACFULogging *)a1);
    ACFULogging::handleMessage((uint64_t)v61, 2u, "%s::%s: open file %s, received request for file %s\n", v62, v63, v64, v65, v66, (char)"ACFUACIPCTransport");
    if (v94 < 0) {
      operator delete(__s2[0]);
    }
    return 0;
  }
LABEL_18:
  unsigned int v19 = *(_DWORD *)(a3 + 8);
  uint64_t v18 = *(unsigned int *)(a3 + 12);
  unsigned int v20 = *(_DWORD *)(v3 + 48);
  if (v18 + v19 > v20)
  {
    uint64_t v67 = ACFULogging::getLogInstance((ACFULogging *)a1);
    ACFULogging::handleMessage((uint64_t)v67, 2u, "%s::%s: %s - trying to write to offset %u length %u, but file size is %u\n", v68, v69, v70, v71, v72, (char)"ACFUACIPCTransport");
    return 0;
  }
  if (*(_DWORD *)(v3 + 52) + (int)v18 > v20)
  {
    uint64_t v73 = ACFULogging::getLogInstance((ACFULogging *)a1);
    ACFULogging::handleMessage((uint64_t)v73, 2u, "%s::%s: %s - attempting to write more bytes (%u) than initially indicated (%u), bailing\n", v74, v75, v76, v77, v78, (char)"ACFUACIPCTransport");
    return 0;
  }
  if (!v18)
  {
LABEL_28:
    int v91 = 12;
    LOWORD(v92[0]) = 3081;
    HIWORD(v92[0]) = *(unsigned __int8 *)(a3 + 2);
    int v45 = *(_DWORD *)(a3 + 12);
    v92[1] = *(_DWORD *)(a3 + 4);
    v92[2] = v45;
    uint64_t v46 = (ACFULogging *)ACFUACIPCTransport::acipcIO(v6, a2, 1, (uint64_t)v92, (uint64_t)&v91, 1);
    BOOL v47 = v46 == 0;
    if (v46)
    {
      uint64_t v85 = ACFULogging::getLogInstance(v46);
      ACFULogging::handleMessage((uint64_t)v85, 2u, "%s::%s: failed to send response to device error: 0x%x\n", v86, v87, v88, v89, v90, (char)"ACFUACIPCTransport");
    }
    return v47;
  }
  do
  {
    if (v18 >= (unint64_t)*(unsigned int *)(v6 + 40)) {
      size_t v21 = *(unsigned int *)(v6 + 40);
    }
    else {
      size_t v21 = v18;
    }
    v92[0] = v21;
    uint64_t v22 = (ACFULogging *)operator new[](v21);
    uint64_t v23 = ACFULogging::getLogInstance(v22);
    ACFULogging::handleMessage((uint64_t)v23, 4u, "%s::%s: size: %u, fWriteSegmentSize: %u, remains: %lld, offset: %u\n", v24, v25, v26, v27, v28, (char)"ACFUACIPCTransport");
    uint64_t v29 = (ACFULogging *)ACFUACIPCTransport::acipcIO(v6, a2, 3, (uint64_t)v22, (uint64_t)v92, 2);
    if (v29)
    {
      uint64_t v49 = ACFULogging::getLogInstance(v29);
      ACFULogging::handleMessage((uint64_t)v49, 2u, "%s::%s: failed to receive data from device, error: 0x%x\n", v50, v51, v52, v53, v54, (char)"ACFUACIPCTransport");
LABEL_33:
      operator delete[](v22);
      return 0;
    }
    *(_DWORD *)(*(void *)(v6 + 32) + 52) += v92[0];
    uint64_t v30 = ACFULogging::getLogInstance(v29);
    ACFULogging::handleMessage((uint64_t)v30, 4u, "%s::%s: received %u bytes data from device, fFileTransferSession->fileSize: %u\n", v31, v32, v33, v34, v35, (char)"ACFUACIPCTransport");
    uint64_t v37 = ACFULogging::getLogInstance(v36);
    ACFULogging::handleMessage((uint64_t)v37, 0, "%s::%s: received %u bytes (total: %u)\n", v38, v39, v40, v41, v42, (char)"ACFUACIPCTransport");
    uint64_t v43 = ACFUDataContainer::writeData(*(ACFUDataContainer **)(*(void *)(v6 + 32) + 56), (const unsigned __int8 *)v22, v19, v92[0]);
    if ((v43 & 1) == 0)
    {
      uint64_t v55 = ACFULogging::getLogInstance((ACFULogging *)v43);
      ACFULogging::handleMessage((uint64_t)v55, 2u, "%s::%s: failed to write to file\n", v56, v57, v58, v59, v60, (char)"ACFUACIPCTransport");
      goto LABEL_33;
    }
    v18 -= v92[0];
    v19 += v92[0];
    operator delete[](v22);
  }
  while (v18 > 0);
  if (!v18) {
    goto LABEL_28;
  }
  uint64_t v79 = ACFULogging::getLogInstance(v44);
  ACFULogging::handleMessage((uint64_t)v79, 2u, "%s::%s: unexpected (too many) amount of bytes were received from device, bailing\n", v80, v81, v82, v83, v84, (char)"ACFUACIPCTransport");
  return 0;
}

void sub_22EF1778C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL ACFUACIPCTransport::processDoneCommand(ACFULogging *a1, uint64_t a2, uint64_t a3)
{
  if (*((void *)a1 + 4))
  {
    LogInstance = ACFULogging::getLogInstance(a1);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: file transfer session still not closed\n", v7, v8, v9, v10, v11, (char)"ACFUACIPCTransport");
    return 0;
  }
  else
  {
    __int16 v19 = 3079;
    char v20 = *(unsigned char *)(a3 + 2);
    uint64_t v21 = 0;
    char v22 = 0;
    int v18 = 12;
    uint64_t v3 = (ACFULogging *)ACFUACIPCTransport::acipcIO((uint64_t)a1, a2, 1, (uint64_t)&v19, (uint64_t)&v18, 1);
    BOOL v4 = v3 == 0;
    if (v3)
    {
      uint64_t v12 = ACFULogging::getLogInstance(v3);
      ACFULogging::handleMessage((uint64_t)v12, 2u, "%s::%s: failed to send response to device error: 0x%x\n\n", v13, v14, v15, v16, v17, (char)"ACFUACIPCTransport");
    }
  }
  return v4;
}

uint64_t ACFUACIPCTransport::processCommandFromDevice(ACFULogging *a1, uint64_t a2, uint64_t *a3, unsigned char *a4)
{
  v88[0] = 0;
  v88[1] = 0;
  if (!a2)
  {
    LogInstance = ACFULogging::getLogInstance(a1);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: invalid parameter (acipcInterface)\n", v68, v69, v70, v71, v72, (char)"ACFUACIPCTransport");
    return 3012;
  }
  if (!a4 || *a4)
  {
    int v61 = ACFULogging::getLogInstance(a1);
    ACFULogging::handleMessage((uint64_t)v61, 2u, "%s::%s: invalid parameter (done)\n", v62, v63, v64, v65, v66, (char)"ACFUACIPCTransport");
    return 3012;
  }
  int v87 = 16;
  uint64_t v8 = (ACFULogging *)ACFUACIPCTransport::acipcIO((uint64_t)a1, a2, 0, (uint64_t)v88, (uint64_t)&v87, 2);
  if (v8)
  {
    uint64_t v73 = ACFULogging::getLogInstance(v8);
    ACFULogging::handleMessage((uint64_t)v73, 2u, "%s::%s: failed to receive command from device, error: 0x%x\n", v74, v75, v76, v77, v78, (char)"ACFUACIPCTransport");
    return 3025;
  }
  uint64_t v9 = ACFULogging::getLogInstance(v8);
  ACFULogging::handleMessage((uint64_t)v9, 4u, "%s::%s: command : type %d size %d seqnum %d option %d tag 0x%x offset %d length %d\n", v10, v11, v12, v13, v14, (char)"ACFUACIPCTransport");
  switch(LOBYTE(v88[0]))
  {
    case 0:
      if (BYTE3(v88[0]) == 1)
      {
        uint64_t v54 = ACFUACIPCTransport::processOpenForWriteCommand(a1, a2, (uint64_t)v88);
        if ((v54 & 1) == 0)
        {
          uint64_t v79 = ACFULogging::getLogInstance((ACFULogging *)v54);
          ACFULogging::handleMessage((uint64_t)v79, 2u, "%s::%s: failed to process open command for write\n", v80, v81, v82, v83, v84, (char)"ACFUACIPCTransport");
          return 3021;
        }
        return 0;
      }
      if (BYTE3(v88[0]))
      {
        uint64_t v55 = ACFULogging::getLogInstance(v15);
        ACFULogging::handleMessage((uint64_t)v55, 2u, "%s::%s: unknown command option %d\n", v56, v57, v58, v59, v60, (char)"ACFUACIPCTransport");
        return 3025;
      }
      uint64_t v16 = (std::__shared_weak_count *)a3[1];
      uint64_t v85 = *a3;
      uint64_t v86 = v16;
      if (v16) {
        atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      char v17 = ACFUACIPCTransport::processOpenForReadCommand((uint64_t)a1, a2, &v85, (uint64_t)v88);
      int v18 = (ACFULogging *)v86;
      if (v86) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v86);
      }
      if (v17) {
        return 0;
      }
      __int16 v19 = ACFULogging::getLogInstance(v18);
      ACFULogging::handleMessage((uint64_t)v19, 2u, "%s::%s: failed to process open command for read\n", v20, v21, v22, v23, v24, (char)"ACFUACIPCTransport");
      return 3021;
    case 2:
      BOOL Command = ACFUACIPCTransport::processReadCommand((uint64_t)a1, a2, (uint64_t)v88);
      if (!Command) {
        goto LABEL_22;
      }
      return 0;
    case 4:
      uint64_t v31 = ACFUACIPCTransport::processCloseCommand((uint64_t)a1, a2, (uint64_t)v88);
      if (v31) {
        return 0;
      }
      uint64_t v32 = ACFULogging::getLogInstance((ACFULogging *)v31);
      ACFULogging::handleMessage((uint64_t)v32, 2u, "%s::%s: failed to process close command\n", v33, v34, v35, v36, v37, (char)"ACFUACIPCTransport");
      return 3023;
    case 6:
      BOOL done = ACFUACIPCTransport::processDoneCommand(a1, a2, (uint64_t)v88);
      BOOL v41 = done;
      uint64_t v42 = ACFULogging::getLogInstance((ACFULogging *)done);
      if (v41)
      {
        ACFULogging::handleMessage((uint64_t)v42, 0, "%s::%s: firmware downloading finished successfully\n", v43, v44, v45, v46, v47, (char)"ACFUACIPCTransport");
        uint64_t result = 0;
        *a4 = 1;
      }
      else
      {
        ACFULogging::handleMessage((uint64_t)v42, 2u, "%s::%s: failed to process done command\n", v43, v44, v45, v46, v47, (char)"ACFUACIPCTransport");
        return 3024;
      }
      return result;
    case 8:
      BOOL Command = ACFUACIPCTransport::processWriteCommand((uint64_t)a1, a2, (uint64_t)v88);
      if (Command) {
        return 0;
      }
LABEL_22:
      uint64_t v48 = ACFULogging::getLogInstance((ACFULogging *)Command);
      ACFULogging::handleMessage((uint64_t)v48, 2u, "%s::%s: failed to process read command\n", v49, v50, v51, v52, v53, (char)"ACFUACIPCTransport");
      return 3022;
    default:
      uint64_t v25 = ACFULogging::getLogInstance(v15);
      ACFULogging::handleMessage((uint64_t)v25, 2u, "%s::%s: unknown command type %d\n", v26, v27, v28, v29, v30, (char)"ACFUACIPCTransport");
      return 3025;
  }
}

void sub_22EF17BD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, std::__shared_weak_count *a19)
{
  if (a19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a19);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ACFUACIPCTransport::processRTIStage(void *a1, uint64_t a2, uint64_t *a3, unsigned int a4, id a5)
{
  uint64_t v9 = (ACFUTrace *)a5;
  char v76 = 0;
  Trace = ACFUTrace::getTrace(v9);
  if (*((unsigned char *)Trace + 12))
  {
    uint64_t v11 = ACFUTrace::getTrace((ACFUTrace *)Trace);
    uint64_t v12 = ACFUTrace::getTrace((ACFUTrace *)v11);
    ACFUTrace::getTrace((ACFUTrace *)v12);
    uint64_t hasFired = kdebug_trace();
  }
  else
  {
    uint64_t hasFired = (uint64_t)ACFUTrace::getTrace((ACFUTrace *)Trace);
    if (*(_DWORD *)hasFired)
    {
      LogInstance = (ACFUTrace *)ACFULogging::getLogInstance((ACFULogging *)hasFired);
      uint64_t v15 = ACFUTrace::getTrace(LogInstance);
      uint64_t v16 = ACFUTrace::getTrace((ACFUTrace *)v15);
      ACFUTrace::getTrace((ACFUTrace *)v16);
      ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: TRACE EVENT BEGIN ACFUTrace::kACFUTraceEventRTI: 0x%08x\n", v17, v18, v19, v20, v21, (char)"ACFUACIPCTransport");
    }
  }
  if (a2)
  {
    if (!a4)
    {
      uint64_t v23 = 0;
LABEL_12:
      while (!v76)
      {
        uint64_t v31 = (std::__shared_weak_count *)a3[1];
        v74[0] = *a3;
        v74[1] = (uint64_t)v31;
        if (v31) {
          atomic_fetch_add_explicit(&v31->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t hasFired = ACFUACIPCTransport::processCommandFromDevice((ACFULogging *)a1, a2, v74, &v76);
        uint64_t v32 = hasFired;
        if (v31) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v31);
        }
        if (v23)
        {
          uint64_t hasFired = ACFUTimer::hasFired(v23);
          if (hasFired) {
            goto LABEL_22;
          }
        }
        if (v32)
        {
          uint64_t v33 = ACFULogging::getLogInstance((ACFULogging *)hasFired);
          ACFULogging::handleMessage((uint64_t)v33, 2u, "%s::%s: failed to process command from device\n", v34, v35, v36, v37, v38, (char)"ACFUACIPCTransport");
          goto LABEL_24;
        }
      }
      if (v23)
      {
LABEL_22:
        ACFUTimer::stop(v23);
        uint64_t hasFired = ACFUTimer::hasFired(v23);
        if (hasFired)
        {
          uint64_t v68 = ACFULogging::getLogInstance((ACFULogging *)hasFired);
          ACFULogging::handleMessage((uint64_t)v68, 2u, "%s::%s: timeout in RTI stage\n", v69, v70, v71, v72, v73, (char)"ACFUACIPCTransport");
          uint64_t v32 = 3030;
          goto LABEL_24;
        }
      }
      uint64_t v39 = ACFULogging::getLogInstance((ACFULogging *)hasFired);
      ACFULogging::handleMessage((uint64_t)v39, 0, "%s::%s: RTI stage completed successfully\n", v40, v41, v42, v43, v44, (char)"ACFUACIPCTransport");
      uint64_t v32 = 0;
      goto LABEL_24;
    }
    if (v9)
    {
      ACFUTimer::create(v9, a4, &v75);
      uint64_t v23 = v75;
      if (v75)
      {
        uint64_t hasFired = ACFUTimer::start(v75);
        if (hasFired) {
          goto LABEL_12;
        }
        uint64_t v24 = ACFULogging::getLogInstance((ACFULogging *)hasFired);
        ACFULogging::handleMessage((uint64_t)v24, 2u, "%s::%s: failed to start RTI stage timer\n", v25, v26, v27, v28, v29, (char)"ACFUACIPCTransport");
        goto LABEL_38;
      }
      int v61 = ACFULogging::getLogInstance(v22);
      uint64_t v67 = "%s::%s: failed to create RTI stage timer\n";
    }
    else
    {
      int v61 = ACFULogging::getLogInstance((ACFULogging *)hasFired);
      uint64_t v67 = "%s::%s: invalid timeout callback parameter\n";
    }
  }
  else
  {
    int v61 = ACFULogging::getLogInstance((ACFULogging *)hasFired);
    uint64_t v67 = "%s::%s: processRTIStage - null acipcInterface\n";
  }
  uint64_t v23 = 0;
  ACFULogging::handleMessage((uint64_t)v61, 2u, v67, v62, v63, v64, v65, v66, (char)"ACFUACIPCTransport");
LABEL_38:
  uint64_t v32 = 3000;
LABEL_24:
  uint64_t v47 = a1[4];
  uint64_t v46 = a1 + 4;
  uint64_t v45 = v47;
  *uint64_t v46 = 0;
  if (v47) {
    std::default_delete<ACFUACIPCTransport::FileTransferSession>::operator()[abi:ne180100]((uint64_t)v46, v45);
  }
  uint64_t v48 = ACFUTrace::getTrace(v30);
  if (*((unsigned char *)v48 + 12))
  {
    uint64_t v49 = ACFUTrace::getTrace((ACFUTrace *)v48);
    uint64_t v50 = ACFUTrace::getTrace((ACFUTrace *)v49);
    ACFUTrace::getTrace((ACFUTrace *)v50);
    kdebug_trace();
  }
  else
  {
    uint64_t v51 = ACFUTrace::getTrace((ACFUTrace *)v48);
    if (*(_DWORD *)v51)
    {
      uint64_t v52 = (ACFUTrace *)ACFULogging::getLogInstance((ACFULogging *)v51);
      uint64_t v53 = ACFUTrace::getTrace(v52);
      uint64_t v54 = ACFUTrace::getTrace((ACFUTrace *)v53);
      ACFUTrace::getTrace((ACFUTrace *)v54);
      ACFULogging::handleMessage((uint64_t)v52, 4u, "%s::%s: TRACE EVENT END ACFUTrace::kACFUTraceEventRTI: 0x%08x\n", v55, v56, v57, v58, v59, (char)"ACFUACIPCTransport");
    }
  }
  if (v23) {
    (*(void (**)(ACFUTimer *))(*(void *)v23 + 8))(v23);
  }

  return v32;
}

void sub_22EF18034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ACFUACIPCTransport::loadImageOnRTIStage(void *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = (std::__shared_weak_count *)a3[1];
  v6[0] = *a3;
  v6[1] = (uint64_t)v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = ACFUACIPCTransport::processRTIStage(a1, a2, v6, 0, 0);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  return v4;
}

void sub_22EF180F8(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

void ACFUACIPCTransport::cancelTimer(dispatch_source_t *this)
{
  if (this[3])
  {
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)this);
    ACFULogging::handleMessage((uint64_t)LogInstance, 0, "%s::%s: cancelTimer - canceling timer\n", v3, v4, v5, v6, v7, (char)"ACFUACIPCTransport");
    dispatch_source_cancel(this[3]);
    dispatch_source_t v8 = this[3];
    this[3] = 0;
  }
}

uint64_t ACFUACIPCTransport::startTimer(dispatch_source_t *a1, id a2, unsigned int a3)
{
  id v5 = a2;
  ACFUACIPCTransport::cancelTimer(a1);
  if (!v5)
  {
    LogInstance = ACFULogging::getLogInstance(v6);
    uint64_t v28 = "%s::%s: startTimer - null timeoutCB.\n";
LABEL_7:
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v28, v23, v24, v25, v26, v27, (char)"ACFUACIPCTransport");
    uint64_t v20 = 0;
    goto LABEL_4;
  }
  dispatch_source_t v7 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, a1[19]);
  dispatch_source_t v8 = a1[3];
  a1[3] = v7;

  uint64_t v10 = a1[3];
  if (!v10)
  {
    LogInstance = ACFULogging::getLogInstance(v9);
    uint64_t v28 = "%s::%s: startTimer - failed to create timer.\n";
    goto LABEL_7;
  }
  dispatch_time_t v11 = dispatch_time(0, 1000000000 * a3);
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x1312D00uLL);
  uint64_t v12 = a1[3];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3254779904;
  handler[2] = ___ZN18ACFUACIPCTransport10startTimerEU13block_pointerFvvEj_block_invoke;
  handler[3] = &__block_descriptor_48_ea8_32bs_e5_v8__0l;
  uint64_t v31 = a1;
  id v30 = v5;
  dispatch_source_set_event_handler(v12, handler);
  uint64_t v14 = ACFULogging::getLogInstance(v13);
  ACFULogging::handleMessage((uint64_t)v14, 0, "%s::%s: startTimer - starting timer.\n", v15, v16, v17, v18, v19, (char)"ACFUACIPCTransport");
  dispatch_resume(a1[3]);

  uint64_t v20 = 1;
LABEL_4:

  return v20;
}

void sub_22EF1832C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id a15)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN18ACFUACIPCTransport10startTimerEU13block_pointerFvvEj_block_invoke(uint64_t a1)
{
  ACFUACIPCTransport::cancelTimer(*(dispatch_source_t **)(a1 + 40));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

uint64_t ACFUACIPCTransport::getFirmwareDownloadMetrics(ACFUACIPCTransport *this)
{
  return *((void *)this + 6);
}

void ACFUACIPCTransport::~ACFUACIPCTransport(id *this)
{
  *this = &unk_26E27FF98;

  std::__function::__value_func<std::string ()(std::string const&)>::~__value_func[abi:ne180100](this + 15);
  std::__function::__value_func<std::unique_ptr<ACFUDataContainer> ()(std::string const&)>::~__value_func[abi:ne180100](this + 11);
  std::__function::__value_func<__CFData const* ()(std::shared_ptr<ACFUFirmware>)>::~__value_func[abi:ne180100](this + 7);
  uint64_t v2 = (uint64_t)this[4];
  this[4] = 0;
  if (v2) {
    std::default_delete<ACFUACIPCTransport::FileTransferSession>::operator()[abi:ne180100]((uint64_t)(this + 4), v2);
  }

  ACFUTransport::~ACFUTransport((ACFUTransport *)this);
}

void *_ZNKSt3__110__function6__funcIN18ACFUACIPCTransport20ACIPCClientCallbacks16copyBTILoadImageMUlNS_10shared_ptrI12ACFUFirmwareEEE_ENS_9allocatorIS7_EEFPK8__CFDataS6_EE7__cloneEv()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_26E2800D0;
  return result;
}

void _ZNKSt3__110__function6__funcIN18ACFUACIPCTransport20ACIPCClientCallbacks16copyBTILoadImageMUlNS_10shared_ptrI12ACFUFirmwareEEE_ENS_9allocatorIS7_EEFPK8__CFDataS6_EE7__cloneEPNS0_6__baseISD_EE(uint64_t a1, void *a2)
{
  *a2 = &unk_26E2800D0;
}

uint64_t _ZNSt3__110__function6__funcIN18ACFUACIPCTransport20ACIPCClientCallbacks16copyBTILoadImageMUlNS_10shared_ptrI12ACFUFirmwareEEE_ENS_9allocatorIS7_EEFPK8__CFDataS6_EEclEOS6_(uint64_t a1, void *a2)
{
  uint64_t v2 = (std::__shared_weak_count *)a2[1];
  *a2 = 0;
  a2[1] = 0;
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return 0;
}

uint64_t _ZNKSt3__110__function6__funcIN18ACFUACIPCTransport20ACIPCClientCallbacks16copyBTILoadImageMUlNS_10shared_ptrI12ACFUFirmwareEEE_ENS_9allocatorIS7_EEFPK8__CFDataS6_EE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIN18ACFUACIPCTransport20ACIPCClientCallbacks16copyBTILoadImageMUlNSt3__110shared_ptrI12ACFUFirmwareEEE_E))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIN18ACFUACIPCTransport20ACIPCClientCallbacks16copyBTILoadImageMUlNS_10shared_ptrI12ACFUFirmwareEEE_ENS_9allocatorIS7_EEFPK8__CFDataS6_EE11target_typeEv()
{
  return &_ZTIN18ACFUACIPCTransport20ACIPCClientCallbacks16copyBTILoadImageMUlNSt3__110shared_ptrI12ACFUFirmwareEEE_E;
}

void *_ZNKSt3__110__function6__funcIN18ACFUACIPCTransport20ACIPCClientCallbacks18copyRTIClientImageMUlRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE_ENS7_ISC_EEFNS_10unique_ptrI17ACFUDataContainerNS_14default_deleteISF_EEEESB_EE7__cloneEv()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_26E280160;
  return result;
}

void _ZNKSt3__110__function6__funcIN18ACFUACIPCTransport20ACIPCClientCallbacks18copyRTIClientImageMUlRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE_ENS7_ISC_EEFNS_10unique_ptrI17ACFUDataContainerNS_14default_deleteISF_EEEESB_EE7__cloneEPNS0_6__baseISJ_EE(uint64_t a1, void *a2)
{
  *a2 = &unk_26E280160;
}

void _ZNSt3__110__function6__funcIN18ACFUACIPCTransport20ACIPCClientCallbacks18copyRTIClientImageMUlRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE_ENS7_ISC_EEFNS_10unique_ptrI17ACFUDataContainerNS_14default_deleteISF_EEEESB_EEclESB_(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t _ZNKSt3__110__function6__funcIN18ACFUACIPCTransport20ACIPCClientCallbacks18copyRTIClientImageMUlRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE_ENS7_ISC_EEFNS_10unique_ptrI17ACFUDataContainerNS_14default_deleteISF_EEEESB_EE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIN18ACFUACIPCTransport20ACIPCClientCallbacks18copyRTIClientImageMUlRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEE_E))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIN18ACFUACIPCTransport20ACIPCClientCallbacks18copyRTIClientImageMUlRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE_ENS7_ISC_EEFNS_10unique_ptrI17ACFUDataContainerNS_14default_deleteISF_EEEESB_EE11target_typeEv()
{
  return &_ZTIN18ACFUACIPCTransport20ACIPCClientCallbacks18copyRTIClientImageMUlRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEE_E;
}

void *_ZNKSt3__110__function6__funcIN18ACFUACIPCTransport20ACIPCClientCallbacks26getRTIWriteNameFromFileTagMUlRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE_ENS7_ISC_EEFS9_SB_EE7__cloneEv()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_26E2801F0;
  return result;
}

void _ZNKSt3__110__function6__funcIN18ACFUACIPCTransport20ACIPCClientCallbacks26getRTIWriteNameFromFileTagMUlRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE_ENS7_ISC_EEFS9_SB_EE7__cloneEPNS0_6__baseISE_EE(uint64_t a1, void *a2)
{
  *a2 = &unk_26E2801F0;
}

void _ZNSt3__110__function6__funcIN18ACFUACIPCTransport20ACIPCClientCallbacks26getRTIWriteNameFromFileTagMUlRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE_ENS7_ISC_EEFS9_SB_EEclESB_(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

uint64_t _ZNKSt3__110__function6__funcIN18ACFUACIPCTransport20ACIPCClientCallbacks26getRTIWriteNameFromFileTagMUlRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE_ENS7_ISC_EEFS9_SB_EE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIN18ACFUACIPCTransport20ACIPCClientCallbacks26getRTIWriteNameFromFileTagMUlRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEE_E))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIN18ACFUACIPCTransport20ACIPCClientCallbacks26getRTIWriteNameFromFileTagMUlRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE_ENS7_ISC_EEFS9_SB_EE11target_typeEv()
{
  return &_ZTIN18ACFUACIPCTransport20ACIPCClientCallbacks26getRTIWriteNameFromFileTagMUlRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEE_E;
}

void *std::__function::__value_func<std::unique_ptr<ACFUDataContainer> ()(std::string const&)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void *std::__function::__value_func<__CFData const* ()(std::shared_ptr<ACFUFirmware>)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void *std::__function::__value_func<std::string ()(std::string const&)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t ACFUACIPCTransport::FileTransferSession::FileTransferSession(uint64_t a1, char a2, void *a3, long long *a4, int a5, uint64_t *a6, uint64_t a7)
{
  *(unsigned char *)a1 = a2;
  uint64_t v11 = a3[1];
  *(void *)(a1 + 8) = *a3;
  *(void *)(a1 + 16) = v11;
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v12 = (std::string *)(a1 + 24);
  if (*((char *)a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v12, *(const std::string::value_type **)a4, *((void *)a4 + 1));
  }
  else
  {
    long long v13 = *a4;
    *(void *)(a1 + 40) = *((void *)a4 + 2);
    *(_OWORD *)&v12->__r_.__value_.__l.__data_ = v13;
  }
  *(_DWORD *)(a1 + 48) = a5;
  *(_DWORD *)(a1 + 52) = 0;
  uint64_t v14 = *a6;
  *a6 = 0;
  *(void *)(a1 + 56) = v14;
  *(void *)(a1 + 64) = a7;
  return a1;
}

void sub_22EF188A4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 16);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

void std::default_delete<ACFUACIPCTransport::FileTransferSession>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    std::unique_ptr<ACFUDataContainer>::reset[abi:ne180100]((ACFUDataContainer **)(a2 + 56), 0);
    if (*(char *)(a2 + 47) < 0) {
      operator delete(*(void **)(a2 + 24));
    }
    uint64_t v3 = *(std::__shared_weak_count **)(a2 + 16);
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    operator delete((void *)a2);
  }
}

ACFUROM *ACFURTKitROM::create@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, ACFUROM **a4@<X8>)
{
  __int16 v27 = 0;
  dispatch_source_t v8 = (ACFUROM *)operator new(0x40uLL);
  ACFUROM::ACFUROM(v8);
  *(void *)dispatch_source_t v8 = &unk_26E280280;
  *((_WORD *)v8 + 28) = 0;
  uint64_t v9 = *a1;
  uint64_t v10 = (std::__shared_weak_count *)a1[1];
  v26[0] = v9;
  v26[1] = (uint64_t)v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v11 = *a2;
  uint64_t v12 = (std::__shared_weak_count *)a2[1];
  v25[0] = v11;
  v25[1] = (uint64_t)v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v13 = *a3;
  uint64_t v14 = (std::__shared_weak_count *)a3[1];
  v24[0] = v13;
  v24[1] = (uint64_t)v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v15 = (ACFULogging *)ACFURTKitROM::init((uint64_t)v8, v26, v25, v24, &v27);
  char v16 = (char)v15;
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  if (v16)
  {
    *a4 = v8;
    uint64_t result = (ACFUROM *)operator new(0x20uLL);
    *(void *)uint64_t result = &unk_26E2802E0;
    *((void *)result + 1) = 0;
    *((void *)result + 2) = 0;
    *((void *)result + 3) = v8;
  }
  else
  {
    LogInstance = ACFULogging::getLogInstance(v15);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to initialize RTKitROM object\n", v19, v20, v21, v22, v23, (char)"ACFURTKitROM");
    (*(void (**)(ACFUROM *))(*(void *)v8 + 48))(v8);
    uint64_t result = 0;
    *a4 = 0;
  }
  a4[1] = result;
  return result;
}

void sub_22EF18AB0(_Unwind_Exception *a1)
{
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    if (!v3)
    {
LABEL_3:
      if (!v2)
      {
LABEL_8:
        (*(void (**)(uint64_t))(*(void *)v1 + 48))(v1);
        _Unwind_Resume(a1);
      }
LABEL_7:
      std::__shared_weak_count::__release_shared[abi:ne180100](v2);
      goto LABEL_8;
    }
  }
  else if (!v3)
  {
    goto LABEL_3;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  if (!v2) {
    goto LABEL_8;
  }
  goto LABEL_7;
}

void ACFURTKitROM::ACFURTKitROM(ACFURTKitROM *this)
{
  ACFUROM::ACFUROM(this);
  *(void *)uint64_t v1 = &unk_26E280280;
  *(_WORD *)(v1 + 56) = 0;
}

{
  uint64_t v1;

  ACFUROM::ACFUROM(this);
  *(void *)uint64_t v1 = &unk_26E280280;
  *(_WORD *)(v1 + 56) = 0;
}

uint64_t ACFURTKitROM::init(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, _WORD *a5)
{
  *(_WORD *)(a1 + 56) = *a5;
  id v5 = (std::__shared_weak_count *)a2[1];
  uint64_t v14 = *a2;
  uint64_t v15 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = (std::__shared_weak_count *)a3[1];
  uint64_t v12 = *a3;
  uint64_t v13 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  dispatch_source_t v7 = (std::__shared_weak_count *)a4[1];
  uint64_t v10 = *a4;
  uint64_t v11 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v8 = ACFUROM::init((void *)a1, &v14, &v12, &v10);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  return v8;
}

void sub_22EF18C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  ACFURTKitROM::init(v11, v10);
  _Unwind_Resume(a1);
}

ACFUROM *ACFURTKitROM::create@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, _WORD *a4@<X3>, ACFUROM **a5@<X8>)
{
  uint64_t v10 = (ACFUROM *)operator new(0x40uLL);
  ACFUROM::ACFUROM(v10);
  *(void *)uint64_t v10 = &unk_26E280280;
  *((_WORD *)v10 + 28) = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = (std::__shared_weak_count *)a1[1];
  v28[0] = v11;
  v28[1] = (uint64_t)v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v13 = *a2;
  uint64_t v14 = (std::__shared_weak_count *)a2[1];
  v27[0] = v13;
  v27[1] = (uint64_t)v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v15 = *a3;
  char v16 = (std::__shared_weak_count *)a3[1];
  v26[0] = v15;
  v26[1] = (uint64_t)v16;
  if (v16) {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v17 = (ACFULogging *)ACFURTKitROM::init((uint64_t)v10, v28, v27, v26, a4);
  char v18 = (char)v17;
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  if (v18)
  {
    *a5 = v10;
    uint64_t result = (ACFUROM *)operator new(0x20uLL);
    *(void *)uint64_t result = &unk_26E2802E0;
    *((void *)result + 1) = 0;
    *((void *)result + 2) = 0;
    *((void *)result + 3) = v10;
  }
  else
  {
    LogInstance = ACFULogging::getLogInstance(v17);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to initialize RTKitROM object\n", v21, v22, v23, v24, v25, (char)"ACFURTKitROM");
    (*(void (**)(ACFUROM *))(*(void *)v10 + 48))(v10);
    uint64_t result = 0;
    *a5 = 0;
  }
  a5[1] = result;
  return result;
}

void sub_22EF18DE0(_Unwind_Exception *a1)
{
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    if (!v3)
    {
LABEL_3:
      if (!v2)
      {
LABEL_8:
        (*(void (**)(uint64_t))(*(void *)v1 + 48))(v1);
        _Unwind_Resume(a1);
      }
LABEL_7:
      std::__shared_weak_count::__release_shared[abi:ne180100](v2);
      goto LABEL_8;
    }
  }
  else if (!v3)
  {
    goto LABEL_3;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  if (!v2) {
    goto LABEL_8;
  }
  goto LABEL_7;
}

void ACFURTKitROM::gatherPersonalizationParameters(ACFURTKitROM *this@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  if ((a2 & 1) == 0
    && (id v5 = (ACFULogging *)(*(uint64_t (**)(void))(**((void **)this + 1) + 32))(*((void *)this + 1)),
        v5))
  {
    int v9 = (int)v5;
    LogInstance = ACFULogging::getLogInstance(v5);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to reset chip (%d)\n", v17, v18, v19, v20, v21, (char)"ACFURTKitROM");
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v6 = (ACFULogging *)(***((void *(****)(uint64_t *__return_ptr))this + 1))(&v22);
    uint64_t v8 = v22;
    dispatch_source_t v7 = v23;
    if (v23)
    {
      atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v6 = (ACFULogging *)v23;
      int v9 = v24;
      if (v23) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v23);
      }
    }
    else
    {
      int v9 = v24;
    }
    uint64_t v10 = ACFULogging::getLogInstance(v6);
    if (v9) {
      ACFULogging::handleMessage((uint64_t)v10, 2u, "%s::%s: failed to get board params (%d)\n", v11, v12, v13, v14, v15, (char)"ACFURTKitROM");
    }
    else {
      ACFULogging::handleMessage((uint64_t)v10, 3u, "%s::%s: Successfully gathered personalization parameters\n", v11, v12, v13, v14, v15, (char)"ACFURTKitROM");
    }
    if (v7)
    {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      *(void *)a3 = v8;
      *(void *)(a3 + 8) = v7;
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      *(_DWORD *)(a3 + 16) = v9;
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
      return;
    }
  }
  *(void *)a3 = v8;
  *(void *)(a3 + 8) = 0;
  *(_DWORD *)(a3 + 16) = v9;
}

void sub_22EF18FF8(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ACFURTKitROM::updateFirmware(uint64_t a1, uint64_t a2, uint64_t a3)
{
  LogInstance = ACFULogging::getLogInstance((ACFULogging *)a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 3u, "%s::%s: firmware is not present! Trying to find firmware from restore options...\n", v6, v7, v8, v9, v10, (char)"ACFURTKitROM");
  uint64_t v11 = (ACFULogging *)(***(uint64_t (****)(void))(a1 + 24))();
  if (v11)
  {
    uint64_t v24 = (uint64_t)v11;
    char v76 = ACFULogging::getLogInstance(v11);
    ACFULogging::handleMessage((uint64_t)v76, 2u, "%s::%s: could not find firmware in restore options (%d)\n", v77, v78, v79, v80, v81, (char)"ACFURTKitROM");
    goto LABEL_62;
  }
  (*(void (**)(void))(**(void **)(a1 + 24) + 8))(*(void *)(a1 + 24));
  if (!*(unsigned char *)(a1 + 56)) {
    goto LABEL_6;
  }
  CFDataRef v12 = (const __CFData *)(*(uint64_t (**)(void))(**(void **)(a1 + 24) + 32))(*(void *)(a1 + 24));
  if (!v12)
  {
    uint64_t v108 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v108, 2u, "%s::%s: failed to read boot nonce from firmware\n", v109, v110, v111, v112, v113, (char)"ACFURTKitROM");
LABEL_72:
    uint64_t v24 = 1002;
    goto LABEL_62;
  }
  CFDataRef v13 = v12;
  int Length = (ACFULogging *)CFDataGetLength(v12);
  if (Length != (ACFULogging *)8)
  {
    uint64_t v114 = ACFULogging::getLogInstance(Length);
    ACFULogging::handleMessage((uint64_t)v114, 2u, "%s::%s: failed to read boot nonce from firmware\n", v115, v116, v117, v118, v119, (char)"ACFURTKitROM");
    CFRelease(v13);
    goto LABEL_72;
  }
  uint64_t v15 = *(void *)CFDataGetBytePtr(v13);
  CFRelease(v13);
  uint64_t v17 = ACFULogging::getLogInstance(v16);
  ACFULogging::handleMessage((uint64_t)v17, 3u, "%s::%s: Has valid boot nonce? %s\n", v18, v19, v20, v21, v22, (char)"ACFURTKitROM");
  if (!v15)
  {
    if (*(unsigned char *)(a1 + 56)) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
LABEL_6:
  LOBYTE(v15) = 1;
LABEL_7:
  if (!*(unsigned char *)(a1 + 57))
  {
    uint64_t v23 = (ACFULogging *)(*(uint64_t (**)(void))(**(void **)(a1 + 8) + 32))(*(void *)(a1 + 8));
    if (v23)
    {
      uint64_t v24 = (uint64_t)v23;
      uint64_t v25 = ACFULogging::getLogInstance(v23);
      ACFULogging::handleMessage((uint64_t)v25, 2u, "%s::%s: failed to reset chip (%d)\n", v26, v27, v28, v29, v30, (char)"ACFURTKitROM");
      goto LABEL_62;
    }
  }
LABEL_11:
  uint64_t v31 = *(std::__shared_weak_count **)(a1 + 16);
  uint64_t v147 = *(void *)(a1 + 8);
  uint64_t v148 = v31;
  if (v31) {
    atomic_fetch_add_explicit(&v31->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v32 = *(std::__shared_weak_count **)(a1 + 32);
  uint64_t v145 = *(void *)(a1 + 24);
  uint64_t v146 = v32;
  if (v32) {
    atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v33 = *(void *)(a3 + 24);
  if (!v33) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  uint64_t v24 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(void *)v33 + 48))(v33, &v147, &v145);
  if (v146) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v146);
  }
  uint64_t v34 = (ACFULogging *)v148;
  if (v148) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v148);
  }
  uint64_t v35 = ACFULogging::getLogInstance(v34);
  if (v24)
  {
    ACFULogging::handleMessage((uint64_t)v35, 2u, "%s::%s: failed to perform preBoot actions (%d)\n", v36, v37, v38, v39, v40, (char)"ACFURTKitROM");
    goto LABEL_62;
  }
  ACFULogging::handleMessage((uint64_t)v35, 0, "%s::%s: booting firmware...\n", v36, v37, v38, v39, v40, (char)"ACFURTKitROM");
  if (*(unsigned char *)(a1 + 56)) {
    char v41 = v15 ^ 1;
  }
  else {
    char v41 = 0;
  }
  uint64_t v42 = (ACFULogging *)ACFURTKitROM::bootFirmware((ACFUFirmware **)a1, v41);
  if (v42)
  {
    uint64_t v24 = (uint64_t)v42;
    uint64_t v82 = ACFULogging::getLogInstance(v42);
    ACFULogging::handleMessage((uint64_t)v82, 2u, "%s::%s: failed to boot firmware (%d)\n", v83, v84, v85, v86, v87, (char)"ACFURTKitROM");
    uint64_t v88 = *(uint64_t **)(a1 + 40);
    uint64_t v89 = ACFUFirmware::copyFWContainer(*(ACFUFirmware **)(a1 + 24));
    ACFUDiagnostics::addItem(v88, @"ftab.bin", v89, 1);
    goto LABEL_62;
  }
  if (*(unsigned char *)(a1 + 56)) {
    char v43 = v15;
  }
  else {
    char v43 = 1;
  }
  if (v43) {
    goto LABEL_48;
  }
  uint64_t v44 = (ACFULogging *)(***(void *(****)(uint64_t *__return_ptr))(a1 + 8))(&v142);
  uint64_t v24 = v144;
  if (v144)
  {
    uint64_t v120 = ACFULogging::getLogInstance(v44);
    ACFULogging::handleMessage((uint64_t)v120, 2u, "%s::%s: failed to get board parameters (%d)\n", v121, v122, v123, v124, v125, (char)"ACFURTKitROM");
    char v66 = 0;
    goto LABEL_45;
  }
  uint64_t v46 = v142;
  uint64_t v45 = (ACFULogging *)v143;
  if (!v143)
  {
    if (*(unsigned char *)(v142 + 80))
    {
      uint64_t v48 = 0;
      uint64_t v49 = *(void *)(a1 + 24);
      goto LABEL_36;
    }
LABEL_74:
    uint64_t v126 = ACFULogging::getLogInstance(v45);
    ACFULogging::handleMessage((uint64_t)v126, 2u, "%s::%s: boot nonce is not present post boot. This is a failure.\n", v127, v128, v129, v130, v131, (char)"ACFURTKitROM");
    char v66 = 0;
    uint64_t v24 = 2000;
    goto LABEL_45;
  }
  atomic_fetch_add_explicit(&v143->__shared_owners_, 1uLL, memory_order_relaxed);
  int v47 = *(unsigned __int8 *)(v46 + 80);
  std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v45);
  if (!v47) {
    goto LABEL_74;
  }
  uint64_t v46 = v142;
  uint64_t v48 = v143;
  uint64_t v49 = *(void *)(a1 + 24);
  if (v143)
  {
    char v50 = 0;
    atomic_fetch_add_explicit(&v143->__shared_owners_, 1uLL, memory_order_relaxed);
    goto LABEL_37;
  }
LABEL_36:
  char v50 = 1;
LABEL_37:
  uint64_t v51 = (ACFULogging *)(*(uint64_t (**)(uint64_t, void))(*(void *)v49 + 16))(v49, *(void *)(v46 + 72));
  if ((v50 & 1) == 0) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v48);
  }
  if (!*(unsigned char *)(a1 + 57))
  {
    uint64_t v24 = 0;
    goto LABEL_44;
  }
  uint64_t v52 = ACFULogging::getLogInstance(v51);
  ACFULogging::handleMessage((uint64_t)v52, 0, "%s::%s: booting firmware one more time to make sure everything is good...\n", v53, v54, v55, v56, v57, (char)"ACFURTKitROM");
  uint64_t v58 = (ACFULogging *)(*(uint64_t (**)(void))(**(void **)(a1 + 8) + 32))(*(void *)(a1 + 8));
  uint64_t v24 = (uint64_t)v58;
  if (v58)
  {
    char v132 = ACFULogging::getLogInstance(v58);
    ACFULogging::handleMessage((uint64_t)v132, 2u, "%s::%s: failed to reset chip (%d)\n", v133, v134, v135, v136, v137, (char)"ACFURTKitROM");
    goto LABEL_76;
  }
  uint64_t v59 = (ACFULogging *)ACFURTKitROM::bootFirmware((ACFUFirmware **)a1, 0);
  uint64_t v24 = (uint64_t)v59;
  if (!v59)
  {
LABEL_44:
    char v66 = 1;
    goto LABEL_45;
  }
  uint64_t v60 = ACFULogging::getLogInstance(v59);
  ACFULogging::handleMessage((uint64_t)v60, 2u, "%s::%s: failed to boot firmware post update (%d)\n", v61, v62, v63, v64, v65, (char)"ACFURTKitROM");
LABEL_76:
  char v66 = 0;
LABEL_45:
  if (v143) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v143);
  }
  if ((v66 & 1) == 0)
  {
    if (!v24) {
      return v24;
    }
    goto LABEL_62;
  }
LABEL_48:
  uint64_t v67 = (ACFULogging *)(*(uint64_t (**)(void))(**(void **)(a1 + 8) + 24))(*(void *)(a1 + 8));
  if (v67)
  {
    uint64_t v24 = (uint64_t)v67;
    uint64_t v90 = ACFULogging::getLogInstance(v67);
    ACFULogging::handleMessage((uint64_t)v90, 2u, "%s::%s: failed to ping device after firmware push (%d)\n", v91, v92, v93, v94, v95, (char)"ACFURTKitROM");
  }
  else
  {
    uint64_t v68 = *(std::__shared_weak_count **)(a1 + 16);
    uint64_t v140 = *(void *)(a1 + 8);
    uint64_t v141 = v68;
    if (v68) {
      atomic_fetch_add_explicit(&v68->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v69 = *(std::__shared_weak_count **)(a1 + 32);
    uint64_t v138 = *(void *)(a1 + 24);
    uint64_t v139 = v69;
    if (v69) {
      atomic_fetch_add_explicit(&v69->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v70 = *(void *)(a3 + 56);
    if (!v70) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    uint64_t v24 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(void *)v70 + 48))(v70, &v140, &v138);
    if (v139) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v139);
    }
    uint64_t v71 = (ACFULogging *)v141;
    if (v141) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v141);
    }
    if (v24)
    {
      uint64_t v96 = ACFULogging::getLogInstance(v71);
      ACFULogging::handleMessage((uint64_t)v96, 2u, "%s::%s: failed to perform preSave actions (%d)\n", v97, v98, v99, v100, v101, (char)"ACFURTKitROM");
    }
    else
    {
      uint64_t v72 = (ACFULogging *)(*(uint64_t (**)(void))(**(void **)(a1 + 24) + 24))(*(void *)(a1 + 24));
      uint64_t v24 = (uint64_t)v72;
      if (!v72) {
        return v24;
      }
      uint64_t v102 = ACFULogging::getLogInstance(v72);
      ACFULogging::handleMessage((uint64_t)v102, 2u, "%s::%s: failed to save firmware (%d)\n", v103, v104, v105, v106, v107, (char)"ACFURTKitROM");
    }
  }
LABEL_62:
  if (ACFUFirmware::getManifest(*(ACFUFirmware **)(a1 + 24)))
  {
    uint64_t v74 = *(uint64_t **)(a1 + 40);
    uint64_t Manifest = ACFUFirmware::getManifest(*(ACFUFirmware **)(a1 + 24));
    ACFUDiagnostics::addItem(v74, @"ticket.der", Manifest, 1);
  }
  return v24;
}

void sub_22EF196B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  if ((v21 & 1) == 0) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  if (a17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a17);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ACFURTKitROM::bootFirmware(ACFUFirmware **this, char a2)
{
  BOOL hasValidFirmware = ACFUFirmware::hasValidFirmware(this[3]);
  if (!hasValidFirmware)
  {
    LogInstance = ACFULogging::getLogInstance((ACFULogging *)hasValidFirmware);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: firmware not present to boot\n", v15, v16, v17, v18, v19, (char)"ACFURTKitROM");
    return 1000;
  }
  if ((a2 & 1) == 0)
  {
    CFDataRef v5 = (const __CFData *)(*(uint64_t (**)(ACFUFirmware *))(*(void *)this[3] + 32))(this[3]);
    if (v5)
    {
      CFDataRef v6 = v5;
      uint64_t v7 = this[1];
      BytePtr = CFDataGetBytePtr(v5);
      CFIndex Length = CFDataGetLength(v6);
      uint64_t v10 = (*(uint64_t (**)(ACFUFirmware *, const UInt8 *, CFIndex))(*(void *)v7 + 8))(v7, BytePtr, Length);
      CFRelease(v6);
      if (!v10) {
        goto LABEL_5;
      }
      uint64_t v26 = ACFULogging::getLogInstance(v11);
      ACFULogging::handleMessage((uint64_t)v26, 2u, "%s::%s: failed to set the boot nonce (%d)\n", v27, v28, v29, v30, v31, (char)"ACFURTKitROM");
    }
    else
    {
      uint64_t v20 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v20, 2u, "%s::%s: boot nonce missing\n", v21, v22, v23, v24, v25, (char)"ACFURTKitROM");
      return 1002;
    }
    return v10;
  }
LABEL_5:
  CFDataRef v12 = (uint64_t (*)(ACFUFirmware **))*((void *)*this + 2);
  return v12(this);
}

uint64_t ACFURTKitROM::certifyChip(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v92 = 0xDEADBEEFDEADBEEFLL;
  __int16 v91 = -8531;
  unsigned __int16 v90 = -8531;
  uint64_t v7 = (ACFULogging *)(***(void *(****)(unsigned char **__return_ptr))(a1 + 8))(&v87);
  if (v89)
  {
    LogInstance = ACFULogging::getLogInstance(v7);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to get board params (%d)\n", v54, v55, v56, v57, v58, (char)"ACFURTKitROM");
    uint64_t v21 = v89;
    goto LABEL_54;
  }
  uint64_t v8 = v87;
  uint64_t v9 = v88;
  if (v88) {
    atomic_fetch_add_explicit(&v88->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (!v8[48])
  {
    BOOL v11 = 0;
    goto LABEL_13;
  }
  uint64_t v10 = v88;
  if (v88) {
    atomic_fetch_add_explicit(&v88->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v8[16])
  {
    uint64_t v7 = (ACFULogging *)v88;
    if (v88)
    {
      atomic_fetch_add_explicit(&v88->__shared_owners_, 1uLL, memory_order_relaxed);
      BOOL v11 = v8[32] != 0;
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v7);
      if (!v10) {
        goto LABEL_13;
      }
    }
    else
    {
      BOOL v11 = v8[32] != 0;
      if (!v10) {
        goto LABEL_13;
      }
    }
LABEL_12:
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    goto LABEL_13;
  }
  BOOL v11 = 0;
  if (v10) {
    goto LABEL_12;
  }
LABEL_13:
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  if (!v11)
  {
    uint64_t v22 = ACFULogging::getLogInstance(v7);
    ACFULogging::handleMessage((uint64_t)v22, 2u, "%s::%s: query command is missing chip ecid, chipId, or boardId\n", v23, v24, v25, v26, v27, (char)"ACFURTKitROM");
    uint64_t v21 = 3011;
    goto LABEL_54;
  }
  CFDataRef v12 = v87;
  CFDataRef v13 = v88;
  if (v88) {
    atomic_fetch_add_explicit(&v88->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  DataAs = ACFUCommon::Parameter::GetDataAsType<unsigned short>((uint64_t)(v12 + 24), &v90);
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  if (v90 == 57005 || !v90)
  {
    uint64_t v15 = ACFULogging::getLogInstance(DataAs);
    ACFULogging::handleMessage((uint64_t)v15, 2u, "%s::%s: device with board id 0x%04x does not support certification\n", v16, v17, v18, v19, v20, (char)"ACFURTKitROM");
    uint64_t v21 = 1010;
    goto LABEL_54;
  }
  uint64_t v28 = v87;
  uint64_t v29 = v88;
  if (v88) {
    atomic_fetch_add_explicit(&v88->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ACFUCommon::Parameter::GetDataAsType<unsigned short>((uint64_t)(v28 + 8), &v91);
  if (v29) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v29);
  }
  uint64_t v30 = v87;
  uint64_t v31 = v88;
  if (v88) {
    atomic_fetch_add_explicit(&v88->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ACFUCommon::Parameter::GetDataAsType<unsigned long long>((uint64_t)(v30 + 40), &v92);
  if (v31) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v31);
  }
  uint64_t v32 = (ACFULogging *)(***(uint64_t (****)(void, uint64_t))(a1 + 24))(*(void *)(a1 + 24), a4);
  uint64_t v21 = (uint64_t)v32;
  if (v32)
  {
    uint64_t v59 = ACFULogging::getLogInstance(v32);
    ACFULogging::handleMessage((uint64_t)v59, 2u, "%s::%s: Could not create a valid firmware from restore options (%d).\n", v60, v61, v62, v63, v64, (char)"ACFURTKitROM");
    goto LABEL_54;
  }
  uint64_t v33 = ACFULogging::getLogInstance(v32);
  ACFULogging::handleMessage((uint64_t)v33, 0, "%s::%s: performing certification...\n", v34, v35, v36, v37, v38, (char)"ACFURTKitROM");
  if (*(_DWORD *)(a2 + 32) == 2 && !*(void *)(a2 + 40))
  {
    uint64_t v39 = *(void *)(a1 + 8);
    uint64_t v40 = *(std::__shared_weak_count **)(a1 + 32);
    uint64_t v84 = v40;
    if (v40) {
      atomic_fetch_add_explicit(&v40->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    (*(void (**)(uint64_t *__return_ptr))(*(void *)v39 + 48))(&v85);
    char v41 = (ACFULogging *)v84;
    uint64_t v42 = v85;
    uint64_t v21 = v86;
    if (v84) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v84);
    }
    if (v21)
    {
      uint64_t v77 = ACFULogging::getLogInstance(v41);
      ACFULogging::handleMessage((uint64_t)v77, 2u, "%s::%s: failed to collect sik public key (%d)\n", v78, v79, v80, v81, v82, (char)"ACFURTKitROM");
      goto LABEL_54;
    }
    *(void *)(a2 + 40) = v42;
  }
  uint64_t v43 = *(void *)(a2 + 48);
  if (!v43)
  {
    uint64_t v44 = *(void *)(a1 + 8);
    uint64_t v45 = *(std::__shared_weak_count **)(a1 + 32);
    uint64_t v83 = v45;
    if (v45) {
      atomic_fetch_add_explicit(&v45->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    (*(void (**)(uint64_t *__return_ptr))(*(void *)v44 + 48))(&v85);
    uint64_t v43 = v85;
    uint64_t v46 = v86;
    int v47 = (ACFULogging *)v83;
    if (v83) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v83);
    }
    if (v46)
    {
      uint64_t v71 = ACFULogging::getLogInstance(v47);
      ACFULogging::handleMessage((uint64_t)v71, 2u, "%s::%s: failed to collect sik csr blob (%d)\n", v72, v73, v74, v75, v76, (char)"ACFURTKitROM");
      uint64_t v21 = v46;
      goto LABEL_54;
    }
    *(void *)(a2 + 48) = v43;
  }
  uint64_t v48 = *(void *)(a2 + 40);
  if (v48)
  {
    ACFUDiagnostics::addItem(*(uint64_t **)(a1 + 40), @"sikPubKey.bin", v48, 1);
    uint64_t v43 = *(void *)(a2 + 48);
  }
  if (v43) {
    ACFUDiagnostics::addItem(*(uint64_t **)(a1 + 40), @"sikCSR.bin", v43, 1);
  }
  uint64_t v49 = ACFUFDR::certifyChip(a2, v91, v92, v90);
  if (v49)
  {
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v65 = ACFULogging::getLogInstance((ACFULogging *)v49);
    ACFULogging::handleMessage((uint64_t)v65, 2u, "%s::%s: failed to perform FDR certification\n", v66, v67, v68, v69, v70, (char)"ACFURTKitROM");
    uint64_t v21 = 1011;
  }
LABEL_54:
  char v50 = *(const void **)(a2 + 48);
  if (v50)
  {
    CFRelease(v50);
    *(void *)(a2 + 48) = 0;
  }
  uint64_t v51 = *(const void **)(a2 + 40);
  if (v51)
  {
    CFRelease(v51);
    *(void *)(a2 + 40) = 0;
  }
  if (v88) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v88);
  }
  return v21;
}

void sub_22EF19DA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, uint64_t a17, uint64_t a18, std::__shared_weak_count *a19)
{
  if (a15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a15);
  }
  if (a19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a19);
  }
  _Unwind_Resume(exception_object);
}

const __CFData *ACFUCommon::Parameter::GetDataAsType<unsigned long long>(uint64_t a1, void *a2)
{
  if (!*(unsigned char *)(a1 + 8)) {
    return 0;
  }
  CFDataRef result = *(const __CFData **)a1;
  if (!result) {
    return result;
  }
  BytePtr = CFDataGetBytePtr(result);
  unint64_t Length = CFDataGetLength(*(CFDataRef *)a1);
  if (Length > 8) {
    return 0;
  }
  *a2 = 0;
  memcpy(a2, BytePtr, Length);
  return (const __CFData *)1;
}

void ACFURTKitROM::~ACFURTKitROM(ACFURTKitROM *this)
{
  ACFUROM::~ACFUROM(this);
  operator delete(v1);
}

void std::__shared_ptr_pointer<ACFURTKitROM  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<ACFURTKitROM  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 48))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<ACFURTKitROM  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else {
    return 0;
  }
}

__CFDictionary *ACFURestoreHost::getTags(ACFURestoreHost *this)
{
  CFMutableDataRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    CFArrayRef ArrayFromList = ACFURestoreHost::createArrayFromList((const void ***)this + 5);
    if (ArrayFromList)
    {
      CFArrayRef v4 = ArrayFromList;
      CFArrayRef v5 = ACFURestoreHost::createArrayFromList((const void ***)this + 14);
      if (v5)
      {
        CFArrayRef v6 = v5;
        uint64_t Value = CFDictionaryGetValue(*((CFDictionaryRef *)this + 2), @"DeviceInfo");
        if (Value && (CFTypeID v8 = CFGetTypeID(Value), v8 == CFDictionaryGetTypeID()))
        {
          CFDictionaryAddValue(Mutable, @"BuildIdentityTags", v4);
          CFDictionaryAddValue(Mutable, @"ResponseTags", v6);
          LogInstance = ACFULogging::getLogInstance(v9);
          std::string::basic_string[abi:ne180100]<0>(&v44, "ACFURestoreHost");
          BOOL v11 = std::string::append(&v44, "::");
          long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
          v45.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v12;
          v11->__r_.__value_.__l.__size_ = 0;
          v11->__r_.__value_.__r.__words[2] = 0;
          v11->__r_.__value_.__r.__words[0] = 0;
          CFDataRef v13 = std::string::append(&v45, "getTags");
          long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
          std::string::size_type v47 = v13->__r_.__value_.__r.__words[2];
          *(_OWORD *)std::string __p = v14;
          v13->__r_.__value_.__l.__size_ = 0;
          v13->__r_.__value_.__r.__words[2] = 0;
          v13->__r_.__value_.__r.__words[0] = 0;
          ACFULogging::handleMessageCFType((uint64_t)LogInstance, (uint64_t *)__p, 0, (uint64_t)"Request Tags:", (uint64_t)Mutable);
          if (SHIBYTE(v47) < 0) {
            operator delete(__p[0]);
          }
          if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v45.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v44.__r_.__value_.__l.__data_);
          }
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>(v48, "getTags: failed to get device info list");
          uint64_t v16 = (ACFULogging *)ACFUError::addError((uint64_t)this + 24, (uint64_t)v48, 0xFA1uLL, 0);
          if (v49 < 0) {
            operator delete(v48[0]);
          }
          uint64_t v17 = ACFULogging::getLogInstance(v16);
          ACFULogging::handleMessage((uint64_t)v17, 2u, "%s::%s: failed to get device info list\n", v18, v19, v20, v21, v22, (char)"ACFURestoreHost");
        }
        CFRelease(v6);
      }
      else
      {
        std::string::basic_string[abi:ne180100]<0>(v50, "getTags: failed to create response tag list");
        uint64_t v37 = (ACFULogging *)ACFUError::addError((uint64_t)this + 24, (uint64_t)v50, 0xFA0uLL, 0);
        if (v51 < 0) {
          operator delete(v50[0]);
        }
        uint64_t v38 = ACFULogging::getLogInstance(v37);
        ACFULogging::handleMessage((uint64_t)v38, 2u, "%s::%s: failed to create response tag list\n", v39, v40, v41, v42, v43, (char)"ACFURestoreHost");
      }
      CFRelease(v4);
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(v52, "getTags: failed to create build identity tag list");
      uint64_t v30 = (ACFULogging *)ACFUError::addError((uint64_t)this + 24, (uint64_t)v52, 0xFA0uLL, 0);
      if (v53 < 0) {
        operator delete(v52[0]);
      }
      uint64_t v31 = ACFULogging::getLogInstance(v30);
      ACFULogging::handleMessage((uint64_t)v31, 2u, "%s::%s: failed to create build identity tag list\n", v32, v33, v34, v35, v36, (char)"ACFURestoreHost");
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(v54, "getTags: failed to allocate output dictionary");
    uint64_t v23 = (ACFULogging *)ACFUError::addError((uint64_t)this + 24, (uint64_t)v54, 0xFA0uLL, 0);
    if (v55 < 0) {
      operator delete(v54[0]);
    }
    uint64_t v24 = ACFULogging::getLogInstance(v23);
    ACFULogging::handleMessage((uint64_t)v24, 2u, "%s::%s: failed to allocate output dictionary\n", v25, v26, v27, v28, v29, (char)"ACFURestoreHost");
  }
  return Mutable;
}

void sub_22EF1A294(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  if (*(char *)(v37 - 97) < 0) {
    operator delete(*(void **)(v37 - 120));
  }
  _Unwind_Resume(exception_object);
}

CFArrayRef ACFURestoreHost::createArrayFromList(const void ***a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (Mutable)
  {
    CFArrayRef v4 = Mutable;
    for (uint64_t i = *a1; i != a1[1]; ++i)
    {
      CFArrayRef v6 = *i;
      CFArrayAppendValue(v4, v6);
    }
    CFArrayRef Copy = CFArrayCreateCopy(v2, v4);
    CFRelease(v4);
    return Copy;
  }
  else
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to create tag list from vector\n", v10, v11, v12, v13, v14, (char)"ACFURestoreHost");
    return 0;
  }
}

const __CFData *ACFURestoreHost::copyFirmware(ACFURestoreHost *this)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"Firmware/%@/Rooted/ftab.bin", *((void *)this + 28));
  if (!v3)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to allocate data for personalized path\n", v162, v163, v164, v165, v166, (char)"ACFURestoreHost");
    return 0;
  }
  CFArrayRef v4 = (__CFString *)v3;
  CFArrayRef v5 = (ACFULogging *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 2), @"DestBundlePath");
  uint64_t v6 = (uint64_t)v5;
  if (v5)
  {
    uint64_t v7 = ACFULogging::getLogInstance(v5);
    CFTypeID v8 = (std::string *)std::string::basic_string[abi:ne180100]<0>(&v249, "ACFURestoreHost");
    uint64_t v9 = std::string::append(v8, "::");
    long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    v250.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v250.__r_.__value_.__l.__data_ = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    uint64_t v11 = std::string::append(&v250, "copyFirmware");
    long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    v251.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v251.__r_.__value_.__l.__data_ = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v7, (uint64_t *)&v251, 0, (uint64_t)"personalizedURL: ", v6);
    if (SHIBYTE(v251.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v251.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v250.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v250.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v249.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v249.__r_.__value_.__l.__data_);
    }
  }
  uint64_t v13 = (ACFULogging *)CFDictionaryContainsKey(*((CFDictionaryRef *)this + 2), @"BundleDataDict");
  int v14 = (int)v13;
  uint64_t v15 = ACFULogging::getLogInstance(v13);
  if (!v14)
  {
    ACFULogging::handleMessage((uint64_t)v15, 0, "%s::%s: running host invoked restore info -- using bundleURL\n", v16, v17, v18, v19, v20, (char)"ACFURestoreHost");
    CFMutableArrayRef Mutable = CFDictionaryCreateMutable(v2, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (Mutable)
    {
      CFMutableDictionaryRef v33 = CFDictionaryCreateMutable(v2, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (v33)
      {
        uint64_t v25 = v33;
        uint64_t v34 = CFDictionaryGetValue(*((CFDictionaryRef *)this + 2), @"BundlePath");
        if (!v34 || (uint64_t v35 = v34, v36 = CFURLGetTypeID(), v36 != CFGetTypeID(v35)))
        {
          std::string::basic_string[abi:ne180100]<0>(v245, "copyFirmware: failed to get src bundle URL");
          uint64_t v173 = (ACFULogging *)ACFUError::addError((uint64_t)this + 24, (uint64_t)v245, 0xFA1uLL, 0);
          if (v246 < 0) {
            operator delete(v245[0]);
          }
          uint64_t v174 = ACFULogging::getLogInstance(v173);
          ACFULogging::handleMessage((uint64_t)v174, 2u, "%s::%s: failed to get src bundle URL\n", v175, v176, v177, v178, v179, (char)"ACFURestoreHost");
          goto LABEL_181;
        }
        CFDictionaryRef v37 = (const __CFDictionary *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 2), @"Options");
        CFStringRef v221 = v4;
        if (v37 && (CFDictionaryRef v39 = v37, v40 = CFGetTypeID(v37), v40 == CFDictionaryGetTypeID()))
        {
          cf.__r_.__value_.__r.__words[0] = 0;
          uint64_t v41 = CFDictionaryGetValue(v39, @"ACFUFirmware");
          if (v41)
          {
            CFTypeID TypeID = CFStringGetTypeID();
            if (TypeID == CFGetTypeID(v41))
            {
              if (v6)
              {
                AMSupportCopyURLWithAppendedComponent();
                std::string::basic_string[abi:ne180100]<0>(v243, "copyFirmware: failed to create personalized rooted FW URL");
                CFRange v212 = (ACFULogging *)ACFUError::addError((uint64_t)this + 24, (uint64_t)v243, 0xFA0uLL, 0);
                if (v244 < 0) {
                  operator delete(v243[0]);
                }
                CFRange v213 = ACFULogging::getLogInstance(v212);
                ACFULogging::handleMessage((uint64_t)v213, 2u, "%s::%s: failed to create personalized rooted FW URL (status: %d)\n", v214, v215, v216, v217, v218, (char)"ACFURestoreHost");
LABEL_194:
                CFDataRef v30 = 0;
                goto LABEL_18;
              }
              uint64_t URLFromString = (const void *)AMSupportCreateURLFromString();
              if (!URLFromString)
              {
                std::string::basic_string[abi:ne180100]<0>(v241, "copyFirmware: failed to create src rooted FW URL");
                CFDataRef v205 = (ACFULogging *)ACFUError::addError((uint64_t)this + 24, (uint64_t)v241, 0xFA0uLL, 0);
                if (v242 < 0) {
                  operator delete(v241[0]);
                }
                v206 = ACFULogging::getLogInstance(v205);
                ACFULogging::handleMessage((uint64_t)v206, 2u, "%s::%s: copyFirmware: failed to create src rooted FW URL\n", v207, v208, v209, v210, v211, (char)"ACFURestoreHost");
                goto LABEL_194;
              }
              std::string v44 = URLFromString;
              CFDictionaryAddValue(Mutable, *((const void **)this + 1), URLFromString);
              CFDictionaryAddValue(v25, *((const void **)this + 1), v44);
              CFRelease(v44);
            }
          }
        }
        else
        {
          uint64_t v41 = 0;
        }
        v219 = v41;
        uint64_t v45 = *((void *)this + 17);
        if (v45 != *((void *)this + 18))
        {
          char v46 = 0;
          v220 = (char *)this + 24;
          while (1)
          {
            CFTypeRef v239 = 0;
            CFNumberRef value = 0;
            PathFromBuildID = ACFURestoreHost::getPathFromBuildID(*((ACFURestoreHost **)this + 2), *(const __CFDictionary **)v45, v38);
            ACFUCommon::stringFromCFString(*(const __CFString **)v45, &v251);
            if (SHIBYTE(v251.__r_.__value_.__r.__words[2]) < 0)
            {
              if (v251.__r_.__value_.__l.__size_)
              {
                std::string::__init_copy_ctor_external(&v250, v251.__r_.__value_.__l.__data_, v251.__r_.__value_.__l.__size_);
                goto LABEL_41;
              }
            }
            else if (*((unsigned char *)&v251.__r_.__value_.__s + 23))
            {
              std::string v250 = v251;
              goto LABEL_41;
            }
            uint64_t v48 = (ACFULogging *)std::string::basic_string[abi:ne180100]<0>(&v250, "UNDEF");
LABEL_41:
            if (SHIBYTE(v251.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v251.__r_.__value_.__l.__data_);
            }
            std::string v251 = v250;
            if (PathFromBuildID)
            {
              if (v6)
              {
                if (AMSupportCopyURLWithAppendedComponent() || !v239)
                {
                  std::string::basic_string[abi:ne180100]<0>(v234, "copyFirmware: failed to create personalized FW URL");
                  uint64_t v83 = (ACFULogging *)ACFUError::addError((uint64_t)v220, (uint64_t)v234, 0xFA0uLL, 0);
                  if (v235 < 0) {
                    operator delete(v234[0]);
                  }
                  uint64_t v84 = ACFULogging::getLogInstance(v83);
                  ACFULogging::handleMessage((uint64_t)v84, 2u, "%s::%s: copyFirmware: failed to create personalized FW URL (status: %d)\n", v85, v86, v87, v88, v89, (char)"ACFURestoreHost");
                  goto LABEL_74;
                }
                BOOL doesPathExist = ACFUCommon::doesPathExist((ACFUCommon *)v239, v49);
                if (doesPathExist)
                {
                  char v51 = ACFULogging::getLogInstance((ACFULogging *)doesPathExist);
                  std::string::basic_string[abi:ne180100]<0>(&cf, "ACFURestoreHost");
                  uint64_t v52 = std::string::append(&cf, "::");
                  long long v53 = *(_OWORD *)&v52->__r_.__value_.__l.__data_;
                  v249.__r_.__value_.__r.__words[2] = v52->__r_.__value_.__r.__words[2];
                  *(_OWORD *)&v249.__r_.__value_.__l.__data_ = v53;
                  v52->__r_.__value_.__l.__size_ = 0;
                  v52->__r_.__value_.__r.__words[2] = 0;
                  v52->__r_.__value_.__r.__words[0] = 0;
                  uint64_t v54 = std::string::append(&v249, "copyFirmware");
                  long long v55 = *(_OWORD *)&v54->__r_.__value_.__l.__data_;
                  v250.__r_.__value_.__r.__words[2] = v54->__r_.__value_.__r.__words[2];
                  *(_OWORD *)&v250.__r_.__value_.__l.__data_ = v55;
                  v54->__r_.__value_.__l.__size_ = 0;
                  v54->__r_.__value_.__r.__words[2] = 0;
                  v54->__r_.__value_.__r.__words[0] = 0;
                  ACFULogging::handleMessageCFType((uint64_t)v51, (uint64_t *)&v250, 0, (uint64_t)"Firmware Object: ", *(void *)v45);
                  if (SHIBYTE(v250.__r_.__value_.__r.__words[2]) < 0) {
                    operator delete(v250.__r_.__value_.__l.__data_);
                  }
                  if (SHIBYTE(v249.__r_.__value_.__r.__words[2]) < 0) {
                    operator delete(v249.__r_.__value_.__l.__data_);
                  }
                  if (SHIBYTE(cf.__r_.__value_.__r.__words[2]) < 0) {
                    operator delete(cf.__r_.__value_.__l.__data_);
                  }
                  uint64_t v57 = ACFULogging::getLogInstance(v56);
                  std::string::basic_string[abi:ne180100]<0>(&cf, "ACFURestoreHost");
                  uint64_t v58 = std::string::append(&cf, "::");
                  long long v59 = *(_OWORD *)&v58->__r_.__value_.__l.__data_;
                  v249.__r_.__value_.__r.__words[2] = v58->__r_.__value_.__r.__words[2];
                  *(_OWORD *)&v249.__r_.__value_.__l.__data_ = v59;
                  v58->__r_.__value_.__l.__size_ = 0;
                  v58->__r_.__value_.__r.__words[2] = 0;
                  v58->__r_.__value_.__r.__words[0] = 0;
                  uint64_t v60 = std::string::append(&v249, "copyFirmware");
                  long long v61 = *(_OWORD *)&v60->__r_.__value_.__l.__data_;
                  v250.__r_.__value_.__r.__words[2] = v60->__r_.__value_.__r.__words[2];
                  *(_OWORD *)&v250.__r_.__value_.__l.__data_ = v61;
                  v60->__r_.__value_.__l.__size_ = 0;
                  v60->__r_.__value_.__r.__words[2] = 0;
                  v60->__r_.__value_.__r.__words[0] = 0;
                  ACFULogging::handleMessageCFType((uint64_t)v57, (uint64_t *)&v250, 0, (uint64_t)"Personalized Bundle FW URL: ", (uint64_t)v239);
                  if (SHIBYTE(v250.__r_.__value_.__r.__words[2]) < 0) {
                    operator delete(v250.__r_.__value_.__l.__data_);
                  }
                  if (SHIBYTE(v249.__r_.__value_.__r.__words[2]) < 0) {
                    operator delete(v249.__r_.__value_.__l.__data_);
                  }
                  if (SHIBYTE(cf.__r_.__value_.__r.__words[2]) < 0) {
                    operator delete(cf.__r_.__value_.__l.__data_);
                  }
                  char v46 = 1;
                }
                else if (v239)
                {
                  CFRelease(v239);
                  char v46 = 0;
                  CFTypeRef v239 = 0;
                }
                else
                {
                  char v46 = 0;
                }
              }
              if (AMSupportCopyURLWithAppendedComponent() || !value)
              {
                std::string::basic_string[abi:ne180100]<0>(v232, "copyFirmware: failed to create default FW URL");
                uint64_t v76 = (ACFULogging *)ACFUError::addError((uint64_t)v220, (uint64_t)v232, 0xFA0uLL, 0);
                if (v233 < 0) {
                  operator delete(v232[0]);
                }
                uint64_t v77 = ACFULogging::getLogInstance(v76);
                ACFULogging::handleMessage((uint64_t)v77, 2u, "%s::%s: copyFirmware: failed to create default FW URL, (status: %d)\n", v78, v79, v80, v81, v82, (char)"ACFURestoreHost");
LABEL_74:
                int v67 = 4;
                goto LABEL_84;
              }
              if (v46) {
                uint64_t v75 = v239;
              }
              else {
                uint64_t v75 = value;
              }
              CFDictionaryAddValue(Mutable, *(const void **)v45, v75);
              CFDictionaryAddValue(v25, *(const void **)v45, value);
              if (value)
              {
                CFRelease(value);
                int v67 = 0;
                CFNumberRef value = 0;
              }
              else
              {
                int v67 = 0;
              }
            }
            else
            {
              if (!*(unsigned char *)(v45 + 8))
              {
                std::string::basic_string[abi:ne180100]<0>(__p, "copyFirmware: failed to find FW");
                uint64_t v68 = (ACFULogging *)ACFUError::addError((uint64_t)v220, (uint64_t)__p, 0xFA1uLL, 0);
                if (v237 < 0) {
                  operator delete(__p[0]);
                }
                uint64_t v69 = ACFULogging::getLogInstance(v68);
                ACFULogging::handleMessage((uint64_t)v69, 2u, "%s::%s: copyFirmware: failed to find FW (%s) in build ID\n", v70, v71, v72, v73, v74, (char)"ACFURestoreHost");
                goto LABEL_74;
              }
              uint64_t v62 = ACFULogging::getLogInstance(v48);
              std::string::basic_string[abi:ne180100]<0>(&cf, "ACFURestoreHost");
              uint64_t v63 = std::string::append(&cf, "::");
              long long v64 = *(_OWORD *)&v63->__r_.__value_.__l.__data_;
              v249.__r_.__value_.__r.__words[2] = v63->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v249.__r_.__value_.__l.__data_ = v64;
              v63->__r_.__value_.__l.__size_ = 0;
              v63->__r_.__value_.__r.__words[2] = 0;
              v63->__r_.__value_.__r.__words[0] = 0;
              uint64_t v65 = std::string::append(&v249, "copyFirmware");
              long long v66 = *(_OWORD *)&v65->__r_.__value_.__l.__data_;
              v250.__r_.__value_.__r.__words[2] = v65->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v250.__r_.__value_.__l.__data_ = v66;
              v65->__r_.__value_.__l.__size_ = 0;
              v65->__r_.__value_.__r.__words[2] = 0;
              v65->__r_.__value_.__r.__words[0] = 0;
              ACFULogging::handleMessageCFType((uint64_t)v62, (uint64_t *)&v250, 0, (uint64_t)"skipping optional file...", *(void *)v45);
              if (SHIBYTE(v250.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v250.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v249.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v249.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(cf.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(cf.__r_.__value_.__l.__data_);
              }
              int v67 = 29;
            }
LABEL_84:
            if (SHIBYTE(v251.__r_.__value_.__r.__words[2]) < 0)
            {
              operator delete(v251.__r_.__value_.__l.__data_);
              if (!v67) {
                goto LABEL_89;
              }
            }
            else if (!v67)
            {
              goto LABEL_89;
            }
            if (v67 != 29)
            {
              CFDataRef v30 = 0;
              goto LABEL_162;
            }
LABEL_89:
            v45 += 16;
            if (v45 == *((void *)this + 18)) {
              goto LABEL_98;
            }
          }
        }
        char v46 = 0;
LABEL_98:
        unsigned __int16 v90 = (ACFULogging *)(*(uint64_t (**)(ACFURestoreHost *, __CFDictionary *, void))(*(void *)this + 40))(this, Mutable, 0);
        CFDataRef v30 = v90;
        if (!v90)
        {
          if (v46)
          {
            __int16 v91 = ACFULogging::getLogInstance(0);
            ACFULogging::handleMessage((uint64_t)v91, 0, "%s::%s: attempting copyFirmwareUpdater again with source bundle file map\n", v92, v93, v94, v95, v96, (char)"ACFURestoreHost");
            unsigned __int16 v90 = (ACFULogging *)(*(uint64_t (**)(ACFURestoreHost *, __CFDictionary *, void))(*(void *)this + 40))(this, v25, 0);
            CFDataRef v30 = v90;
          }
          if (!v30)
          {
            std::string::basic_string[abi:ne180100]<0>(v230, "copyFirmware: updater failed to find firmware data with bundleURL");
            uint64_t v151 = (ACFULogging *)ACFUError::addError((uint64_t)this + 24, (uint64_t)v230, 0xFA0uLL, 0);
            CFDataRef v30 = 0;
            uint64_t v152 = "%s::%s: updater failed to find firmware data with bundleURL\n";
            if (v231 < 0)
            {
              uint64_t v153 = (void **)v230;
              goto LABEL_171;
            }
            goto LABEL_172;
          }
        }
        if (v6) {
          BOOL v97 = v219 == 0;
        }
        else {
          BOOL v97 = 1;
        }
        char v98 = v97;
        if ((v98 & 1) == 0)
        {
          uint64_t v99 = ACFULogging::getLogInstance(v90);
          ACFULogging::handleMessage((uint64_t)v99, 0, "%s::%s: copying preflighted rooted firmware into the dst bundle...\n", v100, v101, v102, v103, v104, (char)"ACFURestoreHost");
          unsigned __int16 v90 = (ACFULogging *)ACFURestoreHost::copyToPersonalizedBundlePath(v105, *((CFDictionaryRef *)this + 2), v221, v30);
          if (v90)
          {
            std::string::basic_string[abi:ne180100]<0>(v228, "copyFirmware: failed to perform destination bundle copy of rooted firmware");
            uint64_t v151 = (ACFULogging *)ACFUError::addError((uint64_t)this + 24, (uint64_t)v228, 0xFA3uLL, 0);
            uint64_t v152 = "%s::%s: failed to perform destination bundle copy of rooted firmware\n";
            if (v229 < 0)
            {
              uint64_t v153 = (void **)v228;
LABEL_171:
              operator delete(*v153);
            }
LABEL_172:
            uint64_t v167 = ACFULogging::getLogInstance(v151);
            ACFULogging::handleMessage((uint64_t)v167, 2u, v152, v168, v169, v170, v171, v172, (char)"ACFURestoreHost");
LABEL_162:
            CFStringRef v32 = v221;
            goto LABEL_163;
          }
        }
        if ((v6 == 0) | v46 & 1)
        {
          if (v46)
          {
            uint64_t v106 = ACFULogging::getLogInstance(v90);
            ACFULogging::handleMessage((uint64_t)v106, 0, "%s::%s: removing any personalized bits of bundle firmware\n", v107, v108, v109, v110, v111, (char)"ACFURestoreHost");
            uint64_t v112 = *((void *)this + 17);
            if (v112 != *((void *)this + 18))
            {
              while (1)
              {
                uint64_t v113 = (ACFUCommon *)CFDictionaryGetValue(Mutable, *(const void **)v112);
                if (v113 || !*(unsigned char *)(v112 + 8))
                {
                  if ((ACFUCommon::removeFileWithURL(v113, v114) & 1) == 0)
                  {
                    std::string::basic_string[abi:ne180100]<0>(v222, "copyFirmware: failed to remove bundle fw personalized bits");
                    uint64_t v151 = (ACFULogging *)ACFUError::addError((uint64_t)this + 24, (uint64_t)v222, 0x3ECuLL, 0);
                    uint64_t v152 = "%s::%s: failed to remove bundle fw personalized bits\n";
                    if (v223 < 0)
                    {
                      uint64_t v153 = (void **)v222;
                      goto LABEL_171;
                    }
                    goto LABEL_172;
                  }
                }
                else
                {
                  uint64_t v115 = ACFULogging::getLogInstance(0);
                  uint64_t v116 = (std::string *)std::string::basic_string[abi:ne180100]<0>(&v249, "ACFURestoreHost");
                  uint64_t v117 = std::string::append(v116, "::");
                  long long v118 = *(_OWORD *)&v117->__r_.__value_.__l.__data_;
                  v250.__r_.__value_.__r.__words[2] = v117->__r_.__value_.__r.__words[2];
                  *(_OWORD *)&v250.__r_.__value_.__l.__data_ = v118;
                  v117->__r_.__value_.__l.__size_ = 0;
                  v117->__r_.__value_.__r.__words[2] = 0;
                  v117->__r_.__value_.__r.__words[0] = 0;
                  uint64_t v119 = std::string::append(&v250, "copyFirmware");
                  long long v120 = *(_OWORD *)&v119->__r_.__value_.__l.__data_;
                  v251.__r_.__value_.__r.__words[2] = v119->__r_.__value_.__r.__words[2];
                  *(_OWORD *)&v251.__r_.__value_.__l.__data_ = v120;
                  v119->__r_.__value_.__l.__size_ = 0;
                  v119->__r_.__value_.__r.__words[2] = 0;
                  v119->__r_.__value_.__r.__words[0] = 0;
                  ACFULogging::handleMessageCFType((uint64_t)v115, (uint64_t *)&v251, 0, (uint64_t)"skipping removal of optional file...", *(void *)v112);
                  if (SHIBYTE(v251.__r_.__value_.__r.__words[2]) < 0) {
                    operator delete(v251.__r_.__value_.__l.__data_);
                  }
                  if (SHIBYTE(v250.__r_.__value_.__r.__words[2]) < 0) {
                    operator delete(v250.__r_.__value_.__l.__data_);
                  }
                  if (SHIBYTE(v249.__r_.__value_.__r.__words[2]) < 0) {
                    operator delete(v249.__r_.__value_.__l.__data_);
                  }
                }
                v112 += 16;
                if (v112 == *((void *)this + 18)) {
                  goto LABEL_162;
                }
              }
            }
          }
          goto LABEL_162;
        }
        uint64_t v121 = ACFULogging::getLogInstance(v90);
        ACFULogging::handleMessage((uint64_t)v121, 0, "%s::%s: copying preflighted bundle firmware into the dst bundle...\n", v122, v123, v124, v125, v126, (char)"ACFURestoreHost");
        uint64_t v128 = *((void *)this + 17);
        if (v128 == *((void *)this + 18)) {
          goto LABEL_162;
        }
        while (1)
        {
          CFStringRef v129 = (const __CFString *)ACFURestoreHost::getPathFromBuildID(*((ACFURestoreHost **)this + 2), *(const __CFDictionary **)v128, v127);
          ACFUCommon::stringFromCFString(*(const __CFString **)v128, &v251);
          if (SHIBYTE(v251.__r_.__value_.__r.__words[2]) < 0)
          {
            if (v251.__r_.__value_.__l.__size_)
            {
              std::string::__init_copy_ctor_external(&v250, v251.__r_.__value_.__l.__data_, v251.__r_.__value_.__l.__size_);
              goto LABEL_131;
            }
          }
          else if (*((unsigned char *)&v251.__r_.__value_.__s + 23))
          {
            std::string v250 = v251;
            goto LABEL_131;
          }
          uint64_t v130 = (ACFURestoreHost *)std::string::basic_string[abi:ne180100]<0>(&v250, "UNDEF");
LABEL_131:
          if (SHIBYTE(v251.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v251.__r_.__value_.__l.__data_);
          }
          std::string v251 = v250;
          if (v129)
          {
            if (!ACFURestoreHost::copyToPersonalizedBundlePath(v130, *((CFDictionaryRef *)this + 2), v129, v30))
            {
              int v131 = 0;
              goto LABEL_148;
            }
            std::string::basic_string[abi:ne180100]<0>(v224, "copyFirmware: failed to perform destination bundle copy of rooted firmware");
            unsigned int v144 = (ACFULogging *)ACFUError::addError((uint64_t)this + 24, (uint64_t)v224, 0xFA3uLL, 0);
            if (v225 < 0) {
              operator delete(v224[0]);
            }
            uint64_t v145 = ACFULogging::getLogInstance(v144);
            ACFULogging::handleMessage((uint64_t)v145, 2u, "%s::%s: failed to perform destination bundle copy of rooted firmware\n", v146, v147, v148, v149, v150, (char)"ACFURestoreHost");
            goto LABEL_147;
          }
          if (!*(unsigned char *)(v128 + 8))
          {
            std::string::basic_string[abi:ne180100]<0>(v226, "copyFirmware: failed to find FW in personalized path");
            uint64_t v137 = (ACFULogging *)ACFUError::addError((uint64_t)this + 24, (uint64_t)v226, 0xFA1uLL, 0);
            if (v227 < 0) {
              operator delete(v226[0]);
            }
            uint64_t v138 = ACFULogging::getLogInstance(v137);
            ACFULogging::handleMessage((uint64_t)v138, 2u, "%s::%s: failed to find FW (%s) in build ID in personalized path\n", v139, v140, v141, v142, v143, (char)"ACFURestoreHost");
LABEL_147:
            int v131 = 4;
            goto LABEL_148;
          }
          char v132 = ACFULogging::getLogInstance(v130);
          std::string::basic_string[abi:ne180100]<0>(&cf, "ACFURestoreHost");
          uint64_t v133 = std::string::append(&cf, "::");
          long long v134 = *(_OWORD *)&v133->__r_.__value_.__l.__data_;
          v249.__r_.__value_.__r.__words[2] = v133->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v249.__r_.__value_.__l.__data_ = v134;
          v133->__r_.__value_.__l.__size_ = 0;
          v133->__r_.__value_.__r.__words[2] = 0;
          v133->__r_.__value_.__r.__words[0] = 0;
          uint64_t v135 = std::string::append(&v249, "copyFirmware");
          long long v136 = *(_OWORD *)&v135->__r_.__value_.__l.__data_;
          v250.__r_.__value_.__r.__words[2] = v135->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v250.__r_.__value_.__l.__data_ = v136;
          v135->__r_.__value_.__l.__size_ = 0;
          v135->__r_.__value_.__r.__words[2] = 0;
          v135->__r_.__value_.__r.__words[0] = 0;
          ACFULogging::handleMessageCFType((uint64_t)v132, (uint64_t *)&v250, 0, (uint64_t)"skipping copying of optional file...", *(void *)v128);
          if (SHIBYTE(v250.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v250.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v249.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v249.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(cf.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(cf.__r_.__value_.__l.__data_);
          }
          int v131 = 48;
LABEL_148:
          if (SHIBYTE(v251.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(v251.__r_.__value_.__l.__data_);
            if (v131)
            {
LABEL_152:
              if (v131 != 48) {
                goto LABEL_162;
              }
            }
          }
          else if (v131)
          {
            goto LABEL_152;
          }
          v128 += 16;
          if (v128 == *((void *)this + 18)) {
            goto LABEL_162;
          }
        }
      }
      v199 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v199, 2u, "%s::%s: failed to allocate source bundle firmware path dictionary (type: %hhu)\n", v200, v201, v202, v203, v204, (char)"ACFURestoreHost");
    }
    else
    {
      v193 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v193, 2u, "%s::%s: failed to allocate bundle firmware path dictionary (type: %hhu)\n", v194, v195, v196, v197, v198, (char)"ACFURestoreHost");
    }
    CFDataRef v30 = 0;
    goto LABEL_185;
  }
  ACFULogging::handleMessage((uint64_t)v15, 0, "%s::%s: running device invoked restore info -- using bundleData\n", v16, v17, v18, v19, v20, (char)"ACFURestoreHost");
  uint64_t v21 = (ACFULogging *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 2), @"BundleDataDict");
  if (v21
    && (v22 = v21, CFTypeID v23 = CFDictionaryGetTypeID(), v21 = (ACFULogging *)CFGetTypeID(v22), (ACFULogging *)v23 == v21))
  {
    MutableCFArrayRef Copy = CFDictionaryCreateMutableCopy(v2, 0, v22);
    if (MutableCopy)
    {
      uint64_t v25 = MutableCopy;
      uint64_t v26 = CFDictionaryGetValue(*((CFDictionaryRef *)this + 2), @"FirmwareData");
      if (v26)
      {
        uint64_t v27 = v26;
        CFTypeID v28 = CFDataGetTypeID();
        if (v28 == CFGetTypeID(v27)) {
          CFDictionarySetValue(v25, *((const void **)this + 1), v27);
        }
      }
      uint64_t v29 = (*(uint64_t (**)(ACFURestoreHost *, __CFDictionary *, uint64_t))(*(void *)this + 40))(this, v25, 1);
      if (v29)
      {
        CFDataRef v30 = (const __CFData *)v29;
        CFMutableArrayRef Mutable = 0;
LABEL_18:
        CFStringRef v32 = v4;
LABEL_163:
        CFRelease(v32);
        goto LABEL_164;
      }
      std::string::basic_string[abi:ne180100]<0>(v247, "copyFirmware: updater failed to find firmware data with bundleData");
      uint64_t v186 = (ACFULogging *)ACFUError::addError((uint64_t)this + 24, (uint64_t)v247, 0xFA0uLL, 0);
      if (v248 < 0) {
        operator delete(v247[0]);
      }
      v187 = ACFULogging::getLogInstance(v186);
      ACFULogging::handleMessage((uint64_t)v187, 2u, "%s::%s: updater failed to find firmware data with bundleData\n", v188, v189, v190, v191, v192, (char)"ACFURestoreHost");
      CFMutableArrayRef Mutable = 0;
LABEL_181:
      CFDataRef v30 = 0;
      goto LABEL_18;
    }
    uint64_t v180 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v180, 2u, "%s::%s: failed to create mutable copy of source device firmware data dictionary (type: %hhu)\n", v181, v182, v183, v184, v185, (char)"ACFURestoreHost");
  }
  else
  {
    uint64_t v155 = ACFULogging::getLogInstance(v21);
    ACFULogging::handleMessage((uint64_t)v155, 2u, "%s::%s: failed due to incompatible bundle data dictionary\n", v156, v157, v158, v159, v160, (char)"ACFURestoreHost");
  }
  CFDataRef v30 = 0;
  CFMutableArrayRef Mutable = 0;
LABEL_185:
  uint64_t v25 = (__CFDictionary *)v4;
LABEL_164:
  CFRelease(v25);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v30;
}

void sub_22EF1B718(_Unwind_Exception *a1)
{
  if (*(char *)(v1 - 225) < 0) {
    operator delete(*(void **)(v1 - 248));
  }
  _Unwind_Resume(a1);
}

const void *ACFURestoreHost::getPathFromBuildID(ACFURestoreHost *this, const __CFDictionary *a2, const __CFString *a3)
{
  CFStringRef v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@.%@.%@.%@", @"BuildIdentity", a2, @"Info", @"Path");
  if (v3)
  {
    CFStringRef v4 = v3;
    ValueForKeyPathInDict = (const void *)AMSupportGetValueForKeyPathInDict();
    if (ValueForKeyPathInDict)
    {
      CFTypeID TypeID = CFStringGetTypeID();
      uint64_t v7 = (ACFULogging *)CFGetTypeID(ValueForKeyPathInDict);
      if ((ACFULogging *)TypeID != v7)
      {
        LogInstance = ACFULogging::getLogInstance(v7);
        CFGetTypeID(ValueForKeyPathInDict);
        ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: path has wrong type %lu\n", v22, v23, v24, v25, v26, (char)"ACFURestoreHost");
      }
    }
    else
    {
      uint64_t v15 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v15, 2u, "%s::%s: failed to get dict entry\n", v16, v17, v18, v19, v20, (char)"ACFURestoreHost");
    }
    CFRelease(v4);
  }
  else
  {
    uint64_t v9 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v9, 2u, "%s::%s: failed to create build ID key path\n", v10, v11, v12, v13, v14, (char)"ACFURestoreHost");
    return 0;
  }
  return ValueForKeyPathInDict;
}

uint64_t ACFURestoreHost::copyToPersonalizedBundlePath(ACFURestoreHost *this, CFDictionaryRef theDict, const __CFString *a3, const __CFData *a4)
{
  uint64_t Value = (ACFULogging *)CFDictionaryGetValue(theDict, @"DestBundlePath");
  if (Value && (CFArrayRef v5 = Value, v6 = CFURLGetTypeID(), Value = (ACFULogging *)CFGetTypeID(v5), (ACFULogging *)v6 == Value))
  {
    uint64_t v7 = (ACFULogging *)AMSupportCopyURLWithAppendedComponent();
    if (v7)
    {
      LogInstance = ACFULogging::getLogInstance(v7);
      ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to create destination path URL (status: %d)\n", v27, v28, v29, v30, v31, (char)"ACFURestoreHost");
      return 4000;
    }
    CFTypeID v8 = (ACFULogging *)MEMORY[0x230FAE6D0](0);
    if (v8)
    {
      CFStringRef v32 = ACFULogging::getLogInstance(v8);
      ACFULogging::handleMessage((uint64_t)v32, 2u, "%s::%s: failed to create directory @ dstPathURL (status: %d)\n", v33, v34, v35, v36, v37, (char)"ACFURestoreHost");
      return 1003;
    }
    uint64_t v9 = (ACFULogging *)AMSupportWriteDataToFileURL();
    if (v9)
    {
      CFStringRef v38 = ACFULogging::getLogInstance(v9);
      ACFULogging::handleMessage((uint64_t)v38, 2u, "%s::%s: failed to copy data to dstPathURL (status: %d)\n", v39, v40, v41, v42, v43, (char)"ACFURestoreHost");
      return 1004;
    }
    BOOL doesPathExist = ACFUCommon::doesPathExist(0, v10);
    if (!doesPathExist)
    {
      uint64_t v12 = ACFULogging::getLogInstance((ACFULogging *)doesPathExist);
      ACFULogging::handleMessage((uint64_t)v12, 2u, "%s::%s: destination path does not exist after creation attempt (status: %d)\n", v13, v14, v15, v16, v17, (char)"ACFURestoreHost");
      return 1004;
    }
  }
  else
  {
    uint64_t v18 = ACFULogging::getLogInstance(Value);
    ACFULogging::handleMessage((uint64_t)v18, 0, "%s::%s: destination bundle was not specified, so we are skipping the copy step...\n", v19, v20, v21, v22, v23, (char)"ACFURestoreHost");
  }
  return 0;
}

__CFDictionary *ACFURestoreHost::createRequest(uint64_t a1, CFDictionaryRef **a2, uint64_t a3)
{
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    std::string::basic_string[abi:ne180100]<0>(v245, "createRequest: Failed to allocate output dictionary");
    uint64_t v161 = (ACFUError *)(a1 + 24);
    uint64_t v162 = (ACFULogging *)ACFUError::addError((uint64_t)v161, (uint64_t)v245, 0xFA0uLL, 0);
    if (v246 < 0) {
      operator delete(v245[0]);
    }
    LogInstance = ACFULogging::getLogInstance(v162);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: Failed to allocate output dictionary\n", v164, v165, v166, v167, v168, (char)"ACFURestoreHost");
    ACFUError::hasError(v161);
    return 0;
  }
  uint64_t v7 = Mutable;
  CFTypeID v8 = *(const void ***)(a1 + 88);
  if (v8 != *(const void ***)(a1 + 96))
  {
    uint64_t v9 = (const void *)*MEMORY[0x263EFFB40];
    do
    {
      CFURLRef v10 = *v8++;
      CFDictionaryAddValue(v7, v10, v9);
    }
    while (v8 != *(const void ***)(a1 + 96));
  }
  ACFUCommon::parseDebugArgs(*(ACFUCommon **)(a1 + 16), (const __CFDictionary *)"validateDeviceId", &__s);
  std::string::size_type v12 = __s.__r_.__value_.__r.__words[0];
  if (!__s.__r_.__value_.__r.__words[0])
  {
    uint64_t v13 = ACFULogging::getLogInstance(v11);
    ACFULogging::handleMessage((uint64_t)v13, 0, "%s::%s: skipping device identity validation against build identity\n", v14, v15, v16, v17, v18, (char)"ACFURestoreHost");
  }
  uint64_t v19 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"BuildIdentity");
  if (!v19 || (uint64_t v20 = v19, TypeID = CFDictionaryGetTypeID(), TypeID != CFGetTypeID(v20)))
  {
    std::string::basic_string[abi:ne180100]<0>(v243, "createRequest: Failed to get build identity dict from options");
    uint64_t v153 = (ACFULogging *)ACFUError::addError(a1 + 24, (uint64_t)v243, 0xFA1uLL, 0);
    if (v244 < 0)
    {
      uint64_t v154 = (void *)v243[0];
LABEL_126:
      operator delete(v154);
    }
LABEL_127:
    uint64_t v155 = ACFULogging::getLogInstance(v153);
    ACFULogging::handleMessage((uint64_t)v155, 2u, "%s::%s: failed to get build identity dict from options\n", v156, v157, v158, v159, v160, (char)"ACFURestoreHost");
    goto LABEL_118;
  }
  uint64_t v22 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"DeviceInfo");
  if (!v22 || (uint64_t v23 = v22, v24 = CFDictionaryGetTypeID(), v24 != CFGetTypeID(v23)))
  {
    std::string::basic_string[abi:ne180100]<0>(v241, "createRequest: Failed to get build identity dict from options");
    uint64_t v153 = (ACFULogging *)ACFUError::addError(a1 + 24, (uint64_t)v241, 0xFA1uLL, 0);
    if (v242 < 0)
    {
      uint64_t v154 = (void *)v241[0];
      goto LABEL_126;
    }
    goto LABEL_127;
  }
  if (v12
    && (std::map<__CFString const*,unsigned long>::map[abi:ne180100](v240, a1 + 160),
        char v25 = ACFURestoreHost::validateDeviceInfoAgainstBuildIdentity((const __CFString ***)(a1 + 64), (const __CFString ***)(a1 + 40), (const __CFDictionary *)v23, (const __CFDictionary *)v20, (uint64_t)v240), std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy((uint64_t)v240, (void *)v240[1]), (v25 & 1) == 0))
  {
    std::string::basic_string[abi:ne180100]<0>(v238, "createRequest: Failed to validate device identity tags");
    uint64_t v183 = (ACFULogging *)ACFUError::addError(a1 + 24, (uint64_t)v238, 0xFA9uLL, 0);
    if (v239 < 0) {
      operator delete(v238[0]);
    }
    uint64_t v184 = ACFULogging::getLogInstance(v183);
    ACFULogging::handleMessage((uint64_t)v184, 2u, "%s::%s: failed to validate device identity tags\n", v185, v186, v187, v188, v189, (char)"ACFURestoreHost");
  }
  else
  {
    std::map<__CFString const*,unsigned long>::map[abi:ne180100](v237, a1 + 160);
    char v26 = ACFURestoreHost::populateDictFromIdentity((unint64_t **)(a1 + 40), (uint64_t)v237, (CFDictionaryRef)v20, v7);
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy((uint64_t)v237, (void *)v237[1]);
    if (v26)
    {
      std::map<__CFString const*,unsigned long>::map[abi:ne180100](v234, a1 + 160);
      char v27 = ACFURestoreHost::populateDictFromIdentity((unint64_t **)(a1 + 64), (uint64_t)v234, (CFDictionaryRef)v23, v7);
      std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy((uint64_t)v234, (void *)v234[1]);
      if (v27)
      {
        if (*(void *)a3)
        {
          uint64_t v29 = (void *)CFDictionaryGetValue((CFDictionaryRef)v23, *(const void **)a3);
          if (!v29 || (v30 = v29, v31 = CFDataGetTypeID(), CFTypeID v28 = CFGetTypeID(v30), v31 != v28))
          {
            std::string::basic_string[abi:ne180100]<0>(__p, "createRequest: Production mode not present in device info. This is fatal!");
            CFStringRef v32 = (ACFULogging *)ACFUError::addError(a1 + 24, (uint64_t)__p, 0xFA1uLL, 0);
            if (v231 < 0) {
              operator delete(__p[0]);
            }
            uint64_t v33 = ACFULogging::getLogInstance(v32);
            ACFULogging::handleMessage((uint64_t)v33, 2u, "%s::%s: production mode not present in device info. This is fatal!\n", v34, v35, v36, v37, v38, (char)"ACFURestoreHost");
            goto LABEL_118;
          }
        }
        else
        {
          uint64_t v30 = 0;
        }
        uint64_t v39 = *(const void **)(a3 + 8);
        if (v39)
        {
          uint64_t v40 = (void *)CFDictionaryGetValue((CFDictionaryRef)v23, v39);
          if (!v40 || (v41 = v40, v42 = CFDataGetTypeID(), CFTypeID v28 = CFGetTypeID(v41), v42 != v28))
          {
            std::string::basic_string[abi:ne180100]<0>(v228, "createRequest: Security mode not present in device info. This is fatal!");
            uint64_t v43 = (ACFULogging *)ACFUError::addError(a1 + 24, (uint64_t)v228, 0xFA1uLL, 0);
            if (v229 < 0) {
              operator delete(v228[0]);
            }
            std::string v44 = ACFULogging::getLogInstance(v43);
            ACFULogging::handleMessage((uint64_t)v44, 2u, "%s::%s: security mode not present in device info. This is fatal!\n", v45, v46, v47, v48, v49, (char)"ACFURestoreHost");
            goto LABEL_118;
          }
        }
        else
        {
          uint64_t v41 = 0;
        }
        uint64_t v207 = (ACFURestoreHost *)v41;
        uint64_t v208 = (ACFURestoreHost *)v30;
        CFDictionaryRef theDict = (const __CFDictionary *)v23;
        uint64_t v50 = *(void *)(a1 + 136);
        if (v50 != *(void *)(a1 + 144))
        {
          uint64_t v209 = a1 + 200;
          uint64_t v205 = a1 + 24;
          CFNumberRef value = (void *)*MEMORY[0x263EFFB40];
          do
          {
            MeasureDataWithTag = ACFUFirmware::getMeasureDataWithTag(*a2, *(const __CFString **)v50);
            CFDictionaryRef v52 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v20, *(const void **)v50);
            ACFUCommon::stringFromCFString(*(const __CFString **)v50, &__s);
            if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
            {
              if (__s.__r_.__value_.__l.__size_)
              {
                std::string::__init_copy_ctor_external(&v226, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
                goto LABEL_37;
              }
            }
            else if (*((unsigned char *)&__s.__r_.__value_.__s + 23))
            {
              std::string v226 = __s;
              goto LABEL_37;
            }
            long long v53 = (ACFULogging *)std::string::basic_string[abi:ne180100]<0>(&v226, "UNDEF");
LABEL_37:
            if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__s.__r_.__value_.__l.__data_);
            }
            std::string __s = v226;
            if (!v52)
            {
              if (!*(unsigned char *)(v50 + 8) && MeasureDataWithTag)
              {
                std::string::basic_string[abi:ne180100]<0>(v224, "createRequest: could not find FW in build ID");
                uint64_t v57 = (ACFULogging *)ACFUError::addError(v205, (uint64_t)v224, 0x3EDuLL, 0);
                if (v225 < 0) {
                  operator delete(v224[0]);
                }
                uint64_t v58 = ACFULogging::getLogInstance(v57);
                ACFULogging::handleMessage((uint64_t)v58, 2u, "%s::%s: could not find FW (%s) in build ID\n", v59, v60, v61, v62, v63, (char)"ACFURestoreHost");
                goto LABEL_50;
              }
LABEL_51:
              uint64_t v65 = ACFULogging::getLogInstance(v53);
              ACFULogging::handleMessage((uint64_t)v65, 0, "%s::%s: Tag '%s' doesn't exist -- moving along\n", v66, v67, v68, v69, v70, (char)"ACFURestoreHost");
              int v64 = 24;
              goto LABEL_70;
            }
            if (!MeasureDataWithTag) {
              goto LABEL_51;
            }
            uint64_t v54 = CFDictionaryGetValue(v52, @"Trusted");
            long long v55 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            if (!v55)
            {
              std::string::basic_string[abi:ne180100]<0>(v222, "createRequest: failed to allocate internal data structure");
              uint64_t v74 = (ACFULogging *)ACFUError::addError(v205, (uint64_t)v222, 0xFA0uLL, 0);
              if (v223 < 0) {
                operator delete(v222[0]);
              }
              uint64_t v75 = ACFULogging::getLogInstance(v74);
              ACFULogging::handleMessage((uint64_t)v75, 2u, "%s::%s: failed to allocate internal data structure\n", v76, v77, v78, v79, v80, (char)"ACFURestoreHost");
              goto LABEL_50;
            }
            if (*(void *)a3)
            {
              if (*(unsigned char *)(a3 + 16)) {
                BOOL v56 = *(unsigned char *)std::map<__CFString const*,std::string>::at(v209, (unint64_t *)v50) != 0;
              }
              else {
                BOOL v56 = 0;
              }
              ACFURestoreHost::createBoolFromData(v208, (uint64_t)&v226);
              if (v226.__r_.__value_.__s.__data_[8])
              {
                std::string::basic_string[abi:ne180100]<0>(v220, "createRequest: epro data to BOOLean conversion failure");
                uint64_t v81 = (ACFULogging *)ACFUError::addError(v205, (uint64_t)v220, 0x3EDuLL, 0);
                if (v221 < 0) {
                  operator delete(v220[0]);
                }
                uint64_t v82 = ACFULogging::getLogInstance(v81);
                ACFULogging::handleMessage((uint64_t)v82, 2u, "%s::%s: epro data to BOOLean conversion failure\n", v83, v84, v85, v86, v87, (char)"ACFURestoreHost");
                goto LABEL_50;
              }
              if (v56)
              {
                CFDictionaryAddValue(v55, @"DPRO", value);
                uint64_t v71 = (std::string *)MEMORY[0x263EFFB38];
              }
              else
              {
                uint64_t v71 = &v226;
              }
              CFDictionaryAddValue(v55, @"EPRO", v71->__r_.__value_.__l.__data_);
            }
            if (*(void *)(a3 + 8))
            {
              if (*(unsigned char *)(a3 + 17)) {
                BOOL v72 = *((unsigned char *)std::map<__CFString const*,std::string>::at(v209, (unint64_t *)v50) + 1) != 0;
              }
              else {
                BOOL v72 = 0;
              }
              ACFURestoreHost::createBoolFromData(v207, (uint64_t)&v226);
              if (v226.__r_.__value_.__s.__data_[8])
              {
                std::string::basic_string[abi:ne180100]<0>(v218, "createRequest: esec data to BOOLean conversion failure");
                uint64_t v88 = (ACFULogging *)ACFUError::addError(v205, (uint64_t)v218, 0x3EDuLL, 0);
                if (v219 < 0) {
                  operator delete(v218[0]);
                }
                uint64_t v89 = ACFULogging::getLogInstance(v88);
                ACFULogging::handleMessage((uint64_t)v89, 2u, "%s::%s: esec data to BOOLean conversion failure\n", v90, v91, v92, v93, v94, (char)"ACFURestoreHost");
LABEL_50:
                int v64 = 4;
                goto LABEL_70;
              }
              if (v72)
              {
                CFDictionaryAddValue(v55, @"DSEC", value);
                uint64_t v73 = (std::string *)MEMORY[0x263EFFB38];
              }
              else
              {
                uint64_t v73 = &v226;
              }
              CFDictionaryAddValue(v55, @"ESEC", v73->__r_.__value_.__l.__data_);
            }
            CFDictionaryAddValue(v55, @"Digest", MeasureDataWithTag);
            if (v54) {
              CFDictionaryAddValue(v55, @"Trusted", v54);
            }
            CFDictionaryAddValue(v7, *(const void **)v50, v55);
            CFRelease(v55);
            int v64 = 0;
LABEL_70:
            if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
            {
              operator delete(__s.__r_.__value_.__l.__data_);
              if (v64)
              {
LABEL_74:
                if (v64 != 24) {
                  goto LABEL_118;
                }
              }
            }
            else if (v64)
            {
              goto LABEL_74;
            }
            v50 += 16;
          }
          while (v50 != *(void *)(a1 + 144));
        }
        if (!*(void *)(a1 + 184)) {
          goto LABEL_107;
        }
        CFDictionaryRef v95 = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"Options");
        if (v95)
        {
          CFDictionaryRef v96 = v95;
          BOOL v97 = (ACFULogging *)CFDictionaryContainsKey(v95, @"TrustObjectDigest");
          if (v97)
          {
            char v98 = ACFULogging::getLogInstance(v97);
            ACFULogging::handleMessage((uint64_t)v98, 0, "%s::%s: Using FDR trust object hash in updater options override\n", v99, v100, v101, v102, v103, (char)"ACFURestoreHost");
            uint64_t v104 = CFDictionaryGetValue(v96, @"TrustObjectDigest");
            if (!v104
              || (uint64_t v105 = v104,
                  CFTypeID v106 = CFDataGetTypeID(),
                  uint64_t v107 = (ACFULogging *)CFGetTypeID(v105),
                  (ACFULogging *)v106 != v107))
            {
              std::string::basic_string[abi:ne180100]<0>(v216, "createRequest: Invalid FDR trust object hash in updater options override");
              uint64_t v108 = (ACFULogging *)ACFUError::addError(a1 + 24, (uint64_t)v216, 0x3EDuLL, 0);
              if (v217 < 0) {
                operator delete(v216[0]);
              }
              uint64_t v109 = ACFULogging::getLogInstance(v108);
              ACFULogging::handleMessage((uint64_t)v109, 2u, "%s::%s: Invalid FDR trust object hash in updater options override\n", v110, v111, v112, v113, v114, (char)"ACFURestoreHost");
              goto LABEL_118;
            }
            goto LABEL_98;
          }
        }
        uint64_t v115 = (ACFULogging *)CFDictionaryContainsKey(theDict, @"ACFU,FDRTrustObjectHash");
        int v116 = (int)v115;
        uint64_t v117 = ACFULogging::getLogInstance(v115);
        if (v116)
        {
          ACFULogging::handleMessage((uint64_t)v117, 0, "%s::%s: Using FDR trust object hash in client updater override\n", v118, v119, v120, v121, v122, (char)"ACFURestoreHost");
          uint64_t v123 = CFDictionaryGetValue(theDict, @"ACFU,FDRTrustObjectHash");
          if (v123)
          {
            uint64_t v105 = v123;
            CFTypeID v124 = CFDataGetTypeID();
            uint64_t v107 = (ACFULogging *)CFGetTypeID(v105);
            if ((ACFULogging *)v124 == v107)
            {
LABEL_98:
              uint64_t v125 = ACFULogging::getLogInstance(v107);
              ACFULogging::handleMessage((uint64_t)v125, 0, "%s::%s: Applying FDR trust object hash override\n", v126, v127, v128, v129, v130, (char)"ACFURestoreHost");
              CFDictionarySetValue(v7, *(const void **)(a1 + 184), v105);
LABEL_101:
              long long v134 = ACFULogging::getLogInstance(v131);
              std::string::basic_string[abi:ne180100]<0>(&v211, "ACFURestoreHost");
              uint64_t v135 = std::string::append(&v211, "::");
              long long v136 = *(_OWORD *)&v135->__r_.__value_.__l.__data_;
              v226.__r_.__value_.__r.__words[2] = v135->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v226.__r_.__value_.__l.__data_ = v136;
              v135->__r_.__value_.__l.__size_ = 0;
              v135->__r_.__value_.__r.__words[2] = 0;
              v135->__r_.__value_.__r.__words[0] = 0;
              uint64_t v137 = std::string::append(&v226, "createRequest");
              long long v138 = *(_OWORD *)&v137->__r_.__value_.__l.__data_;
              __s.__r_.__value_.__r.__words[2] = v137->__r_.__value_.__r.__words[2];
              *(_OWORD *)&__s.__r_.__value_.__l.__data_ = v138;
              v137->__r_.__value_.__l.__size_ = 0;
              v137->__r_.__value_.__r.__words[2] = 0;
              v137->__r_.__value_.__r.__words[0] = 0;
              ACFULogging::handleMessageCFType((uint64_t)v134, (uint64_t *)&__s, 4, (uint64_t)"FDR Trust Object Digest: ", (uint64_t)v105);
              if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__s.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v226.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v226.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v211.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v211.__r_.__value_.__l.__data_);
              }
LABEL_107:
              if (*(void *)(a1 + 192))
              {
                CFTypeID v28 = (CFTypeID)CFDictionaryGetValue(theDict, @"ACFU,FDRAllowUnsealed");
                if (v28)
                {
                  CFBooleanRef v139 = (const __CFBoolean *)v28;
                  CFTypeID v140 = CFGetTypeID((CFTypeRef)v28);
                  CFTypeID v28 = CFBooleanGetTypeID();
                  if (v140 == v28)
                  {
                    CFTypeID v28 = CFBooleanGetValue(v139);
                    if (v28)
                    {
                      uint64_t v141 = ACFULogging::getLogInstance((ACFULogging *)v28);
                      ACFULogging::handleMessage((uint64_t)v141, 0, "%s::%s: allowing unsealed FDR data\n", v142, v143, v144, v145, v146, (char)"ACFURestoreHost");
                      CFDictionaryAddValue(v7, *(const void **)(a1 + 192), (const void *)*MEMORY[0x263EFFB40]);
                    }
                  }
                }
              }
              uint64_t v147 = ACFULogging::getLogInstance((ACFULogging *)v28);
              std::string::basic_string[abi:ne180100]<0>(&v211, "ACFURestoreHost");
              uint64_t v148 = std::string::append(&v211, "::");
              long long v149 = *(_OWORD *)&v148->__r_.__value_.__l.__data_;
              v226.__r_.__value_.__r.__words[2] = v148->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v226.__r_.__value_.__l.__data_ = v149;
              v148->__r_.__value_.__l.__size_ = 0;
              v148->__r_.__value_.__r.__words[2] = 0;
              v148->__r_.__value_.__r.__words[0] = 0;
              uint64_t v150 = std::string::append(&v226, "createRequest");
              long long v151 = *(_OWORD *)&v150->__r_.__value_.__l.__data_;
              __s.__r_.__value_.__r.__words[2] = v150->__r_.__value_.__r.__words[2];
              *(_OWORD *)&__s.__r_.__value_.__l.__data_ = v151;
              v150->__r_.__value_.__l.__size_ = 0;
              v150->__r_.__value_.__r.__words[2] = 0;
              v150->__r_.__value_.__r.__words[0] = 0;
              ACFULogging::handleMessageCFType((uint64_t)v147, (uint64_t *)&__s, 0, (uint64_t)"Request Dictionary:", (uint64_t)v7);
              if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__s.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v226.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v226.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v211.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v211.__r_.__value_.__l.__data_);
              }
              goto LABEL_118;
            }
          }
          std::string::basic_string[abi:ne180100]<0>(v214, "createRequest: Invalid FDR trust object hash in client updater override");
          uint64_t v190 = (ACFULogging *)ACFUError::addError(a1 + 24, (uint64_t)v214, 0x3EDuLL, 0);
          if (v215 < 0) {
            operator delete(v214[0]);
          }
          uint64_t v191 = ACFULogging::getLogInstance(v190);
          ACFULogging::handleMessage((uint64_t)v191, 2u, "%s::%s: Invalid FDR trust object hash in client updater override\n", v192, v193, v194, v195, v196, (char)"ACFURestoreHost");
        }
        else
        {
          ACFULogging::handleMessage((uint64_t)v117, 0, "%s::%s: Requesting FDR trust object hash\n", v118, v119, v120, v121, v122, (char)"ACFURestoreHost");
          CFMutableDataRef v132 = CFDataCreateMutable(allocator, 0);
          if (v132)
          {
            CFMutableDataRef v133 = v132;
            CFDictionarySetValue(v7, *(const void **)(a1 + 184), v132);
            CFRelease(v133);
            uint64_t v105 = 0;
            goto LABEL_101;
          }
          std::string::basic_string[abi:ne180100]<0>(v212, "createRequest: Failed to create empty trust object hash");
          uint64_t v197 = (ACFULogging *)ACFUError::addError(a1 + 24, (uint64_t)v212, 0xFA0uLL, 0);
          if (v213 < 0) {
            operator delete(v212[0]);
          }
          uint64_t v198 = ACFULogging::getLogInstance(v197);
          ACFULogging::handleMessage((uint64_t)v198, 2u, "%s::%s: Failed to create empty trust object hash\n", v199, v200, v201, v202, v203, (char)"ACFURestoreHost");
        }
      }
      else
      {
        std::string::basic_string[abi:ne180100]<0>(v232, "createRequest: Failed to build parameters out of device identity");
        uint64_t v176 = (ACFULogging *)ACFUError::addError(a1 + 24, (uint64_t)v232, 0xFA4uLL, 0);
        if (v233 < 0) {
          operator delete(v232[0]);
        }
        uint64_t v177 = ACFULogging::getLogInstance(v176);
        ACFULogging::handleMessage((uint64_t)v177, 2u, "%s::%s: failed to build parameters out of device identity\n", v178, v179, v180, v181, v182, (char)"ACFURestoreHost");
      }
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(v235, "createRequest: Failed to build parameters out of build identity");
      uint64_t v169 = (ACFULogging *)ACFUError::addError(a1 + 24, (uint64_t)v235, 0xFA4uLL, 0);
      if (v236 < 0) {
        operator delete(v235[0]);
      }
      uint64_t v170 = ACFULogging::getLogInstance(v169);
      ACFULogging::handleMessage((uint64_t)v170, 2u, "%s::%s: failed to build parameters out of build identity\n", v171, v172, v173, v174, v175, (char)"ACFURestoreHost");
    }
  }
LABEL_118:
  if (ACFUError::hasError((ACFUError *)(a1 + 24)))
  {
    CFRelease(v7);
    return 0;
  }
  return v7;
}

void sub_22EF1CA3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a27 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t ACFURestoreHost::validateDeviceInfoAgainstBuildIdentity(const __CFString ***a1, const __CFString ***a2, const __CFDictionary *a3, const __CFDictionary *a4, uint64_t a5)
{
  CFArrayRef v5 = *a1;
  char v98 = a1[1];
  if (*a1 == v98)
  {
    char v30 = 1;
    return v30 & 1;
  }
  uint64_t v6 = a5;
  CFDictionaryRef v7 = a4;
  CFDictionaryRef v8 = a3;
  CFTypeRef cf2 = 0;
  std::string cf = 0;
  BOOL v97 = (void *)(a5 + 8);
  while (1)
  {
    uint64_t v11 = *a2;
    CFURLRef v10 = a2[1];
    if (*a2 != v10)
    {
      while (*v11 != *v5)
      {
        if (++v11 == v10)
        {
          uint64_t v11 = a2[1];
          break;
        }
      }
    }
    if (v11 == v10) {
      goto LABEL_30;
    }
    ACFUCommon::stringFromCFString(*v5, &v103);
    uint64_t Value = (__CFString *)CFDictionaryGetValue(v8, *v5);
    if (!Value)
    {
      LogInstance = ACFULogging::getLogInstance(0);
      char v27 = "%s::%s: tag '%s' not found in device info, skipping validation\n";
      goto LABEL_24;
    }
    uint64_t v13 = (ACFULogging *)CFDictionaryGetValue(v7, *v5);
    uint64_t v14 = (__CFString *)v13;
    if (!v13)
    {
      LogInstance = ACFULogging::getLogInstance(0);
      char v27 = "%s::%s: tag '%s' not found in build identity, skipping validation\n";
      goto LABEL_24;
    }
    uint64_t v15 = (void *)*v97;
    if (!*v97) {
      goto LABEL_21;
    }
    CFStringRef v16 = *v5;
    uint64_t v17 = v97;
    do
    {
      unint64_t v18 = v15[4];
      BOOL v19 = v18 >= (unint64_t)v16;
      if (v18 >= (unint64_t)v16) {
        uint64_t v20 = v15;
      }
      else {
        uint64_t v20 = v15 + 1;
      }
      if (v19) {
        uint64_t v17 = v15;
      }
      uint64_t v15 = (void *)*v20;
    }
    while (*v20);
    if (v17 == v97 || (unint64_t)v16 < v17[4])
    {
LABEL_21:
      LogInstance = ACFULogging::getLogInstance(v13);
      char v27 = "%s::%s: tag '%s' not found in tss-request map, skipping validation\n";
LABEL_24:
      int v28 = 3;
      ACFULogging::handleMessage((uint64_t)LogInstance, 3u, v27, v22, v23, v24, v25, v26, (char)"ACFURestoreHost");
      char v29 = 0;
      goto LABEL_25;
    }
    CFTypeID v31 = (ACFUCommon *)CFGetTypeID(Value);
    uint64_t v94 = (ACFUCommon *)CFGetTypeID(v14);
    CFStringRef v32 = (ACFULogging *)std::map<__CFString const*,std::string>::at(v6, (unint64_t *)v5);
    uint64_t v33 = *(ACFUCommon **)v32;
    uint64_t v34 = ACFULogging::getLogInstance(v32);
    ACFUCommon::cfTypeDescription(v31, 1, &v101);
    ACFUCommon::cfTypeDescription(v33, 1, &__p);
    ACFULogging::handleMessage((uint64_t)v34, 4u, "%s::%s: attempting to convert tag '%s' from device info type (%s) to tss-request map type (%s)\n", v35, v36, v37, v38, v39, (char)"ACFURestoreHost");
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v102) < 0)
    {
      operator delete((void *)v101);
      if (!cf) {
        goto LABEL_39;
      }
LABEL_38:
      CFRelease(cf);
      goto LABEL_39;
    }
    if (cf) {
      goto LABEL_38;
    }
LABEL_39:
    uint64_t v40 = (ACFULogging *)ACFURestoreHost::convertCFType(Value, v33);
    std::string cf = v40;
    if (v40)
    {
      uint64_t v41 = ACFULogging::getLogInstance(v40);
      ACFUCommon::cfTypeDescription(v94, 1, &v101);
      ACFUCommon::cfTypeDescription(v33, 1, &__p);
      ACFULogging::handleMessage((uint64_t)v41, 4u, "%s::%s: attempting to convert tag '%s' from build identity type (%s) to tss-request map type (%s)\n", v42, v43, v44, v45, v46, (char)"ACFURestoreHost");
      CFDictionaryRef v7 = a4;
      uint64_t v6 = a5;
      CFDictionaryRef v8 = a3;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v102) < 0) {
        operator delete((void *)v101);
      }
      if (cf2) {
        CFRelease(cf2);
      }
      CFTypeRef cf2 = ACFURestoreHost::convertCFType(v14, v33);
      if (cf2)
      {
        uint64_t v47 = (ACFULogging *)CFEqual(cf, cf2);
        if (v47)
        {
          int v28 = 0;
          char v29 = 1;
          goto LABEL_25;
        }
        uint64_t v60 = ACFULogging::getLogInstance(v47);
        ACFULogging::handleMessage((uint64_t)v60, 2u, "%s::%s: tag '%s' has different values in device info and build identity\n", v61, v62, v63, v64, v65, (char)"ACFURestoreHost");
        uint64_t v67 = ACFULogging::getLogInstance(v66);
        std::string::basic_string[abi:ne180100]<0>(&v99, "ACFURestoreHost");
        uint64_t v68 = std::string::append(&v99, "::");
        long long v69 = *(_OWORD *)&v68->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = v68->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v69;
        v68->__r_.__value_.__l.__size_ = 0;
        v68->__r_.__value_.__r.__words[2] = 0;
        v68->__r_.__value_.__r.__words[0] = 0;
        uint64_t v70 = std::string::append(&__p, "validateDeviceInfoAgainstBuildIdentity");
        long long v71 = *(_OWORD *)&v70->__r_.__value_.__l.__data_;
        std::string::size_type v102 = v70->__r_.__value_.__r.__words[2];
        long long v101 = v71;
        v70->__r_.__value_.__l.__size_ = 0;
        v70->__r_.__value_.__r.__words[2] = 0;
        v70->__r_.__value_.__r.__words[0] = 0;
        ACFULogging::handleMessageCFType((uint64_t)v67, (uint64_t *)&v101, 2, (uint64_t)"device info value: ", (uint64_t)Value);
        if (SHIBYTE(v102) < 0) {
          operator delete((void *)v101);
        }
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v99.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v99.__r_.__value_.__l.__data_);
        }
        uint64_t v73 = ACFULogging::getLogInstance(v72);
        std::string::basic_string[abi:ne180100]<0>(&v99, "ACFURestoreHost");
        uint64_t v74 = std::string::append(&v99, "::");
        long long v75 = *(_OWORD *)&v74->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = v74->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v75;
        v74->__r_.__value_.__l.__size_ = 0;
        v74->__r_.__value_.__r.__words[2] = 0;
        v74->__r_.__value_.__r.__words[0] = 0;
        uint64_t v76 = std::string::append(&__p, "validateDeviceInfoAgainstBuildIdentity");
        long long v77 = *(_OWORD *)&v76->__r_.__value_.__l.__data_;
        std::string::size_type v102 = v76->__r_.__value_.__r.__words[2];
        long long v101 = v77;
        v76->__r_.__value_.__l.__size_ = 0;
        v76->__r_.__value_.__r.__words[2] = 0;
        v76->__r_.__value_.__r.__words[0] = 0;
        ACFULogging::handleMessageCFType((uint64_t)v73, (uint64_t *)&v101, 2, (uint64_t)"device info value converted: ", (uint64_t)cf);
        if (SHIBYTE(v102) < 0) {
          operator delete((void *)v101);
        }
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v99.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v99.__r_.__value_.__l.__data_);
        }
        uint64_t v79 = ACFULogging::getLogInstance(v78);
        std::string::basic_string[abi:ne180100]<0>(&v99, "ACFURestoreHost");
        uint64_t v80 = std::string::append(&v99, "::");
        long long v81 = *(_OWORD *)&v80->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = v80->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v81;
        v80->__r_.__value_.__l.__size_ = 0;
        v80->__r_.__value_.__r.__words[2] = 0;
        v80->__r_.__value_.__r.__words[0] = 0;
        uint64_t v82 = std::string::append(&__p, "validateDeviceInfoAgainstBuildIdentity");
        long long v83 = *(_OWORD *)&v82->__r_.__value_.__l.__data_;
        std::string::size_type v102 = v82->__r_.__value_.__r.__words[2];
        long long v101 = v83;
        v82->__r_.__value_.__l.__size_ = 0;
        v82->__r_.__value_.__r.__words[2] = 0;
        v82->__r_.__value_.__r.__words[0] = 0;
        ACFULogging::handleMessageCFType((uint64_t)v79, (uint64_t *)&v101, 2, (uint64_t)"build identity value: ", (uint64_t)v14);
        if (SHIBYTE(v102) < 0) {
          operator delete((void *)v101);
        }
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v99.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v99.__r_.__value_.__l.__data_);
        }
        uint64_t v85 = ACFULogging::getLogInstance(v84);
        std::string::basic_string[abi:ne180100]<0>(&v99, "ACFURestoreHost");
        uint64_t v86 = std::string::append(&v99, "::");
        long long v87 = *(_OWORD *)&v86->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = v86->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v87;
        v86->__r_.__value_.__l.__size_ = 0;
        v86->__r_.__value_.__r.__words[2] = 0;
        v86->__r_.__value_.__r.__words[0] = 0;
        uint64_t v88 = std::string::append(&__p, "validateDeviceInfoAgainstBuildIdentity");
        long long v89 = *(_OWORD *)&v88->__r_.__value_.__l.__data_;
        std::string::size_type v102 = v88->__r_.__value_.__r.__words[2];
        long long v101 = v89;
        v88->__r_.__value_.__l.__size_ = 0;
        v88->__r_.__value_.__r.__words[2] = 0;
        v88->__r_.__value_.__r.__words[0] = 0;
        ACFULogging::handleMessageCFType((uint64_t)v85, (uint64_t *)&v101, 2, (uint64_t)"build identity value converted: ", (uint64_t)cf2);
        if (SHIBYTE(v102) < 0) {
          operator delete((void *)v101);
        }
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v99.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v99.__r_.__value_.__l.__data_);
        }
      }
      else
      {
        uint64_t v54 = ACFULogging::getLogInstance(0);
        ACFUCommon::cfTypeDescription(v94, 1, &v101);
        ACFUCommon::cfTypeDescription(v33, 1, &__p);
        ACFULogging::handleMessage((uint64_t)v54, 2u, "%s::%s: failed to convert tag '%s' from build identity type (%s) to tss-request map type (%s)\n", v55, v56, v57, v58, v59, (char)"ACFURestoreHost");
        CFDictionaryRef v7 = a4;
        uint64_t v6 = a5;
        CFDictionaryRef v8 = a3;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v102) < 0) {
          operator delete((void *)v101);
        }
        CFTypeRef cf2 = 0;
      }
    }
    else
    {
      uint64_t v48 = ACFULogging::getLogInstance(0);
      ACFUCommon::cfTypeDescription(v31, 1, &v101);
      ACFUCommon::cfTypeDescription(v33, 1, &__p);
      ACFULogging::handleMessage((uint64_t)v48, 2u, "%s::%s: failed to convert tag '%s' from device info type (%s) to tss-request map type (%s)\n", v49, v50, v51, v52, v53, (char)"ACFURestoreHost");
      CFDictionaryRef v7 = a4;
      uint64_t v6 = a5;
      CFDictionaryRef v8 = a3;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v102) < 0) {
        operator delete((void *)v101);
      }
      std::string cf = 0;
    }
    char v29 = 0;
    int v28 = 8;
LABEL_25:
    if (v104 < 0) {
      break;
    }
    if ((v29 & 1) == 0) {
      goto LABEL_29;
    }
LABEL_30:
    if (++v5 == v98)
    {
      char v30 = 1;
LABEL_84:
      if (cf) {
        CFRelease(cf);
      }
      if (cf2) {
        CFRelease(cf2);
      }
      return v30 & 1;
    }
  }
  operator delete(v103);
  if (v29) {
    goto LABEL_30;
  }
LABEL_29:
  char v30 = 1;
  switch(v28)
  {
    case 0:
    case 3:
      goto LABEL_30;
    case 2:
      goto LABEL_84;
    case 8:
      char v30 = 0;
      goto LABEL_84;
    default:
      return v30 & 1;
  }
  return v30 & 1;
}

void sub_22EF1D538(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v33 - 121) < 0) {
    operator delete(*(void **)(v33 - 144));
  }
  if (a33 < 0) {
    operator delete(__p);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  if (*(char *)(v33 - 89) < 0) {
    operator delete(*(void **)(v33 - 112));
  }
  _Unwind_Resume(exception_object);
}

uint64_t ACFURestoreHost::populateDictFromIdentity(unint64_t **a1, uint64_t a2, CFDictionaryRef theDict, __CFDictionary *a4)
{
  CFStringRef v4 = *a1;
  if (*a1 != a1[1])
  {
    CFDictionaryRef v8 = (void *)(a2 + 8);
    do
    {
      uint64_t v9 = (void *)*v8;
      CFURLRef v10 = (const void *)*v4;
      if (!*v8) {
        goto LABEL_14;
      }
      uint64_t v11 = v8;
      do
      {
        unint64_t v12 = v9[4];
        BOOL v13 = v12 >= (unint64_t)v10;
        if (v12 >= (unint64_t)v10) {
          uint64_t v14 = v9;
        }
        else {
          uint64_t v14 = v9 + 1;
        }
        if (v13) {
          uint64_t v11 = v9;
        }
        uint64_t v9 = (void *)*v14;
      }
      while (*v14);
      if (v11 != v8 && (unint64_t)v10 >= v11[4])
      {
        uint64_t Value = (__CFString *)CFDictionaryGetValue(theDict, v10);
        if (Value)
        {
          uint64_t v23 = Value;
          uint64_t v24 = (ACFUCommon **)std::map<__CFString const*,std::string>::at(a2, v4);
          uint64_t result = (uint64_t)ACFURestoreHost::convertCFType(v23, *v24);
          if (!result) {
            return result;
          }
          uint64_t v26 = (const void *)result;
          CFDictionarySetValue(a4, (const void *)*v4, (const void *)result);
          CFRelease(v26);
          goto LABEL_20;
        }
        ACFUCommon::stringFromCFString((const __CFString *)*v4, __p);
        LogInstance = ACFULogging::getLogInstance(v27);
        ACFULogging::handleMessage((uint64_t)LogInstance, 3u, "%s::%s: tag '%s' not found in identity dictionary, ignoring\n", v29, v30, v31, v32, v33, (char)"ACFURestoreHost");
      }
      else
      {
LABEL_14:
        ACFUCommon::stringFromCFString((const __CFString *)*v4, __p);
        CFStringRef v16 = ACFULogging::getLogInstance(v15);
        ACFULogging::handleMessage((uint64_t)v16, 3u, "%s::%s: tag '%s' not found in tss-request map, ignoring\n", v17, v18, v19, v20, v21, (char)"ACFURestoreHost");
      }
      if (v36 < 0) {
        operator delete(__p[0]);
      }
LABEL_20:
      ++v4;
    }
    while (v4 != a1[1]);
  }
  return 1;
}

void sub_22EF1D7EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ACFURestoreHost::createBoolFromData(ACFURestoreHost *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *MEMORY[0x263EFFB38];
  CFNumberRef otherNumber = 0;
  uint64_t valuePtr = 0;
  CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  if (v6)
  {
    CFNumberRef v8 = v6;
    Num64Num32FromCFDataRef Data = ACFURestoreHost::createNum64Num32FromData(this, (const __CFData *)&otherNumber, v7);
    BOOL v10 = Num64Num32FromData;
    if (Num64Num32FromData)
    {
      CFNumberRef v11 = otherNumber;
      if (CFNumberCompare(v8, otherNumber, 0)) {
        uint64_t v5 = *MEMORY[0x263EFFB40];
      }
    }
    else
    {
      LogInstance = ACFULogging::getLogInstance((ACFULogging *)Num64Num32FromData);
      ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: CFData to CFBoolean conversion failure\n", v20, v21, v22, v23, v24, (char)"ACFURestoreHost");
      CFNumberRef v11 = otherNumber;
    }
    char v12 = !v10;
    CFRelease(v8);
    if (v11) {
      CFRelease(v11);
    }
  }
  else
  {
    BOOL v13 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v13, 2u, "%s::%s: CFData to CFBoolean conversion failure\n", v14, v15, v16, v17, v18, (char)"ACFURestoreHost");
    char v12 = 1;
  }
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v12;
}

CFErrorRef ACFURestoreHost::getError(ACFURestoreHost *this)
{
  uint64_t v1 = (ACFURestoreHost *)((char *)this + 24);
  if (!ACFUError::hasError((ACFURestoreHost *)((char *)this + 24))) {
    return 0;
  }
  return ACFUError::getCFError(v1);
}

void ACFURestoreHost::~ACFURestoreHost(ACFURestoreHost *this)
{
  *(void *)this = &unk_26E280340;
  CFAllocatorRef v2 = (const void *)*((void *)this + 2);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 2) = 0;
  }
  std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy((uint64_t)this + 200, *((void **)this + 26));
  std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy((uint64_t)this + 160, *((void **)this + 21));
  CFStringRef v3 = (void *)*((void *)this + 17);
  if (v3)
  {
    *((void *)this + 18) = v3;
    operator delete(v3);
  }
  CFStringRef v4 = (void *)*((void *)this + 14);
  if (v4)
  {
    *((void *)this + 15) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 11);
  if (v5)
  {
    *((void *)this + 12) = v5;
    operator delete(v5);
  }
  CFNumberRef v6 = (void *)*((void *)this + 8);
  if (v6)
  {
    *((void *)this + 9) = v6;
    operator delete(v6);
  }
  CFDictionaryRef v7 = (void *)*((void *)this + 5);
  if (v7)
  {
    *((void *)this + 6) = v7;
    operator delete(v7);
  }
  ACFUError::~ACFUError((ACFURestoreHost *)((char *)this + 24));
}

uint64_t ACFURestoreHost::init(const void **this, const __CFDictionary *a2, const __CFString *a3)
{
  LogInstance = ACFULogging::getLogInstance((ACFULogging *)this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 0, "%s::%s: ACFU Version: %s\n", v7, v8, v9, v10, v11, (char)"ACFURestoreHost");
  if (a2) {
    BOOL v13 = a3 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  uint64_t v14 = !v13;
  if (v13)
  {
    uint64_t v16 = ACFULogging::getLogInstance(v12);
    ACFULogging::handleMessage((uint64_t)v16, 2u, "%s::%s: bad parameter: options %p, domain %p\n", v17, v18, v19, v20, v21, (char)"ACFURestoreHost");
  }
  else
  {
    this[2] = a2;
    AMSupportSafeRetain();
    AppendedDomain = (ACFULogging *)ACFUError::createAppendedDomain(this + 3, a3);
  }
  if (this[5] == this[6]
    || this[17] == this[18]
    || this[8] == this[9]
    || this[11] == this[12]
    || this[14] == this[15]
    || !this[22]
    || !this[27]
    || !this[28])
  {
    uint64_t v22 = ACFULogging::getLogInstance(AppendedDomain);
    ACFULogging::handleMessage((uint64_t)v22, 2u, "%s::%s: initialization failure due to incomplete parameters\n", v23, v24, v25, v26, v27, (char)"ACFURestoreHost");
    return 0;
  }
  return v14;
}

const void *ACFURestoreHost::copyDataFromFileDictionary(ACFULogging *key, CFDictionaryRef theDict, int a3)
{
  if (!key)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: key value not provided\n", v8, v9, v10, v11, v12, (char)"ACFURestoreHost");
    return 0;
  }
  if (!theDict)
  {
    BOOL v13 = ACFULogging::getLogInstance(key);
    ACFULogging::handleMessage((uint64_t)v13, 2u, "%s::%s: firmware file dictionary not provided\n", v14, v15, v16, v17, v18, (char)"ACFURestoreHost");
    return 0;
  }
  uint64_t Value = CFDictionaryGetValue(theDict, key);
  uint64_t v5 = Value;
  if (a3)
  {
    if (Value) {
      AMSupportSafeRetain();
    }
  }
  else
  {
    AMSupportCreateDataFromFileURL();
    return 0;
  }
  return v5;
}

CFTypeRef ACFURestoreHost::convertCFType(__CFString *this, ACFUCommon *a2)
{
  CFStringRef v4 = (ACFULogging *)CFGetTypeID(this);
  LogInstance = ACFULogging::getLogInstance(v4);
  ACFUCommon::cfTypeDescription(a2, 1, &cf);
  ACFUCommon::cfTypeDescription(v4, 1, __p);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: desired type %s, received type %s\n", v6, v7, v8, v9, v10, (char)"ACFURestoreHost");
  if (v70 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(cf.data) < 0) {
    operator delete(cf.isa);
  }
  if (v4 == a2)
  {
    uint64_t v12 = ACFULogging::getLogInstance(v11);
    ACFULogging::handleMessage((uint64_t)v12, 4u, "%s::%s: no conversion necessary\n", v13, v14, v15, v16, v17, (char)"ACFURestoreHost");
    return CFRetain(this);
  }
  if ((ACFUCommon *)CFNumberGetTypeID() != a2 || (uint64_t v19 = (ACFULogging *)CFStringGetTypeID(), v4 != v19))
  {
    if ((ACFUCommon *)CFNumberGetTypeID() == a2 && (uint64_t v34 = (ACFULogging *)CFDataGetTypeID(), v4 == v34))
    {
      uint64_t v35 = ACFULogging::getLogInstance(v34);
      ACFULogging::handleMessage((uint64_t)v35, 4u, "%s::%s: converting from data to number\n", v36, v37, v38, v39, v40, (char)"ACFURestoreHost");
      cf.isa = 0;
      Num64Num32FromCFDataRef Data = ACFURestoreHost::createNum64Num32FromData((ACFURestoreHost *)this, (const __CFData *)&cf, v41);
      if (!Num64Num32FromData)
      {
        uint64_t v43 = ACFULogging::getLogInstance((ACFULogging *)Num64Num32FromData);
        ACFULogging::handleMessage((uint64_t)v43, 2u, "%s::%s: failed to convert from number to data\n", v44, v45, v46, v47, v48, (char)"ACFURestoreHost");
        goto LABEL_15;
      }
    }
    else
    {
      CFTypeID TypeID = (ACFULogging *)CFBooleanGetTypeID();
      if (TypeID != a2 || (CFTypeID TypeID = (ACFULogging *)CFDataGetTypeID(), v4 != TypeID))
      {
        uint64_t v57 = ACFULogging::getLogInstance(TypeID);
        ACFUCommon::cfTypeDescription(a2, 1, &cf);
        ACFUCommon::cfTypeDescription(v4, 1, __p);
        ACFULogging::handleMessage((uint64_t)v57, 2u, "%s::%s: unsupported conversion: desired type %s, received type %s\n", v58, v59, v60, v61, v62, (char)"ACFURestoreHost");
        if (v70 < 0) {
          operator delete(__p[0]);
        }
        if (SHIBYTE(cf.data) < 0) {
          operator delete(cf.isa);
        }
        return 0;
      }
      uint64_t v50 = ACFULogging::getLogInstance(TypeID);
      ACFULogging::handleMessage((uint64_t)v50, 4u, "%s::%s: converting from data to BOOLean\n", v51, v52, v53, v54, v55, (char)"ACFURestoreHost");
      ACFURestoreHost::createBoolFromData((ACFURestoreHost *)this, (uint64_t)&cf);
      if (LOBYTE(cf.info))
      {
        uint64_t v63 = ACFULogging::getLogInstance(v56);
        ACFULogging::handleMessage((uint64_t)v63, 2u, "%s::%s: failed to convert from data to BOOLean\n", v64, v65, v66, v67, v68, (char)"ACFURestoreHost");
        return 0;
      }
    }
    return cf.isa;
  }
  uint64_t v20 = ACFULogging::getLogInstance(v19);
  ACFULogging::handleMessage((uint64_t)v20, 4u, "%s::%s: converting from string to number\n", v21, v22, v23, v24, v25, (char)"ACFURestoreHost");
  cf.isa = 0;
  uint64_t v27 = (ACFULogging *)ACFURestoreHost::createNum32FromString(this, &cf, v26);
  if (v27) {
    return cf.isa;
  }
  int v28 = ACFULogging::getLogInstance(v27);
  ACFULogging::handleMessage((uint64_t)v28, 2u, "%s::%s: failed to convert from string to number\n", v29, v30, v31, v32, v33, (char)"ACFURestoreHost");
LABEL_15:
  CFTypeRef result = cf.isa;
  if (!cf.isa) {
    return result;
  }
  CFRelease(cf.isa);
  return 0;
}

void sub_22EF1DF20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  if (a24 < 0) {
    operator delete(a19);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ACFURestoreHost::createNum32FromString(const __CFString *this, const __CFString *a2, const __CFNumber **a3)
{
  int valuePtr = 0;
  ACFUCommon::stringFromCFString(this, &__str);
  std::string::size_type size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = __str.__r_.__value_.__l.__size_;
  }
  if (size)
  {
    int valuePtr = std::stoi(&__str, 0, 0);
    CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
    a2->isa = v6;
    if (v6)
    {
      uint64_t v7 = 1;
      goto LABEL_6;
    }
    LogInstance = ACFULogging::getLogInstance(0);
    uint64_t v15 = "%s::%s: Failed to create CF number from int value\n";
  }
  else
  {
    LogInstance = ACFULogging::getLogInstance(v4);
    uint64_t v15 = "%s::%s: failed to get string\n";
  }
  ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v15, v10, v11, v12, v13, v14, (char)"ACFURestoreHost");
  uint64_t v7 = 0;
LABEL_6:
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  return v7;
}

BOOL ACFURestoreHost::createNum64Num32FromData(ACFURestoreHost *this, const __CFData *a2, const __CFNumber **a3)
{
  unint64_t Length = CFDataGetLength(this);
  BytePtr = (ACFULogging *)CFDataGetBytePtr(this);
  if (Length - 1 >= 8)
  {
    LogInstance = ACFULogging::getLogInstance(BytePtr);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: data length %ld is not within range\n", v12, v13, v14, v15, v16, (char)"ACFURestoreHost");
  }
  else
  {
    if (Length < 5)
    {
      int valuePtr = 0;
      memcpy(&valuePtr, BytePtr, Length);
      CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      p_int valuePtr = (uint64_t *)&valuePtr;
      CFNumberType v9 = kCFNumberSInt32Type;
    }
    else
    {
      uint64_t __dst = 0;
      memcpy(&__dst, BytePtr, Length);
      CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      p_int valuePtr = &__dst;
      CFNumberType v9 = kCFNumberSInt64Type;
    }
    *(void *)a2 = CFNumberCreate(v7, v9, p_valuePtr);
  }
  return Length - 1 < 8;
}

void ACFURestoreHost::ACFURestoreHost(ACFURestoreHost *this)
{
  *(void *)this = &unk_26E280340;
  *((void *)this + 1) = @"ACFU,RootedFW";
  *((void *)this + 2) = 0;
  ACFUError::ACFUError((ACFURestoreHost *)((char *)this + 24), @"RestoreHost");
  *((void *)this + 21) = 0;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *((void *)this + 19) = 0;
  *((void *)this + 20) = (char *)this + 168;
  *((void *)this + 26) = 0;
  *((void *)this + 27) = 0;
  *((void *)this + 22) = 0;
  *((void *)this + 23) = 0;
  *((void *)this + 24) = 0;
  *((void *)this + 25) = (char *)this + 208;
}

uint64_t *std::map<__CFString const*,unsigned long>::map[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::map<__CFString const*,unsigned long>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<__CFString const*,unsigned long>,std::__tree_node<std::__value_type<__CFString const*,unsigned long>,void *> *,long>>>(a1, *(void **)a2, (void *)(a2 + 8));
  return a1;
}

void sub_22EF1E2A4(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::map<__CFString const*,unsigned long>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<__CFString const*,unsigned long>,std::__tree_node<std::__value_type<__CFString const*,unsigned long>,void *> *,long>>>(uint64_t *result, void *a2, void *a3)
{
  if (a2 != a3)
  {
    CFStringRef v4 = a2;
    uint64_t v5 = (uint64_t **)result;
    CFNumberRef v6 = result + 1;
    do
    {
      CFTypeRef result = std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__emplace_hint_unique_key_args<__CFString const*,std::pair<__CFString const* const,unsigned long> const&>(v5, v6, v4 + 4, (_OWORD *)v4 + 2);
      CFAllocatorRef v7 = (void *)v4[1];
      if (v7)
      {
        do
        {
          uint64_t v8 = v7;
          CFAllocatorRef v7 = (void *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          uint64_t v8 = (void *)v4[2];
          BOOL v9 = *v8 == (void)v4;
          CFStringRef v4 = v8;
        }
        while (!v9);
      }
      CFStringRef v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__emplace_hint_unique_key_args<__CFString const*,std::pair<__CFString const* const,unsigned long> const&>(uint64_t **a1, void *a2, unint64_t *a3, _OWORD *a4)
{
  CFNumberRef v6 = (void **)std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__find_equal<__CFString const*>(a1, a2, &v11, &v10, a3);
  CFAllocatorRef v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    CFAllocatorRef v7 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v7 + 2) = *a4;
    std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__insert_node_at(a1, v11, v8, v7);
  }
  return v7;
}

void std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void ACFUMachO::ACFUMachO(ACFUMachO *this)
{
  *(void *)this = &unk_26E280390;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((unsigned char *)this + 40) = 0;
}

uint64_t ACFUMachO::init(ACFUMachO *this, const unsigned __int8 *a2, unint64_t a3)
{
  if (a2)
  {
    this = (ACFUMachO *)ACFUMachO::extractCoreDumpRegions(this, a2, a3);
    if (this) {
      return 1;
    }
    CFStringRef v4 = "%s::%s: failed to extract coredump regions\n";
  }
  else
  {
    CFStringRef v4 = "%s::%s: crashLogBuffer is null\n";
  }
  LogInstance = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v4, v6, v7, v8, v9, v10, (char)"ACFUMachO");
  return 0;
}

uint64_t ACFUMachO::extractCoreDumpRegions(ACFUMachO *this, const unsigned __int8 *a2, unint64_t a3)
{
  CFStringRef v3 = this;
  if (a3 < 0x31) {
    goto LABEL_27;
  }
  uint64_t v6 = 32;
  while (1)
  {
    uint64_t v7 = &a2[v6];
    if (*(_DWORD *)&a2[v6] == 1130587248) {
      break;
    }
LABEL_6:
    v6 += *((unsigned int *)v7 + 3);
    if (v6 + 16 >= a3) {
      goto LABEL_27;
    }
  }
  if (*((_DWORD *)v7 + 2) != 512)
  {
    LogInstance = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)LogInstance, 3u, "%s::%s: CoredumpRegions version mismatch. Expected: 0x%x Version in Crashlog: 0x%x\n", v9, v10, v11, v12, v13, (char)"ACFUMachO");
    goto LABEL_6;
  }
  uint64_t v14 = *((unsigned int *)v7 + 3);
  if (v6 + v14 > a3)
  {
    *((void *)v3 + 2) = *((void *)v3 + 1);
    uint64_t v53 = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)v53, 2u, "%s::%s: parsing error while extracting the coredump regions. crashlog size: %zu offset and section size: %lu\n", v54, v55, v56, v57, v58, (char)"ACFUMachO");
    return 0;
  }
  if (v14 < 0x24)
  {
LABEL_27:
    unint64_t v32 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)v3 + 2) - *((void *)v3 + 1)) >> 2);
    *((unsigned char *)v3 + 40) = v32;
    uint64_t v33 = v32;
    uint64_t v34 = ACFULogging::getLogInstance(this);
    if (!v33)
    {
      ACFULogging::handleMessage((uint64_t)v34, 2u, "%s::%s: no coredump region in the crashlog\n", v35, v36, v37, v38, v39, (char)"ACFUMachO");
      return 0;
    }
    ACFULogging::handleMessage((uint64_t)v34, 3u, "%s::%s: Number of coredump sections available: %u\n", v35, v36, v37, v38, v39, (char)"ACFUMachO");
    return 1;
  }
  uint64_t v15 = (unint64_t *)((char *)v3 + 24);
  uint64_t v16 = 16;
  uint64_t v17 = 36;
  while (1)
  {
    uint64_t v18 = &v7[v16];
    long long v59 = *(_OWORD *)&v7[v16];
    unsigned int v19 = *(_DWORD *)&v7[v16 + 16];
    if (v19 > 0x200000)
    {
      *((void *)v3 + 2) = *((void *)v3 + 1);
      uint64_t v41 = ACFULogging::getLogInstance(this);
      ACFULogging::handleMessage((uint64_t)v41, 2u, "%s::%s: Coredump region size is too large: %d\n", v42, v43, v44, v45, v46, (char)"ACFUMachO");
      return 0;
    }
    uint64_t v16 = v17;
    uint64_t v21 = *((void *)v3 + 1);
    unint64_t v20 = *((void *)v3 + 2);
    unint64_t v22 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v20 - v21) >> 2);
    if (v22 >= 0x40) {
      break;
    }
    if (v20 >= *v15)
    {
      if (0x999999999999999ALL * ((uint64_t)(*v15 - v21) >> 2) <= v22 + 1) {
        unint64_t v24 = v22 + 1;
      }
      else {
        unint64_t v24 = 0x999999999999999ALL * ((uint64_t)(*v15 - v21) >> 2);
      }
      if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*v15 - v21) >> 2) >= 0x666666666666666) {
        unint64_t v25 = 0xCCCCCCCCCCCCCCCLL;
      }
      else {
        unint64_t v25 = v24;
      }
      this = (ACFUMachO *)std::__allocate_at_least[abi:ne180100]<std::allocator<CrashLogCoredumpData_t>>((uint64_t)v3 + 24, v25);
      uint64_t v27 = (char *)this + 20 * v22;
      *(_OWORD *)uint64_t v27 = v59;
      *((_DWORD *)v27 + 4) = v19;
      uint64_t v29 = (char *)*((void *)v3 + 1);
      int v28 = (char *)*((void *)v3 + 2);
      uint64_t v30 = v27;
      if (v28 != v29)
      {
        do
        {
          long long v31 = *(_OWORD *)(v28 - 20);
          *((_DWORD *)v30 - 1) = *((_DWORD *)v28 - 1);
          *(_OWORD *)(v30 - 20) = v31;
          v30 -= 20;
          v28 -= 20;
        }
        while (v28 != v29);
        int v28 = (char *)*((void *)v3 + 1);
      }
      uint64_t v23 = v27 + 20;
      *((void *)v3 + 1) = v30;
      *((void *)v3 + 2) = v27 + 20;
      *((void *)v3 + 3) = (char *)this + 20 * v26;
      if (v28) {
        operator delete(v28);
      }
    }
    else
    {
      *(_OWORD *)unint64_t v20 = *(_OWORD *)v18;
      *(_DWORD *)(v20 + 16) = v19;
      uint64_t v23 = (char *)(v20 + 20);
    }
    *((void *)v3 + 2) = v23;
    uint64_t v17 = v16 + 20;
    if (v16 + 20 > (unint64_t)*((unsigned int *)v7 + 3)) {
      goto LABEL_27;
    }
  }
  *((void *)v3 + 2) = v21;
  uint64_t v47 = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)v47, 2u, "%s::%s: There are more coredump regions than expected in the crashlog\n", v48, v49, v50, v51, v52, (char)"ACFUMachO");
  return 0;
}

uint64_t ACFUMachO::getMachoHeaderData(ACFUMachO *this)
{
  return *((void *)this + 4);
}

void ACFUMachO::~ACFUMachO(ACFUMachO *this)
{
  *(void *)this = &unk_26E280390;
  CFAllocatorRef v2 = (const void *)*((void *)this + 4);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 4) = 0;
  }
  CFStringRef v3 = (void *)*((void *)this + 1);
  if (v3)
  {
    *((void *)this + 2) = v3;
    operator delete(v3);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CrashLogCoredumpData_t>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xCCCCCCCCCCCCCCDLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(20 * a2);
}

void ACFUMachO32::ACFUMachO32(ACFUMachO32 *this)
{
  ACFUMachO::ACFUMachO(this);
  *uint64_t v1 = &unk_26E2803D0;
  bzero((char *)v1 + 44, 0xE70uLL);
}

{
  void *v1;

  ACFUMachO::ACFUMachO(this);
  *uint64_t v1 = &unk_26E2803D0;
  bzero((char *)v1 + 44, 0xE70uLL);
}

void ACFUMachO32::create(ACFUMachO32 *this@<X0>, const unsigned __int8 *a2@<X1>, char **a3@<X8>)
{
  uint64_t v6 = (char *)operator new(0xEA0uLL);
  ACFUMachO::ACFUMachO((ACFUMachO *)v6);
  *(void *)uint64_t v6 = &unk_26E2803D0;
  bzero(v6 + 44, 0xE70uLL);
  *a3 = v6;
  if ((ACFUMachO32::init((ACFUMachO32 *)v6, (const unsigned __int8 *)this, (unint64_t)a2) & 1) == 0)
  {
    *a3 = 0;
    uint64_t v7 = (ACFULogging *)(*(uint64_t (**)(char *))(*(void *)v6 + 8))(v6);
    LogInstance = ACFULogging::getLogInstance(v7);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: Failed to init macho32\n", v9, v10, v11, v12, v13, (char)"ACFUMachO32");
  }
}

void sub_22EF1E9C8(_Unwind_Exception *exception_object)
{
  *uint64_t v1 = 0;
  _Unwind_Resume(exception_object);
}

uint64_t ACFUMachO32::init(ACFUMachO32 *this, const unsigned __int8 *a2, unint64_t a3)
{
  uint64_t v4 = ACFUMachO::init(this, a2, a3);
  if (v4)
  {
    *(_OWORD *)((char *)this + 60) = xmmword_22EF270C0;
    uint64_t v5 = *((unsigned __int8 *)this + 40);
    *((_DWORD *)this + 19) = v5 + 1;
    *((_DWORD *)this + 20) = 56 * v5 + 84;
    *(_OWORD *)((char *)this + 44) = xmmword_22EF270D0;
    if (v5)
    {
      uint64_t v6 = 0;
      int v7 = 56 * v5 + 112;
      uint64_t v8 = 56 * v5;
      uint64_t v9 = (_DWORD *)(*((void *)this + 1) + 16);
      do
      {
        uint64_t v10 = (char *)this + v6;
        *(void *)(v10 + 156) = 0x3800000001;
        *((_DWORD *)v10 + 41) = 1163157343;
        *((_WORD *)v10 + 84) = 21592;
        uint64_t v11 = *((void *)v9 - 2);
        int v12 = *v9;
        v9 += 5;
        *((_DWORD *)v10 + 45) = v11;
        *((_DWORD *)v10 + 46) = v12;
        *((_DWORD *)v10 + 47) = v7;
        *((_DWORD *)v10 + 48) = v12;
        v7 += v12;
        v6 += 56;
      }
      while (v8 != v6);
    }
    uint64_t v4 = (*(uint64_t (**)(ACFUMachO32 *))(*(void *)this + 24))(this);
    if (v4) {
      return 1;
    }
    uint64_t v14 = "%s::%s: Failed to create macho header data\n";
  }
  else
  {
    uint64_t v14 = "%s::%s: failed to init ACFUMachO\n";
  }
  LogInstance = ACFULogging::getLogInstance((ACFULogging *)v4);
  ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v14, v16, v17, v18, v19, v20, (char)"ACFUMachO32");
  return 0;
}

uint64_t ACFUMachO32::createMachoHeaderData(ACFUMachO32 *this)
{
  if (*((unsigned char *)this + 40))
  {
    CFMutableDictionaryRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    *((void *)this + 4) = Mutable;
    if (Mutable)
    {
      CFDataAppendBytes(Mutable, (const UInt8 *)this + 60, 28);
      CFDataAppendBytes(*((CFMutableDataRef *)this + 4), (const UInt8 *)this + 44, 8);
      CFDataAppendBytes(*((CFMutableDataRef *)this + 4), (const UInt8 *)this + 52, 8);
      CFDataAppendBytes(*((CFMutableDataRef *)this + 4), (const UInt8 *)this + 88, 68);
      CFDataAppendBytes(*((CFMutableDataRef *)this + 4), (const UInt8 *)this + 156, 56 * *((unsigned __int8 *)this + 40));
      return 1;
    }
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: Failed to allocate buffer for macho header data\n", v11, v12, v13, v14, v15, (char)"ACFUMachO32");
  }
  else
  {
    uint64_t v4 = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)v4, 2u, "%s::%s: numberOfSections is 0\n", v5, v6, v7, v8, v9, (char)"ACFUMachO32");
  }
  return 0;
}

void ACFUMachO32::~ACFUMachO32(ACFUMachO32 *this)
{
  ACFUMachO::~ACFUMachO(this);
  operator delete(v1);
}

void ACFUMachO64::ACFUMachO64(ACFUMachO64 *this)
{
  ACFUMachO::ACFUMachO(this);
  *(void *)uint64_t v2 = &unk_26E280418;
  *(_OWORD *)(v2 + 44) = 0u;
  *(_OWORD *)((char *)this + 60) = 0u;
  *(_OWORD *)((char *)this + 76) = 0u;
  bzero((void *)(v2 + 96), 0x1310uLL);
}

{
  uint64_t v2;

  ACFUMachO::ACFUMachO(this);
  *(void *)uint64_t v2 = &unk_26E280418;
  *(_OWORD *)(v2 + 44) = 0u;
  *(_OWORD *)((char *)this + 60) = 0u;
  *(_OWORD *)((char *)this + 76) = 0u;
  bzero((void *)(v2 + 96), 0x1310uLL);
}

void ACFUMachO64::create(ACFUMachO64 *this@<X0>, const unsigned __int8 *a2@<X1>, char **a3@<X8>)
{
  uint64_t v6 = (char *)operator new(0x1370uLL);
  ACFUMachO::ACFUMachO((ACFUMachO *)v6);
  *(void *)uint64_t v6 = &unk_26E280418;
  *(_OWORD *)(v6 + 44) = 0u;
  *(_OWORD *)(v6 + 60) = 0u;
  *(_OWORD *)(v6 + 76) = 0u;
  bzero(v6 + 96, 0x1310uLL);
  *a3 = v6;
  if ((ACFUMachO64::init((ACFUMachO64 *)v6, (const unsigned __int8 *)this, (unint64_t)a2) & 1) == 0)
  {
    *a3 = 0;
    uint64_t v7 = (ACFULogging *)(*(uint64_t (**)(char *))(*(void *)v6 + 8))(v6);
    LogInstance = ACFULogging::getLogInstance(v7);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: Failed to init macho64\n", v9, v10, v11, v12, v13, (char)"ACFUMachO64");
  }
}

void sub_22EF1EE24(_Unwind_Exception *exception_object)
{
  *uint64_t v1 = 0;
  _Unwind_Resume(exception_object);
}

uint64_t ACFUMachO64::init(ACFUMachO64 *this, const unsigned __int8 *a2, unint64_t a3)
{
  uint64_t v4 = ACFUMachO::init(this, a2, a3);
  if (v4)
  {
    *(_OWORD *)((char *)this + 60) = xmmword_22EF27100;
    uint64_t v5 = *((unsigned __int8 *)this + 40);
    *((_DWORD *)this + 19) = v5 + 1;
    *((_DWORD *)this + 20) = 72 * v5 + 288;
    *(_OWORD *)((char *)this + 44) = xmmword_22EF27110;
    bzero((char *)this + 368, 0x1200uLL);
    if (v5)
    {
      uint64_t v6 = 0;
      unsigned int v7 = 72 * v5 + 320;
      uint64_t v8 = (_DWORD *)(*((void *)this + 1) + 16);
      do
      {
        uint64_t v9 = (char *)this + v6;
        *((void *)v9 + 46) = 0x4800000019;
        *((_DWORD *)v9 + 94) = 1163157343;
        *((_WORD *)v9 + 190) = 21592;
        uint64_t v10 = *((void *)v8 - 2);
        unsigned int v11 = *v8;
        v8 += 5;
        *((void *)v9 + 49) = v10;
        *((void *)v9 + 50) = v11;
        *((void *)v9 + 51) = v7;
        *((void *)v9 + 52) = v11;
        v7 += v11;
        v6 += 72;
      }
      while (72 * v5 != v6);
    }
    uint64_t v4 = (*(uint64_t (**)(ACFUMachO64 *))(*(void *)this + 24))(this);
    if (v4) {
      return 1;
    }
    uint64_t v13 = "%s::%s: Failed to create macho header data\n";
  }
  else
  {
    uint64_t v13 = "%s::%s: failed to init ACFUMachO\n";
  }
  LogInstance = ACFULogging::getLogInstance((ACFULogging *)v4);
  ACFULogging::handleMessage((uint64_t)LogInstance, 2u, v13, v15, v16, v17, v18, v19, (char)"ACFUMachO64");
  return 0;
}

void ACFUMachO64::~ACFUMachO64(ACFUMachO64 *this)
{
  ACFUMachO::~ACFUMachO(this);
  operator delete(v1);
}

uint64_t ACFUMachO64::createMachoHeaderData(ACFUMachO64 *this)
{
  if (*((unsigned char *)this + 40))
  {
    CFMutableDictionaryRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    *((void *)this + 4) = Mutable;
    if (Mutable)
    {
      CFDataAppendBytes(Mutable, (const UInt8 *)this + 60, 32);
      CFDataAppendBytes(*((CFMutableDataRef *)this + 4), (const UInt8 *)this + 44, 8);
      CFDataAppendBytes(*((CFMutableDataRef *)this + 4), (const UInt8 *)this + 52, 8);
      CFDataAppendBytes(*((CFMutableDataRef *)this + 4), (const UInt8 *)this + 96, 272);
      CFDataAppendBytes(*((CFMutableDataRef *)this + 4), (const UInt8 *)this + 368, 72 * *((unsigned __int8 *)this + 40));
      return 1;
    }
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: Failed to allocate buffer for macho header data\n", v11, v12, v13, v14, v15, (char)"ACFUMachO64");
  }
  else
  {
    uint64_t v4 = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)v4, 2u, "%s::%s: numberOfSections is 0\n", v5, v6, v7, v8, v9, (char)"ACFUMachO64");
  }
  return 0;
}

uint64_t Img4DecodeSecureBootRsa4kSha384IM4C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&SecureBoot_root_rsa4k_pub, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeLocalRsa4kSha384IM4C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&Local_root_rsa4k_pub, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeShamRsa4kSha384IM4C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&Sham_root_rsa4k_pub, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

void Img4DecodeEvaluateTrust(unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
}

double Img4DecodeCopyPayloadHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyPayloadHashWithCallback(a1, (void (*)(void, void, long long *))sha1_digest, a2, a3);
}

double Img4DecodeCopyManifestHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyManifestHashWithCallback(a1, (void (*)(void))sha1_digest, a2, a3);
}

double DERImg4DecodeFindInSequence(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  unint64_t v7 = 0;
  long long v8 = 0uLL;
  while (!DERDecodeSeqNext(a1, &v7))
  {
    if (v7 == a2)
    {
      double result = *(double *)&v8;
      *a3 = v8;
      return result;
    }
  }
  return result;
}

double DERImg4DecodeContentFindItemWithTag(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  v6[0] = 0;
  v6[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v6)) {
    return DERImg4DecodeFindInSequence(v6, a2, a3);
  }
  return result;
}

uint64_t DERImg4DecodeTagCompare(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 < 4) {
    return 0xFFFFFFFFLL;
  }
  if (v2 != 4) {
    return 1;
  }
  unsigned int v5 = 0;
  if (DERParseInteger((char **)a1, &v5)) {
    return 4294967294;
  }
  if (v5 < a2) {
    return 0xFFFFFFFFLL;
  }
  return v5 > a2;
}

uint64_t DERImg4Decode(void *a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      unint64_t v6 = 0;
      unint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t result = DERDecodeItem((uint64_t)a1, &v6);
      if (!result)
      {
        if (v6 == 0x2000000000000010)
        {
          uint64_t v5 = a1[1];
          if (__CFADD__(*a1, v5) || __CFADD__(v7, v8))
          {
            __break(0x5513u);
          }
          else if (*a1 + v5 == v7 + v8)
          {
            uint64_t result = DERParseSequenceContentToObject(&v7, 4u, (uint64_t)&DERImg4ItemSpecs, a2, 0x40uLL, 0);
            if (!result) {
              return 2 * (DERImg4DecodeTagCompare(a2, 0x494D4734u) != 0);
            }
          }
          else
          {
            return 7;
          }
        }
        else
        {
          return 2;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadCompression(unint64_t *a1, char **a2)
{
  unsigned int v5 = 2;
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceContentToObject(a1, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)a2, 0x20uLL, 0);
      if (!result)
      {
        uint64_t result = DERParseInteger(a2, &v5);
        if (!result)
        {
          if (v5 <= 1) {
            return 0;
          }
          else {
            return 6;
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadWithProperties(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceToObject(a1, 7u, (uint64_t)&DERImg4PayloadWithPropertiesItemSpecs, a2, 0xA0uLL, 0);
      if (!result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else if (!*(void *)(a2 + 80) {
               || (long long v7 = 0u,
        }
                   long long v8 = 0u,
                   uint64_t result = DERImg4DecodePayloadCompression((unint64_t *)(a2 + 80), (char **)&v7),
                   !result))
        {
          uint64_t v6 = *(void *)(a2 + 96);
          uint64_t v5 = a2 + 96;
          if (!v6) {
            return 0;
          }
          long long v7 = 0u;
          long long v8 = 0u;
          uint64_t result = DERImg4DecodePayloadProperties(v5, (unint64_t)&v7);
          if (!result) {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadProperties(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4PayloadPropertiesItemSpecs, a2, 0x20uLL, 0);
      if (result) {
        return result;
      }
      if (DERImg4DecodeTagCompare(a2, 0x50415950u)) {
        return 2;
      }
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodePayload(uint64_t a1, unint64_t a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t result = 6;
  if (a1 && a2)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t result = DERImg4DecodePayloadWithProperties(a1, (unint64_t)&v11);
    if (result)
    {
      uint64_t result = DERParseSequenceToObject(a1, 6u, (uint64_t)&DERImg4PayloadItemSpecs, a2, 0x90uLL, 0);
      if (!result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else
        {
          uint64_t v6 = *(void *)(a2 + 80);
          uint64_t v5 = (unint64_t *)(a2 + 80);
          if (!v6) {
            return 0;
          }
          memset(v10, 0, sizeof(v10));
          uint64_t result = DERImg4DecodePayloadCompression(v5, (char **)v10);
          if (!result) {
            return 0;
          }
        }
      }
    }
    else
    {
      long long v7 = v12;
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v7;
      long long v8 = v14;
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 48) = v8;
      long long v9 = v16;
      *(_OWORD *)(a2 + 64) = v15;
      *(_OWORD *)(a2 + 80) = v9;
    }
  }
  return result;
}

uint64_t DERImg4DecodeManifest(void *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 5uLL, (uint64_t)&DERImg4ManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeManifestCommon(void *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result = 6;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1]) {
      return 0;
    }
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }
    uint64_t result = DERParseSequenceToObject((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0);
    if (!result)
    {
      if (DERImg4DecodeTagCompare(a4, a5)) {
        return 2;
      }
      unsigned int v9 = 0;
      uint64_t result = DERParseInteger((char **)(a4 + 16), &v9);
      if (result) {
        return result;
      }
      if (v9 > 2) {
        return 2;
      }
      return 0;
    }
  }
  return result;
}

uint64_t DERImg4DecodeUnsignedManifest(void *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeCertificate(void *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 4uLL, (uint64_t)&DERImg4CertificateItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeUnsignedCertificate(void *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeCertificatePropertiesAndPubKey(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              v21[0] = a1;
              v21[1] = a2;
              long long v16 = 0u;
              long long v17 = 0u;
              long long v14 = 0u;
              long long v15 = 0u;
              uint64_t result = DERDecodeItem((uint64_t)v21, &v18);
              if (!result)
              {
                if (v18 != 0x2000000000000011) {
                  return 2;
                }
                if (!DERParseSequenceContentToObject(&v19, 2u, (uint64_t)&DERIM4CItemSpecs, (unint64_t)&v16, 0x20uLL, 0))
                {
                  uint64_t result = DERDecodeItem((uint64_t)&v16, &v18);
                  if (result) {
                    return result;
                  }
                  if (v18 != 0x2000000000000010) {
                    return 2;
                  }
                  if (!DERParseSequenceContentToObject(&v19, 2u, (uint64_t)&DERCRTPSequenceItemSpecs, (unint64_t)&v14, 0x20uLL, 0))
                  {
                    uint64_t v12 = *((void *)&v15 + 1);
                    *a3 = v15;
                    *a4 = v12;
                    uint64_t result = DERDecodeItem((uint64_t)&v17, &v18);
                    if (result) {
                      return result;
                    }
                    if (v18 == 4)
                    {
                      uint64_t result = 0;
                      uint64_t v13 = v20;
                      *a5 = v19;
                      *a6 = v13;
                      return result;
                    }
                    return 2;
                  }
                }
                return 0xFFFFFFFFLL;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodeRestoreInfo(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4RestoreInfoItemSpecs, a2, 0x20uLL, 0);
      if (result) {
        return result;
      }
      if (DERImg4DecodeTagCompare(a2, 0x494D3452u)) {
        return 2;
      }
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodeProperty(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a3)
    {
      unint64_t v14 = 0;
      long long v15 = 0uLL;
      long long v13 = 0uLL;
      uint64_t v11 = 0;
      unint64_t v12 = 0;
      uint64_t v9 = 0;
      unint64_t v10 = 0;
      unsigned int v8 = 0;
      uint64_t result = DERDecodeSeqInit((uint64_t)a1, &v9, &v10);
      if (!result)
      {
        if (v9 != 0x2000000000000010) {
          return 2;
        }
        uint64_t result = DERDecodeSeqNext(&v10, &v14);
        if (result) {
          return result;
        }
        if (v14 != 22) {
          return 2;
        }
        uint64_t result = DERParseInteger((char **)&v15, &v8);
        if (result) {
          return result;
        }
        if ((v8 | 0xE000000000000000) != a2) {
          return 2;
        }
        *(_OWORD *)a3 = v15;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if (result) {
          return result;
        }
        *(void *)(a3 + 40) = v12;
        *(_OWORD *)(a3 + 24) = v13;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if (result != 1) {
          return 2;
        }
        uint64_t v7 = a1[1];
        if (__CFADD__(*a1, v7))
        {
          __break(0x5513u);
        }
        else if (v11 == *a1 + v7)
        {
          return 0;
        }
        else
        {
          return 7;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePropertyWithItem(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unsigned int v8 = 0;
  v9[0] = 0;
  v9[2] = 0;
  v9[1] = 22;
  uint64_t v9[3] = 24;
  long long v10 = a3;
  uint64_t result = DERParseSequenceToObject(a1, 2u, (uint64_t)v9, a4, 0x30uLL, 0);
  if (!result)
  {
    uint64_t result = DERParseInteger((char **)a4, &v8);
    if (!result)
    {
      if ((v8 | 0xE000000000000000) == a2)
      {
        uint64_t result = 0;
        *(void *)(a4 + 16) = a2 | 0xE000000000000000;
        *(void *)(a4 + 40) = a3;
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

void DERImg4DecodeFindPropertyInSequence(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  long long v8 = 0uLL;
  DERImg4DecodeFindInSequence(a1, a2, &v8);
  if (!v7) {
    DERImg4DecodePropertyWithItem((uint64_t)&v8, a2, a3, a4);
  }
}

void DERImg4DecodeFindProperty(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  v7[0] = 0;
  v7[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v7)) {
    DERImg4DecodeFindPropertyInSequence(v7, a2, a3, a4);
  }
}

void DERImg4DecodeParseManifestProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

void DERImg4DecodeParseManifestPropertiesInternal(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4)
{
  int v11 = 0;
  if (a1)
  {
    if (a2 | a3)
    {
      unint64_t v14 = 0;
      v15[0] = 0;
      v15[1] = 0;
      memset(v13, 0, sizeof(v13));
      memset(v12, 0, sizeof(v12));
      if (!DERDecodeItem(a1 + 264, &v14)
        && v14 == 0x2000000000000011
        && !DERParseInteger((char **)(a1 + 248), &v11))
      {
        unint64_t v8 = v11 == 2 ? 0x2000000000000010 : 0x2000000000000011;
        DERImg4DecodeFindProperty(v15, a4 | 0xE000000000000000, v8, (unint64_t)v13);
        if (!v9)
        {
          if (a2) {
            *(_OWORD *)a2 = *(_OWORD *)((char *)&v13[1] + 8);
          }
          DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, 0xE00000004D414E50, 0x2000000000000011uLL, (unint64_t)v12);
          if (a3)
          {
            if (!v10) {
              *(_OWORD *)a3 = *(_OWORD *)((char *)&v12[1] + 8);
            }
          }
        }
      }
    }
  }
}

void DERImg4DecodeParseCertificateProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

uint64_t Img4DecodeParseLengthFromBufferWithTag(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  unint64_t v11 = 0;
  unint64_t v12 = 0;
  v16[0] = 0;
  v16[1] = 0;
  v14[1] = 0;
  unint64_t v15 = 0;
  uint64_t result = 0xFFFFFFFFLL;
  unint64_t v13 = 0;
  v14[0] = 0;
  if (a1)
  {
    if (a4)
    {
      v17[0] = a1;
      v17[1] = a2;
      uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v17, &v15, &v12);
      if (!result)
      {
        if (v12)
        {
          if (v15 != 0x2000000000000010) {
            return 2;
          }
          uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v16, &v13, &v11);
          if (result) {
            return result;
          }
          if (v11)
          {
            uint64_t result = DERImg4DecodeTagCompare((uint64_t)v14, a3);
            if (!result)
            {
              uint64_t v8 = v16[0] - a1;
              if (v12 >= ~(v16[0] - a1)) {
                return 7;
              }
              BOOL v9 = __CFADD__(v12, v8);
              uint64_t v10 = v12 + v8;
              if (v9)
              {
                __break(0x5500u);
              }
              else
              {
                uint64_t result = 0;
                *a4 = v10;
              }
              return result;
            }
            return 2;
          }
        }
        return 3;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeParseLengthFromBuffer(uint64_t a1, uint64_t a2, void *a3)
{
  return Img4DecodeParseLengthFromBufferWithTag(a1, a2, 0x494D4734u, a3);
}

uint64_t Img4DecodePayloadExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 136)) {
      BOOL v4 = *(void *)(a1 + 144) != 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayload(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!result)
    {
      if (v5)
      {
        uint64_t result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 136);
        return result;
      }
      uint64_t result = 1;
    }
    goto LABEL_9;
  }
  uint64_t result = 6;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadType(uint64_t a1, _DWORD *a2)
{
  BOOL v5 = 0;
  uint64_t result = 6;
  if (!a1 || !a2 || (uint64_t result = Img4DecodePayloadExists(a1, &v5), result))
  {
LABEL_6:
    if (!a2) {
      return result;
    }
    goto LABEL_7;
  }
  if (v5)
  {
    uint64_t result = DERParseInteger((char **)(a1 + 104), a2);
    goto LABEL_6;
  }
  uint64_t result = 1;
  if (!a2) {
    return result;
  }
LABEL_7:
  if (result) {
    *a2 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadVersion(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!result)
    {
      if (v5)
      {
        uint64_t result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 120);
        return result;
      }
      uint64_t result = 1;
    }
    goto LABEL_9;
  }
  uint64_t result = 6;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodePayloadKeybagExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 152)) {
      BOOL v4 = *(void *)(a1 + 160) != 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadKeybag(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!result)
    {
      if (v5)
      {
        uint64_t result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 152);
        return result;
      }
      uint64_t result = 1;
    }
    goto LABEL_9;
  }
  uint64_t result = 6;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodePayloadCompressionInfoExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 168)) {
      BOOL v4 = *(void *)(a1 + 176) != 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadCompressionInfo(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  BOOL v11 = 0;
  uint64_t result = 6;
  if (!a1) {
    goto LABEL_14;
  }
  if (!a2) {
    goto LABEL_14;
  }
  if (!a3) {
    goto LABEL_14;
  }
  uint64_t result = Img4DecodePayloadExists(a1, &v11);
  if (result) {
    goto LABEL_14;
  }
  if (!v11) {
    goto LABEL_13;
  }
  uint64_t result = Img4DecodePayloadCompressionInfoExists(a1, &v11);
  if (result) {
    goto LABEL_14;
  }
  if (!v11)
  {
LABEL_13:
    uint64_t result = 1;
    goto LABEL_14;
  }
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v8 = *(void *)(a1 + 168);
  int v7 = (unint64_t *)(a1 + 168);
  if (!v8)
  {
    uint64_t result = 0xFFFFFFFFLL;
    if (!a2) {
      return result;
    }
LABEL_15:
    if (a3)
    {
      *a2 = -1;
      *a3 = -1;
    }
    return result;
  }
  uint64_t result = DERParseSequenceContentToObject(v7, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)&v9, 0x20uLL, 0);
  if (result
    || (uint64_t result = DERParseInteger((char **)&v9, a2), result)
    || (uint64_t result = DERParseInteger((char **)&v10, a3), result))
  {
LABEL_14:
    if (!a2) {
      return result;
    }
    goto LABEL_15;
  }
  return result;
}

double Img4DecodeCopyPayloadHashWithCallback(uint64_t a1, void (*a2)(void, void, long long *), uint64_t a3, int a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3) {
      return *(double *)&v7;
    }
LABEL_9:
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    return *(double *)&v7;
  }
  BOOL v9 = 0;
  if (Img4DecodePayloadExists(a1, &v9) || !v9) {
    goto LABEL_9;
  }
  if (*(unsigned char *)a1)
  {
    long long v7 = *(_OWORD *)(a1 + 184);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 200);
    *(_OWORD *)a3 = v7;
  }
  else
  {
    long long v10 = 0uLL;
    int v11 = 0;
    a2(*(void *)(a1 + 8), *(void *)(a1 + 16), &v10);
    *(void *)&long long v7 = v10;
    *(_OWORD *)a3 = v10;
    *(_DWORD *)(a3 + 16) = v11;
  }
  return *(double *)&v7;
}

uint64_t Img4DecodeCopyPayloadDigest(uint64_t a1, void *a2, size_t a3, uint64_t (**a4)(void, void, _OWORD *, size_t, void))
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = 6;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          BOOL v10 = 0;
          if (*a4)
          {
            if (!Img4DecodePayloadExists(a1, &v10))
            {
              if (v10)
              {
                if (a3 > 0x30)
                {
                  return 7;
                }
                else if (*(unsigned char *)a1)
                {
                  memcpy(a2, (const void *)(a1 + 184), a3);
                  return 0;
                }
                else
                {
                  memset(__src, 0, sizeof(__src));
                  uint64_t v4 = (*a4)(*(void *)(a1 + 8), *(void *)(a1 + 16), __src, a3, a4);
                  if (!v4) {
                    memcpy(a2, __src, a3);
                  }
                }
              }
              else
              {
                return 1;
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t Img4DecodeManifestExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(void *)(a1 + 24) != 0;
    }
  }
  return result;
}

double Img4DecodeCopyManifestHashWithCallback(uint64_t a1, void (*a2)(void), uint64_t a3, int a4)
{
  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3) {
      return *(double *)&v5;
    }
LABEL_8:
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    return *(double *)&v5;
  }
  if (!*(void *)(a1 + 24)) {
    goto LABEL_8;
  }
  if (*(unsigned char *)(a1 + 1))
  {
    long long v5 = *(_OWORD *)(a1 + 328);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 344);
    *(_OWORD *)a3 = v5;
  }
  else
  {
    a2();
    *(void *)&long long v5 = 0;
    *(_OWORD *)a3 = 0uLL;
    *(_DWORD *)(a3 + 16) = 0;
  }
  return *(double *)&v5;
}

uint64_t Img4DecodeCopyManifestDigest(uint64_t a1, void *__dst, size_t __n, uint64_t (**a4)(uint64_t, void, _OWORD *, size_t, void))
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = 6;
  if (a1)
  {
    if (__dst)
    {
      if (__n)
      {
        if (a4)
        {
          long long v7 = *a4;
          if (*a4)
          {
            uint64_t v8 = *(void *)(a1 + 24);
            if (v8)
            {
              if (__n > 0x30)
              {
                return 7;
              }
              else if (*(unsigned char *)(a1 + 1))
              {
                memcpy(__dst, (const void *)(a1 + 328), __n);
                return 0;
              }
              else
              {
                memset(v10, 0, sizeof(v10));
                uint64_t v4 = v7(v8, *(void *)(a1 + 32), v10, __n, a4);
                if (!v4) {
                  memcpy(__dst, v10, __n);
                }
              }
            }
            else
            {
              return 1;
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t Img4DecodeGetManifest(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t result = 6;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *(void *)(a1 + 24);
    *a2 = v5;
    int v6 = *(_DWORD *)(a1 + 32);
    *a3 = v6;
    if (v5) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    int v8 = v7;
    return (v8 << 31 >> 31);
  }
  return result;
}

uint64_t Img4DecodeSectionExists(void *a1, unsigned int a2, char *a3)
{
  uint64_t v3 = 6;
  if (a2 <= 1 && a1 && a3)
  {
    if (a2 == 1)
    {
      if (!a1[55] || !a1[56]) {
        goto LABEL_11;
      }
    }
    else if (!a1[33] || !a1[34])
    {
LABEL_11:
      char v4 = 0;
      goto LABEL_12;
    }
    char v4 = 1;
LABEL_12:
    uint64_t v3 = 0;
    *a3 = v4;
  }
  return v3;
}

uint64_t Img4DecodeRestoreInfoExists(void *a1, char *a2)
{
  return Img4DecodeSectionExists(a1, 1u, a2);
}

uint64_t Img4DecodeGetRestoreInfoBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  return Img4DecodeGetBooleanFromSection(a1, 1u, a2, a3);
}

uint64_t Img4DecodeGetBooleanFromSection(uint64_t a1, unsigned int a2, uint64_t a3, BOOL *a4)
{
  memset(v8, 0, sizeof(v8));
  uint64_t v4 = 6;
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 1uLL, v8);
      uint64_t v4 = v6;
      if (!v6) {
        return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
      }
    }
  }
  return v4;
}

void Img4DecodeGetRestoreInfoInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
}

void Img4DecodeGetIntegerFromSection(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (DERParseInteger((char **)&v6[1] + 1, a4)) {
          *a4 = 0;
        }
      }
    }
  }
}

void Img4DecodeGetRestoreInfoInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
}

void Img4DecodeGetInteger64FromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (DERParseInteger64((char **)&v6[1] + 1, a4)) {
          *a4 = 0;
        }
      }
    }
  }
}

void Img4DecodeGetRestoreInfoData(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
}

void Img4DecodeGetDataFromSection(uint64_t a1, unsigned int a2, uint64_t a3, void *a4, void *a5)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      *a5 = 0;
      *a4 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
      *a5 = v8;
    }
  }
}

uint64_t Img4DecodePayloadPropertiesExists(uint64_t a1, BOOL *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 6;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t result = 6;
  memset(v7, 0, sizeof(v7));
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v5 = a1 + 8;
    if (v6)
    {
      uint64_t result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v7);
      if (!result) {
        *a2 = (void)v8 != 0;
      }
    }
  }
  return result;
}

void Img4DecodePayloadProperty(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (a4)
    {
      if (*(void *)(a1 + 8))
      {
        long long v10 = 0uLL;
        long long v9 = 0uLL;
        memset(v11, 0, sizeof(v11));
        memset(v12, 0, sizeof(v12));
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)v11))
        {
          if (*(void *)&v12[0])
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)v12, 0x2000000000000010, &v10);
            if (!v7)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011, &v9);
              if (!v8) {
                DERImg4DecodeFindProperty((unint64_t *)&v9, a2, a3, a4);
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePayloadPropertyExistsByTag(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a1)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0uLL;
    long long v9 = 0uLL;
    long long v8 = 0uLL;
    if (a3)
    {
      if (*(void *)(a1 + 8))
      {
        long long v19 = 0uLL;
        long long v20 = 0uLL;
        long long v17 = 0uLL;
        long long v18 = 0uLL;
        long long v15 = 0uLL;
        long long v16 = 0uLL;
        long long v13 = 0uLL;
        long long v14 = 0uLL;
        long long v11 = 0uLL;
        long long v12 = 0uLL;
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)&v11))
        {
          if ((void)v17)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v17, 0x2000000000000010, &v10);
            if (!v5)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011, &v9);
              if (!v6)
              {
                DERImg4DecodeContentFindItemWithTag((unint64_t *)&v9, a2, &v8);
                if (!v7) {
                  *a3 = (void)v8 != 0;
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeGetPayloadProperties(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 6;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t result = 6;
  memset(v8, 0, sizeof(v8));
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v5 = a1 + 8;
    if (v6)
    {
      uint64_t result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v8);
      if (!result)
      {
        if ((void)v9)
        {
          uint64_t result = 0;
          uint64_t v7 = *((void *)&v9 + 1);
          *a2 = v9;
          a2[1] = v7;
          return result;
        }
        return 6;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeCopyPayloadPropertiesDigest(void *a1, void *a2, size_t a3, uint64_t (**a4)(void, void, _OWORD *, size_t, void))
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t result = 6;
  if (a1 && a2 && a3)
  {
    if (a3 > 0x30)
    {
      return 7;
    }
    else if (a4)
    {
      long long v8 = *a4;
      if (*a4)
      {
        memset(v9, 0, sizeof(v9));
        uint64_t result = v8(*a1, a1[1], v9, a3, a4);
        if (!result)
        {
          memcpy(a2, v9, a3);
          return 0;
        }
      }
    }
  }
  return result;
}

void Img4DecodePayloadPropertiesFindItemWithTag(unint64_t *a1, unsigned int a2, void *a3)
{
  if (a1)
  {
    v23[0] = 0;
    v23[1] = 0;
    v22[0] = 0;
    v22[1] = 0;
    v21[0] = 0;
    v21[1] = 0;
    unint64_t v20 = 0;
    v19[0] = 0;
    v19[1] = 0;
    unint64_t v18 = 0;
    memset(v17, 0, sizeof(v17));
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    unint64_t v14 = 0;
    long long v13 = 0uLL;
    long long v12 = 0uLL;
    long long v11 = 0uLL;
    if (a3)
    {
      if (*a1)
      {
        DERImg4DecodeContentFindItemWithTag(a1, 0x2000000000000010, &v11);
        if (!v5)
        {
          if ((void)v11)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 22, &v13);
            if (!v6 && !DERImg4DecodeTagCompare((uint64_t)&v13, 0x50415950u))
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 0x2000000000000011, &v12);
              if (!v7 && !DERDecodeSeqContentInit((unint64_t *)&v12, v23))
              {
                while (1)
                {
                  do
                  {
                    while (1)
                    {
                      int v8 = DERDecodeSeqNext(v23, &v20);
                      if (!v8) {
                        break;
                      }
                      if (v8 == 1) {
                        return;
                      }
                    }
                  }
                  while (DERDecodeItem((uint64_t)v21, &v18));
                  DERImg4DecodeContentFindItemWithTag(v19, 22, &v13);
                  if (v9) {
                    break;
                  }
                  if (!DERImg4DecodeTagCompare((uint64_t)&v13, a2)
                    && !DERDecodeSeqContentInit(v19, v22)
                    && !DERDecodeSeqNext(v22, v17)
                    && v17[0] == 22
                    && !DERDecodeSeqNext(v22, &v14))
                  {
                    if (v15)
                    {
                      uint64_t v10 = v16;
                      *a3 = v15;
                      a3[1] = v10;
                    }
                    return;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodeGetPayloadPropertiesBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 1uLL, (unint64_t)v5);
  if (!v4) {
    DERParseBoolean((unsigned __int8 **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 2uLL, (unint64_t)v5);
  if (!v4) {
    DERParseInteger((char **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 2uLL, (unint64_t)v5);
  if (!v4) {
    DERParseInteger64((char **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesData(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  Img4DecodePayloadProperty(a1, a2, 4uLL, (unint64_t)&v8);
  if (!v6)
  {
    uint64_t v7 = v10;
    *a3 = *((void *)&v9 + 1);
    *a4 = v7;
  }
}

double Img4DecodeGetObjectProperty(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  v14[0] = 0;
  v14[1] = 0;
  double result = 0.0;
  memset(v13, 0, sizeof(v13));
  if (a1)
  {
    if (a5)
    {
      DERImg4DecodeParseManifestProperties(a1, (unint64_t)v14, 0);
      if (v10
        || (DERImg4DecodeFindProperty(v14, a2 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v13), v11)
        || (DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, a3, a4, (unint64_t)a5), v12))
      {
        double result = 0.0;
        a5[1] = 0u;
        a5[2] = 0u;
        *a5 = 0u;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeGetObjectPropertyBoolean(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  memset(v8, 0, sizeof(v8));
  uint64_t v4 = 6;
  if (a1 && a4)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 1uLL, v8);
    if (!v6) {
      return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
    }
    return v6;
  }
  return v4;
}

void Img4DecodeGetObjectPropertyInteger(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (v5 || DERParseInteger((char **)&v6[1] + 1, a4)) {
        *a4 = 0;
      }
    }
  }
}

void Img4DecodeGetObjectPropertyInteger64(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (v5 || DERParseInteger64((char **)&v6[1] + 1, a4)) {
        *a4 = 0;
      }
    }
  }
}

void Img4DecodeGetObjectPropertyData(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      uint64_t v8 = 0;
      *a4 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
    }
    *a5 = v8;
  }
}

void Img4DecodeGetObjectPropertyString(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 0x16uLL, &v9);
    if (v7)
    {
      uint64_t v8 = 0;
      *a4 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
    }
    *a5 = v8;
  }
}

void Img4DecodeGetPayloadVersionPropertyString(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (a3 && a4)
  {
    uint64_t v14 = 0;
    v15[0] = 0;
    v15[1] = 0;
    memset(v13, 0, sizeof(v13));
    long long v12 = 0uLL;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    if (DERDecodeItem(a1, (unint64_t *)&v14)
      || DERImg4DecodeProperty(v15, v14, (uint64_t)v13)
      || (DERImg4DecodeContentFindItemWithTag((unint64_t *)&v13[1] + 1, a2, &v12), v7)
      || DERImg4DecodeProperty(&v12, a2, (uint64_t)&v9))
    {
      uint64_t v8 = 0;
      *a3 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a3 = *((void *)&v10 + 1);
    }
    *a4 = v8;
  }
}

double Img4DecodeGetPropertyFromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  *(_OWORD *)long long v13 = 0uLL;
  if (a2 <= 1 && a1 && a5)
  {
    char v14 = 0;
    if (!Img4DecodeSectionExists((void *)a1, a2, &v14) && v14)
    {
      if (a2)
      {
        *(_OWORD *)long long v13 = *(_OWORD *)(a1 + 440);
        goto LABEL_9;
      }
      DERImg4DecodeParseManifestProperties(a1, 0, (unint64_t)v13);
      if (!v10)
      {
LABEL_9:
        DERImg4DecodeFindProperty(v13, a3, a4, (unint64_t)a5);
        if (!v12) {
          return result;
        }
      }
    }
    double result = 0.0;
    a5[1] = 0u;
    a5[2] = 0u;
    *a5 = 0u;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!result)
  {
    if (*((void *)&v9 + 1) != 2)
    {
      uint64_t result = 2;
      if (!a3) {
        return result;
      }
      goto LABEL_6;
    }
    if (!a3) {
      return 6;
    }
    uint64_t result = DERParseInteger((char **)&v8 + 1, a3);
  }
  if (!a3) {
    return result;
  }
LABEL_6:
  if (result) {
    *a3 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!result)
  {
    if (*((void *)&v9 + 1) != 2)
    {
      uint64_t result = 2;
      if (!a3) {
        return result;
      }
      goto LABEL_6;
    }
    if (!a3) {
      return 6;
    }
    uint64_t result = DERParseInteger64((char **)&v8 + 1, a3);
  }
  if (!a3) {
    return result;
  }
LABEL_6:
  if (result) {
    *a3 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!result)
  {
    if (*((void *)&v9 + 1) == 1)
    {
      if (a3) {
        return DERParseBoolean((unsigned __int8 **)&v8 + 1, a3);
      }
      else {
        return 6;
      }
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t Img4DecodeGetPropertyData(uint64_t *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  uint64_t result = 6;
  if (a3 && a4)
  {
    uint64_t v8 = *a1;
    uint64_t v9 = *((unsigned int *)a1 + 2);
    v11[0] = v8;
    v11[1] = v9;
    uint64_t result = DERImg4DecodeProperty(v11, a2 | 0xE000000000000000, (uint64_t)&v12);
    if (!result)
    {
      if (*((void *)&v14 + 1) == 4)
      {
        uint64_t result = 0;
        *a3 = *((void *)&v13 + 1);
        int v10 = v14;
LABEL_6:
        *a4 = v10;
        return result;
      }
      uint64_t result = 2;
    }
    int v10 = 0;
    *a3 = 0;
    goto LABEL_6;
  }
  return result;
}

void Img4DecodeEvaluateCertificateProperties(void *a1)
{
}

void Img4DecodeEvaluateCertificatePropertiesInternal(void *a1, _OWORD *a2)
{
  v21[0] = 0;
  v21[1] = 0;
  v20[0] = 0;
  v20[1] = 0;
  uint64_t v19 = 0;
  long long v18 = 0uLL;
  size_t __n = 0;
  uint64_t v17 = 0;
  uint64_t v14 = 0;
  __s1 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  memset(v9, 0, sizeof(v9));
  long long __s2 = 0uLL;
  long long v7 = 0uLL;
  if (a1 && a1[40] && !DERDecodeSeqInit((uint64_t)(a1 + 39), &v19, v21) && v19 == 0x2000000000000011)
  {
    while (1)
    {
      if (DERDecodeSeqNext(v21, (unint64_t *)&v17)) {
        return;
      }
      uint64_t v4 = (long long *)(a1 + 7);
      switch(v17)
      {
        case 0xE00000004D414E50:
LABEL_11:
          long long v7 = *v4;
          if (DERImg4DecodeProperty(&v18, v17, (uint64_t)&v11)
            || *((void *)&v13 + 1) != 0x2000000000000011
            || DERDecodeSeqContentInit((unint64_t *)&v12 + 1, v20))
          {
            return;
          }
          while (1)
          {
            int v5 = DERDecodeSeqNext(v20, (unint64_t *)&v14);
            if (v5) {
              break;
            }
            if (DERImg4DecodeProperty(&__s1, v14, (uint64_t)v9)) {
              return;
            }
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v7, v14, &__s2);
            if (*((void *)&v10 + 1) <= 4uLL && ((1 << SBYTE8(v10)) & 0x16) != 0)
            {
              if (v6) {
                return;
              }
              if (__n != *((void *)&__s2 + 1)) {
                return;
              }
              int v6 = memcmp(__s1, (const void *)__s2, __n);
              if (v6) {
                return;
              }
            }
            else if (*((void *)&v10 + 1) != 0xA000000000000000)
            {
              if (*((void *)&v10 + 1) != 0xA000000000000001 || v6 != 1) {
                return;
              }
              int v6 = 0;
            }
            if (v6) {
              return;
            }
          }
          if (v5 != 1) {
            return;
          }
          break;
        case 0xE00000006D616E78:
          if (a2) {
            *a2 = v18;
          }
          break;
        case 0xE00000004F424A50:
          uint64_t v4 = (long long *)(a1 + 9);
          if (a1[9]) {
            goto LABEL_11;
          }
          uint64_t v4 = (long long *)(a1 + 9);
          if (a1[10]) {
            goto LABEL_11;
          }
          break;
        default:
          return;
      }
    }
  }
}

void Img4DecodeCopyManifestTrustedBootPolicyMeasurement(void *a1, uint64_t a2, uint64_t a3, void *a4, size_t a5)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a4)
  {
    if (a5)
    {
      if (a5 <= 0x30)
      {
        memset(v17, 0, sizeof(v17));
        memset(v16, 0, sizeof(v16));
        v10[0] = Img4DecodeDigestInit;
        v10[1] = Img4DecodeDigestUpdate;
        _OWORD v10[2] = Img4DecodeDigestReturnHash;
        *(void *)&long long v13 = &default_manifest_property_exclude;
        *((void *)&v13 + 1) = 156;
        uint64_t v14 = a3;
        uint64_t v15 = v10;
        Img4DecodeEvaluateCertificatePropertiesInternal(a1, &v13);
        if (!v9)
        {
          if (a1)
          {
            if (a2)
            {
              v11[0] = &v13;
              v11[1] = a2;
              void v11[2] = a1;
              long long v12 = v17;
              if (!((unsigned int (*)(void, unsigned char **))*v15)(*(void *)(v14 + 32), &v12)
                && !Img4DecodeEvaluateDictionaryProperties(a1 + 7, 0, (uint64_t (*)(unint64_t, uint64_t *, uint64_t, uint64_t))_Img4DecodeValidateManifestPropertyInterposer, (uint64_t)v11)&& !((unsigned int (*)(void, unsigned char **, uint64_t, unsigned char *))v15[2])(*(void *)(v14 + 32), &v12, 48, v16))
              {
                memcpy(a4, v16, a5);
              }
            }
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeEvaluateManifestProperties(uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 56), 0, a2, a3);
}

uint64_t Img4DecodeEvaluateDictionaryProperties(unint64_t *a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v15 = 0;
  unint64_t v16 = 0;
  unint64_t v14 = 0;
  v13[0] = 0;
  v13[1] = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = 0;
  memset(v8, 0, sizeof(v8));
  long long v9 = 0u;
  if (!a3) {
    return 6;
  }
  uint64_t result = (uint64_t)DERDecodeSeqContentInit(a1, v13);
  if (!result)
  {
    while (1)
    {
      uint64_t result = DERDecodeSeqNext(v13, &v14);
      if (result == 1) {
        return 0;
      }
      if (result) {
        return result;
      }
      uint64_t result = DERImg4DecodeProperty(&v15, v14, (uint64_t)v8);
      if (result) {
        return result;
      }
      uint64_t result = 2;
      if (*((void *)&v9 + 1) > 0x16uLL
        || ((1 << SBYTE8(v9)) & 0x400016) == 0
        || !(v14 >> 62)
        || (v14 & 0x2000000000000000) == 0)
      {
        return result;
      }
      if (HIDWORD(v16)) {
        break;
      }
      uint64_t v10 = v15;
      LODWORD(v11) = v16;
      uint64_t v12 = *((void *)&v9 + 1);
      uint64_t result = a3(v14, &v10, a2, a4);
      if (result) {
        return result;
      }
    }
    return 7;
  }
  return result;
}

uint64_t Img4DecodeEvaluateObjectProperties(uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 72), 1, a2, a3);
}

double Img4DecodeInit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a3)
    {
      v9[0] = a1;
      v9[1] = a2;
      long long v7 = 0u;
      long long v8 = 0u;
      long long v5 = 0u;
      long long v6 = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 128) = 0u;
      *(_OWORD *)(a3 + 144) = 0u;
      *(_OWORD *)(a3 + 160) = 0u;
      *(_OWORD *)(a3 + 176) = 0u;
      *(_OWORD *)(a3 + 192) = 0u;
      *(_OWORD *)(a3 + 208) = 0u;
      *(_OWORD *)(a3 + 224) = 0u;
      *(_OWORD *)(a3 + 240) = 0u;
      *(_OWORD *)(a3 + 256) = 0u;
      *(_OWORD *)(a3 + 272) = 0u;
      *(_OWORD *)(a3 + 288) = 0u;
      *(_OWORD *)(a3 + 304) = 0u;
      *(_OWORD *)(a3 + 320) = 0u;
      *(_OWORD *)(a3 + 336) = 0u;
      *(_OWORD *)(a3 + 352) = 0u;
      *(_OWORD *)(a3 + 368) = 0u;
      *(_OWORD *)(a3 + 384) = 0u;
      *(_OWORD *)(a3 + 400) = 0u;
      *(_OWORD *)(a3 + 416) = 0u;
      *(_OWORD *)(a3 + 432) = 0u;
      *(void *)(a3 + 448) = 0;
      if (!DERImg4Decode(v9, (unint64_t)&v5)
        && !DERImg4DecodePayload((uint64_t)&v6, a3 + 88)
        && !DERImg4DecodeManifest(&v7, a3 + 232)
        && !DERImg4DecodeRestoreInfo((uint64_t)&v8, a3 + 424))
      {
        *(_OWORD *)(a3 + 8) = v6;
        double result = *(double *)&v7;
        *(_OWORD *)(a3 + 24) = v7;
      }
    }
  }
  return result;
}

double Img4DecodeInitPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a3)
  {
    *(void *)&long long v5 = a1;
    *((void *)&v5 + 1) = a2;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 96) = 0u;
    *(_OWORD *)(a3 + 112) = 0u;
    *(_OWORD *)(a3 + 128) = 0u;
    *(_OWORD *)(a3 + 144) = 0u;
    *(_OWORD *)(a3 + 160) = 0u;
    *(_OWORD *)(a3 + 176) = 0u;
    *(_OWORD *)(a3 + 192) = 0u;
    *(_OWORD *)(a3 + 208) = 0u;
    *(_OWORD *)(a3 + 224) = 0u;
    *(_OWORD *)(a3 + 240) = 0u;
    *(_OWORD *)(a3 + 256) = 0u;
    *(_OWORD *)(a3 + 272) = 0u;
    *(_OWORD *)(a3 + 288) = 0u;
    *(_OWORD *)(a3 + 304) = 0u;
    *(_OWORD *)(a3 + 320) = 0u;
    *(_OWORD *)(a3 + 336) = 0u;
    *(_OWORD *)(a3 + 352) = 0u;
    *(_OWORD *)(a3 + 368) = 0u;
    *(_OWORD *)(a3 + 384) = 0u;
    *(_OWORD *)(a3 + 400) = 0u;
    *(_OWORD *)(a3 + 416) = 0u;
    *(_OWORD *)(a3 + 432) = 0u;
    *(void *)(a3 + 448) = 0;
    if (!DERImg4DecodePayload((uint64_t)&v5, a3 + 88))
    {
      double result = *(double *)&v5;
      *(_OWORD *)(a3 + 8) = v5;
    }
  }
  return result;
}

uint64_t Img4DecodeInitManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 1, a3, 1229796429);
}

uint64_t Img4DecodeInitManifestCommon(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t result = 6;
  if (a1 && a4)
  {
    uint64_t v15 = a1;
    uint64_t v16 = a2;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 80) = 0u;
    *(_OWORD *)(a4 + 96) = 0u;
    *(_OWORD *)(a4 + 112) = 0u;
    *(_OWORD *)(a4 + 128) = 0u;
    *(_OWORD *)(a4 + 144) = 0u;
    *(_OWORD *)(a4 + 160) = 0u;
    *(_OWORD *)(a4 + 176) = 0u;
    *(_OWORD *)(a4 + 192) = 0u;
    *(_OWORD *)(a4 + 208) = 0u;
    *(_OWORD *)(a4 + 224) = 0u;
    *(_OWORD *)(a4 + 240) = 0u;
    *(_OWORD *)(a4 + 256) = 0u;
    *(_OWORD *)(a4 + 272) = 0u;
    *(_OWORD *)(a4 + 288) = 0u;
    *(_OWORD *)(a4 + 304) = 0u;
    *(_OWORD *)(a4 + 320) = 0u;
    *(_OWORD *)(a4 + 336) = 0u;
    *(_OWORD *)(a4 + 352) = 0u;
    *(_OWORD *)(a4 + 368) = 0u;
    *(_OWORD *)(a4 + 384) = 0u;
    *(_OWORD *)(a4 + 400) = 0u;
    *(_OWORD *)(a4 + 416) = 0u;
    *(_OWORD *)(a4 + 432) = 0u;
    *(void *)(a4 + 448) = 0;
    if (a5 == 1229796419)
    {
      unint64_t v10 = a4 + 232;
      if (a3) {
        uint64_t result = DERImg4DecodeCertificate(&v15, v10);
      }
      else {
        uint64_t result = DERImg4DecodeUnsignedCertificate(&v15, v10);
      }
    }
    else
    {
      if (a5 != 1229796429) {
        return 2;
      }
      unint64_t v9 = a4 + 232;
      if (a3) {
        uint64_t result = DERImg4DecodeManifest(&v15, v9);
      }
      else {
        uint64_t result = DERImg4DecodeUnsignedManifest(&v15, v9);
      }
    }
    if (!result)
    {
      if (*(void *)(a4 + 264))
      {
        unint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = a1;
        uint64_t v16 = a2;
        uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)&v15, &v12, 0);
        if (!result)
        {
          *(void *)(a4 + 24) = a1;
          uint64_t v11 = v14 + v13 - a1;
          if (__CFADD__(v14, v13 - a1))
          {
            __break(0x5500u);
          }
          else
          {
            *(void *)(a4 + 32) = v11;
            if (v11 == a2) {
              return 0;
            }
            else {
              return 7;
            }
          }
        }
      }
      else
      {
        return 3;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeInitUnsignedManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 0, a3, 1229796429);
}

uint64_t Img4DecodeInitCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 1, a3, 1229796419);
}

uint64_t Img4DecodeInitUnsignedCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 0, a3, 1229796419);
}

uint64_t Img4DecodeEvaluateCertificateChain(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = 6;
  if (a1 && a2 && a3 && a4 && a7 && a6)
  {
    unint64_t v9 = *(void (**)(uint64_t))(a4 + 8);
    if (v9)
    {
      v9(a1);
      return 3;
    }
  }
  return result;
}

void Img4DecodeEvaluateTrustWithCallbacks(unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), unsigned int (*a4)(void, void, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), unsigned int (*a5)(uint64_t, uint64_t), void (*a6)(void, void, uint64_t), uint64_t a7)
{
  memset(v17, 0, sizeof(v17));
  if (a2)
  {
    if (a3)
    {
      if (*(void *)(a2 + 24))
      {
        BOOL v16 = 0;
        a6(*(void *)(a2 + 264), *(void *)(a2 + 272), a2 + 376);
        if (!a4(*(void *)(a2 + 296), *(unsigned int *)(a2 + 304), *(void *)(a2 + 280), *(unsigned int *)(a2 + 288), a2 + 376, 20, a2 + 312, a2 + 320, a7))
        {
          DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
          if (!v14)
          {
            DERImg4DecodeFindProperty((unint64_t *)(a2 + 40), a1 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v17);
            if (!v15)
            {
              *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v17[1] + 8);
              if (!a5(a2, a7) && !Img4DecodePayloadExists(a2, &v16))
              {
                if (v16)
                {
                  a6(*(void *)(a2 + 8), *(void *)(a2 + 16), a2 + 184);
                  *(unsigned char *)a2 = 1;
                }
                if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0, a3, a7)
                  && !Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1, a3, a7))
                {
                  a6(*(void *)(a2 + 24), *(void *)(a2 + 32), a2 + 328);
                  *(unsigned char *)(a2 + 1) = 1;
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePerformTrustEvaluation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[1] = 0;
  v5[2] = 0;
  v5[0] = a3;
  _Img4DecodePerformTrustEvaluationWithCallbacksInternal(a1, a2, (uint64_t)v5, a4, 0, a5);
}

void Img4DecodePerformTrustEvaluatationWithCallbacks(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void Img4DecodePerformTrustEvaluatation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[1] = 0;
  v5[2] = 0;
  v5[0] = a3;
  _Img4DecodePerformTrustEvaluationWithCallbacksInternal(a1, a2, (uint64_t)v5, a4, 0, a5);
}

uint64_t Img4DecodeVerifyChainIM4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, uint64_t a9, uint64_t a10)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v41 = 0;
  long long v39 = 0u;
  memset(v40, 0, sizeof(v40));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t result = 6;
  long long v17 = 0u;
  long long v18 = 0u;
  if (a3 && a4 && a5 && a6 && a7 && a8 && a9)
  {
    if (Img4DecodeInitManifestCommon(a3, a4, 1, (uint64_t)&v17, 1229796419)
      || (*(unsigned int (**)(void, void, char *, void, uint64_t))a9)(*((void *)&v33 + 1), v34, (char *)v40 + 8, **(void **)(a9 + 32), a9)|| (*(unsigned int (**)(uint64_t, uint64_t, void, void, char *, void, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))(a9 + 16))(a1, a2, *((void *)&v34 + 1), v35, (char *)v40 + 8, **(void **)(a9 + 32), a9, a10, v17, *((void *)&v17 + 1), v18, *((void *)&v18 + 1), v19,
           *((void *)&v19 + 1),
           v20,
           *((void *)&v20 + 1),
           v21,
           *((void *)&v21 + 1),
           v22,
           *((void *)&v22 + 1),
           v23,
           *((void *)&v23 + 1),
           v24,
           *((void *)&v24 + 1),
           v25,
           *((void *)&v25 + 1),
           v26,
           *((void *)&v26 + 1),
           v27,
           *((void *)&v27 + 1),
           v28,
           *((void *)&v28 + 1),
           v29,
           *((void *)&v29 + 1),
           v30,
           *((void *)&v30 + 1),
           v31,
           *((void *)&v31 + 1),
           v32,
           *((void *)&v32 + 1),
           v33))
    {
      return 0xFFFFFFFFLL;
    }
    else if (DERImg4DecodeCertificatePropertiesAndPubKey(*((uint64_t *)&v33 + 1), v34, a7, a8, a5, a6))
    {
      return 0xFFFFFFFFLL;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void Img4DecodePerformTrustEvaluationWithCallbacks(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void _Img4DecodePerformTrustEvaluationWithCallbacksInternal(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  memset(v24, 0, sizeof(v24));
  if (a2)
  {
    if (a3)
    {
      BOOL v21 = 0;
      if (a4)
      {
        if (*(void *)a3)
        {
          if (*(void *)a4)
          {
            if (*(void *)(a4 + 24))
            {
              if (*(void *)(a4 + 8))
              {
                if (*(void *)(a4 + 16))
                {
                  unint64_t v9 = *(void **)(a4 + 32);
                  if (v9)
                  {
                    if (*(void *)(a2 + 24) && *v9 <= 0x30uLL && !(*(unsigned int (**)(void))a4)())
                    {
                      *(unsigned char *)(a2 + 1) = 1;
                      uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 8);
                      if (v13
                        && (int v14 = (const void *)v13(a2, a6)) != 0
                        && !memcmp((const void *)(a2 + 328), v14, **(void **)(a4 + 32)))
                      {
                        int v15 = 0;
                      }
                      else
                      {
                        if ((*(unsigned int (**)(void, void, uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8))(*(void *)(a2 + 296), *(void *)(a2 + 304), &v22, &v23, a2 + 312, a2 + 320, a4, a6)|| **(void **)(a4 + 32) > 0x30uLL|| (*(unsigned int (**)(void, void, uint64_t))a4)(*(void *)(a2 + 264), *(void *)(a2 + 272), a2 + 376)|| (*(unsigned int (**)(uint64_t, uint64_t, void, void, uint64_t, void, uint64_t, uint64_t))(a4 + 16))(v22, v23, *(void *)(a2 + 280), *(void *)(a2 + 288), a2 + 376,
                               **(void **)(a4 + 32),
                               a4,
                               a6))
                        {
                          return;
                        }
                        int v15 = 1;
                      }
                      DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
                      if (v16) {
                        return;
                      }
                      if ((a5 & 1) == 0)
                      {
                        long long v17 = *(unsigned int (**)(unint64_t *, unint64_t, uint64_t, _OWORD *, uint64_t))(a3 + 16);
                        unint64_t v18 = a1 | 0xE000000000000000;
                        long long v19 = (unint64_t *)(a2 + 40);
                        if (v17)
                        {
                          if (v17(v19, v18, 0x2000000000000011, v24, a6)) {
                            return;
                          }
                        }
                        else
                        {
                          DERImg4DecodeFindProperty(v19, v18, 0x2000000000000011uLL, (unint64_t)v24);
                          if (v20) {
                            return;
                          }
                        }
                        *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v24[1] + 8);
                      }
                      if ((!v15 || !(*(unsigned int (**)(uint64_t, uint64_t))(a4 + 24))(a2, a6))
                        && **(void **)(a4 + 32) <= 0x30uLL
                        && !Img4DecodePayloadExists(a2, &v21))
                      {
                        if (v21)
                        {
                          if ((*(unsigned int (**)(void, void, uint64_t, void, uint64_t))a4)(*(void *)(a2 + 8), *(void *)(a2 + 16), a2 + 184, **(void **)(a4 + 32), a4))
                          {
                            return;
                          }
                          *(unsigned char *)a2 = 1;
                        }
                        if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6)&& (a5 & 1) == 0)
                        {
                          Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePerformManifestTrustEvaluationWithCallbacks(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t _Img4DecodeValidateManifestPropertyInterposer(unsigned int a1, uint64_t a2, int a3, uint64_t a4)
{
  unsigned int v10 = a1;
  if (a3) {
    return 0xFFFFFFFFLL;
  }
  long long v8 = *(void **)a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  v12[0] = 0;
  v12[1] = 0;
  memset(v11, 0, sizeof(v11));
  if (v8
    && !DERImg4DecodeProperty(v8, 0xE00000006D616E78, (uint64_t)&v13)
    && *((void *)&v15 + 1) == 0x2000000000000011
    && !DERDecodeSeqContentInit((unint64_t *)&v14 + 1, v12))
  {
    unint64_t v9 = a1 | 0xE000000000000000;
    while (!DERDecodeSeqNext(v12, v11))
    {
      if (v11[0] == v9)
      {
        (*(void (**)(void, uint64_t, uint64_t, unsigned int *))(*(void *)(*(void *)a4 + 24) + 8))(*(void *)(*(void *)(*(void *)a4 + 16) + 32), a4 + 24, 4, &v10);
        return 0;
      }
    }
  }
  (*(void (**)(void, uint64_t, void, void))(*(void *)(*(void *)a4 + 24) + 8))(*(void *)(*(void *)(*(void *)a4 + 16) + 32), a4 + 24, *(unsigned int *)(a2 + 8), *(void *)a2);
  return 0;
}

uint64_t sha1_digest()
{
  return ccdigest();
}

uint64_t verify_signature_rsa3k(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0xFFFFFFFFLL;
  }
  if (!a6) {
    return 0xFFFFFFFFLL;
  }
  if (!a7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = *(void *)(a7 + 32);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  long long v8 = *(void ***)(v7 + 16);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v9 = *v8;
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  if (*v9 != a6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = verify_pkcs1_sig((uint64_t)v13, v9[4], (uint64_t)v11, (uint64_t)v12, 3072);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t verify_pkcs1_sig(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v18[4] = *MEMORY[0x263EF8340];
  if (a5 != 4096 && a5 != 3072) {
    return 0xFFFFFFFFLL;
  }
  v18[2] = 0;
  v18[3] = 0;
  unint64_t v6 = (unint64_t)(a5 + 63) >> 6;
  MEMORY[0x270FA5388](a1, (24 * v6 + 71) & 0x7FFFFFFFFFFFFFE0);
  long long v8 = (unint64_t *)((char *)v17 - v7);
  bzero((char *)v17 - v7, v7);
  unint64_t *v8 = v6;
  uint64_t v9 = *(unsigned int *)(a1 + 8);
  v18[0] = *(void *)a1;
  v18[1] = v9;
  memset(v17, 0, sizeof(v17));
  uint64_t result = DERParseSequenceToObject((uint64_t)v18, (unsigned __int16)DERNumRSAPubKeyPKCS1ItemSpecs, (uint64_t)&DERRSAPubKeyPKCS1ItemSpecs, (unint64_t)v17, 0x20uLL, 0x20uLL);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v11 = *((void *)&v17[0] + 1);
  for (uint64_t i = *(unsigned char **)&v17[0]; v11; --v11)
  {
    if (*i) {
      break;
    }
    if (i == (unsigned char *)-1) {
      __break(0x5513u);
    }
    ++i;
  }
  if (v11 >= 0xFFFFFFFFFFFFFFF8)
  {
    __break(0x5500u);
    return result;
  }
  unint64_t v13 = (v11 + 7) >> 3;
  if (v13 > *v8) {
    return 0xFFFFFFFFLL;
  }
  unint64_t *v8 = v13;
  if (ccrsa_make_pub()) {
    return 0xFFFFFFFFLL;
  }
  if (MEMORY[0x263EF87F8]) {
    BOOL v14 = MEMORY[0x263EF8010] == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    int v16 = ccrsa_verify_pkcs1v15_digest();
    if (!v16 && !cc_cmp_safe()) {
      return 0;
    }
    return 0xFFFFFFFFLL;
  }
  LOBYTE(v17[0]) = 0;
  int v15 = ccrsa_verify_pkcs1v15();
  uint64_t result = 0xFFFFFFFFLL;
  if (!v15 && LOBYTE(v17[0])) {
    return 0;
  }
  return result;
}

uint64_t verify_signature_rsa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0xFFFFFFFFLL;
  }
  if (!a6) {
    return 0xFFFFFFFFLL;
  }
  if (!a7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = *(void *)(a7 + 32);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  long long v8 = *(void ***)(v7 + 16);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = *v8;
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  if (*v9 != a6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = verify_pkcs1_sig((uint64_t)v13, v9[4], (uint64_t)v11, (uint64_t)v12, 4096);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

void verify_signature_ecdsa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              if (a7)
              {
                uint64_t v7 = *(void **)(a7 + 32);
                if (v7)
                {
                  if (v7[2] && *(void *)(a7 + 48) && *v7 == a6)
                  {
                    v8[0] = a1;
                    v8[1] = a2;
                    verify_ecdsa_sig(v8);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void verify_ecdsa_sig(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v12[7] = 0;
  ccec_x963_import_pub_size();
  if (ccec_keysize_is_supported())
  {
    cp = (void *)ccec_get_cp();
    uint64_t v3 = *cp;
    if (*cp >> 61 || !is_mul_ok(8 * v3, 3uLL))
    {
      __break(0x550Cu);
    }
    else
    {
      uint64_t v4 = 24 * v3;
      BOOL v5 = __CFADD__(v4, 16);
      uint64_t v6 = v4 + 16;
      if (!v5)
      {
        BOOL v5 = __CFADD__(v6, 16);
        uint64_t v7 = v6 + 16;
        if (!v5)
        {
          long long v8 = cp;
          unint64_t v9 = v7 - 1;
          MEMORY[0x270FA5388](cp, (v7 - 1) & 0xFFFFFFFFFFFFFFF0);
          unint64_t v11 = &v12[-v10];
          bzero(&v12[-v10], v10);
          if (v9 < 0x10)
          {
            __break(1u);
          }
          else
          {
            void *v11 = v8;
            if (!MEMORY[0x230FAEF50](v8, a1[1], *a1, v11)) {
              ccec_verify();
            }
          }
          return;
        }
      }
    }
    __break(0x5500u);
  }
}

uint64_t verify_chain_img4_v1(unint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v9 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(&v28, 0x2F0uLL);
        v26[0] = a1;
        v26[1] = v9;
        v27[0] = &ROOT_CA_CERTIFICATE;
        v27[1] = 1215;
        if (!_crack_chain_with_anchor(v26, (uint64_t)v27, 3u)
          && !parse_chain((uint64_t)v27, 3u, (uint64_t)&v29, (uint64_t)v31, (uint64_t)v34, (uint64_t)v37))
        {
          long long v24 = a6;
          uint64_t v15 = 0;
          int v16 = (const void **)v32;
          long long v17 = &v30;
          unint64_t v18 = (const void **)v32;
          while (1)
          {
            long long v19 = &v26[20 * v15];
            size_t v20 = v19[37];
            BOOL v21 = *v18;
            v18 += 20;
            if ((const void *)v20 != v21) {
              break;
            }
            if (memcmp((const void *)v19[36], *(v16 - 1), v20)) {
              break;
            }
            uint64_t result = verify_chain_signatures(&v34[v15], v17, a7);
            if (result) {
              break;
            }
            v17 += 6;
            ++v15;
            int v16 = v18;
            if (v15 == 2)
            {
              long long v25 = 0uLL;
              if ((unint64_t)v31 > 0xFFFFFFFFFFFFFF5FLL)
              {
LABEL_34:
                __break(0x5513u);
                return result;
              }
              v42[0] = 0;
              v42[1] = 0;
              unint64_t v40 = 0;
              v41[0] = 0;
              v41[1] = 0;
              if (DERDecodeSeqContentInit(v33, v42)) {
                return 0xFFFFFFFFLL;
              }
LABEL_14:
              if (!DERDecodeSeqNext(v42, &v40) && v40 == 0x2000000000000011)
              {
                v47[0] = 0;
                v47[1] = 0;
                unint64_t v45 = 0;
                v46[0] = 0;
                v46[1] = 0;
                long long v43 = 0u;
                long long v44 = 0u;
                if (!DERDecodeSeqContentInit(v41, v47))
                {
                  do
                  {
                    int v22 = DERDecodeSeqNext(v47, &v45);
                    if (v22)
                    {
                      if (v22 == 1) {
                        goto LABEL_14;
                      }
                      return 0xFFFFFFFFLL;
                    }
                    if (v45 != 0x2000000000000010
                      || DERParseSequenceContentToObject(v46, (unsigned __int16)DERNumAttributeTypeAndValueItemSpecs, (uint64_t)&DERAttributeTypeAndValueItemSpecs, (unint64_t)&v43, 0x20uLL, 0x20uLL))
                    {
                      return 0xFFFFFFFFLL;
                    }
                  }
                  while (!DEROidCompare((uint64_t)&oidCommonName, (uint64_t)&v43));
                  long long v25 = v44;
                  uint64_t result = DEROidCompare((uint64_t)&verify_chain_img4_v1_sboot_item, (uint64_t)&v25);
                  if (!result) {
                    return 0xFFFFFFFFLL;
                  }
                  if ((unint64_t)v34 > 0xFFFFFFFFFFFFFFDFLL) {
                    goto LABEL_34;
                  }
                  *a3 = v35;
                  *a4 = v36;
                  if ((unint64_t)v37 > 0xFFFFFFFFFFFFFFDFLL) {
                    goto LABEL_34;
                  }
                  if (!v38) {
                    return 0;
                  }
                  uint64_t v23 = v39;
                  if (!v39) {
                    return 0;
                  }
                  uint64_t result = 0;
                  if (a5)
                  {
                    if (v24)
                    {
                      uint64_t result = 0;
                      *a5 = v38;
                      void *v24 = v23;
                    }
                  }
                  return result;
                }
              }
              return 0xFFFFFFFFLL;
            }
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t parse_chain(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = 0;
  uint64_t v15 = result;
  unint64_t v18 = ~result;
  unint64_t v17 = ~a3;
  unint64_t v14 = ~a4;
  unint64_t v13 = ~a5;
  unint64_t v11 = ~a6;
  uint64_t v10 = a2;
  while (1)
  {
    unint64_t v9 = 16 * v8;
    if (16 * v8 > v18 || 48 * v8 > v17) {
      break;
    }
    uint64_t result = DERParseSequenceToObject(v15 + 16 * v8, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a3 + 48 * v8, 0x30uLL, 0x30uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (160 * v8 > v14) {
      break;
    }
    uint64_t result = DERParseSequenceToObject(a3 + 48 * v8, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, a4 + 160 * v8, 0xA0uLL, 0xA0uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v13) {
      break;
    }
    long long v22 = 0u;
    long long v23 = 0u;
    char v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)(a4 + 160 * v8 + 96), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v22, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL; {
    if (DERParseSequenceContentToObject((unint64_t *)&v22, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v19, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    }
    uint64_t result = DEROidCompare((uint64_t)&v19, (uint64_t)&oidRsa);
    if (!result) {
      return 0xFFFFFFFFLL;
    }
    if (*((void *)&v20 + 1))
    {
      if (*((void *)&v20 + 1) != 2 || *(unsigned char *)v20 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v20 == -1) {
        break;
      }
      if (*(unsigned char *)(v20 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }
    uint64_t result = DERParseBitString((uint64_t)&v23, (unint64_t *)(a5 + 16 * v8), &v21);
    if (result || v21) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v11) {
      break;
    }
    uint64_t result = parse_extensions(a4 + 160 * v8, (void *)(a6 + 16 * v8));
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (++v8 == v10) {
      return 0;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t verify_chain_signatures(void *a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  char v10 = 0;
  memset(v13, 0, sizeof(v13));
  unint64_t v8 = 0;
  uint64_t v9 = 0;
  BOOL v5 = *(void **)(a3 + 32);
  if (!v5
    || !v5[2]
    || !*(void *)a3
    || !*(void *)(a3 + 40)
    || *v5 > 0x30uLL
    || DERParseSequenceContentToObject(a2 + 2, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v11, 0x20uLL, 0x20uLL))
  {
    return 0xFFFFFFFFLL;
  }
  if (*((void *)&v12 + 1))
  {
    uint64_t result = DEROidCompare((uint64_t)&v11, (uint64_t)&oidEcPubKey);
    if ((result & 1) == 0)
    {
      if (*((void *)&v12 + 1) != 2 || *(unsigned char *)v12 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v12 == -1)
      {
        __break(0x5513u);
        return result;
      }
      if (*(unsigned char *)(v12 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }
  }
  if (!DEROidCompare((uint64_t)&v11, *(void *)(a3 + 40))) {
    return 0xFFFFFFFFLL;
  }
  if ((*(unsigned int (**)(void, void, _OWORD *, void, uint64_t))a3)(*a2, a2[1], v13, **(void **)(a3 + 32), a3))
  {
    return 0xFFFFFFFFLL;
  }
  if (DERParseBitString((uint64_t)(a2 + 4), &v8, &v10)) {
    return 0xFFFFFFFFLL;
  }
  if (v10) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = (*(uint64_t (**)(void, void, unint64_t, uint64_t, _OWORD *, void, uint64_t, void))(a3 + 16))(*a1, a1[1], v8, v9, v13, **(void **)(a3 + 32), a3, 0);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t verify_chain_img4_x86(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_x86);
}

uint64_t verify_chain_img4_v2_with_crack_callback(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, unsigned char *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v22, 0x300uLL);
        v21[0] = a1;
        v21[1] = v10;
        if (a8(v21, v22, 2)) {
          return 0xFFFFFFFFLL;
        }
        uint64_t result = parse_chain((uint64_t)v22, 2u, (uint64_t)v23, (uint64_t)&v24, (uint64_t)v27, (uint64_t)v28);
        if (result)
        {
          return 0xFFFFFFFFLL;
        }
        else
        {
          char v16 = 1;
          uint64_t v17 = 1;
          while ((v16 & 1) != 0)
          {
            unint64_t v18 = &v21[20 * v17];
            if (__n == v18[33] && !memcmp(__s1, (const void *)v18[32], __n))
            {
              uint64_t result = verify_chain_signatures(v27, &v23[3 * v17], a7);
              char v16 = 0;
              uint64_t v17 = 2;
              if (!result) {
                continue;
              }
            }
            return 0xFFFFFFFFLL;
          }
          if ((unint64_t)v27 > 0xFFFFFFFFFFFFFFEFLL
            || (*a3 = v27[2], *a4 = v27[3], (unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL))
          {
            __break(0x5513u);
          }
          else if (v29 && (uint64_t v19 = v30) != 0)
          {
            uint64_t result = 0;
            if (a5 && a6)
            {
              uint64_t result = 0;
              *a5 = v29;
              *a6 = v19;
            }
          }
          else
          {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t crack_chain_rsa4k_sha384_x86(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_X86_ROOT_CA_CERTIFICATE;
  a2[1] = 1382;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_ddi);
}

uint64_t crack_chain_rsa4k_sha384_ddi(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_ROOT_CA_CERTIFICATE;
  a2[1] = 1394;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi_global(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_ddi_global);
}

uint64_t crack_chain_rsa4k_sha384_ddi_global(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1404;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi_fake(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_ddi_fake);
}

uint64_t crack_chain_rsa4k_sha384_ddi_fake(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_ROOT_CA_CERTIFICATE;
  a2[1] = 1425;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi_fake_global(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_ddi_fake_global);
}

uint64_t crack_chain_rsa4k_sha384_ddi_fake_global(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1435;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_avp(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_avp);
}

uint64_t crack_chain_rsa4k_sha384_avp(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_AVP_ROOT_CA_CERTIFICATE;
  a2[1] = 1431;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_tatsu_local_policy(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_tatsu_local_policy);
}

uint64_t crack_chain_rsa4k_sha384_tatsu_local_policy(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1382;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_tatsu_local_policy_hacktivate(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_tatsu_local_policy_hacktivate);
}

uint64_t crack_chain_rsa4k_sha384_tatsu_local_policy_hacktivate(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1442;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2_rsa3k(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa3k_sha384);
}

uint64_t crack_chain_rsa3k_sha384(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA3K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1118;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384);
}

uint64_t crack_chain_rsa4k_sha384(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1374;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2_AWG1(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_AWG1);
}

uint64_t crack_chain_rsa4k_sha384_AWG1(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE_AWG1;
  a2[1] = 1404;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2_PED(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_PED);
}

uint64_t crack_chain_rsa4k_sha384_PED(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_PED_ROOT_CA_CERTIFICATE;
  a2[1] = 1400;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ec_v1(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, unsigned char *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v27, 0x330uLL);
        v26[0] = a1;
        v26[1] = v10;
        if (!a8(v26, v27, 3)
          && !parse_ec_chain((uint64_t)v27, 3u, (uint64_t)&v28, (uint64_t)&v30, (unint64_t)v32, (unint64_t)&v35, (uint64_t)v36))
        {
          long long v25 = a4;
          uint64_t v15 = 0;
          char v16 = (const void **)v31;
          uint64_t v17 = &v29;
          unint64_t v18 = (const void **)v31;
          while (1)
          {
            uint64_t v19 = &v26[20 * v15];
            size_t v20 = v19[37];
            char v21 = *v18;
            v18 += 20;
            if ((const void *)v20 != v21) {
              break;
            }
            if (memcmp((const void *)v19[36], *(v16 - 1), v20)) {
              break;
            }
            uint64_t result = verify_chain_signatures(&v32[v15], v17, a7);
            if (result) {
              break;
            }
            v17 += 6;
            ++v15;
            char v16 = v18;
            if (v15 == 2)
            {
              if ((unint64_t)v32 > 0xFFFFFFFFFFFFFFDFLL
                || (*a3 = v33, *long long v25 = v34, (unint64_t)v36 > 0xFFFFFFFFFFFFFFDFLL))
              {
                __break(0x5513u);
              }
              else if (v37 && (uint64_t v22 = v38) != 0)
              {
                uint64_t result = 0;
                if (a5)
                {
                  if (a6)
                  {
                    uint64_t result = 0;
                    *a5 = v37;
                    *a6 = v22;
                  }
                }
              }
              else
              {
                return 0;
              }
              return result;
            }
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t parse_ec_chain(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  if (!a2) {
    return 0;
  }
  unint64_t v9 = 0;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  uint64_t v21 = result;
  unint64_t v24 = ~result;
  unint64_t v23 = ~a3;
  unint64_t v20 = ~a4;
  if (a5 <= a6) {
    unint64_t v12 = a6;
  }
  else {
    unint64_t v12 = a5;
  }
  unint64_t v19 = ~v12;
  unint64_t v16 = ~a7;
  uint64_t v15 = 16 * a2;
  while (v11 <= v24 && v10 <= v23)
  {
    uint64_t result = DERParseSequenceToObject(v21 + v11, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a3 + v10, 0x30uLL, 0x30uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v20) {
      break;
    }
    uint64_t result = DERParseSequenceToObject(a3 + v10, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, a4 + v9, 0xA0uLL, 0xA0uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (v11 > v19) {
      break;
    }
    long long v31 = 0u;
    long long v32 = 0u;
    char v30 = 0;
    long long v28 = 0u;
    long long v29 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)(a4 + v9 + 96), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v31, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL; {
    if (DERParseSequenceContentToObject((unint64_t *)&v31, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v28, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    }
    if (!DEROidCompare((uint64_t)&v28, (uint64_t)&oidEcPubKey)) {
      return 0xFFFFFFFFLL;
    }
    if (DERParseBitString((uint64_t)&v32, (unint64_t *)(a5 + v11), &v30)) {
      return 0xFFFFFFFFLL;
    }
    if (v30) {
      return 0xFFFFFFFFLL;
    }
    unint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t result = DERDecodeItem((uint64_t)&v29, &v25);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    unint64_t v13 = (void *)(a6 + v11);
    uint64_t v14 = v27;
    *unint64_t v13 = v26;
    v13[1] = v14;
    if (v11 > v16) {
      break;
    }
    uint64_t result = parse_extensions(a4 + v9, (void *)(a7 + v11));
    if (result) {
      return 0xFFFFFFFFLL;
    }
    v11 += 16;
    v10 += 48;
    v9 += 160;
    if (v15 == v11) {
      return 0;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t verify_chain_img4_ecdsa256(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v2(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_ecdsa256_sha256);
}

uint64_t verify_chain_img4_ec_v2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, unsigned char *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1) {
    return result;
  }
  unsigned int v10 = a2;
  if (!a2 || !a3 || !a4) {
    return result;
  }
  bzero(v20, 0x220uLL);
  v19[0] = a1;
  v19[1] = v10;
  if (a8(v19, v20, 2)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = parse_ec_chain((uint64_t)v20, 2u, (uint64_t)v21, (uint64_t)v23, (unint64_t)v28, (unint64_t)&v29, (uint64_t)v30);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)v23 > 0xFFFFFFFFFFFFFF5FLL) {
    goto LABEL_22;
  }
  if (__n != v27) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = memcmp(__s1, __s2, __n);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)v21 > 0xFFFFFFFFFFFFFFCFLL)
  {
LABEL_22:
    __break(0x5513u);
    return result;
  }
  uint64_t result = verify_chain_signatures(v28, v22, a7);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL) {
    goto LABEL_22;
  }
  uint64_t v16 = v28[3];
  *a3 = v28[2];
  *a4 = v16;
  if ((unint64_t)v30 > 0xFFFFFFFFFFFFFFEFLL) {
    goto LABEL_22;
  }
  if (!v31) {
    return 0;
  }
  uint64_t v17 = v32;
  if (!v32) {
    return 0;
  }
  uint64_t result = 0;
  if (a5)
  {
    if (a6)
    {
      uint64_t result = 0;
      *a5 = v31;
      *a6 = v17;
    }
  }
  return result;
}

uint64_t crack_chain_ecdsa256_sha256(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC256_SHA256_ROOT_CA_CERTIFICATE;
  a2[1] = 551;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ecdsa384(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v2(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_ecdsa384_sha384_hacktivate);
}

uint64_t crack_chain_ecdsa384_sha384_hacktivate(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 610;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ecdsa384_local_policy(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_ecdsa384_sha384);
}

uint64_t crack_chain_ecdsa384_sha384(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &EC384_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 542;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ecdsa384_hacktivate(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_ecdsa384_sha384_hacktivate);
}

uint64_t verify_chain_img4_ecdsa384_qa(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_ecdsa384_sha384_qa);
}

uint64_t crack_chain_ecdsa384_sha384_qa(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &QA_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 540;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t Img4DecodeDigestInit(uint64_t a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v1 = *(void **)(a1 + 16);
  if (!v1 || !*v1) {
    return 0xFFFFFFFFLL;
  }
  ccdigest_init();
  return 0;
}

uint64_t Img4DecodeDigestUpdate(uint64_t a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!**(void **)(a1 + 16)) {
    return 0xFFFFFFFFLL;
  }
  ccdigest_update();
  return 0;
}

uint64_t Img4DecodeDigestReturnHash(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = **(void **)(a1 + 16);
  if (!v4 || *(void *)v4 > a3) {
    return 0xFFFFFFFFLL;
  }
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 56))(v4, *a2, a4);
  return 0;
}

uint64_t Img4DecodeDigestFinal(uint64_t a1, void *a2, uint64_t a3)
{
  if (a1 && (uint64_t v3 = **(unint64_t ***)(a1 + 16)) != 0) {
    return Img4DecodeDigestReturnHash(a1, a2, *v3, a3);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t Img4DecodeComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a5)
  {
    unint64_t v8 = *(void **)(a5 + 32);
    if (v8 && (unint64_t v9 = (void *)v8[2]) != 0 && *v8 == a4 && *v9 && *(void *)*v9 == a4)
    {
      ccdigest();
      return 0;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t img4_verify_signature_with_chain(unint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, void *a7, void *a8)
{
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  if (verify_chain_img4_v1(a1, a2, &v17, &v18, &v15, &v16, (uint64_t)kImg4DecodeSecureBootRsa1kSha1)) {
    return 0xFFFFFFFFLL;
  }
  *a7 = v15;
  *a8 = v16;
  uint64_t result = verify_signature_rsa(v17, v18, a3, a4, a5, a6, (uint64_t)kImg4DecodeSecureBootRsa1kSha1);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t _crack_chain_with_anchor(unint64_t *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  unint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  unint64_t v5 = ~a2;
  unsigned int v6 = 1;
  unint64_t v7 = *a1;
  unint64_t v8 = a1[1];
  while (1)
  {
    unint64_t v18 = v7;
    unint64_t v19 = v8;
    uint64_t result = DERDecodeItem((uint64_t)&v18, &v15);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (__CFADD__(v16, v17)) {
      break;
    }
    unint64_t v10 = v16 + v17;
    unint64_t v11 = v16 + v17 - v7;
    BOOL v12 = !(v11 >> 17) && v8 >= v11;
    if (!v12 || v6 >= a3) {
      return 0xFFFFFFFFLL;
    }
    if (v5 < 16 * (unint64_t)v6) {
      break;
    }
    uint64_t v14 = (unint64_t *)(a2 + 16 * v6);
    unint64_t *v14 = v7;
    v14[1] = v11;
    if (v10 < v7) {
      break;
    }
    BOOL v12 = v8 >= v11;
    v8 -= v11;
    if (!v12) {
      goto LABEL_21;
    }
    ++v6;
    unint64_t v7 = v10;
    if (!v8)
    {
      if (v6 == a3) {
        return 0;
      }
      return 0xFFFFFFFFLL;
    }
  }
  __break(0x5513u);
LABEL_21:
  __break(0x5515u);
  return result;
}

uint64_t parse_extensions(uint64_t a1, void *a2)
{
  v11[0] = 0;
  v11[1] = 0;
  v9[1] = 0;
  uint64_t v10 = 0;
  unint64_t v8 = 0;
  v9[0] = 0;
  long long v7 = 0u;
  memset(v6, 0, sizeof(v6));
  *a2 = 0;
  a2[1] = 0;
  if (!*(void *)(a1 + 152)) {
    return 0;
  }
  if (DERDecodeSeqInit(a1 + 144, &v10, v11) || v10 != 0x2000000000000010) {
    return 0xFFFFFFFFLL;
  }
  char v3 = 1;
  while (1)
  {
    int v4 = DERDecodeSeqNext(v11, &v8);
    if (v4) {
      break;
    }
    if (v8 != 0x2000000000000010
      || DERParseSequenceContentToObject(v9, (unsigned __int16)DERNumExtensionItemSpecs, (uint64_t)&DERExtensionItemSpecs, (unint64_t)v6, 0x30uLL, 0x30uLL))
    {
      return 0xFFFFFFFFLL;
    }
    char v3 = 0;
    if (DEROidCompare((uint64_t)&oidAppleImg4ManifestCertSpec, (uint64_t)v6))
    {
      memset(v12, 0, sizeof(v12));
      if (DERDecodeItem((uint64_t)&v7, v12) || v12[0] != 0x2000000000000011) {
        return 0xFFFFFFFFLL;
      }
      char v3 = 0;
      *(_OWORD *)a2 = v7;
    }
  }
  if (v4 != 1 || (v3 & 1) != 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  int v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_68;
  }
  unint64_t v5 = &v4[v3];
  unsigned int v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    BOOL v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      uint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0;
            }
LABEL_34:
            uint64_t result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          uint64_t result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          long long v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28) {
            goto LABEL_69;
          }
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  uint64_t result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_68;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    BOOL v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERDecodeItemPartialBuffer(uint64_t result, unint64_t *a2, int a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  int v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_54;
  }
  unint64_t v5 = &v4[v3];
  unsigned int v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    BOOL v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_55;
      }
      uint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        BOOL v17 = v16 < v15 && a3 == 0;
        unint64_t v18 = (unint64_t)(v12 + 1);
        if (v17) {
          return 3;
        }
LABEL_28:
        if (v15 > (~v18 & 0x7FFFFFFFFFFFFFFFLL)) {
          return 7;
        }
        if (v18 <= v18 + v15)
        {
          uint64_t result = 0;
          a2[1] = v18;
          a2[2] = v15;
          return result;
        }
        goto LABEL_55;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4)
      {
LABEL_55:
        __break(0x5519u);
LABEL_56:
        __break(0x5515u);
        return result;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v18 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_55;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_56;
        }
        unsigned int v23 = *v14++;
        unint64_t v15 = (v15 << 8) | v23;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (v15 <= v22) {
            char v24 = 1;
          }
          else {
            char v24 = a3;
          }
          uint64_t result = 3;
          if (v15 >= 0x80 && (v24 & 1) != 0) {
            goto LABEL_28;
          }
          return result;
        }
      }
    }
LABEL_54:
    __break(0x5513u);
    goto LABEL_55;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  uint64_t result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_54;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_55;
    }
    BOOL v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, unsigned char *a3)
{
  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(void *)(result + 8)) {
    return 3;
  }
  unsigned int v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      unint64_t v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      unint64_t v6 = *(void *)result;
      unint64_t v7 = *(void *)result + v4;
      unint64_t v8 = (unsigned __int8 *)(*(void *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        unint64_t v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          uint64_t result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3) {
    return 3;
  }
  else {
    return 0;
  }
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  if (a1[1] != (unsigned __int8 *)1) {
    return 3;
  }
  int v2 = **a1;
  if (v2 != 255 && v2 != 0) {
    return 3;
  }
  uint64_t result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned int v3 = a1[1];
  if (!v3) {
    goto LABEL_9;
  }
  if (v3 == (unsigned __int8 *)1)
  {
    int v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      uint64_t result = 0;
      *a3 = a2;
      return result;
    }
  }
  return 3;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DERParseInteger64(a1, v4);
  if (!result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      uint64_t result = 0;
      *a2 = v4[0];
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3;
  }
  unsigned int v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7;
    }
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0) {
      return 3;
    }
    if (v2 > 9) {
      return 7;
    }
  }
LABEL_10:
  unint64_t v5 = 0;
  do
  {
    unsigned int v6 = *v3++;
    unint64_t v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  uint64_t result = 0;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, void *a2, void *a3)
{
  _OWORD v8[3] = *MEMORY[0x263EF8340];
  memset(v8, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!result)
  {
    unint64_t v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        unint64_t v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          uint64_t result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = *result;
  unint64_t v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  _OWORD v10[2] = *MEMORY[0x263EF8340];
  v10[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v12[3] = *MEMORY[0x263EF8340];
  memset(v12, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!result)
  {
    if (v12[0] == 0x2000000000000010) {
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unint64_t v32 = 0;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }
  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    uint64_t v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = DERDecodeSeqNext(&v32, v31);
      if (result) {
        break;
      }
      if (a2 <= v13) {
        return 2;
      }
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3) {
          goto LABEL_58;
        }
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24 * v13 + 8)) {
          break;
        }
        uint64_t result = 2;
        if (v18)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1)) {
            continue;
          }
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        uint64_t v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4) {
          goto LABEL_59;
        }
        *(_OWORD *)uint64_t v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)uint64_t v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)uint64_t v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }
    if (result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        BOOL v25 = (__int16 *)(a3 + 24 * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0;
    }
    else {
      return 3;
    }
  }
  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent(unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSequenceWithBlock(uint64_t a1, uint64_t a2)
{
  v4[3] = *MEMORY[0x263EF8340];
  memset(v4, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v4, 0);
  if (!result)
  {
    if (v4[0] - 0x2000000000000012 >= 0xFFFFFFFFFFFFFFFELL) {
      return DERDecodeSequenceContentWithBlock(&v4[1], a2);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t DERDecodeSequenceContentWithBlock(unint64_t *a1, uint64_t a2)
{
  unint64_t v9[2] = *MEMORY[0x263EF8340];
  v9[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }
  unint64_t v4 = v2 + v3;
  if (v2 > v4) {
    goto LABEL_13;
  }
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  char v7 = 0;
  while (1)
  {
    LODWORD(result) = DERDecodeSeqNext(v9, v8);
    if (result) {
      break;
    }
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if (result) {
      break;
    }
    if (v7) {
      return 0;
    }
  }
  if (result <= 1) {
    return 0;
  }
  else {
    return result;
  }
}

BOOL DEROidCompare(uint64_t a1, uint64_t a2)
{
  BOOL result = 0;
  if (a1 && a2)
  {
    size_t v4 = *(void *)(a1 + 8);
    return v4 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v4) == 0;
  }
  return result;
}

void ACFURestore::getStepName(void *a1)
{
  do
  {
    if (*((char *)a1 - 1) < 0) {
      operator delete((void *)*(a1 - 3));
    }
    a1 -= 3;
  }
  while (a1 != ACFURestore::getStepName(ACFURestore::UpdateSteps)::UpdateStepString);
}

void ACFURTKitROM::init(std::__shared_weak_count **a1, std::__shared_weak_count **a2)
{
  unint64_t v3 = *a1;
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  if (*a2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*a2);
  }
}

uint64_t AMFDRChipCertifyForRestore()
{
  return MEMORY[0x270F91D80]();
}

uint64_t AMFDRGetTrustError()
{
  return MEMORY[0x270F91E78]();
}

uint64_t AMFDRSealingMapCopyLocalData()
{
  return MEMORY[0x270F91F78]();
}

uint64_t AMFDRSealingMapCopyLocalDict()
{
  return MEMORY[0x270F91F88]();
}

uint64_t AMSupportCopyURLWithAppendedComponent()
{
  return MEMORY[0x270F979F8]();
}

uint64_t AMSupportCreateDataFromFileURL()
{
  return MEMORY[0x270F97A08]();
}

uint64_t AMSupportCreateURLFromString()
{
  return MEMORY[0x270F97A38]();
}

uint64_t AMSupportFileURLExists()
{
  return MEMORY[0x270F97A80]();
}

uint64_t AMSupportGetValueForKeyPathInDict()
{
  return MEMORY[0x270F97A90]();
}

uint64_t AMSupportMakeDirectory()
{
  return MEMORY[0x270F97AD0]();
}

uint64_t AMSupportRemoveFile()
{
  return MEMORY[0x270F97AF8]();
}

uint64_t AMSupportSafeRelease()
{
  return MEMORY[0x270F97B40]();
}

uint64_t AMSupportSafeRetain()
{
  return MEMORY[0x270F97B48]();
}

uint64_t AMSupportWriteDataToFileURL()
{
  return MEMORY[0x270F97B50]();
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x270ED7A80](bytes, count);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B38](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA384(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B48](data, *(void *)&len, md);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B50](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B58](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B60](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA512(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B68](data, *(void *)&len, md);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B70](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B78](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B80](c, data, *(void *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x270EE42F8](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x270EE47B0](type_id);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E8](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range)
{
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
}

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
{
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x270EE4BD8](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x270EE5090](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x270EE50A0](alloc, theString, *(void *)&encoding, lossByte);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x270EE5148](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x270EE5210]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE5390](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE5400](allocator, URLString, baseURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE5430](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5440](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x270EE5448]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F98568](this, __c);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987D0]();
}

{
  return MEMORY[0x270F987E0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
}

void std::condition_variable::notify_one(std::condition_variable *this)
{
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x270F98B78](__str, __idx, *(void *)&__base);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

unint64_t std::stoul(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x270F98BC8](__str, __idx, *(void *)&__base);
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x270F98C28]();
}

time_t std::chrono::system_clock::to_time_t(const std::chrono::system_clock::time_point *__t)
{
  return MEMORY[0x270F98C30](__t);
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

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
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

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
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

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x270F98F30](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x270ED8480](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x270ED87D8]();
}

uint64_t ccdigest()
{
  return MEMORY[0x270ED8A40]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x270ED8A48]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x270ED8A50]();
}

uint64_t ccec_get_cp()
{
  return MEMORY[0x270ED8AD0]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x270ED8AD8]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x270ED8AE0]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x270ED8B00]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x270ED8B28]();
}

uint64_t ccrsa_make_pub()
{
  return MEMORY[0x270ED8D20]();
}

uint64_t ccrsa_verify_pkcs1v15()
{
  return MEMORY[0x270ED8D38]();
}

uint64_t ccrsa_verify_pkcs1v15_digest()
{
  return MEMORY[0x270ED8D48]();
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x270ED8EC8](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x270ED90F0]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x270ED9910](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x270ED9918](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270ED9B30](*(void *)&a1, a2);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x270EDA098](a1);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDA120](a1, a2);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x270EDB688](__stringp, __delim);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB770](a1, a2);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x270EDB7C8](*(void *)&a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}