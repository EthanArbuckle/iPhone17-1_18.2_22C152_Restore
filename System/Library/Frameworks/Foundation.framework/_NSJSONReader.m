@interface _NSJSONReader
+ (BOOL)validForJSON:(id)a3 depth:(unint64_t)a4 allowFragments:(BOOL)a5;
- (id)parseData:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)parseStream:(id)a3 options:(unint64_t)a4 error:(id *)a5;
@end

@implementation _NSJSONReader

+ (BOOL)validForJSON:(id)a3 depth:(unint64_t)a4 allowFragments:(BOOL)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a4 > 0x1FF) {
    return 0;
  }
  BOOL v6 = a5;
  if (_NSIsNSDictionary())
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 1;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51___NSJSONReader_validForJSON_depth_allowFragments___block_invoke;
    v15[3] = &unk_1E51FB3D0;
    v15[4] = &v16;
    v15[5] = a4;
    [a3 enumerateKeysAndObjectsUsingBlock:v15];
LABEL_7:
    BOOL v5 = *((unsigned char *)v17 + 24) != 0;
    _Block_object_dispose(&v16, 8);
    return v5;
  }
  if (_NSIsNSArray())
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 1;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51___NSJSONReader_validForJSON_depth_allowFragments___block_invoke_2;
    v14[3] = &unk_1E51FB3F8;
    v14[4] = &v16;
    v14[5] = a4;
    [a3 enumerateObjectsUsingBlock:v14];
    goto LABEL_7;
  }
  if (!v6) {
    return 0;
  }
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  if (_NSIsNSString())
  {
    BOOL v10 = [a3 dataUsingEncoding:4 allowLossyConversion:0] == 0;
    return !v10;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (_NSIsNSNumber())
    {
      int v11 = *(char *)[a3 objCType];
      if (v11 == 100)
      {
        [a3 doubleValue];
        [a3 doubleValue];
        if (fabs(v13) != INFINITY) {
          return 1;
        }
      }
      else
      {
        if (v11 != 102) {
          return 1;
        }
        [a3 floatValue];
        [a3 floatValue];
        if (fabsf(v12) != INFINITY) {
          return 1;
        }
      }
    }
    return 0;
  }
  uint64_t v16 = 0;
  v17 = 0;
  LODWORD(v18) = 0;
  if (!a3) {
    return 1;
  }
  [a3 decimalValue];
  BOOL v10 = (v16 & 0x1F00) == 4096;
  return !v10;
}

- (id)parseData:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if ([a3 length])
  {
    if (!self)
    {
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      goto LABEL_51;
    }
    v9 = (unsigned __int8 *)[v7 bytes];
    unint64_t v10 = [v7 length];
    if (v10 < 5)
    {
      if (v10 < 3) {
        goto LABEL_61;
      }
      int v11 = *v9;
      goto LABEL_15;
    }
    int v11 = *v9;
    if (v11 == 254)
    {
      int v19 = v9[1];
      if (v19 != 255) {
        goto LABEL_60;
      }
      if (v9[2] || v9[3] != 255)
      {
        uint64_t v16 = 2;
        goto LABEL_25;
      }
      uint64_t v17 = 2617245952;
    }
    else
    {
      if (*v9)
      {
LABEL_15:
        if (v11 == 254)
        {
          if (v9[1] == 255)
          {
            uint64_t v17 = 2415919360;
            goto LABEL_50;
          }
        }
        else if (v11 == 255 && v9[1] == 254)
        {
          uint64_t v17 = 2483028224;
LABEL_50:
          uint64_t v16 = 2;
          goto LABEL_51;
        }
        if (v10 < 4) {
          goto LABEL_61;
        }
        if (v11 == 239)
        {
          if (v9[1] == 187)
          {
            int v22 = v9[2];
            if (v22 == 191) {
              uint64_t v16 = 3;
            }
            else {
              uint64_t v16 = 0;
            }
            if (v10 < 5 || v22 == 191) {
              goto LABEL_62;
            }
          }
          else if (v10 < 5)
          {
            goto LABEL_61;
          }
          goto LABEL_59;
        }
        if (v10 < 5) {
          goto LABEL_61;
        }
        if (v11)
        {
LABEL_59:
          int v19 = v9[1];
LABEL_60:
          if (v19) {
            goto LABEL_61;
          }
          uint64_t v16 = 0;
          int v48 = v9[3];
          if (v9[2]) {
            uint64_t v17 = 2483028224;
          }
          else {
            uint64_t v17 = 2617245952;
          }
          if (!v48) {
            goto LABEL_51;
          }
LABEL_62:
          v26 = (_NSJSONRoundTrippingNumber *)malloc_type_calloc(1uLL, 0x2038uLL, 0x109004015BCA0ECuLL);
          v26->super.isa = (Class)[v7 bytes];
          uint64_t v27 = [v7 length];
          v26[1]._representation = (NSString *)1;
          v26->_representation = (NSString *)v27;
          v26[1].super.isa = (Class)v16;
          v26->_number = (NSNumber *)a4;
          if (skipJSONWhitespace((uint64_t)v26, a5, (a4 & 0x10) != 0)
            && (v28 = (NSString *)v26[1].super.isa, v26->_representation > v28))
          {
            if ((a4 & 0x10) != 0)
            {
              v29 = newJSONObject((uint64_t)v26, 1, a5);
LABEL_86:
              id v39 = v29;
              if (v29 && v26[1].super.isa < (Class)v26->_representation)
              {
                if ((skipJSONWhitespace((uint64_t)v26, a5, 1) & 1) == 0)
                {
LABEL_95:

                  goto LABEL_75;
                }
                isa = (NSString *)v26[1].super.isa;
                if (isa != v26->_representation)
                {
                  if (a5)
                  {
                    Class v43 = v26[2].super.isa;
                    BOOL v33 = isa >= (NSString *)v43;
                    int64_t v44 = (char *)isa - (char *)v43;
                    if (v33) {
                      int64_t v45 = v44;
                    }
                    else {
                      int64_t v45 = 0;
                    }
                    v46 = [[NSString alloc] initWithFormat:@"%@ around line %lu, column %lu.", @"Garbage at end", v26[1]._representation, v45];
                    v47 = [[NSNumber alloc] initWithUnsignedInteger:v26[1].super.isa];
                    v56 = @"NSDebugDescription";
                    v57 = @"NSJSONSerializationErrorIndex";
                    v58 = v46;
                    v59 = v47;
                    *a5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 3840, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v56 count:2]);
                  }
                  goto LABEL_95;
                }
              }
LABEL_78:
              for (uint64_t i = 72; i != 8264; i += 32)
              {
                v41 = *(Class *)((char *)&v26->super.isa + i);
                if (v41) {
              }
                }
              free(v26);
              return v39;
            }
            if ((a4 & 4) != 0 || (*((unsigned __int8 *)v26->super.isa + (unint64_t)v28) | 0x20) == 0x7B)
            {
              v29 = newJSONValue(v26, a5);
              goto LABEL_86;
            }
            if (!a5) {
              goto LABEL_75;
            }
            Class v49 = v26[2].super.isa;
            BOOL v33 = v28 >= (NSString *)v49;
            int64_t v50 = (char *)v28 - (char *)v49;
            if (v33) {
              int64_t v51 = v50;
            }
            else {
              int64_t v51 = 0;
            }
            v36 = [[NSString alloc] initWithFormat:@"%@ around line %lu, column %lu.", @"JSON text did not start with array or object and option to allow fragments not set.", v26[1]._representation, v51];
          }
          else
          {
            if ((a4 & 0x10) != 0)
            {
              if (a4) {
                v30 = (objc_class *)MEMORY[0x1E4F1CA60];
              }
              else {
                v30 = (objc_class *)MEMORY[0x1E4F1C9E8];
              }
              id v39 = objc_alloc_init(v30);
              goto LABEL_78;
            }
            if (!a5)
            {
LABEL_75:
              id v39 = 0;
              goto LABEL_78;
            }
            Class v31 = v26[1].super.isa;
            Class v32 = v26[2].super.isa;
            BOOL v33 = v31 >= v32;
            int64_t v34 = v31 - v32;
            if (v33) {
              int64_t v35 = v34;
            }
            else {
              int64_t v35 = 0;
            }
            v36 = [[NSString alloc] initWithFormat:@"%@ around line %lu, column %lu.", @"JSON text did not have any content", v26[1]._representation, v35];
          }
          v37 = v36;
          v38 = [[NSNumber alloc] initWithUnsignedInteger:v26[1].super.isa];
          v56 = @"NSDebugDescription";
          v57 = @"NSJSONSerializationErrorIndex";
          v58 = v37;
          v59 = v38;
          *a5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 3840, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v56 count:2]);

          goto LABEL_75;
        }
        int v15 = v9[2];
        if (!v9[1])
        {
          if (!v9[2]) {
            goto LABEL_101;
          }
LABEL_61:
          uint64_t v16 = 0;
          goto LABEL_62;
        }
        goto LABEL_12;
      }
      int v15 = v9[2];
      if (v9[1])
      {
LABEL_12:
        if (v15) {
          goto LABEL_61;
        }
        uint64_t v16 = 0;
        if (!v9[3]) {
          goto LABEL_62;
        }
LABEL_25:
        uint64_t v17 = 2415919360;
LABEL_51:
        v23 = -[NSString initWithBytes:length:encoding:]([NSString alloc], "initWithBytes:length:encoding:", [v7 bytes] + v16, objc_msgSend(v7, "length") - v16, v17);
        if (v23)
        {
          uint64_t v24 = [(NSString *)v23 dataUsingEncoding:4];
          if (self)
          {
            id v7 = (id)v24;
            goto LABEL_61;
          }
          return 0;
        }
        if (!a5) {
          return 0;
        }
        v52 = @"NSDebugDescription";
        v53 = @"Unable to convert data to a string using the detected encoding. The data may be corrupt.";
        float v12 = (void *)MEMORY[0x1E4F1C9E8];
        double v13 = &v53;
        v14 = &v52;
LABEL_56:
        v25 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 3840, [v12 dictionaryWithObjects:v13 forKeys:v14 count:1]);
        id result = 0;
        *a5 = v25;
        return result;
      }
      if (!v9[2])
      {
LABEL_101:
        uint64_t v16 = 0;
        if (!v9[3]) {
          goto LABEL_62;
        }
        uint64_t v17 = 2550137088;
        goto LABEL_51;
      }
      if (v15 != 254 || v9[3] != 255) {
        goto LABEL_61;
      }
      uint64_t v17 = 2550137088;
    }
    uint64_t v16 = 4;
    goto LABEL_51;
  }
  if ((a4 & 0x10) == 0)
  {
    if (!a5) {
      return 0;
    }
    v54 = @"NSDebugDescription";
    v55 = @"Unable to parse empty data.";
    float v12 = (void *)MEMORY[0x1E4F1C9E8];
    double v13 = &v55;
    v14 = &v54;
    goto LABEL_56;
  }
  if (a4) {
    uint64_t v18 = (objc_class *)MEMORY[0x1E4F1CA60];
  }
  else {
    uint64_t v18 = (objc_class *)MEMORY[0x1E4F1C9E8];
  }
  id v20 = objc_alloc_init(v18);

  return v20;
}

- (id)parseStream:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v9 = (void *)[MEMORY[0x1E4F1CA58] data];
  unint64_t v10 = malloc_type_malloc(0x1000uLL, 0x100004077774924uLL);
  while ([a3 streamStatus] == 2 || objc_msgSend(a3, "streamStatus") == 3)
  {
    if ([a3 hasBytesAvailable])
    {
      uint64_t v11 = [a3 read:v10 maxLength:4096];
      if (v11 < 0)
      {
        if (a5)
        {
          double v13 = @"NSUnderlyingError";
          v14[0] = [a3 streamError];
          *a5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 3840, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1]);
        }
        free(v10);
        return 0;
      }
      if (v11) {
        [v9 appendBytes:v10 length:v11];
      }
    }
  }
  free(v10);

  return [(_NSJSONReader *)self parseData:v9 options:a4 error:a5];
}

@end