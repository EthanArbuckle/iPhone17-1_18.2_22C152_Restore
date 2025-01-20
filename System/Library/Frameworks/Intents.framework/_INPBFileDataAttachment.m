@interface _INPBFileDataAttachment
+ (BOOL)supportsSecureCoding;
- (BOOL)hasData;
- (BOOL)hasFileName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)data;
- (NSString)fileName;
- (_INPBFileDataAttachment)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setFileName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBFileDataAttachment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (NSString)fileName
{
  return self->_fileName;
}

- (NSData)data
{
  return self->_data;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_data)
  {
    v4 = [(_INPBFileDataAttachment *)self data];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"data"];
  }
  if (self->_fileName)
  {
    v6 = [(_INPBFileDataAttachment *)self fileName];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"fileName"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_data hash];
  return [(NSString *)self->_fileName hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBFileDataAttachment *)self data];
  v6 = [v4 data];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBFileDataAttachment *)self data];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBFileDataAttachment *)self data];
    v10 = [v4 data];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBFileDataAttachment *)self fileName];
  v6 = [v4 fileName];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBFileDataAttachment *)self fileName];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_INPBFileDataAttachment *)self fileName];
    v15 = [v4 fileName];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBFileDataAttachment allocWithZone:](_INPBFileDataAttachment, "allocWithZone:") init];
  v6 = (void *)[(NSData *)self->_data copyWithZone:a3];
  [(_INPBFileDataAttachment *)v5 setData:v6];

  uint64_t v7 = (void *)[(NSString *)self->_fileName copyWithZone:a3];
  [(_INPBFileDataAttachment *)v5 setFileName:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBFileDataAttachment *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBFileDataAttachment)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBFileDataAttachment *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBFileDataAttachment *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBFileDataAttachment *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_INPBFileDataAttachment *)self data];

  if (v4) {
    PBDataWriterWriteDataField();
  }
  v5 = [(_INPBFileDataAttachment *)self fileName];

  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBFileDataAttachmentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasFileName
{
  return self->_fileName != 0;
}

- (void)setFileName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  fileName = self->_fileName;
  self->_fileName = v4;

  MEMORY[0x1F41817F8](v4, fileName);
}

- (BOOL)hasData
{
  return self->_data != 0;
}

- (void)setData:(id)a3
{
  id v4 = (NSData *)[a3 copy];
  data = self->_data;
  self->_data = v4;

  MEMORY[0x1F41817F8](v4, data);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end