@interface DNDSIDSRecord
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
- (BOOL)isDeleted;
- (BOOL)isEqual:(id)a3;
- (DNDSIDSRecord)initWithMetadata:(id)a3;
- (DNDSIDSRecordID)recordID;
- (DNDSIDSRecordMetadata)metadata;
- (NSDate)lastModified;
- (NSString)description;
- (id)_initWithMetadata:(id)a3 data:(id)a4;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)objectForKey:(id)a3;
- (unint64_t)hash;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation DNDSIDSRecord

- (DNDSIDSRecord)initWithMetadata:(id)a3
{
  return (DNDSIDSRecord *)[(DNDSIDSRecord *)self _initWithMetadata:a3 data:0];
}

- (id)_initWithMetadata:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DNDSIDSRecord;
  v8 = [(DNDSIDSRecord *)&v14 init];
  if (v8)
  {
    if (v7) {
      [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v7];
    }
    else {
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    data = v8->_data;
    v8->_data = (NSMutableDictionary *)v9;

    uint64_t v11 = [v6 copy];
    metadata = v8->_metadata;
    v8->_metadata = (DNDSIDSRecordMetadata *)v11;
  }
  return v8;
}

- (DNDSIDSRecordID)recordID
{
  return [(DNDSIDSRecordMetadata *)self->_metadata recordID];
}

- (NSDate)lastModified
{
  return [(DNDSIDSRecordMetadata *)self->_metadata lastModified];
}

- (BOOL)isDeleted
{
  return [(DNDSIDSRecordMetadata *)self->_metadata isDeleted];
}

- (DNDSIDSRecordMetadata)metadata
{
  return self->_metadata;
}

- (id)objectForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_data objectForKeyedSubscript:a3];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (unint64_t)hash
{
  unint64_t v3 = [(DNDSIDSRecordMetadata *)self->_metadata hash];
  return [(NSMutableDictionary *)self->_data hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DNDSIDSRecord *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      char v9 = 1;
      goto LABEL_17;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      metadata = self->_metadata;
      v8 = v6->_metadata;
      if (metadata == v8) {
        goto LABEL_8;
      }
      char v9 = 0;
      if (metadata && v8)
      {
        if (-[DNDSIDSRecordMetadata isEqual:](metadata, "isEqual:"))
        {
LABEL_8:
          data = self->_data;
          uint64_t v11 = v6->_data;
          if (data == v11)
          {
            char v9 = 1;
          }
          else
          {
            char v9 = 0;
            if (data && v11) {
              char v9 = -[NSMutableDictionary isEqual:](data, "isEqual:");
            }
          }
          goto LABEL_16;
        }
        char v9 = 0;
      }
LABEL_16:

      goto LABEL_17;
    }
  }
  char v9 = 0;
LABEL_17:

  return v9;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; metadata: %@; data: %@>",
                       objc_opt_class(),
                       self,
                       self->_metadata,
                       self->_data);
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(v7, "bs_safeDictionaryForKey:", @"metadata");
  id v9 = +[DNDSIDSRecordMetadata newWithDictionaryRepresentation:v8 context:v6];

  v10 = objc_msgSend(v7, "bs_safeDictionaryForKey:", @"data");

  uint64_t v11 = (void *)[objc_alloc((Class)a1) _initWithMetadata:v9 data:v10];
  return v11;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"metadata";
  v4 = [(DNDSIDSRecordMetadata *)self->_metadata dictionaryRepresentationWithContext:a3];
  v7[1] = @"data";
  v8[0] = v4;
  v8[1] = self->_data;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end