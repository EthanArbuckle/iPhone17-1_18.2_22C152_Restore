@interface FigCaptureFlatPlist
+ (id)flatPlistWithContentsOfFile:(id)a3;
+ (id)flatPlistWithContentsOfURL:(id)a3;
- (const)bplist;
- (id)initWithMutableData:(void *)a1;
- (void)dealloc;
- (void)objectAtOffset:(void *)result;
- (void)rootDictionary;
@end

@implementation FigCaptureFlatPlist

- (void)objectAtOffset:(void *)result
{
  if (!result) {
    return result;
  }
  v3 = result;
  v4 = result + 2;
  int TypeForObjectAtOffset = FigCaptureBinaryPlistGetTypeForObjectAtOffset(result + 2, a2);
  if (TypeForObjectAtOffset > 34)
  {
    if (TypeForObjectAtOffset <= 95)
    {
      if (TypeForObjectAtOffset <= 63)
      {
        if (TypeForObjectAtOffset == 35)
        {
          v28 = NSNumber;
          v29.n64_u64[0] = FigCaptureBinaryPlistGetRealForObjectAtOffset(v4, a2).n64_u64[0];
          return (void *)[v28 numberWithDouble:v29.n64_f64[0]];
        }
        if (TypeForObjectAtOffset == 48)
        {
          v10 = (void *)MEMORY[0x1E4F1C9C8];
          v11.n64_u64[0] = FigCaptureBinaryPlistGetRealForObjectAtOffset(v4, a2).n64_u64[0];
          return (void *)[v10 dateWithTimeIntervalSince1970:v11.n64_f64[0]];
        }
        goto LABEL_50;
      }
      if (TypeForObjectAtOffset == 64)
      {
        DataAndCountForObjectAtOffset = FigCaptureBinaryPlistGetDataAndCountForObjectAtOffset(v4, a2);
        v32 = (void *)MEMORY[0x1E4F1C9B8];
        return (void *)[v32 dataWithBytes:DataAndCountForObjectAtOffset length:v30];
      }
      if (TypeForObjectAtOffset == 80)
      {
        v14 = FigCaptureBinaryPlistGetDataAndCountForObjectAtOffset(v4, a2);
        uint64_t v16 = v15;
        id v17 = [NSString alloc];
        v18 = v14;
        uint64_t v19 = v16;
        uint64_t v20 = 4;
        goto LABEL_38;
      }
    }
    else
    {
      if (TypeForObjectAtOffset <= 191)
      {
        if (TypeForObjectAtOffset != 96)
        {
          if (TypeForObjectAtOffset == 160)
          {
            v9 = FigCaptureFlatPlistArray;
LABEL_43:
            v27 = (void *)[[v9 alloc] initWithFlatPlist:v3 offset:a2];
            goto LABEL_44;
          }
          goto LABEL_50;
        }
        v24 = FigCaptureBinaryPlistGetDataAndCountForObjectAtOffset(v4, a2);
        uint64_t v26 = v25;
        id v17 = [NSString alloc];
        v18 = v24;
        uint64_t v19 = v26;
        uint64_t v20 = 2415919360;
LABEL_38:
        v27 = (void *)[v17 initWithBytes:v18 length:v19 encoding:v20];
LABEL_44:
        return v27;
      }
      if (TypeForObjectAtOffset == 192)
      {
        v9 = FigCaptureFlatPlistSet;
        goto LABEL_43;
      }
      if (TypeForObjectAtOffset == 208)
      {
        v9 = FigCaptureFlatPlistDict;
        goto LABEL_43;
      }
    }
LABEL_50:
    abort();
  }
  int v6 = TypeForObjectAtOffset - 8;
  result = (void *)MEMORY[0x1E4F1CC28];
  switch(v6)
  {
    case 0:
      return result;
    case 1:
      return (void *)MEMORY[0x1E4F1CC38];
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      goto LABEL_50;
    case 8:
    case 9:
    case 10:
      v7 = NSNumber;
      uint64_t IntForObjectAtOffset = FigCaptureBinaryPlistGetIntForObjectAtOffset(v4, a2);
      return (void *)[v7 numberWithInt:IntForObjectAtOffset];
    case 11:
      v22 = NSNumber;
      uint64_t v23 = FigCaptureBinaryPlistGetIntForObjectAtOffset(v4, a2);
      return (void *)[v22 numberWithLongLong:v23];
    default:
      if ((MEMORY[0x1E4F1CC28] - 33) < 2)
      {
        v12 = NSNumber;
        double v13 = FigCaptureBinaryPlistGetRealForObjectAtOffset(v4, a2).n64_f64[0];
        *(float *)&double v13 = v13;
        return (void *)[v12 numberWithFloat:v13];
      }
      if (MEMORY[0x1E4F1CC28]) {
        goto LABEL_50;
      }
      v21 = (void *)MEMORY[0x1E4F1CA98];
      result = (void *)[v21 null];
      break;
  }
  return result;
}

- (const)bplist
{
  return (const $4FA865112F5229015B8A293C0B690A6B *)&self->_bplist;
}

- (void)rootDictionary
{
  if (result)
  {
    v1 = result;
    unint64_t OffsetForReference = FigCaptureBinaryPlistGetOffsetForReference((uint64_t)(result + 2), 0);
    return -[FigCaptureFlatPlist objectAtOffset:](v1, OffsetForReference);
  }
  return result;
}

+ (id)flatPlistWithContentsOfURL:(id)a3
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithContentsOfURL:a3];
  if ((unint64_t)[v3 length] < 8) {
    return 0;
  }
  if (!strncmp((const char *)[v3 bytes], "bplist00", 8uLL))
  {
    int v6 = -[FigCaptureFlatPlist initWithMutableData:]([FigCaptureFlatPlist alloc], v3);
    return -[FigCaptureFlatPlist rootDictionary](v6);
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F28F98];
    return (id)[v5 propertyListWithData:v3 options:0 format:0 error:0];
  }
}

- (id)initWithMutableData:(void *)a1
{
  id v2 = 0;
  if (a1)
  {
    if (a2)
    {
      v6.receiver = a1;
      v6.super_class = (Class)FigCaptureFlatPlist;
      id v2 = objc_msgSendSuper2(&v6, sel_self);
      if (v2)
      {
        id v4 = a2;
        *((void *)v2 + 1) = v4;
        if (!v4) {
          -[FigCaptureFlatPlist initWithMutableData:]();
        }
        FigCaptureBinaryPlistInitialize((uint64_t)v2 + 16, (char *)[v4 mutableBytes], objc_msgSend(*((id *)v2 + 1), "length"));
      }
    }
  }
  return v2;
}

+ (id)flatPlistWithContentsOfFile:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3];
  return +[FigCaptureFlatPlist flatPlistWithContentsOfURL:v3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureFlatPlist;
  [(FigCaptureFlatPlist *)&v3 dealloc];
}

- (void)initWithMutableData:.cold.1()
{
}

@end