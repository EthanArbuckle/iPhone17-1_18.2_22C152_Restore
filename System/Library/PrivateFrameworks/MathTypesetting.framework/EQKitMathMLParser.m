@interface EQKitMathMLParser
- (BOOL)isElement:(int)a3 allowedInState:(int)a4;
- (EQKitMathMLParser)init;
- (EQKitMathMLParser)initWithDocument:(_xmlDoc *)a3 node:(_xmlNode *)RootElement source:(id)a5 attribution:(id)a6 environment:(id)a7;
- (NSError)error;
- (_xmlNs)ns;
- (id).cxx_construct;
- (id)environment;
- (id)parse;
- (id)parseChildrenAsArrayFromXMLNode:(_xmlNode *)a3;
- (id)parseChildrenAsNodeFromXMLNode:(_xmlNode *)a3;
- (id)parseChildrenAsTokenContentFromXMLNode:(_xmlNode *)a3;
- (id)parseNode:(_xmlNode *)a3;
- (id)sourceAttributionForOffset:(unint64_t)a3 length:(unint64_t)a4;
- (int)state;
- (void)attributeCollection;
- (void)dealloc;
- (void)parseAttributesForNode:(id)a3 withXMLNode:(_xmlNode *)a4;
- (void)popState;
- (void)pushState:(int)a3;
- (void)reportError:(int64_t)a3 withNode:(_xmlNode *)a4;
- (void)setAttributeCollection:(void *)a3;
@end

@implementation EQKitMathMLParser

- (EQKitMathMLParser)init
{
  return [(EQKitMathMLParser *)self initWithDocument:0 node:0 source:0 attribution:0 environment:0];
}

- (EQKitMathMLParser)initWithDocument:(_xmlDoc *)a3 node:(_xmlNode *)RootElement source:(id)a5 attribution:(id)a6 environment:(id)a7
{
  int v13 = [a7 sourceAttribution];
  if (a6 && v13)
  {
    v14 = objc_msgSend((id)objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", objc_msgSend(a6, "bytes"), objc_msgSend(a6, "length"), 4), "dataUsingEncoding:", 2617245952);
    std::wstring::basic_string[abi:ne180100](&__dst, (void *)[v14 bytes], (unint64_t)objc_msgSend(v14, "length") >> 2);
    p_mAttribution = &self->mAttribution;
    if (*((char *)&self->mAttribution.__r_.__value_.var0.__l + 23) < 0) {
      operator delete(p_mAttribution->__r_.__value_.var0.__l.__data_);
    }
    *(_OWORD *)p_mAttribution->__r_.__value_.var0.__s.__data_ = __dst;
    *((void *)&self->mAttribution.__r_.__value_.var0.__l + 2) = v21;
  }
  if (a3 && !RootElement) {
    RootElement = xmlDocGetRootElement(a3);
  }
  v19.receiver = self;
  v19.super_class = (Class)EQKitMathMLParser;
  v16 = [(EQKitMathMLParser *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->mRootNode = RootElement;
    v16->mNS = xmlSearchNsByHref(a3, RootElement, (const xmlChar *)"http://www.w3.org/1998/Math/MathML");
    v17->mEnvironment = (EQKitEnvironment *)a7;
    v17->mSource = (NSData *)a5;
  }
  return v17;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLParser;
  [(EQKitMathMLParser *)&v3 dealloc];
}

- (id)sourceAttributionForOffset:(unint64_t)a3 length:(unint64_t)a4
{
  if (*((char *)&self->mAttribution.__r_.__value_.var0.__l + 23) < 0)
  {
    unint64_t size = self->mAttribution.__r_.__value_.var0.__l.__size_;
    if (!a4) {
      return 0;
    }
  }
  else
  {
    unint64_t size = *((unsigned __int8 *)&self->mAttribution.__r_.__value_.var0.__l + 23);
    if (!a4) {
      return 0;
    }
  }
  unint64_t v7 = a4 + a3;
  if (size) {
    BOOL v8 = size >= v7;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8) {
    return 0;
  }
  p_l = (uint64_t *)&self->mAttribution.__r_.__value_.var0.__l;
  v11 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:size];
  v12 = v11;
  if (a3) {
    _appendFromWideString(v11, p_l, 0, a3);
  }
  uint64_t v13 = [v12 length];
  _appendFromWideString(v12, p_l, a3, a4);
  uint64_t v14 = [v12 length];
  if (size > v7) {
    _appendFromWideString(v12, p_l, v7, size - v7);
  }
  v15 = [EQKitSourceAttribution alloc];

  return -[EQKitSourceAttribution initWithSource:range:](v15, "initWithSource:range:", v12, v13, v14 - v13);
}

- (void)attributeCollection
{
  return self->mAttributeCollection;
}

- (void)setAttributeCollection:(void *)a3
{
  self->mAttributeCollection = a3;
}

- (id)environment
{
  return self->mEnvironment;
}

- (void)reportError:(int64_t)a3 withNode:(_xmlNode *)a4
{
  if (!self->mError)
  {
    id v7 = [NSString alloc];
    name = (const xmlChar *)"";
    if (a4 && a4->name) {
      name = a4->name;
    }
    v9 = (void *)[v7 initWithUTF8String:name];
    v10 = (void *)[MEMORY[0x263F086E0] mainBundle];
    if ((unint64_t)a3 <= 6
      && (uint64_t v11 = [v10 localizedStringForKey:*((void *)&off_2653CE9E0 + a3) value:&stru_27045C2A0 table:0]) != 0)
    {
      v12 = NSDictionary;
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", v11, v9);
      uint64_t v14 = objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, *MEMORY[0x263F08320], 0);
    }
    else
    {
      uint64_t v14 = 0;
    }

    self->mError = (NSError *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"EQKitErrorDomain" code:a3 userInfo:v14];
  }
}

- (id)parse
{
  if (EQKitXMLIsNamedElement(self->mRootNode, self->mNS, "math"))
  {
    id v3 = [[EQKitMathMLMath alloc] initFromXMLNode:self->mRootNode parser:self];
    [(EQKitMathMLParser *)self parseAttributesForNode:v3 withXMLNode:self->mRootNode];
    if (v3 && !self->mError) {
      v4 = [[EQKitEquation alloc] initWithRoot:v3 source:self->mSource];
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    [(EQKitMathMLParser *)self reportError:1 withNode:self->mRootNode];
    return 0;
  }
  return v4;
}

- (id)parseChildrenAsArrayFromXMLNode:(_xmlNode *)a3
{
  v5 = (void *)[MEMORY[0x263EFF980] array];
  if (a3)
  {
    for (i = a3->children; i; i = i->next)
    {
      if (EQKitXMLIsElement((BOOL)i))
      {
        id v7 = [(EQKitMathMLParser *)self parseNode:i];
        if (!v7) {
          return 0;
        }
        [v5 addObject:v7];
      }
    }
  }
  return v5;
}

- (id)parseChildrenAsNodeFromXMLNode:(_xmlNode *)a3
{
  id result = [(EQKitMathMLParser *)self parseChildrenAsArrayFromXMLNode:a3];
  if (result)
  {
    id v4 = result;
    if ([result count] == 1) {
      v5 = (EQKitMathMLMRow *)(id)[v4 objectAtIndex:0];
    }
    else {
      v5 = [[EQKitMathMLMRow alloc] initWithChildren:v4];
    }
    return v5;
  }
  return result;
}

- (void)parseAttributesForNode:(id)a3 withXMLNode:(_xmlNode *)a4
{
  uint64_t v7 = [a3 mathMLAttributes];
  properties = a4->properties;
  if (properties)
  {
    uint64_t v9 = v7;
    v10 = (int *)(v7 + 8);
    std::string::size_type v114 = *(void *)(MEMORY[0x263F8C2C0] + 24);
    std::string::size_type v115 = *MEMORY[0x263F8C2C0];
    v113 = &v120;
    do
    {
      ns = properties->ns;
      if (ns) {
        BOOL v12 = ns == a4->ns;
      }
      else {
        BOOL v12 = 1;
      }
      if (!v12 || !self->mAttributeCollection) {
        goto LABEL_123;
      }
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)properties->name);
      int v13 = EQKitTypes::Attributes::attributeFromMathMLString((uint64_t *)__p, 0);
      if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p[0].__r_.__value_.__l.__data_);
      }
      if (v13 != 1 || !v9) {
        goto LABEL_35;
      }
      uint64_t v14 = *(void *)v10;
      if (!*(void *)v10) {
        goto LABEL_123;
      }
      v15 = v10;
      do
      {
        int v16 = *(_DWORD *)(v14 + 28);
        BOOL v17 = v16 < 2;
        if (v16 >= 2) {
          v18 = (uint64_t *)v14;
        }
        else {
          v18 = (uint64_t *)(v14 + 8);
        }
        if (!v17) {
          v15 = (int *)v14;
        }
        uint64_t v14 = *v18;
      }
      while (*v18);
      if (v15 != v10 && v15[7] < 3)
      {
        int v13 = 2;
      }
      else
      {
        if (v13 != 10 || !v9) {
          goto LABEL_48;
        }
LABEL_35:
        uint64_t v19 = *(void *)v10;
        if (!*(void *)v10) {
          goto LABEL_123;
        }
        v20 = v10;
        do
        {
          int v21 = *(_DWORD *)(v19 + 28);
          BOOL v22 = v21 < 32;
          if (v21 >= 32) {
            v23 = (uint64_t *)v19;
          }
          else {
            v23 = (uint64_t *)(v19 + 8);
          }
          if (!v22) {
            v20 = (int *)v19;
          }
          uint64_t v19 = *v23;
        }
        while (*v23);
        if (v20 != v10 && v20[7] < 33)
        {
          int v13 = 32;
        }
        else
        {
          if (v13 != 26 || !v9) {
            goto LABEL_61;
          }
LABEL_48:
          uint64_t v24 = *(void *)v10;
          if (!*(void *)v10) {
            goto LABEL_123;
          }
          v25 = v10;
          do
          {
            int v26 = *(_DWORD *)(v24 + 28);
            BOOL v27 = v26 < 29;
            if (v26 >= 29) {
              v28 = (uint64_t *)v24;
            }
            else {
              v28 = (uint64_t *)(v24 + 8);
            }
            if (!v27) {
              v25 = (int *)v24;
            }
            uint64_t v24 = *v28;
          }
          while (*v28);
          if (v25 != v10 && v25[7] < 30)
          {
            int v13 = 29;
          }
          else
          {
            if (v13 != 27 || !v9) {
              goto LABEL_74;
            }
LABEL_61:
            uint64_t v29 = *(void *)v10;
            if (!*(void *)v10) {
              goto LABEL_123;
            }
            v30 = v10;
            do
            {
              int v31 = *(_DWORD *)(v29 + 28);
              BOOL v32 = v31 < 30;
              if (v31 >= 30) {
                v33 = (uint64_t *)v29;
              }
              else {
                v33 = (uint64_t *)(v29 + 8);
              }
              if (!v32) {
                v30 = (int *)v29;
              }
              uint64_t v29 = *v33;
            }
            while (*v33);
            if (v30 != v10 && v30[7] < 31)
            {
              int v13 = 30;
            }
            else
            {
              if (v13 != 28 || !v9) {
                goto LABEL_76;
              }
LABEL_74:
              uint64_t v34 = *(void *)v10;
              if (!*(void *)v10) {
                goto LABEL_123;
              }
              v35 = v10;
              do
              {
                int v36 = *(_DWORD *)(v34 + 28);
                BOOL v37 = v36 < 31;
                if (v36 >= 31) {
                  v38 = (uint64_t *)v34;
                }
                else {
                  v38 = (uint64_t *)(v34 + 8);
                }
                if (!v37) {
                  v35 = (int *)v34;
                }
                uint64_t v34 = *v38;
              }
              while (*v38);
              if (v35 != v10 && v35[7] < 32)
              {
                int v13 = 31;
              }
              else
              {
LABEL_76:
                if (v13 == 48)
                {
                  EQKitXMLAttributeValueAsString(a4, properties, __p);
                  char v39 = HIBYTE(__p[0].__r_.__value_.__r.__words[2]);
                  if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                    int64_t size = HIBYTE(__p[0].__r_.__value_.__r.__words[2]);
                  }
                  else {
                    int64_t size = __p[0].__r_.__value_.__l.__size_;
                  }
                  if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                    v41 = __p;
                  }
                  else {
                    v41 = (std::string *)__p[0].__r_.__value_.__r.__words[0];
                  }
                  if (size >= 1)
                  {
                    v42 = (char *)v41 + size;
                    v43 = v41;
                    do
                    {
                      v44 = memchr(v43, 44, size);
                      if (!v44) {
                        break;
                      }
                      if (*v44 == 44)
                      {
                        if (v44 != v42)
                        {
                          std::string::size_type v45 = v44 - (unsigned char *)v41;
                          if (v45 != -1)
                          {
                            v46 = std::string::basic_string(&__str, __p, 0, v45, (std::allocator<char> *)&v123);
                            if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
                            {
                              v48 = (void *)__str.__r_.__value_.__r.__words[0];
                              int v47 = atoi(__str.__r_.__value_.__l.__data_);
                              operator delete(v48);
                            }
                            else
                            {
                              int v47 = atoi((const char *)v46);
                            }
                            std::string::size_type v49 = HIBYTE(__p[0].__r_.__value_.__r.__words[2]);
                            if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                              std::string::size_type v49 = __p[0].__r_.__value_.__l.__size_;
                            }
                            v50 = std::string::basic_string(&__str, __p, v45 + 1, v49 - (v45 + 1), (std::allocator<char> *)&v123);
                            if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
                            {
                              v52 = (void *)__str.__r_.__value_.__r.__words[0];
                              int v51 = atoi(__str.__r_.__value_.__l.__data_);
                              operator delete(v52);
                            }
                            else
                            {
                              int v51 = atoi((const char *)v50);
                            }
                            objc_msgSend(a3, "setSourceAttribution:", -[EQKitMathMLParser sourceAttributionForOffset:length:](self, "sourceAttributionForOffset:length:", v47, v51, v113));
                            char v39 = HIBYTE(__p[0].__r_.__value_.__r.__words[2]);
                          }
                        }
                        break;
                      }
                      v43 = (std::string *)(v44 + 1);
                      int64_t size = v42 - (unsigned char *)v43;
                    }
                    while (v42 - (unsigned char *)v43 >= 1);
                  }
                  if (v39 < 0) {
                    operator delete(__p[0].__r_.__value_.__l.__data_);
                  }
                  int v13 = 48;
                }
              }
            }
          }
        }
      }
      if (v9)
      {
        uint64_t v53 = *(void *)v10;
        if (*(void *)v10)
        {
          v54 = v10;
          do
          {
            int v55 = *(_DWORD *)(v53 + 28);
            BOOL v56 = v55 < v13;
            if (v55 >= v13) {
              v57 = (uint64_t *)v53;
            }
            else {
              v57 = (uint64_t *)(v53 + 8);
            }
            if (!v56) {
              v54 = (int *)v53;
            }
            uint64_t v53 = *v57;
          }
          while (*v57);
          if (v54 != v10 && v13 >= v54[7])
          {
            EQKitXMLAttributeValueAsString(a4, properties, &__str);
            switch(v13)
            {
              case 1:
              case 24:
              case 25:
                int v63 = EQKitTypes::Align::alignFromMathMLString((uint64_t *)&__str, 0);
                if (!v63) {
                  goto LABEL_121;
                }
                mAttributeCollection = (uint64_t **)self->mAttributeCollection;
                __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                LODWORD(__p[0].__r_.__value_.__r.__words[1]) = v13;
                *(void *)&long long v123 = __p;
                v65 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(mAttributeCollection + 16, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123);
                goto LABEL_193;
              case 2:
                int v63 = EQKitTypes::VAlign::vAlignFromMathMLString((uint64_t *)&__str, 0);
                if (!v63) {
                  goto LABEL_121;
                }
                v77 = (uint64_t **)self->mAttributeCollection;
                __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                LODWORD(__p[0].__r_.__value_.__r.__words[1]) = 2;
                *(void *)&long long v123 = __p;
                v65 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v77 + 19, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123);
                goto LABEL_193;
              case 3:
                EQKitTypes::VAlign::vAlignVectorFromMathMLString(&__str, &__p[0].__r_.__value_.__l.__data_);
                v78 = (void *)__p[0].__r_.__value_.__l.__size_;
                if (__p[0].__r_.__value_.__l.__size_ == __p[0].__r_.__value_.__r.__words[0]) {
                  goto LABEL_204;
                }
                v79 = (uint64_t **)self->mAttributeCollection;
                *(void *)&long long v123 = a3;
                DWORD2(v123) = 3;
                EQKit::AttributeCollection::setValueForKey<std::vector<EQKitTypes::VAlign::Enum>>((uint64_t)v79, v79 + 31, (uint64_t)__p, &v123);
                goto LABEL_203;
              case 4:
                EQKitTypes::Align::alignVectorFromMathMLString(&__str, &__p[0].__r_.__value_.__l.__data_);
                v78 = (void *)__p[0].__r_.__value_.__l.__size_;
                if (__p[0].__r_.__value_.__l.__size_ == __p[0].__r_.__value_.__r.__words[0]) {
                  goto LABEL_204;
                }
                v80 = (uint64_t **)self->mAttributeCollection;
                *(void *)&long long v123 = a3;
                DWORD2(v123) = 4;
                EQKit::AttributeCollection::setValueForKey<std::vector<EQKitTypes::VAlign::Enum>>((uint64_t)v80, v80 + 34, (uint64_t)__p, &v123);
                goto LABEL_203;
              case 5:
              case 6:
              case 8:
              case 14:
              case 16:
              case 39:
              case 45:
                int v63 = EQKitTypes::Boolean::BOOLeanFromMathMLString((uint64_t *)&__str, 0);
                if (!v63) {
                  goto LABEL_121;
                }
                v64 = (uint64_t **)self->mAttributeCollection;
                __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                LODWORD(__p[0].__r_.__value_.__r.__words[1]) = v13;
                *(void *)&long long v123 = __p;
                v65 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v64 + 1, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123);
                goto LABEL_193;
              case 7:
                int v63 = EQKitTypes::Display::displayFromMathMLString((uint64_t *)&__str, 0);
                if (!v63) {
                  goto LABEL_121;
                }
                v81 = (uint64_t **)self->mAttributeCollection;
                __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                LODWORD(__p[0].__r_.__value_.__r.__words[1]) = 7;
                *(void *)&long long v123 = __p;
                v65 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v81 + 40, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123);
                goto LABEL_193;
              case 9:
                *(void *)&long long v123 = 0;
                BYTE8(v123) = 1;
                if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
                  std::string::__init_copy_ctor_external(&v121, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
                }
                else {
                  std::string v121 = __str;
                }
                BOOL v106 = EQKit::ScriptLevel::fromString(&v121, (uint64_t)&v123);
                if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v121.__r_.__value_.__l.__data_);
                }
                if (v106)
                {
                  v107 = (uint64_t **)self->mAttributeCollection;
                  __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                  LODWORD(__p[0].__r_.__value_.__r.__words[1]) = 9;
                  v124[0] = __p;
                  v108 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKit::ScriptLevel>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKit::ScriptLevel,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKit::ScriptLevel>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v107 + 37, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, v124);
                  *((void *)v108 + 6) = v123;
                  *((unsigned char *)v108 + 56) = BYTE8(v123);
                }
                goto LABEL_121;
              case 10:
              case 11:
              case 26:
              case 27:
              case 28:
              case 40:
              case 41:
              case 43:
                EQKitLength::EQKitLength(&v123, &__str, 0);
                if (v123)
                {
                  v61 = (uint64_t **)self->mAttributeCollection;
                  __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                  LODWORD(__p[0].__r_.__value_.__r.__words[1]) = v13;
                  v124[0] = __p;
                  v62 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKitLength>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKitLength,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKitLength>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v61 + 4, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, v124);
                  *((_DWORD *)v62 + 12) = v123;
                  *((void *)v62 + 7) = *((void *)&v123 + 1);
                }
                else if (v13 == 41)
                {
                  std::string::size_type v67 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
                  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                    std::string::size_type v67 = __str.__r_.__value_.__l.__size_;
                  }
                  if (v67 == 8)
                  {
                    p_str = &__str;
                    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                      p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
                    }
                    if (p_str->__r_.__value_.__r.__words[0] == 0x7974696E69666E69)
                    {
                      v69 = (uint64_t **)self->mAttributeCollection;
                      __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                      LODWORD(__p[0].__r_.__value_.__r.__words[1]) = 41;
                      v124[0] = __p;
                      v70 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKitLength>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKitLength,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKitLength>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v69 + 4, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, v124);
                      *((_DWORD *)v70 + 12) = 1;
                      *((void *)v70 + 7) = 0x7FEFFFFFFFFFFFFFLL;
                    }
                  }
                }
                goto LABEL_121;
              case 12:
              case 13:
              case 18:
              case 19:
                EQKit::AttributeCollection::setValueForKey((uint64_t)self->mAttributeCollection, &__str, v13, (uint64_t)a3);
                goto LABEL_121;
              case 15:
                int v63 = EQKit::Config::Operator::formFromMathMLString((uint64_t *)&__str, 0);
                if (!v63) {
                  goto LABEL_121;
                }
                v82 = (uint64_t **)self->mAttributeCollection;
                __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                LODWORD(__p[0].__r_.__value_.__r.__words[1]) = 15;
                *(void *)&long long v123 = __p;
                v65 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v82 + 43, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123);
                goto LABEL_193;
              case 17:
                int v63 = EQKit::Script::variantFromMathMLString((uint64_t *)&__str, 0);
                if (!v63) {
                  goto LABEL_121;
                }
                v83 = (uint64_t **)self->mAttributeCollection;
                __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                LODWORD(__p[0].__r_.__value_.__r.__words[1]) = 17;
                *(void *)&long long v123 = __p;
                v65 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v83 + 46, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123);
                goto LABEL_193;
              case 20:
                EQKitTypes::Strings::separatorsFromString((uint64_t *)&__str, (uint64_t)__p);
                v84 = (uint64_t **)self->mAttributeCollection;
                *(void *)&long long v123 = a3;
                DWORD2(v123) = 20;
                EQKit::AttributeCollection::setValueForKey<std::vector<std::string>>((uint64_t)v84, v84 + 13, (uint64_t)__p, &v123);
                *(void *)&long long v123 = __p;
                std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v123);
                goto LABEL_121;
              case 21:
              case 22:
                LOBYTE(v116) = 0;
                uint64_t v71 = EQKitTypes::Integer::integerFromMathMLString(&__str, (BOOL *)&v116);
                if (!LOBYTE(v116)) {
                  goto LABEL_121;
                }
                uint64_t v72 = v71;
                v73 = (uint64_t **)self->mAttributeCollection;
                __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                LODWORD(__p[0].__r_.__value_.__r.__words[1]) = v13;
                *(void *)&long long v123 = __p;
                v74 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,double>,std::__map_value_compare<EQKitTypes::Attributes::Enum,std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v73 + 49, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123);
                goto LABEL_162;
              case 23:
                LOBYTE(v116) = 0;
                uint64_t v85 = EQKitTypes::UInteger::uIntegerFromMathMLString(&__str, (BOOL *)&v116);
                if (!LOBYTE(v116)) {
                  goto LABEL_121;
                }
                uint64_t v72 = v85;
                v86 = (uint64_t **)self->mAttributeCollection;
                __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                LODWORD(__p[0].__r_.__value_.__r.__words[1]) = 23;
                *(void *)&long long v123 = __p;
                v74 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,double>,std::__map_value_compare<EQKitTypes::Attributes::Enum,std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v86 + 52, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123);
LABEL_162:
                *((void *)v74 + 6) = v72;
                goto LABEL_121;
              case 29:
                EQKitPseudoUnitLength::EQKitPseudoUnitLength(__p, &__str, 1);
                if (!LODWORD(__p[0].__r_.__value_.__l.__data_)) {
                  goto LABEL_121;
                }
                v87 = (uint64_t **)self->mAttributeCollection;
                *(void *)&long long v123 = a3;
                DWORD2(v123) = 29;
                v124[0] = &v123;
                v76 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKitPseudoUnitLength>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKitPseudoUnitLength,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKitPseudoUnitLength>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v87 + 58, (uint64_t *)&v123, (uint64_t)&std::piecewise_construct, v124);
                goto LABEL_169;
              case 30:
                EQKitPseudoUnitLength::EQKitPseudoUnitLength(__p, &__str, 2);
                if (!LODWORD(__p[0].__r_.__value_.__l.__data_)) {
                  goto LABEL_121;
                }
                v88 = (uint64_t **)self->mAttributeCollection;
                *(void *)&long long v123 = a3;
                DWORD2(v123) = 30;
                v124[0] = &v123;
                v76 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKitPseudoUnitLength>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKitPseudoUnitLength,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKitPseudoUnitLength>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v88 + 58, (uint64_t *)&v123, (uint64_t)&std::piecewise_construct, v124);
                goto LABEL_169;
              case 31:
                EQKitPseudoUnitLength::EQKitPseudoUnitLength(__p, &__str, 3);
                if (!LODWORD(__p[0].__r_.__value_.__l.__data_)) {
                  goto LABEL_121;
                }
                v89 = (uint64_t **)self->mAttributeCollection;
                *(void *)&long long v123 = a3;
                DWORD2(v123) = 31;
                v124[0] = &v123;
                v76 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKitPseudoUnitLength>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKitPseudoUnitLength,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKitPseudoUnitLength>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v89 + 58, (uint64_t *)&v123, (uint64_t)&std::piecewise_construct, v124);
                goto LABEL_169;
              case 32:
              case 33:
                EQKitPseudoUnitLength::EQKitPseudoUnitLength(__p, &__str, 0);
                if (!LODWORD(__p[0].__r_.__value_.__l.__data_)) {
                  goto LABEL_121;
                }
                v75 = (uint64_t **)self->mAttributeCollection;
                *(void *)&long long v123 = a3;
                DWORD2(v123) = v13;
                v124[0] = &v123;
                v76 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKitPseudoUnitLength>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKitPseudoUnitLength,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKitPseudoUnitLength>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v75 + 58, (uint64_t *)&v123, (uint64_t)&std::piecewise_construct, v124);
LABEL_169:
                *((_DWORD *)v76 + 12) = __p[0].__r_.__value_.__l.__data_;
                *(_OWORD *)((char *)v76 + 56) = *(_OWORD *)&__p[0].__r_.__value_.__r.__words[1];
                goto LABEL_121;
              case 34:
                EQKitTypes::Crossout::crossoutVectorFromMathMLString(&__str, &__p[0].__r_.__value_.__l.__data_);
                v78 = (void *)__p[0].__r_.__value_.__l.__size_;
                if (__p[0].__r_.__value_.__l.__size_ == __p[0].__r_.__value_.__r.__words[0]) {
                  goto LABEL_204;
                }
                v90 = (uint64_t **)self->mAttributeCollection;
                *(void *)&long long v123 = a3;
                DWORD2(v123) = 34;
                EQKit::AttributeCollection::setValueForKey<std::vector<EQKitTypes::VAlign::Enum>>((uint64_t)v90, v90 + 25, (uint64_t)__p, &v123);
                goto LABEL_203;
              case 35:
                id v91 = [NSString alloc];
                if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  v92 = &__str;
                }
                else {
                  v92 = (std::string *)__str.__r_.__value_.__r.__words[0];
                }
                v93 = objc_msgSend(v91, "initWithUTF8String:", v92, v113);
                if ([v93 length] == 1)
                {
                  uint64_t v94 = [v93 characterAtIndex:0];
                  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "whitespaceAndNewlineCharacterSet"), "characterIsMember:", v94) & 1) == 0)
                  {
                    v95 = (uint64_t **)self->mAttributeCollection;
                    __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                    LODWORD(__p[0].__r_.__value_.__r.__words[1]) = 35;
                    *(void *)&long long v123 = __p;
                    *((_WORD *)std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,unsigned short>,std::__map_value_compare<EQKitTypes::Attributes::Enum,std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v95 + 61, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123)+ 24) = v94;
                  }
                }

                goto LABEL_121;
              case 36:
                if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  std::string::size_type v96 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
                }
                else {
                  std::string::size_type v96 = __str.__r_.__value_.__l.__size_;
                }
                switch(v96)
                {
                  case 6uLL:
                    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                      v109 = &__str;
                    }
                    else {
                      v109 = (std::string *)__str.__r_.__value_.__r.__words[0];
                    }
                    if (!memcmp(v109, "medium", 6uLL))
                    {
                      int data = 5;
                      double v99 = 1.0;
                      goto LABEL_222;
                    }
                    break;
                  case 5uLL:
                    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                      v110 = &__str;
                    }
                    else {
                      v110 = (std::string *)__str.__r_.__value_.__r.__words[0];
                    }
                    if (!memcmp(v110, "thick", 5uLL))
                    {
                      int data = 5;
                      double v99 = 2.0;
                      goto LABEL_222;
                    }
                    break;
                  case 4uLL:
                    v97 = &__str;
                    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                      v97 = (std::string *)__str.__r_.__value_.__r.__words[0];
                    }
                    if (LODWORD(v97->__r_.__value_.__l.__data_) == 1852401780)
                    {
                      int data = 5;
                      double v99 = 0.5;
                      goto LABEL_222;
                    }
                    break;
                }
                EQKitLength::EQKitLength(__p, &__str, 5);
                int data = (int)__p[0].__r_.__value_.__l.__data_;
                if (!LODWORD(__p[0].__r_.__value_.__l.__data_)) {
                  goto LABEL_121;
                }
                double v99 = *(double *)&__p[0].__r_.__value_.__l.__size_;
LABEL_222:
                v111 = (uint64_t **)self->mAttributeCollection;
                __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                LODWORD(__p[0].__r_.__value_.__r.__words[1]) = 36;
                *(void *)&long long v123 = __p;
                v112 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKitLength>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKitLength,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKitLength>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v111 + 4, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123);
                *((_DWORD *)v112 + 12) = data;
                *((double *)v112 + 7) = v99;
                break;
              case 37:
                int v63 = EQKitTypes::GroupAlign::groupAlignFromMathMLString((uint64_t *)&__str, 0);
                if (!v63) {
                  goto LABEL_121;
                }
                v100 = (uint64_t **)self->mAttributeCollection;
                __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                LODWORD(__p[0].__r_.__value_.__r.__words[1]) = 37;
                *(void *)&long long v123 = __p;
                v65 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v100 + 22, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123);
                goto LABEL_193;
              case 38:
                int v63 = EQKitTypes::Edge::edgeFromMathMLString((uint64_t *)&__str, 0);
                if (!v63) {
                  goto LABEL_121;
                }
                v101 = (uint64_t **)self->mAttributeCollection;
                __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                LODWORD(__p[0].__r_.__value_.__r.__words[1]) = 38;
                *(void *)&long long v123 = __p;
                v65 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v101 + 64, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123);
LABEL_193:
                *((_DWORD *)v65 + 12) = v63;
                goto LABEL_121;
              case 42:
                std::istringstream::basic_istringstream[abi:ne180100]((uint64_t *)__p, &__str, 8);
                float v116 = 0.0;
                MEMORY[0x25A28FE80](__p, &v116);
                if ((*(_DWORD *)((unsigned char *)&__p[1].__r_.__value_.__r.__words[1]
                                + *(void *)(__p[0].__r_.__value_.__r.__words[0] - 24)) & 7) == 2)
                {
                  v102 = (uint64_t **)self->mAttributeCollection;
                  float v103 = v116;
                  *(void *)&long long v123 = a3;
                  DWORD2(v123) = 42;
                  v124[0] = &v123;
                  *((double *)std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,double>,std::__map_value_compare<EQKitTypes::Attributes::Enum,std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v102 + 55, (uint64_t *)&v123, (uint64_t)&std::piecewise_construct, v124)+ 6) = v103;
                }
                __p[0].__r_.__value_.__r.__words[0] = v115;
                *(std::string::size_type *)((char *)__p[0].__r_.__value_.__r.__words + *(void *)(v115 - 24)) = v114;
                __p[0].__r_.__value_.__r.__words[2] = MEMORY[0x263F8C318] + 16;
                if (v119 < 0) {
                  operator delete(v118);
                }
                std::streambuf::~streambuf();
                std::istream::~istream();
                MEMORY[0x25A28FFF0](v113);
                goto LABEL_121;
              case 44:
                goto LABEL_116;
              case 46:
                memset(__p, 0, 24);
                if (EQKitLength::lengthVectorFromString(&__str, (uint64_t)__p))
                {
                  v104 = (uint64_t **)self->mAttributeCollection;
                  *(void *)&long long v123 = a3;
                  DWORD2(v123) = 46;
                  EQKit::AttributeCollection::setValueForKey<std::vector<EQKitLength>>((uint64_t)v104, v104 + 7, (uint64_t *)__p, &v123);
                }
                goto LABEL_203;
              case 47:
                EQKitTypes::Notation::notationVectorFromMathMLString(&__str, &__p[0].__r_.__value_.__l.__data_);
                v78 = (void *)__p[0].__r_.__value_.__l.__size_;
                if (__p[0].__r_.__value_.__l.__size_ == __p[0].__r_.__value_.__r.__words[0]) {
                  goto LABEL_204;
                }
                v105 = (uint64_t **)self->mAttributeCollection;
                *(void *)&long long v123 = a3;
                DWORD2(v123) = 47;
                EQKit::AttributeCollection::setValueForKey<std::vector<EQKitTypes::VAlign::Enum>>((uint64_t)v105, v105 + 28, (uint64_t)__p, &v123);
LABEL_203:
                v78 = (void *)__p[0].__r_.__value_.__r.__words[0];
LABEL_204:
                if (v78)
                {
                  __p[0].__r_.__value_.__l.__size_ = (std::string::size_type)v78;
                  operator delete(v78);
                }
                goto LABEL_121;
              default:
                goto LABEL_121;
            }
            goto LABEL_121;
          }
        }
      }
      if (v13 == 44)
      {
        EQKitXMLAttributeValueAsString(a4, properties, &__str);
LABEL_116:
        std::string::size_type v58 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          std::string::size_type v58 = __str.__r_.__value_.__l.__size_;
        }
        if (v58)
        {
          CGColorRef CGColorFromString = EQKitMathMLParserCreateCGColorFromString((uint64_t)&__str);
          v60 = CGColorFromString;
          if (CGColorFromString)
          {
            __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)CFRetain(CGColorFromString);
            EQKit::AttributeCollection::setValueForKey((uint64_t)self->mAttributeCollection, (CFTypeRef *)&__p[0].__r_.__value_.__l.__data_, 44, (uint64_t)a3);
            CGColorRelease(v60);
            EQKitTypes::CFRetainRelease::~CFRetainRelease((const void **)&__p[0].__r_.__value_.__l.__data_);
          }
        }
LABEL_121:
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__str.__r_.__value_.__l.__data_);
        }
      }
LABEL_123:
      properties = properties->next;
    }
    while (properties);
  }
}

- (id)parseChildrenAsTokenContentFromXMLNode:(_xmlNode *)a3
{
  id v3 = a3;
  id v18 = 0;
  memset(&v17, 0, sizeof(v17));
  char v16 = 0;
  char v15 = 1;
  if (!a3) {
    goto LABEL_20;
  }
  children = a3->children;
  if (!children)
  {
LABEL_18:
    LODWORD(v3) = 0;
    goto LABEL_20;
  }
  while (1)
  {
    if (!EQKitXMLIsElement((BOOL)children))
    {
      if (xmlNodeIsText(children))
      {
        char v16 = 1;
        EQKitXMLTextContentAsString(children, 0, &__p);
        BOOL v8 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
           ? &__p
           : (std::string *)__p.__r_.__value_.__r.__words[0];
        std::string::size_type v9 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
           ? HIBYTE(__p.__r_.__value_.__r.__words[2])
           : __p.__r_.__value_.__l.__size_;
        std::string::append(&v17, (const std::string::value_type *)v8, v9);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }
      goto LABEL_17;
    }
    _contentAppendStringIfNeeded(&v18, &v17, &v16, &v15, 0);
    [(EQKitMathMLParser *)self pushState:1];
    id v6 = [(EQKitMathMLParser *)self parseNode:v3];
    [(EQKitMathMLParser *)self popState];
    if (!v6) {
      break;
    }
    id v7 = v18;
    if (!v18)
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v18 = v7;
    }
    [v7 addObject:v6];

LABEL_17:
    children = children->next;
    if (!children) {
      goto LABEL_18;
    }
  }
  LODWORD(v3) = 1;
LABEL_20:
  _contentAppendStringIfNeeded(&v18, &v17, &v16, &v15, 1);
  if (v3)
  {
    v10 = 0;
    id v11 = v18;
  }
  else
  {
    BOOL v12 = [EQKitMathMLTokenContent alloc];
    id v11 = v18;
    v10 = [(EQKitMathMLTokenContent *)v12 initWithChildren:v18];
  }

  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
  return v10;
}

- (id)parseNode:(_xmlNode *)a3
{
  if (!EQKitXMLIsNsElement((BOOL)a3, self->mNS)) {
    goto LABEL_10;
  }
  name = (char *)a3->name;
  if (!name) {
    goto LABEL_10;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, name);
  uint64_t v6 = EQKitMathMLElement::fromString((uint64_t *)__p);
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  if (![(EQKitMathMLParser *)self isElement:v6 allowedInState:[(EQKitMathMLParser *)self state]])
  {
    uint64_t v7 = 3;
    goto LABEL_9;
  }
  if ((v6 - 40) < 0x88)
  {
    uint64_t v7 = 6;
LABEL_9:
    [(EQKitMathMLParser *)self reportError:v7 withNode:a3];
    goto LABEL_10;
  }
  v10 = off_2653C49B0;
  switch((int)v6)
  {
    case 1:
      break;
    case 2:
      v10 = off_2653C49C8;
      break;
    case 3:
      v10 = off_2653C49D0;
      break;
    case 4:
      v10 = off_2653C49F8;
      break;
    case 5:
      v10 = &off_2653C4AA0;
      break;
    case 6:
      v10 = off_2653C4978;
      break;
    case 7:
      v10 = off_2653C49A8;
      break;
    case 8:
      v10 = off_2653C49E8;
      break;
    case 9:
      v10 = off_2653C4A50;
      break;
    case 10:
      v10 = off_2653C4A60;
      break;
    case 11:
      v10 = off_2653C4A58;
      break;
    case 12:
      v10 = off_2653C49A0;
      break;
    case 13:
      v10 = off_2653C4A48;
      break;
    case 14:
      v10 = off_2653C4A88;
      break;
    case 15:
      v10 = off_2653C49D8;
      break;
    case 16:
      v10 = off_2653C4A90;
      break;
    case 17:
      v10 = off_2653C4A10;
      break;
    case 18:
      v10 = off_2653C4A28;
      break;
    case 19:
      v10 = off_2653C4A38;
      break;
    case 20:
      v10 = off_2653C4A30;
      break;
    case 21:
      v10 = off_2653C4A18;
      break;
    case 22:
      v10 = off_2653C4A20;
      break;
    case 23:
      v10 = off_2653C49C0;
      break;
    case 24:
      v10 = off_2653C4A68;
      break;
    case 25:
      v10 = off_2653C4A80;
      break;
    case 26:
      v10 = off_2653C49B8;
      break;
    case 27:
      v10 = off_2653C4A70;
      break;
    case 28:
      v10 = off_2653C49F0;
      break;
    case 29:
      v10 = off_2653C4A08;
      break;
    case 30:
      v10 = off_2653C4A98;
      break;
    case 32:
      v10 = off_2653C4A40;
      break;
    case 33:
      v10 = off_2653C4A78;
      break;
    case 34:
      v10 = off_2653C4980;
      break;
    case 35:
      v10 = off_2653C4A00;
      break;
    case 36:
      v10 = off_2653C4998;
      break;
    case 37:
      v10 = off_2653C49E0;
      break;
    case 38:
      v10 = off_2653C4988;
      break;
    case 39:
      v10 = off_2653C4990;
      break;
    default:
      uint64_t v7 = 2;
      goto LABEL_9;
  }
  id v11 = (id)[objc_alloc(*v10) initFromXMLNode:a3 parser:self];
  if (v11)
  {
    BOOL v8 = v11;
    [(EQKitMathMLParser *)self parseAttributesForNode:v11 withXMLNode:a3];
    return v8;
  }
LABEL_10:
  [(EQKitMathMLParser *)self reportError:4 withNode:a3];
  return 0;
}

- (void)pushState:(int)a3
{
  int v3 = a3;
  std::deque<EQKitMathMLParserState>::push_back(&self->mState.c.__map_.__first_, &v3);
}

- (void)popState
{
  unint64_t value = self->mState.c.__size_.__value_;
  if (value)
  {
    self->mState.c.__size_.__value_ = value - 1;
    std::deque<EQKitMathMLParserState>::__maybe_remove_back_spare[abi:ne180100](&self->mState.c.__map_.__first_, 1);
  }
}

- (int)state
{
  unint64_t value = self->mState.c.__size_.__value_;
  if (value) {
    return (*(int **)((char *)self->mState.c.__map_.__begin_
  }
                    + (((value + self->mState.c.__start_ - 1) >> 7) & 0x1FFFFFFFFFFFFF8)))[(value
                                                                                            + self->mState.c.__start_
                                                                                            - 1) & 0x3FF];
  else {
    return 0;
  }
}

- (BOOL)isElement:(int)a3 allowedInState:(int)a4
{
  switch(a4)
  {
    case 0:
      BOOL v4 = __CFADD__(a3 - 28, 3);
      return !v4;
    case 1:
      BOOL v6 = a3 == 31 || a3 == 39;
      goto LABEL_12;
    case 2:
      BOOL v4 = (a3 - 25) >= 2;
      return !v4;
    case 3:
      BOOL v6 = a3 == 27;
LABEL_12:
      BOOL result = v6;
      break;
    default:
      BOOL result = 1;
      break;
  }
  return result;
}

- (_xmlNs)ns
{
  return self->mNS;
}

- (NSError)error
{
  return self->mError;
}

- (void).cxx_destruct
{
  if (*((char *)&self->mAttribution.__r_.__value_.var0.__l + 23) < 0) {
    operator delete(self->mAttribution.__r_.__value_.var0.__l.__data_);
  }

  std::deque<EQKitMathMLParserState>::~deque[abi:ne180100](&self->mState.c.__map_.__first_);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 7) = 0uLL;
  *((void *)self + 13) = 0;
  return self;
}

@end