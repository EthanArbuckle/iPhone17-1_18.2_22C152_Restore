@interface _MSPContainerEditContentUpdate
- (MSPImmutableObject)updatedImmutableObject;
- (MSPMutableObject)updatedObject;
- (NSString)description;
- (_MSPContainerEditContentUpdate)initWithUpdatedImmutableObject:(id)a3;
- (_MSPContainerEditContentUpdate)initWithUpdatedObject:(id)a3;
- (void)useImmutableObjectsFromMap:(id)a3 intermediateMutableObjectTransferBlock:(id)a4;
@end

@implementation _MSPContainerEditContentUpdate

- (_MSPContainerEditContentUpdate)initWithUpdatedObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MSPContainerEditContentUpdate;
  v6 = [(_MSPContainerEditContentUpdate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_updatedObject, a3);
  }

  return v7;
}

- (_MSPContainerEditContentUpdate)initWithUpdatedImmutableObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MSPContainerEditContentUpdate;
  v6 = [(_MSPContainerEditContentUpdate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_updatedImmutableObject, a3);
  }

  return v7;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MSPContainerEditContentUpdate;
  v4 = [(_MSPContainerEditContentUpdate *)&v8 description];
  id v5 = [(_MSPContainerEditContentUpdate *)self updatedObject];
  v6 = [v3 stringWithFormat:@"%@ { updated contents of object = %@ }", v4, v5];

  return (NSString *)v6;
}

- (void)useImmutableObjectsFromMap:(id)a3 intermediateMutableObjectTransferBlock:(id)a4
{
  v13 = (void (**)(id, void *))a4;
  id v6 = a3;
  v7 = [(_MSPContainerEditContentUpdate *)self updatedObject];
  objc_super v8 = [v6 objectForKey:v7];

  updatedImmutableObject = self->_updatedImmutableObject;
  self->_updatedImmutableObject = v8;

  if (!self->_updatedImmutableObject)
  {
    v10 = [(_MSPContainerEditContentUpdate *)self updatedObject];
    v13[2](v13, v10);
    v11 = (MSPImmutableObject *)objc_claimAutoreleasedReturnValue();
    v12 = self->_updatedImmutableObject;
    self->_updatedImmutableObject = v11;
  }
}

- (MSPMutableObject)updatedObject
{
  return self->_updatedObject;
}

- (MSPImmutableObject)updatedImmutableObject
{
  return self->_updatedImmutableObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedImmutableObject, 0);

  objc_storeStrong((id *)&self->_updatedObject, 0);
}

@end