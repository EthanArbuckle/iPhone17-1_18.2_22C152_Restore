@interface _VNPersonsModelDataSourceBasedDataProvider
- (_VNPersonsModelDataSourceBasedDataProvider)initWithPersonsModel:(id)a3 dataSource:(id)a4;
- (id)faceModelFaceObservationAtIndex:(unint64_t)a3 forPersonAtIndex:(unint64_t)a4;
- (id)faceModelUniqueIdentifierOfPersonAtIndex:(unint64_t)a3;
- (unint64_t)faceModelIndexOfPersonWithUniqueIdentifier:(id)a3;
- (unint64_t)faceModelNumberOfFaceObservationsForPersonAtIndex:(unint64_t)a3;
- (unint64_t)faceModelPersonsCount;
@end

@implementation _VNPersonsModelDataSourceBasedDataProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_personsModel, 0);
}

- (id)faceModelFaceObservationAtIndex:(unint64_t)a3 forPersonAtIndex:(unint64_t)a4
{
  return (id)[(VNPersonsModelDataSource *)self->_dataSource personsModel:self->_personsModel faceObservationAtIndex:a3 forPersonAtIndex:a4];
}

- (unint64_t)faceModelNumberOfFaceObservationsForPersonAtIndex:(unint64_t)a3
{
  return [(VNPersonsModelDataSource *)self->_dataSource personsModel:self->_personsModel numberOfFaceObservationsForPersonAtIndex:a3];
}

- (unint64_t)faceModelIndexOfPersonWithUniqueIdentifier:(id)a3
{
  return [(VNPersonsModelDataSource *)self->_dataSource personsModel:self->_personsModel indexOfPersonWithUniqueIdentifier:a3];
}

- (id)faceModelUniqueIdentifierOfPersonAtIndex:(unint64_t)a3
{
  return (id)[(VNPersonsModelDataSource *)self->_dataSource personsModel:self->_personsModel uniqueIdentifierOfPersonAtIndex:a3];
}

- (unint64_t)faceModelPersonsCount
{
  return [(VNPersonsModelDataSource *)self->_dataSource numberOfPersonsInPersonsModel:self->_personsModel];
}

- (_VNPersonsModelDataSourceBasedDataProvider)initWithPersonsModel:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_VNPersonsModelDataSourceBasedDataProvider;
  v9 = [(_VNPersonsModelDataSourceBasedDataProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_personsModel, a3);
    objc_storeStrong((id *)&v10->_dataSource, a4);
  }

  return v10;
}

@end