@interface NWPBEndpoint
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NWPBEndpoint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txtRecord, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_host, 0);

  objc_storeStrong((id *)&self->_address, 0);
}

- (unint64_t)hash
{
  unint64_t v3 = [(NWPBAddressEndpoint *)self->_address hash];
  unint64_t v4 = [(NWPBHostEndpoint *)self->_host hash] ^ v3;
  unint64_t v5 = [(NWPBServiceEndpoint *)self->_service hash];
  unint64_t v6 = v4 ^ v5 ^ [(NWPBInterface *)self->_interface hash];
  return v6 ^ [(NSData *)self->_txtRecord hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((address = self->_address, !((unint64_t)address | v4[1]))
     || -[NWPBAddressEndpoint isEqual:](address, "isEqual:"))
    && ((host = self->_host, !((unint64_t)host | v4[2])) || -[NWPBHostEndpoint isEqual:](host, "isEqual:"))
    && ((service = self->_service, !((unint64_t)service | v4[4]))
     || -[NWPBServiceEndpoint isEqual:](service, "isEqual:"))
    && ((interface = self->_interface, !((unint64_t)interface | v4[3]))
     || -[NWPBInterface isEqual:](interface, "isEqual:")))
  {
    txtRecord = self->_txtRecord;
    if ((unint64_t)txtRecord | v4[5]) {
      char v10 = -[NSData isEqual:](txtRecord, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NWPBAddressEndpoint *)self->_address copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NWPBHostEndpoint *)self->_host copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(NWPBServiceEndpoint *)self->_service copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = [(NWPBInterface *)self->_interface copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  uint64_t v14 = [(NSData *)self->_txtRecord copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_address)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_host)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_service)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_interface)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_txtRecord)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return NWPBEndpointReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  address = self->_address;
  if (address)
  {
    id v5 = [(NWPBAddressEndpoint *)address dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"address"];
  }
  host = self->_host;
  if (host)
  {
    v7 = [(NWPBHostEndpoint *)host dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"host"];
  }
  service = self->_service;
  if (service)
  {
    v9 = [(NWPBServiceEndpoint *)service dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"service"];
  }
  interface = self->_interface;
  if (interface)
  {
    v11 = [(NWPBInterface *)interface dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"interface"];
  }
  txtRecord = self->_txtRecord;
  if (txtRecord) {
    [v3 setObject:txtRecord forKey:@"txtRecord"];
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NWPBEndpoint;
  id v4 = [(NWPBEndpoint *)&v8 description];
  id v5 = [(NWPBEndpoint *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end