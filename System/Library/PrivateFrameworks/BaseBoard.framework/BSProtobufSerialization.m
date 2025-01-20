@interface BSProtobufSerialization
+ (id)buildSchemaForClass:(Class)a3 builder:(id)a4;
+ (id)decodeObjectOfClass:(Class)a3 fromData:(id)a4 error:(id *)a5;
+ (id)encodeObject:(id)a3 error:(id *)a4;
@end

@implementation BSProtobufSerialization

+ (id)decodeObjectOfClass:(Class)a3 fromData:(id)a4 error:(id *)a5
{
  v7 = _BSProtobufValidateClassForEncoding((uint64_t)"<top level>", a3);
  uint64_t v8 = [(objc_class *)v7 protobufSchema];
  if (v8)
  {
    uint64_t v9 = v8;
    while (1)
    {
      uint64_t v9 = *(void *)(v9 + 16);
      if (!v9) {
        break;
      }
      if (*(void *)(v9 + 56)) {
        goto LABEL_7;
      }
    }
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = 0;
  }
LABEL_7:
  v10 = (unsigned char *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:a4];
  id v18 = 0;
  uint64_t v11 = *(void *)(v9 + 56);
  if (v11)
  {
    v17 = &v18;
    v12 = (void **)&v17;
  }
  else
  {
    if (*(unsigned char *)(v9 + 73)) {
      id v13 = (id)[[v7 alloc] initForProtobufDecoding];
    }
    else {
      id v13 = objc_alloc_init(v7);
    }
    id v18 = v13;
    v12 = &v18;
    uint64_t v11 = v9;
  }
  int v14 = _BSProtobufSchemaDecodeMessage(v11, v12, v10, a5);

  id v15 = v18;
  if (v14) {
    return v18;
  }
  else {
    return 0;
  }
}

+ (id)encodeObject:(id)a3 error:(id *)a4
{
  id v13 = a3;
  v6 = objc_opt_class();
  uint64_t v7 = [(objc_class *)_BSProtobufValidateClassForEncoding((uint64_t)"<top level>", v6) protobufSchema];
  if (v7)
  {
    uint64_t v8 = v7;
    while (1)
    {
      uint64_t v8 = *(void *)(v8 + 16);
      if (!v8) {
        break;
      }
      if (*(void *)(v8 + 56)) {
        goto LABEL_7;
      }
    }
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v8 = 0;
  }
LABEL_7:
  id v9 = objc_alloc_init(MEMORY[0x1E4F94098]);
  v10 = *(void **)(v8 + 56);
  if (!v10)
  {
    if (_BSProtobufSchemaEncodeMessage(v8, (uint64_t)a3, (uint64_t)v9, (uint64_t)a4)) {
      goto LABEL_9;
    }
LABEL_11:
    id v11 = 0;
    goto LABEL_12;
  }
  if ((_BSProtobufSchemaEncodeMessageWithExplicitIvarBaseAddress(v10, (uint64_t)&v13, (uint64_t)v9, (uint64_t)a4) & 1) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  id v11 = (id)[v9 immutableData];
LABEL_12:

  return v11;
}

+ (id)buildSchemaForClass:(Class)a3 builder:(id)a4
{
  v6 = [BSProtobufSchema alloc];
  if (v6)
  {
    v13.receiver = v6;
    v13.super_class = (Class)BSProtobufSchema;
    uint64_t v7 = objc_msgSendSuper2(&v13, sel_init);
    uint64_t v8 = v7;
    if (v7)
    {
      v7[1] = a3;
      v7[3] = 0;
      v7[6] = objc_alloc_init(MEMORY[0x1E4F1CA58]);
      Class Superclass = class_getSuperclass(a3);
      if (Superclass)
      {
        v10 = Superclass;
        while (!BSProtobufClassImplmementsProtobufSchema(v10))
        {
          v10 = class_getSuperclass(v10);
          if (!v10) {
            goto LABEL_9;
          }
        }
        v8[2] = (id)[(objc_class *)v10 protobufSchema];
      }
LABEL_9:
      *((unsigned char *)v8 + 72) = class_getInstanceMethod(a3, sel_didFinishProtobufDecodingWithError_) != 0;
      *((unsigned char *)v8 + 73) = class_getInstanceMethod(a3, sel_initForProtobufDecoding) != 0;
      *((unsigned char *)v8 + 74) = class_getInstanceMethod(a3, sel_initProtobufTranslatorForObject_) != 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v11 = v8;
  (*((void (**)(id, void *))a4 + 2))(a4, v11);
  return v11;
}

@end