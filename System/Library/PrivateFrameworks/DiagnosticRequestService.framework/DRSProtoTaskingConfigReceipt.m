@interface DRSProtoTaskingConfigReceipt
- (BOOL)hasReceiptResult;
- (BOOL)hasTaskingConfigMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DRSProtoTaskingConfigMetadata)taskingConfigMetadata;
- (NSString)description;
- (NSString)receiptResult;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setReceiptResult:(id)a3;
- (void)setTaskingConfigMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DRSProtoTaskingConfigReceipt

- (BOOL)hasTaskingConfigMetadata
{
  return self->_taskingConfigMetadata != 0;
}

- (BOOL)hasReceiptResult
{
  return self->_receiptResult != 0;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DRSProtoTaskingConfigReceipt;
  v4 = [(DRSProtoTaskingConfigReceipt *)&v8 description];
  v5 = [(DRSProtoTaskingConfigReceipt *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  taskingConfigMetadata = self->_taskingConfigMetadata;
  if (taskingConfigMetadata)
  {
    v5 = [(DRSProtoTaskingConfigMetadata *)taskingConfigMetadata dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"tasking_config_metadata"];
  }
  receiptResult = self->_receiptResult;
  if (receiptResult) {
    [v3 setObject:receiptResult forKey:@"receipt_result"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoTaskingConfigReceiptReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_taskingConfigMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_receiptResult)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_taskingConfigMetadata)
  {
    objc_msgSend(v4, "setTaskingConfigMetadata:");
    id v4 = v5;
  }
  if (self->_receiptResult)
  {
    objc_msgSend(v5, "setReceiptResult:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(DRSProtoTaskingConfigMetadata *)self->_taskingConfigMetadata copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_receiptResult copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((taskingConfigMetadata = self->_taskingConfigMetadata, !((unint64_t)taskingConfigMetadata | v4[2]))
     || -[DRSProtoTaskingConfigMetadata isEqual:](taskingConfigMetadata, "isEqual:")))
  {
    receiptResult = self->_receiptResult;
    if ((unint64_t)receiptResult | v4[1]) {
      char v7 = -[NSString isEqual:](receiptResult, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DRSProtoTaskingConfigMetadata *)self->_taskingConfigMetadata hash];
  return [(NSString *)self->_receiptResult hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  taskingConfigMetadata = self->_taskingConfigMetadata;
  uint64_t v6 = v4[2];
  char v7 = v4;
  if (taskingConfigMetadata)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[DRSProtoTaskingConfigMetadata mergeFrom:](taskingConfigMetadata, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[DRSProtoTaskingConfigReceipt setTaskingConfigMetadata:](self, "setTaskingConfigMetadata:");
  }
  id v4 = v7;
LABEL_7:
  if (v4[1])
  {
    -[DRSProtoTaskingConfigReceipt setReceiptResult:](self, "setReceiptResult:");
    id v4 = v7;
  }
}

- (DRSProtoTaskingConfigMetadata)taskingConfigMetadata
{
  return self->_taskingConfigMetadata;
}

- (void)setTaskingConfigMetadata:(id)a3
{
}

- (NSString)receiptResult
{
  return self->_receiptResult;
}

- (void)setReceiptResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskingConfigMetadata, 0);

  objc_storeStrong((id *)&self->_receiptResult, 0);
}

@end