@interface AVAnnotationRepresentation
+ (id)_annotationRepresentationWithPropertyList:(id)a3 binaryData:(id)a4;
+ (id)_createBindingDictionaryFromMetadataItemPayload:(id)a3 error:(id *)a4;
+ (id)_createMetadataItemPayloadForData:(id)a3 identifier:(id)a4 error:(id *)a5;
+ (id)_createMetadataItemPayloadForDataBinding:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSUUID)identifier;
- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4;
- (id)_initWithRepresentationType:(id)a3;
- (id)_propertyListAndBinaryData:(id *)a3;
- (id)_representationType;
- (id)_version;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_setRepresentationType:(id)a3;
- (void)_setVersion:(id)a3;
- (void)dealloc;
- (void)setIdentifier:(id)a3;
@end

@implementation AVAnnotationRepresentation

+ (id)_annotationRepresentationWithPropertyList:(id)a3 binaryData:(id)a4
{
  v6 = (void *)[a3 objectForKey:@"AVAnnotationArchiveKeyVersion"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (![v6 isEqualToString:@"AVAnnotationRepresentationVersion_1"]) {
    goto LABEL_17;
  }
  v7 = (void *)[a3 objectForKey:@"AVAnnotationRepresentationArchiveKeyType"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if ([v7 isEqualToString:@"AVAnnotationRepresentationTypeText"])
  {
    v8 = off_1E57AD430;
    goto LABEL_16;
  }
  if ([v7 isEqualToString:@"AVAnnotationRepresentationTypeImage"])
  {
    v8 = off_1E57AD400;
    goto LABEL_16;
  }
  if ([v7 isEqualToString:@"AVAnnotationRepresentationTypePKDrawing"])
  {
    v8 = off_1E57AD408;
    goto LABEL_16;
  }
  if ([v7 isEqualToString:@"AVAnnotationRepresentationTypeSVG"])
  {
    v8 = off_1E57AD420;
    goto LABEL_16;
  }
  if ([v7 isEqualToString:@"AVAnnotationRepresentationTypeShape"])
  {
    v8 = off_1E57AD428;
    goto LABEL_16;
  }
  if ([v7 isEqualToString:@"AVAnnotationRepresentationTypePath"])
  {
    v8 = off_1E57AD410;
LABEL_16:
    id result = (id)[objc_alloc(*v8) _initWithPropertyList:a3 binaryData:a4];
    if (result) {
      return result;
    }
  }
LABEL_17:
  v10 = [AVAnnotationUnknownRepresentation alloc];
  return [(AVAnnotationUnknownRepresentation *)v10 _initWithPropertyList:a3 binaryData:a4];
}

- (id)_initWithRepresentationType:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVAnnotationRepresentation;
  v4 = [(AVAnnotationRepresentation *)&v6 init];
  if (v4)
  {
    v4->_representationType = (NSString *)[a3 copy];
    v4->_version = (NSString *)[@"AVAnnotationRepresentationVersion_1" copy];
    v4->_identifier = (NSUUID *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "copy");
  }
  return v4;
}

- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)AVAnnotationRepresentation;
  v5 = [(AVAnnotationRepresentation *)&v10 init];
  if (!v5) {
    goto LABEL_6;
  }
  objc_super v6 = (void *)[a3 objectForKey:@"AVAnnotationRepresentationArchiveKeyType"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  v5->_representationType = (NSString *)[v6 copy];
  v7 = (void *)[a3 objectForKey:@"AVAnnotationArchiveKeyVersion"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5->_version = (NSString *)[v7 copy],
        uint64_t v8 = [a3 objectForKey:@"AVAnnotationArchiveKeyIdentifier"],
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5->_identifier = (NSUUID *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
  }
  else
  {
LABEL_6:

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAnnotationRepresentation;
  [(AVAnnotationRepresentation *)&v3 dealloc];
}

- (id)_representationType
{
  return self->_representationType;
}

- (void)_setRepresentationType:(id)a3
{
  v4 = (NSString *)[a3 copy];

  self->_representationType = v4;
}

- (id)_version
{
  return self->_version;
}

- (void)_setVersion:(id)a3
{
  v4 = (NSString *)[a3 copy];

  self->_version = v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = 0;
  id v3 = [(AVAnnotationRepresentation *)self _propertyListAndBinaryData:&v5];
  return +[AVAnnotationRepresentation _annotationRepresentationWithPropertyList:v3 binaryData:v5];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v5 = objc_msgSend(-[AVAnnotationRepresentation _representationType](self, "_representationType"), "isEqualToString:", objc_msgSend(a3, "_representationType"));
    if (v5)
    {
      int v5 = objc_msgSend(-[AVAnnotationRepresentation _version](self, "_version"), "isEqualToString:", objc_msgSend(a3, "_version"));
      if (v5)
      {
        objc_super v6 = [(AVAnnotationRepresentation *)self identifier];
        uint64_t v7 = [a3 identifier];
        LOBYTE(v5) = [(NSUUID *)v6 isEqual:v7];
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend(-[AVAnnotationRepresentation _representationType](self, "_representationType"), "hash");
  uint64_t v4 = objc_msgSend(-[AVAnnotationRepresentation _version](self, "_version"), "hash") ^ v3;
  return v4 ^ [(NSUUID *)[(AVAnnotationRepresentation *)self identifier] hash];
}

- (id)_propertyListAndBinaryData:(id *)a3
{
  int v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v5, "setObject:forKey:", -[AVAnnotationRepresentation _representationType](self, "_representationType"), @"AVAnnotationRepresentationArchiveKeyType");
  objc_msgSend(v5, "setObject:forKey:", -[AVAnnotationRepresentation _version](self, "_version"), @"AVAnnotationArchiveKeyVersion");
  objc_msgSend(v5, "setObject:forKey:", -[NSUUID UUIDString](-[AVAnnotationRepresentation identifier](self, "identifier"), "UUIDString"), @"AVAnnotationArchiveKeyIdentifier");
  *a3 = (id)[MEMORY[0x1E4F1C9B8] data];
  return v5;
}

+ (id)_createMetadataItemPayloadForData:(id)a3 identifier:(id)a4 error:(id *)a5
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"identifier";
  v6[1] = @"data";
  v7[0] = a4;
  v7[1] = a3;
  return +[AVAnnotationRepresentation _createMetadataItemPayloadForDataBinding:error:](AVAnnotationRepresentation, "_createMetadataItemPayloadForDataBinding:error:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2], a5);
}

+ (id)_createMetadataItemPayloadForDataBinding:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (!a3)
  {
    v14 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", -11883, 0);
LABEL_9:
    v13 = 0;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  objc_super v6 = (void *)[a3 objectForKey:@"data"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (uint64_t v7 = (void *)[v5 objectForKey:@"identifier"],
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) == 0))
  {
    v14 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", -11883, 0);
    id v5 = 0;
    goto LABEL_9;
  }
  char v19 = 0;
  uint64_t v8 = (void *)[v7 UUIDString];
  size_t v9 = 2 * [v8 length];
  id v5 = malloc_type_calloc(v9, 1uLL, 0x100004077774924uLL);
  [v8 getCString:v5 maxLength:v9 encoding:1];
  size_t v10 = strnlen((const char *)v5, v9);
  uint64_t v11 = [v6 length];
  uint64_t v12 = [v6 bytes];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v10 + 14 + v11];
  [v13 mutableBytes];
  unsigned int v16 = bswap32(v10 + 14 + v11);
  uint64_t v17 = 1919968626;
  __int16 v18 = bswap32(v10) >> 16;
  objc_msgSend(v13, "replaceBytesInRange:withBytes:length:", 0, 14, &v16, 14);
  objc_msgSend(v13, "replaceBytesInRange:withBytes:length:", 14, v10, v5, v10);
  objc_msgSend(v13, "replaceBytesInRange:withBytes:length:", v10 + 14, v11, v12, v11);
  v14 = 0;
  if (a4) {
LABEL_5:
  }
    *a4 = v14;
LABEL_6:
  free(v5);
  return v13;
}

+ (id)_createBindingDictionaryFromMetadataItemPayload:(id)a3 error:(id *)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_10;
  }
  unint64_t v6 = [a3 length];
  if (v6 <= 0xD) {
    goto LABEL_10;
  }
  unint64_t v7 = v6;
  uint64_t v8 = [a3 bytes];
  if (v7 != bswap32(*(_DWORD *)v8)
    || (uint64_t v9 = v8,
        uint64_t v10 = bswap32(*(unsigned __int16 *)(v8 + 12)) >> 16,
        uint64_t v11 = v10 + 14,
        BOOL v12 = v7 >= v10 + 14,
        unint64_t v13 = v7 - (v10 + 14),
        !v12)
    || (id v14 = (id)[[NSString alloc] initWithBytes:v8 + 14 length:v10 encoding:1], (v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDString:", v14)) == 0))
  {
LABEL_10:
    char v19 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", -11821, 0);
    id v18 = 0;
    if (!a4) {
      return v18;
    }
    goto LABEL_8;
  }
  id v16 = v15;
  id v17 = (id)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v13];
  objc_msgSend(v17, "replaceBytesInRange:withBytes:length:", 0, v13, v9 + v11, v13);
  v21[0] = @"identifier";
  v21[1] = @"data";
  v22[0] = v16;
  v22[1] = v17;
  id v18 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  char v19 = 0;
  if (a4) {
LABEL_8:
  }
    *a4 = v19;
  return v18;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

@end