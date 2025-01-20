@interface _INPBFile
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBookmarkData;
- (BOOL)hasData;
- (BOOL)hasFileURL;
- (BOOL)hasFilename;
- (BOOL)hasRemovedOnCompletion;
- (BOOL)hasTypeIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)removedOnCompletion;
- (NSData)bookmarkData;
- (NSData)data;
- (NSString)filename;
- (NSString)typeIdentifier;
- (_INPBFile)initWithCoder:(id)a3;
- (_INPBURLValue)fileURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBookmarkData:(id)a3;
- (void)setData:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setFilename:(id)a3;
- (void)setHasRemovedOnCompletion:(BOOL)a3;
- (void)setRemovedOnCompletion:(BOOL)a3;
- (void)setTypeIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBFile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_bookmarkData, 0);
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (BOOL)removedOnCompletion
{
  return self->_removedOnCompletion;
}

- (NSString)filename
{
  return self->_filename;
}

- (_INPBURLValue)fileURL
{
  return self->_fileURL;
}

- (NSData)data
{
  return self->_data;
}

- (NSData)bookmarkData
{
  return self->_bookmarkData;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_bookmarkData)
  {
    v4 = [(_INPBFile *)self bookmarkData];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"bookmarkData"];
  }
  if (self->_data)
  {
    v6 = [(_INPBFile *)self data];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"data"];
  }
  v8 = [(_INPBFile *)self fileURL];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"fileURL"];

  if (self->_filename)
  {
    v10 = [(_INPBFile *)self filename];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"filename"];
  }
  if ([(_INPBFile *)self hasRemovedOnCompletion])
  {
    v12 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBFile removedOnCompletion](self, "removedOnCompletion"));
    [v3 setObject:v12 forKeyedSubscript:@"removedOnCompletion"];
  }
  if (self->_typeIdentifier)
  {
    v13 = [(_INPBFile *)self typeIdentifier];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"typeIdentifier"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_bookmarkData hash];
  uint64_t v4 = [(NSData *)self->_data hash];
  unint64_t v5 = [(_INPBURLValue *)self->_fileURL hash];
  NSUInteger v6 = [(NSString *)self->_filename hash];
  if ([(_INPBFile *)self hasRemovedOnCompletion]) {
    uint64_t v7 = 2654435761 * self->_removedOnCompletion;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_typeIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  unint64_t v5 = [(_INPBFile *)self bookmarkData];
  NSUInteger v6 = [v4 bookmarkData];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v7 = [(_INPBFile *)self bookmarkData];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBFile *)self bookmarkData];
    v10 = [v4 bookmarkData];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBFile *)self data];
  NSUInteger v6 = [v4 data];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v12 = [(_INPBFile *)self data];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBFile *)self data];
    v15 = [v4 data];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBFile *)self fileURL];
  NSUInteger v6 = [v4 fileURL];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v17 = [(_INPBFile *)self fileURL];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBFile *)self fileURL];
    v20 = [v4 fileURL];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBFile *)self filename];
  NSUInteger v6 = [v4 filename];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v22 = [(_INPBFile *)self filename];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBFile *)self filename];
    v25 = [v4 filename];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  int v27 = [(_INPBFile *)self hasRemovedOnCompletion];
  if (v27 != [v4 hasRemovedOnCompletion]) {
    goto LABEL_31;
  }
  if ([(_INPBFile *)self hasRemovedOnCompletion])
  {
    if ([v4 hasRemovedOnCompletion])
    {
      int removedOnCompletion = self->_removedOnCompletion;
      if (removedOnCompletion != [v4 removedOnCompletion]) {
        goto LABEL_31;
      }
    }
  }
  unint64_t v5 = [(_INPBFile *)self typeIdentifier];
  NSUInteger v6 = [v4 typeIdentifier];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v29 = [(_INPBFile *)self typeIdentifier];
    if (!v29)
    {

LABEL_34:
      BOOL v34 = 1;
      goto LABEL_32;
    }
    v30 = (void *)v29;
    v31 = [(_INPBFile *)self typeIdentifier];
    v32 = [v4 typeIdentifier];
    char v33 = [v31 isEqual:v32];

    if (v33) {
      goto LABEL_34;
    }
  }
  else
  {
LABEL_30:
  }
LABEL_31:
  BOOL v34 = 0;
LABEL_32:

  return v34;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBFile allocWithZone:](_INPBFile, "allocWithZone:") init];
  NSUInteger v6 = (void *)[(NSData *)self->_bookmarkData copyWithZone:a3];
  [(_INPBFile *)v5 setBookmarkData:v6];

  uint64_t v7 = (void *)[(NSData *)self->_data copyWithZone:a3];
  [(_INPBFile *)v5 setData:v7];

  id v8 = [(_INPBURLValue *)self->_fileURL copyWithZone:a3];
  [(_INPBFile *)v5 setFileURL:v8];

  v9 = (void *)[(NSString *)self->_filename copyWithZone:a3];
  [(_INPBFile *)v5 setFilename:v9];

  if ([(_INPBFile *)self hasRemovedOnCompletion]) {
    [(_INPBFile *)v5 setRemovedOnCompletion:[(_INPBFile *)self removedOnCompletion]];
  }
  v10 = (void *)[(NSString *)self->_typeIdentifier copyWithZone:a3];
  [(_INPBFile *)v5 setTypeIdentifier:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBFile *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBFile)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBFile *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBFile *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBFile *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  id v4 = [(_INPBFile *)self bookmarkData];

  if (v4) {
    PBDataWriterWriteDataField();
  }
  unint64_t v5 = [(_INPBFile *)self data];

  if (v5) {
    PBDataWriterWriteDataField();
  }
  id v6 = [(_INPBFile *)self fileURL];

  if (v6)
  {
    uint64_t v7 = [(_INPBFile *)self fileURL];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBFile *)self filename];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBFile *)self hasRemovedOnCompletion]) {
    PBDataWriterWriteBOOLField();
  }
  v9 = [(_INPBFile *)self typeIdentifier];

  v10 = v11;
  if (v9)
  {
    PBDataWriterWriteStringField();
    v10 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBFileReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTypeIdentifier
{
  return self->_typeIdentifier != 0;
}

- (void)setTypeIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  typeIdentifier = self->_typeIdentifier;
  self->_typeIdentifier = v4;

  MEMORY[0x1F41817F8](v4, typeIdentifier);
}

- (void)setHasRemovedOnCompletion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRemovedOnCompletion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRemovedOnCompletion:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int removedOnCompletion = a3;
}

- (BOOL)hasFilename
{
  return self->_filename != 0;
}

- (void)setFilename:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  filename = self->_filename;
  self->_filename = v4;

  MEMORY[0x1F41817F8](v4, filename);
}

- (BOOL)hasFileURL
{
  return self->_fileURL != 0;
}

- (void)setFileURL:(id)a3
{
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

- (BOOL)hasBookmarkData
{
  return self->_bookmarkData != 0;
}

- (void)setBookmarkData:(id)a3
{
  id v4 = (NSData *)[a3 copy];
  bookmarkData = self->_bookmarkData;
  self->_bookmarkData = v4;

  MEMORY[0x1F41817F8](v4, bookmarkData);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end