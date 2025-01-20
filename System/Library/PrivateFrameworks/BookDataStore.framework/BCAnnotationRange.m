@interface BCAnnotationRange
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)length;
- (unint64_t)location;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLength:(unint64_t)a3;
- (void)setLocation:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCAnnotationRange

- (id)description
{
  v3 = NSString;
  v21.receiver = self;
  v21.super_class = (Class)BCAnnotationRange;
  v4 = [(BCAnnotationRange *)&v21 description];
  v12 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7, v8, v9, v10, v11);
  v19 = objc_msgSend_stringWithFormat_(v3, v13, @"%@ %@", v14, v15, v16, v17, v18, v4, v12);

  return v19;
}

- (id)dictionaryRepresentation
{
  uint64_t v9 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2, v3, v4, v5, v6, v7);
  uint64_t v16 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v10, self->_location, v11, v12, v13, v14, v15);
  objc_msgSend_setObject_forKey_(v9, v17, (uint64_t)v16, @"location", v18, v19, v20, v21);

  v28 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v22, self->_length, v23, v24, v25, v26, v27);
  objc_msgSend_setObject_forKey_(v9, v29, (uint64_t)v28, @"length", v30, v31, v32, v33);

  return v9;
}

- (BOOL)readFrom:(id)a3
{
  return BCAnnotationRangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 2) = self->_location;
  *((void *)a3 + 1) = self->_length;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v12 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8, v9, v10, v11);
  id result = (id)objc_msgSend_init(v12, v13, v14, v15, v16, v17, v18, v19);
  *((void *)result + 2) = self->_location;
  *((void *)result + 1) = self->_length;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v12 = objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8, v9, v10, v11)
     && self->_location == v4[2]
     && self->_length == v4[1];

  return v12;
}

- (unint64_t)hash
{
  return (2654435761u * self->_length) ^ (2654435761u * self->_location);
}

- (void)mergeFrom:(id)a3
{
  self->_location = *((void *)a3 + 2);
  self->_length = *((void *)a3 + 1);
}

- (unint64_t)location
{
  return self->_location;
}

- (void)setLocation:(unint64_t)a3
{
  self->_location = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

@end