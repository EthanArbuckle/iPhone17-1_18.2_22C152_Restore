@interface _CPExperimentTriggeredFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)codepathId;
- (_CPCounterfactualInfo)counterfactual;
- (_CPExperimentTriggeredFeedback)init;
- (_CPExperimentTriggeredFeedback)initWithFacade:(id)a3;
- (unint64_t)hash;
- (unint64_t)queryID;
- (unint64_t)timestamp;
- (void)setCodepathId:(id)a3;
- (void)setCounterfactual:(id)a3;
- (void)setQueryID:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPExperimentTriggeredFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codepathId, 0);

  objc_storeStrong((id *)&self->_counterfactual, 0);
}

- (void)setCodepathId:(id)a3
{
}

- (NSString)codepathId
{
  return self->_codepathId;
}

- (void)setCounterfactual:(id)a3
{
}

- (_CPCounterfactualInfo)counterfactual
{
  return self->_counterfactual;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setQueryID:(unint64_t)a3
{
  self->_queryID = a3;
}

- (unint64_t)queryID
{
  return self->_queryID;
}

- (unint64_t)hash
{
  unint64_t v3 = (2654435761u * self->_timestamp) ^ (2654435761u * self->_queryID);
  unint64_t v4 = [(_CPCounterfactualInfo *)self->_counterfactual hash];
  return v3 ^ v4 ^ [(NSString *)self->_codepathId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  unint64_t queryID = self->_queryID;
  if (queryID != [v4 queryID]) {
    goto LABEL_14;
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_14;
  }
  v7 = [(_CPExperimentTriggeredFeedback *)self counterfactual];
  v8 = [v4 counterfactual];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_13;
  }
  uint64_t v9 = [(_CPExperimentTriggeredFeedback *)self counterfactual];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_CPExperimentTriggeredFeedback *)self counterfactual];
    v12 = [v4 counterfactual];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  v7 = [(_CPExperimentTriggeredFeedback *)self codepathId];
  v8 = [v4 codepathId];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v14 = [(_CPExperimentTriggeredFeedback *)self codepathId];
    if (!v14)
    {

LABEL_17:
      BOOL v19 = 1;
      goto LABEL_15;
    }
    v15 = (void *)v14;
    v16 = [(_CPExperimentTriggeredFeedback *)self codepathId];
    v17 = [v4 codepathId];
    char v18 = [v16 isEqual:v17];

    if (v18) {
      goto LABEL_17;
    }
  }
  else
  {
LABEL_13:
  }
LABEL_14:
  BOOL v19 = 0;
LABEL_15:

  return v19;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  if ([(_CPExperimentTriggeredFeedback *)self queryID]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPExperimentTriggeredFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPExperimentTriggeredFeedback *)self counterfactual];

  if (v4)
  {
    v5 = [(_CPExperimentTriggeredFeedback *)self counterfactual];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(_CPExperimentTriggeredFeedback *)self codepathId];

  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPExperimentTriggeredFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPExperimentTriggeredFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPExperimentTriggeredFeedback;
  v2 = [(_CPExperimentTriggeredFeedback *)&v5 init];
  if (v2)
  {
    [(_CPExperimentTriggeredFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

- (_CPExperimentTriggeredFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_CPExperimentTriggeredFeedback *)self init];
  if (v5)
  {
    -[_CPExperimentTriggeredFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    v6 = [v4 counterfactual];

    if (v6)
    {
      v7 = objc_alloc_init(_CPCounterfactualInfo);
      id v8 = [v4 counterfactual];
      -[_CPCounterfactualInfo setCfDiffered:](v7, "setCfDiffered:", [v8 cfDiffered]);

      uint64_t v9 = [v4 counterfactual];
      -[_CPCounterfactualInfo setCfUsed:](v7, "setCfUsed:", [v9 cfUsed]);

      v10 = [v4 counterfactual];
      -[_CPCounterfactualInfo setCfError:](v7, "setCfError:", [v10 cfError]);

      [(_CPExperimentTriggeredFeedback *)v5 setCounterfactual:v7];
    }
    v11 = [v4 codepathId];
    v12 = [v11 UUIDString];
    [(_CPExperimentTriggeredFeedback *)v5 setCodepathId:v12];

    int v13 = v5;
  }

  return v5;
}

@end