@interface _CPExperimentInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)experimentId;
- (NSString)namespaceId;
- (NSString)treatmentId;
- (int)deploymentId;
- (int)version;
- (unint64_t)hash;
- (void)setDeploymentId:(int)a3;
- (void)setExperimentId:(id)a3;
- (void)setNamespaceId:(id)a3;
- (void)setTreatmentId:(id)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPExperimentInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);

  objc_storeStrong((id *)&self->_namespaceId, 0);
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (int)version
{
  return self->_version;
}

- (void)setDeploymentId:(int)a3
{
  self->_deploymentId = a3;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (void)setTreatmentId:(id)a3
{
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setExperimentId:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setNamespaceId:(id)a3
{
}

- (NSString)namespaceId
{
  return self->_namespaceId;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_namespaceId hash];
  NSUInteger v4 = [(NSString *)self->_experimentId hash] ^ v3;
  return v4 ^ [(NSString *)self->_treatmentId hash] ^ (2654435761 * self->_deploymentId) ^ (2654435761 * self->_version);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_CPExperimentInfo *)self namespaceId];
  v6 = [v4 namespaceId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_CPExperimentInfo *)self namespaceId];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_CPExperimentInfo *)self namespaceId];
    v10 = [v4 namespaceId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_CPExperimentInfo *)self experimentId];
  v6 = [v4 experimentId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_CPExperimentInfo *)self experimentId];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_CPExperimentInfo *)self experimentId];
    v15 = [v4 experimentId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_CPExperimentInfo *)self treatmentId];
  v6 = [v4 treatmentId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v17 = [(_CPExperimentInfo *)self treatmentId];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_CPExperimentInfo *)self treatmentId];
    v20 = [v4 treatmentId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  int deploymentId = self->_deploymentId;
  if (deploymentId == [v4 deploymentId])
  {
    int version = self->_version;
    BOOL v22 = version == [v4 version];
    goto LABEL_18;
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  a3;
  id v4 = [(_CPExperimentInfo *)self namespaceId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(_CPExperimentInfo *)self experimentId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(_CPExperimentInfo *)self treatmentId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPExperimentInfo *)self deploymentId]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPExperimentInfo *)self version]) {
    PBDataWriterWriteInt32Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPExperimentInfoReadFrom(self, (uint64_t)a3);
}

@end