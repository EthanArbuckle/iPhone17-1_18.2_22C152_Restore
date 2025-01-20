@interface HDCloudSyncCodableState
- (BOOL)hasStateData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)stateData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setStateData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCloudSyncCodableState

- (BOOL)hasStateData
{
  return self->_stateData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncCodableState;
  v4 = [(HDCloudSyncCodableState *)&v8 description];
  v5 = [(HDCloudSyncCodableState *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  stateData = self->_stateData;
  if (stateData) {
    [v3 setObject:stateData forKey:@"stateData"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_stateData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  stateData = self->_stateData;
  if (stateData) {
    [a3 setStateData:stateData];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_stateData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    stateData = self->_stateData;
    if ((unint64_t)stateData | v4[1]) {
      char v6 = -[NSData isEqual:](stateData, "isEqual:");
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

- (unint64_t)hash
{
  return [(NSData *)self->_stateData hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[HDCloudSyncCodableState setStateData:](self, "setStateData:");
  }
}

- (NSData)stateData
{
  return self->_stateData;
}

- (void)setStateData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end