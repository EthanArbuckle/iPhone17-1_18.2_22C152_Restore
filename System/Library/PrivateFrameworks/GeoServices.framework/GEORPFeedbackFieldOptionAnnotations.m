@interface GEORPFeedbackFieldOptionAnnotations
+ (BOOL)isValid:(id)a3;
- (BOOL)hasKeyString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackFieldOptionAnnotations)initWithDictionary:(id)a3;
- (GEORPFeedbackFieldOptionAnnotations)initWithJSON:(id)a3;
- (NSString)keyString;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKeyString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackFieldOptionAnnotations

- (BOOL)hasKeyString
{
  return self->_keyString != 0;
}

- (NSString)keyString
{
  return self->_keyString;
}

- (void)setKeyString:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackFieldOptionAnnotations;
  v4 = [(GEORPFeedbackFieldOptionAnnotations *)&v8 description];
  v5 = [(GEORPFeedbackFieldOptionAnnotations *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackFieldOptionAnnotations _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 keyString];
    if (v5)
    {
      if (a2) {
        v6 = @"keyString";
      }
      else {
        v6 = @"key_string";
      }
      [v4 setObject:v5 forKey:v6];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackFieldOptionAnnotations _dictionaryRepresentation:](self, 1);
}

- (GEORPFeedbackFieldOptionAnnotations)initWithDictionary:(id)a3
{
  return (GEORPFeedbackFieldOptionAnnotations *)-[GEORPFeedbackFieldOptionAnnotations _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"keyString";
      }
      else {
        v6 = @"key_string";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setKeyString:v8];
      }
    }
  }

  return a1;
}

- (GEORPFeedbackFieldOptionAnnotations)initWithJSON:(id)a3
{
  return (GEORPFeedbackFieldOptionAnnotations *)-[GEORPFeedbackFieldOptionAnnotations _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackFieldOptionAnnotationsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackFieldOptionAnnotationsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_keyString) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEORPFeedbackFieldOptionAnnotations *)self readAll:0];
  if (self->_keyString) {
    objc_msgSend(v4, "setKeyString:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_keyString copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = 1;
    [(GEORPFeedbackFieldOptionAnnotations *)self readAll:1];
    [v4 readAll:1];
    keyString = self->_keyString;
    if ((unint64_t)keyString | v4[1]) {
      char v5 = -[NSString isEqual:](keyString, "isEqual:");
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  [(GEORPFeedbackFieldOptionAnnotations *)self readAll:1];
  keyString = self->_keyString;

  return [(NSString *)keyString hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  uint64_t v5 = v4[1];

  if (v5)
  {
    [(GEORPFeedbackFieldOptionAnnotations *)self setKeyString:v5];
  }
}

- (void).cxx_destruct
{
}

@end