@interface CKObjCType
+ (id)typeForEncoding:(const char *)a3;
+ (id)typeForValue:(id)a3;
- (CKObjCType)initWithCode:(int64_t)a3;
- (NSString)className;
- (NSString)encoding;
- (NSString)name;
- (id)description;
- (int64_t)code;
- (unint64_t)flags;
- (unint64_t)size;
@end

@implementation CKObjCType

+ (id)typeForEncoding:(const char *)a3
{
  v5 = objc_msgSend_stringWithUTF8String_(NSString, a2, (uint64_t)a3, v3);
  v9 = v5;
  int v10 = *a3;
  if (v10 > 90)
  {
    switch(*a3)
    {
      case '^':
        v11 = [__CKDynamicObjCType alloc];
        uint64_t v13 = objc_msgSend_initWithCode_encoding_(v11, v12, 22, (uint64_t)v9);
        goto LABEL_48;
      case '_':
      case 'a':
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
      case 't':
      case 'u':
        goto LABEL_32;
      case 'b':
        v28 = [__CKDynamicObjCType alloc];
        uint64_t v13 = objc_msgSend_initWithCode_encoding_(v28, v29, 21, (uint64_t)v9);
        goto LABEL_48;
      case 'c':
        v30 = [CKObjCType alloc];
        uint64_t v13 = objc_msgSend_initWithCode_(v30, v31, 0, v32);
        goto LABEL_48;
      case 'd':
        v33 = [CKObjCType alloc];
        uint64_t v13 = objc_msgSend_initWithCode_(v33, v34, 11, v35);
        goto LABEL_48;
      case 'f':
        v36 = [CKObjCType alloc];
        uint64_t v13 = objc_msgSend_initWithCode_(v36, v37, 10, v38);
        goto LABEL_48;
      case 'i':
        v39 = [CKObjCType alloc];
        uint64_t v13 = objc_msgSend_initWithCode_(v39, v40, 2, v41);
        goto LABEL_48;
      case 'l':
        v42 = [CKObjCType alloc];
        uint64_t v13 = objc_msgSend_initWithCode_(v42, v43, 3, v44);
        goto LABEL_48;
      case 'q':
        v45 = [CKObjCType alloc];
        uint64_t v13 = objc_msgSend_initWithCode_(v45, v46, 4, v47);
        goto LABEL_48;
      case 's':
        v48 = [CKObjCType alloc];
        uint64_t v13 = objc_msgSend_initWithCode_(v48, v49, 1, v50);
        goto LABEL_48;
      case 'v':
        v51 = [CKObjCType alloc];
        uint64_t v13 = objc_msgSend_initWithCode_(v51, v52, 13, v53);
        goto LABEL_48;
      default:
        if (v10 == 91)
        {
          v86 = [__CKDynamicObjCType alloc];
          uint64_t v13 = objc_msgSend_initWithCode_encoding_(v86, v87, 18, (uint64_t)v9);
        }
        else
        {
          if (v10 != 123) {
            goto LABEL_32;
          }
          v23 = [__CKDynamicObjCType alloc];
          uint64_t v13 = objc_msgSend_initWithCode_encoding_(v23, v24, 19, (uint64_t)v9);
        }
        break;
    }
    goto LABEL_48;
  }
  if (v10 > 72)
  {
    if (v10 > 80)
    {
      if (v10 == 81)
      {
        v83 = [CKObjCType alloc];
        uint64_t v13 = objc_msgSend_initWithCode_(v83, v84, 9, v85);
        goto LABEL_48;
      }
      if (v10 == 83)
      {
        v25 = [CKObjCType alloc];
        uint64_t v13 = objc_msgSend_initWithCode_(v25, v26, 6, v27);
        goto LABEL_48;
      }
    }
    else
    {
      if (v10 == 73)
      {
        v75 = [CKObjCType alloc];
        uint64_t v13 = objc_msgSend_initWithCode_(v75, v76, 7, v77);
        goto LABEL_48;
      }
      if (v10 == 76)
      {
        v17 = [CKObjCType alloc];
        uint64_t v13 = objc_msgSend_initWithCode_(v17, v18, 8, v19);
        goto LABEL_48;
      }
    }
LABEL_32:
    v57 = [__CKDynamicObjCType alloc];
    uint64_t v13 = objc_msgSend_initWithCode_encoding_(v57, v58, 23, (uint64_t)v9);
    goto LABEL_48;
  }
  if (v10 <= 57)
  {
    switch(v10)
    {
      case '#':
        v78 = [CKObjCType alloc];
        uint64_t v13 = objc_msgSend_initWithCode_(v78, v79, 16, v80);
        goto LABEL_48;
      case '(':
        v81 = [__CKDynamicObjCType alloc];
        uint64_t v13 = objc_msgSend_initWithCode_encoding_(v81, v82, 20, (uint64_t)v9);
        goto LABEL_48;
      case '*':
        v20 = [CKObjCType alloc];
        uint64_t v13 = objc_msgSend_initWithCode_(v20, v21, 14, v22);
        goto LABEL_48;
    }
    goto LABEL_32;
  }
  switch(*a3)
  {
    case ':':
      v14 = [CKObjCType alloc];
      uint64_t v13 = objc_msgSend_initWithCode_(v14, v15, 17, v16);
      break;
    case '@':
      if ((unint64_t)objc_msgSend_length(v5, v6, v7, v8) >= 4
        && objc_msgSend_characterAtIndex_(v9, v59, 1, v61) == 34)
      {
        uint64_t v62 = objc_msgSend_length(v9, v59, v60, v61);
        if (objc_msgSend_characterAtIndex_(v9, v63, v62 - 1, v64) == 34)
        {
          uint64_t v65 = objc_msgSend_length(v9, v59, v60, v61);
          objc_msgSend_substringWithRange_(v9, v66, 2, v65 - 3);
          v67 = (NSString *)objc_claimAutoreleasedReturnValue();
          v68 = [__CKClassObjCType alloc];
          Class v69 = NSClassFromString(v67);
          v71 = objc_msgSend_initWithCode_encoding_class_(v68, v70, 15, (uint64_t)v9, v69);

          goto LABEL_49;
        }
      }
      if ((unint64_t)objc_msgSend_length(v9, v59, v60, v61) >= 2
        && objc_msgSend_characterAtIndex_(v9, v88, 1, v89) == 63)
      {
        v90 = [CKObjCType alloc];
        uint64_t v13 = objc_msgSend_initWithCode_(v90, v91, 24, v92);
      }
      else
      {
        v93 = [CKObjCType alloc];
        uint64_t v13 = objc_msgSend_initWithCode_(v93, v94, 15, v95);
      }
      break;
    case 'B':
      v72 = [CKObjCType alloc];
      uint64_t v13 = objc_msgSend_initWithCode_(v72, v73, 12, v74);
      break;
    case 'C':
      v54 = [CKObjCType alloc];
      uint64_t v13 = objc_msgSend_initWithCode_(v54, v55, 5, v56);
      break;
    default:
      goto LABEL_32;
  }
LABEL_48:
  v71 = (void *)v13;
LABEL_49:

  return v71;
}

+ (id)typeForValue:(id)a3
{
  uint64_t v5 = objc_msgSend_objCType(a3, a2, (uint64_t)a3, v3);

  return (id)objc_msgSend_typeForEncoding_(CKObjCType, v4, v5, v6);
}

- (CKObjCType)initWithCode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKObjCType;
  result = [(CKObjCType *)&v5 init];
  if (result) {
    result->_code = a3;
  }
  return result;
}

- (id)description
{
  objc_super v5 = NSString;
  uint64_t v6 = objc_msgSend_name(self, a2, v2, v3);
  int v10 = objc_msgSend_encoding(self, v7, v8, v9);
  uint64_t v13 = objc_msgSend_stringWithFormat_(v5, v11, @"<CKObjCType %p: %@ (%@)>", v12, self, v6, v10);

  return v13;
}

- (NSString)encoding
{
  objc_msgSend_code(self, a2, v2, v3);
  uint64_t v8 = @"?";
  switch((unint64_t)@"?")
  {
    case 0uLL:
      objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"c", v7);
      goto LABEL_20;
    case 1uLL:
      objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"s", v7);
      goto LABEL_20;
    case 2uLL:
      objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"i", v7);
      goto LABEL_20;
    case 3uLL:
    case 4uLL:
      objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"q", v7);
      goto LABEL_20;
    case 5uLL:
      objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"C", v7);
      goto LABEL_20;
    case 6uLL:
      objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"S", v7);
      goto LABEL_20;
    case 7uLL:
      objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"I", v7);
      goto LABEL_20;
    case 8uLL:
    case 9uLL:
      objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"Q", v7);
      goto LABEL_20;
    case 0xAuLL:
      objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"f", v7);
      goto LABEL_20;
    case 0xBuLL:
      objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"d", v7);
      goto LABEL_20;
    case 0xCuLL:
      objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"B", v7);
      goto LABEL_20;
    case 0xDuLL:
      objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"v", v7);
      goto LABEL_20;
    case 0xEuLL:
      objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"^v", v7);
      goto LABEL_20;
    case 0xFuLL:
      objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"@", v7);
      goto LABEL_20;
    case 0x10uLL:
      objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"#", v7);
      goto LABEL_20;
    case 0x11uLL:
      objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)":", v7);
      goto LABEL_20;
    case 0x16uLL:
      break;
    case 0x18uLL:
      objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"@?", v7);
LABEL_20:
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3B8];
      uint64_t v11 = objc_msgSend_code(self, v5, v6, v7);
      objc_msgSend_raise_format_(v9, v12, v10, @"Unable to determine encoding for type %zd", v11);
      uint64_t v8 = @"?";
      break;
  }

  return (NSString *)v8;
}

- (NSString)name
{
  unint64_t v5 = objc_msgSend_code(self, a2, v2, v3);
  if (v5 < 0x19) {
    return &off_1E5465778[v5]->isa;
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v11 = *MEMORY[0x1E4F1C3B8];
  uint64_t v12 = objc_msgSend_code(self, v6, v7, v8);
  objc_msgSend_raise_format_(v10, v13, v11, @"Unable to determine name for type %zd", v12);
  return (NSString *)@"unknown";
}

- (unint64_t)flags
{
  unint64_t v4 = objc_msgSend_code(self, a2, v2, v3);
  if (v4 > 0x18) {
    return 0;
  }
  else {
    return qword_18B1F3D38[v4];
  }
}

- (unint64_t)size
{
  unint64_t code = self->_code;
  if (code > 0x18) {
    return 0;
  }
  else {
    return qword_18B1F3E00[code];
  }
}

- (NSString)className
{
  return 0;
}

- (int64_t)code
{
  return self->_code;
}

@end