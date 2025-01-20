@interface FPSearchableItemError
+ (id)errorFromString:(id)a3;
+ (id)stringFromError:(id)a3;
- (BOOL)hasCustomDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)customDomain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)domainAsString:(int)a3;
- (int)StringAsDomain:(id)a3;
- (int)domain;
- (int64_t)code;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCode:(int64_t)a3;
- (void)setCustomDomain:(id)a3;
- (void)setDomain:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FPSearchableItemError

+ (id)stringFromError:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    v9 = 0;
    goto LABEL_10;
  }
  v4 = objc_alloc_init(FPSearchableItemError);
  v5 = [v3 domain];
  int v6 = [v5 isEqualToString:@"NSFileProviderErrorDomain"];

  if (v6)
  {
    v7 = v4;
    uint64_t v8 = 1;
  }
  else
  {
    v10 = [v3 domain];
    int v11 = [v10 isEqualToString:*MEMORY[0x1E4F281F8]];

    v7 = v4;
    if (!v11)
    {
      [(FPSearchableItemError *)v4 setDomain:0];
      v12 = [v3 domain];
      [(FPSearchableItemError *)v4 setCustomDomain:v12];

      goto LABEL_9;
    }
    uint64_t v8 = 2;
  }
  [(FPSearchableItemError *)v7 setDomain:v8];
LABEL_9:
  -[FPSearchableItemError setCode:](v4, "setCode:", [v3 code]);
  v13 = [(FPSearchableItemError *)v4 data];
  v9 = [v13 base64EncodedStringWithOptions:0];

LABEL_10:

  return v9;
}

+ (id)errorFromString:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithBase64EncodedString:v4 options:0];

  int v6 = [[FPSearchableItemError alloc] initWithData:v5];
  v7 = [(FPSearchableItemError *)v6 customDomain];
  if ([(FPSearchableItemError *)v6 domain] == 1)
  {
    uint64_t v8 = (id *)&NSFileProviderErrorDomain;
  }
  else
  {
    if ([(FPSearchableItemError *)v6 domain] != 2) {
      goto LABEL_6;
    }
    uint64_t v8 = (id *)MEMORY[0x1E4F281F8];
  }
  id v9 = *v8;

  v7 = v9;
LABEL_6:
  if (v7)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = [(FPSearchableItemError *)v6 code];
    v12 = [v10 errorWithDomain:v7 code:v11 userInfo:MEMORY[0x1E4F1CC08]];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)domainAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5AF65C8[a3];
  }

  return v3;
}

- (int)StringAsDomain:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Custom"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FileProvider"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Cocoa"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasCustomDomain
{
  return self->_customDomain != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FPSearchableItemError;
  int v4 = [(FPSearchableItemError *)&v8 description];
  v5 = [(FPSearchableItemError *)self dictionaryRepresentation];
  int v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t domain = self->_domain;
  if (domain >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_domain);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E5AF65C8[domain];
  }
  [v3 setObject:v5 forKey:@"domain"];

  int v6 = [NSNumber numberWithLongLong:self->_code];
  [v3 setObject:v6 forKey:@"code"];

  customDomain = self->_customDomain;
  if (customDomain) {
    [v3 setObject:customDomain forKey:@"customDomain"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FPSearchableItemErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteSint64Field();
  if (self->_customDomain) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 6) = self->_domain;
  *((void *)a3 + 1) = self->_code;
  customDomain = self->_customDomain;
  if (customDomain) {
    [a3 setCustomDomain:customDomain];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_domain;
  *(void *)(v5 + 8) = self->_code;
  uint64_t v6 = [(NSString *)self->_customDomain copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_domain == *((_DWORD *)v4 + 6)
    && self->_code == v4[1])
  {
    customDomain = self->_customDomain;
    if ((unint64_t)customDomain | v4[2]) {
      char v6 = -[NSString isEqual:](customDomain, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2 = (2654435761 * self->_code) ^ (2654435761 * self->_domain);
  return v2 ^ [(NSString *)self->_customDomain hash];
}

- (void)mergeFrom:(id)a3
{
  self->_uint64_t domain = *((_DWORD *)a3 + 6);
  self->_code = *((void *)a3 + 1);
  if (*((void *)a3 + 2)) {
    -[FPSearchableItemError setCustomDomain:](self, "setCustomDomain:");
  }
}

- (int)domain
{
  return self->_domain;
}

- (void)setDomain:(int)a3
{
  self->_uint64_t domain = a3;
}

- (int64_t)code
{
  return self->_code;
}

- (void)setCode:(int64_t)a3
{
  self->_code = a3;
}

- (NSString)customDomain
{
  return self->_customDomain;
}

- (void)setCustomDomain:(id)a3
{
}

- (void).cxx_destruct
{
}

@end