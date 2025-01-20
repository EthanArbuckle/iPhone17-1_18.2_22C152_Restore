@interface CLPLocationProcessingPipelineMetadata
- (BOOL)hasConsolidation;
- (BOOL)hasPrivacySanitization;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPConsolidation)consolidation;
- (CLPPrivacySanitization)privacySanitization;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConsolidation:(id)a3;
- (void)setPrivacySanitization:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPLocationProcessingPipelineMetadata

- (BOOL)hasPrivacySanitization
{
  return self->_privacySanitization != 0;
}

- (BOOL)hasConsolidation
{
  return self->_consolidation != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPLocationProcessingPipelineMetadata;
  v4 = [(CLPLocationProcessingPipelineMetadata *)&v8 description];
  v5 = [(CLPLocationProcessingPipelineMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  privacySanitization = self->_privacySanitization;
  if (privacySanitization)
  {
    v5 = [(CLPPrivacySanitization *)privacySanitization dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"privacySanitization"];
  }
  consolidation = self->_consolidation;
  if (consolidation)
  {
    v7 = [(CLPConsolidation *)consolidation dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"consolidation"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLocationProcessingPipelineMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_privacySanitization)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_consolidation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_privacySanitization)
  {
    objc_msgSend(v4, "setPrivacySanitization:");
    id v4 = v5;
  }
  if (self->_consolidation)
  {
    objc_msgSend(v5, "setConsolidation:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CLPPrivacySanitization *)self->_privacySanitization copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(CLPConsolidation *)self->_consolidation copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((privacySanitization = self->_privacySanitization, !((unint64_t)privacySanitization | v4[2]))
     || -[CLPPrivacySanitization isEqual:](privacySanitization, "isEqual:")))
  {
    consolidation = self->_consolidation;
    if ((unint64_t)consolidation | v4[1]) {
      char v7 = -[CLPConsolidation isEqual:](consolidation, "isEqual:");
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
  unint64_t v3 = [(CLPPrivacySanitization *)self->_privacySanitization hash];
  return [(CLPConsolidation *)self->_consolidation hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  privacySanitization = self->_privacySanitization;
  uint64_t v6 = v4[2];
  v9 = v4;
  if (privacySanitization)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[CLPPrivacySanitization mergeFrom:](privacySanitization, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[CLPLocationProcessingPipelineMetadata setPrivacySanitization:](self, "setPrivacySanitization:");
  }
  id v4 = v9;
LABEL_7:
  consolidation = self->_consolidation;
  uint64_t v8 = v4[1];
  if (consolidation)
  {
    if (v8) {
      -[CLPConsolidation mergeFrom:](consolidation, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[CLPLocationProcessingPipelineMetadata setConsolidation:](self, "setConsolidation:");
  }

  MEMORY[0x1F41817F8]();
}

- (CLPPrivacySanitization)privacySanitization
{
  return self->_privacySanitization;
}

- (void)setPrivacySanitization:(id)a3
{
}

- (CLPConsolidation)consolidation
{
  return self->_consolidation;
}

- (void)setConsolidation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacySanitization, 0);

  objc_storeStrong((id *)&self->_consolidation, 0);
}

@end