@interface DCLegacySESlotInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isMissing;
- (DCLegacySESlotInfo)initWithCoder:(id)a3;
- (DCLegacySESlotInfo)initWithSESlot:(int64_t)a3 isMissing:(BOOL)a4;
- (DCLegacySESlotInfo)initWithSESlot:(int64_t)a3 isMissing:(BOOL)a4 partition:(id)a5 credentialIdentifier:(id)a6 presentmentKeyIdentifier:(id)a7;
- (NSString)credentialIdentifier;
- (NSString)partition;
- (NSString)presentmentKeyIdentifier;
- (id)description;
- (int64_t)seSlot;
- (void)encodeWithCoder:(id)a3;
- (void)setCredentialIdentifier:(id)a3;
- (void)setIsMissing:(BOOL)a3;
- (void)setPartition:(id)a3;
- (void)setPresentmentKeyIdentifier:(id)a3;
- (void)setSeSlot:(int64_t)a3;
@end

@implementation DCLegacySESlotInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DCLegacySESlotInfo)initWithSESlot:(int64_t)a3 isMissing:(BOOL)a4 partition:(id)a5 credentialIdentifier:(id)a6 presentmentKeyIdentifier:(id)a7
{
  v12 = (NSString *)a5;
  v13 = (NSString *)a6;
  v14 = (NSString *)a7;
  v22.receiver = self;
  v22.super_class = (Class)DCLegacySESlotInfo;
  v15 = [(DCLegacySESlotInfo *)&v22 init];
  v15->_isMissing = a4;
  partition = v15->_partition;
  v15->_seSlot = a3;
  v15->_partition = v12;
  v17 = v12;

  credentialIdentifier = v15->_credentialIdentifier;
  v15->_credentialIdentifier = v13;
  v19 = v13;

  presentmentKeyIdentifier = v15->_presentmentKeyIdentifier;
  v15->_presentmentKeyIdentifier = v14;

  return v15;
}

- (DCLegacySESlotInfo)initWithSESlot:(int64_t)a3 isMissing:(BOOL)a4
{
  return [(DCLegacySESlotInfo *)self initWithSESlot:a3 isMissing:a4 partition:0 credentialIdentifier:0 presentmentKeyIdentifier:0];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DCLegacySESlotInfo seSlot](self, "seSlot"), 0x26C59B340);
  objc_msgSend(v4, "encodeBool:forKey:", -[DCLegacySESlotInfo isMissing](self, "isMissing"), 0x26C59B3A0);
  v5 = [(DCLegacySESlotInfo *)self partition];
  [v4 encodeObject:v5 forKey:0x26C59B020];

  v6 = [(DCLegacySESlotInfo *)self credentialIdentifier];
  [v4 encodeObject:v6 forKey:0x26C59B000];

  id v7 = [(DCLegacySESlotInfo *)self presentmentKeyIdentifier];
  [v4 encodeObject:v7 forKey:0x26C59B360];
}

- (DCLegacySESlotInfo)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DCLegacySESlotInfo;
  id v3 = a3;
  id v4 = [(DCLegacySESlotInfo *)&v9 init];
  -[DCLegacySESlotInfo setSeSlot:](v4, "setSeSlot:", objc_msgSend(v3, "decodeIntegerForKey:", 0x26C59B340, v9.receiver, v9.super_class));
  -[DCLegacySESlotInfo setIsMissing:](v4, "setIsMissing:", [v3 decodeBoolForKey:0x26C59B3A0]);
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B020];
  [(DCLegacySESlotInfo *)v4 setPartition:v5];

  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B000];
  [(DCLegacySESlotInfo *)v4 setCredentialIdentifier:v6];

  id v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B360];

  [(DCLegacySESlotInfo *)v4 setPresentmentKeyIdentifier:v7];
  return v4;
}

- (id)description
{
  id v3 = NSString;
  int64_t v4 = [(DCLegacySESlotInfo *)self seSlot];
  BOOL v5 = [(DCLegacySESlotInfo *)self isMissing];
  v6 = [(DCLegacySESlotInfo *)self partition];
  id v7 = [(DCLegacySESlotInfo *)self credentialIdentifier];
  v8 = [(DCLegacySESlotInfo *)self presentmentKeyIdentifier];
  objc_super v9 = [v3 stringWithFormat:@"DCLegacySESlotInfo slot = %d isMissing = %d partition = %@ credentialIdentifier = %@ presentmentKeyIdentifier = %@", v4, v5, v6, v7, v8];

  return v9;
}

- (int64_t)seSlot
{
  return self->_seSlot;
}

- (void)setSeSlot:(int64_t)a3
{
  self->_seSlot = a3;
}

- (BOOL)isMissing
{
  return self->_isMissing;
}

- (void)setIsMissing:(BOOL)a3
{
  self->_isMissing = a3;
}

- (NSString)partition
{
  return self->_partition;
}

- (void)setPartition:(id)a3
{
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
}

- (NSString)presentmentKeyIdentifier
{
  return self->_presentmentKeyIdentifier;
}

- (void)setPresentmentKeyIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentmentKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);

  objc_storeStrong((id *)&self->_partition, 0);
}

@end