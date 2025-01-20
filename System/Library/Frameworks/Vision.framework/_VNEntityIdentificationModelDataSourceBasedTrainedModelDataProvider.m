@interface _VNEntityIdentificationModelDataSourceBasedTrainedModelDataProvider
- (_VNEntityIdentificationModelDataSourceBasedTrainedModelDataProvider)initWithEntityIdentificationModel:(id)a3 dataSource:(id)a4;
- (id)trainedModelObservationAtIndex:(unint64_t)a3 forEntityAtIndex:(unint64_t)a4;
- (id)trainedModelUniqueIdentifierOfEntityAtIndex:(unint64_t)a3;
- (unint64_t)trainedModelEntityCount;
- (unint64_t)trainedModelIndexOfEntityWithUniqueIdentifier:(id)a3;
- (unint64_t)trainedModelNumberOfObservationsForEntityAtIndex:(unint64_t)a3;
@end

@implementation _VNEntityIdentificationModelDataSourceBasedTrainedModelDataProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_entityIdentificationModel, 0);
}

- (id)trainedModelObservationAtIndex:(unint64_t)a3 forEntityAtIndex:(unint64_t)a4
{
  return (id)[(VNEntityIdentificationModelDataSource *)self->_dataSource entityIdentificationModel:self->_entityIdentificationModel observationAtIndex:a3 forEntityAtIndex:a4];
}

- (unint64_t)trainedModelNumberOfObservationsForEntityAtIndex:(unint64_t)a3
{
  return [(VNEntityIdentificationModelDataSource *)self->_dataSource entityIdentificationModel:self->_entityIdentificationModel numberOfObservationsForEntityAtIndex:a3];
}

- (unint64_t)trainedModelIndexOfEntityWithUniqueIdentifier:(id)a3
{
  return [(VNEntityIdentificationModelDataSource *)self->_dataSource entityIdentificationModel:self->_entityIdentificationModel indexOfEntityWithUniqueIdentifier:a3];
}

- (id)trainedModelUniqueIdentifierOfEntityAtIndex:(unint64_t)a3
{
  return (id)[(VNEntityIdentificationModelDataSource *)self->_dataSource entityIdentificationModel:self->_entityIdentificationModel uniqueIdentifierOfEntityAtIndex:a3];
}

- (unint64_t)trainedModelEntityCount
{
  return [(VNEntityIdentificationModelDataSource *)self->_dataSource numberOfEntitiesInEntityIdentificationModel:self->_entityIdentificationModel];
}

- (_VNEntityIdentificationModelDataSourceBasedTrainedModelDataProvider)initWithEntityIdentificationModel:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_VNEntityIdentificationModelDataSourceBasedTrainedModelDataProvider;
  v9 = [(_VNEntityIdentificationModelDataSourceBasedTrainedModelDataProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entityIdentificationModel, a3);
    objc_storeStrong((id *)&v10->_dataSource, a4);
  }

  return v10;
}

@end