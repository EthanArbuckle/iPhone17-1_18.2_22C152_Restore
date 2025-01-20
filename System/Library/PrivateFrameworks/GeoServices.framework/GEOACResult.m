@interface GEOACResult
+ (BOOL)isValid:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOACResult)initWithDictionary:(id)a3;
- (GEOACResult)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
@end

@implementation GEOACResult

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOACResult;
  v4 = [(GEOACResult *)&v8 description];
  v5 = [(GEOACResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    a1 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (GEOACResult)initWithDictionary:(id)a3
{
  return (GEOACResult *)-[GEOACResult _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1) {
    a1 = (void *)[a1 init];
  }

  return a1;
}

- (GEOACResult)initWithJSON:(id)a3
{
  return (GEOACResult *)-[GEOACResult _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOACResultIsValid((unsigned __int8 *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOACResultReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 init];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    [(GEOACResult *)self readAll:1];
    [v4 readAll:1];
  }

  return v5;
}

- (unint64_t)hash
{
  return 0;
}

- (void)mergeFrom:(id)a3
{
}

@end