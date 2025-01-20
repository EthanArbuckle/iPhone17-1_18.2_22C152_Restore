@interface NWPBBrowseDescriptor
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NWPBBrowseDescriptor

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  return [(NWPBServiceBrowse *)self->_service hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    service = self->_service;
    if ((unint64_t)service | v4[1]) {
      char v6 = -[NWPBServiceBrowse isEqual:](service, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NWPBServiceBrowse *)self->_service copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)writeTo:(id)a3
{
  if (self->_service) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NWPBBrowseDescriptorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  service = self->_service;
  if (service)
  {
    v5 = [(NWPBServiceBrowse *)service dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"service"];
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NWPBBrowseDescriptor;
  v4 = [(NWPBBrowseDescriptor *)&v8 description];
  v5 = [(NWPBBrowseDescriptor *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end