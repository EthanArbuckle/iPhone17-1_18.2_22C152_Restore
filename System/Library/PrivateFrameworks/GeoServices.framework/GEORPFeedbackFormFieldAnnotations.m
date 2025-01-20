@interface GEORPFeedbackFormFieldAnnotations
+ (BOOL)isValid:(id)a3;
- (BOOL)hasKeyString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackFormFieldAnnotations)initWithDictionary:(id)a3;
- (GEORPFeedbackFormFieldAnnotations)initWithJSON:(id)a3;
- (NSString)keyString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKeyString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackFormFieldAnnotations

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
  v8.super_class = (Class)GEORPFeedbackFormFieldAnnotations;
  v4 = [(GEORPFeedbackFormFieldAnnotations *)&v8 description];
  v5 = [(GEORPFeedbackFormFieldAnnotations *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackFieldOptionAnnotations _dictionaryRepresentation:](self, 0);
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackFieldOptionAnnotations _dictionaryRepresentation:](self, 1);
}

- (GEORPFeedbackFormFieldAnnotations)initWithDictionary:(id)a3
{
  return (GEORPFeedbackFormFieldAnnotations *)-[GEORPFeedbackFieldOptionAnnotations _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEORPFeedbackFormFieldAnnotations)initWithJSON:(id)a3
{
  return (GEORPFeedbackFormFieldAnnotations *)-[GEORPFeedbackFieldOptionAnnotations _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackFormFieldAnnotationsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackFormFieldAnnotationsReadAllFrom((uint64_t)self, a3);
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
  [(GEORPFeedbackFormFieldAnnotations *)self readAll:0];
  if (self->_keyString) {
    objc_msgSend(v4, "setKeyString:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
    [(GEORPFeedbackFormFieldAnnotations *)self readAll:1];
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
  [(GEORPFeedbackFormFieldAnnotations *)self readAll:1];
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
    [(GEORPFeedbackFormFieldAnnotations *)self setKeyString:v5];
  }
}

- (void).cxx_destruct
{
}

@end